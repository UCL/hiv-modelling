* s_ var list to call in keep and drop statements
- includes all s_ variables that are common across all three statements
* 16th Dec 2025;


* Exceptions need to be listed separately:

Variable			keep 1		drop		keep 2
--------------------------------------------------
s_n					yes			yes			no
keep_going_1999		yes			no			no
keep_going_2004		yes			no			no
keep_going_2016		yes			no			no
keep_going_2020		yes			no			no


--------------------------------
In keep but not drop statements:
--------------------------------

/*general*/
run	option

/* used in abort statements */
prevalence1549  prev_ratio_1524 incidence1549 incidence1549w incidence1549m cum_ratio_newp_mw prev_vg1000_1549 p_vl1000

/*parameters sampled*/
/* NB: everyone in the data set must have the same value for these parameters for them to be included (since we take the value for the last person) */

sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w   p_rred_p  p_hsb_p rred_initial newp_factor  fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep  prop_use_condom_int_newp  prop_redattr_ep_condoms
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti tr_rate_undetec_vl super_infection_pop  an_lin_incr_test  date_test_rate_plateau  
rate_anc_inc prob_test_2ndtrim prob_test_postdel incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice rate_ch_art_init_str_4 rate_ch_art_init_str_9  red_int_risk_poc_vl 
lencab_uptake_vlg1000 lencab_uptake rate_return_for_lencab  prob_strong_pref_lencab  prop_v_alert_perm
rate_ch_art_init_str_10 rate_ch_art_init_str_3 clinic_not_aw_int_frac  ind_effect_art_hiv_disease_death incr_adh_poc_vl 
res_trans_factor_nn res_trans_factor_ii  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  

prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti   prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_non_tb_who3e  higher_newp_less_engagement  fold_tr  fold_tr_pwid prob_prep_elig_pwid msm_risk_cls  prob_prep_elig_msm
msm_tr_factor switch_for_tox 
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat
rate_test_startprep_any   rate_choose_stop_prep_oral prob_prep_oral_b circ_inc_rate circ_red_10_14 circ_inc_15_19 circ_red_20_30  circ_red_30_50
prob_prep_any_restart_choice  add_prep_any_uptake_sw  cd4_monitoring   base_rate_stop_sexwork    rred_a_p  higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child  rate_trans_breastfeeding incr_mort_risk_dol_weightg 
nnrti_res_no_effect
greater_disability_tox 	  greater_tox_zdv 	 rel_dol_tox  cab_higher_potency len_higher_potency  isl_higher_potency  isl_ole_adh_improve
prop_bmi_ge23 pr_res_dol pr_res_len incr_len_res_mono  date_prep_cab_intro cablen_extra_pref  add_prob_prep_b_cab add_prob_prep_b_len
cab_time_to_lower_threshold_g len_time_to_lower_threshold_g
ntd_risk_dol oth_dol_adv_birth_e_risk    zdv_potency_p75 
double_rate_gas_tox_taz  
sw_program  sw_higher_int  rel_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
msm_rred red_chance_ep_msm prop_m_msm prob_start_pwid prob_stop_pwid rr_pwid_female msm_rr_loss_at_diag pwid_rr_loss_at_diag

effect_sw_prog_6mtest effect_sw_prog_int  effect_sw_prog_pers_sti  effect_sw_prog_adh  effect_sw_prog_lossdiag effect_sw_prog_prep_any
base_rate_sw 
sw_art_disadv  sw_trans_matrix  p_rred_sw_newp  effect_sw_prog_newp
zero_3tc_activity_m184  zero_tdf_activity_k65r  lower_future_art_cov  higher_future_prep_oral_cov rate_crypm_proph_init
rate_tb_proph_init rate_sbi_proph_init death_r_iris_pop_wide_tld
prep_any_strategy prob_prep_any_visit_counsel rate_test_onprep_any prep_dependent_prev_vg1000  prep_vlg1000_threshold rr_mort_tdf_prep
rel_prep_oral_adh_younger 
prob_self_test_hard_reach self_test_targeting rate_self_test self_test_sens prob_pos_self_test_conf secondary_dist_self_test secondary_self_test_targeting

prep_oral_efficacy higher_future_prep_oral_cov prob_prep_cab_b prob_prep_len_b prob_prep_vr_b prep_cab_efficacy prep_len_efficacy  prop_pep  pep_efficacy 
rate_choose_stop_prep_cab rate_choose_stop_prep_len rate_choose_stop_prep_vr 
prep_cab_effect_inm_partner  prep_len_effect_cam_partner 
pref_prep_cablen_beta_s1 incr_res_risk_cab_inf_3m  incr_res_risk_len_inf_3m 
rr_testing_female

artvis0_lower_adh  pop_wide_prep_adh_effect rate_lencab_to_tld  rel_rate_interrupt_lencab

pr_184m_oral_prep_primary pr_65m_oral_prep_primary 	pr_inm_cab_prep_primary  pr_cam_len_prep_primary
rel_pr_inm_cab_prep_tail_primary  rel_pr_cam_len_prep_tail_primary
rr_res_cab_dol
hivtest_type_1_init_prep_cab hivtest_type_1_prep_cab
hivtest_type_1_init_prep_len hivtest_type_1_prep_len
sens_ttype3_prep_cab_primary sens_ttype3_prep_cab_inf3m sens_ttype3_prep_cab_infge6m
sens_ttype1_prep_cab_primary sens_ttype1_prep_cab_inf3m sens_ttype1_prep_cab_infge6m  sens_tests_prep_cab
sens_vct_testtype3_cab_tail sens_primary_testtype3   testt1_prep_cab_eff_on_res_prim   reg_option_107_after_cab

sens_ttype3_prep_len_primary sens_ttype3_prep_len_inf3m sens_ttype3_prep_len_infge6m
sens_ttype1_prep_len_primary sens_ttype1_prep_len_inf3m sens_ttype1_prep_len_infge6m  sens_tests_prep_len
sens_vct_testtype3_len_tail sens_primary_testtype3   testt1_prep_len_eff_on_res_prim  

rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_hiv_concern  prob_onartvis0_1_to_0 prob_onartvis0_0_to_1
pref_prep_oral_beta_s1
prob_prep_pop_wide_tld  pop_wide_tld  prob_test_pop_wide_tld_prep  pop_wide_tld_selective_hiv res_level_dol_cab_mut res_level_len_mut
super_inf_res  
oral_prep_eff_3tc_ten_res  rr_non_aids_death_hiv_off_art rr_non_aids_death_hiv_on_art

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100  effect_tb_proph   effect_crypm_proph  effect_sbi_proph

non_hiv_tb_risk non_hiv_tb_death_risk non_hiv_tb_prob_diag_e 
prob_sbp_increase prob_test_sbp_undiagnosed prob_test_sbp_diagnosed prob_imm_anti_hypertensive prob_start_anti_hyptertensive 
prob_stop_anti_hypertensive prob_intensify_1_2 prob_intensify_2_3 effect_sbp_cvd_death effect_gender_cvd_death effect_age_cvd_death base_cvd_death_risk

discount

/*year_i interventions*/
/* NB: everyone in the data set must have the same value for these parameters for them to be included (since we take the value for the last person) */
condom_change_year_i			decr_hard_reach_year_i			incr_adh_year_i			decr_prob_loss_at_diag_year_i 
absence_cd4_year_i  			absence_vl_year_i 				decr_rate_lost_year_i  	decr_rate_lost_art_year_i   
incr_rate_return_year_i     	incr_rate_restart_year_i        incr_rate_init_year_i   decr_rate_int_choice_year_i 
incr_prob_vl_meas_done_year_i 	incr_pr_switch_line_year_i    	poc_vl_monitoring_i 	circ_inc_rate_year_i 		 
incr_test_targeting_year_i   	reg_option_switch_year_i 		art_mon_drug_levels_year_i   ten_is_taf_year_i  	
pop_wide_tld_year_i  			single_vl_switch_efa_year_i		e_decr_hard_reach_year_i  
initial_pr_switch_line      	initial_prob_vl_meas_done  

vmmc_disrup_covid condom_disrup_covid prep_oral_disrup_covid swprog_disrup_covid testing_disrup_covid art_tld_disrup_covid art_tld_eod_disrup_covid
art_init_disrup_covid vl_adh_switch_disrup_covid cotrim_disrup_covid no_art_disrup_covid inc_death_rate_aids_disrup_covid art_low_adh_disrup_covid
cov_death_risk_mult

ptnewp15_m  ptnewp25_m  ptnewp35_m  ptnewp45_m  ptnewp55_m
ptnewp15_w  ptnewp25_w  ptnewp35_w  ptnewp45_w  ptnewp55_w

prop_mono_m_1524  prop_mono_m_2534  prop_mono_m_3544  prop_mono_m_4554  prop_mono_m_5564
prop_mono_w_1524  prop_mono_w_2534  prop_mono_w_3544  prop_mono_w_4554  prop_mono_w_5564

prevalence1524m  prevalence2534m  prevalence3544m  prevalence4554m  prevalence5564m
prevalence1524w  prevalence2534w  prevalence3544w  prevalence4554w  prevalence5564w
incidence1524m_epnewp  incidence2534m_epnewp  incidence3544m_epnewp  incidence4554m_epnewp  incidence5564m_epnewp
incidence1524w_epnewp  incidence2534w_epnewp  incidence3544w_epnewp  incidence4554w_epnewp  incidence5564w_epnewp

d_s_newp

p_onart_vls  p_onart_epvls  d_vls
p_diag  p_diag_onart  p_diag_eponart  p_diag_m  p_diag_w  p_epdiag_m  p_epdiag_w  d_diag_m  d_diag_w
d_onart

d_hiv_epi_wm  d_hiv_epi_mw  r_hiv_epi_both  r_ep_mw

r_s_ep_m15w15 r_s_ep_m25w25 r_s_ep_m35w35 r_s_ep_m45w45 r_s_ep_m55w55 

m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r


--------------------------------
In drop but not keep statements:
--------------------------------

s_ai_naive_no_pmtct_c_inm_  s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_r_      s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  
s_ai_naive_no_pmtct_c_rttams_ s_ai_naive_no_pmtct_e_inm_   s_ai_naive_no_pmtct_e_nnm_   s_ai_naive_no_pmtct_e_pim_  
s_ai_naive_no_pmtct_e_r_    s_ai_naive_no_pmtct_e_rt184m_   s_ai_naive_no_pmtct_e_rt65m_   s_ai_naive_no_pmtct_e_rttams_ 
s_all_ai_        		s_all_ai_c_inm_     s_all_ai_c_nnm_    s_all_ai_c_pim_    s_all_ai_c_r_  
s_all_ai_c_rt184m_     	s_all_ai_c_rt65m_       s_all_ai_c_rttams_   s_all_ai_e_inm_    s_all_ai_e_nnm_ 
s_all_ai_e_pim_      	s_all_ai_e_r_       s_all_ai_e_rt184m_     s_all_ai_e_rt65m_    s_all_ai_e_rttams_  
s_art_attrit_1yr     	s_art_attrit_1yr_on     s_art_attrit_2yr   s_art_attrit_2yr_on   s_art_attrit_3yr   
s_art_attrit_3yr_on     s_art_attrit_4yr      s_art_attrit_4yr_on  s_art_attrit_5yr   
s_art_attrit_5yr_on     s_art_attrit_6yr      s_art_attrit_6yr_on   s_art_attrit_7yr   s_art_attrit_7yr_on   
s_art_attrit_8yr    	s_art_attrit_8yr_on   s_dead_daly   s_epart    s_hiv1564   
s_s_m_newp  s_s_w_newp

;


*-------------------------------
Common to all sections:
-------------------------------;


%let s_var_list =

/*general*/
cald 

/*number alive and in each age group*/
s_alive0_
s_alive1549 	s_alive1549_w	s_alive1549_m	s_alive1564 	s_alive1564_w	s_alive1564_m
s_ageg1517m		s_ageg1819m		s_ageg1519m  	s_ageg2024m		s_ageg2529m  	s_ageg3034m		s_ageg3539m		s_ageg4044m	
s_ageg4549m		s_ageg5054m 	s_ageg5559m		s_ageg6064m		s_ageg1564m		s_ageg1549m		s_age_1844m		s_ageg1014m		s_ageg014_	
s_ageg1517w		s_ageg1819w		s_ageg1519w  	s_ageg2024w		s_ageg2529w  	s_ageg3034w		s_ageg3539w		s_ageg4044w	
s_ageg4549w		s_ageg5054w 	s_ageg5559w		s_ageg6064w		s_ageg1564w		s_ageg1549w		s_age_1844w
s_ageg1m  		s_ageg2m  		s_ageg3m  		s_ageg4m  		s_ageg5m  		
s_ageg1w		s_ageg2w		s_ageg3w		s_ageg4w		s_ageg5w  

s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		s_ageg85plm
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		s_ageg85plw
s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m		s_hiv85plm	
s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w 		s_hiv85plw 
s_alive_w 		s_alive_m

/*number and status of those with HIV*/
s_hiv1564 		s_hiv1549 
s_hiv1517m		s_hiv1819m		s_hiv1519m  	s_hiv2024m		s_hiv2529m  	s_hiv3034m		s_hiv3539m		s_hiv4044m	
s_hiv4549m		s_hiv5054m 		s_hiv5559m		s_hiv6064m		s_hiv1564m		s_hiv1549m		
s_hiv1517w		s_hiv1819w		s_hiv1519w  	s_hiv2024w		s_hiv2529w  	s_hiv3034w		s_hiv3539w		s_hiv4044w	
s_hiv4549w		s_hiv5054w 		s_hiv5559w		s_hiv6064w		s_hiv1564w		s_hiv1549w	
s_sg_1 			s_sg_2 			s_sg_3 			s_sg_4			s_sg_5 			s_sg_6 			s_sg_7 			s_sg_8 		s_sg_9		s_sg_99
s_infection_pre_year_interv  	s_infection_post_year_interv 

