* options user="/folders/myfolders/";

libname a "C:\Users\loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\CdI";


data a;
set a.cdi_18oct24a;

proc sort;by run cald option;run;
proc freq;table cald option;run;

proc means;var s_tested_msm;where cald ge 2024 and option=6;run;

* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a;

if cald=2022; 
*s_alive = s_alive_m + s_alive_w ;

* https://worldpopulationreview.com/countries/ivory-coast-population
* 58% of CdI population in 2022 >= age 15 (https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=CI&view=chart);

*sf_2024 = (29600000 * 0.58) / s_alive;  


**Population accoding to World Population Prospectus;
*https://population.un.org/dataportal/data/indicators/70/locations/384/start/1990/end/2023/line/linetimeplot?df=fedb2c36-7339-4cea-982e-6339bd045666;
*Total population - 0-14 population;
sf_2022 = (13977488.5)/s_alive1549;
sf = sf_2022;
keep run sf sf_2022;

proc sort; by run;


data y; 
merge a sf;
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

%let year_start_disc=2021;
discount_3py = 1/(1.03**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;


* ================================================================================= ;





* dalys and life years;

* ================================================================================= ;


s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * sf * 4;


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
where cald = 2021;
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


***Define variables used in graphs to compare Malawi outputs to observed data;
s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_new_vmmc1549m = s_new_vmmc1519m + s_new_vmmc2024m + s_new_vmmc2529m + s_new_vmmc3034m + s_new_vmmc3539m + s_new_vmmc4044m + s_new_vmmc4549m;

s_hiv1524w = s_hiv1519w + s_hiv2024w ;
s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15_ = s_hivge15m + s_hivge15w ;
s_alive = s_alive_m + s_alive_w ;
s_tested_past_year_ov25m = s_tested_4p_m2529_ + s_tested_4p_m3039_ + s_tested_4p_m4049_ + s_tested_4p_m5064_;
s_tested_past_year_ov25w = s_tested_4p_w2529_ + s_tested_4p_w3039_ + s_tested_4p_w4049_ + s_tested_4p_w5064_; 
s_alive_ov25m = s_ageg1564m - s_ageg1519m - s_ageg2024m;
s_alive_ov25w = s_ageg1564w - s_ageg1519w - s_ageg2024w;	
s_diag_ov25m = s_diag_m1549_ + s_diag_m5054_ + s_diag_m5559_ + s_diag_m6064_;
s_diag_ov25w = s_diag_w1549_ + s_diag_w5054_ + s_diag_w5559_ + s_diag_w6064_; 

* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_anc;						if (s_pregnant+s_birth) gt 0 then p_anc = s_anc /(s_pregnant+s_birth);*pregnant=1 at dt_start_pregn, dt_start_pregn+0.25, dt_start_pregn+0.5
* prevalence_hiv_preg;			if s_pregnant gt 0 then prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;


* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;

* p_newp_ge1;					p_newp_ge1_ = s_newp_ge1 / s_alive1564 ;
* p_newp_ge1m;					p_newp_ge1m_ = s_m1549_newp_ge1 / s_alive1549_m ;*check;
* p_newp_ge1w;					p_newp_ge1w_ = s_w1549_newp_ge1 / s_alive1549_w ;
* p_newp_ge5;					p_newp_ge5_ = s_newp_ge5 / s_alive1564 ;
* gender_r_newp;				if s_w_newp gt 0 then gender_r_newp = s_m_newp / s_w_newp; *log_gender_r_newp  = log(gender_r_newp);
* av_newp_ge1_non_sw;			if (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5)) gt 0 then
								av_newp_ge1_non_sw = (s_newp - s_newp_sw) / (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5));

* n_tested;						n_tested = s_tested * sf * 4;

