#!/bin/bash -l
#$ -l h_rt=08:00:00
#$ -l mem=6G
#$ -l tmpfs=15G
#S -N hivtestrun
#$ -wd /home/cceapsc/Scratch
cd $TMPDIR
module load sas/9.4/64
cp $HOME/sas/hiv-modelling/model_runner.sas .
cp $HOME/sas/hiv-modelling/test_hiv_model.sas .
cp $HOME/sas/hiv-modelling/config.sas .

sas model_runner.sas


