#!/bin/bash -l

module load sas/9.4-m7/64
cd $SASOUTPUTDIR
for f in $SASTMPFILES*.sas7bdat;
    do SASTMPFILE="$(cut -d'.' -f1 <<<"$f")"; 
    echo "appending $f";
    sas $SASINPUT/appendsas.sas -sysparm "$SASTMPFILE $SASOUTPUTDIR $SASOUTPUT";
done