/*primary infection*/
s_primary  			s_primary1549   	
s_primary1549m  	s_primary1549w  	s_infected_primary 	s_inf_primary  		s_primary_msm  	s_primary_pwid
s_primary1519m		s_primary2024m		s_primary2529m		s_primary3034m		s_primary3539m	s_primary4044m	s_primary4549m	s_primary5054m		s_primary5559m		s_primary6064m
s_primary1519w		s_primary2024w		s_primary2529w		s_primary3034w		s_primary3539w	s_primary4044w	s_primary4549w	s_primary5054w		s_primary5559w		s_primary6064w
s_primary_ep_m  	s_primary_ep_w  
s_primary1524m_ep  	s_primary2534m_ep  	s_primary3544m_ep  	s_primary4554m_ep  	s_primary5564m_ep
s_primary1524w_ep  	s_primary2534w_ep  	s_primary3544w_ep  	s_primary4554w_ep  	s_primary5564w_ep
s_primary1524m_epnewp  s_primary2534m_epnewp  s_primary3544m_epnewp  s_primary4554m_epnewp  	s_primary5564m_epnewp 
s_primary1524w_epnewp  s_primary2534w_epnewp  s_primary3544w_epnewp  s_primary4554w_epnewp  	s_primary5564w_epnewp
s_primary_sw  		s_primary_sw1519_  	s_primary_sw2024_  	s_primary_sw2529_  	s_primary_sw3039_
s_inf_vlsupp  		s_inf_newp  		s_inf_ep  			s_inf_diag  		s_inf_naive 	s_primary_prep_elig 	s_primary_onprep

/*outputs amongst those infected*/
s_i_m_d_newp  s_i_w_d_newp   s_i_w_np   s_i_m_np  s_i_ep 

s_i_m_1524_newp  	s_i_m_2534_newp  	s_i_m_3544_newp  	s_i_m_4554_newp  	s_i_m_5564_newp
s_i_w_1524_newp  	s_i_w_2534_newp  	s_i_w_3544_newp  	s_i_w_4554_newp  	s_i_w_5564_newp 
s_i_r_vlg1_np  		s_i_r_vlg2_np  		s_i_r_vlg3_np  		s_i_r_vlg4_np  		s_i_r_vlg5_np  		s_i_r_vlg6_np
s_i_diag_vlg1_rm0_np   s_i_diag_vlg2_rm0_np   s_i_diag_vlg3_rm0_np   s_i_diag_vlg4_rm0_np   s_i_diag_vlg5_rm0_np   s_i_diag_vlg6_rm0_np
s_i_diag_vlg1_rm1_np   s_i_diag_vlg2_rm1_np   s_i_diag_vlg3_rm1_np   s_i_diag_vlg4_rm1_np   s_i_diag_vlg5_rm1_np   s_i_diag_vlg6_rm1_np
s_i_naive_vlg1_rm0_np  s_i_naive_vlg2_rm0_np  s_i_naive_vlg3_rm0_np  s_i_naive_vlg4_rm0_np  s_i_naive_vlg5_rm0_np  s_i_naive_vlg6_rm0_np
s_i_naive_vlg1_rm1_np  s_i_naive_vlg2_rm1_np  s_i_naive_vlg3_rm1_np  s_i_naive_vlg4_rm1_np  s_i_naive_vlg5_rm1_np  s_i_naive_vlg6_rm1_np
s_i_v1_np  s_i_v2_np   s_i_v3_np  s_i_v4_np   s_i_v5_np  s_i_v6_np 

s_diagprim s_diagprim_prep_oral s_diagprim_prep_cab  s_diagprim_prep_len s_diagprim_prep_vr 

/*Number ep and newp*/
s_np  s_newp  s_newp_ge1  s_newp_ge5  s_newp_ge10  s_newp_ge50  s_ep  s_ep_m  s_ep_w  
s_m_npge1 		s_w_npge1 		s_w1524_npge1 		s_sw_npge1 
s_npge10  s_npge2  s_npge2_l4p_1549m  s_npge2_l4p_1549w
s_m_1524_ep  	 s_m_2534_ep 	  s_m_3544_ep 	   s_m_4554_ep 		s_m_5564_ep 	 
s_w_1524_ep		 s_w_2534_ep 	  s_w_3544_ep	   s_w_4554_ep 		s_w_5564_ep 
s_m_1524_newp  	 s_m_2534_newp    s_m_3544_newp    s_m_4554_newp  	s_m_5564_newp
s_w_1524_newp  	 s_w_2534_newp    s_w_3544_newp    s_w_4554_newp    s_w_5564_newp
s_m_1524_epnewp  s_m_2534_epnewp  s_m_3544_epnewp  s_m_4554_epnewp  s_m_5564_epnewp 
s_w_1524_epnewp  s_w_2534_epnewp  s_w_3544_epnewp  s_w_4554_epnewp  s_w_5564_epnewp
s_newp_ge1_hiv 

s_ever_ep  s_ever_newp  
s_m1524_ep1524 s_m2534_ep2534 s_m3544_ep3544 s_m4554_ep4554 s_m5564_ep5564 
s_w1524_ep1524 s_w2534_ep2534 s_w3544_ep3544 s_w4554_ep4554 s_w5564_ep5564 

s_m1524_newp_ge1  s_m2534_newp_ge1  s_m3544_newp_ge1  s_m4554_newp_ge1  s_m5564_newp_ge1  
s_m1524_newp_ge5  s_m2534_newp_ge5  s_m3544_newp_ge5  s_m4554_newp_ge5  s_m5564_newp_ge5  
s_w1524_newp_ge1  s_w2534_newp_ge1  s_w3544_newp_ge1  s_w4554_newp_ge1  s_w5564_newp_ge1  
s_w1524_newp_ge5  s_w2534_newp_ge5  s_w3544_newp_ge5  s_w4554_newp_ge5  s_w5564_newp_ge5
s_m1549_newp_ge1  s_w1549_newp_ge1

s_newp_g_m_0    s_newp_g_m_1    s_newp_g_m_2    s_newp_g_m_3    s_newp_g_m_4    s_newp_g_m_5    s_newp_g_m_6 
s_n_newp_g_m_0  s_n_newp_g_m_1  s_n_newp_g_m_2  s_n_newp_g_m_3  s_n_newp_g_m_4  s_n_newp_g_m_5  s_n_newp_g_m_6 
s_newp_g_w_0    s_newp_g_w_1    s_newp_g_w_2    s_newp_g_w_3    s_newp_g_w_4    s_newp_g_w_5    s_newp_g_w_6 
s_n_newp_g_w_0  s_n_newp_g_w_1  s_n_newp_g_w_2  s_n_newp_g_w_3  s_n_newp_g_w_4  s_n_newp_g_w_5  s_n_newp_g_w_6 
s_newp_g_yw_0   s_newp_g_yw_1   s_newp_g_yw_2   s_newp_g_yw_3   s_newp_g_yw_4   s_newp_g_yw_5   s_newp_g_yw_6 
s_n_newp_g_yw_0 s_n_newp_g_yw_1 s_n_newp_g_yw_2 s_n_newp_g_yw_3 s_n_newp_g_yw_4 s_n_newp_g_yw_5 s_n_newp_g_yw_6 
	
s_npgt1conc_l4p_1524m  s_npgt1conc_l4p_1524w  s_npgt1conc_l4p_1519m  s_npgt1conc_l4p_1519w  
s_npgt1conc_l4p_2549m  s_npgt1conc_l4p_2549w  s_npgt1conc_l4p_5064m  s_npgt1conc_l4p_5064w 

s_susc_np_inc_circ_1549_m  s_susc_np_1549_m  s_susc_np_1549_w

s_newp_this_per_art_or_prep   s_newp_this_per_art   s_newp_this_per_prep  s_newp_this_per_prep_sw  s_newp_this_per_elig_prep_any  s_newp_this_per_elig_prep_any_sw
s_newp_this_per  s_newp_sw  s_newp_hivneg  s_newp_this_per_hivneg  s_newp_this_per_hivneg_1549  s_newp_this_per_1549


/*status of partner*/
s_eph0_m  		s_eph0_w  		s_nip   		s_epi
s_newp_hiv  	s_newp_ge1_hiv_diag  			s_epdiag   		s_diag_epun  	s_eponart  		s_epvls
s_hiv1epi0_w  	s_hiv0epi1_w  	s_hiv1epi0_m  	s_hiv0epi1_m  	s_hiv1epi1_m  	s_hiv1epi1_w 
s_primaryepi1_w s_primaryepi1_m s_hiv0epart1_w 	s_hiv0epart1_m
s_hiv0epprim
s_ever_ep_hiv  	s_ever_ep_diag  s_ever_newp_hiv s_ever_newp_diag
s_infected_newp_m  				s_infected_newp_w  				
s_infected_ep_m  				s_infected_ep_w

s_i_vl1000_m_np s_i_v11000_m_ep s_i_vl1000_m_newp
s_i_vl1000_w_np s_i_v11000_w_ep s_i_vl1000_w_newp

s_i_v1_age1_w_np s_i_v1_age2_w_np s_i_v1_age3_w_np s_i_v1_age4_w_np s_i_v1_age5_w_np 
s_i_v1_age1_m_np s_i_v1_age2_m_np s_i_v1_age3_m_np s_i_v1_age4_m_np s_i_v1_age5_m_np 
s_i_v1_age1_w_newp s_i_v1_age2_w_newp s_i_v1_age3_w_newp s_i_v1_age4_w_newp s_i_v1_age5_w_newp 
s_i_v1_age1_m_newp s_i_v1_age2_m_newp s_i_v1_age3_m_newp s_i_v1_age4_m_newp s_i_v1_age5_m_newp 
s_i_v1_age1_w_ep s_i_v1_age2_w_ep s_i_v1_age3_w_ep s_i_v1_age4_w_ep s_i_v1_age5_w_ep 
s_i_v1_age1_m_ep s_i_v1_age2_m_ep s_i_v1_age3_m_ep s_i_v1_age4_m_ep s_i_v1_age5_m_ep 

s_i_v2_age1_w_np s_i_v2_age2_w_np s_i_v2_age3_w_np s_i_v2_age4_w_np s_i_v2_age5_w_np 
s_i_v2_age1_m_np s_i_v2_age2_m_np s_i_v2_age3_m_np s_i_v2_age4_m_np s_i_v2_age5_m_np 
s_i_v2_age1_w_newp s_i_v2_age2_w_newp s_i_v2_age3_w_newp s_i_v2_age4_w_newp s_i_v2_age5_w_newp 
s_i_v2_age1_m_newp s_i_v2_age2_m_newp s_i_v2_age3_m_newp s_i_v2_age4_m_newp s_i_v2_age5_m_newp 
s_i_v2_age1_w_ep s_i_v2_age2_w_ep s_i_v2_age3_w_ep s_i_v2_age4_w_ep s_i_v2_age5_w_ep 
s_i_v2_age1_m_ep s_i_v2_age2_m_ep s_i_v2_age3_m_ep s_i_v2_age4_m_ep s_i_v2_age5_m_ep 

s_i_v3_age1_w_np s_i_v3_age2_w_np s_i_v3_age3_w_np s_i_v3_age4_w_np s_i_v3_age5_w_np 
s_i_v3_age1_m_np s_i_v3_age2_m_np s_i_v3_age3_m_np s_i_v3_age4_m_np s_i_v3_age5_m_np 
s_i_v3_age1_w_newp s_i_v3_age2_w_newp s_i_v3_age3_w_newp s_i_v3_age4_w_newp s_i_v3_age5_w_newp 
s_i_v3_age1_m_newp s_i_v3_age2_m_newp s_i_v3_age3_m_newp s_i_v3_age4_m_newp s_i_v3_age5_m_newp 
s_i_v3_age1_w_ep s_i_v3_age2_w_ep s_i_v3_age3_w_ep s_i_v3_age4_w_ep s_i_v3_age5_w_ep 
s_i_v3_age1_m_ep s_i_v3_age2_m_ep s_i_v3_age3_m_ep s_i_v3_age4_m_ep s_i_v3_age5_m_ep 

s_i_v4_age1_w_np s_i_v4_age2_w_np s_i_v4_age3_w_np s_i_v4_age4_w_np s_i_v4_age5_w_np 
s_i_v4_age1_m_np s_i_v4_age2_m_np s_i_v4_age3_m_np s_i_v4_age4_m_np s_i_v4_age5_m_np 
s_i_v4_age1_w_newp s_i_v4_age2_w_newp s_i_v4_age3_w_newp s_i_v4_age4_w_newp s_i_v4_age5_w_newp 
s_i_v4_age1_m_newp s_i_v4_age2_m_newp s_i_v4_age3_m_newp s_i_v4_age4_m_newp s_i_v4_age5_m_newp 
s_i_v4_age1_w_ep s_i_v4_age2_w_ep s_i_v4_age3_w_ep s_i_v4_age4_w_ep s_i_v4_age5_w_ep 
s_i_v4_age1_m_ep s_i_v4_age2_m_ep s_i_v4_age3_m_ep s_i_v4_age4_m_ep s_i_v4_age5_m_ep 

