
* note using tld_prep runs;
  libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\tld_prep";

data wide;    
  set a.wide_prep_29_jan_21 ; 

* to give n = 1000 setting scenarios;

if run > 837709993 then delete;



* --------------------------------------------------------------------------------------------------------------;

* general code;

n_sw_1564_16 = round(n_sw_1564_16, 1);
n_sw_1564_19 = round(n_sw_1564_19, 1);


* --------------------------------------------------------------------------------------------------------------;



* --------------------------------------------------------------------------------------------------------------;

* for prep analysis (comment out code for other analyses);

* checked that this = original dcost that is overwritten - we re-create here so can adjust components;
 dcost_21_71_1 =      
dart_cost_y_21_71_1 +       
dcost_prep_21_71_1  +      
dcost_prep_visit_21_71_1 + 
dadc_cost_21_71_1   +      
dcd4_cost_21_71_1     +    
dvl_cost_21_71_1    +      
dvis_cost_21_71_1   + 
dwho3_cost_21_71_1    +    
dcot_cost_21_71_1   +       
dtb_cost_21_71_1   +       
dres_cost_21_71_1   +      
dtest_cost_21_71_1  +      
d_t_adh_int_cost_21_71_1 +  
dswitchline_cost_21_71_1 +  
dcost_drug_level_test_21_71_1 +   
dcost_circ_21_71_1  +           
dcost_condom_dn_21_71_1  +      
dcost_child_hiv_21_71_1  +      
dcost_non_aids_pre_death_21_71_1 ; 

* cost of prep deliver from $115 to $75 is implemented as a cut in prep drug cost from $60 to $20 to give the $40 saving - the $40 lower cost would
be beyond drug cost: (dcost_prep_21_71_2 / 3) or (dcost_prep_21_71_2  * 100/60) ; 

* checked that this = original dcost that is overwritten - we re-create here so can adjust components;
 dcost_21_71_2           =      
dart_cost_y_21_71_2 +       
(dcost_prep_21_71_2  * 1 *  60 / 60 ) +
(dcost_prep_visit_21_71_2 * 1)     + 
dadc_cost_21_71_2   +      
dcd4_cost_21_71_2     +    
dvl_cost_21_71_2    +      
dvis_cost_21_71_2   + 
dwho3_cost_21_71_2    +    
dcot_cost_21_71_2   +       
dtb_cost_21_71_2   +       
dres_cost_21_71_2   +      
dtest_cost_21_71_2  +      
d_t_adh_int_cost_21_71_2 +  
dswitchline_cost_21_71_2 +  
dcost_drug_level_test_21_71_2 +   
dcost_circ_21_71_2  +           
dcost_condom_dn_21_71_2  +      
dcost_child_hiv_21_71_2  +      
dcost_non_aids_pre_death_21_71_2 ; 


dtotcost_prep_21_26_1 = dcost_prep_21_26_1  + dcost_prep_visit_21_26_1 ;
dtotcost_prep_21_26_2 = dcost_prep_21_26_2  + dcost_prep_visit_21_26_2 ;       

dtotcost_prep_21_71_1 = dcost_prep_21_71_1  + dcost_prep_visit_21_71_1 ;
dtotcost_prep_21_71_2 = dcost_prep_21_71_2  + dcost_prep_visit_21_71_2 ;       

d_dtotcost_prep_21_26_2 = dtotcost_prep_21_26_2 - dtotcost_prep_21_26_1 ; 
d_dtotcost_prep_21_71_2 = dtotcost_prep_21_71_2 - dtotcost_prep_21_71_1 ; 

d_p_prep_newp_21_26_2  = p_prep_newp_21_26_2 - p_prep_newp_21_26_1;
d_prop_1564m_onprep_21_26_2  = prop_1564m_onprep_21_26_2 - prop_1564m_onprep_21_26_1 ;
d_prop_1564w_onprep_21_26_2  = prop_1564w_onprep_21_26_2 - prop_1564w_onprep_21_26_1 ;
d_p_prep_elig_past_year_21_26_2   = p_prep_elig_past_year_21_26_2 - p_prep_elig_past_year_21_26_1 ;
d_p_prep_elig_past_5year_21_26_2   = p_prep_elig_past_5year_21_26_2 - p_prep_elig_past_5year_21_26_1;  

d_mean_newp_ppers_prep_21_26_2  = mean_newp_ppers_prep_21_26_2 - mean_newp_ppers_prep_21_26_1 ;

