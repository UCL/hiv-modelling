* libname a "/folders/myfolders/hiv-modelling/output/";
dm 'log;clear;output;clear;';
proc printto;
libname _all_ list;
libname model 'N:\SAS\hiv-modelling';

proc contents data=model.out_model;
run;
