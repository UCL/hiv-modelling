* options user="/folders/myfolders/";

***OPTION COMPARISON FOR WHO AT END OF PROGRAM;

libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\hiv_control_cdi\";
*libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\hiv_control_cdi\";


data a;
set a.cdi_07jul25;

proc sort;by run cald option;run;
proc freq;table cald option;run;


* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a;

if cald=2022; 
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


yll_gbd = s_dyll_GBD * sf * 4;

yll_gbd_w = s_dyll_gbd_w * sf * 4 ;
yll_gbd_m = s_dyll_gbd_m * sf * 4 ;
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
s_alive_ov25m = s_ageg1564m - s_ageg1519m - s_ageg2024m;
s_alive_ov25w = s_ageg1564w - s_ageg1519w - s_ageg2024w;	

s_tested_past_year_ov25m = s_tested_4p_m2529_ + s_tested_4p_m3039_ + s_tested_4p_m4049_ + s_tested_4p_m5064_;
s_tested_past_year_ov25w = s_tested_4p_w2529_ + s_tested_4p_w3039_ + s_tested_4p_w4049_ + s_tested_4p_w5064_; 

s_diag_ov25m = s_diag_m1549_ + s_diag_m5054_ + s_diag_m5559_ + s_diag_m6064_;
s_diag_ov25w = s_diag_w1549_ + s_diag_w5054_ + s_diag_w5559_ + s_diag_w6064_;

s_agyw = s_ageg1519w + s_ageg2024w;
s_primary_agyw = s_primary1519w +  s_primary2024w;
s_hiv_agyw = s_hiv1519w + s_hiv2024w;


s_primary_w = s_primary1519w + s_primary2024w + s_primary2529w + s_primary3034w	+ s_primary3539w + s_primary4044w + s_primary4549w
+ s_primary5054w + s_primary5559w + s_primary6064w;
s_primary_m = s_primary1519m + s_primary2024m + s_primary2529m + s_primary3034m	+ s_primary3539m + s_primary4044m + s_primary4549m
+ s_primary5054m + s_primary5559m + s_primary6064m;

* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_anc;						if (s_pregnant+s_birth) gt 0 then p_anc = s_anc /(s_pregnant+s_birth);*pregnant=1 at dt_start_pregn, dt_start_pregn+0.25, dt_start_pregn+0.5
* prevalence_hiv_preg;			if s_pregnant gt 0 then prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;
* p_pmtct;						if s_plw gt 0 then p_pmtct=s_pmtct/s_pregnant;

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

* p_tested_anc;					if (s_anc-s_diag_anc)>0 then p_tested_anc=s_tested_anc/(s_anc-s_diag_anc);

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
* p_tested_sw;					if s_sw_1564 - s_diag_sw > 0 then p_tested_sw = s_tested_sw /(s_sw_1564 - s_diag_sw) ;
* p_tested_agywfsw;				if s_agywfsw_1564 - s_diag_agywfsw > 0 then p_tested_agywfsw = s_tested_agywfsw /(s_agywfsw_1564 - s_diag_agywfsw) ;
* p_ever_tested_sw; 			p_ever_tested_sw = s_ever_tested_sw / s_sw_1564;
* p_tested_py_sw; 				p_tested_py_sw = s_tested_4p_sw / s_sw_1564;
* p_tested_py_agyw; 			p_tested_py_agyw = s_tested_4p_agywfsw / s_agywfsw_1564;

* p_diag_sw;					if s_hiv_sw  > 0 then p_diag_sw = s_diag_sw /s_hiv_sw ;
* incidence_sw;		            incidence_sw = (s_primary_sw * 4 * 100) / (s_sw_1549  - s_hiv_sw1549_  + s_primary_sw);
* p_onart_sw;					if s_hiv_sw  > 0 then p_onart_sw = s_onart_sw / s_hiv_sw  ;


* prevalence_sw;				if s_sw_1564>0 then prevalence_sw = s_hiv_sw / s_sw_1564; 
* prevalence;					prevalence = s_hivge15_ / s_alive;
* prevalence_m;					prevalence_m = s_hivge15m  / s_alive_m ;
* prevalence_w;					prevalence_w = s_hivge15w  / s_alive_w ;

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
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* incidence1564;                incidence1564_ = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1564m;               incidence1564m = (s_primary_m * 4 * 100) / (s_alive1564_m  - s_hiv1564m  + s_primary_m);
* incidence1564w;               incidence1564w = (s_primary_w * 4 * 100) / (s_alive1564_w  - s_hiv1564w  + s_primary_w);


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