* n_self_tested;				n_self_tested = s_self_tested * sf ;
* n_tested_msm;					n_tested_msm = s_tested_msm * sf * 4;
* n_tested_pwid;				n_tested_pwid = s_tested_pwid * sf * 4;
* n_tested_anc;					n_tested_anc = s_tested_anc * sf * 4;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;
* p_tested_past_year_ov25m;		p_tested_past_year_ov25m = s_tested_past_year_ov25m /  (s_alive_ov25m - s_diag_ov25m) ;
* p_tested_past_year_ov25w;		p_tested_past_year_ov25w = s_tested_past_year_ov25w /  (s_alive_ov25w - s_diag_ov25w) ;

* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;
* p_trad_circ;					p_trad_circ = s_birth_circ /s_alive_m;
* p_vmmc;						p_vmmc = s_vmmc /s_alive_m ;
* n_new_vmmc1549m;				n_new_vmmc1549m = s_new_vmmc1549m * sf * 4;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive1564_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_hiv;					if s_sw_1564 gt 0 then prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_hiv1549_;				if s_sw_1549 gt 0 then prop_sw_hiv1549_ = s_hiv_sw1549_ / s_sw_1549 ;
* n_sw_1549_;					n_sw_1549_ = s_sw_1549 * sf;
* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_ = s_sw_newp_cat1 /s_sw_1564;
* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis = s_sw_program_visit / s_sw_1564 ;
* p_sw_tested;					if s_sw_1564 - s_diag_sw > 0 then p_tested_sw = s_tested_sw /(s_sw_1564 - s_diag_sw) ;
* p_diag_sw;					if s_hiv_sw  > 0 then p_diag_sw = s_diag_sw /s_hiv_sw ;

* prevalence_sw;				if s_sw_1564>0 then prevalence_sw = s_hiv_sw / s_sw_1564; 
* prevalence;					prevalence = s_hivge15_ / s_alive;
* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* prevalence1519w;				if s_ageg1519w gt 0 then prevalence1519w = s_hiv1519w / s_ageg1519w;
* prevalence1519m;				if s_ageg1519m gt 0 then prevalence1519m = s_hiv1519m / s_ageg1519m;
* prevalence2024w;				if s_ageg2024w gt 0 then prevalence2024w = s_hiv2024w / s_ageg2024w;
* prevalence2024m;				if s_ageg2024m gt 0 then prevalence2024m = s_hiv2024m / s_ageg2024m;
* prevalence1524w;				prevalence1524w = ( s_hiv1519w + s_hiv2024w ) / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m = ( s_hiv1519m + s_hiv2024m ) / (s_ageg1519m + s_ageg2024m) ;
* prevalence2529w;				if s_ageg2529w gt 0 then prevalence2529w = s_hiv2529w / s_ageg2529w;
* prevalence2529m;				if s_ageg2529m gt 0 then prevalence2529m = s_hiv2529m / s_ageg2529m;
* prevalence3034w;				if s_ageg3034w gt 0 then prevalence3034w = s_hiv3034w / s_ageg3034w;
* prevalence3034m;				if s_ageg3034m gt 0 then prevalence3034m = s_hiv3034m / s_ageg3034m;
* prevalence3539w;				if s_ageg3539w gt 0 then prevalence3539w = s_hiv3539w / s_ageg3539w;
* prevalence3539m;				if s_ageg3539m gt 0 then prevalence3539m = s_hiv3539m / s_ageg3539m;
* prevalence4044w;				if s_ageg4044w gt 0 then prevalence4044w = s_hiv4044w / s_ageg4044w;
* prevalence4044m;				if s_ageg4044m gt 0 then prevalence4044m = s_hiv4044m / s_ageg4044m;
* prevalence4549w;				if s_ageg4549w gt 0 then prevalence4549w = s_hiv4549w / s_ageg4549w;
* prevalence4549m;				if s_ageg4549m gt 0 then prevalence4549m = s_hiv4549m / s_ageg4549m;

