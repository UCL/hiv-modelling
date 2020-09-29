libname tmp_out "/folders/myfolders/hiv-modelling/output/";

data _null_;
	set tmp_out.modeldata;
	call symput("pop", population);
	call symput("run", run_id);
	call symput("cald", caldate1);
run;

proc print data=tmp_out.modeldata;
    title "Runner parameters";
run;




