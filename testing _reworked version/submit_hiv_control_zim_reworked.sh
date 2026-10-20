#!/bin/bash -l
set -euo pipefail

inputdir="${HOME}"
tmpfiles="out"
combinedsas="hiv_control_zim_reworked"
runs="1"
jobname="hiv_control_zim_reworked"
model="hiv_synthesis_control_zimbabwe_20260124_reworked.sas"
clock="h_rt=01:00:00"

model_seed="${SAS_SEED:-}"
model_population="${SAS_POPULATION:-}"
model_end_year="${SAS_END_YEAR:-}"

usage() {
    cat <<'USAGE'
Usage: bash run_script.sh [-i input_directory] [-o output_group] [-r runs]
                          [-j job_name] [-m model.sas] [-c h_rt=HH:MM:SS]
                          [-t output_prefix] [-s seed] [-n population] [-y end_year]

The model and test_model.sh must be in input_directory (default: $HOME).
Results go to $HOME/Scratch/<output_group>_<output_prefix>.
The original four-core, 16G-per-core and 100G-local-disk requests are retained.
To profile a small batch, use -r 1 or -r 5 before submitting all 1000 runs.
Optional -s/-n/-y controls are understood by the generated baseline and
optimised models. Omit them for the original population and full horizon.
The -s value is a batch seed: task 1 uses it, task 2 uses the next seed, etc.
USAGE
}

while getopts ":i:o:r:j:m:c:t:s:n:y:h" flag; do
    case "$flag" in
        i) inputdir="$OPTARG" ;;
        o) combinedsas="$OPTARG" ;;
        r) runs="$OPTARG" ;;
        j) jobname="$OPTARG" ;;
        m) model="$OPTARG" ;;
        c) clock="$OPTARG" ;;
        t) tmpfiles="$OPTARG" ;;
        s) model_seed="$OPTARG" ;;
        n) model_population="$OPTARG" ;;
        y) model_end_year="$OPTARG" ;;
        h) usage; exit 0 ;;
        :) printf 'Missing value for -%s\n' "$OPTARG" >&2; exit 2 ;;
        \?) printf 'Unknown option: -%s\n' "$OPTARG" >&2; usage >&2; exit 2 ;;
    esac
done
shift "$((OPTIND - 1))"

if (( $# != 0 )); then
    usage >&2
    exit 2
fi

if [[ ! "$runs" =~ ^[1-9][0-9]*$ ]]; then
    printf 'The run count must be a positive integer. Received: %q\n' "$runs" >&2
    exit 2
fi

if [[ ! "$combinedsas" =~ ^[A-Za-z0-9_][A-Za-z0-9_.-]*$ ]]; then
    printf 'The output group must be a name containing letters, numbers, _, . or -.\n' >&2
    exit 2
fi

if [[ ! "$tmpfiles" =~ ^[A-Za-z_][A-Za-z0-9_]*$ ]]; then
    printf 'The output prefix must be a valid SAS dataset-name prefix.\n' >&2
    exit 2
fi

if [[ -n "$model_seed" ]]; then
    if [[ ! "$model_seed" =~ ^[1-9][0-9]{0,9}$ ]] || (( model_seed > 2147483646 )); then
        printf 'The optional batch seed must be between 1 and 2147483646.\n' >&2
        exit 2
    fi
fi

if [[ -n "$model_population" && ! "$model_population" =~ ^[1-9][0-9]*$ ]]; then
    printf 'The optional population must be a positive integer.\n' >&2
    exit 2
fi

if [[ -n "$model_end_year" && ! "$model_end_year" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    printf 'The optional end year must be numeric.\n' >&2
    exit 2
fi

inputdir="$(cd -- "$inputdir" && pwd -P)"
worker="$inputdir/test_model.sh"
finaloutdir="${HOME}/Scratch/${combinedsas}_${tmpfiles}"

if [[ "$finaloutdir" =~ [[:space:]] ]]; then
    printf 'The output directory cannot contain whitespace with the current SAS SYSPARM parser.\n' >&2
    exit 2
fi

if [[ ! -f "$inputdir/$model" || ! -f "$worker" ]]; then
    printf 'Both %s and test_model.sh must exist in %s.\n' "$model" "$inputdir" >&2
    exit 2
fi

command -v qsub >/dev/null
mkdir -p -- "$finaloutdir/logs" "$finaloutdir/scheduler"

printf 'Input directory: %s\nModel: %s\nRuns: %s\nJob name: %s\nWalltime request: %s\nOutput directory: %s\nOutput prefix: %s\n' \
    "$inputdir" "$model" "$runs" "$jobname" "$clock" "$finaloutdir" "$tmpfiles"

export SASINPUT="$inputdir"
export SASOUTPUTDIR="$finaloutdir"
export SASMODEL="$model"
export SASTMPFILES="$tmpfiles"

job_exports="SASINPUT,SASOUTPUTDIR,SASMODEL,SASTMPFILES"

if [[ -n "$model_seed" ]]; then
    export SAS_SEED="$model_seed"
    job_exports="$job_exports,SAS_SEED"
fi

if [[ -n "$model_population" ]]; then
    export SAS_POPULATION="$model_population"
    job_exports="$job_exports,SAS_POPULATION"
fi

if [[ -n "$model_end_year" ]]; then
    export SAS_END_YEAR="$model_end_year"
    job_exports="$job_exports,SAS_END_YEAR"
fi

qsub -N "$jobname" -t "1-$runs" -wd "$finaloutdir" -P AllUsers \
    -l "$clock" -j y -o "$finaloutdir/scheduler" \
    -v "$job_exports" "$worker"
