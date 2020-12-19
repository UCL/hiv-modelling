
* note using tld_prep runs;
  libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\tld_prep";

data wide;    
  set a.wide_prep_22_10_20_5pm_123; 

* to get n = 1000 ;
  if run le 903381561 ;



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
dcost_prep_20_70_1  +      
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
be beyond drug cost: (dcost_prep_20_70_2 / 3) or (dcost_prep_20_70_2  * 100/60) ; 

* checked that this = original dcost that is overwritten - we re-create here so can adjust components;
dcost_20_70_2           =      
dart_cost_y_20_70_2 +       
dcost_prep_20_70_2     +      
(dcost_prep_20_70_2  * (1 *  75)/60) + 
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

d_dcost_prep_20_25_2 = dcost_prep_20_25_2 - dcost_prep_20_25_1 ;
d_dcost_prep_20_70_2 = dcost_prep_20_70_2 - dcost_prep_20_70_1 ;

ndb_500_20_70_2 =  ddaly_all_20_70_2 + (dcost_20_70_2)/0.0005;
ndb_500_20_70_1 =  ddaly_all_20_70_1 + (dcost_20_70_1)/0.0005;

ndb_100_20_70_2 =  ddaly_all_20_70_2 + (dcost_20_70_2)/0.0001;
ndb_100_20_70_1 =  ddaly_all_20_70_1 + (dcost_20_70_1)/0.0001;

* sensitivity analysis;  * TO COMMENT OUT ;
* ndb_500_20_70_2 =  ddaly_all_20_70_2 + (dcost_20_70_2)/0.0001;
* ndb_500_20_70_1 =  ddaly_all_20_70_1 + (dcost_20_70_1)/0.0001;

d_ndb_500_20_70_2 = ndb_500_20_70_2 - ndb_500_20_70_1 ;
d_ndb_100_20_70_2 = ndb_100_20_70_2 - ndb_100_20_70_1 ;

if d_ndb_500_20_70_2 >= 0 then ce_500 = 0; if d_ndb_500_20_70_2 < 0 then ce_500 = 1;
if d_ndb_100_20_70_2 >= 0 then ce_100 = 0; if d_ndb_100_20_70_2 < 0 then ce_100 = 1;

icer_2 = (d_dcost_20_70_2 * 1000000) / (- d_ddaly_all_20_70_2) ; 
if d_ddaly_all_20_70_2 > 0 then icer_2 = 99999;

optimal_standard_prep_ai1=0;
if prep_improvements_ai1 = 1 and incr_adh_pattern_prep_2020_ai1 = 1 and inc_r_test_startprep_2020_ai1 = 1 and incr_r_test_restartprep_2020_ai1 = 1
and decr_r_choose_stop_prep_2020_ai1 = 1 and inc_p_prep_restart_choi_2020_ai1 = 1 and incr_prepuptake_sw_2020_ai1 = 1 and 
incr_prepuptake_pop_2020_ai1 = 1 and expand_prep_to_all_2020_ai1 = 1 and prep_strategy_ai1 = 7 then optimal_standard_prep_ai1=1;

cost_per_test_20 = ( dtest_cost_20 / n_tested_20 ) * 1000000 ; 

d_n_death_hivrel_20_25_2 = n_death_hivrel_20_25_1 - n_death_hivrel_20_25_2 ;
d_n_death_hivrel_20_70_2 = n_death_hivrel_20_70_1 - n_death_hivrel_20_70_2 ;

infections_averted_20_25 = n_infection_20_25_1 - n_infection_20_25_2;
cost_per_infection_averted_20_25 = 1000000 * (max(d_dcost_20_25_2 , 0)) / max(1,infections_averted_20_25) ;

infections_averted_20_70 = n_infection_20_70_1 - n_infection_20_70_2;
cost_per_infection_averted_20_70 = 1000000 * (max(d_dcost_20_70_2 , 0)) / max(1,infections_averted_20_70) ;

r_incidence_20_25_2 =  incidence1549_20_25_2 / incidence1549_20_25_1 ;
r_incidence_20_70_2 =  incidence1549_20_70_2 / incidence1549_20_70_1 ;

d_prevalence1549_mw_20 = prevalence1549w_20 - prevalence1549m_20 ;
l_r_prevalence1549_mw_20 = log( prevalence1549w_20 / prevalence1549m_20) ; 

