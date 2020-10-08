options ps=1000 ls=220 cpucount=4 spool fullstimer ;

%let population = 100000;
%let total_runs = 500;
%let startyear = 1989;
%let endyear = 2020;
%let increment = 0.25;

%macro modelrun(howmany);
	%do index = 1 %to &howmany;
		data _null_;
			run_id = rand('uniform')*1000000000;
			run_id = round(run_id,1);
			call symput("run_id", run_id);
			dataset_id = trim(left(run_id));
			call symput("dataset_id", dataset_id);			
		run;
		%include "/folders/myfolders/hiv-modelling/test_hiv_model.sas";
	%end;
%mend modelrun;
%modelrun(&total_runs);