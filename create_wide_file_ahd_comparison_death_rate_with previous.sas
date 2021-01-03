

*libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\";
libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\ahd\";

data a; 
   set a.hiv_synthesis_base ;
*  set a.hiv_synthesis_ahd_3;


proc sort; by run cald option;run;

* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a ;
 
if cald=2020;
s_alive = s_alive_m + s_alive_w ;
sf_2020 = 10000000 / s_alive;
keep run sf_2020;
proc sort; by run;


data y; 
merge a sf;
by run ;


* preparatory code ;

* ================================================================================= ;

zero_3tc_activity_m184   = s_zero_3tc_activity_m184 / s_n ;
zero_tdf_activity_k65r  =  s_zero_tdf_activity_k65r / s_n ;

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
discount_adj_10p = discount_adj * (0.90/0.97)**(cald-2020) ; 
discount_adj_0  = discount_adj * (1.00/0.97)**(cald-2020) ; 
discount = disc * discount_adj ;
discount_10p = disc * discount_adj_10p ;
discount_0 = disc * discount_adj_0 ;

* proc print; 
* var cald  run  cald s_dcost_  s_cost_  disc  discount_adj  discount  discount_adj_10p discount_10p ; 
* where option=0  and cald ge 2019; 
* run;

* if using 10% discount rate:  ; 
* discount=discount_10p; 
* discount_adj=discount_adj_10p;

* if using 0% discount rate:  ;
* discount=discount_0; 
* discount_adj=discount_adj_0;

* ================================================================================= ;




* dalys and life years;

* ================================================================================= ;

ly = s_ly * sf_2020;
dly = s_dly * sf_2020;

s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * sf_2020 * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * sf_2020 * 4 * discount_adj ;

* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 

dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * sf_2020 * 4  * discount_adj ; * odabe ;

ddaly_mtct = s_ddaly_mtct * sf_2020 * 4  * discount_adj ;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf_2020 * 4  * discount_adj ; * napd;

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
dzdv_cost = s_cost_zdv * discount * sf_2020 * 4 / 1000;
dten_cost = s_cost_ten * discount * sf_2020 * 4 / 1000;
d3tc_cost = s_cost_3tc * discount * sf_2020 * 4 / 1000; 
dnev_cost = s_cost_nev * discount * sf_2020 * 4 / 1000;
dlpr_cost = s_cost_lpr * discount * sf_2020 * 4 / 1000;
ddar_cost = s_cost_dar * discount * sf_2020 * 4 / 1000;
dtaz_cost = s_cost_taz * discount * sf_2020 * 4 / 1000;
defa_cost = s_cost_efa * discount * sf_2020 * 4 / 1000;
ddol_cost = s_cost_dol * discount * sf_2020 * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * sf_2020 * discount_adj * 4 / 1000;
dart1_cost = s_dart_1_cost * sf_2020 * discount_adj * 4 / 1000;
dart2_cost = s_dart_2_cost * sf_2020 * discount_adj * 4 / 1000;
dart3_cost = s_dart_3_cost * sf_2020 * discount_adj * 4 / 1000;
dart_cost = s_dart_cost * sf_2020 * discount_adj * 4 / 1000;
dvl_cost = s_dvl_cost * sf_2020 * discount_adj * 4 / 1000;
dcd4_cost = s_dcd4_cost * sf_2020 * discount_adj * 4 / 1000;
dadc_cost = s_dadc_cost * sf_2020 * discount_adj * 4 / 1000;
dtb_cost = s_dtb_cost * sf_2020 * discount_adj * 4 / 1000;
dtest_cost = s_dtest_cost * sf_2020 * discount_adj * 4 / 1000;
dwho3_cost = s_dwho3_cost * sf_2020 * discount_adj * 4 / 1000;
dcot_cost = s_dcot_cost * sf_2020 * discount_adj * 4 / 1000;
dres_cost = s_dres_cost * sf_2020 * discount_adj * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf_2020 * discount_adj * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * sf_2020 * discount_adj * 4 / 1000;  
dcost_prep = s_dcost_prep * sf_2020* discount_adj * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf_2020* discount_adj * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf_2020* discount_adj * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf_2020 * discount_adj * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf_2020 * discount_adj * 4 / 1000;
dcost_circ = s_dcost_circ * sf_2020* discount_adj * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf_2020* discount_adj * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * discount_adj * sf_2020 * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf_2020 * discount_adj * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * sf_2020 * discount_adj * 4 / 1000; * s_cost_child_hiv is discounted cost;

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
if discount gt 0 then cost_clin_care = dcost_clin_care / discount;


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

