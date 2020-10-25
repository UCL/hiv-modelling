
libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\covid_hiv_2\";


   data wide;    
 * set a.wide_covid_hiv_2_9_8_20_5pm;
 * set a.w_covid_hiv_2_9_8_20_5pm_extra; * results sent to john stover - results document 21 aug 2020  ;
 * set a.w_covid_hiv_2_22_8_20_3pm_1;
 * set a.w_covid_hiv_2_22_8_20_3pm_1_2;
 * set a.w_covid_hiv_2_22_8_20_3pm_u;
 * set a.w_covid_hiv_2_16_9_20_10am;
   set a.w_covid_hiv_2_16_9_20_10am_d1 a.w_covid_hiv_2_16_9_20_10am_d2 a.w_covid_hiv_2_16_9_20_10am_d3 a.w_covid_hiv_2_16_9_20_10am_d4;


* to give results for n = 500 sent to john stover use condition below with d1 and d2, not d3 ;
* if run le 848098457;



* --------------------------------------------------------------------------------------------------------------;

* for covid_hiv_2 analysis ;

d_incidence1549_20_25_2 = incidence1549_20_25_2 - incidence1549_20_25_1 ;
d_incidence1549_20_25_3 = incidence1549_20_25_3 - incidence1549_20_25_1 ;
d_incidence1549_20_25_4 = incidence1549_20_25_4 - incidence1549_20_25_1 ;
d_incidence1549_20_25_5 = incidence1549_20_25_5 - incidence1549_20_25_1 ;

d_n_new_inf1549_20_25_2 = n_new_inf1549_20_25_2 - n_new_inf1549_20_25_1 ;
d_n_new_inf1549_20_25_3 = n_new_inf1549_20_25_3 - n_new_inf1549_20_25_1 ;
d_n_new_inf1549_20_25_4 = n_new_inf1549_20_25_4 - n_new_inf1549_20_25_1 ;
d_n_new_inf1549_20_25_5 = n_new_inf1549_20_25_5 - n_new_inf1549_20_25_1 ;

d_death_rate_all_dis_20_25_2 = death_rate_all_discount_20_25_2 - death_rate_all_discount_20_25_1 ;
d_death_rate_all_dis_20_25_3 = death_rate_all_discount_20_25_3 - death_rate_all_discount_20_25_1 ;
d_death_rate_all_dis_20_25_4 = death_rate_all_discount_20_25_4 - death_rate_all_discount_20_25_1 ;
d_death_rate_all_dis_20_25_5 = death_rate_all_discount_20_25_5 - death_rate_all_discount_20_25_1 ;

d_n_death_dis_20_25_2 = n_death_discount_20_25_2 - n_death_discount_20_25_1 ;
d_n_death_dis_20_25_3 = n_death_discount_20_25_3 - n_death_discount_20_25_1 ;
d_n_death_dis_20_25_4 = n_death_discount_20_25_4 - n_death_discount_20_25_1 ;
d_n_death_dis_20_25_5 = n_death_discount_20_25_5 - n_death_discount_20_25_1 ;

d_n_death_20_25_2 = n_death_20_25_2 - n_death_20_25_1 ;
d_n_death_20_25_3 = n_death_20_25_3 - n_death_20_25_1 ;
d_n_death_20_25_4 = n_death_20_25_4 - n_death_20_25_1 ;
d_n_death_20_25_5 = n_death_20_25_5 - n_death_20_25_1 ;


d_incidence1549_20_21_2 = incidence1549_20_21_2 - incidence1549_20_21_1 ;
d_incidence1549_20_21_3 = incidence1549_20_21_3 - incidence1549_20_21_1 ;
d_incidence1549_20_21_4 = incidence1549_20_21_4 - incidence1549_20_21_1 ;
d_incidence1549_20_21_5 = incidence1549_20_21_5 - incidence1549_20_21_1 ;

d_n_new_inf1549_20_21_2 = n_new_inf1549_20_21_2 - n_new_inf1549_20_21_1 ;
d_n_new_inf1549_20_21_3 = n_new_inf1549_20_21_3 - n_new_inf1549_20_21_1 ;
d_n_new_inf1549_20_21_4 = n_new_inf1549_20_21_4 - n_new_inf1549_20_21_1 ;
d_n_new_inf1549_20_21_5 = n_new_inf1549_20_21_5 - n_new_inf1549_20_21_1 ;

d_death_rate_all_dis_20_21_2 = death_rate_all_discount_20_21_2 - death_rate_all_discount_20_21_1 ;
d_death_rate_all_dis_20_21_3 = death_rate_all_discount_20_21_3 - death_rate_all_discount_20_21_1 ;
d_death_rate_all_dis_20_21_4 = death_rate_all_discount_20_21_4 - death_rate_all_discount_20_21_1 ;
d_death_rate_all_dis_20_21_5 = death_rate_all_discount_20_21_5 - death_rate_all_discount_20_21_1 ;

