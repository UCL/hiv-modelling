*** THIS FILE READS IN THE MULTIPLE OUTPUT FILES (CREATED FROM RUNNING 'HIV_SYNTHESIS_FSW_ZIM' PROGRAM MULTIPLE TIMES) TO 
CREATE A WIDE FILE WITH MEANS OF KEY OUTPUTS IN SPECIFIC TIME PERIODS; 

***SPECIFY LIBRARY 'A' WHICH IS THE FILEPATH WHERE OUTPUT FILES ARE STORED;
***REPLACE FILEPATH BELOW WITH LOCAL FILEPATH;
libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\PACE2\";


***READ IN OUTPUT FILES (NOTE THE MULTIPLE OUTPUT FILES NEED TO BE SET ON TOP OF EACH OTHER BEFORE THIS STEP 
   IF NOT AUTOMATICALLY DONE IN MYRIAD);

data a;
set a.pace_29Jun26;
if run=. then delete; 
proc sort;by run cald option;run;
proc freq;table cald;run;


***SCALE UP SIMULATED POPULATION TO ZIMBABWE;
data sf;
set a;
if cald=2024.5;

s_alive = s_alive_m + s_alive_w ;
sf_2024 = (16665409 * 0.581) / s_alive; 
*Source for Zimbabwe population is https://population.un.org/dataportal/data/indicators/49/locations/716/start/1990/end/2023/line/linetimeplot;
*accessed 22/1/2024;
* 58.1% of Zim population in 2020 >= age 15. Source: https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=ZW accessed 6/9/2021;

sf=sf_2024;
keep run sf_2024 sf;
proc sort; by run;run;



***APPLY SCALE FACTOR AND CALCULATE KEY EPIDEMIC METRICS INCLUDING COSTS AND DALYS;
data y;
merge a sf;

by run;


* preparatory code for dalys, costs and key epidemic outputs ;
* ================================================================================= ;

* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from start of intervention - no adjustment needed;

