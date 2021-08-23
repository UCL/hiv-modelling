

  libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\oral_prep";
  libname b "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\oral_prep\base_tld_prep_out";
* libname a '/home/rmjlaph/';

data d1 ; set b.out: ; 


keep 

run cald option s_pregnant_oth_dol_adv_birth_e s_pregnant s_pregnant_not_diagnosed_pos
s_m_1524_newp  s_m_2534_newp s_m_3544_newp s_m_4554_newp s_m_5564_newp s_w_1524_newp  s_w_2534_newp s_w_3544_newp s_w_4554_newp s_w_5564_newp 
s_i_age1_m_newp s_i_age2_m_newp s_i_age3_m_newp s_i_age4_m_newp s_i_age5_m_newp s_i_age1_w_newp s_i_age2_w_newp s_i_age3_w_newp s_i_age4_w_newp 
s_i_age5_w_newp s_dcost_ s_cost_ s_ly s_dly s_dead_ddaly s_live_ddaly  s_dead_ddaly_ntd s_dead_ddaly_oth_dol_adv_birth_e s_ddaly_mtct 
s_ddaly_non_aids_pre_death s_cost_zdv s_cost_ten s_cost_3tc s_cost_nev s_cost_lpr  s_cost_dar  s_cost_taz  s_cost_efa  s_cost_dol 
s_dart_cost s_dcost_cascade_interventions s_dcost_prep s_dcost_prep_visit s_dcost_prep_ac_adh s_dcost_circ s_dcost_condom_dn
s_dvis_cost  s_dart_1_cost  s_dart_2_cost  s_dart_3_cost  s_dart_cost  s_dvl_cost  s_dcd4_cost s_dadc_cost  s_dtb_cost  s_dtest_cost  s_dwho3_cost 
s_dcot_cost  s_dres_cost  s_d_t_adh_int_cost  s_dcost_cascade_interventions  s_dcost_prep  s_dcost_prep_visit  s_dcost_prep_ac_adh s_dfull_vis_cost 
s_dcost_circ s_dcost_condom_dn s_dcost_switch_line s_dcost_drug_level_test s_dcost_drug_level_test s_dcost_child_hiv 
s_ai_naive_no_pmtct_c_nnm_ s_ai_naive_no_pmtct_c_pim_ s_ai_naive_no_pmtct_c_inm_ s_ai_naive_no_pmtct_c_rt184m_ s_ai_naive_no_pmtct_c_rt65m_ 
s_ai_naive_no_pmtct_c_rttams_ s_mcirc_1519m  s_mcirc_2024m s_mcirc_2529m s_mcirc_3034m s_mcirc_3539m  s_mcirc_4044m s_mcirc_4549m  s_mcirc_3034m 
s_mcirc_3539m s_mcirc_4044m s_mcirc_4549m s_hiv1519m   s_hiv2024m  s_hiv1519w  s_hiv2024w  s_pregnant  s_alive1564_w  s_m_newp  s_w_newp s_newp_ge1  
s_alive1564  s_newp s_newp_ge1 s_newp_sw s_sw_newp_cat2  s_sw_newp_cat3 s_sw_newp_cat4 s_sw_newp_cat5 s_w1549_newp_ge1  s_m1549_newp_ge1  s_alive1549_w  
s_alive1549_m  s_alive1549 s_m1524_newp_ge1  s_m1524_newp_ge1 s_ageg1517m  s_ageg1819m  s_ageg1519m  s_ageg2024m  s_ageg1517w  s_ageg1819w  s_ageg1519w 
s_ageg2024w s_newp_ge5 s_npge2_l4p_1549m  s_npge2_l4p_1549w s_sw_1564  s_sw_newp  s_tested_m  s_tested  s_diag_this_period  s_tested_4p_m1549_  
s_diag_m1549_ s_tested_4p_w1549_  s_diag_w1549_  s_mcirc  s_alive1564_m s_mcirc_1519m s_ageg1519m s_mcirc_2024m  s_ageg2024m s_mcirc_2529m  
s_ageg2529m s_ageg3034m  s_ageg3539m  s_ageg4044m  s_ageg4549m s_mcirc_50plm  s_ageg5054m  s_ageg5559m  s_ageg6064m 
s_ageg1549m s_sw_1549 s_ever_sw s_sw_program_visit  s_sw_1564 s_hiv_sw s_sw_newp_cat1 s_sw_newp_cat1 s_sw_newp_cat2 s_sw_newp_cat3 
s_sw_newp_cat4 s_sw_newp_cat5  s_newp_this_per_hivneg_m_prep  s_newp_this_per_hivneg_w_prep s_prep  s_onprep_m s_alive1564_m s_hiv1564m 
s_onprep_w s_alive1564_w s_hiv1564w s_prep_elig_past_year s_alive1564_w  s_alive1564_m  s_hiv1564 s_prep_elig_past_5year s_prep_newp s_prep_newpg1 
s_prep_newpg2  s_prep_newpg3  s_prep_newpg4 s_prep_newpg2 s_prep_newpg3  s_prep_newpg4  s_prep_newpg3 s_prep_newpg4  s_newp_this_per_prep 
s_newp_this_per_hivneg  s_prep  s_elig_prep s_prep_newp  s_m_newp  s_w_newp  s_prep_newp  s_newp_hivneg  s_hiv1_prep  s_elig_prep 
s_onprep_1524w s_ageg1519w  s_prep_sw s_sw_1564 s_hiv_sw  s_hiv1_prep  s_hiv1_prep s_prep_ever s_prep_effectiveness_non_res_v 
s_elig_prep_w_1524  s_elig_prep_w_2534  s_elig_prep_w_3544  s_prep_w_1524  s_prep_w_2534  s_prep_w_3544  s_onart  s_prep_adhg80 
s_hiv1549m  s_hiv1549w s_hiv1549 s_primary1549  s_primary1549  s_primary1549w s_primary1549m s_primary1519w s_primary2024w s_primary1519m  s_primary2024m
s_hiv1519w  s_hiv1519m  s_hiv2024w  s_hiv2024m  s_hiv2529w  s_hiv2529m  s_hiv3034w  s_hiv3034m  s_hiv3539w  s_hiv3539m  s_hiv4044w  s_hiv4044m  
s_hiv4549w  s_hiv4549m   s_hiv_sw  s_sw_1564 s_inf_vlsupp   s_primary   s_inf_newp  s_inf_ep    s_inf_diag    s_inf_naive  
s_inf_primary s_birth_with_inf_child  s_give_birth_with_hiv  s_diag  s_diag_m  s_diag_w s_diag_m1519_  s_diag_m2024_   s_diag_w1519_  
s_diag_w2024_  s_diag_sw s_sw_1564 s_ai_naive_no_pmtct_c_nnm_  s_ai_naive_no_pmtct_ s_ai_naive_no_pmtct_c_pim_  s_ai_naive_no_pmtct_c_rt184m_  
s_ai_naive_no_pmtct_c_rt65m_ s_ai_naive_no_pmtct_c_rttams_ s_ai_naive_no_pmtct_c_inm_ s_artexp s_onart_iicu s_onart_w s_onart_m s_onart_sw s_onart 
s_efa  s_taz  s_ten  s_zdv  s_dol  s_3tc  s_lpr  s_nev  s_tle  s_tld  s_zld  s_zla  s_otherreg s_o_zdv_tox s_o_3tc_tox s_o_ten_tox s_o_taz_tox 
s_o_lpr_tox s_o_efa_tox s_o_nev_tox s_o_dol_tox s_o_tle_tox s_o_tld_tox s_o_zld_tox s_o_zla_tox s_o_zdv_adh_hi s_o_3tc_adh_hi s_o_ten_adh_hi 
s_o_taz_adh_hi s_o_lpr_adh_hi s_o_efa_adh_hi s_o_nev_adh_hi s_o_dol_adh_hi s_o_tle_adh_hi s_o_tld_adh_hi s_o_zld_adh_hi s_o_zla_adh_hi 
s_adh_hi  s_k65m_  s_m184m_  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_184m  s_vlg1000_65m  s_vlg1000_onart_65m  s_vlg1000_onart_184m s_vlg1000_onart 
s_vlg1000_184m_ontle  s_vlg1000_ontle s_vlg1000_tams_ontle s_vlg1000_65m_ontle s_vlg1000_nnm_ontle s_vlg1000_184m_ontld s_vlg1000_65m_ontld  
s_vlg1000_ontld  s_vlg1000_nnm_ontld s_vlg1000_inm_ontld s_nac_ge2p75_a_zld_if_reg_op_116 s_onart_start_zld_if_reg_op_116 
s_nac_ge2p00_a_zld_if_reg_op_116  s_nac_ge1p50_a_zld_if_reg_op_116 s_adh_hi_a_zld_if_reg_op_116 s_a_zld_if_reg_op_116  s_adh_hi_a_zld_if_reg_op_116 
s_adh_hi_a_zld_if_reg_op_116 s_e_rt65m_st_zld_if_reg_op_116 s_startedline2 s_onart_cd4_g500 s_onart_iicu s_onart_cl200  s_drug_level_test s_linefail_ge1
s_vl1000_art_gt6m_iicu s_vl1000_art_gt6m_iicu  s_vg1000 s_vg1000_m s_vg1000_w s_vg1000_m_1524 s_vg1000_w_1524 s_onart_m  s_onart_w  
s_vl1000_art_gt6m_iicu_w  s_onart_gt6m_iicu_w s_vl1000_art_gt6m_iicu_m  s_onart_gt6m_iicu_m s_vl1000_art_gt6m_iicu_1524_  s_onart_gt6m_iicu_1524_  
s_vl1000_art_gt6m_iicu_sw  s_onart_gt6m_iicu_sw  s_vl1000_art_12m s_art_12m  s_vl1000_art_12m  s_art_12m_onart s_vg1000  s_i_vl1000_m_newp  
s_m_newp  s_i_vl1000_w_newp  s_w_newp s_r_efa s_o_dol_2nd_vlg1000_dolr1_adh0 s_o_dol_2nd_vlg1000 s_o_dol_2nd_vlg1000_dolr1_adh1 
s_o_dol_2nd_vlg1000_dolr0_adh0 s_o_dol_2nd_vlg1000_dolr0_adh1 s_iime_  s_pime_  s_nnme_  s_death_hivrel s_dead_onart s_dead_artexp  s_dead1564_ 
s_death_hiv  s_death_hiv_m s_death_hiv_w s_death_hivrel_allage s_death_dcause3_allage  s_dead_allage  s_covid  s_death_hivrel_allage 
s_give_birth_with_hiv  s_birth_with_inf_child  s_pregnant_ntd  s_pregnant_oth_dol_adv_birth_e s_primary1549m s_primary1549 
s_primary  s_ageg2529w s_ageg3034w  s_ageg3539w  s_ageg4044w  s_ageg4549w  s_vlg1000_tams_ontld  s_x_n_zld_if_reg_op_116 s_onart_gt6m_iicu 
inc_death_rate_aids_disrup_covid 


  dataset     m15r    m25r    m35r    m45r    m55r    w15r    w25r    w35r    w45r    w55r    sex_beh_trans_matrix_m   
 sex_beh_trans_matrix_w     sex_age_mixing_matrix_m    sex_age_mixing_matrix_w   p_rred_p   p_hsb_p    newp_factor   eprate    conc_ep    ch_risk_diag  
  ch_risk_diag_newp    ych_risk_beh_newp    ych2_risk_beh_newp     ych_risk_beh_ep    exp_setting_lower_p_vl1000  external_exp_factor 