s_i_v5_age1_w_np s_i_v5_age2_w_np s_i_v5_age3_w_np s_i_v5_age4_w_np s_i_v5_age5_w_np 
s_i_v5_age1_m_np s_i_v5_age2_m_np s_i_v5_age3_m_np s_i_v5_age4_m_np s_i_v5_age5_m_np 
s_i_v5_age1_w_newp s_i_v5_age2_w_newp s_i_v5_age3_w_newp s_i_v5_age4_w_newp s_i_v5_age5_w_newp 
s_i_v5_age1_m_newp s_i_v5_age2_m_newp s_i_v5_age3_m_newp s_i_v5_age4_m_newp s_i_v5_age5_m_newp 
s_i_v5_age1_w_ep s_i_v5_age2_w_ep s_i_v5_age3_w_ep s_i_v5_age4_w_ep s_i_v5_age5_w_ep 
s_i_v5_age1_m_ep s_i_v5_age2_m_ep s_i_v5_age3_m_ep s_i_v5_age4_m_ep s_i_v5_age5_m_ep 

s_i_v6_age1_w_np s_i_v6_age2_w_np s_i_v6_age3_w_np s_i_v6_age4_w_np s_i_v6_age5_w_np 
s_i_v6_age1_m_np s_i_v6_age2_m_np s_i_v6_age3_m_np s_i_v6_age4_m_np s_i_v6_age5_m_np 
s_i_v6_age1_w_newp s_i_v6_age2_w_newp s_i_v6_age3_w_newp s_i_v6_age4_w_newp s_i_v6_age5_w_newp 
s_i_v6_age1_m_newp s_i_v6_age2_m_newp s_i_v6_age3_m_newp s_i_v6_age4_m_newp s_i_v6_age5_m_newp 
s_i_v6_age1_w_ep s_i_v6_age2_w_ep s_i_v6_age3_w_ep s_i_v6_age4_w_ep s_i_v6_age5_w_ep 
s_i_v6_age1_m_ep s_i_v6_age2_m_ep s_i_v6_age3_m_ep s_i_v6_age4_m_ep s_i_v6_age5_m_ep 

s_i_msm s_i_v1_msm s_i_v2_msm s_i_v3_msm s_i_v4_msm s_i_v5_msm s_i_v6_msm  
s_i_pwid s_i_v1_pwid s_i_v2_pwid s_i_v3_pwid s_i_v4_pwid s_i_v5_pwid s_i_v6_pwid 

s_i_age1_m_np s_i_age2_m_np	s_i_age3_m_np	s_i_age4_m_np	s_i_age5_m_np
s_i_age1_w_np	s_i_age2_w_np	s_i_age3_w_np	s_i_age4_w_np	s_i_age5_w_np
s_i_age1_m_newp s_i_age2_m_newp	s_i_age3_m_newp	s_i_age4_m_newp	s_i_age5_m_newp
s_i_age1_w_newp	s_i_age2_w_newp	s_i_age3_w_newp	s_i_age4_w_newp	s_i_age5_w_newp

s_i_m_1549_np  s_i_w_1549_np  s_i_w_newp  s_i_m_newp

s_sdc

/*resistance*/
s_tam1_  s_tam2_  s_tam3_  s_m184m_  s_k103m_  s_y181m_  s_g190m_  s_nnm_  s_q151m_  s_k65m_  
s_p32m_  s_p33m_  s_p46m_  s_p47m_   s_p50vm_  s_p50lm_  s_p54m_   s_p76m_ s_p82m_   s_p84m_   s_p88m_	s_p90m_   s_pim_  
s_in118m_  s_in140m_ s_in148m_  s_in155m_ s_in263m_  s_ca66m_  s_rm_    s_i_nnm   s_i_rm    s_i_pim   s_i_tam   s_i_im  s_inm_    s_i_184m  s_im_art 
s_pim_art s_tam_art s_m184_art s_r_  	 s_r_3tc  s_r_nev  s_r_lpr   s_r_taz   s_r_efa   s_r_ten   s_r_zdv s_r_dol  s_r_cab  s_r_len  s_r_isl
s_rme_   s_iime_  s_nnme_  s_pime_   s_nrtime_
s_res_1stline_startline2  s_nnm_art  s_nnm_art_m  s_nnm_art_w  s_r_art  s_acq_rt65m  s_acq_rt184m  s_acq_rtm  s_onart_iicu_res
s_nactive_art_start_lt2  s_nactive_art_start_lt3  s_nactive_art_start_lt1p5
s_nactive_line2_lt4 	 s_nactive_line2_lt3 	  s_nactive_line2_lt2 		s_nactive_line2_lt1p5  s_pim_line2
s_nn_res_pmtct  s_nn_res_pmtct_art_notdr  s_super_i_r  
s_onart_efa_r  s_onart_efa_r_2l  s_onefa_linefail1_r  
s_ai_naive_no_pmtct_ s_ai_naive_no_pmtct_c_nnm_  s_ai_naive_no_pmtct_e_inm_
s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_inm_   s_ai_naive_no_pmtct_c_rt184m_  s_ai_naive_no_pmtct_c_rt65m_  s_ai_naive_no_pmtct_c_rttams_ 
s_o_dol_2nd_vlg1000 s_o_dol_2nd_vlg1000_dolr1_adh0  s_o_dol_2nd_vlg1000_dolr1_adh1  s_o_dol_2nd_vlg1000_dolr0_adh0 s_o_dol_2nd_vlg1000_dolr0_adh1 s_incident_r_dol

s_ontle  s_vlg1000_ontle  s_vlg1000_184m_ontle  s_vlg1000_65m_ontle  s_vlg1000_nnm_ontle s_ontld  s_vlg1000_ontld  s_vlg1000_65m_ontld 
s_vlg1000_184m_ontld  s_vlg1000_nnm_ontld s_vlg1000_inm_ontld  s_vlg1000_tams_ontle  s_vlg1000_tams_ontld  
s_cur_res_cab  s_cur_res_len s_em_inm_res_o_cab_off_3m  s_em_cam_res_o_len_off_3m
s_emerge_inm_res_cab_tail   s_em_inm_res_o_cab_off_3m_npr 	s_em_inm_res_cab_tail_npr 
s_em_inm_res_o_cab_off_3m_pr  s_emerge_inm_res_cab_tail_pr  s_em_inm_res_o_cab  s_cab_res_emerge_primary  s_res_test_dol 
s_emerge_cam_res_len_tail   s_em_cam_res_o_len_off_3m_npr 	s_em_cam_res_len_tail_npr 
s_em_cam_res_o_len_off_3m_pr  s_emerge_cam_res_len_tail_pr  s_em_cam_res_o_len  s_len_res_emerge_primary

s_r_len_1524m   s_r_len_1524w   s_r_cab_1524m   s_r_cab_1524w   	s_r_len_o_len  s_r_cab_o_cab 


/*prep*/
s_prep_any 		s_prep_oral 	s_prep_cab 		s_prep_len 		s_prep_vr  
s_prep_oral_w  	s_prep_cab_w  	s_prep_len_w  
s_prep_oral_m   s_prep_cab_m  	s_prep_len_m  	s_prep_vr_w   
s_prep_any_sw 	s_prep_oral_sw 	s_prep_cab_sw 	s_prep_len_sw 	s_prep_vr_sw  
s_elig_prep_any_m_1564 	s_elig_prep_any_w_1564
s_infected_prep_any		s_infected_prep_oral	s_infected_prep_cab 	s_infected_prep_len 	s_infected_prep_vr 
s_prep_any_ever  
s_primary_prep  s_primary_prep_oral s_primary_prep_cab s_primary_prep_len s_primary_prep_vr 
s_hiv1_prep_oral  s_prim_r_prep   s_ever_prim_nor_prep  
s_prep_any_elig  s_ever_prim_tdr_prep
s_rt65m_3_prep  s_rt184m_3_prep  s_rtm_3_prep  s_rt65m_6_prep  s_rt184m_6_prep  s_rtm_6_prep 
s_rt65m_9_prep  s_rt184m_9_prep  s_rtm_9_prep  s_rt65m_12_prep  s_rt184m_12_prep  s_rtm_12_prep  
s_rt65m_18_prep s_rt184m_18_prep s_rtm_18_prep  
s_onprep_3  s_onprep_6  s_onprep_9  s_onprep_12  s_onprep_18  

s_prep_any_start s_prep_cab_start s_prep_len_start s_prep_oral_start s_prep_vr_start  s_ever_stopped_prep_oral_choice  s_preprestart 
s_prep_cab_restart s_prep_len_restart s_prep_oral_restart s_prep_vr_restart  s_age_prepstart
s_acq_rt65m_3_prep  s_acq_rt184m_3_prep   s_acq_rtm_3_prep     s_acq_rt65m_6_prep   s_acq_rt184m_6_prep   s_acq_rtm_6_prep 
s_acq_rt65m_9_prep  s_acq_rt184m_9_prep   s_acq_rtm_9_prep     s_acq_rt65m_12_prep  s_acq_rt184m_12_prep  s_acq_rtm_12_prep  
s_acq_rt65m_18_prep s_acq_rt184m_18_prep  s_acq_rtm_18_prep
s_inf_prep_adhg80   s_inf_prep_adh5080    s_inf_prep_adhl50  s_prep_adhg80  s_prep_adh5080  s_prep_adhl50 
s_onprep_1549 s_onprep_m s_onprep_w s_onprep_sw s_onprep_1524 s_onprep_1524w s_onprep_w1524_newpge1_ 
s_init_prep_oral_1524w  s_init_prep_oral_sw	s_init_prep_oral_sdc	s_init_prep_oral_plw
s_init_prep_cab_1524w   s_init_prep_cab_sw  s_init_prep_cab_sdc		s_init_prep_cab_plw
s_init_prep_len_1524w   s_init_prep_len_sw  s_init_prep_len_sdc		s_init_prep_len_plw
s_init_prep_vr_1524w    s_init_prep_vr_sw   s_init_prep_vr_sdc 		s_init_prep_vr_plw
s_prep_oral_ly_1524w  	s_prep_oral_ly_sw  	s_prep_oral_ly_sdc		s_prep_oral_ly_plw
s_prep_cab_ly_1524w   	s_prep_cab_ly_sw   	s_prep_cab_ly_sdc 		s_prep_cab_ly_plw
s_prep_len_ly_1524w   	s_prep_len_ly_sw   	s_prep_len_ly_sdc 		s_prep_len_ly_plw
s_prep_vr_ly_1524w    	s_prep_vr_ly_sw    	s_prep_vr_ly_sdc 		s_prep_vr_ly_plw
s_prep_oral_ever_1524w  s_prep_oral_ever_sw s_prep_oral_ever_sdc	s_prep_oral_ever_plw
s_prep_cab_ever_1524w   s_prep_cab_ever_sw  s_prep_cab_ever_sdc		s_prep_cab_ever_plw 
s_prep_len_ever_1524w   s_prep_len_ever_sw  s_prep_len_ever_sdc		s_prep_len_ever_plw 
s_prep_vr_ever_1524w    s_prep_vr_ever_sw 	s_prep_vr_ever_sdc		s_prep_vr_ever_plw


s_agyw_pg 				s_agyw_plw 
s_prep_any_agyw_pg		s_prep_oral_agyw_pg		s_prep_cab_agyw_pg		s_prep_len_agyw_pg 		s_prep_vr_agyw_pg 
s_prep_any_agyw_plw  	s_prep_oral_agyw_plw  	s_prep_cab_agyw_plw 	s_prep_len_agyw_plw  	s_prep_vr_agyw_plw

s_elig_prep_any_sw 		s_elig_prep_any_sdc	s_elig_prep_any_plw 

s_onprep_cab_m s_onprep_cab_w s_onprep_len_m s_onprep_len_w s_onprep_vr_w s_onprep_oral_m  s_onprep_oral_w s_elig_prep_any_w_1549 	s_prep_any_w_1549 

s_elig_prep_any_w_1524 	s_elig_prep_any_w_2534 	s_elig_prep_any_w_3544 
s_prep_any_w_1524      	s_prep_any_w_2534      	s_prep_any_w_3544 
s_prep_oral_w_1524 		s_prep_cab_w_1524 		s_prep_len_w_1524 		s_prep_vr_w_1524 
s_prep_any_sdc			s_prep_oral_sdc			s_prep_cab_sdc			s_prep_len_sdc			s_prep_vr_sdc
s_prep_any_plw			s_prep_oral_plw			s_prep_cab_plw			s_prep_len_plw			s_prep_vr_plw

s_inf_prep_any_source_prep_r 	s_prepinfect_prep_r     			s_prepinfect_prep_r_p   			s_infected_prep_no_r    		s_infected_prep_r  
s_started_prep_any_in_primary	s_started_prep_oral_in_primary		s_started_prep_cab_in_primary		s_started_prep_len_in_primary	s_started_prep_vr_in_primary
s_prepinfect_rm_p      			s_prepinfect_m184m_p    			s_prepinfect_k65m_p 
s_prepinfect_tam_p 			   	s_prepinfect_rtm  	   				s_prepinfect_k65m	   				s_prepinfect_m184m  	   		s_prepinfect_tam  
s_prep_any_willing  		   	s_stop_prep_oral_choice				s_stop_prep_any_choice      		s_started_prep_hiv_test_sens  
s_cur_res_prep_drug 		   	s_started_prep_hiv_test_sens_e	
s_started_prep_any_in_primary_e	s_started_prep_oral_in_primary_e	s_started_prep_cab_in_primary_e		s_started_prep_len_in_primary_e	s_started_prep_vr_in_primary_e

s_onprep_3_i_prep_no_r  		s_onprep_6_i_prep_no_r  			s_onprep_9_i_prep_no_r 
s_onprep_12_i_prep_no_r 	   	s_onprep_18_i_prep_no_r 			s_prepinfect_rm_p      				s_prepinfect_m184m_p    		s_prepinfect_k65m_p 

