libname a "/folders/myfolders/hiv-modelling/output/";

proc contents data=a.output_compressed;
	title "Compressed Data"
run;
