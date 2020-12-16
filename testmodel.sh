#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=08:00:00
#$ -pe smp 4
#$ -A HIVSynthMod
#$ -l mem=16G
#$ -j y
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
cd $TMPDIR
module load sas/9.4/64
cp $SASINPUT/test_hiv_synthesis.sas .
sleep $[ ( $RANDOM % 10 ) + 1 ]s
sas test_hiv_synthesis.sas -sysparm "$SASOUTPUT"


