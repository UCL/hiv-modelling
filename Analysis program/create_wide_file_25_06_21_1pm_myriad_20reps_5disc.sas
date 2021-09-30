
libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\VMMC\vmmc20reps_out_vmmc20reps\";


***20 reps;

data b;
set a.out_vmmc20reps:;

proc sort;by run cald option;run;
proc freq;table run ;where cald=2020;run;

data a; set b  ;

**option_new=1 = continuation for 5 years;
**option_new=2 = no further vmmc;
if option=4 then option_new=1;
if option=2 then option_new=2;

proc sort; by run cald option_new;run;

* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a ;
 
if cald=2021.5;
s_alive = s_alive_m + s_alive_w ;
sf_2021 = 10000000 / s_alive;
keep run sf_2021;
proc sort; by run;run;

*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2021;


data y; 
merge a sf;
by run ;

* preparatory code ;

* ================================================================================= ;

if s_pregnant_oth_dol_adv_birth_e = . then s_pregnant_oth_dol_adv_birth_e = 0;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from 2021 - no adjustment needed;
* ts1m - this code needs to change for ts1m;

%let year_start_disc=2021;
discount_3py = 1/(1.03**(cald-&year_start_disc));
discount_5py = 1/(1.05**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_5py;

* ================================================================================= ;



* dalys and life years;

* ================================================================================= ;

ly = s_ly * &sf;
dly = s_dly * &sf;

disc_dead_daly80=s_dead_ddaly_80;
s_ddaly = (s_dead_ddaly_80) + s_live_ddaly_80;

s_ddaly_Op=s_dyll_80 + s_live_ddaly_80;

dead_ddaly_ntd = s_dead_ddaly_ntd * &sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;


ddaly = s_ddaly * &sf * 4;
ddaly_Op = s_ddaly_Op * &sf * 4;

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


ddaly_adults = ddaly;
ddaly_adults_Op = ddaly_Op;




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

***check costs all have _80;

***Redefine VMMC costs to $90 (+/-30 in sens analyses) to match those being used for Zimbabwe and Malawi;;

s_cost_circ_new= (s_cost_circ_80*(90/90));*For sensitivity analyses change to 60/90 and 120/90;
s_dcost_circ_new=&discount*s_cost_circ_new;*use this to calculate dcost_circ below;

* ts1m - 12 instead of 4; 

dzdv_cost = s_cost_zdv_80 * &discount * &sf * 4 / 1000;
dten_cost = s_cost_ten_80 * &discount * &sf * 4 / 1000;
d3tc_cost = s_cost_3tc_80 * &discount * &sf * 4 / 1000; 
dnev_cost = s_cost_nev_80 * &discount * &sf * 4 / 1000;
dlpr_cost = s_cost_lpr_80 * &discount * &sf * 4 / 1000;
ddar_cost = s_cost_dar_80 * &discount * &sf * 4 / 1000;
dtaz_cost = s_cost_taz_80 * &discount * &sf * 4 / 1000;
defa_cost = s_cost_efa_80 * &discount * &sf * 4 / 1000;
ddol_cost = s_cost_dol_80 * &discount * &sf * 4 / 1000;


if s_dart_cost_80=. then s_dart_cost_80=0;
*if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep_80=. then s_dcost_prep_80=0;
if s_dcost_prep_visit_80=. then s_dcost_prep_visit_80=0;
if s_dcost_prep_ac_adh_80=. then s_dcost_prep_ac_adh_80=0;
if s_dcost_circ_80=. then s_dcost_circ_80=0;
if s_dcost_condom_dn_80=. then s_dcost_condom_dn_80=0;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost_80 * &sf * 4 / 1000;
dart_1_cost = s_dart_1_cost_80 * &sf * 4 / 1000;
dart_2_cost = s_dart_2_cost_80 * &sf * 4 / 1000;
dart_3_cost = s_dart_3_cost_80 * &sf * 4 / 1000;
dart_cost = s_dart_cost_80 * &sf * 4 / 1000;
dvl_cost = s_dvl_cost_80 * &sf * 4 / 1000;
dcd4_cost = s_dcd4_cost_80 * &sf * 4 / 1000;
dadc_cost = s_dadc_cost_80 * &sf * 4 / 1000;
dtb_cost = s_dtb_cost_80 * &sf * 4 / 1000;
dtest_cost = s_dtest_cost_80 * &sf * 4 / 1000;
*dwho3_cost = s_dwho3_cost * &sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost_80 * &sf * 4 / 1000;
dcot_cost = s_dcot_cost_80 * &sf * 4 / 1000;
dres_cost = s_dres_cost_80 * &sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost_80 * &sf * 4 / 1000;  
*dcost_cascade_interventions = s_dcost_cascade_interventions * &sf * 4 / 1000;  
dcost_prep = s_dcost_prep_80 * &sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit_80 * &sf * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh_80 * &sf * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death_80 * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost_80 * &sf * 4 / 1000;
dcost_circ = s_dcost_circ_new * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn_80 * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line_80 * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test_80 * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv_80 * &sf * 4 / 1000; * s_cost_child_hiv is discounted cost;
 

dclin_cost = dadc_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost;

* sens analysis;

* dtaz_cost = dtaz_cost * (100 / 180);
* dtaz_cost = dtaz_cost * (50 / 180);
* dzdv_cost = dzdv_cost * (25 / 45);


dart_cost_x = dart_1_cost + dart_2_cost + dart_3_cost; 
dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

* dcost = dart_cost_y + dclin_cost + dcd4_cost + dvl_cost + dvis_cost + dtest_cost + d_t_adh_int_cost + dswitchline_cost
		+dcost_circ + dcost_condom_dn  + dcost_child_hiv  + dcost_non_aids_pre_death ;


dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test + /*dcost_cascade_interventions +*/ dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;

s_cost_art_x = s_cost_zdv_80 + s_cost_ten_80 + s_cost_3tc_80 + s_cost_nev_80 + s_cost_lpr_80 + s_cost_dar_80 + s_cost_taz_80
+ s_cost_efa_80 + s_cost_dol_80 ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 

if &discount gt 0 then cost_clin_care = dcost_clin_care / &discount;

if &discount gt 0 then cost = dcost / &discount;

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




* s_mcirc_1549m;				s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
* s_mcirc_3039m;				s_mcirc_3039m = s_mcirc_3034m + s_mcirc_3539m;
* s_mcirc_4049m;				s_mcirc_4049m = s_mcirc_4044m + s_mcirc_4549m;

* s_vmmc1549m;					s_vmmc1549m = s_vmmc1519m + s_vmmc2024m + s_vmmc2529m + s_vmmc3034m + s_vmmc3539m + s_vmmc4044m + s_vmmc4549m ;
* s_vmmc3039m;					s_vmmc3039m = s_vmmc3034m + s_vmmc3539m;
* s_vmmc4049m;					s_vmmc4049m = s_vmmc4044m + s_vmmc4549m;

* s_new_vmmc1549m;				s_new_vmmc1549m = s_new_vmmc1519m + s_new_vmmc2024m + s_new_vmmc2529m + s_new_vmmc3034m + s_new_vmmc3539m + s_new_vmmc4044m + s_new_vmmc4549m ;
* s_new_vmmc3039m;				s_new_vmmc3039m = s_new_vmmc3034m + s_new_vmmc3539m;
* s_new_vmmc4049m;				s_new_vmmc4049m = s_new_vmmc4044m + s_new_vmmc4549m;

* s_hiv1524m;					s_hiv1524m = s_hiv1519m + s_hiv2024m ;
* s_hiv1524w;					s_hiv1524w = s_hiv1519w + s_hiv2024w ;

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp;
								if gender_r_newp gt 0 then log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;
* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_m1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;

* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf_2021;
* p_newp_sw;					p_newp_sw = s_sw_newp / s_w_newp ;

* n_tested_m;					n_tested_m = s_tested_m * sf_2021 * 4;
* n_tested;						n_tested = s_tested * sf_2021 * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* p_mcirc;						p_mcirc = s_mcirc / s_alive1564_m ;
* p_mcirc_inc1014m;				p_mcirc_inc1014m = (s_mcirc + s_mcirc_1014m)/ (s_alive1564_m + s_ageg1014m);
* p_mcirc_1014m;				if s_ageg1014m gt 0 then p_mcirc_1014m = s_mcirc_1014m / s_ageg1014m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3034m;				p_mcirc_3034m = s_mcirc_3034m / s_ageg3034m ;
* p_mcirc_3039m;				p_mcirc_3539m = s_mcirc_3539m / s_ageg3539m ;
* p_mcirc_3039m;				p_mcirc_3039m = s_mcirc_3039m / (s_ageg3034m + s_ageg3539m) ;
* p_mcirc_4044m;				p_mcirc_4044m = s_mcirc_4044m / s_ageg4044m ;
* p_mcirc_4549m;				p_mcirc_4549m = s_mcirc_4549m / s_ageg4549m ;
* p_mcirc_4049m;				p_mcirc_4049m = s_mcirc_4049m / (s_ageg4044m + s_ageg4549m) ;
* p_mcirc_50plm;				p_mcirc_50plm = s_mcirc_50plm / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;

*new vmmc uptake rate per year (denom=hiv -ve males);
* p_new_vmmc_u;					p_new_vmmc_u = (s_new_vmmc / (s_alive1564_m -s_hiv1564m))*4;
* p_new_vmmc_u_1049m;			p_new_vmmc_u_1049m = ((s_new_vmmc1549m + s_new_vmmc1014m) / ((s_ageg1549m - s_hiv1549m) + (s_ageg1014m)))*4;
* p_new_vmmc_1014m_u;			if (s_ageg1014m) gt 0 then p_new_vmmc_1014m_u = (s_new_vmmc1014m / (s_ageg1014m))*4 ;
* p_new_vmmc_1519m_u;			p_new_vmmc_1519m_u = (s_new_vmmc1519m / (s_ageg1519m - s_hiv1519m))*4;
* p_new_vmmc_2024m_u;			p_new_vmmc_2024m_u = (s_new_vmmc2024m / (s_ageg2024m - s_hiv2024m))*4;
* p_new_vmmc_2529m_u;			p_new_vmmc_2529m_u = (s_new_vmmc2529m / (s_ageg2529m - s_hiv2529m))*4;
* p_new_vmmc_3034m_u;			if s_ageg3034m gt 0 then p_new_vmmc_3034m_u = (s_new_vmmc3034m / (s_ageg3034m - s_hiv3034m))*4;
* p_new_vmmc_3539m_u;			if s_ageg3539m gt 0 then p_new_vmmc_3539m_u = (s_new_vmmc3539m / (s_ageg3539m - s_hiv3539m))*4;
* p_new_vmmc_3039m_u;			if (s_ageg3034m + s_ageg3539m) gt 0 then 
								p_new_vmmc_3039m_u = (s_new_vmmc3039m / ((s_ageg3034m + s_ageg3539m) - (s_hiv3034m + s_hiv3539m)))*4;
* p_new_vmmc_4044m_u;			if s_ageg4044m gt 0 then p_new_vmmc_4044m_u = (s_new_vmmc4044m / (s_ageg4044m - s_hiv4044m))*4 ;
* p_new_vmmc_4549m_u;			if (s_ageg4549m-s_hiv4549m) gt 0 then p_new_vmmc_4549m_u = (s_new_vmmc4549m / (s_ageg4549m - s_hiv4549m))*4 ;
* p_new_vmmc_4049m_u;			if (s_ageg4044m + s_ageg4549m) gt 0 then  
								p_new_vmmc_4049m_u = (s_new_vmmc4049m / ((s_ageg4044m + s_ageg4549m) - (s_hiv4044m + s_hiv4549m)))*4 ;
* p_new_vmmc_50plm_u;			p_new_vmmc_50plm_u = (s_new_vmmc50plm / ((s_ageg5054m + s_ageg5559m + s_ageg6064m) - (s_hiv5054m + s_hiv5559m + s_hiv6064m)))*4 ;
* p_new_vmmc_1549m_u;			p_new_vmmc_1549m_u = (s_new_vmmc1549m / (s_ageg1549m - s_hiv1549m ))*4;

*% vmmc ;
* p_vmmc;						p_vmmc = s_vmmc /s_alive1564_m ;
* p_vmmc_inc1014m;				p_vmmc_inc1014m = (s_vmmc + s_vmmc1014m) / (s_alive1564_m + s_ageg1014m);
* p_vmmc_1014m;					if s_ageg1014m gt 0 then p_vmmc_1014m = s_vmmc1014m / s_ageg1014m ;
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

* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;
* prop_elig_on_prep;			if s_elig_prep then prop_elig_on_prep = s_prep / s_elig_prep ; 
* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;
* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;


* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive1564 - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep;						n_prep = s_prep * sf_2021;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf_2021;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * sf_2021;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* av_prep_eff_non_res_v;  		if s_prep > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf_2021;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf_2021;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf_2021;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * sf_2021;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf_2021;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf_2021;

* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				if s_prep gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep ;

* av_prep_eff_non_res_v;        if s_prep > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* ts1m - below change 4 to 12;
* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1564;				incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);

* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);


* incidence1524w;				incidence1524w = ((s_primary1519w + s_primary2024w) * 4 * 100) / 
									(s_ageg1519w + s_ageg2024w - s_hiv1519w - s_hiv2024w + s_primary1519w + s_primary2024w);
* incidence1524m;				incidence1524m = ((s_primary1519m + s_primary2024m) * 4 * 100) / 
									(s_ageg1519m + s_ageg2024m - s_hiv1519m - s_hiv2024m + s_primary1519m + s_primary2024m);

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

* prevalence1524w;				prevalence1524w =  s_hiv1524w  / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m =  s_hiv1524m  / (s_ageg1519m + s_ageg2024m) ;

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

* derived variables relating to people with hiv ;
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
* prev_vg1000_newp_m;			if s_m_newp gt 0 then prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			if s_w_newp gt 0 then prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hiv1564 > 0 then r_efa_hiv = s_r_efa / s_hiv1564 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;
								if s_hiv1564 gt 0 then do;
* p_iime_;						p_iime_ = s_iime_ / s_hiv1564 ;
* p_pime_;						p_pime_ = s_pime_ / s_hiv1564 ;
* p_nnme_;						p_nnme_ = s_nnme_ / s_hiv1564 ;
								end;
* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

* aids_death_rate;				if s_hiv1564 gt 0 then aids_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;
* death_rate_onart;				if s_onart gt 0 then death_rate_onart = (4 * 100 * s_dead_onart) / s_onart ;
* death_rate_artexp;			if s_artexp gt 0 then death_rate_artexp = (4 * 100 * s_dead_artexp / s_artexp);
* death_rate;					if s_hiv1564 > 0 then death_rate= (4 * 100 * s_dead1564_) / s_hiv1564;
* death_rate_hiv; 				if s_hiv1564 > 0 then death_rate_hiv = (4 * 100 * s_death_hiv) / s_hiv1564;
				 				if s_hiv1564m > 0 then death_rate_hiv_m = (4 * 100 * s_death_hiv_m) / s_hiv1564m;
								if s_hiv1564w > 0 then death_rate_hiv_w = (4 * 100 * s_death_hiv_w) / s_hiv1564w;
* death_rate_hiv_all;			if s_alive1564 > 0 then death_rate_hiv_all = (4 * 100 * s_death_hiv) / s_alive1564;
				 				if s_alive1564_m > 0 then death_rate_hiv_all_m = (4 * 100 * s_death_hiv_m) / s_alive1564_m;
								if s_alive1564_w > 0 then death_rate_hiv_all_w = (4 * 100 * s_death_hiv_w) / s_alive1564_w;

* n_onart;						n_onart = s_onart * sf_2021 ;
* n_diag;						n_diag = s_diag_this_period * sf_2021 * 4 ;
* n_start_line2;				n_start_line2 = s_start_line2_this_period * sf_2021 * 4 ;
* n_vl_test_done;				n_vl_test_done = (s_vl_cost / 0.022  )  * sf_2021 * 4 ;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * sf_2021;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * sf_2021;
* n_death;						n_death = s_dead_allage * sf_2021;
* n_covid;						n_covid = s_covid * sf_2021;
								inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid;

* n_death_discount;				n_death_discount = n_death*&discount;
* death_rate_all_discount;		death_rate_all_discount = (4 * 100 * s_dead_allage) / (s_alive_w + s_alive_m) ;


* n_give_birth_w_hiv;			n_give_birth_w_hiv = s_give_birth_with_hiv * sf_2021 * 4; * number of women with hiv giving birth per year;
* n_birth_with_inf_child;		n_birth_with_inf_child = s_birth_with_inf_child * sf_2021 * 4;
* n_pregnant_ntd;				s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058); n_pregnant_ntd = s_pregnant_ntd    * sf_2021 * 4 ; 
								* number pregnant with baby with neural tube defect;

* n_preg_odabe;					n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf_2021 * 4;  
								* annual number of pregnancies with other adverse dol birth event;


* n_mcirc1549_py;				n_mcirc1549_py =	s_mcirc_1549m * sf_2021 * 4;
* n_mcirc1549_3m;				n_mcirc1549_3m =	s_mcirc_1549m * sf_2021;
* n_vmmc1549_py;				n_vmmc1549_py =		s_vmmc1549m * sf_2021 * 4;
* n_vmmc1549_3m;				n_vmmc1549_3m =		s_vmmc1549m * sf_2021;
* n_new_vmmc1549_py;			n_new_vmmc1549_py =	s_new_vmmc1549m * sf_2021 * 4;
* n_new_vmmc1049_py;			n_new_vmmc1049_py = (s_new_vmmc1549m + s_new_vmmc1014m) * sf_2021 * 4;

* n_new_inf1549m;				n_new_inf1549m=s_primary1549m * sf_2021 * 4;
* n_new_inf1549;				n_new_inf1549=s_primary1549 * sf_2021 * 4;
* n_infection;					n_infection  = s_primary     * sf_2021 * 4;

* d_n_new_inf1549;				d_n_new_inf1549 = &discount * n_new_inf1549;
* d_n_infection;				d_n_infection = &discount * n_infection;


* n_ageg1519m ;					n_ageg1519m = s_ageg1519m * sf_2021 ;
* n_ageg2024m ;					n_ageg2024m = s_ageg2024m * sf_2021 ;
* n_ageg2529m ;					n_ageg2529m = s_ageg2529m * sf_2021 ;
* n_ageg3034m ;					n_ageg3034m = s_ageg3034m * sf_2021 ;
* n_ageg3539m ;					n_ageg3539m = s_ageg3539m * sf_2021 ;
* n_ageg4044m ;					n_ageg4044m = s_ageg4044m * sf_2021 ;
* n_ageg4549m ;					n_ageg4549m = s_ageg4549m * sf_2021 ;
* n_ageg5054m ;					n_ageg5054m = s_ageg5054m * sf_2021 ;
* n_ageg5559m ;					n_ageg5559m = s_ageg5559m * sf_2021 ;
* n_ageg6064m ;					n_ageg6064m = s_ageg6064m * sf_2021 ;
* n_ageg6569m ;					n_ageg6569m = s_ageg6569m * sf_2021 ;
* n_ageg7074m ;					n_ageg7074m = s_ageg7074m * sf_2021 ;
* n_ageg7579m ;					n_ageg7579m = s_ageg7579m * sf_2021 ;
* n_ageg8084m ;					n_ageg8084m = s_ageg8084m * sf_2021 ;
* n_ageg85plw ;					n_ageg85plw  = s_ageg85plw * sf_2021 ;
* n_ageg1519w ;					n_ageg1519w = s_ageg1519w * sf_2021 ;
* n_ageg2024w ;					n_ageg2024w = s_ageg2024w * sf_2021 ;
* n_ageg2529w ;					n_ageg2529w = s_ageg2529w * sf_2021 ;
* n_ageg3034w ;					n_ageg3034w = s_ageg3034w * sf_2021 ;
* n_ageg3539w ;					n_ageg3539w = s_ageg3539w * sf_2021 ;
* n_ageg4044w ;					n_ageg4044w = s_ageg4044w * sf_2021 ;
* n_ageg4549w ;					n_ageg4549w = s_ageg4549w * sf_2021 ;
* n_ageg5054w ;					n_ageg5054w = s_ageg5054w * sf_2021 ;
* n_ageg5559w ;					n_ageg5559w = s_ageg5559w * sf_2021 ;
* n_ageg6064w ;					n_ageg6064w = s_ageg6064w * sf_2021 ;
* n_ageg6569w ;					n_ageg6569w = s_ageg6569w * sf_2021 ;
* n_ageg7074w ;					n_ageg7074w = s_ageg7074w * sf_2021 ;
* n_ageg7579w ;					n_ageg7579w = s_ageg7579w * sf_2021 ;
* n_ageg8084w ;					n_ageg8084w = s_ageg8084w * sf_2021 ;
* n_ageg85plw ;					n_ageg85plw  = s_ageg85plw * sf_2021 ;

