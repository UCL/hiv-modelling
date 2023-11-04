
libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\trial_simulation\";

data e; set a._outputs:;

option_binary=1;
if option = 0 then option_binary=0;

proc sort; by run; 
proc freq; tables option_binary * infected_past_6m; by run; run;

proc logistic; model infected_past_6m = option_binary; by run; run; 

proc print; 
run; 

proc export data = e  
outfile = 'C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\trial_simulation\dataset_in_2026.csv' DBMS = csv replace;
run;