%let year_start_disc=2023;
discount_3py = 1/(1.03**(cald-&year_start_disc)); ***This is already calculated in HIV Synthesis;
discount_5py = 1/(1.05**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;

* ================================================================================= ;

* dalys and life years;

* ================================================================================= ;

s_ddaly = s_dead_ddaly + s_live_ddaly;

***Scaling up to annual discounted DALYs in the whole population;
ddaly = s_ddaly * sf * 4;


***These are additional potential DALYs to include which have not so far been included;

ddaly_mtct = s_ddaly_mtct * sf * 4;  ***Crude estimate of number of DALYs incurred in a child born with HIV;


* ================================================================================= ;

* costs ;

* ================================================================================= ;
* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

***These are scaled up discounted costs;
dzdv_cost = s_dcost_zdv * sf * 4 / 1000;
dten_cost = s_dcost_ten * sf * 4 / 1000;
d3tc_cost = s_dcost_3tc * sf * 4 / 1000; 
dnev_cost = s_dcost_nev * sf * 4 / 1000;
dlpr_cost = s_dcost_lpr * sf * 4 / 1000;
ddar_cost = s_dcost_dar * sf * 4 / 1000;
dtaz_cost = s_dcost_taz * sf * 4 / 1000;
defa_cost = s_dcost_efa * sf * 4 / 1000;
ddol_cost = s_dcost_dol * sf * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_prep_oral=. then s_dcost_prep_oral=0;
if s_dcost_prep_cab=. then s_dcost_prep_cab=0;
if s_dcost_prep_len=. then s_dcost_prep_len=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

***Vaginal ring cost will also needed to be added here when used in HIV Synthesis;
s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_cab + s_dcost_prep_len;
s_dcost_prep_visit = s_dcost_prep_visit_oral + s_dcost_prep_visit_cab + s_dcost_prep_visit_len;

dvis_cost = s_dvis_cost * sf * 4 / 1000;
dart_cost = s_dart_cost * sf * 4 / 1000; ***This should be the same as dart_cost_y below (and is not used);
dvl_cost = s_dvl_cost * sf * 4 / 1000;
dcd4_cost = s_dcd4_cost * sf * 4 / 1000;
dadc_cost = s_dadc_cost * sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost * sf * 4 / 1000;
dtb_cost = s_dtb_cost * sf * 4 / 1000;
dtest_cost = s_dtest_cost * sf * 4 / 1000;
dcot_cost = s_dcot_cost * sf * 4 / 1000;
dres_cost = s_dres_cost * sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf * 4 / 1000;  
dcost_prep = s_dcost_prep * sf * 4 / 1000; 
dcost_prep_cab = s_dcost_prep_cab * sf * 4 / 1000; 
dcost_prep_len = s_dcost_prep_len * sf * 4 / 1000; 
dcost_prep_oral = s_dcost_prep_oral * sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf * 4 / 1000; 	
dcost_prep_visit_cab  = s_dcost_prep_visit_cab * sf * 4 / 1000; 	
dcost_prep_visit_len  = s_dcost_prep_visit_len * sf * 4 / 1000; 	
dcost_prep_visit_oral  = s_dcost_prep_visit_oral * sf * 4 / 1000; 	 
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf * 4 / 1000; ***PrEP cost taking into account adherence to PrEP;
dcost_sw_program = s_dcost_sw_program  * sf * 4 / 1000; 
dcost_avail_self_test = dcost_avail_self_test * sf * 4/1000;


dfullvis_cost = s_dfull_vis_cost * sf * 4 / 1000;
dcost_circ = s_dcost_circ * sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * sf * 4 / 1000; 

dclin_cost = dadc_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost;

dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost +
				  dres_cost + d_t_adh_int_cost + dswitchline_cost; 


***Assuming a cost of $132 per SW (Email Ccommunication from CeSSHAR health economist Collin 11Feb2025) in Sisters and 155 in AMETHIST per year;


***total cost with Sisters;
if option in (0,1) then do;
	cost_sis_perSW=0.000132;
	s_cost_sisprog_ = cost_sis_perSW * s_sw_program_visit;
	dcost_sisprog_ = s_cost_sisprog_ * &discount *sf;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_cab + dcost_prep_cab + 
		dcost_prep_visit_len + dcost_prep_len + dcost_sisprog_;


end;

/*
***total cost with Amethist;
if option=1 then do;
	cost_amt_perSW=0.000155;
	s_cost_amtprog_ = cost_amt_perSW * s_sw_program_visit;
	dcost_amtprog_ = s_cost_amtprog_ * &discount *sf;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_cab + dcost_prep_cab + 
		dcost_prep_visit_len + dcost_prep_len + dcost_sisprog_;
end;

if option=2 then do; *no sw program;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj;
end;
*/

***This reverses the discount (if needed);
cost_clin_care = dcost_clin_care / discount;

cost = dcost / discount;

* ================================================================================= ;


p_newp_ge1_ = s_newp_ge1 / s_alive1564;

s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_alive = s_alive_m + s_alive_w ;
s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;

***general population;

* n_alive;						n_alive = s_alive * sf;
* n_alive1549_;					n_alive1549_ = s_alive1549* sf;

* n_onart  ;					n_onart   = s_onart   * sf;
* n_onart_w;					n_onart_w = s_onart_w * sf;
* n_onart_m;					n_onart_m = s_onart_m * sf;
* n_hiv;						n_hiv = s_hivge15 * sf;
* n_prep_ever;					n_prep_ever = s_prep_any_ever * sf;
* p_prep_ever;					p_prep_ever = s_prep_any_ever / (s_alive1564_w + s_alive1564_m) ;

* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000_ = s_vg1000 / s_hiv1564 ;  p_vl1000_ = 1- p_vg1000_ ;
* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000_ = s_vg1000 / (s_alive1549_w + s_alive1549_m);

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* n_tested;						n_tested = s_tested * sf * 4;



***FSW;
* n_sw_1549_;					n_sw_1549_ = s_sw_1549 * sf;
* n_sw_1564_;					n_sw_1564_ = s_sw_1564 * sf;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ; 

* prop_w_1519_sw;				if s_ageg1519w gt 0 then  p_fsw1519_ = s_sw_1519 / s_ageg1519w;
* prop_w_2024_sw;				if s_ageg2024w gt 0 then  p_fsw2024_ = s_sw_2024 / s_ageg2024w;
* prop_w_2529_sw;				if s_ageg2529w gt 0 then  p_fsw2529_ = s_sw_2529 / s_ageg2529w;
* prop_w_3039_sw;				if s_ageg3034w gt 0 then  p_fsw3039_ = s_sw_3039 / (s_ageg3034w + s_ageg3539w);


**Of FSW, proportion in each age category;
								if s_sw_1564 gt 0 then do; 
* p_sw_age1519_;					p_sw_age1519_=s_sw_1519/s_sw_1564;
* p_sw_age2024_;					p_sw_age2024_=s_sw_2024/s_sw_1564;
* p_sw_age2529_;					p_sw_age2529_=s_sw_2529/s_sw_1564;
* p_sw_age3039_;					p_sw_age3039_=s_sw_3039/s_sw_1564;
* p_sw_age40pl_;					p_sw_age40pl_=s_sw_ov40/s_sw_1564;
								end;

* p_age_deb_sw1519_;			p_age_deb_sw1519_ = s_age_deb_sw1519_ /s_sw_1564;
* p_age_deb_sw2024_;			p_age_deb_sw2024_ = s_age_deb_sw2024_ /s_sw_1564;
* p_age_deb_sw2529_;			p_age_deb_sw2529_ = s_age_deb_sw2529_ /s_sw_1564;
* p_age_deb_sw2029_;			p_age_deb_sw2029_ = (s_age_deb_sw2024_ + s_age_deb_sw2529_) /s_sw_1564;
* p_age_deb_sw3039_;			p_age_deb_sw3039_ = s_age_deb_sw3039_ /s_sw_1564;
* p_age_deb_sw40pl_;		    p_age_deb_sw40pl_ =	s_age_deb_swov40_ /s_sw_1564;

* sw_episodes;					sw_episodes = s_episodes_sw/s_ever_sw;
* p_sw_gt1ep;					p_sw_gt1ep   = s_sw_gt1ep     / s_ever_sw;

* duration of sw;				tot_dur_sw= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw= s_act_dur_sw/ s_sw_1564;

								if s_sw_1564 ne 0 then do;
								p_actdur_0to3_sw   =s_actdur_sw_0to3/s_sw_1564;
								p_actdur_3to5_sw   =s_actdur_sw_3to5/s_sw_1564;
								p_actdur_6to9_sw   =s_actdur_sw_6to9/s_sw_1564;
								p_actdur_10to19_sw =s_actdur_sw_10to19/s_sw_1564;

								p_totdur_0to3_sw   =s_totdur_sw_0to3/s_sw_1564;
								p_totdur_3to5_sw   =s_totdur_sw_3to5/s_sw_1564;
								p_totdur_6to9_sw   =s_totdur_sw_6to9/s_sw_1564;
								p_totdur_10to19_sw =s_totdur_sw_10to19/s_sw_1564;
								end;

* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_ = s_sw_newp_cat1 /s_sw_1564;
* p_fsw_newp1to5;				if s_sw_1564>0 then p_fsw_newp1to5_ = s_sw_newp_cat2 /s_sw_1564;
* p_fsw_newp6to40;				if s_sw_1564>0 then p_fsw_newp6to40_ = s_sw_newp_cat3 /s_sw_1564;
* p_fsw_newp41to130;			if s_sw_1564>0 then p_fsw_newp41to130_ = s_sw_newp_cat4 /s_sw_1564;
* p_fsw_newpov130;				if s_sw_1564>0 then p_fsw_newpov130_ = s_sw_newp_cat5 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp = s_sw_newp/s_sw_1564;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis = s_fsw_program_visit / s_sw_1564 ;

* n_tested_sw;					n_tested_sw = s_tested_sw * sf * 4;
* p_tested_past_year_sw;		if s_sw_1564 - s_diag_sw > 0 then p_tested_past_year_sw = s_tested_4p_sw /  (s_sw_1564 - s_diag_sw) ;

* p_sw_tested_swprog;			if  (s_sw_program_visit - s_diag_sw) > 0 then p_sw_tested_swprog = s_tested_as_sw /  (s_sw_program_visit - s_diag_sw) ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;
* prop_sw_onprep_oral; 			if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_oral = s_prep_oral_sw/ (s_sw_1564 - s_hiv_sw) ;
* prop_sw_onprep_len; 			if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_len = s_prep_len_sw/ (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw = s_hiv_sw1549_ / s_sw_1549; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw =(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

*sti;							p_sti_sw = s_sti_sw/s_sw_1564;

* linked_diag_sw;				*if s_diag_thisper_sw>0 then p_linked_diag_sw = s_linked_diag_sw/s_diag_thisper_sw;


***ESW;

* n_esw_1549_;					n_esw_1549_ = s_esw_1549 * sf;
* n_esw_1564_;					n_esw_1564_ = s_esw_1564 * sf;

* prop_w_1549_esw;				if s_alive1549_w gt 0 then prop_w_1549_esw = s_esw_1549 / s_alive1549_w ;
* prop_w_1564_esw;				if s_alive1564_w gt 0 then prop_w_1564_esw = s_esw_1564 / s_alive1564_w ;
* prop_w_ever_esw;				prop_w_ever_esw = s_ever_esw / s_alive1564_w ; 

* prop_w_1519_esw;				if s_ageg1519w gt 0 then  p_esw1519_ = s_esw_1519 / s_ageg1519w;
* prop_w_2024_esw;				if s_ageg2024w gt 0 then  p_esw2024_ = s_esw_2024 / s_ageg2024w;
* prop_w_2529_esw;				if s_ageg2529w gt 0 then  p_esw2529_ = s_esw_2529 / s_ageg2529w;
* prop_w_3039_esw;				if s_ageg3034w gt 0 then  p_esw3039_ = s_esw_3039 / (s_ageg3034w + s_ageg3539w);


**Of esw, proportion in each age category;
								if s_esw_1564 gt 0 then do; 
* p_esw_age1519_;					p_esw_age1519_=s_esw_1519/s_esw_1564;
* p_esw_age2024_;					p_esw_age2024_=s_esw_2024/s_esw_1564;
* p_esw_age2529_;					p_esw_age2529_=s_esw_2529/s_esw_1564;
* p_esw_age3039_;					p_esw_age3039_=s_esw_3039/s_esw_1564;
* p_esw_age40pl_;					p_esw_age40pl_=s_esw_ov40/s_esw_1564;
								end;

* p_age_deb_esw1519_;			p_age_deb_esw1519_ = s_age_deb_esw1519_ /s_esw_1564;
* p_age_deb_esw2024_;			p_age_deb_esw2024_ = s_age_deb_esw2024_ /s_esw_1564;
* p_age_deb_esw2529_;			p_age_deb_esw2529_ = s_age_deb_esw2529_ /s_esw_1564;
* p_age_deb_esw2029_;			p_age_deb_esw2029_ = (s_age_deb_esw2024_ + s_age_deb_esw2529_) /s_esw_1564;

* p_age_deb_esw3039_;			p_age_deb_esw3039_ = s_age_deb_esw3039_ /s_esw_1564;
* p_age_deb_esw40pl_;		    p_age_deb_esw40pl_ =	s_age_deb_eswov40_ /s_esw_1564;

* esw_episodes;					esw_episodes = s_episodes_esw/s_ever_esw;
* p_esw_gt1ep;					p_esw_gt1ep   = s_esw_gt1ep     / s_ever_esw;

* duration of esw;				tot_dur_esw= s_tot_dur_esw/ s_esw_1564;
								act_dur_esw= s_act_dur_esw/ s_esw_1564;

								if s_esw_1564 ne 0 then do;
								p_actdur_0to3_esw   =s_actdur_esw_0to3/s_esw_1564;
								p_actdur_3to5_esw   =s_actdur_esw_3to5/s_esw_1564;
								p_actdur_6to9_esw   =s_actdur_esw_6to9/s_esw_1564;
								p_actdur_10to19_esw =s_actdur_esw_10to19/s_esw_1564;

								p_totdur_0to3_esw   =s_totdur_esw_0to3/s_esw_1564;
								p_totdur_3to5_esw   =s_totdur_esw_3to5/s_esw_1564;
								p_totdur_6to9_esw   =s_totdur_esw_6to9/s_esw_1564;
								p_totdur_10to19_esw =s_totdur_esw_10to19/s_esw_1564;
								end;

* p_esw_newp0;					if s_esw_1564>0 then p_esw_newp0_ = s_esw_newp_cat1 /s_esw_1564;
* p_esw_newp1to3;				if s_esw_1564>0 then p_esw_newp1to3_ = s_esw_newp_cat2 /s_esw_1564;
* p_esw_newp4to8;				if s_esw_1564>0 then p_esw_newp4to8_ = s_esw_newp_cat3 /s_esw_1564;
* av_esw_newp;					if s_esw_1564 gt 0 then av_esw_newp = s_esw_newp/s_esw_1564;
* p_newp_esw;					if s_w_newp gt 0 then p_newp_esw = s_esw_newp / s_w_newp ;
* p_esw_prog_vis;				if s_esw_1564 gt 0 then p_esw_prog_vis = s_esw_program_visit / s_esw_1564 ;

* n_tested_esw;					n_tested_esw = s_tested_esw * sf * 4;
* p_tested_past_year_esw;		if s_esw_1564 - s_diag_esw > 0 then p_tested_past_year_esw = s_tested_4p_esw /  (s_esw_1564 - s_diag_esw) ;

* p_esw_tested_swprog;			if  (s_esw_program_visit - s_diag_esw) > 0 then p_esw_tested_swprog = s_tested_as_esw /  (s_esw_program_visit - s_diag_esw) ;


* prop_esw_onprep; 				if (s_esw_1564 - s_hiv_esw) gt 0 then prop_esw_onprep = s_prep_any_esw/ (s_esw_1564 - s_hiv_esw) ;
* prop_esw_onprep_oral; 		if (s_esw_1564 - s_hiv_esw) gt 0 then prop_esw_onprep_oral = s_prep_oral_esw/ (s_esw_1564 - s_hiv_esw) ;
* prop_esw_onprep_len; 			if (s_esw_1564 - s_hiv_esw) gt 0 then prop_esw_onprep_len = s_prep_len_esw/ (s_esw_1564 - s_hiv_esw) ;

* p_diag_esw;					if s_hiv_esw > 0 then p_diag_esw = s_diag_esw / s_hiv_esw; 
* p_onart_diag_esw;				if s_diag_esw > 0 then p_onart_diag_esw = s_onart_esw / s_diag_esw;
* p_onart_vl1000_esw;			if s_onart_gt6m_iicu_esw > 0 then p_onart_vl1000_esw = s_vl1000_art_gt6m_iicu_esw / s_onart_gt6m_iicu_esw ;

* prevalence_esw;				prevalence_esw = s_hiv_esw1549_ / s_esw_1549; 

* incidence_esw;					if (s_esw_1564  - s_hiv_esw  + s_primary_esw) gt 0 then incidence_esw =(s_primary_esw * 4 * 100) / (s_esw_1564  - s_hiv_esw  + s_primary_esw);

*sti;							p_sti_esw = s_sti_esw/s_esw_1564;

* linked_diag_esw;				*if s_diag_thisper_esw>0 then p_linked_diag_esw = s_linked_diag_esw/s_diag_thisper_esw;



* prop_onprep; 		if (s_alive1564 - s_hiv1564) gt 0 then prop_onprep = (s_prep_any/ (s_alive1564 - s_hiv1564))*100 ;
* prop_onprep_len; 	if (s_alive1564 - s_hiv1564) gt 0 then prop_onprep_len = (s_prep_len/ (s_alive1564 - s_hiv1564))*100 ;
* prop_onprep_oral; if (s_alive1564 - s_hiv1564) gt 0 then prop_onprep_oral = (s_prep_oral/ (s_alive1564 - s_hiv1564))*100 ;

* prop_onprep_len_m; if (s_alive1564_m - s_hiv1564m) gt 0 then prop_onprep_len_m = (s_prep_len_m/ (s_alive1564_m - s_hiv1564m))*100 ;
* prop_onprep_oral_m; if (s_alive1564_m - s_hiv1564m) gt 0 then prop_onprep_oral_m = (s_prep_oral_m/ (s_alive1564_m - s_hiv1564m))*100;
* prop_onprep_len_w; if (s_alive1564_w - s_hiv1564m) gt 0 then prop_onprep_len_w = (s_prep_len_w/ (s_alive1564_w - s_hiv1564m))*100 ;
* prop_onprep_oral_w; if (s_alive1564_w - s_hiv1564m) gt 0 then prop_onprep_oral_w = (s_prep_oral_w/ (s_alive1564_w - s_hiv1564m))*100;



keep run option cald 
n_alive				 n_alive1549_		n_onart				n_onart_w			n_onart_m			
n_prep_ever			 p_prep_ever
prevalence1549m 	 prevalence1549w 	prevalence1549_		incidence1549_ 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000_ 			p_vl1000_ 			prevalence_vg1000_
n_tested

n_sw_1564_  	 	 n_sw_1549_ 	 	prop_w_1564_sw		prop_w_1549_sw 	 	prop_w_ever_sw  
p_fsw1519_	  		 p_fsw2024_		  	p_fsw2529_			p_fsw3039_	
p_sw_age1519_	  	 p_sw_age2024_	  	p_sw_age2529_ 		p_sw_age3039_ 		p_sw_age40pl_
p_age_deb_sw1519_  	 p_age_deb_sw2024_  p_age_deb_sw2529_   p_age_deb_sw2029_	p_age_deb_sw3039_   p_age_deb_sw40pl_
sw_episodes 	  	 p_sw_gt1ep
tot_dur_sw  		 act_dur_sw  	 
p_actdur_0to3_sw  	 p_actdur_3to5_sw     p_actdur_6to9_sw  	p_actdur_10to19_sw 
p_totdur_0to3_sw  	 p_totdur_3to5_sw     p_totdur_6to9_sw  	p_totdur_10to19_sw 
p_fsw_newp0_   	 	 p_fsw_newp1to5_   	  p_fsw_newp6to40_  	p_fsw_newp41to130_  p_fsw_newpov130_
av_sw_newp	 		 p_newp_sw
p_sw_prog_vis		 n_tested_sw	      p_tested_past_year_sw	p_sw_tested_swprog
prop_sw_onprep		 prop_sw_onprep_oral  prop_sw_onprep_len
p_diag_sw			 p_onart_diag_sw	  p_onart_vl1000_sw		
prevalence_sw	     incidence_sw		  p_sti_sw	

n_esw_1564_  	 	 n_esw_1549_ 	 	  prop_w_1564_esw		prop_w_1549_esw 	prop_w_ever_esw  
p_esw1519_	  		 p_esw2024_		  	  p_esw2529_			p_esw3039_	
p_esw_age1519_	  	 p_esw_age2024_	  	  p_esw_age2529_ 		p_esw_age3039_ 		p_esw_age40pl_
p_age_deb_esw1519_   p_age_deb_esw2024_   p_age_deb_esw2529_    p_age_deb_esw2029_	p_age_deb_esw3039_  p_age_deb_esw40pl_
esw_episodes 	  	 p_esw_gt1ep
tot_dur_esw  		 act_dur_esw  	 
p_actdur_0to3_esw  	 p_actdur_3to5_esw     p_actdur_6to9_esw  	p_actdur_10to19_esw 
p_totdur_0to3_esw  	 p_totdur_3to5_esw     p_totdur_6to9_esw  	p_totdur_10to19_esw 
p_esw_newp0_   	 	 p_esw_newp1to3_       p_esw_newp4to8_  	
av_esw_newp	 		 p_newp_esw
p_esw_prog_vis		 n_tested_esw	       p_tested_past_year_esw	p_esw_tested_swprog
prop_esw_onprep		 prop_esw_onprep_oral  prop_esw_onprep_len	
p_diag_esw			 p_onart_diag_esw	   p_onart_vl1000_esw		
prevalence_esw	  	 incidence_esw		   p_sti_esw			 

/*Sampled parameters*/
sw_art_disadv	sw_program	effect_sw_prog_newp		effect_sw_prog_6mtest	effect_sw_prog_int	effect_sw_prog_adh
effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti		sw_trans_matrix
sw_higher_int sw_higher_prob_loss_at_diag	rel_sw_lower_adh
rate_engage_sw_program	rate_disengage_sw_program

esw_art_disadv	esw_trans_matrix	esw_higher_int esw_higher_prob_loss_at_diag	rel_esw_lower_adh

rate_engage_esw_program	rate_disengage_esw_program

/*Costs*/
dcost ddaly dcost_sw_program
dart_cost_y		dadc_cost  			dcd4_cost		  dvl_cost  dvis_cost	dnon_tb_who3_cost	dcot_cost 		 dtb_cost  dres_cost 
dtest_cost		d_t_adh_int_cost  	dswitchline_cost  dcost_drug_level_test dcost_circ  		dcost_condom_dn  dcost_avail_self_test 		
dcost_prep_visit_oral  				dcost_prep_oral   dcost_prep_visit_len  dcost_prep_len 		
dcost_sisprog_ /*dcost_amtprog_*/


n_hiv 				n_onart
prop_onprep_oral	prop_onprep_len		prop_onprep_len_m	prop_onprep_len_w	prop_onprep_oral_m	prop_onprep_oral_w


;

proc sort data=y;by run option;run;

data a.pace_29_06_26_short; set y;run;

data y; set a.pace_29_06_26_short;run;

options nomprint;
  option nospool;


***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

***outputs for PHIA comparison in 2020;
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run; where 2020 <= cald < 2021; 

***baseline outputs in 2026;
proc means  noprint data=y; var &v; output out=y_26 mean= &v._26; by run; where 2026 <= cald < 2027; 

***outputs in 2030 by option;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option; where 2030.0 <= cald < 2031; 


**Outputs for CE analyses - 20 and 50 years by option;
proc means noprint data=y; var &v; output out=y_26_46 mean= &v._26_46; by run option ; where 2026 <= cald < 2047;
proc means noprint data=y; var &v; output out=y_26_76 mean= &v._26_76; by run option ; where 2026 <= cald < 2076;

proc sort data=y_20; by run; proc transpose data=y_20 out=t_20 prefix=&v._20_; var &v._20; by run;
proc sort data=y_26; by run; proc transpose data=y_26 out=t_26 prefix=&v._26_; var &v._26; by run;
proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;

proc sort data=y_26_46; by run; proc transpose data=y_26_46 out=t_26_46 prefix=&v._26_46_; var &v._26_46; by run;
proc sort data=y_26_76; by run; proc transpose data=y_26_76 out=t_26_76 prefix=&v._26_76_; var &v._26_76; by run;

data &v ; merge y_20 y_26 y_30 t_26_46 t_26_76;


***MACRO IS USED TO CALCULATE SUMMARY MEASURES FOR THE YEARS ABOVE FOR EACH OUTPUT;
%mend var;

%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549_); 	
%var(v=incidence1549_); %var(v=incidence1549w); 	%var(v=incidence1549m);

%var(v=p_diag);	 		%var(v=p_diag_m);	 		%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000_);	%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);
%var(v=p_vg1000_); 		%var(v=p_vl1000_);			%var(v=prevalence_vg1000_);  %var(v=n_tested);	

