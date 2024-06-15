

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\hiv_program_effects\hiv_program_effects_f_out\";

footnote;

proc printto ;

* ods html close;

data b;
set a.l_hpe_f;

p_onart_vl1000_all = .;

* NB: note lines below, because variable names cannot end with a number;
log_gender_r_newp  = log(gender_r_newp);

n_cd4_lt200_ = n_cd4_lt200;

p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;  
n_dead_hivpos_cause1_ = n_dead_hivpos_cause1;
p_elig_prep_any_msm_1564_ = p_elig_prep_any_msm_1564;
n_onprep = n_onprep_w + n_onprep_m ;

loggender_r_newp = log(gender_r_newp+0.0001);

logw15r = log(w15r+0.0001);
logw25r = log(w25r+0.0001);
logw35r = log(w35r+0.0001);
logw45r = log(w45r+0.0001);
logw55r = log(w55r+0.0001);
logm15r = log(m15r+0.0001);
logm25r = log(m25r+0.0001);
logm35r = log(m35r+0.0001);
logm45r = log(m45r+0.0001);
logm55r = log(m55r+0.0001);

incidence1564_ = incidence1564;


ods html;


* art retention ;
* title 'Effects of changes in art retention ';
* if option ge 3 then delete;

* vmmc ;
* title 'Effects of changes in vmmc ';
* if option in (1 2 5 6 7 8 9) then delete;
* if option = 4 then option = 1;
* if option = 3 then option = 2;

* long acting treatment ;
* title 'Effects of changes in long acting ART';
  if option in (1 2 3 4 6 7 8 9) then delete;
  if option = 5 then option = 1;

* long acting prep options ;
* title 'Effects of changes in PrEP ';
*  if option in (1 2 3 4 5 8 9) then delete;
*  if option = 6 then option = 2;
*  if option = 7 then option = 1;

* testing  ;
* title 'Effects of changes in testing programme';
*  if option in (1 2 3 4 5 6 7) then delete;
*  if option = 8 then option = 1;
*  if option = 9 then option = 2;





proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means         max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  276 ;
%let year_end = 2036.00 ;
run;
proc sort;by cald option ;run;



*** macros      for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option ne 0 then delete;

%let var =  

n_tested p_mcirc
prevalence1549m
prevalence1549w
incidence1549m
incidence1549w
p_diag
p_onart_diag
p_onart_vl1000_
p_vl1000_
prevalence_vg1000_
prop_elig_on_prep
n_death_hiv

/*

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m	  n_prep_elig_w  n_prep_elig_m	 n_onprep_w  n_onprep_m n_onprep  n_newp_ge1_w
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence_vg1000_   
incidence1564_  incidence1564m incidence1564w incidence1549m incidence1549w n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart_m n_onart_w n_onart n_dead_hivpos_cause1_ n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed n_hiv  n_infected 
 p_inf_msm p_inf_pwid

n_alive_msm	 n_alive1564_msm incidence1549msm incidence1564msm  prevalence1549_msm	prevalence1564_msm  p_elig_prep_any_msm_1564_ p_onprep_msm				
 p_onart_msm   prevalence_vg1000_msm	 p_diag_msm	 p_onart_diag_msm p_vl1000_art_gt6m_msm	 p_ever_tested_msm 		
 p_tested_this_period_msm p_msm_infected_from_msm   n_alive1564_msm   prevalence_pwid  n_pwid  p_onprep_pwid  p_onart_pwid  p_onart_sw
 n_vm_per_year
*/

;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p2p5_var = p2p5_&var_0;
%let p97p5_var = p97p5_&var_0;
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
p2p5_&varb._0  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._0 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);
mean_&varb._0 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 p2p5_&varb._0 p97p5_&varb._0 mean_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;



data option_1;
set b;
if option ne 1  then delete;

%let var =  

n_tested p_mcirc
prevalence1549m
prevalence1549w
incidence1549m
incidence1549w
p_diag
p_onart_diag
p_onart_vl1000_
p_vl1000_
prevalence_vg1000_
prop_elig_on_prep
n_death_hiv

;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p2p5_var = p2p5_&var_1;
%let p97p5_var = p97p5_&var_1;
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
p2p5_&varb._1  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._1 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);
mean_&varb._1 = mean(of &varb.1-&varb.&nfit);


keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1 p2p5_&varb._1 p97p5_&varb._1 mean_&varb._1;
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

%let var = n_tested p_mcirc        
prevalence1549m
prevalence1549w
incidence1549m
incidence1549w
p_diag
p_onart_diag
p_onart_vl1000_
p_vl1000_
prevalence_vg1000_
prop_elig_on_prep
n_death_hiv

; 


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




data d; * this is number of variables in %let var = above ;
merge 
g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12 g13

h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13

i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13
;

by cald;




ods html;


ods graphics / reset imagefmt=jpeg height=4in width=6in; 
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 


proc sgplot data=d; 
Title    height=1.5 justify=center "number people tested per 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