if 0 < p_newp_ge1_age1549_20 < 0.05 then  p_newp_ge1_age1549_20_g=1; if p_newp_ge1_age1549_20_g=1 then p_newp_ge1_age1549_20_g1=1;else p_newp_ge1_age1549_20_g1=0;
if 0.05 < p_newp_ge1_age1549_20 < 0.10 then  p_newp_ge1_age1549_20_g=2;if p_newp_ge1_age1549_20_g=2 then p_newp_ge1_age1549_20_g2=1;else p_newp_ge1_age1549_20_g2=0;
if 0.10 < p_newp_ge1_age1549_20 < 0.15 then p_newp_ge1_age1549_20_g=3; if p_newp_ge1_age1549_20_g=3 then p_newp_ge1_age1549_20_g3=1;else p_newp_ge1_age1549_20_g3=0;
if 0.15 < p_newp_ge1_age1549_20        then p_newp_ge1_age1549_20_g=4; if p_newp_ge1_age1549_20_g=4 then p_newp_ge1_age1549_20_g4=1;else p_newp_ge1_age1549_20_g4=0;

if 0 < incidence1549_20 < 0.2 then  incidence1549_20_g = 1;  if incidence1549_20_g=1 then incidence1549_20_g1=1;else incidence1549_20_g1=0;
if 0.2 < incidence1549_20 < 0.5 then incidence1549_20_g = 2; if incidence1549_20_g=2 then incidence1549_20_g2=1;else incidence1549_20_g2=0;
if 0.5 < incidence1549_20 < 1.0 then incidence1549_20_g = 3; if incidence1549_20_g=3 then incidence1549_20_g3=1;else incidence1549_20_g3=0;
if 1.0 < incidence1549_20 < 1.5 then incidence1549_20_g = 4; if incidence1549_20_g=4 then incidence1549_20_g4=1;else incidence1549_20_g4=0;
if 1.5 < incidence1549_20       then incidence1549_20_g = 5; if incidence1549_20_g=5 then incidence1549_20_g5=1;else incidence1549_20_g5=0;

ce_500_x = 1 - ce_500 ;
ce_100_x = 1 - ce_100 ;



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
p_newp_sw_20   n_tested_m_20  p_mcirc_1549m_20
p_mcirc_20	 		p_mcirc_1519m_20	p_mcirc_2024m_20	p_mcirc_2529m_20		p_mcirc_3039m_20	p_mcirc_4049m_20 	p_mcirc_50plm_20 
prop_w_1549_sw_20	prop_w_ever_sw_20 	prop_sw_hiv_20 	prop_w_1524_onprep_20  prop_1564_hivneg_onprep_20 	prevalence1549m_20 prevalence1549w_20
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


ods html;
proc means n median p5 p95 data=wide; 
var	p_mcirc_1549m_17 prevalence1549m_17 prevalence1549w_17 prevalence1524m_17 prevalence1524w_17  incidence1549w_17 incidence1549m_17	p_diag_m_17   
p_diag_w_17	p_ai_no_arv_c_nnm_17   p_ai_no_arv_c_rt184m_17  p_ai_no_arv_c_rt65m_17  prop_w_1549_sw_17  prop_1564_hivneg_onprep_17  prop_w_1524_onprep_17 
p_onart_diag_w_17 	p_onart_diag_m_17   p_vl1000_17	p_onart_vl1000_w_17 p_onart_vl1000_m_17 p_onart_cd4_l500_17  p_mcirc_1549m_17  p_startedline2_17  
prop_sw_hiv_17 prop_sw_onprep_17 p_newp_sw_17  n_tested_17 aids_death_rate_17  p_newp_sw_17 p_newp_ge1_age1549_17 av_newp_ge1_non_sw_17 ;
run;
ods html close;

