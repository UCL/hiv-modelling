

  libname a "C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\"; 
  libname b "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\dolswitch\reading datasets\";
  libname c "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\prep\reading datasets\";
  libname d "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\tld_prep\reading datasets\";
  libname e "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\covid_hiv\reading datasets\";
  libname f "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\";
  libname g "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\fsw";

proc printto;

 ods html close ;
* ods html ;

data a; 
* set d.prep_tld_keep; 
* set c.prep_keep; 
* set a.dolswitch_keep; 
* set a.covid_hiv_3mths; 
* set a.covid_hiv_6mths_a; 
* set a.covid_hiv_6mths_b; * results for submitted manuscript;
* set a.covid_hiv_6mths_c;
* set a.covid_hiv_3yr;
* set a.covid_hiv_3mths_a;
* set e.covid_hiv_revision_main_30r;
* set e.covid_hiv_revision_main_30r_extra;
* set f.core_2020_pre_6_6_20;
* set f.core_2020_6_6_20;
* set f.covid_hiv_revision_main_30r_3mth;
* set f.covid_hiv_revision_main_30r_5yr ;
* set f.covid_hiv_revision_main_30r_dsb ;
*  set f.core_18_6_20_6pm;
  set g.c_output_fsw_7_7_20_9am;
* for covid_hiv_revision_main_30r_5yr, etc include this line below to specify which option;
* if option = 0 or option = 1 ; *  if option = 1  then option = 1;

if run in (888272138) then delete;
proc sort; by run cald option;run;
proc freq;table run;where cald=2020;run;

* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a ;
 
if cald=2019;
s_alive = s_alive_m + s_alive_w ;
sf_2019 = 10000000 / s_alive;
keep run sf_2019;
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

ly = s_ly * sf_2019;
dly = s_dly * sf_2019;

s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * sf_2019 * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * sf_2019 * 4 * discount_adj ;

* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 

dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * sf_2019 * 4  * discount_adj ; * odabe ;

ddaly_mtct = s_ddaly_mtct * sf_2019 * 4  * discount_adj ;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf_2019 * 4  * discount_adj ; * napd;

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
dzdv_cost = s_cost_zdv * discount * sf_2019 * 4 / 1000;
dten_cost = s_cost_ten * discount * sf_2019 * 4 / 1000;
d3tc_cost = s_cost_3tc * discount * sf_2019 * 4 / 1000; 
dnev_cost = s_cost_nev * discount * sf_2019 * 4 / 1000;
dlpr_cost = s_cost_lpr * discount * sf_2019 * 4 / 1000;
ddar_cost = s_cost_dar * discount * sf_2019 * 4 / 1000;
dtaz_cost = s_cost_taz * discount * sf_2019 * 4 / 1000;
defa_cost = s_cost_efa * discount * sf_2019 * 4 / 1000;
ddol_cost = s_cost_dol * discount * sf_2019 * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * sf_2019 * discount_adj * 4 / 1000;
dart1_cost = s_dart_1_cost * sf_2019 * discount_adj * 4 / 1000;
dart2_cost = s_dart_2_cost * sf_2019 * discount_adj * 4 / 1000;
dart3_cost = s_dart_3_cost * sf_2019 * discount_adj * 4 / 1000;
dart_cost = s_dart_cost * sf_2019 * discount_adj * 4 / 1000;
dvl_cost = s_dvl_cost * sf_2019 * discount_adj * 4 / 1000;
dcd4_cost = s_dcd4_cost * sf_2019 * discount_adj * 4 / 1000;
dadc_cost = s_dadc_cost * sf_2019 * discount_adj * 4 / 1000;
dtb_cost = s_dtb_cost * sf_2019 * discount_adj * 4 / 1000;
dtest_cost = s_dtest_cost * sf_2019 * discount_adj * 4 / 1000;
dwho3_cost = s_dwho3_cost * sf_2019 * discount_adj * 4 / 1000;
dcot_cost = s_dcot_cost * sf_2019 * discount_adj * 4 / 1000;
dres_cost = s_dres_cost * sf_2019 * discount_adj * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf_2019 * discount_adj * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * sf_2019 * discount_adj * 4 / 1000;  
dcost_prep = s_dcost_prep * sf_2019* discount_adj * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf_2019* discount_adj * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf_2019* discount_adj * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf_2019 * discount_adj * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf_2019 * discount_adj * 4 / 1000;
dcost_circ = s_dcost_circ * sf_2019* discount_adj * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf_2019* discount_adj * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * discount_adj * sf_2019 * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf_2019 * discount_adj * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * sf_2019 * discount_adj * 4 / 1000; * s_cost_child_hiv is discounted cost;

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

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive ;
* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;

* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2019;
* p_newp_sw;					p_newp_sw = s_sw_newp / s_w_newp ;
* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;
* n_tested_m;					n_tested_m = s_tested_m * sf_2019 * 4;
* n_tested;						n_tested = s_tested * sf_2019 * 4;
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


* prop_w_1549_sw;				prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  

* prep;

* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / (s_ageg1519w + s_ageg2024w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_sw_onprep; 				prop_sw_onprep = max(s_prep_sw, 0) / s_sw_1564 ;

* n_prep;						n_prep = s_prep * sf_2019;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf_2019;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * sf_2019;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;


* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf_2019;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf_2019;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf_2019;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * sf_2019;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf_2019;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf_2019;

* prop_elig_on_prep;			if s_elig_prep then prop_elig_on_prep = s_prep / s_elig_prep ; 

* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

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
* aids_death_rate;				if s_hiv1564 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);
* death_rate;					if s_hiv1564 > 0 then death_rate= (4 * 100 * s_dead1564_) / s_hiv1564;
* death_rate_hiv; 				if s_hiv1564 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hiv1564;
				 				if s_hiv1564m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hiv1564m;
								if s_hiv1564w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hiv1564w;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * sf_2019;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * sf_2019;
* n_death;						n_death = s_dead_allage * sf_2019;
* n_covid;						n_covid = s_covid * sf_2019;

* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

* number of women with hiv giving birth per year;
n_give_birth_w_hiv = s_give_birth_with_hiv * sf_2019 * 4;
n_birth_with_inf_child = s_birth_with_inf_child * sf_2019 * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * sf_2019 * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf_2019 * 4;  * annual number;


n_mcirc1549_=s_mcirc_1549m * sf_2019 * 4;
n_mcirc1549_3m=s_mcirc_1549m * sf_2019;

n_new_inf1549m=s_primary1549m * sf_2019 * 4;
n_new_inf1549=s_primary1549 * sf_2019 * 4;

run;

proc sort data=y;by run option;run;



/*

proc univariate data = y;  var  p_w_giv_birth_this_per prop_w_1549_sw  p_mcirc_1549m
p_tested_past_year_1549m  p_tested_past_year_1549w n_tested test_prop_positive
prevalence1549 prevalence1524w  prevalence1524m
prevalence1549m prevalence1549w  prevalence_sw
incidence1549 incidence1549w  incidence1549m 
mtct_prop 		p_diag 	p_diag_m   p_diag_w  p_diag_m1524  p_diag_w1524   p_diag_sw
p_ai_no_arv_c_nnm
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm
p_onart_diag  p_onart_diag_w 	p_onart_diag_m p_onart_diag_sw 	p_onart_vl1000   p_vl1000   
p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524  
p_onart_vl1000_w				p_onart_vl1000_m   p_onart_vl1000_1524   p_onart_vl1000_sw
p_onart_cd4_l500  p_startedline2  
p_vlg1000_onart_65m   p_vlg1000_onart_184m
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000 
p_tams_ontle_vlg1000   p_tams_ontld_vlg1000  	prop_w_1524_onprep  prop_1564_onprep prop_sw_onprep 
p_artexp_diag   death_rate_onart  death_rate n_death_hivrel  prop_w_1549_sw  p_newp_sw prop_sw_program_visit;
where cald=2019.0 ; * and sw_program = 1;
run;

*/
  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
%macro var(v=);

* &v ;


