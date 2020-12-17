#!/bin/bash -l

module load sas/9.4/64
cd $SASOUTPUT
for f in out_*.sas7bdat;
    do A="$(cut -d'.' -f1 <<<"$f")"; 
    echo "appending $f";
    sas $SASINPUT/appendsas.sas -sysparm "$A $SASOUTPUT $SASRESULT";
done
echo "removing individual SAS files"
rm out_*.sas7bdat
