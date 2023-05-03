#!/bin/bash -l
inputdir="${HOME}"
tmpfiles="out_"
combinedsas="fsw_02_05_23"
runs="1100"
jobname="hivmodel"
model="hiv_synthesis_fsw_02_05_2023_7pm.sas"
clock="h_rt=40:00:00"
account="HIVSynthMod"

while getopts a:i:o:r:j:m:c:t: flag
do
    case "${flag}" in
        a) account=${OPTARG};;
        i) inputdir=${OPTARG};;
        o) combinedsas=${OPTARG};;
        r) runs=${OPTARG};;
        j) jobname=${OPTARG};;
        m) model=${OPTARG};;
        c) clock=${OPTARG};;
        t) tmpfiles=${OPTARG};;
    esac
done
finaloutdir="${HOME}/Scratch/${combinedsas}_${tmpfiles}"


echo "===== JOB SUMMARY ======="
echo "directory of input files: $inputdir";
if [ -d $finaloutdir ]
then
    echo "Directory $finaloutdir exists"
else
    mkdir $finaloutdir
    echo "output directory created: $finaloutdir"
fi
echo "final output SAS filename: $combinedsas";
echo "tmp output file names start with: $tmpfiles"
echo "runs: $runs";
echo "jobname for model runs: $jobname";
echo "clock is set to: $clock";
echo "using SAS HIV model file: $model";
echo "job is run on account: $account";
qsub -N $jobname -t 1-$runs -wd $finaloutdir -P AllUsers -l $clock -v SASINPUT=$inputdir,SASOUTPUTDIR=$finaloutdir,SASMODEL=$model,SASTMPFILES=$tmpfiles $inputdir/testmodel.sh
qsub -hold_jid $jobname -N concatenate -v SASINPUT=$inputdir,SASOUTPUT=$combinedsas,SASOUTPUTDIR=$finaloutdir,SASTMPFILES=$tmpfiles $inputdir/concatenate.sh 