d_n_death_dis_20_21_2 = n_death_discount_20_21_2 - n_death_discount_20_21_1 ;
d_n_death_dis_20_21_3 = n_death_discount_20_21_3 - n_death_discount_20_21_1 ;
d_n_death_dis_20_21_4 = n_death_discount_20_21_4 - n_death_discount_20_21_1 ;
d_n_death_dis_20_21_5 = n_death_discount_20_21_5 - n_death_discount_20_21_1 ;

d_n_death_20_21_2 = n_death_20_21_2 - n_death_20_21_1 ;
d_n_death_20_21_3 = n_death_20_21_3 - n_death_20_21_1 ;
d_n_death_20_21_4 = n_death_20_21_4 - n_death_20_21_1 ;
d_n_death_20_21_5 = n_death_20_21_5 - n_death_20_21_1 ;


d_incidence1549_20_23_2 = incidence1549_20_23_2 - incidence1549_20_23_1 ;
d_incidence1549_20_23_3 = incidence1549_20_23_3 - incidence1549_20_23_1 ;
d_incidence1549_20_23_4 = incidence1549_20_23_4 - incidence1549_20_23_1 ;
d_incidence1549_20_23_5 = incidence1549_20_23_5 - incidence1549_20_23_1 ;

d_n_new_inf1549_20_23_2 = n_new_inf1549_20_23_2 - n_new_inf1549_20_23_1 ;
d_n_new_inf1549_20_23_3 = n_new_inf1549_20_23_3 - n_new_inf1549_20_23_1 ;
d_n_new_inf1549_20_23_4 = n_new_inf1549_20_23_4 - n_new_inf1549_20_23_1 ;
d_n_new_inf1549_20_23_5 = n_new_inf1549_20_23_5 - n_new_inf1549_20_23_1 ;

d_death_rate_all_dis_20_23_2 = death_rate_all_discount_20_23_2 - death_rate_all_discount_20_23_1 ;
d_death_rate_all_dis_20_23_3 = death_rate_all_discount_20_23_3 - death_rate_all_discount_20_23_1 ;
d_death_rate_all_dis_20_23_4 = death_rate_all_discount_20_23_4 - death_rate_all_discount_20_23_1 ;
d_death_rate_all_dis_20_23_5 = death_rate_all_discount_20_23_5 - death_rate_all_discount_20_23_1 ;

d_n_death_dis_20_23_2 = n_death_discount_20_23_2 - n_death_discount_20_23_1 ;
d_n_death_dis_20_23_3 = n_death_discount_20_23_3 - n_death_discount_20_23_1 ;
d_n_death_dis_20_23_4 = n_death_discount_20_23_4 - n_death_discount_20_23_1 ;
d_n_death_dis_20_23_5 = n_death_discount_20_23_5 - n_death_discount_20_23_1 ;

d_n_death_20_23_2 = n_death_20_23_2 - n_death_20_23_1 ;
d_n_death_20_23_3 = n_death_20_23_3 - n_death_20_23_1 ;
d_n_death_20_23_4 = n_death_20_23_4 - n_death_20_23_1 ;
d_n_death_20_23_5 = n_death_20_23_5 - n_death_20_23_1 ;



d_incidence1549_20_40_2 = incidence1549_20_40_2 - incidence1549_20_40_1 ;
d_incidence1549_20_40_3 = incidence1549_20_40_3 - incidence1549_20_40_1 ;
d_incidence1549_20_40_4 = incidence1549_20_40_4 - incidence1549_20_40_1 ;
d_incidence1549_20_40_5 = incidence1549_20_40_5 - incidence1549_20_40_1 ;

d_n_new_inf1549_20_40_2 = n_new_inf1549_20_40_2 - n_new_inf1549_20_40_1 ;
d_n_new_inf1549_20_40_3 = n_new_inf1549_20_40_3 - n_new_inf1549_20_40_1 ;
d_n_new_inf1549_20_40_4 = n_new_inf1549_20_40_4 - n_new_inf1549_20_40_1 ;
d_n_new_inf1549_20_40_5 = n_new_inf1549_20_40_5 - n_new_inf1549_20_40_1 ;

d_death_rate_all_dis_20_40_2 = death_rate_all_discount_20_40_2 - death_rate_all_discount_20_40_1 ;
d_death_rate_all_dis_20_40_3 = death_rate_all_discount_20_40_3 - death_rate_all_discount_20_40_1 ;
d_death_rate_all_dis_20_40_4 = death_rate_all_discount_20_40_4 - death_rate_all_discount_20_40_1 ;
d_death_rate_all_dis_20_40_5 = death_rate_all_discount_20_40_5 - death_rate_all_discount_20_40_1 ;

