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
qsub -N testsysparm -wd $scratch -v SASINPUT=$input,SASOUTPUT=$scratch,SASRESULT=$combined $input/testsysparm.sh