d_ddaly_all_21_26_2 = ddaly_all_21_26_2 - ddaly_all_21_26_1 ;

d_dcost_21_26_2 = dcost_21_26_2 - dcost_21_26_1 ;

d_dcost_clin_care_21_71_2 = dcost_clin_care_21_71_2 - dcost_clin_care_21_71_1;

ndb_500_21_26_2 =  ddaly_all_21_26_2 + (dcost_21_26_2)/0.0005;
ndb_500_21_26_1 =  ddaly_all_21_26_1 + (dcost_21_26_1)/0.0005;

d_ndb_500_21_26_2 = ndb_500_21_26_2 - ndb_500_21_26_1 ;

d_ddaly_all_21_71_2 = ddaly_all_21_71_2 - ddaly_all_21_71_1 ;

d_dcost_21_71_2 = dcost_21_71_2 - dcost_21_71_1 ;

d_dcost_prep_21_26_2 = dcost_prep_21_26_2 - dcost_prep_21_26_1 ;
d_dcost_prep_21_71_2 = dcost_prep_21_71_2 - dcost_prep_21_71_1 ;

ndb_500_21_71_2 =  ddaly_all_21_71_2 + (dcost_21_71_2)/0.0005;
ndb_500_21_71_1 =  ddaly_all_21_71_1 + (dcost_21_71_1)/0.0005;

ndb_100_21_71_2 =  ddaly_all_21_71_2 + (dcost_21_71_2)/0.0001;
ndb_100_21_71_1 =  ddaly_all_21_71_1 + (dcost_21_71_1)/0.0001;


* sensitivity analysis;  * TO COMMENT OUT ;
* ndb_500_21_71_2 =  ddaly_all_21_71_2 + (dcost_21_71_2)/0.0001;
* ndb_500_21_71_1 =  ddaly_all_21_71_1 + (dcost_21_71_1)/0.0001;

d_ndb_500_21_71_2 = ndb_500_21_71_2 - ndb_500_21_71_1 ;
d_ndb_100_21_71_2 = ndb_100_21_71_2 - ndb_100_21_71_1 ;

if d_ndb_500_21_71_2 >= 0 then ce_500 = 0; if d_ndb_500_21_71_2 < 0 then ce_500 = 1;
if d_ndb_100_21_71_2 >= 0 then ce_100 = 0; if d_ndb_100_21_71_2 < 0 then ce_100 = 1;

icer_2 = (d_dcost_21_71_2 * 1000000) / (- d_ddaly_all_21_71_2) ; 
if d_ddaly_all_21_71_2 > 0 then icer_2 = 99999;

optimal_standard_prep_ai1=0;
if prep_improvements_ai1 = 1 and incr_adh_pattern_prep_2020_ai1 = 1 and inc_r_test_startprep_2020_ai1 = 1 and incr_r_test_restartprep_2020_ai1 = 1
and decr_r_choose_stop_prep_2020_ai1 = 1 and inc_p_prep_restart_choi_2020_ai1 = 1 and incr_prepuptake_sw_2020_ai1 = 1 and 
incr_prepuptake_pop_2020_ai1 = 1 and expand_prep_to_all_2020_ai1 = 1 and prep_strategy_ai1 = 7 then optimal_standard_prep_ai1=1;

cost_per_test_20 = ( dtest_cost_20 / n_tested_20 ) * 1000000 ; 

d_n_death_hivrel_21_26_2 = n_death_hivrel_21_26_1 - n_death_hivrel_21_26_2 ;
d_n_death_hivrel_21_71_2 = n_death_hivrel_21_71_1 - n_death_hivrel_21_71_2 ;

infections_averted_21_26 = n_infection_21_26_1 - n_infection_21_26_2;
cost_per_infection_averted_21_26 = 1000000 * (max(d_dcost_21_26_2 , 0)) / max(1,infections_averted_21_26) ;

infections_averted_21_71 = n_infection_21_71_1 - n_infection_21_71_2;
cost_per_infection_averted_21_71 = 1000000 * (max(d_dcost_21_71_2 , 0)) / max(1,infections_averted_21_71) ;

r_incidence_21_26_2 =  incidence1549_21_26_2 / incidence1549_21_26_1 ;
r_incidence_21_71_2 =  incidence1549_21_71_2 / incidence1549_21_71_1 ;

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

