

***INSERT FILE EXPLORER PATH WHERE OUTPUT FILES ARE KEPT (USUALLY ON TLO HMC DROPBOX);
libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\future_incidence\";
libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\future_incidence\core3_out\";

ods html close;

data a;
set b.out:; ***INSERT OUTPUT FILENAME; 



proc sort;
by run cald option;run;


***THIS DATASTEP CALCUATES THE SCALE FACTOR;
data sf;
set a;

if cald=2024; ***Update as required;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = 10000000 / s_alive; ***If calibrating to a specific setting, change 10000000 to desired 15+ population size;
keep run sf_2023;
proc sort; by run;run;


%let sf=sf_2023;


data y; 
merge a sf;
by run ;

* preparatory code ;


* ================================================================================= ;

* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from start of intervention - no adjustment needed;

%let year_start_disc=2023;
*discount_3py = 1/(1.03**(cald-&year_start_disc)); ***This is already calculated in HIV Synthesis;
discount_5py = 1/(1.05**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;

* ================================================================================= ;

* dalys and life years;

* ================================================================================= ;

ly = s_ly * &sf;  *life years;
dly = s_dly * &sf; *discounted life years;



* ##############################;

s_ddaly = s_dead_ddaly + (s_live_ddaly * 1.5 );

* ##############################;



***Scaling up to annual discounted DALYs in the whole population;
ddaly = s_ddaly * &sf * 4;


***These are additional potential DALYs to include which have not so far been included;

ddaly_mtct = s_ddaly_mtct * &sf * 4;  ***Crude estimate of number of DALYs incurred in a child born with HIV;


* ================================================================================= ;

* costs ;

* ================================================================================= ;
* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

***These are scaled up discounted costs;
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

***Vaginal ring cost will also needed to be added here when used in HIV Synthesis;
s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_inj;
s_dcost_prep_visit = s_dcost_prep_visit_oral + s_dcost_prep_visit_inj;

dvis_cost = s_dvis_cost * &sf * 4 / 1000;
dart_cost = s_dart_cost * &sf * 4 / 1000; ***This should be the same as dart_cost_y below (and is not used);
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
dcost_prep_ac_adh = s_dcost_prep_ac_adh * &sf * 4 / 1000; ***PrEP cost taking into account adherence to PrEP;
dcost_sw_program = s_dcost_sw_program  * &sf * 4 / 1000; 
dcost_avail_self_test = 0;
dcost_community_outreach = s_dcost_community_outreach * &sf * 4 / 1000 ;

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; 

dclin_cost = dadc_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost;

dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;



***Will need to add the cost of VG when included in HIV Synthesis;
dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj + 
		dcost_sw_program ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost +
				  dres_cost + d_t_adh_int_cost + dswitchline_cost; 

***This reverses the discount (if needed);
cost_clin_care = dcost_clin_care / discount;

cost = dcost / discount;


* ================================================================================= ;
* ================================================================================= ;


***ADD PROJECT SPECIFIC VARIABLES HERE;


***Preparing code;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 

s_hiv1524m = s_hiv1519m + s_hiv2024m ;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;

s_hiv = s_hivge15 ;

* n_undiag;						n_undiag = (s_hiv - s_diag) * &sf ;
* n_hiv;						n_hiv = s_hiv * &sf ;
* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;

* n_tested;						n_tested = s_tested * &sf * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;
* n_prep_any;					n_prep_any = s_prep_any * &sf;
* n_prep_inj;					n_prep_inj = s_prep_inj * &sf;

***general population- key outputs;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* n_onart;						n_onart = s_onart_iicu * &sf ;

* p_adhav_hi_onart;				p_adhav_hi_onart = s_adhav_hi_onart / s_onart ;

* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* n_alive;						n_alive = (s_alive_m + s_alive_w) * &sf ;

* p_dol;						p_dol = s_dol / s_onart;
* p_efa;						p_efa = s_efa / s_onart;
* p_onart;						p_onart = s_onart_iicu / s_hiv;
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* n_vg1000          ;			n_vg1000 = s_vg1000 * &sf ;
* n_vg1000_np ;					n_vg1000_np = s_vg1000_np * &sf ;
* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* incidence_sw;					incidence_sw = (s_primary_sw * 4 * 100) / s_sw_1549 ; 

* prop_inf_w_sw;				if s_primary1549w > 0 then prop_inf_w_sw = s_primary_sw /	s_primary1549w ;

* n_death_hiv;					n_death_hiv = s_death_hiv  * 4* &sf;
* n_dead_all;					n_dead_all = s_dead_all * 4 * &sf;

* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prop_m_vlg1; 					prop_m_vlg1 = s_prop_m_vlg1 ;
* prop_m_vlg2; 					prop_m_vlg2 = s_prop_m_vlg2 ;
* prop_m_vlg3; 					prop_m_vlg3 = s_prop_m_vlg3 ;
* prop_m_vlg4; 					prop_m_vlg4 = s_prop_m_vlg4 ;
* prop_m_vlg5; 					prop_m_vlg5 = s_prop_m_vlg5 ;
* prop_m_vlg6; 					prop_m_vlg6 = s_prop_m_vlg6 ;

* prop_w_vlg1; 					prop_w_vlg1 = s_prop_w_vlg1 ;
* prop_w_vlg2; 					prop_w_vlg2 = s_prop_w_vlg2 ;
* prop_w_vlg3; 					prop_w_vlg3 = s_prop_w_vlg3 ;
* prop_w_vlg4; 					prop_w_vlg4 = s_prop_w_vlg4 ;
* prop_w_vlg5; 					prop_w_vlg5 = s_prop_w_vlg5 ;
* prop_w_vlg6; 					prop_w_vlg6 = s_prop_w_vlg6 ;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;

***ADD PROJECT SPECIFIC OUTPUTS HERE;



keep run option cald p_onart  p_adhav_hi_onart  p_dol  p_efa  n_undiag  n_onart
prevalence1549m 	 prevalence1549w 	prevalence1549 		incidence1549 		incidence1549w 		incidence1549m  incidence_sw n_tested n_prep_any
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000 			p_vl1000 			prevalence_vg1000  n_vg1000
dcost cost ddaly   n_death_hiv  p_onart_vl1000   n_alive   p_mcirc n_undiag  n_hiv  prop_inf_w_sw  n_vg1000_np
p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary test_prop_positive p_diag_sw  p_onart_diag_sw  p_onart_vl1000_sw  n_prep_inj
prop_m_vlg1  prop_m_vlg2  prop_m_vlg3  prop_m_vlg4  prop_m_vlg5 prop_m_vlg6 
prop_w_vlg1  prop_w_vlg2  prop_w_vlg3  prop_w_vlg4  prop_w_vlg5 prop_w_vlg6
n_dead_all  prop_w_1549_sw p_newp_ge1_age1549
dart_cost  
 dadc_cost  dcd4_cost  dvl_cost  dvis_cost  dnon_tb_who3_cost  dcot_cost  dtb_cost  dres_cost 
		dtest_cost  d_t_adh_int_cost  dswitchline_cost  dcost_drug_level_test  dcost_circ  dcost_condom_dn 
		 dcost_avail_self_test  dcost_prep_visit_oral  dcost_prep_oral  dcost_prep_visit_inj  dcost_prep_inj  
		dcost_sw_program dcost_community_outreach

sw_art_disadv		sw_program			effect_sw_prog_newp			effect_sw_prog_6mtest	
effect_sw_prog_int	effect_sw_prog_adh	effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti
sw_trans_matrix
rate_exp_set_lower_p_vl1000 tr_rate_undetec_vl 

sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w   p_rred_p  p_hsb_p  rred_initial newp_factor 
fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep prop_redattr_sbcc
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti tr_rate_undetec_vl super_infection_pop  an_lin_incr_test  date_test_rate_plateau  
rate_anc_inc prob_test_2ndtrim prob_test_postdel incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice rate_ch_art_init_str_4 rate_ch_art_init_str_9   red_int_risk_poc_vl
rate_ch_art_init_str_10 rate_ch_art_init_str_3 clinic_not_aw_int_frac  reg_option_104  ind_effect_art_hiv_disease_death incr_adh_poc_vl 
res_trans_factor_nn res_trans_factor_ii rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_non_tb_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
rate_test_startprep_any   rate_choose_stop_prep_oral prob_prep_oral_b circ_inc_rate  circ_inc_15_19  circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_any_restart_choice  add_prep_any_uptake_sw  cd4_monitoring   base_rate_stop_sexwork    rred_a_p  higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child  nnrti_res_no_effect  double_rate_gas_tox_taz   incr_mort_risk_dol_weightg 
greater_disability_tox 	  greater_tox_zdv 	 rel_dol_tox  dol_higher_potency  prop_bmi_ge23 pr_res_dol cab_time_to_lower_threshold_g
ntd_risk_dol  oth_dol_adv_birth_e_risk  zdv_potency_p75  death_r_iris_pop_wide_tld
sw_program    sw_higher_int  rel_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
sw_init_newp sw_trans_matrix  p_rred_sw_newp  effect_sw_prog_newp   
effect_sw_prog_6mtest effect_sw_prog_int effect_sw_prog_pers_sti effect_sw_prog_adh  effect_sw_prog_lossdiag effect_sw_prog_prep_any
sw_art_disadv prep_dependent_prev_vg1000

/*ADD PROJECT SPECIFIC OUTPUTS HERE*/;
;





data a.core_l; set y;



proc sort data=y;by run option;run;


options nomprint;
option nospool;


***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

***OUTPUTS IN SPECIFIC YEARS - AMEND TO E.G. PROJECT SPECIFIC BASELINE (NOTE THESE ARE NOT BY OPTION);
proc means  noprint data=y; var &v; output out=y_23 mean= &v._23; by run; where 2023.0 <= cald < 2024.0; 

***OUTPUTS IN SPECIFIC YEARS BY OPTION - THIS MAY NOT BE NEEDED IN ALL ANALYSES;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option; where 2029.0 <= cald < 2030.25; 
proc means noprint data=y; var &v; output out=y_43 mean= &v._43; by run option; where 2043.0 <= cald < 2044.00; 

***OUTPUTS FOR CE ANALYSES OVER 5, 20 AND 50 years BY OPTION;
proc means noprint data=y; var &v; output out=y_24_28 mean= &v._24_28; by run option ; where 2024.0 <= cald < 2028.50;
proc means noprint data=y; var &v; output out=y_24_30 mean= &v._24_30; by run option ; where 2024.0 <= cald < 2030.50;
proc means noprint data=y; var &v; output out=y_24_43 mean= &v._24_43; by run option ; where 2024.0 <= cald < 2043.50;
proc means noprint data=y; var &v; output out=y_24_73 mean= &v._24_73; by run option ; where 2024.0 <= cald < 2073.50;

***SORT OUTPUT DATASETS BY RUN BEFORE MERGING;
proc sort data=y_23; by run; proc transpose data=y_23 out=t_22 prefix=&v._24_; var &v._23; by run;
proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;
proc sort data=y_43; by run; proc transpose data=y_43 out=t_43 prefix=&v._43_; var &v._43; by run;
proc sort data=y_24_28; by run; proc transpose data=y_24_28 out=t_24_28 prefix=&v._24_28_; var &v._24_28; by run;
proc sort data=y_24_30; by run; proc transpose data=y_24_30 out=t_24_30 prefix=&v._24_30_; var &v._24_30; by run;
proc sort data=y_24_43; by run; proc transpose data=y_24_43 out=t_24_43 prefix=&v._24_43_; var &v._24_43; by run;
proc sort data=y_24_73; by run; proc transpose data=y_24_73 out=t_24_73 prefix=&v._24_73_; var &v._24_73; by run;

***MERGE TOGETHER SO THE DATASET NOW CONTAINS MEANS OVER SPECIFIED PERIODS;
data &v ; merge  y_23 t_30 t_43 t_24_28 t_24_30 t_24_43 t_24_73;  


***THIS MACRO CALCULATES THE MEANS OVER PERIOD AT EACH OF THE SPECIFIED TIME PERIODS ABOVE ANS STORES THESE IN INDIVIDUAL DATASETS;
%mend var;


%var(v=p_diag);	 		%var(v=p_diag_m);	%var(v=p_onart); 	%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000);		%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);  %var(v=n_hiv);  %var(v=prop_inf_w_sw);
%var(v=p_vg1000); 		%var(v=p_vl1000);	%var(v=n_vg1000);  %var(v=p_inf_naive);  %var(v=n_undiag); %var(v=p_inf_diag); %var(v=p_inf_primary);
		%var(v=prevalence_vg1000);  %var(v=n_undiag); %var(v=p_mcirc);  %var(v=n_prep_any);
