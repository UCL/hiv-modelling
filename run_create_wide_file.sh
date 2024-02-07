#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=48:00:00
#$ -pe smp 4
#$ -t 1
#$ -A HIVSynthMod
#$ -l mem=16G
#$ -j y
#$ -N output
#$ -wd /home/sejj463/Scratch/combined_data_out
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=1000G
module load sas/9.4/64
cd $TMPDIR
for file in `echo $addinfiles | tr ':' ' '` 
do 
 cp $file . 
done
sas $sas_infile -sysparm "$SASOUTPUTDIR"
tar cvzf $HOME/Scratch/combined_data_out/sv_$JOB_ID.tgz $TMPDIR