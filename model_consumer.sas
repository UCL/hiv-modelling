* proc printto log="/home/cceapsc/Scratch/consumer.log";

* proc printto;
libname model '/home/cceapsc/Scratch/';
data xyz;
	population = &population;
	total = &total_runs;
	start = &startyear;
	end = &endyear;
	delta = &increment;
	runner = &run;
	keep population total start end delta runner;
run;

%macro savemodel();
	%if %sysfunc(exist(model.testdata)) %then 
		%do;
			proc append base = model.testdata data = xyz;
			run;
		%end;
	%else
		%do;
			data model.testdata;
				set xyz;
			run;
		%end;
%mend;

%savemodel;