%var(v=p_mcirc);  %var(v= prop_w_1549_sw );  %var(v=n_vg1000_np);  %var(v=n_onart);
%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549); 	
%var(v=incidence1549); 	%var(v=incidence1549w); 	%var(v=incidence1549m);
%var(v=dcost);	%var(v=cost); 		%var(v=ddaly);   %var(v=n_death_hiv);   %var(v=n_dead_all);  %var(v=p_newp_ge1_age1549);
 %var(v=dart_cost);  %var(v=dadc_cost);  %var(v=dcd4_cost);  %var(v=dvl_cost);  %var(v=dvis_cost);  %var(v=dnon_tb_who3_cost);  %var(v=dcot_cost);  %var(v=dtb_cost);
  %var(v=dres_cost); 
		%var(v=dtest_cost);  %var(v=d_t_adh_int_cost);  %var(v=dswitchline_cost);  %var(v=dcost_drug_level_test);  %var(v=dcost_circ);  
%var(v=dcost_condom_dn); 
		 %var(v=dcost_avail_self_test);  %var(v=dcost_prep_visit_oral);  %var(v=dcost_prep_oral);  %var(v=dcost_prep_visit_inj);  %var(v=dcost_prep_inj);  
		%var(v=dcost_sw_program); %var(v=dcost_community_outreach);

