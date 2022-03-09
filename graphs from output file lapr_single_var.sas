
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";

  proc printto ; * log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";

data b;
  set a.l_lapr40        ;  

* if hivtest_type_1_init_prep_inj =  1  and hivtest_type_1_prep_inj =  1 ;
* if dol_higher_potency = 0.5;

n_k65m = p_k65m * n_hiv;
p_vl1000_ = p_vl1000;
incidence1549_ = incidence1549;
prevalence1549_ = prevalence1549;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 6000 ;
%let year_end = 2070.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

%let var = n_prep_all ;

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
if option =0 then delete;

%let var = n_prep_all ;
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

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people living with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_p_iime_0 = "no cab-la introduction (median) ";
label p50_p_iime_1 = "cab-la introduction (median) ";

* series  x=cald y=p50_p_iime_0/	lineattrs = (color=black thickness = 2);
  series  x=cald y=mean_p_iime_0/	lineattrs = (color=black  thickness = 2);
band    x=cald lower=p5_p_iime_0 	upper=p95_p_iime_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
* series  x=cald y=p50_p_iime_1/	lineattrs = (color=str thickness = 2);
  series  x=cald y=mean_p_iime_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_iime_1 	upper=p95_p_iime_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html close; 


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of people with tenofovir resistant HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 200000 by 10000) valueattrs=(size=10);

label p50_n_k65m_0 = "no cab-la introduction (median) ";
label p50_n_k65m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_k65m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_k65m_0 	upper=p95_n_k65m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_k65m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_k65m_1 	upper=p95_n_k65m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

*/




proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_prep_all_0 = "no cab-la introduction (median) ";
label p50_n_prep_all_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_prep_all_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_all_0 	upper=p95_n_prep_all_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_prep_all_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_prep_all_1 	upper=p95_n_prep_all_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;