ods html;
proc means n median p5 p95 data=wide; 
var	p_mcirc_1549m_20 prevalence1549m_20 prevalence1549w_20 prevalence1524m_20 prevalence1524w_20  incidence1549w_20 incidence1549m_20	p_diag_m_20   
p_diag_w_20	p_ai_no_arv_c_nnm_20   p_ai_no_arv_c_rt184m_20  p_ai_no_arv_c_rt65m_20  prop_w_1549_sw_20  prop_1564_hivneg_onprep_20  prop_w_1524_onprep_20 
p_onart_diag_w_20 	p_onart_diag_m_20   p_vl1000_20	p_onart_vl1000_w_20 p_onart_vl1000_m_20 p_onart_cd4_l500_20  p_mcirc_1549m_20  p_startedline2_20  
prop_sw_hiv_20 prop_sw_onprep_20 p_newp_sw_20  n_tested_20 aids_death_rate_20  p_newp_sw_20 p_newp_ge1_age1549_20 av_newp_ge1_non_sw_20 ;
run;
ods html close;



proc means p50 p5 p95 p99; var prevalence1524m_20 prevalence1524w_20 prevalence2024m_20 prevalence2024w_20 
prevalence1549m_20 prevalence1549w_20 p_inf_ep_20 p_newp_sw_20 prop_w_1549_sw_20 incidence1549m_20 incidence1549w_20
p_onart_diag_w_20 	p_onart_diag_m_20  p_onart_vl1000_w_20	p_onart_vl1000_m_20 

; 
* where  ych_risk_beh_ep = 0.95;
* where sex_age_mixing_matrix_w=6 and base_rate_sw = 0.001;
* where base_rate_sw = 0.001;
run;

/*

* propose to changet o.. 
* base_rate_sw; r=uniform(0);  if r < 0.40 then base_rate_sw = 0.0005;   if 0.40 <= r < 0.80 then base_rate_sw = 0.001;  
								if 0.80 <= r then base_rate_sw = 0.015;   

and vary fold_tr_newp 

turn continuous like fold_tr_sti into categorical

*/


proc print; var run; where rred_a_p = 1.5; run;

proc glm; class sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w rred_a_p adh_pattern;
model l_r_prevalence1549_mw_20 = 
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p  p_hsb_p rred_a_p newp_factor  eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  adh_pattern  prob_loss_at_diag  pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb  prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat base_rate_sw 
zero_3tc_activity_m184   zero_tdf_activity_k65r   greater_disability_tox 	  greater_tox_zdv / solution;  run;



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


ods html;
proc means data=wide; var  av_prep_eff_non_res_v_20_25_2 ; run; 
ods htm close;


