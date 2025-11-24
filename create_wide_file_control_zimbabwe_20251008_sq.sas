
* options user="/folders/myfolders/";

ods html close;

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20251008_sq_out\";


/*

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20251008_sq_out\";

data g ; set a.out: ;

data a.g;   set a.out:;run;

*/



ods listing;


data g; set  a.g;

if cald=. then delete;

/*
proc contents data=a.g; run;
proc freq data=g; tables s_onart_m2529_   s_onart_m3034_   s_onart_m3539_   s_onart_m4044_   s_onart_m4549_ ; run;
*/


proc sort data=g; 
by run cald option;run;

proc freq data=g; table option;run;



* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set g;

*Zimbabwe;
*Source for Zimbabwe population is https:https://population.un.org/dataportal/data/indicators/49/locations/716/start/1990/end/2023/line/linetimeplot;
*accessed 9/2/2023;
* 58.1% of Zim population in 2020 >= age 15. Source: https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=ZW accessed 6/9/2021;

if cald=2022.5;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = (16320000 * 0.581) / s_alive;  * 57% of malawi population in 2019 >= age 15 ;
sf = sf_2022;
keep run sf sf_2022;

proc sort; by run;run;



/*%put(sf);*/

data y; 
merge g sf;
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
* ts1m - this code needs to change for ts1m;

