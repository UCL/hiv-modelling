
libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\";


   data wide;    
   set a.wide_covid_hiv_2_8_8_20_11am_9_8_20;





* --------------------------------------------------------------------------------------------------------------;

* for prep analysis (comment out code for other analysese);

/*

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

d_ndb_500_20_70_2 = ndb_500_20_70_2 - ndb_500_20_70_1 ;

if d_ndb_500_20_70_2 >= 0 then ce_500 = 0; if d_ndb_500_20_70_2 < 0 then ce_500 = 1;

optimal_standard_prep_ai1=0;
if prep_improvements_ai1 = 1 and incr_adh_pattern_prep_2020_ai1 = 1 and inc_r_test_startprep_2020_ai1 = 1 and incr_r_test_restartprep_2020_ai1 = 1
and decr_r_choose_stop_prep_2020_ai1 = 1 and inc_p_prep_restart_choi_2020_ai1 = 1 and incr_prepuptake_sw_2020_ai1 = 1 and 
incr_prepuptake_pop_2020_ai1 = 1 and expand_prep_to_all_2020_ai1 = 1 and prep_strategy_ai1 = 7 then optimal_standard_prep_ai1=1;

*/

* --------------------------------------------------------------------------------------------------------------;



* --------------------------------------------------------------------------------------------------------------;

* for covid_hiv ;

/*

ratio_n_hivdeath_1y_vmmc = n_death_hivrel_20_21_2 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_condom = n_death_hivrel_20_21_3 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_prep = n_death_hivrel_20_21_4 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_testing = n_death_hivrel_20_21_5 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_art_init = n_death_hivrel_20_21_6 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_vl_adh_sw = n_death_hivrel_20_21_7 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_cotrim = n_death_hivrel_20_21_8 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_i_dth_r = n_death_hivrel_20_21_9 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_no_art = n_death_hivrel_20_21_10 / n_death_hivrel_20_21_1 ;
ratio_n_hivdeath_1y_low_adh = n_death_hivrel_20_21_11 / n_death_hivrel_20_21_1 ;

log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);
log_ratio_hivdeath_1y_vmmc = log(ratio_n_hivdeath_1y_vmmc);


ratio_n_death_hivrel_20_21 = n_death_hivrel_20_21_2 / n_death_hivrel_20_21_1 ;
ratio_incidence1549_20_21 = incidence1549_20_21_2 / incidence1549_20_21_1 ; 

log_ratio_death_hivrel_20_21 = log(ratio_n_death_hivrel_20_21);
log_ratio_incidence_20_21 = log(ratio_incidence1549_20_21); 

ratio_n_death_hivrel_20_25 = n_death_hivrel_20_25_2 / n_death_hivrel_20_25_1 ;
ratio_incidence1549_20_25 = incidence1549_20_25_2 / incidence1549_20_25_1 ; 

log_ratio_death_hivrel_20_25 = log(ratio_n_death_hivrel_20_25);
log_ratio_incidence_20_25 = log(ratio_incidence1549_20_25); 

ratio_n_bir_w_inf_child_20_21 = n_birth_with_inf_child_20_21_2 / n_birth_with_inf_child_20_21_1 ;
ratio_n_bir_w_inf_child_20_25 = n_birth_with_inf_child_20_25_2 / n_birth_with_inf_child_20_25_1 ;
ratio_n_bir_w_inf_child_20b = n_birth_with_inf_child_20b_2 / n_birth_with_inf_child_20b_1 ;
log_ratio_bir_w_inf_child_20_21 = log(ratio_n_bir_w_inf_child_20_21) ;
log_ratio_bir_w_inf_child_20_25 = log(ratio_n_bir_w_inf_child_20_25) ;
log_ratio_bir_w_inf_child_20b   = log(ratio_n_bir_w_inf_child_20b)   ;

ratio_p_iime__20_25 = p_iime__20_25_2 / p_iime__20_25_2 ;

d_p_onart_vl1000_20_21 = p_onart_vl1000_20_21_2 - p_onart_vl1000_20_21_1;
d_p_onart_vl1000_20_25 = p_onart_vl1000_20_25_2 - p_onart_vl1000_20_25_1;

*/

* --------------------------------------------------------------------------------------------------------------;






* --------------------------------------------------------------------------------------------------------------;

* for tld prep analysis (comment out code for other analysese);

/*

d_ddaly_all_20_70_2 = ddaly_all_20_70_2 - ddaly_all_20_70_1 ;
d_ddaly_all_20_70_3 = ddaly_all_20_70_3 - ddaly_all_20_70_1 ;

d_dcost_20_70_2 = dcost_20_70_2 - dcost_20_70_1 ;
d_dcost_20_70_3 = dcost_20_70_3 - dcost_20_70_1 ;

d_dcost_prep_20_70_2 = dcost_prep_20_70_2 - dcost_prep_20_70_1 ;
d_dcost_prep_20_70_3 = dcost_prep_20_70_3 - dcost_prep_20_70_1 ;

ndb_500_20_70_3 =  ddaly_all_20_70_3 + (dcost_20_70_3)/0.0005;
ndb_500_20_70_2 =  ddaly_all_20_70_2 + (dcost_20_70_2)/0.0005;
ndb_500_20_70_1 =  ddaly_all_20_70_1 + (dcost_20_70_1)/0.0005;

d_ndb_500_20_70_2 = ndb_500_20_70_2 - ndb_500_20_70_1 ; 
d_ndb_500_20_70_3 = ndb_500_20_70_3 - ndb_500_20_70_1 ; 

d_p_diag_20_70_2 = p_diag_20_70_2 - p_diag_20_70_1 ;
d_p_diag_20_70_3 = p_diag_20_70_3 - p_diag_20_70_1 ;

d_n_tested_20_70_2 = n_tested_20_70_2 - n_tested_20_70_1 ;
d_n_tested_20_70_3 = n_tested_20_70_3 - n_tested_20_70_1 ;

min_ndb_500 = min(ndb_500_20_70_3, ndb_500_20_70_2, ndb_500_20_70_1);

ce_500=0;  
if ndb_500_20_70_3 = min_ndb_500 then ce_500=3;
if ndb_500_20_70_2 = min_ndb_500 then ce_500=2;
if ndb_500_20_70_1 = min_ndb_500 then ce_500=1;

*/