rate_exp_set_lower_p_vl1000    prob_pregnancy_base   fold_change_w   fold_change_yw   fold_change_sti   super_infection an_lin_incr_test   date_test_rate_plateau   
  rate_testanc_inc   incr_test_rate_sympt    max_freq_testing   test_targeting  fx   adh_pattern   prob_loss_at_diag   pr_art_init  rate_lost  
  prob_lost_art    rate_return    rate_restart   rate_int_choice   clinic_not_aw_int_frac   res_trans_factor_nn    rate_loss_persistence   incr_rate_int_low_adh   
        poorer_cd4rise_fail_nn    poorer_cd4rise_fail_ii    rate_res_ten    fold_change_mut_risk    adh_effect_of_meas_alert   pr_switch_line  
  prob_vl_meas_done   red_adh_tb_adc    red_adh_tox_pop    add_eff_adh_nnrti   altered_adh_sec_line_pop    prob_return_adc   prob_lossdiag_adctb 
prob_lossdiag_non_tb_who3e    higher_newp_less_engagement   fold_tr   switch_for_tox    adh_pattern_prep   rate_test_startprep   rate_test_restartprep   
   rate_choose_stop_prep   circ_inc_rate    p_hard_reach_w    hard_reach_higher_in_men    p_hard_reach_m   inc_cat    base_rate_sw  base_rate_stop_sexwork   
        rred_a_p    rr_int_tox    nnrti_res_no_effect    double_rate_gas_tox_taz     incr_mort_risk_dol_weightg    sw_init_newp    sw_trans_matrix  
  eff_max_freq_testing     eff_rate_restart    eff_prob_loss_at_diag     eff_rate_lost  eff_prob_lost_art   eff_rate_return   eff_pr_art_init  
  eff_rate_int_choice      eff_prob_vl_meas_done    eff_pr_switch_line    eff_rate_test_startprep     eff_rate_test_restartprep   eff_rate_choose_stop_prep   
            eff_prob_prep_restart_choice    eff_test_targeting    zero_tdf_activity_k65r     zero_3tc_activity_m184    red_adh_multi_pill_pop   
  greater_disability_tox     greater_tox_zdv       prep_strategy  
  rate_sw_rred_rc    exp_setting_lower_p_vl1000     external_exp_factor    rate_exp_set_lower_p_vl1000    max_freq_testing   test_targeting  
  prob_loss_at_diag   pr_art_init   rate_lost   prob_lost_art   rate_return  rate_restart   rate_int_choice  clinic_not_aw_int_frac   
    rate_loss_persistence          incr_rate_int_low_adh     fold_change_mut_risk     adh_effect_of_meas_alert   pr_switch_line  
  prob_vl_meas_done    red_adh_tb_adc   red_adh_tox_pop  altered_adh_sec_line_pop   prob_return_adc   higher_newp_less_engagement   fold_tr    switch_for_tox  
  adh_pattern_prep  
  base_rate_sw  
  condom_incr_2020  
  cascade_care_improvements   fold_tr_newp
          
  incr_test_2020  
  decr_hard_reach_2020   
          
  decr_prob_loss_at_diag_2020   
          
  decr_rate_lost_2020   
          
  decr_rate_lost_art_2020   
          
  incr_rate_return_2020   
          
  incr_rate_restart_2020   
          
  incr_rate_init_2020   
          
  decr_rate_int_choice_2020   
          
  incr_prob_vl_meas_done_2020   
          
  incr_pr_switch_line_2020   
          
  prep_improvements   
          
    
          
  inc_r_test_startprep_2020   
          
  incr_r_test_restartprep_2020  
          
          
  circ_improvements   
          
  circ_inc_rate_2020   
          
  incr_test_targeting_2020   
          
  pop_wide_tld_2020   
          
  incr_max_freq_testing_2020   
          
  initial_pr_switch_line   
          
  initial_prob_vl_meas_done   
          
  sw_test_6mthly_2020   
          
  reg_option_switch_2020   
          
  art_mon_drug_levels_2020   
          
  ten_is_taf_2020  
  lower_future_art_cov   
          
  prep_efficacy   
  sens_vct_test_type_3   
          
  eff_max_freq_testing   
          
  eff_rate_restart  
  eff_prob_loss_at_diag   
          
  eff_rate_lost  
  eff_prob_lost_art   
          
  eff_rate_return  
  eff_pr_art_init  
  eff_rate_int_choice   
          
  eff_prob_vl_meas_done   
          
  eff_pr_switch_line   
          
  eff_rate_test_startprep   
          
  eff_rate_test_restartprep   
          
  eff_rate_choose_stop_prep   
          
  eff_prob_prep_restart_choice  
          
  e_decr_hard_reach_2020   
          
  eff_test_targeting   
          
  prep_strategy  
  vmmc_disrup_covid   
          
  condom_disrup_covid   
          
  prep_disrup_covid   
          
  swprog_disrup_covid   
          
  testing_disrup_covid   
          
  art_tld_disrup_covid   
          
  art_tld_eod_disrup_covid   
          
 art_init_disrup_covid   
          
  vl_adh_switch_disrup_covid   
          
  cotrim_disrup_covid   
          
  no_art_disrup_covid   
          
  art_low_adh_disrup_covid   
          
  cov_death_risk_mult   
          
  eff_rate_test_startprep   
          
  eff_rate_test_restartprep   
          
  eff_rate_choose_stop_prep   
          
  eff_prob_prep_restart_choice  

