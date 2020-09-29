libname tmp_out "/folders/myfolders/hiv-modelling/output/";

data _null_;
	set tmp_out.modeldata;
	call symput("pop", population);
	call symput("run", run_id);
	call symput("cald", caldate1);
	call symput("dataset_id", dataset_id);
run;

%put &pop;
%put &run;
%put &cald;
%put &dataset_id;
%let startyr = &cald + 0.25;

proc print data=tmp_out.modeldata;
	var dataset_id;
    title "Runner parameters";
run;




