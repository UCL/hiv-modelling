proc printto log="/home/cceapsc/Scratch/run_1000_100.log";
options ps=1000 ls=220 cpucount=16 spool stimer ;

%let population = 1000;
%let total_runs = 100;
%let startyear = 1989;
%let endyear = 2020;
%let increment = 0.25;

%macro modelrun(howmany);
	%do index = 1 %to &howmany;
		data _null_;
			run = rand('uniform')*1000000000;
			run = round(run,1);
			call symput("run", run);
			dataset_id = trim(left(run));
			call symput("dataset_id", dataset_id);			
		run;
		%include "/home/cceapsc/sas/hiv-modelling/hiv_synthesis_onefile.sas";
	%end;
%mend modelrun;
%modelrun(&total_runs);