* prevalence2549w;				prevalence2549w = ( s_hiv2529w + s_hiv3034w +  s_hiv3539w + s_hiv4044w +  s_hiv4549w ) / 
													(s_ageg2529w + s_ageg3034w + s_ageg3539w + s_ageg4044w + s_ageg4549w) ;
* prevalence2549m;				prevalence2549m = ( s_hiv2529m + s_hiv3034m +  s_hiv3539m + s_hiv4044m +  s_hiv4549m ) / 
													(s_ageg2529m + s_ageg3034m + s_ageg3539m + s_ageg4044m + s_ageg4549m) ;

* prevalence_hiv_preg;			if s_pregnant>0 then prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;

* incidence1549;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1564;                incidence1564_ = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* incidence1549_per1000;		incidence1549_per1000_ = (s_primary1549 * 4 * 1000) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w_per1000;		incidence1549w_per1000_ = (s_primary1549w * 4 * 1000) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m_per1000;		incidence1549m_per1000_ = (s_primary1549m * 4 * 1000) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

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

* incidence1564;                incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);

s_primary_w = s_primary1519w + s_primary2024w + s_primary2529w + s_primary3034w	+ s_primary3539w + s_primary4044w + s_primary4549w
+ s_primary5054w + s_primary5559w + s_primary6064w;
s_primary_m = s_primary1519m + s_primary2024m + s_primary2529m + s_primary3034m	+ s_primary3539m + s_primary4044m + s_primary4549m
+ s_primary5054m + s_primary5559m + s_primary6064m;

* incidence1564m;                incidence1564m = (s_primary_m * 4 * 100) / (s_alive1564_m  - s_hiv1564m  + s_primary_m);
* incidence1564w;                incidence1564w = (s_primary_w * 4 * 100) / (s_alive1564_w  - s_hiv1564w  + s_primary_w);


								if s_primary gt 0 then do;
* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
								end;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ; 
								s_diag1549_=s_diag_m1549_+s_diag_w1549_;
* p_diag1549_;					if s_hiv1549  > 0 then p_diag1549_ = s_diag1549_ / s_hiv1549 ; 
* p_diag1549m;					if s_hiv1549m  > 0 then p_diag1549m = s_diag_m1549_ / s_hiv1549m ; 
* p_diag1549w;					if s_hiv1549w  > 0 then p_diag1549w = s_diag_w1549_ / s_hiv1549w ; 



* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
/* NOT OUTPUTTED YET;
* p_onart_diag1549_;			if s_diag1549_ > 0 then p_onart_diag = s_onart_iicu1549_ / s_diag1549_;
* p_onart_diag1549m;			if s_diag1549m > 0 then p_onart_diag = s_onart_iicu1549m / s_diag1549m;
* p_onart_diag1549w;			if s_diag1549w > 0 then p_onart_diag = s_onart_iicu1549w / s_diag1549w;
*/

* n_diagnosed (per yr);			n_diagnosed = s_diag_this_period * 4 * sf;
* n_onart  ;					n_onart   = s_onart   * sf;
* n_onart_w;					n_onart_w = s_onart_w * sf;
* n_onart_m;					n_onart_m = s_onart_m * sf;

* p_efa;						if s_onart > 0 then p_efa = s_efa / s_onart ;
* p_taz;						if s_onart > 0 then p_taz = s_taz / s_onart ;
* p_ten;						if s_onart > 0 then p_ten = s_ten / s_onart ;
* p_zdv;						if s_onart > 0 then p_zdv = s_zdv / s_onart ;
* p_dol; 						if s_onart > 0 then p_dol = s_dol / s_onart ;
* p_3tc;						if s_onart > 0 then p_3tc = s_3tc / s_onart ;
* p_lpr; 						if s_onart > 0 then p_lpr = s_lpr / s_onart ;
* p_nev;						if s_onart > 0 then p_nev = s_nev / s_onart ;

* p_onart;						if s_hivge15_ gt 0 then p_onart = s_onart / s_hivge15_;
* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;

