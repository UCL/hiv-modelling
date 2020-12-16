#!/bin/bash -l
input="${HOME}"
scratch="${HOME}/Scratch"
combined="combined_data"
runs="100"

while getopts i:s:c:r: flag
do
    case "${flag}" in
        i) input=${OPTARG};;
        s) scratch=${OPTARG};;
        c) combined=${OPTARG};;
        r) runs=${OPTARG};;
    esac
done
echo "home directory: $input";
echo "output directory: $scratch";
echo "combined SAS filename: $combined";
echo "runs: $runs";
qsub -N hivmodel -t 1-$runs -wd $scratch -v SASINPUT=$input,SASOUTPUT=$scratch,SASRESULT=$combined $input/testmodel.sh
qsub -hold_jid hivmodel -N concatenate -v SASOUTPUT=$scratch,SASRESULT=$combined $input/concatenate.sh 
