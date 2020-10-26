#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=08:00:00
#$ -pe smp 4
#$ -t 1-100
#$ -A HIVSynthMod
#$ -l mem=13G
#$ -j y
#$ -N prep
#$ -wd /home/cceapsc/Scratch
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
module load sas/9.4/64
cd $TMPDIR
cp $HOME/sas/hiv-modelling/hiv_synthesis.sas .
sleep $[ ( $RANDOM % 10 ) + 1 ]s
sas hiv_synthesis.sas