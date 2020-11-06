#!/bin/bash -l
#$ -l h_rt=0:10:0
#$ -l mem=1G
#$ -l tmpfs=15G
#$ -N test_model_runner
#$ -pe smp 4
#$ -wd /home/cceapsc/Scratch/output
module load sas/9.4/64
sas $HOME/sas/hiv-modelling/model_runner.sas 
