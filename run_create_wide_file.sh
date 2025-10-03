#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=48:00:00
#$ -pe smp 4
#$ -t 1
#$ -A HIVSynthMod
#$ -j y
#$ -N output
#$ -wd /myriadfs/home/sejj463/Scratch/combined_data_out
#$ -o /dev/null
#$ -e /dev/null
#$ -l h_vmem=32G
#$ -l tmpfs=1000G

module load sas/9.4-m7/64
cd "$TMPDIR"

# bring inputs local to fast scratch
for file in $(echo "$addinfiles" | tr ':' ' ') ; do
  cp "$file" .
done

export OMP_NUM_THREADS=4

export SASV9_OPTIONS="-memsize 64G -sortsize 48G -sumsize 4G -work $TMPDIR -nodms -noterminal"
sas -sysin "$sas_infile" -sysparm "$SASOUTPUTDIR" \
    -log "$HOME/Scratch/combined_data_out/output_${JOB_ID}.log" \
    -print "$HOME/Scratch/combined_data_out/output_${JOB_ID}.lst"

tar cvzf $HOME/Scratch/combined_data_out/sv_$JOB_ID.tgz $TMPDIR