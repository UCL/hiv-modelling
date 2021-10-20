

* note this file tld_prep is used for prep also;
libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\art_retention";


libname b "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\art_retention\art_retention__out\";

libname c "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\art_retention\art_ret_out\";

* libname a '/home/rmjlaph/';

data d1 ; set b.out: ; 
data d2 ; set c.out: ; 

data d; set d1 d2;

proc sort data=d; 
by run cald option;run;


* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;

set d ;

if cald=2021.25;
s_alive = s_alive_m + s_alive_w ;
sf_2021 = 10000000 / s_alive;
* keep run sf_2021;
proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2021;


data y; 
merge d sf;
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
* note discounting is from 2021 - no adjustment needed;
* ts1m - this code needs to change for ts1m;

%let year_start_disc=2022.5;
discount_3py = 1/(1.03**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;


* ================================================================================= ;





* dalys and life years;

* ================================================================================= ;

ly = s_ly * &sf;
dly = s_dly * &sf;

s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * &sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * &sf * 4;


* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 


dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * &sf * 4; * odabe ;

ddaly_mtct = s_ddaly_mtct * &sf * 4;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * &sf * 4; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;

ddaly_80 = (s_live_ddaly_80 + s_dead_ddaly_80) * &sf * 4;

ddaly = (s_live_ddaly_80 + s_dead_ddaly_80) * &sf * 4  ;
daly = (s_live_daly_80 + s_dead_daly_80) * &sf * 4 ;


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

dzdv_cost = s_cost_zdv * &discount * &sf * 4 / 1000;
dten_cost = s_cost_ten * &discount * &sf * 4 / 1000;
d3tc_cost = s_cost_3tc * &discount * &sf * 4 / 1000; 
dnev_cost = s_cost_nev * &discount * &sf * 4 / 1000;
dlpr_cost = s_cost_lpr * &discount * &sf * 4 / 1000;
ddar_cost = s_cost_dar * &discount * &sf * 4 / 1000;
dtaz_cost = s_cost_taz * &discount * &sf * 4 / 1000;
defa_cost = s_cost_efa * &discount * &sf * 4 / 1000;
ddol_cost = s_cost_dol * &discount * &sf * 4 / 1000;


if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

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
dtest_cost_prep = s_dtest_cost_prep * &sf * 4 / 1000;  * note that this cost is part of dtest_cost so if want to change this cost need to subtract first from total cost;
dcot_cost = s_dcot_cost * &sf * 4 / 1000;
dres_cost = s_dres_cost * &sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * &sf * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * &sf * 4 / 1000;  
dcost_prep = s_dcost_prep * &sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * &sf * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * &sf * 4 / 1000; 


* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; * s_cost_child_hiv is discounted cost;
 

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

dcost_80 = s_dcost__80 * &sf * 4 / 1000;


* ================================================================================= ;

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
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;

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

* n_tested_m;					n_tested_m = s_tested_m * &sf * 4;
* n_tested_w;					n_tested_w = s_tested_f * &sf * 4;
* n_tested_sw;					n_tested_sw = s_tested_sw * &sf * 4;
* n_tested;						n_tested = s_tested * &sf * 4;

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

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then  
								prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp = s_sw_newp/s_sw_1564;


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
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;


* n_prep;						n_prep = s_prep * &sf;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * &sf;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * &sf;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * &sf;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * &sf;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * &sf;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * &sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * &sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * &sf;

* av_prep_eff_non_res_v;  		if s_prep > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep;								  
																			 
* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				if s_prep gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep ;


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

* incidence_onprep ; 			if s_prep > 0 then incidence_onprep  = (s_primary_prep * 4 * 100) / s_prep ;

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

*The meaning of the following is: among newly infected people, which proportion are SW, etc..;
* p_sw_newinf;				    p_sw_newinf = s_primary_sw / s_primary;		
* p_w1524_newinf;				p_w1524_newinf = sum(s_primary1519w,s_primary2024w) / s_primary;
* p_w25ov_newinf;				p_w25ov_newinf = sum(s_primary2529w,s_primary3034w,s_primary3539w,s_primary4044w,s_primary4549w,s_primary5054w,s_primary5559w,s_primary6064w) / s_primary;		
* p_m1524_newinf;				p_m1524_newinf = sum(s_primary1519m,s_primary2024m) / s_primary;
* p_m25ov_newinf;				p_m25ov_newinf = sum(s_primary2529m,s_primary3034m,s_primary3539m,s_primary4044m,s_primary4549m,s_primary5054m,s_primary5559m,s_primary6064m) / s_primary;		
end;

* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv1564 ;  p_diag = p_diag * 100;
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
* p_onart_artexp; 				if s_artexp > 0 then p_onart_artexp = s_onart / s_artexp;

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if s_hivge15 gt 0 then p_onart = s_onart / s_hivge15; 


* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;
* n_onart  ;					n_onart   = s_onart   * &sf;

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

* p_k65m_all;					p_k65m_all = s_k65m_ / (s_alive_w + s_alive_m) ;
* p_m184m_all;					p_m184m_all = s_m184m_ / (s_alive_w + s_alive_m) ;

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
* death_rate_hiv_ge15;			if s_hivge15 > 0 then death_rate_hiv_ge15 = (4 * 100 *	s_death_hivrel_allage) / s_hivge15 ;
* death_rate_hiv_ge15_all;		if s_alive > 0 then death_rate_hiv_ge15_all = (4 * 100 *	s_death_hivrel_allage) / s_alive ;


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


* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage  * 4* &sf;
* n_death_covid;				n_death_covid = s_death_dcause3_allage  * 4* &sf;
* n_death;						n_death = s_dead_allage  * 4 * &sf;
* n_covid;						n_covid = s_covid  * 4 * &sf;
* n_death_hivneg_anycause;		n_death_hivneg_anycause = s_dead_hivneg_anycause  * 4 * &sf;
* n_death_hivpos_anycause;		n_death_hivpos_anycause = s_dead_hivpos_anycause  * 4 * &sf;

* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
													
* n_cd4_lt200;					n_cd4_lt200 = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * &sf; 
* n_cd4_lt50;					n_cd4_lt50 = s_cd4_g1 * &sf; 

inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* number of women with hiv giving birth per year;

n_give_birth_w_hiv = s_give_birth_with_hiv * &sf * 4;
n_birth_with_inf_child = s_birth_with_inf_child * &sf * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * &sf * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * &sf * 4;  * annual number;
n_mcirc1549_ = s_mcirc_1549m * &sf * 4;
n_mcirc1549_3m = s_mcirc_1549m * &sf;
n_vmmc1549_ = s_vmmc1549m * &sf * 4;
n_vmmc1549_3m = s_vmmc1549m * &sf;
n_new_inf1549m = s_primary1549m * &sf * 4;
n_new_inf1549w = s_primary1549w * &sf * 4;
n_new_inf1549 = s_primary1549 * &sf * 4;
n_infection  = s_primary     * &sf * 4;

* n_alive;						n_alive = s_alive * &sf;
* n_restart; 					n_restart = s_restart * &sf;
* n_art_initiation;				n_art_initiation = s_art_initiation * &sf;
* n_hivge15;					n_hivge15 = s_hivge15 * &sf;
* n_onart;						n_onart = max(0,s_onart) * &sf;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * &sf;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * &sf;
* n_death;						n_death = s_dead_allage * &sf;
* n_covid;						n_covid = s_covid * &sf;

inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

* number of women with hiv giving birth per year;
n_give_birth_w_hiv = s_give_birth_with_hiv * &sf * 4;
n_birth_with_inf_child = s_birth_with_inf_child * &sf * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * &sf * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * &sf * 4;  * annual number;


n_mcirc1549_=s_mcirc_1549m * &sf * 4;
n_mcirc1549_3m=s_mcirc_1549m * &sf;

n_new_inf1549m = s_primary1549m * &sf * 4;
n_new_inf1549 = s_primary1549 * &sf * 4;
n_infection  = s_primary     * &sf * 4;

keep 

run option cald 

n_alive p_onart_artexp n_art_initiation n_restart p_onart_vl1000 n_hivge15 death_rate_hiv_ge15_all death_rate_hiv_ge15
ddaly daly incidence1549 incidence1549w incidence1549m prevalence1549 prevalence1549w prevalence1549m
p_diag_m   prop_w_1549_sw p_onart_diag_w 	p_onart_diag_m   p_vl1000	p_onart_vl1000_w	p_onart_vl1000_m p_onart_cd4_l500  
p_mcirc_1549m  p_startedline2  prop_sw_hiv p_newp_sw  aids_death_rate n_onart n_death_hivrel  prevalence_vg1000  dcost

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
prob_return_adc prob_lossdiag_adctb prob_lossdiag_who3e higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice 	eff_test_targeting
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
prep_strategy rate_sw_rred_rc  p_onart

;



proc sort data=y;by run option;run;

  data a.art_re_20_10_21;


set y;

data y; 

  set a.art_re_20_10_21; 
run;



  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

proc means noprint data=y; var &v; output out=y_22p5_0 mean= &v._22p5_0; by run ; where cald = 2022.5 and option=0; 
proc means noprint data=y; var &v; output out=y_22p5_1 mean= &v._22p5_1; by run ; where cald = 2022.5 and option=1; 
proc means noprint data=y; var &v; output out=y_22p5_2 mean= &v._22p5_2; by run ; where cald = 2022.5 and option=2; 
proc means noprint data=y; var &v; output out=y_22p5_3 mean= &v._22p5_3; by run ; where cald = 2022.5 and option=3; 
proc means noprint data=y; var &v; output out=y_22p5_4 mean= &v._22p5_4; by run ; where cald = 2022.5 and option=4; 

proc means noprint data=y; var &v; output out=y_89_0 mean= &v._89_0; by run ; where 1989 <= cald < 1990 and option=0; 
proc means noprint data=y; var &v; output out=y_90_0 mean= &v._90_0; by run ; where 1990 <= cald < 1991 and option=0; 
proc means noprint data=y; var &v; output out=y_91_0 mean= &v._91_0; by run ; where 1991 <= cald < 1992 and option=0; 
proc means noprint data=y; var &v; output out=y_92_0 mean= &v._92_0; by run ; where 1992 <= cald < 1993 and option=0; 
proc means noprint data=y; var &v; output out=y_93_0 mean= &v._93_0; by run ; where 1993 <= cald < 1994 and option=0; 
proc means noprint data=y; var &v; output out=y_94_0 mean= &v._94_0; by run ; where 1994 <= cald < 1995 and option=0; 
proc means noprint data=y; var &v; output out=y_95_0 mean= &v._95_0; by run ; where 1995 <= cald < 1996 and option=0; 
proc means noprint data=y; var &v; output out=y_96_0 mean= &v._96_0; by run ; where 1996 <= cald < 1997 and option=0; 
proc means noprint data=y; var &v; output out=y_97_0 mean= &v._97_0; by run ; where 1997 <= cald < 1998 and option=0; 
proc means noprint data=y; var &v; output out=y_98_0 mean= &v._98_0; by run ; where 1998 <= cald < 1999 and option=0; 
proc means noprint data=y; var &v; output out=y_99_0 mean= &v._99_0; by run ; where 1999 <= cald < 2000 and option=0; 
proc means noprint data=y; var &v; output out=y_00_0 mean= &v._00_0; by run ; where 2000 <= cald < 2001 and option=0; 
proc means noprint data=y; var &v; output out=y_01_0 mean= &v._01_0; by run ; where 2001 <= cald < 2002 and option=0; 
proc means noprint data=y; var &v; output out=y_02_0 mean= &v._02_0; by run ; where 2002 <= cald < 2003 and option=0; 
proc means noprint data=y; var &v; output out=y_03_0 mean= &v._03_0; by run ; where 2003 <= cald < 2004 and option=0; 
proc means noprint data=y; var &v; output out=y_04_0 mean= &v._04_0; by run ; where 2004 <= cald < 2005 and option=0; 
proc means noprint data=y; var &v; output out=y_05_0 mean= &v._05_0; by run ; where 2005 <= cald < 2006 and option=0; 
proc means noprint data=y; var &v; output out=y_06_0 mean= &v._06_0; by run ; where 2006 <= cald < 2007 and option=0; 
proc means noprint data=y; var &v; output out=y_07_0 mean= &v._07_0; by run ; where 2007 <= cald < 2008 and option=0; 
proc means noprint data=y; var &v; output out=y_08_0 mean= &v._08_0; by run ; where 2008 <= cald < 2009 and option=0; 
proc means noprint data=y; var &v; output out=y_09_0 mean= &v._09_0; by run ; where 2009 <= cald < 2010 and option=0; 
proc means noprint data=y; var &v; output out=y_10_0 mean= &v._10_0; by run ; where 2010 <= cald < 2011 and option=0; 
proc means noprint data=y; var &v; output out=y_11_0 mean= &v._11_0; by run ; where 2011 <= cald < 2012 and option=0; 
proc means noprint data=y; var &v; output out=y_12_0 mean= &v._12_0; by run ; where 2012 <= cald < 2013 and option=0; 
proc means noprint data=y; var &v; output out=y_13_0 mean= &v._13_0; by run ; where 2013 <= cald < 2014 and option=0; 
proc means noprint data=y; var &v; output out=y_14_0 mean= &v._14_0; by run ; where 2014 <= cald < 2015 and option=0; 
proc means noprint data=y; var &v; output out=y_15_0 mean= &v._15_0; by run ; where 2015 <= cald < 2016 and option=0; 
proc means noprint data=y; var &v; output out=y_16_0 mean= &v._16_0; by run ; where 2016 <= cald < 2017 and option=0; 
proc means noprint data=y; var &v; output out=y_17_0 mean= &v._17_0; by run ; where 2017 <= cald < 2018 and option=0; 
proc means noprint data=y; var &v; output out=y_18_0 mean= &v._18_0; by run ; where 2018 <= cald < 2019 and option=0; 
proc means noprint data=y; var &v; output out=y_19_0 mean= &v._19_0; by run ; where 2019 <= cald < 2020 and option=0; 
proc means noprint data=y; var &v; output out=y_20_0 mean= &v._20_0; by run ; where 2020 <= cald < 2021 and option=0; 
proc means noprint data=y; var &v; output out=y_21_0 mean= &v._21_0; by run ; where 2021 <= cald < 2022 and option=0; 
proc means noprint data=y; var &v; output out=y_22_0 mean= &v._22_0; by run ; where 2022 <= cald < 2023 and option=0; 
proc means noprint data=y; var &v; output out=y_23_0 mean= &v._23_0; by run ; where 2023 <= cald < 2024 and option=0; 
proc means noprint data=y; var &v; output out=y_24_0 mean= &v._24_0; by run ; where 2024 <= cald < 2025 and option=0; 
proc means noprint data=y; var &v; output out=y_25_0 mean= &v._25_0; by run ; where 2025 <= cald < 2026 and option=0; 
proc means noprint data=y; var &v; output out=y_26_0 mean= &v._26_0; by run ; where 2026 <= cald < 2027 and option=0; 
proc means noprint data=y; var &v; output out=y_27_0 mean= &v._27_0; by run ; where 2027 <= cald < 2028 and option=0; 
proc means noprint data=y; var &v; output out=y_28_0 mean= &v._28_0; by run ; where 2028 <= cald < 2029 and option=0; 
proc means noprint data=y; var &v; output out=y_29_0 mean= &v._29_0; by run ; where 2029 <= cald < 2030 and option=0; 
proc means noprint data=y; var &v; output out=y_30_0 mean= &v._30_0; by run ; where 2030 <= cald < 2031 and option=0; 
proc means noprint data=y; var &v; output out=y_31_0 mean= &v._31_0; by run ; where 2031 <= cald < 2032 and option=0; 
proc means noprint data=y; var &v; output out=y_32_0 mean= &v._32_0; by run ; where 2032 <= cald < 2033 and option=0; 
proc means noprint data=y; var &v; output out=y_33_0 mean= &v._33_0; by run ; where 2033 <= cald < 2034 and option=0; 
proc means noprint data=y; var &v; output out=y_34_0 mean= &v._34_0; by run ; where 2034 <= cald < 2035 and option=0; 
proc means noprint data=y; var &v; output out=y_35_0 mean= &v._35_0; by run ; where 2035 <= cald < 2036 and option=0; 
proc means noprint data=y; var &v; output out=y_36_0 mean= &v._36_0; by run ; where 2036 <= cald < 2037 and option=0; 
proc means noprint data=y; var &v; output out=y_37_0 mean= &v._37_0; by run ; where 2037 <= cald < 2038 and option=0; 
proc means noprint data=y; var &v; output out=y_38_0 mean= &v._38_0; by run ; where 2038 <= cald < 2039 and option=0; 
proc means noprint data=y; var &v; output out=y_39_0 mean= &v._39_0; by run ; where 2039 <= cald < 2040 and option=0; 
proc means noprint data=y; var &v; output out=y_40_0 mean= &v._40_0; by run ; where 2040 <= cald < 2041 and option=0; 
proc means noprint data=y; var &v; output out=y_41_0 mean= &v._41_0; by run ; where 2041 <= cald < 2042 and option=0; 
proc means noprint data=y; var &v; output out=y_42_0 mean= &v._42_0; by run ; where 2042 <= cald < 2043 and option=0; 
proc means noprint data=y; var &v; output out=y_43_0 mean= &v._43_0; by run ; where 2043 <= cald < 2044 and option=0; 
proc means noprint data=y; var &v; output out=y_44_0 mean= &v._44_0; by run ; where 2044 <= cald < 2045 and option=0; 
proc means noprint data=y; var &v; output out=y_45_0 mean= &v._45_0; by run ; where 2045 <= cald < 2046 and option=0; 
proc means noprint data=y; var &v; output out=y_46_0 mean= &v._46_0; by run ; where 2046 <= cald < 2047 and option=0; 
proc means noprint data=y; var &v; output out=y_47_0 mean= &v._47_0; by run ; where 2047 <= cald < 2048 and option=0; 
proc means noprint data=y; var &v; output out=y_48_0 mean= &v._48_0; by run ; where 2048 <= cald < 2049 and option=0; 
proc means noprint data=y; var &v; output out=y_49_0 mean= &v._49_0; by run ; where 2049 <= cald < 2050 and option=0; 
proc means noprint data=y; var &v; output out=y_50_0 mean= &v._50_0; by run ; where 2050 <= cald < 2051 and option=0; 
proc means noprint data=y; var &v; output out=y_51_0 mean= &v._51_0; by run ; where 2051 <= cald < 2052 and option=0; 
proc means noprint data=y; var &v; output out=y_52_0 mean= &v._52_0; by run ; where 2052 <= cald < 2053 and option=0; 
proc means noprint data=y; var &v; output out=y_53_0 mean= &v._53_0; by run ; where 2053 <= cald < 2054 and option=0; 
proc means noprint data=y; var &v; output out=y_54_0 mean= &v._54_0; by run ; where 2054 <= cald < 2055 and option=0; 
proc means noprint data=y; var &v; output out=y_55_0 mean= &v._55_0; by run ; where 2055 <= cald < 2056 and option=0; 
proc means noprint data=y; var &v; output out=y_56_0 mean= &v._56_0; by run ; where 2056 <= cald < 2057 and option=0; 
proc means noprint data=y; var &v; output out=y_57_0 mean= &v._57_0; by run ; where 2057 <= cald < 2058 and option=0; 
proc means noprint data=y; var &v; output out=y_58_0 mean= &v._58_0; by run ; where 2058 <= cald < 2059 and option=0; 
proc means noprint data=y; var &v; output out=y_59_0 mean= &v._59_0; by run ; where 2059 <= cald < 2060 and option=0; 
proc means noprint data=y; var &v; output out=y_60_0 mean= &v._60_0; by run ; where 2060 <= cald < 2061 and option=0; 
proc means noprint data=y; var &v; output out=y_61_0 mean= &v._61_0; by run ; where 2061 <= cald < 2062 and option=0; 
proc means noprint data=y; var &v; output out=y_62_0 mean= &v._62_0; by run ; where 2062 <= cald < 2063 and option=0; 
proc means noprint data=y; var &v; output out=y_63_0 mean= &v._63_0; by run ; where 2063 <= cald < 2064 and option=0; 
proc means noprint data=y; var &v; output out=y_64_0 mean= &v._64_0; by run ; where 2064 <= cald < 2065 and option=0; 
proc means noprint data=y; var &v; output out=y_65_0 mean= &v._65_0; by run ; where 2065 <= cald < 2066 and option=0; 
proc means noprint data=y; var &v; output out=y_66_0 mean= &v._66_0; by run ; where 2066 <= cald < 2067 and option=0; 
proc means noprint data=y; var &v; output out=y_67_0 mean= &v._67_0; by run ; where 2067 <= cald < 2068 and option=0; 
proc means noprint data=y; var &v; output out=y_68_0 mean= &v._68_0; by run ; where 2068 <= cald < 2069 and option=0; 
proc means noprint data=y; var &v; output out=y_69_0 mean= &v._69_0; by run ; where 2069 <= cald < 2070 and option=0; 
proc means noprint data=y; var &v; output out=y_70_0 mean= &v._70_0; by run ; where 2070 <= cald < 2071 and option=0; 

proc means noprint data=y; var &v; output out=y_21_1 mean= &v._21_1; by run ; where 2021 <= cald < 2022 and option=1; 
proc means noprint data=y; var &v; output out=y_22_1 mean= &v._22_1; by run ; where 2022 <= cald < 2023 and option=1; 
proc means noprint data=y; var &v; output out=y_23_1 mean= &v._23_1; by run ; where 2023 <= cald < 2024 and option=1; 
proc means noprint data=y; var &v; output out=y_24_1 mean= &v._24_1; by run ; where 2024 <= cald < 2025 and option=1; 
proc means noprint data=y; var &v; output out=y_25_1 mean= &v._25_1; by run ; where 2025 <= cald < 2026 and option=1; 
proc means noprint data=y; var &v; output out=y_26_1 mean= &v._26_1; by run ; where 2026 <= cald < 2027 and option=1; 
proc means noprint data=y; var &v; output out=y_27_1 mean= &v._27_1; by run ; where 2027 <= cald < 2028 and option=1; 
proc means noprint data=y; var &v; output out=y_28_1 mean= &v._28_1; by run ; where 2028 <= cald < 2029 and option=1; 
proc means noprint data=y; var &v; output out=y_29_1 mean= &v._29_1; by run ; where 2029 <= cald < 2030 and option=1; 
proc means noprint data=y; var &v; output out=y_30_1 mean= &v._30_1; by run ; where 2030 <= cald < 2031 and option=1; 
proc means noprint data=y; var &v; output out=y_31_1 mean= &v._31_1; by run ; where 2031 <= cald < 2032 and option=1; 
proc means noprint data=y; var &v; output out=y_32_1 mean= &v._32_1; by run ; where 2032 <= cald < 2033 and option=1; 
proc means noprint data=y; var &v; output out=y_33_1 mean= &v._33_1; by run ; where 2033 <= cald < 2034 and option=1; 
proc means noprint data=y; var &v; output out=y_34_1 mean= &v._34_1; by run ; where 2034 <= cald < 2035 and option=1; 
proc means noprint data=y; var &v; output out=y_35_1 mean= &v._35_1; by run ; where 2035 <= cald < 2036 and option=1; 
proc means noprint data=y; var &v; output out=y_36_1 mean= &v._36_1; by run ; where 2036 <= cald < 2037 and option=1; 
proc means noprint data=y; var &v; output out=y_37_1 mean= &v._37_1; by run ; where 2037 <= cald < 2038 and option=1; 
proc means noprint data=y; var &v; output out=y_38_1 mean= &v._38_1; by run ; where 2038 <= cald < 2039 and option=1; 
proc means noprint data=y; var &v; output out=y_39_1 mean= &v._39_1; by run ; where 2039 <= cald < 2040 and option=1; 
proc means noprint data=y; var &v; output out=y_40_1 mean= &v._40_1; by run ; where 2040 <= cald < 2041 and option=1; 
proc means noprint data=y; var &v; output out=y_41_1 mean= &v._41_1; by run ; where 2041 <= cald < 2042 and option=1; 
proc means noprint data=y; var &v; output out=y_42_1 mean= &v._42_1; by run ; where 2042 <= cald < 2043 and option=1; 
proc means noprint data=y; var &v; output out=y_43_1 mean= &v._43_1; by run ; where 2043 <= cald < 2044 and option=1; 
proc means noprint data=y; var &v; output out=y_44_1 mean= &v._44_1; by run ; where 2044 <= cald < 2045 and option=1; 
proc means noprint data=y; var &v; output out=y_45_1 mean= &v._45_1; by run ; where 2045 <= cald < 2046 and option=1; 
proc means noprint data=y; var &v; output out=y_46_1 mean= &v._46_1; by run ; where 2046 <= cald < 2047 and option=1; 
proc means noprint data=y; var &v; output out=y_47_1 mean= &v._47_1; by run ; where 2047 <= cald < 2048 and option=1; 
proc means noprint data=y; var &v; output out=y_48_1 mean= &v._48_1; by run ; where 2048 <= cald < 2049 and option=1; 
proc means noprint data=y; var &v; output out=y_49_1 mean= &v._49_1; by run ; where 2049 <= cald < 2050 and option=1; 
proc means noprint data=y; var &v; output out=y_50_1 mean= &v._50_1; by run ; where 2050 <= cald < 2051 and option=1; 
proc means noprint data=y; var &v; output out=y_51_1 mean= &v._51_1; by run ; where 2051 <= cald < 2052 and option=1; 
proc means noprint data=y; var &v; output out=y_52_1 mean= &v._52_1; by run ; where 2052 <= cald < 2053 and option=1; 
proc means noprint data=y; var &v; output out=y_53_1 mean= &v._53_1; by run ; where 2053 <= cald < 2054 and option=1; 
proc means noprint data=y; var &v; output out=y_54_1 mean= &v._54_1; by run ; where 2054 <= cald < 2055 and option=1; 
proc means noprint data=y; var &v; output out=y_55_1 mean= &v._55_1; by run ; where 2055 <= cald < 2056 and option=1; 
proc means noprint data=y; var &v; output out=y_56_1 mean= &v._56_1; by run ; where 2056 <= cald < 2057 and option=1; 
proc means noprint data=y; var &v; output out=y_57_1 mean= &v._57_1; by run ; where 2057 <= cald < 2058 and option=1; 
proc means noprint data=y; var &v; output out=y_58_1 mean= &v._58_1; by run ; where 2058 <= cald < 2059 and option=1; 
proc means noprint data=y; var &v; output out=y_59_1 mean= &v._59_1; by run ; where 2059 <= cald < 2060 and option=1; 
proc means noprint data=y; var &v; output out=y_60_1 mean= &v._60_1; by run ; where 2060 <= cald < 2061 and option=1; 
proc means noprint data=y; var &v; output out=y_61_1 mean= &v._61_1; by run ; where 2061 <= cald < 2062 and option=1; 
proc means noprint data=y; var &v; output out=y_62_1 mean= &v._62_1; by run ; where 2062 <= cald < 2063 and option=1; 
proc means noprint data=y; var &v; output out=y_63_1 mean= &v._63_1; by run ; where 2063 <= cald < 2064 and option=1; 
proc means noprint data=y; var &v; output out=y_64_1 mean= &v._64_1; by run ; where 2064 <= cald < 2065 and option=1; 
proc means noprint data=y; var &v; output out=y_65_1 mean= &v._65_1; by run ; where 2065 <= cald < 2066 and option=1; 
proc means noprint data=y; var &v; output out=y_66_1 mean= &v._66_1; by run ; where 2066 <= cald < 2067 and option=1; 
proc means noprint data=y; var &v; output out=y_67_1 mean= &v._67_1; by run ; where 2067 <= cald < 2068 and option=1; 
proc means noprint data=y; var &v; output out=y_68_1 mean= &v._68_1; by run ; where 2068 <= cald < 2069 and option=1; 
proc means noprint data=y; var &v; output out=y_69_1 mean= &v._69_1; by run ; where 2069 <= cald < 2070 and option=1; 
proc means noprint data=y; var &v; output out=y_70_1 mean= &v._70_1; by run ; where 2070 <= cald < 2071 and option=1; 

proc means noprint data=y; var &v; output out=y_21_2 mean= &v._21_2; by run ; where 2021 <= cald < 2022 and option=2; 
proc means noprint data=y; var &v; output out=y_22_2 mean= &v._22_2; by run ; where 2022 <= cald < 2023 and option=2; 
proc means noprint data=y; var &v; output out=y_23_2 mean= &v._23_2; by run ; where 2023 <= cald < 2024 and option=2; 
proc means noprint data=y; var &v; output out=y_24_2 mean= &v._24_2; by run ; where 2024 <= cald < 2025 and option=2; 
proc means noprint data=y; var &v; output out=y_25_2 mean= &v._25_2; by run ; where 2025 <= cald < 2026 and option=2; 
proc means noprint data=y; var &v; output out=y_26_2 mean= &v._26_2; by run ; where 2026 <= cald < 2027 and option=2; 
proc means noprint data=y; var &v; output out=y_27_2 mean= &v._27_2; by run ; where 2027 <= cald < 2028 and option=2; 
proc means noprint data=y; var &v; output out=y_28_2 mean= &v._28_2; by run ; where 2028 <= cald < 2029 and option=2; 
proc means noprint data=y; var &v; output out=y_29_2 mean= &v._29_2; by run ; where 2029 <= cald < 2030 and option=2; 
proc means noprint data=y; var &v; output out=y_30_2 mean= &v._30_2; by run ; where 2030 <= cald < 2031 and option=2; 
proc means noprint data=y; var &v; output out=y_31_2 mean= &v._31_2; by run ; where 2031 <= cald < 2032 and option=2; 
proc means noprint data=y; var &v; output out=y_32_2 mean= &v._32_2; by run ; where 2032 <= cald < 2033 and option=2; 
proc means noprint data=y; var &v; output out=y_33_2 mean= &v._33_2; by run ; where 2033 <= cald < 2034 and option=2; 
proc means noprint data=y; var &v; output out=y_34_2 mean= &v._34_2; by run ; where 2034 <= cald < 2035 and option=2; 
proc means noprint data=y; var &v; output out=y_35_2 mean= &v._35_2; by run ; where 2035 <= cald < 2036 and option=2; 
proc means noprint data=y; var &v; output out=y_36_2 mean= &v._36_2; by run ; where 2036 <= cald < 2037 and option=2; 
proc means noprint data=y; var &v; output out=y_37_2 mean= &v._37_2; by run ; where 2037 <= cald < 2038 and option=2; 
proc means noprint data=y; var &v; output out=y_38_2 mean= &v._38_2; by run ; where 2038 <= cald < 2039 and option=2; 
proc means noprint data=y; var &v; output out=y_39_2 mean= &v._39_2; by run ; where 2039 <= cald < 2040 and option=2; 
proc means noprint data=y; var &v; output out=y_40_2 mean= &v._40_2; by run ; where 2040 <= cald < 2041 and option=2; 
proc means noprint data=y; var &v; output out=y_41_2 mean= &v._41_2; by run ; where 2041 <= cald < 2042 and option=2; 
proc means noprint data=y; var &v; output out=y_42_2 mean= &v._42_2; by run ; where 2042 <= cald < 2043 and option=2; 
proc means noprint data=y; var &v; output out=y_43_2 mean= &v._43_2; by run ; where 2043 <= cald < 2044 and option=2; 
proc means noprint data=y; var &v; output out=y_44_2 mean= &v._44_2; by run ; where 2044 <= cald < 2045 and option=2; 
proc means noprint data=y; var &v; output out=y_45_2 mean= &v._45_2; by run ; where 2045 <= cald < 2046 and option=2; 
proc means noprint data=y; var &v; output out=y_46_2 mean= &v._46_2; by run ; where 2046 <= cald < 2047 and option=2; 
proc means noprint data=y; var &v; output out=y_47_2 mean= &v._47_2; by run ; where 2047 <= cald < 2048 and option=2; 
proc means noprint data=y; var &v; output out=y_48_2 mean= &v._48_2; by run ; where 2048 <= cald < 2049 and option=2; 
proc means noprint data=y; var &v; output out=y_49_2 mean= &v._49_2; by run ; where 2049 <= cald < 2050 and option=2; 
proc means noprint data=y; var &v; output out=y_50_2 mean= &v._50_2; by run ; where 2050 <= cald < 2051 and option=2; 
proc means noprint data=y; var &v; output out=y_51_2 mean= &v._51_2; by run ; where 2051 <= cald < 2052 and option=2; 
proc means noprint data=y; var &v; output out=y_52_2 mean= &v._52_2; by run ; where 2052 <= cald < 2053 and option=2; 
proc means noprint data=y; var &v; output out=y_53_2 mean= &v._53_2; by run ; where 2053 <= cald < 2054 and option=2; 
proc means noprint data=y; var &v; output out=y_54_2 mean= &v._54_2; by run ; where 2054 <= cald < 2055 and option=2; 
proc means noprint data=y; var &v; output out=y_55_2 mean= &v._55_2; by run ; where 2055 <= cald < 2056 and option=2; 
proc means noprint data=y; var &v; output out=y_56_2 mean= &v._56_2; by run ; where 2056 <= cald < 2057 and option=2; 
proc means noprint data=y; var &v; output out=y_57_2 mean= &v._57_2; by run ; where 2057 <= cald < 2058 and option=2; 
proc means noprint data=y; var &v; output out=y_58_2 mean= &v._58_2; by run ; where 2058 <= cald < 2059 and option=2; 
proc means noprint data=y; var &v; output out=y_59_2 mean= &v._59_2; by run ; where 2059 <= cald < 2060 and option=2; 
proc means noprint data=y; var &v; output out=y_60_2 mean= &v._60_2; by run ; where 2060 <= cald < 2061 and option=2; 
proc means noprint data=y; var &v; output out=y_61_2 mean= &v._61_2; by run ; where 2061 <= cald < 2062 and option=2; 
proc means noprint data=y; var &v; output out=y_62_2 mean= &v._62_2; by run ; where 2062 <= cald < 2063 and option=2; 
proc means noprint data=y; var &v; output out=y_63_2 mean= &v._63_2; by run ; where 2063 <= cald < 2064 and option=2; 
proc means noprint data=y; var &v; output out=y_64_2 mean= &v._64_2; by run ; where 2064 <= cald < 2065 and option=2; 
proc means noprint data=y; var &v; output out=y_65_2 mean= &v._65_2; by run ; where 2065 <= cald < 2066 and option=2; 
proc means noprint data=y; var &v; output out=y_66_2 mean= &v._66_2; by run ; where 2066 <= cald < 2067 and option=2; 
proc means noprint data=y; var &v; output out=y_67_2 mean= &v._67_2; by run ; where 2067 <= cald < 2068 and option=2; 
proc means noprint data=y; var &v; output out=y_68_2 mean= &v._68_2; by run ; where 2068 <= cald < 2069 and option=2; 
proc means noprint data=y; var &v; output out=y_69_2 mean= &v._69_2; by run ; where 2069 <= cald < 2070 and option=2; 
proc means noprint data=y; var &v; output out=y_70_2 mean= &v._70_2; by run ; where 2070 <= cald < 2071 and option=2; 

proc means noprint data=y; var &v; output out=y_21_3 mean= &v._21_3; by run ; where 2021 <= cald < 2022 and option=3; 
proc means noprint data=y; var &v; output out=y_22_3 mean= &v._22_3; by run ; where 2022 <= cald < 2023 and option=3; 
proc means noprint data=y; var &v; output out=y_23_3 mean= &v._23_3; by run ; where 2023 <= cald < 2024 and option=3; 
proc means noprint data=y; var &v; output out=y_24_3 mean= &v._24_3; by run ; where 2024 <= cald < 2025 and option=3; 
proc means noprint data=y; var &v; output out=y_25_3 mean= &v._25_3; by run ; where 2025 <= cald < 2026 and option=3; 
proc means noprint data=y; var &v; output out=y_26_3 mean= &v._26_3; by run ; where 2026 <= cald < 2027 and option=3; 
proc means noprint data=y; var &v; output out=y_27_3 mean= &v._27_3; by run ; where 2027 <= cald < 2028 and option=3; 
proc means noprint data=y; var &v; output out=y_28_3 mean= &v._28_3; by run ; where 2028 <= cald < 2029 and option=3; 
proc means noprint data=y; var &v; output out=y_29_3 mean= &v._29_3; by run ; where 2029 <= cald < 2030 and option=3; 
proc means noprint data=y; var &v; output out=y_30_3 mean= &v._30_3; by run ; where 2030 <= cald < 2031 and option=3; 
proc means noprint data=y; var &v; output out=y_31_3 mean= &v._31_3; by run ; where 2031 <= cald < 2032 and option=3; 
proc means noprint data=y; var &v; output out=y_32_3 mean= &v._32_3; by run ; where 2032 <= cald < 2033 and option=3; 
proc means noprint data=y; var &v; output out=y_33_3 mean= &v._33_3; by run ; where 2033 <= cald < 2034 and option=3; 
proc means noprint data=y; var &v; output out=y_34_3 mean= &v._34_3; by run ; where 2034 <= cald < 2035 and option=3; 
proc means noprint data=y; var &v; output out=y_35_3 mean= &v._35_3; by run ; where 2035 <= cald < 2036 and option=3; 
proc means noprint data=y; var &v; output out=y_36_3 mean= &v._36_3; by run ; where 2036 <= cald < 2037 and option=3; 
proc means noprint data=y; var &v; output out=y_37_3 mean= &v._37_3; by run ; where 2037 <= cald < 2038 and option=3; 
proc means noprint data=y; var &v; output out=y_38_3 mean= &v._38_3; by run ; where 2038 <= cald < 2039 and option=3; 
proc means noprint data=y; var &v; output out=y_39_3 mean= &v._39_3; by run ; where 2039 <= cald < 2040 and option=3; 
proc means noprint data=y; var &v; output out=y_40_3 mean= &v._40_3; by run ; where 2040 <= cald < 2041 and option=3; 
proc means noprint data=y; var &v; output out=y_41_3 mean= &v._41_3; by run ; where 2041 <= cald < 2042 and option=3; 
proc means noprint data=y; var &v; output out=y_42_3 mean= &v._42_3; by run ; where 2042 <= cald < 2043 and option=3; 
proc means noprint data=y; var &v; output out=y_43_3 mean= &v._43_3; by run ; where 2043 <= cald < 2044 and option=3; 
proc means noprint data=y; var &v; output out=y_44_3 mean= &v._44_3; by run ; where 2044 <= cald < 2045 and option=3; 
proc means noprint data=y; var &v; output out=y_45_3 mean= &v._45_3; by run ; where 2045 <= cald < 2046 and option=3; 
proc means noprint data=y; var &v; output out=y_46_3 mean= &v._46_3; by run ; where 2046 <= cald < 2047 and option=3; 
proc means noprint data=y; var &v; output out=y_47_3 mean= &v._47_3; by run ; where 2047 <= cald < 2048 and option=3; 
proc means noprint data=y; var &v; output out=y_48_3 mean= &v._48_3; by run ; where 2048 <= cald < 2049 and option=3; 
proc means noprint data=y; var &v; output out=y_49_3 mean= &v._49_3; by run ; where 2049 <= cald < 2050 and option=3; 
proc means noprint data=y; var &v; output out=y_50_3 mean= &v._50_3; by run ; where 2050 <= cald < 2051 and option=3; 
proc means noprint data=y; var &v; output out=y_51_3 mean= &v._51_3; by run ; where 2051 <= cald < 2052 and option=3; 
proc means noprint data=y; var &v; output out=y_52_3 mean= &v._52_3; by run ; where 2052 <= cald < 2053 and option=3; 
proc means noprint data=y; var &v; output out=y_53_3 mean= &v._53_3; by run ; where 2053 <= cald < 2054 and option=3; 
proc means noprint data=y; var &v; output out=y_54_3 mean= &v._54_3; by run ; where 2054 <= cald < 2055 and option=3; 
proc means noprint data=y; var &v; output out=y_55_3 mean= &v._55_3; by run ; where 2055 <= cald < 2056 and option=3; 
proc means noprint data=y; var &v; output out=y_56_3 mean= &v._56_3; by run ; where 2056 <= cald < 2057 and option=3; 
proc means noprint data=y; var &v; output out=y_57_3 mean= &v._57_3; by run ; where 2057 <= cald < 2058 and option=3; 
proc means noprint data=y; var &v; output out=y_58_3 mean= &v._58_3; by run ; where 2058 <= cald < 2059 and option=3; 
proc means noprint data=y; var &v; output out=y_59_3 mean= &v._59_3; by run ; where 2059 <= cald < 2060 and option=3; 
proc means noprint data=y; var &v; output out=y_60_3 mean= &v._60_3; by run ; where 2060 <= cald < 2061 and option=3; 
proc means noprint data=y; var &v; output out=y_61_3 mean= &v._61_3; by run ; where 2061 <= cald < 2062 and option=3; 
proc means noprint data=y; var &v; output out=y_62_3 mean= &v._62_3; by run ; where 2062 <= cald < 2063 and option=3; 
proc means noprint data=y; var &v; output out=y_63_3 mean= &v._63_3; by run ; where 2063 <= cald < 2064 and option=3; 
proc means noprint data=y; var &v; output out=y_64_3 mean= &v._64_3; by run ; where 2064 <= cald < 2065 and option=3; 
proc means noprint data=y; var &v; output out=y_65_3 mean= &v._65_3; by run ; where 2065 <= cald < 2066 and option=3; 
proc means noprint data=y; var &v; output out=y_66_3 mean= &v._66_3; by run ; where 2066 <= cald < 2067 and option=3; 
proc means noprint data=y; var &v; output out=y_67_3 mean= &v._67_3; by run ; where 2067 <= cald < 2068 and option=3; 
proc means noprint data=y; var &v; output out=y_68_3 mean= &v._68_3; by run ; where 2068 <= cald < 2069 and option=3; 
proc means noprint data=y; var &v; output out=y_69_3 mean= &v._69_3; by run ; where 2069 <= cald < 2070 and option=3; 
proc means noprint data=y; var &v; output out=y_70_3 mean= &v._70_3; by run ; where 2070 <= cald < 2071 and option=3; 

proc means noprint data=y; var &v; output out=y_21_4 mean= &v._21_4; by run ; where 2021 <= cald < 2022 and option=4; 
proc means noprint data=y; var &v; output out=y_22_4 mean= &v._22_4; by run ; where 2022 <= cald < 2023 and option=4; 
proc means noprint data=y; var &v; output out=y_23_4 mean= &v._23_4; by run ; where 2023 <= cald < 2024 and option=4; 
proc means noprint data=y; var &v; output out=y_24_4 mean= &v._24_4; by run ; where 2024 <= cald < 2025 and option=4; 
proc means noprint data=y; var &v; output out=y_25_4 mean= &v._25_4; by run ; where 2025 <= cald < 2026 and option=4; 
proc means noprint data=y; var &v; output out=y_26_4 mean= &v._26_4; by run ; where 2026 <= cald < 2027 and option=4; 
proc means noprint data=y; var &v; output out=y_27_4 mean= &v._27_4; by run ; where 2027 <= cald < 2028 and option=4; 
proc means noprint data=y; var &v; output out=y_28_4 mean= &v._28_4; by run ; where 2028 <= cald < 2029 and option=4; 
proc means noprint data=y; var &v; output out=y_29_4 mean= &v._29_4; by run ; where 2029 <= cald < 2030 and option=4; 
proc means noprint data=y; var &v; output out=y_30_4 mean= &v._30_4; by run ; where 2030 <= cald < 2031 and option=4; 
proc means noprint data=y; var &v; output out=y_31_4 mean= &v._31_4; by run ; where 2031 <= cald < 2032 and option=4; 
proc means noprint data=y; var &v; output out=y_32_4 mean= &v._32_4; by run ; where 2032 <= cald < 2033 and option=4; 
proc means noprint data=y; var &v; output out=y_33_4 mean= &v._33_4; by run ; where 2033 <= cald < 2034 and option=4; 
proc means noprint data=y; var &v; output out=y_34_4 mean= &v._34_4; by run ; where 2034 <= cald < 2035 and option=4; 
proc means noprint data=y; var &v; output out=y_35_4 mean= &v._35_4; by run ; where 2035 <= cald < 2036 and option=4; 
proc means noprint data=y; var &v; output out=y_36_4 mean= &v._36_4; by run ; where 2036 <= cald < 2037 and option=4; 
proc means noprint data=y; var &v; output out=y_37_4 mean= &v._37_4; by run ; where 2037 <= cald < 2038 and option=4; 
proc means noprint data=y; var &v; output out=y_38_4 mean= &v._38_4; by run ; where 2038 <= cald < 2039 and option=4; 
proc means noprint data=y; var &v; output out=y_39_4 mean= &v._39_4; by run ; where 2039 <= cald < 2040 and option=4; 
proc means noprint data=y; var &v; output out=y_40_4 mean= &v._40_4; by run ; where 2040 <= cald < 2041 and option=4; 
proc means noprint data=y; var &v; output out=y_41_4 mean= &v._41_4; by run ; where 2041 <= cald < 2042 and option=4; 
proc means noprint data=y; var &v; output out=y_42_4 mean= &v._42_4; by run ; where 2042 <= cald < 2043 and option=4; 
proc means noprint data=y; var &v; output out=y_43_4 mean= &v._43_4; by run ; where 2043 <= cald < 2044 and option=4; 
proc means noprint data=y; var &v; output out=y_44_4 mean= &v._44_4; by run ; where 2044 <= cald < 2045 and option=4; 
proc means noprint data=y; var &v; output out=y_45_4 mean= &v._45_4; by run ; where 2045 <= cald < 2046 and option=4; 
proc means noprint data=y; var &v; output out=y_46_4 mean= &v._46_4; by run ; where 2046 <= cald < 2047 and option=4; 
proc means noprint data=y; var &v; output out=y_47_4 mean= &v._47_4; by run ; where 2047 <= cald < 2048 and option=4; 
proc means noprint data=y; var &v; output out=y_48_4 mean= &v._48_4; by run ; where 2048 <= cald < 2049 and option=4; 
proc means noprint data=y; var &v; output out=y_49_4 mean= &v._49_4; by run ; where 2049 <= cald < 2050 and option=4; 
proc means noprint data=y; var &v; output out=y_50_4 mean= &v._50_4; by run ; where 2050 <= cald < 2051 and option=4; 
proc means noprint data=y; var &v; output out=y_51_4 mean= &v._51_4; by run ; where 2051 <= cald < 2052 and option=4; 
proc means noprint data=y; var &v; output out=y_52_4 mean= &v._52_4; by run ; where 2052 <= cald < 2053 and option=4; 
proc means noprint data=y; var &v; output out=y_53_4 mean= &v._53_4; by run ; where 2053 <= cald < 2054 and option=4; 
proc means noprint data=y; var &v; output out=y_54_4 mean= &v._54_4; by run ; where 2054 <= cald < 2055 and option=4; 
proc means noprint data=y; var &v; output out=y_55_4 mean= &v._55_4; by run ; where 2055 <= cald < 2056 and option=4; 
proc means noprint data=y; var &v; output out=y_56_4 mean= &v._56_4; by run ; where 2056 <= cald < 2057 and option=4; 
proc means noprint data=y; var &v; output out=y_57_4 mean= &v._57_4; by run ; where 2057 <= cald < 2058 and option=4; 
proc means noprint data=y; var &v; output out=y_58_4 mean= &v._58_4; by run ; where 2058 <= cald < 2059 and option=4; 
proc means noprint data=y; var &v; output out=y_59_4 mean= &v._59_4; by run ; where 2059 <= cald < 2060 and option=4; 
proc means noprint data=y; var &v; output out=y_60_4 mean= &v._60_4; by run ; where 2060 <= cald < 2061 and option=4; 
proc means noprint data=y; var &v; output out=y_61_4 mean= &v._61_4; by run ; where 2061 <= cald < 2062 and option=4; 
proc means noprint data=y; var &v; output out=y_62_4 mean= &v._62_4; by run ; where 2062 <= cald < 2063 and option=4; 
proc means noprint data=y; var &v; output out=y_63_4 mean= &v._63_4; by run ; where 2063 <= cald < 2064 and option=4; 
proc means noprint data=y; var &v; output out=y_64_4 mean= &v._64_4; by run ; where 2064 <= cald < 2065 and option=4; 
proc means noprint data=y; var &v; output out=y_65_4 mean= &v._65_4; by run ; where 2065 <= cald < 2066 and option=4; 
proc means noprint data=y; var &v; output out=y_66_4 mean= &v._66_4; by run ; where 2066 <= cald < 2067 and option=4; 
proc means noprint data=y; var &v; output out=y_67_4 mean= &v._67_4; by run ; where 2067 <= cald < 2068 and option=4; 
proc means noprint data=y; var &v; output out=y_68_4 mean= &v._68_4; by run ; where 2068 <= cald < 2069 and option=4; 
proc means noprint data=y; var &v; output out=y_69_4 mean= &v._69_4; by run ; where 2069 <= cald < 2070 and option=4; 
proc means noprint data=y; var &v; output out=y_70_4 mean= &v._70_4; by run ; where 2070 <= cald < 2071 and option=4; 

proc means noprint data=y; var &v; output out=y_21_24_0 mean= &v._21_24_0; by run ; where 2021.5 <= cald < 2024.50 and option = 0;  
proc means noprint data=y; var &v; output out=y_21_24_1 mean= &v._21_24_1; by run ; where 2021.5 <= cald < 2024.50 and option = 1;  
proc means noprint data=y; var &v; output out=y_21_24_2 mean= &v._21_24_2; by run ; where 2021.5 <= cald < 2024.50 and option = 2;  
proc means noprint data=y; var &v; output out=y_21_24_3 mean= &v._21_24_3; by run ; where 2021.5 <= cald < 2024.50 and option = 3;  
proc means noprint data=y; var &v; output out=y_21_24_4 mean= &v._21_24_4; by run ; where 2021.5 <= cald < 2024.50 and option = 4;  

proc means noprint data=y; var &v; output out=y_21_71_0 mean= &v._21_71_0; by run ; where 2021.5 <= cald < 2071.50 and option = 0;  
proc means noprint data=y; var &v; output out=y_21_71_1 mean= &v._21_71_1; by run ; where 2021.5 <= cald < 2071.50 and option = 1;  
proc means noprint data=y; var &v; output out=y_21_71_2 mean= &v._21_71_2; by run ; where 2021.5 <= cald < 2071.50 and option = 2;  
proc means noprint data=y; var &v; output out=y_21_71_3 mean= &v._21_71_3; by run ; where 2021.5 <= cald < 2071.50 and option = 3;  
proc means noprint data=y; var &v; output out=y_21_71_4 mean= &v._21_71_4; by run ; where 2021.5 <= cald < 2071.50 and option = 4;  

data &v ; merge 
y_22p5_0 y_22p5_1 y_22p5_2 y_22p5_3 y_22p5_4 
y_21_24_0 y_21_24_1 y_21_24_2 y_21_24_3 y_21_24_4
y_21_71_0 y_21_71_1 y_21_71_2 y_21_71_3 y_21_71_4 

y_89_0 y_90_0 y_91_0 y_92_0 y_93_0 y_94_0 y_95_0 y_96_0 y_97_0 y_98_0 y_99_0 y_00_0  
y_01_0 y_02_0 y_03_0 y_04_0 y_05_0 y_06_0 y_07_0 y_08_0 y_09_0 y_10_0  
y_11_0 y_12_0 y_13_0 y_14_0 y_15_0 y_16_0 y_17_0 y_18_0 y_19_0 y_20_0 
y_21_0 y_22_0 y_23_0 y_24_0 y_25_0 y_26_0 y_27_0 y_28_0 y_29_0 y_30_0 
y_31_0 y_32_0 y_33_0 y_34_0 y_35_0 y_36_0 y_37_0 y_38_0 y_39_0 y_40_0 
y_41_0 y_42_0 y_43_0 y_44_0 y_45_0 y_46_0 y_47_0 y_48_0 y_49_0 y_50_0 
y_51_0 y_52_0 y_53_0 y_54_0 y_55_0 y_56_0 y_57_0 y_58_0 y_59_0 y_60_0 
y_61_0 y_62_0 y_63_0 y_64_0 y_65_0 y_66_0 y_67_0 y_68_0 y_69_0 y_70_0 

y_21_1 y_22_1 y_23_1 y_24_1 y_25_1 y_26_1 y_27_1 y_28_1 y_29_1 y_30_1 
y_31_1 y_32_1 y_33_1 y_34_1 y_35_1 y_36_1 y_37_1 y_38_1 y_39_1 y_40_1 
y_41_1 y_42_1 y_43_1 y_44_1 y_45_1 y_46_1 y_47_1 y_48_1 y_49_1 y_50_1 
y_51_1 y_52_1 y_53_1 y_54_1 y_55_1 y_56_1 y_57_1 y_58_1 y_59_1 y_60_1 
y_61_1 y_62_1 y_63_1 y_64_1 y_65_1 y_66_1 y_67_1 y_68_1 y_69_1 y_70_1  

y_21_2 y_22_2 y_23_2 y_24_2 y_25_2 y_26_2 y_27_2 y_28_2 y_29_2 y_30_2 
y_31_2 y_32_2 y_33_2 y_34_2 y_35_2 y_36_2 y_37_2 y_38_2 y_39_2 y_40_2 
y_41_2 y_42_2 y_43_2 y_44_2 y_45_2 y_46_2 y_47_2 y_48_2 y_49_2 y_50_2 
y_51_2 y_52_2 y_53_2 y_54_2 y_55_2 y_56_2 y_57_2 y_58_2 y_59_2 y_60_2 
y_61_2 y_62_2 y_63_2 y_64_2 y_65_2 y_66_2 y_67_2 y_68_2 y_69_2 y_70_2  

y_21_3 y_22_3 y_23_3 y_24_3 y_25_3 y_26_3 y_27_3 y_28_3 y_29_3 y_30_3 
y_31_3 y_32_3 y_33_3 y_34_3 y_35_3 y_36_3 y_37_3 y_38_3 y_39_3 y_40_3 
y_41_3 y_42_3 y_43_3 y_44_3 y_45_3 y_46_3 y_47_3 y_48_3 y_49_3 y_50_3 
y_51_3 y_52_3 y_53_3 y_54_3 y_55_3 y_56_3 y_57_3 y_58_3 y_59_3 y_60_3 
y_61_3 y_62_3 y_63_3 y_64_3 y_65_3 y_66_3 y_67_3 y_68_3 y_69_3 y_70_3  

y_21_4 y_22_4 y_23_4 y_24_4 y_25_4 y_26_4 y_27_4 y_28_4 y_29_4 y_30_4 
y_31_4 y_32_4 y_33_4 y_34_4 y_35_4 y_36_4 y_37_4 y_38_4 y_39_4 y_40_4 
y_41_4 y_42_4 y_43_4 y_44_4 y_45_4 y_46_4 y_47_4 y_48_4 y_49_4 y_50_4 
y_51_4 y_52_4 y_53_4 y_54_4 y_55_4 y_56_4 y_57_4 y_58_4 y_59_4 y_60_4 
y_61_4 y_62_4 y_63_4 y_64_4 y_65_4 y_66_4 y_67_4 y_68_4 y_69_4 y_70_4  

; 

drop _NAME_ _TYPE_ _FREQ_;

%mend var;


%var(v=n_alive);  %var(v=p_onart_artexp);  %var(v=n_art_initiation); %var(v=n_restart);   %var(v=p_onart_vl1000); %var(v=n_hivge15);
%var(v=death_rate_hiv_ge15_all); %var(v=death_rate_hiv_ge15); %var(v=ddaly); %var(v=daly);
%var(v=incidence1549);  %var(v=incidence1549w);  %var(v=incidence1549m);  %var(v=prevalence1549);  %var(v=prevalence1549w);  %var(v=prevalence1549m); 

%var(v=p_diag_m);   %var(v=prop_w_1549_sw);  %var(v=p_onart_diag_w); 	%var(v=p_onart_diag_m);   %var(v=p_vl1000);	 %var(v=p_onart_vl1000_w);	
%var(v=p_onart_vl1000_m);   %var(v=p_onart_cd4_l500);  %var(v=p_mcirc_1549m);  %var(v=p_startedline2);  %var(v=prop_sw_hiv)  %var(v=p_newp_sw);  
%var(v=aids_death_rate);  %var(v=n_onart); %var(v=n_death_hivrel);  %var(v=prevalence_vg1000);  %var(v=p_onart);    %var(v=dcost);

data   wide_outputs; merge 
n_alive p_onart_artexp n_art_initiation n_restart p_onart_vl1000 n_hivge15 death_rate_hiv_ge15_all death_rate_hiv_ge15 ddaly daly
incidence1549 incidence1549w incidence1549m prevalence1549 prevalence1549w prevalence1549m 

p_diag_m   prop_w_1549_sw p_onart_diag_w 	p_onart_diag_m   p_vl1000	p_onart_vl1000_w	p_onart_vl1000_m p_onart_cd4_l500  
p_mcirc_1549m  p_startedline2  prop_sw_hiv p_newp_sw  aids_death_rate  n_onart   n_death_hivrel    prevalence_vg1000  p_onart
dcost
;

proc contents; run;

proc sort; by run; run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2021; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=sf_2021);  %par(p=dataset);
%par(p=sex_beh_trans_matrix_m ); %par(p=sex_beh_trans_matrix_w ); %par(p=sex_age_mixing_matrix_m ); %par(p=sex_age_mixing_matrix_w ); %par(p=p_rred_p );
%par(p=p_hsb_p ); %par(p=newp_factor ); %par(p=eprate ) %par(p=conc_ep ); %par(p=ch_risk_diag ); %par(p=ch_risk_diag_newp );
%par(p=ych_risk_beh_newp ); %par(p=ych2_risk_beh_newp ); %par(p=ych_risk_beh_ep ); %par(p=exp_setting_lower_p_vl1000 );
%par(p=external_exp_factor ); %par(p=rate_exp_set_lower_p_vl1000 ); %par(p=prob_pregnancy_base ); %par(p=fold_change_w );
%par(p=fold_change_yw ); %par(p=fold_change_sti ); %par(p=super_infection ); %par(p=an_lin_incr_test );
%par(p=date_test_rate_plateau ); %par(p=rate_testanc_inc ); %par(p=incr_test_rate_sympt ); %par(p=max_freq_testing );
%par(p=test_targeting ); %par(p=fx ); %par(p=adh_pattern ); %par(p=prob_loss_at_diag ); %par(p=pr_art_init ); 
%par(p=rate_lost ); %par(p=prob_lost_art ); %par(p=rate_return ); %par(p=rate_restart ); %par(p=rate_int_choice );
%par(p=clinic_not_aw_int_frac ); %par(p=res_trans_factor_nn ); %par(p=rate_loss_persistence ); %par(p=incr_rate_int_low_adh );
%par(p=poorer_cd4rise_fail_nn ); %par(p=poorer_cd4rise_fail_ii ); %par(p=rate_res_ten );
%par(p=fold_change_mut_risk ); %par(p=adh_effect_of_meas_alert ); %par(p=pr_switch_line ); %par(p=prob_vl_meas_done );
%par(p=red_adh_tb_adc ); %par(p=red_adh_tox_pop ); %par(p=add_eff_adh_nnrti ); %par(p=altered_adh_sec_line_pop );
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=prob_lossdiag_who3e ); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=switch_for_tox ); %par(p=adh_pattern_prep ); %par(p=rate_test_startprep ); %par(p=rate_test_restartprep );
%par(p=rate_choose_stop_prep ); %par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox );   %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg );
%par(p=eff_max_freq_testing ); 		%par(p=eff_rate_restart );  		%par(p=eff_prob_loss_at_diag );  		%par(p=eff_rate_lost );  		
%par(p=eff_prob_lost_art );  		%par(p=eff_rate_return );  			
%par(p=eff_pr_art_init );  	%par(p=eff_rate_int_choice );  	%par(p=eff_prob_vl_meas_done );  		%par(p=eff_pr_switch_line );  	
%par(p=eff_rate_test_startprep );  	%par(p=eff_rate_test_restartprep );  	%par(p=prep_strategy );
%par(p=eff_rate_choose_stop_prep );  		%par(p=eff_prob_prep_restart_choice );  %par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=eff_test_targeting );  %par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); 
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); %par(p=rate_sw_rred_rc);


