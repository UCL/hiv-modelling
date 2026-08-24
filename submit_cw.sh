#!/bin/bash -l

# Default resources (you can override with flags)
inputdir="${HOME}/hiv-modelling"
tmpfiles="out"
combinedsas="combined_data"
runs="$1"
jobname="hivmodel"
model="hiv_synthesis.sas"
clock="h_rt=24:00:00"
account="HIVSynthMod"

while getopts a:i:o:r:j:m:c:t: flag; do
  case "${flag}" in
    a) account=${OPTARG};;    # project/account
    i) inputdir=${OPTARG};;   # folder that has .sas + run script
    o) combinedsas=${OPTARG};;# not used here, kept for parity
    r) runs=${OPTARG};;       # not used here, kept for parity
    j) jobname=${OPTARG};;    # SGE job name
    m) model=${OPTARG};;      # not used here, kept for parity
    c) clock=${OPTARG};;      # wallclock, e.g. h_rt=24:00:00
    t) tmpfiles=${OPTARG};;   # not used here, kept for parity
  esac
done

finaloutdir="/myriadfs/home/sejj463/Scratch/combined_data_out"

echo "===== JOB SUMMARY ======="
echo "directory of input files: $inputdir"
if [ -d "$finaloutdir" ]; then
  echo "Directory $finaloutdir exists"
else
  mkdir -p "$finaloutdir"
  echo "output directory created: $finaloutdir"
fi
echo "final output SAS filename (label): $combinedsas"
echo "tmp output file names start with: $tmpfiles"
echo "jobname for model runs: $jobname"
echo "clock is set to: $clock"
echo "using SAS HIV model file: create_wide_file.sas"
echo "job is run on account: $account"

# --- Submit the job ---
# Notes:
#  - Adjust -pe and -l h_vmem per cluster policy.
#  - h_vmem is per-core on many SGE clusters; with -pe smp 4 and 32G, that’s ~128G total cap.
qsub \
  -N "$jobname" \
  -A "$account" \
  -l "$clock" \
  -pe smp 4 \
  -l h_vmem=32G \
  -l tmpfs=1000G \
  -v sas_infile="$inputdir/create_wide_file.sas",SASOUTPUTDIR="$finaloutdir" \
  "$inputdir/run_create_wide_file.sh"