s_prep_newpg0 s_primary_prep 
;



* to focus on prep and not tld_prep;
if option=0 or option=1;

dataset=1;


  data d; 
  set d1; 


proc sort data=d; by run cald option;run;
proc freq data=d; table run; where cald=2021;run;


* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set d ;
 
if cald=2021.5;
sf_2021 = 10000000 / s_alive1564;
keep run sf_2021;
proc sort; by run;


data y; 
merge d sf;
by run ;


* preparatory code ;

* ================================================================================= ;


if s_pregnant_oth_dol_adv_birth_e = . then s_pregnant_oth_dol_adv_birth_e = 0;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;



*r_bir_w_infected_child_ = rate_birth_with_infected_child_;


*reg_option = s_reg_option / s_n;

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

if s_cost_ gt 0 then disc     = s_dcost_ / s_cost_;
* discount rate is 3%; 
* note discounting is from 2020 - no adjustment needed;
* ts1m - this code needs to change for ts1m;
discount_adj = 1;
discount_adj_10p = discount_adj * (0.90/0.97)**(cald-2021) ; 
discount_adj_7p = discount_adj * (0.93/0.97)**(cald-2021) ; 
discount_adj_0  = discount_adj * (1.00/0.97)**(cald-2021) ; 
discount = disc * discount_adj ;
discount_10p = disc * discount_adj_10p ;
discount_7p = disc * discount_adj_7p ;
discount_0 = disc * discount_adj_0 ;

