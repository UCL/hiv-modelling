libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\
output files\FSW\fsw_24_02_22_ch3";


data b;
set a.out:;
run;

data a.fsw_24_02_22_ch3_new;
set b;
run;
