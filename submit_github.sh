#!/bin/bash -l
inputdir="${HOME}/hiv-modelling"
tmpfiles="out"
combinedsas="combined_data"
runs="400"
jobname="hivmodel"
model="hiv_synthesis.sas"
clock="h_rt=48:00:00"
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
qsub -N $jobname -A $account -t 1-$runs -wd $finaloutdir -l $clock -v SASINPUT=$inputdir,SASOUTPUTDIR=$finaloutdir,SASMODEL=$model,SASTMPFILES=$tmpfiles $inputdir/testmodel.sh
qsub -hold_jid $jobname -N concatenate -v SASINPUT=$inputdir,SASOUTPUT=$combinedsas,SASOUTPUTDIR=$finaloutdir,SASTMPFILES=$tmpfiles $inputdir/concatenate.sh 