s_cur_res_ten				   	s_cur_res_3tc  		   				s_i_65m 				   			s_cur_res_efa 			
s_cur_res_ten_vlg1000 		   	s_cur_res_3tc_vlg1000 				s_cur_res_efa_vlg1000				s_ever_hiv1_prep_oral 
s_cur_res_efa_ever_hiv1_prep   	s_cur_res_ten_ever_hiv1_prep   		s_cur_res_3tc_ever_hiv1_prep   
s_prep_oral_effect_non_res_v 
s_prep_3m_after_inf_no_r 	s_prep_3m_after_inf_no_r_184  s_prep_3m_after_inf_no_r_65
s_prep_6m_after_inf_no_r  s_prep_6m_after_inf_no_r_184  s_prep_6m_after_inf_no_r_65  s_prep_12m_after_inf_no_r  
s_prep_12m_after_inf_no_r_184  s_prep_12m_after_inf_no_r_65
s_hiv_prep_reason_1  s_hiv_prep_reason_2  s_hiv_prep_reason_3  s_hiv_prep_reason_4

s_prep_newp s_prep_newpg0  s_prep_newpg1  s_prep_newpg2  s_prep_newpg3  s_prep_newpg4  
s_newp_this_per_age1524w_onprep  s_newp_this_per_age1524w  s_prep_any_ever_w_1524  s_prep_any_ever_w
s_test_gt_per1_on_prep_oral  s_test_gt_per1_on_prep_oral_pos  s_test_per1_on_prep_oral  s_test_per1_on_prep_oral_pos  
s_prob_prep_any_restart_choice
s_prep_oral_past_year s_tot_yrs_prep_oral_gt_5  s_tot_yrs_prep_oral_gt_10   s_tot_yrs_prep_oral_gt_20
s_tot_yrs_prep_cab_gt_5  s_tot_yrs_prep_cab_gt_10   s_tot_yrs_prep_cab_gt_20
s_tot_yrs_prep_len_gt_5  s_tot_yrs_prep_len_gt_10   s_tot_yrs_prep_len_gt_20
s_tot_yrs_prep_vr_gt_5  s_tot_yrs_prep_vr_gt_10   s_tot_yrs_prep_vr_gt_20
s_pop_wide_tld_prep	 s_tld_notest_notprepelig_pos s_tld_notest_notprepelig_neg
s_prep_any_elig_past_year s_prep_any_elig_past_3year  s_prep_any_elig_past_5year s_newp_prep_any s_newp_prep_oral s_newp_prep_cab s_newp_prep_len s_newp_prep_vr 
s_prop_elig_years_onprep_ayear_i  s_continuous_prep_oral_ge1yr
			
s_pop_wide_tld_as_art

s_newp_this_per_hivneg_m   s_newp_this_per_hivneg_w   s_newp_this_per_hivneg_age1524w   s_newp_this_per_hivneg_sw  
s_newp_this_per_hivneg_m_prep   s_newp_this_per_hivneg_w_prep  s_newp_tp_hivneg_age1524w_prep   s_newp_this_per_hivneg_sw_prep s_pep_not_prep

s_testfor_prep_oral  s_testfor_prep_cab s_testfor_prep_len s_testfor_prep_vr   s_prep_oral s_prep_cab s_prep_len s_prep_vr s_prep_oral_ever  s_prep_cab_ever  
s_prep_len_ever  s_prep_vr_ever s_last_prep_used  s_stop_prep_cab_choice s_stop_prep_len_choice 
s_stop_prep_oral_elig  s_stop_prep_cab_elig  s_stop_prep_len_elig s_stop_prep_any_elig s_prep_oral_willing s_prep_cab_willing  s_prep_len_willing
s_prep_oral_at_infection s_prep_cab_at_infection s_prep_len_at_infection 
s_stop_prep_vr_elig  s_prep_vr_willing s_prep_vr_at_infection 

s_cab_res_o_cab s_cab_res_tail s_cab_res_primary s_currently_in_prep_cab_tail s_prep_cab_ever_hiv s_cab_res_prep_cab_primary
s_len_res_o_len s_len_res_tail s_len_res_primary s_currently_in_prep_len_tail s_prep_len_ever_hiv s_len_res_prep_len_primary

s_prep_vr_ever_hiv 

s_hiv_cab_3m s_hiv_cab_6m s_hiv_cab_9m   s_hiv_cab_ge12m s_hiv_len_3m s_hiv_len_6m s_hiv_len_9m   s_hiv_len_ge12m

s_switch_prep_from_oral  s_switch_prep_from_cab  s_switch_prep_from_len s_switch_prep_from_vr s_switch_prep_to_oral  s_switch_prep_to_cab 
 s_switch_prep_to_len s_switch_prep_to_vr 
 s_hiv1_prep_any s_hiv1_prep_cab  s_hiv1_prep_len s_hiv1_prep_vr  s_cur_in_prep_cab_tail_hiv  s_cur_in_prep_len_tail_hiv
s_cur_in_prep_cab_tail_no_r  s_prep_o_cab_off_3m_prim  s_cur_in_prep_len_tail_no_r  s_prep_o_len_off_3m_prim 

s_prep_primary_prevented  s_prep_cab_init_prim  s_prep_len_init_prim s_prep_vr_init_prim  s_prep_cab_init_prim_res s_prep_len_init_prim_res
s_prep_cab_reinit_prim s_prep_len_reinit_prim  s_prep_vr_reinit_prim  s_prep_cab_reinit_prim_res  s_cur_in_prep_cab_tail_prim 
 s_prep_len_reinit_prim_res  s_cur_in_prep_len_tail_prim 
s_start_restart_prep_oral_hiv s_start_restart_prep_cab_hiv s_start_restart_prep_len_hiv s_start_restart_prep_vr_hiv s_start_rest_prep_cab_hiv_cabr 
 s_start_rest_prep_len_hiv_lenr 
s_infected_on_prep_oral s_infected_on_prep_cab  s_infected_on_prep_len s_infected_on_prep_vr  
s_on_risk_informed_prep_oral s_on_risk_informed_prep_cab s_on_risk_informed_prep_len s_on_risk_informed_prep_vr
s_start_restart_prep_oral s_start_restart_prep_cab s_start_restart_prep_cab_prim  s_start_rest_prep_cab_prim_cabr
 s_start_restart_prep_len s_start_restart_prep_len_prim  s_start_rest_prep_len_prim_lenr
s_start_restart_prep_vr s_start_restart_prep_vr_prim 

s_all_prep_criteria  s_all_prep_criteria_hivneg  s_prep_elig_hivneg s_prep_elig_hivneg_onprep   s_prep_elig_onprep s_prep_elig_onprep_cab  s_prep_elig_onprep_len 
s_prep_elig_onprep_vr 
s_started_prep_cab_hiv s_started_prep_len_hiv s_started_prep_vr_hiv s_started_prep_any_hiv  s_pop_wide_tld_hiv   s_pop_wide_tld_prep_elig  s_pop_wide_tld_neg_prep_inelig 



/*testing and diagnosis*/
s_tested  s_tested_m  s_tested_f  s_tested_f_non_anc  s_tested_ancpd s_test_anclabpd s_tested_1524w s_tested_f_anc  s_ever_tested_m  s_ever_tested_w  s_firsttest
s_firsttest_anc 	s_firsttest_labdel 	s_firsttest_pd 		s_tested1549_		s_tested1549m       s_tested1549w
s_tested_4p_m1549_ 	s_tested_4p_m1519_ 	s_tested_4p_m2024_ s_tested_4p_m2529_  s_tested_4p_m3039_  s_tested_4p_m4049_  s_tested_4p_m5064_
s_tested_4p_w1549_ 	s_tested_4p_w1519_ 	s_tested_4p_w2024_ s_tested_4p_w2529_  s_tested_4p_w3039_  s_tested_4p_w4049_  s_tested_4p_w5064_ 
s_tested_4p_sw		s_tested_sw

s_ever_tested_m1549_  s_ever_tested_m1519_  s_ever_tested_m2024_  s_ever_tested_m2529_  s_ever_tested_m3034_  s_ever_tested_m3539_
s_ever_tested_m4044_  s_ever_tested_m4549_  s_ever_tested_m5054_  s_ever_tested_m5559_  s_ever_tested_m6064_ 
s_ever_tested_w1549_  s_ever_tested_w1519_  s_ever_tested_w2024_  s_ever_tested_w2529_  s_ever_tested_w3034_  s_ever_tested_w3539_
s_ever_tested_w4044_  s_ever_tested_w4549_  s_ever_tested_w5054_  s_ever_tested_w5559_  s_ever_tested_w6064_
s_ever_tested_sw	  

s_elig_test_who4  s_elig_test_non_tb_who3  s_elig_test_tb  s_elig_test_who4_tested  s_elig_test_tb_tested  s_elig_test_non_tb_who3_tested  
s_com_test  s_tested_anc_prevdiag  s_tested_anc  s_tested_labdel s_tested_pd		
s_tested_as_sw  s_tested_m_sympt  s_tested_f_sympt  s_tested_f_progsw  s_tested_m_circ  
s_rate_1sttest   s_rate_reptest  s_newp_lasttest_tested_this_per
s_acc_test  s_acc_test_1524_  s_acc_test_2549_  s_acc_test_5064_  s_acc_test_sw  

s_diag
s_diag_m1549_  s_diag_m1519_  s_diag_m2024_  s_diag_m2529_  s_diag_m3034_  s_diag_m3539_  s_diag_m4044_  s_diag_m4549_ 
s_diag_m5054_  s_diag_m5559_  s_diag_m6064_ 
s_diag_w1549_  s_diag_w1519_  s_diag_w2024_  s_diag_w2529_  s_diag_w3034_  s_diag_w3539_  s_diag_w4044_  s_diag_w4549_ 
s_diag_w5054_  s_diag_w5559_  s_diag_w6064_  s_diag_sw 
s_nn_tdr_diag
 	s_diag_m_1524  s_diag_m_2549  s_diag_m_50pl 
	s_diag_w_1524  s_diag_w_2549  s_diag_w_50pl 

s_diag_this_period  s_diag_this_period_m  s_diag_this_period_f  s_diag_this_period_f_non_anc  s_diag_this_period_f_anc  s_diag_this_period_f_labdel s_diag_this_period_f_pd
s_diag_this_period_m_sympt  s_diag_this_period_f_sympt  s_diag_thisper_anclabpd  s_diag_thisper_progsw  s_diag_thisper_sw  s_diag_thisper_1524f 
s_sympt_diag  s_sympt_diag_ever  s_diag_m  s_diag_w  s_epdiag_m  s_epdiag_w	 s_epi_m  s_epi_w
s_diag_ep
s_year_1_infection  s_year_2_infection  s_year_3_infection  s_year_4_infection  s_year_5_infection  
s_year_1_infection_diag  s_year_2_infection_diag  s_year_3_infection_diag  s_year_4_infection_diag  s_year_5_infection_diag  
s_not_on_art_cd4l50 s_not_on_art_cd4l200  s_not_on_art_cd4200350 s_not_on_art_cd4350500 s_not_on_art_cd4ge500  
s_asympt_Undiag s_asympt_diagoffart s_asympt_diagonart s_sympt_notaids s_sympt_aids 
s_diag_age1564  s_diag_m_age1564  s_diag_w_age1564  s_hard_reach s_tested_at_return   s_test_not_costed
s_self_tested s_self_tested_m s_self_tested_w s_tested_due_to_self_test s_diagnosed_self_test


/*VL and CD4*/
s_vlg1  s_vlg2  s_vlg3  s_vlg4  s_vlg5  s_vlg6
s_line1_vlg1000 s_line2_vlg1000  s_res_vfail1
s_u_vfail1_this_period  s_u_vfail1  s_vl_vfail1_g1 s_vl_vfail1_g2 s_vl_vfail1_g3 s_vl_vfail1_g4 s_vl_vfail1_g5 s_vl_vfail1_g6 
s_vlg1000_onart  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_184m  s_vlg1000_onart_65m  s_sw_vg1000  s_diag_vl1000
s_vg1000  s_vg1000_1549  s_vg1000_m  s_vg1000_w  s_vg1000_w_1524  s_vg1000_m_1524  s_r_vg50  s_r_vg200  s_r_vg1000 
s_vl1000	s_vl1000_art	 s_onart_iicu    s_vl1000_art_iicu    s_onart_gt6m    s_vl1000_art_gt6m    s_onart_gt6m_iicu    s_vl1000_art_gt6m_iicu
s_vl1000_m  s_vl1000_art_m   s_onart_iicu_m  s_vl1000_art_iicu_m  s_onart_gt6m_m  s_vl1000_art_gt6m_m  s_onart_gt6m_iicu_m  s_vl1000_art_gt6m_iicu_m  
s_vl1000_w  s_vl1000_art_w   s_onart_iicu_w  s_vl1000_art_iicu_w  s_onart_gt6m_w  s_vl1000_art_gt6m_w  s_onart_gt6m_iicu_w  s_vl1000_art_gt6m_iicu_w  

s_vl1000_art_1524_m    s_vl1000_art_2549_m   s_vl1000_art_50pl_m  	s_vl1000_art_1524_w    s_vl1000_art_2549_w  s_vl1000_art_50pl_w s_vl1000_art_sw

