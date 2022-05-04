
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";

  proc printto ; * log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";

data b;
set a.l_pop_wide_tld3;

if prop_elig_on_prep = . then prop_elig_on_prep = 0;
n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
prevalence1549_ = prevalence1549;
prevalence_vg1000_ = prevalence_vg1000;
p_onart_vl1000_ = p_onart_vl1000;
n_cd4_lt200_ = n_cd4_lt200;
n_dead_hivpos_cause1_ = n_dead_hivpos_cause1;

%let single_var = prop_hivneg_onprep           ;

proc univariate; var prop_hivneg_onprep   ; run;

proc glm; model prop_hivneg_onprep = 
prob_tld_prep_if_untested an_lin_incr_test date_test_rate_plateau
p_hard_reach_w hard_reach_higher_in_men  pref_prep_oral_beta_s1 rate_choose_stop_prep_oral prob_prep_any_restart_choice / solution ;
where 2023 <= cald < 2026 and option=3; run;

proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 456     ;
%let year_end = 2070.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option ge 1 then delete;

%let var =  &single_var ; 

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;
%let mean_var = mean_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);
mean_&varb._0 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 mean_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;



data option_1;
set b;
if option =1;

%let var = &single_var ; 
run;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p50_var = median_&var_1;
%let mean_var = mean_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);
mean_&varb._1 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1 mean_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;




data option_2;
set b;
if option =2;

%let var = &single_var ; 
run;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_2;
%let p25_var = p25_&var_2;
%let p75_var = p75_&var_2;
%let p5_var = p5_&var_2;
%let p95_var = p95_&var_2;
%let p50_var = median_&var_2;
%let mean_var = mean_&var_2;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_2 out=k&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data k&count;set k&count;***creates one dataset per variable;
p25_&varb._2  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._2 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._2  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._2 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._2 = median(of &varb.1-&varb.&nfit);
mean_&varb._2 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._2 p95_&varb._2 p50_&varb._2 p25_&varb._2 p75_&varb._2 mean_&varb._2;
run;

      proc datasets nodetails nowarn nolist; 
      delete  kk&count;quit;run;
%end;
%mend;


%option_2;
run;




data option_3;
set b;
if option =3;

%let var = &single_var ; 
run;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_3;
%let p25_var = p25_&var_3;
%let p75_var = p75_&var_3;
%let p5_var = p5_&var_3;
%let p95_var = p95_&var_3;
%let p50_var = median_&var_3;
%let mean_var = mean_&var_3;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_3 out=l&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data l&count;set l&count;***creates one dataset per variable;
p25_&varb._3  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._3 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._3  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._3 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._3 = median(of &varb.1-&varb.&nfit);
mean_&varb._3 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._3 p95_&varb._3 p50_&varb._3 p25_&varb._3 p75_&varb._3 mean_&varb._3;
run;

      proc datasets nodetails nowarn nolist; 
      delete  ll&count;quit;run;
%end;
%mend;


%option_3;
run;






data d; * this is number of variables in %let var = above ;
merge g1  h1  k1  l1;
by cald;

ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;



/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV negative adults taking PrEP/PEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15  by 0.05) valueattrs=(size=10);

  label p50_prop_hivneg_onprep_0 = "No PrEP (median) ";
  label p50_prop_hivneg_onprep_1 = "Oral PrEP only (median) ";
  label p50_prop_hivneg_onprep_2 = "Oral and cab-la PrEP (median) ";
  label p50_prop_hivneg_onprep_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_prop_hivneg_onprep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_prop_hivneg_onprep_0 	upper=p95_prop_hivneg_onprep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prop_hivneg_onprep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prop_hivneg_onprep_1 	upper=p95_prop_hivneg_onprep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_hivneg_onprep_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_prop_hivneg_onprep_2 	upper=p95_prop_hivneg_onprep_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_prop_hivneg_onprep_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_prop_hivneg_onprep_3 	upper=p95_prop_hivneg_onprep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV negative adults (age 1564) taking PrEP/PEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2   by 0.05) valueattrs=(size=10);

  label p50_prop_1564_hivneg_onprep_0 = "No PrEP (median) ";
  label p50_prop_1564_hivneg_onprep_1 = "Oral PrEP only (median) ";
  label p50_prop_1564_hivneg_onprep_2 = "Oral and cab-la PrEP (median) ";
  label p50_prop_1564_hivneg_onprep_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_prop_1564_hivneg_onprep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_0 	upper=p95_prop_1564_hivneg_onprep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_hivneg_onprep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_1 	upper=p95_prop_1564_hivneg_onprep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_hivneg_onprep_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_2 	upper=p95_prop_1564_hivneg_onprep_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_prop_1564_hivneg_onprep_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_prop_1564_hivneg_onprep_3 	upper=p95_prop_1564_hivneg_onprep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