* incidence_sw;		            incidence_sw = (s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
* incidence_agyw;	            incidence_agyw = (s_primary_agyw * 4 * 100) / (s_agyw  - s_hiv_agyw  + s_primary_agyw);


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
* n_infected;					n_infected = (s_primary_m + s_primary_w) * 4 * sf;
* n_infected_w;					n_infected_w = s_primary_w * 4 * sf;
* n_infected_m;					n_infected_m = s_primary_m * 4 * sf;
* n_infected_agyw;				n_infected_agyw = s_primary_agyw * 4 * sf;

* n_alive;						n_alive = s_alive * sf;
* n_alive1549_;					n_alive1549_ = s_alive1549* sf;
* n_alive1549_m;				n_alive1549m = s_alive1549_m* sf;
* n_alive1549_w;				n_alive1549w = s_alive1549_w* sf;
* n_alive1564_;					n_alive1564_ = s_alive1564* sf;
* n_alive1564m;					n_alive1564m = s_alive1564_m* sf;
* n_alive1564w;					n_alive1564w = s_alive1564_w* sf;
* n_alive_m;					n_alive_m = s_alive_m * sf;
* n_alive_w;					n_alive_w = s_alive_w * sf;
* n_onprep;						n_onprep = s_prep_any * sf;
* n_onprep_sw;					n_onprep_sw = s_onprep_sw * sf;
* n_onprep_msm;					n_onprep_msm = s_onprep_msm * sf;

* n_prep_ever;					n_prep_ever = s_prep_any_ever * sf;
* n_pregnant;					n_pregnant= s_pregnant * sf;
* n_onprep_w;					n_onprep_w = max(s_onprep_w, 0) * sf;
* n_onprep_m;					n_onprep_m = max(s_onprep_m, 0) * sf;
* n_onprep;						n_onprep = n_onprep_w + n_onprep_m ;
* n_prep_oral_ever_sw;  		n_prep_oral_ever_sw    = s_prep_oral_ever_sw * sf;   

* p_prep_ever;					p_prep_ever = s_prep_any_ever / (s_alive1564_w + s_alive1564_m) ;
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;
* prop_sw_onprep;				prop_sw_onprep =  s_onprep_sw  / (s_sw_1564 - s_hiv_sw );



* MSM;

* n_alive_msm;					n_alive_msm = s_alive_msm * sf ;
* n_alive1564_msm;				n_alive1564_msm = s_alive1564_msm * sf ;
* incidence1549msm;             incidence1549msm = (s_primary1549msm * 4 * 100) / (s_alive1549_msm  - s_hiv1549msm  + s_primary1549msm);
* incidence1564msm;             incidence1564msm = (s_primary1564msm * 4 * 100) / (s_alive1564_msm  - s_hiv1564msm  + s_primary1564msm);
* prevalence1549_msm;			prevalence1549_msm = s_hiv1549msm / s_alive1549_msm; 
* prevalence1564_msm;			prevalence1564_msm = s_hiv1564msm / s_alive1564_msm; 
* prevalence_msm;				prevalence_msm = s_hiv_msm / s_alive_msm;
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
* p_tested_py_msm;				if (s_alive1564_msm - s_diag_msm_age1564) > 0 then p_tested_py_msm = s_tested_4p_msm /(s_alive1564_msm - s_diag_msm_age1564) ;

* p_av_newp_msm;				if s_alive_msm ge 0 then p_av_newp_msm=s_msm_newp/ s_alive_msm;
* p_msm_newp0_;					if s_alive_msm ge 0 then p_msm_newp0_= s_msm_newp0/ s_alive_msm;

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
* p_tested_py_msm;				if (s_alive1564_pwid - s_diag_pwid_age1564) > 0 then p_tested_py_pwid = s_tested_4p_pwid /(s_alive1564_pwid - s_diag_pwid_age1564) ;


yll=yll_gbd;
yll_w=yll_gbd_w;
yll_m=yll_gbd_m;
 
***incidence is per 1000 in spreadsheets; 
incidence1564m = incidence1564m * 10; 
incidence1564w = incidence1564w * 10;  
incidence1564_ = incidence1564_ * 10;  
incidence1524w = incidence1524w * 10;
incidence1524m = incidence1524m * 10;
incidence_sw = incidence_sw * 10; 
incidence_agyw = incidence_agyw * 10;
incidence_msm = incidence1564msm * 10;
p_1564_onprep = prop_1564_onprep *100;
p_onprep_sw = prop_sw_onprep * 100;

keep   
cald		run		option				inc_cat				ych2_risk_beh_newp		p_w_giv_birth_this_per	mtct_prop	
p_anc				p_tested_anc		p_pmtct		
prevalence_hiv_preg	p_newp_ge1_	 		p_newp_ge5_			p_newp_ge1m_		p_newp_ge1w_	av_newp_ge1_non_sw 	
n_tested			p_tested_past_year_1549m				p_tested_past_year_1549w		test_prop_positive	
n_self_tested		n_tested_anc							p_tested_past_year_ov25m		p_tested_past_year_ov25w
p_mcirc				p_mcirc_1549m		n_new_vmmc1549m 	p_trad_circ			p_vmmc		s_sw_1549		p_sw_prog_vis
prop_w_1549_sw		prop_w_1564_sw		prop_w_ever_sw		prop_sw_hiv			n_sw_1549_	prop_w_1524_onprep
prop_1564_onprep	p_diag_sw			p_onart_sw			p_tested_agywfsw	p_tested_py_agyw
prevalence1549_		prevalence1549m		prevalence1549w		prevalence	
prevalence1519w		prevalence1519m		prevalence2024w		prevalence2024m		prevalence2529w		prevalence2529m
prevalence3034w		prevalence3034m		prevalence3539w		prevalence3539m		prevalence4044w		prevalence4044m
prevalence4549w		prevalence4549m		prevalence_sw		prevalence_m		prevalence_w
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg	

incidence1549_		incidence1564_		incidence1549m		incidence1549w		incidence1564m		incidence1564w
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w		
incidence4554m		incidence4554w		incidence5564m		incidence5564w		incidence_sw		incidence_msm
incidence1549_per1000_					incidence1549m_per1000_  				incidence1549w_per1000_	incidence_agyw
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_diag1549_			p_diag1549m			p_diag1549w			p_artexp_diag	
p_onart_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart				p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	
p_vg1000_			p_vl1000_			prevalence_vg1000_	
n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hivrel_w	n_death_hivrel		n_death_hivrel_m	
n_death_hiv_w		n_death_hiv			rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv  				n_hiv_m				n_hiv_w				n_hiv1549_			n_hiv1549m			
n_hiv1549w			n_alive				n_alive1549_		n_alive1549m		n_alive1549w		n_alive_m			
n_alive_w			n_alive1564_		n_alive1564m		n_alive1564w		n_art_start_y		n_newinf	
n_newinf1549_		n_newinf1549m		n_newinf1549w		n_pregnant			adh_pattern			p_fsw_newp0_
n_onprep 			n_prep_ever			p_prep_ever			p_1564_onprep		n_prep_oral_ever_sw p_onprep_sw

prop_sw_hiv1549_	sw_trans_matrix		n_onprep_sw			p_tested_sw			p_ever_tested_sw	p_tested_py_sw		p_tested_msm

	
n_alive_msm		n_alive1564_msm		incidence1549msm	incidence1564msm	prevalence1549_msm	prevalence1564_msm
p_elig_prep_any_msm_1564_			p_onprep_msm		p_onart_msm			prevalence_msm		prevalence_vg1000_msm
p_diag_msm		p_onart_diag_msm	p_vl1000_art_gt6m_msm 	p_tested_py_msm	p_ever_tested_msm	p_tested_this_period_msm
p_msm_infected_from_msm				prop_m_msm			p_ep				p_ep_msm			p_msm_ge1newp
p_m_ge1newp		p_av_newp_msm		p_msm_newp0_		n_pwid				p_onprep_pwid		p_onart_pwid		p_diag_pwid			prevalence_pwid sw_trans_matrix		
n_tested_msm	n_tested_pwid		p_tested_py_pwid	n_vm_per_year		n_infected_m		n_infected_w		n_infected	n_infected_agyw
s_primary_w		s_primary_m			sf					n_onprep_m			n_onprep_w			n_onprep	n_onprep_msm
an_lin_incr_test					yll_m 				yll_w 				yll
;

proc sort data=y;by run option;run;


* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;
data a.l_base_CdI_03jul25; 
set y;
run;


***GRAPHS;
data b;
set a.l_base_CdI_03jul25; 
if option ne 0 then delete;
s_sw_1549_ = s_sw_1549;

proc sort; by cald run ;run;
proc freq;table cald;run;

 
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  192;
%let year_end = 2040 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
*if option =1 then delete;
%let var = 
p_w_giv_birth_this_per	mtct_prop		prevalence_hiv_preg		p_anc		p_newp_ge1_	 		p_newp_ge5_			p_newp_ge1m_		p_newp_ge1w_	
n_tested	p_tested_past_year_1549m	p_tested_past_year_1549w	test_prop_positive
p_mcirc		n_new_vmmc1549m 			p_trad_circ			p_vmmc				s_sw_1549_	p_sw_prog_vis
prop_w_1549_sw		prop_w_1564_sw		prop_w_ever_sw		prop_sw_hiv			n_sw_1549_	prop_w_1524_onprep	prop_1564_onprep	
prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1519w		prevalence1519m		prevalence2024w		prevalence2024m		prevalence2529w		prevalence2529m
prevalence3034w		prevalence3034m		prevalence3539w		prevalence3539m		prevalence4044w		prevalence4044m
prevalence4549w		prevalence4549m
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w	
incidence4554m		incidence4554w		incidence5564m		incidence5564w	
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_diag1549_			p_diag1549m			p_diag1549w			p_artexp_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm	
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart				p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	p_vg1000_	p_vl1000_
prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hiv_w		n_death_hiv
rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv				n_alive				n_alive1549_		n_alive1549m		n_alive1549w	
n_alive_m			n_alive_w			n_alive1564_		n_alive1564m		n_alive1564w		n_art_start_y 	
n_onprep			n_prep_ever			p_prep_ever	p_fsw_newp0_
n_pregnant			n_newinf			n_newinf1549_		n_newinf1549m		n_newinf1549w		n_prep_oral_ever_sw
prop_sw_hiv1549_

n_alive_msm		n_alive1564_msm		incidence1549msm	incidence1564msm	prevalence1549_msm	prevalence1564_msm
p_elig_prep_any_msm_1564_			p_onprep_msm		p_onart_msm			prevalence_vg1000_msm
p_diag_msm		p_onart_diag_msm	p_vl1000_art_gt6m_msm 					p_ever_tested_msm	p_tested_this_period_msm
p_msm_infected_from_msm				prop_m_msm			p_ep				p_ep_msm			p_msm_ge1newp
p_m_ge1newp		n_pwid				p_onprep_pwid		p_onart_pwid




;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;

%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;
%let mean_var = mean_&var_0;


%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;

p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);