* n_art_start_y;				n_art_start_y = s_art_start * 4 * sf;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
/*NOT OUTPUTTED YET;
* p_onart_vl1000_1549_;			if s_onart_iicu_1549_  > 0 then p_onart_vl1000_1549_ = s_vl1000_art_iicu_1549_ / s_onart_iicu_1549_ ; 
* p_onart_vl1000_1549m;			if s_onart_iicu_1549m  > 0 then p_onart_vl1000_1549m = s_vl1000_art_iicu_1549m / s_onart_iicu_1549m ; 
* p_onart_vl1000_1549w;			if s_onart_iicu_1549w  > 0 then p_onart_vl1000_1549w = s_vl1000_art_iicu_1549w / s_onart_iicu_1549w ; 
*/

* n_vm_per_year;				n_vm_per_year = s_vm_this_per * sf * 4;

* p_vg1000, p_vl1000;			if s_hivge15_  > 0 then p_vg1000_ = s_vg1000 / s_hivge15_ ;  p_vl1000_ = 1- p_vg1000_ ;
* prevalence_vg1000;			if s_alive > 0 then prevalence_vg1000_ = s_vg1000 / s_alive;
* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * sf ;

* n_death_hiv_m;				n_death_hiv_m = s_death_hiv_m * 4 * sf;
* n_death_hiv_w;				n_death_hiv_w = s_death_hiv_w * 4 * sf;		
* n_death_hiv;					n_death_hiv = n_death_hiv_m + n_death_hiv_w;
* n_death_hivrel;				n_death_hivrel = s_death_hivrel  * 4* sf;
* n_death_hivrel_m;				n_death_hivrel_m = s_death_hivrel_m  * 4* sf;
* n_death_hivrel_w;				n_death_hivrel_w = (s_death_hivrel - s_death_hivrel_m)  * 4* sf;

* rate_dead_allage;				rate_dead_allage = ((s_deadm_all + s_deadw_all) * 4 * 100) / s_alive ;
* rate_dead_allage_m;			rate_dead_allage_m = (s_deadm_all * 4 * 100) / s_alive_m ; 
* rate_dead_allage_w;			rate_dead_allage_w = (s_deadw_all * 4 * 100) / s_alive_w ; 

* n_cd4_lt200;					n_cd4_lt200_ = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * sf; 
* n_hiv;						n_hiv = s_hivge15_ * sf;
* n_hiv_m;						n_hiv_m = s_hivge15m * sf;
* n_hiv_w;						n_hiv_w = s_hivge15w * sf;

* n_hiv1549_;					n_hiv1549_ = s_hiv1549 * sf;
* n_hiv1549m;					n_hiv1549m = s_hiv1549m * sf;
* n_hiv1549w;					n_hiv1549w = s_hiv1549w * sf;

* n_newinf;						n_newinf = s_primary * 4 * sf;
* n_newinf1549_;				n_newinf1549_ = s_primary1549 * 4 * sf;
* n_newinf1549m;				n_newinf1549m = s_primary1549m * 4 * sf;
* n_newinf1549w;				n_newinf1549w = s_primary1549w * 4 * sf;
* n_alive;						n_alive = s_alive * sf;
* n_alive1549_;					n_alive1549_ = s_alive1549* sf;
* n_alive1549_m;				n_alive1549m = s_alive1549_m* sf;
* n_alive1549_w;				n_alive1549w = s_alive1549_w* sf;
* n_alive1564_;					n_alive1564_ = s_alive1564* sf;
* n_alive1564m;					n_alive1564m = s_alive1564_m* sf;
* n_alive1564w;					n_alive1564w = s_alive1564_w* sf;
* n_alive_m;					n_alive_m = s_alive_m * sf;
* n_alive_w;					n_alive_w = s_alive_w * sf;
* n_prep;						n_prep = s_prep_any * sf;
* n_prep_sw;					n_prep_sw = s_onprep_sw * sf;
* n_prep_ever;					n_prep_ever = s_prep_any_ever * sf;
* n_pregnant;					n_pregnant= s_pregnant * sf;
* n_onprep_w;					n_onprep_w = max(s_onprep_w, 0) * sf;
* n_onprep_m;					n_onprep_m = max(s_onprep_m, 0) * sf;
* n_onprep;						n_onprep = n_onprep_w + n_onprep_m ;

