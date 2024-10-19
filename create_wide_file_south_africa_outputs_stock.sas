* options user="/folders/myfolders/";

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\mihpsa_sa\";

libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\mihpsa_sa\south_africa_options_a_out\";

/*

data b.south_africa_options_a ; set b.out: ;

proc sort data= b.south_africa_options_a; 
by run cald option;run;

*/


* calculate the scale factor for the run, based on 1000000 / s_alive in 2022 ;
data sf;

set   b.south_africa_options_a ;


if cald=2022.25;
s_alive = s_alive_m + s_alive_w ;


sf_2022 = (54000000 * 0.62) / s_alive;  * 62% of kenya population in 2022 >= age 15 https://www.statista.com/statistics/451141/age-structure-in-kenya/;
sf = sf_2022;

keep run sf sf_2022;
proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;


data y_stock;
merge   b.south_africa_options_a sf;
by run ;
 




* preparatory code ;

* ================================================================================= ;

*zero_3tc_activity_m184   = s_zero_3tc_activity_m184 / s_n ;
*zero_tdf_activity_k65r  =  s_zero_tdf_activity_k65r / s_n ;

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

* discount rate is 3%; 
* note discounting is from 2022 - no adjustment needed;
* ts1m - this code needs to change for ts1m;

%let year_start_disc=2022;
discount_3py = 1/(1.03**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;


* ================================================================================= ;





* dalys and life years;

* ================================================================================= ;

ly = s_ly * sf;
dly = s_dly * sf;

s_ddaly = s_dead_ddaly + s_live_ddaly;

s_ddaly_gbd = s_dyll_GBD + s_live_ddaly;


dead_ddaly_ntd = s_dead_ddaly_ntd * sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * sf * 4;

ddaly_gbd = s_ddaly_gbd * sf * 4;

yll_gbd = s_dyll_GBD * sf * 4;

yll_gbd_w = s_dyll_gbd_w * sf * 4 ;
yll_gbd_m = s_dyll_gbd_m * sf * 4 ;

* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 


dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * sf * 4; * odabe ;

ddaly_mtct = s_ddaly_mtct * sf * 4;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf * 4; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;



* ================================================================================= ;

/*
proc print; var cald  run option ddaly_ntd_mtct_odab_napd  ddaly  dead_ddaly_ntd  ddaly_mtct  dead_ddaly_odabe   
ddaly_non_aids_pre_death;
where cald = 2022;
run;
*/



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

dzdv_cost = s_cost_zdv * &discount * sf * 4 / 1000;
dten_cost = s_cost_ten * &discount * sf * 4 / 1000;
d3tc_cost = s_cost_3tc * &discount * sf * 4 / 1000; 
dnev_cost = s_cost_nev * &discount * sf * 4 / 1000;
dlpr_cost = s_cost_lpr * &discount * sf * 4 / 1000;
ddar_cost = s_cost_dar * &discount * sf * 4 / 1000;
dtaz_cost = s_cost_taz * &discount * sf * 4 / 1000;
defa_cost = s_cost_efa * &discount * sf * 4 / 1000;
ddol_cost = s_cost_dol * &discount * sf * 4 / 1000;


if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * sf * 4 / 1000;
dart_1_cost = s_dart_1_cost * sf * 4 / 1000;
dart_2_cost = s_dart_2_cost * sf * 4 / 1000;
dart_3_cost = s_dart_3_cost * sf * 4 / 1000;
dart_cost = s_dart_cost * sf * 4 / 1000;
dvl_cost = s_dvl_cost * sf * 4 / 1000;
dcd4_cost = s_dcd4_cost * sf * 4 / 1000;
dadc_cost = s_dadc_cost * sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost * sf * 4 / 1000;
dtb_cost = s_dtb_cost * sf * 4 / 1000;
dtest_cost = s_dtest_cost * sf * 4 / 1000;
dcot_cost = s_dcot_cost * sf * 4 / 1000;
dres_cost = s_dres_cost * sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * sf * 4 / 1000;  
dcost_prep = s_dcost_prep * sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf * 4 / 1000;
dcost_circ = s_dcost_circ * sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * sf * 4 / 1000; * s_cost_child_hiv is discounted cost;
 

dclin_cost = dadc_cost+dnon_tb_who3_cost+dcot_cost+dtb_cost;

* sens analysis;

* dtaz_cost = dtaz_cost * (100 / 180);
* dtaz_cost = dtaz_cost * (50 / 180);
* dzdv_cost = dzdv_cost * (25 / 45);


dart_cost_x = dart_1_cost + dart_2_cost + dart_3_cost; 
dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

* dcost = dart_cost_y + dclin_cost + dcd4_cost + dvl_cost + dvis_cost + dtest_cost + d_t_adh_int_cost + dswitchline_cost
		+dcost_circ + dcost_condom_dn  + dcost_child_hiv  + dcost_non_aids_pre_death ;


dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost+dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test+dcost_cascade_interventions + dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;

s_cost_art_x = s_cost_zdv + s_cost_ten + s_cost_3tc + s_cost_nev + s_cost_lpr + s_cost_dar + s_cost_taz + s_cost_efa + s_cost_dol ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 

if &discount gt 0 then cost_clin_care = dcost_clin_care / &discount;

if &discount gt 0 then cost = dcost / &discount;

* ================================================================================= ;


* derived variables relating to population, not only those with hiv ;

if s_ai_naive_no_pmtct_c_nnm_ = . then s_ai_naive_no_pmtct_c_nnm_ = 0; 
if s_ai_naive_no_pmtct_c_pim_ = . then s_ai_naive_no_pmtct_c_pim_ = 0;
if s_ai_naive_no_pmtct_c_inm_ = . then s_ai_naive_no_pmtct_c_inm_ = 0;
if s_ai_naive_no_pmtct_c_rt184m_ = . then s_ai_naive_no_pmtct_c_rt184m_ = 0;
if s_ai_naive_no_pmtct_c_rt65m_ = . then s_ai_naive_no_pmtct_c_rt65m_ = 0;
if s_ai_naive_no_pmtct_c_rttams_ = . then s_ai_naive_no_pmtct_c_rttams_ = 0;

s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_mcirc_3039m = s_mcirc_3034m + s_mcirc_3539m;
s_mcirc_4049m = s_mcirc_4044m + s_mcirc_4549m;

s_vmmc1549m = s_vmmc1519m + s_vmmc2024m + s_vmmc2529m + s_vmmc3034m + s_vmmc3539m + s_vmmc4044m + s_vmmc4549m ;
s_vmmc3039m = s_vmmc3034m + s_vmmc3539m;
s_vmmc4049m = s_vmmc4044m + s_vmmc4549m;

s_hiv1524m = s_hiv1519m + s_hiv2024m ;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;

s_hiv65plm = s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hiv65plw = s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;

s_ageg65plm = s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg8084m + s_ageg85plm ;
s_ageg65plw = s_ageg6569w + s_ageg7074w + s_ageg7579w + s_ageg8084w + s_ageg85plw ;

s_onart_m50pl = s_onart_m5054_ + s_onart_m5559_ + s_onart_m6064_ + s_onart_m6569_	+ s_onart_m7074_ + s_onart_m7579_ + s_onart_m8084_ + s_onart_m85pl_	;
s_onart_w50pl = s_onart_w5054_ + s_onart_w5559_ + s_onart_w6064_ + s_onart_w6569_	+ s_onart_w7074_ + s_onart_w7579_ + s_onart_w8084_ + s_onart_w85pl_	;

* p_age1549_hiv ; 				p_age1549_hiv = (s_hiv1549m + s_hiv1549w) / s_hivge15 ;
* p_age1549_hivneg ;			p_age1549_hivneg = ((s_alive1549_w + s_alive1549_m) - (s_hiv1549m + s_hiv1549w)) / ((s_alive_m + s_alive_w) - s_hivge15);

* s_alive;						s_alive = s_alive_m + s_alive_w ;

* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;

* p_births_hiv_vlg1000;			p_births_hiv_vlg1000 = s_vl_when_giving_birth_g1000 / s_give_birth_with_hiv ; 

* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* av_newp_ge1;					av_newp_ge1 = s_newp / s_newp_ge1 ;

* av number of newp amongst people with newp ge 1, exlcuding sw;
* av_newp_ge1_non_sw;			av_newp_ge1_non_sw = (s_newp - s_newp_sw) / (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5));


* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_w1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge1_agyw;				p_newp_ge1_agyw = ( s_w1524_newp_ge1 ) 
									/ ( s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;


* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf;
* n_sw_1549;					n_sw_1549 = s_sw_1549 * sf;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;

* n_tested_m;					n_tested_m = s_tested_m * sf    ;
* n_tested_w;					n_tested_w = s_tested_f * sf    ;
* n_tested_sw;					n_tested_sw = s_tested_sw * sf    ;
* n_tested;						n_tested = s_tested * sf    ;

* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* n_self_tested;				n_self_tested = s_self_tested * sf ;
* n_self_tested_m;				n_self_tested_m = s_self_tested_m * sf ;
* n_self_tested_w;				n_self_tested_w = s_self_tested_w * sf ;
* n_tested_due_to_self_test;	n_tested_due_to_self_test =  s_tested_due_to_self_test * sf ;
* n_diagnosed_self_test;		n_diagnosed_self_test = s_diagnosed_self_test * sf;

* n_self_tests;					n_self_tests = s_self_tested * sf ;	*JASJUN2024;
* n_diagnosed;					n_diagnosed = s_diag_this_period * sf * 4;
* n_diag_m;						n_diag_m = s_diag_this_period_m * sf * 4;*VCMay2023;
* n_diag_w;						n_diag_w = s_diag_this_period_f * sf * 4;*VCMay2023;
* n_diag_anc;					n_diag_anc = s_diag_this_period_f_anc * sf * 4;
* n_diag_labdel;				n_diag_labdel = s_diag_this_period_labdel * sf * 4;*VCMar2023;
* n_diag_pd;					n_diag_pd = s_diag_this_period_f_pd * sf * 4;*VCMar2023;
* n_diag_anclabpd;				n_diag_anclabpd = s_diag_thisper_anclabpd * sf * 4;*VCMay2023;
* n_diag_progsw; 				n_diag_progsw = s_diag_thisper_progsw * sf * 4;*VCMay2023;
* n_diag_sw; 					n_diag_sw = s_diag_thisper_sw * sf * 4;*VCMay2023;

* n_diag_self_test;				n_diag_self_test = s_diagnosed_self_test * sf * 4;	*JASJUN2024;

* n_hivpos_tests;				n_hivpos_tests = n_diagnosed + n_tested_anc_prevdiag;				* Number of HIV positive tests JASJun24;
* n_hivneg_tests;				n_hivneg_tests = n_tested - n_hivpos_tests;							* Number of HIV negative tests JASJun24;
* n_hivpos_tests_sympt;			n_hivpos_tests_sympt = (s_diag_this_period_m_sympt + s_diag_this_period_f_sympt) * sf * 4;		* Number of HIV positive tests in symptomatic adults JASJun24;
* n_hivneg_tests_sympt;			n_hivneg_tests_sympt = (n_tested_m_sympt + n_tested_w_sympt) * sf * 4 - n_hivpos_tests_sympt;	* Number of HIV negative tests in symptomatic adults JASJun24;
* n_hivneg_tests_anc;			n_hivneg_tests_anc = n_tested_anc - n_diag_anc;						* Number of HIV negative ANC tests JASJun2024;
* n_hivneg_tests_anclabpd;		n_hivneg_tests_anclabpd = n_test_anclabpd - n_diag_anclabpd;		* Number of HIV negative ANC/lab/PD tests JASJun2024;


* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3034m;				p_mcirc_3034m = s_mcirc_3034m / s_ageg3034m ;
* p_mcirc_3539m;				p_mcirc_3539m = s_mcirc_3539m / s_ageg3539m ;
* p_mcirc_4044m;				p_mcirc_4044m = s_mcirc_4044m / s_ageg4044m ;
* p_mcirc_4549m;				p_mcirc_4549m = s_mcirc_4549m / s_ageg4549m ;
* p_mcirc_5064m;				p_mcirc_5064m = s_mcirc_5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;

* p_vmmc;						p_vmmc = s_vmmc / s_alive_m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_5064m;					p_vmmc_5064m = s_vmmc5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive1564_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then  
								prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp = s_sw_newp/s_sw_1564;


* prep;

* proportion of those on prep who have ge 1 newp in the period ;
* p_prep_newp ;					if s_prep_any > 0 then p_prep_newp = (s_newp_this_per_hivneg_m_prep + s_newp_this_per_hivneg_w_prep) / s_prep_any ; 
* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;

* n_onprep_w;					n_onprep_w = max(s_onprep_w, 0) * sf;
* n_onprep_m;					n_onprep_m = max(s_onprep_m, 0) * sf;

* n_onprep;						n_onprep = n_onprep_w + n_onprep_m ;

* n_newp_ge1_w; 				n_newp_ge1_w = (s_w1524_newp_ge1 + s_w2534_newp_ge1 + s_w3544_newp_ge1 + s_w4554_newp_ge1 + s_w5564_newp_ge1) * sf; 

* p_prep_elig_past_year;		p_prep_elig_past_year = s_prep_elig_past_year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* p_prep_elig_past_5year;		p_prep_elig_past_5year = s_prep_elig_past_5year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* mean_newp_ppers_prep;			if s_prep_any > 0 then mean_newp_ppers_prep = s_prep_newp / s_prep_any ;

* prop_onprep_newpge1;			if s_prep_any > 0 then prop_onprep_newpge1 = (s_prep_newpg1 + s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge2;			if s_prep_any > 0 then prop_onprep_newpge2 = (s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge3;			if s_prep_any > 0 then prop_onprep_newpge3 = (s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;


* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;
* prop_elig_on_prep;			if s_prep_any_elig > 0 then prop_elig_on_prep = s_prep_any / s_prep_any_elig ; 

* n_prep_elig_w;					n_prep_elig_w = s_elig_prep_any_w_1564 * sf;
* n_prep_elig_m;					n_prep_elig_m = s_elig_prep_any_m_1564 * sf;

* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;
* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;
* prop_1564_hivneg_onprep;		prop_1564_hivneg_onprep =   max((s_prep_any-s_hiv1_prep), 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;

* p_elig_prep;   				p_elig_prep = s_prep_any_elig / (s_alive1564 - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* py_prep_oral_1524w;			py_prep_oral_1524w =	0.25 * n_prep_oral_1524w;
* py_prep_oral_sw;				py_prep_oral_sw = 		0.25 * n_prep_oral_sw;
* py_prep_inj_1524w;			py_prep_inj_1524w =		0.25 * n_prep_inj_1524w;
* py_prep_inj_sw;				py_prep_inj_sw = 		0.25 * n_prep_inj_sw;

* n_init_prep_oral_first_w;		n_init_prep_oral_first_w = 	s_init_prep_oral_first_w * sf;    *JASJun2024;
* n_init_prep_oral_first_m;		n_init_prep_oral_first_m = 	s_init_prep_oral_first_m * sf;    *JASJun2024;
* n_init_prep_oral_curr_w;		n_init_prep_oral_curr_w =	s_init_prep_oral_curr_w * sf;    *JASJun2024;
* n_init_prep_oral_curr_m;		n_init_prep_oral_curr_m =	s_init_prep_oral_curr_m * sf;    *JASJun2024;
* n_init_prep_inj_first_w;		n_init_prep_inj_first_w =	s_init_prep_inj_first_w * sf;    *JASJun2024;
* n_init_prep_inj_first_m;		n_init_prep_inj_first_m =	s_init_prep_inj_first_m * sf;    *JASJun2024;
* n_init_prep_inj_curr_w;		n_init_prep_inj_curr_w =	s_init_prep_inj_curr_w * sf;    *JASJun2024;
* n_init_prep_inj_curr_m;		n_init_prep_inj_curr_m =	s_init_prep_inj_curr_m * sf;    *JASJun2024;

* n_prep;						n_prep = s_prep_any * sf;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf;
* p_hiv1_prep;					if s_prep_any gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep_any ;

* n_prep_ever;					n_prep_ever = s_prep_ever * sf;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf;

* av_prep_eff_non_res_v;  		if s_prep_any > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep_any;								  
																			 
* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep_any,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				if s_prep_any gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep_any ;


*Currently on PrEP: Number of clients actively taking PrEP during the last month of the date range displayed;
*Note we can't do the last month so we will do the last 3 months;
* n_prep_w_1524  ;				n_prep_w_1524   = s_prep_w_1524 * sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf;

*Number initiated for the first time on PrEP;
* n_init_prep_oral_1524w;  		n_init_prep_oral_1524w = s_init_prep_oral_1524w * 4 * sf; 
* n_init_prep_oral_sw; 			n_init_prep_oral_sw    = s_init_prep_oral_sw * 4 * sf; 
* n_init_prep_oral_sdc; 		n_init_prep_oral_sdc   = s_init_prep_oral_sdc * 4 * sf; 
* n_init_prep_oral_plw; 		n_init_prep_oral_plw   = s_init_prep_oral_plw * 4 * sf; *Feb2024;
* n_init_prep_inj_1524w; 		n_init_prep_inj_1524w  = s_init_prep_inj_1524w * 4 * sf;  
* n_init_prep_inj_sw; 			n_init_prep_inj_sw     = s_init_prep_inj_sw * 4 * sf; 
* n_init_prep_inj_sdc; 			n_init_prep_inj_sdc    = s_init_prep_inj_sdc * 4 * sf; 
* n_init_prep_inj_plw; 			n_init_prep_inj_plw     = s_init_prep_inj_plw * 4 * sf; *Feb2024;
* n_init_prep_vr_1524w;    		n_init_prep_vr_1524w   = s_init_prep_vr_1524w * 4 * sf;    
* n_init_prep_vr_sw;   			n_init_prep_vr_sw      = s_init_prep_vr_sw * 4 * sf;   
* n_init_prep_vr_sdc; 			n_init_prep_vr_sdc     = s_init_prep_vr_sdc * 4 * sf; 
* n_init_prep_vr_plw;   		n_init_prep_vr_plw      = s_init_prep_vr_plw * 4 * sf;   *Feb2024;

* n_prep_oral_ly_1524w;			n_prep_oral_ly_1524w   = s_prep_oral_ly_1524w * sf;     
* n_prep_oral_ly_sw; 			n_prep_oral_ly_sw 	   = s_prep_oral_ly_sw * sf;     
* n_prep_oral_ly_sdc; 			n_prep_oral_ly_sdc 	   = s_prep_oral_ly_sdc * sf;   
* n_prep_oral_ly_plw; 			n_prep_oral_ly_plw 	   = s_prep_oral_ly_plw * sf;   *Feb2024;     
* n_prep_inj_ly_1524w; 			n_prep_inj_ly_1524w    = s_prep_inj_ly_1524w * sf;      
* n_prep_inj_ly_sw;  			n_prep_inj_ly_sw  	   = s_prep_inj_ly_sw * sf;      
* n_prep_inj_ly_sdc;  			n_prep_inj_ly_sdc      = s_prep_inj_ly_sdc * sf;    
* n_prep_inj_ly_plw; 			n_prep_inj_ly_plw 	   = s_prep_inj_ly_plw * sf;   *Feb2024;     
* n_prep_vr_ly_1524w;  			n_prep_vr_ly_1524w     = s_prep_vr_ly_1524w * sf;       
* n_prep_vr_ly_sw;    			n_prep_vr_ly_sw        = s_prep_vr_ly_sw * sf;     
* n_prep_vr_ly_sdc;   			n_prep_vr_ly_sdc       = s_prep_vr_ly_sdc * sf;   
* n_prep_vr_ly_plw; 			n_prep_vr_ly_plw 	   = s_prep_vr_ly_plw * sf;   *Feb2024;     

* n_prep_oral_1524w; 		n_prep_oral_1524w = s_prep_oral_w_1524 * sf;
* n_prep_oral_sw; 			n_prep_oral_sw    = s_prep_oral_sw * sf; 
* n_prep_oral_sdc; 			n_prep_oral_sdc   = s_prep_oral_sdc * sf; 
* n_prep_oral_plw; 			n_prep_oral_plw    = s_prep_oral_plw * sf; *Feb2024;
* n_prep_inj_1524w; 		n_prep_inj_1524w  = s_prep_inj_w_1524 * sf; 
* n_prep_inj_sw; 			n_prep_inj_sw     = s_prep_inj_sw * sf; 
* n_prep_inj_sdc; 			n_prep_inj_sdc    = s_prep_inj_sdc * sf; 
* n_prep_inj_plw; 			n_prep_inj_plw    = s_prep_inj_plw * sf; *Feb2024;
* n_prep_vr_1524w;    		n_prep_vr_1524w   = s_prep_vr_w_1524 * sf;    
* n_prep_vr_sw;   			n_prep_vr_sw      = s_prep_vr_sw * sf;   
* n_prep_vr_sdc; 			n_prep_vr_sdc     = s_prep_vr_sdc * sf;
* n_prep_vr_plw; 			n_prep_vr_plw    = s_prep_vr_plw * sf; *Feb2024;

*PrEP_CT: Number of clients actively taking the indicated PrEP method(s) 
         (excluding newly enrolled) during the last quarter of the date range displayed.
			We are using the average across quarters;
* n_contprep_oral_1524w; 		n_contprep_oral_1524w = (s_prep_oral_w_1524 - s_init_prep_oral_1524w) * sf;
* n_contprep_oral_sw; 			n_contprep_oral_sw    = (s_prep_oral_sw - s_init_prep_oral_sw) * sf; 
* n_contprep_oral_sdc; 			n_contprep_oral_sdc   = (s_prep_oral_sdc - s_init_prep_oral_sdc) * sf; 
* n_contprep_oral_plw; 			n_contprep_oral_plw    = (s_prep_oral_plw - s_init_prep_oral_plw) * sf; *Feb2024;
* n_contprep_inj_1524w; 		n_contprep_inj_1524w  = (s_prep_inj_w_1524 - s_init_prep_inj_1524w) * sf;   
* n_contprep_inj_sw; 			n_contprep_inj_sw     = (s_prep_inj_sw - s_init_prep_inj_sw) * sf; 
* n_contprep_inj_sdc; 			n_contprep_inj_sdc    = (s_prep_inj_sdc - s_init_prep_inj_sdc) * sf; 
* n_contprep_inj_plw; 			n_contprep_inj_plw    = (s_prep_inj_plw - s_init_prep_inj_plw) * sf; *Feb2024;
* n_contprep_vr_1524w;    		n_contprep_vr_1524w   = (s_prep_vr_w_1524 - s_init_prep_vr_1524w) * sf;    
* n_contprep_vr_sw;   			n_contprep_vr_sw      = (s_prep_vr_sw - s_init_prep_vr_sw) * sf;   
* n_contprep_vr_sdc; 			n_contprep_vr_sdc     = (s_prep_vr_sdc - s_init_prep_vr_sdc) * sf;
* n_contprep_vr_plw; 			n_contprep_vr_plw    = (s_prep_vr_plw - s_init_prep_vr_plw) * sf; *Feb2024;

* n_prep_oral_ever_1524w;		n_prep_oral_ever_1524w = s_prep_oral_ever_1524w * sf;   
* n_prep_oral_ever_sw;  		n_prep_oral_ever_sw    = s_prep_oral_ever_sw * sf;   
* n_prep_oral_ever_sdc; 		n_prep_oral_ever_sdc   = s_prep_oral_ever_sdc * sf; 
* n_prep_oral_ever_plw;  		n_prep_oral_ever_plw   = s_prep_oral_ever_plw * sf;    *Feb2024;
* n_prep_inj_ever_1524w; 		n_prep_inj_ever_1524w  = s_prep_inj_ever_1524w * sf;    
* n_prep_inj_ever_sw;  			n_prep_inj_ever_sw     = s_prep_inj_ever_sw * sf;  
* n_prep_inj_ever_sdc;  		n_prep_inj_ever_sdc    = s_prep_inj_ever_sdc * sf;  
* n_prep_inj_ever_plw;  		n_prep_inj_ever_plw    = s_prep_inj_ever_plw * sf;    *Feb2024;
* n_prep_vr_ever_1524w;  		n_prep_vr_ever_1524w   = s_prep_vr_ever_1524w * sf;     
* n_prep_vr_ever_sw;  			n_prep_vr_ever_sw      = s_prep_vr_ever_sw * sf; 
* n_prep_vr_ever_sdc; 			n_prep_vr_ever_sdc     = s_prep_vr_ever_sdc * sf; 
* n_prep_vr_ever_plw;  			n_prep_vr_ever_plw     = s_prep_vr_ever_plw * sf;    *Feb2024;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;
* prevalence_w;					prevalence_w = s_hivge15w / s_alive_w;
* prevalence_m;					prevalence_m = s_hivge15m / s_alive_m;
* prevalence;					prevalence = s_hivge15 / s_alive;

* ts1m - below change 4 to 12;

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* incidence1564;                incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);

s_primary_w = s_primary1519w + s_primary2024w + s_primary2529w + s_primary3034w	+ s_primary3539w + s_primary4044w + s_primary4549w
+ s_primary5054w + s_primary5559w + s_primary6064w;
s_primary_m = s_primary1519m + s_primary2024m + s_primary2529m + s_primary3034m	+ s_primary3539m + s_primary4044m + s_primary4549m
+ s_primary5054m + s_primary5559m + s_primary6064m;

* incidence1564m;                incidence1564m = (s_primary_m * 4 * 100) / (s_alive1564_m  - s_hiv1564m  + s_primary_m);
* incidence1564w;                incidence1564w = (s_primary_w * 4 * 100) / (s_alive1564_w  - s_hiv1564w  + s_primary_w);


* incidence1524w;				incidence1524w = ((s_primary1519w + s_primary2024w) * 4 * 100) / 
									(s_ageg1519w + s_ageg2024w - s_hiv1519w - s_hiv2024w + s_primary1519w + s_primary2024w);
* incidence1524m;				incidence1524m = ((s_primary1519m + s_primary2024m) * 4 * 100) / 
									(s_ageg1519m + s_ageg2024m - s_hiv1519m - s_hiv2024m + s_primary1519m + s_primary2024m);
* incidence2534w;				incidence2534w = ((s_primary2529w + s_primary3034w) * 4 * 100) / 
									(s_ageg2529w + s_ageg3034w - s_hiv2529w - s_hiv3034w + s_primary2529w + s_primary3034w);
* incidence2534m;				incidence2534m = ((s_primary2529m + s_primary3034m) * 4 * 100) / 
									(s_ageg2529m + s_ageg3034m - s_hiv2529m - s_hiv3034m + s_primary2529m + s_primary3034m);
* incidence3544w;				incidence3544w = ((s_primary3539w + s_primary4044w) * 4 * 100) / 
									(s_ageg3539w + s_ageg4044w - s_hiv3539w - s_hiv4044w + s_primary3539w + s_primary4044w);
* incidence3544m;				incidence3544m = ((s_primary3539m + s_primary4044m) * 4 * 100) / 
									(s_ageg3539m + s_ageg4044m - s_hiv3539m - s_hiv4044m + s_primary3539m + s_primary4044m);
* incidence4554w;				incidence4554w = ((s_primary4549w + s_primary5054w) * 4 * 100) / 
									(s_ageg4549w + s_ageg5054w - s_hiv4549w - s_hiv5054w + s_primary4549w + s_primary5054w);
* incidence4554m;				incidence4554m = ((s_primary4549m + s_primary5054m) * 4 * 100) / 
									(s_ageg4549m + s_ageg5054m - s_hiv4549m - s_hiv5054m + s_primary4549m + s_primary5054m);
* incidence5564w;				incidence5564w = ((s_primary5559w + s_primary6064w) * 4 * 100) / 
									(s_ageg5559w + s_ageg6064w - s_hiv5559w - s_hiv6064w + s_primary5559w + s_primary6064w);
* incidence5564m;				incidence5564m = ((s_primary5559m + s_primary6064m) * 4 * 100) / 
									(s_ageg5559m + s_ageg6064m - s_hiv5559m - s_hiv6064m + s_primary5559m + s_primary6064m);

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

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
* prevalence5054w;				prevalence5054w = s_hiv5054w  / s_ageg5054w ;
* prevalence5054m;				prevalence5054m = s_hiv5054m  / s_ageg5054m ;
* prevalence5559w;				prevalence5559w = s_hiv5559w  / s_ageg5559w ;
* prevalence5559m;				prevalence5559m = s_hiv5559m  / s_ageg5559m ;
* prevalence6064w;				prevalence6064w = s_hiv6064w  / s_ageg6064w ;
* prevalence6064m;				prevalence6064m = s_hiv6064m  / s_ageg6064m ;
* prevalence65plw;				prevalence65plw = s_hiv65plw  / s_ageg65plw ;
* prevalence65plm;				prevalence65plm = s_hiv65plm  / s_ageg65plm ;

* prevalence1524w;				prevalence1524w = ( s_hiv1519w + s_hiv2024w ) / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m = ( s_hiv1519m + s_hiv2024m ) / (s_ageg1519m + s_ageg2024m) ;
* prevalence2549w;				prevalence1524w = ( s_hiv2529w + s_hiv3034w +  s_hiv3539w + s_hiv4044w +  s_hiv4549w ) / 
													(s_ageg2529w + s_ageg3034w + s_ageg3539w + s_ageg4044w + s_ageg4549w) ;
* prevalence2549m;				prevalence1524m = ( s_hiv2529m + s_hiv3034m +  s_hiv3539m + s_hiv4044m +  s_hiv4549m ) / 
													(s_ageg2529m + s_ageg3034m + s_ageg3539m + s_ageg4044m + s_ageg4549m) ;


* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

* prevalence_pwid;				prevalence_pwid = s_hiv_pwid / s_pwid; 

* n_diagnosed (per yr);			n_diagnosed = s_diag_this_period * 4 * sf;

* r_prev_1519w_4549w;			r_prev_1519w_4549w = prevalence1519w / prevalence4549w ;
* r_prev_2024w_4549w;			r_prev_2024w_4549w = prevalence2024w / prevalence4549w ;
* r_prev_2529w_4549w;			r_prev_2529w_4549w = prevalence2529w / prevalence4549w ;
* r_prev_3034w_4549w;			r_prev_3034w_4549w = prevalence3034w / prevalence4549w ;
* r_prev_3539w_4549w;			r_prev_3539w_4549w = prevalence3539w / prevalence4549w ;
* r_prev_4044w_4549w;			r_prev_4044w_4549w = prevalence4044w / prevalence4549w ;
* r_prev_5054w_4549w;			r_prev_5054w_4549w = prevalence5054w / prevalence4549w ;
* r_prev_5559w_4549w;			r_prev_5559w_4549w = prevalence5559w / prevalence4549w ;
* r_prev_6064w_4549w;			r_prev_6064w_4549w = prevalence6064w / prevalence4549w ;
* r_prev_65plw_4549w;			r_prev_65plw_4549w = prevalence65plw / prevalence4549w ;
* r_prev_1519m_4549w;			r_prev_1519m_4549w = prevalence1519m / prevalence4549w ;
* r_prev_2024m_4549w;			r_prev_2024m_4549w = prevalence2024m / prevalence4549w ;
* r_prev_2529m_4549w;			r_prev_2529m_4549w = prevalence2529m / prevalence4549w ;
* r_prev_3034m_4549w;			r_prev_3034m_4549w = prevalence3034m / prevalence4549w ;
* r_prev_3539m_4549w;			r_prev_3539m_4549w = prevalence3539m / prevalence4549w ;
* r_prev_4044m_4549w;			r_prev_4044m_4549w = prevalence4044m / prevalence4549w ;
* r_prev_4549m_4549w;			r_prev_4549m_4549w = prevalence4549m / prevalence4549w ;
* r_prev_5054m_4549w;			r_prev_5054m_4549w = prevalence5054m / prevalence4549w ;
* r_prev_5559m_4549w;			r_prev_5559m_4549w = prevalence5559m / prevalence4549w ;
* r_prev_6064m_4549w;			r_prev_6064m_4549w = prevalence6064m / prevalence4549w ;
* r_prev_65plm_4549w;			r_prev_65plm_4549w = prevalence65plm / prevalence4549w ;

* r_prev_sex_1549 ;				r_prev_sex_1549 = prevalence1549w / prevalence1549m ;


* derived variables relating to people with hiv ;
								if s_primary gt 0 then do;
* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;
* p_inf_msm;					p_inf_msm = s_inf_msm / s_primary;
* p_inf_pwid;					p_inf_pwid = s_inf_pwid / s_primary;

*The meaning of the following is: among newly infected people, which proportion are SW, etc..;
* p_sw_newinf;				    p_sw_newinf = s_primary_sw / s_primary;		
* p_w1524_newinf;				p_w1524_newinf = sum(s_primary1519w,s_primary2024w) / s_primary;
* p_w25ov_newinf;				p_w25ov_newinf = sum(s_primary2529w,s_primary3034w,s_primary3539w,s_primary4044w,s_primary4549w,s_primary5054w,s_primary5559w,s_primary6064w) / s_primary;		
* p_m1524_newinf;				p_m1524_newinf = sum(s_primary1519m,s_primary2024m) / s_primary;
* p_m25ov_newinf;				p_m25ov_newinf = sum(s_primary2529m,s_primary3034m,s_primary3539m,s_primary4044m,s_primary4549m,s_primary5054m,s_primary5559m,s_primary6064m) / s_primary;		
								end;

* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hivge15 ;  p_diag = p_diag * 100;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w * 100;

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

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if s_hivge15 gt 0 then p_onart = s_onart / s_hivge15; 
* p_onart_sw;					p_onart_sw = s_onart_sw / s_hiv_sw;

* n_onart_w;					n_onart_w = s_onart_w * sf;
* n_onart_m;					n_onart_m = s_onart_m * sf;
* n_onart  ;					n_onart   = s_onart   * sf;

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

* p_k65m;						if s_hivge15 gt 0 then p_k65m = s_k65m_ / s_hivge15 ;
* p_m184m;						if s_hivge15 gt 0 then p_m184m = s_m184m_ / s_hivge15 ;

* p_vlg1000_184m;				if s_vg1000 > 0 then p_vlg1000_184m = s_vlg1000_184m / s_vg1000 ;
* p_vlg1000_65m;				if s_vg1000 > 0 then p_vlg1000_65m = s_vlg1000_65m / s_vg1000 ;

* p_vlg1000_184m_hiv;			if s_hivge15 > 0 then p_vlg1000_184m_hiv = s_vlg1000_184m / s_hivge15  ;
* p_vlg1000_65m_hiv;			if s_hivge15 > 0 then p_vlg1000_65m_hiv = s_vlg1000_65m / s_hivge15  ;

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

* p_vg1000, p_vl1000;			if s_hivge15  > 0 then p_vg1000 = s_vg1000 / s_hivge15 ;  p_vl1000 = 1- p_vg1000 ;
* p_vg1000_m, p_vl1000_m;		if s_hivge15m  > 0 then p_vg1000_m = s_vg1000_m / s_hivge15m ;  p_vl1000_m = 1- p_vg1000_m ;
* p_vg1000_w, p_vl1000_w;		if s_hivge15w  > 0 then p_vg1000_w = s_vg1000_w / s_hivge15w ;  p_vl1000_w = 1- p_vg1000_w ;
* p_vg1000_m_1524;				if s_hiv1524m  > 0 then p_vg1000_m_1524 = s_vg1000_m_1524 / s_hiv1524m ;
* p_vg1000_w_1524;				if s_hiv1524w  > 0 then p_vg1000_w_1524 = s_vg1000_w_1524 / s_hiv1524w ;
* p_vl1000_m_1524;				p_vl1000_m_1524 = 1 - p_vg1000_m_1524 ;
* p_vl1000_w_1524;				p_vl1000_w_1524 = 1 - p_vg1000_w_1524 ;

* n_vm_per_year;				n_vm_per_year = s_vm_this_period * sf * 4;

* p_onart_m;					if s_hivge15m > 0 then p_onart_m = s_onart_m / s_hivge15m  ;
* p_onart_w;					if s_hivge15w  > 0 then p_onart_w = s_onart_w / s_hivge15w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_1524;			if s_onart_gt6m_iicu_1524_ > 0 then p_onart_vl1000_1524 = s_vl1000_art_gt6m_iicu_1524_ / s_onart_gt6m_iicu_1524_ ;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* p_vl1000_art_12m;				if s_art_12m > 0 then p_vl1000_art_12m = s_vl1000_art_12m / s_art_12m ;
* p_vl1000_art_12m_onart;		if s_art_12m_onart > 0 then p_vl1000_art_12m_onart = s_vl1000_art_12m_onart / s_art_12m_onart ;

* p_onart_m_age50pl;			p_onart_m_age50pl = s_onart_m50pl / (s_onart_m1549_ + s_onart_m50pl);
* p_onart_w_age50pl;			p_onart_w_age50pl = s_onart_w50pl / (s_onart_w1549_ + s_onart_w50pl);

* prevalence_vg1000;			if s_alive > 0 then prevalence_vg1000 = s_vg1000 / s_alive;
* prev_vg1000_newp_m;			prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hivge15 > 0 then r_efa_hiv = s_r_efa / s_hivge15 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;

* p_iime;						p_iime = s_iime_ / s_hivge15 ;
* p_pime;						p_pime = s_pime_ / s_hivge15 ;
* p_nnme;						p_nnme = s_nnme_ / s_hivge15 ;


* blood pressure;

* p_hypert_1549 ;			p_hypert_1549 = s_hypertension_1549 / s_alive1549 ;
* p_hypert_5059 ;			p_hypert_5059 = s_hypertension_5059 / (s_ageg5054m + s_ageg5559m + s_ageg5054w + s_ageg5559w) ;
* p_hypert_6069 ;			p_hypert_6069 = s_hypertension_6069 / (s_ageg6064m + s_ageg6569m + s_ageg6064w + s_ageg6569w) ;
* p_hypert_7079 ;			p_hypert_7079 = s_hypertension_7079 / (s_ageg7074m + s_ageg7579m + s_ageg7074w + s_ageg7579w) ;
* p_hypert_ge80 ;			p_hypert_ge80 = s_hypertension_ge80 / (s_ageg8084m + s_ageg85plm + s_ageg8084w + s_ageg85plw) ;
* p_hypert_1549m ;			p_hypert_1549m = s_hypertension_1549m / s_alive1549_m ;
* p_hypert_5059m ;			p_hypert_5059m = s_hypertension_5059m / (s_ageg5054m + s_ageg5559m ) ;
* p_hypert_6069m ;			p_hypert_6069m = s_hypertension_6069m / (s_ageg6064m + s_ageg6569m ) ;
* p_hypert_7079m ;			p_hypert_7079m = s_hypertension_7079m / (s_ageg7074m + s_ageg7579m ) ;
* p_hypert_ge80m ;			p_hypert_ge80m = s_hypertension_ge80m / (s_ageg8084m + s_ageg85plm ) ;
* p_hypert_1549w ;			p_hypert_1549w = s_hypertension_1549w / s_alive1549_w ;
* p_hypert_5059w ;			p_hypert_5059w = s_hypertension_5059w / (s_ageg5054w + s_ageg5559w ) ;
* p_hypert_6069w ;			p_hypert_6069w = s_hypertension_6069w / (s_ageg6064w + s_ageg6569w ) ;
* p_hypert_7079w ;			p_hypert_7079w = s_hypertension_7079w / (s_ageg7074w + s_ageg7579w ) ;
* p_hypert_ge80w ;			p_hypert_ge80w = s_hypertension_ge80w / (s_ageg8084w + s_ageg85plw ) ;
* p_hypert180_1549 ;		p_hypert180_1549 = s_hypertens180_1549 / s_alive1549 ;
* p_hypert180_5059 ;		p_hypert180_5059 = s_hypertens180_5059 / (s_ageg5054m + s_ageg5559m + s_ageg5054w + s_ageg5559w) ;
* p_hypert180_6069 ;		p_hypert180_6069 = s_hypertens180_6069 / (s_ageg6064m + s_ageg6569m + s_ageg6064w + s_ageg6569w) ;
* p_hypert180_7079 ;		p_hypert180_7079 = s_hypertens180_7079 / (s_ageg7074m + s_ageg7579m + s_ageg7074w + s_ageg7579w) ;
* p_hypert180_ge80 ;		p_hypert180_ge80 = s_hypertens180_ge80 / (s_ageg8084m + s_ageg85plm + s_ageg8084w + s_ageg85plw) ;
* p_diagnosed_hypert_1549 ;	p_diagnosed_hypert_1549 = s_diagnosed_hypertension_1549 / s_hypertension_1549 ;
* p_diagnosed_hypert_5059 ;	p_diagnosed_hypert_5059 = s_diagnosed_hypertension_5059 / s_hypertension_5059 ;
* p_diagnosed_hypert_6069 ;	p_diagnosed_hypert_6069 = s_diagnosed_hypertension_6069 / s_hypertension_6069 ;
* p_diagnosed_hypert_7079 ;	p_diagnosed_hypert_7079 = s_diagnosed_hypertension_7079 / s_hypertension_7079 ;
* p_diagnosed_hypert_ge80 ;	p_diagnosed_hypert_ge80 = s_diagnosed_hypertension_ge80 / s_hypertension_ge80 ;
* p_diagnosed_hypert_1549m ;	p_diagnosed_hypert_1549m = s_diagnosed_hypertension_1549m / s_hypertension_1549m ;
* p_diagnosed_hypert_5059m ;	p_diagnosed_hypert_5059m = s_diagnosed_hypertension_5059m / s_hypertension_5059m ;
* p_diagnosed_hypert_6069m ;	p_diagnosed_hypert_6069m = s_diagnosed_hypertension_6069m / s_hypertension_6069m ;
* p_diagnosed_hypert_7079m ;	p_diagnosed_hypert_7079m = s_diagnosed_hypertension_7079m / s_hypertension_7079m ;
* p_diagnosed_hypert_ge80m ;	p_diagnosed_hypert_ge80m = s_diagnosed_hypertension_ge80m / s_hypertension_ge80m ;
* p_diagnosed_hypert_1549w ;	p_diagnosed_hypert_1549w = s_diagnosed_hypertension_1549w / s_hypertension_1549w ;
* p_diagnosed_hypert_5059w ;	p_diagnosed_hypert_5059w = s_diagnosed_hypertension_5059w / s_hypertension_5059w ;
* p_diagnosed_hypert_6069w ;	p_diagnosed_hypert_6069w = s_diagnosed_hypertension_6069w / s_hypertension_6069w ;
* p_diagnosed_hypert_7079w ;	p_diagnosed_hypert_7079w = s_diagnosed_hypertension_7079w / s_hypertension_7079w ;
* p_diagnosed_hypert_ge80w ;	p_diagnosed_hypert_ge80w = s_diagnosed_hypertension_ge80w / s_hypertension_ge80w ;
* p_on_anti_hypert_1549 ;		p_on_anti_hypert_1549 = s_on_anti_hypertensive_1549 / s_hypertension_1549 ;
* p_on_anti_hypert_5059 ;		p_on_anti_hypert_5059 = s_on_anti_hypertensive_5059 / s_hypertension_5059 ;
* p_on_anti_hypert_6069 ;		p_on_anti_hypert_6069 = s_on_anti_hypertensive_6069 / s_hypertension_6069 ;
* p_on_anti_hypert_7079 ;		p_on_anti_hypert_7079 = s_on_anti_hypertensive_7079 / s_hypertension_7079 ;
* p_on_anti_hypert_ge80 ;		p_on_anti_hypert_ge80 = s_on_anti_hypertensive_ge80 / s_hypertension_ge80 ;
* p_on_anti_hypert_1549m ;		p_on_anti_hypert_1549m = s_on_anti_hypertensive_1549m / s_hypertension_1549m ;
* p_on_anti_hypert_5059m ;		p_on_anti_hypert_5059m = s_on_anti_hypertensive_5059m / s_hypertension_5059m ;
* p_on_anti_hypert_6069m ;		p_on_anti_hypert_6069m = s_on_anti_hypertensive_6069m / s_hypertension_6069m ;
* p_on_anti_hypert_7079m ;		p_on_anti_hypert_7079m = s_on_anti_hypertensive_7079m / s_hypertension_7079m ;
* p_on_anti_hypert_ge80m ;		p_on_anti_hypert_ge80m = s_on_anti_hypertensive_ge80m / s_hypertension_ge80m ;
* p_on_anti_hypert_1549w ;		p_on_anti_hypert_1549w = s_on_anti_hypertensive_1549w / s_hypertension_1549w ;
* p_on_anti_hypert_5059w ;		p_on_anti_hypert_5059w = s_on_anti_hypertensive_5059w / s_hypertension_5059w ;
* p_on_anti_hypert_6069w ;		p_on_anti_hypert_6069w = s_on_anti_hypertensive_6069w / s_hypertension_6069w ;
* p_on_anti_hypert_7079w ;		p_on_anti_hypert_7079w = s_on_anti_hypertensive_7079w / s_hypertension_7079w ;
* p_on_anti_hypert_ge80w ;		p_on_anti_hypert_ge80w = s_on_anti_hypertensive_ge80w / s_hypertension_ge80w ;
* p_on1drug_antihyp_1549 ;		p_on1drug_antihyp_1549 = s_on1drug_antihyp_1549 / (s_on1drug_antihyp_1549 + s_on2drug_antihyp_1549 + s_on3drug_antihyp_1549);
* p_on2drug_antihyp_1549 ;		p_on2drug_antihyp_1549 = s_on2drug_antihyp_1549 / (s_on1drug_antihyp_1549 + s_on2drug_antihyp_1549 + s_on3drug_antihyp_1549);
* p_on3drug_antihyp_1549 ;		p_on3drug_antihyp_1549 = s_on3drug_antihyp_1549 / (s_on1drug_antihyp_1549 + s_on2drug_antihyp_1549 + s_on3drug_antihyp_1549);
* p_on1drug_antihyp_5059 ;		p_on1drug_antihyp_5059 = s_on1drug_antihyp_5059 / (s_on1drug_antihyp_5059 + s_on2drug_antihyp_5059 + s_on3drug_antihyp_5059);
* p_on2drug_antihyp_5059 ;		p_on2drug_antihyp_5059 = s_on2drug_antihyp_5059 / (s_on1drug_antihyp_5059 + s_on2drug_antihyp_5059 + s_on3drug_antihyp_5059);
* p_on3drug_antihyp_5059 ;		p_on3drug_antihyp_5059 = s_on3drug_antihyp_5059 / (s_on1drug_antihyp_5059 + s_on2drug_antihyp_5059 + s_on3drug_antihyp_5059);
* p_on1drug_antihyp_6069 ;		p_on1drug_antihyp_6069 = s_on1drug_antihyp_6069 / (s_on1drug_antihyp_6069 + s_on2drug_antihyp_6069 + s_on3drug_antihyp_6069);
* p_on2drug_antihyp_6069 ;		p_on2drug_antihyp_6069 = s_on2drug_antihyp_6069 / (s_on1drug_antihyp_6069 + s_on2drug_antihyp_6069 + s_on3drug_antihyp_6069);
* p_on3drug_antihyp_6069 ;		p_on3drug_antihyp_6069 = s_on3drug_antihyp_6069 / (s_on1drug_antihyp_6069 + s_on2drug_antihyp_6069 + s_on3drug_antihyp_6069);
* p_on1drug_antihyp_7079 ;		p_on1drug_antihyp_7079 = s_on1drug_antihyp_7079 / (s_on1drug_antihyp_7079 + s_on2drug_antihyp_7079 + s_on3drug_antihyp_7079);
* p_on2drug_antihyp_7079 ;		p_on2drug_antihyp_7079 = s_on2drug_antihyp_7079 / (s_on1drug_antihyp_7079 + s_on2drug_antihyp_7079 + s_on3drug_antihyp_7079);
* p_on3drug_antihyp_7079 ;		p_on3drug_antihyp_7079 = s_on3drug_antihyp_7079 / (s_on1drug_antihyp_7079 + s_on2drug_antihyp_7079 + s_on3drug_antihyp_7079);
* p_on1drug_antihyp_ge80 ;		p_on1drug_antihyp_ge80 = s_on1drug_antihyp_ge80 / (s_on1drug_antihyp_ge80 + s_on2drug_antihyp_ge80 + s_on3drug_antihyp_ge80);
* p_on2drug_antihyp_ge80 ;		p_on2drug_antihyp_ge80 = s_on2drug_antihyp_ge80 / (s_on1drug_antihyp_ge80 + s_on2drug_antihyp_ge80 + s_on3drug_antihyp_ge80);
* p_on3drug_antihyp_ge80 ;		p_on3drug_antihyp_ge80 = s_on3drug_antihyp_ge80 / (s_on1drug_antihyp_ge80 + s_on2drug_antihyp_ge80 + s_on3drug_antihyp_ge80);

* p_ahd_re_enter_care_100;		p_ahd_re_enter_care_100 = s_ahd_re_enter_care_100 / s_re_enter_care;
* p_ahd_re_enter_care_200;		p_ahd_re_enter_care_200 = s_ahd_re_enter_care_200 / s_re_enter_care;

* ts1m - below change 4 to 12;
* aids_death_rate;				if s_hivge15 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hivge15 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);

* death_rate_hiv; 				if s_hivge15 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hivge15;
				 				if s_hivge15m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hivge15m;
								if s_hivge15w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hivge15w;
* death_rate_hiv_all;			if s_alive > 0 then death_rate_hiv_all = (4 * 100 * s_death_hiv) / s_alive ;
				 				if s_alive_m > 0 then death_rate_hiv_all_m = (4 * 100 * s_death_hiv_m) / s_alive_m;
								if s_alive_w > 0 then death_rate_hiv_all_w = (4 * 100 * s_death_hiv_w) / s_alive_w;

* n deaths and death rate by cause and hiv status - age 15+ ;

			n_dead_hivpos_cause1 = s_dead_hivpos_cause1 * 4 * sf; 
			rate_dead_hivpos_cause1 = (s_dead_hivpos_cause1 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_tb = s_dead_hivpos_tb  * 4* sf; 
			rate_dead_hivpos_tb = (s_dead_hivpos_tb * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause4 = s_dead_hivpos_cause4  * 4* sf; 
			rate_dead_hivpos_cause4 = (s_dead_hivpos_cause4 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_crypm = s_dead_hivpos_crypm  * 4* sf; 
			rate_dead_hivpos_crypm = (s_dead_hivpos_crypm * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_sbi = s_dead_hivpos_sbi  * 4* sf; 
			rate_dead_hivpos_sbi = (s_dead_hivpos_sbi * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_oth_adc = s_dead_hivpos_oth_adc  * 4* sf; 
			rate_dead_hivpos_oth_adc = (s_dead_hivpos_oth_adc * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause2 = s_dead_hivpos_cause2  * 4* sf; 
			rate_dead_hivpos_cause2 = (s_dead_hivpos_cause2 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause3 = s_dead_hivpos_cause3  * 4* sf; 
			rate_dead_hivpos_cause3 = (s_dead_hivpos_cause3 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cvd = s_dead_hivpos_cvd  * 4* sf; 
			rate_dead_hivpos_cvd = (s_dead_hivpos_cvd * 4 * 100) / s_hivge15 ;
			n_dead_cvd = s_dead_cvd  * 4* sf; 
			rate_dead_cvd = (s_dead_cvd * 4 * 100) / s_alive ;
			n_dead_tb = s_dead_tb  * 4* sf; 
			rate_dead_tb = (s_dead_tb * 4 * 100) / s_alive ;
			n_dead_hivneg_cvd = s_dead_hivneg_cvd  * 4* sf; 
			rate_dead_hivneg_cvd = (s_dead_hivneg_cvd * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_tb = s_dead_hivneg_tb  * 4* sf; 
			rate_dead_hivneg_tb = (s_dead_hivneg_tb * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause2 = s_dead_hivneg_cause2  * 4* sf; 
			rate_dead_hivneg_cause2 = (s_dead_hivneg_cause2 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause3 = s_dead_hivneg_cause3  * 4* sf; 
			rate_dead_hivneg_cause3 = (s_dead_hivneg_cause3 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause4 = s_dead_hivneg_cause4  * 4* sf; 
			rate_dead_hivneg_cause4 = (s_dead_hivneg_cause4 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause5 = s_dead_hivneg_cause5  * 4* sf; 
			rate_dead_hivneg_cause5 = (s_dead_hivneg_cause5 * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead = (s_dead * 4 * 100) / s_alive ;
			rate_dead_hivneg = (s_dead_hivneg_anycause * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_hivpos = (s_dead_hivpos_anycause * 4 * 100) / s_hivge15 ;

			rate_dead_cvd_3039m = (s_dead_cvd_3039m * 4 * 100) / (s_ageg3034m + s_ageg3539m) ;
			rate_dead_cvd_4049m = (s_dead_cvd_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
			rate_dead_cvd_5059m = (s_dead_cvd_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
			rate_dead_cvd_6069m = (s_dead_cvd_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
			rate_dead_cvd_7079m = (s_dead_cvd_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
			rate_dead_cvd_ge80m = (s_dead_cvd_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
			rate_dead_cvd_3039w = (s_dead_cvd_3039w * 4 * 100) / (s_ageg3034w + s_ageg3539w) ;
			rate_dead_cvd_4049w = (s_dead_cvd_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
			rate_dead_cvd_5059w = (s_dead_cvd_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
			rate_dead_cvd_6069w = (s_dead_cvd_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
			rate_dead_cvd_7079w = (s_dead_cvd_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
			rate_dead_cvd_ge80w = (s_dead_cvd_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;

* n_alive;						n_alive = s_alive * sf;
* n_alive_m;					n_alive_m = s_alive_m * sf;
* n_alive_w;					n_alive_w = s_alive_w * sf;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel  * 4* sf;
* n_death_hivrel_m;				n_death_hivrel_m = s_death_hivrel_m  * 4* sf;
* n_death_hivrel_w;				n_death_hivrel_w = (s_death_hivrel - s_death_hivrel_m)  * 4* sf;


* n_death_covid;				n_death_covid = s_death_dcause3_allage  * 4* sf;
* n_death;						n_death = s_dead_allage  * 4 * sf;
* n_covid;						n_covid = s_covid  * 4 * sf;
* n_death_hivneg_anycause;		n_death_hivneg_anycause = s_dead_hivneg_anycause  * 4 * sf;
* n_death_hivpos_anycause;		n_death_hivpos_anycause = s_dead_hivpos_anycause  * 4 * sf;

* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * sf ;

* n_death_hiv_m;				n_death_hiv_m = s_death_hiv_m * 4 * sf;
* n_death_hiv_w;				n_death_hiv_w = s_death_hiv_w * 4 * sf;

* n_death_m;					n_death_m = s_deadm_all  * 4 * sf;
* n_death_w;					n_death_w = s_deadw_all  * 4 * sf;
													
* n_cd4_lt200;					n_cd4_lt200 = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * sf; 
* n_cd4_lt50;					n_cd4_lt50 = s_cd4_g1 * sf; 

* n_hiv1549_m;					n_hiv1549_m = s_hiv1549m * sf;
* n_hiv1549_w;					n_hiv1549_w = s_hiv1549w * sf;
* n_hiv1549  ;					n_hiv1549   = (s_hiv1549m + s_hiv1549w) * sf;
* n_hiv;						n_hiv = s_hivge15 * sf; 
* n_hiv_m ;						n_hiv_m = s_hivge15m * sf; 
* n_hiv_w ;						n_hiv_w = s_hivge15w * sf; 

* n_infected1549;					n_infected = (s_primary1549_m + s_primary1549_w) * 4 * sf;
* n_infected1549m;					n_infected1549_m = s_primary1549_m * 4 * sf;
* n_infected1549w;					n_infected1549_w = s_primary1549_w * 4 * sf;

* n_infected;					n_infected = (s_primary_m + s_primary_w) * 4 * sf;
* n_infected_w;					n_infected_w = s_primary_w * 4 * sf;
* n_infected_m;					n_infected_m = s_primary_m * 4 * sf;



inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* number of women with hiv giving birth per year;

n_give_birth_w_hiv = s_give_birth_with_hiv * sf * 4;
* n_give_birth_on_art;			n_give_birth_on_art = s_give_birth_on_art * sf * 4;
n_birth_with_inf_child = s_birth_with_inf_child * sf * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * sf * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf * 4;  * annual number;
n_mcirc1549_ = s_mcirc_1549m * sf * 4;
n_mcirc1549_3m = s_mcirc_1549m * sf;
n_vmmc1549_ = s_vmmc1549m * sf * 4;
n_vmmc1549_3m = s_vmmc1549m * sf;
n_new_inf1549m = s_primary1549m * sf * 4;
n_new_inf1549w = s_primary1549w * sf * 4;
n_new_inf1549 = s_primary1549 * sf * 4;

* n_vm;							n_vm = s_vm_this_per * 4 * sf;*VCFeb2023;
* n_vm_w;						n_vm_w = s_vm_this_per_w * 4 * sf;	*JASJun2024;
* n_vm_m;						n_vm_m = s_vm_this_per_m * 4 * sf;	*JASJun2024;
* p_vm_ly_onart;				p_vm_ly_onart = s_vm_ly /s_onart;*VCMar2023;

* n_new_vmmc;					n_new_vmmc = s_new_vmmc * sf * 4;	*JASJun2024;
* n_new_vmmc1014m;				n_new_vmmc1014m = s_new_vmmc1014m * sf * 4;
* n_new_vmmc1049m;				n_new_vmmc1049m = (s_new_vmmc1014m+s_new_vmmc1519m+s_new_vmmc2024m+s_new_vmmc2529m+s_new_vmmc3034m+s_new_vmmc3539m+s_new_vmmc4044m+s_new_vmmc4549m) * sf * 4;
* n_new_vmmc1549m;				n_new_vmmc1549m = (s_new_vmmc1519m+s_new_vmmc2024m+s_new_vmmc2529m+s_new_vmmc3034m+s_new_vmmc3539m+s_new_vmmc4044m+s_new_vmmc4549m) * sf * 4;


*n_not_on_art_cd4ge500;			n_not_on_art_cd4ge500  = s_not_on_art_cd4ge500 * sf; *VCFeb2023; 
*n_not_on_art_cd4350500;		n_not_on_art_cd4350500 = s_not_on_art_cd4350500 * sf; *VCFeb2023; 
*n_not_on_art_cd4200350;		n_not_on_art_cd4200350 = s_not_on_art_cd4200350 * sf; *VCFeb2023; 
*n_not_on_art_cd450200;			n_not_on_art_cd450200  = (s_not_on_art_cd4l200 - s_not_on_art_cd4l50) * sf; *VCFeb2023; 
*n_not_on_art_cd4050;		    n_not_on_art_cd4050    = s_not_on_art_cd4l50 * sf; *VCFeb2023; 
*n_not_on_art_cd40200;			n_not_on_art_cd40200  = s_not_on_art_cd4l200 * sf; *VCFeb2023; 

*n_asympt_Undiag;				n_asympt_Undiag     = s_asympt_Undiag * sf; *VCFeb2023;  
*n_asympt_diagoffart;			n_asympt_diagoffart = s_asympt_diagoffart * sf; *VCFeb2023; 
*n_asympt_diagonart;			n_asympt_diagonart  = s_asympt_diagonart * sf; *VCFeb2023; 
*n_sympt_notaids;				n_sympt_notaids 	= s_sympt_notaids * sf; *VCFeb2023; 
*n_sympt_aids;					n_sympt_aids 		= s_sympt_aids * sf; *VCFeb2023; 

* n_infection;					n_infection  = s_primary     * sf * 4;
* n_new_inf1564m;				n_new_inf1564m = (s_primary1549m + s_primary5054m + s_primary5559m + s_primary6064m)* sf * 4;	*Corrected equation JASApr2024;
* n_new_inf1564w;				n_new_inf1564w = (s_primary1549w + s_primary5054w + s_primary5559w + s_primary6064w)* sf * 4;	*Corrected equation JASApr2024;
* n_new_inf1524m;				n_new_inf1524m = (s_primary1519m + s_primary2024m) * sf * 4;
* n_new_inf1524w;				n_new_inf1524w = (s_primary1519w + s_primary2024w) * sf * 4;
* n_new_inf2549m;				n_new_inf2549m = (s_primary1549m - s_primary1519m - s_primary2024m) * sf * 4;
* n_new_inf2549w;				n_new_inf2549w = (s_primary1549w - s_primary1519w - s_primary2024w) * sf * 4;

* PLW;				*JASAug2024;
* n_breastfeeding;				n_breastfeeding = s_breastfeeding * sf;
* n_plw;						n_plw = s_plw * sf;

* U=U messaging;	*JASAug2024;
* n_receive_u_u;				n_receive_u_u = s_receive_u_u * sf;	* *4? ;
* n_diag_receive_u_u;			n_diag_receive_u_u = s_diag_receive_u_u * sf;	* *4? ;

* Mens clinics;		*JASAug2024;
* n_attend_mens_clinic;			n_attend_mens_clinic = s_attend_mens_clinic * sf;	* *4? ;
* n_hiv_mens_clinic;			n_hiv_mens_clinic = s_hiv_mens_clinic * sf;			* *4? ;
* n_art_mens_clinic;			n_art_mens_clinic = s_onart_mens_clinic * sf;
* p_onart_mens_clinic;			if s_hiv_mens_clinic gt 0 then p_onart_mens_clinic = s_onart_mens_clinic / s_hiv_mens_clinic;
* p_onart_no_mens_clinic;		p_onart_no_mens_clinic = (s_onart_m - s_onart_mens_clinic) / (s_hivge15m - s_hiv_mens_clinic);
* p_onart_diag_mens_clinic;		if s_hiv_mens_clinic gt 0 then p_onart_diag_mens_clinic = s_onart_mens_clinic / s_diag_mens_clinic;

* Peer navigators;	*JASAug2024;
* n_hiv_peer_navigator_w;		n_hiv_peer_navigator_w = s_hiv_peer_navigator_w * sf;	* *4? ;
* n_hiv_peer_navigator_m;		n_hiv_peer_navigator_m = s_hiv_peer_navigator_m * sf;	* *4? ;
* n_hiv_peer_navigator;			n_hiv_peer_navigator = s_hiv_peer_navigator * sf;	* *4? ;
* n_onart_peer_navigator;		n_onart_peer_navigator = s_onart_peer_navigator * sf;
* p_onart_peer_navigator;		if s_hiv_peer_navigator gt 0 then p_onart_peer_navigator = s_onart_peer_navigator / s_hiv_peer_navigator;
* p_onart_no_peer_navigator;	p_onart_no_peer_navigator = (s_onart_m - s_onart_peer_navigator) / (s_hivge15m - s_hiv_peer_navigator);
* p_onart_diag_peer_navigator;	if s_hiv_peer_navigator gt 0 then p_onart_diag_peer_navigator = s_onart_peer_navigator / s_diag_peer_navigator;

* n_dyllag_hiv_w;				n_dyllag_hiv_w = s_dyllag_hiv_w * sf;	*JASJul2024;
* n_dyllag_hiv_m;				n_dyllag_hiv_m = s_dyllag_hiv_m * sf;	*JASJul2024;

incidence1524m = incidence1524m * 10; 
incidence1524w = incidence1524w * 10;  
incidence1564m = incidence1564m * 10; 
incidence1564w = incidence1564w * 10;  
incidence1564 = incidence1564 * 10;  
incidence_sw = incidence_sw * 10; 
incidence_msm = incidence1564msm * 10;

p_diag_m  = p_diag_m / 100;
p_diag_w = p_diag_w / 100; 
p_diag = p_diag / 100;

	
keep run cald option 

prevalence_m
prevalence_w
n_alive_m
n_alive_w
p_diag_m
p_diag_w								
p_onart_diag_m
p_onart_diag_w							
n_onart_m
n_onart_w							
p_onart_vl1000_m
p_onart_vl1000_w
n_not_on_art_cd4ge500 
n_not_on_art_cd4350500 
n_not_on_art_cd4200350 
n_not_on_art_cd40200 					
;


proc sort data=y_stock;by run option;run;


data y; set y_stock; 
 
  options nomprint;
  option nospool;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* stock;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%macro var_stock(v=);

proc means noprint data=y; var &v; output out=y_23  mean= &v   ; where cald = 2023.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_24  mean= &v   ; where cald = 2024.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_25  mean= &v   ; where cald = 2025.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_26  mean= &v   ; where cald = 2026.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_27  mean= &v   ; where cald = 2027.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_28  mean= &v   ; where cald = 2028.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_29  mean= &v   ; where cald = 2029.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_30  mean= &v   ; where cald = 2030.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_31  mean= &v   ; where cald = 2031.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_32  mean= &v   ; where cald = 2032.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_33  mean= &v   ; where cald = 2033.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_34  mean= &v   ; where cald = 2034.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_35  mean= &v   ; where cald = 2035.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_36  mean= &v   ; where cald = 2036.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_37  mean= &v   ; where cald = 2037.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_38  mean= &v   ; where cald = 2038.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_39  mean= &v   ; where cald = 2039.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_40  mean= &v   ; where cald = 2040.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_41  mean= &v   ; where cald = 2041.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_42  mean= &v   ; where cald = 2042.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_43  mean= &v   ; where cald = 2043.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_44  mean= &v   ; where cald = 2044.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_45  mean= &v   ; where cald = 2045.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_46  mean= &v   ; where cald = 2046.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_47  mean= &v   ; where cald = 2047.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_48  mean= &v   ; where cald = 2048.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_49  mean= &v   ; where cald = 2049.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_50  mean= &v   ; where cald = 2050.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_51  mean= &v   ; where cald = 2051.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_52  mean= &v   ; where cald = 2052.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_53  mean= &v   ; where cald = 2053.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_54  mean= &v   ; where cald = 2054.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_55  mean= &v   ; where cald = 2055.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_56  mean= &v   ; where cald = 2056.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_57  mean= &v   ; where cald = 2057.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_58  mean= &v   ; where cald = 2058.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_59  mean= &v   ; where cald = 2059.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_60  mean= &v   ; where cald = 2060.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_61  mean= &v   ; where cald = 2061.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_62  mean= &v   ; where cald = 2062.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_63  mean= &v   ; where cald = 2063.5 and option=11 ;
proc means noprint data=y; var &v; output out=y_64  mean= &v   ; where cald = 2064.5 and option=11 ;
 
data &v ; set  y_23
y_24 y_25 y_26 y_27 y_28 y_29 y_30 y_31 y_32 y_33 y_34 y_35 y_36 y_37 y_38 y_39 y_40  y_41 y_42 y_43 y_44 y_45 y_46 y_47 y_48 y_49 y_50
y_51 y_52 y_53 y_54 y_55 y_56 y_57 y_58 y_59 y_60 y_61 y_62 y_63 y_64
;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var_stock;








* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* stock;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


%var_stock(v=prevalence_m);
%var_stock(v=prevalence_w);
%var_stock(v=n_alive_m);
%var_stock(v=n_alive_w);
%var_stock(v=p_diag_m);
%var_stock(v=p_diag_w);								
%var_stock(v=p_onart_diag_m);
%var_stock(v=p_onart_diag_w);							
%var_stock(v=n_onart_m);
%var_stock(v=n_onart_w		);					
%var_stock(v=p_onart_vl1000_m);
%var_stock(v=p_onart_vl1000_w);
%var_stock(v=n_not_on_art_cd4ge500);
%var_stock(v=n_not_on_art_cd4350500);
%var_stock(v=n_not_on_art_cd4200350);
%var_stock(v=n_not_on_art_cd40200	);


data year;
input year;
cards;
2023
2024
2025
2026
2027
2028
2029
2030
2031
2032
2033
2034
2035
2036
2037
2038
2039
2040
2041
2042
2043
2044
2045
2046
2047
2048
2049
2050
2051
2052
2053
2054
2055
2056
2057
2058
2059
2060
2061
2062
2063
2064


data  wide_outputs ; merge 

year

prevalence_m
prevalence_w
n_alive_m
n_alive_w
p_diag_m
p_diag_w								
p_onart_diag_m
p_onart_diag_w							
n_onart_m
n_onart_w							
p_onart_vl1000_m
p_onart_vl1000_w
n_not_on_art_cd4ge500_
n_not_on_art_cd4350500 
n_not_on_art_cd4200350 
n_not_on_art_cd40200 

;


dummy1=.;dummy2=.;dummy3=.;dummy4=.;dummy5=.;dummy6=.;dummy7=.;dummy8=.;dummy9=.;
dummy10=.;dummy11=.;dummy12=.;dummy13=.;dummy14=.;dummy15=.;dummy16=.;dummy17=.;dummy18=.;


data stock ; 
retain 
year 

prevalence_m
prevalence_w
dummy15      
dummy1
dummy2
n_alive_m
n_alive_w
dummy16          
dummy3
dummy4
p_diag_m
p_diag_w
dummy17     
dummy5
dummy6
p_onart_diag_m
p_onart_diag_w	
dummy18        
dummy7
dummy8
n_onart_m
n_onart_w
dummy9
dummy10
p_onart_vl1000_m
p_onart_vl1000_w
dummy11
dummy12
n_not_on_art_cd4ge500 
n_not_on_art_cd4350500 
n_not_on_art_cd4200350 
n_not_on_art_cd40200 
dummy13
dummy14

;
set wide_outputs;
run;

proc transpose data=stock  out=data3 ; run;

data a; set data3;
drop _name_;

ods html;
proc print noobs data=a; run; 
ods html close;