* --------------------------------------------------------------------------------------------------------------;




* --------------------------------------------------------------------------------------------------------------;

/*

* for dolswitch analysis (comment out code for other analyses);

d_death_rate_onart_20_40_4 = (death_rate_onart_20_40_4 - death_rate_onart_20_40_1);
d_death_rate_onart_20_40_3 = (death_rate_onart_20_40_3 - death_rate_onart_20_40_1);
d_death_rate_onart_20_40_2 = (death_rate_onart_20_40_2 - death_rate_onart_20_40_1);

d_death_rate_hiv_20_40_4 = (death_rate_hiv_20_40_4 - death_rate_hiv_20_40_1);
d_death_rate_hiv_20_40_3 = (death_rate_hiv_20_40_3 - death_rate_hiv_20_40_1);
d_death_rate_hiv_20_40_2 = (death_rate_hiv_20_40_2 - death_rate_hiv_20_40_1);

d_death_rate_20_40_4 = (death_rate_20_40_4 - death_rate_20_40_1);
d_death_rate_20_40_3 = (death_rate_20_40_3 - death_rate_20_40_1);
d_death_rate_20_40_2 = (death_rate_20_40_2 - death_rate_20_40_1);

d_ddaly_all_20_40_4 = ddaly_all_20_40_4 - ddaly_all_20_40_1 ;
d_ddaly_all_20_40_3 = ddaly_all_20_40_3 - ddaly_all_20_40_1 ;
d_ddaly_all_20_40_2 = ddaly_all_20_40_2 - ddaly_all_20_40_1 ;

d_ddaly_20_40_4 = ddaly_20_40_4 - ddaly_20_40_1 ;
d_ddaly_20_40_3 = ddaly_20_40_3 - ddaly_20_40_1 ;
d_ddaly_20_40_2 = ddaly_20_40_2 - ddaly_20_40_1 ;

d_dead_ddaly_ntd_20_40_4 = dead_ddaly_ntd_20_40_4 - dead_ddaly_ntd_20_40_1 ;
d_dead_ddaly_ntd_20_40_3 = dead_ddaly_ntd_20_40_3 - dead_ddaly_ntd_20_40_1 ;
d_dead_ddaly_ntd_20_40_2 = dead_ddaly_ntd_20_40_2 - dead_ddaly_ntd_20_40_1 ;

d_ddaly_mtct_20_40_4 = ddaly_mtct_20_40_4 - ddaly_mtct_20_40_1 ;
d_ddaly_mtct_20_40_3 = ddaly_mtct_20_40_3 - ddaly_mtct_20_40_1 ;
d_ddaly_mtct_20_40_2 = ddaly_mtct_20_40_2 - ddaly_mtct_20_40_1 ;

d_dead_ddaly_odabe_20_40_4 = dead_ddaly_odabe_20_40_4 - dead_ddaly_odabe_20_40_1 ;
d_dead_ddaly_odabe_20_40_3 = dead_ddaly_odabe_20_40_3 - dead_ddaly_odabe_20_40_1 ;
d_dead_ddaly_odabe_20_40_2 = dead_ddaly_odabe_20_40_2 - dead_ddaly_odabe_20_40_1 ;

d_ddaly_non_aids_pre_dth_20_40_4 = ddaly_non_aids_pre_death_20_40_4 - ddaly_non_aids_pre_death_20_40_1 ;
d_ddaly_non_aids_pre_dth_20_40_3 = ddaly_non_aids_pre_death_20_40_3 - ddaly_non_aids_pre_death_20_40_1 ;
d_ddaly_non_aids_pre_dth_20_40_2 = ddaly_non_aids_pre_death_20_40_2 - ddaly_non_aids_pre_death_20_40_1 ;

d_dcost_20_40_4 = dcost_20_40_4 - dcost_20_40_1 ;
d_dcost_20_40_3 = dcost_20_40_3 - dcost_20_40_1 ;
d_dcost_20_40_2 = dcost_20_40_2 - dcost_20_40_1 ; 

d_dcd4_cost_20_40_4 = dcd4_cost_20_40_4 - dcd4_cost_20_40_1 ;
d_dcd4_cost_20_40_3 = dcd4_cost_20_40_3 - dcd4_cost_20_40_1 ;
d_dcd4_cost_20_40_2 = dcd4_cost_20_40_2 - dcd4_cost_20_40_1 ;

d_dvl_cost_20_40_4 = dvl_cost_20_40_4 - dvl_cost_20_40_1 ;
d_dvl_cost_20_40_3 = dvl_cost_20_40_3 - dvl_cost_20_40_1 ;
d_dvl_cost_20_40_2 = dvl_cost_20_40_2 - dvl_cost_20_40_1 ;

d_dvis_cost_20_40_4 = dvis_cost_20_40_4 - dvis_cost_20_40_1 ;
d_dvis_cost_20_40_3 = dvis_cost_20_40_3 - dvis_cost_20_40_1 ;
d_dvis_cost_20_40_2 = dvis_cost_20_40_2 - dvis_cost_20_40_1 ;

d_dcot_cost_20_40_4 = dcot_cost_20_40_4 - dcot_cost_20_40_1 ;
d_dcot_cost_20_40_3 = dcot_cost_20_40_3 - dcot_cost_20_40_1 ;
d_dcot_cost_20_40_2 = dcot_cost_20_40_2 - dcot_cost_20_40_1 ;

d_dtest_cost_20_40_4 = dtest_cost_20_40_4 - dtest_cost_20_40_1 ;
d_dtest_cost_20_40_3 = dtest_cost_20_40_3 - dtest_cost_20_40_1 ;
d_dtest_cost_20_40_2 = dtest_cost_20_40_2 - dtest_cost_20_40_1 ;

d_dswitchline_cost_20_40_4 = dswitchline_cost_20_40_4 - dswitchline_cost_20_40_1 ;
d_dswitchline_cost_20_40_3 = dswitchline_cost_20_40_3 - dswitchline_cost_20_40_1 ;
d_dswitchline_cost_20_40_2 = dswitchline_cost_20_40_2 - dswitchline_cost_20_40_1 ;

d_dclin_cost_20_40_4 = dclin_cost_20_40_4 - dclin_cost_20_40_1 ;
d_dclin_cost_20_40_3 = dclin_cost_20_40_3 - dclin_cost_20_40_1 ;
d_dclin_cost_20_40_2 = dclin_cost_20_40_2 - dclin_cost_20_40_1 ;

d_dcost_clin_care_20_40_4 = dcost_clin_care_20_40_4 - dcost_clin_care_20_40_1 ;
d_dcost_clin_care_20_40_3 = dcost_clin_care_20_40_3 - dcost_clin_care_20_40_1 ;
d_dcost_clin_care_20_40_2 = dcost_clin_care_20_40_2 - dcost_clin_care_20_40_1 ;

d_dcost_non_aids_pre_dth_20_40_4 = dcost_non_aids_pre_death_20_40_4 - dcost_non_aids_pre_death_20_40_1 ;
d_dcost_non_aids_pre_dth_20_40_3 = dcost_non_aids_pre_death_20_40_3 - dcost_non_aids_pre_death_20_40_1 ;
d_dcost_non_aids_pre_dth_20_40_2 = dcost_non_aids_pre_death_20_40_2 - dcost_non_aids_pre_death_20_40_1 ;

d_dcost_child_hiv_20_40_4 = dcost_child_hiv_20_40_4 - dcost_child_hiv_20_40_1 ;
d_dcost_child_hiv_20_40_3 = dcost_child_hiv_20_40_3 - dcost_child_hiv_20_40_1 ;
d_dcost_child_hiv_20_40_2 = dcost_child_hiv_20_40_2 - dcost_child_hiv_20_40_1 ;

d_dzdv_cost_20_40_4 = dzdv_cost_20_40_4 - dzdv_cost_20_40_1 ;
d_dzdv_cost_20_40_3 = dzdv_cost_20_40_3 - dzdv_cost_20_40_1 ;
d_dzdv_cost_20_40_2 = dzdv_cost_20_40_2 - dzdv_cost_20_40_1 ;

d_dten_cost_20_40_4 = dten_cost_20_40_4 - dten_cost_20_40_1 ;
d_dten_cost_20_40_3 = dten_cost_20_40_3 - dten_cost_20_40_1 ;
d_dten_cost_20_40_2 = dten_cost_20_40_2 - dten_cost_20_40_1 ;

d_d3tc_cost_20_40_4 = d3tc_cost_20_40_4 - d3tc_cost_20_40_1 ;
d_d3tc_cost_20_40_3 = d3tc_cost_20_40_3 - d3tc_cost_20_40_1 ;
d_d3tc_cost_20_40_2 = d3tc_cost_20_40_2 - d3tc_cost_20_40_1 ;

d_dnev_cost_20_40_4 = dnev_cost_20_40_4 - dnev_cost_20_40_1 ;
d_dnev_cost_20_40_3 = dnev_cost_20_40_3 - dnev_cost_20_40_1 ;
d_dnev_cost_20_40_2 = dnev_cost_20_40_2 - dnev_cost_20_40_1 ;

d_dlpr_cost_20_40_4 = dlpr_cost_20_40_4 - dlpr_cost_20_40_1 ;
d_dlpr_cost_20_40_3 = dlpr_cost_20_40_3 - dlpr_cost_20_40_1 ;
d_dlpr_cost_20_40_2 = dlpr_cost_20_40_2 - dlpr_cost_20_40_1 ;

d_dtaz_cost_20_40_4 = dtaz_cost_20_40_4 - dtaz_cost_20_40_1 ;
d_dtaz_cost_20_40_3 = dtaz_cost_20_40_3 - dtaz_cost_20_40_1 ;
d_dtaz_cost_20_40_2 = dtaz_cost_20_40_2 - dtaz_cost_20_40_1 ;

d_defa_cost_20_40_4 = defa_cost_20_40_4 - defa_cost_20_40_1 ;
d_defa_cost_20_40_3 = defa_cost_20_40_3 - defa_cost_20_40_1 ;
d_defa_cost_20_40_2 = defa_cost_20_40_2 - defa_cost_20_40_1 ;

d_ddol_cost_20_40_4 = ddol_cost_20_40_4 - ddol_cost_20_40_1 ;
d_ddol_cost_20_40_3 = ddol_cost_20_40_3 - ddol_cost_20_40_1 ;
d_ddol_cost_20_40_2 = ddol_cost_20_40_2 - ddol_cost_20_40_1 ;


ndb_500_20_40_4 =  ddaly_all_20_40_4 + (dcost_20_40_4)/0.0005;
ndb_500_20_40_3 =  ddaly_all_20_40_3 + (dcost_20_40_3)/0.0005;
ndb_500_20_40_2 =  ddaly_all_20_40_2 + (dcost_20_40_2)/0.0005;
ndb_500_20_40_1 =  ddaly_all_20_40_1 + (dcost_20_40_1)/0.0005;

d_ndb_500_20_40_4 = ndb_500_20_40_1 - ndb_500_20_40_4 ;
d_ndb_500_20_40_3 = ndb_500_20_40_1 - ndb_500_20_40_3 ;
d_ndb_500_20_40_2 = ndb_500_20_40_1 - ndb_500_20_40_2 ;

min_ndb_500 = min(ndb_500_20_40_4, ndb_500_20_40_3, ndb_500_20_40_2, ndb_500_20_40_1);

d_ndb_500_20_40_3_4 = ndb_500_20_40_4 - ndb_500_20_40_3 ;

ce_500=0;  
if ndb_500_20_40_4 = min_ndb_500 then ce_500=4;
if ndb_500_20_40_3 = min_ndb_500 then ce_500=3;
if ndb_500_20_40_2 = min_ndb_500 then ce_500=2;
if ndb_500_20_40_1 = min_ndb_500 then ce_500=1;

d_dart_cost_y_4 = dart_cost_y_20_40_4 - dart_cost_y_20_40_1 ;
d_dart_cost_y_3 = dart_cost_y_20_40_3 - dart_cost_y_20_40_1 ;
d_dart_cost_y_2 = dart_cost_y_20_40_2 - dart_cost_y_20_40_1 ;

d_p_onart_vl1000_20_40_4 = (p_onart_vl1000_20_40_4 - p_onart_vl1000_20_40_1)* 100;
d_p_onart_vl1000_20_40_3 = (p_onart_vl1000_20_40_3 - p_onart_vl1000_20_40_1)* 100;
d_p_onart_vl1000_20_40_2 = (p_onart_vl1000_20_40_2 - p_onart_vl1000_20_40_1)* 100;

d_p_onart_vl1000_21_4 = (p_onart_vl1000_21_4 - p_onart_vl1000_21_1)* 100;
d_p_onart_vl1000_21_3 = (p_onart_vl1000_21_3 - p_onart_vl1000_21_1)* 100;
d_p_onart_vl1000_21_2 = (p_onart_vl1000_21_2 - p_onart_vl1000_21_1)* 100;

d_p_nnme__20_40_4 = (p_nnme__20_40_4 - p_nnme__20_40_1)* 100;
d_p_nnme__20_40_3 = (p_nnme__20_40_3 - p_nnme__20_40_1)* 100;
d_p_nnme__20_40_2 = (p_nnme__20_40_2 - p_nnme__20_40_1)* 100;

d_p_iime__20_40_4 = (p_iime__20_40_4 - p_iime__20_40_1)* 100;
d_p_iime__20_40_3 = (p_iime__20_40_3 - p_iime__20_40_1)* 100;
d_p_iime__20_40_2 = (p_iime__20_40_2 - p_iime__20_40_1)* 100;

d_n_pregnant_ntd_20_40_4 = (n_pregnant_ntd_20_40_4 - n_pregnant_ntd_20_40_1);
d_n_pregnant_ntd_20_40_3 = (n_pregnant_ntd_20_40_3 - n_pregnant_ntd_20_40_1);
d_n_pregnant_ntd_20_40_2 = (n_pregnant_ntd_20_40_2 - n_pregnant_ntd_20_40_1);

d_mtct_prop_20_40_4 = (mtct_prop_20_40_4 - mtct_prop_20_40_1);
d_mtct_prop_20_40_3 = (mtct_prop_20_40_3 - mtct_prop_20_40_1);
d_mtct_prop_20_40_2 = (mtct_prop_20_40_2 - mtct_prop_20_40_1);

d_n_birth_with_inf_child_20_40_4 = (n_birth_with_inf_child_20_40_4 - n_birth_with_inf_child_20_40_1);
d_n_birth_with_inf_child_20_40_3 = (n_birth_with_inf_child_20_40_3 - n_birth_with_inf_child_20_40_1);
d_n_birth_with_inf_child_20_40_2 = (n_birth_with_inf_child_20_40_2 - n_birth_with_inf_child_20_40_1);

d_n_preg_odabe_20_40_4 = (n_preg_odabe_20_40_4 - n_preg_odabe_20_40_1);
d_n_preg_odabe_20_40_3 = (n_preg_odabe_20_40_3 - n_preg_odabe_20_40_1);
d_n_preg_odabe_20_40_2 = (n_preg_odabe_20_40_2 - n_preg_odabe_20_40_1);

*/