data wide_par; merge dataset
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
prob_return_adc prob_lossdiag_adctb prob_lossdiag_who3e higher_newp_less_engagement
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
;



run;

* To get one row per run;

  data a.wide_art_re_20_10_21; 

  merge   wide_outputs  wide_par  ; 
  by run;

* if run = 145009460 ; * 627525923;

* if run = 281373168 then delete; * no hiv in this run ;

if p_onart_artexp_20_0 < 0.965;


proc contents; run;

proc freq; tables run; run;



data r; set a.wide_art_re_20_10_21; 

proc freq; tables rate_int_choice; run;


ods html;
proc means n median p5 p95 min max ;
var	
n_alive_21_0 p_onart_artexp_21_0 n_art_initiation_21_0 n_restart_21_0 p_onart_vl1000_21_0 n_hivge15_21_0 death_rate_hiv_ge15_all_21_0 
death_rate_hiv_ge15_21_0 ddaly_21_0 daly_21_0  incidence1549_21_0 incidence1549w_21_0 incidence1549m_21_0 prevalence1549_21_0 
prevalence1549w_21_0 prevalence1549m_21_0  p_diag_m_21_0  prop_w_1549_sw_21_0 p_onart_diag_w_21_0 	p_onart_diag_m_21_0  p_onart_artexp_21_0
p_vl1000_21_0	p_onart_vl1000_w_21_0  p_onart_vl1000_m_21_0 p_onart_cd4_l500_21_0 p_mcirc_1549m_21_0  p_startedline2_21_0  prop_sw_hiv_21_0 
p_newp_sw_21_0  aids_death_rate_21_0 dcost_21_0 ;
run;
ods html close;