/* proc means  noprint data=y; var &v; output out=y_19 mean= &v._19; by run ; where 2019.25 <= cald <= 2019.5; */
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run ; where cald = 2020; 

/* proc means noprint data=y; var &v; output out=y_20b   mean= &v._20b; by run option ; where 2020.25 <= cald < 2020.5; */
/* proc means noprint data=y; var &v; output out=y_20_21 mean= &v._20_21; by run option ; where 2020.25 <= cald < 2021.25;*/   
/* proc means noprint data=y; var &v; output out=y_21 mean= &v._21; by run option ; where cald = 2021.50; */
 proc means noprint data=y; var &v; output out=y_20_25 mean= &v._20_25; by run option ; where 2020.5 <= cald < 2025.50;
/* proc means noprint data=y; var &v; output out=y_20_30 mean= &v._20_30; by run option ; where 2020.5 <= cald < 2030.50;*/
proc means noprint data=y; var &v; output out=y_20_40 mean= &v._20_40; by run option ; where 2020.5 <= cald < 2040.50; 

/* proc means noprint data=y; var &v; output out=y_20_70 mean= &v._20_70; by run option ; where 2020.5 <= cald < 2070.50; */ 
  
/* proc sort data=y_20b; by run; proc transpose data=y_20b out=t_20b prefix=&v._20b_; var &v._20b; by run; */ 
/* proc sort data=y_21; by run; proc transpose data=y_21 out=t_21 prefix=&v._21_; var &v._21; by run; */
/*   proc sort data=y_20_21; by run; proc transpose data=y_20_21 out=t_20_21 prefix=&v._20_21_; var &v._20_21; by run;  */
 proc sort data=y_20_25; by run; proc transpose data=y_20_25 out=t_20_25 prefix=&v._20_25_; var &v._20_25; by run; 
/* proc sort data=y_20_30; by run; proc transpose data=y_20_30 out=t_20_30 prefix=&v._20_30_; var &v._20_30; by run; */
 proc sort data=y_20_40; by run; proc transpose data=y_20_40 out=t_20_40 prefix=&v._20_40_; var &v._20_40; by run; 

/* proc sort data=y_20_70; by run; proc transpose data=y_20_70 out=t_20_70 prefix=&v._20_70_; var &v._20_70; by run; */ 

data &v ; merge  y_20 t_20_25 t_20_40 ;  
/* data &v ; merge    y_19 y_20 t_20b t_21 t_20_21  t_20_25  t_20_70 ; */ 
drop _NAME_ _TYPE_ _FREQ_;

%mend var;

%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=rate_susc_np_1549_w);  %var(v=rate_susc_np_ic_1549_m);  %var(v=rate_susc_np_1549_w);
%var(v=p_newp_sw); %var(v=prop_sw_newp0);
%var(v=mean_num_tests_ly_m1549_)  ;  %var(v=mean_num_tests_ly_w1549_); %var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc); %var(v=p_mcirc_1519m); %var(v=p_mcirc_2024m);
%var(v=p_mcirc_2529m); %var(v=p_mcirc_3039m); %var(v=p_mcirc_4049m); %var(v=p_mcirc_50plm); %var(v=p_mcirc_1549m);
%var(v=prop_w_1549_sw); %var(v=prop_w_ever_sw); %var(v=prop_sw_hiv); %var(v=prop_w_1524_onprep); %var(v=prop_1564_onprep);
%var(v=prop_sw_onprep); %var(v=prevalence1549m); %var(v=prevalence1549w); %var(v=prevalence1549); 
%var(v=prevalence1519w);  	%var(v=prevalence1519m);  	  %var(v=prevalence2024w);  	  %var(v=prevalence2024m);  	  %var(v=prevalence2529w);  	  
%var(v=prevalence2529m);    %var(v=prevalence3034w);    %var(v=prevalence3034m);  	%var(v=prevalence3539w);  	  %var(v=prevalence3539m);  	  
%var(v=prevalence4044w);  	 %var(v=prevalence4044m);  	  %var(v=prevalence4549w);  	  %var(v=prevalence4549m);  
%var(v=prevalence_vg1000); %var(v=incidence1549);   %var(v=prevalence1524w); %var(v=prevalence1524m);   %var(v=prevalence_sw);
%var(v=incidence1549w);  %var(v=incidence1549m); 
%var(v=p_inf_vlsupp);  %var(v=p_inf_newp);  %var(v=p_inf_ep);  %var(v=p_inf_diag);  %var(v=p_inf_naive);   %var(v=p_inf_primary); 
%var(v=mtct_prop); %var(v=p_diag); %var(v=p_diag_m); %var(v=p_diag_w); %var(v=p_diag_sw);
%var(v=p_diag_m1524); %var(v=p_diag_w1524);
%var(v=p_ai_no_arv_c_nnm); %var(v=p_ai_no_arv_c_pim); %var(v=p_ai_no_arv_c_rt184m); %var(v=p_ai_no_arv_c_rt65m); %var(v=p_ai_no_arv_c_rttams); 
%var(v=p_ai_no_arv_c_inm); 
%var(v=p_artexp_diag); %var(v=p_onart_diag); %var(v=p_onart_diag_w); %var(v=p_onart_diag_m); %var(v=p_onart_diag_sw); %var(v=p_efa); %var(v=p_taz);
%var(v=p_ten); %var(v=p_zdv); %var(v=p_dol); %var(v=p_3tc); %var(v=p_lpr); %var(v=p_nev); %var(v=p_onart_vl1000); 
%var(v=p_vl1000); %var(v=p_vg1000); %var(v=p_vl1000_m);  %var(v=p_vl1000_w);  %var(v=p_vl1000_m_1524);  %var(v=p_vl1000_w_1524);  
%var(v=p_onart_m); %var(v=p_onart_w); 
%var(v=p_onart_vl1000_w); %var(v=p_onart_vl1000_m); %var(v= p_onart_vl1000_1524);  %var(v=p_onart_vl1000_sw);
%var(v=prev_vg1000_newp_m);  %var(v=prev_vg1000_newp_w);   %var(v=reg_option) ;  %var(v= p_startedline2) ;
%var(v=p_tle);  %var(v=p_tld);  %var(v=p_zld);  %var(v=p_zla);  %var(v=p_otherreg);  %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
%var(v=aids_death_rate);  %var(v=death_rate_onart); %var(v=ddaly);  %var(v=ddaly_all);  %var(v=dcost);  %var(v= dart_cost_y);
%var(v=dadc_cost);   %var(v=dcd4_cost);   %var(v=dvl_cost);   %var(v=dvis_cost);   %var(v=dwho3_cost);   %var(v=dcot_cost);   %var(v=dtb_cost);   
%var(v=dres_cost);  %var(v=dtest_cost);   %var(v=d_t_adh_int_cost);   %var(v=dswitchline_cost);  %var(v=dtaz_cost);   %var(v=dcost_drug_level_test);
%var(v=dclin_cost );  
%var(v=dcost_cascade_interventions );      %var(v=dcost_circ );  %var(v=dcost_condom_dn);
%var(v=dcost_prep_visit );   %var(v=dcost_prep );   %var(v=dcost_drug_level_test ); 
%var(v=dcost_clin_care );  %var(v=dcost_non_aids_pre_death );  %var(v=dcost_child_hiv );  %var(v=dzdv_cost );   %var(v=dten_cost );   %var(v=d3tc_cost );   
%var(v=dnev_cost );   %var(v=dlpr_cost );   %var(v=ddar_cost );   %var(v=dtaz_cost );    %var(v=defa_cost );   %var(v=ddol_cost );
%var(v=m15r);  %var(v=m25r);  %var(v=m35r);  %var(v=m45r);  %var(v=m55r);  %var(v=w15r);  %var(v=w25r);  %var(v=w35r);  %var(v=w45r);  %var(v=w55r)
%var(v=r_efa_hiv); %var(v=p_onart_cd4_l200);
%var(v=p_dol_2vg1000_dolr1_adh0); %var(v=p_dol_2vg1000_dolr1_adh1); %var(v=p_dol_2vg1000_dolr0_adh0); %var(v=p_dol_2vg1000_dolr0_adh1);
%var(v=p_onart_cd4_l500);   %var(v=p_startedline2);  %var(v=prop_art_or_prep);  %var(v=n_sw_1564);   %var(v=prop_sw_onprep);   %var(v=p_onart);
%var(v=p_o_zdv_tox);   %var(v=p_o_3tc_tox);   %var(v=p_o_ten_tox);   %var(v=p_o_taz_tox);   %var(v=p_o_lpr_tox);   %var(v=p_o_efa_tox);   
%var(v=p_o_nev_tox);  %var(v=p_o_dol_tox);   %var(v=p_o_zdv_adh_hi);   %var(v=p_o_3tc_adh_hi);   %var(v=p_o_ten_adh_hi);  
%var(v=p_o_taz_adh_hi);   %var(v=p_o_lpr_adh_hi);   %var(v=p_o_efa_adh_hi);   %var(v=p_o_nev_adh_hi);   %var(v=p_o_dol_adh_hi);  
%var(v= p_o_tle_tox);   %var(v=p_o_tld_tox);   %var(v=p_o_zla_tox);   %var(v=p_o_zld_tox);    %var(v=p_o_tle_adh_hi);   %var(v=p_o_tld_adh_hi);   
%var(v=p_o_zla_adh_hi);   %var(v=p_o_zld_adh_hi);   %var(v=p_adh_hi);    %var(v=s_a_zld_if_reg_op_116);
%var(v=p_nactive_ge2p75_xyz);  %var(v=p_adh_hi_xyz_ot1);   %var(v=p_adh_hi_xyz_ot2);   %var(v=p_adh_hi_xyz_itt);   %var(v=p_e_rt65m_xyz);   
%var(v=p_nactive_ge2p00_xyz);   %var(v=p_nactive_ge1p50_xyz); 
%var(v=p_184m_ontle_vlg1000);  %var(v=p_65m_ontle_vlg1000);  %var(v=p_nnm_ontle_vlg1000);   %var(v=p_184m_ontld_vlg1000);   %var(v=p_65m_ontld_vlg1000);  
%var(v=p_nnm_ontld_vlg1000);   %var(v=p_inm_ontld_vlg1000);   %var(v=p_inm_ontld_vlg1000);   
%var(v=p_tams_ontle_vlg1000);  %var(v=p_tams_ontld_vlg1000);  %var(v=p_k65m); %var(v=p_m184m);
%var(v=death_rate);   %var(v=death_rate_hiv); %var(v=death_rate_hiv_m); %var(v=death_rate_hiv_w);
%var(v=p_iime_);   %var(v=p_pime_);   %var(v=p_nnme_);     %var(v=n_pregnant_ntd);   %var(v=n_preg_odabe);
%var(v=ddaly_non_aids_pre_death);    %var(v=ddaly_ac_ntd_mtct);    %var(v=ddaly_ac_ntd_mtct_odabe);     %var(v=ddaly_ntd_mtct_napd);   
%var(v=ddaly_ntd_mtct_odab_napd); %var(v=n_birth_with_inf_child);
%var(v=dead_ddaly_ntd);   %var(v=ddaly_mtct);  %var(v=dead_ddaly_odabe);  %var(v=n_tested); 
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   %var(v= n_hiv1_prep);
%var(v= n_prep); %var(v=n_covid); %var(v=n_death_covid);  %var(v=n_death);  %var(v=n_death_hivrel); 
%var(v=p_death_hivrel_age_le64);  %var(v=p_prep_ever); %var(v=p_hiv1_prep);  %var(v=incidence1524w);   %var(v=incidence1524m)
%var(v=n_mcirc1549_);%var (v=n_mcirc1549_3m);%var(v=n_new_inf1549m); %var(v=n_new_inf1549);