* --------------------------------------------------------------------------------------------------------------;



* --------------------------------------------------------------------------------------------------------------;

* for art monitoring analyses (comment out code for other analysese);

/*

d_p_onart_vl1000_20_40_8_7 = (p_onart_vl1000_20_40_8 - p_onart_vl1000_20_40_7)* 100;

d_ddaly_all_20_40_8_7 = (ddaly_all_20_40_8 - ddaly_all_20_40_7);
d_dcost_20_40_8_7 = (dcost_20_40_8 - dcost_20_40_7);
d_ndb_500_20_40_8_7 = (ndb_500_20_40_8 - ndb_500_20_40_7); 

min_ndb_500 = min(ndb_500_20_40_7, ndb_500_20_40_8);

ce_500_monitoring=0;  
if ndb_500_20_40_7 = min_ndb_500 then ce_500_monitoring=7;
if ndb_500_20_40_8 = min_ndb_500 then ce_500_monitoring=8;

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

proc means n p50 p5 p95;
var p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 incidence1549_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_onprep_20
p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20   p_onart_cd4_l500_20  
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20 ;
run;


proc means n p50 p5 p95;
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
p_k65m_20 p_m184m_20 ;
run;

/*
proc univariate  data=wide;  var gender_r_newp_05_20
m15r_05_20 m25r_05_20 m35r_05_20 m45r_05_20 m55r_05_20 w15r_05_20 w25r_05_20 w35r_05_20 w45r_05_20 w55r_05_20 
m15r_16 m25r_16 m35r_16 m45r_16 m55r_16 w15r_16 w25r_16 w35r_16 w45r_16 w55r_16 
m15r_19 m25r_19 m35r_19 m45r_19 m55r_19 w15r_19 w25r_19 w35r_19 w45r_19 w55r_19 
;  * run;

  proc glm data=wide;   class 
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w 
exp_setting_lower_p_vl1000   ych_risk_beh_newp  adh_pattern   adh_pattern_prep  ;
  model incidence1549_20 = 
sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p  p_hsb_p  newp_factor  eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  
ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base fold_change_w  fold_change_yw  
fold_change_sti  super_infection  an_lin_incr_test  date_test_rate_plateau  
rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  adh_pattern  prob_loss_at_diag  pr_art_init  rate_lost
prob_lost_art  rate_return  rate_restart  rate_int_choice  
clinic_not_aw_int_frac
res_trans_factor_nn  rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii  rate_res_ten
fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb 
prob_lossdiag_who3e  higher_newp_less_engagement  
fold_tr  switch_for_tox
adh_pattern_prep  rate_test_startprep  rate_test_restartprep  rate_choose_stop_prep  circ_inc_rate p_hard_reach_w  hard_reach_higher_in_men
p_hard_reach_m  inc_cat base_rate_sw
/ solution;
  run;
*/

