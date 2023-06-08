

* used for submitted manuscript;


***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\intensive3\";

  proc printto ; * log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";

ods html close;

data b;
set a.intensive3_u_l;

n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
prevalence1549_ = prevalence1549;
p_onart_vl1000_ = p_onart_vl1000;
prevalence_vg1000_ = prevalence_vg1000;
p_vl1000_ = p_vl1000;
p_onart_vl1000_ = p_onart_vl1000;

%let single_var =  n_tested                      ;

* p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary  test_prop_positive p_diag_sw  p_onart_diag_sw  p_onart_vl1000_sw 
n_undiag p_mcirc 
prop_w_vlg1  prop_m_vlg2  prop_m_vlg3  prop_m_vlg4  prop_m_vlg5 prop_m_vlg6 
prop_w_vlg1  prop_w_vlg2  prop_w_vlg3  prop_w_vlg4  prop_w_vlg5 prop_w_vlg6
;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 600   ;
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

%let var = &single_var   ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;



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

%let var = &single_var   ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;


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
      delete  jj&count;quit;run;
%end;
%mend;


%option_3;
run;






data option_4;
set b;
if option =  4 ;

%let var = &single_var   ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_4;
%let p25_var = p25_&var_4;
%let p75_var = p75_&var_4;
%let p5_var = p5_&var_4;
%let p95_var = p95_&var_4;
%let p50_var = median_&var_4;
%let mean_var = mean_&var_4;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_4 out=k&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data k&count;set k&count;***creates one dataset per variable;
p25_&varb._4  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._4 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._4  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._4 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._4 = median(of &varb.1-&varb.&nfit);
mean_&varb._4 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._4 p95_&varb._4 p50_&varb._4 p25_&varb._4 p75_&varb._4 mean_&varb._4;
run;

      proc datasets nodetails nowarn nolist; 
      delete  kk&count;quit;run;
%end;
%mend;


%option_4;
run;






data option_5;
set b;
if option =  5 ;

%let var = &single_var   ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_5;
%let p25_var = p25_&var_5;
%let p75_var = p75_&var_5;
%let p5_var = p5_&var_5;
%let p95_var = p95_&var_5;
%let p50_var = median_&var_5;
%let mean_var = mean_&var_5;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_5 out=l&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data l&count;set l&count;***creates one dataset per variable;
p25_&varb._5  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._5 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._5  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._5 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._5 = median(of &varb.1-&varb.&nfit);
mean_&varb._5 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._5 p95_&varb._5 p50_&varb._5 p25_&varb._5 p75_&varb._5 mean_&varb._5;
run;

      proc datasets nodetails nowarn nolist; 
      delete  ll&count;quit;run;
%end;
%mend;


%option_5;
run;











data d; * this is number of variables in %let var = above ;
merge g1  h1 i1  j1 k1 l1 ;
by cald;


proc print; run;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;

/*

ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "Number alive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000   by 1000000 ) valueattrs=(size=10);

label p50_n_alive_0 = "option 0";
label p50_n_alive_1 = "option_1";
label p50_n_alive_2 = "option_2";
label p50_n_alive_3 = "option_3";
label p50_n_alive_4 = "option_4";
label p50_n_alive_5 = "option_5";

  series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 1);
  band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_1/	lineattrs = (color=green  thickness = 1);
  band    x=cald lower=p5_n_alive_1 	upper=p95_n_alive_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_2/	lineattrs = (color=red    thickness = 1);
  band    x=cald lower=p5_n_alive_2 	upper=p95_n_alive_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_3/	lineattrs = (color=yellow thickness = 1);
  band    x=cald lower=p5_n_alive_3 	upper=p95_n_alive_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_4/	lineattrs = (color=blue  thickness = 1);
  band    x=cald lower=p5_n_alive_4 	upper=p95_n_alive_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_alive_5/	lineattrs = (color=purple thickness = 1);
  band    x=cald lower=p5_n_alive_5 	upper=p95_n_alive_5  / transparency=0.9 fillattrs = (color=purple) legendlabel= "90% range";

run;quit;

ods html close;

*/