proc means data=wide; var p_efa_20_70_1 p_efa_20_70_2 p_dol_20_70_1 p_dol_20_70_2 p_taz_20_70_1 p_taz_20_70_2 ; run;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_w_1524_onprep_20_25_1  prop_w_1524_onprep_20_25_2 ;  
ods html close;
run;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_1564_hivneg_onprep_20_25_1  prop_1564_hivneg_onprep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var prop_sw_onprep_20_25_1  prop_sw_onprep_20_25_2 ;  
run; 
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_elig_on_prep_20_25_1  prop_elig_on_prep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_newp_this_per_prep_20_25_1  p_newp_this_per_prep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_newp_prep_hivneg_20_25_1  p_newp_prep_hivneg_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_newp_prep_20_25_1  p_newp_prep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_hiv1_prep_20_25_1  p_hiv1_prep_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var n_death_hivrel_20_25_1  n_death_hivrel_20_25_2 d_n_death_hivrel_20_25_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var n_death_hivrel_20_70_1  n_death_hivrel_20_70_2 d_n_death_hivrel_20_70_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var prevalence_vg1000_20_70_1  prevalence_vg1000_20_70_2 ;  
run; 
ods html close;



ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_vlg1000_184m_20_25_1  p_vlg1000_184m_20_25_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_vlg1000_65m_20_25_1  p_vlg1000_65m_20_25_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var incidence1549_20_25_1 incidence1549_20_25_2  r_incidence_20_25_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var incidence1549_20_70_1 incidence1549_20_70_2  r_incidence_20_70_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var      ddaly_all_20_25_1  ddaly_all_20_25_2  d_ddaly_all_20_25_2 d_ndb_500_20_25_2  ndb_500_20_25_2  ndb_500_20_25_1
d_dcost_20_25_2  dcost_20_25_2  dcost_20_25_1  d_dcost_prep_20_25_2  dcost_prep_20_25_1 dcost_prep_20_25_2   ; 
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var      ddaly_all_20_70_1  ddaly_all_20_70_2  d_ddaly_all_20_70_2 d_ndb_500_20_70_2  ndb_500_20_70_2  ndb_500_20_70_1
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
proc means n mean  p5 p95 lclm uclm data=wide; var p_prep_adhg80_20_25_1  p_prep_adhg80_20_25_2 ;  
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
dcost_20_25_1 dcost_20_25_2 
d_dcost_20_25_2  
n_tested_20_25_1 n_tested_20_25_2
n_prep_20_25_1 n_prep_20_25_2
incidence1549_20_25_1 incidence1549_20_25_2 
dvis_cost_20_25_1 dvis_cost_20_25_2 
dtest_cost_20_25_1 dtest_cost_20_25_2
dart_cost_y_20_25_1 dart_cost_y_20_25_2 
dcost_circ_20_25_1 dcost_circ_20_25_2 
dclin_cost_20_25_1 dclin_cost_20_25_2 
dcost_prep_20_25_1 dcost_prep_20_25_2 
dcost_prep_visit_20_25_1 dcost_prep_visit_20_25_2 
p_onart_20_25_1 p_onart_20_25_2 
p_vl1000_20_25_1 p_vl1000_20_25_2 
prevalence_vg1000_20_25_1 prevalence_vg1000_20_25_2 
prev_vg1000_newp_m_20_25_1 prev_vg1000_newp_m_20_25_2 
prev_vg1000_newp_w_20_25_1 prev_vg1000_newp_w_20_25_2 
prop_art_or_prep_20_25_1  prop_art_or_prep_20_25_2
prop_1564_hivneg_onprep_20_25_1  prop_1564_hivneg_onprep_20_25_2
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
proc means n mean lclm uclm p5 p95 data=wide;  
var    d_ddaly_all_20_70_2  d_ndb_500_20_70_2  d_dcost_20_70_2  incidence1549_20_70_1 incidence1549_20_70_2 
dcost_20_70_1   dcost_20_70_2
n_tested_20_70_1 n_tested_20_70_2
n_prep_20_70_1 n_prep_20_70_2
prop_art_or_prep_20_70_1 prop_art_or_prep_20_70_2
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
prop_1564_hivneg_onprep_20_70_1  prop_1564_hivneg_onprep_20_70_2
p_prep_ever_20_70_1 p_prep_ever_20_70_2
p_hiv1_prep_20_70_1 p_hiv1_prep_20_70_2
p_mcirc_1549m_20_70_1 p_mcirc_1549m_20_70_2 
prop_elig_on_prep_20_70_1 prop_elig_on_prep_20_70_2

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
* where 0.00 <= incidence1549_20 < 0.30 ;
* where prop_1564_hivneg_onprep_20_70_2 < 0.10 and incidence1549_20 > 0.30 ;
* where prop_1564_hivneg_onprep_20_70_2 < 0.10 and prevalence1549_20 > 0.05 ;
run; 
ods html close;



* dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dtaz_cost dcost_drug_level_test   dclin_cost dcost_cascade_interventions     dcost_circ dcost_condom_dn dcost_prep_visit  dcost_prep ;


proc univariate; var prop_1564_hivneg_onprep_20_70_2  prevalence1549_20 incidence1549_20; run;



proc sort; by icer_2;
proc print; var ddaly_all_20_70_2   ddaly_all_20_70_1  dcost_20_70_2   dcost_20_70_1  d_dcost_20_70_2  d_ddaly_all_20_70_2  icer_2; 
run;


proc freq data=wide; tables icer_2;
  where prop_1564_hivneg_onprep_20_70_2 < 0.05 and prevalence1549_20 > 0.1 ;
* where prop_1564_hivneg_onprep_20_70_2 < 0.10 and prevalence1549_20 > 0.07 ;
run;

proc univariate; var p_elig_prep_20_25_2  p_newp_ge1_20; run;
proc corr; var p_elig_prep_20_25_2 prop_1564_hivneg_onprep_20_25_2 p_newp_prep_20_25_2 p_newp_ge1_20 ; run;




* model including baseline variables only - to inform scale up of prep programmes ;
proc logistic data=wide; model ce_500_x =  p_newp_ge1_age1549_20_g2 p_newp_ge1_age1549_20_g3  p_newp_ge1_age1549_20_g4 
 incidence1549_20_g1   incidence1549_20_g2   incidence1549_20_g3   incidence1549_20_g4  ;