p50_&varb._0 = median(of &varb.1-&varb.&nfit);
mean_&varb._0=mean(of &varb.1-&varb.&nfit);

keep cald p5_&varb._0 p95_&varb._0 p50_&varb._0 mean_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;

/*
data option_1;
set b;
if option =0 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m	  n_prep_elig_w  n_prep_elig_m   n_onprep_w  n_onprep_m  n_newp_ge1_w
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence_vg1000_   
incidence1564_  incidence1564m incidence1564w incidence1549m incidence1549w n_tested n_tested_m
  n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart_m n_onart_w  n_dead_hivpos_cause1_ n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed n_hiv n_infected
;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p2p5_var = p2p5_&var_1;
%let p97p5_var = p97p5_&var_1;
%let p50_var = median_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p2p5_&varb._1  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._1 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1 p2p5_&varb._1 p97p5_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;

*/

data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25
g26  g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48  g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71  g72  g73  g74  g75
g76  g77  g78  g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100  g101  g102 
g103 g104 g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 /* g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 
*/

;
by cald;
%include "C:\Users\Loveleen\Documents\GitHub\hiv-modelling\Cote d Ivoire\Observed_data_Cote_dIvoire.sas";
***LOok at Spectrum AIM file;
***Number of HIV tests done;
***Ever tested;
***Number on ART;
*Circ;
*90-90-90s;
*Of adults on art, proportion on efavirenz, dolutegravir, boosted PI Emen women;

run;

ods listing close;
ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Modelling Consortium\HIV Control\07Jul25.doc' startpage=never; 

proc sgplot data=d; 
Title    height=1.5 justify=center "Population 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);

