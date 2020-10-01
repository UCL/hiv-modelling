
%let population = 1000;
%let total_runs = 10;
%let startyear = 1989;
%let endyear = 2020;
%let increment = 0.25;

%macro modelrun(howmany);
	%do i = 1 %to &howmany;
		data _null_;
			run_id = rand('uniform')*1000000000;
			run_id=round(run_id,1);
			call symput("run", run_id);
			dataset_id=trim(left(run_id));
			call symput("dataset_id", dataset_id);			
		run;
		%include "/folders/myfolders/hiv-modelling/model_consumer.sas";
	%end;
%mend modelrun;
%modelrun(&total_runs);