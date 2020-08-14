

  libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\prep";

data wide;    
* set a.wide_prep_2_8_20_6pm_7_8_20; * if run <=  864400278 ;  * to give 1000 setting scenarios;
* set a.wide_prep_2_8_20_6pm_7_8_20_dis7p; * if run <=  864400278 ;  * to give 1000 setting scenarios;
  set a.wide_prep_13_8_20_4pm_1;



* --------------------------------------------------------------------------------------------------------------;

* general code;

n_sw_1564_16 = round(n_sw_1564_16, 1);
n_sw_1564_19 = round(n_sw_1564_19, 1);


* --------------------------------------------------------------------------------------------------------------;



* --------------------------------------------------------------------------------------------------------------;

* for prep analysis (comment out code for other analyses);

* checked that this = original dcost that is overwritten - we re-create here so can adjust components;
dcost_20_70_1 =      
dart_cost_y_20_70_1 +       
(dcost_prep_20_70_1 / 3)   +      
dcost_prep_visit_20_70_1 +  
dadc_cost_20_70_1   +      
dcd4_cost_20_70_1     +    
dvl_cost_20_70_1    +      
dvis_cost_20_70_1   + 
dwho3_cost_20_70_1    +    
dcot_cost_20_70_1   +       
dtb_cost_20_70_1   +       
dres_cost_20_70_1   +      
dtest_cost_20_70_1  +      
d_t_adh_int_cost_20_70_1 +  
dswitchline_cost_20_70_1 +  
dcost_drug_level_test_20_70_1 +   
dcost_circ_20_70_1  +           
dcost_condom_dn_20_70_1  +      
dcost_child_hiv_20_70_1  +      
dcost_non_aids_pre_death_20_70_1 ; 

* cost of prep deliver from $115 to $75 is implemented as a cut in prep drug cost from $60 to $20 to give the $40 saving - the $40 lower cost would
be beyond drug cost: (dcost_prep_20_70_2 / 3) or (dcost_prep_20_70_1  * 100/60) ; 

* checked that this = original dcost that is overwritten - we re-create here so can adjust components;
dcost_20_70_2           =      
dart_cost_y_20_70_2 +       
(dcost_prep_20_70_2 / 3)    +      
dcost_prep_visit_20_70_2 +  
dadc_cost_20_70_2   +      
dcd4_cost_20_70_2     +    
dvl_cost_20_70_2    +      
dvis_cost_20_70_2   + 
dwho3_cost_20_70_2    +    
dcot_cost_20_70_2   +       
dtb_cost_20_70_2   +       
dres_cost_20_70_2   +      
dtest_cost_20_70_2  +      
d_t_adh_int_cost_20_70_2 +  
dswitchline_cost_20_70_2 +  
dcost_drug_level_test_20_70_2 +   
dcost_circ_20_70_2  +           
dcost_condom_dn_20_70_2  +      
dcost_child_hiv_20_70_2  +      
dcost_non_aids_pre_death_20_70_2 ; 


d_ddaly_all_20_25_2 = ddaly_all_20_25_2 - ddaly_all_20_25_1 ;

d_dcost_20_25_2 = dcost_20_25_2 - dcost_20_25_1 ;

ndb_500_20_25_2 =  ddaly_all_20_25_2 + (dcost_20_25_2)/0.0005;
ndb_500_20_25_1 =  ddaly_all_20_25_1 + (dcost_20_25_1)/0.0005;

d_ndb_500_20_25_2 = ndb_500_20_25_2 - ndb_500_20_25_1 ;

d_ddaly_all_20_70_2 = ddaly_all_20_70_2 - ddaly_all_20_70_1 ;

d_dcost_20_70_2 = dcost_20_70_2 - dcost_20_70_1 ;

d_dcost_prep_20_70_2 = dcost_prep_20_70_2 - dcost_prep_20_70_1 ;

ndb_500_20_70_2 =  ddaly_all_20_70_2 + (dcost_20_70_2)/0.0005;
ndb_500_20_70_1 =  ddaly_all_20_70_1 + (dcost_20_70_1)/0.0005;

