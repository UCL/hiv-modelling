%let outfile = %scan(&sysparm,1);
%let modeldir = %scan(&sysparm,2);
%let sasfile = %scan(&sysparm,3);

libname model &modeldir;

* libname model '/home/cceapsc/Scratch/';

%macro appendtable();
	%if %sysfunc(exist(model.&sasfile)) %then 
		%do;
			proc append base = model.&sasfile data = model.&outfile;
			run;
		%end;
	%else
		%do;
			data model.&sasfile(compress=binary);
				set model.&outfile;
			run;
		%end;
%mend;

%appendtable;