* --------------------------------------------------------------------------------------------------------------;

* prep analysis;

/*

proc print data=wide; var  prep_improvements_ai1 incr_adh_pattern_prep_2020_ai1 inc_r_test_startprep_2020_ai1 incr_r_test_restartprep_2020_ai1
decr_r_choose_stop_prep_2020_ai1 inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1 
incr_prepuptake_pop_2020_ai1 expand_prep_to_all_2020_ai1 prep_strategy_ai1 optimal_standard_prep_ai1 pop_wide_tld_2020_ai1 ;
  where prep_improvements_ai1 =1;
run;

proc freq data=wide; tables
option_0_prep_continue_2020_ai0  eff_rate_test_startprep_ai0  	eff_rate_test_restartprep_ai0  	eff_rate_choose_stop_prep_ai0  
eff_prob_prep_restart_choice_ai0  prep_improvements_ai1   incr_adh_pattern_prep_2020_ai1 
inc_r_test_startprep_2020_ai1 	incr_r_test_restartprep_2020_ai1 decr_r_choose_stop_prep_2020_ai1 inc_p_prep_restart_choi_2020_ai1 
incr_prepuptake_sw_2020_ai1  incr_prepuptake_pop_2020_ai1   expand_prep_to_all_2020_ai1  eff_rate_test_startprep_ai1  eff_rate_test_restartprep_ai1  	
eff_rate_choose_stop_prep_ai1  eff_prob_prep_restart_choice_ai1   optimal_standard_prep_ai1 
pop_wide_tld_2020_ai1   optimal_standard_prep_ai1 * pop_wide_tld_2020_ai1 ;
run;

ods html;
proc means data=wide; var n_hiv1_prep_20_70_1 n_hiv1_prep_20_70_2  n_prep_20_70_1 n_prep_20_70_2 ; 
* where pop_wide_tld_2020_ai1 =1;
  where prep_improvements_ai1 =1;
run;
ods html close;

ods html;
proc means data=wide; var  dcost_prep_20_25_1 dcost_prep_20_25_2 ;  
  where prep_improvements_ai1 =1;
run; 
ods htm close;


proc freq data=wide; tables prep_improvements_ai1 * pop_wide_tld_2020_ai1 ; run;

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_w_1524_onprep_20_25_1  prop_w_1524_onprep_20_25_2 ;  
  where prep_improvements_ai1 = 1;
ods html close;
run;

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_1564_onprep_20_25_1  prop_1564_onprep_20_25_2 ;  
  where prep_improvements_ai1 =1;
* where pop_wide_tld_2020_ai1 =1;
run; 
ods html close;

ods html;
proc means data=wide; var prop_sw_onprep_20_25_1  prop_sw_onprep_20_25_2 ;  
* where prep_improvements_ai1 =1;
  where pop_wide_tld_2020_ai1 =1;
run; 
ods html close;

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_elig_on_prep_20_25_1  prop_elig_on_prep_20_25_2 ;  
* where prep_improvements_ai1 =1;
  where pop_wide_tld_2020_ai1 =1;
run; 
ods html close;

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var incidence1549_20_70_1 incidence1549_20_70_2 ;  
  where prep_improvements_ai1 =1;
* where pop_wide_tld_2020_ai1 =1;
run; 
ods html close;


ods html;
proc means data=wide; var      ddaly_all_20_70_1  ddaly_all_20_70_2  d_ddaly_all_20_70_2 d_ndb_500_20_70_2  ndb_500_20_70_2  ndb_500_20_70_1
d_dcost_20_70_2  dcost_20_70_2  dcost_20_70_1  d_dcost_prep_20_70_2  dcost_prep_20_70_1 dcost_prep_20_70_2   ; 
  where prep_improvements_ai1 =1;
* where pop_wide_tld_2020_ai1 =1;
run; 
ods html close;



ods html;
proc means data=wide; var prop_art_or_prep_20_25_1  prop_art_or_prep_20_25_2 ;  
* where prep_improvements_ai1 =1;
  where pop_wide_tld_2020_ai1 =1;
run; 
ods htm close;


ods html;
proc means data=wide; var prop_elig_on_prep_20_25_1  prop_elig_on_prep_20_25_2 ;  
  where prep_improvements_ai1 =1;
run; 
ods htm close;


ods html;
proc means data=wide; var p_onart_20_70_1  p_onart_20_70_2 ;  
  where prep_improvements_ai1 =1;
run; 
ods htm close;

*  p_prep_ever   p_hiv1_prep   incidence1524w   incidence1524m   p_k65m    p_m184m ;


proc univariate; var prop_elig_on_prep_20_25_2 ; run;

ods html;
proc means data=wide; var    
d_ddaly_all_20_25_2  
d_ndb_500_20_25_2  
d_dcost_20_25_2  
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


* todo: check on test costs - they seem high ;


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
;
run; 
ods html close;

* dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dtaz_cost dcost_drug_level_test   dclin_cost dcost_cascade_interventions     dcost_circ dcost_condom_dn dcost_prep_visit  dcost_prep ;


proc glm; class   	incr_adh_pattern_prep_2020_ai1 
inc_r_test_startprep_2020_ai1 	incr_r_test_restartprep_2020_ai1 decr_r_choose_stop_prep_2020_ai1 
inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1   	incr_prepuptake_pop_2020_ai1   expand_prep_to_all_2020_ai1 ;
model d_ddaly_all_20_70_2 = incr_adh_pattern_prep_2020_ai1 
inc_r_test_startprep_2020_ai1 	incr_r_test_restartprep_2020_ai1 decr_r_choose_stop_prep_2020_ai1 
inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1   	incr_prepuptake_pop_2020_ai1   expand_prep_to_all_2020_ai1
/ solution;
where prep_improvements_ai1 =1;
run;



proc freq data=wide; tables ce_500;
run; 

*/