s_vl1000_art_1524_  s_onart_iicu_1524_  s_vl1000_art_iicu_1524_  s_onart_gt6m_1524_  s_vl1000_art_gt6m_1524_  s_onart_gt6m_iicu_1524_  s_vl1000_art_gt6m_iicu_1524_
s_vl1000_art_2549_  s_onart_iicu_2549_  s_vl1000_art_iicu_2549_  s_onart_gt6m_2549_  s_vl1000_art_gt6m_2549_  s_onart_gt6m_iicu_2549_  s_vl1000_art_gt6m_iicu_2549_
s_vl1000_art_50pl_  s_onart_iicu_50pl_  s_vl1000_art_iicu_50pl_  s_onart_gt6m_50pl_  s_vl1000_art_gt6m_50pl_  s_onart_gt6m_iicu_50pl_  s_vl1000_art_gt6m_iicu_50pl_
s_vl1000_art_incintcun_sw s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw
s_vl1000_artgt6miicu_w1524evpr s_onartgt6miicu_w1524evpr
s_u_vfail1_dol_this_period   s_o_dol_at_risk_uvfail
s_elig_treat200  s_elig_treat350  s_elig_treat500  s_cl100 s_cl50  s_cl200  s_cl350  s_cd4art_started_this_period  s_cd4diag_diag_this_period

/*ART*/
s_naive    		s_naive_m       s_naive_w      
s_onart  		s_int_clinic_not_aw
s_art_start  	s_art_start_m   s_art_start_w   
s_artexp  		s_artexp_m 		s_artexp_w 		s_artexp_1524_ 	s_artexp_sw 	s_artexp_w1524evpreg
s_artexpoff  
s_onart_m  		s_onart_w		s_onart_sw		s_onart_w1524evpreg
s_onart_m1549_  s_onart_m1564_  s_onart_m1519_  s_onart_m2024_  s_onart_m2529_  s_onart_m3034_  s_onart_m3539_  
s_onart_m4044_  s_onart_m4549_  s_onart_m5054_  s_onart_m5559_  s_onart_m6064_	
s_onart_m6569_	s_onart_m7074_	s_onart_m7579_	s_onart_m8084_	s_onart_m85pl_	
s_onart_w1549_  s_onart_w1564_  s_onart_w1519_  s_onart_w2024_  s_onart_w2529_  s_onart_w3034_  s_onart_w3539_  
s_onart_w4044_  s_onart_w4549_  s_onart_w5054_  s_onart_w5559_  s_onart_w6064_	
s_onart_w6569_	s_onart_w7074_	s_onart_w7579_	s_onart_w8084_	s_onart_w85pl_

s_art_dur_l6m   s_art_dur_g6m   s_art_tdur_l6m  s_art_tdur_g6m
s_eponart_m	 	s_eponart_w  	s_hiv1564_onart s_non_tb_who3_art_init  s_who4_art_init  s_art_start_pregnant 

s_lpr  s_dar s_taz  s_3tc  s_nev  s_efa  s_ten  s_zdv  s_dol  s_cab s_len s_failed_lencab s_o_cab_or_o_cab_tm1  s_o_cab_or_o_cab_tm1_no_r  s_o_cab_or_o_cab_tm1_no_r_prim
s_o_len_1524m  s_o_len_1524w s_o_cab_1524m  s_o_cab_1524w s_o_len_or_o_len_tm1  s_o_len_or_o_len_tm1_no_r  s_o_len_or_o_len_tm1_no_r_prim  
s_o_len_vl1000  s_o_cab_vl1000  s_o_len_2534m  s_o_len_3549m   s_o_len_50plm  	s_o_len_2534w 	s_o_len_3549w   s_o_len_50plw 
s_onefa_linefail1  s_ev_art_g1k_l1k  s_ev_art_g1k_not2l  s_ev_art_g1k_not2l_l1k  s_ev_art_g1k  s_ev_art_g1k_not2l_adc
s_art_12m  s_vl1000_art_12m  s_art_24m  s_vl1000_art_24m  s_art_12m_onart  s_vl1000_art_12m_onart
s_startedline2  s_start_line2_this_period  s_line2_12m  s_line2_12m_onart  s_line2_incl_int_clinic_not_aw s_ever_len_art s_ever_len_art_res_len

s_onart_vlg1000  s_ever_onart_gt6m_vlg1000   s_ever_onart_gt6m_vl_m_g1000  s_onart_gt6m_vlg1000  s_r_onart_gt6m_vlg1000
s_onart_gt6m_nnres_vlg1000  s_onart_gt6m_pires_vlg1000  s_onart_gt6m_res_vlg1000
s_online1_vg1000  s_online1_vg1000_lf1  s_online1_vg1000_cd4l200  s_offart_vl1000
s_vl1000_line2_12m  s_vl1000_line2_12m_onart  s_vl1000_line2

s_offart  s_line1_  s_line2_  s_line1_lf0  s_line1_lf1  s_line2_lf1  s_line2_lf2  s_linefail_ge1  s_line1_fail_this_period
s_lf1_past_yr   s_lf1_past_yr_line2 
s_onart_cl200  s_onart_cd4_g500  s_onart_res  

s_adh_low  s_adh_med  s_adh_hi s_adhav_low_onart  s_adhav_hi_onart 

s_v_alert_past_yr  s_v_alert_past_yr_rm  s_v_alert_past_yr_vl1000  s_v_alert_past_yr_adc  s_v_alert_past_yr_dead
s_v_alert_6m_ago_onart  s_v_alert_6m_ago_onart_vl1000  s_v_alert_past_yr_rm_c  s_e_v_alert_6m_ago_onart  s_e_v_alert_6m_ago_onart_vl1000
s_v_alert_3m_ago_onart  s_v_alert_3m_ago_onart_vl1000  s_v_alert_9m_ago_onart  s_v_alert_9m_ago_onart_vl1000   
s_v_alert_2y_ago_onart    s_v_alert_2y_ago_onart_vl1000
s_m6_after_alert  s_m6_after_alert_vl1000

s_c_tox  s_cur_dol_cns_tox  s_cur_efa_cns_tox  

s_prev_oth_dol_adv_birth_e 
s_pregnant_oth_dol_adv_birth_e

s_r_dol_ten3tc_r_f_1 s_outc_ten3tc_r_f_1_1 s_outc_ten3tc_r_f_1_2  s_outc_ten3tc_r_f_1_3  s_outc_ten3tc_r_f_1_4  s_outc_ten3tc_r_f_1_5  
s_outc_ten3tc_r_f_1_6  s_outc_ten3tc_r_f_1_7

s_drug_level_test    s_tle s_tld s_zld s_zla s_otherreg

s_no_recent_vm_gt1000 s_no_recent_vm_gt1000_dol  s_no_recent_vm_gt1000_efa
s_recent_vm_gt1000 s_recent_vm_gt1000_dol  s_recent_vm_gt1000_efa s_recent_vm_gt1000_zdv

s_o_zdv_tox s_o_3tc_tox s_o_ten_tox s_o_taz_tox s_o_lpr_tox s_o_efa_tox s_o_nev_tox s_o_dol_tox 
s_o_zdv_adh_hi s_o_3tc_adh_hi s_o_ten_adh_hi s_o_taz_adh_hi s_o_lpr_adh_hi s_o_efa_adh_hi s_o_nev_adh_hi s_o_dol_adh_hi 

s_o_tle_tox s_o_tld_tox s_o_zld_tox s_o_zla_tox s_o_tle_adh_hi  s_o_tld_adh_hi  s_o_zld_adh_hi  s_o_zla_adh_hi 

s_a_zld_if_reg_op_116  s_adh_hi_a_zld_if_reg_op_116  s_nac_ge2p75_a_zld_if_reg_op_116  s_nac_ge2p00_a_zld_if_reg_op_116  s_nac_ge1p50_a_zld_if_reg_op_116

s_start_zld_if_reg_op_116   s_onart_start_zld_if_reg_op_116   s_e_rt65m_st_zld_if_reg_op_116  s_n_zld_if_reg_op_116  s_x_n_zld_if_reg_op_116 

s_per1_art_int s_per2_art_int	s_dead_per1_art_int	s_dead_per2_art_int  s_cd4_before_int	s_cd4_before_int_lt100   	s_cd4_before_int_100200 
s_cd4_per1_art_int 	s_cd4_per1_art_int_lt100	s_cd4_per1_art_int_100200 s_cd4_per2_art_int 	s_cd4_per2_art_int_lt100	s_cd4_per2_art_int_100200

s_started_art_as_tld_prep_vl1000    s_onart_as_tld_prep   s_onart_as_tld_prep_vl1000     s_started_art_as_tld_prep 	s_restart   s_art_initiation 

s_vl1000_art_age1564  s_onart_age1564   s_infected_in118m s_infected_in140m s_infected_in148m  s_infected_in155m s_infected_in263m s_infected_ca66m

s_infected_inm  s_infected_inm_this_per

s_onartvisit0 s_onartvisit0_vl1000

s_dol_pi_fail_by_tld_switch_year  s_any_vfail_by_tld_switch_year

s_tldsw_elig  s_o_dar_tldsw   s_o_dol_tldsw    s_onart_tldsw    s_vl1000_tldsw 	s_vl200_tldsw  s_dead_tldsw  s_dead_hiv_tldsw  s_c_tox_tldsw  s_r_dol_ge_p5_tldsw 
s_uvl2_elig  s_o_dar_uvl2   s_o_dol_uvl2    s_onart_uvl2    s_vl1000_uvl2 	s_vl200_uvl2  s_dead_uvl2  s_dead_hiv_uvl2  s_c_tox_uvl2  s_r_dol_ge_p5_uvl2 
s_adhl_ge80_uvl2 s_onart_iicu_tldsw s_adh_lt80_tldsw  s_onart_iicu_uvl2 s_adh_lt80_uvl2 s_vis_uvl2  s_vis_tldsw s_cd4_lt200_uvl2 s_r_ten_tldsw s_r_3tc_tldsw

s_tldsw1_elig  s_o_dar_tldsw1   s_o_dol_tldsw1    s_onart_tldsw1    s_vl1000_tldsw1 	s_vl200_tldsw1  s_dead_tldsw1  s_dead_hiv_tldsw1  s_c_tox_tldsw1  s_r_dol_ge_p5_tldsw1 
s_uvl21_elig  s_o_dar_uvl21   s_o_dol_uvl21    s_onart_uvl21    s_vl1000_uvl21 	s_vl200_uvl21  s_dead_uvl21  s_dead_hiv_uvl21  s_c_tox_uvl21  s_r_dol_ge_p5_uvl21 
s_adhl_ge80_uvl21 s_onart_iicu_tldsw1 s_adh_lt80_tldsw1  s_onart_iicu_uvl21 s_adh_lt80_uvl21 s_vis_uvl21  s_vis_tldsw1 s_cd4_lt200_uvl21

s_tldsw2_elig  s_o_dar_tldsw2   s_o_dol_tldsw2    s_onart_tldsw2    s_vl1000_tldsw2 	s_vl200_tldsw2  s_dead_tldsw2  s_dead_hiv_tldsw2  s_c_tox_tldsw2  s_r_dol_ge_p5_tldsw2 
s_uvl22_elig  s_o_dar_uvl22   s_o_dol_uvl22    s_onart_uvl22    s_vl1000_uvl22 	s_vl200_uvl22  s_dead_uvl22  s_dead_hiv_uvl22  s_c_tox_uvl22  s_r_dol_ge_p5_uvl22 
s_adhl_ge80_uvl22 s_onart_iicu_tldsw2 s_adh_lt80_tldsw2  s_onart_iicu_uvl22 s_adh_lt80_uvl22 s_vis_uvl22  s_vis_tldsw2 s_cd4_lt200_uvl22

s_dol_pi_failed

s_dead_dol_r_uvl2  s_second_vlg1000_first  s_second_vlg1000_first_dol_r 

s_vl1000_onart_1524m  s_vl1000_onart_1524w  s_vl1000_1524m  s_vl1000_1524w 	 s_started_lencab_vmgt1000  s_started_lencab s_started_lencab_offart
s_offered_return_lencab_this_per   s_o_len_plw   s_hiv_breastfeeding 


/* note s_ variables below are for up to age 80 */

s_diagnosed_dead 
s_art_3m_bcd4_lt100  s_art_3m_bcd4_lt100_adead s_art_6m_bcd4_lt100 	s_art_6m_bcd4_lt100_adead  s_art_9m_bcd4_lt100 
s_art_9m_bcd4_lt100_adead s_art_12m_bcd4_lt100 s_art_12m_bcd4_lt100_adead s_art_15m_bcd4_lt100 s_art_15m_bcd4_lt100_adead s_art_18m_bcd4_lt100 
s_art_18m_bcd4_lt100_adead s_art_21m_bcd4_lt100 s_art_21m_bcd4_lt100_adead s_art_24m_bcd4_lt100  s_art_24m_bcd4_lt100_adead s_art_27m_bcd4_lt100  
s_art_27m_bcd4_lt100_adead s_art_30m_bcd4_lt100  s_art_30m_bcd4_lt100_adead s_art_33m_bcd4_lt100  s_art_33m_bcd4_lt100_adead s_art_36m_bcd4_lt100  
s_art_36m_bcd4_lt100_adead s_art_39m_bcd4_lt100  s_art_39m_bcd4_lt100_adead s_art_42m_bcd4_lt100 s_art_42m_bcd4_lt100_adead s_art_45m_bcd4_lt100  
s_art_45m_bcd4_lt100_adead s_art_48m_bcd4_lt100  s_art_48m_bcd4_lt100_adead s_art_51m_bcd4_lt100 s_art_51m_bcd4_lt100_adead s_art_54m_bcd4_lt100 
s_art_54m_bcd4_lt100_adead s_art_57m_bcd4_lt100 s_art_57m_bcd4_lt100_adead s_art_60m_bcd4_lt100 s_art_60m_bcd4_lt100_adead 