ods html;
proc print ;
var	run 
n_alive_21_0 p_onart_artexp_21_0 n_art_initiation_21_0 n_restart_21_0 p_onart_vl1000_21_0 n_hivge15_21_0 death_rate_hiv_ge15_all_21_0 
death_rate_hiv_ge15_21_0 ddaly_21_0 daly_21_0  incidence1549_21_0 incidence1549w_21_0 incidence1549m_21_0 prevalence1549_21_0 
prevalence1549w_21_0 prevalence1549m_21_0  p_diag_m_21_0  prop_w_1549_sw_21_0 p_onart_diag_w_21_0 	p_onart_diag_m_21_0  p_onart_artexp_21_0
p_vl1000_21_0	p_onart_vl1000_w_21_0  p_onart_vl1000_m_21_0 p_onart_cd4_l500_21_0 p_mcirc_1549m_21_0  p_startedline2_21_0  prop_sw_hiv_21_0 
p_newp_sw_21_0  aids_death_rate_21_0  ;
run;
ods html close;




ods html;
proc means n median p5 p95 min max ;
var	
n_alive_21_24_0 p_onart_artexp_21_24_0 n_art_initiation_21_24_0 n_restart_21_24_0 p_onart_vl1000_21_24_0 n_hivge15_21_24_0 
death_rate_hiv_ge15_all_21_24_0 
death_rate_hiv_ge15_21_24_0 ddaly_21_24_0 daly_21_24_0  incidence1549_21_24_0 incidence1549w_21_24_0 incidence1549m_21_24_0 
prevalence1549_21_24_0 
prevalence1549w_21_24_0 prevalence1549m_21_24_0  p_diag_m_21_24_0  prop_w_1549_sw_21_24_0 p_onart_diag_w_21_24_0 	
p_onart_diag_m_21_24_0  
p_vl1000_21_24_0	p_onart_vl1000_w_21_24_0  p_onart_vl1000_m_21_24_0 p_onart_cd4_l500_21_24_0 p_mcirc_1549m_21_24_0  
p_startedline2_21_24_0  prop_sw_hiv_21_24_0 
p_newp_sw_21_24_0  aids_death_rate_21_24_0  n_onart_21_24_0  n_death_hivrel_21_24_0    prevalence_vg1000_21_24_0

