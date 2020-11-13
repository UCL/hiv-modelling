#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=08:00:00
#$ -pe smp 16
#$ -t 1-3
#$ -A HIVSynthMod
#$ -l mem=13G
#$ -j y
#$ -N testwithfiles
#$ -wd /home/cceapsc/Scratch/output
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
cd $TMPDIR
module load sas/9.4/64
cp /home/cceapsc/sas/hiv-modelling/hiv_synthesis_files.sas .
sleep $[ ( $RANDOM % 10 ) + 1 ]s
sas `pwd`/hiv_synthesis_files.sas