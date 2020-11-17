#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=12:00:00
#$ -pe smp 16
#$ -t 1-3
#$ -A HIVSynthMod
#$ -l mem=36G
#$ -j y
#$ -N singlerunner
#$ -wd /home/cceapsc/Scratch/output
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
module load sas/9.4/64
sas $HOME/sas/hiv-modelling/hiv_saveas_sas.sas 
