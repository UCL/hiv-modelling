#!/bin/bash -l
#$ -S /bin/bash
#$ -pe smp 4
#$ -l mem=16G
#$ -j y
#$ -l tmpfs=100G

set -eo pipefail
: "${TMPDIR:?The scheduler must provide TMPDIR}"
: "${SASINPUT:?SASINPUT is required}"
: "${SASOUTPUTDIR:?SASOUTPUTDIR is required}"
: "${SASMODEL:?SASMODEL is required}"
: "${SASTMPFILES:?SASTMPFILES is required}"

export SAS_SEED="${SAS_SEED:-}"
export SAS_POPULATION="${SAS_POPULATION:-}"
export SAS_END_YEAR="${SAS_END_YEAR:-}"
if [[ "$SASOUTPUTDIR" =~ [[:space:]] || "$SASTMPFILES" =~ [[:space:]] ]]; then
printf 'The existing SAS SYSPARM parser requires an output directory and prefix without whitespace.
' >&2
exit 2
fi
task_id="${SGE_TASK_ID:-0}"
if [[ "$task_id" == "undefined" ]]; then task_id=0; fi

seed_base="$SAS_SEED"
if [[ -n "$seed_base" ]]; then
if [[ ! "$seed_base" =~ ^[1-9][0-9]{0,9}$ ]] || (( seed_base > 2147483646 )); then
printf 'SAS_SEED must be between 1 and 2147483646.
' >&2
exit 2
fi
seed_offset=0
if [[ "$task_id" =~ ^[1-9][0-9]$ ]]; then seed_offset=$((task_id - 1)); fi
export SAS_SEED="$(((seed_base - 1 + seed_offset) % 2147483646 + 1))"
fi
task_tag="${JOB_ID:-manual}_${task_id}"
jobdir="$(mktemp -d "$TMPDIR/sas_${task_tag}.XXXXXX")"
logdir="$SASOUTPUTDIR/logs"
saslog="$jobdir/sas_${task_tag}.log"
saslist="$jobdir/sas_${task_tag}.lst"
runnerlog="$jobdir/runner_${task_tag}.txt"

save_logs() {
task_status=$?
trap - EXIT
printf 'Exit status: %s
Finished: %s
' "$task_status" "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$runnerlog"
log_status=0
if mkdir -p -- "$logdir"; then
for logfile in "$runnerlog" "$saslog" "$saslist"; do
if [[ -f "$logfile" ]]; then
if ! cp -- "$logfile" "$logdir/"; then log_status=1; fi
fi
done
else
log_status=1
fi
if (( task_status == 0 && log_status != 0 )); then task_status=1; fi
exit "$task_status"
}
trap save_logs EXIT
trap 'exit 143' TERM
trap 'exit 130' INT
printf 'Job/task: %s
Host: %s
Started: %s
Allocated slots: %s
Local directory: %s
Model: %s
Output prefix: %s
Batch seed: %s
Task seed: %s
Population override: %s
End-year override: %s
' \
"$task_tag" "$(hostname)" "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" \
"${NSLOTS:-unknown}" "$jobdir" "$SASMODEL" "$SASTMPFILES" \
"${seed_base:-clock}" "${SAS_SEED:-clock}" "${SAS_POPULATION:-default}" "${SAS_END_YEAR:-default}" > "$runnerlog"
cd -- "$jobdir"
mkdir -p -- "$jobdir/work"
module load sas/9.4-m7/64 >> "$runnerlog" 2>&1
cp -- "$SASINPUT/$SASMODEL" "$jobdir/" >> "$runnerlog" 2>&1
model_basename="${SASMODEL##/}"

sleep "$((RANDOM % 10 + 1))s"

sas -sysin "$model_basename" -work "$jobdir/work" \
-log "$saslog" -print "$saslist" \
-sysparm "$SASOUTPUTDIR $SASTMPFILES" >> "$runnerlog" 2>&1


