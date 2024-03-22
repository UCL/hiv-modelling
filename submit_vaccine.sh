#!/bin/bash -l
inputdir="${HOME}"
tmpfiles="out"
combinedsas="vaccine_m_fpc_a"
runs="150"
jobname="vaccine_m_fpc_a"
model="hiv_synthesis_vaccine_m_fpc_a.sas"
clock="h_rt=48:00:00"


while getopts a:i:o:r:j:m:c:t: flag
do
    case "${flag}" in
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
qsub -N $jobname -t 1-$runs -wd $finaloutdir -P Gold -A HIVSynthMod -l $clock -v SASINPUT=$inputdir,SASOUTPUTDIR=$finaloutdir,SASMODEL=$model,SASTMPFILES=$tmpfiles $inputdir/testmodel.sh

