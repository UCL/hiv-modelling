
*

There are two SAS 9.4 files provided:

hiv_synthesis_laa_ad_no_co.sas

create_wide_file_laa_revision_no_co.sas

hiv_synthesis_laa_ad_no_co.sas is the main model program - each time it is run it produces an output file - there are no input data - each run takes in the 
region of 24 hours

create_wide_file_laa_revision_no_co.sas is a program that reads in these output files to produce the summary results in the form of a file with one row
per model run

SAS is a standard software - installation time is a few hours dependent on exactly what components are included

Reproduction of results:  
WIthin the bounds of stochastic variation (which will be small) the results can be reproduced by running hiv_synthesis_laa_ad_no_co.sas approximately 1200 times
and then compiling the results in create_wide_file_laa_revision_no_co.sas.  Some run outputs are excluded if the characteristics of the generated epidemic are
not likely to be consistent with an HIV epidemic in any setting in east, central, southern or west africa. The randomly generated "run" variable is used to select 
exactly 1000 runs (which are then called setting-scenarios)

;