n_alive_21_24_1 p_onart_artexp_21_24_1 n_art_initiation_21_24_1 n_restart_21_24_1 p_onart_vl1000_21_24_1 n_hivge15_21_24_1 
death_rate_hiv_ge15_all_21_24_1 
death_rate_hiv_ge15_21_24_1 ddaly_21_24_1 daly_21_24_1  incidence1549_21_24_1 incidence1549w_21_24_1 incidence1549m_21_24_1 
prevalence1549_21_24_1 
prevalence1549w_21_24_1 prevalence1549m_21_24_1  p_diag_m_21_24_1  prop_w_1549_sw_21_24_1 p_onart_diag_w_21_24_1 	
p_onart_diag_m_21_24_1  
p_vl1000_21_24_1	p_onart_vl1000_w_21_24_1  p_onart_vl1000_m_21_24_1 p_onart_cd4_l500_21_24_1 p_mcirc_1549m_21_24_1  
p_startedline2_21_24_1  prop_sw_hiv_21_24_1 
p_newp_sw_21_24_1  aids_death_rate_21_24_1  n_onart_21_24_1 n_death_hivrel_21_24_1  prevalence_vg1000_21_24_1

n_alive_21_24_2 p_onart_artexp_21_24_2 n_art_initiation_21_24_2 n_restart_21_24_2 p_onart_vl1000_21_24_2 n_hivge15_21_24_2 
death_rate_hiv_ge15_all_21_24_2 
death_rate_hiv_ge15_21_24_2 ddaly_21_24_2 daly_21_24_2  incidence1549_21_24_2 incidence1549w_21_24_2 incidence1549m_21_24_2 
prevalence1549_21_24_2 
prevalence1549w_21_24_2 prevalence1549m_21_24_2  p_diag_m_21_24_2  prop_w_1549_sw_21_24_2 p_onart_diag_w_21_24_2 	
p_onart_diag_m_21_24_2  
p_vl1000_21_24_2	p_onart_vl1000_w_21_24_2  p_onart_vl1000_m_21_24_2 p_onart_cd4_l500_21_24_2 p_mcirc_1549m_21_24_2  
p_startedline2_21_24_2  prop_sw_hiv_21_24_2 
p_newp_sw_21_24_2  aids_death_rate_21_24_2  n_onart_21_24_2 n_death_hivrel_21_24_2  prevalence_vg1000_21_24_2