ods html;
proc sgplot data=d ; 
Title    height=1.5 justify=center "Number of people tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000   by 1000000 ) valueattrs=(size=10);

label p50_n_tested_0 = "option 0";
label p50_n_tested_1 = "option_1";
label p50_n_tested_2 = "option_2";
label p50_n_tested_3 = "option_3";
label p50_n_tested_4 = "option_4";
label p50_n_tested_5 = "option_5";

  series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 1);
  band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_1/	lineattrs = (color=green  thickness = 1);
  band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_2/	lineattrs = (color=red    thickness = 1);
  band    x=cald lower=p5_n_tested_2 	upper=p95_n_tested_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_3/	lineattrs = (color=yellow thickness = 1);
  band    x=cald lower=p5_n_tested_3 	upper=p95_n_tested_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_4/	lineattrs = (color=blue  thickness = 1);
  band    x=cald lower=p5_n_tested_4 	upper=p95_n_tested_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_tested_5/	lineattrs = (color=purple thickness = 1);
  band    x=cald lower=p5_n_tested_5 	upper=p95_n_tested_5  / transparency=0.9 fillattrs = (color=purple) legendlabel= "90% range";

run;quit;

ods html close;

/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_0 = "option 0";
label p50_p_onart_1 = "option_1";
label p50_p_onart_2 = "option_2";
label p50_p_onart_3 = "option_3";
label p50_p_onart_4 = "option_4";
label p50_p_onart_5 = "option_5";

  series  x=cald y=p50_p_onart_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_0 	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_onart_1 	upper=p95_p_onart_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_p_onart_2 	upper=p95_p_onart_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_onart_3 	upper=p95_p_onart_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_4/	lineattrs = (color=blue  thickness = 4);
  band    x=cald lower=p5_p_onart_4 	upper=p95_p_onart_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_onart_5 	upper=p95_p_onart_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2030 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_vl1000__0 = "option 0";
label p50_p_vl1000__1 = "option_1";
label p50_p_vl1000__2 = "option_2";
label p50_p_vl1000__3 = "option_3";
label p50_p_vl1000__4 = "option_4";
label p50_p_vl1000__5 = "option_5";

  series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__2/	lineattrs = (color=red   thickness = 4);
  band    x=cald lower=p5_p_vl1000__2 	upper=p95_p_vl1000__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_vl1000__3 	upper=p95_p_vl1000__3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__4/	lineattrs = (color=blue  thickness = 4);
  band    x=cald lower=p5_p_vl1000__4 	upper=p95_p_vl1000__4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_vl1000__5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_vl1000__5 	upper=p95_p_vl1000__5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


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
proc sgplot data=d; 
Title    height=1.5 justify=center "incidence";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.6   by 0.05 ) valueattrs=(size=10);

label mean_incidence1549__0 = "option 0";
label mean_incidence1549__1 = "option_1";
label mean_incidence1549__2 = "option_2";
label mean_incidence1549__3 = "option_3";
label mean_incidence1549__4 = "option_4";
label mean_incidence1549__5 = "option_5";

  series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=mean_incidence1549__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=mean_incidence1549__2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=mean_incidence1549__3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=mean_incidence1549__4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_incidence1549__4 	upper=p95_incidence1549__4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=mean_incidence1549__5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_incidence1549__5 	upper=p95_incidence1549__5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prevalence1549__0 = "option 0";
label p50_prevalence1549__1 = "option_1";
label p50_prevalence1549__2 = "option_2";
label p50_prevalence1549__3 = "option_3";
label p50_prevalence1549__4 = "option_4";
label p50_prevalence1549__5 = "option_5";

  series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_prevalence1549__2 	upper=p95_prevalence1549__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_prevalence1549__3 	upper=p95_prevalence1549__3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_prevalence1549__4 	upper=p95_prevalence1549__4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_prevalence1549__5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_prevalence1549__5 	upper=p95_prevalence1549__5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2040 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.03  by 0.005 ) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "option 0";
