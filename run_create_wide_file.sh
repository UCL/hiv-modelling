#!/bin/bash -l
#$ -S /bin/bash
#$ -j y
#$ -cwd
#$ -o /myriadfs/home/sejj463/Scratch/combined_data_out/$JOB_NAME.$JOB_ID.o
#$ -e /myriadfs/home/sejj463/Scratch/combined_data_out/$JOB_NAME.$JOB_ID.e

# Fail fast
set -euo pipefail

# Load SAS
module load sas/9.4-m7/64

# Make sure required vars are present
: "${sas_infile:?sas_infile not set}"      # path to .sas program
: "${SASOUTPUTDIR:?SASOUTPUTDIR not set}"  # where to write logs/artifacts

# Use the scheduler’s slot count for threading hints
export OMP_NUM_THREADS="${NSLOTS:-1}"
export MKL_NUM_THREADS="${NSLOTS:-1}"
export NUMEXPR_NUM_THREADS="${NSLOTS:-1}"

# Work in node-local tmpfs (fast) and let SAS use it for WORK
cd "$TMPDIR"

# Optional: if you need to stage any inputs locally, do it here.
# Example (uncomment and define $ADDINFILES via qsub -v if you want):
# for f in $(echo "${ADDINFILES:-}" | tr ':' ' '); do
#   cp "$f" .
# done

# Give SAS larger startup limits and point WORK at tmpfs.
# If your site caps these in sasv9.cfg, the SAS log will reveal the effective values.
export SASV9_OPTIONS="-memsize 64G -sortsize 48G -sumsize 4G -work $TMPDIR -nodms -noterminal"

# Run SAS; write logs/results to your final output directory
sas -sysin  "$sas_infile" \
    -sysparm "$SASOUTPUTDIR" \
    -log     "$SASOUTPUTDIR/output_${JOB_ID}.log" \
    -print   "$SASOUTPUTDIR/output_${JOB_ID}.lst"

# Archive everything the job wrote to $TMPDIR (optional but handy for debugging)
tar -czf "$SASOUTPUTDIR/sv_${JOB_ID}.tgz" "$TMPDIR"