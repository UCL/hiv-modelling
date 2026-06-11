/* ----------------------------------------------------------------------------
   The %var macro from create_wide_file.sas (lines 222-247). For one model
   output variable it computes cumulative means across several calendar-year
   windows (a single year, plus 5- and 20-year cost-effectiveness windows),
   then transposes each to one line per run and merges them into a per-run
   wide dataset. This is the workhorse that turns the long quarterly model
   output into the wide per-run summary used for analysis.

   Statements are terminated with run; so each PROC MEANS / TRANSPOSE / SORT
   materialises before the merge.
---------------------------------------------------------------------------- */
%macro var(v=);
proc means noprint data=y; var &v; output out=y_22 mean= &v._22; by run; where 2021.0 <= cald < 2022.0; run;
proc means noprint data=y; var &v; output out=y_22_27 mean= &v._22_27; by run option ; where 2022.5 <= cald < 2027.50; run;
proc means noprint data=y; var &v; output out=y_22_42 mean= &v._22_42; by run option ; where 2022.5 <= cald < 2042.50; run;

proc sort data=y_22; by run; run;
proc transpose data=y_22 out=t_22 prefix=&v._22_; var &v._22; by run; run;
proc sort data=y_22_27; by run; run;
proc transpose data=y_22_27 out=t_22_27 prefix=&v._22_27_; var &v._22_27; by run; run;
proc sort data=y_22_42; by run; run;
proc transpose data=y_22_42 out=t_22_42 prefix=&v._22_42_; var &v._22_42; by run; run;

data &v ; merge y_22 t_22_27 t_22_42; by run; run;
%mend var;

%var(v=prevalence1549);
%var(v=incidence1549);
%var(v=dcost);

***Merge the per-variable datasets into one wide dataset, one row per run;
data wide_outputs;
	merge prevalence1549 incidence1549 dcost;
	by run;
run;

proc print data=wide_outputs;
	title "wide_outputs: cumulative period means transposed to one row per run";
run;
title;