* n_onart_m1519 ;				n_onart_m1519 = s_onart_m1519_  * sf_2021 ;
* n_onart_m2024 ;				n_onart_m2024 = s_onart_m2024_  * sf_2021 ;
* n_onart_m2529 ;				n_onart_m2529 = s_onart_m2529_  * sf_2021 ;
* n_onart_m3034 ;				n_onart_m3034 = s_onart_m3034_  * sf_2021 ;
* n_onart_m3539 ;				n_onart_m3539 = s_onart_m3539_  * sf_2021 ;
* n_onart_m4044 ;				n_onart_m4044 = s_onart_m4044_  * sf_2021 ;
* n_onart_m4549 ;				n_onart_m4549 = s_onart_m4549_  * sf_2021 ;
* n_onart_m5054 ;				n_onart_m5054 = s_onart_m5054_  * sf_2021 ;
* n_onart_m5559 ;				n_onart_m5559 = s_onart_m5559_  * sf_2021 ;
* n_onart_m6064 ;				n_onart_m6064 = s_onart_m6064_  * sf_2021 ;
* n_onart_m6569 ;				n_onart_m6569 = s_onart_m6569_  * sf_2021 ;
* n_onart_m7074 ;				n_onart_m7074 = s_onart_m7074_  * sf_2021 ;
* n_onart_m7579 ;				n_onart_m7579 = s_onart_m7579_  * sf_2021 ;
* n_onart_m8084 ;				n_onart_m8084 = s_onart_m8084_  * sf_2021 ;
* n_onart_m85pl ;				n_onart_m85pl = s_onart_m85pl_  * sf_2021 ;
* n_onart_w1519 ;				n_onart_w1519 = s_onart_w1519_  * sf_2021 ;
* n_onart_w2024 ;				n_onart_w2024 = s_onart_w2024_  * sf_2021 ;
* n_onart_w2529 ;				n_onart_w2529 = s_onart_w2529_  * sf_2021 ;
* n_onart_w3034 ;				n_onart_w3034 = s_onart_w3034_  * sf_2021 ;
* n_onart_w3539 ;				n_onart_w3539 = s_onart_w3539_  * sf_2021 ;
* n_onart_w4044 ;				n_onart_w4044 = s_onart_w4044_  * sf_2021 ;
* n_onart_w4549 ;				n_onart_w4549 = s_onart_w4549_  * sf_2021 ;
* n_onart_w5054 ;				n_onart_w5054 = s_onart_w5054_  * sf_2021 ;
* n_onart_w5559 ;				n_onart_w5559 = s_onart_w5559_  * sf_2021 ;
* n_onart_w6064 ;				n_onart_w6064 = s_onart_w6064_  * sf_2021 ;
* n_onart_w6569 ;				n_onart_w6569 = s_onart_w6569_  * sf_2021 ;
* n_onart_w7074 ;				n_onart_w7074 = s_onart_w7074_  * sf_2021 ;
* n_onart_w7579 ;				n_onart_w7579 = s_onart_w7579_  * sf_2021 ;
* n_onart_w8084 ;				n_onart_w8084 = s_onart_w8084_  * sf_2021 ;
* n_onart_w85pl ;				n_onart_w85pl = s_onart_w85pl_  * sf_2021 ;

* n_mcirc_1014m ;				n_mcirc_1014m = s_mcirc_1014m * sf_2021 ;
* n_mcirc_1519m ;				n_mcirc_1519m = s_mcirc_1519m * sf_2021 ;
* n_mcirc_2024m ;				n_mcirc_2024m = s_mcirc_2024m * sf_2021 ;
* n_mcirc_2529m ;				n_mcirc_2529m = s_mcirc_2529m * sf_2021 ;
* n_mcirc_3034m ;				n_mcirc_3034m = s_mcirc_3034m * sf_2021 ;
* n_mcirc_3539m ;				n_mcirc_3539m = s_mcirc_3539m * sf_2021 ;
* n_mcirc_4044m ;				n_mcirc_4044m = s_mcirc_4044m * sf_2021 ;
* n_mcirc_4549m ;				n_mcirc_4549m = s_mcirc_4549m * sf_2021 ;
* n_mcirc_5054m ;				n_mcirc_5054m = s_mcirc_5054m * sf_2021 ;
* n_mcirc_5559m ;				n_mcirc_5559m = s_mcirc_5559m * sf_2021 ;
* n_mcirc_6064m ;				n_mcirc_6064m = s_mcirc_6064m * sf_2021 ;
* n_mcirc_6569m ;				n_mcirc_6569m = s_mcirc_6569m * sf_2021 ;
* n_mcirc_7074m ;				n_mcirc_7074m = s_mcirc_7074m * sf_2021 ;
* n_mcirc_7579m ;				n_mcirc_7579m = s_mcirc_7579m * sf_2021 ;
* n_mcirc_8084m ;				n_mcirc_8084m = s_mcirc_8084m * sf_2021 ;
* n_mcirc_85plm ;				n_mcirc_85plm = s_mcirc_85plm * sf_2021 ;

* n_new_mcirc_1014m ;			n_new_mcirc_1014m = s_new_mcirc_1014m * sf_2021 ;
* n_new_mcirc_1519m ;			n_new_mcirc_1519m = s_new_mcirc_1519m * sf_2021 ;
* n_new_mcirc_2024m ;			n_new_mcirc_2024m = s_new_mcirc_2024m * sf_2021 ;
* n_new_mcirc_2529m ;			n_new_mcirc_2529m = s_new_mcirc_2529m * sf_2021 ;
* n_new_mcirc_3034m ;			n_new_mcirc_3034m = s_new_mcirc_3034m * sf_2021 ;
* n_new_mcirc_3539m ;			n_new_mcirc_3539m = s_new_mcirc_3539m * sf_2021 ;
* n_new_mcirc_4044m ;			n_new_mcirc_4044m = s_new_mcirc_4044m * sf_2021 ;
* n_new_mcirc_4549m ;			n_new_mcirc_4549m = s_new_mcirc_4549m * sf_2021 ;
* n_new_mcirc_5054m ;			n_new_mcirc_5054m = s_new_mcirc_5054m * sf_2021 ;
* n_new_mcirc_5559m ;			n_new_mcirc_5559m = s_new_mcirc_5559m * sf_2021 ;
* n_new_mcirc_6064m ;			n_new_mcirc_6064m = s_new_mcirc_6064m * sf_2021 ;
* n_new_mcirc_6569m ;			n_new_mcirc_6569m = s_new_mcirc_6569m * sf_2021 ;
* n_new_mcirc_7074m ;			n_new_mcirc_7074m = s_new_mcirc_7074m * sf_2021 ;
* n_new_mcirc_7579m ;			n_new_mcirc_7579m = s_new_mcirc_7579m * sf_2021 ;
* n_new_mcirc_8084m ;			n_new_mcirc_8084m = s_new_mcirc_8084m * sf_2021 ;
* n_new_mcirc_85plm ;			n_new_mcirc_85plm = s_new_mcirc_85plm * sf_2021 ;

* n_new_inf_1519m ;				n_new_inf_1519m = s_primary1519m  * sf_2021 ;
* n_new_inf_2024m ;				n_new_inf_2024m = s_primary2024m  * sf_2021 ;
* n_new_inf_2529m ;				n_new_inf_2529m = s_primary2529m  * sf_2021 ;
* n_new_inf_3034m ;				n_new_inf_3034m = s_primary3034m  * sf_2021 ;
* n_new_inf_3539m ;				n_new_inf_3539m = s_primary3539m  * sf_2021 ;
* n_new_inf_4044m ;				n_new_inf_4044m = s_primary4044m  * sf_2021 ;
* n_new_inf_4549m ;				n_new_inf_4549m = s_primary4549m  * sf_2021 ;
* n_new_inf_5054m ;				n_new_inf_5054m = s_primary5054m  * sf_2021 ;
* n_new_inf_5559m ;				n_new_inf_5559m = s_primary5559m  * sf_2021 ;
* n_new_inf_6064m ;				n_new_inf_6064m = s_primary6064m  * sf_2021 ;
* n_new_inf_1519w ;				n_new_inf_1519w = s_primary1519w  * sf_2021 ;
* n_new_inf_2024w ;				n_new_inf_2024w = s_primary2024w  * sf_2021 ;
* n_new_inf_2529w ;				n_new_inf_2529w = s_primary2529w  * sf_2021 ;
* n_new_inf_3034w ;				n_new_inf_3034w = s_primary3034w  * sf_2021 ;
* n_new_inf_3539w ;				n_new_inf_3539w = s_primary3539w  * sf_2021 ;
* n_new_inf_4044w ;				n_new_inf_4044w = s_primary4044w  * sf_2021 ;
* n_new_inf_4549w ;				n_new_inf_4549w = s_primary4549w  * sf_2021 ;
* n_new_inf_5054w ;				n_new_inf_5054w = s_primary5054w  * sf_2021 ;
* n_new_inf_5559w ;				n_new_inf_5559w = s_primary5559w  * sf_2021 ;
* n_new_inf_6064w ;				n_new_inf_6064w = s_primary6064w  * sf_2021 ;

* n_hiv1519m ; 					n_hiv1519m = s_hiv1519m  * sf_2021 ;
* n_hiv2024m ; 					n_hiv2024m = s_hiv2024m  * sf_2021 ;
* n_hiv2529m ; 					n_hiv2529m = s_hiv2529m  * sf_2021 ;
* n_hiv3034m ; 					n_hiv3034m = s_hiv3034m  * sf_2021 ;
* n_hiv3539m ; 					n_hiv3539m = s_hiv3539m  * sf_2021 ;
* n_hiv4044m ; 					n_hiv4044m = s_hiv4044m  * sf_2021 ;
* n_hiv4549m ; 					n_hiv4549m = s_hiv4549m  * sf_2021 ;
* n_hiv5054m ; 					n_hiv5054m = s_hiv5054m  * sf_2021 ;
* n_hiv5559m ; 					n_hiv5559m = s_hiv5559m  * sf_2021 ;
* n_hiv6064m ; 					n_hiv6064m = s_hiv6064m  * sf_2021 ;
* n_hiv6569m ; 					n_hiv6569m = s_hiv6569m  * sf_2021 ;
* n_hiv7074m ; 					n_hiv7074m = s_hiv7074m  * sf_2021 ;
* n_hiv7579m ; 					n_hiv7579m = s_hiv7579m  * sf_2021 ;
* n_hiv8084m ; 					n_hiv8084m = s_hiv8084m  * sf_2021 ;
* n_hiv85plm ; 					n_hiv85plm = s_hiv85plm  * sf_2021 ;
* n_hiv1519w ; 					n_hiv1519w = s_hiv1519w  * sf_2021 ;
* n_hiv2024w ; 					n_hiv2024w = s_hiv2024w  * sf_2021 ;
* n_hiv2529w ; 					n_hiv2529w = s_hiv2529w  * sf_2021 ;
* n_hiv3034w ; 					n_hiv3034w = s_hiv3034w  * sf_2021 ;
* n_hiv3539w ; 					n_hiv3539w = s_hiv3539w  * sf_2021 ;
* n_hiv4044w ; 					n_hiv4044w = s_hiv4044w  * sf_2021 ;
* n_hiv4549w ; 					n_hiv4549w = s_hiv4549w  * sf_2021 ;
* n_hiv5054w ; 					n_hiv5054w = s_hiv5054w  * sf_2021 ;
* n_hiv5559w ; 					n_hiv5559w = s_hiv5559w  * sf_2021 ;
* n_hiv6064w ; 					n_hiv6064w = s_hiv6064w  * sf_2021 ;
* n_hiv6569w ; 					n_hiv6569w = s_hiv6569w  * sf_2021 ;
* n_hiv7074w ; 					n_hiv7074w = s_hiv7074w  * sf_2021 ;
* n_hiv7579w ; 					n_hiv7579w = s_hiv7579w  * sf_2021 ;
* n_hiv8084w ; 					n_hiv8084w = s_hiv8084w  * sf_2021 ;
* n_hiv85plw ; 					n_hiv85plw = s_hiv85plw  * sf_2021 ;