* p_prep_ever;					p_prep_ever = s_prep_any_ever / (s_alive1564_w + s_alive1564_m) ;
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;
* n_prep_oral_ever_sw;  		n_prep_oral_ever_sw    = s_prep_oral_ever_sw * sf;   

* n_infected;					n_infected = (s_primary_m + s_primary_w) * 4 * sf;
* n_infected_w;					n_infected_w = s_primary_w * 4 * sf;
* n_infected_m;					n_infected_m = s_primary_m * 4 * sf;

* MSM;

* n_alive_msm;					n_alive_msm = s_alive_msm * sf ;
* n_alive1564_msm;				n_alive1564_msm = s_alive1564_msm * sf ;
* incidence1549msm;             incidence1549msm = (s_primary1549msm * 4 * 100) / (s_alive1549_msm  - s_hiv1549msm  + s_primary1549msm);
* incidence1564msm;             incidence1564msm = (s_primary1564msm * 4 * 100) / (s_alive1564_msm  - s_hiv1564msm  + s_primary1564msm);
* prevalence1549_msm;			prevalence1549_msm = s_hiv1549msm / s_alive1549_msm; 
* prevalence1564_msm;			prevalence1564_msm = s_hiv1564msm / s_alive1564_msm; 
* prevalence_msm;				prevalence_msm = s_hiv_msm / s_alive_m;
* p_elig_prep_any_msm_1564_;	p_elig_prep_any_msm_1564_ = s_elig_prep_any_msm_1564 / (s_alive1564_msm - s_hiv1564msm);
* p_onprep_msm;					p_onprep_msm = s_onprep_msm / (s_alive1564_msm - s_hiv1564msm);
* p_onart_msm;					if s_hiv_msm  > 0 then p_onart_msm = s_onart_msm / s_hiv_msm  ;
* prevalence_vg1000_msm;		prevalence_vg1000_msm = s_vg1000_msm / s_alive_msm;
* p_diag_msm;					if s_hiv1564msm gt 0 then p_diag_msm = s_diag_msm_age1564 / s_hiv1564msm  ;
* p_onart_diag_msm;				if s_diag_msm gt 0 then p_onart_diag_msm = s_onart_msm / s_diag_msm ;
* p_vl1000_art_gt6m_msm;		if s_onart_gt6m_msm gt 0 then p_vl1000_art_gt6m_msm = s_vl1000_art_gt6m_msm / s_onart_gt6m_msm ;
* p_ever_tested_msm; 			p_ever_tested_msm = s_ever_tested_msm / s_msm;
* p_tested_this_period_msm;		p_tested_this_period_msm = s_tested_msm / (s_msm - s_diag_msm) ;
* p_msm_infected_from_msm;		if s_hiv_msm gt 0 then p_msm_infected_from_msm = s_infected_from_msm / s_hiv_msm ;
* prop_m_msm;					prop_m_msm = s_alive_msm / s_alive_m;
* p_tested_msm;					if (s_alive1564_msm - s_diag_msm_age1564) > 0 then p_tested_msm = s_tested_msm /(s_alive1564_msm - s_diag_msm_age1564) ;


* p_ep;							p_ep = s_ep / s_alive1564;				
* p_ep_msm;						p_ep_msm = s_msm_ep / s_alive1564_msm;
* p_msm_ge1newp;				p_msm_ge1newp = s_msm_ge1newp / s_alive1564_msm;
* p_m_ge1newp;					p_m_ge1newp = s_m_ge1newp / s_alive1564_m;