%var(v=n_sw_1564_);     %var(v=n_sw_1549_);		    %var(v=prop_w_1564_sw);		%var(v=prop_w_1549_sw); %var(v=prop_w_ever_sw);  
%var(v=p_fsw1519_);	  	%var(v=p_fsw2024_);		    %var(v=p_fsw2529_);			%var(v=p_fsw3039_);	
%var(v=p_sw_age1519_);	%var(v=p_sw_age2024_);		%var(v=p_sw_age2529_); 		%var(v=p_sw_age3039_);	%var(v=p_sw_age40pl_);
%var(v=p_age_deb_sw1519_);%var(v=p_age_deb_sw2024_);%var(v=p_age_deb_sw2529_); 	%var(v=p_age_deb_sw2029_);%var(v=p_age_deb_sw3039_); %var(v=p_age_deb_sw40pl_);
%var(v=sw_episodes); 	%var(v=p_sw_gt1ep);
%var(v=tot_dur_sw);  	%var(v=act_dur_sw);  	 
%var(v=p_actdur_0to3_sw); %var(v=p_actdur_3to5_sw); %var(v=p_actdur_6to9_sw);  	%var(v=p_actdur_10to19_sw); 
%var(v=p_totdur_0to3_sw); %var(v=p_totdur_3to5_sw);  %var(v=p_totdur_6to9_sw);  	%var(v=p_totdur_10to19_sw); 
%var(v=p_fsw_newp0_);   %var(v=p_fsw_newp1to5_);    %var(v=p_fsw_newp6to40_);  	%var(v=p_fsw_newp41to130_);%var(v=p_fsw_newpov130_);
%var(v=av_sw_newp);	 	%var(v=p_newp_sw);
%var(v=p_sw_prog_vis);  %var(v=n_tested_sw);	    %var(v=p_tested_past_year_sw); %var(v=p_sw_tested_swprog);
%var(v=prop_sw_onprep);	%var(v=prop_sw_onprep_oral);%var(v=prop_sw_onprep_len);	
%var(v=p_diag_sw);		%var(v=p_onart_diag_sw);	%var(v=p_onart_vl1000_sw);	
%var(v=prevalence_sw);	%var(v=incidence_sw);		%var(v=p_sti_sw);

