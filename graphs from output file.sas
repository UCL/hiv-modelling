

* used for submitted manuscript;


***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;


libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\dcp_cab\dcp_cab_b_out\";

proc printto ;

ods html close;

data b;
set a.l_dcp_cab_b_y;

n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
prevalence1549_ = prevalence1549;
p_onart_vl1000_ = p_onart_vl1000;
prevalence_vg1000_ = prevalence_vg1000;
p_vl1000_ = p_vl1000;
p_onart_vl1000_ = p_onart_vl1000;
n_vg1000_ = n_vg1000;
p_newp_ge1_age1549_=p_newp_ge1_age1549;
prop_prep_any = (n_prep_any / n_alive) * 100;

%let single_var = n_death_hiv     ;

p_elig_prep
p_elig_dcp

proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;

%let nfit = 1200  ;

%let year_end = 2070.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =  0 ;

%let var = &single_var   ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;

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
if option =  1 ;

%let var = &single_var    ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;



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
if option =  2 ;

%let var = &single_var    ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;

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


proc transpose data=option_2 out=i&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data i&count;set i&count;***creates one dataset per variable;
p25_&varb._2  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._2 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._2  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._2 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._2 = median(of &varb.1-&varb.&nfit);
mean_&varb._2 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._2 p95_&varb._2 p50_&varb._2 p25_&varb._2 p75_&varb._2 mean_&varb._2;
run;

      proc datasets nodetails nowarn nolist; 
      delete  ii&count;quit;run;
%end;
%mend;


%option_2;
run;




data option_3;
set b;
if option =  3 ;

%let var = &single_var    ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;

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


proc transpose data=option_3 out=j&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data j&count;set j&count;***creates one dataset per variable;
p25_&varb._3  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._3 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._3  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._3 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._3 = median(of &varb.1-&varb.&nfit);
mean_&varb._3 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._3 p95_&varb._3 p50_&varb._3 p25_&varb._3 p75_&varb._3 mean_&varb._3;
run;

      proc datasets nodetails nowarn nolist; 
      delete  ji&count;quit;run;
%end;
%mend;


%option_3;
run;






data d; * this is number of variables in %let var = above ;
merge g1  h1 i1  j1 ;
by cald;


* proc print; 
* run;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;