keep run option option_new cald /*dataset*/
s_alive p_w_giv_birth_this_per p_newp_ge1 p_1524_newp_ge1 p_newp_ge5 p_newp_ge1_age1549 gender_r_newp  
p_newp_sw  n_tested_m   p_tested_past_year_1549m  p_tested_past_year_1549w
p_diag_m1524 p_diag_w1524 p_diag_sw  p_onart_cd4_l200
p_mcirc  p_mcirc_inc1014m  p_mcirc_1014m  p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3034m p_mcirc_3539m p_mcirc_3039m
p_mcirc_4044m p_mcirc_4549m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
p_vmmc  p_vmmc_inc1014m  p_vmmc_1014m  p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_50plm p_vmmc_1549m
p_new_vmmc_u  p_new_vmmc_u_1049m  p_new_vmmc_1014m_u  p_new_vmmc_1519m_u p_new_vmmc_2024m_u p_new_vmmc_2529m_u 
p_new_vmmc_3034m_u  p_new_vmmc_3539m_u  p_new_vmmc_3039m_u  p_new_vmmc_4044m_u  p_new_vmmc_4549m_u  p_new_vmmc_4049m_u p_new_vmmc_50plm_u p_new_vmmc_1549m_u
prop_w_1549_sw	prop_w_ever_sw prop_sw_hiv prop_w_1524_onprep prop_1564_onprep prop_sw_onprep p_prep_adhg80  av_prep_eff_non_res_v
prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 			
prevalence1524w prevalence1524m  prevalence_sw
incidence1549 incidence1564 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary mtct_prop
p_diag p_diag_m p_diag_w p_ai_no_arv_c_nnm prop_sw_newp0
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm
p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw
p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524    
p_onart_m p_onart_w p_onart_vl1000_w p_onart_vl1000_m  p_onart_vl1000_1524	  p_onart_vl1000_sw
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w  p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly_adults  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dwho3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost dcost_cascade_intervntn     dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564  prop_sw_onprep  p_onart  p_vl1000_art_12m  p_vl1000_art_12m_onart
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m  p_artexp_vl1000
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000 p_vlg1000_184m p_vlg1000_65m
death_rate  death_rate_hiv death_rate_hiv_w  death_rate_hiv_m death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w p_iime_   p_pime_   p_nnme_  n_pregnant_ntd  n_preg_odabe
n_birth_with_inf_child  n_tested  p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep  n_covid  n_death_covid n_death n_death_hivrel p_death_hivrel_age_le64 
p_prep_ever  p_hiv1_prep incidence1524w   incidence1524m  test_prop_positive  p_newp_prep n_infection 
p_newp_this_per_prep  p_newp_prep_hivneg  av_prep_eff_non_res_v

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

exp_setting_lower_p_vl1000  
external_exp_factor   rate_exp_set_lower_p_vl1000    max_freq_testing  
test_targeting    prob_loss_at_diag   pr_art_init   
rate_lost   prob_lost_art   rate_return   rate_restart   rate_int_choice  
clinic_not_aw_int_frac    rate_loss_persistence   incr_rate_int_low_adh  
fold_change_mut_risk   adh_effect_of_meas_alert   pr_switch_line   prob_vl_meas_done  
red_adh_tb_adc   red_adh_tox_pop   add_eff_adh_nnrti   altered_adh_sec_line_pop  
prob_return_adc   prob_lossdiag_adctb   prob_lossdiag_who3e  higher_newp_less_engagement  
fold_tr   switch_for_tox   adh_pattern_prep    base_rate_sw  lower_future_art_cov

condom_incr_2020     			cascade_care_improvements  incr_test_2020              decr_hard_reach_2020   
decr_prob_loss_at_diag_2020  	decr_rate_lost_2020 		decr_rate_lost_art_2020     incr_rate_return_2020      
incr_rate_restart_2020         incr_rate_init_2020        decr_rate_int_choice_2020  
incr_prob_vl_meas_done_2020  
incr_pr_switch_line_2020     	prep_improvements        	incr_adh_pattern_prep_2020  
inc_r_test_startprep_2020  incr_r_test_restartprep_2020  decr_r_choose_stop_prep_2020  
inc_p_prep_restart_choi_2020 incr_prepuptake_sw_2020    incr_prepuptake_pop_2020   
circ_improvements  			circ_inc_rate_2020  		incr_test_targeting_2020    pop_wide_tld_2020 
incr_max_freq_testing_2020     initial_pr_switch_line     initial_prob_vl_meas_done   sw_test_6mthly_2020  
reg_option_switch_2020      art_mon_drug_levels_2020       ten_is_taf_2020    

eff_max_freq_testing  		eff_rate_restart   		eff_prob_loss_at_diag   		eff_rate_lost   		
eff_prob_lost_art   		eff_rate_return   
eff_pr_art_init   	eff_rate_int_choice   	eff_prob_vl_meas_done   		eff_pr_switch_line   	
eff_rate_test_startprep   	eff_rate_test_restartprep   	
eff_rate_choose_stop_prep   		eff_prob_prep_restart_choice   	
e_decr_hard_reach_2020  eff_test_targeting  prep_strategy 
vmmc_disrup_covid  condom_disrup_covid  prep_disrup_covid  swprog_disrup_covid  
testing_disrup_covid  art_tld_disrup_covid  art_tld_eod_disrup_covid   art_init_disrup_covid   
vl_adh_switch_disrup_covid  cotrim_disrup_covid    no_art_disrup_covid 
inc_adeathr_disrup_covid art_low_adh_disrup_covid  cov_death_risk_mult lower_future_art_cov
 
eff_rate_test_startprep   	eff_rate_test_restartprep   	
eff_rate_choose_stop_prep   		eff_prob_prep_restart_choice   	
n_ageg1519m  n_ageg2024m  n_ageg2529m  n_ageg3034m  n_ageg3539m  n_ageg4044m  n_ageg4549m  n_ageg5054m  n_ageg5559m  n_ageg6064m  n_ageg6569m 
n_ageg7074m  n_ageg7579m  n_ageg8084m  n_ageg85plw  n_ageg1519w n_ageg2024w  n_ageg2529w  n_ageg3034w  n_ageg3539w  n_ageg4044w  n_ageg4549w 
n_ageg5054w  n_ageg5559w  n_ageg6064w n_ageg6569w  n_ageg7074w  n_ageg7579w  n_ageg8084w  n_ageg85plw  n_onart_m1519 
n_onart_m2024  n_onart_m2529 n_onart_m3034  n_onart_m3539  n_onart_m4044  n_onart_m4549  n_onart_m5054  n_onart_m5559  n_onart_m6064  n_onart_m7074 
n_onart_m7074  n_onart_m7579  n_onart_m8084  n_onart_m85pl  n_onart_w1519  n_onart_w2024  n_onart_w2529  n_onart_w3034  n_onart_w3539  n_onart_w4044 
n_onart_w4549 n_onart_w5054 n_onart_w5559 n_onart_w6064 n_onart_w6569 n_onart_w7074 n_onart_w7579 n_onart_w8084 n_onart_w85pl n_mcirc_1014m 		
n_mcirc_1519m  n_mcirc_2024m  n_mcirc_2529m  n_mcirc_3034m  n_mcirc_3539m  n_mcirc_4044m n_mcirc_4549m  n_mcirc_5054m  n_mcirc_5559m  n_mcirc_6064m 
n_mcirc_6569m n_mcirc_7074m n_mcirc_7579m n_mcirc_8084m n_mcirc_85plm n_new_mcirc_1014m n_new_mcirc_1519m n_new_mcirc_2024m n_new_mcirc_2529m 
n_new_mcirc_3034m  n_new_mcirc_3539m  n_new_mcirc_4044m  n_new_mcirc_4549m  n_new_mcirc_5054m n_new_mcirc_5559m n_new_mcirc_6064m  n_new_mcirc_6569m 
n_new_mcirc_7074m  n_new_mcirc_7579m  n_new_mcirc_8084m  n_new_mcirc_85plm  n_new_inf_1519m  n_new_inf_2024m  n_new_inf_2529m  n_new_inf_3034m 
n_new_inf_3539m  n_new_inf_4044m  n_new_inf_4549m  n_new_inf_5054m  n_new_inf_5559m  n_new_inf_6064m  n_new_inf_1519w  n_new_inf_2024w  n_new_inf_2529w 
n_new_inf_3034w  n_new_inf_3539w n_new_inf_4044w n_new_inf_4549w  n_new_inf_5054w  n_new_inf_5559w n_new_inf_6064w  n_hiv1519m  n_hiv2024m n_hiv2529m
n_hiv3034m  n_hiv3539m  n_hiv4044m  n_hiv4549m  n_hiv5054m  n_hiv5559m  n_hiv6064m  n_hiv6569m  n_hiv7074m  n_hiv7579m n_hiv8084m n_hiv85plm 
n_hiv1519w  n_hiv2024w  n_hiv2529w  n_hiv3034w  n_hiv3539w  n_hiv4044w n_hiv4549w n_hiv5054w  n_hiv5559w n_hiv6064w  n_hiv6569w  n_hiv7074w n_hiv7579w 
n_hiv8084w  n_hiv85plw
n_onart n_diag n_start_line2 n_vl_test_done
n_mcirc1549_py  n_mcirc1549_3m  n_vmmc1549_py n_vmmc1549_3m  n_new_vmmc1549_py n_new_vmmc1049_py  n_new_inf1549m  n_new_inf1549 d_n_new_inf1549 d_n_infection
s_sw_newp incidence_sw ddaly ddaly_adults_Op disc_dead_daly80 s_live_ddaly_80;;
proc sort data=y;by run option_new;run;


*F=final;
data a.vmmc_25_06_21_10r_20reps_F_5disc; set y;run;
data y; set a.vmmc_25_06_21_10r_20reps_F_5disc;run;

proc sort;by run option_new;run;


  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2021.5 <= cald < 2022.5; 

***outputs in 2040;
proc means noprint data=y; var &v; output out=y_40_41 mean= &v._40_41; by run option_new ; where 2040.0 <= cald < 2041.0; 

proc means noprint data=y; var &v; output out=y_20_21 mean= &v._20_21; by run option_new ; where 2020.5 <= cald < 2021.5;
proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run option_new ; where 2021.5 <= cald < 2022.5;

proc means noprint data=y; var &v; output out=y_21_26 mean= &v._21_26; by run option_new ; where 2021.5 <= cald < 2026.50;
proc means noprint data=y; var &v; output out=y_21_41 mean= &v._21_41; by run option_new ; where 2021.5 <= cald < 2041.50;
proc means noprint data=y; var &v; output out=y_21_71 mean= &v._21_71; by run option_new ; where 2021.5 <= cald < 2071.50;

