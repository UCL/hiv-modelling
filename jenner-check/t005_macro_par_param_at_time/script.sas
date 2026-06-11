/* ----------------------------------------------------------------------------
   The %par macro from create_wide_file.sas (lines 278-282). For one sampled
   parameter it takes the value at cald=2022.5 (the pre-intervention time point)
   for each run via PROC MEANS, then drops the automatic _TYPE_ / _FREQ_ columns
   so the result is one tidy value per run. The per-parameter datasets are then
   merged into wide_par, ready to be joined onto the model outputs for analysis.
---------------------------------------------------------------------------- */
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2022.5; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;
%mend par;

%par(p=sw_program);
%par(p=effect_sw_prog_newp);
%par(p=sw_trans_matrix);

data wide_par;
	merge sw_program effect_sw_prog_newp sw_trans_matrix;
	by run;
run;

proc print data=wide_par;
	title "wide_par: sampled parameter values at cald=2022.5, one row per run";
run;
title;