s_vmmc1549m = s_vmmc1519m + s_vmmc2024m + s_vmmc2529m + s_vmmc3034m + s_vmmc3539m + s_vmmc4044m + s_vmmc4549m ;
s_vmmc3039m = s_vmmc3034m + s_vmmc3539m;
s_vmmc4049m = s_vmmc4044m + s_vmmc4549m;

s_hiv1524m = s_hiv1519m + s_hiv2024m ;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive ;
* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;

* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2020;
* p_newp_sw;					p_newp_sw = s_sw_newp / s_w_newp ;
* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;
* n_tested_m;					n_tested_m = s_tested_m * sf_2020 * 4;
* n_tested;						n_tested = s_tested * sf_2020 * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3039m;				p_mcirc_3039m = s_mcirc_3039m / (s_ageg3034m + s_ageg3539m) ;
* p_mcirc_4049m;				p_mcirc_4049m = s_mcirc_4049m / (s_ageg4044m + s_ageg4549m) ;
* p_mcirc_50plm;				p_mcirc_50plm = s_mcirc_50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;
* n_new_mcirc;					n_new_mcirc = s_new_mcirc * sf_2020 * 4;

* p_vmmc;						p_vmmc = s_vmmc / s_alive_m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_50plm;					p_vmmc_50plm = s_vmmc50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;

* prop_w_1549_sw;				prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  

* prep;

* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / (s_ageg1519w + s_ageg2024w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_sw_onprep; 				prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep;						n_prep = s_prep * sf_2020;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf_2020;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * sf_2020;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf_2020;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf_2020;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf_2020;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * sf_2020;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf_2020;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf_2020;

* prop_elig_on_prep;			if s_elig_prep then prop_elig_on_prep = s_prep / s_elig_prep ; 

* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;

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

* derived var cald iables relating to people with hiv ;
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
* p_vl1000_art_12m_onart;		if s_art_12m_onart > 0 then p_vl1000_art_12m_onart = s_vl1000_art_12m / s_art_12m_onart ;

* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);
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