*/ADD IN PROJECT SPECIFIC OUTPUTS/*;

run;


***MERGE THE DATASETS CREATED ABOVE INTO ONE DATASET;
data wide_outputs;merge   p_onart
p_diag	 		p_diag_m	 	p_onart	p_diag_w   			p_onart_diag  	p_onart_diag_w  n_undiag  n_onart
p_onart_diag_m 	p_onart_vl1000		p_onart_vl1000_w   	p_onart_vl1000_m  n_vg1000 p_newp_ge1_age1549
p_vg1000 		p_vl1000  cost			prevalence_vg1000  p_mcirc  p_inf_naive   prop_w_1549_sw  n_vg1000_np
prevalence1549m	prevalence1549w 	prevalence1549 		incidence1549 	incidence1549w 	incidence1549m
dcost			ddaly   n_death_hiv  n_prep_any   n_dead_all  prop_inf_w_sw  p_inf_diag p_inf_primary 
dart_cost  dadc_cost  dcd4_cost  dvl_cost  dvis_cost  dnon_tb_who3_cost  dcot_cost  dtb_cost  dres_cost 
		dtest_cost  d_t_adh_int_cost  dswitchline_cost  dcost_drug_level_test  dcost_circ  dcost_condom_dn 
		 dcost_avail_self_test  dcost_prep_visit_oral  dcost_prep_oral  dcost_prep_visit_inj  dcost_prep_inj  
		dcost_sw_program  dcost_community_outreach
/*ADD IN PROJECT SPECIFIC OUTPUTS*/
;


