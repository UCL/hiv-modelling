libname model '/home/cceapsc/Scratch/output/';
* libname model 'N:\SAS\hiv-modelling\output\';

%macro appendtable();
	%if %sysfunc(exist(model.combined_data)) %then 
		%do;
			proc append base = model.combined_data data = &sysparm;
			run;
		%end;
	%else
		%do;
			data model.combined_data(compress=binary);
				set &sysparm;
			run;
		%end;
%mend;

%appendtable;