data   wide_outputs; merge 
s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5 gender_r_newp  rate_susc_np_1549_w  rate_susc_np_ic_1549_m  rate_susc_np_1549_w
p_newp_sw mean_num_tests_ly_m1549_  mean_num_tests_ly_w1549_  n_tested_m   p_tested_past_year_1549m  p_tested_past_year_1549w
p_diag_m1524 p_diag_w1524 p_diag_sw  p_onart_cd4_l200
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3039m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_onprep prop_sw_onprep prevalence1549m prevalence1549w prevalence1549 
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
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w reg_option p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly  ddaly_all  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost dcost_cascade_interventions     dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564  prop_sw_onprep  p_onart 
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000  
death_rate  death_rate_hiv death_rate_hiv_m death_rate_hiv_w  p_iime_   p_pime_   p_nnme_  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd ddaly  ddaly_all 
n_birth_with_inf_child  dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe n_tested  p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep  n_covid  n_death_covid n_death n_death_hivrel p_death_hivrel_age_le64 
p_prep_ever  p_hiv1_prep incidence1524w   incidence1524m n_mcirc1549_ n_mcirc1549_3m n_new_inf1549m n_new_inf1549;

;

proc contents; run;

proc sort; by run; run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2020; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=sf_2019);
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
%par(p= rr_int_tox );   %par(p= r_bir_w_infected_child_);  %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg );
%par(p= keep_going_1999 );  %par(p= keep_going_2004 );  %par(p= keep_going_2016 );  %par(p= keep_going_2020 ); 
%par(p=eff_max_freq_testing ); 		%par(p=eff_rate_restart );  		%par(p=eff_prob_loss_at_diag );  		%par(p=eff_rate_lost );  		
%par(p=eff_prob_lost_art );  		%par(p=eff_rate_return );  			
%par(p=eff_pr_art_init );  	%par(p=eff_rate_int_choice );  	%par(p=eff_prob_vl_meas_done );  		%par(p=eff_pr_switch_line );  	
%par(p=eff_rate_test_startprep );  	%par(p=eff_rate_test_restartprep );  	%par(p=prep_strategy );
%par(p=eff_rate_choose_stop_prep );  		%par(p=eff_prob_prep_restart_choice );  %par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=eff_test_targeting );  %par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); 
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); %par(p=rate_sw_rred_rc);


data wide_par; merge 
sf_2019 sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
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
rr_int_tox   r_bir_w_infected_child_ nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
eff_max_freq_testing 		eff_rate_restart 		eff_prob_loss_at_diag 		eff_rate_lost 		eff_prob_lost_art 		eff_rate_return 			
eff_pr_art_init 	eff_rate_int_choice 	eff_prob_vl_meas_done 		eff_pr_switch_line 	eff_rate_test_startprep 	eff_rate_test_restartprep 	
eff_rate_choose_stop_prep 		eff_prob_prep_restart_choice 	eff_test_targeting
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
keep_going_1999  keep_going_2004  keep_going_2016  keep_going_2020   prep_strategy rate_sw_rred_rc
;

proc contents; run;

run;
proc sort; by run;run;




* NOTE THESE BLOCKS OF CODE ARE SPECIFIC TO OPTIONS (currently for case of 2 options 0 and 1) ;

* values for parameters that change after the intervention introduction, for option=1;