* sensitivity analysis;  * TO COMMENT OUT ;
* ndb_500_20_70_2 =  ddaly_all_20_70_2 + (dcost_20_70_2)/0.0001;
* ndb_500_20_70_1 =  ddaly_all_20_70_1 + (dcost_20_70_1)/0.0001;

d_ndb_500_20_70_2 = ndb_500_20_70_2 - ndb_500_20_70_1 ;

if d_ndb_500_20_70_2 >= 0 then ce_500 = 0; if d_ndb_500_20_70_2 < 0 then ce_500 = 1;

icer_2 = (d_dcost_20_70_2 * 1000000) / (- d_ddaly_all_20_70_2) ; 
if d_ddaly_all_20_70_2 > 0 then icer_2 = 99999;

optimal_standard_prep_ai1=0;
if prep_improvements_ai1 = 1 and incr_adh_pattern_prep_2020_ai1 = 1 and inc_r_test_startprep_2020_ai1 = 1 and incr_r_test_restartprep_2020_ai1 = 1
and decr_r_choose_stop_prep_2020_ai1 = 1 and inc_p_prep_restart_choi_2020_ai1 = 1 and incr_prepuptake_sw_2020_ai1 = 1 and 
incr_prepuptake_pop_2020_ai1 = 1 and expand_prep_to_all_2020_ai1 = 1 and prep_strategy_ai1 = 7 then optimal_standard_prep_ai1=1;

cost_per_test_20 = ( dtest_cost_20 / n_tested_20 ) * 1000000 ; 

d_n_death_hivrel_20_70_2 = n_death_hivrel_20_70_1 - n_death_hivrel_20_70_2 ;

infections_averted_20_25 = n_infection_20_25_1 - n_infection_20_25_2;
cost_per_infection_averted_20_25 = 1000000 * (max(d_dcost_20_25_2 , 0)) / max(1,infections_averted_20_25) ;

infections_averted_20_70 = n_infection_20_70_1 - n_infection_20_70_2;
cost_per_infection_averted_20_70 = 1000000 * (max(d_dcost_20_70_2 , 0)) / max(1,infections_averted_20_70) ;

r_incidence_20_25_2 =  incidence1549_20_25_2 / incidence1549_20_25_1 ;
r_incidence_20_70_2 =  incidence1549_20_70_2 / incidence1549_20_70_1 ;

d_prevalence1549_mw_20 = prevalence1549w_20 - prevalence1549m_20 ;
l_r_prevalence1549_mw_20 = log( prevalence1549w_20 / prevalence1549m_20) ;



/*
from create_wide_file_prep :

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dwho3_cost + dcot_cost + dtb_cost+dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test+dcost_cascade_interventions + dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;
*/



* --------------------------------------------------------------------------------------------------------------;



proc freq  data=wide; tables
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p  p_hsb_p  newp_factor  eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  adh_pattern  prob_loss_at_diag  pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb  prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat base_rate_sw 
zero_3tc_activity_m184   zero_tdf_activity_k65r   greater_disability_tox 	  greater_tox_zdv 
;
run;