label p50_prevalence_vg1000__1 = "option_1";
label p50_prevalence_vg1000__2 = "option_2";
label p50_prevalence_vg1000__3 = "option_3";
label p50_prevalence_vg1000__4 = "option_4";
label p50_prevalence_vg1000__5 = "option_5";

  series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__2 	upper=p95_prevalence_vg1000__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__3 	upper=p95_prevalence_vg1000__3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__4 	upper=p95_prevalence_vg1000__4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_prevalence_vg1000__5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_prevalence_vg1000__5 	upper=p95_prevalence_vg1000__5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_any";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000  by 10000 ) valueattrs=(size=10);

label p50_n_prep_any_0 = "option 0";
label p50_n_prep_any_1 = "option_1";
label p50_n_prep_any_2 = "option_2";
label p50_n_prep_any_3 = "option_3";
label p50_n_prep_any_4 = "option_4";
label p50_n_prep_any_5 = "option_5";

  series  x=cald y=p50_n_prep_any_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_prep_any_0 	upper=p95_n_prep_any_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_prep_any_1 	upper=p95_n_prep_any_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_n_prep_any_2 	upper=p95_n_prep_any_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_n_prep_any_3 	upper=p95_n_prep_any_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_prep_any_4 	upper=p95_n_prep_any_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_prep_any_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_n_prep_any_5 	upper=p95_n_prep_any_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.8 to 1   by 0.01 ) valueattrs=(size=10);

label p50_p_diag_0 = "option 0";
label p50_p_diag_1 = "option_1";
label p50_p_diag_2 = "option_2";
label p50_p_diag_3 = "option_3";
label p50_p_diag_4 = "option_4";
label p50_p_diag_5 = "option_5";

  series  x=cald y=p50_p_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_diag_2 	upper=p95_p_diag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_diag_3 	upper=p95_p_diag_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_diag_4 	upper=p95_p_diag_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_diag_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_diag_5 	upper=p95_p_diag_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.5 to 1   by 0.05 ) valueattrs=(size=10);

label p50_p_onart_diag_0 = "option 0";
label p50_p_onart_diag_1 = "option_1";
label p50_p_onart_diag_2 = "option_2";
label p50_p_onart_diag_3 = "option_3";
label p50_p_onart_diag_4 = "option_4";
label p50_p_onart_diag_5 = "option_5";

  series  x=cald y=p50_p_onart_diag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_diag_0 	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_onart_diag_1 	upper=p95_p_onart_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_onart_diag_2 	upper=p95_p_onart_diag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_onart_diag_3 	upper=p95_p_onart_diag_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_onart_diag_4 	upper=p95_p_onart_diag_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_diag_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_onart_diag_5 	upper=p95_p_onart_diag_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of those on ART, proportion with vl < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2030 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.9 to 1   by 0.01 ) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "option 0";
label p50_p_onart_vl1000__1 = "option_1";
label p50_p_onart_vl1000__2 = "option_2";
label p50_p_onart_vl1000__3 = "option_3";
label p50_p_onart_vl1000__4 = "option_4";
label p50_p_onart_vl1000__5 = "option_5";

  series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__2 	upper=p95_p_onart_vl1000__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__3 	upper=p95_p_onart_vl1000__3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__4 	upper=p95_p_onart_vl1000__4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_onart_vl1000__5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_onart_vl1000__5 	upper=p95_p_onart_vl1000__5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


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
Title    height=1.5 justify=center "p inf primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0   to 1   by 0.1  ) valueattrs=(size=10);