/* outputs for advanced hiv disease  
s_crag_measured_this_per  s_tblam_measured_this_per  s_cm_this_per    s_crypm_proph    s_tb_proph    s_pcp_p_80  s_sbi_proph  s_crypm sbi 
s_crypm_diag_e    s_tb_diag_e   s_sbi_diag_e  s_cd4_g1    s_cd4_g2   s_cd4_g3    s_cd4_g4   s_cd4_g5    s_cd4_g6   s_vl_g1    s_vl_g2    s_vl_g3     
s_vl_g4     s_vl_g5   s_age_g1    s_age_g2  s_age_g3   s_age_g4     s_age_g5   s_cd4_g1_tb   s_cd4_g2_tb  s_cd4_g3_tb   s_cd4_g4_tb   s_cd4_g5_tb  
s_cd4_g6_tb  s_vl_g1_tb   s_vl_g2_tb    s_vl_g3_tb   s_vl_g4_tb  s_vl_g5_tb  s_age_g1_tb   s_age_g2_tb   s_age_g3_tb  s_age_g4_tb  s_age_g5_tb    
s_onart_tb   s_pcpp_tb   s_tblam_measured_this_per_tb  s_tb_proph_tb    s_tb_80  s_tblam_measured_this_per  s_tblam_measured_this_per_tb   s_tb_proph    
s_tb_proph_tb   s_tb_diag_e  s_cd4_g1_who3   s_cd4_g2_who3   s_cd4_g3_who3   s_cd4_g4_who3  s_cd4_g5_who3  s_cd4_g6_who3    s_vl_g1_who3  s_vl_g2_who3   
s_vl_g3_who3   s_vl_g4_who3   s_vl_g5_who3    s_age_g1_who3    s_age_g2_who3   s_age_g3_who3    s_age_g4_who3  s_age_g5_who3    s_onart_who3     
s_pcpp_who3       s_who3_event_80  s_cd4_g1_adc    s_cd4_g2_adc     s_cd4_g3_adc   s_cd4_g4_adc   s_cd4_g5_adc  s_cd4_g6_adc    s_vl_g1_adc   
s_vl_g2_adc   s_vl_g3_adc   s_vl_g4_adc  s_vl_g5_adc  s_age_g1_adc   s_age_g2_adc    s_age_g3_adc   s_age_g4_adc s_age_g5_adc  	s_onart_adc  s_pcpp_adc
s_cd4_g1_crypm   s_cd4_g2_crypm   s_cd4_g3_crypm   s_cd4_g4_crypm   s_cd4_g5_crypm   s_cd4_g6_crypm  s_vl_g1_crypm   s_vl_g2_crypm  s_vl_g3_crypm    
s_vl_g4_crypm   s_vl_g5_crypm  s_age_g1_crypm  s_age_g2_crypm   s_age_g3_crypm    s_age_g4_crypm  s_age_g5_crypm   s_onart_crypm     s_pcpp_crypm   
s_crag_measured_this_per_crypm    s_crypm_proph_crypm     s_crypm_diag_e s_cd4_g1_sbi   s_cd4_g2_sbi   s_cd4_g3_sbi   s_cd4_g4_sbi  s_cd4_g5_sbi    
s_cd4_g6_sbi   s_vl_g1_sbi  s_vl_g2_sbi    s_vl_g3_sbi   s_vl_g4_sbi s_vl_g5_sbi    s_age_g1_sbi   s_age_g2_sbi   s_age_g3_sbi   s_age_g4_sbi   
s_age_g5_sbi    s_onart_sbi   s_pcpp_sbi    s_sbi_proph_sbi    s_sbi_diag_e   s_sbi  s_cd4_g1_dead  s_cd4_g2_dead   s_cd4_g3_dead s_cd4_g4_dead   
s_cd4_g5_dead   s_cd4_g6_dead   s_vl_g1_dead   s_vl_g2_dead   s_vl_g3_dead   s_vl_g4_dead   s_vl_g5_dead  s_age_g1_dead  s_age_g2_dead   s_age_g3_dead   
s_age_g4_dead  s_age_g5_dead  s_onart_dead_80    s_pcpp_dead   s_tb_proph_dead    s_crypm_proph_dead  s_sbi_proph_dead   sbi_proph_dead  
s_who3_event_dead  s_adc_dead     s_crypm_dead  s_sbi_dead    	s_dead_80  s_in_care_time_of_adc_tb
s_dead_tb s_dead_crypm s_dead_sbi s_dead_oth_adc 
s_tcur3m_cd4t0l100  s_who3_tcur3m_cd4t0l100  s_adc_tcur3m_cd4t0l100 s_tb_tcur3m_cd4t0l100  s_crypm_tcur3m_cd4t0l100  s_sbi_tcur3m_cd4t0l100  
s_tcur6m_cd4t0l100  s_who3_tcur6m_cd4t0l100  s_adc_tcur6m_cd4t0l100 s_tb_tcur6m_cd4t0l100  s_crypm_tcur6m_cd4t0l100  s_sbi_tcur6m_cd4t0l100 	
s_tcur3m_cd4t0l200  s_who3_tcur3m_cd4t0l200  s_adc_tcur3m_cd4t0l200 s_tb_tcur3m_cd4t0l200  s_crypm_tcur3m_cd4t0l200  s_sbi_tcur3m_cd4t0l200  
s_tcur6m_cd4t0l200  s_who3_tcur6m_cd4t0l200  s_adc_tcur6m_cd4t0l200 s_tb_tcur6m_cd4t0l200  s_crypm_tcur6m_cd4t0l200  s_sbi_tcur6m_cd4t0l200 

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph
*/


/*

s_who3_rate s_tb_rate s_tb_risk  s_non_tb_who3_rate s_dead_80  s_death_hivrel_80

*/


s_hiv1579 = s_hiv1564 + s_hiv6569m  + s_hiv7074m  + s_hiv7579m  + s_hiv8084m  +  s_hiv6569w  + s_hiv7074w +  s_hiv7579w  ;