* proc print; 
* var cald  run  cald s_dcost_  s_cost_  disc  discount_adj  discount  discount_adj_10p discount_10p ; 
* where option=0  and cald ge 2019; 
* run;

* if using 7% discount rate:  ; 
* discount=discount_7p; 
* discount_adj=discount_adj_7p;

* if using 0% discount rate:  ;
* discount=discount_0; 
* discount_adj=discount_adj_0;

* ================================================================================= ;




* dalys and life years;

* ================================================================================= ;

ly = s_ly * sf_2021;
dly = s_dly * sf_2021;

s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * sf_2021 * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * sf_2021 * 4 * discount_adj ;

* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 

dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * sf_2021 * 4  * discount_adj ; * odabe ;

ddaly_mtct = s_ddaly_mtct * sf_2021 * 4  * discount_adj ;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf_2021 * 4  * discount_adj ; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;


* ================================================================================= ;

/*
proc print; var cald  run option ddaly_ntd_mtct_odab_napd  ddaly  dead_ddaly_ntd  ddaly_mtct  dead_ddaly_odabe   
ddaly_non_aids_pre_death;
where cald = 2021;
run;
*/



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 
dzdv_cost = s_cost_zdv * discount * sf_2021 * 4 / 1000;
dten_cost = s_cost_ten * discount * sf_2021 * 4 / 1000;
d3tc_cost = s_cost_3tc * discount * sf_2021 * 4 / 1000; 
dnev_cost = s_cost_nev * discount * sf_2021 * 4 / 1000;
dlpr_cost = s_cost_lpr * discount * sf_2021 * 4 / 1000;
ddar_cost = s_cost_dar * discount * sf_2021 * 4 / 1000;
dtaz_cost = s_cost_taz * discount * sf_2021 * 4 / 1000;
defa_cost = s_cost_efa * discount * sf_2021 * 4 / 1000;
ddol_cost = s_cost_dol * discount * sf_2021 * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * sf_2021 * discount_adj * 4 / 1000;
dart1_cost = s_dart_1_cost * sf_2021 * discount_adj * 4 / 1000;
dart2_cost = s_dart_2_cost * sf_2021 * discount_adj * 4 / 1000;
dart3_cost = s_dart_3_cost * sf_2021 * discount_adj * 4 / 1000;
dart_cost = s_dart_cost * sf_2021 * discount_adj * 4 / 1000;
dvl_cost = s_dvl_cost * sf_2021 * discount_adj * 4 / 1000;
dcd4_cost = s_dcd4_cost * sf_2021 * discount_adj * 4 / 1000;
dadc_cost = s_dadc_cost * sf_2021 * discount_adj * 4 / 1000;
dtb_cost = s_dtb_cost * sf_2021 * discount_adj * 4 / 1000;
dtest_cost = s_dtest_cost * sf_2021 * discount_adj * 4 / 1000;
dwho3_cost = s_dwho3_cost * sf_2021 * discount_adj * 4 / 1000;
dcot_cost = s_dcot_cost * sf_2021 * discount_adj * 4 / 1000;
dres_cost = s_dres_cost * sf_2021 * discount_adj * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf_2021 * discount_adj * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * sf_2021 * discount_adj * 4 / 1000;  
dcost_prep = s_dcost_prep * sf_2021* discount_adj * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf_2021* discount_adj * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf_2021* discount_adj * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf_2021 * discount_adj * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf_2021 * discount_adj * 4 / 1000;
dcost_circ = s_dcost_circ * sf_2021* discount_adj * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf_2021* discount_adj * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * discount_adj * sf_2021 * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf_2021 * discount_adj * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * sf_2021 * discount_adj * 4 / 1000; * s_cost_child_hiv is discounted cost;

dclin_cost = dadc_cost+dwho3_cost+dcot_cost+dtb_cost;

* sens analysis;

* dtaz_cost = dtaz_cost * (100 / 180);
* dtaz_cost = dtaz_cost * (50 / 180);
* dzdv_cost = dzdv_cost * (25 / 45);


dart_cost_x = dart1_cost + dart2_cost + dart3_cost; 
dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

* dcost = dart_cost_y + dclin_cost + dcd4_cost + dvl_cost + dvis_cost + dtest_cost + d_t_adh_int_cost + dswitchline_cost
		+dcost_circ + dcost_condom_dn  + dcost_child_hiv  + dcost_non_aids_pre_death ;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dwho3_cost + dcot_cost + dtb_cost+dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test+dcost_cascade_interventions + dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;

s_cost_art_x = s_cost_zdv + s_cost_ten + s_cost_3tc + s_cost_nev + s_cost_lpr + s_cost_dar + s_cost_taz + s_cost_efa + s_cost_dol ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dwho3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 
cost_clin_care = dcost_clin_care / discount;

cost = dcost / discount;

* ================================================================================= ;

* derived var cald iables relating to population, not only those with hiv ;

if s_ai_naive_no_pmtct_c_nnm_ = . then s_ai_naive_no_pmtct_c_nnm_ = 0; 
if s_ai_naive_no_pmtct_c_pim_ = . then s_ai_naive_no_pmtct_c_pim_ = 0;
if s_ai_naive_no_pmtct_c_inm_ = . then s_ai_naive_no_pmtct_c_inm_ = 0;
if s_ai_naive_no_pmtct_c_rt184m_ = . then s_ai_naive_no_pmtct_c_rt184m_ = 0;
if s_ai_naive_no_pmtct_c_rt65m_ = . then s_ai_naive_no_pmtct_c_rt65m_ = 0;
if s_ai_naive_no_pmtct_c_rttams_ = . then s_ai_naive_no_pmtct_c_rttams_ = 0;

s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_mcirc_3039m = s_mcirc_3034m + s_mcirc_3539m;
s_mcirc_4049m = s_mcirc_4044m + s_mcirc_4549m;


s_hiv1524m = s_hiv1519m + s_hiv2024m ;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;

* av_newp_ge1;					av_newp_ge1 = s_newp / s_newp_ge1 ;

