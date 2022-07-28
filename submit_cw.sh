#!/bin/bash -l
#$ -S /bin/bash
#$ -pe smp 4
#$ -l mem=16G
#$ -j y
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G

module load sas/9.4/64

sas create_wide_myriad.sas -sysparm "$SASOUTPUTDIR $SASOUTPUT"


