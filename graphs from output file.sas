

* used for submitted manuscript;


***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\intensive3\";

  proc printto ; * log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";

ods html close;

data b;
set a.intensive3_l

* this below is to re-adjust options so that it works for this program below ;
if option in (1, 2) or cald < 2022;
if option=1 then option=0; if option=2 then option=1;
if cald < 2022 then option=0; 


* if hivtest_type_1_init_prep_inj ne 1  and hivtest_type_1_prep_inj ne 1 ;
* if dol_higher_potency = 0.5;

n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
prevalence1549_ = prevalence1549;
p_onart_vl1000_ = p_onart_vl1000;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 2000  ;
%let year_end = 2070.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option ne 0 then delete;

%let var = n_death_hiv ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;

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
if option ne 1 then delete;

%let var = n_death_hiv  ; * p_ai_no_arv_e_inm ; * prevalence1549_ ; * incidence1549_ ;
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



data d; * this is number of variables in %let var = above ;
merge g1   h1 ;
by cald;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods html ;

/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);

label p50_incidence1549__0 = "no cab-la introduction (median) ";
label p50_incidence1549__1 = "cab-la introduction (median) ";

series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";


run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All no cab-la introduction (median) ";
label p50_prevalence1549__1 = "All cab-la introduction (median) ";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit; 



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of ART initiators, proportion with integrase inhibitor resistance";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1       by 0.1  ) valueattrs=(size=10);

label p50_p_ai_no_arv_e_inm_0 = "no cab-la introduction (median) ";
label p50_p_ai_no_arv_e_inm_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_ai_no_arv_e_inm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_e_inm_0 	upper=p95_p_ai_no_arv_e_inm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_ai_no_arv_e_inm_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_e_inm_1 	upper=p95_p_ai_no_arv_e_inm_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on ART, proportion with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0   to 1 by 0.05) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "no cab-la introduction (median) ";
label p50_p_onart_vl1000__1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on ART 12 months from start of ART, proportion with VL < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0   to 1 by 0.05) valueattrs=(size=10);

label p50_p_vl1000_art_12m_onart_0 = "no cab-la introduction (median) ";
label p50_p_vl1000_art_12m_onart_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_vl1000_art_12m_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000_art_12m_onart_0 	upper=p95_p_vl1000_art_12m_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_vl1000_art_12m_onart_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_vl1000_art_12m_onart_1 	upper=p95_p_vl1000_art_12m_onart_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

*/

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of AIDS deaths per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 30000   by 10000 ) valueattrs=(size=10);

label p50_n_death_hiv_0 = "no cab-la introduction (median) ";
label p50_n_death_hiv_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on ART, proportion on atazanavir";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.1) valueattrs=(size=10);

label p50_p_taz_0 = "no cab-la introduction (median) ";
label p50_p_taz_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_taz_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;
ods html close;

*/