title '';
proc univariate data=wide;
var s_alive_20			p_w_giv_birth_this_per_20	p_newp_ge1_20  p_newp_ge5_20 
p_newp_sw_20   n_tested_m_20
p_mcirc_20	 		p_mcirc_1519m_20	p_mcirc_2024m_20	p_mcirc_2529m_20		p_mcirc_3039m_20	p_mcirc_4049m_20 	p_mcirc_50plm_20 
prop_w_1549_sw_20	prop_w_ever_sw_20 	prop_sw_hiv_20 	prop_w_1524_onprep_20  prop_1564_onprep_20 	prevalence1549m_20 prevalence1549w_20
prevalence1549_20 
prevalence1519w_20 	prevalence1519m_20 	  prevalence2024w_20 	  prevalence2024m_20 	  prevalence2529w_20 	  prevalence2529m_20   prevalence3034w_20   
prevalence3034m_20 	prevalence3539w_20 	  prevalence3539m_20 	  prevalence4044w_20 	 prevalence4044m_20 	  prevalence4549w_20  prevalence4549m_20 
prevalence_vg1000_20 incidence1549_20 incidence1549w_20  incidence1549m_20 
p_inf_vlsupp_20   p_inf_newp_20   p_inf_ep_20   p_inf_diag_20   p_inf_naive_20 p_inf_primary_20
mtct_prop_20 		p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20    p_artexp_diag_20
p_onart_diag_20	p_onart_diag_w_20 	p_onart_diag_m_20 	p_efa_20 	p_taz_20		p_ten_20 	p_zdv_20	p_dol_20	p_3tc_20 	p_lpr_20 	p_nev_20 
p_onart_vl1000_20   p_vl1000_20		p_vg1000_20 			p_onart_m_20 	p_onart_w_20 
p_onart_vl1000_w_20				p_onart_vl1000_m_20  prev_vg1000_newp_m_20   prev_vg1000_newp_w_20 p_startedline2_20
p_tle_20	 p_tld_20	 p_zld_20	 p_zla_20	 p_otherreg_20	 p_drug_level_test_20	 p_linefail_ge1_20  
r_efa_hiv_20  p_onart_cd4_l500_20  p_onart_cd4_l200_20  p_startedline2_20 prop_art_or_prep_20 n_sw_1564_20 
p_k65m_20 p_m184m_20 p_newp_ge1_20  p_1524_newp_ge1_20;
run;


proc univariate data=wide;
var p_w_giv_birth_this_per_20	p_mcirc_20	p_mcirc_1549m_20 prevalence1549_20 
prevalence1549m_20 prevalence1549w_20 prevalence1524m_20 prevalence1524w_20
prevalence1519w_20 	prevalence1519m_20 	  prevalence2024w_20 	  prevalence2024m_20 	  prevalence2529w_20 	  prevalence2529m_20   prevalence3034w_20   
prevalence3034m_20 	prevalence3539w_20 	  prevalence3539m_20 	  prevalence4044w_20 	 prevalence4044m_20 	  prevalence4549w_20  prevalence4549m_20 
incidence1549m_20 incidence1549w_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	
p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_onprep_20
p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20   p_onart_cd4_l500_20  
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20 incidence1549_20 prop_sw_onprep_20 p_newp_sw_20  n_tested_20 
aids_death_rate_20  death_rate_onart_20 p_newp_ge1_20  p_1524_newp_ge1_20 p_newp_sw_20 ;
run;


/*

proc glm; class sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w ;
model d_prevalence1549_mw_20 = 
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p  p_hsb_p  newp_factor  eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  adh_pattern  prob_loss_at_diag  pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb  prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat base_rate_sw 
zero_3tc_activity_m184   zero_tdf_activity_k65r   greater_disability_tox 	  greater_tox_zdv / solution;  run;

*/


* --------------------------------------------------------------------------------------------------------------;

* prep analysis;

proc univariate data=wide; var cost_per_test_20; run;

proc print data=wide; var  prep_improvements_ai1 incr_adh_pattern_prep_2020_ai1 inc_r_test_startprep_2020_ai1 incr_r_test_restartprep_2020_ai1
decr_r_choose_stop_prep_2020_ai1 inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1 
incr_prepuptake_pop_2020_ai1 expand_prep_to_all_2020_ai1 prep_strategy_ai1 optimal_standard_prep_ai1 pop_wide_tld_2020_ai1 ;
run;

proc freq data=wide; tables
 eff_rate_test_startprep_ai0  	eff_rate_test_restartprep_ai0  	eff_rate_choose_stop_prep_ai0  
