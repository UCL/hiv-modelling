#!/bin/bash -l
#$ -S /bin/bash
#$ -A HIVSynthMod
#$ -pe smp 4
#$ -l mem=16G
#$ -j y
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G

cd "$TMPDIR"
module load sas/9.4-m7/64
cp "$SASINPUT/$SASMODEL" .

sleep $(( RANDOM % 10 + 1 ))

sas "$SASMODEL" \
    -sysparm "$SASOUTPUTDIR $SASTMPFILES" \
    -log "$SASOUTPUTDIR/hiv_synthesis_${JOB_ID}_${SGE_TASK_ID}.log"