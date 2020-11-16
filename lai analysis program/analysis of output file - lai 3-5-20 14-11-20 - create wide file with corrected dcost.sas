

libname a "C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\andrew\lai\reading datasets\";

proc printto;

 ods html close ;
* ods html ;

data a; 
 set a.lai_keep  a.lai_keep_extra  a.lai_keep_extra_2 a.lai_keep_extra_3 a.lai_keep_extra_4 a.lai_keep_extra_5 a.lai_keep_extra_6; 


lai_option = option_ ;
if option_ ge 20 then option_ = 2;



/*

proc print; var cald option_  lai_option  s_start_clarla_vlg1000 s_start_clarla_this_period ; run;

*/

proc sort; by run_ cald option_;
run;



* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a ;
 
if cald=2020.5;
s_alive = s_alive_m + s_alive_w ;
sf_2020 = 10000000 / s_alive;
keep run_ sf_2020;
proc sort; by run_;


data y; 
merge a sf;
by run_;

* preparatory code ;

* ================================================================================= ;

* this below not needed after 3-1-20 2pm (will need to put rel_dol_tox_ in keep statement above);
rel_dol_tox_ 					= s_rel_dol_tox / s_n ;

zero_3tc_activity_m184_  = s_zero_3tc_activity_m184 / s_n ;
zero_tdf_activity_k65r_ =  s_zero_tdf_activity_k65r / s_n ;

if s_pregnant_oth_dol_adv_birth_e = . then s_pregnant_oth_dol_adv_birth_e = 0;

ratio_prev_age2529w_all = ratio_prev_age2529w_overall_ ;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

r_bir_w_infected_child_ = rate_birth_with_infected_child_;

reg_option_ = s_reg_option / s_n;

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

disc     = s_dcost_ / s_cost_;

* discount rate is 3%; 
* note discounting is from 2020 - may need to adjust for discounting from 2021;
* ts1m - this code needs to change for ts1m;
discount_adj = 1;
discount_adj_10p = discount_adj * (0.90/0.97)**(cald-2020) ; 
discount_adj_0  = discount_adj * (1.00/0.97)**(cald-2020) ; 
discount = disc * discount_adj ;
discount_10p = disc * discount_adj_10p ;
discount_0 = disc * discount_adj_0 ;

* proc print; 
* var run_ cald s_dcost_  s_cost_  disc  discount_adj  discount  discount_adj_10p discount_10p ; 
* where option_=0  and cald ge 2019; 
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

  dead_ddaly_ntd = s_dead_ddaly_ntd * sf_2020 * 12 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

  ddaly = s_ddaly * sf_2020 * 12 * discount_adj ;

* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 

dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * sf_2020 * 12 * discount_adj ; * odabe ;

ddaly_mtct = s_ddaly_mtct * sf_2020 * 12  * discount_adj ;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf_2020 * 12  * discount_adj ; * napd;

ddaly_ac_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ac_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;


* ================================================================================= ;

/*
proc print; var run_ option_ ddaly_ntd_mtct_odab_napd  ddaly  dead_ddaly_ntd  ddaly_mtct  dead_ddaly_oth_dol_adv_birth_e  
ddaly_non_aids_pre_death;
where cald = 2021;
run;
*/



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 
  dzdv_cost = s_cost_zdv * discount * sf_2020 * 12 / 1000;
  dten_cost = s_cost_ten * discount * sf_2020 * 12 / 1000;
  d3tc_cost = s_cost_3tc * discount * sf_2020 * 12 / 1000; 
  dnev_cost = s_cost_nev * discount * sf_2020 * 12 / 1000;
  dlpr_cost = s_cost_lpr * discount * sf_2020 * 12 / 1000;
  ddar_cost = s_cost_dar * discount * sf_2020 * 12 / 1000;
  dtaz_cost = s_cost_taz * discount * sf_2020 * 12 / 1000;
  defa_cost = s_cost_efa * discount * sf_2020 * 12 / 1000;
  ddol_cost = s_cost_dol * discount * sf_2020 * 12 / 1000;
  dcla_cost = s_cost_cla * discount * sf_2020 * 12 / 1000;
  drla_cost = s_cost_rla * discount * sf_2020 * 12 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;

dvis_cost_x = s_dvis_cost * sf_2020 * discount_adj * 12 / 1000; 
dart1_cost = s_dart_1_cost * sf_2020 * discount_adj * 12 / 1000;
dart2_cost = s_dart_2_cost * sf_2020 * discount_adj * 12 / 1000;
dart3_cost = s_dart_3_cost * sf_2020 * discount_adj * 12 / 1000;
dart_cost = s_dart_cost * sf_2020 * discount_adj * 12 / 1000;
dvl_cost = s_dvl_cost * sf_2020 * discount_adj * 12 / 1000;
dcd4_cost = s_dcd4_cost * sf_2020 * discount_adj * 12 / 1000;
dadc_cost = s_dadc_cost * sf_2020 * discount_adj * 12 / 1000;
dtb_cost = s_dtb_cost * sf_2020 * discount_adj * 12 / 1000;
dtest_cost = s_dtest_cost * sf_2020 * discount_adj * 12 / 1000;
dwho3_cost = s_dwho3_cost * sf_2020 * discount_adj * 12 / 1000;
dcot_cost = s_dcot_cost * sf_2020 * discount_adj * 12 / 1000;
dres_cost = s_dres_cost * sf_2020 * discount_adj * 12 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf_2020 * discount_adj * 12 / 1000;  
dcost_casc_ints = s_dcost_cascade_interventions * sf_2020 * discount_adj * 12 / 1000;  
dcost_prep = s_dcost_prep * sf_2020* discount_adj * 12 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf_2020* discount_adj * 12 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf_2020* discount_adj * 12 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf_2020 * discount_adj * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf_2020 * discount_adj * 12 / 1000;

