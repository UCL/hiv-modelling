

* options user="/folders/myfolders/";

 proc printto ; 

libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\vaccine\vaccine_n_b_keep_prep_out\";


/*

libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\vaccine\vaccine_n_b_keep_prep_out\";


data i1;set b.out1:; data i2; set b.out2:; data i3; set b.out3:; data i4; set b.out4:; data i5; set b.out5:; 
data i6; set b.out6:; data i7; set b.out7:; data i8; set b.out8:; data i9; set b.out9:;  

data b.k_vaccine_n_b_keep_prep;  set i1 i2 i3 i4 i5 i6 i7 i8 i9 ;

run;

*/


proc sort data=b.k_vaccine_n_b_keep_prep; 
by run cald option;
run;



* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;


set b.k_vaccine_n_b_keep_prep ;


if cald=2024   ;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = 10000000 / s_alive;
incidence1549_2023 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
prevalence1549_2023 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
keep run sf_2023 incidence1549_2023 prevalence1549_2023;


proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2023;



data y; 

merge b.k_vaccine_n_b_keep_prep sf;
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

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from 2023 - no adjustment needed;
* ts1m - this code needs to change for ts1m;

* %let year_start_disc=2023.5;
* discount_10py = 1/(1.10**(cald-&year_start_disc));
* The following can be changed if we want instead 10% discount rate;
* %let discount=discount_3py;


* ================================================================================= ;





* dalys and life years;

* ================================================================================= ;

ly = s_ly * &sf;
dly = s_dly * &sf;

s_ddaly = s_dead_ddaly + s_live_ddaly;
s_daly = s_dead_daly + s_live_daly;

dead_ddaly_ntd = s_dead_ddaly_ntd * &sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * &sf * 4;
daly = s_daly * &sf * 4;



* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 


dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * &sf * 4; * odabe ;

ddaly_mtct = s_ddaly_mtct * &sf * 4;
daly_mtct = s_daly_mtct * &sf * 4;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * &sf * 4; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;


daly_ac_mtct = daly + daly_mtct ;


* ================================================================================= ;



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

dzdv_cost = s_dcost_zdv * &sf * 4 / 1000;
dten_cost = s_dcost_ten * &sf * 4 / 1000;
d3tc_cost = s_dcost_3tc * &sf * 4 / 1000; 
dnev_cost = s_dcost_nev * &sf * 4 / 1000;
dlpr_cost = s_dcost_lpr * &sf * 4 / 1000;
ddar_cost = s_dcost_dar * &sf * 4 / 1000;
dtaz_cost = s_dcost_taz * &sf * 4 / 1000;
defa_cost = s_dcost_efa * &sf * 4 / 1000;
ddol_cost = s_dcost_dol * &sf * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_prep_oral=. then s_dcost_prep_oral=0;
if s_dcost_prep_inj=. then s_dcost_prep_inj=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_inj;
s_dcost_prep_visit = s_dcost_prep_visit_oral + s_dcost_prep_visit_inj;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * &sf * 4 / 1000;
dart_1_cost = s_dart_1_cost * &sf * 4 / 1000;
dart_2_cost = s_dart_2_cost * &sf * 4 / 1000;
dart_3_cost = s_dart_3_cost * &sf * 4 / 1000;
dart_cost = s_dart_cost * &sf * 4 / 1000;
dvl_cost = s_dvl_cost * &sf * 4 / 1000;
dcd4_cost = s_dcd4_cost * &sf * 4 / 1000;
dadc_cost = s_dadc_cost * &sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost * &sf * 4 / 1000;
dtb_cost = s_dtb_cost * &sf * 4 / 1000;
dtest_cost = s_dtest_cost * &sf * 4 / 1000;
dcot_cost = s_dcot_cost * &sf * 4 / 1000;
dres_cost = s_dres_cost * &sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * &sf * 4 / 1000;  
dcost_prep = s_dcost_prep * &sf * 4 / 1000; 
dcost_prep_inj = s_dcost_prep_inj * &sf * 4 / 1000; 
dcost_prep_oral = s_dcost_prep_oral * &sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * &sf * 4 / 1000; 	
dcost_prep_visit_inj  = s_dcost_prep_visit_inj * &sf * 4 / 1000; 	
dcost_prep_visit_oral  = s_dcost_prep_visit_oral * &sf * 4 / 1000; 	 
dcost_prep_ac_adh = s_dcost_prep_ac_adh * &sf * 4 / 1000; 


* note this below can be used if outputs are from program beyond 1-1-20;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; 

dclin_cost = dadc_cost+dnon_tb_who3_cost+dcot_cost+dtb_cost;

* sens analysis;


dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost+dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death + ddcp_cost;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 

cost_clin_care = dcost_clin_care / discount;

cost = dcost / discount;


* checks;

* proc print; 
* var run cald option dcost_prep_inj  dcost_prep_oral   dcost_prep  dcost_prep_visit;

* ================================================================================= ;

* derived variables relating to population, not only those with hiv ;

if s_ai_naive_no_pmtct_c_nnm_ = . then s_ai_naive_no_pmtct_c_nnm_ = 0; 
if s_ai_naive_no_pmtct_c_pim_ = . then s_ai_naive_no_pmtct_c_pim_ = 0;
if s_ai_naive_no_pmtct_e_inm_ = . then s_ai_naive_no_pmtct_e_inm_ = 0;
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

s_hiv = s_hivge15 ;


* p_age1549_hiv ; 				p_age1549_hiv = (s_hiv1549m + s_hiv1549w) / s_hivge15 ;
* p_age1549_hivneg ;			p_age1549_hivneg = ((s_alive1549_w + s_alive1549_m) - (s_hiv1549m + s_hiv1549w)) / ((s_alive_m + s_alive_w) - s_hivge15);

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;

* n_newp_ge1;					n_newp_ge1 = s_newp_ge1 * &sf;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* av_newp_ge1;					av_newp_ge1 = s_newp / s_newp_ge1 ;

* av number of newp amongst people with newp ge 1, exlcuding sw;
* av_newp_ge1_non_sw;			av_newp_ge1_non_sw = (s_newp - s_newp_sw) / (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5));


* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_m_newp_ge1_age1549;			p_m_newp_ge1_age1549 = (s_m1549_newp_ge1) / (s_alive1549_m) ;
* p_w_newp_ge1_age1549;			p_w_newp_ge1_age1549 = (s_w1549_newp_ge1) / (s_alive1549_w) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_m1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_ep;							p_ep = s_ep / s_alive1564 ;

* n_ep;							n_ep = s_ep * &sf;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;


* n_sw_1564;					n_sw_1564 = s_sw_1564 * &sf;
* n_sw_1549;					n_sw_1549 = s_sw_1549 * &sf;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;

* note these are now number tested per 3 months;
* n_tested_m;					n_tested_m = s_tested_m * &sf ;
* n_tested_w;					n_tested_w = s_tested_f * &sf ;
* n_tested_sw;					n_tested_sw = s_tested_sw * &sf ;
* n_tested;						n_tested = s_tested * &sf ;

* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* of people alive and within 1 year of infection, proportion diagnosed ;
* prop_diag_infection_1yr;		prop_diag_infection_1yr = s_year_1_infection_diag / s_year_1_infection ;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

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

* n_new_vmmc;					n_new_vmmc = (s_new_vmmc1519m + s_new_vmmc2024m +  s_new_vmmc2529m + s_new_vmmc3034m +  s_new_vmmc3539m 
											+ s_new_vmmc4044m + s_new_vmmc4549m) * &sf * 4 ;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then  
								prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp = s_sw_newp/s_sw_1564;



* vaccine;

* n_ever_vaccinated;			n_ever_vaccinated = max(0, s_ever_vaccinated * &sf);
* p_agege15_ever_vaccinated;	p_agege15_ever_vaccinated = max(0, s_ever_vaccinated) / s_alive;
* p_current_full_vaccine_eff;	p_current_full_vaccine_eff = s_current_full_vaccine_efficacy / s_alive;
* p_current_half_vaccine_eff;	p_current_half_vaccine_eff = s_current_half_vaccine_efficacy / s_alive;
* p_current_any_vaccine_eff;	p_current_any_vaccine_eff = p_current_full_vaccine_eff + p_current_half_vaccine_eff;
* p_current_full_vac_e_1564;	p_current_full_vac_e_1564 = s_current_full_vaccine_e_1564 / s_alive1564;
* p_current_half_vac_e_1564;	p_current_half_vac_e_1564 = s_current_half_vaccine_e_1564 / s_alive1564;
* p_current_any_vac_e_1564;		p_current_any_vac_e_1564 = p_current_full_vac_e_1564 + p_current_half_vac_e_1564;

* n_cur_full_vaccine_efficacy;	n_cur_full_vaccine_efficacy = s_current_full_vaccine_efficacy * &sf;
* n_any_cur_vaccine_efficacy;	n_any_cur_vaccine_efficacy = (s_current_full_vaccine_eff + s_current_half_vaccine_eff) * &sf;
* n_vaccinated_this_year;	   	n_vaccinated_this_year =  s_first_vaccine_this_period * &sf * 4; 
* n_boosted_this_year ;			n_boosted_this_year = (s_vaccine_this_period - s_first_vaccine_this_period) * &sf * 4;


* prep;

s_hiv_cab = s_hiv_cab_3m + s_hiv_cab_6m + s_hiv_cab_9m + s_hiv_cab_ge12m;

* proportion of those on prep who have ge 1 newp in the period ;
* p_prep_newp ;					if s_prep_any > 0 then p_prep_newp = (s_newp_this_per_hivneg_m_prep + s_newp_this_per_hivneg_w_prep) / s_prep_any ; 

* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;

* p_prep_elig_past_year;		p_prep_elig_past_year = s_prep_any_elig_past_year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* p_prep_elig_past_5year;		p_prep_elig_past_5year = s_prep_any_elig_past_5year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);

* mean_newp_ppers_prep;			if s_prep_any > 0 then mean_newp_ppers_prep = s_prep_newp / s_prep_any ;