proc sort data=y_40_41; by run; proc transpose data=y_40_41 out=t_40_41 prefix=&v._40_41_; var &v._40_41; by run;
proc sort data=y_20_21; by run; proc transpose data=y_20_21 out=t_20_21 prefix=&v._20_21_; var &v._20_21; by run;
proc sort data=y_21_22; by run; proc transpose data=y_21_22 out=t_21_22 prefix=&v._21_22_; var &v._21_22; by run;
proc sort data=y_21_26; by run; proc transpose data=y_21_26 out=t_21_26 prefix=&v._21_26_; var &v._21_26; by run;
proc sort data=y_21_41; by run; proc transpose data=y_21_41 out=t_21_41 prefix=&v._21_41_; var &v._21_41; by run;
proc sort data=y_21_71; by run; proc transpose data=y_21_71 out=t_21_71 prefix=&v._21_71_; var &v._21_71; by run;


data &v ; merge  y_21 t_40_41 t_20_21 t_21_22 t_21_26 t_21_41 t_21_71 ;  
/* data &v ; merge    y_19 y_20 t_20b t_21 t_20_21  t_20_25  t_20_70 ; */ 

/*
%macro var(v=);
proc means noprint data=y; var &v; output out=y_20_ mean= &v._20_; by run option_new ; where 2020 <= cald < 2021;
proc means noprint data=y; var &v; output out=y_21_ mean= &v._21_; by run option_new ; where 2021 <= cald < 2022;
proc means noprint data=y; var &v; output out=y_22_ mean= &v._22_; by run option_new ; where 2022 <= cald < 2023;
proc means noprint data=y; var &v; output out=y_23_ mean= &v._23_; by run option_new ; where 2023 <= cald < 2024;
proc means noprint data=y; var &v; output out=y_24_ mean= &v._24_; by run option_new ; where 2024 <= cald < 2025;
proc means noprint data=y; var &v; output out=y_25_ mean= &v._25_; by run option_new ; where 2025 <= cald < 2026;
proc means noprint data=y; var &v; output out=y_26_ mean= &v._26_; by run option_new ; where 2026 <= cald < 2027;
proc means noprint data=y; var &v; output out=y_27_ mean= &v._27_; by run option_new ; where 2027 <= cald < 2028;
proc means noprint data=y; var &v; output out=y_28_ mean= &v._28_; by run option_new ; where 2028 <= cald < 2029;
proc means noprint data=y; var &v; output out=y_29_ mean= &v._29_; by run option_new ; where 2029 <= cald < 2030;
proc means noprint data=y; var &v; output out=y_30_ mean= &v._30_; by run option_new ; where 2030 <= cald < 2031;

proc means noprint data=y; var &v; output out=y_31_ mean= &v._31_; by run option_new ; where 2031 <= cald < 2032;
proc means noprint data=y; var &v; output out=y_32_ mean= &v._32_; by run option_new ; where 2032 <= cald < 2033;
proc means noprint data=y; var &v; output out=y_33_ mean= &v._33_; by run option_new ; where 2033 <= cald < 2034;
proc means noprint data=y; var &v; output out=y_34_ mean= &v._34_; by run option_new ; where 2034 <= cald < 2035;
proc means noprint data=y; var &v; output out=y_35_ mean= &v._35_; by run option_new ; where 2035 <= cald < 2036;
proc means noprint data=y; var &v; output out=y_36_ mean= &v._36_; by run option_new ; where 2036 <= cald < 2037;
proc means noprint data=y; var &v; output out=y_37_ mean= &v._37_; by run option_new ; where 2037 <= cald < 2038;
proc means noprint data=y; var &v; output out=y_38_ mean= &v._38_; by run option_new ; where 2038 <= cald < 2039;
proc means noprint data=y; var &v; output out=y_39_ mean= &v._39_; by run option_new ; where 2039 <= cald < 2040;
proc means noprint data=y; var &v; output out=y_40_ mean= &v._40_; by run option_new ; where 2040 <= cald < 2041;

proc means noprint data=y; var &v; output out=y_41_ mean= &v._41_; by run option_new ; where 2041 <= cald < 2042;
proc means noprint data=y; var &v; output out=y_42_ mean= &v._42_; by run option_new ; where 2042 <= cald < 2043;
proc means noprint data=y; var &v; output out=y_43_ mean= &v._43_; by run option_new ; where 2043 <= cald < 2044;
proc means noprint data=y; var &v; output out=y_44_ mean= &v._44_; by run option_new ; where 2044 <= cald < 2045;
proc means noprint data=y; var &v; output out=y_45_ mean= &v._45_; by run option_new ; where 2045 <= cald < 2046;
proc means noprint data=y; var &v; output out=y_46_ mean= &v._46_; by run option_new ; where 2046 <= cald < 2047;
proc means noprint data=y; var &v; output out=y_47_ mean= &v._47_; by run option_new ; where 2047 <= cald < 2048;
proc means noprint data=y; var &v; output out=y_48_ mean= &v._48_; by run option_new ; where 2048 <= cald < 2049;
proc means noprint data=y; var &v; output out=y_49_ mean= &v._49_; by run option_new ; where 2049 <= cald < 2050;
proc means noprint data=y; var &v; output out=y_50_ mean= &v._50_; by run option_new ; where 2050 <= cald < 2051;

proc means noprint data=y; var &v; output out=y_51_ mean= &v._51_; by run option_new ; where 2051 <= cald < 2052;
proc means noprint data=y; var &v; output out=y_52_ mean= &v._52_; by run option_new ; where 2052 <= cald < 2053;
proc means noprint data=y; var &v; output out=y_53_ mean= &v._53_; by run option_new ; where 2053 <= cald < 2054;
proc means noprint data=y; var &v; output out=y_54_ mean= &v._54_; by run option_new ; where 2054 <= cald < 2055;
proc means noprint data=y; var &v; output out=y_55_ mean= &v._55_; by run option_new ; where 2055 <= cald < 2056;
proc means noprint data=y; var &v; output out=y_56_ mean= &v._56_; by run option_new ; where 2056 <= cald < 2057;
proc means noprint data=y; var &v; output out=y_57_ mean= &v._57_; by run option_new ; where 2057 <= cald < 2058;
proc means noprint data=y; var &v; output out=y_58_ mean= &v._58_; by run option_new ; where 2058 <= cald < 2059;
proc means noprint data=y; var &v; output out=y_59_ mean= &v._59_; by run option_new ; where 2059 <= cald < 2060;
proc means noprint data=y; var &v; output out=y_60_ mean= &v._60_; by run option_new ; where 2060 <= cald < 2061;

proc means noprint data=y; var &v; output out=y_61_ mean= &v._61_; by run option_new ; where 2061 <= cald < 2062;
proc means noprint data=y; var &v; output out=y_62_ mean= &v._62_; by run option_new ; where 2062 <= cald < 2063;
proc means noprint data=y; var &v; output out=y_63_ mean= &v._63_; by run option_new ; where 2063 <= cald < 2064;
proc means noprint data=y; var &v; output out=y_64_ mean= &v._64_; by run option_new ; where 2064 <= cald < 2065;
proc means noprint data=y; var &v; output out=y_65_ mean= &v._65_; by run option_new ; where 2065 <= cald < 2066;
proc means noprint data=y; var &v; output out=y_66_ mean= &v._66_; by run option_new ; where 2066 <= cald < 2067;
proc means noprint data=y; var &v; output out=y_67_ mean= &v._67_; by run option_new ; where 2067 <= cald < 2068;
proc means noprint data=y; var &v; output out=y_68_ mean= &v._68_; by run option_new ; where 2068 <= cald < 2069;
proc means noprint data=y; var &v; output out=y_69_ mean= &v._69_; by run option_new ; where 2069 <= cald < 2070;
proc means noprint data=y; var &v; output out=y_70_ mean= &v._70_; by run option_new ; where 2070 <= cald < 2071;

proc sort data=y_20_; by run; proc transpose data=y_20_ out=t_20_ prefix=&v._20_; var &v._20_; by run;
proc sort data=y_21_; by run; proc transpose data=y_21_ out=t_21_ prefix=&v._21_; var &v._21_; by run;
proc sort data=y_22_; by run; proc transpose data=y_22_ out=t_22_ prefix=&v._22_; var &v._22_; by run;
proc sort data=y_23_; by run; proc transpose data=y_23_ out=t_23_ prefix=&v._23_; var &v._23_; by run;
proc sort data=y_24_; by run; proc transpose data=y_24_ out=t_24_ prefix=&v._24_; var &v._24_; by run;
proc sort data=y_25_; by run; proc transpose data=y_25_ out=t_25_ prefix=&v._25_; var &v._25_; by run;
proc sort data=y_26_; by run; proc transpose data=y_26_ out=t_26_ prefix=&v._26_; var &v._26_; by run;
proc sort data=y_27_; by run; proc transpose data=y_27_ out=t_27_ prefix=&v._27_; var &v._27_; by run;
proc sort data=y_28_; by run; proc transpose data=y_28_ out=t_28_ prefix=&v._28_; var &v._28_; by run;
proc sort data=y_29_; by run; proc transpose data=y_29_ out=t_29_ prefix=&v._29_; var &v._29_; by run;
proc sort data=y_30_; by run; proc transpose data=y_30_ out=t_30_ prefix=&v._30_; var &v._30_; by run;

proc sort data=y_31_; by run; proc transpose data=y_31_ out=t_31_ prefix=&v._31_; var &v._31_; by run;
proc sort data=y_32_; by run; proc transpose data=y_32_ out=t_32_ prefix=&v._32_; var &v._32_; by run;
proc sort data=y_33_; by run; proc transpose data=y_33_ out=t_33_ prefix=&v._33_; var &v._33_; by run;
proc sort data=y_34_; by run; proc transpose data=y_34_ out=t_34_ prefix=&v._34_; var &v._34_; by run;
proc sort data=y_35_; by run; proc transpose data=y_35_ out=t_35_ prefix=&v._35_; var &v._35_; by run;
proc sort data=y_36_; by run; proc transpose data=y_36_ out=t_36_ prefix=&v._36_; var &v._36_; by run;
proc sort data=y_37_; by run; proc transpose data=y_37_ out=t_37_ prefix=&v._37_; var &v._37_; by run;
proc sort data=y_38_; by run; proc transpose data=y_38_ out=t_38_ prefix=&v._38_; var &v._38_; by run;
proc sort data=y_39_; by run; proc transpose data=y_39_ out=t_39_ prefix=&v._39_; var &v._39_; by run;
proc sort data=y_40_; by run; proc transpose data=y_40_ out=t_40_ prefix=&v._40_; var &v._40_; by run;

proc sort data=y_41_; by run; proc transpose data=y_41_ out=t_41_ prefix=&v._41_; var &v._41_; by run;
proc sort data=y_42_; by run; proc transpose data=y_42_ out=t_42_ prefix=&v._42_; var &v._42_; by run;
proc sort data=y_43_; by run; proc transpose data=y_43_ out=t_43_ prefix=&v._43_; var &v._43_; by run;
proc sort data=y_44_; by run; proc transpose data=y_44_ out=t_44_ prefix=&v._44_; var &v._44_; by run;
proc sort data=y_45_; by run; proc transpose data=y_45_ out=t_45_ prefix=&v._45_; var &v._45_; by run;
proc sort data=y_46_; by run; proc transpose data=y_46_ out=t_46_ prefix=&v._46_; var &v._46_; by run;
proc sort data=y_47_; by run; proc transpose data=y_47_ out=t_47_ prefix=&v._47_; var &v._47_; by run;
proc sort data=y_48_; by run; proc transpose data=y_48_ out=t_48_ prefix=&v._48_; var &v._48_; by run;
proc sort data=y_49_; by run; proc transpose data=y_49_ out=t_49_ prefix=&v._49_; var &v._49_; by run;
proc sort data=y_50_; by run; proc transpose data=y_50_ out=t_50_ prefix=&v._50_; var &v._50_; by run;

proc sort data=y_51_; by run; proc transpose data=y_51_ out=t_51_ prefix=&v._51_; var &v._51_; by run;
proc sort data=y_52_; by run; proc transpose data=y_52_ out=t_52_ prefix=&v._52_; var &v._52_; by run;
proc sort data=y_53_; by run; proc transpose data=y_53_ out=t_53_ prefix=&v._53_; var &v._53_; by run;
proc sort data=y_54_; by run; proc transpose data=y_54_ out=t_54_ prefix=&v._54_; var &v._54_; by run;
proc sort data=y_55_; by run; proc transpose data=y_55_ out=t_55_ prefix=&v._55_; var &v._55_; by run;
proc sort data=y_56_; by run; proc transpose data=y_56_ out=t_56_ prefix=&v._56_; var &v._56_; by run;
proc sort data=y_57_; by run; proc transpose data=y_57_ out=t_57_ prefix=&v._57_; var &v._57_; by run;
proc sort data=y_58_; by run; proc transpose data=y_58_ out=t_58_ prefix=&v._58_; var &v._58_; by run;
proc sort data=y_59_; by run; proc transpose data=y_59_ out=t_59_ prefix=&v._59_; var &v._59_; by run;
proc sort data=y_60_; by run; proc transpose data=y_60_ out=t_60_ prefix=&v._60_; var &v._60_; by run;

proc sort data=y_61_; by run; proc transpose data=y_61_ out=t_61_ prefix=&v._61_; var &v._61_; by run;
proc sort data=y_62_; by run; proc transpose data=y_62_ out=t_62_ prefix=&v._62_; var &v._62_; by run;
proc sort data=y_63_; by run; proc transpose data=y_63_ out=t_63_ prefix=&v._63_; var &v._63_; by run;
proc sort data=y_64_; by run; proc transpose data=y_64_ out=t_64_ prefix=&v._64_; var &v._64_; by run;
proc sort data=y_65_; by run; proc transpose data=y_65_ out=t_65_ prefix=&v._65_; var &v._65_; by run;
proc sort data=y_66_; by run; proc transpose data=y_66_ out=t_66_ prefix=&v._66_; var &v._66_; by run;
proc sort data=y_67_; by run; proc transpose data=y_67_ out=t_67_ prefix=&v._67_; var &v._67_; by run;
proc sort data=y_68_; by run; proc transpose data=y_68_ out=t_68_ prefix=&v._68_; var &v._68_; by run;
proc sort data=y_69_; by run; proc transpose data=y_69_ out=t_69_ prefix=&v._69_; var &v._69_; by run;
proc sort data=y_70_; by run; proc transpose data=y_70_ out=t_70_ prefix=&v._70_; var &v._70_; by run;


data &v ; merge  
t_20_ t_21_ t_22_ t_23_ t_24_ t_25_ t_26_ t_27_ t_28_ t_29_ t_30_
t_30_ t_31_ t_32_ t_33_ t_34_ t_35_ t_36_ t_37_ t_38_ t_39_ t_40_
t_40_ t_41_ t_42_ t_43_ t_44_ t_45_ t_46_ t_47_ t_48_ t_49_ t_50_
t_50_ t_51_ t_52_ t_53_ t_54_ t_55_ t_56_ t_57_ t_58_ t_59_ t_60_
t_60_ t_61_ t_62_ t_63_ t_64_ t_65_ t_66_ t_67_ t_68_ t_69_ t_70_
; 


drop _NAME_ _TYPE_ _FREQ_;

%mend var;
%var(v=p_mcirc_1549m);%var(v=p_onart);%var(v=incidence1564);%var(v=p_vl1000_m);%var(v=p_onart_vl1000_m); run;

data   wide_outputs; 
merge p_mcirc_1549m p_onart incidence1564 p_vl1000_m p_onart_vl1000_m;run;


proc means n p50 p5 p95;var
p_mcirc_1549m_20_1 p_mcirc_1549m_21_1 p_mcirc_1549m_22_1 p_mcirc_1549m_23_1 p_mcirc_1549m_24_1 
p_mcirc_1549m_25_1 p_mcirc_1549m_26_1 p_mcirc_1549m_27_1 p_mcirc_1549m_28_1 p_mcirc_1549m_29_1 
p_mcirc_1549m_30_1 p_mcirc_1549m_31_1 p_mcirc_1549m_32_1 p_mcirc_1549m_33_1 p_mcirc_1549m_34_1 
p_mcirc_1549m_35_1 p_mcirc_1549m_36_1 p_mcirc_1549m_37_1 p_mcirc_1549m_38_1 p_mcirc_1549m_39_1 
p_mcirc_1549m_40_1 p_mcirc_1549m_41_1 p_mcirc_1549m_42_1 p_mcirc_1549m_43_1 p_mcirc_1549m_44_1 
p_mcirc_1549m_45_1 p_mcirc_1549m_46_1 p_mcirc_1549m_47_1 p_mcirc_1549m_48_1 p_mcirc_1549m_49_1 
p_mcirc_1549m_50_1 p_mcirc_1549m_51_1 p_mcirc_1549m_52_1 p_mcirc_1549m_53_1 p_mcirc_1549m_54_1
p_mcirc_1549m_55_1 p_mcirc_1549m_56_1 p_mcirc_1549m_57_1 p_mcirc_1549m_58_1 p_mcirc_1549m_59_1 
p_mcirc_1549m_60_1 p_mcirc_1549m_61_1 p_mcirc_1549m_62_1 p_mcirc_1549m_63_1 p_mcirc_1549m_64_1
p_mcirc_1549m_65_1 p_mcirc_1549m_66_1 p_mcirc_1549m_67_1 p_mcirc_1549m_68_1 p_mcirc_1549m_69_1 p_mcirc_1549m_70_1

p_mcirc_1549m_21_2 p_mcirc_1549m_22_2 p_mcirc_1549m_23_2 p_mcirc_1549m_24_2 
p_mcirc_1549m_25_2 p_mcirc_1549m_26_2 p_mcirc_1549m_27_2 p_mcirc_1549m_28_2 p_mcirc_1549m_29_2 
p_mcirc_1549m_30_2 p_mcirc_1549m_31_2 p_mcirc_1549m_32_2 p_mcirc_1549m_33_2 p_mcirc_1549m_34_2 
p_mcirc_1549m_35_2 p_mcirc_1549m_36_2 p_mcirc_1549m_37_2 p_mcirc_1549m_38_2 p_mcirc_1549m_39_2 
p_mcirc_1549m_40_2 p_mcirc_1549m_41_2 p_mcirc_1549m_42_2 p_mcirc_1549m_43_2 p_mcirc_1549m_44_2 
p_mcirc_1549m_45_2 p_mcirc_1549m_46_2 p_mcirc_1549m_47_2 p_mcirc_1549m_48_2 p_mcirc_1549m_49_2 
p_mcirc_1549m_50_2 p_mcirc_1549m_51_2 p_mcirc_1549m_52_2 p_mcirc_1549m_53_2 p_mcirc_1549m_54_2
p_mcirc_1549m_55_2 p_mcirc_1549m_56_2 p_mcirc_1549m_57_2 p_mcirc_1549m_58_2 p_mcirc_1549m_59_2 
p_mcirc_1549m_60_2 p_mcirc_1549m_61_2 p_mcirc_1549m_62_2 p_mcirc_1549m_63_2 p_mcirc_1549m_64_2
p_mcirc_1549m_65_2 p_mcirc_1549m_66_2 p_mcirc_1549m_67_2 p_mcirc_1549m_68_2 p_mcirc_1549m_69_2 p_mcirc_1549m_70_2;run;

proc means n p50 p5 p95;var
p_onart_20_1 p_onart_21_1 p_onart_22_1 p_onart_23_1 p_onart_24_1 
p_onart_25_1 p_onart_26_1 p_onart_27_1 p_onart_28_1 p_onart_29_1 
p_onart_30_1 p_onart_31_1 p_onart_32_1 p_onart_33_1 p_onart_34_1 
p_onart_35_1 p_onart_36_1 p_onart_37_1 p_onart_38_1 p_onart_39_1 
p_onart_40_1 p_onart_41_1 p_onart_42_1 p_onart_43_1 p_onart_44_1 
p_onart_45_1 p_onart_46_1 p_onart_47_1 p_onart_48_1 p_onart_49_1 
p_onart_50_1 p_onart_51_1 p_onart_52_1 p_onart_53_1 p_onart_54_1
p_onart_55_1 p_onart_56_1 p_onart_57_1 p_onart_58_1 p_onart_59_1 
p_onart_60_1 p_onart_61_1 p_onart_62_1 p_onart_63_1 p_onart_64_1
p_onart_65_1 p_onart_66_1 p_onart_67_1 p_onart_68_1 p_onart_69_1 p_onart_70_1

p_onart_21_2 p_onart_22_2 p_onart_23_2 p_onart_24_2 
p_onart_25_2 p_onart_26_2 p_onart_27_2 p_onart_28_2 p_onart_29_2 
p_onart_30_2 p_onart_31_2 p_onart_32_2 p_onart_33_2 p_onart_34_2 
p_onart_35_2 p_onart_36_2 p_onart_37_2 p_onart_38_2 p_onart_39_2 
p_onart_40_2 p_onart_41_2 p_onart_42_2 p_onart_43_2 p_onart_44_2 
p_onart_45_2 p_onart_46_2 p_onart_47_2 p_onart_48_2 p_onart_49_2 
p_onart_50_2 p_onart_51_2 p_onart_52_2 p_onart_53_2 p_onart_54_2
p_onart_55_2 p_onart_56_2 p_onart_57_2 p_onart_58_2 p_onart_59_2 
p_onart_60_2 p_onart_61_2 p_onart_62_2 p_onart_63_2 p_onart_64_2
p_onart_65_2 p_onart_66_2 p_onart_67_2 p_onart_68_2 p_onart_69_2 p_onart_70_2;run;

proc means n p50 p5 p95;var
incidence1564_20_1 incidence1564_21_1 incidence1564_22_1 incidence1564_23_1 incidence1564_24_1 
incidence1564_25_1 incidence1564_26_1 incidence1564_27_1 incidence1564_28_1 incidence1564_29_1 
incidence1564_30_1 incidence1564_31_1 incidence1564_32_1 incidence1564_33_1 incidence1564_34_1 
incidence1564_35_1 incidence1564_36_1 incidence1564_37_1 incidence1564_38_1 incidence1564_39_1 
incidence1564_40_1 incidence1564_41_1 incidence1564_42_1 incidence1564_43_1 incidence1564_44_1 
incidence1564_45_1 incidence1564_46_1 incidence1564_47_1 incidence1564_48_1 incidence1564_49_1 
incidence1564_50_1 incidence1564_51_1 incidence1564_52_1 incidence1564_53_1 incidence1564_54_1
incidence1564_55_1 incidence1564_56_1 incidence1564_57_1 incidence1564_58_1 incidence1564_59_1 
incidence1564_60_1 incidence1564_61_1 incidence1564_62_1 incidence1564_63_1 incidence1564_64_1
incidence1564_65_1 incidence1564_66_1 incidence1564_67_1 incidence1564_68_1 incidence1564_69_1 incidence1564_70_1

incidence1564_21_2 incidence1564_22_2 incidence1564_23_2 incidence1564_24_2 
incidence1564_25_2 incidence1564_26_2 incidence1564_27_2 incidence1564_28_2 incidence1564_29_2 
incidence1564_30_2 incidence1564_31_2 incidence1564_32_2 incidence1564_33_2 incidence1564_34_2 
incidence1564_35_2 incidence1564_36_2 incidence1564_37_2 incidence1564_38_2 incidence1564_39_2 
incidence1564_40_2 incidence1564_41_2 incidence1564_42_2 incidence1564_43_2 incidence1564_44_2 
incidence1564_45_2 incidence1564_46_2 incidence1564_47_2 incidence1564_48_2 incidence1564_49_2 
incidence1564_50_2 incidence1564_51_2 incidence1564_52_2 incidence1564_53_2 incidence1564_54_2
incidence1564_55_2 incidence1564_56_2 incidence1564_57_2 incidence1564_58_2 incidence1564_59_2 
incidence1564_60_2 incidence1564_61_2 incidence1564_62_2 incidence1564_63_2 incidence1564_64_2
incidence1564_65_2 incidence1564_66_2 incidence1564_67_2 incidence1564_68_2 incidence1564_69_2 incidence1564_70_2;run;



***internal use;
proc means n p50 p5 p95;var
p_vl1000_m_20_1 p_vl1000_m_21_1 p_vl1000_m_22_1 p_vl1000_m_23_1 p_vl1000_m_24_1 
p_vl1000_m_25_1 p_vl1000_m_26_1 p_vl1000_m_27_1 p_vl1000_m_28_1 p_vl1000_m_29_1 
p_vl1000_m_30_1 p_vl1000_m_31_1 p_vl1000_m_32_1 p_vl1000_m_33_1 p_vl1000_m_34_1 
p_vl1000_m_35_1 p_vl1000_m_36_1 p_vl1000_m_37_1 p_vl1000_m_38_1 p_vl1000_m_39_1 
p_vl1000_m_40_1 p_vl1000_m_41_1 p_vl1000_m_42_1 p_vl1000_m_43_1 p_vl1000_m_44_1 
p_vl1000_m_45_1 p_vl1000_m_46_1 p_vl1000_m_47_1 p_vl1000_m_48_1 p_vl1000_m_49_1 
p_vl1000_m_50_1 p_vl1000_m_51_1 p_vl1000_m_52_1 p_vl1000_m_53_1 p_vl1000_m_54_1
p_vl1000_m_55_1 p_vl1000_m_56_1 p_vl1000_m_57_1 p_vl1000_m_58_1 p_vl1000_m_59_1 
p_vl1000_m_60_1 p_vl1000_m_61_1 p_vl1000_m_62_1 p_vl1000_m_63_1 p_vl1000_m_64_1
p_vl1000_m_65_1 p_vl1000_m_66_1 p_vl1000_m_67_1 p_vl1000_m_68_1 p_vl1000_m_69_1 p_vl1000_m_70_1

p_onart_vl1000_m_21_1 p_onart_vl1000_m_22_1 p_onart_vl1000_m_23_1 p_onart_vl1000_m_24_1 
p_onart_vl1000_m_25_1 p_onart_vl1000_m_26_1 p_onart_vl1000_m_27_1 p_onart_vl1000_m_28_1 p_onart_vl1000_m_29_1 
p_onart_vl1000_m_30_1 p_onart_vl1000_m_31_1 p_onart_vl1000_m_32_1 p_onart_vl1000_m_33_1 p_onart_vl1000_m_34_1 
p_onart_vl1000_m_35_1 p_onart_vl1000_m_36_1 p_onart_vl1000_m_37_1 p_onart_vl1000_m_38_1 p_onart_vl1000_m_39_1 
p_onart_vl1000_m_40_1 p_onart_vl1000_m_41_1 p_onart_vl1000_m_42_1 p_onart_vl1000_m_43_1 p_onart_vl1000_m_44_1 
p_onart_vl1000_m_45_1 p_onart_vl1000_m_46_1 p_onart_vl1000_m_47_1 p_onart_vl1000_m_48_1 p_onart_vl1000_m_49_1 
p_onart_vl1000_m_50_1 p_onart_vl1000_m_51_1 p_onart_vl1000_m_52_1 p_onart_vl1000_m_53_1 p_onart_vl1000_m_54_1
p_onart_vl1000_m_55_1 p_onart_vl1000_m_56_1 p_onart_vl1000_m_57_1 p_onart_vl1000_m_58_1 p_onart_vl1000_m_59_1 
p_onart_vl1000_m_60_1 p_onart_vl1000_m_61_1 p_onart_vl1000_m_62_1 p_onart_vl1000_m_63_1 p_onart_vl1000_m_64_1
p_onart_vl1000_m_65_1 p_onart_vl1000_m_66_1 p_onart_vl1000_m_67_1 p_onart_vl1000_m_68_1 p_onart_vl1000_m_69_1 p_onart_vl1000_m_70_1;run;

*/