cost_saving = 0;  if d_dcost_21_71_2 < 0 and d_ddaly_all_21_71_2 < 0 then cost_saving = 1;


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
zero_3tc_activity_m184   zero_tdf_activity_k65r   greater_disability_tox 	  greater_tox_zdv  prep_strategy_21_22_2  eff_adh_prep
;
run;


title '';
proc univariate data=wide;
var s_alive_21			p_w_giv_birth_this_per_21	p_newp_ge1_21  p_newp_ge5_21 
p_newp_sw_21   n_tested_m_21  p_mcirc_1549m_21
p_mcirc_21	 		p_mcirc_1519m_21	p_mcirc_2024m_21	p_mcirc_2529m_21		p_mcirc_3039m_21	p_mcirc_4049m_21 	p_mcirc_50plm_21 
prop_w_1549_sw_21	prop_w_ever_sw_21 	prop_sw_hiv_21 	prop_w_1524_onprep_21  prop_1564_hivneg_onprep_21 	prevalence1549m_21 prevalence1549w_21
prevalence1549_21 
prevalence1519w_21 	prevalence1519m_21 	  prevalence2024w_21 	  prevalence2024m_21 	  prevalence2529w_21 	  prevalence2529m_21   prevalence3034w_21   
prevalence3034m_21 	prevalence3539w_21 	  prevalence3539m_21 	  prevalence4044w_21 	 prevalence4044m_21 	  prevalence4549w_21  prevalence4549m_21 
prevalence_vg1000_21 incidence1549_21 incidence1549w_21  incidence1549m_21 
p_inf_vlsupp_21   p_inf_newp_21   p_inf_ep_21   p_inf_diag_21   p_inf_naive_21 p_inf_primary_21
mtct_prop_21 		p_diag_21 	p_diag_m_21   p_diag_w_21	p_ai_no_arv_c_nnm_21    p_artexp_diag_21
p_onart_diag_21	p_onart_diag_w_21 	p_onart_diag_m_21 	p_efa_21 	p_taz_21		p_ten_21 	p_zdv_21	p_dol_21	p_3tc_21 	p_lpr_21 	p_nev_21 
p_onart_vl1000_21   p_vl1000_21		p_vg1000_21 			p_onart_m_21 	p_onart_w_21 
p_onart_vl1000_w_21				p_onart_vl1000_m_21  prev_vg1000_newp_m_21   prev_vg1000_newp_w_21 p_startedline2_21    
p_tle_21	 p_tld_21	 p_zld_21	 p_zla_21	 p_otherreg_21	 p_drug_level_test_21	 p_linefail_ge1_21  
r_efa_hiv_21  p_onart_cd4_l500_21  p_onart_cd4_l200_21  p_startedline2_21 prop_art_or_prep_21 n_sw_1564_21 
p_k65m_21 p_m184m_21 p_newp_ge1_21  p_1524_newp_ge1_21  mean_newp_ppers_prep_21;
run;


ods html;
proc means n median p5 p95 data=wide; 
var	p_mcirc_1549m_17 prevalence1549m_17 prevalence1549w_17 prevalence1524m_17 prevalence1524w_17  incidence1549w_17 incidence1549m_17	p_diag_m_17   
p_diag_w_17	p_ai_no_arv_c_nnm_17   p_ai_no_arv_c_rt184m_17  p_ai_no_arv_c_rt65m_17  prop_w_1549_sw_17  prop_1564_hivneg_onprep_17  prop_w_1524_onprep_17 
p_onart_diag_w_17 	p_onart_diag_m_17   p_vl1000_17	p_onart_vl1000_w_17 p_onart_vl1000_m_17 p_onart_cd4_l500_17  p_mcirc_1549m_17  p_startedline2_17  
prop_sw_hiv_17 prop_sw_onprep_17 p_newp_sw_17  n_tested_17 aids_death_rate_17  p_newp_sw_17 p_newp_ge1_age1549_17 av_newp_ge1_non_sw_17 
prevalence_vg1000_17 ;
run;
ods html close;