label p50_n_tested_0 = "status quo (median) ";
label p50_n_tested_1 = "increase program (median) ";
label p50_n_tested_2 = "decrease program (median) ";

series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_n_tested_2 	upper=p95_n_tested_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0.4 to 0.7 by 0.1) valueattrs=(size=10);

label p50_p_mcirc_0 = "status quo (median) ";
label p50_p_mcirc_1 = "increase program (median) ";
label p50_p_mcirc_2 = "decrease program (median) ";

series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_mcirc_1 	upper=p95_p_mcirc_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_p_mcirc_2 	upper=p95_p_mcirc_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";


proc sgplot data=d; 
Title    height=1.5 justify=center "Of people eligible for PrEP, proportion on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_prop_elig_on_prep_0 = "status quo (median) ";
label p50_prop_elig_on_prep_1 = "increase program (median) ";
label p50_prop_elig_on_prep_2 = "decrease program (median) ";

series  x=cald y=p50_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_elig_on_prep_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_1 	upper=p95_prop_elig_on_prep_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_elig_on_prep_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_2 	upper=p95_prop_elig_on_prep_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";


proc sgplot data=d; 
Title    height=1.5 justify=center "HIV prevalence in men aged 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.4     by 0.05  ) valueattrs=(size=10);

label p50_prevalence1549m_0 = "status quo (median) ";
label p50_prevalence1549m_1 = "increase program (median) ";
label p50_prevalence1549m_2 = "decrease program (median) ";

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_prevalence1549m_2 	upper=p95_prevalence1549m_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";




proc sgplot data=d; 
Title    height=1.5 justify=center "HIV prevalence in women aged 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.4     by 0.05  ) valueattrs=(size=10);

label p50_prevalence1549w_0 = "status quo (median) ";
label p50_prevalence1549w_1 = "increase program (median) ";
label p50_prevalence1549w_2 = "decrease program (median) ";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_prevalence1549w_2 	upper=p95_prevalence1549w_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";




proc sgplot data=d; 
Title    height=1.5 justify=center "HIV incidence in men aged 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1.5   by 0.05  ) valueattrs=(size=10);

label p50_incidence1549m_0 = "status quo (median) ";
label p50_incidence1549m_1 = "increase program (median) ";
label p50_incidence1549m_2 = "decrease program (median) ";

series  x=cald y=p50_incidence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549m_1 	upper=p95_incidence1549m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549m_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_incidence1549m_2 	upper=p95_incidence1549m_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";




proc sgplot data=d; 
Title    height=1.5 justify=center "HIV incidence in women aged 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1.5   by 0.05  ) valueattrs=(size=10);

label p50_incidence1549w_0 = "status quo (median) ";
label p50_incidence1549w_1 = "increase program (median) ";
label p50_incidence1549w_2 = "decrease program (median) ";

series  x=cald y=p50_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549w_1 	upper=p95_incidence1549w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549w_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_incidence1549w_2 	upper=p95_incidence1549w_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";




proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of PLHIV who are diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_0 = "status quo (median) ";
label p50_p_diag_1 = "increase program (median) ";
label p50_p_diag_2 = "decrease program (median) ";

series  x=cald y=p50_p_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_p_diag_2 	upper=p95_p_diag_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";




proc sgplot data=d; 
Title    height=1.5 justify=center "Of people living with diagnosed HIV, proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_0 = "status quo (median) ";
label p50_p_onart_diag_1 = "increase program (median) ";
label p50_p_onart_diag_2 = "decrease program (median) ";

series  x=cald y=p50_p_onart_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_0 	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_diag_1 	upper=p95_p_onart_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_p_onart_diag_2 	upper=p95_p_onart_diag_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";



proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on ART, proportion with VL < 1000 copies/mL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "status quo (median) ";
label p50_p_onart_vl1000__1 = "increase program (median) ";
label p50_p_onart_vl1000__2 = "decrease program (median) ";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__2 	upper=p95_p_onart_vl1000__2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";



proc sgplot data=d; 
Title    height=1.5 justify=center "Of all PLHIV proportion with VL < 1000 copies/mL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "status quo (median) ";
label p50_p_vl1000__1 = "increase program (median) ";
label p50_p_vl1000__2 = "decrease program (median) ";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vl1000__2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_p_vl1000__2 	upper=p95_p_vl1000__2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence of unsuppressed HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.10 by 0.01) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "status quo (median) ";
label p50_prevalence_vg1000__1 = "increase program (median) ";
label p50_prevalence_vg1000__2 = "decrease program (median) ";

series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_vg1000__2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__2 	upper=p95_prevalence_vg1000__2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";




proc sgplot data=d; 
Title    height=1.5 justify=center "Number of deaths in PLHIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000 by 5000) valueattrs=(size=10);

label p50_n_death_hiv_0 = "status quo (median) ";
label p50_n_death_hiv_1 = "increase program (median) ";
label p50_n_death_hiv_2 = "decrease program (median) ";

series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_hiv_2/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_n_death_hiv_2 	upper=p95_n_death_hiv_2  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";

run;


ods html close;