s_art_3m_bcd4_100200  s_art_3m_bcd4_100200_adead s_art_6m_bcd4_100200 	s_art_6m_bcd4_100200_adead  s_art_9m_bcd4_100200 
s_art_9m_bcd4_100200_adead s_art_12m_bcd4_100200 s_art_12m_bcd4_100200_adead s_art_15m_bcd4_100200 s_art_15m_bcd4_100200_adead s_art_18m_bcd4_100200 
s_art_18m_bcd4_100200_adead s_art_21m_bcd4_100200 s_art_21m_bcd4_100200_adead s_art_24m_bcd4_100200  s_art_24m_bcd4_100200_adead s_art_27m_bcd4_100200  
s_art_27m_bcd4_100200_adead s_art_30m_bcd4_100200  s_art_30m_bcd4_100200_adead s_art_33m_bcd4_100200  s_art_33m_bcd4_100200_adead s_art_36m_bcd4_100200  
s_art_36m_bcd4_100200_adead s_art_39m_bcd4_100200  s_art_39m_bcd4_100200_adead s_art_42m_bcd4_100200 s_art_42m_bcd4_100200_adead s_art_45m_bcd4_100200  
s_art_45m_bcd4_100200_adead s_art_48m_bcd4_100200  s_art_48m_bcd4_100200_adead s_art_51m_bcd4_100200 s_art_51m_bcd4_100200_adead s_art_54m_bcd4_100200 
s_art_54m_bcd4_100200_adead s_art_57m_bcd4_100200 s_art_57m_bcd4_100200_adead s_art_60m_bcd4_100200 s_art_60m_bcd4_100200_adead

s_art_3m_bcd4_200350  s_art_3m_bcd4_200350_adead s_art_6m_bcd4_200350 	s_art_6m_bcd4_200350_adead  s_art_9m_bcd4_200350 
s_art_9m_bcd4_200350_adead s_art_12m_bcd4_200350 s_art_12m_bcd4_200350_adead s_art_15m_bcd4_200350 s_art_15m_bcd4_200350_adead s_art_18m_bcd4_200350 
s_art_18m_bcd4_200350_adead s_art_21m_bcd4_200350 s_art_21m_bcd4_200350_adead s_art_24m_bcd4_200350  s_art_24m_bcd4_200350_adead s_art_27m_bcd4_200350  
s_art_27m_bcd4_200350_adead s_art_30m_bcd4_200350  s_art_30m_bcd4_200350_adead s_art_33m_bcd4_200350  s_art_33m_bcd4_200350_adead s_art_36m_bcd4_200350  
s_art_36m_bcd4_200350_adead s_art_39m_bcd4_200350  s_art_39m_bcd4_200350_adead s_art_42m_bcd4_200350 s_art_42m_bcd4_200350_adead s_art_45m_bcd4_200350  
s_art_45m_bcd4_200350_adead s_art_48m_bcd4_200350  s_art_48m_bcd4_200350_adead s_art_51m_bcd4_200350 s_art_51m_bcd4_200350_adead s_art_54m_bcd4_200350 
s_art_54m_bcd4_200350_adead s_art_57m_bcd4_200350 s_art_57m_bcd4_200350_adead s_art_60m_bcd4_200350 s_art_60m_bcd4_200350_adead

s_art_3m_bcd4_350500  s_art_3m_bcd4_350500_adead s_art_6m_bcd4_350500 	s_art_6m_bcd4_350500_adead  s_art_9m_bcd4_350500 
s_art_9m_bcd4_350500_adead s_art_12m_bcd4_350500 s_art_12m_bcd4_350500_adead s_art_15m_bcd4_350500 s_art_15m_bcd4_350500_adead s_art_18m_bcd4_350500 
s_art_18m_bcd4_350500_adead s_art_21m_bcd4_350500 s_art_21m_bcd4_350500_adead s_art_24m_bcd4_350500  s_art_24m_bcd4_350500_adead s_art_27m_bcd4_350500  
s_art_27m_bcd4_350500_adead s_art_30m_bcd4_350500  s_art_30m_bcd4_350500_adead s_art_33m_bcd4_350500  s_art_33m_bcd4_350500_adead s_art_36m_bcd4_350500  
s_art_36m_bcd4_350500_adead s_art_39m_bcd4_350500  s_art_39m_bcd4_350500_adead s_art_42m_bcd4_350500 s_art_42m_bcd4_350500_adead s_art_45m_bcd4_350500  
s_art_45m_bcd4_350500_adead s_art_48m_bcd4_350500  s_art_48m_bcd4_350500_adead s_art_51m_bcd4_350500 s_art_51m_bcd4_350500_adead s_art_54m_bcd4_350500 
s_art_54m_bcd4_350500_adead s_art_57m_bcd4_350500 s_art_57m_bcd4_350500_adead s_art_60m_bcd4_350500 s_art_60m_bcd4_350500_adead

s_art_3m_bcd4_ge500  s_art_3m_bcd4_ge500_adead s_art_6m_bcd4_ge500 	s_art_6m_bcd4_ge500_adead  s_art_9m_bcd4_ge500 
s_art_9m_bcd4_ge500_adead s_art_12m_bcd4_ge500 s_art_12m_bcd4_ge500_adead s_art_15m_bcd4_ge500 s_art_15m_bcd4_ge500_adead s_art_18m_bcd4_ge500 
s_art_18m_bcd4_ge500_adead s_art_21m_bcd4_ge500 s_art_21m_bcd4_ge500_adead s_art_24m_bcd4_ge500  s_art_24m_bcd4_ge500_adead s_art_27m_bcd4_ge500  
s_art_27m_bcd4_ge500_adead s_art_30m_bcd4_ge500  s_art_30m_bcd4_ge500_adead s_art_33m_bcd4_ge500  s_art_33m_bcd4_ge500_adead s_art_36m_bcd4_ge500  
s_art_36m_bcd4_ge500_adead s_art_39m_bcd4_ge500  s_art_39m_bcd4_ge500_adead s_art_42m_bcd4_ge500 s_art_42m_bcd4_ge500_adead s_art_45m_bcd4_ge500  
s_art_45m_bcd4_ge500_adead s_art_48m_bcd4_ge500  s_art_48m_bcd4_ge500_adead s_art_51m_bcd4_ge500 s_art_51m_bcd4_ge500_adead s_art_54m_bcd4_ge500 
s_art_54m_bcd4_ge500_adead s_art_57m_bcd4_ge500 s_art_57m_bcd4_ge500_adead s_art_60m_bcd4_ge500 s_art_60m_bcd4_ge500_adead


/*costs and dalys (default to age 80) */
s_cost				s_art_cost		s_onart_cost		s_cd4_cost		s_vl_cost		s_vis_cost		s_full_vis_cost		s_adc_cost  
s_non_tb_who3_cost	s_cot_cost		s_tb_cost			s_cost_test		s_res_cost		s_cost_circ		s_cost_condom_dn 
s_dtb_lam_cost		s_tb_lam_cost	s_dtb_proph_cost	s_tb_proph_cost	s_dcrag_cost	s_crag_cost		s_dcrypm_proph_cost	s_crypm_proph_cost 
s_dsbi_proph_cost  	s_sbi_proph_cost 
s_cost_sw_program			s_t_adh_int_cost			s_cost_test_m  			s_cost_test_f 		s_cost_prep_visit	s_cost_avail_self_test
s_cost_prep_visit_oral 		s_cost_prep_visit_cab		s_cost_prep_visit_len	s_cost_prep_visit_vr  
s_cost_prep_ac_adh			s_cost_test_m_sympt			s_cost_test_f_sympt		s_cost_test_m_circ	s_cost_test_f_anc	s_dcost_self_test
s_cost_test_f_sw 			s_cost_test_f_non_anc   	s_pi_cost				s_cost_switch_line	s_cost_art_init		s_art_1_cost  
s_art_2_cost  s_art_3_cost 	s_cost_vl_not_done  		s_cost_zdv 	 	s_cost_ten	s_cost_3tc  	s_cost_nev   
s_cost_lpr 	  s_cost_dar  	s_cost_taz 	  s_cost_efa  	s_cost_dol  	s_cost_cab  s_cost_len  	s_cost_ole			s_cost_isl
s_cost_non_aids_pre_death	s_drug_level_test_cost  
s_cost_child_hiv_mo_art		s_cost_child_hiv_at_child_inf
s_cost_hypert_vis   		s_cost_hypert_drug			s_cost_lencab_return 		s_dcost_lencab_return

s_dcost_  s_dart_cost   	s_donart_cost  	s_dcd4_cost		s_dvl_cost     			s_dvis_cost    	s_dfull_vis_cost    	s_dadc_cost	
s_dvis_cost_no_lencab 		s_dvis_cost_lencab
s_dnon_tb_who3_cost 		s_dcot_cost    	s_dtb_cost		s_dtest_cost   			s_dres_cost   	s_dcost_circ	    	s_dcost_condom_dn
s_dcost_sw_program      	s_d_t_adh_int_cost				s_dtest_cost_m 			s_dtest_cost_f	s_dtest_cost_type1
s_dcost_prep_oral 			s_dcost_prep_cab   				s_dcost_prep_len  		s_dcost_prep_vr
s_dcost_prep_visit 			s_dcost_prep_visit_oral 		s_dcost_prep_visit_cab 	s_dcost_prep_visit_len 	s_dcost_prep_visit_vr
s_dcost_avail_self_test
s_dcost_prep_ac_adh     	s_dcost_test_m_sympt 			s_dcost_test_f_sympt  	s_dcost_test_m_circ 	s_dcost_test_f_anc 
s_dcost_test_f_sw  			s_dcost_test_f_non_anc  		s_dpi_cost     			s_dcost_switch_line 	s_dcost_art_init    s_dart_1_cost
s_dart_2_cost 	s_dart_3_cost 	s_dcost_vl_not_done	
s_dcost_zdv		s_dcost_ten		s_dcost_3tc		s_dcost_nev  	s_dcost_lpr		s_dcost_dar		s_dcost_taz		s_dcost_efa		s_dcost_dol		s_dcost_cab		s_dcost_len		s_dcost_ole		s_dcost_isl
s_dcost_non_aids_pre_death  s_dcost_drug_level_test   
s_dcost_child_hiv_mo_art	s_dcost_child_hiv_at_child_inf 	s_dcost_hypert_vis 		s_dcost_hypert_drug  

s_dead_daly	   s_dead_ddaly   
s_live_daly    s_dead_daly_oth_dol_adv_birth_e   s_dead_daly_ntd   s_daly_mtct 	s_daly_non_aids_pre_death      
s_total_yll80le  s_total_yllag																			   
s_yllag_total_test s_yllag_w s_yllag_m
s_yllag_hiv_w s_yllag_hiv_m
s_live_ddaly   s_dead_ddaly_oth_dol_adv_birth_e  s_dead_ddaly_ntd  s_ddaly_mtct s_ddaly_non_aids_pre_death 
s_dyll_Optima80 s_dyll_GBD	 		 
s_dyllag_w s_dyllag_m s_dyllag_hiv_w s_dyllag_hiv_m	 		 


/*visits*/
s_visit  s_lost  s_linked_to_care  s_linked_to_care_this_period
s_pre_art_care  
s_visit_prep_oral_no  s_visit_prep_oral_d  s_visit_prep_oral_dt  s_visit_prep_oral_dtc
s_sv  s_sv_secondline   

/*deaths*/
s_dead  s_dead_all	   s_deadm_all    s_deadw_all
s_dead1519m_all  s_dead2024m_all  s_dead2529m_all  s_dead3034m_all  s_dead3539m_all s_dead4044m_all  s_dead4549m_all s_dead5054m_all s_dead5559m_all s_dead6064m_all
s_dead1519w_all  s_dead2024w_all  s_dead2529w_all  s_dead3034w_all  s_dead3539w_all s_dead4044w_all  s_dead4549w_all s_dead5054w_all s_dead5559w_all s_dead6064w_all
s_dead6569w_all  s_dead7074w_all  s_dead7579w_all s_dead8084w_all	s_dead85plw_all s_dead6569m_all  s_dead7074m_all  s_dead7579m_all s_dead8084m_all 	s_dead85plm_all 
s_death_hivrel s_death_hivrel_m  s_death_hivrel_w s_dead_rdcause2  s_dead_onart_rdcause2  s_death_dcause3
s_death_hiv_age_1524 s_death_hiv_age_2534 s_death_hiv_age_3544 	s_death_hiv_age_4554  s_death_hiv_age_5564 
 s_death_hiv_age_1524_m   s_death_hiv_age_2549_m  s_death_hiv_age_50pl_m
 s_death_hiv_age_1524_w   s_death_hiv_age_2549_w  s_death_hiv_age_50pl_w
s_dead_  s_death_hiv  s_death_hiv_m s_death_hiv_w  s_dead_diag  s_dead_naive  s_dead_onart  s_dead_line1_lf0  s_dead_line1_lf1  s_dead_line2_lf1  s_dead_line2_lf2
s_dead_artexp  s_dead_artexpoff  s_dead_nn  s_dead_pir  s_dead_adc  s_dead_line1  s_dead_line2  s_dead_art_1p s_dead_hivrel_onart
s_dead_u_vfail1  s_dead_line1_vlg1000  s_dead_line2_vlg1000  s_ev_onart_gt6m_vlg1000_dead
s_sdg_1     s_sdg_2     s_sdg_3     s_sdg_4     s_sdg_5     s_sdg_6     s_sdg_7     s_sdg_8     s_sdg_9     s_sdg_99
s_sdg_hr_1  s_sdg_hr_2  s_sdg_hr_3  s_sdg_hr_4  s_sdg_hr_5  s_sdg_hr_6  s_sdg_hr_7  s_sdg_hr_8  s_sdg_hr_9  s_sdg_hr_99
s_art_dur_l6m_dead  	s_art_dur_g6m_dead  	s_art_tdur_l6m_dead  	s_art_tdur_g6m_dead  
s_ev_onart_gt6m_vlg1000_adead  s_ev_onart_gt6m_vl_m_g1000_dead  s_ev_onart_gt6m_vl_m_g1000_adead
 s_ev_art_g1k_not2l_adead    
 s_dead_hivneg_anycause  s_dead_hivpos_anycause 