ods html;
proc means n median p5 p95 data=wide; 
var	p_mcirc_1549m_21 prevalence1549m_21 prevalence1549w_21 prevalence1524m_21 prevalence1524w_21  incidence1549w_21 incidence1549m_21	p_diag_m_21   
p_diag_w_21	p_ai_no_arv_c_nnm_21   p_ai_no_arv_c_rt184m_21  p_ai_no_arv_c_rt65m_21  prop_w_1549_sw_21  prop_1564_hivneg_onprep_21  prop_w_1524_onprep_21 
p_onart_diag_w_21 	p_onart_diag_m_21   p_vl1000_21	p_onart_vl1000_w_21 p_onart_vl1000_m_21 p_onart_cd4_l500_21  p_mcirc_1549m_21  p_startedline2_21  
prop_sw_hiv_21 prop_sw_onprep_21 p_newp_sw_21  n_tested_21 aids_death_rate_21  p_newp_sw_21 p_newp_ge1_age1549_21 av_newp_ge1_non_sw_21 
prevalence_vg1000_21 ;
run;
ods html close;



proc means p50 p5 p95 p99; var prevalence1524m_21 prevalence1524w_21 prevalence2024m_21 prevalence2024w_21 
prevalence1549m_21 prevalence1549w_21 p_inf_ep_21 p_newp_sw_21 prop_w_1549_sw_21 incidence1549m_21 incidence1549w_21
p_onart_diag_w_21 	p_onart_diag_m_21  p_onart_vl1000_w_21	p_onart_vl1000_m_21 

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



proc glmselect data=wide; class sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w rred_a_p adh_pattern
prep_strategy_21_22_2;
model r_incidence_21_71_2 = 
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w
p_rred_p  p_hsb_p rred_a_p 
newp_factor  eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
prep_strategy_21_22_2 exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx 
 adh_pattern  prob_loss_at_diag  pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
 res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii  rate_res_ten  
fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb  
prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate p_hard_reach_w  
hard_reach_higher_in_men  p_hard_reach_m  inc_cat base_rate_sw 
greater_disability_tox 	 prop_1564_hivneg_onprep_21_71_2 prop_elig_on_prep_21_71_2 p_vlg1000_65m_21_71_2  incidence1549_21
p_prep_adhg80_21_71_2 eff_adh_prep  av_newp_ge1_non_sw_21
/ selection=stepwise ;  run;


proc glmselect data=wide; class prep_strategy_21_22_2;
model r_incidence_21_71_2 = prop_elig_on_prep_21_71_2 p_vlg1000_65m_21_71_2  incidence1549_21 p_prep_adhg80_21_71_2 eff_adh_prep 
p_prep_adhg80_21_71_2 av_newp_ge1_non_sw_21
/ selection=stepwise ;  run;



proc glmselect data=wide; class sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w rred_a_p adh_pattern
prep_strategy_21_22_2;
model d_ddaly_all_21_71_2 = 
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w
p_rred_p  p_hsb_p rred_a_p 
newp_factor  eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep 
prep_strategy_21_22_2 exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx 
 adh_pattern  prob_loss_at_diag  pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac 
 res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii  rate_res_ten  
fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb  
prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate p_hard_reach_w  
hard_reach_higher_in_men  p_hard_reach_m  inc_cat base_rate_sw 
greater_disability_tox 	 prop_1564_hivneg_onprep_21_71_2 prop_elig_on_prep_21_71_2 p_vlg1000_65m_21_71_2  incidence1549_21
p_prep_adhg80_21_71_2 av_newp_ge1_non_sw_21
/ selection=stepwise ;  run;

proc glmselect data=wide; class prep_strategy_21_22_2;
model d_ddaly_all_21_71_2 = prop_elig_on_prep_21_71_2 p_vlg1000_65m_21_71_2  incidence1549_21 p_prep_adhg80_21_71_2 eff_adh_prep 
p_prep_adhg80_21_71_2 av_newp_ge1_non_sw_21 prep_strategy_21_22_2
/ selection=stepwise ;  run;


proc glmselect data=wide; class prep_strategy_21_22_2;
model ndb_500_21_71_2 = prop_elig_on_prep_21_71_2 p_vlg1000_65m_21_71_2  incidence1549_21 p_prep_adhg80_21_71_2 eff_adh_prep 
p_prep_adhg80_21_71_2 av_newp_ge1_non_sw_21 prep_strategy_21_22_2
/ selection=stepwise ;  run;



* --------------------------------------------------------------------------------------------------------------;

* prep analysis;

proc univariate data=wide; var cost_per_test_20; run;


ods html;
proc means data=wide; var n_hiv1_prep_21_71_1 n_hiv1_prep_21_71_2  n_prep_21_71_1 n_prep_21_71_2 ; 
run;
ods html close;

ods html;
proc means data=wide; var  dcost_prep_21_26_1 dcost_prep_21_26_2 ;  
run; 
ods htm close;


