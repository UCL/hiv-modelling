#!/bin/bash -l
#$ -S /bin/bash
#$ -j y
#$ -cwd
#$ -l h_rt=48:00:00
#$ -l mem=16G
#$ -l tmpfs=1000G

set -euo pipefail

module load sas/9.4-m7/64

: "${SASINPUT:?SASINPUT not set}"
: "${SASOUTPUTDIR:?SASOUTPUTDIR not set}"

cd "$TMPDIR"

export SASV9_OPTIONS="-memsize 16G -sortsize 12G -sumsize 2G -work $TMPDIR -nodms -noterminal"

sas -sysin "$SASINPUT/combine.sas" \
    -sysparm "$SASOUTPUTDIR" \
    -log "$SASOUTPUTDIR/combine_${JOB_ID}.log"