label mean_n_alive_0 = "15+ ";
label mean_n_alive1564__0 = "15-64";
label o_pop15plus = "15+ worldpopulationreview.com";
label o_pop1564 = "15-64 World Population Prospectus";

series  x=cald y=mean_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_alive1564__0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive1564__0 	upper=p95_n_alive1564__0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_pop15plus / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_pop1564 / markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Population 15+ by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by  2000000) valueattrs=(size=10);

label mean_n_alive1564m_0 = "Model 15-64 Males";
label mean_n_alive1564w_0 = "Model 15-64 Females";
label o_pop1564m = "15-64 Males (World Bank)";
label o_pop1564w = "15-64 Females (World Bank)";

series  x=cald y=mean_n_alive1564m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_alive1564m_0 	upper=p95_n_alive1564m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_n_alive1564w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive1564w_0 	upper=p95_n_alive1564w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_pop1564m / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_pop1564w / markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new infections";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000 by 10000) valueattrs=(size=10);

label mean_n_newinf_0 = "Model";
label o_newinf_unaids = "UNAIDS";

series  x=cald y=mean_n_newinf_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_newinf_0 	upper=p95_n_newinf_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_newinf_unaids/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

label mean_n_hiv_0 = "Model";
label o_plhiv_UNAIDS = "UNAIDS";

series  x=cald y=mean_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_plhiv_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   valueattrs=(size=10);
label mean_n_pregnant_0 = "Option 0 (median) ";
label o_preg_UNAIDS = "UNAIDS";

series  x=cald y=mean_n_pregnant_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pregnant_0 	upper=p95_n_pregnant_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

scatter x=cald y = o_preg_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of pregnant women with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   valueattrs=(size=10);
label mean_prevalence_hiv_preg_0 = "Option 0 (median) ";
label preg_hiv_UNAIDS = "NSP";

series  x=cald y=mean_prevalence_hiv_preg_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

scatter x=cald y = preg_hiv_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label mean_p_w_giv_birth_this_per_0 = "Option 0 (median) ";

series  x=cald y=mean_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p25_p_w_giv_birth_this_per_0 	upper=p95_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Mother to child transmission";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label mean_mtct_prop_0 = "Option 0 (median) ";
label mtct_nsp = "NSP";

series  x=cald y=mean_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p25_mtct_prop_0 	upper=p975_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

scatter x=cald y = o_p_mtct_nsp/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of pregnant women attending ANC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_anc_0 = "Option 0 (median) ";
label o_p_anc_nsp = "NSP (1st trimester)";

series  x=cald y=mean_p_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_anc_0 	upper=p95_p_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

scatter x=cald y = o_p_anc_nsp/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label mean_p_newp_ge1__0 = "Option 0 (median) ";

series  x=cald y=mean_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1m_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label mean_p_newp_ge1m__0 = "newp >=1 amongst men";
label o_p_cls_m_PHIA1564 = "% who had comdomless sex at last sex PHIA";
label o_p_cls_m_DHS1549 = "% who had comdomless sex at last sex DHS";

series  x=cald y=mean_p_newp_ge1m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1m__0 	upper=p95_p_newp_ge1m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_cls_m_PHIA1564/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_p_cls_m_DHS1549/	markerattrs = (symbol=square color=blue  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1w_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label mean_p_newp_ge1m__0 = "newp >=1 amongst women";
label o_p_cls_w_PHIA1564 = "% who had comdomless sex at last sex PHIA";
label o_p_cls_W_DHS1549 = "% who had comdomless sex at last sex DHS";

series  x=cald y=mean_p_newp_ge1w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1w__0 	upper=p95_p_newp_ge1w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_cls_w_PHIA1564/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_p_cls_m_DHS1549/	markerattrs = (symbol=square color=blue  size = 10) ;
run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02 by 0.005) valueattrs=(size=10);
label mean_p_newp_ge5__0 = "Option 0 (median) ";

series  x=cald y=mean_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