%var(v=n_esw_1564_);    %var(v=n_esw_1549_);		%var(v=prop_w_1564_esw);	%var(v=prop_w_1549_esw); %var(v=prop_w_ever_esw);  
%var(v=p_esw1519_);	  	%var(v=p_esw2024_);		    %var(v=p_esw2529_);			%var(v=p_esw3039_);	
%var(v=p_esw_age1519_);	%var(v=p_esw_age2024_);		%var(v=p_esw_age2529_); 	%var(v=p_esw_age3039_);	%var(v=p_esw_age40pl_);
%var(v=p_age_deb_esw1519_);%var(v=p_age_deb_esw2024_);%var(v=p_age_deb_esw2529_);%var(v=p_age_deb_esw2029_); %var(v=p_age_deb_esw3039_); %var(v=p_age_deb_esw40pl_);
%var(v=esw_episodes); 	%var(v=p_esw_gt1ep);
%var(v=tot_dur_esw);  	%var(v=act_dur_esw);  	 
%var(v=p_actdur_0to3_esw); %var(v=p_actdur_3to5_esw);%var(v=p_actdur_6to9_esw);  %var(v=p_actdur_10to19_esw); 
%var(v=p_totdur_0to3_esw); %var(v=p_totdur_3to5_esw);%var(v=p_totdur_6to9_esw);  %var(v=p_totdur_10to19_esw); 
%var(v=p_esw_newp0_);   %var(v=p_esw_newp1to3_);    %var(v=p_esw_newp4to8_);  	
%var(v=av_esw_newp);	%var(v=p_newp_esw);
%var(v=p_esw_prog_vis); %var(v=n_tested_esw);	    %var(v=p_tested_past_year_esw); %var(v=p_esw_tested_swprog);
%var(v=prop_esw_onprep);%var(v=prop_esw_onprep_oral);%var(v=prop_esw_onprep_len);	
%var(v=p_diag_esw);		%var(v=p_onart_diag_esw);	%var(v=p_onart_vl1000_esw);	
%var(v=prevalence_esw);	%var(v=incidence_esw);	    %var(v=p_sti_esw);

