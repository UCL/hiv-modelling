

libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";

data cabr;
set a.w_lapr24_s2;
cabr=1;

data nocabr;
set a.w_lapr25_nocabr;
cabr=0;

data all; set cabr nocabr;



if hivtest_type_1_prep_inj = . then hivtest_type_1_prep_inj=0;

d_n_cur_res_dol_50y_2 = n_cur_res_dol_50y_2 - n_cur_res_dol_50y_1;  
d_n_prep_all_50y_2 = n_prep_all_50y_2 - n_prep_all_50y_1 ;
d_prop_elig_on_prep_50y_2 =  prop_elig_on_prep_50y_2 -  prop_elig_on_prep_50y_1 ;  
d_p_hiv1_prep_50y_2 =  p_hiv1_prep_50y_2 -  p_hiv1_prep_50y_1;  
d_p_iime_50y_2 = p_iime_50y_2 -  p_iime_50y_1;
d_n_death_hiv_50y_2 = n_death_hiv_50y_1 - n_death_hiv_50y_2 ;

d_n_cur_res_dol_32_2 = n_cur_res_dol_32_2 - n_cur_res_dol_32_1;  
d_n_prep_all_32_2 = n_prep_all_32_2 - n_prep_all_32_1 ;
d_prop_elig_on_prep_32_2 =  prop_elig_on_prep_32_2 -  prop_elig_on_prep_32_1 ;  
d_p_hiv1_prep_32_2 =  p_hiv1_prep_32_2 -  p_hiv1_prep_32_1;  

d_n_cur_res_dol_42_2 = n_cur_res_dol_42_2 - n_cur_res_dol_42_1;  
d_n_prep_all_42_2 = n_prep_all_42_2 - n_prep_all_42_1 ;
d_prop_elig_on_prep_42_2 =  prop_elig_on_prep_42_2 -  prop_elig_on_prep_42_1 ;  
d_p_hiv1_prep_42_2 =  p_hiv1_prep_42_2 -  p_hiv1_prep_42_1;  

d_p_iime_32_2 = p_iime_32_2 -  p_iime_32_1;
d_incidence1549_32_2 = incidence1549_32_2 - incidence1549_32_1 ;
d_p_iime_42_2 = p_iime_42_2 -  p_iime_42_1;
r_p_iime_42_2 = p_iime_42_2 / p_iime_42_1;
d_incidence1549_42_2 = incidence1549_42_2 - incidence1549_42_1 ;
d_p_iime_50y_2 = p_iime_50y_2 -  p_iime_50y_1;
d_incidence1549_50y_2 = incidence1549_50y_2 - incidence1549_50y_1 ;
d_n_death_hiv_42_2 = n_death_hiv_42_1 - n_death_hiv_42_2 ;

d_n_infection_50y_2 = n_infection_50y_1 - n_infection_50y_2 ;
d_ddaly_ac_ntd_mtct_50y_2 = ddaly_ac_ntd_mtct_50y_1 - ddaly_ac_ntd_mtct_50y_2;
d_ddaly_50y_2 = ddaly_50y_1 - ddaly_50y_2;
d_dcost_50y_2 = dcost_50y_2 - dcost_50y_1;

d_dcost_prep_50y_2 = dcost_prep_50y_2 - dcost_prep_50y_1 ;
d_dcost_clin_care_50y_2 = dcost_clin_care_50y_2 - dcost_clin_care_50y_1 ;

netdaly500_1 = ddaly_50y_1 + (dcost_50y_1 / 0.0005);
netdaly500_2 = ddaly_50y_2 + (dcost_50y_2 / 0.0005);
netdaly_averted = netdaly500_1 - netdaly500_2;

d_dcost_10y_2 = dcost_10y_2 - dcost_10y_1;
d_n_infection_10y_2 = n_infection_10y_1 - n_infection_10y_2 ;

if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat3=1; else hiv_test_strat3=0;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat2=1; else hiv_test_strat2=0;

d_p_vl1000_art_12m_32_2 = p_vl1000_art_12m_32_1 - p_vl1000_art_12m_32_2; 
d_p_vl1000_art_12m_42_2 = p_vl1000_art_12m_42_1 - p_vl1000_art_12m_42_2; 

p_emerge_inm_res_cab_50y_2 = s_em_inm_res_o_cab_off_3m_50y_2 /  s_o_cab_or_o_cab_tm1_no_r_50y_2 ;
* p_emerge_inm_res_cab_tail_50y_2 = s_emerge_inm_res_cab_tail_50y_2 / s_cur_in_prep_inj_tail_no_r_50y_2 ; 



proc glm  ; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3;
model d_p_iime_50y_2 =
/* p_iime_22 incidence1549w_22 p_vl1000_22 prop_1564_onprep_22 */ cabr
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g  res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 / solution
;
where cabr=1;
run;
* sens_tests_prep_inj;



proc glm ; 
model d_n_death_hiv_50y_2 =
n_death_hiv_22 cabr
/ solution;
run;

proc univariate; var d_n_death_hiv_50y_2; where cabr =1; run;
proc univariate; var d_n_death_hiv_50y_2; where cabr =0; run;

proc freq; tables d_n_death_hiv_50y_2; where cabr =1; run;


proc glm ; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 ;
model d_n_death_hiv_50y_2 =
n_death_hiv_22 cabr
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 
/ solution;
where cabr=1;
run;