* p_elig_all_prep_criteria  p_elig_all_prep_cri_hivneg  p_elig_hivneg_onprep  p_prep_elig_onprep_inj ;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of HIV negative people who have an indication for PrEP and are taking PrEP, proportion on cab-la";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1  ) valueattrs=(size=10);

  label p50_p_prep_elig_onprep_inj_0 = "No PrEP (median) ";
  label p50_p_prep_elig_onprep_inj_1 = "Oral PrEP only (median) ";
  label p50_p_prep_elig_onprep_inj_2 = "Oral and cab-la PrEP (median) ";
  label p50_p_prep_elig_onprep_inj_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_prep_elig_onprep_inj_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_prep_elig_onprep_inj_0 	upper=p95_p_prep_elig_onprep_inj_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_prep_elig_onprep_inj_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_prep_elig_onprep_inj_1 	upper=p95_p_prep_elig_onprep_inj_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_prep_elig_onprep_inj_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_prep_elig_onprep_inj_2 	upper=p95_p_prep_elig_onprep_inj_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_prep_elig_onprep_inj_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_prep_elig_onprep_inj_3 	upper=p95_p_prep_elig_onprep_inj_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_elig_hivneg_onprep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1  ) valueattrs=(size=10);

  label p50_p_elig_hivneg_onprep_0 = "No PrEP (median) ";
  label p50_p_elig_hivneg_onprep_1 = "Oral PrEP only (median) ";
  label p50_p_elig_hivneg_onprep_2 = "Oral and cab-la PrEP (median) ";
  label p50_p_elig_hivneg_onprep_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_elig_hivneg_onprep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_elig_hivneg_onprep_0 	upper=p95_p_elig_hivneg_onprep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_elig_hivneg_onprep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_elig_hivneg_onprep_1 	upper=p95_p_elig_hivneg_onprep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_elig_hivneg_onprep_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_elig_hivneg_onprep_2 	upper=p95_p_elig_hivneg_onprep_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_elig_hivneg_onprep_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_elig_hivneg_onprep_3 	upper=p95_p_elig_hivneg_onprep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_prep_hivneg";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1  ) valueattrs=(size=10);

  label p50_p_newp_prep_hivneg_0 = "No PrEP (median) ";
  label p50_p_newp_prep_hivneg_1 = "Oral PrEP only (median) ";
  label p50_p_newp_prep_hivneg_2 = "Oral and cab-la PrEP (median) ";
  label p50_p_newp_prep_hivneg_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_newp_prep_hivneg_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_p_newp_prep_hivneg_0 	upper=p95_p_newp_prep_hivneg_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_prep_hivneg_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_newp_prep_hivneg_1 	upper=p95_p_newp_prep_hivneg_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_prep_hivneg_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_newp_prep_hivneg_2 	upper=p95_p_newp_prep_hivneg_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_prep_hivneg_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_newp_prep_hivneg_3 	upper=p95_p_newp_prep_hivneg_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "dcost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '$m per year' 	labelattrs=(size=12)  values = (0 to 250   by  50  ) valueattrs=(size=10);

  label p50_dcost_0 = "No PrEP (median) ";
  label p50_dcost_1 = "Oral PrEP only (median) ";
  label p50_dcost_2 = "Oral and cab-la PrEP (median) ";
  label p50_dcost_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_dcost_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_dcost_0 	upper=p95_dcost_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_dcost_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_dcost_1 	upper=p95_dcost_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_dcost_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_dcost_2 	upper=p95_dcost_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_dcost_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_dcost_3 	upper=p95_dcost_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '$m per year' 	labelattrs=(size=12)  values = (0 to 500   by  50  ) valueattrs=(size=10);

  label p50_cost_0 = "No PrEP (median) ";
  label p50_cost_1 = "Oral PrEP only (median) ";
  label p50_cost_2 = "Oral and cab-la PrEP (median) ";
  label p50_cost_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_cost_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_cost_0 	upper=p95_cost_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_cost_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_cost_1 	upper=p95_cost_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_cost_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_cost_2 	upper=p95_cost_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_cost_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_cost_3 	upper=p95_cost_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = (50 to 100   by  5  ) valueattrs=(size=10);

  label p50_p_diag_0 = "No PrEP (median) ";
  label p50_p_diag_1 = "Oral PrEP only (median) ";
  label p50_p_diag_2 = "Oral and cab-la PrEP (median) ";
  label p50_p_diag_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_diag_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_diag_2 	upper=p95_p_diag_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_diag_3 	upper=p95_p_diag_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0.5 to 1   by  0.05  ) valueattrs=(size=10);

  label p50_p_onart_diag_0 = "No PrEP (median) ";
  label p50_p_onart_diag_1 = "Oral PrEP only (median) ";
  label p50_p_onart_diag_2 = "Oral and cab-la PrEP (median) ";
  label p50_p_onart_diag_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_onart_diag_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_onart_diag_0 	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_onart_diag_1 	upper=p95_p_onart_diag_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_onart_diag_2 	upper=p95_p_onart_diag_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_onart_diag_3 	upper=p95_p_onart_diag_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0.5 to 1   by  0.05  ) valueattrs=(size=10);

  label p50_p_onart_0 = "No PrEP (median) ";
  label p50_p_onart_1 = "Oral PrEP only (median) ";
  label p50_p_onart_2 = "Oral and cab-la PrEP (median) ";
  label p50_p_onart_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_onart_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_onart_0 	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_onart_1 	upper=p95_p_onart_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_onart_2 	upper=p95_p_onart_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_onart_3 	upper=p95_p_onart_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all people with HIV, proportion with integrase inhibitor resistance";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0   to 0.3 by  0.05  ) valueattrs=(size=10);

  label p50_p_iime_0 = "No PrEP (median) ";
  label p50_p_iime_1 = "Oral PrEP only (median) ";
  label p50_p_iime_2 = "Oral and cab-la PrEP (median) ";
  label p50_p_iime_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_iime_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_iime_0 	upper=p95_p_iime_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_iime_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_iime_1 	upper=p95_p_iime_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_iime_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_iime_2 	upper=p95_p_iime_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_iime_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_iime_3 	upper=p95_p_iime_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of people with integrase inhibitor resistant HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0   to 300000 by  10000  ) valueattrs=(size=10);

  label p50_n_cur_res_cab_0 = "No PrEP (median) ";
  label p50_n_cur_res_cab_1 = "Oral PrEP only (median) ";
  label p50_n_cur_res_cab_2 = "Oral and cab-la PrEP (median) ";
  label p50_n_cur_res_cab_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_cur_res_cab_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_cur_res_cab_0 	upper=p95_n_cur_res_cab_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_cur_res_cab_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_cur_res_cab_1 	upper=p95_n_cur_res_cab_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_cur_res_cab_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_cur_res_cab_2 	upper=p95_n_cur_res_cab_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_cur_res_cab_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_cur_res_cab_3 	upper=p95_n_cur_res_cab_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion' 	labelattrs=(size=12)  values = (0  to 1   by  0.05  ) valueattrs=(size=10);

  label p50_p_vl1000__0 = "No PrEP (median) ";
  label p50_p_vl1000__1 = "Oral PrEP only (median) ";
  label p50_p_vl1000__2 = "Oral and cab-la PrEP (median) ";
  label p50_p_vl1000__3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_p_vl1000__2 	upper=p95_p_vl1000__2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_p_vl1000__3 	upper=p95_p_vl1000__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "HIV incidence in people aged 1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate per 100 person years' 	labelattrs=(size=12)  values = ( 0 to 1       by  0.1  ) valueattrs=(size=10);

  label p50_incidence1549__0 = "No PrEP (median) ";
  label p50_incidence1549__1 = "Oral PrEP only (median) ";
  label p50_incidence1549__2 = "Oral and cab-la PrEP (median) ";
  label p50_incidence1549__3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_incidence1549__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "HIV prevalence in people aged 1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 0.15     by  0.01  ) valueattrs=(size=10);

  label p50_prevalence1549__0 = "No PrEP (median) ";
  label p50_prevalence1549__1 = "Oral PrEP only (median) ";
  label p50_prevalence1549__2 = "Oral and cab-la PrEP (median) ";
  label p50_prevalence1549__3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_prevalence1549__2 	upper=p95_prevalence1549__2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_prevalence1549__3 	upper=p95_prevalence1549__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence of VL > 1000 in whole adult population (HIV+ and HIV-)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 0.15     by  0.01  ) valueattrs=(size=10);

  label p50_prevalence_vg1000__0 = "No PrEP (median) ";
  label p50_prevalence_vg1000__1 = "Oral PrEP only (median) ";
  label p50_prevalence_vg1000__2 = "Oral and cab-la PrEP (median) ";
  label p50_prevalence_vg1000__3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_prevalence_vg1000__2 	upper=p95_prevalence_vg1000__2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_prevalence_vg1000__3 	upper=p95_prevalence_vg1000__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;

  

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 50000    by  5000  ) valueattrs=(size=10);

  label p50_n_death_hiv_0 = "No PrEP (median) ";
  label p50_n_death_hiv_1 = "Oral PrEP only (median) ";
  label p50_n_death_hiv_2 = "Oral and cab-la PrEP (median) ";
  label p50_n_death_hiv_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_death_hiv_2 	upper=p95_n_death_hiv_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_death_hiv_3 	upper=p95_n_death_hiv_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;

  