/*

proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label mean_log_gender_r_newp_0 = "Option 0 (median) ";
label mean_log_gender_r_newp_1 = "Option 1 (median) ";

series  x=cald y=mean_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  12000000 by 1000000) valueattrs=(size=10);
label mean_n_tested_0 = "Option 0 (median) ";

series  x=cald y=mean_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_n_tests_JS/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;

***look at dhs;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);
label mean_p_tested_past_year_1549m_0 = "Model";
label o_evertested_m_PHIA = "Ever tested 15-64 (PHIA)";

series  x=cald y=mean_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_evertested_m_PHIA/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_tested_past_year_1549w_0 = "Model";
label o_evertested_w_PHIA = "Ever tested 15-64 (PHIA)";

series  x=cald y=mean_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_evertested_w_PHIA/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_mcirc_0 = "All";
label mean_p_trad_circ_0 = "Traditional";
label mean_p_vmmc_0 = "VMMC";
label o_circ1549_phia = "PHIA All";
label o_trad_circ1549_phia = "PHIA traditional";
label o_vmmc1549_phia = "PHIA VMMC";
label o_circ1549_dhs = "All, DHS";


series  x=cald y=mean_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_trad_circ_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_trad_circ_0 	upper=p95_p_trad_circ_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_p_vmmc_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vmmc_0 	upper=p95_p_vmmc_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_circ1549_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_trad_circ1549_phia/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_vmmc1549_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_circ1549_dhs/	markerattrs = (symbol=square color=red  size = 10) ;

run;quit;

ods html;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label mean_prop_w_1549_sw_0 = "Current FSW 15-49";
label mean_prop_w_ever_sw_0 = "Ever FSW 15-64";
label o_p_fsw_UNAIDS="% FSW of 15-49 women";

series  x=cald y=mean_prop_w_1549_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_w_ever_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 80000 by 10000) valueattrs=(size=10);
label mean_n_sw_1549__0 = "Current FSW 15-49";
label o_pop_fsw_UNAIDS= "Number of FSW 15-49 (UNAIDS)";

series  x=cald y=mean_n_sw_1549__0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_1549__0 	upper=p95_n_sw_1549__0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_pop_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of female sex workers (FSW) using s_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 300 by 50) valueattrs=(size=10);
label mean_s_sw_1549__0 = "Current FSW 15-49";

series  x=cald y=mean_s_sw_1549__0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_1549__0 	upper=p95_n_sw_1549__0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label o_prev_fsw_UNAIDS = "UNAIDS";
label o_prev_fsw_abid_kof = "Abidjan (Koffi)";
label o_prev_fsw_abid_ghys = "Abidjan (Ghys)";


series  x=cald y=mean_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_prev_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev_fsw_abid_kof/	markerattrs = (symbol=square color=orange  size = 10) ;
scatter  x=cald y=o_prev_fsw_abid_ghys/	markerattrs = (symbol=square color=blue  size = 10) ;

run;quit;

proc sgplot data=d; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2050 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label mean_p_fsw_newp0__0 = "Median";
label o_condom_lastsex = "Condom use last sex - Ghys";
label o_condom_lastsex = "Condom use last sex - NSP";

series  x=cald y=mean_p_fsw_newp0__0  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_fsw_newp0__0	 upper=p95_p_fsw_newp0__0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
scatter  x=cald y=o_condom_lastsex/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_condom_lastsex_nsp/	markerattrs = (symbol=square color=blue  size = 10) ;

run;quit;

proc sgplot data=d; 
title    height=1.5 justify=center "Proportion of sex workers attending a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2050 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label mean_p_sw_prog_vis_0 = "Median";
label o_sw_in_prog_nsp= "NSP";

series  x=cald y=mean_p_sw_prog_vis_0  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_0	 upper=p95_p_sw_prog_vis_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
scatter  x=cald y=o_sw_in_prog_nsp/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW who have started PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)   valueattrs=(size=10);

label mean_n_prep_oral_ever_sw_0 = "Model";
label o_fsw_start_prep_PEPFAR = "PEPFAR";

series  x=cald y=mean_n_prep_oral_ever_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_ever_sw_0 	upper=p95_n_prep_oral_ever_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_fsw_start_prep_PEPFAR/	markerattrs = (symbol=square color=green  size = 10) ;


run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02   by 0.005 ) valueattrs=(size=10);

label mean_prop_w_1524_onprep_0 = "Model";

series  x=cald y=mean_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.03   by 0.005 ) valueattrs=(size=10);

label mean_prop_1564_onprep_0 = "Option 0 (median) ";

series  x=cald y=mean_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of 15+ adults who ever started PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   values = (0 to 1500000 by 100000) valueattrs=(size=10);

label mean_n_prep_ever_0 = "Option 0 (median) ";
label o_prepstart_pepfar = "PEPFAR";

series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_ever_0 	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_prepstart_pepfar/	markerattrs = (symbol=square color=red  size = 10) ;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.20 by 0.05) valueattrs=(size=10);

label mean_prevalence1549m_0 = "Model";
label o_prev1549m_phia = "PHIA";
label o_prev1549_UNAIDS = "UNAIDS";
label o_prev_m_urb_Benoit = "Benoit urban";
label o_prev_m_rur_Benoit = "Benoit rural";
label o_prev1549m_dhs = "DHS";

series  x=cald y=mean_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev1549m_phia/	markerattrs = (symbol=square color=red  size = 10) ;
scatter  x=cald y=o_prev1549m_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev_m_urb_Benoit/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_prev_m_rur_Benoit/	markerattrs = (symbol=square color=orange  size = 10) ;
scatter  x=cald y=o_prev1549m_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label mean_prevalence1549w_0 = "Model";
label o_prev1549w_phia = "PHIA";
label o_prev1549w_UNAIDS = "UNAIDS";
label o_prev_w_urb_Benoit = "Benoit urban";
label o_prev_w_rur_Benoit = "Benoit rural";
label o_prev1549w_dhs = "DHS";

series  x=cald y=mean_prevalence1549w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev1549w_phia/	markerattrs = (symbol=square color=red  size = 10) ;
scatter  x=cald y=o_prev1549w_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev_w_urb_Benoit/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_prev_w_rur_Benoit/	markerattrs = (symbol=square color=orange  size = 10) ;
scatter  x=cald y=o_prev1549w_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-19)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label mean_prevalence1519w_0 = "Women";
label mean_prevalence1519m_0 = "Men";
label o_prev1519w_phia = "Women PHIA";
label o_prev1519m_phia = "Men PHIA";
label o_prev1519w_dhs = "Women DHS";
label o_prev1519m_dhs = "Men DHS";


series  x=cald y=mean_prevalence1519w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1519w_0 	upper=p95_prevalence1519w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1519m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1519m_0 	upper=p95_prevalence1519m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev1519w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev1519m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_prev1519w_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;
scatter  x=cald y=o_prev1519m_dhs/	markerattrs = (symbol=square color=orange  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 20-24)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label mean_prevalence2024w_0 = "Women";
label mean_prevalence2024m_0 = "Men";
label o_prev2024w_phia = "Women PHIA";
label o_prev2024m_phia = "Men PHIA";
label o_prev2024w_dhs = "Women DHS";
label o_prev2024m_dhs = "Men DHS";

series  x=cald y=mean_prevalence2024w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence2024w_0 	upper=p95_prevalence2024w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence2024m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence2024m_0 	upper=p95_prevalence2024m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev2024w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev2024m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_prev2024w_dhs/	markerattrs = (symbol=square color=purple size = 10) ;
scatter  x=cald y=o_prev2024m_dhs/	markerattrs = (symbol=square color=orange  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 25-29)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label mean_prevalence2529w_0 = "Women";
label mean_prevalence2529m_0 = "Men";
label o_prev2529w_phia = "Women PHIA";
label o_prev2529m_phia = "Men PHIA";
label o_prev2529w_dhs = "Women DHS";
label o_prev2529m_dhs = "Men DHS";

series  x=cald y=mean_prevalence2529w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence2529w_0 	upper=p95_prevalence2529w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence2529m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence2529m_0 	upper=p95_prevalence2529m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev2529w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev2529m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_prev2529w_dhs/	markerattrs = (symbol=square color=purple size = 10) ;
scatter  x=cald y=o_prev2529m_dhs/	markerattrs = (symbol=square color=orange  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 30-34)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label mean_prevalence3034w_0 = "Women";
label mean_prevalence3034m_0 = "Men";
label o_prev3034w_phia = "Women PHIA";
label o_prev3034m_phia = "Men PHIA";
label o_prev3034w_dhs = "Women DHS";
label o_prev3034m_dhs = "Men DHS";

series  x=cald y=mean_prevalence3034w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence3034w_0 	upper=p95_prevalence3034w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence3034m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence3034m_0 	upper=p95_prevalence3034m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev3034w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev3034m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_prev3034w_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;
scatter  x=cald y=o_prev3034m_dhs/	markerattrs = (symbol=square color=orange  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 35-39)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label mean_prevalence3539w_0 = "Women";
label mean_prevalence3539m_0 = "Men";
label o_prev3539w_phia = "Women PHIA";
label o_prev3539m_phia = "Men PHIA";
label o_prev3539w_dhs = "Women DHS";
label o_prev3539m_dhs = "Men DHS";

series  x=cald y=mean_prevalence3539w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence3539w_0 	upper=p95_prevalence3539w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence3539m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence3539m_0 	upper=p95_prevalence3539m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev3539w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev3539m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_prev3539w_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;
scatter  x=cald y=o_prev3539m_dhs/	markerattrs = (symbol=square color=orange  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 40-44)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label mean_prevalence4044w_0 = "Women";
label mean_prevalence4044m_0 = "Men";
label o_prev4044w_phia = "Women PHIA";
label o_prev4044m_phia = "Men PHIA";
label o_prev4044w_dhs = "Women DHS";
label o_prev4044m_dhs = "Men DHS";

series  x=cald y=mean_prevalence4044w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence4044w_0 	upper=p95_prevalence4044w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence4044m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence4044m_0 	upper=p95_prevalence4044m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev4044w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev4044m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_prev4044w_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;
scatter  x=cald y=o_prev4044m_dhs/	markerattrs = (symbol=square color=orange  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 45-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label mean_prevalence4549w_0 = "Women";
label mean_prevalence4549m_0 = "Men";
label o_prev4549w_phia = "Women PHIA";
label o_prev4549m_phia = "Men PHIA";
label o_prev4549w_dhs = "Women DHS";
label o_prev4549m_dhs = "Men DHS";

series  x=cald y=mean_prevalence4549w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence4549w_0 	upper=p95_prevalence4549w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence4549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence4549m_0 	upper=p95_prevalence4549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev4549w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev4549m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_prev4549w_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;
scatter  x=cald y=o_prev4549m_dhs/	markerattrs = (symbol=square color=orange  size = 10) ;

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.05) valueattrs=(size=10);

label mean_incidence1549m_0 = "Model";
label o_Incid1549m_phia = "PHIA";

series  x=cald y=mean_incidence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_Incid1549m_phia / 		markerattrs = (symbol=square color=green size = 10);
run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label mean_incidence1549w_0 = "Option 0 (median) ";
label o_Incid1549m_phia = "PHIA";

series  x=cald y=mean_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_Incid1549w_phia / 		markerattrs = (symbol=square color=green size = 10);
run;quit;

/*

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_vlsupp_0 = "Model ";

series  x=cald y=mean_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_ep_0 = "Model ";

series  x=cald y=mean_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_newp_0 = "Model";

series  x=cald y=mean_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_primary_0 = "Option 0 (median) ";

series  x=cald y=mean_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_naive_0 = "Option 0 (median) ";

series  x=cald y=mean_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_diag_0 = "Option 0 (median) ";

series  x=cald y=mean_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label mean_mtct_prop_0 = "Option 0 (median) ";

series  x=cald y=mean_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of men with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_diag_m_0 = "Model";
label o_diag1564m_phia = "PHIA";
label o_diag1564_UNAIDS = "UNAIDS ALL";
label o_diag_NSPm = "NSP";

series  x=cald y=mean_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag1564m_phia / 		markerattrs = (symbol=square color=green size = 10);
scatter x=cald y=o_diag1564_UNAIDS / 		markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_diag_NSPm / 		markerattrs = (symbol=square color=orange size = 10);


run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of women with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_diag_w_0 = "Model ";
label o_diag1564w_phia = "PHIA";
label o_diag1564_UNAIDS = "UNAIDS ALL";
label o_diag_NSPw = "NSP";


series  x=cald y=mean_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag1564w_phia / 		markerattrs = (symbol=square color=green size = 10);
scatter x=cald y=o_diag1564_UNAIDS / 		markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_diag_NSPw / 		markerattrs = (symbol=square color=orange size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_diag_m_0 = "Model";
label o_diag_onart1564m_phia = "PHIA";

series  x=cald y=mean_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag_onart1564m_phia / 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_diag_w_0 = "Model";
label o_diag_onart1564w_phia = "PHIA";


series  x=cald y=mean_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag_onart1564w_phia / 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_vl1000_m_0 = "Model";
label o_art_vs1564m_phia = "PHIA";

series  x=cald y=mean_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_art_vs1564m_phia/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_vl1000_w_0 = "Model";
label o_art_vs1564w_phia = "PHIA";

series  x=cald y=mean_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_art_vs1564w_phia/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_vl1000__0 = "Option 0 (median) ";
label o_vs1564_UNAIDS = "UNAIDS";

series  x=cald y=mean_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_vs1564_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_vg1000__0 = "Option 0 (median) ";

series  x=cald y=mean_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.01) valueattrs=(size=10);

label mean_p_ai_no_arv_c_nnm_0 = "Model ";

series  x=cald y=mean_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_artexp_diag_0 = "Model";

series  x=cald y=mean_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


***LEAVE NUMBER GRAPHS UNTIL POPULATION IS BETTER FITTING;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number diagnosed with HIV this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 400000 by  50000) valueattrs=(size=10);

label mean_n_diagnosed_0 = "Option 0 (median) ";

series  x=cald y=mean_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 400000 by 100000) valueattrs=(size=10);

label mean_n_onart_0 = "Model";
label o_n_onart_UNAIDS = "UNAIDS";

series  x=cald y=mean_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label mean_n_onart_m_0 = "Model";
label o_n_onart_m_UNAIDS = "UNAIDS";

series  x=cald y=mean_n_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_m_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label mean_n_onart_w_0 = "Option 0 (median) ";
label o_n_onart_w_UNAIDS = "UNAIDS";

series  x=cald y=mean_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_w_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_efa_0 = "Option 0 (median) ";

series  x=cald y=mean_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_taz_0 = "Option 0 (median) ";

series  x=cald y=mean_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_ten_0 = "Option 0 (median) ";

series  x=cald y=mean_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_zdv_0 = "Option 0 (median) ";

series  x=cald y=mean_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_dol_0 = "Option 0 (median) ";
label o_p_dtg_nsp = "On DTG (NSP)";

series  x=cald y=mean_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_p_dtg_nsp/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_3TC_0 = "Option 0 (median) ";

series  x=cald y=mean_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_lpr_0 = "Option 0 (median) ";

series  x=cald y=mean_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_nev_0 = "Option 0 (median) ";

series  x=cald y=mean_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive people on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_0 = "Model";
label o_p_onart_nsp= "NSP";
series  x=cald y=mean_p_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_0 	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_p_onart_nsp/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_m_0 = "Model";
label o_onart15plus_m_UNAIDS = "UNAIDS";
series  x=cald y=mean_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_onart15plus_m_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_w_0 = "Model";
label o_onart15plus_w_UNAIDS = "UNAIDS";


series  x=cald y=mean_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_onart15plus_w_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "HIV Deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label mean_n_death_hiv_0 = "Option 0 (median) ";
label o_AIDSdeaths_UNAIDS = "AIDS deaths (UNAIDS)";

series  x=cald y=mean_n_death_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_AIDSdeaths_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);

label mean_n_cd4_lt200__0 = "Option 0 (median) ";

series  x=cald y=mean_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive1564_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by  100000) valueattrs=(size=10);
label mean_n_alive1564_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_n_alive1564_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive1564_msm_0 	upper=p95_n_alive1564_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

*scatter x=cald y = n_msm_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "prop_m_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage'		labelattrs=(size=12)  values = (0 to 0.02 by 0.005) valueattrs=(size=10);
label mean_prop_m_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_prop_m_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_m_msm_0 	upper=p95_prop_m_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_prop_msm/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;





proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence msm (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 20  by 1) valueattrs=(size=10);
label mean_incidence1564msm_0 = "Option 0 (mean) ";

series  x=cald y=mean_incidence1564msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564msm_0 	upper=p95_incidence1564msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence msm (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label mean_prevalence1549_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_prevalence1549_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549_msm_0 	upper=p95_prevalence1549_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_prev_msm/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label mean_prevalence_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_prevalence_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_pwid_0 	upper=p95_prevalence_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

*scatter x=cald y = prevalence_pwid_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_msm_infected_from_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_msm_infected_from_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_msm_infected_from_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_msm_infected_from_msm_0 	upper=p95_p_msm_infected_from_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_elig_prep_any_msm_1564_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_el_prep_any_msm_1564__0 = "Option 0 (median) ";

series  x=cald y=mean_p_el_prep_any_msm_1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_el_prep_any_msm_1564__0 	upper=p95_p_el_prep_any_msm_1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onprep_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_onprep_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_msm_0 	upper=p95_p_onprep_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_onart_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_msm_0 	upper=p95_p_onart_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_prevalence_vg1000_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_prevalence_vg1000_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000_msm_0 	upper=p95_prevalence_vg1000_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_diag_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_msm_0 	upper=p95_p_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_onart_diag_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_msm_0 	upper=p95_p_onart_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_onart_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_msm_0 	upper=p95_p_onart_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onart_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_pwid_0 	upper=p95_p_onart_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_onart_sw_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_sw_0 	upper=p95_p_onart_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onprep_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_onprep_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onprep_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_pwid_0 	upper=p95_p_onprep_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;  
	  	 

proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_art_gt6m_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_vl1000_art_gt6m_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_vl1000_art_gt6m_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000_art_gt6m_msm_0 	upper=p95_p_vl1000_art_gt6m_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_ever_tested_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_ever_tested_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_ever_tested_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ever_tested_msm_0 	upper=p95_p_ever_tested_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_this_period_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);
label mean_p_tested_this_period_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_tested_this_period_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_this_period_msm_0 	upper=p95_p_tested_this_period_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


/*
proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw55r_0 	upper=p95_logw55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
*/

