#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=08:00:00
#$ -pe smp 4
#$ -t 1-10
#$ -A HIVSynthMod
#$ -l mem=16G
#$ -j y
#$ -wd /home/cceapsc/Scratch/output
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
cd $TMPDIR
module load sas/9.4/64
cp /home/cceapsc/sas/hiv-modelling/hiv_saveas_sas.sas .
sleep $[ ( $RANDOM % 10 ) + 1 ]s
sas hiv_saveas_sas.sas


