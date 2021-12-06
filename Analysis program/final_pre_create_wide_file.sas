libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\
output files\VMMC\vmmc20reps_out_vmmc20reps";

data a;  

set a.vmmC20reps;run;

proc freq;table run;run;

data b;
set a.out:;
run;

data a.vmmc_final;
set a b;
if run = 784638634 then delete;
run;

proc freq;table run;run;

*One duplicate run number - both runs deleted;