%let year_start_disc=2027  ; * year_interv + 1;
discount_3py = 1/(1.03**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;


* ================================================================================= ;



/*
proc print; var cald  run option ddaly_ntd_mtct_odab_napd  ddaly  dead_ddaly_ntd  ddaly_mtct  dead_ddaly_odabe   
ddaly_non_aids_pre_death;
where cald = 2021;
run;
*/



* costs ;

* ================================================================================= ;


* new adjustments to costs for malawi ;

s_dcost_circ = s_dcost_circ * 104 / 90 ;

s_dcost_prep_cab = s_dcost_prep_cab * (204 / (50 * 1.2));  
s_dcost_prep_len = s_dcost_prep_len * (204 / (50 * 1.2));  
s_dcost_prep_oral = s_dcost_prep_oral * (40 / (50*1.2)); 
s_dcost_prep_vr = s_dcost_prep_vr * (155 / (50 * 1.2));
s_dcost_prep_visit_cab = s_dcost_prep_visit_cab * (18 / 60) ;
s_dcost_prep_visit_len = s_dcost_prep_visit_len * (18 / 60) ;	*LEN set to match CAB - check this;
s_dcost_prep_visit_oral = s_dcost_prep_visit_oral * (18 / 40) ;
s_dcost_prep_visit_vr = s_dcost_prep_visit_vr * (21 / 40) ;
s_dcost_prep_visit = s_dcost_prep_visit_cab + s_dcost_prep_visit_len + s_dcost_prep_visit_oral + s_dcost_prep_visit_vr; 
s_dcost_prep = s_dcost_prep_cab + s_dcost_prep_len + s_dcost_prep_oral + s_dcost_prep_vr;

dcost_self_test = s_self_tested * sf * 0.00314 * &discount * 4 / 1000; 

dcost_adh_intervention=0; if option=9 then do; dcost_adh_intervention=(s_diag) * sf * (0.022 / 4) * &discount / 1000 ; end;
* Informed by Weldemariam H, Thawani A, Kiruthu-Kamamia C, Huwa J, Chipanda M, Tweya H, Feldacker C. How much does it cost to retain antiretroviral therapy (ART) 
clients in their first year? Routine financial costs of retention interventions at Lighthouse Trustin Lilongwe, Malawi. Res Sq [Preprint]. 2024 Oct 
15:rs.3.rs-4939155. doi: 10.21203/rs.3.rs-4939155/v1. PMID: 39483880 PMCID: PMC11527224.;
dcost_comp_sex_educ=0; if option = 11 then do; dcost_comp_sex_educ = (s_ageg1519w + s_ageg2024w) * sf * 0.01124 * &discount / 1000; end;
dcost_econ_empow=0; if option = 12 then do; dcost_econ_empow = (s_ageg1519w + s_ageg2024w) * sf * 0.061   * &discount / 1000; end;

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
/*dtest_cost_prep = s_dtest_cost_prep * sf * 4 / 1000;  * note that this cost is part of dtest_cost so if want to change this cost need to subtract first from total cost;*/
dcot_cost = s_dcot_cost * sf * 4 / 1000;
dres_cost = s_dres_cost * sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * sf * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * sf * 4 / 1000;  
dcost_prep = s_dcost_prep * sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * sf * 4 / 1000; 


* note this below can be used if outputs are from program beyond 1-1-20;
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf * 4 / 1000;
  dcost_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf * 4 / 1000;
dcost_circ = s_dcost_circ * sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf * 4 / 1000;
/*dcost_child_hiv  = s_dcost_child_hiv * sf * 4 / 1000; * s_cost_child_hiv is discounted cost;*/


dcost_child_hiv_at_child_inf = s_dcost_child_hiv_at_child_inf * sf; *One off lifetime cost for a child living with HIV;


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
		/*dcost_child_hiv*/ + dcost_child_hiv_at_child_inf + dcost_non_aids_pre_death + dcost_self_test + dcost_econ_empow + dcost_comp_sex_educ + dcost_adh_intervention;
*replaced dcost_child_hiv with dcost_child_hiv_at_child_inf to match variable name change in core_hiv_synthesis file;

s_cost_art_x = s_cost_zdv + s_cost_ten + s_cost_3tc + s_cost_nev + s_cost_lpr + s_cost_dar + s_cost_taz + s_cost_efa + s_cost_dol ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 

if &discount gt 0 then cost_clin_care = dcost_clin_care / &discount;

cost = (dcost * 1000000) / &discount;

dcost_80 = s_dcost__80 * sf * 4 / 1000;

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


***HIV Control variables;
** Stocks;
* n_alive_1524m;				n_alive_1524m = s_ageg1m * sf; 
* n_alive_1524w;				n_alive_1524w = s_ageg1w * sf; 
* n_alive_2549m;				n_alive_2549m = (s_alive1549_m - s_ageg1m) * sf;
* n_alive_2549w;				n_alive_2549w = (s_alive1549_w - s_ageg1w) * sf;
* n_alive_50plm;				n_alive_50plm = (s_ageg5054m + s_ageg5559m + s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg8084m + s_ageg85plm) * sf; *JASJun2024;
* n_alive_50plw;				n_alive_50plw = (s_ageg5054w + s_ageg5559w + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w + s_ageg8084w + s_ageg85plw) * sf; *JASJun2024;
* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf;
* n_alive_msm;					n_alive_msm = s_alive_msm * sf ;

* n_hiv1524m;					n_hiv1524m = s_hiv1524m * sf; 
* n_hiv1524w;					n_hiv1524w = s_hiv1524w * sf; 
* n_hiv2549m;					n_hiv2549m = (s_hiv1549m - s_hiv1524m) * sf; 
* n_hiv2549w;					n_hiv2549w = (s_hiv1549w - s_hiv1524w) * sf; 
* n_hiv50plm;					n_hiv50plm = (s_hivge15m - s_hiv1549m) * sf; 
* n_hiv50plw;					n_hiv50plw = (s_hivge15w - s_hiv1549w) * sf; 
* n_hiv_sw;						n_hiv_sw = s_hiv_sw * sf;
* n_hiv_msm;					n_hiv_msm = s_hiv_msm * sf;

* n_diag_m_1524  ;				n_diag_m_1524 = s_diag_m_1524 * sf;
* n_diag_m_2549  ;				n_diag_m_2549 = s_diag_m_2549 * sf;
* n_diag_m_50pl  ;				n_diag_m_50pl = s_diag_m_50pl * sf;
* n_diag_w_1524  ;				n_diag_w_1524 = s_diag_w_1524 * sf;
* n_diag_w_2549  ;				n_diag_w_2549 = s_diag_w_2549 * sf;
* n_diag_w_50pl  ;				n_diag_w_50pl = s_diag_w_50pl * sf;
* n_diag_sw ;					n_diag_sw = s_diag_sw * sf;
* n_diag_msm;					n_diag_msm = s_diag_msm * sf;

* n_onart_m;					n_onart_m = s_onart_m * sf;
* n_onart_w;					n_onart_w = s_onart_w * sf;
* n_onart1524_m;				n_onart1524_m = (s_onart_m1519_ + s_onart_m2024_) * sf;
* n_onart1524_w;				n_onart1524_w = (s_onart_w1519_ + s_onart_w2024_) * sf;
* n_onart2549_m;				n_onart2549_m = (s_onart_m2529_ + s_onart_m3034_ + s_onart_m3539_ + s_onart_m4044_ + s_onart_m4549_) * sf;
* n_onart2549_w;				n_onart2549_w = (s_onart_w2529_ + s_onart_w3034_ + s_onart_w3539_ + s_onart_w4044_ + s_onart_w4549_) * sf;
* n_onart50pl_m;				n_onart50pl_m = n_onart_m - n_onart2549_m - n_onart1524_m;
* n_onart50pl_w;				n_onart50pl_w = n_onart_w - n_onart2549_w - n_onart1524_w;
* n_onart_sw;					n_onart_sw = s_onart_sw * sf;
* n_onart_msm;					n_onart_msm = s_onart_msm * sf;

* n_vl1000_art_1524_m;			n_vl1000_art_1524_m = s_vl1000_art_1524_m * sf;    
* n_vl1000_art_2549_m;			n_vl1000_art_2549_m = s_vl1000_art_2549_m * sf;    
* n_vl1000_art_50pl_m;			n_vl1000_art_50pl_m = s_vl1000_art_50pl_m * sf;    
* n_vl1000_art_1524_w;			n_vl1000_art_1524_w = s_vl1000_art_1524_w * sf;    
* n_vl1000_art_2549_w;			n_vl1000_art_2549_w = s_vl1000_art_2549_w * sf;    
* n_vl1000_art_50pl_w;			n_vl1000_art_50pl_w = s_vl1000_art_50pl_w * sf;    
* n_vl1000_art_sw;				n_vl1000_art_sw = s_vl1000_art_sw * sf;    
* n_vl1000_art_msm;				n_vl1000_art_msm = s_vl1000_art_msm * sf;    

** Flows;
* n_birth;						n_birth = s_birth * sf * 4;
* n_give_birth_w_hiv; 			n_give_birth_w_hiv = s_give_birth_with_hiv * sf * 4;

* n_dead1524m_all;				n_dead1524m_all = (s_dead1519m_all + s_dead2024m_all) * 4 * sf;
* n_dead2549m_all;				n_dead2549m_all = (s_dead2529m_all + s_dead3034m_all + s_dead3539m_all + s_dead4044m_all + s_dead4549m_all) * 4 * sf;
* n_dead50plm_all;				n_dead50plm_all = (s_dead5054m_all + s_dead5559m_all + s_dead6064m_all + s_dead6569m_all + s_dead7074m_all + s_dead7579m_all +
								s_dead8084m_all	+ s_dead85plm_all ) * 4 * sf;
* n_dead1524w_all;				n_dead1524w_all = (s_dead1519w_all + s_dead2024w_all) * 4 * sf;
* n_dead2549w_all;				n_dead2549w_all = (s_dead2529w_all + s_dead3034w_all + s_dead3539w_all + s_dead4044w_all + s_dead4549w_all) * 4 * sf;
* n_dead50plm_all;				n_dead50plw_all = (s_dead5054w_all + s_dead5559w_all + s_dead6064w_all + s_dead6569w_all + s_dead7074w_all + s_dead7579w_all +
								s_dead8084w_all	+ s_dead85plw_all ) * 4 * sf;
* n_death_hiv_age_1524_m;		n_death_hiv_age_1524_m = s_death_hiv_age_1524_m * 4 * sf; 
* n_death_hiv_age_2549_m;		n_death_hiv_age_2549_m = s_death_hiv_age_2549_m * 4 * sf; 
* n_death_hiv_age_50pl_m;		n_death_hiv_age_50pl_m = s_death_hiv_age_50pl_m * 4 * sf; 
* n_death_hiv_age_1524_w;		n_death_hiv_age_1524_w = s_death_hiv_age_1524_w * 4 * sf; 
* n_death_hiv_age_2549_w;		n_death_hiv_age_2549_w = s_death_hiv_age_2549_w * 4 * sf; 
* n_death_hiv_age_50pl_w;		n_death_hiv_age_50pl_w = s_death_hiv_age_50pl_w * 4 * sf; 

* n_hiv_child;					n_hiv_child = (s_birth_with_inf_child + s_child_infected_breastfeeding) * 4 * sf; 

* n_new_inf1524m;				n_new_inf1524m = (s_primary1519m + s_primary2024m) * sf * 4;
* n_new_inf1524w;				n_new_inf1524w = (s_primary1519w + s_primary2024w) * sf * 4;
* n_new_inf2549m;				n_new_inf2549m = (s_primary1549m - s_primary1519m - s_primary2024m) * sf * 4;
* n_new_inf2549w;				n_new_inf2549w = (s_primary1549w - s_primary1519w - s_primary2024w) * sf * 4;
* n_new_inf50plm;				n_new_inf50plm = (s_primary5054m + s_primary5559m + s_primary6064m) * sf * 4;	
* n_new_inf50plw;				n_new_inf50plw = (s_primary5054w + s_primary5559w + s_primary6064w) * sf * 4;	
* n_new_inf_sw;					n_new_inf_sw = s_primary_sw * 4 * sf;
* n_new_inf_msm;				n_new_inf_msm = s_primary_msm * 4 * sf;

* n_daly;						n_daly = (s_yllag_hiv_m + s_yllag_hiv_w + s_live_daly ) * 4 * sf; *Not outputted - check;
* p_mcirc_1549m;				p_mcirc_1549m = (s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m) / 
									(s_ageg1519m + s_ageg2024m + s_ageg2529m + s_ageg3034m + s_ageg3539m + s_ageg4044m + s_ageg4549m) ;

* n_onprep_m;					n_onprep_m = s_onprep_m * sf;
* n_onprep_w;					n_onprep_w = s_onprep_w * sf;
* n_onprep_sw;					n_onprep_sw = s_onprep_sw * sf;
* n_onprep_msm;					n_onprep_msm = s_onprep_msm * sf;
* n_elig_prep;					n_elig_prep = (s_elig_prep_any_m_1564 + s_elig_prep_any_w_1564) * sf;
* n_new_inf_prep_elig;			n_new_inf_prep_elig = s_primary_prep_elig * 4 * sf; 

* n_sw_program_visit;			n_sw_program_visit = s_sw_program_visit * sf;* Note this is per three months to approximate number of SW reached;

* Added Sept 2025;
* n_circumcised_15_24_m;		n_circumcised_15_24_m = (s_mcirc_1519m + s_mcirc_2024m) * sf;	* Currently circumcised men (trad + medical), not just new circumcisions;
* n_onprep_agyw_pg;				n_onprep_agyw_pg = s_prep_any_agyw_pg * sf; * Person years of PrEP distributed to sexually active AGYW and pregnant women;
* n_agyw_pg;					n_agyw_pg = s_agyw_pg * sf;  				* Number of people in the total population, sexually active AGYW and pregnant women;


***Extra outputs for calibration;
** Stocks;
* n_onprep_agyw_plw;			n_onprep_agyw_plw = s_prep_any_agyw_plw * sf; * Person years of PrEP distributed to sexually active AGYW and pregnant and breastfeeding women;
* n_agyw_plw;					n_agyw_plw = s_agyw_plw * sf; * need to add new code in 15/09 version; * Number of people in the total population, sexually active AGYW and pregnant and breastfeeding women;

* n_onprep_oral_agyw_pg;		n_onprep_oral_agyw_pg = s_prep_oral_agyw_pg * sf; * Person years of PrEP distributed to sexually active AGYW and pregnant and breastfeeding women;
* n_onprep_len_agyw_pg;			n_onprep_len_agyw_pg = s_prep_len_agyw_pg * sf; * Person years of PrEP distributed to sexually active AGYW and pregnant and breastfeeding women;
* n_onprep_oral_agyw_plw;		n_onprep_oral_agyw_plw = s_prep_oral_agyw_plw * sf; * Person years of PrEP distributed to sexually active AGYW and pregnant and breastfeeding women;
* n_onprep_len_agyw_plw;		n_onprep_len_agyw_plw = s_prep_len_agyw_plw * sf; * Person years of PrEP distributed to sexually active AGYW and pregnant and breastfeeding women;

* n_onprep_oral_m;				n_onprep_oral_m = s_onprep_oral_m * sf;
* n_onprep_len_m;				n_onprep_len_m = s_onprep_len_m * sf;
* n_onprep_oral_w;				n_onprep_oral_w = s_onprep_oral_w * sf;
* n_onprep_len_w;				n_onprep_len_w = s_onprep_len_w * sf;
* n_onprep_oral_sw;				n_onprep_oral_sw = s_onprep_oral_sw * sf;
* n_onprep_len_sw;				n_onprep_len_sw = s_onprep_len_sw * sf;
* n_onprep_oral_msm;			n_onprep_oral_msm = s_onprep_oral_msm * sf;
* n_onprep_len_msm;				n_onprep_len_msm = s_onprep_len_msm * sf;

* n_tested_m;					n_tested_m = s_tested_m * sf * 4;
* n_tested_w;					n_tested_w = (s_tested_f + s_tested_anc_prevdiag )* sf * 4;
* n_self_tested_m;				n_self_tested_m = s_self_tested_m * sf ;
* n_self_tested_w;				n_self_tested_w = s_self_tested_w * sf ;
* n_tested_due_to_self_test;	n_tested_due_to_self_test =  s_tested_due_to_self_test * sf ;

** Flows; 
* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* incidence1564;                incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;
* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;
* av_newp_ge1;					av_newp_ge1 = s_newp / s_newp_ge1 ;
* p_ep;							p_ep = s_ep / s_alive1564;				

* p_m_npge1_; 					p_m_npge1_ = s_m_npge1 / s_alive1564_m; *VCFeb2023;
* p_w_npge1_; 					p_w_npge1_ = s_w_npge1 / s_alive1564_w; *VCFeb2023;

* p_mcirc_1524m;				p_mcirc_1524m = (s_mcirc_1519m + s_mcirc_2024m) / (s_ageg1519m + s_ageg2024m) ;
;




keep run cald option

/*HIV Control variables*/
n_alive_1524m	n_alive_2549m	n_alive_50plm	n_alive_1524w	n_alive_2549w	n_alive_50plw	n_sw_1564	n_alive_msm
n_hiv1524m		n_hiv2549m		n_hiv50plm		n_hiv1524w		n_hiv2549w		n_hiv50plw		n_hiv_sw	n_hiv_msm
n_diag_m_1524	n_diag_m_2549	n_diag_m_50pl	n_diag_w_1524	n_diag_w_2549	n_diag_w_50pl	n_diag_sw	n_diag_msm
n_onart1524_m	n_onart2549_m	n_onart50pl_m	n_onart1524_w	n_onart2549_w	n_onart50pl_w	n_onart_sw	n_onart_msm
n_vl1000_art_1524_m		n_vl1000_art_2549_m		n_vl1000_art_50pl_m		n_vl1000_art_1524_w		n_vl1000_art_2549_w		n_vl1000_art_50pl_w
n_vl1000_art_sw			n_vl1000_art_msm		n_birth					n_give_birth_w_hiv		n_hiv_child
n_dead1524m_all	n_dead2549m_all	n_dead50plm_all	n_dead1524w_all	n_dead2549w_all	n_dead50plw_all
n_new_inf1524m	n_new_inf2549m	n_new_inf50plm	n_new_inf1524w	n_new_inf2549w	n_new_inf50plw	n_new_inf_sw n_new_inf_msm
n_death_hiv_age_1524_m	n_death_hiv_age_2549_m	n_death_hiv_age_50pl_m	n_death_hiv_age_1524_w	n_death_hiv_age_2549_w	n_death_hiv_age_50pl_w
n_onprep_sw		n_onprep_msm	n_onprep_m		n_onprep_w		n_elig_prep		n_new_inf_prep_elig
n_daly			cost			p_mcirc_1549m			n_sw_program_visit
n_circumcised_15_24_m			n_onprep_agyw_pg		n_agyw_pg	/* added Sept 2025 */

/*Extra outputs for calibration*/	/* added Sept 2025 */
/* Stocks */
n_onprep_agyw_plw				n_agyw_plw
n_onprep_oral_agyw_pg			n_onprep_len_agyw_pg			n_onprep_oral_agyw_plw				n_onprep_len_agyw_plw
n_onprep_oral_m					n_onprep_len_m					n_onprep_oral_w						n_onprep_len_w
n_onprep_oral_sw				n_onprep_len_sw					n_onprep_oral_msm					n_onprep_len_msm
n_tested_m						n_tested_w
n_self_tested_m					n_self_tested_w					n_tested_due_to_self_test

/* Flows */
incidence1549					incidence1549w					incidence1549m						incidence1564
p_newp_ge1						p_newp_ge5						av_newp_ge1							p_ep
p_m_npge1_						p_w_npge1_
p_mcirc_1524m
;




proc sort data=y;by run option;run;
/*proc freq data=y; table option;run;*/


data a.long_zim_control; 
	set y;
	/*if option ne 0 then delete;*/
	if cald=. then delete; 
run;

proc contents data = a.long_zim_control; run;

/*proc freq data=a.long_zim_all; table option;run;*/
/*proc freq data=a.long_zim_control; table option;run;*/







************************************************************************************************************************************************************;
** GENERATE OUTPUTS FOR HIV CONTROL SPREADSHEET;
************************************************************************************************************************************************************;

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Set option number for var_stock and var_flow macros here;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
%let op_num=0;

/*
0 = baseline (minimal)
1 = oral PrEP for FSW
2 = oral + inj PrEP for FSW
3 = oral PrEP for sexually active AGYW + pregnant women
4 = oral + inj PrEP for sexually active AGYW + pregnant women
5 = oral PrEP for MSM
6 = oral + inj PrEP for MSM
7 = VMMC
8 = condom provision + promotion
9 = KP outreach - FSW
10 = KP outreach - MSM
11 = testing
12 = adherence support

30 = oral PrEP for sexually active AGYW + pregnant + breastfeeding women
31 = oral + inj PrEP for sexually active AGYW + pregnant + breastfeeding women
*/

* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Variable lists;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%let stock_list = 
	Total_00_14_M			Total_15_24_M			Total_25_49_M			Total_50_UP_M
	Total_00_14_F			Total_15_24_F			Total_25_49_F			Total_50_UP_F
	Total_FSW				Total_MSM
	PLHIV_00_14_M			PLHIV_15_24_M			PLHIV_25_49_M			PLHIV_50_UP_M
	PLHIV_00_14_F			PLHIV_15_24_F			PLHIV_25_49_F			PLHIV_50_UP_F
	PLHIV_FSW				PLHIV_MSM
	Diagnosed_00_14_M		Diagnosed_15_24_M		Diagnosed_25_49_M		Diagnosed_50_UP_M
	Diagnosed_00_14_F		Diagnosed_15_24_F		Diagnosed_25_49_F		Diagnosed_50_UP_F
	Diagnosed_FSW			Diagnosed_MSM
	ART_00_14_M				ART_15_24_M				ART_25_49_M				ART_50_UP_M
	ART_00_14_F				ART_15_24_F				ART_25_49_F				ART_50_UP_F
	ART_FSW					ART_MSM
	VLS_00_14_M				VLS_15_24_M				VLS_25_49_M				VLS_50_UP_M
	VLS_00_14_F				VLS_15_24_F				VLS_25_49_F				VLS_50_UP_F
	VLS_FSW					VLS_MSM
	N_circumcised_15_24_M		/* added Sept 2025 - stock */
	Total_AGYW_PG				/* added Sept 2025 - stock */
	/* Extras for calibration */
	n_onprep_agyw_plw			n_agyw_plw
	n_onprep_oral_agyw_pg		n_onprep_len_agyw_pg
	n_onprep_oral_agyw_plw		n_onprep_len_agyw_plw
	n_onprep_oral_m				n_onprep_len_m				
	n_onprep_oral_w				n_onprep_len_w
	n_onprep_oral_sw			n_onprep_len_sw			
	n_onprep_oral_msm			n_onprep_len_msm
	n_tested_m					n_tested_w
	n_self_tested_m				n_self_tested_w					n_tested_due_to_self_test
	;
/*%put &stock_list;*/

%let flow_list = 
	Birth_All				Birth_HIV
	DeathsAll_00_14_M		DeathsAll_15_24_M		DeathsAll_25_49_M		DeathsAll_50_UP_M
	DeathsAll_00_14_F		DeathsAll_15_24_F		DeathsAll_25_49_F		DeathsAll_50_UP_F
	NewHIV_00_14_M			NewHIV_15_24_M			NewHIV_25_49_M			NewHIV_50_UP_M
	NewHIV_00_14_F			NewHIV_15_24_F			NewHIV_25_49_F			NewHIV_50_UP_F
	NewHIV_FSW				NewHIV_MSM
	DeathsHIV_00_14_M		DeathsHIV_15_24_M		DeathsHIV_25_49_M		DeathsHIV_50_UP_M
	DeathsHIV_00_14_F		DeathsHIV_15_24_F		DeathsHIV_25_49_F		DeathsHIV_50_UP_F
	DALYs_Undiscounted		TotalCost_Undiscounted
	Percent_circumcised		Percent_condom_use_GP
	PrEP_FSW				PrEP_MSM				PrEP_GP					
	PrEP_Pop_GP				NewHIV_PrEP_Pop_GP
	Percent_FSW_reached		Percent_MSM_reached
	PrEP_AGYW_PG			/* added Sept 2025 */
	/* Extras for calibration */
	incidence1549			incidence1549w			incidence1549m			incidence1564
	p_newp_ge1				p_newp_ge5				av_newp_ge1				p_ep
	p_m_npge1_				p_w_npge1_
	p_mcirc_1524m
	;
/*%put &flow_list;*/

%let keep_vars_in_order = 
	Total_00_14_M			Total_15_24_M			Total_25_49_M			Total_50_UP_M
	Total_00_14_F			Total_15_24_F			Total_25_49_F			Total_50_UP_F
	Total_FSW				Total_MSM
	PLHIV_00_14_M			PLHIV_15_24_M			PLHIV_25_49_M			PLHIV_50_UP_M
	PLHIV_00_14_F			PLHIV_15_24_F			PLHIV_25_49_F			PLHIV_50_UP_F
	PLHIV_FSW				PLHIV_MSM
	Diagnosed_00_14_M		Diagnosed_15_24_M		Diagnosed_25_49_M		Diagnosed_50_UP_M
	Diagnosed_00_14_F		Diagnosed_15_24_F		Diagnosed_25_49_F		Diagnosed_50_UP_F
	Diagnosed_FSW			Diagnosed_MSM
	ART_00_14_M				ART_15_24_M				ART_25_49_M				ART_50_UP_M
	ART_00_14_F				ART_15_24_F				ART_25_49_F				ART_50_UP_F
	ART_FSW					ART_MSM
	VLS_00_14_M				VLS_15_24_M				VLS_25_49_M				VLS_50_UP_M
	VLS_00_14_F				VLS_15_24_F				VLS_25_49_F				VLS_50_UP_F
	VLS_FSW					VLS_MSM
	Birth_All				Birth_HIV
	DeathsAll_00_14_M		DeathsAll_15_24_M		DeathsAll_25_49_M		DeathsAll_50_UP_M
	DeathsAll_00_14_F		DeathsAll_15_24_F		DeathsAll_25_49_F		DeathsAll_50_UP_F
	NewHIV_00_14_M			NewHIV_15_24_M			NewHIV_25_49_M			NewHIV_50_UP_M
	NewHIV_00_14_F			NewHIV_15_24_F			NewHIV_25_49_F			NewHIV_50_UP_F
	NewHIV_FSW				NewHIV_MSM
	DeathsHIV_00_14_M		DeathsHIV_15_24_M		DeathsHIV_25_49_M		DeathsHIV_50_UP_M
	DeathsHIV_00_14_F		DeathsHIV_15_24_F		DeathsHIV_25_49_F		DeathsHIV_50_UP_F
	DALYs_Undiscounted		TotalCost_Undiscounted
	Percent_circumcised		Percent_condom_use_GP
	PrEP_FSW				PrEP_MSM				PrEP_GP					
	PrEP_Pop_GP				NewHIV_PrEP_Pop_GP
	Percent_FSW_reached		Percent_MSM_reached
	N_circumcised_15_24_M	
	PrEP_AGYW_PG			
	Total_AGYW_PG			
	;


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Macros;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;


* var_stock macro takes the mid-year data point;
%macro var_stock(v=);

* &v ;

* option is set to &op_num - defined below where macro is run;

* stock ;

* Use option 0 outputs for years 1985-2023;
proc means noprint data=y; var &v; output out=y_1985 mean= &v;  where cald = 1985.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1986 mean= &v;  where cald = 1986.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1987 mean= &v;  where cald = 1987.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1988 mean= &v;  where cald = 1988.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1989 mean= &v;  where cald = 1989.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1990 mean= &v;  where cald = 1990.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1991 mean= &v;  where cald = 1991.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1992 mean= &v;  where cald = 1992.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1993 mean= &v;  where cald = 1993.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1994 mean= &v;  where cald = 1994.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1995 mean= &v;  where cald = 1995.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1996 mean= &v;  where cald = 1996.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1997 mean= &v;  where cald = 1997.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1998 mean= &v;  where cald = 1998.5 and option = 0;
proc means noprint data=y; var &v; output out=y_1999 mean= &v;  where cald = 1999.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2000 mean= &v;  where cald = 2000.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2001 mean= &v;  where cald = 2001.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2002 mean= &v;  where cald = 2002.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2003 mean= &v;  where cald = 2003.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2004 mean= &v;  where cald = 2004.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2005 mean= &v;  where cald = 2005.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2006 mean= &v;  where cald = 2006.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2007 mean= &v;  where cald = 2007.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2008 mean= &v;  where cald = 2008.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2009 mean= &v;  where cald = 2009.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2010 mean= &v;  where cald = 2010.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2011 mean= &v;  where cald = 2011.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2012 mean= &v;  where cald = 2012.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2013 mean= &v;  where cald = 2013.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2014 mean= &v;  where cald = 2014.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2015 mean= &v;  where cald = 2015.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2016 mean= &v;  where cald = 2016.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2017 mean= &v;  where cald = 2017.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2018 mean= &v;  where cald = 2018.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2019 mean= &v;  where cald = 2019.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2020 mean= &v;  where cald = 2020.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2021 mean= &v;  where cald = 2021.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2022 mean= &v;  where cald = 2022.5 and option = 0;
proc means noprint data=y; var &v; output out=y_2023 mean= &v;  where cald = 2023.5 and option = 0;

* Set option = &op_num for options 1-12;
proc means noprint data=y; var &v; output out=y_2024 mean= &v;  where cald = 2024.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2025 mean= &v;  where cald = 2025.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2026 mean= &v;  where cald = 2026.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2027 mean= &v;  where cald = 2027.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2028 mean= &v;  where cald = 2028.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2029 mean= &v;  where cald = 2029.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2030 mean= &v;  where cald = 2030.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2031 mean= &v;  where cald = 2031.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2032 mean= &v;  where cald = 2032.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2033 mean= &v;  where cald = 2033.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2034 mean= &v;  where cald = 2034.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2035 mean= &v;  where cald = 2035.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2036 mean= &v;  where cald = 2036.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2037 mean= &v;  where cald = 2037.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2038 mean= &v;  where cald = 2038.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2039 mean= &v;  where cald = 2039.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2040 mean= &v;  where cald = 2040.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2041 mean= &v;  where cald = 2041.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2042 mean= &v;  where cald = 2042.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2043 mean= &v;  where cald = 2043.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2044 mean= &v;  where cald = 2044.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2045 mean= &v;  where cald = 2045.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2046 mean= &v;  where cald = 2046.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2047 mean= &v;  where cald = 2047.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2048 mean= &v;  where cald = 2048.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2049 mean= &v;  where cald = 2049.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2050 mean= &v;  where cald = 2050.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2051 mean= &v;  where cald = 2051.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2052 mean= &v;  where cald = 2052.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2053 mean= &v;  where cald = 2053.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2054 mean= &v;  where cald = 2054.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2055 mean= &v;  where cald = 2055.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2056 mean= &v;  where cald = 2056.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2057 mean= &v;  where cald = 2057.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2058 mean= &v;  where cald = 2058.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2059 mean= &v;  where cald = 2059.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2060 mean= &v;  where cald = 2060.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2061 mean= &v;  where cald = 2061.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2062 mean= &v;  where cald = 2062.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2063 mean= &v;  where cald = 2063.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2064 mean= &v;  where cald = 2064.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2065 mean= &v;  where cald = 2065.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2066 mean= &v;  where cald = 2066.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2067 mean= &v;  where cald = 2067.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2068 mean= &v;  where cald = 2068.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2069 mean= &v;  where cald = 2069.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2070 mean= &v;  where cald = 2070.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2071 mean= &v;  where cald = 2071.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2072 mean= &v;  where cald = 2072.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2073 mean= &v;  where cald = 2073.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2074 mean= &v;  where cald = 2074.5 and option = &op_num;
proc means noprint data=y; var &v; output out=y_2075 mean= &v;  where cald = 2075.5 and option = &op_num;

data &v ; set  
y_1985  y_1986  y_1987  y_1988  y_1989  y_1990  y_1991  y_1992  y_1993  y_1994  y_1995  y_1996  y_1997  y_1998  y_1999  y_2000  y_2001  y_2002  y_2003  y_2004  
y_2005  y_2006  y_2007  y_2008  y_2009  y_2010  y_2011  y_2012  y_2013  y_2014  y_2015  y_2016  y_2017  y_2018  y_2019  y_2020  y_2021  y_2022  y_2023  y_2024  
y_2025  y_2026  y_2027  y_2028  y_2029  y_2030  y_2031  y_2032  y_2033  y_2034  y_2035  y_2036  y_2037  y_2038  y_2039  y_2040  y_2041  y_2042  y_2043  y_2044  
y_2045  y_2046  y_2047  y_2048  y_2049  y_2050  y_2051  y_2052  y_2053  y_2054  y_2055  y_2056  y_2057  y_2058  y_2059  y_2060  y_2061  y_2062  y_2063  y_2064  
y_2065  y_2066  y_2067  y_2068  y_2069  y_2070  y_2071  y_2072  y_2073  y_2074  y_2075  
;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var_stock;



* var_flow macro takes a 1-year mean from mid-year to mid-year;
%macro var_flow(v=);

* Use option 0 outputs for years 1985-2023;
proc means noprint data=y; var &v; output out=z_1985 mean= &v; where 1984.5 < cald <= 1985.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1986 mean= &v; where 1985.5 < cald <= 1986.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1987 mean= &v; where 1986.5 < cald <= 1987.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1988 mean= &v; where 1987.5 < cald <= 1988.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1989 mean= &v; where 1988.5 < cald <= 1989.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1990 mean= &v; where 1989.5 < cald <= 1990.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1991 mean= &v; where 1990.5 < cald <= 1991.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1992 mean= &v; where 1991.5 < cald <= 1992.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1993 mean= &v; where 1992.5 < cald <= 1993.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1994 mean= &v; where 1993.5 < cald <= 1994.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1995 mean= &v; where 1994.5 < cald <= 1995.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1996 mean= &v; where 1995.5 < cald <= 1996.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1997 mean= &v; where 1996.5 < cald <= 1997.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1998 mean= &v; where 1997.5 < cald <= 1998.5 and option = 0;
proc means noprint data=y; var &v; output out=z_1999 mean= &v; where 1998.5 < cald <= 1999.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2000 mean= &v; where 1999.5 < cald <= 2000.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2001 mean= &v; where 2000.5 < cald <= 2001.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2002 mean= &v; where 2001.5 < cald <= 2002.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2003 mean= &v; where 2002.5 < cald <= 2003.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2004 mean= &v; where 2003.5 < cald <= 2004.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2005 mean= &v; where 2004.5 < cald <= 2005.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2006 mean= &v; where 2005.5 < cald <= 2006.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2007 mean= &v; where 2006.5 < cald <= 2007.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2008 mean= &v; where 2007.5 < cald <= 2008.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2009 mean= &v; where 2008.5 < cald <= 2009.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2010 mean= &v; where 2009.5 < cald <= 2010.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2011 mean= &v; where 2010.5 < cald <= 2011.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2012 mean= &v; where 2011.5 < cald <= 2012.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2013 mean= &v; where 2012.5 < cald <= 2013.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2014 mean= &v; where 2013.5 < cald <= 2014.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2015 mean= &v; where 2014.5 < cald <= 2015.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2016 mean= &v; where 2015.5 < cald <= 2016.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2017 mean= &v; where 2016.5 < cald <= 2017.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2018 mean= &v; where 2017.5 < cald <= 2018.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2019 mean= &v; where 2018.5 < cald <= 2019.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2020 mean= &v; where 2019.5 < cald <= 2020.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2021 mean= &v; where 2020.5 < cald <= 2021.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2022 mean= &v; where 2021.5 < cald <= 2022.5 and option = 0;
proc means noprint data=y; var &v; output out=z_2023 mean= &v; where 2022.5 < cald <= 2023.5 and option = 0;

* Set option = &op_num for options 1-12;
proc means noprint data=y; var &v; output out=z_2024 mean= &v; where 2023.5 < cald <= 2024.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2025 mean= &v; where 2024.5 < cald <= 2025.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2026 mean= &v; where 2025.5 < cald <= 2026.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2027 mean= &v; where 2026.5 < cald <= 2027.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2028 mean= &v; where 2027.5 < cald <= 2028.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2029 mean= &v; where 2028.5 < cald <= 2029.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2030 mean= &v; where 2029.5 < cald <= 2030.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2031 mean= &v; where 2030.5 < cald <= 2031.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2032 mean= &v; where 2031.5 < cald <= 2032.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2033 mean= &v; where 2032.5 < cald <= 2033.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2034 mean= &v; where 2033.5 < cald <= 2034.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2035 mean= &v; where 2034.5 < cald <= 2035.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2036 mean= &v; where 2035.5 < cald <= 2036.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2037 mean= &v; where 2036.5 < cald <= 2037.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2038 mean= &v; where 2037.5 < cald <= 2038.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2039 mean= &v; where 2038.5 < cald <= 2039.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2040 mean= &v; where 2039.5 < cald <= 2040.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2041 mean= &v; where 2040.5 < cald <= 2041.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2042 mean= &v; where 2041.5 < cald <= 2042.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2043 mean= &v; where 2042.5 < cald <= 2043.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2044 mean= &v; where 2043.5 < cald <= 2044.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2045 mean= &v; where 2044.5 < cald <= 2045.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2046 mean= &v; where 2045.5 < cald <= 2046.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2047 mean= &v; where 2046.5 < cald <= 2047.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2048 mean= &v; where 2047.5 < cald <= 2048.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2049 mean= &v; where 2048.5 < cald <= 2049.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2050 mean= &v; where 2049.5 < cald <= 2050.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2051 mean= &v; where 2050.5 < cald <= 2051.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2052 mean= &v; where 2051.5 < cald <= 2052.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2053 mean= &v; where 2052.5 < cald <= 2053.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2054 mean= &v; where 2053.5 < cald <= 2054.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2055 mean= &v; where 2054.5 < cald <= 2055.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2056 mean= &v; where 2055.5 < cald <= 2056.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2057 mean= &v; where 2056.5 < cald <= 2057.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2058 mean= &v; where 2057.5 < cald <= 2058.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2059 mean= &v; where 2058.5 < cald <= 2059.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2060 mean= &v; where 2059.5 < cald <= 2060.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2061 mean= &v; where 2060.5 < cald <= 2061.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2062 mean= &v; where 2061.5 < cald <= 2062.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2063 mean= &v; where 2062.5 < cald <= 2063.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2064 mean= &v; where 2063.5 < cald <= 2064.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2065 mean= &v; where 2064.5 < cald <= 2065.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2066 mean= &v; where 2065.5 < cald <= 2066.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2067 mean= &v; where 2066.5 < cald <= 2067.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2068 mean= &v; where 2067.5 < cald <= 2068.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2069 mean= &v; where 2068.5 < cald <= 2069.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2070 mean= &v; where 2069.5 < cald <= 2070.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2071 mean= &v; where 2070.5 < cald <= 2071.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2072 mean= &v; where 2071.5 < cald <= 2072.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2073 mean= &v; where 2072.5 < cald <= 2073.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2074 mean= &v; where 2073.5 < cald <= 2074.5 and option = &op_num;
proc means noprint data=y; var &v; output out=z_2075 mean= &v; where 2074.5 < cald <= 2075.5 and option = &op_num;

data &v ; set  
z_1985  z_1986  z_1987  z_1988  z_1989  z_1990  z_1991  z_1992  z_1993  z_1994  z_1995  z_1996  z_1997  z_1998  z_1999  z_2000  z_2001  z_2002  z_2003  z_2004  
z_2005  z_2006  z_2007  z_2008  z_2009  z_2010  z_2011  z_2012  z_2013  z_2014  z_2015  z_2016  z_2017  z_2018  z_2019  z_2020  z_2021  z_2022  z_2023  z_2024  
z_2025  z_2026  z_2027  z_2028  z_2029  z_2030  z_2031  z_2032  z_2033  z_2034  z_2035  z_2036  z_2037  z_2038  z_2039  z_2040  z_2041  z_2042  z_2043  z_2044  
z_2045  z_2046  z_2047  z_2048  z_2049  z_2050  z_2051  z_2052  z_2053  z_2054  z_2055  z_2056  z_2057  z_2058  z_2059  z_2060  z_2061  z_2062  z_2063  z_2064  
z_2065  z_2066  z_2067  z_2068  z_2069  z_2070  z_2071  z_2072  z_2073  z_2074  z_2075
;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var_flow;




* make_stocks macro runs the var_stock macro through a list of variable names;
%macro make_stocks;
	%let n=%sysfunc(countw(&stock_list));	/* number of variables in flow_list */
    %do i=1 %to &n;
        %let var=%scan(&stock_list, &i);
        %var_stock(v=&var);
    %end;
%mend;


* make_flows macro runs the var_flow macro through a list of variable names;
%macro make_flows;
	%let n=%sysfunc(countw(&flow_list));	/* number of variables in flow_list */
    %do i=1 %to &n;
        %let var=%scan(&flow_list, &i);
        %var_flow(v=&var);
    %end;
%mend;







* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Data processing;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

data y; set a.long_zim_control; 

Total_00_14_M = .;
Total_15_24_M = n_alive_1524m;
Total_25_49_M = n_alive_2549m;
Total_50_UP_M = n_alive_50plm;
Total_00_14_F = .;
Total_15_24_F = n_alive_1524w;
Total_25_49_F = n_alive_2549w;
Total_50_UP_F = n_alive_50plw;
Total_FSW = n_sw_1564 ;
Total_MSM = n_alive_msm ;
PLHIV_00_14_M = .;
PLHIV_15_24_M = n_hiv1524m;
PLHIV_25_49_M = n_hiv2549m;
PLHIV_50_UP_M = n_hiv50plm;
PLHIV_00_14_F = .;
PLHIV_15_24_F = n_hiv1524w;
PLHIV_25_49_F = n_hiv2549w;
PLHIV_50_UP_F = n_hiv50plw;
PLHIV_FSW = n_hiv_sw;
PLHIV_MSM = n_hiv_msm;
Diagnosed_00_14_M = .;
Diagnosed_15_24_M = n_diag_m_1524;
Diagnosed_25_49_M = n_diag_m_2549;
Diagnosed_50_UP_M = n_diag_m_50pl;
Diagnosed_00_14_F = .;
Diagnosed_15_24_F = n_diag_w_1524;
Diagnosed_25_49_F = n_diag_w_2549;
Diagnosed_50_UP_F = n_diag_w_50pl;
Diagnosed_FSW = n_diag_sw;
Diagnosed_MSM = n_diag_msm;
ART_00_14_M = .;
ART_15_24_M = n_onart1524_m;
ART_25_49_M = n_onart2549_m;
ART_50_UP_M = n_onart50pl_m;
ART_00_14_F = .;
ART_15_24_F = n_onart1524_w;
ART_25_49_F = n_onart2549_w;
ART_50_UP_F = n_onart50pl_w;
ART_FSW = n_onart_sw;
ART_MSM = n_onart_msm;
VLS_00_14_M = .;
VLS_15_24_M = n_vl1000_art_1524_m;
VLS_25_49_M = n_vl1000_art_2549_m;
VLS_50_UP_M = n_vl1000_art_50pl_m;
VLS_00_14_F = .;
VLS_15_24_F = n_vl1000_art_1524_w;
VLS_25_49_F = n_vl1000_art_2549_w;
VLS_50_UP_F = n_vl1000_art_50pl_w;
VLS_FSW = n_vl1000_art_sw;
VLS_MSM = n_vl1000_art_msm;
Birth_All = n_birth;
Birth_HIV = n_give_birth_w_hiv;
DeathsAll_00_14_M = .;
DeathsAll_15_24_M = n_dead1524m_all;
DeathsAll_25_49_M = n_dead2549m_all;
DeathsAll_50_UP_M = n_dead50plm_all;
DeathsAll_00_14_F = .;
DeathsAll_15_24_F = n_dead1524w_all;
DeathsAll_25_49_F = n_dead2549w_all;
DeathsAll_50_UP_F = n_dead50plw_all;
NewHIV_00_14_M = n_hiv_child / 2;
NewHIV_15_24_M = n_new_inf1524m;
NewHIV_25_49_M = n_new_inf2549m;
NewHIV_50_UP_M = n_new_inf50plm;
NewHIV_00_14_F = n_hiv_child / 2;
NewHIV_15_24_F = n_new_inf1524w;
NewHIV_25_49_F = n_new_inf2549w;
NewHIV_50_UP_F = n_new_inf50plw;
NewHIV_FSW = n_new_inf_sw;
NewHIV_MSM = n_new_inf_msm;
DeathsHIV_00_14_M = .;
DeathsHIV_15_24_M = n_death_hiv_age_1524_m;
DeathsHIV_25_49_M = n_death_hiv_age_2549_m;
DeathsHIV_50_UP_M = n_death_hiv_age_50pl_m;
DeathsHIV_00_14_F = .;
DeathsHIV_15_24_F = n_death_hiv_age_1524_w;
DeathsHIV_25_49_F = n_death_hiv_age_2549_w;
DeathsHIV_50_UP_F = n_death_hiv_age_50pl_w;
DALYs_Undiscounted = n_daly;
TotalCost_Undiscounted = cost;
Percent_circumcised = p_mcirc_1549m * 100;
Percent_condom_use_GP = (1 - (p_m_npge1_ + p_w_npge1_) / 2) * 100;	* Estimate is percent of population with no condomless sex (mean m and w);
PrEP_FSW = n_onprep_sw;
PrEP_MSM = n_onprep_msm;
PrEP_GP = n_onprep_m + n_onprep_w;
PrEP_Pop_GP = n_elig_prep;
NewHIV_PrEP_Pop_GP = n_new_inf_prep_elig;
Percent_FSW_reached = (n_sw_program_visit * 100) / n_sw_1564;
Percent_MSM_reached = .;
N_circumcised_15_24_M = n_circumcised_15_24_m;	/* added Sept 2025 */
PrEP_AGYW_PG = n_onprep_agyw_pg;				/* added Sept 2025 */
Total_AGYW_PG = n_agyw_pg;						/* added Sept 2025 */

keep

cald
option

&stock_list
&flow_list
;
run;
 
  options nomprint;
  option nospool;



* Note years 1985-2023 are option 0 and 2024 onwards are selected option;
data year;
input year;
cards;
1985
1986 
1987 
1988 
1989 
1990 
1991 
1992 
1993 
1994 
1995 
1996 
1997 
1998 
1999 
2000 
2001 
2002 
2003 
2004 
2005 
2006 
2007 
2008 
2009 
2010 
2011 
2012 
2013 
2014 
2015 
2016 
2017 
2018 
2019 
2020 
2021 
2022 
2023 
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
2041 
2042 
2043 
2044 
2045 
2046 
2047 
2048 
2049 
2050 
2051 
2052 
2053 
2054 
2055 
2056 
2057 
2058 
2059 
2060 
2061 
2062 
2063 
2064 
2065 
2066 
2067 
2068 
2069 
2070 
2071 
2072 
2073 
2074 
2075
proc contents; 
run;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* stocks;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%make_stocks;

data stocks ; 
	merge year &stock_list;
run;


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* flows;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%make_flows;

data flows ; 
	merge year &flow_list;
run;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* Save outputs;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* Save output file with all outputs;
data a.outputs_all_&op_num; merge stocks flows;
	by year;
run;


* Save output file for HIV Control spreadsheet;
data outputs_&op_num; 
	retain year &keep_vars_in_order;	* Reorders variables;
	set a.outputs_all_&op_num;
	keep year &keep_vars_in_order;		* Drops extra variables;
run;


proc transpose data=outputs_&op_num out=a.outputs_&op_num; run;

proc export data=a.outputs_&op_num
	outfile= "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20251008_sq_out\outputs_&op_num..csv" 
	dbms=csv replace; 
	putnames=no;
run;