n_alive_21_24_3 p_onart_artexp_21_24_3 n_art_initiation_21_24_3 n_restart_21_24_3 p_onart_vl1000_21_24_3 n_hivge15_21_24_3 
death_rate_hiv_ge15_all_21_24_3 
death_rate_hiv_ge15_21_24_3 ddaly_21_24_3 daly_21_24_3  incidence1549_21_24_3 incidence1549w_21_24_3 incidence1549m_21_24_3 
prevalence1549_21_24_3 
prevalence1549w_21_24_3 prevalence1549m_21_24_3  p_diag_m_21_24_3  prop_w_1549_sw_21_24_3 p_onart_diag_w_21_24_3 	
p_onart_diag_m_21_24_3  
p_vl1000_21_24_3	p_onart_vl1000_w_21_24_3  p_onart_vl1000_m_21_24_3 p_onart_cd4_l500_21_24_3 p_mcirc_1549m_21_24_3  
p_startedline2_21_24_3  prop_sw_hiv_21_24_3 
p_newp_sw_21_24_3  aids_death_rate_21_24_3  n_onart_21_24_3 n_death_hivrel_21_24_3  prevalence_vg1000_21_24_3

n_alive_21_24_4 p_onart_artexp_21_24_4 n_art_initiation_21_24_4 n_restart_21_24_4 p_onart_vl1000_21_24_4 n_hivge15_21_24_4 
death_rate_hiv_ge15_all_21_24_4 
death_rate_hiv_ge15_21_24_4 ddaly_21_24_4 daly_21_24_4  incidence1549_21_24_4 incidence1549w_21_24_4 incidence1549m_21_24_4 
prevalence1549_21_24_4 
prevalence1549w_21_24_4 prevalence1549m_21_24_4  p_diag_m_21_24_4  prop_w_1549_sw_21_24_4 p_onart_diag_w_21_24_4 	
p_onart_diag_m_21_24_4  
p_vl1000_21_24_4	p_onart_vl1000_w_21_24_4  p_onart_vl1000_m_21_24_4 p_onart_cd4_l500_21_24_4 p_mcirc_1549m_21_24_4  
p_startedline2_21_24_4  prop_sw_hiv_21_24_4 
p_newp_sw_21_24_4  aids_death_rate_21_24_4  n_onart_21_24_4 n_death_hivrel_21_24_4  prevalence_vg1000_21_24_4

