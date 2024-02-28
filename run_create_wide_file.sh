#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=48:00:00
#$ -pe smp 4
#$ -t 1
#$ -A HIVSynthMod
#$ -P Gold
#$ -l mem=2G
#$ -j y
#$ -N output
#$ -wd /lustre/scratch/scratch/sejj463/combined_data_out
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
module load sas/9.4-m7/64
cd $TMPDIR
for file in `echo $addinfiles | tr ':' ' '` 
do 
 cp $file . 
done
sas $sas_infile -sysparm "$SASOUTPUTDIR"
tar cvzf $HOME/Scratch/combined_data_out/sv_$JOB_ID.tgz $TMPDIR