/*

ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "Number of living adults age 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  30000000   by 10000000 ) valueattrs=(size=10);

label p50_n_alive_0 = "status quo";
label p50_n_alive_1 = "dcp";
label p50_n_alive_2 = "cab";
label p50_n_alive_3 = "dcp + cab";


 series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_alive_1 	upper=p95_n_alive_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_alive_2 	upper=p95_n_alive_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
 series  x=cald y=p50_n_alive_3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_n_alive_3 	upper=p95_n_alive_3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "Number of HIV tests done per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  6000000   by 1000000 ) valueattrs=(size=10);

label p50_n_tested_0 = "status quo";
label p50_n_tested_1 = "dcp";
label p50_n_tested_2 = "cab";
label p50_n_tested_3 = "dcp + cab";


 series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_tested_2 	upper=p95_n_tested_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
 series  x=cald y=p50_n_tested_3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_n_tested_3 	upper=p95_n_tested_3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_0 = "option 0";
label p50_p_onart_1 = "option_1";
label p50_p_onart_2 = "option_2";

  series  x=cald y=p50_p_onart_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_0 	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_onart_1 	upper=p95_p_onart_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_2/	lineattrs = (color=blue  thickness = 4);
  band    x=cald lower=p5_p_onart_2 	upper=p95_p_onart_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all PLHIV (diagnosed or undiagnosed) with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0.7 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_vl1000__0 = "status quo";
label p50_p_vl1000__1 = "dcp";
label p50_p_vl1000__2 = "cab";
label p50_p_vl1000__3 = "dcp + cab";


 series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_vl1000__2 	upper=p95_p_vl1000__2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
 series  x=cald y=p50_p_vl1000__3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_p_vl1000__3 	upper=p95_p_vl1000__3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion with adhav >80%";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_adhav_hi_onart_0 = "option 0";
label p50_p_adhav_hi_onart_1 = "option_1";
label p50_p_adhav_hi_onart_2 = "option_2";
label p50_p_adhav_hi_onart_3 = "option_3";
label p50_p_adhav_hi_onart_4 = "option_4";
label p50_p_adhav_hi_onart_5 = "option_5";

  series  x=cald y=p50_p_adhav_hi_onart_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_0 	upper=p95_p_adhav_hi_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_1 	upper=p95_p_adhav_hi_onart_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_2 	upper=p95_p_adhav_hi_onart_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_3 	upper=p95_p_adhav_hi_onart_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_4/	lineattrs = (color=blue  thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_4 	upper=p95_p_adhav_hi_onart_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_adhav_hi_onart_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_adhav_hi_onart_5 	upper=p95_p_adhav_hi_onart_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;




ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence per 100 person years'		labelattrs=(size=12)  values = (0 to  1.4       by 0.1     ) valueattrs=(size=10);

label p50_incidence1549__0 = "status quo";
label p50_incidence1549__1 = "dcp";
label p50_incidence1549__2 = "cab";
label p50_incidence1549__3 = "dcp + cab";


 series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_incidence1549__2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
 series  x=cald y=p50_incidence1549__3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prop_inf_w_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1     by 0.05 ) valueattrs=(size=10);

label mean_prop_inf_w_sw_0 = "option 0";
label mean_prop_inf_w_sw_1 = "option_1";

  series  x=cald y=mean_prop_inf_w_sw_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_inf_w_sw_0 	upper=p95_prop_inf_w_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=mean_prop_inf_w_sw_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prop_inf_w_sw_1 	upper=p95_prop_inf_w_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'proportion'		labelattrs=(size=12)  values = (0 to  0.2       by  0.01     ) valueattrs=(size=10);

label p50_prevalence1549__0 = "status quo";
label p50_prevalence1549__1 = "dcp";
label p50_prevalence1549__2 = "cab";
label p50_prevalence1549__3 = "dcp + cab";


 series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_prevalence1549__2 	upper=p95_prevalence1549__2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
 series  x=cald y=p50_prevalence1549__3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_prevalence1549__3 	upper=p95_prevalence1549__3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.05  by 0.005 ) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "option 0";
label p50_prevalence_vg1000__1 = "option_1";
label p50_prevalence_vg1000__2 = "option_2";

  series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__2 	upper=p95_prevalence_vg1000__2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_infected_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000 by 100000 ) valueattrs=(size=10);

label p50_n_infected_primary_0 = "option 0";
label p50_n_infected_primary_1 = "option_1";
label p50_n_infected_primary_2 = "option_2";

  series  x=cald y=p50_n_infected_primary_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_infected_primary_0 	upper=p95_n_infected_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_infected_primary_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_infected_primary_1 	upper=p95_n_infected_primary_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_infected_primary_2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_n_infected_primary_2 	upper=p95_n_infected_primary_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_vg1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000 ) valueattrs=(size=10);

label p50_n_vg1000__0 = "option 0";
label p50_n_vg1000__1 = "option_1";
label p50_n_vg1000__2 = "option_2";

  series  x=cald y=p50_n_vg1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_vg1000__0 	upper=p95_n_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_vg1000__1 	upper=p95_n_vg1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000__2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_n_vg1000__2 	upper=p95_n_vg1000__2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "90% range";

run;quit;

ods html close;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_any";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000  by 100000 ) valueattrs=(size=10);

label p50_n_prep_any_0 = "status quo";
label p50_n_prep_any_1 = "dcp";
label p50_n_prep_any_2 = "cab";
label p50_n_prep_any_3 = "dcp + cab";

  series  x=cald y=p50_n_prep_any_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_prep_any_0 	upper=p95_n_prep_any_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_prep_any_1 	upper=p95_n_prep_any_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_prep_any_2 	upper=p95_n_prep_any_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_n_prep_any_3 	upper=p95_n_prep_any_3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Percentage of adults taking PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percent'		labelattrs=(size=12)  values = (0 to 7  by 1 ) valueattrs=(size=10);

label p50_prop_prep_any_0 = "status quo";
label p50_prop_prep_any_1 = "dcp";
label p50_prop_prep_any_2 = "cab";
label p50_prop_prep_any_3 = "dcp + cab";

  series  x=cald y=p50_prop_prep_any_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_prep_any_0 	upper=p95_prop_prep_any_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_prep_any_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prop_prep_any_1 	upper=p95_prop_prep_any_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prop_prep_any_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_prop_prep_any_2 	upper=p95_prop_prep_any_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_prop_prep_any_3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_prop_prep_any_3 	upper=p95_prop_prep_any_3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion people with a PrEP indication taking PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1       by 0.1    ) valueattrs=(size=10);

label p50_prop_elig_on_prep_0 = "status quo";
label p50_prop_elig_on_prep_1 = "dcp";
label p50_prop_elig_on_prep_2 = "cab";
label p50_prop_elig_on_prep_3 = "dcp + cab";

  series  x=cald y=p50_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_on_prep_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prop_elig_on_prep_1 	upper=p95_prop_elig_on_prep_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_on_prep_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_prop_elig_on_prep_2 	upper=p95_prop_elig_on_prep_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_prop_elig_on_prep_3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_prop_elig_on_prep_3 	upper=p95_prop_elig_on_prep_3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Percent of all PLHIV diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percent'		labelattrs=(size=12)  values = (70 to 100     by 10     ) valueattrs=(size=10);

label p50_p_diag_0 = "status quo";
label p50_p_diag_1 = "dcp";
label p50_p_diag_2 = "cab";
label p50_p_diag_3 = "dcp + cab";

  series  x=cald y=p50_p_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_diag_2 	upper=p95_p_diag_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_p_diag_3 	upper=p95_p_diag_3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.7 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_diag_0 = "option 0";
label p50_p_onart_diag_1 = "option_1";
label p50_p_onart_diag_2 = "option_2";

  series  x=cald y=p50_p_onart_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_diag_0 	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_onart_diag_1 	upper=p95_p_onart_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_onart_diag_2 	upper=p95_p_onart_diag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prop_w_1549_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.05 by 0.005 ) valueattrs=(size=10);

label p50_prop_w_1549_sw_0 = "option 0";
label p50_prop_w_1549_sw_1 = "option_1";
label p50_prop_w_1549_sw_2 = "option_2";

  series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_1549_sw_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_prop_w_1549_sw_2 	upper=p95_prop_w_1549_sw_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1    by 0.1   ) valueattrs=(size=10);

label p50_p_inf_diag_0 = "option 0";
label p50_p_inf_diag_1 = "option_1";
label p50_p_inf_diag_2 = "option_2";

  series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_diag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_inf_diag_2 	upper=p95_p_inf_diag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_age1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.05 by 0.005 ) valueattrs=(size=10);

label p50_p_newp_ge1_age1549__0 = "option 0";
label p50_p_newp_ge1_age1549__1 = "option_1";
label p50_p_newp_ge1_age1549__2 = "option_2";

  series  x=cald y=p50_p_newp_ge1_age1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__0 	upper=p95_p_newp_ge1_age1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_ge1_age1549__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__1 	upper=p95_p_newp_ge1_age1549__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_ge1_age1549__2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__2 	upper=p95_p_newp_ge1_age1549__2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_newp_ge1_age1549__3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_newp_ge1_age1549__3 	upper=p95_p_newp_ge1_age1549__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of those on ART, proportion with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2030 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.80 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "option 0";
label p50_p_onart_vl1000__1 = "option_1";
label p50_p_onart_vl1000__2 = "option_2";
label p50_p_onart_vl1000__3 = "option_3";

  series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__2 	upper=p95_p_onart_vl1000__2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__3/	lineattrs = (color=orange   thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__3 	upper=p95_p_onart_vl1000__3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of sw on ART, proportion with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2030 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.9 to 1   by 0.01 ) valueattrs=(size=10);

label p50_p_onart_vl1000_sw_0 = "option 0";
label p50_p_onart_vl1000_sw_1 = "option_1";
label p50_p_onart_vl1000_sw_2 = "option_2";
label p50_p_onart_vl1000_sw_3 = "option_3";
label p50_p_onart_vl1000_sw_4 = "option_4";
label p50_p_onart_vl1000_sw_5 = "option_5";

  series  x=cald y=p50_p_onart_vl1000_sw_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_0 	upper=p95_p_onart_vl1000_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_1 	upper=p95_p_onart_vl1000_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_2 	upper=p95_p_onart_vl1000_sw_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_3 	upper=p95_p_onart_vl1000_sw_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_4 	upper=p95_p_onart_vl1000_sw_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000_sw_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000_sw_5 	upper=p95_p_onart_vl1000_sw_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;

  
 
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "test_prop_positive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 0.025  by 0.005  ) valueattrs=(size=10);

label p50_test_prop_positive_0 = "option 0";
label p50_test_prop_positive_1 = "option_1";
label p50_test_prop_positive_2 = "option_2";
label p50_test_prop_positive_3 = "option_3";

  series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_test_prop_positive_1 	upper=p95_test_prop_positive_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_2/	lineattrs = (color=blue    thickness = 4);
  band    x=cald lower=p5_test_prop_positive_2 	upper=p95_test_prop_positive_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_test_prop_positive_3 	upper=p95_test_prop_positive_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_undiag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000  by  5000 ) valueattrs=(size=10);

label p50_n_undiag_0 = "option 0";
label p50_n_undiag_1 = "option_1";
label p50_n_undiag_2 = "option_2";

  series  x=cald y=p50_n_undiag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_undiag_0 	upper=p95_n_undiag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_undiag_1 	upper=p95_n_undiag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_n_undiag_2 	upper=p95_n_undiag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

run;quit;

ods html close;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_vg1000_np";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 150000  by 10000 ) valueattrs=(size=10);

label p50_n_vg1000_np_0 = "option 0";
label p50_n_vg1000_np_1 = "option_1";
label p50_n_vg1000_np_2 = "option_2";
label p50_n_vg1000_np_3 = "option_3";

  series  x=cald y=p50_n_vg1000_np_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_0 	upper=p95_n_vg1000_np_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000_np_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_1 	upper=p95_n_vg1000_np_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000_np_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_2 	upper=p95_n_vg1000_np_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_vg1000_np_3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_n_vg1000_np_3 	upper=p95_n_vg1000_np_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p mcirc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1   by 0.1  ) valueattrs=(size=10);

label p50_p_mcirc_0 = "option 0";
label p50_p_mcirc_1 = "option_1";
label p50_p_mcirc_2 = "option_2";
label p50_p_mcirc_3 = "option_3";

  series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_mcirc_1 	upper=p95_p_mcirc_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_mcirc_2 	upper=p95_p_mcirc_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_3/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_mcirc_3 	upper=p95_p_mcirc_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;

*/



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV-related deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2073 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0  to 20000   by 5000   ) valueattrs=(size=10);