ods html;
proc means data=wide; var  av_prep_eff_non_res_v_21_26_2 ; run; 
ods htm close;


proc means data=wide; var p_efa_21_71_1 p_efa_21_71_2 p_dol_21_71_1 p_dol_21_71_2 p_taz_21_71_1 p_taz_21_71_2 ; run;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_w_1524_onprep_21_26_1  prop_w_1524_onprep_21_26_2 ;  
ods html close;
run;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_1564_hivneg_onprep_21_26_1  prop_1564_hivneg_onprep_21_26_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var prop_sw_onprep_21_26_1  prop_sw_onprep_21_26_2 ;  
run; 
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_elig_on_prep_21_26_1  prop_elig_on_prep_21_26_2 ;  
* where prep_strategy_21_26_2 = 9 ;
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var d_p_prep_newp_21_26_2  p_prep_newp_21_26_2  p_prep_newp_21_26_1; 
* where prep_strategy_21_26_2 = 11 ; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var d_prop_1564m_onprep_21_26_2  prop_1564m_onprep_21_26_2  prop_1564m_onprep_21_26_1
d_prop_1564w_onprep_21_26_2  prop_1564w_onprep_21_26_2  prop_1564w_onprep_21_26_1; run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var d_p_prep_elig_past_year_21_26_2  p_prep_elig_past_year_21_26_2  p_prep_elig_past_year_21_26_1; run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var d_p_prep_elig_past_5year_21_26_2  p_prep_elig_past_5year_21_26_2  p_prep_elig_past_5year_21_26_1; run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var d_mean_newp_ppers_prep_21_26_2  mean_newp_ppers_prep_21_26_2  
mean_newp_ppers_prep_21_26_1; run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_newp_this_per_prep_21_26_1  p_newp_this_per_prep_21_26_2 ;  
* where prep_strategy_21_26_2 = 11 ;
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_newp_prep_hivneg_21_26_1  p_newp_prep_hivneg_21_26_2 ;  
run; 
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_newp_prep_21_26_1  p_newp_prep_21_26_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_hiv1_prep_21_26_1  p_hiv1_prep_21_26_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var n_death_hivrel_21_26_1  n_death_hivrel_21_26_2 d_n_death_hivrel_21_26_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var n_death_hivrel_21_71_1  n_death_hivrel_21_71_2 d_n_death_hivrel_21_71_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var prevalence_vg1000_21_71_1  prevalence_vg1000_21_71_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var p_prep_ever_21_26_1  p_prep_ever_21_26_2 p_prep_ever_21_71_1  p_prep_ever_21_71_2 ;  
run; 
ods html close;





ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_vlg1000_184m_21_26_1  p_vlg1000_184m_21_26_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_vlg1000_65m_21_26_1  p_vlg1000_65m_21_26_2 ;  
run; 
ods html close;


ods html;
proc means n mean median lclm uclm p5 p95 data=wide; var incidence1549_21_26_1 incidence1549_21_26_2  r_incidence_21_26_2 ;  
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide;  var incidence1549_21_71_1 incidence1549_21_71_2  r_incidence_21_71_2 ;  
run; 
ods html close;


ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var      ddaly_all_21_26_1  ddaly_all_21_26_2  d_ddaly_all_21_26_2 d_ndb_500_21_26_2  ndb_500_21_26_2  ndb_500_21_26_1
d_dcost_21_26_2  dcost_21_26_2  dcost_21_26_1  d_dcost_prep_21_26_2  dcost_prep_21_26_1 dcost_prep_21_26_2   ; 
run; 
ods html close;

ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var      ddaly_all_21_71_1  ddaly_all_21_71_2  d_ddaly_all_21_71_2 d_ndb_500_21_71_2  ndb_500_21_71_2  ndb_500_21_71_1
d_dcost_21_71_2  dcost_21_71_2  dcost_21_71_1  d_dcost_prep_21_71_2  dcost_prep_21_71_1 dcost_prep_21_71_2   ; 
run; 
ods html close;


ods html;
proc means data=wide; var prop_elig_on_prep_21_26_1  prop_elig_on_prep_21_26_2 ;  
run; 
ods htm close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_onart_21_26_1  p_onart_21_26_2 ;  
run; 
ods htm close;



ods html;
proc means n mean  p5 p95 lclm uclm data=wide; var p_prep_adhg80_21_26_1  p_prep_adhg80_21_26_2 ;  
run; 
ods htm close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; var p_onart_vl1000_21_26_1  p_onart_vl1000_21_26_2 ;  
run; 
ods htm close;