d_n_death_dis_20_40_2 = n_death_discount_20_40_2 - n_death_discount_20_40_1 ;
d_n_death_dis_20_40_3 = n_death_discount_20_40_3 - n_death_discount_20_40_1 ;
d_n_death_dis_20_40_4 = n_death_discount_20_40_4 - n_death_discount_20_40_1 ;
d_n_death_dis_20_40_5 = n_death_discount_20_40_5 - n_death_discount_20_40_1 ;

d_n_death_20_40_2 = n_death_20_40_2 - n_death_20_40_1 ;
d_n_death_20_40_3 = n_death_20_40_3 - n_death_20_40_1 ;
d_n_death_20_40_4 = n_death_20_40_4 - n_death_20_40_1 ;
d_n_death_20_40_5 = n_death_20_40_5 - n_death_20_40_1 ;


d_incidence1549_20_70_2 = incidence1549_20_70_2 - incidence1549_20_70_1 ;
d_incidence1549_20_70_3 = incidence1549_20_70_3 - incidence1549_20_70_1 ;
d_incidence1549_20_70_4 = incidence1549_20_70_4 - incidence1549_20_70_1 ;
d_incidence1549_20_70_5 = incidence1549_20_70_5 - incidence1549_20_70_1 ;

d_n_new_inf1549_20_70_2 = n_new_inf1549_20_70_2 - n_new_inf1549_20_70_1 ;
d_n_new_inf1549_20_70_3 = n_new_inf1549_20_70_3 - n_new_inf1549_20_70_1 ;
d_n_new_inf1549_20_70_4 = n_new_inf1549_20_70_4 - n_new_inf1549_20_70_1 ;
d_n_new_inf1549_20_70_5 = n_new_inf1549_20_70_5 - n_new_inf1549_20_70_1 ;

d_death_rate_all_dis_20_70_2 = death_rate_all_discount_20_70_2 - death_rate_all_discount_20_70_1 ;
d_death_rate_all_dis_20_70_3 = death_rate_all_discount_20_70_3 - death_rate_all_discount_20_70_1 ;
d_death_rate_all_dis_20_70_4 = death_rate_all_discount_20_70_4 - death_rate_all_discount_20_70_1 ;
d_death_rate_all_dis_20_70_5 = death_rate_all_discount_20_70_5 - death_rate_all_discount_20_70_1 ;

d_n_death_dis_20_70_2 = n_death_discount_20_70_2 - n_death_discount_20_70_1 ;
d_n_death_dis_20_70_3 = n_death_discount_20_70_3 - n_death_discount_20_70_1 ;
d_n_death_dis_20_70_4 = n_death_discount_20_70_4 - n_death_discount_20_70_1 ;
d_n_death_dis_20_70_5 = n_death_discount_20_70_5 - n_death_discount_20_70_1 ;

d_n_death_20_70_2 = n_death_20_70_2 - n_death_20_70_1 ;
d_n_death_20_70_3 = n_death_20_70_3 - n_death_20_70_1 ;
d_n_death_20_70_4 = n_death_20_70_4 - n_death_20_70_1 ;
d_n_death_20_70_5 = n_death_20_70_5 - n_death_20_70_1 ;

d_n_tested_20_21_2 = n_tested_20_21_2 - n_tested_20_21_1 ; 
d_n_tested_20_21_3 = n_tested_20_21_3 - n_tested_20_21_1 ; 
d_n_tested_20_21_4 = n_tested_20_21_4 - n_tested_20_21_1 ; 
d_n_tested_20_21_5 = n_tested_20_21_5 - n_tested_20_21_1 ; 
d_n_tested_21_22_2 = n_tested_21_22_2 - n_tested_21_22_1 ; 
d_n_tested_21_22_3 = n_tested_21_22_3 - n_tested_21_22_1 ; 
d_n_tested_21_22_4 = n_tested_21_22_4 - n_tested_21_22_1 ; 
d_n_tested_21_22_5 = n_tested_21_22_5 - n_tested_21_22_1 ; 

d_n_new_mcirc_20_21_2 = n_new_mcirc_20_21_2 - n_new_mcirc_20_21_1 ; 
d_n_new_mcirc_20_21_3 = n_new_mcirc_20_21_3 - n_new_mcirc_20_21_1 ; 
d_n_new_mcirc_20_21_4 = n_new_mcirc_20_21_4 - n_new_mcirc_20_21_1 ; 
d_n_new_mcirc_20_21_5 = n_new_mcirc_20_21_5 - n_new_mcirc_20_21_1 ; 
d_n_new_mcirc_21_22_2 = n_new_mcirc_21_22_2 - n_new_mcirc_21_22_1 ; 
d_n_new_mcirc_21_22_3 = n_new_mcirc_21_22_3 - n_new_mcirc_21_22_1 ; 
d_n_new_mcirc_21_22_4 = n_new_mcirc_21_22_4 - n_new_mcirc_21_22_1 ; 
d_n_new_mcirc_21_22_5 = n_new_mcirc_21_22_5 - n_new_mcirc_21_22_1 ;

