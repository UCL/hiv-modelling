#!/bin/bash -l
#$ -l h_rt=08:00:00
#$ -l mem=32G
#$ -l tmpfs=36G
#$ -N test_model_runner
#$ -pe smp 4
#$ -wd /home/cceapsc/Scratch/output
module load sas/9.4/64
sas $HOME/sas/hiv-modelling/model_runner.sas 