*  p_prep_ever   p_hiv1_prep   incidence1524w   incidence1524m   p_k65m    p_m184m ;


proc univariate data=wide; var prop_elig_on_prep_21_26_2  n_prep_21_71_2   p_newp_ge1_21_71_2; run;

ods html;
proc means n mean lclm uclm p5 p95 data=wide;  var 
d_ddaly_all_21_26_2  
d_ndb_500_21_26_2  
dcost_21_26_1 dcost_21_26_2 
d_dcost_21_26_2  
n_tested_21_26_1 n_tested_21_26_2
n_prep_21_26_1 n_prep_21_26_2
incidence1549_21_26_1 incidence1549_21_26_2 
dvis_cost_21_26_1 dvis_cost_21_26_2 
dtest_cost_21_26_1 dtest_cost_21_26_2
dart_cost_y_21_26_1 dart_cost_y_21_26_2 
dcost_circ_21_26_1 dcost_circ_21_26_2 
dclin_cost_21_26_1 dclin_cost_21_26_2 
dcost_prep_21_26_1 dcost_prep_21_26_2 
dcost_prep_visit_21_26_1 dcost_prep_visit_21_26_2 
p_onart_21_26_1 p_onart_21_26_2 
p_vl1000_21_26_1 p_vl1000_21_26_2 
prevalence_vg1000_21_26_1 prevalence_vg1000_21_26_2 
prev_vg1000_newp_m_21_26_1 prev_vg1000_newp_m_21_26_2 
prev_vg1000_newp_w_21_26_1 prev_vg1000_newp_w_21_26_2 
prop_art_or_prep_21_26_1  prop_art_or_prep_21_26_2
prop_1564_hivneg_onprep_21_26_1  prop_1564_hivneg_onprep_21_26_2
prop_w_1524_onprep_21_26_1 prop_w_1524_onprep_21_26_2
prop_elig_on_prep_21_26_1 prop_elig_on_prep_21_26_2
p_prep_ever_21_26_1 p_prep_ever_21_26_2
p_hiv1_prep_21_26_1 p_hiv1_prep_21_26_2
p_k65m_21_26_1 p_k65m_21_26_2
p_m184m_21_26_1 p_m184m_21_26_2
dtotcost_prep_21_26_1 dtotcost_prep_21_26_2  d_dtotcost_prep_21_26_2 
;
run; 


ods html close;




ods html;
proc means n mean lclm uclm p5 p95 data=wide;  
var    d_ddaly_all_21_71_2  d_ndb_500_21_71_2  d_dcost_21_71_2  incidence1549_21_71_1 incidence1549_21_71_2 
dcost_21_71_1   dcost_21_71_2
n_tested_21_71_1 n_tested_21_71_2
n_prep_21_71_1 n_prep_21_71_2
prop_art_or_prep_21_71_1 prop_art_or_prep_21_71_2
dvis_cost_21_71_1 dvis_cost_21_71_2 
dtest_cost_21_71_1 dtest_cost_21_71_2
dart_cost_y_21_71_1 dart_cost_y_21_71_2 
dclin_cost_21_71_1 dclin_cost_21_71_2 
dcost_clin_care_21_71_1 dcost_clin_care_21_71_2
d_dcost_clin_care_21_71_2
dcost_prep_21_71_1 dcost_prep_21_71_2 
dcost_prep_visit_21_71_1 dcost_prep_visit_21_71_2 
p_onart_21_71_1 p_onart_21_71_2 
p_vl1000_21_71_1 p_vl1000_21_71_2 
prevalence_vg1000_21_71_1 prevalence_vg1000_21_71_2 
prev_vg1000_newp_m_21_71_1 prev_vg1000_newp_m_21_71_2 
prev_vg1000_newp_w_21_71_1 prev_vg1000_newp_w_21_71_2 
prop_art_or_prep_21_26_1  prop_art_or_prep_21_26_2
prop_1564_hivneg_onprep_21_71_1  prop_1564_hivneg_onprep_21_71_2
p_prep_ever_21_71_1 p_prep_ever_21_71_2
p_hiv1_prep_21_71_1 p_hiv1_prep_21_71_2
p_mcirc_1549m_21_71_1 p_mcirc_1549m_21_71_2 
prop_elig_on_prep_21_71_1 prop_elig_on_prep_21_71_2

