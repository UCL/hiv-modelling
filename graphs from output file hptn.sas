
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";

  proc printto  ; *  log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";

data b;
set a.l_hptn ;

* proc freq; 
* tables run; 
* run; 

* if run = 29427958   ;



prep_adhg80_ = p_prep_adhg80 ;
p_onart_vl1000_all = .;

of_all_o_cab_pr_dur_ge12m = of_all_o_cab_prop_dur_ge12m;

* NB: note lines below, because variable names cannot end with a number;
log_gender_r_newp  = log(gender_r_newp);
prevalence1549_ = prevalence1549;
incidence1549_ = incidence1549;
incidence1564_ = incidence1564;

prop_onprep_newpge1_= prop_onprep_newpge1;

incidence1524w_ = incidence1524w; incidence1524m_ = incidence1524m;
incidence2534w_ = incidence2534w; incidence2534m_ = incidence2534m;
incidence3544w_ = incidence3544w; incidence3544m_ = incidence3544m;
incidence4554w_ = incidence4554w; incidence4554m_ = incidence4554m;
incidence5564w_ = incidence5564w; incidence5564m_ = incidence5564m;

p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;

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

proc means; var 
zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv effect_visit_prob_diag_l  
effect_sw_prog_prep_all  prob_prep_all_restart_choice  prep_all_uptake_pop adh_pattern_prep_oral   rate_test_startprep_all    rate_choose_stop_prep_oral
prep_all_strategy   prob_prep_all_visit_counsel  rate_test_onprep_all  prep_willingness_threshold  prep_all_uptake_pop   prob_prep_all_restart_choice  
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy higher_future_prep_oral_cov  pr_prep_inj_b  prep_inj_efficacy rate_choose_stop_prep_inj   
prep_inj_effect_inm_partner  res_trans_factor_ii  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol  hivtest_type_1_init_prep_inj   
hivtest_type_1_prep_inj sens_testtype3_from_inf_0   sens_testtype3_from_inf_p25  sens_testtype3_from_inf_gep5  sens_testtype1_from_inf_0   
sens_testtype1_from_inf_p25  sens_testtype1_from_inf_gep5  effect_sw_prog_prep_all prob_prep_all_restart_choice dol_higher_potency  
cab_time_to_lower_threshold_g sens_tests_prep_inj  pr_inm_inj_prep_1st_per pref_prep_inj_beta_s1;
where cald=2022.75 and option=1;


proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 10      ;
%let year_end = 2042.75 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives means ranges etc by option;
data option_0;
set b;
if option =1 then delete;

%let var =  

prevalence1549m   prevalence1549w  p_prep_elig_past_year    prop_1564_onprep  p_elig_prep    prop_elig_on_prep    incidence1549_  ;

/*
incidence1524w_ incidence1524m_ incidence2534w_ incidence2534m_ incidence3544w_ incidence3544m_ incidence4554w_ incidence4554m_ 
incidence5564w_ incidence5564m_ n_tested n_tested_m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w  p_vl1000_art_12m
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart n_prep_all n_death_hiv   
prop_elig_on_prep   p_elig_prep   p_hiv1_prep   prop_onprep_newpge1_   p_prep_elig_past_year   p_prep_newp   prop_sw_onprep p_iime
prop_prep_inj    ratio_inj_prep_on_tail          pr_ever_prep_inj_res_cab       pr_ev_prep_inj_res_cab_hiv
prop_cab_res_o_cab    prop_cab_res_tail        prop_prep_inj_at_inf_diag     
of_all_o_cab_prop_dur_3m     of_all_o_cab_prop_dur_6m   of_all_o_cab_prop_dur_9m of_all_o_cab_pr_dur_ge12m
p_prep_inj_hiv  p_prep_adhg80_  n_cur_res_cab  n_cur_res_dol
n_o_cab_at_3m   n_o_cab_at_6m   n_o_cab_at_9m   n_o_cab_at_ge12m
n_emerge_inm_res_cab  n_switch_prep_from_oral  n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_all_start n_prep_oral_start n_prep_inj_start prop_cab_dol_res_attr_cab  
p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail 
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented
n_birth_with_inf_child
;
*/

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
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
mean_&varb._0 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 mean_&varb._0 p25_&varb._0 p75_&varb._0;
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

%let var =  

prevalence1549m prevalence1549w  incidence1549_  p_prep_elig_past_year   prop_1564_onprep  p_elig_prep    prop_elig_on_prep  ;

run;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
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
mean_&varb._1 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._1 p95_&varb._1 mean_&varb._1 p25_&varb._1 p75_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;



data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7    

h1   h2   h3   h4   h5   h6   h7   
;
by cald;



ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label mean_prevalence1549m_0 = "Men no cab-la introduction (mean) ";
label mean_prevalence1549m_1 = "Men cab-la introduction (mean) ";
label mean_prevalence1549w_0 = "Women no cab-la introduction (mean) ";
label mean_prevalence1549w_1 = "Women cab-la introduction (mean) ";

series  x=cald y=mean_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
series  x=cald y=mean_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=cald y=mean_prevalence1549w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=mean_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);

label mean_incidence1549__0 = "no cab-la introduction (mean) ";
label mean_incidence1549__1 = "cab-la introduction (mean) ";

series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";


run;
quit;





ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of adults who had an indication for PrEP in the past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label mean_p_prep_elig_past_year_0 = "no cab-la introduction (mean) ";
label mean_p_prep_elig_past_year_1 = "cab-la introduction (mean) ";

series  x=cald y=mean_p_prep_elig_past_year_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_elig_past_year_0 	upper=p95_p_prep_elig_past_year_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=mean_p_prep_elig_past_year_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_elig_past_year_1 	upper=p95_p_prep_elig_past_year_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;






proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.07   by 0.01 ) valueattrs=(size=10);

label mean_prop_1564_onprep_0 = "no cab-la introduction (mean) ";
label mean_prop_1564_onprep_1 = "cab-la introduction (mean) ";

series  x=cald y=mean_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=mean_prop_1564_onprep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all adults who currently have an indication for PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label mean_p_elig_prep_0 = "no cab-la introduction (mean) ";
label mean_p_elig_prep_1 = "cab-la introduction (mean) ";

series  x=cald y=mean_p_elig_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_prep_0 	upper=p95_p_elig_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=mean_p_elig_prep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_elig_prep_1 	upper=p95_p_elig_prep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;





ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people with an indication for PrEP, proportion who are on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2015 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1) valueattrs=(size=10);

label mean_prop_elig_on_prep_0 = "no cab-la introduction (mean) ";
label mean_prop_elig_on_prep_1 = "cab-la introduction (mean) ";

series  x=cald y=mean_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=mean_prop_elig_on_prep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_1 	upper=p95_prop_elig_on_prep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