d_n_onart_20_21_2 = n_onart_20_21_2 - n_onart_20_21_1 ; 
d_n_onart_20_21_3 = n_onart_20_21_3 - n_onart_20_21_1 ; 
d_n_onart_20_21_4 = n_onart_20_21_4 - n_onart_20_21_1 ; 
d_n_onart_20_21_5 = n_onart_20_21_5 - n_onart_20_21_1 ; 
d_n_onart_21_22_2 = n_onart_21_22_2 - n_onart_21_22_1 ; 
d_n_onart_21_22_3 = n_onart_21_22_3 - n_onart_21_22_1 ; 
d_n_onart_21_22_4 = n_onart_21_22_4 - n_onart_21_22_1 ; 
d_n_onart_21_22_5 = n_onart_21_22_5 - n_onart_21_22_1 ;

d_n_vl_test_done_20_21_2 = n_vl_test_done_20_21_2 - n_vl_test_done_20_21_1 ; 
d_n_vl_test_done_20_21_3 = n_vl_test_done_20_21_3 - n_vl_test_done_20_21_1 ; 
d_n_vl_test_done_20_21_4 = n_vl_test_done_20_21_4 - n_vl_test_done_20_21_1 ; 
d_n_vl_test_done_20_21_5 = n_vl_test_done_20_21_5 - n_vl_test_done_20_21_1 ; 
d_n_vl_test_done_21_22_2 = n_vl_test_done_21_22_2 - n_vl_test_done_21_22_1 ; 
d_n_vl_test_done_21_22_3 = n_vl_test_done_21_22_3 - n_vl_test_done_21_22_1 ; 
d_n_vl_test_done_21_22_4 = n_vl_test_done_21_22_4 - n_vl_test_done_21_22_1 ; 
d_n_vl_test_done_21_22_5 = n_vl_test_done_21_22_5 - n_vl_test_done_21_22_1 ;

d_n_diag_20_21_2 = n_diag_20_21_2 - n_diag_20_21_1 ; 
d_n_diag_20_21_3 = n_diag_20_21_3 - n_diag_20_21_1 ; 
d_n_diag_20_21_4 = n_diag_20_21_4 - n_diag_20_21_1 ; 
d_n_diag_20_21_5 = n_diag_20_21_5 - n_diag_20_21_1 ; 
d_n_diag_21_22_2 = n_diag_21_22_2 - n_diag_21_22_1 ; 
d_n_diag_21_22_3 = n_diag_21_22_3 - n_diag_21_22_1 ; 
d_n_diag_21_22_4 = n_diag_21_22_4 - n_diag_21_22_1 ; 
d_n_diag_21_22_5 = n_diag_21_22_5 - n_diag_21_22_1 ;

d_n_start_line2_20_21_2 = n_start_line2_20_21_2 - n_start_line2_20_21_1 ; 
d_n_start_line2_20_21_3 = n_start_line2_20_21_3 - n_start_line2_20_21_1 ; 
d_n_start_line2_20_21_4 = n_start_line2_20_21_4 - n_start_line2_20_21_1 ; 
d_n_start_line2_20_21_5 = n_start_line2_20_21_5 - n_start_line2_20_21_1 ; 
d_n_start_line2_21_22_2 = n_start_line2_21_22_2 - n_start_line2_21_22_1 ; 
d_n_start_line2_21_22_3 = n_start_line2_21_22_3 - n_start_line2_21_22_1 ; 
d_n_start_line2_21_22_4 = n_start_line2_21_22_4 - n_start_line2_21_22_1 ; 
d_n_start_line2_21_22_5 = n_start_line2_21_22_5 - n_start_line2_21_22_1 ;

d_n_death_dis_20_21_5_4 = n_death_discount_20_21_4 - n_death_discount_20_21_5 ;
d_n_death_dis_20_23_5_4 = n_death_discount_20_23_4 - n_death_discount_20_23_5 ;
d_n_death_dis_20_25_5_4 = n_death_discount_20_25_4 - n_death_discount_20_25_5 ;
d_n_death_dis_20_40_5_4 = n_death_discount_20_40_4 - n_death_discount_20_40_5 ;
d_n_death_dis_20_70_5_4 = n_death_discount_20_70_4 - n_death_discount_20_70_5 ;