;
run;
ods html close;




ods html;
proc means n median p5 p95 min max ;
var	
n_alive_21_71_0 p_onart_artexp_21_71_0 n_art_initiation_21_71_0 n_restart_21_71_0 p_onart_vl1000_21_71_0 n_hivge15_21_71_0 
death_rate_hiv_ge15_all_21_71_0 
death_rate_hiv_ge15_21_71_0 ddaly_21_71_0 daly_21_71_0  incidence1549_21_71_0 incidence1549w_21_71_0 incidence1549m_21_71_0 
prevalence1549_21_71_0 
prevalence1549w_21_71_0 prevalence1549m_21_71_0  p_diag_m_21_71_0  prop_w_1549_sw_21_71_0 p_onart_diag_w_21_71_0 	
p_onart_diag_m_21_71_0  
p_vl1000_21_71_0	p_onart_vl1000_w_21_71_0  p_onart_vl1000_m_21_71_0 p_onart_cd4_l500_21_71_0 p_mcirc_1549m_21_71_0  
p_startedline2_21_71_0  prop_sw_hiv_21_71_0 
p_newp_sw_21_71_0  aids_death_rate_21_71_0  n_onart_21_71_0  n_death_hivrel_21_71_0    prevalence_vg1000_21_71_0

n_alive_21_71_1 p_onart_artexp_21_71_1 n_art_initiation_21_71_1 n_restart_21_71_1 p_onart_vl1000_21_71_1 n_hivge15_21_71_1 
death_rate_hiv_ge15_all_21_71_1 
death_rate_hiv_ge15_21_71_1 ddaly_21_71_1 daly_21_71_1  incidence1549_21_71_1 incidence1549w_21_71_1 incidence1549m_21_71_1 
prevalence1549_21_71_1 
prevalence1549w_21_71_1 prevalence1549m_21_71_1  p_diag_m_21_71_1  prop_w_1549_sw_21_71_1 p_onart_diag_w_21_71_1 	
p_onart_diag_m_21_71_1  
p_vl1000_21_71_1	p_onart_vl1000_w_21_71_1  p_onart_vl1000_m_21_71_1 p_onart_cd4_l500_21_71_1 p_mcirc_1549m_21_71_1  
p_startedline2_21_71_1  prop_sw_hiv_21_71_1 
p_newp_sw_21_71_1  aids_death_rate_21_71_1  n_onart_21_71_1 n_death_hivrel_21_71_1  prevalence_vg1000_21_71_1

