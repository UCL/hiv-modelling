
%let population_size = 1000;
%let total_runs = 10;
%let startyear = 1989;
libname tmp_out "/folders/myfolders/hiv-modelling/output/";

%macro modelrun(howmany);
	%do i = 1 %to &howmany;
		data tmp_out.modeldata;
			population = &population_size;
			caldate1 = &startyear;
			run_id = rand('uniform')*1000000000;  
			run_id=round(run_id,1);										   
			dataset_id=trim(left(run_id));
		run;
		%include "/folders/myfolders/hiv-modelling/model_consumer.sas";
	%end;
%mend modelrun;
%modelrun(&total_runs);