* for effect of circ compare options 4 and 5 ;

d_n_new_mcirc_20_21_5_4 = n_new_mcirc_20_21_5 - n_new_mcirc_20_21_4 ;
d_n_death_dis_20_70_5_4 = n_death_discount_20_70_4 - n_death_discount_20_70_5 ;

if d_n_new_mcirc_20_21_5_4 > 10000 then 
deaths_averted_per_10000_circ = (d_n_death_dis_20_70_5_4 * 50 / d_n_new_mcirc_20_21_5_4 ) * 10000 ;
else deaths_averted_per_10000_circ = .;
* note: only calculate for setting scenarios with at least 10000 circumcisions a year ;


* for effect of testing compare options 3 vs 1 ;

d_n_tested_20_21_3_1 = n_tested_20_21_3 - n_tested_20_21_1 ;
d_n_death_dis_20_70_3_1 = n_death_discount_20_70_1 - n_death_discount_20_70_3 ;

if d_n_tested_20_21_3_1 > 0 then 
deaths_averted_per_10000_test = (d_n_death_dis_20_70_3_1 * 50 / d_n_tested_20_21_3_1 ) * 10000 ;
else deaths_averted_per_10000_test = 0;


* for effect of vl testing compare options 2 vs 1 ;

d_n_vl_test_done_20_21_2_1 = n_vl_test_done_20_21_2 - n_vl_test_done_20_21_1 ;
d_n_death_dis_20_70_2_1 = n_death_discount_20_70_1 - n_death_discount_20_70_2 ;
d_n_death_dis_20_25_2_1 = n_death_discount_20_25_1 - n_death_discount_20_25_2 ;

if d_n_vl_test_done_20_21_2_1 > 0  and prob_vl_meas_done ne 0 then 
deaths_averted_per_10000_vl_test = (d_n_death_dis_20_70_2_1 * 50 / d_n_vl_test_done_20_21_2_1 ) * 10000 ;
else deaths_averted_per_10000_vl_test = 0;

if d_n_vl_test_done_20_21_2_1 > 0 and prob_vl_meas_done ne 0 then  
deaths_av_per_10000_vl_test_5y = (d_n_death_dis_20_25_2_1 * 5 / d_n_vl_test_done_20_21_2_1 ) * 10000 ;
else deaths_av_per_10000_vl_test_5y = 0;
* note need to restrict this to setting scenarios with prob_vl_meas_done ne 0;

* --------------------------------------------------------------------------------------------------------------;




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

proc contents;


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
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20 
n_tested_19   n_onart_19 n_vl_test_done_19   n_diag_19  n_start_line2_19 n_new_mcirc_19
;
run;

ods html;
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
ods html close;

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

* covid_hiv_2 analysis ;


ods html;
proc means n mean lclm uclm median p5 p95 data=wide; var 

n_diag_20_21_1 n_diag_20_21_2 n_diag_20_21_3 n_diag_20_21_4 n_diag_20_21_5
n_tested_20_21_1 n_tested_20_21_2 n_tested_20_21_3 n_tested_20_21_4 n_tested_20_21_5
n_new_mcirc_20_21_1 n_new_mcirc_20_21_2 n_new_mcirc_20_21_3 n_new_mcirc_20_21_4 n_new_mcirc_20_21_5
dvl_cost_20_21_1 dvl_cost_20_21_2 dvl_cost_20_21_3 dvl_cost_20_21_4 dvl_cost_20_21_5
n_onart_20_21_1 n_onart_20_21_2 n_onart_20_21_3 n_onart_20_21_4 n_onart_20_21_5
n_vl_test_done_20_21_1 n_vl_test_done_20_21_2 n_vl_test_done_20_21_3 n_vl_test_done_20_21_4 n_vl_test_done_20_21_5
n_start_line2_20_21_1 n_start_line2_20_21_2 n_start_line2_20_21_3 n_start_line2_20_21_4 n_start_line2_20_21_5

n_diag_21_22_1 n_diag_21_22_2 n_diag_21_22_3 n_diag_21_22_4 n_diag_21_22_5
n_tested_21_22_1 n_tested_21_22_2 n_tested_21_22_3 n_tested_21_22_4 n_tested_21_22_5
n_new_mcirc_21_22_1 n_new_mcirc_21_22_2 n_new_mcirc_21_22_3 n_new_mcirc_21_22_4 n_new_mcirc_21_22_5
dvl_cost_21_22_1 dvl_cost_21_22_2 dvl_cost_21_22_3 dvl_cost_21_22_4 dvl_cost_21_22_5
n_onart_21_22_1 n_onart_21_22_2 n_onart_21_22_3 n_onart_21_22_4 n_onart_21_22_5
n_vl_test_done_21_22_1 n_vl_test_done_21_22_2 n_vl_test_done_21_22_3 n_vl_test_done_21_22_4 n_vl_test_done_21_22_5
n_start_line2_21_22_1 n_start_line2_21_22_2 n_start_line2_21_22_3 n_start_line2_21_22_4 n_start_line2_21_22_5