%var(v=dcost);			  		%var(v=ddaly);				%var(v=dcost_sw_program);
%var(v=dart_cost_y);	  		%var(v=dadc_cost);			%var(v=dcd4_cost);			%var(v=dvl_cost);  	%var(v=dvis_cost);	
%var(v=dnon_tb_who3_cost);		%var(v=dcot_cost);			%var(v=dtb_cost);  			%var(v=dres_cost); 
%var(v=dtest_cost)   	 		%var(v=d_t_adh_int_cost); 	%var(v=dswitchline_cost); 	%var(v=dcost_drug_level_test);
%var(v=dcost_circ); 	  		%var(v=dcost_condom_dn); 	%var(v=dcost_avail_self_test);   	
%var(v=dcost_prep_visit_oral);	%var(v=dcost_prep_oral); 	%var(v=dcost_prep_visit_len);%var(v=dcost_prep_len); 
%var(v=dcost_sisprog_);			/* %var(v=dcost_amtprog_);*/

%var(v=n_hiv);					%var(v=n_onart);
%var(v=prop_onprep_oral);		%var(v=prop_onprep_len); 	%var(v=prop_onprep_len_m);	%var(v=prop_onprep_len_w);
%var(v=prop_onprep_oral_m);		%var(v=prop_onprep_oral_w);


run;

***ALL FILES ARE MERGED TOGETHER TO FORM ONE DATASET;
data wide_outputs;merge
prevalence1549m 	prevalence1549w 	prevalence1549_ 	
incidence1549_ 		incidence1549w 		incidence1549m

p_diag	 			p_diag_m	 		p_diag_w   			p_onart_diag   		p_onart_diag_w
p_onart_diag_m  	p_onart_vl1000_		p_onart_vl1000_w    p_onart_vl1000_m
p_vg1000_ 			p_vl1000_			prevalence_vg1000_  n_tested	

n_sw_1564_      	n_sw_1549_		    prop_w_1564_sw		prop_w_1549_sw 		prop_w_ever_sw  
p_fsw1519_	  		p_fsw2024_		    p_fsw2529_			p_fsw3039_	
p_sw_age1519_		p_sw_age2024_		p_sw_age2529_ 		p_sw_age3039_		p_sw_age40pl_
p_age_deb_sw1519_ 	p_age_deb_sw2024_	p_age_deb_sw2529_ 	p_age_deb_sw2029_	p_age_deb_sw3039_ 	p_age_deb_sw40pl_
sw_episodes 		p_sw_gt1ep
tot_dur_sw  		act_dur_sw  	 
p_actdur_0to3_sw 	p_actdur_3to5_sw 	p_actdur_6to9_sw  	p_actdur_10to19_sw 
p_totdur_0to3_sw 	p_totdur_3to5_sw  	p_totdur_6to9_sw  	p_totdur_10to19_sw 
p_fsw_newp0_  	 	p_fsw_newp1to5_   	p_fsw_newp6to40_  	p_fsw_newp41to130_	p_fsw_newpov130_
av_sw_newp	 		p_newp_sw
p_sw_prog_vis  		n_tested_sw	    	p_tested_past_year_sw 	p_sw_tested_swprog
prop_sw_onprep		prop_sw_onprep_oral	prop_sw_onprep_len	
p_diag_sw			p_onart_diag_sw		p_onart_vl1000_sw	
prevalence_sw		incidence_sw		p_sti_sw

