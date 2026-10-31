#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=03:00:00
#$ -pe smp 4
#$ -t 1-30
#$ -A HIVSynthMod
#$ -l mem=16G
#$ -j y
#$ -N output
#$ -wd /home/rmjlaph/Scratch
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G

# Updated 30 October 2026 after the WORK-space failure in task 22697.9.
# For the first full-population test, change the array line above to: #$ -t 1-1
# Use the existing submission method that supplies sas_infile and addinfiles.

module load sas/9.4-M6/64 || exit 1

: "${TMPDIR:?The scheduler has not supplied TMPDIR}"
: "${sas_infile:?The submission wrapper has not supplied sas_infile}"
: "${JOB_ID:?The scheduler has not supplied JOB_ID}"
: "${SGE_TASK_ID:?The scheduler has not supplied SGE_TASK_ID}"

cd "$TMPDIR" || exit 1

# Copy the colon-separated additional input files, if supplied.
IFS=':' read -r -a addin_paths <<< "${addinfiles:-}"
for addin_file in "${addin_paths[@]}"; do
    if [[ -n "$addin_file" ]]; then
        cp -- "$addin_file" . || exit 1
    fi
done

# Explicitly place SAS temporary datasets in this task's allocated storage.
sas_work_dir="$TMPDIR/sas_work"
mkdir -p "$sas_work_dir" || exit 1

diagnostics_path="$TMPDIR/storage_diagnostics.txt"
{
    printf 'JOB_ID=%s\nSGE_TASK_ID=%s\n' "$JOB_ID" "$SGE_TASK_ID"
    printf 'TMPDIR=%s\nSAS_WORK_PARENT=%s\n' "$TMPDIR" "$sas_work_dir"
    printf '\nFilesystem space before SAS:\n'
    df -h "$TMPDIR"
    printf '\nFilesystem inodes before SAS:\n'
    df -i "$TMPDIR"
} > "$diagnostics_path" 2>&1

# Preserve the existing wrapper's sas_infile argument expansion.
# ERRORABEND stops SAS on most actual errors, before a later empty export.
sas $sas_infile \
    -work "$sas_work_dir" \
    -utilloc "$sas_work_dir" \
    -errorabend
sas_status=$?

{
    printf '\nSAS_EXIT_STATUS=%s\n' "$sas_status"
    printf '\nFilesystem space after SAS:\n'
    df -h "$TMPDIR"
    printf '\nFilesystem inodes after SAS:\n'
    df -i "$TMPDIR"
    printf '\nTemporary files remaining after SAS (not peak usage):\n'
    du -sh "$sas_work_dir"
} >> "$diagnostics_path" 2>&1

# Archive logs and other task files even when SAS fails.
# Omit disposable WORK datasets, which can be large after an abnormal exit.
# The SAS program writes its selected permanent output to library A separately.
tar -czf "$HOME/Scratch/sv_${JOB_ID}_${SGE_TASK_ID}.tgz" \
    --exclude='./sas_work' \
    -C "$TMPDIR" .
archive_status=$?

# A successful archive must not conceal a failed SAS run.
if [[ "$sas_status" -ne 0 ]]; then
    exit "$sas_status"
fi
exit "$archive_status"
