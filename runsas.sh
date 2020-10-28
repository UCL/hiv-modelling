#!/bin/bash -l
#$ -l h_rt=08:00:00
#$ -l mem=6G
#$ -l tmpfs=15G
#$ -pe smp 16
#S -N hivtestrun
#$ -wd /home/cceapsc/Scratch
cd $TMPDIR
module load sas/9.4/64
cp $HOME/sas/hiv-modelling/model_runner.sas .
cp $HOME/sas/hiv-modelling/hiv_synthesis_onefile.sas .
#cp $HOME/sas/hiv-modelling/config.sas .

sas `pwd`/model_runner.sas