eff_prob_prep_restart_choice_ai0  prep_improvements_ai1   incr_adh_pattern_prep_2020_ai1 
inc_r_test_startprep_2020_ai1 	incr_r_test_restartprep_2020_ai1 decr_r_choose_stop_prep_2020_ai1 inc_p_prep_restart_choi_2020_ai1 
incr_prepuptake_sw_2020_ai1  incr_prepuptake_pop_2020_ai1   expand_prep_to_all_2020_ai1  eff_rate_test_startprep_ai1  eff_rate_test_restartprep_ai1  	
eff_rate_choose_stop_prep_ai1  eff_prob_prep_restart_choice_ai1   optimal_standard_prep_ai1 
pop_wide_tld_2020_ai1   optimal_standard_prep_ai1 * pop_wide_tld_2020_ai1 ;
run;

ods html;
proc means data=wide; var n_hiv1_prep_20_70_1 n_hiv1_prep_20_70_2  n_prep_20_70_1 n_prep_20_70_2 ; 
run;
ods html close;

ods html;
proc means data=wide; var  dcost_prep_20_25_1 dcost_prep_20_25_2 ;  
run; 
ods htm close;


proc means data=wide; var p_efa_20_70_1 p_efa_20_70_2 p_dol_20_70_1 p_dol_20_70_2 p_taz_20_70_1 p_taz_20_70_2 ; run;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_w_1524_onprep_20_25_1  prop_w_1524_onprep_20_25_2 ;  
ods html close;
run;

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_1564_onprep_20_25_1  prop_1564_onprep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide;  var prop_sw_onprep_20_25_1  prop_sw_onprep_20_25_2 ;  
run; 
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_elig_on_prep_20_25_1  prop_elig_on_prep_20_25_2 ;  
run; 
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_newp_prep_20_25_1  p_newp_prep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_hiv1_prep_20_25_1  p_hiv1_prep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var n_death_hivrel_20_70_1  n_death_hivrel_20_70_2 d_n_death_hivrel_20_70_2 ;  
run; 
ods html close;

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prevalence_vg1000_20_70_1  prevalence_vg1000_20_70_2 ;  
run; 
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_vlg1000_184m_20_25_1  p_vlg1000_184m_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_vlg1000_65m_20_25_1  p_vlg1000_65m_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var incidence1549_20_25_1 incidence1549_20_25_2  r_incidence_20_25_2 ;  
run; 
ods html close;

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var incidence1549_20_70_1 incidence1549_20_70_2  r_incidence_20_70_2 ;  
run; 
ods html close;


ods html;
proc means data=wide; var      ddaly_all_20_70_1  ddaly_all_20_70_2  d_ddaly_all_20_70_2 d_ndb_500_20_70_2  ndb_500_20_70_2  ndb_500_20_70_1
d_dcost_20_70_2  dcost_20_70_2  dcost_20_70_1  d_dcost_prep_20_70_2  dcost_prep_20_70_1 dcost_prep_20_70_2   ; 
run; 
ods html close;


ods html;
proc means data=wide; var prop_elig_on_prep_20_25_1  prop_elig_on_prep_20_25_2 ;  
run; 
ods htm close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_onart_20_25_1  p_onart_20_25_2 ;  
run; 
ods htm close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_prep_adhg80_20_25_1  p_prep_adhg80_20_25_2 ;  
run; 
ods htm close;





ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_onart_vl1000_20_25_1  p_onart_vl1000_20_25_2 ;  
run; 
ods htm close;




*  p_prep_ever   p_hiv1_prep   incidence1524w   incidence1524m   p_k65m    p_m184m ;


proc univariate data=wide; var prop_elig_on_prep_20_25_2  n_prep_20_70_2   p_newp_ge1_20_70_2; run;

