libname model '/home/cceapsc/Scratch/output/';
* libname model 'N:\SAS\hiv-modelling\output\';
printto;

%macro appendtable();
	%if %sysfunc(exist(model.combined_data)) %then 
		%do;
			proc append base = model.combined_data data = model.&sysparm;
			run;
		%end;
	%else
		%do;
			data model.combined_data(compress=binary);
				set model.&sysparm;
			run;
		%end;
%mend;

%appendtable;
