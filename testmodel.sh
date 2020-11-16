#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=12:00:00
#$ -pe smp 8
#$ -t 1-100
#$ -A HIVSynthMod
#$ -l mem=36G
#$ -j y
#$ -N singlerunner
#$ -wd /home/cceapsc/Scratch/output
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
module load sas/9.4/64
sas $HOME/sas/hiv-modelling/single_runner.sas 