dadc_cost_21_71_1   dadc_cost_21_71_2   
dcd4_cost_21_71_1   dcd4_cost_21_71_2   
dvl_cost_21_71_1   dvl_cost_21_71_2   
dvis_cost_21_71_1  dvis_cost_21_71_2   
dwho3_cost_21_71_1   dwho3_cost_21_71_2   
dcot_cost_21_71_1   dcot_cost_21_71_2   
dtb_cost_21_71_1   dtb_cost_21_71_2   
dres_cost_21_71_1   dres_cost_21_71_2 
dtest_cost_21_71_1  dtest_cost_21_71_2  
d_t_adh_int_cost_21_71_1  d_t_adh_int_cost_21_71_2   
dswitchline_cost_21_71_1 dswitchline_cost_21_71_2
dtaz_cost_21_71_1 dtaz_cost_21_71_2 
dcost_drug_level_test_21_71_1   dcost_drug_level_test_21_71_2   
dclin_cost_21_71_1  dclin_cost_21_71_2   
dcost_circ_21_71_1  dcost_circ_21_71_2
dcost_condom_dn_21_71_1 dcost_condom_dn_21_71_2
dcost_drug_level_test_21_71_1 dcost_drug_level_test_21_71_2  
dcost_child_hiv_21_71_1 dcost_child_hiv_21_71_2
dcost_non_aids_pre_death_21_71_1 dcost_non_aids_pre_death_21_71_2 
dtotcost_prep_21_71_1 dtotcost_prep_21_71_2  d_dtotcost_prep_21_71_2 
;
* where 0.00 <= incidence1549_20 < 0.30 ;
* where prop_1564_hivneg_onprep_21_71_2 < 0.10 and incidence1549_20 > 0.30 ;
* where prop_1564_hivneg_onprep_21_71_2 < 0.10 and prevalence1549_20 > 0.05 ;
* where prep_strategy_21_26_2  = 11 ;
run; 
ods html close;



* dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dtaz_cost dcost_drug_level_test   dclin_cost dcost_cascade_interventions     dcost_circ dcost_condom_dn dcost_prep_visit  dcost_prep ;


proc univariate; var prop_1564_hivneg_onprep_21_71_2  prevalence1549_20 incidence1549_20; run;



proc sort; by icer_2;
proc print; var ddaly_all_21_71_2   ddaly_all_21_71_1  dcost_21_71_2   dcost_21_71_1  d_dcost_21_71_2  d_ddaly_all_21_71_2  icer_2; 
run;


proc freq data=wide; tables icer_2;
  where prop_1564_hivneg_onprep_21_71_2 < 0.05 and prevalence1549_20 > 0.1 ;
* where prop_1564_hivneg_onprep_21_71_2 < 0.10 and prevalence1549_20 > 0.07 ;
run;

proc univariate; var p_elig_prep_21_26_2  p_newp_ge1_20; run;
proc corr; var p_elig_prep_21_26_2 prop_1564_hivneg_onprep_21_26_2 p_newp_prep_21_26_2 p_newp_ge1_20 ; run;




* model including baseline variables only - to inform scale up of prep programmes ;
data wide_x; set wide; keep 
ce_500_x ce_500  p_mcirc_1549m_21 av_newp_ge1_non_sw_21 prevalence_vg1000_21;
proc logistic data=wide_x; model ce_500_x =  p_mcirc_1549m_21 av_newp_ge1_non_sw_21 prevalence_vg1000_21   ;
output out=pred p=phat lower=lcl upper=ucl
          predprob=(individual crossvalidate);
run;

data s; set pred ; keep  p_mcirc_1549m_21 av_newp_ge1_non_sw_21 prevalence_vg1000_21 ce_500 phat;
proc sort; by phat; 
proc print; run;


/*
proc sort; by p_newp_ge1_age1549_20_g incidence1549_20_g; 
proc print; var p_newp_ge1_age1549_20_g  incidence1549_20_g  phat ; run;
*/



proc corr spearman; var p_newp_ge1_age1549_21 av_newp_ge1_non_sw_21 incidence1549_21 ; run; 

proc freq; tables icer_2; run;


* model including some variables defined base on follow-up - to determine whether prep programmes should continue;
proc logistic data=wide; model ce_500_x =  
p_mcirc_1549m_21 /* prevalence1549_21 prop_sw_hiv_21 p_newp_sw_21  p_newp_ge1_age1549_21 */ av_newp_ge1_non_sw_21 /* p_vl1000_21 */ 
/* prevalence_vg1000_21 */ incidence1549_21
/ stepwise
; 
run;


