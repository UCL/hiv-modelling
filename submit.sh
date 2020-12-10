#!/bin/bash -l
qsub -N hivmodel $HOME/testmodel.sh
qsub -hold_jid hivmodel -N concatenate $HOME/concatenate.sh 
