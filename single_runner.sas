/** 
* libname a clear;
*/
* proc printto log="/folders/myfolders/hiv-modelling/output/run_1000_3.log";
* options user="/folders/myfolders/" ps=1000 ls=220 cpucount=4 spool stimer ;

* dm 'log;clear;output;clear;';
* libname model clear;
options ps=1000 ls=220 cpucount=8 spool stimer ;

proc printto log="/home/cceapsc/Scratch/output/singlerun.log";
* proc printto;

%let population = 1000000;
%let startyear = 1989;
%let endyear = 2020;
%let increment = 0.25;


%macro singlerun();
    %let run_id = %sysfunc(ranuni(1));
	%let random = %sysevalf(&run_id * 1000000000);
	%let run = %sysfunc(round(&random,1));
	%include "/home/cceapsc/sas/hiv-modelling/hiv_synthesis_onefile.sas";
	* %include "N:\SAS\hiv-modelling\hiv_synthesis_files.sas";
	* %include "N:\SAS\hiv-modelling\model_consumer.sas";
	* %include "/home/cceapsc/sas/hiv-modelling/model_consumer.sas";
	* %include "/folders/myfolders/hiv-modelling/hiv_synthesis_onefile.sas";
%mend singlerun;

%singlerun();