* PWID;

* n_pwid;						n_pwid = s_pwid * sf ;
* p_onprep_pwid;				if (s_alive1564_pwid - s_hiv1564pwid) gt 0 then p_onprep_pwid = s_onprep_pwid / (s_alive1564_pwid - s_hiv1564pwid);
* p_onart_pwid;					if s_hiv_pwid  > 0 then p_onart_pwid = s_onart_pwid / s_pwid  ;
* prevalence_pwid;				if s_alive1564_pwid>0 then prevalence_pwid = s_hiv1564pwid / s_alive1564_pwid;
* p_diag_pwid;					if s_hiv1564pwid gt 0 then p_diag_pwid = s_diag_pwid_age1564 / s_hiv1564pwid  ;

* p_tb;							*if s_alive1564 gt 0 then p_tb = s_tb / s_alive1564;


incidence1524m = incidence1524m * 10; 
incidence1524w = incidence1524w * 10;  
incidence1564m = incidence1564m * 10; 
incidence1564w = incidence1564w * 10;  
incidence1564 = incidence1564 * 10;  
incidence_sw = incidence_sw * 10; 
incidence_msm = incidence1564msm * 10;

keep   cald	run		option	inc_cat		ych2_risk_beh_newp	p_w_giv_birth_this_per			mtct_prop		p_anc	
prevalence_hiv_preg	p_newp_ge1_	 		p_newp_ge5_			p_newp_ge1m_	p_newp_ge1w_	av_newp_ge1_non_sw 	
n_tested			p_tested_past_year_1549m				p_tested_past_year_1549w		test_prop_positive	
n_self_tested		n_tested_anc							p_tested_past_year_ov25m		p_tested_past_year_ov25w
p_mcirc				p_mcirc_1549m		n_new_vmmc1549m 	p_trad_circ			p_vmmc		s_sw_1549		p_sw_prog_vis
prop_w_1549_sw		prop_w_1564_sw		prop_w_ever_sw		prop_sw_hiv			n_sw_1549_	prop_w_1524_onprep
prop_1564_onprep	p_diag_sw
prevalence1549_		prevalence1549m		prevalence1549w		prevalence	
prevalence1519w		prevalence1519m		prevalence2024w		prevalence2024m		prevalence2529w		prevalence2529m
prevalence3034w		prevalence3034m		prevalence3539w		prevalence3539m		prevalence4044w		prevalence4044m
prevalence4549w		prevalence4549m		prevalence_sw	

prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg	incidence1564
incidence1549_		incidence1564_		incidence1549m		incidence1549w		incidence1564m		incidence1564w
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w		
incidence4554m		incidence4554w		incidence5564m		incidence5564w		incidence_sw		incidence_msm
incidence1549_per1000_					incidence1549m_per1000_  				incidence1549w_per1000_
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_diag1549_			p_diag1549m			p_diag1549w			p_artexp_diag	
p_onart_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart				p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	
p_vg1000_			p_vl1000_			prevalence_vg1000_	
n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hivrel_w	n_death_hivrel		n_death_hivrel_m	
n_death_hiv_w		n_death_hiv			rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv  				n_hiv_m				n_hiv_w				n_hiv1549_			n_hiv1549m			n_hiv1549w			n_alive			n_alive1549_	
n_alive1549m		n_alive1549w		n_alive_m			n_alive_w			n_alive1564_		n_alive1564m	n_alive1564w
n_art_start_y		n_newinf			n_newinf1549_		n_newinf1549m		n_newinf1549w		n_pregnant		n_prep 			
n_prep_ever			p_prep_ever			adh_pattern	p_fsw_newp0_				n_prep_oral_ever_sw prop_sw_hiv1549_
sw_trans_matrix		n_prep_sw			p_tested_sw			/*p_tb*/			p_tested_msm

	
n_alive_msm		n_alive1564_msm		incidence1549msm	incidence1564msm	prevalence1549_msm	prevalence1564_msm
p_elig_prep_any_msm_1564_			p_onprep_msm		p_onart_msm			prevalence_msm		prevalence_vg1000_msm
p_diag_msm		p_onart_diag_msm	p_vl1000_art_gt6m_msm 					p_ever_tested_msm	p_tested_this_period_msm
p_msm_infected_from_msm				prop_m_msm			p_ep				p_ep_msm			p_msm_ge1newp
p_m_ge1newp		n_pwid				p_onprep_pwid		p_onart_pwid		p_diag_pwid			prevalence_pwid sw_trans_matrix		
n_tested_msm	n_tested_pwid		n_vm_per_year		n_infected_m		n_infected_w		n_infected
s_primary_w		s_primary_m			sf					n_onprep_m			n_onprep_w			n_onprep
;