n_tested_20_25_1 n_tested_20_25_2 n_tested_20_25_3 n_tested_20_25_4 n_tested_20_25_5
n_new_mcirc_20_25_1 n_new_mcirc_20_25_2 n_new_mcirc_20_25_3 n_new_mcirc_20_25_4 n_new_mcirc_20_25_5
dvl_cost_20_25_1 dvl_cost_20_25_2 dvl_cost_20_25_3 dvl_cost_20_25_4 dvl_cost_20_25_5

d_n_diag_20_21_2 d_n_diag_20_21_3 d_n_diag_20_21_4 d_n_diag_20_21_5
d_n_diag_21_22_2 d_n_diag_21_22_3 d_n_diag_21_22_4 d_n_diag_21_22_5

d_n_start_line2_20_21_2 d_n_start_line2_20_21_3 d_n_start_line2_20_21_4 d_n_start_line2_20_21_5
d_n_start_line2_21_22_2 d_n_start_line2_21_22_3 d_n_start_line2_21_22_4 d_n_start_line2_21_22_5

d_n_vl_test_done_20_21_2 d_n_vl_test_done_20_21_3 d_n_vl_test_done_20_21_4 d_n_vl_test_done_20_21_5
d_n_vl_test_done_21_22_2 d_n_vl_test_done_21_22_3 d_n_vl_test_done_21_22_4 d_n_vl_test_done_21_22_5

d_n_tested_20_21_2 d_n_tested_20_21_3 d_n_tested_20_21_4 d_n_tested_20_21_5
d_n_tested_21_22_2 d_n_tested_21_22_3 d_n_tested_21_22_4 d_n_tested_21_22_5

d_n_new_mcirc_20_21_2 d_n_new_mcirc_20_21_3 d_n_new_mcirc_20_21_4 d_n_new_mcirc_20_21_5
n_new_mcirc_21_22_1 n_new_mcirc_21_22_2 n_new_mcirc_21_22_3 n_new_mcirc_21_22_4 n_new_mcirc_21_22_5
d_n_new_mcirc_21_22_2 d_n_new_mcirc_21_22_3 d_n_new_mcirc_21_22_4 d_n_new_mcirc_21_22_5

d_n_onart_20_21_2 d_n_onart_20_21_3 d_n_onart_20_21_4 d_n_onart_20_21_5
d_n_onart_21_22_2 d_n_onart_21_22_3 d_n_onart_21_22_4 d_n_onart_21_22_5

;
run;
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; 
var incidence1549_20_25_1  incidence1549_20_25_2 incidence1549_20_25_3 incidence1549_20_25_4  incidence1549_20_25_5
d_incidence1549_20_25_2 d_incidence1549_20_25_3 d_incidence1549_20_25_4 d_incidence1549_20_25_5
n_new_inf1549_20_25_1  n_new_inf1549_20_25_2 n_new_inf1549_20_25_3 n_new_inf1549_20_25_4  n_new_inf1549_20_25_5
d_n_new_inf1549_20_25_2 d_n_new_inf1549_20_25_3 d_n_new_inf1549_20_25_4 d_n_new_inf1549_20_25_5
death_rate_all_discount_20_25_1 death_rate_all_discount_20_25_2  death_rate_all_discount_20_25_3  death_rate_all_discount_20_25_4 
death_rate_all_discount_20_25_5  
d_death_rate_all_dis_20_25_2 d_death_rate_all_dis_20_25_3 d_death_rate_all_dis_20_25_4 d_death_rate_all_dis_20_25_5 
n_death_discount_20_25_1 n_death_discount_20_25_2  n_death_discount_20_25_3  n_death_discount_20_25_4 n_death_discount_20_25_5  
d_n_death_dis_20_25_2 d_n_death_dis_20_25_3 d_n_death_dis_20_25_4 d_n_death_dis_20_25_5 
d_n_death_20_25_2 d_n_death_20_25_3 d_n_death_20_25_4 d_n_death_20_25_5 
; 
run;
ods html close;


ods html;
proc means  n mean lclm uclm p5 p95 data=wide ; 
var  d_n_new_inf1549_20_70_4 ; 
run;
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; 
var d_n_death_dis_20_70_4 ; run;
ods html close;


