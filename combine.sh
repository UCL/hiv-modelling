#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=48:00:00
#$ -pe smp 4
#$ -t 1
#$ -A HIVSynthMod
#$ -l mem=16G
#$ -j y
#$ -N output
#$ -wd /lustre/scratch/scratch/sejj463/combined_data_out
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=1000G
module load sas/9.4-m7/64
cd $TMPDIR
for file in `echo $addinfiles | tr ':' ' '` 
do 
 cp $file . 
done

export SASV9_OPTIONS="-memsize 16G -sortsize 12G -sumsize 2G -work $TMPDIR -nodms -noterminal"

sas -sysin "$SASINPUT/combine.sas" \
    -sysparm "$SASOUTPUTDIR" \
    -log "$SASOUTPUTDIR/combine_${JOB_ID}.log"