* av number of newp amongst people with newp ge 1, exlcuding sw;
* av_newp_ge1_non_sw;			av_newp_ge1_non_sw = (s_newp - s_newp_sw) / (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5));

* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_m_newp_ge1_age1549;			p_m_newp_ge1_age1549 = (s_m1549_newp_ge1) / (s_alive1549_m) ;
* p_w_newp_ge1_age1549;			p_w_newp_ge1_age1549 = (s_w1549_newp_ge1) / (s_alive1549_w) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_m1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;

* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2021;
* p_newp_sw;					p_newp_sw = s_sw_newp / s_w_newp ;
* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;
* n_tested_m;					n_tested_m = s_tested_m * sf_2021 * 4;
* n_tested;						n_tested = s_tested * sf_2021 * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* p_mcirc;						p_mcirc = s_mcirc / s_alive1564_m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3039m;				p_mcirc_3039m = s_mcirc_3039m / (s_ageg3034m + s_ageg3539m) ;
* p_mcirc_4049m;				p_mcirc_4049m = s_mcirc_4049m / (s_ageg4044m + s_ageg4549m) ;
* p_mcirc_50plm;				p_mcirc_50plm = s_mcirc_50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;


* prop_w_1549_sw;				prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  

* prep;

* proportion of those on prep who have ge 1 newp in the period ;
* p_prep_newp ;					if s_prep > 0 then p_prep_newp = (s_newp_this_per_hivneg_m_prep + s_newp_this_per_hivneg_w_prep) / s_prep ; 
* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;
* p_prep_elig_past_year;		p_prep_elig_past_year = s_prep_elig_past_year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* p_prep_elig_past_5year;		p_prep_elig_past_5year = s_prep_elig_past_5year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* mean_newp_ppers_prep;			if s_prep > 0 then mean_newp_ppers_prep = s_prep_newp / s_prep ;

