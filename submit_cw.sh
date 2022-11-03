#!/bin/bash -l
#$ -S /bin/bash
#$ -pe smp 4
#$ -l mem=16G
#$ -j y
#$ -l tmpfs=100G

module load sas/9.4/64

sas $SASINPUT/create_wide_myriad.sas -sysparm "$SASOUTPUTDIR $SASOUTPUT"