label p50_n_death_hiv_0 = "status quo";
label p50_n_death_hiv_1 = "dcp";
label p50_n_death_hiv_2 = "cab";
label p50_n_death_hiv_3 = "dcp + cab";

  series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_2/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_death_hiv_2 	upper=p95_n_death_hiv_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_3/	lineattrs = (color=lilac  thickness = 4);
  band    x=cald lower=p5_n_death_hiv_3 	upper=p95_n_death_hiv_3  / transparency=0.9 fillattrs = (color=lilac) legendlabel= "90% range";

run;quit;

ods html close;




/*


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000  by  100000 ) valueattrs=(size=10);

label p50_n_hiv_0 = "option 0";
label p50_n_hiv_1 = "option_1";
label p50_n_hiv_2 = "option_2";

  series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_hiv_1 	upper=p95_n_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_2/	lineattrs = (color=blue    thickness = 4);
  band    x=cald lower=p5_n_hiv_2 	upper=p95_n_hiv_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_onart";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000  by  100000 ) valueattrs=(size=10);

label p50_n_onart_0 = "option 0";
label p50_n_onart_1 = "option_1";
label p50_n_onart_2 = "option_2";

  series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_onart_2/	lineattrs = (color=blue    thickness = 4);
  band    x=cald lower=p5_n_onart_2 	upper=p95_n_onart_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "cost";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 300   by  50    ) valueattrs=(size=10);

label p50_cost_0 = "option 0";
label p50_cost_1 = "option_1";
label p50_cost_2 = "option_2";

  series  x=cald y=p50_cost_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_cost_0 	upper=p95_cost_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_cost_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_cost_1 	upper=p95_cost_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_cost_2/	lineattrs = (color=blue    thickness = 4);
  band    x=cald lower=p5_cost_2 	upper=p95_cost_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prop_w_vlg1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1   by 0.1  ) valueattrs=(size=10);

label p50_prop_w_vlg1_0 = "option 0";
label p50_prop_w_vlg1_1 = "option_1";
label p50_prop_w_vlg1_2 = "option_2";
label p50_prop_w_vlg1_3 = "option_3";
label p50_prop_w_vlg1_4 = "option_4";
label p50_prop_w_vlg1_5 = "option_5";

  series  x=cald y=p50_prop_w_vlg1_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_0 	upper=p95_prop_w_vlg1_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_1 	upper=p95_prop_w_vlg1_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_2 	upper=p95_prop_w_vlg1_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_3 	upper=p95_prop_w_vlg1_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_4 	upper=p95_prop_w_vlg1_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_prop_w_vlg1_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_prop_w_vlg1_5 	upper=p95_prop_w_vlg1_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;

*/