%mend var;

%var(v=incidence_sw);
%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=p_newp_sw); %var(v=prop_sw_newp0);  %var(v=p_newp_prep);
%var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc);%var(v=p_mcirc_inc1014m); %var(v=p_mcirc_1014m);%var(v=p_mcirc_1519m); %var(v=p_mcirc_2024m);%var(v=p_mcirc_2529m);
%var(v=p_mcirc_3034m);%var(v=p_mcirc_3539m);%var(v=p_mcirc_3039m);%var(v=p_mcirc_4044m);%var(v=p_mcirc_4549m); %var(v=p_mcirc_4049m);
%var(v=p_mcirc_50plm); %var(v=p_mcirc_1549m);
%var(v=p_vmmc);%var(v=p_vmmc_inc1014m); %var(v=p_vmmc_1014m);%var(v=p_vmmc_1519m); %var(v=p_vmmc_2024m);%var(v=p_vmmc_2529m); %var(v=p_vmmc_3039m); %var(v=p_vmmc_4049m);
%var(v=p_vmmc_50plm); %var(v=p_vmmc_1549m);
%var(v=p_new_vmmc_u); %var(v=p_new_vmmc_u_1049m); %var(v=p_new_vmmc_1014m_u); %var(v=p_new_vmmc_1519m_u); %var(v=p_new_vmmc_2024m_u);%var(v=p_new_vmmc_2529m_u);
%var(v=p_new_vmmc_3034m_u);%var(v=p_new_vmmc_3539m_u);%var(v=p_new_vmmc_3039m_u);%var(v=p_new_vmmc_4044m_u);%var(v=p_new_vmmc_4549m_u);
%var(v=p_new_vmmc_4049m_u); %var(v=p_new_vmmc_50plm_u); %var(v=p_new_vmmc_1549m_u);
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
%var(v=p_ten); %var(v=p_zdv); %var(v=p_dol); %var(v=p_3tc); %var(v=p_lpr); %var(v=p_nev); %var(v=p_onart_vl1000);  %var(v=p_artexp_vl1000);
%var(v=p_vl1000); %var(v=p_vg1000); %var(v=p_vl1000_m);  %var(v=p_vl1000_w);  %var(v=p_vl1000_m_1524);  %var(v=p_vl1000_w_1524);  
%var(v=p_vl1000_art_12m); %var(v=p_vl1000_art_12m_onart); 
%var(v=p_onart_m); %var(v=p_onart_w); 
%var(v=p_onart_vl1000_w); %var(v=p_onart_vl1000_m); %var(v= p_onart_vl1000_1524);  %var(v=p_onart_vl1000_sw);
%var(v=prev_vg1000_newp_m);  %var(v=prev_vg1000_newp_w);  %var(v= p_startedline2) ;
%var(v=p_tle);  %var(v=p_tld);  %var(v=p_zld);  %var(v=p_zla);  %var(v=p_otherreg);  %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
%var(v=aids_death_rate);  %var(v=death_rate_onart); %var(v=ddaly_adults);  

