libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\
output files\FSW\fsw_01_03_22";


data b;
set a.out:;
run;

data a.fsw_01_03_22;
set b;
run;