ods rtf close;
ods listing;
run;



***CALIBRATION COMPARISON WITH OTHER MODELS;
***For output into Excel file;
libname a "C:\Users\loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\CdI";
data b;
set a.l_base_CdI_18Oct24a; 
s_sw_1549_ = s_sw_1549;

proc sort; by cald run ;run;
proc freq;table run;where cald=2022;run;

data y;
set b;

keep 
cald 	run		n_alive1549_		n_alive1549m  	n_alive1549w	prevalence1549_  prevalence1549m  	  prevalence1549w
n_newinf1549_	n_newinf1549m		n_newinf1549w	p_diag1549_		p_diag1549m		 p_diag1549w
p_onart_diag 	p_onart_diag_m 		p_onart_diag_w  p_onart_vl1000_	p_onart_vl1000_m p_onart_vl1000_w	  prop_w_1549_sw
prop_sw_hiv1549_  	p_mcirc			p_vmmc			p_trad_circ		n_death_hiv 	 n_death_hiv_m 		  n_death_hiv_w
n_hiv				n_hiv_m			n_hiv_w			prevalence1549_msm 	prop_m_msm	 incidence1549_per1000_	
incidence1549m_per1000_				incidence1549w_per1000_			n_onart			 n_onart_m			  n_onart_w		
;