%macro par_ai1(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p._ai1; by run ; where cald = 2021 and option = 1 ;run;
data &p._ai1 ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par_ai1_option1; 

%par_ai1(p=exp_setting_lower_p_vl1000 ); 
%par_ai1(p=external_exp_factor );  %par_ai1(p=rate_exp_set_lower_p_vl1000 );   %par_ai1(p=max_freq_testing ); 
%par_ai1(p=test_targeting );   %par_ai1(p=prob_loss_at_diag );  %par_ai1(p=pr_art_init );  
%par_ai1(p=rate_lost );  %par_ai1(p=prob_lost_art );  %par_ai1(p=rate_return );  %par_ai1(p=rate_restart );  %par_ai1(p=rate_int_choice ); 
%par_ai1(p=clinic_not_aw_int_frac );   %par_ai1(p=rate_loss_persistence );  %par_ai1(p=incr_rate_int_low_adh ); 
%par_ai1(p=fold_change_mut_risk );  %par_ai1(p=adh_effect_of_meas_alert );  %par_ai1(p=pr_switch_line );  %par_ai1(p=prob_vl_meas_done ); 
%par_ai1(p=red_adh_tb_adc );  %par_ai1(p=red_adh_tox_pop );  %par_ai1(p=add_eff_adh_nnrti );  %par_ai1(p=altered_adh_sec_line_pop ); 
%par_ai1(p=prob_return_adc );  %par_ai1(p=prob_lossdiag_adctb );  %par_ai1(p=prob_lossdiag_who3e ); %par_ai1(p=higher_newp_less_engagement ); 
%par_ai1(p=fold_tr );  %par_ai1(p=switch_for_tox );  %par_ai1(p=adh_pattern_prep );   %par_ai1(p=base_rate_sw ); 

%par_ai1(p=condom_incr_2020 );    			%par_ai1(p=cascade_care_improvements ); %par_ai1(p=incr_test_2020 );             %par_ai1(p=decr_hard_reach_2020 );  
%par_ai1(p=decr_prob_loss_at_diag_2020 ); 	%par_ai1(p=decr_rate_lost_2020 );		%par_ai1(p=decr_rate_lost_art_2020 );    %par_ai1(p=incr_rate_return_2020 );     
%par_ai1(p=incr_rate_restart_2020 );        %par_ai1(p=incr_rate_init_2020 );       %par_ai1(p=decr_rate_int_choice_2020 ); 
%par_ai1(p=incr_prob_vl_meas_done_2020 ); 
%par_ai1(p=incr_pr_switch_line_2020 )    	%par_ai1(p=prep_improvements );       	%par_ai1(p=incr_adh_pattern_prep_2020 ); 
%par_ai1(p=inc_r_test_startprep_2020 ); %par_ai1(p=incr_r_test_restartprep_2020 ); %par_ai1(p=decr_r_choose_stop_prep_2020 ); 
%par_ai1(p=inc_p_prep_restart_choi_2020 );%par_ai1(p=incr_prepuptake_sw_2020 );   %par_ai1(p=incr_prepuptake_pop_2020 );   %par_ai1(p=expand_prep_to_all_2020 ); 
%par_ai1(p=circ_improvements ); 			%par_ai1(p=circ_inc_rate_2020 ); 		%par_ai1(p=incr_test_targeting_2020 );   %par_ai1(p=pop_wide_tld_2020 );
%par_ai1(p=incr_max_freq_testing_2020 );    %par_ai1(p=initial_pr_switch_line );    %par_ai1(p=initial_prob_vl_meas_done );  %par_ai1(p=sw_test_6mthly_2020 ); 
%par_ai1(p=reg_option_switch_2020 );     %par_ai1(p=art_mon_drug_levels_2020 );      %par_ai1(p=ten_is_taf_2020 );   

%par_ai1(p=eff_max_freq_testing ); 		%par_ai1(p=eff_rate_restart );  		%par_ai1(p=eff_prob_loss_at_diag );  		%par_ai1(p=eff_rate_lost );  		
%par_ai1(p=eff_prob_lost_art );  		%par_ai1(p=eff_rate_return );  
%par_ai1(p=eff_pr_art_init );  	%par_ai1(p=eff_rate_int_choice );  	%par_ai1(p=eff_prob_vl_meas_done );  		%par_ai1(p=eff_pr_switch_line );  	
%par_ai1(p=eff_rate_test_startprep );  	%par_ai1(p=eff_rate_test_restartprep );  	
%par_ai1(p=eff_rate_choose_stop_prep );  		%par_ai1(p=eff_prob_prep_restart_choice );  	
%par_ai1(p=e_decr_hard_reach_2020 ); %par_ai1(p=eff_test_targeting ); %par_ai1(p=prep_strategy );
%par_ai1(p=vmmc_disrup_covid);  %par_ai1(p=condom_disrup_covid);  %par_ai1(p=prep_disrup_covid);  %par_ai1(p=swprog_disrup_covid);  
%par_ai1(p=testing_disrup_covid);  %par_ai1(p=art_tld_disrup_covid);  %par_ai1(p=art_tld_eod_disrup_covid);   %par_ai1(p=art_init_disrup_covid);   
%par_ai1(p=vl_adh_switch_disrup_covid);  %par_ai1(p=cotrim_disrup_covid);    %par_ai1(p=no_art_disrup_covid); 
%par_ai1(p=inc_adeathr_disrup_covid); %par_ai1(p=art_low_adh_disrup_covid);  %par_ai1(p=cov_death_risk_mult); 

run;


data wide_par_after_int_option1; merge 
 exp_setting_lower_p_vl1000_ai1 
external_exp_factor_ai1 rate_exp_set_lower_p_vl1000_ai1  max_freq_testing_ai1 
test_targeting_ai1  prob_loss_at_diag_ai1 pr_art_init_ai1 
rate_lost_ai1 prob_lost_art_ai1 rate_return_ai1 rate_restart_ai1 rate_int_choice_ai1 
clinic_not_aw_int_frac_ai1  rate_loss_persistence_ai1 incr_rate_int_low_adh_ai1 
fold_change_mut_risk_ai1 adh_effect_of_meas_alert_ai1 pr_switch_line_ai1 prob_vl_meas_done_ai1 
red_adh_tb_adc_ai1 red_adh_tox_pop_ai1 add_eff_adh_nnrti_ai1 altered_adh_sec_line_pop_ai1 
prob_return_adc_ai1 prob_lossdiag_adctb_ai1 prob_lossdiag_who3e_ai1 higher_newp_less_engagement_ai1 
fold_tr_ai1 switch_for_tox_ai1 adh_pattern_prep_ai1   base_rate_sw_ai1 

condom_incr_2020_ai1    			cascade_care_improvements_ai1 	incr_test_2020_ai1             decr_hard_reach_2020_ai1  
decr_prob_loss_at_diag_2020_ai1 	decr_rate_lost_2020_ai1 		decr_rate_lost_art_2020_ai1    incr_rate_return_2020_ai1     
incr_rate_restart_2020_ai1        	incr_rate_init_2020_ai1       	decr_rate_int_choice_2020_ai1  incr_prob_vl_meas_done_2020_ai1 
incr_pr_switch_line_2020_ai1    	prep_improvements_ai1       	incr_adh_pattern_prep_2020_ai1 
inc_r_test_startprep_2020_ai1 	incr_r_test_restartprep_2020_ai1 decr_r_choose_stop_prep_2020_ai1 
inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1   	incr_prepuptake_pop_2020_ai1   expand_prep_to_all_2020_ai1 
circ_improvements_ai1 				circ_inc_rate_2020_ai1 		incr_test_targeting_2020_ai1   pop_wide_tld_2020_ai1 
incr_max_freq_testing_2020_ai1     initial_pr_switch_line_ai1 	    initial_prob_vl_meas_done_ai1  sw_test_6mthly_2020_ai1 
reg_option_switch_2020_ai1  art_mon_drug_levels_2020_ai1   ten_is_taf_2020_ai1 	

eff_max_freq_testing_ai1 		eff_rate_restart_ai1  		eff_prob_loss_at_diag_ai1  		eff_rate_lost_ai1  		
eff_prob_lost_art_ai1  		eff_rate_return_ai1  		
eff_pr_art_init_ai1  	eff_rate_int_choice_ai1  	eff_prob_vl_meas_done_ai1  		eff_pr_switch_line_ai1  	
eff_rate_test_startprep_ai1  	eff_rate_test_restartprep_ai1  	
eff_rate_choose_stop_prep_ai1  		eff_prob_prep_restart_choice_ai1  	  
e_decr_hard_reach_2020_ai1 eff_test_targeting_ai1   prep_strategy_ai1 

vmmc_disrup_covid_ai1 condom_disrup_covid_ai1 prep_disrup_covid_ai1 swprog_disrup_covid_ai1 testing_disrup_covid_ai1 art_tld_disrup_covid_ai1
art_tld_eod_disrup_covid_ai1  art_init_disrup_covid_ai1 vl_adh_switch_disrup_covid_ai1 cotrim_disrup_covid_ai1 no_art_disrup_covid_ai1 
inc_adeathr_disrup_covid_ai1   art_low_adh_disrup_covid_ai1  cov_death_risk_mult_ai1

;

proc contents; run;

run;
proc sort; by run;


* values for parameters that change after the intervention for option=0;

%macro par_ai0(p=);
* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p._ai0; by run ; where cald = 2021 and option = 0 ;run;
data &p._ai0 ; set  y_ ; drop _TYPE_ _FREQ_; 

%mend par_ai0; 

%par_ai0(p=option_0_prep_continue_2020 );	 
%par_ai0(p=eff_rate_test_startprep );  	%par_ai0(p=eff_rate_test_restartprep );  	
%par_ai0(p=eff_rate_choose_stop_prep );  		%par_ai0(p=eff_prob_prep_restart_choice );  	

data wide_par_after_int_option0; merge 
option_0_prep_continue_2020_ai0   eff_rate_test_startprep_ai0  	eff_rate_test_restartprep_ai0   	
eff_rate_choose_stop_prep_ai0   eff_prob_prep_restart_choice_ai0  	
; 
run;

proc contents; run;

proc sort; by run;run;


  libname a "C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\"; 
  libname b "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\dolswitch\reading datasets\";
  libname c "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\prep\reading datasets\";
  libname d "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\tld_prep\reading datasets\";
  libname e "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\covid_hiv\reading datasets\";
  libname f "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\";
  libname g "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\vmmc";

* To get one row per run;
* data a.wide_dolswitch;
* data c.wide_prep; 
* data d.wide_tld_prep; 
* data e.wide_covid_hiv_6mths_a;
* data e.wide_covid_hiv_6mths_b;
* data e.wide_covid_hiv_6mths_c;
* data e.wide_covid_hiv_3mths_a;
* data e.wide_covid_main_revision_op3 ;
* data e.wide_covid_main_revision_extra;
* data e.wide_core_pre_6_6_20;
* data e.wide_core_6_6_20;
* data f.wide_covid_revision_3mth_op1 ;  
* data f.wide_covid_revision_5yr_op1 ;
* data f.wide_covid_revision_dsb_op1 ;
* data f.wide_core_18_6_20_6pm ;
  data g.wide_vmmc_2_7_20_10am; 


* merge  sf  wide_outputs  wide_par wide_par_after_int_option0  wide_par_after_int_option1  ; * this for prep and covid_hiv ;
  merge  sf  wide_outputs  wide_par ;  * this for tld_prep and dolswitch ;
  by run;run;

* data wide_prep; 


* merge  sf  wide_outputs    ;
* by run;


   data wide;    
*  set b.wide_dolswitch;
*  set c.wide_prep; 
*  set d.wide_tld_prep; 
*  set e.wide_covid_hiv_3mths; * results for submitted ms;
*  set e.wide_covid_hiv_6mths_a;
*  set e.wide_covid_hiv_6mths_b; * results for submitted ms;
*  set e.wide_covid_main_revision_op3 ;
*  set e.wide_covid_main_revision_extra;
*  set e.wide_core_pre_6_6_20 ;
*  set e.wide_core_6_6_20 ;
*  set f.wide_covid_revision_3mth_op1;
*  set f.wide_covid_revision_5yr_op1;
*  set f.wide_covid_revision_dsb_op1;
*  set f.wide_core_18_6_20_6pm ;
   set g.wide_vmmc_2_7_20_10am; 


* if 0.04 <  prevalence1549_20 < 0.30;

* for main :; * if run <= 989384738 ;


/*
* additional runs post submission used just for effects of no art on incidence;
   data covid_hiv_6m ; set e.wide_covid_hiv_6mths_c;  d_6mths=1; if dataset_20 ge 2 and prevalence1549_20 > 0.045 and run <= 780842251 ; 
   data covid_hiv_3m ; set e.wide_covid_hiv_3mths_a;  d_3mths=1; if prevalence1549_20 > 0.045;
   data wide; set    covid_hiv_3m    covid_hiv_6m ; 
*/


* if prep_improvements_ai1 ne .
   ;

/*
ratio_prev_age2529w_overall_16 = prevalence2529w_16 / prevalence1549_16 ;  
sex_ratio_prev_age2024_16 = prevalence2024w_16 / prevalence2024m_16 ;
ratio_prev_age2529w_overall_19 = prevalence2529w_19 / prevalence1549_19 ;  
sex_ratio_prev_age2024_19 = prevalence2024w_19 / prevalence2024m_19 ;

accept=0; if keep_going_2016_ = 1 and keep_going_2020_ = 1 and 1/1.15 <= gender_r_newp_05_20 <= 1.15 
and incidence1549w_16 / incidence1549m_16 > 1.25 and incidence1549_16 < 2.5 then accept=1;

*/
* dont think we need this with keep_going code now in model program;
* if accept=1;


* for dolswitch;
* if incidence1549_19 < 2.1;  * this line to give n=500 setting scenarios for hiv drug resistance talk in joburg;
* this selection above used with datasets d1-d11 as indicated in "reading_dolswitch_files.sas"  




* --------------------------------------------------------------------------------------------------------------;

* general code;

n_sw_1564_16 = round(n_sw_1564_16, 1);
n_sw_1564_19 = round(n_sw_1564_19, 1);




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

*/ 

* for covid_hiv ;


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


/*

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

* proc print data=wide; * var ;
proc freq data=wide; tables
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w  p_rred_p  p_hsb_p  newp_factor  eprate  conc_ep  
ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep  exp_setting_lower_p_vl1000  external_exp_factor  
rate_exp_set_lower_p_vl1000  prob_pregnancy_base fold_change_w  fold_change_yw  fold_change_sti  super_infection  an_lin_incr_test  
date_test_rate_plateau  rate_testanc_inc  incr_test_rate_sympt  max_freq_testing  test_targeting  fx  adh_pattern  prob_loss_at_diag  pr_art_init  
rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice  clinic_not_aw_int_frac  res_trans_factor_nn  rate_loss_persistence  
incr_rate_int_low_adh  poorer_cd4rise_fail_nn  poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  
pr_switch_line  prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  prob_lossdiag_adctb  
prob_lossdiag_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox  adh_pattern_prep  rate_test_startprep  rate_test_restartprep  
rate_choose_stop_prep  circ_inc_rate p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat base_rate_sw 

option_0_prep_continue_2020_ai0  	
eff_rate_test_startprep_ai0  	eff_rate_test_restartprep_ai0  	
eff_rate_choose_stop_prep_ai0  eff_prob_prep_restart_choice_ai0 	

condom_incr_2020_ai1    			cascade_care_improvements_ai1 	incr_test_2020_ai1             decr_hard_reach_2020_ai1  
decr_prob_loss_at_diag_2020_ai1 	decr_rate_lost_2020_ai1		decr_rate_lost_art_2020_ai1    incr_rate_return_2020_ai1     
incr_rate_restart_2020_ai1        	incr_rate_init_2020_ai1       	decr_rate_int_choice_2020_ai1  incr_prob_vl_meas_done_2020_ai1 
incr_pr_switch_line_2020_ai1    	prep_improvements_ai1       	incr_adh_pattern_prep_2020_ai1 
inc_r_test_startprep_2020_ai1 	incr_r_test_restartprep_2020_ai1 decr_r_choose_stop_prep_2020_ai1 
inc_p_prep_restart_choi_2020_ai1 incr_prepuptake_sw_2020_ai1   	incr_prepuptake_pop_2020_ai1   expand_prep_to_all_2020_ai1 
circ_improvements_ai1 				circ_inc_rate_2020_ai1 		incr_test_targeting_2020_ai1   pop_wide_tld_2020_ai1
incr_max_freq_testing_2020_ai1     initial_pr_switch_line_ai1	    initial_prob_vl_meas_done_ai1  sw_test_6mthly_2020_ai1 
reg_option_switch_2020_ai1  art_mon_drug_levels_2020_ai1   ten_is_taf_2020_ai1	

 exp_setting_lower_p_vl1000_ai1
external_exp_factor_ai1 rate_exp_set_lower_p_vl1000_ai1  max_freq_testing_ai1
test_targeting_ai1  prob_loss_at_diag_ai1 pr_art_init_ai1 
rate_lost_ai1 prob_lost_art_ai1 rate_return_ai1 rate_restart_ai1 rate_int_choice_ai1
clinic_not_aw_int_frac_ai1  rate_loss_persistence_ai1 incr_rate_int_low_adh_ai1
fold_change_mut_risk_ai1 adh_effect_of_meas_alert_ai1 pr_switch_line_ai1 prob_vl_meas_done_ai1
red_adh_tb_adc_ai1 red_adh_tox_pop_ai1 add_eff_adh_nnrti_ai1 altered_adh_sec_line_pop_ai1
prob_return_adc_ai1 prob_lossdiag_adctb_ai1 prob_lossdiag_who3e_ai1 higher_newp_less_engagement_ai1
fold_tr_ai1 switch_for_tox_ai1 adh_pattern_prep_ai1  base_rate_sw_ai1  cascade_care_improvements_ai1

eff_max_freq_testing_ai1 		eff_rate_restart_ai1  		eff_prob_loss_at_diag_ai1  		eff_rate_lost_ai1  		
eff_prob_lost_art_ai1  		eff_rate_return_ai1  			
eff_pr_art_init_ai1  	eff_rate_int_choice_ai1  	eff_prob_vl_meas_done_ai1  		eff_pr_switch_line_ai1  	
eff_rate_test_startprep_ai1  	eff_rate_test_restartprep_ai1  	
eff_rate_choose_stop_prep_ai1  		eff_prob_prep_restart_choice_ai1  	e_decr_hard_reach_2020_ai1 eff_test_targeting_ai1 

vmmc_disrup_covid_ai1 condom_disrup_covid_ai1 prep_disrup_covid_ai1 swprog_disrup_covid_ai1 testing_disrup_covid_ai1 art_tld_disrup_covid_ai1
art_tld_eod_disrup_covid_ai1  art_init_disrup_covid_ai1 vl_adh_switch_disrup_covid_ai1 cotrim_disrup_covid_ai1 no_art_disrup_covid_ai1 
inc_adeathr_disrup_covid_ai1   art_low_adh_disrup_covid_ai1 cov_death_risk_mult_ai1

;

run;

*/

/*

proc univariate data=wide;
var s_alive_16			p_w_giv_birth_this_per_16	p_newp_ge1_16  p_newp_ge5_16 
rate_susc_np_1549_w_16  rate_susc_np_ic_1549_m_16  rate_susc_np_1549_w_16
p_newp_sw_16  mean_num_tests_ly_m1549__16  mean_num_tests_ly_w1549__16  n_tested_m_16
p_mcirc_16	 		p_mcirc_1519m_16	p_mcirc_2024m_16	p_mcirc_2529m_16		p_mcirc_3039m_16	p_mcirc_4049m_16 	p_mcirc_50plm_16 
prop_w_1549_sw_16	prop_w_ever_sw_16 	prop_sw_hiv_16 	prop_w_1524_onprep_16  prop_1564_onprep_16 	prevalence1549m_16 prevalence1549w_16
prevalence1549_16 
prevalence1519w_16 	prevalence1519m_16 	  prevalence2024w_16 	  prevalence2024m_16 	  prevalence2529w_16 	  prevalence2529m_16   prevalence3034w_16   
prevalence3034m_16 	prevalence3539w_16 	  prevalence3539m_16 	  prevalence4044w_16 	 prevalence4044m_16 	  prevalence4549w_16  prevalence4549m_16 
prevalence_vg1000_16 incidence1549_16 incidence1549w_16  incidence1549m_16 
p_inf_vlsupp_16   p_inf_newp_16   p_inf_ep_16   p_inf_diag_16   p_inf_naive_16 p_inf_primary_16
mtct_prop_16 		p_diag_16 	p_diag_m_16   p_diag_w_16	p_ai_no_arv_c_nnm_16    p_artexp_diag_16
p_onart_diag_16	p_onart_diag_w_16 	p_onart_diag_m_16 	p_efa_16 	p_taz_16		p_ten_16 	p_zdv_16	p_dol_16	p_3tc_16 	p_lpr_16 	p_nev_16 
p_onart_vl1000_16   p_vl1000_16		p_vg1000_16 		p_onart_m_16 	p_onart_w_16 
p_onart_vl1000_w_16				p_onart_vl1000_m_16  prev_vg1000_newp_m_16   prev_vg1000_newp_w_16 p_startedline2_16
p_tle_16	 p_tld_16	 p_zld_16	 p_zla_16	 p_otherreg_16	 p_drug_level_test_16	 p_linefail_ge1_16   gender_r_newp_16  gender_r_newp_16
r_efa_hiv_16   ratio_prev_age2529w_overall_16 sex_ratio_prev_age2024_16 p_onart_cd4_l500_16  p_startedline2_16 prop_art_or_prep_16 
;
run;


proc univariate data=wide;
var s_alive_20			p_w_giv_birth_this_per_20	p_newp_ge1_20  p_newp_ge5_20 
rate_susc_np_1549_w_20  rate_susc_np_ic_1549_m_20  rate_susc_np_1549_w_20
p_newp_sw_20  mean_num_tests_ly_m1549__20  mean_num_tests_ly_w1549__20  n_tested_m_20
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

*/


proc univariate data=wide;
var p_w_giv_birth_this_per_20	p_mcirc_20	prevalence1549_20 incidence1549m_20 	p_diag_20 	p_diag_m_20   p_diag_w_20	p_ai_no_arv_c_nnm_20   
prop_w_1549_sw_20  mtct_prop_20  prop_1564_onprep_20
p_onart_diag_20 p_onart_vl1000_20   p_vl1000_20	p_onart_vl1000_w_20	p_onart_vl1000_m_20   p_onart_cd4_l500_20  
p_onart_cd4_l200_20  p_startedline2_20 prop_sw_newp0_20  prop_sw_hiv_20 ;
run;

proc glm; class sw_init_newp sw_trans_matrix; model prop_sw_newp0_20 = sw_init_newp sw_trans_matrix rate_sw_rred_rc / solution; run;

proc freq; tables sw_init_newp sw_trans_matrix rate_sw_rred_rc ; run;


/*

proc univariate data=wide;  var p_w_giv_birth_this_per_19 prop_w_1549_sw_19  p_mcirc_1549m_19
p_tested_past_year_1549m_19  p_tested_past_year_1549w_19
prevalence1549_19 prevalence1524w_19  prevalence1524m_19
prevalence1549m_19 prevalence1549w_19  prevalence_sw_19
incidence1549_19 incidence1549w_19  incidence1549m_19 
mtct_prop_19 		p_diag_19 	p_diag_m_19   p_diag_w_19  p_diag_m1524_19  p_diag_w1524_19   p_diag_sw_19
p_ai_no_arv_c_nnm_19
p_ai_no_arv_c_pim_19  p_ai_no_arv_c_rt184m_19  p_ai_no_arv_c_rt65m_19   p_ai_no_arv_c_rttams_19  p_ai_no_arv_c_inm_19
p_onart_diag_19  p_onart_diag_w_19 	p_onart_diag_m_19 p_onart_diag_sw_19 	p_onart_vl1000_19   p_vl1000_19   
p_vl1000_m_19  p_vl1000_w_19   p_vl1000_m_1524_19  p_vl1000_w_1524_19  
p_onart_vl1000_w_19				p_onart_vl1000_m_19   p_onart_vl1000_1524_19   p_onart_vl1000_sw_19
p_onart_cd4_l500_19  p_startedline2_19  
p_vlg1000_onart_65m_19   p_vlg1000_onart_184m_19
p_184m_ontle_vlg1000_19  p_65m_ontle_vlg1000_19  p_nnm_ontle_vlg1000_19   p_184m_ontld_vlg1000_19   p_65m_ontld_vlg1000_19  
p_nnm_ontld_vlg1000_19   p_inm_ontld_vlg1000_19   p_inm_ontld_vlg1000_19 
p_tams_ontle_vlg1000_19   p_tams_ontld_vlg1000_19  	prop_w_1524_onprep_19  prop_1564_onprep_19 prop_sw_onprep_19 
;
run;

*/



* proc univariate  data=wide; * var gender_r_newp_05_20
m15r_05_20 m25r_05_20 m35r_05_20 m45r_05_20 m55r_05_20 w15r_05_20 w25r_05_20 w35r_05_20 w45r_05_20 w55r_05_20 
m15r_16 m25r_16 m35r_16 m45r_16 m55r_16 w15r_16 w25r_16 w35r_16 w45r_16 w55r_16 
m15r_19 m25r_19 m35r_19 m45r_19 m55r_19 w15r_19 w25r_19 w35r_19 w45r_19 w55r_19 
;  * run;

/*
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

*VMMC;


*difference in HIV death rate;
ddeath_rate_hiv_m_20_25_2 = death_rate_hiv_m_20_25_2 - death_rate_hiv_m_20_25_1;
ddeath_rate_hiv_m_20_25_3 = death_rate_hiv_m_20_25_3 - death_rate_hiv_m_20_25_1;
ddeath_rate_hiv_m_20_25_4 = death_rate_hiv_m_20_25_4 - death_rate_hiv_m_20_25_1;

ddeath_rate_hiv_m_20_40_2 = death_rate_hiv_m_20_40_2 - death_rate_hiv_m_20_40_1;
ddeath_rate_hiv_m_20_40_3 = death_rate_hiv_m_20_40_3 - death_rate_hiv_m_20_40_1;
ddeath_rate_hiv_m_20_40_4 = death_rate_hiv_m_20_40_4 - death_rate_hiv_m_20_40_1;


*dalys averted;
d_ddaly_all_20_25_2 = -(ddaly_all_20_25_2 - ddaly_all_20_25_1);
d_ddaly_all_20_25_3 = -(ddaly_all_20_25_3 - ddaly_all_20_25_1);
d_ddaly_all_20_25_4 = -(ddaly_all_20_25_4 - ddaly_all_20_25_1);
d_ddaly_all_20_40_2 = -(ddaly_all_20_40_2 - ddaly_all_20_40_1);
d_ddaly_all_20_40_3 = -(ddaly_all_20_40_3 - ddaly_all_20_40_1);
d_ddaly_all_20_40_4 = -(ddaly_all_20_40_4 - ddaly_all_20_40_1);

*difference in costs;
d_dcost_20_25_2 = dcost_20_25_2 - dcost_20_25_1;
d_dcost_20_25_3 = dcost_20_25_3 - dcost_20_25_1;
d_dcost_20_25_4 = dcost_20_25_4 - dcost_20_25_1;
d_dcost_20_40_2 = dcost_20_40_2 - dcost_20_40_1;
d_dcost_20_40_3 = dcost_20_40_3 - dcost_20_40_1;
d_dcost_20_40_4 = dcost_20_40_4 - dcost_20_40_1;


*net dalys;
ndb_500_20_25_1 =  ddaly_all_20_25_1 + (dcost_20_25_1)/0.0005; 
ndb_500_20_25_2 =  ddaly_all_20_25_2 + (dcost_20_25_2)/0.0005; 
ndb_500_20_25_3 =  ddaly_all_20_25_3 + (dcost_20_25_3)/0.0005; 
ndb_500_20_25_4 =  ddaly_all_20_25_4 + (dcost_20_25_4)/0.0005; 
ndb_500_20_40_1 =  ddaly_all_20_40_1 + (dcost_20_40_1)/0.0005;
ndb_500_20_40_2 =  ddaly_all_20_40_2 + (dcost_20_40_2)/0.0005; 
ndb_500_20_40_3 =  ddaly_all_20_40_3 + (dcost_20_40_3)/0.0005; 
ndb_500_20_40_4 =  ddaly_all_20_40_4 + (dcost_20_40_4)/0.0005; 


*net dalys averted;
d_net_dalys_20_25_2 = -(ndb_500_20_25_2 - ndb_500_20_25_1);
d_net_dalys_20_25_3 = -(ndb_500_20_25_3 - ndb_500_20_25_1);
d_net_dalys_20_25_4 = -(ndb_500_20_25_4 - ndb_500_20_25_1);
d_net_dalys_20_40_2 = -(ndb_500_20_40_2 - ndb_500_20_40_1);
d_net_dalys_20_40_3 = -(ndb_500_20_40_3 - ndb_500_20_40_1);
d_net_dalys_20_40_4 = -(ndb_500_20_40_4 - ndb_500_20_40_1);


*nnt;
*difference in number of circumcisions;
d_n_mcirc_20_25_2 = n_mcirc1549__20_25_2 - n_mcirc1549__20_25_1;
d_n_mcirc_20_25_3 = n_mcirc1549__20_25_3 - n_mcirc1549__20_25_1;
d_n_mcirc_20_25_4 = n_mcirc1549__20_25_4 - n_mcirc1549__20_25_1;
d_n_mcirc_20_40_2 = n_mcirc1549__20_40_2 - n_mcirc1549__20_40_1;
d_n_mcirc_20_40_3 = n_mcirc1549__20_40_3 - n_mcirc1549__20_40_1;
d_n_mcirc_20_40_4 = n_mcirc1549__20_40_4 - n_mcirc1549__20_40_1;

*difference in number of new infections - all;
d_n_new_inf_20_25_2 = n_new_inf1549_20_25_2 - n_new_inf1549_20_25_1;
d_n_new_inf_20_25_3 = n_new_inf1549_20_25_3 - n_new_inf1549_20_25_1;
d_n_new_inf_20_25_4 = n_new_inf1549_20_25_4 - n_new_inf1549_20_25_1;
d_n_new_inf_20_40_2 = n_new_inf1549_20_40_2 - n_new_inf1549_20_40_1;
d_n_new_inf_20_40_3 = n_new_inf1549_20_40_3 - n_new_inf1549_20_40_1;
d_n_new_inf_20_40_4 = n_new_inf1549_20_40_4 - n_new_inf1549_20_40_1;

*difference in number of new infections - male only;
d_n_new_inf_m_20_25_2 = n_new_inf1549m_20_25_2 - n_new_inf1549m_20_25_1;
d_n_new_inf_m_20_25_3 = n_new_inf1549m_20_25_3 - n_new_inf1549m_20_25_1;
d_n_new_inf_m_20_25_4 = n_new_inf1549m_20_25_4 - n_new_inf1549m_20_25_1;

d_n_new_inf_m_20_40_2 = n_new_inf1549m_20_40_2 - n_new_inf1549m_20_40_1;
d_n_new_inf_m_20_40_3 = n_new_inf1549m_20_40_3 - n_new_inf1549m_20_40_1;
d_n_new_inf_m_20_40_4 = n_new_inf1549m_20_40_4 - n_new_inf1549m_20_40_1;


nnt_20_25_2 = d_n_mcirc_20_25_2 / (-d_n_new_inf_20_25_2);
nnt_20_25_3 = d_n_mcirc_20_25_3 / (-d_n_new_inf_20_25_3);
nnt_20_25_4 = d_n_mcirc_20_25_4 / (-d_n_new_inf_20_25_4);

nnt_20_40_2 = d_n_mcirc_20_40_2 / (-d_n_new_inf_20_40_2);
nnt_20_40_3 = d_n_mcirc_20_40_3 / (-d_n_new_inf_20_40_3);
nnt_20_40_4 = d_n_mcirc_20_40_4 / (-d_n_new_inf_20_40_4);



*cost per infection averted - all;
cost_inf_avert_20_25_2 = (d_dcost_20_25_2 / d_n_new_inf_20_25_2)*1000000;
cost_inf_avert_20_25_3 = (d_dcost_20_25_3 / d_n_new_inf_20_25_3)*1000000;
cost_inf_avert_20_25_4 = (d_dcost_20_25_4 / d_n_new_inf_20_25_4)*1000000;

cost_inf_avert_20_40_2 = (d_dcost_20_40_2 / d_n_new_inf_20_40_2)*1000000;
cost_inf_avert_20_40_3 = (d_dcost_20_40_3 / d_n_new_inf_20_40_3)*1000000;
cost_inf_avert_20_40_4 = (d_dcost_20_40_4 / d_n_new_inf_20_40_4)*1000000;


*cost per infection averted - males only;
cost_inf_avert_m_20_25_2 = (d_dcost_20_25_2 / d_n_new_inf_m_20_25_2)*1000000;
cost_inf_avert_m_20_25_3 = (d_dcost_20_25_3 / d_n_new_inf_m_20_25_3)*1000000;
cost_inf_avert_m_20_25_4 = (d_dcost_20_25_4 / d_n_new_inf_m_20_25_4)*1000000;
cost_inf_avert_m_20_40_2 = (d_dcost_20_40_2 / d_n_new_inf_m_20_40_2)*1000000;
cost_inf_avert_m_20_40_3 = (d_dcost_20_40_3 / d_n_new_inf_m_20_40_3)*1000000;
cost_inf_avert_m_20_40_4 = (d_dcost_20_40_4 / d_n_new_inf_m_20_40_4)*1000000;

*cost per daly averted =icer?;
cost_daly_avert_20_25_2 = (d_dcost_20_25_2 / d_ddaly_all_20_25_2)*1000000;
cost_daly_avert_20_25_3 = (d_dcost_20_25_3 / d_ddaly_all_20_25_3)*1000000;
cost_daly_avert_20_25_4 = (d_dcost_20_25_4 / d_ddaly_all_20_25_4)*1000000;
cost_daly_avert_20_40_2 = (d_dcost_20_40_2 / d_ddaly_all_20_40_2)*1000000;
cost_daly_avert_20_40_3 = (d_dcost_20_40_3 / d_ddaly_all_20_40_3)*1000000;
cost_daly_avert_20_40_4 = (d_dcost_20_40_4 / d_ddaly_all_20_40_4)*1000000;

 

proc means n p50 p5 p95;var

p_mcirc_1519m_20_25_1 p_mcirc_1519m_20_40_1
p_mcirc_1519m_20_25_2 p_mcirc_1519m_20_40_2
p_mcirc_1519m_20_25_3 p_mcirc_1519m_20_40_3
p_mcirc_1519m_20_25_4 p_mcirc_1519m_20_40_4

p_mcirc_2024m_20_25_1 p_mcirc_2024m_20_40_1
p_mcirc_2024m_20_25_2 p_mcirc_2024m_20_40_2
p_mcirc_2024m_20_25_3 p_mcirc_2024m_20_40_3
p_mcirc_2024m_20_25_4 p_mcirc_2024m_20_40_4

p_mcirc_2529m_20_25_1 p_mcirc_2529m_20_40_1
p_mcirc_2529m_20_25_2 p_mcirc_2529m_20_40_2
p_mcirc_2529m_20_25_3 p_mcirc_2529m_20_40_3
p_mcirc_2529m_20_25_4 p_mcirc_2529m_20_40_4

p_mcirc_3039m_20_25_1 p_mcirc_3039m_20_40_1
p_mcirc_3039m_20_25_2 p_mcirc_3039m_20_40_2
p_mcirc_3039m_20_25_3 p_mcirc_3039m_20_40_3
p_mcirc_3039m_20_25_4 p_mcirc_3039m_20_40_4

p_mcirc_4049m_20_25_1 p_mcirc_4049m_20_40_1
p_mcirc_4049m_20_25_2 p_mcirc_4049m_20_40_2
p_mcirc_4049m_20_25_3 p_mcirc_4049m_20_40_3
p_mcirc_4049m_20_25_4 p_mcirc_4049m_20_40_4

p_mcirc_1549m_20_25_1 p_mcirc_1549m_20_40_1
p_mcirc_1549m_20_25_2 p_mcirc_1549m_20_40_2
p_mcirc_1549m_20_25_3 p_mcirc_1549m_20_40_3
p_mcirc_1549m_20_25_4 p_mcirc_1549m_20_40_4

;run;

proc means n p50 p5 p95;var 
incidence1549_20_25_1  incidence1549_20_40_1
incidence1549_20_25_2  incidence1549_20_40_2
incidence1549_20_25_3  incidence1549_20_40_3
incidence1549_20_25_4  incidence1549_20_40_4
;run;

proc means n p50 p5 p95;var 
prevalence1549_20_25_1 prevalence1549_20_40_1
prevalence1549_20_25_2 prevalence1549_20_40_2
prevalence1549_20_25_3 prevalence1549_20_40_3
prevalence1549_20_25_4 prevalence1549_20_40_4
;run;


proc means n p50 p5 p95;var 
prevalence1549m_20_25_1 prevalence1549m_20_40_1
prevalence1549m_20_25_2 prevalence1549m_20_40_2
prevalence1549m_20_25_3 prevalence1549m_20_40_3
prevalence1549m_20_25_4 prevalence1549m_20_40_4
;run;

proc means n p50 p5 p95;var 
death_rate_hiv_m_20_25_1 death_rate_hiv_m_20_40_1
death_rate_hiv_m_20_25_2 death_rate_hiv_m_20_40_2
death_rate_hiv_m_20_25_3 death_rate_hiv_m_20_40_3
death_rate_hiv_m_20_25_4 death_rate_hiv_m_20_40_4
;run;

proc means n p50 p5 p95;var 
ddeath_rate_hiv_m_20_25_2 ddeath_rate_hiv_m_20_40_2
ddeath_rate_hiv_m_20_25_3  ddeath_rate_hiv_m_20_40_3
ddeath_rate_hiv_m_20_25_4  ddeath_rate_hiv_m_20_40_4
;run;

proc means n p50 p5 p95;var  
d_ddaly_all_20_25_2  d_ddaly_all_20_40_2
d_ddaly_all_20_25_3  d_ddaly_all_20_40_3
d_ddaly_all_20_25_4  d_ddaly_all_20_40_4
;run;

proc means n p50 p5 p95;var
dcost_20_25_1 dcost_20_40_1
dcost_20_25_2 dcost_20_40_2
dcost_20_25_3 dcost_20_40_3
dcost_20_25_4 dcost_20_40_4
;run;

proc means n p50 p5 p95;var 
d_dcost_20_25_2 d_dcost_20_40_2
d_dcost_20_25_3 d_dcost_20_40_3
d_dcost_20_25_4 d_dcost_20_40_4
;run;

proc means n p50 p5 p95;var 
d_net_dalys_20_25_2  d_net_dalys_20_40_2
d_net_dalys_20_25_3  d_net_dalys_20_40_3
d_net_dalys_20_25_4  d_net_dalys_20_40_4
;run;

proc means n p50 p5 p95;var 
nnt_20_25_2  nnt_20_40_2
nnt_20_25_3  nnt_20_40_3
nnt_20_25_4  nnt_20_40_4
;run;

proc means n p50 p5 p95;var 
cost_inf_avert_20_25_2  cost_inf_avert_20_40_2
cost_inf_avert_20_25_3  cost_inf_avert_20_40_3
cost_inf_avert_20_25_4  cost_inf_avert_20_40_4
;run;

proc means n p50 p5 p95;var 
cost_daly_avert_20_25_2  cost_daly_avert_20_40_2
cost_daly_avert_20_25_3  cost_daly_avert_20_40_3
cost_daly_avert_20_25_4  cost_daly_avert_20_40_4
;run;


***table 1;
proc means n p50 p5 p95;var
prevalence1549_20 prevalence1549m_20 prevalence1549w_20
incidence1549_20 incidence1549m_20 incidence1549w_20
prop_1564_onprep_20 
p_diag_20 p_diag_m_20 p_diag_w_20
p_onart_diag_20 p_onart_diag_m_20 p_onart_diag_w_20
p_vl1000_20 p_vl1000_m_20 p_vl1000_w_20
p_onart_vl1000_20 p_onart_vl1000_m_20 p_onart_vl1000_w_20
p_mcirc_1549m_20 p_mcirc_1519m_20 p_mcirc_2024m_20 p_mcirc_2529m_20 p_mcirc_3039m_20 p_mcirc_4049m_20
n_mcirc1549_3m_20
;	

run;