proc sort data=y;by run option;run;



***Removing low prevalence in women runs;

data low_inc;
set y;

***Removing 100 runs with the lowest prevalence;
if cald=2012 and prevalence1549w <= 0.0296498586 then a=1;
/*proc freq;table run;where a=1;run;*/



if run in (
23374054
81414969
187005467
215645459
273791383
371398554
371690996
510048527
554780880
664794222
715676813
817044379
899274309
920476501
970346065
) then delete;
run;

* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;
data a.l_base_CdI_18Oct24a; 
set low_inc;
*set y;  
run;


****OUTPUTS FOR WHO SPREADSHEET;


data y;
set a.l_base_CdI_18Oct24a; 


dummy1=.;
dummy2=.;
dummy3=.;
dummy4=.;
dummy5=.;
dummy6=.;
dummy7=.;
dummy8=.;

p_diag_m  = p_diag_m / 100;
p_diag_w = p_diag_w / 100; 
p_diag = p_diag / 100;
  
keep run cald option 
n_alive_m 		n_alive_w			n_alive				prevalence1549m		prevalence1549w		prevalence		n_infected_m
n_infected_w	n_infected 			p_diag_m  			p_diag_w  			p_diag				p_onart_diag_m 	p_onart_diag_w
p_onart_diag 	p_onart_vl1000_m 	p_onart_vl1000_w 	p_onart_vl1000_		prop_w_1549_sw  	prevalence_sw   p_mcirc  
dummy1  dummy2
n_death_hivrel_m n_death_hivrel_w n_death_hivrel n_hiv_m n_hiv_w n_hiv prevalence_msm  prop_m_msm  incidence1524m incidence1564m incidence1524w incidence1564w
incidence_sw incidence_msm  dummy3 dummy4 incidence1564  n_onart  n_onprep_m  n_onprep_w  n_onprep /*yll_m  yll_w  yll */ dummy5 dummy6 dummy7 n_tested dummy8;
run;


data z; 
set y; 

  option nospool;

%macro var(v=);

* &v ;

  options nomprint;

***replace option=1 with each option and run multiple times;
proc means noprint data=z; var &v; output out=y_24  mean= &v   ;         ; where 2024.0 <= cald < 2025.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_25  mean= &v   ;         ; where 2025.0 <= cald < 2026.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_26  mean= &v   ;         ; where 2026.0 <= cald < 2027.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_27  mean= &v   ;         ; where 2027.0 <= cald < 2028.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_28  mean= &v   ;         ; where 2028.0 <= cald < 2029.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_29  mean= &v   ;         ; where 2029.0 <= cald < 2030.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_30  mean= &v   ;         ; where 2030.0 <= cald < 2031.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_31  mean= &v   ;         ; where 2031.0 <= cald < 2032.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_32  mean= &v   ;         ; where 2032.0 <= cald < 2033.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_33  mean= &v   ;         ; where 2033.0 <= cald < 2034.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_34  mean= &v   ;         ; where 2034.0 <= cald < 2035.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_35  mean= &v   ;         ; where 2035.0 <= cald < 2036.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_36  mean= &v   ;         ; where 2036.0 <= cald < 2037.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_37  mean= &v   ;         ; where 2037.0 <= cald < 2038.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_38  mean= &v   ;         ; where 2038.0 <= cald < 2039.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_39  mean= &v   ;         ; where 2039.0 <= cald < 2040.0 and option=1 ;
proc means noprint data=z; var &v; output out=y_40  mean= &v   ;         ; where 2040.0 <= cald < 2041.0 and option=1 ;
 																										   
																										
data &v ; set 