ods html;
proc means n mean lclm uclm p5 p95 data=wide; 
var incidence1549_20_21_1  incidence1549_20_21_2 incidence1549_20_21_3 incidence1549_20_21_4  incidence1549_20_21_5
d_incidence1549_20_21_2 d_incidence1549_20_21_3 d_incidence1549_20_21_4 d_incidence1549_20_21_5
n_new_inf1549_20_21_1  n_new_inf1549_20_21_2 n_new_inf1549_20_21_3 n_new_inf1549_20_21_4  n_new_inf1549_20_21_5
d_n_new_inf1549_20_21_2 d_n_new_inf1549_20_21_3 d_n_new_inf1549_20_21_4 d_n_new_inf1549_20_21_5
death_rate_all_discount_20_21_1 death_rate_all_discount_20_21_2  death_rate_all_discount_20_21_3  death_rate_all_discount_20_21_4 
death_rate_all_discount_20_21_5  
d_death_rate_all_dis_20_21_2 d_death_rate_all_dis_20_21_3 d_death_rate_all_dis_20_21_4 d_death_rate_all_dis_20_21_5 
n_death_discount_20_21_1 n_death_discount_20_21_2  n_death_discount_20_21_3  n_death_discount_20_21_4 n_death_discount_20_21_5  
d_n_death_dis_20_21_2 d_n_death_dis_20_21_3 d_n_death_dis_20_21_4 d_n_death_dis_20_21_5 
d_n_death_20_21_2 d_n_death_20_21_3 d_n_death_20_21_4 d_n_death_20_21_5 
; 
run;
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; 
var incidence1549_20_23_1  incidence1549_20_23_2 incidence1549_20_23_3 incidence1549_20_23_4  incidence1549_20_23_5
d_incidence1549_20_23_2 d_incidence1549_20_23_3 d_incidence1549_20_23_4 d_incidence1549_20_23_5
n_new_inf1549_20_23_1  n_new_inf1549_20_23_2 n_new_inf1549_20_23_3 n_new_inf1549_20_23_4  n_new_inf1549_20_23_5
d_n_new_inf1549_20_23_2 d_n_new_inf1549_20_23_3 d_n_new_inf1549_20_23_4 d_n_new_inf1549_20_23_5
death_rate_all_discount_20_23_1 death_rate_all_discount_20_23_2  death_rate_all_discount_20_23_3  death_rate_all_discount_20_23_4 
death_rate_all_discount_20_23_5  
d_death_rate_all_dis_20_23_2 d_death_rate_all_dis_20_23_3 d_death_rate_all_dis_20_23_4 d_death_rate_all_dis_20_23_5 
n_death_discount_20_23_1 n_death_discount_20_23_2  n_death_discount_20_23_3  n_death_discount_20_23_4 n_death_discount_20_23_5  
d_n_death_dis_20_23_2 d_n_death_dis_20_23_3 d_n_death_dis_20_23_4 d_n_death_dis_20_23_5 
d_n_death_20_23_2 d_n_death_20_23_3 d_n_death_20_23_4 d_n_death_20_23_5 
n_mcirc1549__20_23_2 n_mcirc1549__20_23_3 n_mcirc1549__20_23_4 n_mcirc1549__20_23_5 
; 
run;
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; 
var incidence1549_20_40_1  incidence1549_20_40_2 incidence1549_20_40_3 incidence1549_20_40_4  incidence1549_20_40_5
d_incidence1549_20_40_2 d_incidence1549_20_40_3 d_incidence1549_20_40_4 d_incidence1549_20_40_5
n_new_inf1549_20_40_1  n_new_inf1549_20_40_2 n_new_inf1549_20_40_3 n_new_inf1549_20_40_4  n_new_inf1549_20_40_5
d_n_new_inf1549_20_40_2 d_n_new_inf1549_20_40_3 d_n_new_inf1549_20_40_4 d_n_new_inf1549_20_40_5
death_rate_all_discount_20_40_1 death_rate_all_discount_20_40_2  death_rate_all_discount_20_40_3  death_rate_all_discount_20_40_4 
death_rate_all_discount_20_40_5  
d_death_rate_all_dis_20_40_2 d_death_rate_all_dis_20_40_3 d_death_rate_all_dis_20_40_4 d_death_rate_all_dis_20_40_5 
n_death_discount_20_40_1 n_death_discount_20_40_2  n_death_discount_20_40_3  n_death_discount_20_40_4 n_death_discount_20_40_5  
d_n_death_dis_20_40_2 d_n_death_dis_20_40_3 d_n_death_dis_20_40_4 d_n_death_dis_20_40_5 
d_n_death_20_40_2 d_n_death_20_40_3 d_n_death_20_40_4 d_n_death_20_40_5 
; 
run;
ods html close;