output out=pred p=phat lower=lcl upper=ucl
          predprob=(individual crossvalidate);
run;

data s; merge pred ; 
proc sort; by p_newp_ge1_age1549_20_g incidence1549_20_g; 
proc print; var p_newp_ge1_age1549_20_g  incidence1549_20_g  phat ; run;


* model including baseline variables only - to inform scale up of prep programmes ;
proc logistic data=wide; 
  model ce_100_x = incidence1549_20 av_newp_ge1_non_sw_20 ;
* model ce_500_x = incidence1549_20 av_newp_ge1_non_sw_20 ;
* av_newp_ge1_non_sw_20 p_newp_ge5_20 p_newp_ge1_age1549_20 prop_1564_hivneg_onprep_20_25_2 p_prep_adhg80_20_25_2  prevalence1549_20 ;
run;


proc corr spearman; var p_newp_ge1_age1549_20 av_newp_ge1_non_sw_20 incidence1549_20 ; run; 

proc freq; tables icer_2; run;


* model including some variables defined base on follow-up - to determine whether prep programmes should continue;
proc logistic data=wide; model ce_500 =  incidence1549_20 av_newp_ge1_non_sw_20 ; * av_newp_ge1_non_sw_20 ;
*  p_newp_ge5_20 p_newp_ge1_age1549_20  p_ai_no_arv_c_rt65m_20  p_inf_newp_20  p_ai_no_arv_c_rt184m_20 av_newp_ge1_non_sw_20; 
* prop_elig_on_prep_20_25_2 p_newp_this_per_prep_20_25_2 p_prep_adhg80_20_25_2 p_newp_prep_hivneg_20_25_2 ;
run;

* model including some variables defined base on follow-up - to determine whether prep programmes should continue;
proc logistic data=wide; model ce_500 =  prop_1564_hivneg_onprep_20_25_2 ;
run;

proc glm; model d_ndb_500_20_70_2 =  incidence1549_20 av_newp_ge1_non_sw_20 prevalence1549_20 ; 
*  p_newp_ge5_20 p_newp_ge1_age1549_20  p_ai_no_arv_c_rt65m_20  p_inf_newp_20  p_ai_no_arv_c_rt184m_20 av_newp_ge1_non_sw_20; 
* prop_elig_on_prep_20_25_2 p_newp_this_per_prep_20_25_2 p_prep_adhg80_20_25_2 p_newp_prep_hivneg_20_25_2 ;
run;  

* s_alive p_w_giv_birth_this_per p_newp_ge1 p_1524_newp_ge1 p_newp_ge5 p_newp_ge1_age1549 gender_r_newp  av_newp_ge1  av_newp_ge1_non_sw
p_newp_sw  n_tested_m   p_tested_past_year_1549m  p_tested_past_year_1549w
p_diag_m1524 p_diag_w1524 p_diag_sw  p_onart_cd4_l200  p_newp_prep
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3039m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_hivneg_onprep prop_sw_onprep  p_prep_adhg80  
p_newp_this_per_prep p_newp_prep_hivneg  n_infection
prevalence1549m prevalence1549w prevalence1549 av_prep_eff_non_res_v
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 			
prevalence1524w prevalence1524m  prevalence_sw
incidence1549 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary mtct_prop
p_diag p_diag_m p_diag_w p_ai_no_arv_c_nnm prop_sw_newp0
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm
p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw
p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524  p_artexp_vl1000  
p_onart_m p_onart_w p_onart_vl1000_w p_onart_vl1000_m  p_onart_vl1000_1524	  p_onart_vl1000_sw
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w  p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly  ddaly_all  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost   dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564  prop_sw_onprep  p_onart 
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000  p_vlg1000_184m p_vlg1000_65m
death_rate  death_rate_hiv death_rate_hiv_m death_rate_hiv_w  p_iime_   p_pime_   p_nnme_  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd ddaly  ddaly_all 
n_birth_with_inf_child  dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe n_tested test_prop_positive p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep  n_covid  n_death_covid n_death n_death_hivrel p_death_hivrel_age_le64 
p_prep_ever  p_hiv1_prep incidence1524w   incidence1524m n_mcirc1549_ n_mcirc1549_3m n_new_inf1549m n_new_inf1549
p_vl1000_art_12m p_vl1000_art_12m_onart ;