run;

proc freq;table prevalence1549_msm;run;
proc sort data=y; by cald run ;run;
data y;set y;count_csim+1;by  cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=y;var count_csim cald;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 1008 ;
%let year_end = 2040 ;
proc sort;by cald ;run;




%macro var_d(v);
data one;set y;keep &v count_csim cald;
proc sort;by count_csim cald;
%let count=2000;
%do %while (&count le 2040);
***line below calculates means over calendar period;
proc means noprint data = one; var &v; output out = y_&count mean=&v._&count; by count_csim ; where &count <= cald < &count+1;
%let count = %eval(&count + 1);
%end;

data &v ;merge 
y_2000 y_2001 y_2002 y_2003 y_2004 y_2005 y_2006 y_2007 y_2008 y_2009 y_2010
	   y_2011 y_2012 y_2013 y_2014 y_2015 y_2016 y_2017 y_2018 y_2019 y_2020
	   y_2021 y_2022 y_2023 y_2024 y_2050 y_2026 y_2027 y_2028 y_2029 y_2030
	   y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040
   	 	;

drop _NAME_ _TYPE_ _FREQ_;run;
proc datasets nodetails nowarn nolist;

delete y_2000 y_2001 y_2002 y_2003 y_2004 y_2005 y_2006 y_2007 y_2008 y_2009 y_2010
	   		  y_2011 y_2012 y_2013 y_2014 y_2015 y_2016 y_2017 y_2018 y_2019 y_2020
	   		  y_2021 y_2022 y_2023 y_2024 y_2050 y_2026 y_2027 y_2028 y_2029 y_2030
	   		  y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040
   	   		  ;quit;