if s_hiv1564 gt 0 then tb_rate_x = s_tb_rate / s_hiv1564 ;
if s_hiv1564 gt 0 then tb_risk_x = s_tb_risk / s_hiv1564 ;

if s_hiv1579 gt 0 then who3_rate_x = s_who3_rate  / s_hiv1579 ;
if s_hiv1579 gt 0 then non_tb_who3_risk_80_x = s_non_tb_who3_rate  / s_hiv1579 ;



* adc_rate;						if s_hiv1564 gt 0 then adc_rate = (4 * 100 * s_adc) / s_hiv1564 ;
* tb_rate;						if s_hiv1564 gt 0 then tb_rate = (4 * 100 * s_tb) / s_hiv1564 ;

* not available in program with new ahd code;

* who3_rate;					if s_hiv1564 gt 0 then who3_rate = (4 * 100 * s_who3_event) / s_hiv1564 ;

* from program with ahd code added;

* crypm_rate_80; * to age 80;	if s_hiv1579 gt 0 then crypm_rate_80 = (4 * 100 * s_crypm) / s_hiv1579 ;
* sbi_rate_80;	* to age 80;	if s_hiv1579 gt 0 then sbi_rate_80 = (4 * 100 * s_sbi) / s_hiv1579 ;
* who3_rate_80; * to age 80;	if s_hiv1579 gt 0 then who3_rate_80 = (4 * 100 * s_who3_event_80) / s_hiv1579 ;

* p_cd4_lt200;					if s_hiv1564 gt 0 then p_cd4_lt200 = s_cl200 / s_hiv1564 ;


* aids_death_rate;				if s_hiv1564 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);
* death_rate;					if s_hiv1564 > 0 then death_rate= (4 * 100 * s_dead1564_) / s_hiv1564;
* death_rate_hiv; 				if s_hiv1564 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hiv1564;
				 				if s_hiv1564m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hiv1564m;
								if s_hiv1564w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hiv1564w;

* n_onart;						n_onart = s_onart * sf_2020 ;
* n_diag;						n_diag = s_diag_this_period * sf_2020 * 4 ;
* n_start_line2;				n_start_line2 = s_start_line2_this_period * sf_2020 * 4 ;
* n_vl_test_done;				n_vl_test_done = (s_vl_cost / 0.022  )  * sf_2020 * 4 ;
* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * sf_2020 * 4;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * sf_2020 * 4;
* n_death;						n_death = s_dead_allage * sf_2020 * 4;
* n_covid;						n_covid = s_covid * sf_2020 * 4;

* n_death_discount;				n_death_discount = n_death*discount;
* death_rate_all_discount;		death_rate_all_discount = (4 * 100 * s_dead_allage) / (s_alive_w + s_alive_m) ;

* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* number of women with hiv giving birth per year;
n_give_birth_w_hiv = s_give_birth_with_hiv * sf_2020 * 4;
n_birth_with_inf_child = s_birth_with_inf_child * sf_2020 * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * sf_2020 * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf_2020 * 4;  * annual number;


n_mcirc1549_=s_mcirc_1549m * sf_2020 * 4;
n_mcirc1549_3m=s_mcirc_1549m * sf_2020;
n_vmmc1549_=s_vmmc1549m * sf_2020 * 4;
n_vmmc1549_3m=s_vmmc1549m * sf_2020;
n_new_inf1549m=s_primary1549m * sf_2020 * 4;
n_new_inf1549=s_primary1549 * sf_2020 * 4;



* for base ;
proc means n mean p50 p5 p95 lclm uclm min max; var death_rate_hiv tb_rate who3_rate  s_who3_event adc_rate s_tb s_hiv1564 p_cd4_lt200 ; 
where 2015    <= cald  and s_hiv1564 > 1000;  run; 

  

* for ahd only; 
proc means n mean p50 p5 p95 lclm uclm min max; var death_rate_hiv tb_rate tb_rate_x tb_risk_x 
who3_rate_80 s_who3_event_80 who3_rate_x  non_tb_who3_risk_80_x  adc_rate crypm_rate_80 sbi_rate_80 
s_hiv1564 s_hiv1579 s_tb s_tb_diag_e p_cd4_lt200; 
where 2015    <= cald           and s_hiv1564 > 1000;  run; 





