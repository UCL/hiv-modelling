proc printto log="/home/cceapsc/Scratch/run_1000_3.log";
/* 
*/
* proc printto log="/folders/myfolders/hiv-modelling/output/run_1000_3.log";
* proc printto;
* options user="/folders/myfolders/" ps=1000 ls=220 cpucount=4 spool stimer ;
options ps=1000 ls=220 cpucount=4 spool stimer ;

%let population = 1000;
%let total_runs = 3;
%let startyear = 1989;
%let endyear = 2020;
%let increment = 0.25;


%macro modelrun(howmany);
	%do index = 1 %to &howmany;	
		%let run_id = %sysfunc(ranuni(&index));
		%let random = %sysevalf(&run_id * 1000000000);
		%let run = %sysfunc(round(&random,1));
	    %include "/home/cceapsc/sas/hiv-modelling/hiv_synthesis_onefile.sas";
		* %include "/folders/myfolders/hiv-modelling/hiv_synthesis_onefile.sas";
	%end;
%mend modelrun;

%modelrun(&total_runs);