proc transpose data=&v out=l_&v prefix=&v;id  count_csim;run;
data l_&v;set l_&v;
cald= input(substr(_NAME_,length(_NAME_)-3,4),4.);drop _NAME_;run;

data l_&v;set l_&v;

*p95_&v = PCTL(95,of &v.1-&v.&nfit);
mean_&v = mean(of &v.1-&v.&nfit);
keep cald /*p5_&v p95_&v*/ mean_&v;

run;
proc datasets nodetails nowarn nolist;delete &v;run;
%mend var_d;

%var_d(n_alive1549_);		%var_d(n_alive1549m);  		%var_d(n_alive1549w);		%var_d(prevalence1549_);  
%var_d(prevalence1549m);	%var_d(prevalence1549w);	%var_d(n_newinf1549_);		%var_d(n_newinf1549m);	
%var_d(n_newinf1549w);		%var_d(p_diag1549_);		%var_d(p_diag1549m);		%var_d(p_diag1549w);	
%var_d(p_onart_diag); 		%var_d(p_onart_diag_m); 	%var_d(p_onart_diag_w);  	%var_d(p_onart_vl1000_);
%var_d(p_onart_vl1000_m);	%var_d(p_onart_vl1000_w);	%var_d(prop_w_1549_sw);		%var_d(prop_sw_hiv1549_);
%var_d(p_mcirc);			%var_d(p_vmmc);				%var_d(p_trad_circ);		%var_d(n_death_hiv);
%var_d(n_death_hiv_m);		%var_d(n_death_hiv_w);		%var_d(n_hiv);				%var_d(n_hiv_m);		
%var_d(n_hiv_w);			%var_d(prevalence1549_msm); %var_d(prop_m_msm);			%var_d(n_onart);		
%var_d(n_onart_m);			%var_d(n_onart_w);			%var_d(incidence1549_per1000_);  %var_d(incidence1549m_per1000_);
%var_d(incidence1549w_per1000_); 

data all;
merge 
l_n_alive1549m   	l_n_alive1549w 		l_n_alive1549_		l_prevalence1549m 	l_prevalence1549w 	l_prevalence1549_
l_n_newinf1549m 	l_n_newinf1549w 	l_n_newinf1549_ 	l_p_diag1549m 		l_p_diag1549w		l_p_diag1549_ 
l_p_onart_diag_m  	l_p_onart_diag_w 	l_p_onart_diag  	l_p_onart_vl1000_m 	l_p_onart_vl1000_w  l_p_onart_vl1000_ 
l_prop_w_1549_sw 	l_prop_sw_hiv1549_ 	l_p_mcirc 			l_p_vmmc 			l_p_trad_circ 		
l_n_death_hiv_m		l_n_death_hiv_w		l_n_death_hiv 		l_n_hiv_m			l_n_hiv_w			l_n_hiv l_prevalence1549_msm 
l_prop_m_msm		l_incidence1549m_per1000_ 				l_incidence1549w_per1000_  				l_incidence1549_per1000_ 
l_n_onart ;run;

*ods results off;

ods excel file="C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\WHO Ivory Coast\comparison18oct.xlsx";
options(sheet_name='base1' start_at='A2');
proc print data=all noobs;run;
