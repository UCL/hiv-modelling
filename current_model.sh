#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=08:00:00
#$ -pe smp 16
#$ -t 1-100
#$ -A HIVSynthMod
#$ -l mem=13G
#$ -j y
#$ -N prep
#$ -wd /home/cceapsc/Scratch
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
cd $TMPDIR
module load sas/9.4/64
cp /home/cceapsc/sas/hiv-modelling/hiv_synthesis.sas .
sleep $[ ( $RANDOM % 10 ) + 1 ]s
sas `pwd`/hiv-modelling/hiv_synthesis.sas