#!/bin/bash -l

tmpfiles="out"
combinedsas="combined_data"
finaloutdir="${HOME}/Scratch/${combinedsas}_${tmpfiles}"
SASOUTPUT=$combinedsas
SASOUTPUTDIR=$finaloutdir

qsub -N create_wide -v SASOUTPUT=$combinedsas,SASOUTPUTDIR=$finaloutdir submit_cw.sh 