label p50_p_inf_primary_0 = "option 0";
label p50_p_inf_primary_1 = "option_1";
label p50_p_inf_primary_2 = "option_2";
label p50_p_inf_primary_3 = "option_3";
label p50_p_inf_primary_4 = "option_4";
label p50_p_inf_primary_5 = "option_5";

  series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_primary_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_primary_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_inf_primary_2 	upper=p95_p_inf_primary_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_primary_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_inf_primary_3 	upper=p95_p_inf_primary_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_primary_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_inf_primary_4 	upper=p95_p_inf_primary_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_inf_primary_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_inf_primary_5 	upper=p95_p_inf_primary_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


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
label p50_test_prop_positive_4 = "option_4";
label p50_test_prop_positive_5 = "option_5";

  series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_test_prop_positive_1 	upper=p95_test_prop_positive_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_test_prop_positive_2 	upper=p95_test_prop_positive_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_test_prop_positive_3 	upper=p95_test_prop_positive_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_test_prop_positive_4 	upper=p95_test_prop_positive_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_test_prop_positive_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_test_prop_positive_5 	upper=p95_test_prop_positive_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


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
label p50_n_undiag_3 = "option_3";
label p50_n_undiag_4 = "option_4";
label p50_n_undiag_5 = "option_5";

  series  x=cald y=p50_n_undiag_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_undiag_0 	upper=p95_n_undiag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_undiag_1 	upper=p95_n_undiag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_n_undiag_2 	upper=p95_n_undiag_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_n_undiag_3 	upper=p95_n_undiag_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_undiag_4 	upper=p95_n_undiag_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_undiag_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_n_undiag_5 	upper=p95_n_undiag_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

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
label p50_p_mcirc_4 = "option_4";
label p50_p_mcirc_5 = "option_5";

  series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_p_mcirc_1 	upper=p95_p_mcirc_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_p_mcirc_2 	upper=p95_p_mcirc_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_p_mcirc_3 	upper=p95_p_mcirc_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_p_mcirc_4 	upper=p95_p_mcirc_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_p_mcirc_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_p_mcirc_5 	upper=p95_p_mcirc_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";


run;quit;

ods html close;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2070 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000  by  5000 ) valueattrs=(size=10);

label p50_n_death_hiv_0 = "option 0";
label p50_n_death_hiv_1 = "option_1";
label p50_n_death_hiv_2 = "option_2";
label p50_n_death_hiv_3 = "option_3";
label p50_n_death_hiv_4 = "option_4";
label p50_n_death_hiv_5 = "option_5";

  series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_n_death_hiv_2 	upper=p95_n_death_hiv_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_n_death_hiv_3 	upper=p95_n_death_hiv_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_death_hiv_4 	upper=p95_n_death_hiv_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_death_hiv_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_n_death_hiv_5 	upper=p95_n_death_hiv_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

run;quit;

ods html close;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2022 to 2025 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000  by  100000 ) valueattrs=(size=10);

label p50_n_hiv_0 = "option 0";
label p50_n_hiv_1 = "option_1";
label p50_n_hiv_2 = "option_2";
label p50_n_hiv_3 = "option_3";
label p50_n_hiv_4 = "option_4";
label p50_n_hiv_5 = "option_5";

  series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 4);
  band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_1/	lineattrs = (color=green thickness = 4);
  band    x=cald lower=p5_n_hiv_1 	upper=p95_n_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_2/	lineattrs = (color=red    thickness = 4);
  band    x=cald lower=p5_n_hiv_2 	upper=p95_n_hiv_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_3/	lineattrs = (color=yellow thickness = 4);
  band    x=cald lower=p5_n_hiv_3 	upper=p95_n_hiv_3  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_4/	lineattrs = (color=blue   thickness = 4);
  band    x=cald lower=p5_n_hiv_4 	upper=p95_n_hiv_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
  series  x=cald y=p50_n_hiv_5/	lineattrs = (color=orange thickness = 4);
  band    x=cald lower=p5_n_hiv_5 	upper=p95_n_hiv_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "90% range";

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