n_alive_21_71_2 p_onart_artexp_21_71_2 n_art_initiation_21_71_2 n_restart_21_71_2 p_onart_vl1000_21_71_2 n_hivge15_21_71_2 
death_rate_hiv_ge15_all_21_71_2 
death_rate_hiv_ge15_21_71_2 ddaly_21_71_2 daly_21_71_2  incidence1549_21_71_2 incidence1549w_21_71_2 incidence1549m_21_71_2 
prevalence1549_21_71_2 
prevalence1549w_21_71_2 prevalence1549m_21_71_2  p_diag_m_21_71_2  prop_w_1549_sw_21_71_2 p_onart_diag_w_21_71_2 	
p_onart_diag_m_21_71_2  
p_vl1000_21_71_2	p_onart_vl1000_w_21_71_2  p_onart_vl1000_m_21_71_2 p_onart_cd4_l500_21_71_2 p_mcirc_1549m_21_71_2  
p_startedline2_21_71_2  prop_sw_hiv_21_71_2 
p_newp_sw_21_71_2  aids_death_rate_21_71_2  n_onart_21_71_2 n_death_hivrel_21_71_2  prevalence_vg1000_21_71_2

n_alive_21_71_3 p_onart_artexp_21_71_3 n_art_initiation_21_71_3 n_restart_21_71_3 p_onart_vl1000_21_71_3 n_hivge15_21_71_3 
death_rate_hiv_ge15_all_21_71_3 
death_rate_hiv_ge15_21_71_3 ddaly_21_71_3 daly_21_71_3  incidence1549_21_71_3 incidence1549w_21_71_3 incidence1549m_21_71_3 
prevalence1549_21_71_3 
prevalence1549w_21_71_3 prevalence1549m_21_71_3  p_diag_m_21_71_3  prop_w_1549_sw_21_71_3 p_onart_diag_w_21_71_3 	
p_onart_diag_m_21_71_3  
p_vl1000_21_71_3	p_onart_vl1000_w_21_71_3  p_onart_vl1000_m_21_71_3 p_onart_cd4_l500_21_71_3 p_mcirc_1549m_21_71_3  
p_startedline2_21_71_3  prop_sw_hiv_21_71_3 
p_newp_sw_21_71_3  aids_death_rate_21_71_3  n_onart_21_71_3 n_death_hivrel_21_71_3  prevalence_vg1000_21_71_3