* --------------------------------------------------------------------------------------------------------------;




* --------------------------------------------------------------------------------------------------------------;

* covid_hiv ;

/*

proc univariate data=wide; var ratio_n_death_hivrel_20_21 ; 
* where 0.80 <= p_vl1000_20 < 1.00 ;   * this done for each country;
run;

proc freq data=wide; tables ratio_n_death_hivrel_20_25 ; 
* where 0.80 <= p_vl1000_20 < 1.00 ;   * this done for each country;
run;

proc glm; model log_ratio_death_hivrel_20_21 = ; run;

proc univariate; var ratio_incidence1549_20_21  incidence1549_20_21_2 incidence1549_20_21_1;
run;

proc freq; tables ratio_incidence1549_20_25 ; run;

proc glm; model log_ratio_death_hivrel_20_21 = p_vl1000_20; run;


proc means; var p_death_hivrel_age_le64_20_21_2;   run;

proc univariate; var ratio_n_bir_w_inf_child_20_21 ; run;

proc means; var  death_rate_20_21_1  death_rate_20_21_2 p_vl1000_20_21_1  p_vl1000_20_21_2 p_onart_20_21_1  p_onart_20_21_2 
p_onart_vl1000_20_21_1  p_onart_vl1000_20_21_2 
n_death_hivrel_20_21_1  n_death_hivrel_20_21_2 ; run;

*/