%var(v=dcost);  %var(v= dart_cost_y);
%var(v=dadc_cost);   %var(v=dcd4_cost);   %var(v=dvl_cost);   %var(v=dvis_cost);  %var(v=dcot_cost);   %var(v=dtb_cost);   
%var(v=dres_cost);  %var(v=dtest_cost);   %var(v=d_t_adh_int_cost);   %var(v=dswitchline_cost);  %var(v=dtaz_cost);   %var(v=dcost_drug_level_test);
%var(v=dclin_cost );  
%var(v=dcost_circ );  %var(v=dcost_condom_dn);
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
%var(v=death_rate_hiv_all);%var(v=death_rate_hiv_all_m);%var(v=death_rate_hiv_all_w);
%var(v=p_iime_);   %var(v=p_pime_);   %var(v=p_nnme_);     %var(v=n_pregnant_ntd);   %var(v=n_preg_odabe);
%var(v=n_birth_with_inf_child);
%var(v=n_tested); %var(v=test_prop_positive);
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   %var(v= n_hiv1_prep);
%var(v= n_prep); %var(v=n_covid); %var(v=n_death_covid);  %var(v=n_death);  %var(v=n_death_hivrel); 
%var(v=p_death_hivrel_age_le64);  %var(v=p_prep_ever); %var(v=p_hiv1_prep);  %var(v=incidence1524w);   %var(v=incidence1524m)
%var(v=n_mcirc1549_py);%var (v=n_mcirc1549_3m);%var(v=n_vmmc1549_py);%var (v=n_vmmc1549_3m);%var (v=n_new_vmmc1549_py);%var (v=n_new_vmmc1049_py);
%var(v=n_new_inf1549m); %var(v=n_new_inf1549);%var(v=s_sw_newp); %var(v=d_n_new_inf1549);%var(v=d_n_infection);
%var(v=ddaly);%var(v=ddaly_adults_Op);%var(v=disc_dead_daly80);%var(v=s_live_ddaly_80);