proc logistic data=wide; model ce_500_x = p_mcirc_1549m_21 av_newp_ge1_non_sw_21 prevalence_vg1000_21 ; 
run;



proc univariate data=wide; var
p_mcirc_1549m_21 prevalence1549_21 prop_sw_hiv_21 p_newp_sw_21  p_newp_ge1_age1549_21 av_newp_ge1_non_sw_21 p_vl1000_21 prevalence_vg1000_21 ;
run;


proc glm data=wide; model d_ndb_500_21_71_2 =  
p_mcirc_1549m_21 /* incidence1549_21 */ av_newp_ge1_non_sw_21 /* p_vl1000_21 */ prevalence_vg1000_21 / solution
; 
run;


proc corr data=wide; var p_mcirc_1549m_21 incidence1549_21 prevalence1549_21 prop_sw_hiv_21 p_newp_sw_21  p_newp_ge1_age1549_21 
av_newp_ge1_non_sw_21 p_vl1000_21 prevalence_vg1000_21 ; run;


* model including some variables defined base on follow-up - to determine whether prep programmes should continue;
proc logistic data=wide; model ce_500 =  prop_1564_hivneg_onprep_21_26_2 ;
run;

proc glm; model d_ndb_500_21_71_2 =  incidence1549_20 av_newp_ge1_non_sw_20 prevalence1549_20 ; 
*  p_newp_ge5_20 p_newp_ge1_age1549_20  p_ai_no_arv_c_rt65m_20  p_inf_newp_20  p_ai_no_arv_c_rt184m_20 av_newp_ge1_non_sw_20; 
* prop_elig_on_prep_21_26_2 p_newp_this_per_prep_21_26_2 p_prep_adhg80_21_26_2 p_newp_prep_hivneg_21_26_2 ;
run;  


* the issue with prop_1564_hivneg_onprep_21_26_2 as an indicator of cost effectiveness is that in the model it represents the proportion after scale up, 
so is a measure of the proportion eligible while in real life as scale up starts to happen it just reflects the extent of scale up - need a measure
of the proportion of population at risk of HIV in any one period;  



proc glm; model d_ddaly_all_21_71_2 = p_mcirc_1549m_21 /* incidence1549_21 */ av_newp_ge1_non_sw_21 /* p_vl1000_21 */ prevalence_vg1000_21   ; 
run;



proc glm; model d_dcost_21_71_2 = p_mcirc_1549m_21 /* incidence1549_21 */ av_newp_ge1_non_sw_21 /* p_vl1000_21 */ prevalence_vg1000_21  ;
run;







proc means n mean median data=wide; var cost_per_infection_averted_21_26  ; where infections_averted_21_26 > 0 ;
run;
 
proc means n mean median data=wide; var cost_per_infection_averted_21_71  ; where infections_averted_21_71 > 0 ;
run;
 
proc means; var infections_averted_21_26  ; run;

proc freq data=wide; tables prevalence_vg1000_21 av_newp_ge1_non_sw_21 p_mcirc_1549m_21 prop_1564_hivneg_onprep_21_26_2 ; run;  


* for figure;
  ods html;
proc freq data=wide;  tables ce_500_x ; 
  where 0.00 <= prevalence_vg1000_21 < 0.01 and 3  <= av_newp_ge1_non_sw_21 < 10 and 0.333 <= p_mcirc_1549m_21 < 0.667 ;
run; 
  ods html close;

* for table / results;
  ods html;
proc freq data=wide;   tables ce_500_x / nocum norow binomial; * exact binomial;  
* where 0.000 <= p_mcirc_1549m_21 < 0.333 ;
* where 0.05 <= prevalence_vg1000_21 < 0.55 ; 
* where 3 <= av_newp_ge1_non_sw_21 < 10 ;
  where 0.035 <= prop_1564_hivneg_onprep_21_26_2 < 1.035;
run; 
  ods html close;


proc print;  var  cost_saving ce_100 d_dcost_21_71_2 d_ddaly_all_21_71_2 ; run; 

proc freq; tables cost_saving ; run;

proc univariate; var incidence1549_21 ; where incidence1549_21 >= 1.5; run;
proc univariate; var av_newp_ge1_non_sw_21 ; where av_newp_ge1_non_sw_21 >= 3.5; run;




* --------------------------------------------------------------------------------------------------------------;