proc sort; by run;run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2022.5; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

/*ADD PROJECT SPECIFIC PARAMETERS OF INTEREST*/
%par(p=sw_art_disadv);		%par(p=sw_program);			%par(p=effect_sw_prog_newp);	%par(p=effect_sw_prog_6mtest);	
%par(p=effect_sw_prog_int);	%par(p=effect_sw_prog_adh);	%par(p=effect_sw_prog_lossdiag);%par(p=effect_sw_prog_prep_any);
%par(p=effect_sw_prog_pers_sti); %par(p=sw_trans_matrix);  	%par(p=rate_exp_set_lower_p_vl1000); 	%par(p=tr_rate_undetec_vl);

%par(p=sex_beh_trans_matrix_m); %par(p=sex_beh_trans_matrix_w);  %par(p=sex_age_mixing_matrix_m); %par(p=sex_age_mixing_matrix_w );
%par(p=p_rred_p);  %par(p=p_hsb_p);  %par(p=rred_initial);  %par(p=newp_factor); %par(p=fold_tr_newp);
%par(p=eprate);  %par(p=conc_ep);  %par(p=ch_risk_diag);  %par(p=ch_risk_diag_newp);  %par(p=ych_risk_beh_newp);  %par(p=ych2_risk_beh_newp);
%par(p=ych_risk_beh_ep);  %par(p=prop_redattr_sbcc);
%par(p=exp_setting_lower_p_vl1000);  %par(p=external_exp_factor);  %par(p=rate_exp_set_lower_p_vl1000);  %par(p=prob_pregnancy_base); 
%par(p=fold_change_w);  %par(p=fold_change_yw);  %par(p=fold_change_sti); %par(p=tr_rate_undetec_vl); %par(p= super_infection_pop);  
%par(p=an_lin_incr_test);  %par(p=date_test_rate_plateau); %par(p=rate_anc_inc);  %par(p=prob_test_2ndtrim); %par(p=prob_test_postdel); 
%par(p=incr_test_rate_sympt);  %par(p=max_freq_testing);  %par(p=test_targeting);  %par(p=fx);  %par(p=gx); %par(p=adh_pattern);  
%par(p=prob_loss_at_diag);  %par(p=pr_art_init);  %par(p=rate_lost);  %par(p=prob_lost_art);  %par(p=rate_return);  %par(p=rate_restart);  
%par(p=rate_int_choice); %par(p=rate_ch_art_init_str_4); %par(p=rate_ch_art_init_str_9);   %par(p=red_int_risk_poc_vl);
%par(p=rate_ch_art_init_str_10); %par(p=rate_ch_art_init_str_3); %par(p=clinic_not_aw_int_frac);  %par(p=reg_option_104);  
%par(p=ind_effect_art_hiv_disease_death); %par(p=incr_adh_poc_vl); %par(p=res_trans_factor_nn);  %par(p=res_trans_factor_ii); 
%par(p=rate_loss_persistence);  %par(p=incr_rate_int_low_adh);  %par(p=poorer_cd4rise_fail_nn);  
%par(p=poorer_cd4rise_fail_ii);  %par(p=rate_res_ten);  %par(p=fold_change_mut_risk);  %par(p=adh_effect_of_meas_alert);  %par(p=pr_switch_line);  
%par(p=prob_vl_meas_done);  %par(p=red_adh_tb_adc);  %par(p=red_adh_tox_pop);  %par(p=red_adh_multi_pill_pop); %par(p=add_eff_adh_nnrti);  
%par(p=altered_adh_sec_line_pop);  %par(p=prob_return_adc);  %par(p=prob_lossdiag_adctb);  %par(p=prob_lossdiag_non_tb_who3e);  
%par(p=higher_newp_less_engagement);  %par(p=fold_tr);  %par(p=switch_for_tox); %par(p=rate_test_startprep_any);  %par(p=rate_choose_stop_prep_oral); 
%par(p=prob_prep_oral_b); %par(p=circ_inc_rate);  %par(p=circ_inc_15_19);  %par(p=circ_red_20_30);  %par(p=circ_red_30_50); %par(p=p_hard_reach_w);  
%par(p=hard_reach_higher_in_men);  %par(p=p_hard_reach_m);  %par(p=inc_cat);   %par(p=base_rate_sw);  %par(p=prob_prep_any_restart_choice);  
%par(p=add_prep_any_uptake_sw);  %par(p=cd4_monitoring);   %par(p=base_rate_stop_sexwork);    %par(p=rred_a_p);  %par(p=higher_newp_with_lower_adhav);
%par(p=rr_int_tox);   %par(p=rate_birth_with_infected_child);  %par(p=nnrti_res_no_effect);  %par(p=double_rate_gas_tox_taz);   
%par(p=incr_mort_risk_dol_weightg); %par(p=greater_disability_tox); %par(p=  greater_tox_zdv); 	%par(p= rel_dol_tox); %par(p= dol_higher_potency);  
%par(p=prop_bmi_ge23); %par(p= pr_res_dol); %par(p= cab_time_to_lower_threshold_g); %par(p=ntd_risk_dol); %par(p=  oth_dol_adv_birth_e_risk ); 
%par(p=zdv_potency_p75);  %par(p=death_r_iris_pop_wide_tld); %par(p=sw_program)  %par(p=  sw_higher_int); %par(p= rel_sw_lower_adh ); 
%par(p=sw_higher_prob_loss_at_diag);  %par(p=rate_engage_sw_program); %par(p=rate_disengage_sw_program); %par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=p_rred_sw_newp);  %par(p=effect_sw_prog_newp);  %par(p=effect_sw_prog_6mtest);  %par(p= effect_sw_prog_int); %par(p= effect_sw_prog_pers_sti);
%par(p= effect_sw_prog_adh);  %par(p=effect_sw_prog_lossdiag); %par(p=effect_sw_prog_prep_any); %par(p=sw_art_disadv);