n_alive_21_71_4 p_onart_artexp_21_71_4 n_art_initiation_21_71_4 n_restart_21_71_4 p_onart_vl1000_21_71_4 n_hivge15_21_71_4 
death_rate_hiv_ge15_all_21_71_4 
death_rate_hiv_ge15_21_71_4 ddaly_21_71_4 daly_21_71_4  incidence1549_21_71_4 incidence1549w_21_71_4 incidence1549m_21_71_4 
prevalence1549_21_71_4 
prevalence1549w_21_71_4 prevalence1549m_21_71_4  p_diag_m_21_71_4  prop_w_1549_sw_21_71_4 p_onart_diag_w_21_71_4 	
p_onart_diag_m_21_71_4  
p_vl1000_21_71_4	p_onart_vl1000_w_21_71_4  p_onart_vl1000_m_21_71_4 p_onart_cd4_l500_21_71_4 p_mcirc_1549m_21_71_4  
p_startedline2_21_71_4  prop_sw_hiv_21_71_4 
p_newp_sw_21_71_4  aids_death_rate_21_71_4  n_onart_21_71_4 n_death_hivrel_21_71_4  prevalence_vg1000_21_71_4

;
run;
ods html close;




ods html;
proc means n median p5 p95 min max ;
var	
n_onart_21_0
n_onart_21_1
n_onart_21_2
n_onart_21_3
n_onart_21_4

p_onart_artexp_21_0 
p_onart_artexp_21_1 
p_onart_artexp_21_2 
p_onart_artexp_21_3 
p_onart_artexp_21_4

p_onart_21_0 
p_onart_21_1 
p_onart_21_2 
p_onart_21_3 
p_onart_21_4

p_onart_diag_w_21_0 
p_onart_diag_w_21_1 
p_onart_diag_w_21_2 
p_onart_diag_w_21_3 
p_onart_diag_w_21_4

p_onart_diag_m_21_0 
p_onart_diag_m_21_1 
p_onart_diag_m_21_2 
p_onart_diag_m_21_3 
p_onart_diag_m_21_4

n_death_hivrel_21_0
n_death_hivrel_21_1
n_death_hivrel_21_2
n_death_hivrel_21_3
n_death_hivrel_21_4 

daly_21_0  
daly_21_1  
daly_21_2  
daly_21_3  
daly_21_4  

incidence1549_21_0
incidence1549_21_1
incidence1549_21_2
incidence1549_21_3
incidence1549_21_4

;

run;
ods html close;


ods html;
proc means n median p5 p95 min max ;
var	
n_onart_21_71_0
n_onart_21_71_1
n_onart_21_71_2
n_onart_21_71_3
n_onart_21_71_4

p_onart_artexp_21_71_0 
p_onart_artexp_21_71_1 
p_onart_artexp_21_71_2 
p_onart_artexp_21_71_3 
p_onart_artexp_21_71_4

p_onart_21_71_0 
p_onart_21_71_1 
p_onart_21_71_2 
p_onart_21_71_3 
p_onart_21_71_4

p_onart_diag_w_21_71_0 
p_onart_diag_w_21_71_1 
p_onart_diag_w_21_71_2 
p_onart_diag_w_21_71_3 
p_onart_diag_w_21_71_4

p_onart_diag_m_21_71_0 
p_onart_diag_m_21_71_1 
p_onart_diag_m_21_71_2 
p_onart_diag_m_21_71_3 
p_onart_diag_m_21_71_4

n_death_hivrel_21_71_0
n_death_hivrel_21_71_1
n_death_hivrel_21_71_2
n_death_hivrel_21_71_3
n_death_hivrel_21_71_4 

daly_21_71_0  
daly_21_71_1  
daly_21_71_2  
daly_21_71_3  
daly_21_71_4  

incidence1549_21_71_0
incidence1549_21_71_1
incidence1549_21_71_2
incidence1549_21_71_3
incidence1549_21_71_4

;
run;
ods html close;


data a.art_re_20_10_21_xlsx;

set a.wide_art_re_20_10_21;


drop sf_2021 sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
zzexternal_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti super_infection an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_who3e higher_newp_less_engagement
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
;


proc print data = a.art_re_20_10_21_xlsx; 
var  death_rate_hiv_ge15: p_onart_21: ;
run; 


proc export data = a.art_re_20_10_21_xlsx
  dbms=xlsx 
  outfile = "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\art_retention\output_20_10_21" replace;
run;