* p_newp_ge1_age1549_20  prevalence1549_20 ;
* av_newp_ge1_20 p_mcirc_1549m_20 prevalence1549_20
	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   p_ai_no_arv_c_rt184m_20  
p_ai_no_arv_c_rt65m_20   prop_w_1549_sw_20    prop_1564_hivneg_onprep_20  prop_w_1524_onprep_20  p_onart_diag_w_20 	p_onart_diag_m_20   
p_vl1000_20	p_onart_vl1000_w_20	 p_onart_vl1000_m_20 p_onart_cd4_l500_20  p_mcirc_1549m_20  p_startedline2_20  prop_sw_hiv_20 
prop_sw_onprep_20 p_newp_sw_20  n_tested_20 aids_death_rate_20  p_newp_sw_20 p_newp_ge1_age1549_20  ;  
* incidence1549_20  av_newp_ge1_non_sw_20 p_newp_ge1_age1549_20  p_vl1000_20 prevalence_vg1000_20 p_newp_ge1_age1549_20;
* prop_1564_hivneg_onprep_20_25_2  p_newp_prep_20_25_2 p_newp_ge1_age1549_20; run;




* the issue with prop_1564_hivneg_onprep_20_25_2 as an indicator of cost effectiveness is that in the model it represents the proportion after scale up, 
so is a measure of the proportion eligible while in real life as scale up starts to happen it just reflects the extent of scale up - need a measure
of the proportion of population at risk of HIV in any one period;  


* p_newp_prep_20_25_2 prevalence_vg1000_20  prevalence_vg1000_20
n_tested_20  prevalence1549_20  p_newp_ge1_20  p_startedline2_20 prop_sw_hiv_20 prop_w_1549_sw_20 prop_1564_hivneg_onprep_20_70_2
p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 incidence1549_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_hivneg_onprep_20 p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20
p_onart_cd4_l500_20  p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20
;



proc glm; model d_ddaly_all_20_70_2 = prevalence1549_20  p_newp_ge1_age1549_20  p_vl1000_20	prop_w_1549_sw_20  av_newp_ge1_non_sw_20 ;
* p_newp_prep_20_25_2  ; 
run;

* p_startedline2_20   incidence1549w_20  incidence1549m_20 
p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_hivneg_onprep_20
p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20   p_onart_cd4_l500_20  
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20
;


proc glm; model d_dcost_20_70_2 = incidence1549_20 p_newp_ge1_age1549_20  p_vl1000_20 ;
run;



/*
proc glm; model d_ndb_500_20_70_2 = incidence1549w_20  p_newp_ge1_20  p_startedline2_20 
p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 incidence1549m_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_hivneg_onprep_20
p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20   p_onart_cd4_l500_20  
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20
;
run;
*/


proc univariate; var incidence1549_20 av_newp_ge1_non_sw_20 prevalence1549_20; run;



proc corr; var p_newp_ge1_age1549_20 incidence1549_20 prevalence1549_20 ; run;

proc freq; tables prop_1564_hivneg_onprep_20_25_2 ; run;

proc means median data=wide; var cost_per_infection_averted_20_25  ; where infections_averted_20_25 > 0 ;
run;
 
proc means data=wide; var cost_per_infection_averted_20_70  ; where infections_averted_20_70 > 0 ;
* and 1.50 <= incidence1549_20 < 5.50 ;
run;
 
proc means; var infections_averted_20_25  ; run;



ods html;
proc freq data=wide; tables ce_500_x / nocum norow binomial;
exact binomial; 
* where  0.12 <= p_newp_ge1_age1549_20 < 0.30  ;
* where 0.00 <= p_newp_ge1_age1549_20 < 0.04 and 1.50 <= incidence1549_20 < 9.50 ;
* where  prop_1564_hivneg_onprep_20_25_2  >=  0.043 ;
  where 0.20 <= incidence1549_20 < 0.50 ;
* where 0.00 <= prevalence1549_20 < 0.03 ;
* where 0.15 <= p_newp_ge1_age1549_20 < 0.95 ; 
* where 4.5 <= av_newp_ge1_non_sw_20 <  6.0 ;
run; 
ods html close;


* --------------------------------------------------------------------------------------------------------------;