* n_cd4_lt200 aids_death_rate  death_rate_onart  death_rate_artexp  death_rate_hiv death_rate_hiv_all ;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 200000    by  50000  ) valueattrs=(size=10);

  label p50_n_cd4_lt200__0 = "No PrEP (median) ";
  label p50_n_cd4_lt200__1 = "Oral PrEP only (median) ";
  label p50_n_cd4_lt200__2 = "Oral and cab-la PrEP (median) ";
  label p50_n_cd4_lt200__3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_cd4_lt200__1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_cd4_lt200__1 	upper=p95_n_cd4_lt200__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_cd4_lt200__2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_cd4_lt200__2 	upper=p95_n_cd4_lt200__2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_cd4_lt200__3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_cd4_lt200__3 	upper=p95_n_cd4_lt200__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "aids_death_rate";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 5    by  0.5  ) valueattrs=(size=10);

  label p50_aids_death_rate_0 = "No PrEP (median) ";
  label p50_aids_death_rate_1 = "Oral PrEP only (median) ";
  label p50_aids_death_rate_2 = "Oral and cab-la PrEP (median) ";
  label p50_aids_death_rate_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_aids_death_rate_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_aids_death_rate_0 	upper=p95_aids_death_rate_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_aids_death_rate_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_aids_death_rate_1 	upper=p95_aids_death_rate_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_aids_death_rate_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_aids_death_rate_2 	upper=p95_aids_death_rate_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_aids_death_rate_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_aids_death_rate_3 	upper=p95_aids_death_rate_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "death_rate_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 5    by  0.5  ) valueattrs=(size=10);

  label p50_death_rate_hiv_0 = "No PrEP (median) ";
  label p50_death_rate_hiv_1 = "Oral PrEP only (median) ";
  label p50_death_rate_hiv_2 = "Oral and cab-la PrEP (median) ";
  label p50_death_rate_hiv_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_death_rate_hiv_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_0 	upper=p95_death_rate_hiv_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_1 	upper=p95_death_rate_hiv_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_2 	upper=p95_death_rate_hiv_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_3 	upper=p95_death_rate_hiv_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "death_rate_hiv_all";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 0.5  by  0.1  ) valueattrs=(size=10);

  label p50_death_rate_hiv_all_0 = "No PrEP (median) ";
  label p50_death_rate_hiv_all_1 = "Oral PrEP only (median) ";
  label p50_death_rate_hiv_all_2 = "Oral and cab-la PrEP (median) ";
  label p50_death_rate_hiv_all_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_death_rate_hiv_all_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_all_0 	upper=p95_death_rate_hiv_all_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_all_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_all_1 	upper=p95_death_rate_hiv_all_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_all_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_all_2 	upper=p95_death_rate_hiv_all_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_death_rate_hiv_all_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_death_rate_hiv_all_3 	upper=p95_death_rate_hiv_all_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_pop_wide_tld_prep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000   by 100000 ) valueattrs=(size=10);

  label p50_n_pop_wide_tld_prep_0 = "No PrEP (median) ";
  label p50_n_pop_wide_tld_prep_1 = "Oral PrEP only (median) ";
  label p50_n_pop_wide_tld_prep_2 = "Oral and cab-la PrEP (median) ";
  label p50_n_pop_wide_tld_prep_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_pop_wide_tld_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_0 	upper=p95_n_pop_wide_tld_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_pop_wide_tld_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_1 	upper=p95_n_pop_wide_tld_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_pop_wide_tld_prep_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_2 	upper=p95_n_pop_wide_tld_prep_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_pop_wide_tld_prep_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_pop_wide_tld_prep_3 	upper=p95_n_pop_wide_tld_prep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

  


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_onart";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000   by 100000 ) valueattrs=(size=10);

  label p50_n_onart_0 = "No PrEP (median) ";
  label p50_n_onart_1 = "Oral PrEP only (median) ";
  label p50_n_onart_2 = "Oral and cab-la PrEP (median) ";
  label p50_n_onart_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_onart_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_onart_2 	upper=p95_n_onart_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_onart_3 	upper=p95_n_onart_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of adult population taking ARVs for prevention or treatment";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.3  by 0.1 ) valueattrs=(size=10);

  label p50_prop_art_or_prep_0 = "No PrEP (median) ";
  label p50_prop_art_or_prep_1 = "Oral PrEP only (median) ";
  label p50_prop_art_or_prep_2 = "Oral and cab-la PrEP (median) ";
  label p50_prop_art_or_prep_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_prop_art_or_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_prop_art_or_prep_0 	upper=p95_prop_art_or_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_prop_art_or_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_prop_art_or_prep_1 	upper=p95_prop_art_or_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_art_or_prep_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_prop_art_or_prep_2 	upper=p95_prop_art_or_prep_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_prop_art_or_prep_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_prop_art_or_prep_3 	upper=p95_prop_art_or_prep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_art_or_prep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 3000000  by 1000000 ) valueattrs=(size=10);

  label p50_n_art_or_prep_0 = "No PrEP (median) ";
  label p50_n_art_or_prep_1 = "Oral PrEP only (median) ";
  label p50_n_art_or_prep_2 = "Oral and cab-la PrEP (median) ";
  label p50_n_art_or_prep_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_art_or_prep_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_art_or_prep_0 	upper=p95_n_art_or_prep_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_art_or_prep_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_art_or_prep_1 	upper=p95_n_art_or_prep_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_art_or_prep_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_art_or_prep_2 	upper=p95_n_art_or_prep_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_art_or_prep_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_art_or_prep_3 	upper=p95_n_art_or_prep_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;