ods html;
proc means data=wide; var    
d_ddaly_all_20_25_2  
d_ndb_500_20_25_2  
d_dcost_20_25_2  
n_tested_20_25_1 n_tested_20_25_2
incidence1549_20_25_1 incidence1549_20_25_2 
dvis_cost_20_25_1 dvis_cost_20_25_2 
dtest_cost_20_25_1 dtest_cost_20_25_2
dart_cost_y_20_25_1 dart_cost_y_20_25_2 
dclin_cost_20_25_1 dclin_cost_20_25_2 
dcost_prep_20_25_1 dcost_prep_20_25_2 
dcost_prep_visit_20_25_1 dcost_prep_visit_20_25_2 
p_onart_20_25_1 p_onart_20_25_2 
p_vl1000_20_25_1 p_vl1000_20_25_2 
prevalence_vg1000_20_25_1 prevalence_vg1000_20_25_2 
prev_vg1000_newp_m_20_25_1 prev_vg1000_newp_m_20_25_2 
prev_vg1000_newp_w_20_25_1 prev_vg1000_newp_w_20_25_2 
prop_art_or_prep_20_25_1  prop_art_or_prep_20_25_2
prop_1564_onprep_20_25_1  prop_1564_onprep_20_25_2
prop_w_1524_onprep_20_25_1 prop_w_1524_onprep_20_25_2
prop_elig_on_prep_20_25_1 prop_elig_on_prep_20_25_2
p_prep_ever_20_25_1 p_prep_ever_20_25_2
p_hiv1_prep_20_25_1 p_hiv1_prep_20_25_2
p_k65m_20_25_1 p_k65m_20_25_2
p_m184m_20_25_1 p_m184m_20_25_2
;
run; 
ods html close;



ods html;
proc means data=wide; var    d_ddaly_all_20_70_2  d_ndb_500_20_70_2  d_dcost_20_70_2  incidence1549_20_70_1 incidence1549_20_70_2 
dcost_20_70_1   dcost_20_70_2
n_tested_20_70_1 n_tested_20_70_2
n_prep_20_70_1 n_prep_20_70_2
dvis_cost_20_70_1 dvis_cost_20_70_2 
dtest_cost_20_70_1 dtest_cost_20_70_2
dart_cost_y_20_70_1 dart_cost_y_20_70_2 
dclin_cost_20_70_1 dclin_cost_20_70_2 
dcost_prep_20_70_1 dcost_prep_20_70_2 
dcost_prep_visit_20_70_1 dcost_prep_visit_20_70_2 
p_onart_20_70_1 p_onart_20_70_2 
p_vl1000_20_70_1 p_vl1000_20_70_2 
prevalence_vg1000_20_70_1 prevalence_vg1000_20_70_2 
prev_vg1000_newp_m_20_70_1 prev_vg1000_newp_m_20_70_2 
prev_vg1000_newp_w_20_70_1 prev_vg1000_newp_w_20_70_2 
prop_art_or_prep_20_25_1  prop_art_or_prep_20_25_2
prop_1564_onprep_20_70_1  prop_1564_onprep_20_70_2
p_prep_ever_20_70_1 p_prep_ever_20_70_2
p_hiv1_prep_20_70_1 p_hiv1_prep_20_70_2

dadc_cost_20_70_1   dadc_cost_20_70_2   
dcd4_cost_20_70_1   dcd4_cost_20_70_2   
dvl_cost_20_70_1   dvl_cost_20_70_2   
dvis_cost_20_70_1  dvis_cost_20_70_2   
dwho3_cost_20_70_1   dwho3_cost_20_70_2   
dcot_cost_20_70_1   dcot_cost_20_70_2   
dtb_cost_20_70_1   dtb_cost_20_70_2   
dres_cost_20_70_1   dres_cost_20_70_2 
dtest_cost_20_70_1  dtest_cost_20_70_2  
d_t_adh_int_cost_20_70_1  d_t_adh_int_cost_20_70_2   
dswitchline_cost_20_70_1 dswitchline_cost_20_70_2
dtaz_cost_20_70_1 dtaz_cost_20_70_2 
dcost_drug_level_test_20_70_1   dcost_drug_level_test_20_70_2   
dclin_cost_20_70_1  dclin_cost_20_70_2   
dcost_circ_20_70_1  dcost_circ_20_70_2
dcost_condom_dn_20_70_1 dcost_condom_dn_20_70_2
dcost_drug_level_test_20_70_1 dcost_drug_level_test_20_70_2  
dcost_child_hiv_20_70_1 dcost_child_hiv_20_70_2
dcost_non_aids_pre_death_20_70_1 dcost_non_aids_pre_death_20_70_2 
;
* where prop_1564_onprep_20_70_2 < 0.10 and incidence1549_20 > 0.30 ;
* where prop_1564_onprep_20_70_2 < 0.10 and prevalence1549_20 > 0.05 ;
run; 
ods html close;



* dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dtaz_cost dcost_drug_level_test   dclin_cost dcost_cascade_interventions     dcost_circ dcost_condom_dn dcost_prep_visit  dcost_prep ;


proc univariate; var prop_1564_onprep_20_70_2  prevalence1549_20 incidence1549_20; run;



proc sort; by icer_2;
proc print; var ddaly_all_20_70_2   ddaly_all_20_70_1  dcost_20_70_2   dcost_20_70_1  d_dcost_20_70_2  d_ddaly_all_20_70_2  icer_2; 
run;


proc freq data=wide; tables icer_2;
  where prop_1564_onprep_20_70_2 < 0.05 and prevalence1549_20 > 0.1 ;
* where prop_1564_onprep_20_70_2 < 0.10 and prevalence1549_20 > 0.07 ;
run;

proc univariate; var p_elig_prep_20_25_2  p_newp_ge1_20; run;
proc corr; var p_elig_prep_20_25_2 prop_1564_onprep_20_25_2 p_newp_prep_20_25_2 p_newp_ge1_20 ; run;


* model including baseline variables only - to inform scale up of prep programmes ;
proc logistic data=wide; model ce_500 =   incidence1549_20  p_newp_ge1_20   ;
run;


* model including some variables defined base on follow-up - to determine whether prep programmes should continue;
proc logistic data=wide; model ce_500 =  prevalence1549_20 p_newp_ge1_20  ;
run;

* the issue with prop_1564_onprep_20_25_2 as an indicator of cost effectiveness is that in the model it represents the proportion after scale up, 
so is a measure of the proportion eligible while in real life as scale up starts to happen it just reflects the extent of scale up - need a measure
of the proportion of population at risk of HIV in any one period;  


* p_newp_prep_20_25_2 prevalence_vg1000_20  prevalence_vg1000_20
n_tested_20  prevalence1549_20  p_newp_ge1_20  p_startedline2_20 prop_sw_hiv_20 prop_w_1549_sw_20 prop_1564_onprep_20_70_2
p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 incidence1549_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_onprep_20 p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20
p_onart_cd4_l500_20  p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20
;



proc glm; model d_ddaly_all_20_70_2 = prevalence1549_20  p_newp_ge1_20  p_vl1000_20	prop_w_1549_sw_20  p_newp_prep_20_25_2  ; 
run;

* p_startedline2_20   incidence1549w_20  incidence1549m_20 
p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_onprep_20
p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20   p_onart_cd4_l500_20  
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20
;


proc glm; model d_dcost_20_70_2 = incidence1549_20 p_newp_ge1_20  p_vl1000_20;
run;



/*
proc glm; model d_ndb_500_20_70_2 = incidence1549w_20  p_newp_ge1_20  p_startedline2_20 
p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 incidence1549m_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_onprep_20
p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20   p_onart_cd4_l500_20  
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20
;
run;
*/



proc freq data=wide; tables ce_500;
* where  0.12 <= p_newp_ge1_20 < 0.30  ;
  where 0.00 <= p_newp_ge1_20 < 0.04 and 1.50 <= incidence1549_20 < 9.50 ;
run; 


proc means data=wide; var cost_per_infection_averted_20_25  ; where infections_averted_20_25 > 0 and
1.50 <= incidence1549_20 < 5.50 ;
run;
 
proc means data=wide; var cost_per_infection_averted_20_70  ; where infections_averted_20_70 > 0 ;
* and 1.50 <= incidence1549_20 < 5.50 ;
run;
 
* --------------------------------------------------------------------------------------------------------------;