data wide_par; merge 
sw_art_disadv		sw_program			effect_sw_prog_newp			effect_sw_prog_6mtest	
effect_sw_prog_int	effect_sw_prog_adh	effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti
sw_trans_matrix rate_exp_set_lower_p_vl1000 tr_rate_undetec_vl


sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  sex_age_mixing_matrix_m sex_age_mixing_matrix_w   p_rred_p  p_hsb_p  rred_initial newp_factor 
fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep prop_redattr_sbcc
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti tr_rate_undetec_vl super_infection_pop  an_lin_incr_test  date_test_rate_plateau  
rate_anc_inc prob_test_2ndtrim prob_test_postdel incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice rate_ch_art_init_str_4 rate_ch_art_init_str_9   red_int_risk_poc_vl
rate_ch_art_init_str_10 rate_ch_art_init_str_3 clinic_not_aw_int_frac  reg_option_104  ind_effect_art_hiv_disease_death incr_adh_poc_vl 
res_trans_factor_nn res_trans_factor_ii rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_non_tb_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
rate_test_startprep_any   rate_choose_stop_prep_oral prob_prep_oral_b circ_inc_rate  circ_inc_15_19  circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_any_restart_choice  add_prep_any_uptake_sw  cd4_monitoring   base_rate_stop_sexwork    rred_a_p  higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child  nnrti_res_no_effect  double_rate_gas_tox_taz   incr_mort_risk_dol_weightg 
greater_disability_tox 	  greater_tox_zdv 	 rel_dol_tox  dol_higher_potency  prop_bmi_ge23 pr_res_dol cab_time_to_lower_threshold_g
ntd_risk_dol  oth_dol_adv_birth_e_risk  zdv_potency_p75  death_r_iris_pop_wide_tld
sw_program    sw_higher_int  rel_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
sw_init_newp sw_trans_matrix  p_rred_sw_newp  effect_sw_prog_newp   
effect_sw_prog_6mtest effect_sw_prog_int effect_sw_prog_pers_sti effect_sw_prog_adh  effect_sw_prog_lossdiag effect_sw_prog_prep_any
sw_art_disadv




  ;