* --------------------------------------------------------------------------------------------------------------;




* --------------------------------------------------------------------------------------------------------------;

* tld prep analysis;

/*

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_1564_onprep_20_25_1  prop_1564_onprep_20_25_2   prop_1564_onprep_20_25_3 ;  
run; 
ods html close;

 

ods html;
proc means n mean lclm uclm p5 p95 data=wide; var prop_art_or_prep_20_25_1  prop_art_or_prep_20_25_2   prop_art_or_prep_20_25_3 ;  
run; 
ods html close;



ods html;
proc means data=wide; var    
d_ddaly_all_20_70_2  d_ddaly_all_20_70_3
d_ndb_500_20_70_2  d_ndb_500_20_70_3
d_dcost_20_70_2  d_dcost_20_70_3  
d_n_tested_20_70_2 d_n_tested_20_70_3
incidence1549_20_70_1 incidence1549_20_70_2 incidence1549_20_70_3
n_tested_20_70_1 n_tested_20_70_2 n_tested_20_70_3 
p_onart_20_70_1 p_onart_20_70_2 p_onart_20_70_3
p_diag_20_70_1 p_diag_20_70_2 p_diag_20_70_3
p_vl1000_20_70_1 p_vl1000_20_70_2 p_vl1000_20_70_3
prevalence_vg1000_20_70_1 prevalence_vg1000_20_70_2 prevalence_vg1000_20_70_3 
prop_art_or_prep_20_70_1  prop_art_or_prep_20_70_2 prop_art_or_prep_20_70_3
;
run; 
ods html close;

proc freq; tables ce_500 ; run;

*/


* --------------------------------------------------------------------------------------------------------------;





* --------------------------------------------------------------------------------------------------------------;

* dolswitch analysis;