*/

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on cab-la";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000   by 100000 ) valueattrs=(size=10);

  label p50_n_prep_inj_0 = "No PrEP (median) ";
  label p50_n_prep_inj_1 = "Oral PrEP only (median) ";
  label p50_n_prep_inj_2 = "Oral and cab-la PrEP (median) ";
  label p50_n_prep_inj_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_prep_inj_0/	lineattrs = (color=liggr   thickness = 3);
  band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_0  / transparency=0.9 fillattrs = (color=liggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_inj_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_prep_inj_1 	upper=p95_n_prep_inj_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_inj_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_prep_inj_2 	upper=p95_n_prep_inj_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_inj_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_prep_inj_3 	upper=p95_n_prep_inj_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;


/*

proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_hivneg_anycause";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage' 	labelattrs=(size=12)  values = ( 0 to 320000    by  10000  ) valueattrs=(size=10);

  label p50_n_death_hivneg_anycause_0 = "No PrEP (median) ";
  label p50_n_death_hivneg_anycause_1 = "Oral PrEP only (median) ";
  label p50_n_death_hivneg_anycause_2 = "Oral and cab-la PrEP (median) ";
  label p50_n_death_hivneg_anycause_3 = "Oral and cab-la PrEP and accessible TLD/PEP (median) ";

  series  x=cald y=p50_n_death_hivneg_anycause_0/	lineattrs = (color=ggr   thickness = 3);
  band    x=cald lower=p5_n_death_hivneg_anycause_0 	upper=p95_n_death_hivneg_anycause_0  / transparency=0.9 fillattrs = (color= ggr  ) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hivneg_anycause_1/	lineattrs = (color=black thickness = 3);
  band    x=cald lower=p5_n_death_hivneg_anycause_1 	upper=p95_n_death_hivneg_anycause_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hivneg_anycause_2/	lineattrs = (color=viyg thickness = 3);
  band    x=cald lower=p5_n_death_hivneg_anycause_2 	upper=p95_n_death_hivneg_anycause_2  / transparency=0.9 fillattrs = (color=viyg) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hivneg_anycause_3/	lineattrs = (color=orange thickness = 3);
  band    x=cald lower=p5_n_death_hivneg_anycause_3 	upper=p95_n_death_hivneg_anycause_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;

  
*/


ods html close;