ods html;
proc means n mean lclm uclm p5 p95 data=wide; 
var incidence1549_20_70_1  incidence1549_20_70_2 incidence1549_20_70_3 incidence1549_20_70_4  incidence1549_20_70_5
d_incidence1549_20_70_2 d_incidence1549_20_70_3 d_incidence1549_20_70_4 d_incidence1549_20_70_5
n_new_inf1549_20_70_1  n_new_inf1549_20_70_2 n_new_inf1549_20_70_3 n_new_inf1549_20_70_4  n_new_inf1549_20_70_5
d_n_new_inf1549_20_70_2 d_n_new_inf1549_20_70_3 d_n_new_inf1549_20_70_4 d_n_new_inf1549_20_70_5
death_rate_all_discount_20_70_1 death_rate_all_discount_20_70_2  death_rate_all_discount_20_70_3  death_rate_all_discount_20_70_4 
death_rate_all_discount_20_70_5  
d_death_rate_all_dis_20_70_2 d_death_rate_all_dis_20_70_3 d_death_rate_all_dis_20_70_4 d_death_rate_all_dis_20_70_5 
n_death_discount_20_70_1 n_death_discount_20_70_2  n_death_discount_20_70_3  n_death_discount_20_70_4 n_death_discount_20_70_5  
d_n_death_dis_20_70_2 d_n_death_dis_20_70_3 d_n_death_dis_20_70_4 d_n_death_dis_20_70_5 
d_n_death_20_70_2 d_n_death_20_70_3 d_n_death_20_70_4 d_n_death_20_70_5 
n_mcirc1549__20_70_2 n_mcirc1549__20_70_3 n_mcirc1549__20_70_4 n_mcirc1549__20_70_5
; 
run;
ods html close;


*
n_start_line2_per_year 
n_vl_test_done 
n_death_hivrel 
;


ods html;
proc means  n mean lclm uclm p5 p95 data=wide ; 
var 
d_n_new_mcirc_21_22_2 d_n_new_mcirc_21_22_3 d_n_new_mcirc_21_22_4 d_n_new_mcirc_21_22_5 
; 
run;
ods html close;

* n_tested_20_21_1 n_tested_20_21_2 n_tested_20_21_3 n_tested_20_21_4 n_tested_20_21_5 
* n_tested_21_22_1 n_tested_21_22_2 n_tested_21_22_3 n_tested_21_22_4 n_tested_21_22_5 
* d_n_tested_20_21_2 d_n_tested_20_21_3 d_n_tested_20_21_4 d_n_tested_20_21_5 
* d_n_tested_21_22_2 d_n_tested_21_22_3 d_n_tested_21_22_4 d_n_tested_21_22_5
* d_n_death_dis_20_21_5_4 d_n_death_dis_20_25_5_4 d_n_death_dis_20_40_5_4 d_n_death_dis_20_70_5_4

* n_tested  n_new_mcirc  n_onart n_vl_test_done   n_diag  n_start_line2 ;

proc means n mean lclm uclm p5 p95 data=wide ; 
var d_n_death_dis_20_21_5_4 d_n_death_dis_20_23_5_4 d_n_death_dis_20_25_5_4 d_n_death_dis_20_40_5_4 d_n_death_dis_20_70_5_4;
run;


proc print; var deaths_averted_per_10000_circ  d_n_death_dis_20_70_5_4 d_n_new_mcirc_20_21_5_4  ; run;

ods html;
proc means n median mean lclm uclm p5 p95 data=wide ; 
var deaths_averted_per_10000_circ deaths_averted_per_10000_test n_death_discount_20_70_1 n_death_discount_20_70_3
n_death_discount_20_70_4 n_death_discount_20_70_5 d_n_death_dis_20_70_3_1  d_n_death_dis_20_70_5_4

d_n_death_dis_20_21_5_4 d_n_death_dis_20_23_5_4 d_n_death_dis_20_25_5_4 d_n_death_dis_20_40_5_4

d_n_new_mcirc_20_21_5_4  d_n_tested_20_21_3_1
d_n_death_dis_20_70_5_4  d_n_new_mcirc_20_21_5_4
deaths_averted_per_10000_vl_test d_n_death_dis_20_70_2_1  d_n_vl_test_done_20_21_2_1
deaths_av_per_10000_vl_test_5y;
run;
ods html close;


proc corr spearman data=wide ; var prevalence1549_20 deaths_averted_per_10000_test ; run;

proc glm; model deaths_averted_per_10000_test =   p_diag_20  ; run;

proc univariate; var p_diag_20 ; run;

proc means n mean lclm uclm p5 p95 data=wide ; 
var  deaths_averted_per_10000_test ;
  where p_diag_20 < 82 ;
* where 82 <= p_diag_20 < 92; 
* where 92 <= p_diag_20 ; 
run;