n_esw_1564_    		n_esw_1549_			prop_w_1564_esw		prop_w_1549_esw 	prop_w_ever_esw  
p_esw1519_	  		p_esw2024_		    p_esw2529_			p_esw3039_	
p_esw_age1519_		p_esw_age2024_		p_esw_age2529_ 	    p_esw_age3039_		p_esw_age40pl_
p_age_deb_esw1519_	p_age_deb_esw2024_	p_age_deb_esw2529_	p_age_deb_esw2029_ 	p_age_deb_esw3039_ 	p_age_deb_esw40pl_
esw_episodes 		p_esw_gt1ep
tot_dur_esw  		act_dur_esw  	 
p_actdur_0to3_esw 	p_actdur_3to5_esw	p_actdur_6to9_esw 	p_actdur_10to19_esw 
p_totdur_0to3_esw 	p_totdur_3to5_esw	p_totdur_6to9_esw   p_totdur_10to19_esw 
p_esw_newp0_  		p_esw_newp1to3_     p_esw_newp4to8_  	
av_esw_newp			p_newp_esw
p_esw_prog_vis 		n_tested_esw	    p_tested_past_year_esw 	p_esw_tested_swprog
prop_esw_onprep		prop_esw_onprep_oral	prop_esw_onprep_len	
p_diag_esw			p_onart_diag_esw	p_onart_vl1000_esw	
prevalence_esw		incidence_esw	    p_sti_esw

dcost			  	ddaly				dcost_sw_program
dart_cost_y	  		dadc_cost			dcd4_cost			dvl_cost  	dvis_cost	
dnon_tb_who3_cost	dcot_cost			dtb_cost  			dres_cost 
dtest_cost   	 	d_t_adh_int_cost 	dswitchline_cost 	dcost_drug_level_test
dcost_circ 	  		dcost_condom_dn 	dcost_avail_self_test   	
dcost_prep_visit_oral	dcost_prep_oral 	dcost_prep_visit_len	dcost_prep_len 
dcost_sisprog_			/* dcost_amtprog_*/

n_hiv					n_onart
prop_onprep_oral		prop_onprep_len prop_onprep_len_m	prop_onprep_len_w
prop_onprep_oral_m		prop_onprep_oral_w


;

proc sort; by run;run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2026.25; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 
%par(p=sw_art_disadv);			%par(p=sw_program);			%par(p=effect_sw_prog_newp);	%par(p=effect_sw_prog_6mtest);	
%par(p=effect_sw_prog_int);		%par(p=effect_sw_prog_adh);	%par(p=effect_sw_prog_lossdiag);%par(p=effect_sw_prog_prep_any);
%par(p=effect_sw_prog_pers_sti);%par(p=sw_trans_matrix);
%par(p=sw_higher_int); 			%par(p=sw_higher_prob_loss_at_diag);	%par(p=rel_sw_lower_adh);
%par(p=rate_engage_sw_program);	%par(p=rate_disengage_sw_program);		
/*
%par(p=esw_art_disadv);			%par(p=esw_trans_matrix);	%par(p=esw_higher_int); %par(p=esw_higher_prob_loss_at_diag);
%par(p=rel_esw_lower_adh);		%par(p=rate_engage_esw_program);		%par(p=erate_disengage_esw_program);
*/
data wide_par; merge 
sw_art_disadv			sw_program			effect_sw_prog_newp			effect_sw_prog_6mtest	
effect_sw_prog_int		effect_sw_prog_adh	effect_sw_prog_lossdiag		effect_sw_prog_prep_any
effect_sw_prog_pers_sti	sw_trans_matrix
sw_higher_int 			sw_higher_prob_loss_at_diag	rel_sw_lower_adh
rate_engage_sw_program	rate_disengage_sw_program	/*esw_art_disadv
esw_trans_matrix		esw_higher_int 				esw_higher_prob_loss_at_diag
rel_esw_lower_adh		rate_engage_esw_program		erate_disengage_esw_program*/

;proc sort; by run;run;

***THIS STORES THE NEWLY CREATED WIDE FILE IN LIBRARY A. THIS NEW FILE WILL BE READ INTO THE ANALYSIS PROGRAM;
data a.wide_pace_29_06_26;
merge   wide_outputs  wide_par ;  
by run;run;




***GRAPHS;

data b;
set a.pace_29_06_26_short;
if cald gt 2026 then delete;
proc sort; by cald run ;run;

data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 12;
%let year_end = 2026.00 ;
run;
proc sort;by cald option ;run;


***USE MACRO TO CALCULATE SUMMARY MEASURES;;

data option_0;
set b;
if option =1 then delete;

%let var =  
prevalence1549m	prevalence1549w 	prevalence1549_ 		incidence1549_ 	incidence1549w 	incidence1549m

p_diag	 		p_diag_m	 		p_diag_w   			p_onart_diag  	p_onart_diag_w
p_onart_diag_m 	p_onart_vl1000_		p_onart_vl1000_w   	p_onart_vl1000_m  n_tested	 	
p_vg1000_ 		p_vl1000_			prevalence_vg1000_	

n_sw_1564_      n_sw_1549_		    prop_w_1564_sw		prop_w_1549_sw 	prop_w_ever_sw  
p_fsw1519_	  	p_fsw2024_		    p_fsw2529_			p_fsw3039_	

p_sw_age1519_	  p_sw_age2024_		p_sw_age2529_ 		p_sw_age3039_ 	p_sw_age40pl_
p_age_deb_sw1519_ p_age_deb_sw2024_ p_age_deb_sw2529_  	p_age_deb_sw2029_	p_age_deb_sw3039_ p_age_deb_sw40pl_

sw_episodes 	p_sw_gt1ep
p_fsw_newp0_   	p_fsw_newp1to5_    p_fsw_newp6to40_  	p_fsw_newp41to130_	p_fsw_newpov130_
av_sw_newp	 	p_newp_sw

tot_dur_sw  	act_dur_sw  
 
p_actdur_0to3_sw  p_actdur_3to5_sw     p_actdur_6to9_sw  	p_actdur_10to19_sw 
p_totdur_0to3_sw  p_totdur_3to5_sw     p_totdur_6to9_sw  	p_totdur_10to19_sw 

p_sw_prog_vis   n_tested_sw	   	   p_tested_past_year_sw  	p_sw_tested_swprog	
prop_sw_onprep	prop_sw_onprep_oral		prop_sw_onprep_len	prevalence_sw	   incidence_sw
p_diag_sw		p_onart_diag_sw	   p_onart_vl1000_sw	p_sti_sw

n_hiv	n_onart
prop_onprep_len  prop_onprep_oral
prop_onprep_len_m	prop_onprep_len_w	prop_onprep_oral_m	prop_onprep_oral_w

;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;
%let pmean_var = mean_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);
pmean_&varb._0 = mean(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 pmean_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

%option_0;
run;


data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25  g26 
g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48   g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71 g72 g73 g74 g75  g76  g77  g78 
g79
;
by cald;
run;

***READ IN SAS FILES WITH OBSERVED DATA;
data d1;
set d;
%include "C:\Users\lovel\Documents\GitHub\hiv-modelling\Observed data_FSW_Zimbabwe.sas"; by cald;
run;

data e;
set d1;
%include "C:\Users\Lovel\Documents\GitHub\hiv-modelling\Observed data_Zimbabwe_Jan2026.sas";by cald;
run;

ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Zim\PACE\29Jun2026.doc' startpage=never; 

ods listing close;
ods html style=htmlblue;

proc sgplot data=e; 
Title    height=1.5 justify=center "People living with HIV";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 13000000)  valueattrs=(size=10);
label pmean_n_hiv_0	 = "Model";
label o_livingHIV_1549_UNAIDS = "UNAIDS 15-49";
label o_livingHIV_15plus_UNAIDS = "UNAIDS 15+";
label o_livingHIV_1564_PHIA = "PHIA 15-64";