/*

ods html;
proc means data=wide; var p_dol_16 p_dol_19 p_dol_20  p_dol_20_40_4  p_dol_20_40_3 p_dol_20_40_2  p_dol_20_40_1 ;
run; 
ods html close;

ods html;
proc means data=wide; var  p_onart_vl1000_20_40_4  p_onart_vl1000_20_40_3  p_onart_vl1000_20_40_2  p_onart_vl1000_20_40_1  ;
run; 
ods html close;

proc means data=wide; var  p_iime__20_40_4  p_iime__20_40_3   p_iime__20_40_2  p_iime__20_40_1  ;
proc univariate data=wide; var  d_p_iime__20_40_4  d_p_iime__20_40_3  d_p_iime__20_40_2  ; run; 
* nnme pime ; 


proc means data=wide; var  n_pregnant_ntd_20_40_4  n_pregnant_ntd_20_40_3   n_pregnant_ntd_20_40_2  n_pregnant_ntd_20_40_1  ;
proc univariate data=wide; var  d_n_pregnant_ntd_20_40_4  d_n_pregnant_ntd_20_40_3  d_n_pregnant_ntd_20_40_2  ; run; 


proc means data=wide; var  n_birth_with_inf_child_20_40_4  n_birth_with_inf_child_20_40_3   n_birth_with_inf_child_20_40_2  n_birth_with_inf_child_20_40_1  ;
proc univariate data=wide; var  d_n_birth_with_inf_child_20_40_4  d_n_birth_with_inf_child_20_40_3  d_n_birth_with_inf_child_20_40_2  ; run; 


proc means data=wide; var  n_preg_odabe_20_40_4  n_preg_odabe_20_40_3   n_preg_odabe_20_40_2  n_preg_odabe_20_40_1  ;
proc univariate data=wide; var  d_n_preg_odabe_20_40_4  d_n_preg_odabe_20_40_3  d_n_preg_odabe_20_40_2  ; run; 


proc univariate data=wide; var  d_p_onart_vl1000_20_40_4  d_p_onart_vl1000_20_40_3  d_p_onart_vl1000_20_40_2  ;
run; 


ods html;
proc means data=wide; var  d_p_onart_vl1000_21_4  d_p_onart_vl1000_21_3  d_p_onart_vl1000_21_2  ;
run; 
ods html close;


proc means data=wide; var  death_rate_onart_20_40_4  death_rate_onart_20_40_3  death_rate_onart_20_40_2  death_rate_onart_20_40_1 ;  run;
proc univariate data=wide; var  d_death_rate_onart_20_40_4  d_death_rate_onart_20_40_3  d_death_rate_onart_20_40_2  ;  run;


ods html;
proc means data=wide; var  d_death_rate_hiv_20_40_4  d_death_rate_hiv_20_40_3  d_death_rate_hiv_20_40_2  ;
* where greater_tox_zdv_ = 1 and rate_int_choice_ ge 0.025;
run; 
ods html close;


proc means data=wide; var  death_rate_20_40_4  death_rate_20_40_3  death_rate_20_40_2   death_rate_20_40_1 ;  run; 
proc univariate data=wide; var  d_death_rate_20_40_4  d_death_rate_20_40_3  d_death_rate_20_40_2  ;  run; 

ods html;
proc means data=wide; var  d_ndb_500_20_40_4  d_ndb_500_20_40_3  d_ndb_500_20_40_2  ;
run; 
ods html close;

ods html;
proc means data=wide; var  dcost_20_40_1  dcost_20_40_2  dcost_20_40_3  dcost_20_40_4  ;
run; 
ods html close;

ods html;
proc means data=wide; var  dlpr_cost_20_40_1  dlpr_cost_20_40_2  dlpr_cost_20_40_3  dlpr_cost_20_40_4  ; run;
ods html close;

proc means data=wide; var  d_dcost_20_40_2  d_dcost_20_40_3  d_dcost_20_40_4  ;run; 

*  dcost
dcd4_cost   dvl_cost   dvis_cost   dcot_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost dcost_clin_care    dcost_non_aids_pre_dth   dcost_child_hiv  
dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost  dtaz_cost    dcost_circ   dcost_condom_dn
defa_cost   ddol_cost
;






ods html;
proc means data=wide; var  d_ddaly_all_20_40_4  d_ddaly_all_20_40_3  d_ddaly_all_20_40_2  ;  run; 
ods html close;

ods html;
proc means data=wide; var  d_ddaly_20_40_4  d_ddaly_20_40_3  d_ddaly_20_40_2  ; run; 
ods html close;

ods html;
proc means data=wide; var  d_dead_ddaly_ntd_20_40_4  d_dead_ddaly_ntd_20_40_3  d_dead_ddaly_ntd_20_40_2  ; run; 
ods html close;

ods html;
proc means data=wide; var  d_ddaly_mtct_20_40_4  d_ddaly_mtct_20_40_3  d_ddaly_mtct_20_40_2  ; run; 
ods html close;

ods html;
proc means data=wide; var  d_dead_ddaly_odabe_20_40_4  d_dead_ddaly_odabe_20_40_3  d_dead_ddaly_odabe_20_40_2  ; run; 
ods html close;

ods html;
proc means data=wide; var  d_ddaly_non_aids_pre_dth_20_40_4  d_ddaly_non_aids_pre_dth_20_40_3  d_ddaly_non_aids_pre_dth_20_40_2  ; run; 
ods html close;



proc freq; tables p_onart_vl1000_19  p_vlg1000_onart_65m_19  ; run;


proc freq data=wide; tables ce_500; 
* where p_onart_vl1000_19 < 0.83;
* where p_onart_vl1000_19 > 0.90;
* where pr_switch_line_ = 0.2;
* where prob_vl_meas_done_ >= 0.70 ;
* where prob_vl_meas_done_ <= 0.10 ;
* where zero_tdf_activity_k65r_ =1;
* where zero_3tc_activity_m184_ = 1 ;
* where p_vlg1000_onart_65m_19 <= 0.64 ;  
* where p_vlg1000_onart_65m_19 >= 0.76 ;  
* where red_adh_multi_pill_pop_ > 0.10;
* where greater_disability_tox_ = 1;
* where greater_tox_zdv_ = 1;
* where rate_int_choice_ ge 0.025;
* where nnrti_res_no_effect = 1;
  where red_adh_tox_pop_  > 0.10;
run;






*  aids_death_rate  death_rate_onart  d_death_rate_onart d_ddaly_all    ;

proc means data=wide; var  
p_o_zdv_tox_19 p_o_3tc_tox_19 p_o_ten_tox_19 p_o_taz_tox_19 p_o_lpr_tox_19 p_o_efa_tox_19 p_o_nev_tox_19 p_o_dol_tox_19 
p_o_tld_tox_19 p_o_tle_tox_19  p_o_zla_tox_19  p_o_zld_tox_19  
p_o_zdv_tox_20_25_3 p_o_3tc_tox_20_25_3 p_o_ten_tox_20_25_3 p_o_taz_tox_20_25_3 p_o_lpr_tox_20_25_3 p_o_efa_tox_20_25_3 p_o_nev_tox_20_25_3 p_o_dol_tox_20_25_3 
p_o_tld_tox_20_25_3 p_o_tle_tox_20_25_3  p_o_zla_tox_20_25_3  p_o_zld_tox_20_25_3    
p_o_zdv_tox_20_25_4  p_o_3tc_tox_20_25_4  p_o_ten_tox_20_25_4  p_o_taz_tox_20_25_4  p_o_lpr_tox_20_25_4  p_o_efa_tox_20_25_4  p_o_nev_tox_20_25_4  p_o_dol_tox_20_25_4  
p_o_tld_tox_20_25_4  p_o_tle_tox_20_25_4   p_o_zla_tox_20_25_4   p_o_zld_tox_20_25_4   ;  run;

proc means data=wide; var  
p_o_zdv_adh_hi_19 p_o_3tc_adh_hi_19 p_o_ten_adh_hi_19  p_o_taz_adh_hi_19 p_o_lpr_adh_hi_19 p_o_efa_adh_hi_19 p_o_nev_adh_hi_19 p_o_dol_adh_hi_19
p_o_tld_adh_hi_19 p_o_tle_adh_hi_19  p_o_zla_adh_hi_19  p_o_zld_adh_hi_19   p_adh_hi_19
p_o_zdv_adh_hi_20_25_3 p_o_3tc_adh_hi_20_25_3 p_o_ten_adh_hi_20_25_3  p_o_taz_adh_hi_20_25_3 p_o_lpr_adh_hi_20_25_3 p_o_efa_adh_hi_20_25_3 p_o_nev_adh_hi_20_25_3 
p_o_dol_adh_hi_20_25_3 p_o_tld_adh_hi_20_25_3 p_o_tle_adh_hi_20_25_3  p_o_zla_adh_hi_20_25_3  p_o_zld_adh_hi_20_25_3   p_adh_hi_20_25_3
p_o_zdv_adh_hi_20_25_4  p_o_3tc_adh_hi_20_25_4  p_o_ten_adh_hi_20_25_4   p_o_taz_adh_hi_20_25_4  p_o_lpr_adh_hi_20_25_4  p_o_efa_adh_hi_20_25_4  p_o_nev_adh_hi_20_25_4  
 p_o_dol_adh_hi_20_25_4  p_o_tld_adh_hi_20_25_4  p_o_tle_adh_hi_20_25_4   p_o_zla_adh_hi_20_25_4   p_o_zld_adh_hi_20_25_4     p_adh_hi_20_25_4 ; run;

 * s_a_zld_if_reg_op_116_20_25_3 gives a comparison of the number on art still after the possible switch to zdv and so comparison
 of option 3 vs 4 compares the tendency to interrupt for zdv vs ten;
proc means data=wide; var   p_adh_hi_19  p_adh_hi_21_3   p_adh_hi_21_4  
p_nactive_ge2p75_xyz_21_3 p_nactive_ge2p75_xyz_21_4  p_nactive_ge2p00_xyz_21_3 p_nactive_ge2p00_xyz_21_4
p_nactive_ge1p50_xyz_21_3 p_nactive_ge1p50_xyz_21_4
s_a_zld_if_reg_op_116_21_3 s_a_zld_if_reg_op_116_21_4  
p_adh_hi_xyz_ot1_21_3   p_adh_hi_xyz_ot1_21_4    
p_adh_hi_xyz_ot2_21_3  p_adh_hi_xyz_ot2_21_4    
p_adh_hi_xyz_itt_21_3    p_adh_hi_xyz_itt_21_4     
p_e_rt65m_xyz_21_3  p_e_rt65m_xyz_21_4
;
* where rate_res_ten_ = 0.1;
* where red_adh_multi_pill_pop_ > 0.1; 
* where greater_disability_tox_ = 1;
* where greater_tox_zdv_ = 1;
* where rate_int_choice_ ge 0.025;
run;



proc print; var  dataset_19  p_adh_hi_19  p_adh_hi_21_3   p_adh_hi_21_4  
p_nactive_ge2p75_xyz_21_3 p_nactive_ge2p75_xyz_21_4  s_a_zld_if_reg_op_116_21_3 s_a_zld_if_reg_op_116_21_4  ;
run;
* note p_nactive_ge2p75_xyz not available for datasets 1 and 2 out of the 6;



proc glm; 
model d_ndb_500_20_40_3_4 = 
sex_beh_trans_matrix_m_  sex_beh_trans_matrix_w_  sex_age_mixing_matrix_m_ sex_age_mixing_matrix_w_  p_rred_p_  p_hsb_p_  newp_factor_  eprate_  conc_ep_  
ch_risk_diag_  ch_risk_diag_newp_  ych_risk_beh_newp_  ych2_risk_beh_newp_  ych_risk_beh_ep_  exp_setting_lower_p_vl1000_  external_exp_factor_  
rate_exp_set_lower_p_vl1000_  prob_pregnancy_base_ fold_change_w_  fold_change_yw_  fold_change_sti_  super_infection_  an_lin_incr_test_  
date_test_rate_plateau_  rate_testanc_inc_  incr_test_rate_sympt_  max_freq_testing_  test_targeting_  fx_  adh_pattern_  prob_loss_at_diag_  pr_art_init_  
rate_lost_  prob_lost_art_  rate_return_  rate_restart_  rate_int_choice_  clinic_not_aw_int_frac_  res_trans_factor_nn_  rate_loss_persistence_  
incr_rate_int_low_adh_  poorer_cd4rise_fail_nn_  poorer_cd4rise_fail_ii_  rate_res_ten_  fold_change_mut_risk_  adh_effect_of_meas_alert_  
pr_switch_line_  prob_vl_meas_done_  red_adh_tb_adc_  red_adh_tox_pop_  add_eff_adh_nnrti_  altered_adh_sec_line_pop_  prob_return_adc_  prob_lossdiag_adctb_  
prob_lossdiag_who3e_  higher_newp_less_engagement_  fold_tr_  switch_for_tox_  adh_pattern_prep_  rate_test_startprep_  rate_test_restartprep_  
rate_choose_stop_prep_  circ_inc_rate_ p_hard_reach_w_  hard_reach_higher_in_men_  p_hard_reach_m_  inc_cat_ base_rate_sw_ / solution
; 
run;

*/