;proc sort; by run;run;



***SAVE DATASET READY FOR ANALYSIS;
data a.wide_core;
merge   wide_outputs  wide_par ;  
by run;

r_incidence_23_43 = incidence1549_43_1 / incidence1549_23 ;


proc contents data=a.wide_core; run; 

proc univariate data=a.core;
var p_diag_w_23 p_diag_m_23; 
run;







proc glm ; 
class 

sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  p_rred_p  p_hsb_p  rred_initial newp_factor fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep prop_redattr_sbcc
exp_setting_lower_p_vl1000  
fold_change_w  fold_change_yw  fold_change_sti tr_rate_undetec_vl super_infection_pop  an_lin_incr_test  date_test_rate_plateau  
rate_anc_inc prob_test_2ndtrim prob_test_postdel incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice rate_ch_art_init_str_4 rate_ch_art_init_str_9   red_int_risk_poc_vl
rate_ch_art_init_str_10 rate_ch_art_init_str_3 clinic_not_aw_int_frac  reg_option_104  ind_effect_art_hiv_disease_death incr_adh_poc_vl 
res_trans_factor_nn res_trans_factor_ii rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_non_tb_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
rate_test_startprep_any   rate_choose_stop_prep_oral prob_prep_oral_b circ_inc_rate  circ_inc_15_19  circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_any_restart_choice  add_prep_any_uptake_sw  cd4_monitoring   base_rate_stop_sexwork    rred_a_p  higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child  nnrti_res_no_effect  double_rate_gas_tox_taz   incr_mort_risk_dol_weightg 
greater_disability_tox 	  greater_tox_zdv 	 rel_dol_tox  dol_higher_potency  prop_bmi_ge23 pr_res_dol cab_time_to_lower_threshold_g
ntd_risk_dol  oth_dol_adv_birth_e_risk  zdv_potency_p75  death_r_iris_pop_wide_tld
sw_program    sw_higher_int  rel_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
sw_init_newp sw_trans_matrix  p_rred_sw_newp  effect_sw_prog_newp   
effect_sw_prog_6mtest effect_sw_prog_int effect_sw_prog_pers_sti effect_sw_prog_adh  effect_sw_prog_lossdiag effect_sw_prog_prep_any
sw_art_disadv 
;
model r_incidence_23_43 =
  