series  x=cald y=pmean_n_hiv_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_hiv_0     upper=p95_n_hiv_0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= o_livingHIV_1549_UNAIDS/ markerattrs = (symbol=circle color=lightgreen size = 12);
scatter x=cald y= o_livingHIV_15plus_UNAIDS/ markerattrs = (symbol=circle color=darkgreen size = 12);
scatter x=cald y= o_livingHIV_1564_PHIA/ markerattrs = (symbol=circle color=orange size = 12);
run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "Number of people living with HIV on ART";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 1200000)  valueattrs=(size=10);
label pmean_n_onart_0	 = "Model";
label o_s_onart_adults_garpr = "UNAIDS";
label o_s_all_onart_NAC = "National AIDS Council";

series  x=cald y=pmean_n_onart_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_onart_0    upper=p95_n_onart_0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= o_s_onart_adults_garpr/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= o_s_all_onart_NAC/ markerattrs = (symbol=circle color=blue size = 12);

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of those living with HIV, proportion diagnosed";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label pmean_p_diag_0	 = "Model";
label o_p_diag_1564_zimphia = "ZIMPHIA";
label o_p_diag_15pl_zimphia = "ZIMPHIA";

series  x=cald y=pmean_p_diag_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_0    upper=p95_p_diag_0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= o_p_diag_1564_zimphia/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= o_p_diag_15pl_zimphia/ markerattrs = (symbol=circle color=green size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label pmean_p_onart_diag_0	 = "Model";
label o_p_onart_1564_diag_zimphia= "ZIMPHIA";
label o_p_onart_15pl_diag_zimphia = "ZIMPHIA";

series  x=cald y=pmean_p_onart_diag_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_0    upper=p95_p_onart_diag_0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= o_p_onart_1564_diag_zimphia/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= o_p_onart_15pl_diag_zimphia/ markerattrs = (symbol=circle color=green size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label pmean_p_onart_vl1000__0	 = "Model";
label o_p_vlsupp_1564_Zimphia= "ZIMPHIA";
label o_p_vlsupp_15pl_Zimphia = "ZIMPHIA";

series  x=cald y=pmean_p_onart_vl1000__0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0    upper=p95_p_onart_vl1000__0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= o_p_vlsupp_1564_Zimphia/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= o_p_vlsupp_15pl_Zimphia/ markerattrs = (symbol=circle color=green size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "HIV prevalence";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Prevalence'              labelattrs=(size=12)  values = (0 to 0.3 by 0.05)  valueattrs=(size=10);
label pmean_prevalence1549__0= "Model"; 
label o_prev1549_Z_DHS = "Demographic Health Survey (DHS)";
label o_prev_1549_zimphia = "ZIMPHIA";
label m_prev1549_unaids = "UNAIDS";

series  x=cald y=pmean_prevalence1549__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549__0     upper=p95_prevalence1549__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= o_prev1549_Z_DHS/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= o_prev_1549_zimphia/ markerattrs = (symbol=circle color=blue size = 12);
scatter x=cald y= m_prev1549_unaids/ markerattrs = (symbol=circle color=orange size = 12);

run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "HIV incidence";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'per 100 py'              labelattrs=(size=12)  values = (0 to 2 by 0.2)  valueattrs=(size=10);
label pmean_incidence1549__0= "Model"; 
label o_HIVincid_1549_Zimphia = "ZIMPHIA";

series  x=cald y=pmean_incidence1549__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549__0     upper=p95_incidence1549__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= o_HIVincid_1549_Zimphia/ markerattrs = (symbol=circle color=green size = 12);
run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 130000)  valueattrs=(size=10);
label pmean_n_sw_1549__0 = "Model";
label o_pop_fsw_1549w_Fearon = "Fearon et al, 2017";
label o_pop_fsw_1549w_Fearon_ICASA = "Fearon et al 2022";

series  x=cald y=pmean_n_sw_1549__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549__0     upper=p95_n_sw_1549__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearon / markerattrs = (symbol=circle color= green size = 12);
scatter x=cald y=o_pop_fsw_1549w_Fearon_ICASA / markerattrs = (symbol=circle color=blue size = 12);
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2000 to 2026) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label pmean_prop_w_1549_sw_0   = "Model";
label o_p_fsw_1549w_Fearon		 = "Fearon et al, 2020";
label o_p_fsw_1549w_Fearon_ICASA = "ICASA 2023";

series  x=cald y=pmean_prop_w_1549_sw_0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	 upper=p95_prop_w_1549_sw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_1549w_Fearon / markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y=o_p_fsw_1549w_Fearon_ICASA / markerattrs = (symbol=circle color=blue size = 12);

run;quit;

ods rtf close;
ods listing;
run;

/*
proc sgplot data=e; 
Title    height=1.5 justify=center "Age of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label pmean_p_sw_age1519__0	              = "15-19 years (median)";
label pmean_p_sw_age2024__0	              = "20-24 years (median)";
label pmean_p_sw_age2529__0	              = "25-29 years (median)";
label pmean_p_sw_age3039__0	              = "30-39 years (median)";

label o_p_1824_fsw_rds				  = "18-24 years SAPPHIRE";
label o_p_2529_fsw_rds				  = "25-29 years SAPPHIRE";
label o_p_3039_fsw_rds				  = "30-39 years SAPPHIRE";
 
label o_p_1819_fsw_AMT				  = "18-19 years AMETHIST";
label o_p_2024_fsw_AMT				  = "20-24 years AMETHIST";
label o_p_2529_fsw_AMT				  = "25-29 years AMETHIST";
label o_p_3039_fsw_AMT				  = "39-39 years AMETHIST";

series  x=cald y=pmean_p_sw_age1519__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_age1519__0      upper=p95_p_sw_age1519__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19y 90% range";
series  x=cald y=pmean_p_sw_age2024__0  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_age2024__0      upper=p95_p_sw_age2024__0 / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24yy 90% range";
series  x=cald y=pmean_p_sw_age2529__0  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_age2529__0      upper=p95_p_sw_age2529__0 / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29y 90% range";
series  x=cald y=pmean_p_sw_age3039__0  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_sw_age3039__0      upper=p95_p_sw_age3039__0 / transparency=0.9 fillattrs = (color=orange) legendlabel= "30-39y 90% range";

scatter x=cald y=o_p_1824_fsw_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_rds / markerattrs = (symbol=circle       color=orange size = 12);

scatter x=cald y=o_p_1819_fsw_AMT / markerattrs = (symbol=circle       color=BLUE size = 12);
scatter x=cald y=o_p_2024_fsw_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_AMT / markerattrs = (symbol=circle       color=orange size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Age debut of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label pmean_p_age_deb_sw1519__0	= "Model 15-19 years";
label pmean_p_age_deb_sw2024__0	= "Model 20-24 years";
label pmean_p_age_deb_sw2529__0	= "Model 25-29 years";
label pmean_p_age_deb_sw3039__0	= "Model 30-39 years";

label o_p_fsw_agedeb1519_rds	= "15-19 years SAPPHIRE";
label o_p_fsw_agedeb2024_rds	= "20-24 years SAPPHIRE";
label o_p_fsw_agedeb2529_rds	= "25-29 years SAPPHIRE";
label o_p_fsw_agedebge30_rds	= "30+ years SAPPHIRE";

label o_p_fsw_agedeb1519_amt	= "15-19 years AMETHIST";
label o_p_fsw_agedeb2024_amt	= "20-24 years AMETHIST";
label o_p_fsw_agedeb2529_amt	= "25-29 years AMETHIST";
label o_p_fsw_agedebge30_amt	= "30+ years AMETHIST";

series  x=cald y=pmean_p_age_deb_sw1519__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_age_deb_sw1519__0      upper=p95_p_age_deb_sw1519__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19y 90% range";
series  x=cald y=pmean_p_age_deb_sw2024__0  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_age_deb_sw2024__0      upper=p95_p_age_deb_sw2024__0 / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24yy 90% range";
series  x=cald y=pmean_p_age_deb_sw2529__0  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_age_deb_sw2529__0      upper=p95_p_age_deb_sw2529__0 / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29y 90% range";
series  x=cald y=pmean_p_age_deb_sw3039__0  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_age_deb_sw3039__0      upper=p95_p_age_deb_sw3039__0 / transparency=0.9 fillattrs = (color=orange) legendlabel= "30-39y 90% range";

scatter x=cald y=o_p_fsw_agedeb1519_rds/ markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_agedeb2024_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_fsw_agedeb2529_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_fsw_agedebge30_rds / markerattrs = (symbol=circle       color=orange size = 12);

scatter x=cald y=o_p_fsw_agedeb1519_AMT/ markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_agedeb2024_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_fsw_agedeb2529_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_fsw_agedebge30_AMT / markerattrs = (symbol=circle       color=orange size = 12);

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Total years spent as sex worker";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label pmean_p_totdur_0to3_sw_0	  = "Model 0-2 years";
label pmean_p_totdur_3to5_sw_0	  = "Model 3-5 years";
label pmean_p_totdur_6to9_sw_0	  = "Model 6-9 years";
label pmean_p_totdur_10to19_sw_0  = "Model 10-19 years";

label o_p_dur_0to3y_rds		  = "0-2 years SAPPHIRE";
label o_p_dur_3to5y_rds		  = "3-5 years SAPPHIRE";
label o_p_dur_6to9y_rds		  = "6-9 years SAPPHIRE";
label o_p_dur_10to19y_rds	  = "10-19 years SAPPHIRE";

label o_p_dur_0to3y_amt		  = "0-2 years AMETHIST";
label o_p_dur_3to5y_amt		  = "3-5 years AMETHIST";
label o_p_dur_6to6y_amt		  = "6-9 years AMETHIST";
label o_p_dur_10to19y_amt	  = "10-19 years AMETHIST";

series  x=cald y=pmean_p_totdur_0to3_sw_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_totdur_0to3_sw_0      upper=p95_p_totdur_0to3_sw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19y 90% range";
series  x=cald y=pmean_p_totdur_3to5_sw_0  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_totdur_3to5_sw_0      upper=p95_p_totdur_3to5_sw_0 / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24yy 90% range";
series  x=cald y=pmean_p_totdur_6to9_sw_0  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_totdur_6to9_sw_0      upper=p95_p_totdur_6to9_sw_0 / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29y 90% range";
series  x=cald y=pmean_p_totdur_10to19_sw_0  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_totdur_10to19_sw_0      upper=p95_p_totdur_10to19_sw_0 / transparency=0.9 fillattrs = (color=orange) legendlabel= "30-39y 90% range";

scatter x=cald y=o_p_dur_0to3y_rds/ markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_dur_3to5y_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_dur_6to9y_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_dur_10to19y_rds / markerattrs = (symbol=circle       color=orange size = 12);

scatter x=cald y=o_p_dur_0to3y_AMT/ markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_dur_3to5y_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_dur_6to9y_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_dur_10to19y_AMT / markerattrs = (symbol=circle       color=orange size = 12);

run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners (including periods of inactive sex work)";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2000 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label pmean_p_fsw_newp0__0 = "Model";
label obs_p_0newp_amt = "AMETHIST";
label obs_p_0newp_rds ="SAPPHIRE";
series  x=cald y=pmean_p_fsw_newp0__0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw_newp0__0	 upper=p95_p_fsw_newp0__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=obs_p_0newp_amt/ markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=obs_p_0newp_rds/ markerattrs = (symbol=circle       color=blue size = 12);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "FSW prevalence";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2022 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'per 100 py'              labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);

label pmean_prevalence_sw_0	 = "Model";
label o_prev_fsw_rds = "SAPPHIRE";
label o_prev_fsw_AMT = "AMETHIST";

series  x=cald y=pmean_prevalence_sw_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence_sw_0     upper=p95_prevalence_sw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_prev_fsw_rds/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y=o_prev_fsw_amt/ markerattrs = (symbol=circle color=blue size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of FSW living with HIV, proportion diagnosed";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label pmean_p_diag_sw_0	 = "Model";
label obs_p_diag_fsw_rds= "SAPPHIRE";
label obs_p_diag_fsw_amt= "AMETHIST";

series  x=cald y=pmean_p_diag_sw_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_0    upper=p95_p_diag_sw_0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= obs_p_diag_fsw_rds/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= obs_p_diag_fsw_AMT/ markerattrs = (symbol=circle color=blue size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of FSW diagnosed, proportion on ART";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);

label pmean_p_onart_diag_sw_0	 = "Model";
label obs_p_art_fsw_rds= "SAPPHIRE";
label obs_p_art_fsw_amt= "AMETHIST";

series  x=cald y=pmean_p_onart_diag_sw_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_0    upper=p95_p_onart_diag_sw_0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= obs_p_art_fsw_rds/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= obs_p_art_fsw_AMT/ markerattrs = (symbol=circle color=blue size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of FSW on ART, proportion virally suppressed";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2000 to 2026 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'           labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label pmean_p_onart_vl1000_sw_0	 = "Model";
label obs_p_vs_fsw_rds= "SAPPHIRE";
label obs_p_vs_fsw_amt= "AMETHIST";

series  x=cald y=pmean_p_onart_vl1000_sw_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_0    upper=p95_p_onart_vl1000_sw_0/ transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y= obs_p_vs_fsw_rds/ markerattrs = (symbol=circle color=green size = 12);
scatter x=cald y= obs_p_vs_fsw_AMT/ markerattrs = (symbol=circle color=blue size = 12);
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers who visited a sex worker programme";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2000 to 2023 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_sw_prog_vis_0 = "Model (median) ";

series  x=cald y=p50_p_sw_prog_vis_0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_0	 upper=p95_p_sw_prog_vis_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


*/
