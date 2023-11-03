
libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\trial_simulation\";

data e; set a.out:;

if onart=1 then do;
vls=0;
if . < vl < 2.7 then vls=1;
end;

recent_infection=0;
if hiv=1 and 0 <= 2025.75 - infection <= 0.25 then recent_infection=1;


proc sort; by option;

proc means; var prep_any ;
by option;
where registd ne 1;
run;

proc means; var registd ;
by option;
where hiv=1;
run;

proc means; var onart ;
by option;
where registd=1;
run;

proc means; var vls ;
by option;
where onart=1;
run;

proc glm; model prep_any = option;
where registd ne 1;
run; 

proc logistic; model recent_infection = option; run; 