* the variable redn_in_vis_cost_vlm_supp in the model program that is the amount by which visit costs are lower if sv=1 was set to 0.010 and
was not divided by 3 when moving to 1 monthly time steps - the difference between dfullvis_cost and dvis_cost should divided by 3 and subtracted
from dfullvis_cost to get the correct dvis_cost;

dvis_cost = dfullvis_cost - ((dfullvis_cost - dvis_cost_x) / 3) ;

/*
proc print; var cald  dfullvis_cost dvis_cost  dvis_cost_x ; where cald = 2022 and lai_option = 20; run; 
*/

dcost_circ = s_dcost_circ * sf_2020* discount_adj * 12 / 1000; 
dswitchline_cost = s_dcost_switch_line * discount_adj * sf_2020 * 12 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf_2020 * discount_adj * 12 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * sf_2020 * discount_adj * 12 / 1000; * s_cost_child_hiv is discounted cost;

dclin_cost = dadc_cost+dwho3_cost+dcot_cost+dtb_cost;

* sens analysis;

* dtaz_cost = dtaz_cost * (100 / 180);
* dtaz_cost = dtaz_cost * (50 / 180);
* dzdv_cost = dzdv_cost * (25 / 45);
* dcla_cost = dcla_cost * (70  / 50);
* drla_cost = drla_cost * (70  / 50);


dart_cost_x = dart1_cost + dart2_cost + dart3_cost; 
dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost + dcla_cost + drla_cost;

dcost = dart_cost_y+dadc_cost+dcd4_cost+dvl_cost+dvis_cost+dwho3_cost+dcot_cost+dtb_cost+dres_cost+dtest_cost+d_t_adh_int_cost+dswitchline_cost
		+dcost_drug_level_test+dcost_casc_ints+dcost_circ+dcost_prep_visit+dcost_prep + dcost_child_hiv  + dcost_non_aids_pre_death ;

s_cost_art_x = s_cost_zdv + s_cost_ten + s_cost_3tc + s_cost_nev + s_cost_lpr + s_cost_dar + s_cost_taz + s_cost_efa + s_cost_dol
+ dcla_cost + drla_cost ;

dcost_clin_care = dart_cost_y+dadc_cost+dcd4_cost+dvl_cost+dvis_cost+dwho3_cost+dcot_cost+dtb_cost+dres_cost+d_t_adh_int_cost+dswitchline_cost; 
cost_clin_care = dcost_clin_care / discount;
* ================================================================================= ;


* derived variables relating to population, not only those with hiv ;

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp;

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive ;
* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive ;
* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2020;
* p_newp_sw;					p_newp_sw = s_sw_newp / s_w_newp ;
* rate_susc_np_1549_m;			rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;
* n_tested_m;					n_tested_m = s_tested_m * sf_2020;

* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3039m;				p_mcirc_3039m = s_mcirc_3039m / (s_ageg3034m + s_ageg3539m) ;
* p_mcirc_4049m;				p_mcirc_4049m = s_mcirc_4049m / (s_ageg4044m + s_ageg4549m) ;
* p_mcirc_50plm;				p_mcirc_50plm = s_mcirc_50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;

* prop_w_1549_sw;				prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;

* prep;

* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / (s_ageg1519w + s_ageg1519w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / (s_alive1564_w + s_alive1564_m) ;
* prop_sw_onprep; 				prop_sw_onprep = max(s_prep_sw, 0) / s_sw_1564 ;

* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* ts1m - below change 4 to 12;

* incidence1549;				incidence1549 = (s_primary1549 * 12 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 12 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 12 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

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


* derived variables relating to people with hiv ;

* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;

* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv1564 ;  p_diag = p_diag * 100;
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m / s_hiv1564m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w / s_hiv1564w ;  p_diag_w = p_diag_w * 100;
* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_artexp;				if s_diag > 0 then p_onart_artexp = s_onart_iicu / s_artexp;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart;						p_onart = s_onart / s_hiv1564;
* n_onart;						n_onart = s_onart * sf_2020;

* p_efa;						if s_onart > 0 then p_efa = s_efa / s_onart ;
* p_taz;						if s_onart > 0 then p_taz = s_taz / s_onart ;
* p_ten;						if s_onart > 0 then p_ten = s_ten / s_onart ;
* p_zdv;						if s_onart > 0 then p_zdv = s_zdv / s_onart ;
* p_dol; 						if s_onart > 0 then p_dol = s_dol / s_onart ;
* p_3tc;						if s_onart > 0 then p_3tc = s_3tc / s_onart ;
* p_lpr; 						if s_onart > 0 then p_lpr = s_lpr / s_onart ;
* p_nev;						if s_onart > 0 then p_nev = s_nev / s_onart ;
* p_cla;						if s_onart > 0 then p_cla = s_cla / s_onart ;
* p_rla;						if s_onart > 0 then p_rla = s_rla / s_onart ;

* p_tle;						if s_onart > 0 then p_tle = s_tle / s_onart ;
* p_tld;						if s_onart > 0 then p_tld = s_tld / s_onart ;
* p_zld;						if s_onart > 0 then p_zld = s_zld / s_onart ;
* p_zla;						if s_onart > 0 then p_zla = s_zla / s_onart ;
* p_otherreg;					if s_onart > 0 then p_otherreg = s_otherreg / s_onart ;

* p_c_tox;						if s_onart > 0 then p_c_tox = s_c_tox / s_onart ;

* p_o_zdv_tox;					p_o_zdv_tox = s_o_zdv_tox / s_zdv ;
* p_o_3tc_tox;					p_o_3tc_tox = s_o_3tc_tox / s_3tc ;
* p_o_ten_tox;					p_o_ten_tox = s_o_ten_tox / s_ten ;
* p_o_taz_tox;					p_o_taz_tox = s_o_taz_tox / s_taz ;
* p_o_lpr_tox;					p_o_lpr_tox = s_o_lpr_tox / s_lpr ;
* p_o_efa_tox;					p_o_efa_tox = s_o_efa_tox / s_efa ;
* p_o_nev_tox;					p_o_nev_tox = s_o_nev_tox / s_nev ;
* p_o_dol_tox;					p_o_dol_tox = s_o_dol_tox / s_dol ;
* p_o_cla_tox;					p_o_cla_tox = s_o_cla_tox / s_cla ;
* p_o_rla_tox;					p_o_rla_tox = s_o_rla_tox / s_rla ;

* p_o_tle_tox;					p_o_tle_tox = s_o_tle_tox / s_tle ;
* p_o_tld_tox;					p_o_tld_tox = s_o_tld_tox / s_tld ;
* p_o_zld_tox;					p_o_zld_tox = s_o_zld_tox / s_zld ;
* p_o_zla_tox;					p_o_zla_tox = s_o_zla_tox / s_zla ;

* p_o_zdv_adh_hi;				p_o_zdv_adh_hi = s_o_zdv_adh_hi / s_zdv ;
* p_o_3tc_adh_hi;				p_o_3tc_adh_hi = s_o_3tc_adh_hi / s_3tc ;
* p_o_ten_adh_hi;				p_o_ten_adh_hi = s_o_ten_adh_hi / s_ten ;
* p_o_taz_adh_hi;				p_o_taz_adh_hi = s_o_taz_adh_hi / s_taz ;
* p_o_lpr_adh_hi;				p_o_lpr_adh_hi = s_o_lpr_adh_hi / s_lpr ;
* p_o_efa_adh_hi;				p_o_efa_adh_hi = s_o_efa_adh_hi / s_efa ;
* p_o_nev_adh_hi;				p_o_nev_adh_hi = s_o_nev_adh_hi / s_nev ;
* p_o_dol_adh_hi;				p_o_dol_adh_hi = s_o_dol_adh_hi / s_dol ;

* p_o_tle_adh_hi;				p_o_tle_adh_hi = s_o_tle_adh_hi / s_tle ;
* p_o_tld_adh_hi;				p_o_tld_adh_hi = s_o_tld_adh_hi / s_tld ;
* p_o_zld_adh_hi;				p_o_zld_adh_hi = s_o_zld_adh_hi / s_zld ;
* p_o_zla_adh_hi;				p_o_zla_adh_hi = s_o_zla_adh_hi / s_zla ;

* p_adh_hi;						p_adh_hi = s_adh_hi / s_onart;

* p_artexp_adhl50;				p_artexp_adhl50 = 1 - ((s_adh_med + s_adh_hi) / s_artexp);

* p_nactive_ge2p75_xyz;			p_nactive_ge2p75_xyz = s_nac_ge2p75_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge2p00_xyz;			p_nactive_ge2p00_xyz = s_nac_ge2p00_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_nactive_ge1p50_xyz;			p_nactive_ge1p50_xyz = s_nac_ge1p50_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;

* p_iime_;						if s_hiv1564 > 0 then p_iime_ = s_iime_ / s_hiv1564 ;
* p_pime_;						if s_hiv1564 > 0 then p_pime_ = s_pime_ / s_hiv1564 ;
* p_nnme_;						if s_hiv1564 > 0 then p_nnme_ = s_nnme_ / s_hiv1564 ;

* p_adh_hi_xyz_ot1;				p_adh_hi_xyz_ot1 = s_adh_hi_a_zld_if_reg_op_116 / s_a_zld_if_reg_op_116;
* p_adh_hi_xyz_ot2;				p_adh_hi_xyz_ot2 = s_adh_hi_a_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116;
* p_adh_hi_xyz_itt;				p_adh_hi_xyz_itt = s_adh_hi_a_zld_if_reg_op_116 / s_x_n_zld_if_reg_op_116;

* p_e_rt65m_xyz; 				p_e_rt65m_xyz = s_e_rt65m_st_zld_if_reg_op_116 / s_onart_start_zld_if_reg_op_116 ;

* p_startedline2;				if s_artexp > 0 then do; p_startedline2 = s_startedline2 / s_artexp; end;
* Of people on ART, percent with CD4 < 500;	
								if  s_onart_iicu > 0 then  p_onart_cd4_l500 = 1 - (s_onart_cd4_g500 / s_onart_iicu) ;

* p_drug_level_test;			if s_onart > 0 then p_drug_level_test = s_drug_level_test / s_onart ;

* p_linefail_ge1;				if s_artexp > 0 then p_linefail_ge1 = s_linefail_ge1 / s_artexp;
* p_startedline2;				if s_artexp > 0 then p_startedline2 = s_startedline2 / s_artexp; 
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_vl1000, p_vg1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* p_onart_gt6m_iicu_m;			if s_hiv1564m > 0 then p_onart_gt6m_iicu_m = s_onart_gt6m_iicu_m / s_hiv1564m  ;
* p_onart_gt6m_iicu_w;			if s_hiv1564w  > 0 then p_onart_gt6m_iicu_w = s_onart_gt6m_iicu_w / s_hiv1564w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 

* p_vl1000_art_gt6m_sw;  		if s_onart_gt6m_sw > 0 then p_vl1000_art_gt6m_sw =  s_vl1000_art_gt6m_sw /  s_onart_gt6m_sw ;

* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);
* prev_vg1000_newp_m;			prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hiv1564 > 0 then r_efa_hiv = s_r_efa / s_hiv1564 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;

* aids_death_rate;				aids_death_rate = (12 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				death_rate_onart = (12 * 100 * s_dead_onart) / s_onart ;
* death_rate;					if s_hiv1564 > 0 then death_rate= (12 * 100 * s_deaths) / s_hiv1564;
* death_rate_hiv; 				if s_hiv1564 > 0 then death_rate_hiv = (12 * 100 * s_death_hiv) / s_hiv1564;
* death_rate_all;				death_rate_all = (12 * 100 * s_dead1564_all) / s_alive ;

* p_start_clarla_vlg1000;		if s_start_clarla_this_period > 0 then p_start_clarla_vlg1000 = s_start_clarla_vlg1000 / s_start_clarla_this_period ;
* p_start_clarla_rtnnm;			if s_start_clarla_this_period > 0 then p_start_clarla_rtnnm = s_start_clarla_rtnnm / s_start_clarla_this_period ;
* p_start_clarla_rt181m;		if s_start_clarla_this_period > 0 then p_start_clarla_rt181m = s_start_clarla_rt181m / s_start_clarla_this_period ;
* p_start_clarla_rtnnm_o103;	if s_start_clarla_this_period > 0 then p_start_clarla_rtnnm_o103 = s_start_clarla_rtnnm_o103 / s_start_clarla_this_period ;
* p_start_clarla_iim;			if s_start_clarla_this_period > 0 then p_start_clarla_iim = s_start_clarla_iim / s_start_clarla_this_period ;
* p_start_clarla_iipm;			if s_start_clarla_this_period > 0 then p_start_clarla_iipm = s_start_clarla_iipm / s_start_clarla_this_period ;
* p_start_clarla_linefail1;		if s_start_clarla_this_period > 0 then p_start_clarla_linefail1 = s_start_clarla_linefail1 / s_start_clarla_this_period ;
* p_start_clarla_agelt25;		if s_start_clarla_this_period > 0 then p_start_clarla_agelt25 = s_start_clarla_agelt25 / s_start_clarla_this_period ;
* p_start_clarla_m;				if s_start_clarla_this_period > 0 then p_start_clarla_m = s_start_clarla_m / s_start_clarla_this_period ;
* p_start_clarla_w;				if s_start_clarla_this_period > 0 then p_start_clarla_w = s_start_clarla_w / s_start_clarla_this_period ;
* p_start_clarla_adhlt80 ;		if s_start_clarla_this_period > 0 then p_start_clarla_adhlt80 = s_start_clarla_adhlt80 / s_start_clarla_this_period ;

s_st_clarla_vlg1000   = s_start_clarla_vlg1000 ; 
s_st_clarla_rtnnm  = s_start_clarla_rtnnm ; 
s_st_clarla_rt181m  = s_start_clarla_rt181m  ; 
s_st_clarla_rtnnm_o103 = s_start_clarla_rtnnm_o103 ; 
s_st_clarla_iim  = s_start_clarla_iim ; 
s_st_clarla_iipm  = s_start_clarla_iipm ; 
s_st_clarla_linefail1 = s_start_clarla_linefail1 ; 
s_st_clarla_agelt25  = s_start_clarla_agelt25 ; 
s_st_clarla_m  = s_start_clarla_m  ; 
s_st_clarla_w = s_start_clarla_w  ; 
s_st_clarla_adhlt80  = s_start_clarla_adhlt80 ; 
s_st_clarla_this_period = s_start_clarla_this_period ;  

s_ae_clarla_e_20_adg80 = s_artexp_clarla_e_20_adh_dl_ge80 ;
s_ae_clarla_e_22_adg80 = s_artexp_clarla_e_22_adh_dl_ge80 ;
s_ae_clarla_e_24_adg80 = s_artexp_clarla_e_24_adh_dl_ge80 ;

* p_ae_clarla_e20_hi_adhdl;	
			if s_artexp_clarla_elig_20 > 0 then p_ae_clarla_e20_hi_adhdl = s_ae_clarla_e_20_adg80 / s_artexp_clarla_elig_20 ;
* p_ae_clarla_e22_hi_adhdl;	
			if s_artexp_clarla_elig_22 > 0 then p_ae_clarla_e22_hi_adhdl = s_ae_clarla_e_22_adg80 / s_artexp_clarla_elig_22 ;
* p_ae_clarla_e24_hi_adhdl;	
			if s_artexp_clarla_elig_24 > 0 then p_ae_clarla_e24_hi_adhdl = s_ae_clarla_e_24_adg80 / s_artexp_clarla_elig_24 ;

* p_onart_iicu_vlg1000;			if s_onart_iicu > 0 then p_onart_iicu_vlg1000 = s_onart_iicu_vlg1000 / s_onart_iicu ;
* p_onart_iicu_rtnnm;			if s_onart_iicu > 0 then p_onart_iicu_rtnnm = s_onart_iicu_rtnnm / s_onart_iicu ;
* p_onart_iicu_rtnnm_o103;		if s_onart_iicu > 0 then p_onart_iicu_rtnnm_o103 = s_onart_iicu_rtnnm_o103 / s_onart_iicu ;
* p_onart_iicu_iim;				if s_onart_iicu > 0 then p_onart_iicu_iim = s_onart_iicu_iim / s_onart_iicu ;
* p_onart_iicu_linefail1;		if s_onart_iicu > 0 then p_onart_iicu_linefail1 = s_onart_iicu_linefail1 / s_onart_iicu ;
* p_onart_iicu_agelt25;			if s_onart_iicu > 0 then p_onart_iicu_agelt25 = s_onart_iicu_agelt25 / s_onart_iicu ;
* p_onart_iicu_m;				if s_onart_iicu > 0 then p_onart_iicu_m = s_onart_iicu_m / s_onart_iicu ;
* p_onart_iicu_w;				if s_onart_iicu > 0 then p_onart_iicu_w = s_onart_iicu_w / s_onart_iicu ;

* number of women with hiv giving birth per year;
n_give_birth_w_hiv = s_give_birth_with_hiv * sf_2020 * 12;
n_birth_with_inf_child = s_birth_with_inf_child * sf_2020 * 12;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * sf_2020 * 12 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf_2020 * 12;  * annual number;

/*

keep cald  run_  option_  lai_option  dataset
sf_2020 s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5 gender_r_newp rate_susc_np_1549_w  rate_susc_np_ic_1549_m  rate_susc_np_1549_w
p_newp_sw mean_num_tests_ly_m1549_  mean_num_tests_ly_w1549_  n_tested_m
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3039m p_mcirc_4049m p_mcirc_50plm
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 			
incidence1549 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary mtct_prop
p_diag p_diag_m p_diag_w p_ai_no_arv_c_nnm p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_rla p_cla n_onart p_onart_artexp p_artexp_adhl50
p_onart_vl1000 p_vl1000 p_vg1000 p_onart_gt6m_iicu_m p_onart_gt6m_iicu_w p_onart_vl1000_w p_onart_vl1000_m	
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w   p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1  
s_mcirc_1519m  s_ageg1519m  p_startedline2  aids_death_rate  death_rate_onart death_rate_all ddaly  ddaly_all  dcost  dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dcost_drug_level_test   dclin_cost dcost_casc_ints     dcost_circ dcost_prep_visit  dcost_prep  
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost  dcla_cost  drla_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r  r_efa_hiv
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2
prop_art_or_prep  n_sw_1564  prop_sw_onprep  p_onart  p_c_tox
 p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox  p_o_cla_tox  p_o_rla_tox
p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi  p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi   p_adh_hi
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  death_rate  death_rate_hiv  p_iime_  p_pime_  p_nnme_  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd 
n_birth_with_inf_child  dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe   n_tested  ratio_prev_age2529w_all  prev_ratio_1524  p_vl1000_art_gt6m_sw

sex_beh_trans_matrix_m_  sex_beh_trans_matrix_w_  sex_age_mixing_matrix_m_ sex_age_mixing_matrix_w_  p_rred_p_  p_hsb_p_  newp_factor_  
eprate_  conc_ep_  ch_risk_diag_  ch_risk_diag_newp_  ych_risk_beh_newp_  ych2_risk_beh_newp_  ych_risk_beh_ep_
exp_setting_lower_p_vl1000_  external_exp_factor_  rate_exp_set_lower_p_vl1000_  prob_pregnancy_base_
fold_change_w_  fold_change_yw_  fold_change_sti_  super_infection_  an_lin_incr_test_  date_test_rate_plateau_  
rate_testanc_inc_  incr_test_rate_sympt_  max_freq_testing_  test_targeting_  fxx_ gxx_  adh_pattern_  prob_loss_at_diag_  
pr_art_init_  rate_lost_  prob_lost_art_  rate_return_  rate_restart_  rate_int_choice_  clinic_not_aw_int_frac_
res_trans_factor_nn_  rate_loss_persistence_  incr_rate_int_low_adh_  poorer_cd4rise_fail_nn_  
poorer_cd4rise_fail_ii_  rate_res_ten_  fold_change_mut_risk_  adh_effect_of_meas_alert_  pr_switch_line_  
prob_vl_meas_done_  red_adh_tb_adc_  red_adh_tox_pop_  add_eff_adh_nnrti_  altered_adh_sec_line_pop_  prob_return_adc_  
prob_lossdiag_adctb_  prob_lossdiag_who3e_  higher_newp_less_engagement_  fold_tr_  switch_for_tox_
adh_pattern_prep_  rate_test_startprep_  rate_test_restartprep_  rate_choose_stop_prep_  circ_inc_rate_
p_hard_reach_w_  hard_reach_higher_in_men_  p_hard_reach_m_  inc_cat_   base_rate_sw_   base_rate_stop_sexwork_    rred_a_p_
rr_int_tox_   r_bir_w_infected_child_  nnrti_res_no_effect_  double_rate_gas_tox_taz_   incr_mort_risk_dol_weightg_  reg_option_
initial_pr_switch_line_  zero_3tc_activity_m184_  zero_tdf_activity_k65r_  red_adh_multi_pill_pop_   greater_disability_tox_	  greater_tox_zdv_
rel_dol_tox_  dol_efa_cla_rla_potency_  cla_time_to_lower_threshold_g_  
eff_max_freq_testing_ 		eff_rate_restart_ 		eff_prob_loss_at_diag_ 		eff_rate_lost_ 		eff_prob_lost_art_ 		eff_rate_return_ 			
eff_pr_art_init_ 	eff_rate_int_choice_ 	eff_prob_vl_meas_done_ 		eff_pr_switch_line_ 	eff_rate_test_startprep_ 	eff_rate_test_restartprep_ 	
eff_rate_choose_stop_prep_ 		eff_prob_prep_restart_choice_ 	eff_prepuptake_sw_  eff_prepuptake_pop_  e_decr_hard_reach_2020_  eff_test_targeting_
prep_strategy_  pop_wide_tld_2020_   rel_rate_res_cla_dol_  rel_onart_la_drugs_  higher_newp_with_lower_adhav_  sw_lower_art_adh_
p_start_clarla_vlg1000 p_start_clarla_rtnnm p_start_clarla_rtnnm_o103 p_start_clarla_iim p_start_clarla_linefail1  p_start_clarla_iipm
p_start_clarla_agelt25 p_start_clarla_m p_start_clarla_w p_onart_iicu_vlg1000 p_onart_iicu_rtnnm p_onart_iicu_rtnnm_o103 p_onart_iicu_iim	
p_onart_iicu_linefail1 p_onart_iicu_agelt25 p_onart_iicu_m p_onart_iicu_w  p_start_clarla_rt181m  p_start_clarla_adhlt80
s_st_clarla_vlg1000    s_st_clarla_rtnnm  s_st_clarla_rt181m  s_st_clarla_rtnnm_o103 
s_st_clarla_iim  s_st_clarla_iipm  s_st_clarla_linefail1  s_st_clarla_agelt25  s_st_clarla_m  s_st_clarla_w 
s_st_clarla_adhlt80  s_st_clarla_this_period  p_ae_clarla_e20_hi_adhdl p_ae_clarla_e22_hi_adhdl p_ae_clarla_e24_hi_adhdl
s_ae_clarla_e_20_adg80   s_artexp_clarla_elig_20  
s_ae_clarla_e_22_adg80   s_artexp_clarla_elig_22  
s_ae_clarla_e_24_adg80   s_artexp_clarla_elig_24  
;

run;

*/

* this line below for when creating wide file with corrected dcost after accounting for dvis_cost as described above;
keep cald  run_  option_  lai_option  dataset sf_2020 dcost ; run;



proc sort data=y;by run_ option_;run;



  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
%macro var(v=);

* &v ;

/*

proc means  noprint data=y; var &v; output out=y_95 mean= &v._95; by run_ ; where 1994.5 <= cald < 1995.5;
proc means  noprint data=y; var &v; output out=y_00 mean= &v._00; by run_ ; where 1999.5 <= cald < 2000.5;

proc means  noprint data=y; var &v; output out=y_05_20 mean= &v._05_20; by run_ ; where 2005 <= cald <= 2020;
proc means  noprint data=y; var &v; output out=y_08 mean= &v._08; by run_ ; where 2007.75 <= cald <= 2008.25;
proc means  noprint data=y; var &v; output out=y_12 mean= &v._12; by run_ ; where 2011.75 <= cald <= 2012.25;
proc means  noprint data=y; var &v; output out=y_16 mean= &v._16; by run_ ; where 2015.75 <= cald <= 2016.25;


proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run_ option_ ; where 2021   <= cald < 2022   ;
proc means noprint data=y; var &v; output out=y_22 mean= &v._22; by run_ option_ ; where cald = 2022   ;
proc means noprint data=y; var &v; output out=y_21_26 mean= &v._21_26; by run_ option_ ; where 2021   <= cald < 2022   ;
proc means noprint data=y; var &v; output out=y_21_41 mean= &v._21_41; by run_ option_ ; where 2021   <= cald < 2041   ;
proc means noprint data=y; var &v; output out=y_21_71 mean= &v._21_71; by run_ option_ ; where 2021   <= cald < 2071   ;

*/

proc means  noprint data=y; var &v; output out=y_19 mean= &v._19; by run_ ; where 2018.75 <= cald <= 2019.25;
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run_ ; where 2019.75 <= cald <= 2020.25; 
proc means noprint data=y; var &v; output out=y_21_31 mean= &v._21_31; by run_ option_ ; where 2021   <= cald < 2031   ;
proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run_ option_ ; where 2021   <= cald < 2022   ;

/*

proc sort data=y_22; by run_; proc transpose data=y_22 out=t_22 prefix=&v._22_; var &v._22; by run_; 
proc sort data=y_21_26; by run_; proc transpose data=y_21_26 out=t_21_26 prefix=&v._21_26_; var &v._21_26; by run_;  
proc sort data=y_21_41; by run_; proc transpose data=y_21_41 out=t_21_41 prefix=&v._21_41_; var &v._21_41; by run_;  
proc sort data=y_21_71; by run_; proc transpose data=y_21_71 out=t_21_71 prefix=&v._21_71_; var &v._21_71; by run_;  

*/

proc sort data=y_21_22; by run_; proc transpose data=y_21_22 out=t_21_22 prefix=&v._21_22_; var &v._21_22; by run_;
proc sort data=y_21_31; by run_; proc transpose data=y_21_31 out=t_21_31 prefix=&v._21_31_; var &v._21_31; by run_; 

/*
data &v ; merge  y_05_20  y_08  y_12  y_16  y_19 y_20 t_22 t_21_22  t_21_26 t_21_31 t_21_41  t_21_71 ;  
*/
data &v ; merge  y_19 y_20 t_21_31 t_21_22 ; 

drop _NAME_ _TYPE_ _FREQ_;

%mend var;

 %var(v=dcost);
/*
%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=rate_susc_np_1549_w);  %var(v=rate_susc_np_ic_1549_m);  %var(v=rate_susc_np_1549_w);
%var(v=p_newp_sw);
%var(v=mean_num_tests_ly_m1549_)  ;  %var(v=mean_num_tests_ly_w1549_); %var(v=n_tested_m);
%var(v=p_mcirc); %var(v=p_mcirc_1519m); %var(v=p_mcirc_2024m);
%var(v=p_mcirc_2529m); %var(v=p_mcirc_3039m); %var(v=p_mcirc_4049m); %var(v=p_mcirc_50plm); %var(v=prop_w_1549_sw);
%var(v=prop_w_ever_sw); %var(v=prop_sw_hiv); %var(v=prop_w_1524_onprep); %var(v=prop_1564_onprep); %var(v=prevalence1549m); %var(v=prevalence1549w);
%var(v=prevalence1549); 
%var(v=prevalence1519w);  	%var(v=prevalence1519m);  	  %var(v=prevalence2024w);  	  %var(v=prevalence2024m);  	  %var(v=prevalence2529w);  	  
%var(v=prevalence2529m);    %var(v=prevalence3034w);    %var(v=prevalence3034m);  	%var(v=prevalence3539w);  	  %var(v=prevalence3539m);  	  
%var(v=prevalence4044w);  	 %var(v=prevalence4044m);  	  %var(v=prevalence4549w);  	  %var(v=prevalence4549m);  
%var(v=prevalence_vg1000); %var(v=incidence1549);   
%var(v=incidence1549w);  %var(v=incidence1549m); 
%var(v=p_inf_vlsupp);  %var(v=p_inf_newp);  %var(v=p_inf_ep);  %var(v=p_inf_diag);  %var(v=p_inf_naive);   %var(v=p_inf_primary); 
%var(v=mtct_prop); %var(v=p_diag); %var(v=p_diag_m); %var(v=p_diag_w);
%var(v=p_ai_no_arv_c_nnm); 
%var(v=p_artexp_diag); %var(v=p_onart_diag); %var(v=p_onart_artexp);  %var(v=p_artexp_adhl50);
%var(v=p_onart_diag_w); %var(v=p_onart_diag_m); %var(v=p_efa); %var(v=p_taz);
%var(v=p_ten); %var(v=p_zdv); %var(v=p_dol); %var(v=p_3tc); %var(v=p_lpr); %var(v=p_nev); %var(v=p_cla); %var(v=p_rla); %var(v=p_onart_vl1000); 
%var(v=p_vl1000); %var(v=p_vg1000);  %var(v=p_onart_gt6m_iicu_m); %var(v=p_onart_gt6m_iicu_w); %var(v=p_vl1000_art_gt6m_sw);
%var(v=p_onart_vl1000_w); %var(v=p_onart_vl1000_m);
%var(v=prev_vg1000_newp_m);  %var(v=prev_vg1000_newp_w);   %var(v=reg_option_) ;  %var(v= p_startedline2) ;
%var(v=p_tle);  %var(v=p_tld);  %var(v=p_zld);  %var(v=p_zla);  %var(v=p_otherreg);  %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
%var(v=aids_death_rate);  %var(v=death_rate_onart);      %var(v=death_rate_all); %var(v=ddaly);  %var(v=ddaly_all);   %var(v= dart_cost_y);
%var(v=dadc_cost);   %var(v=dcd4_cost);   %var(v=dvl_cost);   %var(v=dvis_cost);   %var(v=dwho3_cost);   %var(v=dcot_cost);   %var(v=dtb_cost);   
%var(v=dres_cost);  %var(v=dtest_cost);   %var(v=d_t_adh_int_cost);   %var(v=dswitchline_cost);  %var(v=dtaz_cost);   %var(v=dcost_drug_level_test);
%var(v=dclin_cost );  
%var(v=dcost_casc_ints );      %var(v=dcost_circ );    %var(v=dcost_prep_visit );   %var(v=dcost_prep );   %var(v=dcost_drug_level_test ); 
%var(v=dcost_clin_care );  %var(v=dcost_non_aids_pre_death );  %var(v=dcost_child_hiv );  %var(v=dzdv_cost );   %var(v=dten_cost );   %var(v=d3tc_cost );   
%var(v=dnev_cost );   %var(v=dlpr_cost );   %var(v=ddar_cost );   %var(v=dtaz_cost );    %var(v=defa_cost );   %var(v=ddol_cost );
%var(v=dcla_cost );  %var(v=drla_cost );
%var(v=m15r);  %var(v=m25r);  %var(v=m35r);  %var(v=m45r);  %var(v=m55r);  %var(v=w15r);  %var(v=w25r);  %var(v=w35r);  %var(v=w45r);  %var(v=w55r)
%var(v=r_efa_hiv);  %var(v=n_onart);
%var(v=p_dol_2vg1000_dolr1_adh0); %var(v=p_dol_2vg1000_dolr1_adh1); %var(v=p_dol_2vg1000_dolr0_adh0); %var(v=p_dol_2vg1000_dolr0_adh1);
%var(v=p_onart_cd4_l500);   %var(v=p_startedline2);  %var(v=prop_art_or_prep);  %var(v=n_sw_1564);   %var(v=prop_sw_onprep);   %var(v=p_onart);
%var(v=p_o_zdv_tox);   %var(v=p_o_3tc_tox);   %var(v=p_o_ten_tox);   %var(v=p_o_taz_tox);   %var(v=p_o_lpr_tox);   %var(v=p_o_efa_tox);   
%var(v=p_o_nev_tox);  %var(v=p_o_dol_tox);  %var(v=p_o_rla_tox);  %var(v=p_o_cla_tox);  %var(v= p_c_tox);   %var(v=p_o_zdv_adh_hi);   
%var(v=p_o_3tc_adh_hi);   %var(v=p_o_ten_adh_hi);  
%var(v=p_o_taz_adh_hi);   %var(v=p_o_lpr_adh_hi);   %var(v=p_o_efa_adh_hi);   %var(v=p_o_nev_adh_hi);   %var(v=p_o_dol_adh_hi);  
%var(v= p_o_tle_tox);   %var(v=p_o_tld_tox);   %var(v=p_o_zla_tox);   %var(v=p_o_zld_tox);    %var(v=p_o_tle_adh_hi);   %var(v=p_o_tld_adh_hi);   
%var(v=p_o_zla_adh_hi);   %var(v=p_o_zld_adh_hi);   %var(v=p_adh_hi);    %var(v=s_a_zld_if_reg_op_116);
%var(v=p_nactive_ge2p75_xyz);  %var(v=p_adh_hi_xyz_ot1);   %var(v=p_adh_hi_xyz_ot2);   %var(v=p_adh_hi_xyz_itt);   %var(v=p_e_rt65m_xyz);   
%var(v=p_nactive_ge2p00_xyz);   %var(v=p_nactive_ge1p50_xyz);  %var(v=death_rate);   %var(v=death_rate_hiv);
%var(v=p_iime_);   %var(v=p_pime_);   %var(v=p_nnme_);     %var(v=n_pregnant_ntd);   %var(v=n_preg_odabe);
%var(v=ddaly_non_aids_pre_death);    %var(v=ddaly_ac_ntd_mtct);    %var(v=ddaly_ac_ntd_mtct_odabe);     %var(v=ddaly_ntd_mtct_napd);   
%var(v=ddaly_ntd_mtct_odab_napd); %var(v=n_birth_with_inf_child);
%var(v=dead_ddaly_ntd);   %var(v=ddaly_mtct);  %var(v=dead_ddaly_odabe);  %var(v=n_tested);  %var(v=ratio_prev_age2529w_all);
%var(v=prev_ratio_1524)
%var(v=p_start_clarla_vlg1000); %var(v=p_start_clarla_rtnnm); %var(v=p_start_clarla_rtnnm_o103); %var(v=p_start_clarla_iim);
%var(v=p_start_clarla_iipm); 
%var(v=p_start_clarla_linefail1); %var(v=p_start_clarla_agelt25); %var(v=p_start_clarla_m); %var(v=p_start_clarla_w); 
%var(v=p_onart_iicu_vlg1000); %var(v=p_onart_iicu_rtnnm); %var(v=p_onart_iicu_rtnnm_o103); %var(v=p_onart_iicu_iim);	
%var(v=p_onart_iicu_linefail1); %var(v=p_onart_iicu_agelt25); %var(v=p_onart_iicu_m); %var(v=p_onart_iicu_w); %var(v=p_start_clarla_rt181m);
%var(v=s_st_clarla_vlg1000);    %var(v=s_st_clarla_rtnnm);  %var(v=s_st_clarla_rt181m);  %var(v=s_st_clarla_rtnnm_o103); 
%var(v=s_st_clarla_iim);  %var(v=s_st_clarla_iipm);  %var(v=s_st_clarla_linefail1);  %var(v=s_st_clarla_agelt25);  %var(v=s_st_clarla_m);  
%var(v=s_st_clarla_w); %var(v=s_st_clarla_adhlt80);  %var(v=s_st_clarla_this_period);%var(v=p_start_clarla_adhlt80);
%var(v=p_ae_clarla_e20_hi_adhdl);  %var(v=p_ae_clarla_e22_hi_adhdl);  %var(v=p_ae_clarla_e24_hi_adhdl);
%var(v=s_ae_clarla_e_20_adg80);   %var(v=s_artexp_clarla_elig_20);  %var(v=s_ae_clarla_e_22_adg80);   %var(v=s_artexp_clarla_elig_22);  
%var(v=s_ae_clarla_e_24_adg80);   %var(v=s_artexp_clarla_elig_24); 
*/



data wide_outputs; merge  dcost
/*
s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5 gender_r_newp  rate_susc_np_1549_w  rate_susc_np_ic_1549_m  rate_susc_np_1549_w
p_newp_sw mean_num_tests_ly_m1549_  mean_num_tests_ly_w1549_  n_tested_m
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3039m p_mcirc_4049m p_mcirc_50plm
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 			
incidence1549 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary mtct_prop
p_diag p_diag_m p_diag_w p_ai_no_arv_c_nnm p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000  p_onart_gt6m_iicu_m p_onart_gt6m_iicu_w p_onart_vl1000_w p_onart_vl1000_m	 p_vl1000_art_gt6m_sw
p_onart_artexp  prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w reg_option_ p_startedline2
p_rla p_cla p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart death_rate_all ddaly  ddaly_all  
dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost dcost_casc_ints     dcost_circ dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost  dcla_cost  drla_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv n_onart
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564  prop_sw_onprep  p_onart 
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_cla_tox p_o_rla_tox 
p_c_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz death_rate  death_rate_hiv  p_iime_   p_pime_   p_nnme_  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd ddaly  ddaly_all 
n_birth_with_inf_child  dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe n_tested ratio_prev_age2529w_all  prev_ratio_1524
p_start_clarla_vlg1000 p_start_clarla_rtnnm p_start_clarla_rtnnm_o103 p_start_clarla_iim p_start_clarla_linefail1  p_start_clarla_iipm
p_start_clarla_agelt25 p_start_clarla_m p_start_clarla_w p_onart_iicu_vlg1000 p_onart_iicu_rtnnm p_onart_iicu_rtnnm_o103 p_onart_iicu_iim	
p_onart_iicu_linefail1 p_onart_iicu_agelt25 p_onart_iicu_m p_onart_iicu_w p_start_clarla_rt181m p_start_clarla_adhlt80
s_st_clarla_vlg1000    s_st_clarla_rtnnm  s_st_clarla_rt181m  s_st_clarla_rtnnm_o103 
s_st_clarla_iim  s_st_clarla_iipm  s_st_clarla_linefail1  s_st_clarla_agelt25  s_st_clarla_m  s_st_clarla_w 
s_st_clarla_adhlt80  s_st_clarla_this_period p_artexp_adhl50 s_ae_clarla_e_20_adg80   s_artexp_clarla_elig_20  
s_ae_clarla_e_22_adg80   s_artexp_clarla_elig_22  s_ae_clarla_e_24_adg80   s_artexp_clarla_elig_24  
p_ae_clarla_e20_hi_adhdl p_ae_clarla_e22_hi_adhdl p_ae_clarla_e24_hi_adhdl
*/
;

proc sort; by run_; run;


* To get one row per run;
  data a.wide_lai_corrected_dcost;

  merge  sf  wide_outputs  ;
  by run_;
  run;

proc contents; run; 
proc print; run;