* prop_onprep_newpge1;			if s_prep > 0 then prop_onprep_newpge1 = (s_prep_newpg1 + s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep ;
* prop_onprep_newpge2;			if s_prep > 0 then prop_onprep_newpge2 = (s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep ;
* prop_onprep_newpge3;			if s_prep > 0 then prop_onprep_newpge3 = (s_prep_newpg3 + s_prep_newpg4)/ s_prep ;


* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;
* prop_elig_on_prep;			if s_elig_prep > 0 then prop_elig_on_prep = s_prep / s_elig_prep ; 
* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;
* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;
* prop_1564_hivneg_onprep;		prop_1564_hivneg_onprep =   max((s_prep-s_hiv1_prep), 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;

* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive1564 - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_sw_onprep; 				prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep;						n_prep = s_prep * sf_2021;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf_2021;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * sf_2021;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* av_prep_eff_non_res_v;  		if s_prep > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf_2021;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf_2021;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf_2021;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * sf_2021;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf_2021;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf_2021;

* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				p_prep_adhg80 = s_prep_adhg80 / s_prep ;

* note this is a different way to define p_prep_newp from that above;
* p_prep_newp_x;				if s_prep > 0 then p_prep_newp_x = 1 - (s_prep_newpg0 / s_prep) ;

* incidence_onprep ; 			if s_prep > 0 then incidence_onprep  = (s_primary_prep * 4 * 100) / s_prep ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* ts1m - below change 4 to 12;
* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* incidence1524w;				incidence1524w = ((s_primary1519w + s_primary2024w) * 4 * 100) / 
									(s_ageg1519w + s_ageg2024w - s_hiv1519w - s_hiv2024w + s_primary1519w + s_primary2024w);
* incidence1524m;				incidence1524m = ((s_primary1519m + s_primary2024m) * 4 * 100) / 
									(s_ageg1519m + s_ageg2024m - s_hiv1519m - s_hiv2024m + s_primary1519m + s_primary2024m);

* prevalence1519w;				prevalence1519w = s_hiv1519w  / s_ageg1519w ;
* prevalence1519m;				prevalence1519m = s_hiv1519m  / s_ageg1519m ;
* prevalence2024w;				prevalence2024w = s_hiv2024w  / s_ageg2024w ;
* prevalence2024m;				prevalence2024m = s_hiv2024m  / s_ageg2024m ;
* prevalence2529w;				prevalence2529w = s_hiv2529w  / s_ageg2529w ;
* prevalence2529m;				prevalence2529m = s_hiv2529m  / s_ageg2529m ;
* prevalence3034w;				prevalence3034w = s_hiv3034w  / s_ageg3034w ;
* prevalence3034m;				prevalence3034m = s_hiv3034m  / s_ageg3034m ;
* prevalence3539w;				prevalence3539w = s_hiv3539w  / s_ageg3539w ;
* prevalence3539m;				prevalence3539m = s_hiv3539m  / s_ageg3539m ;
* prevalence4044w;				prevalence4044w = s_hiv4044w  / s_ageg4044w ;
* prevalence4044m;				prevalence4044m = s_hiv4044m  / s_ageg4044m ;
* prevalence4549w;				prevalence4549w = s_hiv4549w  / s_ageg4549w ;
* prevalence4549m;				prevalence4549m = s_hiv4549m  / s_ageg4549m ;

* prevalence1524w;				prevalence1524w =  s_hiv1524w  / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m =  s_hiv1524m  / (s_ageg1519m + s_ageg2024m) ;

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

* derived variables relating to people with hiv ;
								if s_primary gt 0 then do;
* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;
								end;
* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv1564 ;  p_diag = p_diag * 100;
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m / s_hiv1564m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w / s_hiv1564w ;  p_diag_w = p_diag_w * 100;

* p_diag_m1524;					if s_hiv1524m > 0 then p_diag_m1524 = (s_diag_m1519_+s_diag_m2024_)/(s_hiv1524m);
* p_diag_w1524;					if s_hiv1524w > 0 then p_diag_w1524 = (s_diag_w1519_+s_diag_w2024_)/(s_hiv1524w);

* p_diag_sw;					if s_sw_1564 > 0 then p_diag_sw = s_diag_sw / s_sw_1564; 

* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_pim;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_pim = s_ai_naive_no_pmtct_c_pim_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt184m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt184m = s_ai_naive_no_pmtct_c_rt184m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt65m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt65m = s_ai_naive_no_pmtct_c_rt65m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rttams;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rttams = s_ai_naive_no_pmtct_c_rttams_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_inm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_inm = s_ai_naive_no_pmtct_c_inm_ / s_ai_naive_no_pmtct_;

* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart;						if s_hiv1564 gt 0 then p_onart = s_onart / s_hiv1564;

* p_efa;						if s_onart > 0 then p_efa = s_efa / s_onart ;
* p_taz;						if s_onart > 0 then p_taz = s_taz / s_onart ;
* p_ten;						if s_onart > 0 then p_ten = s_ten / s_onart ;
* p_zdv;						if s_onart > 0 then p_zdv = s_zdv / s_onart ;
* p_dol; 						if s_onart > 0 then p_dol = s_dol / s_onart ;
* p_3tc;						if s_onart > 0 then p_3tc = s_3tc / s_onart ;
* p_lpr; 						if s_onart > 0 then p_lpr = s_lpr / s_onart ;
* p_nev;						if s_onart > 0 then p_nev = s_nev / s_onart ;

* p_tle;						if s_onart > 0 then p_tle = s_tle / s_onart ;
* p_tld;						if s_onart > 0 then p_tld = s_tld / s_onart ;
* p_zld;						if s_onart > 0 then p_zld = s_zld / s_onart ;
* p_zla;						if s_onart > 0 then p_zla = s_zla / s_onart ;
* p_otherreg;					if s_onart > 0 then p_otherreg = s_otherreg / s_onart ;

* p_o_zdv_tox;					if s_zdv gt 0 then p_o_zdv_tox = s_o_zdv_tox / s_zdv ;
* p_o_3tc_tox;					if s_3tc gt 0 then p_o_3tc_tox = s_o_3tc_tox / s_3tc ;
* p_o_ten_tox;					if s_ten gt 0 then p_o_ten_tox = s_o_ten_tox / s_ten ;
* p_o_taz_tox;					if s_taz gt 0 then p_o_taz_tox = s_o_taz_tox / s_taz ;
* p_o_lpr_tox;					if s_lpr gt 0 then p_o_lpr_tox = s_o_lpr_tox / s_lpr ;
* p_o_efa_tox;					if s_efa gt 0 then p_o_efa_tox = s_o_efa_tox / s_efa ;
* p_o_nev_tox;					if s_nev gt 0 then p_o_nev_tox = s_o_nev_tox / s_nev ;
* p_o_dol_tox;					if s_dol gt 0 then p_o_dol_tox = s_o_dol_tox / s_dol ;

* p_o_tle_tox;					if s_tle gt 0 then p_o_tle_tox = s_o_tle_tox / s_tle ;
* p_o_tld_tox;					if s_tld gt 0 then p_o_tld_tox = s_o_tld_tox / s_tld ;
* p_o_zld_tox;					if s_zld gt 0 then p_o_zld_tox = s_o_zld_tox / s_zld ;
* p_o_zla_tox;					if s_zla gt 0 then p_o_zla_tox = s_o_zla_tox / s_zla ;

* p_o_zdv_adh_hi;				if s_zdv gt 0 then p_o_zdv_adh_hi = s_o_zdv_adh_hi / s_zdv ;
* p_o_3tc_adh_hi;				if s_3tc gt 0 then p_o_3tc_adh_hi = s_o_3tc_adh_hi / s_3tc ;
* p_o_ten_adh_hi;				if s_ten gt 0 then p_o_ten_adh_hi = s_o_ten_adh_hi / s_ten ;
* p_o_taz_adh_hi;				if s_taz gt 0 then p_o_taz_adh_hi = s_o_taz_adh_hi / s_taz ;
* p_o_lpr_adh_hi;				if s_lpr gt 0 then p_o_lpr_adh_hi = s_o_lpr_adh_hi / s_lpr ;
* p_o_efa_adh_hi;				if s_efa gt 0 then p_o_efa_adh_hi = s_o_efa_adh_hi / s_efa ;
* p_o_nev_adh_hi;				if s_nev gt 0 then p_o_nev_adh_hi = s_o_nev_adh_hi / s_nev ;
* p_o_dol_adh_hi;				if s_dol gt 0 then p_o_dol_adh_hi = s_o_dol_adh_hi / s_dol ;

* p_o_tle_adh_hi;				if s_tle gt 0 then p_o_tle_adh_hi = s_o_tle_adh_hi / s_tle ;
* p_o_tld_adh_hi;				if s_tld gt 0 then p_o_tld_adh_hi = s_o_tld_adh_hi / s_tld ;
* p_o_zld_adh_hi;				if s_zld gt 0 then p_o_zld_adh_hi = s_o_zld_adh_hi / s_zld ;
* p_o_zla_adh_hi;				if s_zla gt 0 then p_o_zla_adh_hi = s_o_zla_adh_hi / s_zla ;

* p_adh_hi;						if s_onart gt 0 then p_adh_hi = s_adh_hi / s_onart;

* p_k65m;						if s_hiv1564 gt 0 then p_k65m = s_k65m_ / s_hiv1564 ;
* p_m184m;						if s_hiv1564 gt 0 then p_m184m = s_m184m_ / s_hiv1564 ;

* p_k65m_all;					p_k65m_all = s_k65m_ / (s_alive1564_w + s_alive1564_m) ;
* p_m184m_all;					p_m184m_all = s_m184m_ / (s_alive1564_w + s_alive1564_m) ;

* p_vlg1000_184m;				if s_vg1000 > 0 then p_vlg1000_184m = s_vlg1000_184m / s_vg1000 ;
* p_vlg1000_65m;				if s_vg1000 > 0 then p_vlg1000_65m = s_vlg1000_65m / s_vg1000 ;

* p_vlg1000_184m_hiv;			if s_hiv1564 > 0 then p_vlg1000_184m_hiv = s_vlg1000_184m / s_hiv1564  ;
* p_vlg1000_65m_hiv;			if s_hiv1564 > 0 then p_vlg1000_65m_hiv = s_vlg1000_65m / s_hiv1564  ;

* p_vlg1000_onart_65m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_65m = s_vlg1000_onart_65m / s_vlg1000_onart ;
* p_vlg1000_onart_184m;			if s_vlg1000_onart > 0 then p_vlg1000_onart_184m = s_vlg1000_onart_184m / s_vlg1000_onart ;

* p_184m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_184m_ontle_vlg1000 = s_vlg1000_184m_ontle / s_vlg1000_ontle ;
* p_tams_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_tams_ontle_vlg1000 = s_vlg1000_tams_ontle / s_vlg1000_ontle ;
* p_65m_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_65m_ontle_vlg1000 = s_vlg1000_65m_ontle / s_vlg1000_ontle ;
* p_nnm_ontle_vlg1000;			if s_vlg1000_ontle > 0 then p_nnm_ontle_vlg1000 = s_vlg1000_nnm_ontle / s_vlg1000_ontle ;

* p_184m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_184m_ontld_vlg1000 = s_vlg1000_184m_ontld / s_vlg1000_ontld ;
* p_tams_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_tams_ontld_vlg1000 = s_vlg1000_tams_ontld / s_vlg1000_ontld ;
* p_65m_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_65m_ontld_vlg1000 = s_vlg1000_65m_ontld / s_vlg1000_ontld ;
* p_nnm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_nnm_ontld_vlg1000 = s_vlg1000_nnm_ontld / s_vlg1000_ontld ;
* p_inm_ontld_vlg1000;			if s_vlg1000_ontld > 0 then p_inm_ontld_vlg1000 = s_vlg1000_inm_ontld / s_vlg1000_ontld ;

								if s_onart_start_zld_if_reg_op_116 gt 0 then do;
* p_nactive_ge2p75_xyz;			p_nactive_ge2p75_xyz = s_nac_ge2p75_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge2p00_xyz;			p_nactive_ge2p00_xyz = s_nac_ge2p00_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge1p50_xyz;			p_nactive_ge1p50_xyz = s_nac_ge1p50_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
								end;

* p_adh_hi_xyz_ot1;				if s_a_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot1 = s_adh_hi_a_zld_if_reg_op_116 / s_a_zld_if_reg_op_116;
* p_adh_hi_xyz_ot2;				if s_onart_start_zld_if_reg_op_116 gt 0 then p_adh_hi_xyz_ot2 = s_adh_hi_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_adh_hi_xyz_itt;				if s_x_n_zld_if_reg_op_116 gt 0 then  p_adh_hi_xyz_itt = s_adh_hi_a_zld_if_reg_op_116 / s_x_n_zld_if_reg_op_116;

* p_e_rt65m_xyz; 				if s_onart_start_zld_if_reg_op_116 gt 0 then p_e_rt65m_xyz = s_e_rt65m_st_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116 ;

* p_startedline2;				if s_artexp > 0 then do; p_startedline2 = s_startedline2 / s_artexp; end;
* Of people on ART, percent with CD4 < 500;	
								if  s_onart_iicu > 0 then  p_onart_cd4_l500 = 1 - (s_onart_cd4_g500 / s_onart_iicu) ;
* Of people on ART, percent with CD4 < 200;	
								if s_onart_iicu > 0 then  p_onart_cd4_l200 = s_onart_cl200 / s_onart_iicu ;
* p_drug_level_test;			if s_onart > 0 then p_drug_level_test = s_drug_level_test / s_onart ;

* p_linefail_ge1;				if s_artexp > 0 then p_linefail_ge1 = s_linefail_ge1 / s_artexp;
* p_startedline2;				if s_artexp > 0 then p_startedline2 = s_startedline2 / s_artexp; 
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_artexp_vl1000;				if s_artexp > 0 then p_artexp_vl1000 = s_vl1000_art_gt6m_iicu / s_artexp ;

* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* p_vg1000_m, p_vl1000_m;		if s_hiv1564m  > 0 then p_vg1000_m = s_vg1000_m / s_hiv1564m ;  p_vl1000_m = 1- p_vg1000_m ;
* p_vg1000_w, p_vl1000_w;		if s_hiv1564w  > 0 then p_vg1000_w = s_vg1000_w / s_hiv1564w ;  p_vl1000_w = 1- p_vg1000_w ;
* p_vg1000_m_1524;				if s_hiv1524m  > 0 then p_vg1000_m_1524 = s_vg1000_m_1524 / s_hiv1524m ;
* p_vg1000_w_1524;				if s_hiv1524w  > 0 then p_vg1000_w_1524 = s_vg1000_w_1524 / s_hiv1524w ;
* p_vl1000_m_1524;				p_vl1000_m_1524 = 1 - p_vg1000_m_1524 ;
* p_vl1000_w_1524;				p_vl1000_w_1524 = 1 - p_vg1000_w_1524 ;

* p_onart_m;					if s_hiv1564m > 0 then p_onart_m = s_onart_m / s_hiv1564m  ;
* p_onart_w;					if s_hiv1564w  > 0 then p_onart_w = s_onart_w / s_hiv1564w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_1524;			if s_onart_gt6m_iicu_1524_ > 0 then p_onart_vl1000_1524 = s_vl1000_art_gt6m_iicu_1524_ / s_onart_gt6m_iicu_1524_ ;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* p_vl1000_art_12m;				if s_art_12m > 0 then p_vl1000_art_12m = s_vl1000_art_12m / s_art_12m ;
* p_vl1000_art_12m_onart;		if s_art_12m > 0 then p_vl1000_art_12m_onart = s_vl1000_art_12m / s_art_12m_onart ;

* prevalence_vg1000;			if s_alive1564 > 0 then prevalence_vg1000 = s_vg1000 / s_alive1564;
* prev_vg1000_newp_m;			prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hiv1564 > 0 then r_efa_hiv = s_r_efa / s_hiv1564 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;

* p_iime_;						p_iime_ = s_iime_ / s_hiv1564 ;
* p_pime_;						p_pime_ = s_pime_ / s_hiv1564 ;
* p_nnme_;						p_nnme_ = s_nnme_ / s_hiv1564 ;

* ts1m - below change 4 to 12;
* aids_death_rate;				if s_hiv1564 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);
* death_rate;					if s_hiv1564 > 0 then death_rate= (4 * 100 * s_dead1564_) / s_hiv1564;
* death_rate_hiv; 				if s_hiv1564 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hiv1564;
				 				if s_hiv1564m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hiv1564m;
								if s_hiv1564w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hiv1564w;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * sf_2021;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * sf_2021;
* n_death;						n_death = s_dead_allage * sf_2021;
* n_covid;						n_covid = s_covid * sf_2021;

inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

* number of women with hiv giving birth per year;
n_give_birth_w_hiv = s_give_birth_with_hiv * sf_2021 * 4;
n_birth_with_inf_child = s_birth_with_inf_child * sf_2021 * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * sf_2021 * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf_2021 * 4;  * annual number;


n_mcirc1549_=s_mcirc_1549m * sf_2021 * 4;
n_mcirc1549_3m=s_mcirc_1549m * sf_2021;

n_new_inf1549m = s_primary1549m * sf_2021 * 4;
n_new_inf1549 = s_primary1549 * sf_2021 * 4;
n_infection  = s_primary     * sf_2021 * 4;



keep run option cald dataset cost  s_alive_m   s_alive_w s_alive
p_w_giv_birth_this_per p_newp_ge1 p_1524_newp_ge1 p_newp_ge5 p_newp_ge1_age1549 gender_r_newp  av_newp_ge1  av_newp_ge1_non_sw
p_newp_sw  n_tested_m   p_tested_past_year_1549m  p_tested_past_year_1549w
p_diag_m1524 p_diag_w1524 p_diag_sw  p_onart_cd4_l200
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3039m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_hivneg_onprep prop_sw_onprep p_prep_adhg80  av_prep_effectiveness_non_res_v
prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 			
prevalence1524w prevalence1524m  prevalence_sw
incidence1549 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary mtct_prop
p_diag p_diag_m p_diag_w p_ai_no_arv_c_nnm prop_sw_newp0
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm
p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw
p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524    
p_onart_m p_onart_w p_onart_vl1000_w p_onart_vl1000_m  p_onart_vl1000_1524	  p_onart_vl1000_sw
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w  p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly  ddaly_all  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost dcost_cascade_interventions     dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564  prop_sw_onprep  p_onart  p_vl1000_art_12m  p_vl1000_art_12m_onart
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m  p_artexp_vl1000
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000 p_vlg1000_184m p_vlg1000_65m
death_rate  death_rate_hiv death_rate_hiv_w death_rate_hiv_m  n_new_inf1549m n_new_inf1549 p_iime_   p_pime_   p_nnme_  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd ddaly  ddaly_all 
n_birth_with_inf_child  dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe n_tested  p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep  n_covid  n_death_covid n_death n_death_hivrel p_death_hivrel_age_le64 
p_prep_ever  p_hiv1_prep incidence1524w   incidence1524m  test_prop_positive  p_newp_prep  n_infection
p_newp_this_per_prep  p_newp_prep_hivneg  av_prep_eff_non_res_v

sf_2021 sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti super_infection an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice 	eff_test_targeting
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
  prep_strategy rate_sw_rred_rc

exp_setting_lower_p_vl1000  
external_exp_factor   rate_exp_set_lower_p_vl1000    max_freq_testing  
test_targeting    prob_loss_at_diag   pr_art_init   
rate_lost   prob_lost_art   rate_return   rate_restart   rate_int_choice  
clinic_not_aw_int_frac    rate_loss_persistence   incr_rate_int_low_adh  
fold_change_mut_risk   adh_effect_of_meas_alert   pr_switch_line   prob_vl_meas_done  
base_rate_sw  fold_tr_newp 

condom_incr_2020     			cascade_care_improvements  incr_test_2020              decr_hard_reach_2020   
decr_prob_loss_at_diag_2020  	decr_rate_lost_2020 		decr_rate_lost_art_2020     incr_rate_return_2020      
incr_rate_restart_2020         incr_rate_init_2020        decr_rate_int_choice_2020  
incr_prob_vl_meas_done_2020  
incr_pr_switch_line_2020     	prep_improvements        	  
inc_r_test_startprep_2020  incr_r_test_restartprep_2020  
circ_improvements  			circ_inc_rate_2020  		incr_test_targeting_2020    pop_wide_tld_2020 
incr_max_freq_testing_2020     initial_pr_switch_line     initial_prob_vl_meas_done   sw_test_6mthly_2020  
reg_option_switch_2020      art_mon_drug_levels_2020       ten_is_taf_2020    lower_future_art_cov  prep_efficacy  sens_vct_test_type_3  

eff_max_freq_testing  		eff_rate_restart   		eff_prob_loss_at_diag   		eff_rate_lost   		
eff_prob_lost_art   		eff_rate_return   
eff_pr_art_init   	eff_rate_int_choice   	eff_prob_vl_meas_done   		eff_pr_switch_line   	
eff_rate_test_startprep   	eff_rate_test_restartprep   	
eff_rate_choose_stop_prep   		eff_prob_prep_restart_choice   	
e_decr_hard_reach_2020  eff_test_targeting  prep_strategy 
vmmc_disrup_covid  condom_disrup_covid  prep_disrup_covid  swprog_disrup_covid  
testing_disrup_covid  art_tld_disrup_covid  art_tld_eod_disrup_covid   art_init_disrup_covid   
vl_adh_switch_disrup_covid  cotrim_disrup_covid    no_art_disrup_covid 
inc_adeathr_disrup_covid art_low_adh_disrup_covid  cov_death_risk_mult 

n_mcirc1549_  n_mcirc1549_3m

eff_rate_test_startprep   	eff_rate_test_restartprep   	
eff_rate_choose_stop_prep   		eff_prob_prep_restart_choice   	
p_prep_newp  prop_1564m_onprep  prop_1564w_onprep  p_prep_elig_past_year  p_prep_elig_past_5year  mean_newp_ppers_prep  prop_onprep_newpge1
prop_onprep_newpge2 prop_onprep_newpge3

p_m184m_all  p_k65m_all  incidence_onprep  p_m_newp_ge1_age1549  p_w_newp_ge1_age1549

;


proc sort data=y;by run option;run;

data a.oral_prep ;
set y;

proc contents; run;


