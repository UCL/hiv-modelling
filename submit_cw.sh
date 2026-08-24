#!/bin/bash -l

inputdir="/myriadfs/home/sejj463/hiv-modelling"
finaloutdir="/myriadfs/home/sejj463/Scratch/combined_data_out"
account="HIVSynthMod"

echo "===== COMBINE + CREATE WIDE ====="
echo "SAS program directory: $inputdir"
echo "Input/output directory: $finaloutdir"

# Check that the expected input datasets exist
n_out=$(find "$finaloutdir" -maxdepth 1 -type f -name 'out*.sas7bdat' | wc -l)

if [ "$n_out" -eq 0 ]; then
    echo "ERROR: No out*.sas7bdat files found in $finaloutdir"
    exit 1
fi

echo "Found $n_out out*.sas7bdat files"

# -------------------------------------------------------------------------
# Step 1: Combine the OUT* datasets
# -------------------------------------------------------------------------
combine_job=$(qsub \
    -N concatenate \
    -A "$account" \
    -wd "$finaloutdir" \
    -l h_rt=48:00:00 \
    -l mem=16G \
    -l tmpfs=1000G \
    -v SASINPUT="$inputdir",SASOUTPUTDIR="$finaloutdir" \
    "$inputdir/combine.sh")

echo "$combine_job"

# Extract the job ID from qsub output
combine_job_id=$(echo "$combine_job" | awk '{print $3}')

echo "Combine job ID: $combine_job_id"

# -------------------------------------------------------------------------
# Step 2: Create the wide file after combine finishes
# -------------------------------------------------------------------------
qsub \
    -hold_jid "$combine_job_id" \
    -N create_wide \
    -A "$account" \
    -wd "$finaloutdir" \
    -l h_rt=48:00:00 \
    -l mem=16G \
    -l tmpfs=1000G \
    -v sas_infile="$inputdir/create_wide_file.sas",SASOUTPUTDIR="$finaloutdir" \
    "$inputdir/run_create_wide_file.sh"