/* only for option=115 */
/* y_00 y_01 y_02 y_03 y_04 y_05 y_06 y_07 y_08 y_09 y_10 y_11 y_12 y_13 y_14 y_15 y_16 y_17 y_18 y_19 y_20 y_21 y_22 y_23   */

y_24 y_25 y_26 y_27 y_28 y_29 y_30 y_31 y_32 y_33 y_34 y_35 y_36 y_37 y_38 y_39 y_40  ;  
drop _NAME_ _TYPE_ _FREQ_;



%mend var;

%var(v=n_alive_m);			%var(v=n_alive_w);    		%var(v=n_alive );		%var(v=prevalence1549m);%var(v=prevalence1549w);  
%var(v=prevalence); 		%var(v=n_infected_m); 		%var(v=n_infected_w); 	%var(v=n_infected );	%var(v=p_diag_m  );    	
%var(v=p_diag_w);     		%var(v=p_diag); 			%var(v=p_onart_diag_m);	%var(v=p_onart_diag_w);	%var(v=p_onart_diag); 
%var(v=p_onart_vl1000_m);  	%var(v=p_onart_vl1000_w);  	%var(v=p_onart_vl1000_); %var(v=prop_w_1549_sw);%var(v=prevalence_sw); 
%var(v=p_mcirc);			%var(v=dummy1);				%var(v=dummy2);			%var(v=n_death_hivrel_m ); %var(v=n_death_hivrel_w ); 
%var(v=n_death_hivrel ); 	%var(v=n_hiv_m);			%var(v=n_hiv_w);		%var(v=n_hiv);			%var(v=prevalence_msm);
%var(v=prop_m_msm);    		%var(v=incidence1524m);		%var(v=incidence1524w);	%var(v=incidence1564m);	%var(v=incidence1564w); 
%var(v=incidence1564); 		%var(v=incidence_msm); 		%var(v=incidence_sw); 	%var(v=dummy3); 		%var(v=dummy4); 
%var(v=n_onart); 			%var(v=n_onprep_m);			%var(v=n_onprep_w); 	%var(v=n_onprep);		/*%var(v=yll_m); 
%var(v=yll_w); 				%var(v=yll); 	*/			%var(v=dummy5 ); 		%var(v=dummy6 ); 		%var(v=dummy7 );
%var(v=n_tested ); 			%var(v=dummy8 ); 

data year;
input year;
cards;
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



data   wide_outputs; merge year 
n_alive_m n_alive_w  n_alive  prevalence1549m prevalence1549w  prevalence  n_infected_m  n_infected_w  n_infected p_diag_m  p_diag_w  p_diag  
p_onart_diag_m p_onart_diag_w  p_onart_diag p_onart_vl1000_m p_onart_vl1000_w p_onart_vl1000_  prop_w_1549_sw  prevalence_sw   p_mcirc  dummy1  dummy2
n_death_hivrel_m n_death_hivrel_w n_death_hivrel n_hiv_m n_hiv_w n_hiv prevalence_msm  prop_m_msm  incidence1524m incidence1564m incidence1524w incidence1564w
incidence_sw incidence_msm  dummy3 dummy4 incidence1564  n_onart  n_onprep_m  n_onprep_w  n_onprep  /*yll_m yll_w yll*/ dummy5 dummy6 dummy7 n_tested dummy8

;

ods html;
proc print noobs ; run; 
ods html close;