/* deaths by cause - age 15+ */
s_dead_hivpos_cause1  s_dead_hivpos_tb  s_dead_hivpos_crypm s_dead_hivpos_sbi  s_dead_hivpos_oth_adc  s_dead_hivpos_cause2 
s_dead_hivpos_cause3 	s_dead_hivpos_cause4  s_dead_hivpos_cvd s_dead_cvd  s_dead_hivneg_cause4  s_dead_hivneg_cause3 
s_dead_hivneg_cause2   s_dead_hivneg_cvd  s_dead_hivneg_cause5  s_dead_hivneg_tb 
s_dead_cvd_3039m s_dead_cvd_4049m s_dead_cvd_5059m s_dead_cvd_6069m s_dead_cvd_7079m  s_dead_cvd_ge80m  s_dead_cvd_3039w  s_dead_cvd_4049w
s_dead_cvd_5059w s_dead_cvd_6069w s_dead_cvd_7079w  s_dead_cvd_ge80w s_death_hiv_inf_pre_year_interv  s_death_hiv_inf_post_year_interv


/*sex workers*/
s_sw	s_sw_1564	 s_sw_1549   s_sw_1849    s_sw_1519  s_sw_2024  s_sw_2529  s_sw_3039  s_sw_ov40 
s_ever_sw  s_ever_sw_hiv  s_ever_sw_diag
s_hiv_sw  s_hiv_sw1849_  s_hiv_sw1549_  s_hiv_sw1519_  s_hiv_sw2024_  s_hiv_sw2529_  s_hiv_sw3039_  s_hiv_swov40_  
s_i_fsw_v1_np 	s_i_fsw_v2_np   s_i_fsw_v3_np	s_i_fsw_v4_np  	s_i_fsw_v5_np	s_i_fsw_v6_np
s_i_v1_ep 		s_i_v2_ep 		s_i_v3_ep 		s_i_v4_ep 		s_i_v5_ep  		s_i_v6_ep
s_i_v1_newp 	s_i_v2_newp 	s_i_v3_newp 	s_i_v4_newp 	s_i_v5_newp  	s_i_v6_newp
s_sw_newp   s_sw1524_newp s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5  
s_episodes_sw  s_sw_gt1ep
s_new_1519sw  s_new_2024sw  s_new_2529sw  s_new_3039sw  s_new_ge40sw  
s_vs_sw

s_age_deb_sw1519_  s_age_deb_sw2024_  s_age_deb_sw2529_  s_age_deb_sw3039_  s_age_deb_swov40_ 

s_age_stop_sw1519_  s_age_stop_sw2024_  s_age_stop_sw2529_  s_age_stop_sw3039_  s_age_stop_swov40_ 

s_actdur_sw_0to3  s_actdur_sw_3to5  s_actdur_sw_6to9  s_actdur_sw_10to19  
s_totdur_sw_0to3  s_totdur_sw_3to5  s_totdur_sw_6to9  s_totdur_sw_10to19 
s_totdur_eversw_0to3  s_totdur_eversw_3to5  s_totdur_eversw_6to9  s_totdur_eversw_10to19 s_act_dur_sw  s_tot_dur_sw

s_sw_program_visit

s_diag_sw_noprog  s_diag_sw_inprog  s_onart_sw_noprog  s_onart_sw_inprog  
s_vl1000_art_gt6m_iicu_sw_noprog  s_vl1000_art_gt6m_iicu_sw_inprog 

s_sw1519_tp1  s_sw2024_tp1  s_sw2529_tp1  s_sw3039_tp1  s_swov40_tp1	s_sti_sw


/* MSM */

s_alive_msm			s_alive1549_msm			s_alive1564_msm			s_primary1549msm		s_primary1564msm
s_hiv_msm			s_hiv1549msm			s_hiv1564msm			s_infected_from_msm		s_inf_msm
s_tested_msm		s_tested1549msm			s_ever_tested_msm		s_ever_tested_msm1549_	s_ever_tested_msm1564_
s_diag_msm			s_diag_msm1549_			s_diag_msm1564_			s_diag_msm_age1564		s_diag_this_period_msm
s_art_start_msm		s_onart_msm				s_onart_msm1549_		s_onart_msm1564_
s_vl1000_msm		s_vl1000_art_msm		s_vg1000_msm
s_onart_iicu_msm	s_vl1000_art_iicu_msm	s_onart_gt6m_msm		s_vl1000_art_gt6m_msm
s_onart_gt6m_iicu_msm 		s_vl1000_art_gt6m_iicu_msm				s_artexp_msm			s_naive_msm
s_onprep_msm		s_onprep_oral_msm		s_onprep_cab_msm		s_onprep_len_msm
s_prep_any_msm		s_prep_oral_msm			s_prep_cab_msm			s_prep_len_msm
s_elig_prep_any_msm_1564
s_msm 				s_msm_ep 				s_m_ge1newp 			s_msm_ge1newp			s_prop_i_msm


/* PWID */ 

s_alive_pwid 		s_alive1549_pwid 		s_alive1564_pwid		s_primary1549pwid
s_hiv_pwid 			s_hiv1549pwid 			s_hiv1564pwid			s_inf_pwid
s_tested_pwid 		s_tested1549pwid		s_ever_tested_pwid 		s_ever_tested_pwid1549_ s_ever_tested_pwid1564_
s_diag_pwid 		s_diag_pwid1549_ 		s_diag_pwid1564_ 		s_diag_pwid_age1564		s_diag_this_period_pwid 
s_art_start_pwid 	s_onart_pwid 			s_onart_pwid1549_ 		s_onart_pwid1564_
s_vl1000_pwid 		s_vl1000_art_pwid 		
s_onart_iicu_pwid 	s_vl1000_art_iicu_pwid	s_onart_gt6m_pwid 		s_vl1000_art_gt6m_pwid	
s_onart_gt6m_iicu_pwid 		s_vl1000_art_gt6m_iicu_pwid				s_artexp_pwid 			s_naive_pwid
s_onprep_pwid 		s_onprep_oral_pwid 		s_onprep_cab_pwid 		s_onprep_len_pwid
s_prep_any_pwid_1564 s_prep_oral_pwid
s_elig_prep_any_pwid_1564
s_pwid 				s_newp_this_per_hivneg_pwid			s_prop_i_pwid


/*ADC etc*/
s_adc  s_non_tb_who3_ev  s_who4_  s_tb  s_adc_diagnosed  s_onart_adc  s_adc_naive  s_adc_line1_lf0  s_adc_line1_lf1  s_adc_line2_lf1 
s_adc_line2_lf2  s_adc_artexpoff 


/* outputs for advanced hiv disease */ 

s_crag_measured_this_per  s_tblam_measured_this_per  s_cm_this_per  s_vm_this_per s_vm_ly  s_crypm_proph    s_tb_proph    s_pcp_p  s_sbi_proph  s_crypm sbi 
s_crypm_diag_e    s_tb_diag_e   s_sbi_diag_e  s_cd4_g1    s_cd4_g2   s_cd4_g3    s_cd4_g4   s_cd4_g5    s_cd4_g6   s_vl_g1    s_vl_g2    s_vl_g3     
s_vl_g4     s_vl_g5   s_age_g1    s_age_g2  s_age_g3   s_age_g4     s_age_g5   s_cd4_g1_tb   s_cd4_g2_tb  s_cd4_g3_tb   s_cd4_g4_tb   s_cd4_g5_tb  
s_cd4_g6_tb  s_vl_g1_tb   s_vl_g2_tb    s_vl_g3_tb   s_vl_g4_tb  s_vl_g5_tb  s_age_g1_tb   s_age_g2_tb   s_age_g3_tb  s_age_g4_tb  s_age_g5_tb    
s_onart_tb   s_pcp_p_tb   s_tblam_measured_this_per_tb  s_tb_proph_tb     
s_cd4_g1_who3   s_cd4_g2_who3   s_cd4_g3_who3   s_cd4_g4_who3  s_cd4_g5_who3  s_cd4_g6_who3    s_vl_g1_who3  s_vl_g2_who3   
s_vl_g3_who3   s_vl_g4_who3   s_vl_g5_who3    s_age_g1_who3    s_age_g2_who3   s_age_g3_who3    s_age_g4_who3  s_age_g5_who3    s_onart_who3     
s_pcp_p_who3       s_who3_event  s_cd4_g1_adc    s_cd4_g2_adc     s_cd4_g3_adc   s_cd4_g4_adc   s_cd4_g5_adc  s_cd4_g6_adc    s_vl_g1_adc   
s_vl_g2_adc   s_vl_g3_adc   s_vl_g4_adc  s_vl_g5_adc  s_age_g1_adc   s_age_g2_adc    s_age_g3_adc   s_age_g4_adc s_age_g5_adc  s_pcp_p_adc
s_cd4_g1_crypm   s_cd4_g2_crypm   s_cd4_g3_crypm   s_cd4_g4_crypm   s_cd4_g5_crypm   s_cd4_g6_crypm  s_vl_g1_crypm   s_vl_g2_crypm  s_vl_g3_crypm    
s_vl_g4_crypm   s_vl_g5_crypm  s_age_g1_crypm  s_age_g2_crypm   s_age_g3_crypm    s_age_g4_crypm  s_age_g5_crypm   s_onart_crypm     s_pcp_p_crypm   
s_crag_measured_this_per_crypm    s_crypm_proph_crypm   s_cd4_g1_sbi   s_cd4_g2_sbi   s_cd4_g3_sbi   s_cd4_g4_sbi  s_cd4_g5_sbi    
s_cd4_g6_sbi   s_vl_g1_sbi  s_vl_g2_sbi    s_vl_g3_sbi   s_vl_g4_sbi s_vl_g5_sbi    s_age_g1_sbi   s_age_g2_sbi   s_age_g3_sbi   s_age_g4_sbi   
s_age_g5_sbi    s_onart_sbi   s_pcp_p_sbi    s_sbi_proph_sbi     s_sbi  s_cd4_g1_dead  s_cd4_g2_dead   s_cd4_g3_dead s_cd4_g4_dead   
s_cd4_g5_dead   s_cd4_g6_dead   s_vl_g1_dead   s_vl_g2_dead   s_vl_g3_dead   s_vl_g4_dead   s_vl_g5_dead  s_age_g1_dead  s_age_g2_dead   s_age_g3_dead   
s_age_g4_dead  s_age_g5_dead  s_onart_dead    s_pcp_p_dead   s_tb_proph_dead    s_crypm_proph_dead  s_sbi_proph_dead   sbi_proph_dead  
s_who3_event_dead  s_adc_dead     s_crypm_dead  s_sbi_dead    s_in_care_time_of_adc_tb
s_dead_tb s_dead_crypm s_dead_sbi s_dead_oth_adc 
s_tcur3m_cd4t0l100  s_who3_tcur3m_cd4t0l100  s_adc_tcur3m_cd4t0l100 s_tb_tcur3m_cd4t0l100  s_crypm_tcur3m_cd4t0l100  s_sbi_tcur3m_cd4t0l100  
s_tcur6m_cd4t0l100  s_who3_tcur6m_cd4t0l100  s_adc_tcur6m_cd4t0l100 s_tb_tcur6m_cd4t0l100  s_crypm_tcur6m_cd4t0l100  s_sbi_tcur6m_cd4t0l100 	
s_tcur3m_cd4t0l200  s_who3_tcur3m_cd4t0l200  s_adc_tcur3m_cd4t0l200 s_tb_tcur3m_cd4t0l200  s_crypm_tcur3m_cd4t0l200  s_sbi_tcur3m_cd4t0l200  
s_tcur6m_cd4t0l200  s_who3_tcur6m_cd4t0l200  s_adc_tcur6m_cd4t0l200 s_tb_tcur6m_cd4t0l200  s_crypm_tcur6m_cd4t0l200  s_sbi_tcur6m_cd4t0l200 
s_ahd_enter_care_100 s_ahd_enter_care_200 s_enter_care 


/*Pregnancy and children*/
s_pregnant 	s_anc s_birth s_w1549_birthanc  s_w1524_birthanc  s_hiv_w1549_birthanc  s_hiv_w1524_birthanc  s_hiv_pregnant
s_pregnant_not_diagnosed_pos  s_hiv_pregn_w1549_  s_hiv_pregn_w1524_  s_hiv_anc   s_pmtct
s_on_sd_nvp  s_on_dual_nvp  s_ever_sd_nvp s_ever_dual_nvp
s_pregnant_w1549    s_pregnant_w1524    s_pregnant_w1519    s_pregnant_w2024    s_pregnant_w2529    s_pregnant_w3034
s_pregnant_w3539    s_pregnant_w4044    s_pregnant_w4549    s_pregnant_w50pl
s_everpregn_w1524   s_everpregn_hiv_w1524 
s_tested_w1549_anc  s_tested_w1524_anc  s_tested_w1519_anc  s_tested_w2024_anc  s_tested_w2529_anc  s_tested_w3034_anc
s_tested_w3539_anc  s_tested_w4044_anc  s_tested_w4549_anc  s_tested_w50pl_anc 
s_hiv_w1549_anc 	s_hiv_w1524_anc 	s_hiv_w1519_anc 	s_hiv_w2024_anc 	s_hiv_w2529_anc 	s_hiv_w3034_anc
s_hiv_w3539_anc 	s_hiv_w4044_anc 	s_hiv_w4549_anc 	s_hiv_w50pl_anc
s_ceb_w1524 		s_ceb_w2534 		s_ceb_w3544 		s_ceb_w4549 
s_want_no_more_children   s_pregnant_ntd  s_pregnant_vlg1000  s_pregnant_o_dol  s_pregnant_onart_vlg1000  s_pregnant_onart  s_pregnant_onart_vl_high  
s_pregnant_onart_vl_vhigh s_pregnant_onart_vl_vvhigh  
s_birth_with_inf_child  s_child_with_resistant_hiv  s_give_birth_with_hiv   s_onart_birth_with_inf_child_res 
s_onart_birth_with_inf_child     
s_breastfeeding s_plw  s_onart_breastfeeding	s_child_infected_breastfeeding 

