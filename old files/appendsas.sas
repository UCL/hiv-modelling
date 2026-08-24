%let sastmpfile = %scan(&sysparm,1," ");
%let sasoutputdir = %scan(&sysparm,2," ");
%let sasmergedfile = %scan(&sysparm,3," ");

libname model "&sasoutputdir/";

* libname model '/home/cceapsc/Scratch/';

%macro appendtable();
	%if %sysfunc(exist(model.&sasmergedfile)) %then 
		%do;
			proc append base = model.&sasmergedfile data = model.&sastmpfile;
			run;
		%end;
	%else
		%do;
			data model.&sasmergedfile(compress=binary);
				set model.&sastmpfile;
			run;
		%end;
%mend;

%appendtable;
