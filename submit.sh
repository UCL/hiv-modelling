#!/bin/bash -l
qsub -N hivmodel testmodel.sh
qsub -hold_jid hivmodel -N concatenate concatenate.sh 
