#!/bin/bash -l

module load sas/9.4/64
cd $SASOUTPUT
for f in out_*.sas7bdat;
    do SASOUTFILE="$(cut -d'.' -f1 <<<"$f")"; 
    echo "appending $f";
    sas $SASINPUT/appendsas.sas -sysparm "$SASOUTFILE $SASOUTPUT $SASRESULT";
done
echo "removing individual SAS files"
rm out_*.sas7bdat
