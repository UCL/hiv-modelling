/* proc printto log="/home/cceapsc/Scratch/run_1000_100.log";*/
* proc printto log="/folders/myfolders/hiv-modelling/output/run_1000_5.log";
* proc printto;
options ps=1000 ls=220 cpucount=4 spool stimer ;

%let population = 1000;
%let total_runs = 1;
%let startyear = 1989;
%let endyear = 2020;
%let increment = 0.25;


%macro modelrun(howmany);
	%do index = 1 %to &howmany;	
		%let run_id = %sysfunc(ranuni(&index));
		%let random = %sysevalf(&run_id * 1000000000);
		%let run = %sysfunc(round(&random,1));
		%let dataset_id = %sysfunc(trim(%sysfunc(left(&run))));
		%include "/folders/myfolders/hiv-modelling/hiv_synthesis_onefile.sas";
		/*
		%put "Index = " &index;
		%include "/folders/myfolders/hiv-modelling/model_consumer.sas";
		%put "Run=" &run_id &random &run;
		%put "Dataset=" &dataset_id;
		%let run = %sysfunc(round(&run_id,1));
		%let dataset_id = %sysfunc(trim(left(&run)));
		%put "Dataset=" &dataset_id;
		*/
		/*
		data _null_;
			run = rand('uniform')*1000000000;
			run = round(run,1);
			call symput("run", run);
			dataset_id = trim(left(run));
			call symput("dataset_id", dataset_id);			
		
		run;
		*/
	%end;
%mend modelrun;
%modelrun(&total_runs);
