%let sasoutfile = %scan(&sysparm,1," ");
%let sasoutput = %scan(&sysparm,2," ");
%let sasresult = %scan(&sysparm,3," ");

libname model "&sasoutput/";

* libname model '/home/cceapsc/Scratch/';

%macro appendtable();
	%if %sysfunc(exist(model.&sasresult)) %then 
		%do;
			proc append base = model.&sasresult data = model.&sasoutfile;
			run;
		%end;
	%else
		%do;
			data model.&sasresult(compress=binary);
				set model.&sasoutfile;
			run;
		%end;
%mend;

%appendtable;