data   wide_outputs; merge incidence_sw
s_alive  p_w_giv_birth_this_per  p_newp_ge1 p_newp_ge5  gender_r_newp
p_newp_sw prop_sw_newp0  p_newp_prep  n_tested_m
p_tested_past_year_1549m  p_tested_past_year_1549w  
p_mcirc  p_mcirc_inc1014m  p_mcirc_1014m  p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3034m p_mcirc_3539m 
p_mcirc_3039m p_mcirc_4044m p_mcirc_4549m p_mcirc_4049m p_mcirc_50plm p_mcirc_1549m
p_vmmc  p_vmmc_inc1014m p_vmmc_1014m p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_50plm p_vmmc_1549m
p_new_vmmc_u  p_new_vmmc_u_1049m  p_new_vmmc_1014m_u  p_new_vmmc_1519m_u p_new_vmmc_2024m_u p_new_vmmc_2529m_u
p_new_vmmc_3034m_u p_new_vmmc_3539m_u p_new_vmmc_3039m_u p_new_vmmc_4044m_u p_new_vmmc_4549m_u p_new_vmmc_4049m_u p_new_vmmc_50plm_u p_new_vmmc_1549m_u
prop_w_1549_sw  prop_w_ever_sw  prop_sw_hiv  prop_w_1524_onprep  prop_1564_onprep  prop_sw_onprep 
prevalence1549m  prevalence1549w  prevalence1549  prevalence1519w  prevalence1519m  prevalence2024w  prevalence2024m
prevalence2529w  prevalence2529m  prevalence3034w prevalence3034m  prevalence3539w  prevalence3539m  	  
prevalence4044w  prevalence4044m  prevalence4549w prevalence4549m  
prevalence_vg1000  incidence1549  prevalence1524w prevalence1524m   prevalence_sw
incidence1549w  incidence1549m 
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary 
mtct_prop  p_diag  p_diag_m  p_diag_w  p_diag_sw  p_diag_m1524  p_diag_w1524
p_ai_no_arv_c_nnm  p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m  p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm 
p_artexp_diag  p_onart_diag  p_onart_diag_w  p_onart_diag_m  p_onart_diag_sw  
p_efa  p_taz  p_ten  p_zdv  p_dol  p_3tc  p_lpr  p_nev  
p_onart_vl1000  p_artexp_vl1000  p_vl1000  p_vg1000  p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m  p_vl1000_art_12m_onart  p_onart_m p_onart_w  p_onart_vl1000_w  p_onart_vl1000_m   p_onart_vl1000_1524  p_onart_vl1000_sw
prev_vg1000_newp_m  prev_vg1000_newp_w  p_startedline2
p_tle  p_tld  p_zld  p_zla  p_otherreg  p_drug_level_test p_linefail_ge1
aids_death_rate  death_rate_onart ddaly_adults  dcost   dart_cost_y
dadc_cost  dcd4_cost  dvl_cost  dvis_cost    dcot_cost  dtb_cost   
dres_cost  dtest_cost  d_t_adh_int_cost  dswitchline_cost  dtaz_cost   dcost_drug_level_test  dclin_cost   
dcost_circ  dcost_condom_dn  dcost_prep_visit  dcost_prep  dcost_drug_level_test  
dcost_clin_care   dcost_non_aids_pre_death   dcost_child_hiv  dzdv_cost  dten_cost  d3tc_cost    
dnev_cost  dlpr_cost  ddar_cost  dtaz_cost  defa_cost  ddol_cost 
m15r  m25r  m35r  m45r  m55r  w15r  w25r  w35r  w45r  w55r
r_efa_hiv  p_onart_cd4_l200
p_dol_2vg1000_dolr1_adh0  p_dol_2vg1000_dolr1_adh1  p_dol_2vg1000_dolr0_adh0  p_dol_2vg1000_dolr0_adh1
p_onart_cd4_l500  p_startedline2  prop_art_or_prep  n_sw_1564   prop_sw_onprep   p_onart
p_o_zdv_tox  p_o_3tc_tox   p_o_ten_tox   p_o_taz_tox   p_o_lpr_tox   p_o_efa_tox   
p_o_nev_tox  p_o_dol_tox   p_o_zdv_adh_hi   p_o_3tc_adh_hi   p_o_ten_adh_hi  
p_o_taz_adh_hi   p_o_lpr_adh_hi   p_o_efa_adh_hi   p_o_nev_adh_hi   p_o_dol_adh_hi  
p_o_tle_tox   p_o_tld_tox   p_o_zla_tox   p_o_zld_tox    p_o_tle_adh_hi   p_o_tld_adh_hi   
p_o_zla_adh_hi   p_o_zld_adh_hi   p_adh_hi    s_a_zld_if_reg_op_116
p_nactive_ge2p75_xyz  p_adh_hi_xyz_ot1   p_adh_hi_xyz_ot2   p_adh_hi_xyz_itt   p_e_rt65m_xyz   
p_nactive_ge2p00_xyz   p_nactive_ge1p50_xyz 
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000   
p_tams_ontle_vlg1000  p_tams_ontld_vlg1000  p_k65m p_m184m
death_rate  death_rate_hiv death_rate_hiv_m death_rate_hiv_w death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w
p_iime_   p_pime_   p_nnme_     n_pregnant_ntd   n_preg_odabe
n_birth_with_inf_child
n_tested test_prop_positive
p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  n_hiv1_prep
n_prep  n_covid  n_death_covid  n_death  n_death_hivrel 
p_death_hivrel_age_le64  p_prep_ever p_hiv1_prep  incidence1524w   incidence1524m
n_mcirc1549_py n_mcirc1549_3m n_vmmc1549_py  n_vmmc1549_3m  n_new_vmmc1549_py  n_new_vmmc1049_py
n_new_inf1549m n_new_inf1549 d_n_new_inf1549 d_n_infection
s_sw_newp ddaly ddaly_adults_Op disc_dead_daly80 s_live_ddaly_80;
;

proc contents; run;

proc sort; by run; run;



***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2015; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=sf_2021); /*%par(p=dataset);*/
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
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=switch_for_tox ); %par(p=adh_pattern_prep ); %par(p=rate_test_startprep ); %par(p=rate_test_restartprep );
%par(p=rate_choose_stop_prep ); %par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox ); %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg ); %par(p=sw_init_newp); %par(p=sw_trans_matrix);  	
	%par(p=prep_strategy );
 /*%par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); */
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); 
%par(p=lower_future_art_cov);
run;
data wide_par; merge 
sf_2021 /*dataset*/ sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
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
prob_return_adc prob_lossdiag_adctb higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
prep_strategy  			

/*zero_tdf_activity_k65r  zero_3tc_activity_m184*/  
red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
lower_future_art_cov
;

proc sort; by run;run;



/*

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
%par_ai1(p=lower_future_art_cov); 

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
*/

* To get one row per run;

*libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\vmmc\";

  data a.wide_vmmc_25_06_21_1pm_20r_F_5disc;

* merge   wide_outputs  wide_par wide_par_after_int_option0  wide_par_after_int_option1  ; * this if you have parameter values changing after
  baseline that you need to track the values of;
  merge   wide_outputs  wide_par ;  
  by run;run;
run;

/*
data a;
set a.wide_vmmc_02_06_21_9pm;run;

proc means n p50 mean p5 p95;
var p_onart_diag_20 p_onart_diag_m_20 p_onart_diag_w_20;run;

proc means n p50 mean p5 p95;
var p_onart_diag_40_41_1 p_onart_diag_m_40_41_1 p_onart_diag_w_40_41_1
;where lower_future_art_cov=0;run;

proc means n p50 mean p5 p95;
var p_onart_diag_40_41_1 p_onart_diag_m_40_41_1 p_onart_diag_w_40_41_1
;where lower_future_art_cov=1;run;

proc means n p50 p5 p95;var
prevalence1549_40_41_1 
incidence1549_40_41_1 
prop_1564_onprep_20
p_diag_40_41_1 
p_onart_diag_40_41_1 
p_vl1000_40_41_1 
p_onart_vl1000_40_41_1 
p_mcirc_1549m_40_41_1;
;where lower_future_art_cov=1;run;



proc means n mean p50 p5 p95;
var p_mcirc_21	prevalence1519w_21 	prevalence1519m_21 	prevalence1549m_21 prevalence1549w_21
incidence1549w_21  incidence1549m_21 incidence_sw_21	p_diag_21 	p_diag_m_21   p_diag_w_21	p_ai_no_arv_c_nnm_21   
prop_w_1549_sw_21  mtct_prop_21  prop_1564_onprep_21
p_onart_diag_21 p_onart_vl1000_21   p_vl1000_21	p_onart_vl1000_w_21	p_onart_vl1000_m_21   p_onart_cd4_l500_21  
p_onart_cd4_l200_21  p_startedline2_21 prop_sw_newp0_21  prop_sw_hiv_21 p_newp_sw_21 
;run;
proc means n mean p50 p5 p95;
var p_mcirc_40_41	prevalence1519w_40_41 	prevalence1519m_40_41 	prevalence1549m_40_41 prevalence1549w_40_41
incidence1549w_40_41  incidence1549m_40_41 incidence_sw_40_41	p_diag_40_41 	p_diag_m_40_41   p_diag_w_40_41	p_ai_no_arv_c_nnm_40_41   
prop_w_1549_sw_40_41  mtct_prop_40_41  prop_1564_onprep_40_41
p_onart_diag_40_41 p_onart_vl1000_40_41   p_vl1000_40_41	p_onart_vl1000_w_40_41	p_onart_vl1000_m_40_41   p_onart_cd4_l500_40_41  
p_onart_cd4_l200_40_41  p_startedline2_40_41 prop_sw_newp0_40_41  prop_sw_hiv_40_41 p_newp_sw_40_41 
;run;

* note this would need to be changed if option=1 is not the default/null policy option;
proc means n p50 mean p5 p95;
var p_w_giv_birth_this_per_20_25_1	p_mcirc_20_25_1	prevalence1549_20_25_1 incidence1549_20_25_1 	p_diag_20_25_1 	p_diag_m_20_25_1   p_diag_w_20_25_1	p_ai_no_arv_c_nnm_20_25_1   
prop_w_1549_sw_20_25_1  mtct_prop_20_25_1  prop_1564_onprep_20_25_1
p_onart_diag_20_25_1 p_onart_vl1000_20_25_1   p_vl1000_20_25_1	p_onart_vl1000_w_20_25_1	p_onart_vl1000_m_20_25_1   p_onart_cd4_l500_20_25_1  
p_onart_cd4_l200_20_25_1  p_startedline2_20_25_1 prop_sw_newp0_20_25_1  prop_sw_hiv_20_25_1 ;
run;


proc means n p50 p5 p95;var incidence_sw_21;run;



var s_alive_20			p_w_giv_birth_this_per_20	p_newp_ge1_20  p_newp_ge5_20 
p_newp_sw_20   n_tested_m_20
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

proc contents;run;


