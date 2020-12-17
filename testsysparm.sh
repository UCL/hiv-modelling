#!/bin/bash -l
cd $TMPDIR
module load sas/9.4/64
cp $SASINPUT/testsysparm.sas .
sas testsysparm.sas "$SASOUTPUT"