* --------------------------------------------------------------------------------------------------------------;





* --------------------------------------------------------------------------------------------------------------;

* art monitoring analysis;

* (note runs of dolswitch after 24-10-10 do not include the alternative art monitoring strategy) so this code is not applicable ;

/*

proc means data=wide;
var p_dol_2vg1000_dolr1_adh0_20_40_1 p_dol_2vg1000_dolr1_adh1_20_40_1 p_dol_2vg1000_dolr0_adh0_20_40_1 p_dol_2vg1000_dolr0_adh1_20_40_1;
run;
proc means data=wide;
var p_dol_2vg1000_dolr1_adh0_20_40_7 p_dol_2vg1000_dolr1_adh1_20_40_7 p_dol_2vg1000_dolr0_adh0_20_40_7 p_dol_2vg1000_dolr0_adh1_20_40_7;
run;


ods html;
proc means data=wide; var p_onart_vl1000_20_40_7  p_onart_vl1000_20_40_8  ;
run; 
ods htm close;

ods html;
proc means data=wide; var d_p_onart_vl1000_20_40_8_7 ;
run; 
ods htm close;

ods html;
proc means data=wide; var p_linefail_ge1_20_40_7  p_linefail_ge1_20_40_8  ;
run; 
ods htm close;

ods html;
proc means data=wide; var p_taz_20_40_7  p_taz_20_40_8  ;
run; 
ods htm close;

ods html;
proc means data=wide; var d_dcost_20_40_8_7  ;
run; 
ods htm close;
ods html;

ods html;
proc means data=wide; var d_ddaly_all_20_40_8_7  ;
run; 
ods htm close;

ods html;
proc means data=wide; var dswitchline_cost_20_40_7  dswitchline_cost_20_40_8  ;
run; 
ods htm close;

* dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost;

ods html;
proc means data=wide; var dcost_20_40_7  dcost_20_40_8  ;
run; 
ods html close;


ods html;
proc means data=wide; var d_p_onart_vl1000_20_40_8_7 ;
 where altered_adh_sec_line_pop_ ge 0.05;
run; 
ods html close;


ods html;
proc means data=wide; var d_ndb_500_20_40_8_7;
run; 
ods html close;

proc freq; tables ce_500_monitoring; 
* where prob_vl_meas_done_ >= 0.85 and pr_switch_line_=0.5;
* where prob_vl_meas_done_ <= 0.10 and pr_switch_line_ le 0.2;
* where zero_3tc_activity_m184_ = 1 or zero_tdf_activity_k65r_ =1;
* where zero_3tc_activity_m184_ = 1 and zero_tdf_activity_k65r_ =1;
* where zero_3tc_activity_m184_ = 1 ;
  where zero_tdf_activity_k65r_ = 1 ;
run;

*/

* --------------------------------------------------------------------------------------------------------------;

 