sex_beh_trans_matrix_m  sex_beh_trans_matrix_w  p_rred_p  p_hsb_p  rred_initial newp_factor fold_tr_newp
eprate  conc_ep  ch_risk_diag  ch_risk_diag_newp  ych_risk_beh_newp  ych2_risk_beh_newp  ych_risk_beh_ep prop_redattr_sbcc
exp_setting_lower_p_vl1000  external_exp_factor  rate_exp_set_lower_p_vl1000  prob_pregnancy_base 
fold_change_w  fold_change_yw  fold_change_sti tr_rate_undetec_vl super_infection_pop  an_lin_incr_test  date_test_rate_plateau  
rate_anc_inc prob_test_2ndtrim prob_test_postdel incr_test_rate_sympt  max_freq_testing  test_targeting  fx  gx adh_pattern  prob_loss_at_diag  
pr_art_init  rate_lost  prob_lost_art  rate_return  rate_restart  rate_int_choice rate_ch_art_init_str_4 rate_ch_art_init_str_9   red_int_risk_poc_vl
rate_ch_art_init_str_10 rate_ch_art_init_str_3 clinic_not_aw_int_frac  reg_option_104  ind_effect_art_hiv_disease_death incr_adh_poc_vl 
res_trans_factor_nn res_trans_factor_ii rate_loss_persistence  incr_rate_int_low_adh  poorer_cd4rise_fail_nn  
poorer_cd4rise_fail_ii  rate_res_ten  fold_change_mut_risk  adh_effect_of_meas_alert  pr_switch_line  
prob_vl_meas_done  red_adh_tb_adc  red_adh_tox_pop  red_adh_multi_pill_pop add_eff_adh_nnrti  altered_adh_sec_line_pop  prob_return_adc  
prob_lossdiag_adctb  prob_lossdiag_non_tb_who3e  higher_newp_less_engagement  fold_tr  switch_for_tox 
rate_test_startprep_any   rate_choose_stop_prep_oral prob_prep_oral_b circ_inc_rate  circ_inc_15_19  circ_red_20_30  circ_red_30_50
p_hard_reach_w  hard_reach_higher_in_men  p_hard_reach_m  inc_cat   base_rate_sw 
prob_prep_any_restart_choice  add_prep_any_uptake_sw  cd4_monitoring   base_rate_stop_sexwork    rred_a_p  higher_newp_with_lower_adhav
rr_int_tox   rate_birth_with_infected_child  nnrti_res_no_effect  double_rate_gas_tox_taz   incr_mort_risk_dol_weightg 
greater_disability_tox 	  greater_tox_zdv 	 rel_dol_tox  dol_higher_potency  prop_bmi_ge23 pr_res_dol cab_time_to_lower_threshold_g
ntd_risk_dol  oth_dol_adv_birth_e_risk  zdv_potency_p75  death_r_iris_pop_wide_tld
sw_program    sw_higher_int  rel_sw_lower_adh  sw_higher_prob_loss_at_diag  rate_engage_sw_program rate_disengage_sw_program 
sw_init_newp sw_trans_matrix  p_rred_sw_newp  effect_sw_prog_newp   
effect_sw_prog_6mtest effect_sw_prog_int effect_sw_prog_pers_sti effect_sw_prog_adh  effect_sw_prog_lossdiag effect_sw_prog_prep_any
sw_art_disadv 

/ solution;
run;






proc glm ; 

  model r_incidence_23_43 =

prop_w_1549_sw_23  incidence1549_23

/ solution;
run;