* prop_onprep_newpge1;			if s_prep_any > 0 then prop_onprep_newpge1 = (s_prep_newpg1 + s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge2;			if s_prep_any > 0 then prop_onprep_newpge2 = (s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge3;			if s_prep_any > 0 then prop_onprep_newpge3 = (s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;

* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;

* prop_elig_on_prep;			if s_prep_any_elig > 0 then prop_elig_on_prep = s_prep_any / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep = 0;


* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;

* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;


* p_elig_all_prep_criteria;		p_elig_all_prep_criteria = s_all_prep_criteria / s_prep_any_elig;

* p_elig_all_prep_cri_hivneg;	p_elig_all_prep_cri_hivneg = s_all_prep_criteria_hivneg / s_prep_elig_hivneg;

* p_elig_hivneg_onprep;			p_elig_hivneg_onprep = s_prep_elig_hivneg_onprep / s_prep_elig_hivneg;

* n_prep_elig;           		n_prep_elig = s_prep_elig_hivneg * &sf ;

* p_prep_elig_onprep_inj;		p_prep_elig_onprep_inj = s_prep_elig_onprep_inj / s_prep_elig_hivneg_onprep ;

* prop_1564_hivneg_onprep;		prop_1564_hivneg_onprep =   max((s_prep_any -s_hiv1_prep_any), 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_hivneg_onprep;			prop_hivneg_onprep =   max((s_prep_any -s_hiv1_prep_any), 0) / (s_alive - s_hiv) ;

* p_elig_prep;   				p_elig_prep = s_prep_any_elig / (s_alive1564 - s_hiv1564);

* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_onprep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep_any;					n_prep_any = s_prep_any * &sf;
* n_prep_oral;					n_prep_oral = s_prep_oral * &sf;
* n_prep_inj;					n_prep_inj = s_prep_inj * &sf;

* n_prep_ever;					n_prep_ever = s_prep_any_ever * &sf;
* p_prep_any_ever;				p_prep_any_ever = s_prep_any_ever / s_alive;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_any_w_1524  * &sf;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_any_w_2534  * &sf;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_any_w_3544  * &sf;

* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_any_w_1524       * &sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_any_w_2534       * &sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_any_w_3544  * &sf;

* av_prep_oral_eff_non_res_v;  	if s_prep_oral > 0 then av_prep_oral_eff_non_res_v = s_prep_oral_effect_non_res_v  / s_prep_oral;								  
																	 
* prop_art_or_prep;				prop_art_or_prep =  ( s_prep_any + s_onart - max(s_onart_as_tld_prep,0)) / s_alive ;

* n_art_or_prep;				n_art_or_prep = ( s_prep_any + s_onart - max(s_onart_as_tld_prep,0)) * &sf;

* p_prep_adhg80 ;				if s_prep_oral gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep_oral ;

* prop_prep_inj ; 				if s_prep_any > 0 then prop_prep_inj = s_prep_inj / s_prep_any ;

* ratio_inj_prep_on_tail;		if s_prep_inj > 0 then ratio_inj_prep_on_tail = s_currently_in_prep_inj_tail / s_prep_inj ;

* pr_ever_prep_inj_res_cab;		pr_ever_prep_inj_res_cab = (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail) / s_prep_inj_ever ;
* pr_ev_prep_inj_res_cab_hiv;	pr_ev_prep_inj_res_cab_hiv = (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  / s_prep_inj_ever_hiv ; 

* of people with resistance emerging on cab-la or tail, proportion on cab-la;  
* prop_cab_res_o_cab;			prop_cab_res_o_cab = s_em_inm_res_o_cab_off_3m / (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  ;
* of people with resistance emerging on cab-la or tail, proportion in tail;
* prop_cab_res_tail;			prop_cab_res_tail = s_emerge_inm_res_cab_tail / (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  ;

* of people with resistance emerging on cab-la or tail, proportion in whom it emerges in primary infection; 
* prop_cab_res_primary	;		prop_cab_res_primary = (s_em_inm_res_o_cab_off_3m_pr + s_emerge_inm_res_cab_tail_pr) / 
								(s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail) ;

* of people who initiate prep_inj in same period as primary infection, proportion developing insti resistance in the period; 
* p_prep_inj_init_prim_res;		p_prep_inj_init_prim_res = s_prep_inj_reinit_prim_res / s_prep_inj_init_prim;
* as above but including also all reinitiations of prep;
* p_prep_inj_reinit_prim_res;	p_prep_inj_reinit_prim_res = (s_prep_inj_reinit_prim_res + s_prep_inj_init_prim_res) / 
															(s_prep_inj_reinit_prim + s_prep_inj_init_prim);
* of people with hiv on cab who do not have resistance, proportion developing resistance in given period; 
* p_emerge_inm_res_cab ;		p_emerge_inm_res_cab = s_em_inm_res_o_cab_off_3m /  s_o_cab_or_o_cab_tm1_no_r;
* as above but not including people in primary infection ;
* p_emerge_inm_res_cab_notpr ; 	p_emerge_inm_res_cab_notpr = s_em_inm_res_o_cab_off_3m_npr /  
															 (s_o_cab_or_o_cab_tm1_no_r - s_o_cab_or_o_cab_tm1_no_r_prim);

* p_cab_res_emerge_primary;		p_cab_res_emerge_primary = s_cab_res_emerge_primary / s_o_cab_or_o_cab_tm1_no_r_prim ;

* p_emerge_inm_res_cab_tail_pr; p_emerge_inm_res_cab_tail_pr = s_emerge_inm_res_cab_tail_pr / s_cur_in_prep_inj_tail_prim  ; 

* number of people developing insti drug resistance when in primary infection and in the period of prep initiation or re-initiation ;
* n_prep_inj_init_reinit_prim_res;  n_prep_inj_reinit_prim_res = (s_prep_inj_reinit_prim_res + s_prep_inj_init_prim_res) * &sf;


* of people with hiv in cab tail period who do not have resistance, proportion developing resistance in given period; 
* p_emerge_inm_res_cab_tail ;	p_emerge_inm_res_cab_tail = s_emerge_inm_res_cab_tail / s_cur_in_prep_inj_tail_no_r; 

* of people on cab at time of infection, proportion developing resistance in primary infection period;
* p_emerge_inm_res_cab_prim;	p_emerge_inm_res_cab_prim = s_cab_res_prep_inj_primary / s_prep_inj_inf_or_off_3m;

* n_infected_inm;				n_infected_inm = s_infected_inm * &sf ;

* proportion of incident infections for which prep initiation or re-initiation was prevented due to positive hiv test;
* p_primary_prep_use_prevented;	p_primary_prep_use_prevented = s_prep_primary_prevented / s_primary;

* proportion of primary infections in which inm is present or arises due to cab ;
* p_cab_res_primary	;			p_cab_res_primary = s_cab_res_primary / s_primary;

* n_prep_any_start;				n_prep_any_start = s_prep_any_start * &sf; 
* n_prep_oral_start;			n_prep_oral_start = s_prep_oral_start * &sf; 
* n_prep_inj_start;				n_prep_inj_start = s_prep_inj_start * &sf; 
* n_prep_vr_start;				n_prep_vr_start = s_prep_vr_start * &sf; 

* n_start_restart_prep_inj; 		n_start_restart_prep_inj = s_start_restart_prep_inj * &sf ;
* n_start_restart_prep_inj_prim; 	n_start_restart_prep_inj_prim = s_start_restart_prep_inj_prim * &sf ;
* n_start_rest_prep_inj_hiv; 	n_start_rest_prep_inj_hiv = s_start_restart_prep_inj_hiv * &sf ;

* n_start_rest_prep_inj_hiv_cabr; 	n_start_rest_prep_inj_hiv_cabr = s_start_rest_prep_inj_hiv_cabr * &sf ;
* n_start_rest_prep_inj_prim_cabr; 	n_start_rest_prep_inj_prim_cabr = s_start_rest_prep_inj_prim_cabr * &sf ;
* n_em_inm_res_o_cab;				n_em_inm_res_o_cab = s_em_inm_res_o_cab * &sf;

* n_hiv1_prep;						n_hiv1_prep = s_hiv1_prep_any * &sf;
* n_hiv1_prep_oral;					n_hiv1_prep_oral = s_hiv1_prep_oral * &sf;
* n_hiv1_prep_inj;					n_hiv1_prep_inj = s_hiv1_prep_inj * &sf;
* p_hiv1_prep;						if s_prep_any gt 0 then p_hiv1_prep = s_hiv1_prep_any / s_prep_any ;
* p_hiv1_prep_inj;					if s_prep_inj gt 0 then p_hiv1_prep_inj = s_hiv1_prep_inj / s_prep_inj ;
* p_hiv1_prep_oral;					if s_prep_inj gt 0 then p_hiv1_prep_oral = s_hiv1_prep_oral / s_prep_oral ;

* n_infected_on_prep_inj; 			n_infected_on_prep_inj = s_infected_on_prep_inj * &sf ;
* n_em_inm_res_o_cab;				n_s_em_inm_res_o_cab = s_em_inm_res_o_cab * &sf;

* p_cabr_start_rest_prep_inj;		p_cabr_start_rest_prep_inj = s_start_rest_prep_inj_hiv_cabr / s_em_inm_res_o_cab_off_3m ;

* n_started_prep_inj_hiv;			n_started_prep_inj_hiv = s_started_prep_inj_hiv * 4 * &sf ;
* n_started_prep_any_hiv;			n_started_prep_any_hiv = s_started_prep_any_hiv * 4 * &sf ;
 
* prop_prep_tot5yrs;				prop_prep_tot5yrs = (s_tot_yrs_prep_oral_gt_5 + s_tot_yrs_prep_inj_gt_5) / (s_prep_oral_ever + s_prep_inj_ever) ;   

* n_prep_primary_prevented;		n_prep_primary_prevented = s_prep_primary_prevented * &sf;

* p_prep_primary_prevented ; 	p_prep_primary_prevented = s_prep_primary_prevented /(s_prep_reinit_primary + s_prep_init_primary + s_prep_primary_prevented);


* prop_cab_dol_res_attr_cab ;	prop_cab_dol_res_attr_cab = (s_cab_res_o_cab + s_cab_res_tail + s_cab_res_primary) / s_cur_res_cab ;

* prop_prep_inj_at_inf_diag;	if s_prep_inj_at_infection + s_diagprim_prep_inj > 0 then prop_prep_inj_at_inf_diag =  s_diagprim_prep_inj /  (s_prep_inj_at_infection + s_diagprim_prep_inj);

* n_o_cab_at_3m;				n_o_cab_at_3m = s_hiv_cab_3m * &sf;  
* n_o_cab_at_6m;				n_o_cab_at_6m = s_hiv_cab_6m * &sf;  
* n_o_cab_at_9m;				n_o_cab_at_9m = s_hiv_cab_9m * &sf;  
* n_o_cab_at_ge12m;				n_o_cab_at_ge12m = s_hiv_cab_ge12m * &sf;  

* of_all_o_cab_prop_dur_3m ;    if s_hiv_cab > 0 then of_all_o_cab_prop_dur_3m = s_hiv_cab_3m / s_hiv_cab ;
* of_all_o_cab_prop_dur_6m ;    if s_hiv_cab > 0 then of_all_o_cab_prop_dur_6m = s_hiv_cab_6m / s_hiv_cab ;
* of_all_o_cab_prop_dur_9m;  	if s_hiv_cab > 0 then of_all_o_cab_prop_dur_9m = s_hiv_cab_9m / s_hiv_cab ;
* of_all_o_cab_prop_dur_ge12m ; if s_hiv_cab > 0 then of_all_o_cab_prop_dur_ge12m = s_hiv_cab_ge12m / s_hiv_cab ;

* p_prep_inj_hiv;				if s_prep_inj > 0 then p_prep_inj_hiv = s_hiv_cab / s_prep_inj ; 
								  
* n_emerge_inm_res_cab ;		n_emerge_inm_res_cab = s_emerge_inm_res_cab * &sf;
* p_em_inm_res_ever_prep_inj ;	p_em_inm_res_ever_prep_inj = s_emerge_inm_res_cab / s_prep_inj_ever ;

* n_switch_prep_from_oral ; 	n_switch_prep_from_oral = s_switch_prep_from_oral  * &sf;
* n_switch_prep_from_inj ;		n_switch_prep_from_inj = s_switch_prep_from_inj * &sf ;
* n_switch_prep_to_oral ; 		n_switch_prep_to_oral = s_switch_prep_to_oral * &sf ;
* n_switch_prep_to_inj ;		n_switch_prep_to_inj = s_switch_prep_to_inj * &sf ;

* n_cur_res_cab;				n_cur_res_cab = s_cur_res_cab * &sf ;
* n_cur_res_dol;				n_cur_res_dol = s_iime_ * &sf ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;

* ts1m - below change 4 to 12;

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* incidence1564;                incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
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

* incidence_onprep ; 			if s_prep_any > 0 then incidence_onprep  = (s_primary_prep * 4 * 100) / s_prep_any ;

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

* prevalence1524w;				prevalence1524w =  s_hiv1524w  / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m =  s_hiv1524m  / (s_ageg1519m + s_ageg2024m) ;

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

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
* n_inf_primary;				n_inf_primary = s_inf_primary * &sf * 4;

*The meaning of the following is: among newly infected people, which proportion are SW, etc..;
* p_sw_newinf;				    p_sw_newinf = s_primary_sw / s_primary;		
* p_w1524_newinf;				p_w1524_newinf = sum(s_primary1519w,s_primary2024w) / s_primary;
* p_w25ov_newinf;				p_w25ov_newinf = sum(s_primary2529w,s_primary3034w,s_primary3539w,s_primary4044w,s_primary4549w,s_primary5054w,s_primary5559w,s_primary6064w) / s_primary;		
* p_m1524_newinf;				p_m1524_newinf = sum(s_primary1519m,s_primary2024m) / s_primary;
* p_m25ov_newinf;				p_m25ov_newinf = sum(s_primary2529m,s_primary3034m,s_primary3539m,s_primary4044m,s_primary4549m,s_primary5054m,s_primary5559m,s_primary6064m) / s_primary;		
								end;

* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv     ;  
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
* p_ai_no_arv_e_inm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_e_inm = s_ai_naive_no_pmtct_e_inm_ / s_ai_naive_no_pmtct_;
* n_ai_naive_no_pmtct_e_inm;    n_ai_naive_no_pmtct_e_inm = s_ai_naive_no_pmtct_e_inm_ * &sf;


/*

proc sort; by option;
proc means; var p_ai_no_arv_e_inm ; by option;
where cald ge 2043 and res_trans_factor_ii=1;
run;

*/

* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if s_hivge15 gt 0 then p_onart = s_onart / s_hivge15; 

* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;
* n_onart  ;					n_onart   = s_onart   * &sf;

* p_nactive_art_start_lt2;		if s_art_start > 0 then p_nactive_art_start_lt2 = s_nactive_art_start_lt2 / s_art_start ; 
* p_nactive_art_start_lt3;		if s_art_start > 0 then p_nactive_art_start_lt3 = s_nactive_art_start_lt3 / s_art_start ; 
* p_nactive_art_start_lt1p5;	if s_art_start > 0 then p_nactive_art_start_lt1p5 = s_nactive_art_start_lt1p5 / s_art_start ; 

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

* p_u_vfail1_this_period;		p_u_vfail1_this_period = s_u_vfail1_this_period / (s_onart - s_u_vfail1);

* p_k65m;						if s_hivge15 gt 0 then p_k65m = s_k65m_ / s_hivge15 ;
* p_m184m;						if s_hivge15 gt 0 then p_m184m = s_m184m_ / s_hivge15 ;

* p_k65m_all;					p_k65m_all = s_k65m_ / (s_alive_w + s_alive_m) ;
* p_m184m_all;					p_m184m_all = s_m184m_ / (s_alive_w + s_alive_m) ;
* n_k65m;						n_k65m = s_k65m_ * &sf;

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

			n_dead_hivpos_cause1 = s_dead_hivpos_cause1 * 4 * &sf; 
			rate_dead_hivpos_cause1 = (s_dead_hivpos_cause1 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_tb = s_dead_hivpos_tb  * 4* &sf; 
			rate_dead_hivpos_tb = (s_dead_hivpos_tb * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause4 = s_dead_hivpos_cause4  * 4* &sf; 
			rate_dead_hivpos_cause4 = (s_dead_hivpos_cause4 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_crypm = s_dead_hivpos_crypm  * 4* &sf; 
			rate_dead_hivpos_crypm = (s_dead_hivpos_crypm * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_sbi = s_dead_hivpos_sbi  * 4* &sf; 
			rate_dead_hivpos_sbi = (s_dead_hivpos_sbi * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_oth_adc = s_dead_hivpos_oth_adc  * 4* &sf; 
			rate_dead_hivpos_oth_adc = (s_dead_hivpos_oth_adc * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause2 = s_dead_hivpos_cause2  * 4* &sf; 
			rate_dead_hivpos_cause2 = (s_dead_hivpos_cause2 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause3 = s_dead_hivpos_cause3  * 4* &sf; 
			rate_dead_hivpos_cause3 = (s_dead_hivpos_cause3 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cvd = s_dead_hivpos_cvd  * 4* &sf; 
			rate_dead_hivpos_cvd = (s_dead_hivpos_cvd * 4 * 100) / s_hivge15 ;
			n_dead_cvd = s_dead_cvd  * 4* &sf; 
			rate_dead_cvd = (s_dead_cvd * 4 * 100) / s_alive ;
			n_dead_tb = s_dead_tb  * 4* &sf; 
			rate_dead_tb = (s_dead_tb * 4 * 100) / s_alive ;
			n_dead_hivneg_cvd = s_dead_hivneg_cvd  * 4* &sf; 
			rate_dead_hivneg_cvd = (s_dead_hivneg_cvd * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_tb = s_dead_hivneg_tb  * 4* &sf; 
			rate_dead_hivneg_tb = (s_dead_hivneg_tb * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause2 = s_dead_hivneg_cause2  * 4* &sf; 
			rate_dead_hivneg_cause2 = (s_dead_hivneg_cause2 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause3 = s_dead_hivneg_cause3  * 4* &sf; 
			rate_dead_hivneg_cause3 = (s_dead_hivneg_cause3 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause4 = s_dead_hivneg_cause4  * 4* &sf; 
			rate_dead_hivneg_cause4 = (s_dead_hivneg_cause4 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause5 = s_dead_hivneg_cause5  * 4* &sf; 
			rate_dead_hivneg_cause5 = (s_dead_hivneg_cause5 * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_allage = (s_dead_allage * 4 * 100) / s_alive ;
			rate_dead_hivneg_anycause = (s_dead_hivneg_anycause * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_hivpos_anycause = (s_dead_hivpos_anycause * 4 * 100) / s_hivge15 ;

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


* n_death_hiv;					n_death_hiv = s_death_hiv  * 4* &sf;
* n_death_covid;				n_death_covid = s_death_dcause3_allage  * 4* &sf;
* n_death;						n_death = s_dead  * 4 * &sf;
* n_covid;						n_covid = s_covid  * 4 * &sf;
* n_death_hivneg_anycause;		n_death_hivneg_anycause = s_dead_hivneg_anycause  * 4 * &sf;
* n_death_hivpos_anycause;		n_death_hivpos_anycause = s_dead_hivpos_anycause  * 4 * &sf;

* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
													
* n_cd4_lt200;					n_cd4_lt200 = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * &sf; 

* n_cd4_lt50;					n_cd4_lt50 = s_cd4_g1 * &sf; 
* n_hiv;						n_hiv = s_hivge15 * &sf;
* n_alive;						n_alive = s_alive * &sf;

* n_art_initiation;				n_art_initiation = s_art_initiation * 4 * &sf;
* n_restart;					n_restart = s_restart * 4 * &sf;
* n_line1_fail_this_period;		n_line1_fail_this_period = s_line1_fail_this_period * 4 * &sf;

* n_need_cd4m;					n_need_cd4m = n_art_initiation + n_restart + n_line1_fail_this_period;
 
inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* number of women with hiv giving birth per year;

n_give_birth_w_hiv = s_give_birth_with_hiv * &sf * 4;
n_birth_with_inf_child = s_birth_with_inf_child * &sf * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * &sf * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * &sf * 4;  * annual number;
n_new_vmmc1549_ = s_mcirc_1549m * &sf * 4;
n_new_vmmc1549_3m = s_mcirc_1549m * &sf;
n_vmmc1549_ = s_vmmc1549m * &sf * 4;
n_vmmc1549_3m = s_vmmc1549m * &sf;
n_new_inf1549m = s_primary1549m * &sf * 4;
n_new_inf1549w = s_primary1549w * &sf * 4;
n_new_inf1549 = s_primary1549 * &sf * 4;
n_infection  = s_primary     * &sf * 4;


keep 

run cald option
s_alive p_w_giv_birth_this_per p_newp_ge1 n_newp_ge1 p_newp_ge5   gender_r_newp p_newp_sw prop_sw_newp0  p_newp_prep  dcost  dart_cost_y
dcost_prep_visit dres_cost     dtest_cost    d_t_adh_int_cost    dswitchline_cost   dtaz_cost   dclin_cost  dcost_circ dcost_condom_dn 
dcost_prep_visit_oral dcost_prep_visit_inj   dcost_prep  dcost_clin_care  dcost_non_aids_pre_death  dcost_child_hiv  dnon_tb_who3_cost
dadc_cost       dcd4_cost       dvl_cost       dvis_cost        dcot_cost       dtb_cost    n_hiv  ddcp_cost
n_tested_m p_tested_past_year_1549m   p_tested_past_year_1549w  p_mcirc  prop_w_1549_sw prop_w_1564_sw prop_w_ever_sw prop_sw_hiv 
prop_sw_program_visit prop_w_1524_onprep prop_1564_onprep prop_sw_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence_vg1000 incidence1549  incidence1564  prevalence1524w prevalence_sw incidence1549w  incidence1549m  incidence_sw incidence_onprep
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary mtct_prop p_diag p_diag_m p_diag_w p_diag_sw
p_ai_no_arv_c_nnm p_ai_no_arv_c_pim p_ai_no_arv_c_rt184m p_ai_no_arv_c_rt65m p_ai_no_arv_c_rttams  p_k65m  p_m184m
p_ai_no_arv_e_inm p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw p_efa p_taz
p_ten p_zdv p_dol p_3tc p_lpr p_nev p_onart_vl1000  p_artexp_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m p_vl1000_art_12m_onart  p_onart_vl1000_w p_onart_vl1000_m  p_startedline2 p_linefail_ge1 m15r  m25r  m35r  m45r  m55r  w15r  
w25r  w35r  w45r  w55r p_onart_cd4_l500  prop_art_or_prep  prop_prep_tot5yrs prop_sw_onprep   p_onart p_nactive_ge2p00_xyz   p_nactive_ge1p50_xyz death_rate_hiv 
death_rate_hiv_m death_rate_hiv_w death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w p_iime n_infected_inm 
n_tested n_tested_sw test_prop_positive p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  
p_prep_any_ever p_hiv1_prep  p_hiv1_prep_inj p_hiv1_prep_oral   incidence1524w  incidence_sw p_onart_w p_onart_m  p_diag_w p_diag_m p_onart_vl1000 n_tested_w test_prop_positive
prop_prep_inj   ratio_inj_prep_on_tail    pr_ever_prep_inj_res_cab    pr_ev_prep_inj_res_cab_hiv prop_cab_res_o_cab    prop_cab_res_tail    
prop_prep_inj_at_inf_diag   of_all_o_cab_prop_dur_3m of_all_o_cab_prop_dur_6m   p_prep_inj_hiv  prop_cab_dol_res_attr_cab   
n_cur_res_cab  n_cur_res_dol  n_emerge_inm_res_cab  n_switch_prep_from_oral n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_any_start n_prep_oral_start  n_prep_inj_start n_prep_vr_start n_prep_any prop_elig_on_prep p_elig_prep  p_hiv1_prep  prop_onprep_newpge1 
p_prep_elig_past_year p_prep_newp prop_sw_onprep  n_prep_elig  n_prep_oral 
p_em_inm_res_ever_prep_inj n_o_cab_at_3m    n_o_cab_at_6m    n_o_cab_at_9m   n_o_cab_at_ge12m 
ddaly daly_ac_mtct p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail of_all_o_cab_prop_dur_9m of_all_o_cab_prop_dur_ge12m
s_em_inm_res_o_cab_off_3m  s_o_cab_or_o_cab_tm1_no_r   s_emerge_inm_res_cab_tail   s_cur_in_prep_inj_tail_no_r  p_emerge_inm_res_cab 
p_cabr_start_rest_prep_inj p_emerge_inm_res_cab_tail  n_death_hiv death_rate_onart n_birth_with_inf_child  p_u_vfail1_this_period n_infection n_inf_primary
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented ddaly_ac_ntd_mtct
dcost_prep  n_art_initiation  n_restart  dcost_prep_oral  dcost_prep_inj  n_line1_fail_this_period  n_need_cd4m  n_alive

prop_1564_hivneg_onprep  p_newp_prep_hivneg cost n_cd4_lt200 n_cd4_lt200 aids_death_rate  death_rate_onart  death_rate_artexp  
death_rate_hiv death_rate_hiv_all  n_onart  n_art_or_prep n_prep_inj n_death_hivneg_anycause

p_elig_all_prep_criteria  p_elig_all_prep_cri_hivneg  p_elig_hivneg_onprep  p_prep_elig_onprep_inj n_start_rest_prep_inj_hiv  prop_hivneg_onprep
n_started_prep_inj_hiv n_started_prep_any_hiv   p_prep_adhg80  n_em_inm_res_o_cab

p_nactive_art_start_lt1p5 p_nactive_art_start_lt2  p_nactive_art_start_lt3  n_ai_naive_no_pmtct_e_inm

n_ever_vaccinated  p_agege15_ever_vaccinated  p_current_full_vaccine_eff  p_current_half_vaccine_eff  p_current_any_vaccine_eff
p_current_full_vac_e_1564 p_current_half_vac_e_1564  p_current_any_vac_e_1564

&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop  super_inf_res  an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr fold_tr_newp switch_for_tox  
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

effect_sw_prog_prep_any  prob_prep_any_restart_choice 
adh_pattern_prep_oral   rate_test_startprep_any    rate_choose_stop_prep_oral
prep_any_strategy   prob_prep_any_visit_counsel  rate_test_onprep_any  prep_willingness_threshold  
prob_prep_any_restart_choice  future_prep_condom
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy    
higher_future_prep_oral_cov  pr_prep_inj_b  prep_inj_efficacy
rate_choose_stop_prep_inj   prep_inj_effect_inm_partner  res_trans_factor_ii
rel_pr_inm_inj_prep_tail_primary      rr_res_cab_dol  hivtest_type_1_init_prep_inj   hivtest_type_1_prep_inj
sens_ttype1_prep_inj_primary sens_ttype1_prep_inj_inf3m sens_ttype1_prep_inj_infge6m
sens_ttype3_prep_inj_primary sens_ttype3_prep_inj_inf3m sens_ttype3_prep_inj_infge6m

effect_sw_prog_prep_any prob_prep_any_restart_choice dol_higher_potency  cab_time_to_lower_threshold_g
sens_tests_prep_inj  pr_inm_inj_prep_primary
pref_prep_inj_beta_s1  testt1_prep_inj_eff_on_res_prim  incr_res_risk_cab_inf_3m  reg_option_107_after_cab

p_emerge_inm_res_cab_notpr

rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_0_to_1 prob_onartvis_1_to_0

pref_prep_oral_beta_s1  res_level_dol_cab_mut  pr_res_dol  vaccine_efficacy  vaccine_duration_effect

n_alive
n_prep_elig
n_prep_oral
n_prep_inj
n_newp_ge1
n_ep 
n_new_vmmc 
incidence1549 
n_hiv_death 
p_vl1000 
n_ever_vaccinated 
n_cur_full_vaccine_efficacy 
n_any_cur_vaccine_efficacy 
n_vaccinated_this_year 
n_boosted_this_year 
n_ddaly
;



proc sort data=y;by run option;run;

* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;


* check on when branching to options occurs;
proc freq; tables cald option; where cald=2039.00;
proc freq; tables cald option; where cald=2039.25;
proc freq; tables cald option; where cald=2039.50;
proc freq; tables cald option; where cald=2039.75;
proc freq; tables cald option; where cald=2040.00;
proc freq; tables cald option; where cald=2040.25;
proc freq; tables cald option; where cald=2040.50;
run;


data    b.l_vaccine_n_b_output_file; set y;  

data y ; set b.l_vaccine_n_b_output_file; 

  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;


%macro var(v=);

* &v ;

data e; set y; keep &v run cald option ;

proc means  noprint data=e; var &v; output out=y_24 mean= &v._24; by run ; where 2024.0 <= cald <= 2024.25; 

proc means  noprint data=e; var &v; output out=y_39 mean= &v._39; by run ; where 2039.0 <= cald <= 2040.0; 

proc means  noprint data=e; var &v; output out=y_40 mean= &v._40; by run  option ; where 2040.0 <= cald <  2041.0; 
proc means  noprint data=e; var &v; output out=y_41 mean= &v._41; by run  option ; where 2041.0 <= cald <  2042.0; 
proc means  noprint data=e; var &v; output out=y_42 mean= &v._42; by run  option ; where 2042.0 <= cald <  2043.0; 
proc means  noprint data=e; var &v; output out=y_43 mean= &v._43; by run  option ; where 2043.0 <= cald <  2044.0; 
proc means  noprint data=e; var &v; output out=y_44 mean= &v._44; by run  option ; where 2044.0 <= cald <  2045.0; 
proc means  noprint data=e; var &v; output out=y_45 mean= &v._45; by run  option ; where 2045.0 <= cald <  2046.0; 
proc means  noprint data=e; var &v; output out=y_46 mean= &v._46; by run  option ; where 2046.0 <= cald <  2047.0; 
proc means  noprint data=e; var &v; output out=y_47 mean= &v._47; by run  option ; where 2047.0 <= cald <  2048.0; 
proc means  noprint data=e; var &v; output out=y_48 mean= &v._48; by run  option ; where 2048.0 <= cald <  2049.0; 
proc means  noprint data=e; var &v; output out=y_49 mean= &v._49; by run  option ; where 2049.0 <= cald <  2050.0; 
proc means  noprint data=e; var &v; output out=y_50 mean= &v._50; by run  option ; where 2050.0 <= cald <  2051.0; 
proc means  noprint data=e; var &v; output out=y_51 mean= &v._51; by run  option ; where 2051.0 <= cald <  2052.0; 
proc means  noprint data=e; var &v; output out=y_52 mean= &v._52; by run  option ; where 2052.0 <= cald <  2053.0; 
proc means  noprint data=e; var &v; output out=y_53 mean= &v._53; by run  option ; where 2053.0 <= cald <  2054.0; 
proc means  noprint data=e; var &v; output out=y_54 mean= &v._54; by run  option ; where 2054.0 <= cald <  2055.0; 
proc means  noprint data=e; var &v; output out=y_55 mean= &v._55; by run  option ; where 2055.0 <= cald <  2056.0; 
proc means  noprint data=e; var &v; output out=y_56 mean= &v._56; by run  option ; where 2056.0 <= cald <  2057.0; 
proc means  noprint data=e; var &v; output out=y_57 mean= &v._57; by run  option ; where 2057.0 <= cald <  2058.0; 
proc means  noprint data=e; var &v; output out=y_58 mean= &v._58; by run  option ; where 2058.0 <= cald <  2059.0; 
proc means  noprint data=e; var &v; output out=y_59 mean= &v._59; by run  option ; where 2059.0 <= cald <  2060.0; 
proc means  noprint data=e; var &v; output out=y_60 mean= &v._60; by run  option ; where 2060.0 <= cald <  2061.0; 
proc means  noprint data=e; var &v; output out=y_61 mean= &v._61; by run  option ; where 2061.0 <= cald <  2062.0; 
proc means  noprint data=e; var &v; output out=y_62 mean= &v._62; by run  option ; where 2062.0 <= cald <  2063.0; 
proc means  noprint data=e; var &v; output out=y_63 mean= &v._63; by run  option ; where 2063.0 <= cald <  2064.0; 
proc means  noprint data=e; var &v; output out=y_64 mean= &v._64; by run  option ; where 2064.0 <= cald <  2065.0; 
proc means  noprint data=e; var &v; output out=y_65 mean= &v._65; by run  option ; where 2065.0 <= cald <  2066.0; 
proc means  noprint data=e; var &v; output out=y_66 mean= &v._66; by run  option ; where 2066.0 <= cald <  2067.0; 
proc means  noprint data=e; var &v; output out=y_67 mean= &v._67; by run  option ; where 2067.0 <= cald <  2068.0; 
proc means  noprint data=e; var &v; output out=y_68 mean= &v._68; by run  option ; where 2068.0 <= cald <  2069.0; 
proc means  noprint data=e; var &v; output out=y_69 mean= &v._69; by run  option ; where 2069.0 <= cald <  2070.0; 
proc means  noprint data=e; var &v; output out=y_70 mean= &v._70; by run  option ; where 2070.0 <= cald <  2071.0; 

proc means noprint data=e; var &v; output out=y_30y mean= &v._30y; by run option ; where 2040.0 <= cald < 2070.00;   
																				   
proc sort data=y_30y    ; by run; proc transpose data=y_30y  out=t_30y  prefix=&v._30y_  ; var &v._30y    ; by run; 																																																						

proc sort data=y_40     ; by run; proc transpose data=y_40   out=t_40   prefix=&v._40_  ; var &v._40     ; by run; 																																																						
proc sort data=y_41     ; by run; proc transpose data=y_41   out=t_41   prefix=&v._41_  ; var &v._41     ; by run; 																																																						
proc sort data=y_42     ; by run; proc transpose data=y_42   out=t_42   prefix=&v._42_  ; var &v._42     ; by run; 																																																						
proc sort data=y_43     ; by run; proc transpose data=y_43   out=t_43   prefix=&v._43_  ; var &v._43     ; by run; 																																																						
proc sort data=y_44     ; by run; proc transpose data=y_44   out=t_44   prefix=&v._44_  ; var &v._44     ; by run; 																																																						
proc sort data=y_45     ; by run; proc transpose data=y_45   out=t_45   prefix=&v._45_  ; var &v._45     ; by run; 																																																						
proc sort data=y_46     ; by run; proc transpose data=y_46   out=t_46   prefix=&v._46_  ; var &v._46     ; by run; 																																																						
proc sort data=y_47     ; by run; proc transpose data=y_47   out=t_47   prefix=&v._47_  ; var &v._47     ; by run; 																																																						
proc sort data=y_48     ; by run; proc transpose data=y_48   out=t_48   prefix=&v._48_  ; var &v._48     ; by run; 																																																						
proc sort data=y_49     ; by run; proc transpose data=y_49   out=t_49   prefix=&v._49_  ; var &v._49     ; by run; 																																																						
proc sort data=y_50     ; by run; proc transpose data=y_50   out=t_50   prefix=&v._50_  ; var &v._50     ; by run; 																																																						
proc sort data=y_51     ; by run; proc transpose data=y_51   out=t_51   prefix=&v._51_  ; var &v._51     ; by run; 																																																						
proc sort data=y_52     ; by run; proc transpose data=y_52   out=t_52   prefix=&v._52_  ; var &v._52     ; by run; 																																																						
proc sort data=y_53     ; by run; proc transpose data=y_53   out=t_53   prefix=&v._53_  ; var &v._53     ; by run; 																																																						
proc sort data=y_54     ; by run; proc transpose data=y_54   out=t_54   prefix=&v._54_  ; var &v._54     ; by run; 																																																						
proc sort data=y_55     ; by run; proc transpose data=y_55   out=t_55   prefix=&v._55_  ; var &v._55     ; by run; 																																																						
proc sort data=y_56     ; by run; proc transpose data=y_56   out=t_56   prefix=&v._56_  ; var &v._56     ; by run; 																																																						
proc sort data=y_57     ; by run; proc transpose data=y_57   out=t_57   prefix=&v._57_  ; var &v._57     ; by run; 																																																						
proc sort data=y_58     ; by run; proc transpose data=y_58   out=t_58   prefix=&v._58_  ; var &v._58     ; by run; 																																																						
proc sort data=y_59     ; by run; proc transpose data=y_59   out=t_59   prefix=&v._59_  ; var &v._59     ; by run; 																																																						
proc sort data=y_60     ; by run; proc transpose data=y_60   out=t_60   prefix=&v._60_  ; var &v._60     ; by run; 																																																						
proc sort data=y_61     ; by run; proc transpose data=y_61   out=t_61   prefix=&v._61_  ; var &v._61     ; by run; 																																																						
proc sort data=y_62     ; by run; proc transpose data=y_62   out=t_62   prefix=&v._62_  ; var &v._62     ; by run; 																																																						
proc sort data=y_63     ; by run; proc transpose data=y_63   out=t_63   prefix=&v._63_  ; var &v._63     ; by run; 																																																						
proc sort data=y_64     ; by run; proc transpose data=y_64   out=t_64   prefix=&v._64_  ; var &v._64     ; by run; 																																																						
proc sort data=y_65     ; by run; proc transpose data=y_65   out=t_65   prefix=&v._65_  ; var &v._65     ; by run; 																																																						
proc sort data=y_66     ; by run; proc transpose data=y_66   out=t_66   prefix=&v._66_  ; var &v._66     ; by run; 																																																						
proc sort data=y_67     ; by run; proc transpose data=y_67   out=t_67   prefix=&v._67_  ; var &v._67     ; by run; 																																																						
proc sort data=y_68     ; by run; proc transpose data=y_68   out=t_68   prefix=&v._68_  ; var &v._68     ; by run; 																																																						
proc sort data=y_69     ; by run; proc transpose data=y_69   out=t_69   prefix=&v._69_  ; var &v._69     ; by run; 																																																						
proc sort data=y_70     ; by run; proc transpose data=y_70   out=t_70   prefix=&v._70_  ; var &v._70     ; by run; 																																																						

data &v ; merge y_24 t_30y y_39 t_40 t_41 t_42 t_43 t_44 t_45 t_46 t_47 t_48 t_49 t_50 t_51 t_52 t_53 t_54 t_55 t_56 t_57 t_58 t_59 t_60 
t_61 t_62 t_63 t_64 t_65 t_66 t_67 t_68 t_69 t_70 ;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var; 

%var(v=n_alive); 
%var(v=n_prep_elig); 
%var(v=n_prep_oral); 
%var(v=n_prep_inj); 
%var(v=n_newp_ge1); 
%var(v=n_ep); 
%var(v=n_new_vmmc); 
%var(v=incidence1549); 
%var(v=n_hiv_death); 
%var(v=p_vl1000); 
%var(v=n_ever_vaccinated); 
%var(v=n_cur_full_vaccine_efficacy); 
%var(v=n_any_cur_vaccine_efficacy); 
%var(v=n_vaccinated_this_year); 
%var(v=n_boosted_this_year); 
%var(v=n_ddaly); 
;

data   b.wide_outputs; merge 

n_alive
n_prep_elig
n_prep_oral
n_prep_inj
n_newp_ge1
n_ep 
n_new_vmmc 
incidence1549 
n_hiv_death 
p_vl1000 
n_ever_vaccinated 
n_cur_full_vaccine_efficacy 
n_any_cur_vaccine_efficacy 
n_vaccinated_this_year 
n_boosted_this_year 
n_ddaly 
;

proc contents; run; 



proc sort; by run; run;

***Macro par used to add in values of all sampled parameters - values before intervention;
data f; set y; 
if cald=2040;

keep 

run cald 

&sf 
;

%macro par(p=);

* &p ;
proc means noprint data=f; var &p ; output out=y_ mean= &p; by run ; where cald = 2040; run;


data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=&sf); 

data b.wide_par2; merge 

&sf 
;

run;
proc sort; by run;run;




libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\vaccine\vaccine_n_b_keep_prep_out\";


* To get one row per run;

  data  b.w_vaccine_n_b_output_file     ; 
  merge b.wide_outputs   b.wide_par2    ;
  by run;

  data e; set b.w_vaccine_n_b_output_file ;



* n_prep_inj;
%macro median_n_prep_inj(y=);data ee; set e;keep n_prep_inj_&y._1 ; 
proc means noprint p50 data = e ;var n_prep_inj_&y._1 ;output out=n_prep_inj_&y._1 median = median_n_prep_inj_no_vac_&y. ; %mend;
%median_n_prep_inj(y=40);%median_n_prep_inj(y=41);%median_n_prep_inj(y=42);%median_n_prep_inj(y=43);
%median_n_prep_inj(y=44);%median_n_prep_inj(y=45);%median_n_prep_inj(y=46);%median_n_prep_inj(y=47);%median_n_prep_inj(y=48);%median_n_prep_inj(y=49);
%median_n_prep_inj(y=50);%median_n_prep_inj(y=51);%median_n_prep_inj(y=52);%median_n_prep_inj(y=53);%median_n_prep_inj(y=54);%median_n_prep_inj(y=55);
%median_n_prep_inj(y=56);%median_n_prep_inj(y=57);%median_n_prep_inj(y=58);%median_n_prep_inj(y=59);%median_n_prep_inj(y=60);%median_n_prep_inj(y=61);
%median_n_prep_inj(y=62);%median_n_prep_inj(y=63);%median_n_prep_inj(y=64);%median_n_prep_inj(y=65);%median_n_prep_inj(y=66);%median_n_prep_inj(y=67);
%median_n_prep_inj(y=68);%median_n_prep_inj(y=69);%median_n_prep_inj(y=70);
data n_prep_inj_1; merge n_prep_inj_40_1 n_prep_inj_41_1 n_prep_inj_42_1 n_prep_inj_43_1 n_prep_inj_44_1 n_prep_inj_45_1 n_prep_inj_46_1 n_prep_inj_47_1
n_prep_inj_48_1 n_prep_inj_49_1 n_prep_inj_50_1 n_prep_inj_51_1 n_prep_inj_52_1 n_prep_inj_53_1 n_prep_inj_54_1 n_prep_inj_55_1 n_prep_inj_56_1 n_prep_inj_57_1
n_prep_inj_58_1 n_prep_inj_59_1 n_prep_inj_60_1 n_prep_inj_61_1 n_prep_inj_62_1 n_prep_inj_63_1 n_prep_inj_64_1 n_prep_inj_65_1 n_prep_inj_66_1 n_prep_inj_67_1  
n_prep_inj_68_1 n_prep_inj_69_1 n_prep_inj_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_prep_inj(y=);data ee; set e;keep n_prep_inj_&y._3 ; 
proc means noprint p50 data = e ;var n_prep_inj_&y._3 ;output out=n_prep_inj_&y._3 median = median_n_prep_inj_vac_&y. ; %mend;
%median_n_prep_inj(y=40);%median_n_prep_inj(y=41);%median_n_prep_inj(y=42);%median_n_prep_inj(y=43);
%median_n_prep_inj(y=44);%median_n_prep_inj(y=45);%median_n_prep_inj(y=46);%median_n_prep_inj(y=47);%median_n_prep_inj(y=48);%median_n_prep_inj(y=49);
%median_n_prep_inj(y=50);%median_n_prep_inj(y=51);%median_n_prep_inj(y=52);%median_n_prep_inj(y=53);%median_n_prep_inj(y=54);%median_n_prep_inj(y=55);
%median_n_prep_inj(y=56);%median_n_prep_inj(y=57);%median_n_prep_inj(y=58);%median_n_prep_inj(y=59);%median_n_prep_inj(y=60);%median_n_prep_inj(y=61);
%median_n_prep_inj(y=62);%median_n_prep_inj(y=63);%median_n_prep_inj(y=64);%median_n_prep_inj(y=65);%median_n_prep_inj(y=66);%median_n_prep_inj(y=67);
%median_n_prep_inj(y=68);%median_n_prep_inj(y=69);%median_n_prep_inj(y=70);
data n_prep_inj_3; merge n_prep_inj_40_3 n_prep_inj_41_3 n_prep_inj_42_3 n_prep_inj_43_3 n_prep_inj_44_3 n_prep_inj_45_3 n_prep_inj_46_3 n_prep_inj_47_3
n_prep_inj_48_3 n_prep_inj_49_3 n_prep_inj_50_3 n_prep_inj_51_3 n_prep_inj_52_3 n_prep_inj_53_3 n_prep_inj_54_3 n_prep_inj_55_3 n_prep_inj_56_3 n_prep_inj_57_3
n_prep_inj_58_3 n_prep_inj_59_3 n_prep_inj_60_3 n_prep_inj_61_3 n_prep_inj_62_3 n_prep_inj_63_3 n_prep_inj_64_3 n_prep_inj_65_3 n_prep_inj_66_3 n_prep_inj_67_3 
n_prep_inj_68_3 n_prep_inj_69_3 n_prep_inj_70_3;drop _TYPE_ _FREQ_;



* n_alive;
%macro median_n_alive(y=);data ee; set e;keep n_alive_&y._1 ; 
proc means noprint p50 data = e ;var n_alive_&y._1 ;output out=n_alive_&y._1 median = median_n_alive_no_vac_&y. ; %mend;
%median_n_alive(y=40);%median_n_alive(y=41);%median_n_alive(y=42);%median_n_alive(y=43);
%median_n_alive(y=44);%median_n_alive(y=45);%median_n_alive(y=46);%median_n_alive(y=47);%median_n_alive(y=48);%median_n_alive(y=49);
%median_n_alive(y=50);%median_n_alive(y=51);%median_n_alive(y=52);%median_n_alive(y=53);%median_n_alive(y=54);%median_n_alive(y=55);
%median_n_alive(y=56);%median_n_alive(y=57);%median_n_alive(y=58);%median_n_alive(y=59);%median_n_alive(y=60);%median_n_alive(y=61);
%median_n_alive(y=62);%median_n_alive(y=63);%median_n_alive(y=64);%median_n_alive(y=65);%median_n_alive(y=66);%median_n_alive(y=67);
%median_n_alive(y=68);%median_n_alive(y=69);%median_n_alive(y=70);
data n_alive_1; merge n_alive_40_1 n_alive_41_1 n_alive_42_1 n_alive_43_1 n_alive_44_1 n_alive_45_1 n_alive_46_1 n_alive_47_1
n_alive_48_1 n_alive_49_1 n_alive_50_1 n_alive_51_1 n_alive_52_1 n_alive_53_1 n_alive_54_1 n_alive_55_1 n_alive_56_1 n_alive_57_1
n_alive_58_1 n_alive_59_1 n_alive_60_1 n_alive_61_1 n_alive_62_1 n_alive_63_1 n_alive_64_1 n_alive_65_1 n_alive_66_1 n_alive_67_1  
n_alive_68_1 n_alive_69_1 n_alive_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_alive(y=);data ee; set e;keep n_alive_&y._3 ; 
proc means noprint p50 data = e ;var n_alive_&y._3 ;output out=n_alive_&y._3 median = median_n_alive_vac_&y. ; %mend;
%median_n_alive(y=40);%median_n_alive(y=41);%median_n_alive(y=42);%median_n_alive(y=43);
%median_n_alive(y=44);%median_n_alive(y=45);%median_n_alive(y=46);%median_n_alive(y=47);%median_n_alive(y=48);%median_n_alive(y=49);
%median_n_alive(y=50);%median_n_alive(y=51);%median_n_alive(y=52);%median_n_alive(y=53);%median_n_alive(y=54);%median_n_alive(y=55);
%median_n_alive(y=56);%median_n_alive(y=57);%median_n_alive(y=58);%median_n_alive(y=59);%median_n_alive(y=60);%median_n_alive(y=61);
%median_n_alive(y=62);%median_n_alive(y=63);%median_n_alive(y=64);%median_n_alive(y=65);%median_n_alive(y=66);%median_n_alive(y=67);
%median_n_alive(y=68);%median_n_alive(y=69);%median_n_alive(y=70);
data n_alive_3; merge n_alive_40_3 n_alive_41_3 n_alive_42_3 n_alive_43_3 n_alive_44_3 n_alive_45_3 n_alive_46_3 n_alive_47_3
n_alive_48_3 n_alive_49_3 n_alive_50_3 n_alive_51_3 n_alive_52_3 n_alive_53_3 n_alive_54_3 n_alive_55_3 n_alive_56_3 n_alive_57_3
n_alive_58_3 n_alive_59_3 n_alive_60_3 n_alive_61_3 n_alive_62_3 n_alive_63_3 n_alive_64_3 n_alive_65_3 n_alive_66_3 n_alive_67_3 
n_alive_68_3 n_alive_69_3 n_alive_70_3;drop _TYPE_ _FREQ_;



* n_prep_elig;
%macro median_n_prep_elig(y=);data ee; set e;keep n_prep_elig_&y._1 ; 
proc means noprint p50 data = e ;var n_prep_elig_&y._1 ;output out=n_prep_elig_&y._1 median = median_n_prep_elig_no_vac_&y. ; %mend;
%median_n_prep_elig(y=40);%median_n_prep_elig(y=41);%median_n_prep_elig(y=42);%median_n_prep_elig(y=43);
%median_n_prep_elig(y=44);%median_n_prep_elig(y=45);%median_n_prep_elig(y=46);%median_n_prep_elig(y=47);%median_n_prep_elig(y=48);%median_n_prep_elig(y=49);
%median_n_prep_elig(y=50);%median_n_prep_elig(y=51);%median_n_prep_elig(y=52);%median_n_prep_elig(y=53);%median_n_prep_elig(y=54);%median_n_prep_elig(y=55);
%median_n_prep_elig(y=56);%median_n_prep_elig(y=57);%median_n_prep_elig(y=58);%median_n_prep_elig(y=59);%median_n_prep_elig(y=60);%median_n_prep_elig(y=61);
%median_n_prep_elig(y=62);%median_n_prep_elig(y=63);%median_n_prep_elig(y=64);%median_n_prep_elig(y=65);%median_n_prep_elig(y=66);%median_n_prep_elig(y=67);
%median_n_prep_elig(y=68);%median_n_prep_elig(y=69);%median_n_prep_elig(y=70);
data n_prep_elig_1; merge n_prep_elig_40_1 n_prep_elig_41_1 n_prep_elig_42_1 n_prep_elig_43_1 n_prep_elig_44_1 n_prep_elig_45_1 n_prep_elig_46_1 n_prep_elig_47_1
n_prep_elig_48_1 n_prep_elig_49_1 n_prep_elig_50_1 n_prep_elig_51_1 n_prep_elig_52_1 n_prep_elig_53_1 n_prep_elig_54_1 n_prep_elig_55_1 n_prep_elig_56_1 n_prep_elig_57_1
n_prep_elig_58_1 n_prep_elig_59_1 n_prep_elig_60_1 n_prep_elig_61_1 n_prep_elig_62_1 n_prep_elig_63_1 n_prep_elig_64_1 n_prep_elig_65_1 n_prep_elig_66_1 n_prep_elig_67_1  
n_prep_elig_68_1 n_prep_elig_69_1 n_prep_elig_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_prep_elig(y=);data ee; set e;keep n_prep_elig_&y._3 ; 
proc means noprint p50 data = e ;var n_prep_elig_&y._3 ;output out=n_prep_elig_&y._3 median = median_n_prep_elig_vac_&y. ; %mend;
%median_n_prep_elig(y=40);%median_n_prep_elig(y=41);%median_n_prep_elig(y=42);%median_n_prep_elig(y=43);
%median_n_prep_elig(y=44);%median_n_prep_elig(y=45);%median_n_prep_elig(y=46);%median_n_prep_elig(y=47);%median_n_prep_elig(y=48);%median_n_prep_elig(y=49);
%median_n_prep_elig(y=50);%median_n_prep_elig(y=51);%median_n_prep_elig(y=52);%median_n_prep_elig(y=53);%median_n_prep_elig(y=54);%median_n_prep_elig(y=55);
%median_n_prep_elig(y=56);%median_n_prep_elig(y=57);%median_n_prep_elig(y=58);%median_n_prep_elig(y=59);%median_n_prep_elig(y=60);%median_n_prep_elig(y=61);
%median_n_prep_elig(y=62);%median_n_prep_elig(y=63);%median_n_prep_elig(y=64);%median_n_prep_elig(y=65);%median_n_prep_elig(y=66);%median_n_prep_elig(y=67);
%median_n_prep_elig(y=68);%median_n_prep_elig(y=69);%median_n_prep_elig(y=70);
data n_prep_elig_3; merge n_prep_elig_40_3 n_prep_elig_41_3 n_prep_elig_42_3 n_prep_elig_43_3 n_prep_elig_44_3 n_prep_elig_45_3 n_prep_elig_46_3 n_prep_elig_47_3
n_prep_elig_48_3 n_prep_elig_49_3 n_prep_elig_50_3 n_prep_elig_51_3 n_prep_elig_52_3 n_prep_elig_53_3 n_prep_elig_54_3 n_prep_elig_55_3 n_prep_elig_56_3 n_prep_elig_57_3
n_prep_elig_58_3 n_prep_elig_59_3 n_prep_elig_60_3 n_prep_elig_61_3 n_prep_elig_62_3 n_prep_elig_63_3 n_prep_elig_64_3 n_prep_elig_65_3 n_prep_elig_66_3 n_prep_elig_67_3 
n_prep_elig_68_3 n_prep_elig_69_3 n_prep_elig_70_3;drop _TYPE_ _FREQ_;



* n_prep_oral;
%macro median_n_prep_oral(y=);data ee; set e;keep n_prep_oral_&y._1 ; 
proc means noprint p50 data = e ;var n_prep_oral_&y._1 ;output out=n_prep_oral_&y._1 median = median_n_prep_oral_no_vac_&y. ; %mend;
%median_n_prep_oral(y=40);%median_n_prep_oral(y=41);%median_n_prep_oral(y=42);%median_n_prep_oral(y=43);
%median_n_prep_oral(y=44);%median_n_prep_oral(y=45);%median_n_prep_oral(y=46);%median_n_prep_oral(y=47);%median_n_prep_oral(y=48);%median_n_prep_oral(y=49);
%median_n_prep_oral(y=50);%median_n_prep_oral(y=51);%median_n_prep_oral(y=52);%median_n_prep_oral(y=53);%median_n_prep_oral(y=54);%median_n_prep_oral(y=55);
%median_n_prep_oral(y=56);%median_n_prep_oral(y=57);%median_n_prep_oral(y=58);%median_n_prep_oral(y=59);%median_n_prep_oral(y=60);%median_n_prep_oral(y=61);
%median_n_prep_oral(y=62);%median_n_prep_oral(y=63);%median_n_prep_oral(y=64);%median_n_prep_oral(y=65);%median_n_prep_oral(y=66);%median_n_prep_oral(y=67);
%median_n_prep_oral(y=68);%median_n_prep_oral(y=69);%median_n_prep_oral(y=70);
data n_prep_oral_1; merge n_prep_oral_40_1 n_prep_oral_41_1 n_prep_oral_42_1 n_prep_oral_43_1 n_prep_oral_44_1 n_prep_oral_45_1 n_prep_oral_46_1 n_prep_oral_47_1
n_prep_oral_48_1 n_prep_oral_49_1 n_prep_oral_50_1 n_prep_oral_51_1 n_prep_oral_52_1 n_prep_oral_53_1 n_prep_oral_54_1 n_prep_oral_55_1 n_prep_oral_56_1 n_prep_oral_57_1
n_prep_oral_58_1 n_prep_oral_59_1 n_prep_oral_60_1 n_prep_oral_61_1 n_prep_oral_62_1 n_prep_oral_63_1 n_prep_oral_64_1 n_prep_oral_65_1 n_prep_oral_66_1 n_prep_oral_67_1  
n_prep_oral_68_1 n_prep_oral_69_1 n_prep_oral_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_prep_oral(y=);data ee; set e;keep n_prep_oral_&y._3 ; 
proc means noprint p50 data = e ;var n_prep_oral_&y._3 ;output out=n_prep_oral_&y._3 median = median_n_prep_oral_vac_&y. ; %mend;
%median_n_prep_oral(y=40);%median_n_prep_oral(y=41);%median_n_prep_oral(y=42);%median_n_prep_oral(y=43);
%median_n_prep_oral(y=44);%median_n_prep_oral(y=45);%median_n_prep_oral(y=46);%median_n_prep_oral(y=47);%median_n_prep_oral(y=48);%median_n_prep_oral(y=49);
%median_n_prep_oral(y=50);%median_n_prep_oral(y=51);%median_n_prep_oral(y=52);%median_n_prep_oral(y=53);%median_n_prep_oral(y=54);%median_n_prep_oral(y=55);
%median_n_prep_oral(y=56);%median_n_prep_oral(y=57);%median_n_prep_oral(y=58);%median_n_prep_oral(y=59);%median_n_prep_oral(y=60);%median_n_prep_oral(y=61);
%median_n_prep_oral(y=62);%median_n_prep_oral(y=63);%median_n_prep_oral(y=64);%median_n_prep_oral(y=65);%median_n_prep_oral(y=66);%median_n_prep_oral(y=67);
%median_n_prep_oral(y=68);%median_n_prep_oral(y=69);%median_n_prep_oral(y=70);
data n_prep_oral_3; merge n_prep_oral_40_3 n_prep_oral_41_3 n_prep_oral_42_3 n_prep_oral_43_3 n_prep_oral_44_3 n_prep_oral_45_3 n_prep_oral_46_3 n_prep_oral_47_3
n_prep_oral_48_3 n_prep_oral_49_3 n_prep_oral_50_3 n_prep_oral_51_3 n_prep_oral_52_3 n_prep_oral_53_3 n_prep_oral_54_3 n_prep_oral_55_3 n_prep_oral_56_3 n_prep_oral_57_3
n_prep_oral_58_3 n_prep_oral_59_3 n_prep_oral_60_3 n_prep_oral_61_3 n_prep_oral_62_3 n_prep_oral_63_3 n_prep_oral_64_3 n_prep_oral_65_3 n_prep_oral_66_3 n_prep_oral_67_3 
n_prep_oral_68_3 n_prep_oral_69_3 n_prep_oral_70_3;drop _TYPE_ _FREQ_;



* n_newp_ge1;
%macro median_n_newp_ge1(y=);data ee; set e;keep n_newp_ge1_&y._1 ; 
proc means noprint p50 data = e ;var n_newp_ge1_&y._1 ;output out=n_newp_ge1_&y._1 median = median_n_newp_ge1_no_vac_&y. ; %mend;
%median_n_newp_ge1(y=40);%median_n_newp_ge1(y=41);%median_n_newp_ge1(y=42);%median_n_newp_ge1(y=43);
%median_n_newp_ge1(y=44);%median_n_newp_ge1(y=45);%median_n_newp_ge1(y=46);%median_n_newp_ge1(y=47);%median_n_newp_ge1(y=48);%median_n_newp_ge1(y=49);
%median_n_newp_ge1(y=50);%median_n_newp_ge1(y=51);%median_n_newp_ge1(y=52);%median_n_newp_ge1(y=53);%median_n_newp_ge1(y=54);%median_n_newp_ge1(y=55);
%median_n_newp_ge1(y=56);%median_n_newp_ge1(y=57);%median_n_newp_ge1(y=58);%median_n_newp_ge1(y=59);%median_n_newp_ge1(y=60);%median_n_newp_ge1(y=61);
%median_n_newp_ge1(y=62);%median_n_newp_ge1(y=63);%median_n_newp_ge1(y=64);%median_n_newp_ge1(y=65);%median_n_newp_ge1(y=66);%median_n_newp_ge1(y=67);
%median_n_newp_ge1(y=68);%median_n_newp_ge1(y=69);%median_n_newp_ge1(y=70);
data n_newp_ge1_1; merge n_newp_ge1_40_1 n_newp_ge1_41_1 n_newp_ge1_42_1 n_newp_ge1_43_1 n_newp_ge1_44_1 n_newp_ge1_45_1 n_newp_ge1_46_1 n_newp_ge1_47_1
n_newp_ge1_48_1 n_newp_ge1_49_1 n_newp_ge1_50_1 n_newp_ge1_51_1 n_newp_ge1_52_1 n_newp_ge1_53_1 n_newp_ge1_54_1 n_newp_ge1_55_1 n_newp_ge1_56_1 n_newp_ge1_57_1
n_newp_ge1_58_1 n_newp_ge1_59_1 n_newp_ge1_60_1 n_newp_ge1_61_1 n_newp_ge1_62_1 n_newp_ge1_63_1 n_newp_ge1_64_1 n_newp_ge1_65_1 n_newp_ge1_66_1 n_newp_ge1_67_1  
n_newp_ge1_68_1 n_newp_ge1_69_1 n_newp_ge1_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_newp_ge1(y=);data ee; set e;keep n_newp_ge1_&y._3 ; 
proc means noprint p50 data = e ;var n_newp_ge1_&y._3 ;output out=n_newp_ge1_&y._3 median = median_n_newp_ge1_vac_&y. ; %mend;
%median_n_newp_ge1(y=40);%median_n_newp_ge1(y=41);%median_n_newp_ge1(y=42);%median_n_newp_ge1(y=43);
%median_n_newp_ge1(y=44);%median_n_newp_ge1(y=45);%median_n_newp_ge1(y=46);%median_n_newp_ge1(y=47);%median_n_newp_ge1(y=48);%median_n_newp_ge1(y=49);
%median_n_newp_ge1(y=50);%median_n_newp_ge1(y=51);%median_n_newp_ge1(y=52);%median_n_newp_ge1(y=53);%median_n_newp_ge1(y=54);%median_n_newp_ge1(y=55);
%median_n_newp_ge1(y=56);%median_n_newp_ge1(y=57);%median_n_newp_ge1(y=58);%median_n_newp_ge1(y=59);%median_n_newp_ge1(y=60);%median_n_newp_ge1(y=61);
%median_n_newp_ge1(y=62);%median_n_newp_ge1(y=63);%median_n_newp_ge1(y=64);%median_n_newp_ge1(y=65);%median_n_newp_ge1(y=66);%median_n_newp_ge1(y=67);
%median_n_newp_ge1(y=68);%median_n_newp_ge1(y=69);%median_n_newp_ge1(y=70);
data n_newp_ge1_3; merge n_newp_ge1_40_3 n_newp_ge1_41_3 n_newp_ge1_42_3 n_newp_ge1_43_3 n_newp_ge1_44_3 n_newp_ge1_45_3 n_newp_ge1_46_3 n_newp_ge1_47_3
n_newp_ge1_48_3 n_newp_ge1_49_3 n_newp_ge1_50_3 n_newp_ge1_51_3 n_newp_ge1_52_3 n_newp_ge1_53_3 n_newp_ge1_54_3 n_newp_ge1_55_3 n_newp_ge1_56_3 n_newp_ge1_57_3
n_newp_ge1_58_3 n_newp_ge1_59_3 n_newp_ge1_60_3 n_newp_ge1_61_3 n_newp_ge1_62_3 n_newp_ge1_63_3 n_newp_ge1_64_3 n_newp_ge1_65_3 n_newp_ge1_66_3 n_newp_ge1_67_3 
n_newp_ge1_68_3 n_newp_ge1_69_3 n_newp_ge1_70_3;drop _TYPE_ _FREQ_;



* n_ep;
%macro median_n_ep(y=);data ee; set e;keep n_ep_&y._1 ; 
proc means noprint p50 data = e ;var n_ep_&y._1 ;output out=n_ep_&y._1 median = median_n_ep_no_vac_&y. ; %mend;
%median_n_ep(y=40);%median_n_ep(y=41);%median_n_ep(y=42);%median_n_ep(y=43);
%median_n_ep(y=44);%median_n_ep(y=45);%median_n_ep(y=46);%median_n_ep(y=47);%median_n_ep(y=48);%median_n_ep(y=49);
%median_n_ep(y=50);%median_n_ep(y=51);%median_n_ep(y=52);%median_n_ep(y=53);%median_n_ep(y=54);%median_n_ep(y=55);
%median_n_ep(y=56);%median_n_ep(y=57);%median_n_ep(y=58);%median_n_ep(y=59);%median_n_ep(y=60);%median_n_ep(y=61);
%median_n_ep(y=62);%median_n_ep(y=63);%median_n_ep(y=64);%median_n_ep(y=65);%median_n_ep(y=66);%median_n_ep(y=67);
%median_n_ep(y=68);%median_n_ep(y=69);%median_n_ep(y=70);
data n_ep_1; merge n_ep_40_1 n_ep_41_1 n_ep_42_1 n_ep_43_1 n_ep_44_1 n_ep_45_1 n_ep_46_1 n_ep_47_1
n_ep_48_1 n_ep_49_1 n_ep_50_1 n_ep_51_1 n_ep_52_1 n_ep_53_1 n_ep_54_1 n_ep_55_1 n_ep_56_1 n_ep_57_1
n_ep_58_1 n_ep_59_1 n_ep_60_1 n_ep_61_1 n_ep_62_1 n_ep_63_1 n_ep_64_1 n_ep_65_1 n_ep_66_1 n_ep_67_1  
n_ep_68_1 n_ep_69_1 n_ep_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_ep(y=);data ee; set e;keep n_ep_&y._3 ; 
proc means noprint p50 data = e ;var n_ep_&y._3 ;output out=n_ep_&y._3 median = median_n_ep_vac_&y. ; %mend;
%median_n_ep(y=40);%median_n_ep(y=41);%median_n_ep(y=42);%median_n_ep(y=43);
%median_n_ep(y=44);%median_n_ep(y=45);%median_n_ep(y=46);%median_n_ep(y=47);%median_n_ep(y=48);%median_n_ep(y=49);
%median_n_ep(y=50);%median_n_ep(y=51);%median_n_ep(y=52);%median_n_ep(y=53);%median_n_ep(y=54);%median_n_ep(y=55);
%median_n_ep(y=56);%median_n_ep(y=57);%median_n_ep(y=58);%median_n_ep(y=59);%median_n_ep(y=60);%median_n_ep(y=61);
%median_n_ep(y=62);%median_n_ep(y=63);%median_n_ep(y=64);%median_n_ep(y=65);%median_n_ep(y=66);%median_n_ep(y=67);
%median_n_ep(y=68);%median_n_ep(y=69);%median_n_ep(y=70);
data n_ep_3; merge n_ep_40_3 n_ep_41_3 n_ep_42_3 n_ep_43_3 n_ep_44_3 n_ep_45_3 n_ep_46_3 n_ep_47_3
n_ep_48_3 n_ep_49_3 n_ep_50_3 n_ep_51_3 n_ep_52_3 n_ep_53_3 n_ep_54_3 n_ep_55_3 n_ep_56_3 n_ep_57_3
n_ep_58_3 n_ep_59_3 n_ep_60_3 n_ep_61_3 n_ep_62_3 n_ep_63_3 n_ep_64_3 n_ep_65_3 n_ep_66_3 n_ep_67_3 
n_ep_68_3 n_ep_69_3 n_ep_70_3;drop _TYPE_ _FREQ_;



* n_new_vmmc;
%macro median_n_new_vmmc(y=);data ee; set e;keep n_new_vmmc_&y._1 ; 
proc means noprint p50 data = e ;var n_new_vmmc_&y._1 ;output out=n_new_vmmc_&y._1 median = median_n_new_vmmc_no_vac_&y. ; %mend;
%median_n_new_vmmc(y=40);%median_n_new_vmmc(y=41);%median_n_new_vmmc(y=42);%median_n_new_vmmc(y=43);
%median_n_new_vmmc(y=44);%median_n_new_vmmc(y=45);%median_n_new_vmmc(y=46);%median_n_new_vmmc(y=47);%median_n_new_vmmc(y=48);%median_n_new_vmmc(y=49);
%median_n_new_vmmc(y=50);%median_n_new_vmmc(y=51);%median_n_new_vmmc(y=52);%median_n_new_vmmc(y=53);%median_n_new_vmmc(y=54);%median_n_new_vmmc(y=55);
%median_n_new_vmmc(y=56);%median_n_new_vmmc(y=57);%median_n_new_vmmc(y=58);%median_n_new_vmmc(y=59);%median_n_new_vmmc(y=60);%median_n_new_vmmc(y=61);
%median_n_new_vmmc(y=62);%median_n_new_vmmc(y=63);%median_n_new_vmmc(y=64);%median_n_new_vmmc(y=65);%median_n_new_vmmc(y=66);%median_n_new_vmmc(y=67);
%median_n_new_vmmc(y=68);%median_n_new_vmmc(y=69);%median_n_new_vmmc(y=70);
data n_new_vmmc_1; merge n_new_vmmc_40_1 n_new_vmmc_41_1 n_new_vmmc_42_1 n_new_vmmc_43_1 n_new_vmmc_44_1 n_new_vmmc_45_1 n_new_vmmc_46_1 n_new_vmmc_47_1
n_new_vmmc_48_1 n_new_vmmc_49_1 n_new_vmmc_50_1 n_new_vmmc_51_1 n_new_vmmc_52_1 n_new_vmmc_53_1 n_new_vmmc_54_1 n_new_vmmc_55_1 n_new_vmmc_56_1 n_new_vmmc_57_1
n_new_vmmc_58_1 n_new_vmmc_59_1 n_new_vmmc_60_1 n_new_vmmc_61_1 n_new_vmmc_62_1 n_new_vmmc_63_1 n_new_vmmc_64_1 n_new_vmmc_65_1 n_new_vmmc_66_1 n_new_vmmc_67_1  
n_new_vmmc_68_1 n_new_vmmc_69_1 n_new_vmmc_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_new_vmmc(y=);data ee; set e;keep n_new_vmmc_&y._3 ; 
proc means noprint p50 data = e ;var n_new_vmmc_&y._3 ;output out=n_new_vmmc_&y._3 median = median_n_new_vmmc_vac_&y. ; %mend;
%median_n_new_vmmc(y=40);%median_n_new_vmmc(y=41);%median_n_new_vmmc(y=42);%median_n_new_vmmc(y=43);
%median_n_new_vmmc(y=44);%median_n_new_vmmc(y=45);%median_n_new_vmmc(y=46);%median_n_new_vmmc(y=47);%median_n_new_vmmc(y=48);%median_n_new_vmmc(y=49);
%median_n_new_vmmc(y=50);%median_n_new_vmmc(y=51);%median_n_new_vmmc(y=52);%median_n_new_vmmc(y=53);%median_n_new_vmmc(y=54);%median_n_new_vmmc(y=55);
%median_n_new_vmmc(y=56);%median_n_new_vmmc(y=57);%median_n_new_vmmc(y=58);%median_n_new_vmmc(y=59);%median_n_new_vmmc(y=60);%median_n_new_vmmc(y=61);
%median_n_new_vmmc(y=62);%median_n_new_vmmc(y=63);%median_n_new_vmmc(y=64);%median_n_new_vmmc(y=65);%median_n_new_vmmc(y=66);%median_n_new_vmmc(y=67);
%median_n_new_vmmc(y=68);%median_n_new_vmmc(y=69);%median_n_new_vmmc(y=70);
data n_new_vmmc_3; merge n_new_vmmc_40_3 n_new_vmmc_41_3 n_new_vmmc_42_3 n_new_vmmc_43_3 n_new_vmmc_44_3 n_new_vmmc_45_3 n_new_vmmc_46_3 n_new_vmmc_47_3
n_new_vmmc_48_3 n_new_vmmc_49_3 n_new_vmmc_50_3 n_new_vmmc_51_3 n_new_vmmc_52_3 n_new_vmmc_53_3 n_new_vmmc_54_3 n_new_vmmc_55_3 n_new_vmmc_56_3 n_new_vmmc_57_3
n_new_vmmc_58_3 n_new_vmmc_59_3 n_new_vmmc_60_3 n_new_vmmc_61_3 n_new_vmmc_62_3 n_new_vmmc_63_3 n_new_vmmc_64_3 n_new_vmmc_65_3 n_new_vmmc_66_3 n_new_vmmc_67_3 
n_new_vmmc_68_3 n_new_vmmc_69_3 n_new_vmmc_70_3;drop _TYPE_ _FREQ_;




* incidence1549;
%macro median_incidence1549(y=);data ee; set e;keep incidence1549_&y._1 ; 
proc means noprint p50 data = e ;var incidence1549_&y._1 ;output out=incidence1549_&y._1 median = median_incidence1549_no_vac_&y. ; %mend;
%median_incidence1549(y=40);%median_incidence1549(y=41);%median_incidence1549(y=42);%median_incidence1549(y=43);
%median_incidence1549(y=44);%median_incidence1549(y=45);%median_incidence1549(y=46);%median_incidence1549(y=47);%median_incidence1549(y=48);%median_incidence1549(y=49);
%median_incidence1549(y=50);%median_incidence1549(y=51);%median_incidence1549(y=52);%median_incidence1549(y=53);%median_incidence1549(y=54);%median_incidence1549(y=55);
%median_incidence1549(y=56);%median_incidence1549(y=57);%median_incidence1549(y=58);%median_incidence1549(y=59);%median_incidence1549(y=60);%median_incidence1549(y=61);
%median_incidence1549(y=62);%median_incidence1549(y=63);%median_incidence1549(y=64);%median_incidence1549(y=65);%median_incidence1549(y=66);%median_incidence1549(y=67);
%median_incidence1549(y=68);%median_incidence1549(y=69);%median_incidence1549(y=70);
data incidence1549_1; merge incidence1549_40_1 incidence1549_41_1 incidence1549_42_1 incidence1549_43_1 incidence1549_44_1 incidence1549_45_1 incidence1549_46_1 incidence1549_47_1
incidence1549_48_1 incidence1549_49_1 incidence1549_50_1 incidence1549_51_1 incidence1549_52_1 incidence1549_53_1 incidence1549_54_1 incidence1549_55_1 incidence1549_56_1 incidence1549_57_1
incidence1549_58_1 incidence1549_59_1 incidence1549_60_1 incidence1549_61_1 incidence1549_62_1 incidence1549_63_1 incidence1549_64_1 incidence1549_65_1 incidence1549_66_1 incidence1549_67_1  
incidence1549_68_1 incidence1549_69_1 incidence1549_70_1;drop _TYPE_ _FREQ_;
%macro 	median_incidence1549(y=);data ee; set e;keep incidence1549_&y._3 ; 
proc means noprint p50 data = e ;var incidence1549_&y._3 ;output out=incidence1549_&y._3 median = median_incidence1549_vac_&y. ; %mend;
%median_incidence1549(y=40);%median_incidence1549(y=41);%median_incidence1549(y=42);%median_incidence1549(y=43);
%median_incidence1549(y=44);%median_incidence1549(y=45);%median_incidence1549(y=46);%median_incidence1549(y=47);%median_incidence1549(y=48);%median_incidence1549(y=49);
%median_incidence1549(y=50);%median_incidence1549(y=51);%median_incidence1549(y=52);%median_incidence1549(y=53);%median_incidence1549(y=54);%median_incidence1549(y=55);
%median_incidence1549(y=56);%median_incidence1549(y=57);%median_incidence1549(y=58);%median_incidence1549(y=59);%median_incidence1549(y=60);%median_incidence1549(y=61);
%median_incidence1549(y=62);%median_incidence1549(y=63);%median_incidence1549(y=64);%median_incidence1549(y=65);%median_incidence1549(y=66);%median_incidence1549(y=67);
%median_incidence1549(y=68);%median_incidence1549(y=69);%median_incidence1549(y=70);
data incidence1549_3; merge incidence1549_40_3 incidence1549_41_3 incidence1549_42_3 incidence1549_43_3 incidence1549_44_3 incidence1549_45_3 incidence1549_46_3 incidence1549_47_3
incidence1549_48_3 incidence1549_49_3 incidence1549_50_3 incidence1549_51_3 incidence1549_52_3 incidence1549_53_3 incidence1549_54_3 incidence1549_55_3 incidence1549_56_3 incidence1549_57_3
incidence1549_58_3 incidence1549_59_3 incidence1549_60_3 incidence1549_61_3 incidence1549_62_3 incidence1549_63_3 incidence1549_64_3 incidence1549_65_3 incidence1549_66_3 incidence1549_67_3 
incidence1549_68_3 incidence1549_69_3 incidence1549_70_3;drop _TYPE_ _FREQ_;



* n_hiv_death;
%macro median_n_hiv_death(y=);data ee; set e;keep n_hiv_death_&y._1 ; 
proc means noprint p50 data = e ;var n_hiv_death_&y._1 ;output out=n_hiv_death_&y._1 median = median_n_hiv_death_no_vac_&y. ; %mend;
%median_n_hiv_death(y=40);%median_n_hiv_death(y=41);%median_n_hiv_death(y=42);%median_n_hiv_death(y=43);
%median_n_hiv_death(y=44);%median_n_hiv_death(y=45);%median_n_hiv_death(y=46);%median_n_hiv_death(y=47);%median_n_hiv_death(y=48);%median_n_hiv_death(y=49);
%median_n_hiv_death(y=50);%median_n_hiv_death(y=51);%median_n_hiv_death(y=52);%median_n_hiv_death(y=53);%median_n_hiv_death(y=54);%median_n_hiv_death(y=55);
%median_n_hiv_death(y=56);%median_n_hiv_death(y=57);%median_n_hiv_death(y=58);%median_n_hiv_death(y=59);%median_n_hiv_death(y=60);%median_n_hiv_death(y=61);
%median_n_hiv_death(y=62);%median_n_hiv_death(y=63);%median_n_hiv_death(y=64);%median_n_hiv_death(y=65);%median_n_hiv_death(y=66);%median_n_hiv_death(y=67);
%median_n_hiv_death(y=68);%median_n_hiv_death(y=69);%median_n_hiv_death(y=70);
data n_hiv_death_1; merge n_hiv_death_40_1 n_hiv_death_41_1 n_hiv_death_42_1 n_hiv_death_43_1 n_hiv_death_44_1 n_hiv_death_45_1 n_hiv_death_46_1 n_hiv_death_47_1
n_hiv_death_48_1 n_hiv_death_49_1 n_hiv_death_50_1 n_hiv_death_51_1 n_hiv_death_52_1 n_hiv_death_53_1 n_hiv_death_54_1 n_hiv_death_55_1 n_hiv_death_56_1 n_hiv_death_57_1
n_hiv_death_58_1 n_hiv_death_59_1 n_hiv_death_60_1 n_hiv_death_61_1 n_hiv_death_62_1 n_hiv_death_63_1 n_hiv_death_64_1 n_hiv_death_65_1 n_hiv_death_66_1 n_hiv_death_67_1  
n_hiv_death_68_1 n_hiv_death_69_1 n_hiv_death_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_hiv_death(y=);data ee; set e;keep n_hiv_death_&y._3 ; 
proc means noprint p50 data = e ;var n_hiv_death_&y._3 ;output out=n_hiv_death_&y._3 median = median_n_hiv_death_vac_&y. ; %mend;
%median_n_hiv_death(y=40);%median_n_hiv_death(y=41);%median_n_hiv_death(y=42);%median_n_hiv_death(y=43);
%median_n_hiv_death(y=44);%median_n_hiv_death(y=45);%median_n_hiv_death(y=46);%median_n_hiv_death(y=47);%median_n_hiv_death(y=48);%median_n_hiv_death(y=49);
%median_n_hiv_death(y=50);%median_n_hiv_death(y=51);%median_n_hiv_death(y=52);%median_n_hiv_death(y=53);%median_n_hiv_death(y=54);%median_n_hiv_death(y=55);
%median_n_hiv_death(y=56);%median_n_hiv_death(y=57);%median_n_hiv_death(y=58);%median_n_hiv_death(y=59);%median_n_hiv_death(y=60);%median_n_hiv_death(y=61);
%median_n_hiv_death(y=62);%median_n_hiv_death(y=63);%median_n_hiv_death(y=64);%median_n_hiv_death(y=65);%median_n_hiv_death(y=66);%median_n_hiv_death(y=67);
%median_n_hiv_death(y=68);%median_n_hiv_death(y=69);%median_n_hiv_death(y=70);
data n_hiv_death_3; merge n_hiv_death_40_3 n_hiv_death_41_3 n_hiv_death_42_3 n_hiv_death_43_3 n_hiv_death_44_3 n_hiv_death_45_3 n_hiv_death_46_3 n_hiv_death_47_3
n_hiv_death_48_3 n_hiv_death_49_3 n_hiv_death_50_3 n_hiv_death_51_3 n_hiv_death_52_3 n_hiv_death_53_3 n_hiv_death_54_3 n_hiv_death_55_3 n_hiv_death_56_3 n_hiv_death_57_3
n_hiv_death_58_3 n_hiv_death_59_3 n_hiv_death_60_3 n_hiv_death_61_3 n_hiv_death_62_3 n_hiv_death_63_3 n_hiv_death_64_3 n_hiv_death_65_3 n_hiv_death_66_3 n_hiv_death_67_3 
n_hiv_death_68_3 n_hiv_death_69_3 n_hiv_death_70_3;drop _TYPE_ _FREQ_;



* p_vl1000;
%macro median_p_vl1000(y=);data ee; set e;keep p_vl1000_&y._1 ; 
proc means noprint p50 data = e ;var p_vl1000_&y._1 ;output out=p_vl1000_&y._1 median = median_p_vl1000_no_vac_&y. ; %mend;
%median_p_vl1000(y=40);%median_p_vl1000(y=41);%median_p_vl1000(y=42);%median_p_vl1000(y=43);
%median_p_vl1000(y=44);%median_p_vl1000(y=45);%median_p_vl1000(y=46);%median_p_vl1000(y=47);%median_p_vl1000(y=48);%median_p_vl1000(y=49);
%median_p_vl1000(y=50);%median_p_vl1000(y=51);%median_p_vl1000(y=52);%median_p_vl1000(y=53);%median_p_vl1000(y=54);%median_p_vl1000(y=55);
%median_p_vl1000(y=56);%median_p_vl1000(y=57);%median_p_vl1000(y=58);%median_p_vl1000(y=59);%median_p_vl1000(y=60);%median_p_vl1000(y=61);
%median_p_vl1000(y=62);%median_p_vl1000(y=63);%median_p_vl1000(y=64);%median_p_vl1000(y=65);%median_p_vl1000(y=66);%median_p_vl1000(y=67);
%median_p_vl1000(y=68);%median_p_vl1000(y=69);%median_p_vl1000(y=70);
data p_vl1000_1; merge p_vl1000_40_1 p_vl1000_41_1 p_vl1000_42_1 p_vl1000_43_1 p_vl1000_44_1 p_vl1000_45_1 p_vl1000_46_1 p_vl1000_47_1
p_vl1000_48_1 p_vl1000_49_1 p_vl1000_50_1 p_vl1000_51_1 p_vl1000_52_1 p_vl1000_53_1 p_vl1000_54_1 p_vl1000_55_1 p_vl1000_56_1 p_vl1000_57_1
p_vl1000_58_1 p_vl1000_59_1 p_vl1000_60_1 p_vl1000_61_1 p_vl1000_62_1 p_vl1000_63_1 p_vl1000_64_1 p_vl1000_65_1 p_vl1000_66_1 p_vl1000_67_1  
p_vl1000_68_1 p_vl1000_69_1 p_vl1000_70_1;drop _TYPE_ _FREQ_;
%macro 	median_p_vl1000(y=);data ee; set e;keep p_vl1000_&y._3 ; 
proc means noprint p50 data = e ;var p_vl1000_&y._3 ;output out=p_vl1000_&y._3 median = median_p_vl1000_vac_&y. ; %mend;
%median_p_vl1000(y=40);%median_p_vl1000(y=41);%median_p_vl1000(y=42);%median_p_vl1000(y=43);
%median_p_vl1000(y=44);%median_p_vl1000(y=45);%median_p_vl1000(y=46);%median_p_vl1000(y=47);%median_p_vl1000(y=48);%median_p_vl1000(y=49);
%median_p_vl1000(y=50);%median_p_vl1000(y=51);%median_p_vl1000(y=52);%median_p_vl1000(y=53);%median_p_vl1000(y=54);%median_p_vl1000(y=55);
%median_p_vl1000(y=56);%median_p_vl1000(y=57);%median_p_vl1000(y=58);%median_p_vl1000(y=59);%median_p_vl1000(y=60);%median_p_vl1000(y=61);
%median_p_vl1000(y=62);%median_p_vl1000(y=63);%median_p_vl1000(y=64);%median_p_vl1000(y=65);%median_p_vl1000(y=66);%median_p_vl1000(y=67);
%median_p_vl1000(y=68);%median_p_vl1000(y=69);%median_p_vl1000(y=70);
data p_vl1000_3; merge p_vl1000_40_3 p_vl1000_41_3 p_vl1000_42_3 p_vl1000_43_3 p_vl1000_44_3 p_vl1000_45_3 p_vl1000_46_3 p_vl1000_47_3
p_vl1000_48_3 p_vl1000_49_3 p_vl1000_50_3 p_vl1000_51_3 p_vl1000_52_3 p_vl1000_53_3 p_vl1000_54_3 p_vl1000_55_3 p_vl1000_56_3 p_vl1000_57_3
p_vl1000_58_3 p_vl1000_59_3 p_vl1000_60_3 p_vl1000_61_3 p_vl1000_62_3 p_vl1000_63_3 p_vl1000_64_3 p_vl1000_65_3 p_vl1000_66_3 p_vl1000_67_3 
 p_vl1000_68_3 p_vl1000_69_3 p_vl1000_70_3;drop _TYPE_ _FREQ_;


* n_ever_vaccinated;
%macro 	median_n_ever_vaccinated(y=);data ee; set e;keep n_ever_vaccinated_&y._3 ; 
proc means noprint p50 data = e ;var n_ever_vaccinated_&y._3 ;output out=n_ever_vaccinated_&y._3 median = median_n_ever_vaccinated_vac_&y. ; %mend;
%median_n_ever_vaccinated(y=40);%median_n_ever_vaccinated(y=41);%median_n_ever_vaccinated(y=42);%median_n_ever_vaccinated(y=43);
%median_n_ever_vaccinated(y=44);%median_n_ever_vaccinated(y=45);%median_n_ever_vaccinated(y=46);%median_n_ever_vaccinated(y=47);%median_n_ever_vaccinated(y=48);%median_n_ever_vaccinated(y=49);
%median_n_ever_vaccinated(y=50);%median_n_ever_vaccinated(y=51);%median_n_ever_vaccinated(y=52);%median_n_ever_vaccinated(y=53);%median_n_ever_vaccinated(y=54);%median_n_ever_vaccinated(y=55);
%median_n_ever_vaccinated(y=56);%median_n_ever_vaccinated(y=57);%median_n_ever_vaccinated(y=58);%median_n_ever_vaccinated(y=59);%median_n_ever_vaccinated(y=60);%median_n_ever_vaccinated(y=61);
%median_n_ever_vaccinated(y=62);%median_n_ever_vaccinated(y=63);%median_n_ever_vaccinated(y=64);%median_n_ever_vaccinated(y=65);%median_n_ever_vaccinated(y=66);%median_n_ever_vaccinated(y=67);
%median_n_ever_vaccinated(y=68);%median_n_ever_vaccinated(y=69);%median_n_ever_vaccinated(y=70);
data n_ever_vaccinated_3; merge n_ever_vaccinated_40_3 n_ever_vaccinated_41_3 n_ever_vaccinated_42_3 n_ever_vaccinated_43_3 n_ever_vaccinated_44_3 n_ever_vaccinated_45_3 n_ever_vaccinated_46_3 n_ever_vaccinated_47_3
n_ever_vaccinated_48_3 n_ever_vaccinated_49_3 n_ever_vaccinated_50_3 n_ever_vaccinated_51_3 n_ever_vaccinated_52_3 n_ever_vaccinated_53_3 n_ever_vaccinated_54_3 n_ever_vaccinated_55_3 n_ever_vaccinated_56_3 n_ever_vaccinated_57_3
n_ever_vaccinated_58_3 n_ever_vaccinated_59_3 n_ever_vaccinated_60_3 n_ever_vaccinated_61_3 n_ever_vaccinated_62_3 n_ever_vaccinated_63_3 n_ever_vaccinated_64_3 n_ever_vaccinated_65_3 n_ever_vaccinated_66_3 n_ever_vaccinated_67_3 
n_ever_vaccinated_68_3 n_ever_vaccinated_69_3 n_ever_vaccinated_70_3;drop _TYPE_ _FREQ_;



* n_cur_full_vaccine_efficacy;
%macro 	median_n_cur_full_vaccine_efficacy(y=);data ee; set e;keep n_cur_full_vaccine_efficacy_&y._3 ; 
proc means noprint p50 data = e ;var n_cur_full_vaccine_efficacy_&y._3 ;output out=n_cur_full_vaccine_efficacy_&y._3 median = median_n_cur_full_vaccine_efficacy_vac_&y. ; %mend;
%median_n_cur_full_vaccine_efficacy(y=40);%median_n_cur_full_vaccine_efficacy(y=41);%median_n_cur_full_vaccine_efficacy(y=42);%median_n_cur_full_vaccine_efficacy(y=43);
%median_n_cur_full_vaccine_efficacy(y=44);%median_n_cur_full_vaccine_efficacy(y=45);%median_n_cur_full_vaccine_efficacy(y=46);%median_n_cur_full_vaccine_efficacy(y=47);%median_n_cur_full_vaccine_efficacy(y=48);%median_n_cur_full_vaccine_efficacy(y=49);
%median_n_cur_full_vaccine_efficacy(y=50);%median_n_cur_full_vaccine_efficacy(y=51);%median_n_cur_full_vaccine_efficacy(y=52);%median_n_cur_full_vaccine_efficacy(y=53);%median_n_cur_full_vaccine_efficacy(y=54);%median_n_cur_full_vaccine_efficacy(y=55);
%median_n_cur_full_vaccine_efficacy(y=56);%median_n_cur_full_vaccine_efficacy(y=57);%median_n_cur_full_vaccine_efficacy(y=58);%median_n_cur_full_vaccine_efficacy(y=59);%median_n_cur_full_vaccine_efficacy(y=60);%median_n_cur_full_vaccine_efficacy(y=61);
%median_n_cur_full_vaccine_efficacy(y=62);%median_n_cur_full_vaccine_efficacy(y=63);%median_n_cur_full_vaccine_efficacy(y=64);%median_n_cur_full_vaccine_efficacy(y=65);%median_n_cur_full_vaccine_efficacy(y=66);%median_n_cur_full_vaccine_efficacy(y=67);
%median_n_cur_full_vaccine_efficacy(y=68);%median_n_cur_full_vaccine_efficacy(y=69);%median_n_cur_full_vaccine_efficacy(y=70);
data n_cur_full_vaccine_efficacy_3; merge n_cur_full_vaccine_efficacy_40_3 n_cur_full_vaccine_efficacy_41_3 n_cur_full_vaccine_efficacy_42_3 n_cur_full_vaccine_efficacy_43_3 n_cur_full_vaccine_efficacy_44_3 n_cur_full_vaccine_efficacy_45_3 n_cur_full_vaccine_efficacy_46_3 n_cur_full_vaccine_efficacy_47_3
n_cur_full_vaccine_efficacy_48_3 n_cur_full_vaccine_efficacy_49_3 n_cur_full_vaccine_efficacy_50_3 n_cur_full_vaccine_efficacy_51_3 n_cur_full_vaccine_efficacy_52_3 n_cur_full_vaccine_efficacy_53_3 n_cur_full_vaccine_efficacy_54_3 n_cur_full_vaccine_efficacy_55_3 n_cur_full_vaccine_efficacy_56_3 n_cur_full_vaccine_efficacy_57_3
n_cur_full_vaccine_efficacy_58_3 n_cur_full_vaccine_efficacy_59_3 n_cur_full_vaccine_efficacy_60_3 n_cur_full_vaccine_efficacy_61_3 n_cur_full_vaccine_efficacy_62_3 n_cur_full_vaccine_efficacy_63_3 n_cur_full_vaccine_efficacy_64_3 n_cur_full_vaccine_efficacy_65_3 n_cur_full_vaccine_efficacy_66_3 n_cur_full_vaccine_efficacy_67_3 
n_cur_full_vaccine_efficacy_68_3 n_cur_full_vaccine_efficacy_69_3 n_cur_full_vaccine_efficacy_70_3;drop _TYPE_ _FREQ_;




* n_any_cur_vaccine_efficacy;
%macro 	median_n_any_cur_vaccine_efficacy(y=);data ee; set e;keep n_any_cur_vaccine_efficacy_&y._3 ; 
proc means noprint p50 data = e ;var n_any_cur_vaccine_efficacy_&y._3 ;output out=n_any_cur_vaccine_efficacy_&y._3 median = median_n_any_cur_vaccine_efficacy_vac_&y. ; %mend;
%median_n_any_cur_vaccine_efficacy(y=40);%median_n_any_cur_vaccine_efficacy(y=41);%median_n_any_cur_vaccine_efficacy(y=42);%median_n_any_cur_vaccine_efficacy(y=43);
%median_n_any_cur_vaccine_efficacy(y=44);%median_n_any_cur_vaccine_efficacy(y=45);%median_n_any_cur_vaccine_efficacy(y=46);%median_n_any_cur_vaccine_efficacy(y=47);%median_n_any_cur_vaccine_efficacy(y=48);%median_n_any_cur_vaccine_efficacy(y=49);
%median_n_any_cur_vaccine_efficacy(y=50);%median_n_any_cur_vaccine_efficacy(y=51);%median_n_any_cur_vaccine_efficacy(y=52);%median_n_any_cur_vaccine_efficacy(y=53);%median_n_any_cur_vaccine_efficacy(y=54);%median_n_any_cur_vaccine_efficacy(y=55);
%median_n_any_cur_vaccine_efficacy(y=56);%median_n_any_cur_vaccine_efficacy(y=57);%median_n_any_cur_vaccine_efficacy(y=58);%median_n_any_cur_vaccine_efficacy(y=59);%median_n_any_cur_vaccine_efficacy(y=60);%median_n_any_cur_vaccine_efficacy(y=61);
%median_n_any_cur_vaccine_efficacy(y=62);%median_n_any_cur_vaccine_efficacy(y=63);%median_n_any_cur_vaccine_efficacy(y=64);%median_n_any_cur_vaccine_efficacy(y=65);%median_n_any_cur_vaccine_efficacy(y=66);%median_n_any_cur_vaccine_efficacy(y=67);
%median_n_any_cur_vaccine_efficacy(y=68);%median_n_any_cur_vaccine_efficacy(y=69);%median_n_any_cur_vaccine_efficacy(y=70);
data n_any_cur_vaccine_efficacy_3; merge n_any_cur_vaccine_efficacy_40_3 n_any_cur_vaccine_efficacy_41_3 n_any_cur_vaccine_efficacy_42_3 n_any_cur_vaccine_efficacy_43_3 n_any_cur_vaccine_efficacy_44_3 n_any_cur_vaccine_efficacy_45_3 n_any_cur_vaccine_efficacy_46_3 n_any_cur_vaccine_efficacy_47_3
n_any_cur_vaccine_efficacy_48_3 n_any_cur_vaccine_efficacy_49_3 n_any_cur_vaccine_efficacy_50_3 n_any_cur_vaccine_efficacy_51_3 n_any_cur_vaccine_efficacy_52_3 n_any_cur_vaccine_efficacy_53_3 n_any_cur_vaccine_efficacy_54_3 n_any_cur_vaccine_efficacy_55_3 n_any_cur_vaccine_efficacy_56_3 n_any_cur_vaccine_efficacy_57_3
n_any_cur_vaccine_efficacy_58_3 n_any_cur_vaccine_efficacy_59_3 n_any_cur_vaccine_efficacy_60_3 n_any_cur_vaccine_efficacy_61_3 n_any_cur_vaccine_efficacy_62_3 n_any_cur_vaccine_efficacy_63_3 n_any_cur_vaccine_efficacy_64_3 n_any_cur_vaccine_efficacy_65_3 n_any_cur_vaccine_efficacy_66_3 n_any_cur_vaccine_efficacy_67_3 
n_any_cur_vaccine_efficacy_68_3 n_any_cur_vaccine_efficacy_69_3 n_any_cur_vaccine_efficacy_70_3;drop _TYPE_ _FREQ_;


* n_boosted_this_year;
%macro 	median_n_boosted_this_year(y=);data ee; set e;keep n_boosted_this_year_&y._3 ; 
proc means noprint p50 data = e ;var n_boosted_this_year_&y._3 ;output out=n_boosted_this_year_&y._3 median = median_n_boosted_this_year_vac_&y. ; %mend;
%median_n_boosted_this_year(y=40);%median_n_boosted_this_year(y=41);%median_n_boosted_this_year(y=42);%median_n_boosted_this_year(y=43);
%median_n_boosted_this_year(y=44);%median_n_boosted_this_year(y=45);%median_n_boosted_this_year(y=46);%median_n_boosted_this_year(y=47);%median_n_boosted_this_year(y=48);%median_n_boosted_this_year(y=49);
%median_n_boosted_this_year(y=50);%median_n_boosted_this_year(y=51);%median_n_boosted_this_year(y=52);%median_n_boosted_this_year(y=53);%median_n_boosted_this_year(y=54);%median_n_boosted_this_year(y=55);
%median_n_boosted_this_year(y=56);%median_n_boosted_this_year(y=57);%median_n_boosted_this_year(y=58);%median_n_boosted_this_year(y=59);%median_n_boosted_this_year(y=60);%median_n_boosted_this_year(y=61);
%median_n_boosted_this_year(y=62);%median_n_boosted_this_year(y=63);%median_n_boosted_this_year(y=64);%median_n_boosted_this_year(y=65);%median_n_boosted_this_year(y=66);%median_n_boosted_this_year(y=67);
%median_n_boosted_this_year(y=68);%median_n_boosted_this_year(y=69);%median_n_boosted_this_year(y=70);
data n_boosted_this_year_3; merge n_boosted_this_year_40_3 n_boosted_this_year_41_3 n_boosted_this_year_42_3 n_boosted_this_year_43_3 n_boosted_this_year_44_3 n_boosted_this_year_45_3 n_boosted_this_year_46_3 n_boosted_this_year_47_3
n_boosted_this_year_48_3 n_boosted_this_year_49_3 n_boosted_this_year_50_3 n_boosted_this_year_51_3 n_boosted_this_year_52_3 n_boosted_this_year_53_3 n_boosted_this_year_54_3 n_boosted_this_year_55_3 n_boosted_this_year_56_3 n_boosted_this_year_57_3
n_boosted_this_year_58_3 n_boosted_this_year_59_3 n_boosted_this_year_60_3 n_boosted_this_year_61_3 n_boosted_this_year_62_3 n_boosted_this_year_63_3 n_boosted_this_year_64_3 n_boosted_this_year_65_3 n_boosted_this_year_66_3 n_boosted_this_year_67_3 
 n_boosted_this_year_68_3 n_boosted_this_year_69_3 n_boosted_this_year_70_3;drop _TYPE_ _FREQ_;




* HERE NEED DIFFERENCE IN DALYS PER RUN AND THEN MEDIAN;


* n_ddaly;
%macro median_n_ddaly(y=);data ee; set e;keep n_ddaly_&y._1 ; 
proc means noprint p50 data = e ;var n_ddaly_&y._1 ;output out=n_ddaly_&y._1 median = median_n_ddaly_no_vac_&y. ; %mend;
%median_n_ddaly(y=40);%median_n_ddaly(y=41);%median_n_ddaly(y=42);%median_n_ddaly(y=43);
%median_n_ddaly(y=44);%median_n_ddaly(y=45);%median_n_ddaly(y=46);%median_n_ddaly(y=47);%median_n_ddaly(y=48);%median_n_ddaly(y=49);
%median_n_ddaly(y=50);%median_n_ddaly(y=51);%median_n_ddaly(y=52);%median_n_ddaly(y=53);%median_n_ddaly(y=54);%median_n_ddaly(y=55);
%median_n_ddaly(y=56);%median_n_ddaly(y=57);%median_n_ddaly(y=58);%median_n_ddaly(y=59);%median_n_ddaly(y=60);%median_n_ddaly(y=61);
%median_n_ddaly(y=62);%median_n_ddaly(y=63);%median_n_ddaly(y=64);%median_n_ddaly(y=65);%median_n_ddaly(y=66);%median_n_ddaly(y=67);
%median_n_ddaly(y=68);%median_n_ddaly(y=69);%median_n_ddaly(y=70);
data n_ddaly_1; merge n_ddaly_40_1 n_ddaly_41_1 n_ddaly_42_1 n_ddaly_43_1 n_ddaly_44_1 n_ddaly_45_1 n_ddaly_46_1 n_ddaly_47_1
n_ddaly_48_1 n_ddaly_49_1 n_ddaly_50_1 n_ddaly_51_1 n_ddaly_52_1 n_ddaly_53_1 n_ddaly_54_1 n_ddaly_55_1 n_ddaly_56_1 n_ddaly_57_1
n_ddaly_58_1 n_ddaly_59_1 n_ddaly_60_1 n_ddaly_61_1 n_ddaly_62_1 n_ddaly_63_1 n_ddaly_64_1 n_ddaly_65_1 n_ddaly_66_1 n_ddaly_67_1  
n_ddaly_68_1 n_ddaly_69_1 n_ddaly_70_1;drop _TYPE_ _FREQ_;
%macro 	median_n_ddaly(y=);data ee; set e;keep n_ddaly_&y._3 ; 
proc means noprint p50 data = e ;var n_ddaly_&y._3 ;output out=n_ddaly_&y._3 median = median_n_ddaly_vac_&y. ; %mend;
%median_n_ddaly(y=40);%median_n_ddaly(y=41);%median_n_ddaly(y=42);%median_n_ddaly(y=43);
%median_n_ddaly(y=44);%median_n_ddaly(y=45);%median_n_ddaly(y=46);%median_n_ddaly(y=47);%median_n_ddaly(y=48);%median_n_ddaly(y=49);
%median_n_ddaly(y=50);%median_n_ddaly(y=51);%median_n_ddaly(y=52);%median_n_ddaly(y=53);%median_n_ddaly(y=54);%median_n_ddaly(y=55);
%median_n_ddaly(y=56);%median_n_ddaly(y=57);%median_n_ddaly(y=58);%median_n_ddaly(y=59);%median_n_ddaly(y=60);%median_n_ddaly(y=61);
%median_n_ddaly(y=62);%median_n_ddaly(y=63);%median_n_ddaly(y=64);%median_n_ddaly(y=65);%median_n_ddaly(y=66);%median_n_ddaly(y=67);
%median_n_ddaly(y=68);%median_n_ddaly(y=69);%median_n_ddaly(y=70);
data n_ddaly_3; merge n_ddaly_40_3 n_ddaly_41_3 n_ddaly_42_3 n_ddaly_43_3 n_ddaly_44_3 n_ddaly_45_3 n_ddaly_46_3 n_ddaly_47_3
n_ddaly_48_3 n_ddaly_49_3 n_ddaly_50_3 n_ddaly_51_3 n_ddaly_52_3 n_ddaly_53_3 n_ddaly_54_3 n_ddaly_55_3 n_ddaly_56_3 n_ddaly_57_3
n_ddaly_58_3 n_ddaly_59_3 n_ddaly_60_3 n_ddaly_61_3 n_ddaly_62_3 n_ddaly_63_3 n_ddaly_64_3 n_ddaly_65_3 n_ddaly_66_3 n_ddaly_67_3 
 n_ddaly_68_3 n_ddaly_69_3 n_ddaly_70_3;drop _TYPE_ _FREQ_;



data n ; merge n_alive
n_prep_elig
n_prep_oral
n_prep_inj
n_newp_ge1
n_ep 
n_new_vmmc 
incidence1549 
n_hiv_death 
p_vl1000 
n_ever_vaccinated 
n_cur_full_vaccine_efficacy 
n_any_cur_vaccine_efficacy 
n_vaccinated_this_year 
n_boosted_this_year 
n_ddaly ;
proc print; run;




