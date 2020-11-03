proc printto log="/home/cceapsc/Scratch/run_1000_100.log";
/* 
*/
* proc printto log="/folders/myfolders/hiv-modelling/output/run_1000_5.log";
* proc printto;
options ps=1000 ls=220 cpucount=4 spool stimer ;

%let population = 1000;
%let total_runs = 100;
%let startyear = 1989;
%let endyear = 2020;
%let increment = 0.25;


%macro modelrun(howmany);
	%do index = 1 %to &howmany;	
		%let run_id = %sysfunc(ranuni(&index));
		%let random = %sysevalf(&run_id * 1000000000);
		%let run = %sysfunc(round(&random,1));
		%let dataset_id = %sysfunc(trim(%sysfunc(left(&run))));
		%include "hiv_synthesis_onefile.sas";
	%end;
%mend modelrun;

%modelrun(&total_runs);
