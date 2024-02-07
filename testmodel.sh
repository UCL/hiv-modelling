#!/bin/bash -l
#$ -S /bin/bash
#$ -pe smp 4
#$ -l mem=16G
#$ -j y
#$ -o /dev/null
#$ -e /dev/null
#$ -l tmpfs=100G
cd $TMPDIR
module load sas/9.4/64
cp $SASINPUT/$SASMODEL .
sleep $[ ( $RANDOM % 10 ) + 1 ]s
sas $SASMODEL -sysparm "$SASOUTPUTDIR $SASTMPFILES"