/*circumcision*/
s_mcirc  s_mcirc_1519m  s_mcirc_2024m  s_mcirc_2529m  s_mcirc_3034m  s_mcirc_3539m  s_mcirc_4044m  s_mcirc_4549m 
s_mcirc_5054m  s_mcirc_5559m  s_mcirc_6064m  s_mcirc_6569m 	s_mcirc_7074m  s_mcirc_7579m  s_mcirc_8084m  s_mcirc_85plm 
s_mcirc_50plm
s_vmmc s_vmmc1519m  s_vmmc2024m  s_vmmc2529m  s_vmmc3034m  s_vmmc3539m  s_vmmc4044m  s_vmmc4549m  s_vmmc50plm
s_new_mcirc1549m  s_new_mcirc_1519m  s_new_mcirc_2024m  s_new_mcirc_2529m  s_new_mcirc_3034m  s_new_mcirc_3539m  
s_new_mcirc_4044m  s_new_mcirc_4549m  
s_new_vmmc	s_new_vmmc1519m  s_new_vmmc2024m  s_new_vmmc2529m  s_new_vmmc3034m  s_new_vmmc3539m  s_new_vmmc4044m 
s_new_vmmc4549m  

s_birth_circ s_new_birth_circ  s_mcirc_1014m  s_new_mcirc  s_new_mcirc_1014m  s_vmmc1014m  s_new_vmmc1014m

/* blood pressure */

s_diagnosed_hypertension_1549 s_on_anti_hypertensive_1549 s_hypertension_1549 s_hypertens180_1549
s_diagnosed_hypertension_5059 s_on_anti_hypertensive_5059 s_hypertension_5059 s_hypertens180_5059 	
s_diagnosed_hypertension_6069 s_on_anti_hypertensive_6069 s_hypertension_6069 s_hypertens180_6069 	
s_diagnosed_hypertension_7079 s_on_anti_hypertensive_7079 s_hypertension_7079 s_hypertens180_7079 	
s_diagnosed_hypertension_ge80 s_on_anti_hypertensive_ge80 s_hypertension_ge80 s_hypertens180_ge80	

s_diagnosed_hypertension_1549m s_on_anti_hypertensive_1549m s_hypertension_1549m 	
s_diagnosed_hypertension_5059m s_on_anti_hypertensive_5059m s_hypertension_5059m 	
s_diagnosed_hypertension_6069m s_on_anti_hypertensive_6069m s_hypertension_6069m 	
s_diagnosed_hypertension_7079m s_on_anti_hypertensive_7079m s_hypertension_7079m 	
s_diagnosed_hypertension_ge80m s_on_anti_hypertensive_ge80m s_hypertension_ge80m

s_diagnosed_hypertension_1549w s_on_anti_hypertensive_1549w s_hypertension_1549w 	
s_diagnosed_hypertension_5059w s_on_anti_hypertensive_5059w s_hypertension_5059w 	
s_diagnosed_hypertension_6069w s_on_anti_hypertensive_6069w s_hypertension_6069w 	
s_diagnosed_hypertension_7079w s_on_anti_hypertensive_7079w s_hypertension_7079w 	
s_diagnosed_hypertension_ge80w s_on_anti_hypertensive_ge80w s_hypertension_ge80w

s_on1drug_antihyp_1549  s_on1drug_antihyp_5059 s_on1drug_antihyp_6069 s_on1drug_antihyp_7079  s_on1drug_antihyp_ge80     
s_on2drug_antihyp_1549  s_on2drug_antihyp_5059 s_on2drug_antihyp_6069 s_on2drug_antihyp_7079  s_on2drug_antihyp_ge80 
s_on3drug_antihyp_1549  s_on3drug_antihyp_5059 s_on3drug_antihyp_6069 s_on3drug_antihyp_7079  s_on3drug_antihyp_ge80 

/* covid */

s_covid

/*supp material*/
s_onart_vlg1     s_onart_vlg2     s_onart_vlg3     s_onart_vlg4     s_onart_vlg5    
s_onart_vlg1_r   s_onart_vlg2_r   s_onart_vlg3_r   s_onart_vlg4_r   s_onart_vlg5_r 
s_onart_who4_year1   s_onart_who4_year1_vlt1000  s_onart_who4_year3   s_onart_who4_year3_vlt1000  s_onart_cd4l200_year1  
s_onart_cd4l200_year1_vlt1000  s_onart_cd4l200_year3   s_onart_cd4l200_year3_vlt1000  s_onart_res_1stline_linefail0   
s_onart_res_1stline  s_onart_linefail0  s_onart_linefail0_cl200  s_onart_linefail0_cl50  s_onart_cl50  s_onart_linefail0_vg1000  
s_onart_vg1000   s_onart_linefail0_vg1000_r   s_onart_vg1000_r   s_onart_cl350

s_newpge1_l4p_1529m	s_newpge1_l4p_1529w

s_m_1524_ge1newpever  s_m_2534_ge1newpever  s_m_3544_ge1newpever  s_m_4554_ge1newpever  s_m_5564_ge1newpever
s_m_1524_ge2newpever  s_m_2534_ge2newpever  s_m_3544_ge2newpever  s_m_4554_ge2newpever  s_m_5564_ge2newpever
s_m_1524_ge5newpever  s_m_2534_ge5newpever  s_m_3544_ge5newpever  s_m_4554_ge5newpever  s_m_5564_ge5newpever
s_w_ge1newpever		  s_w_ge2newpever		s_w_ge5newpever

s_npge1_l4p_1564m  s_npge1_l4p_1524m  s_npge1_l4p_2534m  s_npge1_l4p_3544m  s_npge1_l4p_4554m  s_npge1_l4p_5564m  s_npge1_l4p_1564w  s_npge1_l4p_1524w  s_npge1_l4p_2534w  s_npge1_l4p_3544w  s_npge1_l4p_4554w  s_npge1_l4p_5564w
s_npge2_l4p_1564m  s_npge2_l4p_1524m  s_npge2_l4p_2534m  s_npge2_l4p_3544m  s_npge2_l4p_4554m  s_npge2_l4p_5564m  s_npge2_l4p_1564w  s_npge2_l4p_1524w  s_npge2_l4p_2534w  s_npge2_l4p_3544w  s_npge2_l4p_4554w  s_npge2_l4p_5564w
s_npge10_l4p_1564m  s_npge10_l4p_1524m  s_npge10_l4p_2534m  s_npge10_l4p_3544m  s_npge10_l4p_4554m  s_npge10_l4p_5564m  s_npge10_l4p_1564w  s_npge10_l4p_1524w  s_npge10_l4p_2534w  s_npge10_l4p_3544w  s_npge10_l4p_4554w  s_npge10_l4p_5564w
s_npge50_l4p_1564m  s_npge50_l4p_1524m  s_npge50_l4p_2534m  s_npge50_l4p_3544m  s_npge50_l4p_4554m  s_npge50_l4p_5564m  s_npge50_l4p_1564w  s_npge50_l4p_1524w  s_npge50_l4p_2534w  s_npge50_l4p_3544w  s_npge50_l4p_4554w  s_npge50_l4p_5564w
s_npge1_l4p_1564_hivpos  s_npge2_l4p_1564_hivpos  s_npge1_l4p_1564_hivdiag  s_npge2_l4p_1564_hivdiag  s_npge1_l4p_1564_hivneg  s_npge2_l4p_1564_hivneg


/* variables created after proc univariate which are used in the body of the program in order to update*/

s_prop_vlg1_rm  		s_prop_vlg2_rm  		s_prop_vlg3_rm  		s_prop_vlg4_rm  		s_prop_vlg5_rm  		s_prop_vlg6_rm
s_prop_vlg1_rm0_diag  	s_prop_vlg2_rm0_diag  	s_prop_vlg3_rm0_diag  	s_prop_vlg4_rm0_diag  	s_prop_vlg5_rm0_diag  	s_prop_vlg6_rm0_diag
s_prop_vlg1_rm1_diag  	s_prop_vlg2_rm1_diag  	s_prop_vlg3_rm1_diag  	s_prop_vlg4_rm1_diag  	s_prop_vlg5_rm1_diag  	s_prop_vlg6_rm1_diag
s_prop_vlg1_rm0_naive  	s_prop_vlg2_rm0_naive  	s_prop_vlg3_rm0_naive  	s_prop_vlg4_rm0_naive  	s_prop_vlg5_rm0_naive  	s_prop_vlg6_rm0_naive
s_prop_vlg1_rm1_naive  	s_prop_vlg2_rm1_naive  	s_prop_vlg3_rm1_naive  	s_prop_vlg4_rm1_naive  	s_prop_vlg5_rm1_naive  	s_prop_vlg6_rm1_naive
s_prop_tam1		s_prop_tam2		s_prop_tam3		s_prop_k103m	s_prop_y181m	s_prop_g190m
s_prop_m184m	s_prop_q151m	s_prop_k65m
s_prop_p32m		s_prop_p33m		s_prop_p46m		s_prop_p47m		s_prop_p50vm
s_prop_p50lm	s_prop_p54m		s_prop_p76m		s_prop_p82m		s_prop_p84m		s_prop_p88m		s_prop_p90m		s_prop_pim		s_prop_in118m		s_prop_in140m
s_prop_in148m	s_prop_in155m	s_prop_in263m	s_prop_ca66m

s_prop_newp_i_m_1524	s_prop_newp_i_m_2534	s_prop_newp_i_m_3544	s_prop_newp_i_m_4554	s_prop_newp_i_m_5564 
s_prop_newp_i_w_1524	s_prop_newp_i_w_2534	s_prop_newp_i_w_3544	s_prop_newp_i_w_4554	s_prop_newp_i_w_5564 

s_prop_ageg1_m_vlg1		s_prop_ageg1_m_vlg2		s_prop_ageg1_m_vlg3		s_prop_ageg1_m_vlg4		s_prop_ageg1_m_vlg5		s_prop_ageg1_m_vlg6
s_prop_ageg2_m_vlg1		s_prop_ageg2_m_vlg2		s_prop_ageg2_m_vlg3		s_prop_ageg2_m_vlg4		s_prop_ageg2_m_vlg5		s_prop_ageg2_m_vlg6
s_prop_ageg3_m_vlg1		s_prop_ageg3_m_vlg2		s_prop_ageg3_m_vlg3		s_prop_ageg3_m_vlg4		s_prop_ageg3_m_vlg5		s_prop_ageg3_m_vlg6
s_prop_ageg4_m_vlg1		s_prop_ageg4_m_vlg2		s_prop_ageg4_m_vlg3		s_prop_ageg4_m_vlg4		s_prop_ageg4_m_vlg5		s_prop_ageg4_m_vlg6
s_prop_ageg5_m_vlg1		s_prop_ageg5_m_vlg2		s_prop_ageg5_m_vlg3		s_prop_ageg5_m_vlg4		s_prop_ageg5_m_vlg5		s_prop_ageg5_m_vlg6

s_prop_ageg1_w_vlg1		s_prop_ageg1_w_vlg2		s_prop_ageg1_w_vlg3		s_prop_ageg1_w_vlg4		s_prop_ageg1_w_vlg5  	s_prop_ageg1_w_vlg6
s_prop_ageg2_w_vlg1		s_prop_ageg2_w_vlg2		s_prop_ageg2_w_vlg3		s_prop_ageg2_w_vlg4		s_prop_ageg2_w_vlg5		s_prop_ageg2_w_vlg6
s_prop_ageg3_w_vlg1		s_prop_ageg3_w_vlg2		s_prop_ageg3_w_vlg3		s_prop_ageg3_w_vlg4		s_prop_ageg3_w_vlg5		s_prop_ageg3_w_vlg6
s_prop_ageg4_w_vlg1		s_prop_ageg4_w_vlg2		s_prop_ageg4_w_vlg3		s_prop_ageg4_w_vlg4		s_prop_ageg4_w_vlg5		s_prop_ageg4_w_vlg6
s_prop_ageg5_w_vlg1		s_prop_ageg5_w_vlg2		s_prop_ageg5_w_vlg3		s_prop_ageg5_w_vlg4		s_prop_ageg5_w_vlg5		s_prop_ageg5_w_vlg6

s_prop_m_vlg1	s_prop_m_vlg2	s_prop_m_vlg3	s_prop_m_vlg4	s_prop_m_vlg5   s_prop_m_vlg6
s_prop_w_vlg1	s_prop_w_vlg2	s_prop_w_vlg3	s_prop_w_vlg4	s_prop_w_vlg5	s_prop_w_vlg6

s_prop_msm_vlg1		s_prop_msm_vlg2		s_prop_msm_vlg3		s_prop_msm_vlg4		s_prop_msm_vlg5		s_prop_msm_vlg6 
s_prop_pwid_vlg1	s_prop_pwid_vlg2	s_prop_pwid_vlg3	s_prop_pwid_vlg4	s_prop_pwid_vlg5	s_prop_pwid_vlg6

s_m_newp   s_w_newp

;
