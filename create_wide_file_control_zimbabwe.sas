
* options user="/folders/myfolders/";

ods html close;

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20250818_out\";


/*

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20250818_out\";

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

s_dcost_prep_inj = s_dcost_prep_inj * (204 / (50 * 1.2));  
s_dcost_prep_oral = s_dcost_prep_oral * (40 / (50*1.2)); 
s_dcost_prep_vr = s_dcost_prep_vr * (155 / (50 * 1.2));
s_dcost_prep_visit_inj = s_dcost_prep_visit_inj * (18 / 60) ;
s_dcost_prep_visit_oral = s_dcost_prep_visit_oral * (18 / 40) ;
s_dcost_prep_visit_vr = s_dcost_prep_visit_vr * (21 / 40) ;
s_dcost_prep_visit = s_dcost_prep_visit_inj + s_dcost_prep_visit_oral + s_dcost_prep_visit_vr; 
s_dcost_prep = s_dcost_prep_inj + s_dcost_prep_oral + s_dcost_prep_vr;

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
* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;

* n_onprep_m;					n_onprep_m = s_onprep_m * sf;
* n_onprep_w;					n_onprep_w = s_onprep_w * sf;
* n_onprep_sw;					n_onprep_sw = s_onprep_sw * sf;
* n_onprep_msm;					n_onprep_msm = s_onprep_msm * sf;
* n_elig_prep;					n_elig_prep = (s_elig_prep_any_m_1564 + s_elig_prep_any_w_1564) * sf;
* n_new_inf_prep_elig;			n_new_inf_prep_elig = s_primary_prep_elig * 4 * sf; 

* n_sw_program_visit;			n_sw_program_visit = s_sw_program_visit * sf;* Note this is per three months to approximate number of SW reached;







***Extra outputs for calibration;

* Add truncated list here? ;








* Previous list of outputs ;


* p_age1549_hiv ; 				p_age1549_hiv = (s_hiv1549m + s_hiv1549w) / s_hivge15 ;
* p_age1549_hivneg ;			p_age1549_hivneg = ((s_alive1549_w + s_alive1549_m) - (s_hiv1549m + s_hiv1549w)) / ((s_alive_m + s_alive_w) - s_hivge15);

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_birth / s_alive1564_w;
* n_birth;						n_birth = s_birth * sf * 4;
* n_everpregn_w1524;			n_everpregn_w1524 = s_everpregn_w1524 * sf;*May2023; 
* n_everpregn_hiv_w1524;		n_everpregn_hiv_w1524 = s_everpregn_hiv_w1524 * sf;*May2023; 

* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* av_newp_ge1;					av_newp_ge1 = s_newp / s_newp_ge1 ;

* av number of newp amongst people with newp ge 1, exlcuding sw;
* av_newp_ge1_non_sw;			av_newp_ge1_non_sw = (s_newp - s_newp_sw) / (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5));


* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_m_newp_ge1_age1549;			p_m_newp_ge1_age1549 = (s_m1549_newp_ge1) / (s_alive1549_m) ;
* p_w_newp_ge1_age1549;			p_w_newp_ge1_age1549 = (s_w1549_newp_ge1) / (s_alive1549_w) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_w1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* n_w1524_newp_ge1;				n_w1524_newp_ge1 = s_w1524_newp_ge1 * sf; *VCApr2023;

* p_ep;							p_ep = s_ep / s_alive1564 ;

* p_m_npge1_; 					p_m_npge1_ = s_m_npge1 / s_alive1564_m; *VCFeb2023;
* p_w_npge1_; 					p_w_npge1_ = s_w_npge1 / s_alive1564_w; *VCFeb2023;
* p_w1524_npge1_;		 		p_w1524_npge1_ = s_w1524_npge1 / (s_ageg1519w + s_ageg2024w); *VCFeb2023;
* p_sw_npge1_;					p_sw_npge1_ = s_sw_npge1 / s_sw_1564; *VCFeb2023;
* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;



* n_sw_1564;					n_sw_1564 = s_sw_1564 * sf;
* n_sw_1549;					n_sw_1549 = s_sw_1549 * sf;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;
* prev_sti_sw;					prev_sti_sw = s_sti_sw / s_sw_1564; *VCFeb2023;
* n_sw_inprog_ly;				*n_sw_inprog_ly = s_sw_inprog_ly * sf;
* n_sw_inprog_ever;				*n_sw_inprog_ever = s_sw_inprog_ever * sf;
* n_sw_program_visit;			n_sw_program_visit = s_sw_program_visit * sf;		*JASJun2024;	* Note this is per three months to approximte number of SW reached;

* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;

*s_tested_anc_prevdiag which is testing of women attending ANC on first trimester, previously diagnosed with HIV who do not disclose;
* n_tested_m;					n_tested_m = s_tested_m * sf * 4;
* n_tested_w;					n_tested_w = (s_tested_f + s_tested_anc_prevdiag )* sf * 4;
* n_tested_sw;					n_tested_sw = s_tested_sw * sf * 4;
* n_tested_swprog;				n_tested_swprog = s_tested_f_sw * sf * 4;
* n_tested;						n_tested = (s_tested + s_tested_anc_prevdiag)* sf * 4;
* n_tested_anc;					n_tested_anc = (s_tested_anc + s_tested_anc_prevdiag) * sf * 4;
*Note: tested_Anc assumes value of 1 at 2 time point dt_start_pregn+0.25 and dt_start_pregn+0.5,
so the one above is the annual number of tests conducted in ANC;
* p_anc;						p_anc = s_anc /(s_pregnant+s_birth);*pregnant=1 at dt_start_pregn, dt_start_pregn+0.25, dt_start_pregn+0.5
																	 birth=1    at dt_start_pregn+0.75
																	 anc=1      at dt_start_pregn, dt_start_pregn+0.25, dt_start_pregn+0.5, dt_start_pregn+0.75;
* n_tested_m_sympt;				n_tested_m_sympt = s_tested_m_sympt * sf * 4;*VCFeb2023;
* n_tested_w_sympt;				n_tested_w_sympt = s_tested_f_sympt * sf * 4;*VCFeb2023;
* n_tested_m_circ; 				n_tested_m_circ = s_tested_m_circ  * sf * 4;*VCFeb2023;
* n_tested_w_non_anc; 			n_tested_w_non_anc = s_tested_f_non_anc * sf * 4; *VCFeb2023;
* n_tested_labdel;				n_tested_w_labdel = s_tested_labdel * sf * 4; *VCFeb2023;
* n_tested_pd;					n_tested_w_pd = s_tested_pd * sf * 4;*VCFeb2023;
* n_tested_ancpd;				n_tested_ancpd = (s_tested_ancpd + s_tested_anc_prevdiag) * sf * 4;*VCMay2023;
* n_test_anclabpd;				n_test_anclabpd = (s_test_anclabpd + s_tested_anc_prevdiag)* sf * 4;*VCMay2023;
* n_tested_anc_prevdiag;		n_tested_anc_prevdiag = s_tested_anc_prevdiag * sf * 4;*VCJune2023;

* n_tested1st_anc;				n_tested1st_anc = s_tested1st_anc * sf * 4;*VCMar2023;
* n_tested1st_labdel;			n_tested1st_labdel = s_tested1st_labdel * sf * 4;*VCMar2023;
* n_tested1st_pd;				n_tested1st_pd = s_tested1st_pd * sf * 4;*VCMar2023;
* n_tested_sbcc;				n_tested_sbcc = s_tested_sbcc_program * sf * 4;*VCDec2023;

* n_self_tests ;				n_self_tests  = s_self_tested * sf ;
* n_self_tested_m;				n_self_tested_m = s_self_tested_m * sf ;
* n_self_tested_w;				n_self_tested_w = s_self_tested_w * sf ;
* n_tested_due_to_self_test;	n_tested_due_to_self_test =  s_tested_due_to_self_test * sf ;
* n_diagnosed_self_test;		n_diagnosed_self_test = s_diagnosed_self_test * sf;

* n_diagnosed;					n_diagnosed = s_diag_this_period * sf * 4;
* n_diag_m;						n_diag_m = s_diag_this_period_m * sf * 4;*VCMay2023;
* n_diag_w;						n_diag_w = s_diag_this_period_f * sf * 4;*VCMay2023;
* n_diag_anc;					n_diag_anc = s_diag_this_period_f_anc * sf * 4;
* n_diag_labdel;				n_diag_labdel = s_diag_this_period_labdel * sf * 4;*VCMar2023;
* n_diag_pd;					n_diag_pd = s_diag_this_period_f_pd * sf * 4;*VCMar2023;
* n_diag_anclabpd;				n_diag_anclabpd = s_diag_thisper_anclabpd * sf * 4;*VCMay2023;
* n_diag_progsw; 				n_diag_progsw = s_diag_thisper_progsw * sf * 4;*VCMay2023;
* n_diag_sw_this_per; 			n_diag_sw_this_per = s_diag_thisper_sw * sf * 4;*VCMay2023;

* this is abslute number of diagnosed people - not new diagnoses;
* n_diag_m_1524  ;				n_diag_m_1524 = s_diag_m_1524 * sf;
* n_diag_m_2549  ;				n_diag_m_2549 = s_diag_m_2549 * sf;
* n_diag_m_50pl  ;				n_diag_m_50pl = s_diag_m_50pl * sf;
* n_diag_w_1524  ;				n_diag_w_1524 = s_diag_w_1524 * sf;
* n_diag_w_2549  ;				n_diag_w_2549 = s_diag_w_2549 * sf;
* n_diag_w_50pl  ;				n_diag_w_50pl = s_diag_w_50pl * sf;
* n_diag_sw ;					n_diag_sw = s_diag_sw * sf;

* n_diag_self_test;				n_diag_self_test = s_diagnosed_self_test * sf * 4;	*JASJUN2024;

* n_hivpos_tests;				n_hivpos_tests = n_diagnosed + n_tested_anc_prevdiag;	* Number of HIV positive tests JASJun24;
* n_hivneg_tests;				n_hivneg_tests = n_tested - n_hivpos_tests;				* Number of HIV negative tests JASJun24;
* n_hivpos_tests_sympt;			n_hivpos_tests_sympt = (s_diag_this_period_m_sympt + s_diag_this_period_f_sympt) * sf * 4;		* Number of HIV positive tests in symptomatic adults JASJun24;
* n_hivneg_tests_sympt;			n_hivneg_tests_sympt = (n_tested_m_sympt + n_tested_w_sympt) * sf * 4 - n_hivpos_tests_sympt;	* Number of HIV negative tests in symptomatic adults JASJun24;

* n_diag_ever_m;				n_diag_ever_m = s_diag_m * sf;	*JASJun2024;
* n_diag_ever_w;				n_diag_ever_w = s_diag_w * sf;	*JASJun2024;

* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;
* test_proppos_m;			 	if s_tested_m gt 0 then test_proppos_m = s_diag_this_period_m / s_tested_m;*VCMay2023;
* test_proppos_w;				if s_tested_f gt 0 then test_proppos_w = s_diag_this_period_f / s_tested_f;*VCMay2023;
* test_proppos_sw;				if s_tested_sw gt 0 then test_proppos_sw = s_diag_thisper_sw / s_tested_sw;*VCMay2023;
* test_proppos_1524w; 			if s_tested_1524w gt 0 then test_proppos_1524w = s_diag_thisper_1524f /s_tested_1524w;*VCMay2023;
* test_proppos_sympt; 			*if s_diag_thisper_sympt gt 0 then test_proppos_sympt = s_diag_thisper_sympt /s_tested;*VCFeb2024;

* of people alive and within 1 year of infection, proportion diagnosed ;
* prop_diag_infection_1yr;		prop_diag_infection_1yr = s_year_1_infection_diag / s_year_1_infection ;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

*n_pmtct;						n_pmtct = s_pmtct * sf;

* n_mcirc;						n_mcirc = s_mcirc * sf;
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
* p_mcirc_1049m;				p_mcirc_1049m = (s_mcirc_1014m + s_mcirc_1549m) / (s_ageg1014m + s_ageg1549m) ;

* p_vmmc;						p_vmmc = s_vmmc / s_alive_m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_5064m;					p_vmmc_5064m = s_vmmc5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;
* p_vmmc_1049m;					p_vmmc_1049m = (s_vmmc1014m + s_vmmc1549m) / (s_ageg1014m + s_ageg1549m) ;

* n_new_vmmc;					n_new_vmmc = s_new_vmmc * sf * 4;	*JASJun2024;
* n_new_vmmc1014m;				n_new_vmmc1014m = s_new_vmmc1014m * sf * 4;
* n_new_vmmc1049m;				n_new_vmmc1049m = (s_new_vmmc1014m+s_new_vmmc1519m+s_new_vmmc2024m+s_new_vmmc2529m+s_new_vmmc3034m+s_new_vmmc3539m+s_new_vmmc4044m+s_new_vmmc4549m) * sf * 4;
* n_new_vmmc1549m;				n_new_vmmc1549m = (s_new_vmmc1519m+s_new_vmmc2024m+s_new_vmmc2529m+s_new_vmmc3034m+s_new_vmmc3539m+s_new_vmmc4044m+s_new_vmmc4549m) * sf * 4;

* n_new_birth_circ;				n_new_birth_circ = s_new_birth_circ * sf * 4;

* n_new_mcirc; 					n_new_mcirc = s_new_mcirc * sf * 4;
* n_new_mcirc_1049m; 			n_new_mcirc_1049m = (s_new_mcirc_1014m+s_new_mcirc_1519m+s_new_mcirc_2024m+s_new_mcirc_2529m+s_new_mcirc_3034m+s_new_mcirc_3539m+s_new_mcirc_4044m+ s_new_mcirc_4549m) * sf * 4;
* n_new_mcirc_1049m; 			n_new_mcirc_1549m = (s_new_mcirc_1519m+s_new_mcirc_2024m+s_new_mcirc_2529m+s_new_mcirc_3034m+s_new_mcirc_3539m+s_new_mcirc_4044m+ s_new_mcirc_4549m) * sf * 4;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then  
								prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp = s_sw_newp/s_sw_1564;

* p_reached_sbcc;			p_reached_sbcc = s_sbcc_program_visit / s_alive1564 ;
* n_sbcc_visit_1524m;  		n_sbcc_visit_1524m = s_sbcc_program_visit_1524m * sf;*No need to multiply by 4 as it lasts for 1 yearl; 
* n_sbcc_visit_1524w;		n_sbcc_visit_1524w = s_sbcc_program_visit_1524w * sf; 
* n_sbcc_visit_1524_;		n_sbcc_visit_1524_ = (s_sbcc_program_visit_1524w + s_sbcc_program_visit_1524m) * sf; 
* n_sbcc_visit_2564_; 		n_sbcc_visit_2564_ = s_sbcc_program_visit_2564_ * sf; 
* n_sbcc_visit_1564_; 		n_sbcc_visit_1564_ = s_sbcc_program_visit * sf; 


* n_tested_sbcc_1524m; 	n_tested_sbcc_1524m = s_tested_sbcc_program_1524m * sf * 4;
* n_tested_sbcc_1524w; 	n_tested_sbcc_1524w = s_tested_sbcc_program_1524w * sf * 4;
* n_tested_sbcc_2564_;	n_tested_sbcc_2564_ = s_tested_sbcc_program_2564_* sf * 4;

* p_tested_sbcc_1524m; 	p_tested_sbcc_1524m = s_tested_sbcc_program_1524m / s_sbcc_program_visit_1524m;
* p_tested_sbcc_1524w; 	p_tested_sbcc_1524w = s_tested_sbcc_program_1524w / s_sbcc_program_visit_1524w;
* p_tested_sbcc_2564_;	p_tested_sbcc_2564_ = s_tested_sbcc_program_2564_ / s_sbcc_program_visit_2564_;

* p_pos_tested_sbcc;			if s_tested_sbcc_program gt 0 then p_pos_tested_sbcc = s_diag_this_period_sbcc / s_tested_sbcc_program;

* overall_test_yield;	        overall_test_yield = s_diag_this_period / s_tested;
	
																								  

																																								 
* prep;

* proportion of those on prep who have ge 1 newp in the period ;
* p_prep_newp ;					if s_prep > 0 then p_prep_newp = (s_newp_this_per_hivneg_m_prep + s_newp_this_per_hivneg_w_prep) / s_prep_any ; 
* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;

* p_prep_elig_past_year;		p_prep_elig_past_year = s_prep_elig_past_year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* p_prep_elig_past_5year;		p_prep_elig_past_5year = s_prep_elig_past_5year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* mean_newp_ppers_prep;			if s_prep_any > 0 then mean_newp_ppers_prep = s_prep_newp / s_prep_any ;

* prop_onprep_newpge1;			if s_prep_any > 0 then prop_onprep_newpge1 = (s_prep_newpg1 + s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge2;			if s_prep_any > 0 then prop_onprep_newpge2 = (s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;
* prop_onprep_newpge3;			if s_prep_any > 0 then prop_onprep_newpge3 = (s_prep_newpg3 + s_prep_newpg4)/ s_prep_any ;


* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;
* prop_elig_on_prep;			if s_elig_prep > 0 then prop_elig_on_prep = s_prep_any / s_elig_prep ; 
* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;
* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;
* prop_1564_hivneg_onprep;		prop_1564_hivneg_onprep =   max((s_prep_any-s_hiv1_prep), 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;

* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive1564 - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* p_w1524newpge1_onprep; 		p_w1524newpge1_onprep = s_onprep_w1524_newpge1_ / s_w1524_newp_ge1;*Apr2023;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_prep_any_sw, 0) / (s_sw_1564 - s_hiv_sw) ;
* n_onprep_sw;					n_onprep_sw = s_onprep_sw * sf;
* n_onprep_w;					n_onprep_w = s_onprep_w * sf;
* n_onprep_m;					n_onprep_m = s_onprep_m * sf;

* n_prep;						n_prep = s_prep_any * sf;
* n_prep_1524w;					n_prep_1524w = s_onprep_1524w * sf;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * sf;
* p_hiv1_prep;					if s_prep_any gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep_any ;

* n_start_rest_prep_oral;		n_start_rest_prep_oral = s_start_restart_prep_oral * sf;*Mar2023;

* n_prep_ever;					n_prep_ever = s_prep_any_ever * sf;
* p_prep_ever;					p_prep_ever = s_prep_any_ever / (s_alive1564_w + s_alive1564_m) ;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * sf;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * sf;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * sf;

* n_elig_prep;					n_elig_prep = (s_elig_prep_any_m_1564 + s_elig_prep_any_w_1564) * sf;

*Currently on PrEP: Number of clients actively taking PrEP during the last month of the date range displayed;
*Note we can't do the last month so we will do the last 3 months;
* n_prep_w_1524  ;				n_prep_w_1524   = s_prep_w_1524 * sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * sf;

*Number initiated for the first time on PrEP;
* n_init_prep_oral_1524w;  		n_init_prep_oral_1524w = s_init_prep_oral_1524w * 4 * sf; 
* n_init_prep_oral_sw; 			n_init_prep_oral_sw    = s_init_prep_oral_sw * 4 * sf; 
* n_init_prep_oral_sdc; 		n_init_prep_oral_sdc   = s_init_prep_oral_sdc * 4 * sf; 
* n_init_prep_oral_plw; 		n_init_prep_oral_plw   = s_init_prep_oral_plw * 4 * sf; *Feb2024;
* n_init_prep_inj_1524w; 		n_init_prep_inj_1524w  = s_init_prep_inj_1524w * 4 * sf;  
* n_init_prep_inj_sw; 			n_init_prep_inj_sw     = s_init_prep_inj_sw * 4 * sf; 
* n_init_prep_inj_sdc; 			n_init_prep_inj_sdc    = s_init_prep_inj_sdc * 4 * sf; 
* n_init_prep_inj_plw; 			n_init_prep_inj_plw     = s_init_prep_inj_plw * 4 * sf; *Feb2024;
* n_init_prep_vr_1524w;    		n_init_prep_vr_1524w   = s_init_prep_vr_1524w * 4 * sf;    
* n_init_prep_vr_sw;   			n_init_prep_vr_sw      = s_init_prep_vr_sw * 4 * sf;   
* n_init_prep_vr_sdc; 			n_init_prep_vr_sdc     = s_init_prep_vr_sdc * 4 * sf; 
* n_init_prep_vr_plw;   		n_init_prep_vr_plw      = s_init_prep_vr_plw * 4 * sf;   *Feb2024;

* n_prep_oral_ly_1524w;			n_prep_oral_ly_1524w   = s_prep_oral_ly_1524w * sf;     
* n_prep_oral_ly_sw; 			n_prep_oral_ly_sw 	   = s_prep_oral_ly_sw * sf;     
* n_prep_oral_ly_sdc; 			n_prep_oral_ly_sdc 	   = s_prep_oral_ly_sdc * sf;   
* n_prep_oral_ly_plw; 			n_prep_oral_ly_plw 	   = s_prep_oral_ly_plw * sf;   *Feb2024;     
* n_prep_inj_ly_1524w; 			n_prep_inj_ly_1524w    = s_prep_inj_ly_1524w * sf;      
* n_prep_inj_ly_sw;  			n_prep_inj_ly_sw  	   = s_prep_inj_ly_sw * sf;      
* n_prep_inj_ly_sdc;  			n_prep_inj_ly_sdc      = s_prep_inj_ly_sdc * sf;    
* n_prep_inj_ly_plw; 			n_prep_inj_ly_plw 	   = s_prep_inj_ly_plw * sf;   *Feb2024;     
* n_prep_vr_ly_1524w;  			n_prep_vr_ly_1524w     = s_prep_vr_ly_1524w * sf;       
* n_prep_vr_ly_sw;    			n_prep_vr_ly_sw        = s_prep_vr_ly_sw * sf;     
* n_prep_vr_ly_sdc;   			n_prep_vr_ly_sdc       = s_prep_vr_ly_sdc * sf;   
* n_prep_vr_ly_plw; 			n_prep_vr_ly_plw 	   = s_prep_vr_ly_plw * sf;   *Feb2024;     

* n_prep_oral_1524w; 		n_prep_oral_1524w = s_prep_oral_w_1524 * sf;
* n_prep_oral_sw; 			n_prep_oral_sw    = s_prep_oral_sw * sf; 
* n_prep_oral_sdc; 			n_prep_oral_sdc   = s_prep_oral_sdc * sf; 
* n_prep_oral_plw; 			n_prep_oral_plw    = s_prep_oral_plw * sf; *Feb2024;
* n_prep_inj_1524w; 		n_prep_inj_1524w  = s_prep_inj_w_1524 * sf; 
* n_prep_inj_sw; 			n_prep_inj_sw     = s_prep_inj_sw * sf; 
* n_prep_inj_sdc; 			n_prep_inj_sdc    = s_prep_inj_sdc * sf; 
* n_prep_inj_plw; 			n_prep_inj_plw    = s_prep_inj_plw * sf; *Feb2024;
* n_prep_vr_1524w;    		n_prep_vr_1524w   = s_prep_vr_w_1524 * sf;    
* n_prep_vr_sw;   			n_prep_vr_sw      = s_prep_vr_sw * sf;   
* n_prep_vr_sdc; 			n_prep_vr_sdc     = s_prep_vr_sdc * sf;
* n_prep_vr_plw; 			n_prep_vr_plw    = s_prep_vr_plw * sf; *Feb2024;

*PrEP_CT: Number of clients actively taking the indicated PrEP method(s) 
         (excluding newly enrolled) during the last quarter of the date range displayed.
			We are using the average across quarters;
* n_contprep_oral_1524w; 		n_contprep_oral_1524w = (s_prep_oral_w_1524 - s_init_prep_oral_1524w) * sf;
* n_contprep_oral_sw; 			n_contprep_oral_sw    = (s_prep_oral_sw - s_init_prep_oral_sw) * sf; 
* n_contprep_oral_sdc; 			n_contprep_oral_sdc   = (s_prep_oral_sdc - s_init_prep_oral_sdc) * sf; 
* n_contprep_oral_plw; 			n_contprep_oral_plw    = (s_prep_oral_plw - s_init_prep_oral_plw) * sf; *Feb2024;
* n_contprep_inj_1524w; 		n_contprep_inj_1524w  = (s_prep_inj_w_1524 - s_init_prep_inj_1524w) * sf;   
* n_contprep_inj_sw; 			n_contprep_inj_sw     = (s_prep_inj_sw - s_init_prep_inj_sw) * sf; 
* n_contprep_inj_sdc; 			n_contprep_inj_sdc    = (s_prep_inj_sdc - s_init_prep_inj_sdc) * sf; 
* n_contprep_inj_plw; 			n_contprep_inj_plw    = (s_prep_inj_plw - s_init_prep_inj_plw) * sf; *Feb2024;
* n_contprep_vr_1524w;    		n_contprep_vr_1524w   = (s_prep_vr_w_1524 - s_init_prep_vr_1524w) * sf;    
* n_contprep_vr_sw;   			n_contprep_vr_sw      = (s_prep_vr_sw - s_init_prep_vr_sw) * sf;   
* n_contprep_vr_sdc; 			n_contprep_vr_sdc     = (s_prep_vr_sdc - s_init_prep_vr_sdc) * sf;
* n_contprep_vr_plw; 			n_contprep_vr_plw    = (s_prep_vr_plw - s_init_prep_vr_plw) * sf; *Feb2024;

* n_prep_oral_ever_1524w;		n_prep_oral_ever_1524w = s_prep_oral_ever_1524w * sf;   
* n_prep_oral_ever_sw;  		n_prep_oral_ever_sw    = s_prep_oral_ever_sw * sf;   
* n_prep_oral_ever_sdc; 		n_prep_oral_ever_sdc   = s_prep_oral_ever_sdc * sf; 
* n_prep_oral_ever_plw;  		n_prep_oral_ever_plw   = s_prep_oral_ever_plw * sf;    *Feb2024;
* n_prep_inj_ever_1524w; 		n_prep_inj_ever_1524w  = s_prep_inj_ever_1524w * sf;    
* n_prep_inj_ever_sw;  			n_prep_inj_ever_sw     = s_prep_inj_ever_sw * sf;  
* n_prep_inj_ever_sdc;  		n_prep_inj_ever_sdc    = s_prep_inj_ever_sdc * sf;  
* n_prep_inj_ever_plw;  		n_prep_inj_ever_plw    = s_prep_inj_ever_plw * sf;    *Feb2024;
* n_prep_vr_ever_1524w;  		n_prep_vr_ever_1524w   = s_prep_vr_ever_1524w * sf;     
* n_prep_vr_ever_sw;  			n_prep_vr_ever_sw      = s_prep_vr_ever_sw * sf; 
* n_prep_vr_ever_sdc; 			n_prep_vr_ever_sdc     = s_prep_vr_ever_sdc * sf; 
* n_prep_vr_ever_plw;  			n_prep_vr_ever_plw     = s_prep_vr_ever_plw * sf;    *Feb2024;

* n_prep_oral_w;				n_prep_oral_w = s_prep_oral_w * sf;
* n_prep_oral_m;				n_prep_oral_m = s_prep_oral_m * sf;
* py_prep_oral_1524w;			py_prep_oral_1524w =	0.25 * n_prep_oral_1524w;
* py_prep_oral_sw;				py_prep_oral_sw = 		0.25 * n_prep_oral_sw;
* py_prep_inj_1524w;			py_prep_inj_1524w =		0.25 * n_prep_inj_1524w;
* py_prep_inj_sw;				py_prep_inj_sw = 		0.25 * n_prep_inj_sw;

* av_prep_eff_non_res_v;  		if s_prep_any > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep_any;								  
																			 
* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep_any,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				if s_prep_any gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep_any ;


* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;
* prevalence1549_hiv_preg;		prevalence1549preg  = s_hiv_pregn_w1549_ / s_pregnant_w1549; *VCFeb2023;
* prevalence1524_hiv_preg;		prevalence1524preg  = s_hiv_pregn_w1524_ / s_pregnant_w1524; *VCFeb2023;
* prevalence_ge15m;				prevalence_ge15m = s_hivge15m / s_alive_m ;	*JASApr24;
* prevalence_ge15w;				prevalence_ge15w = s_hivge15w / s_alive_w ;	*JASApr24;

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
* incidence_sd1564_;			incidence_sd1564_ = ((s_primaryepi1_w + s_primaryepi1_m) * 4 * 100) / (s_primaryepi1_w + s_primaryepi1_m + s_hiv0epi1_w + s_hiv0epi1_m);
* incidence_sd1564w;			incidence_sd1564w = (s_primaryepi1_w * 4 * 100) / (s_primaryepi1_w + s_hiv0epi1_w);

* incidence_onprep ; 			if s_prep_any > 0 then incidence_onprep  = (s_primary_prep * 4 * 100) / s_prep_any ;


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

* prevalence_sw;				prevalence_sw     = s_hiv_sw / s_sw_1564; *VCFeb2023;

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
* p_inf_msm;					p_inf_msm = s_inf_msm / s_primary;
* p_inf_pwid;					p_inf_pwid = s_inf_pwid / s_primary;

*The meaning of the following is: among newly infected people, which proportion are SW, etc..;
* p_sw_newinf;				    p_sw_newinf = s_primary_sw / s_primary;		
* p_w1524_newinf;				p_w1524_newinf = sum(s_primary1519w,s_primary2024w) / s_primary;
* p_w25ov_newinf;				p_w25ov_newinf = sum(s_primary2529w,s_primary3034w,s_primary3539w,s_primary4044w,s_primary4549w,s_primary5054w,s_primary5559w,s_primary6064w) / s_primary;		
* p_m1524_newinf;				p_m1524_newinf = sum(s_primary1519m,s_primary2024m) / s_primary;
* p_m25ov_newinf;				p_m25ov_newinf = sum(s_primary2529m,s_primary3034m,s_primary3539m,s_primary4044m,s_primary4549m,s_primary5054m,s_primary5559m,s_primary6064m) / s_primary;		
end;

* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;

* n_hiv_child;					n_hiv_child = (s_birth_with_inf_child + s_child_infected_breastfeeding) * 4 * sf; 

* p_births_hiv_vlg1000;			p_births_hiv_vlg1000 = s_vl_when_giving_birth_g1000 / s_give_birth_with_hiv ; 

* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / (s_hivge15m+s_hivge15w) ;  p_diag = p_diag;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w;


* p_diag_m1524;					if s_hiv1524m > 0 then p_diag_m1524 = (s_diag_m1519_+s_diag_m2024_)/(s_hiv1524m);
* p_diag_w1524;					if s_hiv1524w > 0 then p_diag_w1524 = (s_diag_w1519_+s_diag_w2024_)/(s_hiv1524w);

* p_diag_sw;					if s_sw_1564 > 0 then p_diag_sw = s_diag_sw / s_sw_1564; *VCFeb2023;

* n_cm;							n_cm = s_cm_this_per * sf;  * made these number per 3 months rather than per year as can have more than one in a year;
* n_vm;							n_vm = s_vm_this_per  * sf; 
* p_vm_ly_onart;				p_vm_ly_onart = s_vm_ly /s_onart;*VCMar2023;
* n_pcp_p_80;					n_pcp_p = s_pcp_p *sf;

* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_pim;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_pim = s_ai_naive_no_pmtct_c_pim_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt184m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt184m = s_ai_naive_no_pmtct_c_rt184m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt65m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt65m = s_ai_naive_no_pmtct_c_rt65m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rttams;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rttams = s_ai_naive_no_pmtct_c_rttams_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_inm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_inm = s_ai_naive_no_pmtct_c_inm_ / s_ai_naive_no_pmtct_;

* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag; *VCFeb2023: why the numerator here is different?;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_diag_w1524_;			if (s_diag_w1519_+s_diag_w2024_) > 0 then p_onart_diag_w1524_ = (s_onart_w1519_ + s_onart_w2024_) / (s_diag_w1519_+s_diag_w2024_); *VCFeb2023;
* p_onart_diag_1524_;			if (s_diag_w1519_+s_diag_w2024_+s_diag_m1519_+s_diag_m2024_) > 0 then 
								p_onart_diag_1524_ = (s_onart_w1519_+s_onart_w2024_+s_onart_m1519_+s_onart_m2024_) / (s_diag_w1519_+s_diag_w2024_+s_diag_m1519_+s_diag_m2024_); *VCFeb2023;

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if s_hivge15 gt 0 then p_onart = s_onart / s_hivge15; 
* p_onart_w1524_;				if s_hiv1524w gt 0 then p_onart_w1524_ = (s_onart_w1519_ + s_onart_w2024_) / s_hiv1524w; *VCFeb2023;
* p_onart_1524_;				if (s_hiv1524w+s_hiv1524m) gt 0 then 
								p_onart_1524_ = (s_onart_w1519_+s_onart_w2024_+s_onart_m1519_+s_onart_m2024_) / (s_hiv1524w+s_hiv1524m); *VCFeb2023;
* p_onart_sw;					if s_hiv_sw gt 0 then p_onart_sw = s_onart_sw / s_hiv_sw; *VCFeb2023;

* p_onart_artexp; 				if s_artexp 	  gt 0 then p_onart_artexp   = s_onart / s_artexp; *VCFeb2023;
* p_onart_artexp_m; 			if s_artexp_m 	  gt 0 then p_onart_artexp_m = s_onart_m / s_artexp_m; *VCFeb2023;
* p_onart_artexp_w;				if s_artexp_w 	  gt 0 then p_onart_artexp_w = s_onart_w / s_artexp_w; *VCFeb2023;
* p_onart_artexp_1524_;			if s_artexp_1524_ gt 0 then 
								p_onart_artexp_1524_ = (s_onart_w1519_+s_onart_w2024_+s_onart_m1519_+s_onart_m2024_) / s_artexp_1524_; *VCFeb2023;
* p_onart_artexp_sw;			if s_artexp_sw 	  gt 0 then p_onart_artexp_sw =	s_onart_sw / s_artexp_sw; *VCFeb2023;
* p_onart_artexp_w1524evpreg;   if s_artexp_w1524evpreg gt 0 then p_onart_artexp_w1524evpreg = s_onart_w1524evpreg / s_artexp_w1524evpreg; *VCFeb2023;


* n_onart_w;					n_onart_w = s_onart_w * sf;
* n_onart_m;					n_onart_m = s_onart_m * sf;
* n_onart  ;					n_onart   = s_onart   * sf;
* n_onart_1524_;				n_onart_1524_ = (s_onart_m1519_ + s_onart_m2024_ + s_onart_w1519_ + s_onart_w2024_) * sf; *VCFeb2023;
* n_art_start_y;				n_art_start_y = s_art_start * 4 * sf;

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

* incidence_msm;				if (s_msm  - s_hiv_msm  + s_primary_msm) gt 0 then incidence_msm=(s_primary_msm * 4 * 100) 
									/ (s_msm  - s_hiv_msm  + s_primary_msm);

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

* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* n_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then n_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m * sf;	*JASJun2024;
* n_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then n_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w * sf;	*JASJun2024;
* p_onart_vl1000_1524;			if s_onart_gt6m_iicu_1524_ > 0 then p_onart_vl1000_1524 = s_vl1000_art_gt6m_iicu_1524_ / s_onart_gt6m_iicu_1524_ ;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;
* p_onart_vl1000_w1524evpr;   if s_onartgt6miicu_w1524evpr gt 0 then p_onart_vl1000_w1524evpr = s_vl1000_artgt6miicu_w1524evpr / s_onartgt6miicu_w1524evpr; *VCFeb2023;

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


* MSM;

* n_alive_msm;					n_alive_msm = s_alive_msm * sf ;
* n_alive1564_msm;				n_alive1564_msm = s_alive1564_msm * sf ;
* incidence1549msm;             incidence1549msm = (s_primary1549msm * 4 * 100) / (s_alive1549_msm  - s_hiv1549msm  + s_primary1549msm);
* incidence1564msm;             incidence1564msm = (s_primary1564msm * 4 * 100) / (s_alive1564_msm  - s_hiv1564msm  + s_primary1564msm);
* prevalence1549_msm;			prevalence1549_msm = s_hiv1549msm / s_alive1549_msm; 
* prevalence1564_msm;			prevalence1564_msm = s_hiv1564msm / s_alive1564_msm; 
* prevalence_msm;				prevalence_msm = prevalence1549_msm;
* p_elig_prep_any_msm_1564;		p_elig_prep_any_msm_1564 = s_elig_prep_any_msm_1564 / (s_alive1564_msm - s_hiv1564msm);
* p_onprep_msm;					p_onprep_msm = s_onprep_msm / (s_alive1564_msm - s_hiv1564msm);
* p_onart_msm;					if s_hiv_msm  > 0 then p_onart_msm = s_onart_msm / s_hiv_msm  ;
* prevalence_vg1000_msm;		prevalence_vg1000_msm = s_vg1000_msm / s_alive_msm;
* p_diag_msm;					p_diag_msm = s_diag_msm / s_hiv_msm  ;
* p_onart_diag_msm;				p_onart_diag_msm = s_onart_msm / s_diag_msm ;
* p_vl1000_art_gt6m_msm;		p_vl1000_art_gt6m_msm = s_vl1000_art_gt6m_msm / s_onart_gt6m_msm ;
* p_vl1000_msm;					p_vl1000_msm = s_vl1000_msm / s_hiv_msm;
* p_ever_tested_msm; 			p_ever_tested_msm = s_ever_tested_msm / s_msm;
* p_tested_this_period_msm;		p_tested_this_period_msm = s_tested_msm / (s_msm - s_diag_msm) ;
* p_msm_infected_from_msm;		p_msm_infected_from_msm = s_infected_from_msm / s_hiv_msm ;
* prop_m_msm;					prop_m_msm = s_alive1564_msm / s_alive1564_m;
* n_hiv_msm;					n_hiv_msm = s_hiv_msm * sf;
* p_ep;							p_ep = s_ep / s_alive1564;				
* p_ep_msm;						p_msm_ep = s_msm_ep / s_alive1564_msm;
* p_msm_ge1newp;				p_msm_ge1newp = s_msm_ge1newp / s_alive1564_msm;
* p_m_ge1newp;					p_m_ge1newp = s_m_ge1newp / s_alive1564_m;
* n_diag_msm;					n_diag_msm = s_diag_msm * sf;
* n_onprep_msm;					n_onprep_msm = s_onprep_msm * sf;

* PWID;

* n_pwid;						n_pwid = s_pwid * sf ;
* p_onprep_pwid;				p_onprep_pwid = s_onprep_pwid / (s_alive1564_pwid - s_hiv1564pwid);
* p_onart_pwid;					if s_hiv_pwid  > 0 then p_onart_pwid = s_onart_pwid / s_pwid  ;




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
* n_death_hiv;					n_death_hiv = s_death_hiv  * 4* sf;

* n deaths and death rate by cause and hiv status - age 15+ ;

			n_dead_hivpos_cause1 = s_dead_hivpos_cause1 * 4 * sf; 
			rate_dead_hivpos_cause1 = (s_dead_hivpos_cause1 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_tb = s_dead_hivpos_tb  * 4* sf; 
			rate_dead_hivpos_tb = (s_dead_hivpos_tb * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause4 = s_dead_hivpos_cause4  * 4* sf; 
			rate_dead_hivpos_cause4 = (s_dead_hivpos_cause4 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_crypm = s_dead_hivpos_crypm  * 4* sf; 
			rate_dead_hivpos_crypm = (s_dead_hivpos_crypm * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_sbi = s_dead_hivpos_sbi  * 4* sf; 
			rate_dead_hivpos_sbi = (s_dead_hivpos_sbi * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_oth_adc = s_dead_hivpos_oth_adc  * 4* sf; 
			rate_dead_hivpos_oth_adc = (s_dead_hivpos_oth_adc * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause2 = s_dead_hivpos_cause2  * 4* sf; 
			rate_dead_hivpos_cause2 = (s_dead_hivpos_cause2 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause3 = s_dead_hivpos_cause3  * 4* sf; 
			rate_dead_hivpos_cause3 = (s_dead_hivpos_cause3 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cvd = s_dead_hivpos_cvd  * 4* sf; 
			rate_dead_hivpos_cvd = (s_dead_hivpos_cvd * 4 * 100) / s_hivge15 ;
			n_dead_cvd = s_dead_cvd  * 4* sf; 
			rate_dead_cvd = (s_dead_cvd * 4 * 100) / s_alive ;
			n_dead_tb = s_dead_tb  * 4* sf; 
			rate_dead_tb = (s_dead_tb * 4 * 100) / s_alive ;
			n_dead_hivneg_cvd = s_dead_hivneg_cvd  * 4* sf; 
			rate_dead_hivneg_cvd = (s_dead_hivneg_cvd * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_tb = s_dead_hivneg_tb  * 4* sf; 
			rate_dead_hivneg_tb = (s_dead_hivneg_tb * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause2 = s_dead_hivneg_cause2  * 4* sf; 
			rate_dead_hivneg_cause2 = (s_dead_hivneg_cause2 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause3 = s_dead_hivneg_cause3  * 4* sf; 
			rate_dead_hivneg_cause3 = (s_dead_hivneg_cause3 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause4 = s_dead_hivneg_cause4  * 4* sf; 
			rate_dead_hivneg_cause4 = (s_dead_hivneg_cause4 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause5 = s_dead_hivneg_cause5  * 4* sf; 
			rate_dead_hivneg_cause5 = (s_dead_hivneg_cause5 * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead = (s_dead * 4 * 100) / s_alive ;
			rate_dead_hivneg = (s_dead_hivneg_anycause * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_hivpos = (s_dead_hivpos_anycause * 4 * 100) / s_hivge15 ;

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


* n_death_hivrel;				n_death_hivrel = s_death_hivrel  * 4* sf;
* n_death_hivrel_m;				n_death_hivrel_m = s_death_hivrel_m  * 4* sf;
* n_death_hivrel_w;				n_death_hivrel_w = s_death_hivrel_w * 4* sf;

* n_death_hiv_age_1524_m;		n_death_hiv_age_1524_m = s_death_hiv_age_1524_m * 4 * sf; 
* n_death_hiv_age_2549_m;		n_death_hiv_age_2549_m = s_death_hiv_age_2549_m * 4 * sf; 
* n_death_hiv_age_50pl_m;		n_death_hiv_age_50pl_m = s_death_hiv_age_50pl_m * 4 * sf; 
* n_death_hiv_age_1524_w;		n_death_hiv_age_1524_w = s_death_hiv_age_1524_w * 4 * sf; 
* n_death_hiv_age_2549_w;		n_death_hiv_age_2549_w = s_death_hiv_age_2549_w * 4 * sf; 
* n_death_hiv_age_50pl_w;		n_death_hiv_age_50pl_w = s_death_hiv_age_50pl_w * 4 * sf; 

* n_death_covid;				n_death_covid = s_death_dcause3_allage  * 4* sf;
* n_death;						n_death = s_dead_allage  * 4 * sf;
* n_death_m;					n_death_m = s_deadm_all  * 4 * sf;
* n_death_w;					n_death_w = s_deadw_all  * 4 * sf;
* n_covid;						n_covid = s_covid  * 4 * sf;
* n_death_hivneg_anycause;		n_death_hivneg_anycause = s_dead_hivneg_anycause  * 4 * sf;
* n_death_hivpos_anycause;		n_death_hivpos_anycause = s_dead_hivpos_anycause  * 4 * sf;

* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * sf ;
					

* n_dead1524w_all;				n_dead1524w_all = (s_dead1519w_all + s_dead2024w_all) * 4 * sf;
* n_dead2549w_all;				n_dead2549w_all = (s_dead2529w_all + s_dead3034w_all + s_dead3539w_all + s_dead4044w_all + s_dead4549w_all) * 4 * sf;
* n_dead50plm_all;				n_dead50plw_all = (s_dead5054w_all + s_dead5559w_all + s_dead6064w_all + s_dead6569w_all + s_dead7074w_all + s_dead7579w_all +
								s_dead8084w_all	+ s_dead85plw_all ) * 4 * sf;

* n_dead1524m_all;				n_dead1524m_all = (s_dead1519m_all + s_dead2024m_all) * 4 * sf;
* n_dead2549m_all;				n_dead2549m_all = (s_dead2529m_all + s_dead3034m_all + s_dead3539m_all + s_dead4044m_all + s_dead4549m_all) * 4 * sf;
* n_dead50plm_all;				n_dead50plm_all = (s_dead5054m_all + s_dead5559m_all + s_dead6064m_all + s_dead6569m_all + s_dead7074m_all + s_dead7579m_all +
								s_dead8084m_all	+ s_dead85plm_all ) * 4 * sf;


	
*future YLL (assuming age and gender specific life expectancy), all incurred at the calendar year of death (for adults aged 15+ years old); 
* n_total_yllag;				n_total_yllag = s_total_yllag  * 4 * sf;
* n_dyll_GBD;					n_dyll_GBD = s_dyll_GBD  * 4 * sf;
* n_dyllag_hiv_w;				n_dyllag_hiv_w = s_dyllag_hiv_w  * 4 * sf;	*JASJul2024;
* n_dyllag_hiv_m;				n_dyllag_hiv_m = s_dyllag_hiv_m  * 4 * sf;	*JASJul2024;
* n_yllag_hiv_w;				n_yllag_hiv_w = s_yllag_hiv_w  * 4 * sf;	*JASJul2024;
* n_yllag_hiv_m;				n_yllag_hiv_m = s_yllag_hiv_m  * 4 * sf;	*JASJul2024;
* malawi miphsa;
* n_daly;						n_daly = (s_yllag_hiv_m + s_yllag_hiv_w + s_live_daly ) * 4 * sf;

* n_cd4_lt200;					n_cd4_lt200 = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * sf; 
* n_cd4_lt50;					n_cd4_lt50 = s_cd4_g1 * sf; 
* n_hiv;						n_hiv = s_hivge15 * sf;
* n_hivge15m;					n_hivge15m = s_hivge15m * sf; *VCFeb2023;
* n_hivge15w;					n_hivge15w = s_hivge15w * sf; *VCFeb2023;
* n_hiv1524m;					n_hiv1524m = s_hiv1524m * sf; *VCFeb2023;
* n_hiv1524w;					n_hiv1524w = s_hiv1524w * sf; *VCFeb2023;
* n_hiv2549m;					n_hiv2549m = (s_hiv1549m - s_hiv1524m) * sf; *VCFeb2023;
* n_hiv2549w;					n_hiv2549w = (s_hiv1549w - s_hiv1524w) * sf; *VCFeb2023;
* n_hiv50plm;					n_hiv50plm = (s_hivge15m - s_hiv1549m) * sf; *JASJun2024;
* n_hiv50plw;					n_hiv50plw = (s_hivge15w - s_hiv1549w) * sf; *JASJun2024;
* n_hiv_sw;						n_hiv_sw = s_hiv_sw * sf;*VCFeb2023;

* n_alive;						n_alive = s_alive * sf;
* n_alive_m;					n_alive_m = s_alive_m * sf; *VCFeb2023;
* n_alive_w;					n_alive_w = s_alive_w * sf; *VCFeb2023;
* n_alive_1524m;				n_alive_1524m = s_ageg1m * sf; *VCFeb2023;
* n_alive_1524w;				n_alive_1524w = s_ageg1w * sf; *VCFeb2023;
* n_alive_2549m;				n_alive_2549m = (s_alive1549_m - s_ageg1m) * sf; *VCFeb2023; 
* n_alive_2549w;				n_alive_2549w = (s_alive1549_w - s_ageg1w) * sf; *VCFeb2023; 
* n_alive_50plm;				n_alive_50plm = (s_ageg5054m + s_ageg5559m + s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg8084m + s_ageg85plm) * sf; *JASJun2024;
* n_alive_50plw;				n_alive_50plw = (s_ageg5054w + s_ageg5559w + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w + s_ageg8084w + s_ageg85plw) * sf; *JASJun2024;
* n_alive0_;					n_alive0_ = s_alive0_ * sf *4;*otherwise it is only the births in a 3 month periodl;
* n_alive_014_;					n_alive_014_ = (s_ageg014_) * sf; 
* n_alive_1014m;				n_alive_1014m = s_ageg1014m * sf; 
* n_alive_1524_;				n_alive_1524_ = (s_ageg1m+s_ageg1w) * sf; 
* n_alive_2564_;				n_alive_2564_ = (s_alive1564-s_ageg1m-s_ageg1w) * sf;
* n_alive_65pl;					n_alive_65pl = (s_ageg65plm + s_ageg65plw) * sf;
*Number of HIV-negative  adults 15+ years old in a sero-discordant relationship;
* n_hivneg_sdpartner;			n_hivneg_sdpartner = (s_hiv0epi1_w + s_hiv0epi1_m) * sf; *VCFeb2023; 
*Number of HIV-negative  adults 15+ years old in a sero-discordant relationship, whom partner is not on ART; 
* n_hivneg_sdpartneroffart;		n_hivneg_sdpartneroffart = (s_hiv0epi1_w - s_hiv0epart1_w + s_hiv0epi1_m - s_hiv0epart1_m) * sf; *VCFeb2023; 
*Number of HIV-negative  females 15+ years old in a sero-discordant relationship;
* n_hivnegw_sdpartner;			n_hivnegw_sdpartner = s_hiv0epi1_w * sf; *VCFeb2023; 
*Number of HIV-negative  females 15+ years old in a sero-discordant relationship, whom partner is not on ART; 
* n_hivnegw_sdpartneroffart;	n_hivnegw_sdpartneroffart = (s_hiv0epi1_w - s_hiv0epart1_w) * sf; *VCFeb2023; 

*n_not_on_art_cd4ge500;			n_not_on_art_cd4ge500  = s_not_on_art_cd4ge500 * sf; *VCFeb2023; 
*n_not_on_art_cd4350500;		n_not_on_art_cd4350500 = s_not_on_art_cd4350500 * sf; *VCFeb2023; 
*n_not_on_art_cd4200350;		n_not_on_art_cd4200350 = s_not_on_art_cd4200350 * sf; *VCFeb2023; 
*n_not_on_art_cd450200;			n_not_on_art_cd450200  = (s_not_on_art_cd4l200 - s_not_on_art_cd4l50) * sf; *VCFeb2023; 
*n_not_on_art_cd4050;		    n_not_on_art_cd4050    = s_not_on_art_cd4l50 * sf; *VCFeb2023; 
*n_not_on_art_cd40200;			n_not_on_art_cd40200  = s_not_on_art_cd4l200 * sf; *VCFeb2023; 

*n_asympt_Undiag;				n_asympt_Undiag     = s_asympt_Undiag * sf; *VCFeb2023;  
*n_asympt_diagoffart;			n_asympt_diagoffart = s_asympt_diagoffart * sf; *VCFeb2023; 
*n_asympt_diagonart;			n_asympt_diagonart  = s_asympt_diagonart * sf; *VCFeb2023; 
*n_sympt_notaids;				n_sympt_notaids 	= s_sympt_notaids * sf; *VCFeb2023; 
*n_sympt_aids;					n_sympt_aids 		= s_sympt_aids * sf; *VCFeb2023; 

* n_vm_this_per;				n_vm_this_per = s_vm_this_per * sf;


inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* number of women with hiv giving birth per year;

* n_give_birth_w_hiv; 			n_give_birth_w_hiv = s_give_birth_with_hiv * sf * 4;
* n_give_birth_on_art;			n_give_birth_on_art = s_give_birth_on_art * sf * 4;
* n_birth_with_inf_child;		n_birth_with_inf_child = s_birth_with_inf_child * sf * 4;
* n_onart_birth_with_inf_child;	n_onart_birth_with_inf_child = s_onart_birth_with_inf_child * sf * 4;
* n_pregnant_ntd;				s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
								n_pregnant_ntd = s_pregnant_ntd    * sf * 4 ; 
* n_preg_odabe;					n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * sf * 4;  * annual number;
* n_mcirc1549_;					n_mcirc1549_ = s_mcirc_1549m * sf * 4;
* n_mcirc1549_3m;				n_mcirc1549_3m = s_mcirc_1549m * sf;
* n_vmmc1549_;					n_vmmc1549_ = s_vmmc1549m * sf * 4;
* n_vmmc1549_3m;				n_vmmc1549_3m = s_vmmc1549m * sf;

* n_new_inf1549m;				n_new_inf1549m = s_primary1549m * sf * 4;
* n_new_inf1549w;				n_new_inf1549w = s_primary1549w * sf * 4;
* n_new_inf1549;				n_new_inf1549 = s_primary1549 * sf * 4;
* n_infection;					n_infection  = s_primary     * sf * 4;
* n_new_inf1564m;				n_new_inf1564m = (s_primary1549m + s_primary5054m + s_primary5559m + s_primary6064m)* sf * 4;	*Corrected equation JASApr2024;
* n_new_inf1564w;				n_new_inf1564w = (s_primary1549w + s_primary5054w + s_primary5559w + s_primary6064w)* sf * 4;	*Corrected equation JASApr2024;
* n_new_inf1524m;				n_new_inf1524m = (s_primary1519m + s_primary2024m) * sf * 4;
* n_new_inf1524w;				n_new_inf1524w = (s_primary1519w + s_primary2024w) * sf * 4;
* n_new_inf2549m;				n_new_inf2549m = (s_primary1549m - s_primary1519m - s_primary2024m) * sf * 4;
* n_new_inf2549w;				n_new_inf2549w = (s_primary1549w - s_primary1519w - s_primary2024w) * sf * 4;
* n_new_inf50plm;				n_new_inf50plm = (s_primary5054m + s_primary5559m + s_primary6064m) * sf * 4;	*JASJUN2024;
* n_new_inf50plw;				n_new_inf50plw = (s_primary5054w + s_primary5559w + s_primary6064w) * sf * 4;	*JASJUN2024;
* n_new_inf_sw;					n_new_inf_sw = s_primary_sw * 4 * sf;
* n_new_inf_msm;				n_new_inf_msm = s_primary_msm * 4 * sf;

* n_new_inf_prep_elig;			n_new_inf_prep_elig = s_primary_prep_elig * 4 * sf; 
* n_new_inf_onprep;				n_new_inf_onprep = s_primary_onprep * 4 * sf;









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
n_daly			cost			p_mcirc			n_sw_program_visit




/*Extra outputs for calibration*/
/* Add truncated list here? */

/* Original long list */

cost dataset  p_m_newp_ge1_age1549 p_w_newp_ge1_age1549 
n_hiv n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w n_hiv50plm n_hiv50plw n_hiv_sw
n_alive n_alive_m n_alive_w n_alive_1014m n_alive_1524m n_alive_1524w n_alive_2549m n_alive_2549w n_alive_50plm n_alive_50plw n_alive0_ 
n_alive_014_ 	n_alive_1524_	 n_alive_2564_		n_alive_65pl
n_hivneg_sdpartner n_hivneg_sdpartneroffart n_hivnegw_sdpartner n_hivnegw_sdpartneroffart
n_not_on_art_cd40200 n_not_on_art_cd4050 n_not_on_art_cd450200 n_not_on_art_cd4200350 n_not_on_art_cd4350500 n_not_on_art_cd4ge500 
n_asympt_Undiag n_asympt_diagoffart n_asympt_diagonart n_sympt_notaids n_sympt_aids
s_alive n_birth n_give_birth_w_hiv n_give_birth_on_art p_w_giv_birth_this_per n_everpregn_w1524 n_everpregn_hiv_w1524 
p_newp_ge1 p_1524_newp_ge1 n_w1524_newp_ge1 p_newp_ge5 p_newp_ge1_age1549 gender_r_newp  av_newp_ge1  av_newp_ge1_non_sw
p_newp_sw  n_tested_m  n_tested_w p_tested_past_year_1549m  p_tested_past_year_1549w n_pmtct
p_diag_m1524 p_diag_w1524 p_diag_sw n_cm n_vm p_vm_ly_onart n_pcp_p p_onart_cd4_l200
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3034m p_mcirc_3539m p_mcirc_4044m p_mcirc_4549m p_mcirc_5064m p_mcirc_1549m  p_mcirc_1049m n_mcirc
p_vmmc p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_5064m p_vmmc_1549m p_vmmc_1049m	
n_new_vmmc n_new_vmmc1549m n_new_vmmc1049m n_new_vmmc1014m n_new_birth_circ n_new_mcirc n_new_mcirc_1549m n_new_mcirc_1049m
prop_w_1549_sw  prop_w_1564_sw	prop_w_ever_sw prop_sw_program_visit p_reached_sbcc
prop_sw_hiv prop_w_1524_onprep p_w1524newpge1_onprep prop_1564_hivneg_onprep prop_sw_onprep p_prep_adhg80 n_onprep_sw  n_onprep_msm n_onprep_m n_onprep_w
prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 		
prevalence5054w prevalence5054m prevalence5559w prevalence5559m prevalence6064w prevalence6064m prevalence65plw prevalence65plm
prevalence1524w prevalence1524m  prevalence_sw  r_prev_sex_1549  prevalence_hiv_preg	prevalence1549preg 	prevalence1524preg
prevalence_ge15m prevalence_ge15w
r_prev_1519w_4549w r_prev_2024w_4549w r_prev_2529w_4549w r_prev_3034w_4549w r_prev_3539w_4549w 	
r_prev_4044w_4549w  r_prev_5054w_4549w r_prev_5559w_4549w r_prev_6064w_4549w r_prev_65plw_4549w 
r_prev_1519m_4549w r_prev_2024m_4549w  r_prev_2529m_4549w r_prev_3034m_4549w r_prev_3539m_4549w r_prev_4044m_4549w r_prev_4549m_4549w
r_prev_5054m_4549w r_prev_5559m_4549w r_prev_6064m_4549w r_prev_65plm_4549w
incidence1549 incidence1564 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary 
n_new_inf_prep_elig n_new_inf_onprep
p_sw_newinf p_w1524_newinf p_w25ov_newinf p_m1524_newinf p_m25ov_newinf mtct_prop  incidence_onprep
p_diag p_diag_m p_diag_w prop_diag_infection_1yr p_ai_no_arv_c_nnm prop_sw_newp0  t_sw_newp
n_sbcc_visit_1524m n_sbcc_visit_1524w n_sbcc_visit_1524_ n_sbcc_visit_2564_ n_sbcc_visit_1564_
n_tested_sbcc_1524m n_tested_sbcc_1524w n_tested_sbcc_2564_ n_tested_sbcc
n_self_tests  n_tested_self_test
p_tested_sbcc_1524m p_tested_sbcc_1524w p_tested_sbcc_2564_
p_pos_tested_sbcc
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm
p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw p_onart_diag_w1524_ p_onart_diag_1524_
p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524    
p_onart p_onart_m p_onart_w p_onart_w1524_ p_onart_1524_ p_onart_sw 
p_onart_artexp p_onart_artexp_m p_onart_artexp_w p_onart_artexp_1524_ p_onart_artexp_sw p_onart_artexp_w1524evpreg
p_onart_vl1000_w p_onart_vl1000_m  n_onart_vl1000_m n_onart_vl1000_w p_onart_vl1000_1524	  p_onart_vl1000_sw 	p_onart_vl1000_w1524evpr
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w  p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly  ddaly_all  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dnon_tb_who3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost     dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564 n_sw_1549 prev_sti_sw  n_sw_inprog_ly  n_sw_inprog_ever n_sw_program_visit
prop_sw_onprep  p_vl1000_art_12m  p_vl1000_art_12m_onart
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m  p_artexp_vl1000 p_k65m_all p_m184m_all
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000 p_vlg1000_184m p_vlg1000_65m
death_rate_artexp  death_rate_hiv death_rate_hiv_w death_rate_hiv_m death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w
n_new_inf1549m n_new_inf1549w n_new_inf1549 n_new_inf1564m n_new_inf1564w n_infection  n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w
n_new_inf50plm n_new_inf50plw
p_iime   p_pime   p_nnme  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd ddaly  ddaly_all 
n_birth_with_inf_child  n_onart_birth_with_inf_child
dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe n_tested n_tested_sw n_tested_swprog n_tested_anc n_tested_ancpd n_test_anclabpd
n_tested_anc_prevdiag
n_tested_m_sympt n_tested_w_sympt n_tested_m_circ n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd n_tested1st_anc n_tested1st_labdel n_tested1st_pd 

p_anc n_diagnosed n_diag_m n_diag_w n_diag_anc n_diag_labdel  n_diag_pd  n_diag_anclabpd  n_diag_progsw  n_diag_sw n_diag_sw_this_per  n_diag_self_test
n_hivpos_tests n_hivneg_tests n_hivpos_tests_sympt n_hivneg_tests_sympt
n_diag_ever_m n_diag_ever_w
p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep n_prep_1524w n_start_rest_prep_oral n_start_rest_prep_oral n_prep_ever  n_covid  n_death_covid n_death 
n_death_m n_death_w n_death_hivrel n_death_hivrel_m n_death_hivrel_w
p_prep_ever 
n_init_prep_oral_1524w  n_init_prep_oral_sw  n_init_prep_oral_sdc 	n_init_prep_oral_plw
n_init_prep_inj_1524w   n_init_prep_inj_sw   n_init_prep_inj_sdc  	n_init_prep_inj_plw   
n_init_prep_vr_1524w    n_init_prep_vr_sw    n_init_prep_vr_sdc   	n_init_prep_vr_plw
n_prep_oral_ly_1524w	n_prep_oral_ly_sw	 n_prep_oral_ly_sdc		n_prep_oral_ly_plw
n_prep_inj_ly_1524w		n_prep_inj_ly_sw	 n_prep_inj_ly_sdc		n_prep_inj_ly_plw
n_prep_vr_ly_1524w		n_prep_vr_ly_sw		 n_prep_vr_ly_sdc		n_prep_vr_ly_plw
n_prep_oral_1524w 		n_prep_oral_sw		 n_prep_oral_sdc		n_prep_oral_plw
n_prep_inj_1524w		n_prep_inj_sw		 n_prep_inj_sdc			n_prep_inj_plw
n_prep_vr_1524w			n_prep_vr_sw		 n_prep_vr_sdc			n_prep_vr_plw
n_contprep_oral_1524w	n_contprep_oral_sw	 n_contprep_oral_sdc	n_contprep_oral_plw
n_contprep_inj_1524w	n_contprep_inj_sw	 n_contprep_inj_sdc		n_contprep_inj_plw
n_contprep_vr_1524w 	n_contprep_vr_sw	 n_contprep_vr_sdc		n_contprep_vr_plw
n_prep_oral_ever_1524w	n_prep_oral_ever_sw  n_prep_oral_ever_sdc 	n_prep_oral_ever_plw  
n_prep_inj_ever_1524w	n_prep_inj_ever_sw	 n_prep_inj_ever_sdc	n_prep_inj_ever_plw  
n_prep_vr_ever_1524w    n_prep_vr_ever_sw  	 n_prep_vr_ever_sdc		n_prep_vr_ever_plw  
n_prep_oral_w			n_prep_oral_m
py_prep_oral_1524w		py_prep_oral_sw
py_prep_inj_1524w		py_prep_inj_sw

n_elig_prep

p_hiv1_prep incidence1524w   incidence1524m incidence2534w   incidence2534m incidence3544w   incidence3544m 
incidence4554w   incidence4554m incidence5564w   incidence5564m incidence_sw incidence_sd1564_ incidence_sd1564w test_prop_positive 
test_proppos_m  test_proppos_w  test_proppos_sw test_proppos_1524w p_newp_prep  
p_newp_this_per_prep  p_newp_prep_hivneg  av_prep_eff_non_res_v  

p_hypert_1549  p_hypert_5059 p_hypert_6069  p_hypert_7079  p_hypert_ge80  p_diagnosed_hypert_1549 
p_diagnosed_hypert_5059  p_diagnosed_hypert_6069  p_diagnosed_hypert_7079  p_diagnosed_hypert_ge80  p_on_anti_hypert_1549 
p_on_anti_hypert_5059  p_on_anti_hypert_6069  p_on_anti_hypert_7079  p_on_anti_hypert_ge80
p_hypert_1549m  p_hypert_5059m p_hypert_6069m  p_hypert_7079m  p_hypert_ge80m  p_diagnosed_hypert_1549m 
p_diagnosed_hypert_5059m  p_diagnosed_hypert_6069m  p_diagnosed_hypert_7079m  p_diagnosed_hypert_ge80m  
p_on_anti_hypert_1549m p_on_anti_hypert_5059m  p_on_anti_hypert_6069m  p_on_anti_hypert_7079m  p_on_anti_hypert_ge80m
p_hypert_1549w  p_hypert_5059w p_hypert_6069w  p_hypert_7079w  p_hypert_ge80w  p_diagnosed_hypert_1549w 
p_diagnosed_hypert_5059w  p_diagnosed_hypert_6069w  p_diagnosed_hypert_7079w  p_diagnosed_hypert_ge80w  
p_on_anti_hypert_1549w p_on_anti_hypert_5059w  p_on_anti_hypert_6069w  p_on_anti_hypert_7079w  p_on_anti_hypert_ge80w
p_hypert180_1549 p_hypert180_5059 p_hypert180_6069 p_hypert180_7079 p_hypert180_ge80
p_on1drug_antihyp_1549 p_on2drug_antihyp_1549 p_on3drug_antihyp_1549  p_on1drug_antihyp_5059  p_on2drug_antihyp_5059 
p_on3drug_antihyp_5059  p_on1drug_antihyp_6069  p_on2drug_antihyp_6069  p_on3drug_antihyp_6069  p_on1drug_antihyp_7079  p_on2drug_antihyp_7079 
p_on3drug_antihyp_7079  p_on1drug_antihyp_ge80  p_on2drug_antihyp_ge80  p_on3drug_antihyp_ge80 

p_ahd_re_enter_care_100 p_ahd_re_enter_care_200

n_dead_hivpos_cause1  rate_dead_hivpos_cause1 n_dead_hivpos_tb  rate_dead_hivpos_tb n_dead_hivpos_cause4  rate_dead_hivpos_cause4 
n_dead_hivpos_crypm  rate_dead_hivpos_crypm n_dead_hivpos_sbi  rate_dead_hivpos_sbi n_dead_hivpos_oth_adc  rate_dead_hivpos_oth_adc 
n_dead_hivpos_cause2  rate_dead_hivpos_cause2 	n_dead_hivpos_cause3  rate_dead_hivpos_cause3 	n_dead_hivpos_cvd  rate_dead_hivpos_cvd 
n_dead_cvd  rate_dead_cvd 	n_dead_tb  rate_dead_tb n_dead_hivneg_cvd  rate_dead_hivneg_cvd n_dead_hivneg_tb  rate_dead_hivneg_tb
n_dead_hivneg_cause2 rate_dead_hivneg_cause2 n_dead_hivneg_cause3  rate_dead_hivneg_cause3 	n_dead_hivneg_cause4  rate_dead_hivneg_cause4 
n_dead_hivneg_cause5  rate_dead_hivneg_cause5 rate_dead_allage rate_dead_hivneg_anycause rate_dead_hivpos_anycause n_death_2059_m n_death_2059_w
n_total_yllag 	n_dyll_GBD
n_dyllag_hiv_w	n_dyllag_hiv_m
n_yllag_hiv_w	n_yllag_hiv_m
n_death_hiv_m n_death_hiv_w n_cd4_lt50 n_cd4_lt200
p_age1549_hivneg p_age1549_hiv
rate_dead_cvd_3039m	rate_dead_cvd_4049m rate_dead_cvd_5059m rate_dead_cvd_6069m rate_dead_cvd_7079m rate_dead_cvd_ge80m rate_dead_cvd_3039w 
rate_dead_cvd_4049w rate_dead_cvd_5059w rate_dead_cvd_6069w rate_dead_cvd_7079w rate_dead_cvd_ge80w n_death_hivpos_anycause
sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e  higher_newp_less_engagement
fold_tr switch_for_tox adh_pattern_prep rate_test_startprep rate_test_restartprep
rate_choose_stop_prep circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
prep_strategy higher_future_prep_coverage  sens_test_prep

eff_max_freq_testing     eff_rate_restart    eff_prob_loss_at_diag     eff_rate_lost  eff_prob_lost_art   eff_rate_return   eff_pr_art_init  
eff_rate_int_choice      eff_prob_vl_meas_done    eff_pr_switch_line    eff_rate_test_startprep     eff_rate_test_restartprep   eff_rate_choose_stop_prep   
eff_prob_prep_restart_choice    eff_test_targeting 

circ_improvements rate_choose_stop_prep reg_option_104

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

exp_setting_lower_p_vl1000  
external_exp_factor   rate_exp_set_lower_p_vl1000    max_freq_testing  
test_targeting    prob_loss_at_diag   pr_art_init   
rate_lost   prob_lost_art   rate_return   rate_restart   rate_int_choice  
clinic_not_aw_int_frac    rate_loss_persistence   incr_rate_int_low_adh  
fold_change_mut_risk   adh_effect_of_meas_alert   pr_switch_line   prob_vl_meas_done  
red_adh_tb_adc   red_adh_tox_pop   add_eff_adh_nnrti   altered_adh_sec_line_pop  
prob_return_adc   higher_newp_less_engagement  higher_newp_with_lower_adhav
fold_tr fold_tr_newp  switch_for_tox   adh_pattern_prep    base_rate_sw   prep_depends_on_pr_vl_1000
condom_incr_year_i     		 incr_test_year_i              decr_hard_reach_year_i   
decr_prob_loss_at_diag_year_i  	decr_rate_lost_year_i 		decr_rate_lost_art_year_i     incr_rate_return_year_i      
incr_rate_restart_year_i         incr_rate_init_year_i        decr_rate_int_choice_year_i  
incr_prob_vl_meas_done_year_i  
incr_pr_switch_line_year_i          	incr_adh_pattern_prep_year_i  
inc_r_test_startprep_year_i  incr_r_test_restartprep_year_i  decr_r_choose_stop_prep_year_i  
inc_p_prep_restart_choi_year_i incr_prepuptake_sw_year_i    incr_prepuptake_pop_year_i   
circ_inc_rate_year_i  		incr_test_targeting_year_i    pop_wide_tld_year_i 
incr_max_freq_testing_year_i     initial_pr_switch_line     initial_prob_vl_meas_done   sw_test_6mthly_year_i  
art_mon_drug_levels_year_i       ten_is_taf_year_i    lower_future_art_cov    
	
e_decr_hard_reach_year_i   prep_strategy 
vmmc_disrup_covid  condom_disrup_covid  prep_disrup_covid  swprog_disrup_covid  
testing_disrup_covid  art_tld_disrup_covid  art_tld_eod_disrup_covid   art_init_disrup_covid   
vl_adh_switch_disrup_covid  cotrim_disrup_covid    no_art_disrup_covid 
inc_adeathr_disrup_covid art_low_adh_disrup_covid  cov_death_risk_mult 

n_mcirc1549_  n_mcirc1549_3m n_vmmc1549_ n_vmmc1549_3m

p_prep_newp  prop_1564m_onprep  prop_1564w_onprep  p_prep_elig_past_year  p_prep_elig_past_5year  mean_newp_ppers_prep  prop_onprep_newpge1
prop_onprep_newpge2 prop_onprep_newpge3  prop_1564_onprep

p_onart_m_age50pl p_onart_w_age50pl  n_onart
prevalence_hiv_preg prevalence1549preg prevalence1524preg n_onart_w n_onart_m n_onart_1524_ n_art_start_y p_diag_w p_diag_m p_onart_vl1000 
n_death_hiv_m n_death_hiv_w n_tested_m n_tested_w
eff_rate_choose_stop_prep    sens_vct_test_type_3  prep_efficacy   p_ep
p_m_npge1_ p_w_npge1_ p_w1524_npge1_ p_sw_npge1_
s_cost_prep s_cost_prep_visit
dcost_80 ddaly_80  overall_test_yield  n_vm_this_per  n_death_hiv   n_daly cost

p_inf_msm p_inf_pwid n_hiv_msm
n_alive_msm n_alive1564_msm incidence1549msm incidence1564msm prevalence1549_msm prevalence1564_msm prevalence_msm p_elig_prep_any_msm_1564 p_onprep_msm
p_onart_msm prevalence_vg1000_msm p_diag_msm p_onart_diag_msm p_vl1000_art_gt6m_msm p_ever_tested_msm p_tested_this_period_msm p_msm_infected_from_msm prop_m_msm		
p_ep_msm p_msm_ge1newp p_m_ge1newp n_pwid p_onprep_pwid p_onart_pwid
 n_diag_m_1524   n_diag_m_2549   n_diag_m_50pl   n_diag_w_1524  n_diag_w_2549  n_diag_w_50pl  n_diag_msm

 n_onart1524_m  n_onart1524_w  n_onart2549_m  n_onart2549_w  n_onart50pl_m  n_onart50pl_w
  n_onart_sw  n_onart_msm    n_vl1000_art_1524_m    n_vl1000_art_2549_m  n_vl1000_art_50pl_m n_vl1000_art_1524_w    n_vl1000_art_2549_w  n_vl1000_art_50pl_w 
n_vl1000_art_sw n_vl1000_art_msm
 n_dead_w	n_dead1524w_all	 n_dead2549w_all	 n_dead50plw_all   n_dead_m		n_dead1524m_all		n_dead2549m_all	 n_dead50plm_all				
n_hiv_child  n_new_inf_sw  n_new_inf_msm
 n_death_hiv_age_1524_m   n_death_hiv_age_2549_m  n_death_hiv_age_50pl_m
 n_death_hiv_age_1524_w   n_death_hiv_age_2549_w  n_death_hiv_age_50pl_w  p_vl1000_msm  incidence_msm
;




proc sort data=y;by run option;run;
/*proc freq data=y; table option;run;*/


proc contents; run;


* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;
data a.long_zim_all; 
	set y;
	if cald=. then delete; 
run;


data a.long_zim_control; set y;
if option ne 0 then delete;
if cald=. then delete; run;

proc contents data = a.long_zim_control; run;

/*proc freq data=a.long_zim_all; table option;run;*/
/*proc freq data=a.long_zim_control; table option;run;*/



************************************************************************************************************************************************************;


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
Percent_circumcised = p_mcirc * 100;
Percent_condom_use_GP = .;
PrEP_FSW = n_onprep_sw;
PrEP_MSM = n_onprep_msm;
PrEP_GP = n_onprep_m + n_onprep_w;
PrEP_Pop_GP = n_elig_prep;
NewHIV_PrEP_Pop_GP = n_new_inf_prep_elig;
Percent_FSW_reached = (n_sw_program_visit * 100) / n_sw_1564;
Percent_MSM_reached = .;


keep

cald
option

Total_00_14_M
Total_15_24_M
Total_25_49_M
Total_50_UP_M
Total_00_14_F
Total_15_24_F
Total_25_49_F
Total_50_UP_F
Total_FSW
Total_MSM
PLHIV_00_14_M
PLHIV_15_24_M
PLHIV_25_49_M
PLHIV_50_UP_M
PLHIV_00_14_F
PLHIV_15_24_F
PLHIV_25_49_F
PLHIV_50_UP_F
PLHIV_FSW
PLHIV_MSM
Diagnosed_00_14_M
Diagnosed_15_24_M
Diagnosed_25_49_M
Diagnosed_50_UP_M
Diagnosed_00_14_F
Diagnosed_15_24_F
Diagnosed_25_49_F
Diagnosed_50_UP_F
Diagnosed_FSW
Diagnosed_MSM
ART_00_14_M
ART_15_24_M
ART_25_49_M
ART_50_UP_M
ART_00_14_F
ART_15_24_F
ART_25_49_F
ART_50_UP_F
ART_FSW
ART_MSM
VLS_00_14_M
VLS_15_24_M
VLS_25_49_M
VLS_50_UP_M
VLS_00_14_F
VLS_15_24_F
VLS_25_49_F
VLS_50_UP_F
VLS_FSW
VLS_MSM
Birth_All
Birth_HIV
DeathsAll_00_14_M
DeathsAll_15_24_M
DeathsAll_25_49_M
DeathsAll_50_UP_M
DeathsAll_00_14_F
DeathsAll_15_24_F
DeathsAll_25_49_F
DeathsAll_50_UP_F
NewHIV_00_14_M
NewHIV_15_24_M
NewHIV_25_49_M
NewHIV_50_UP_M
NewHIV_00_14_F
NewHIV_15_24_F
NewHIV_25_49_F
NewHIV_50_UP_F
NewHIV_FSW
NewHIV_MSM
DeathsHIV_00_14_M
DeathsHIV_15_24_M
DeathsHIV_25_49_M
DeathsHIV_50_UP_M
DeathsHIV_00_14_F
DeathsHIV_15_24_F
DeathsHIV_25_49_F
DeathsHIV_50_UP_F
DALYs_Undiscounted
TotalCost_Undiscounted
Percent_circumcised
Percent_condom_use_GP
PrEP_FSW
PrEP_MSM
PrEP_GP
PrEP_Pop_GP
NewHIV_PrEP_Pop_GP
Percent_FSW_reached
Percent_MSM_reached

;
run;
 
  options nomprint;
  option nospool;


%macro var_stock(v=);

* &v ;

* only for option = 0;

* stock ;

proc means noprint data=y; var &v; output out=y_1985 mean= &v;  where cald = 1985.5;
proc means noprint data=y; var &v; output out=y_1986 mean= &v;  where cald = 1986.5;
proc means noprint data=y; var &v; output out=y_1987 mean= &v;  where cald = 1987.5;
proc means noprint data=y; var &v; output out=y_1988 mean= &v;  where cald = 1988.5;
proc means noprint data=y; var &v; output out=y_1989 mean= &v;  where cald = 1989.5;
proc means noprint data=y; var &v; output out=y_1990 mean= &v;  where cald = 1990.5;
proc means noprint data=y; var &v; output out=y_1991 mean= &v;  where cald = 1991.5;
proc means noprint data=y; var &v; output out=y_1992 mean= &v;  where cald = 1992.5;
proc means noprint data=y; var &v; output out=y_1993 mean= &v;  where cald = 1993.5;
proc means noprint data=y; var &v; output out=y_1994 mean= &v;  where cald = 1994.5;
proc means noprint data=y; var &v; output out=y_1995 mean= &v;  where cald = 1995.5;
proc means noprint data=y; var &v; output out=y_1996 mean= &v;  where cald = 1996.5;
proc means noprint data=y; var &v; output out=y_1997 mean= &v;  where cald = 1997.5;
proc means noprint data=y; var &v; output out=y_1998 mean= &v;  where cald = 1998.5;
proc means noprint data=y; var &v; output out=y_1999 mean= &v;  where cald = 1999.5;
proc means noprint data=y; var &v; output out=y_2000 mean= &v;  where cald = 2000.5;
proc means noprint data=y; var &v; output out=y_2001 mean= &v;  where cald = 2001.5;
proc means noprint data=y; var &v; output out=y_2002 mean= &v;  where cald = 2002.5;
proc means noprint data=y; var &v; output out=y_2003 mean= &v;  where cald = 2003.5;
proc means noprint data=y; var &v; output out=y_2004 mean= &v;  where cald = 2004.5;
proc means noprint data=y; var &v; output out=y_2005 mean= &v;  where cald = 2005.5;
proc means noprint data=y; var &v; output out=y_2006 mean= &v;  where cald = 2006.5;
proc means noprint data=y; var &v; output out=y_2007 mean= &v;  where cald = 2007.5;
proc means noprint data=y; var &v; output out=y_2008 mean= &v;  where cald = 2008.5;
proc means noprint data=y; var &v; output out=y_2009 mean= &v;  where cald = 2009.5;
proc means noprint data=y; var &v; output out=y_2010 mean= &v;  where cald = 2010.5;
proc means noprint data=y; var &v; output out=y_2011 mean= &v;  where cald = 2011.5;
proc means noprint data=y; var &v; output out=y_2012 mean= &v;  where cald = 2012.5;
proc means noprint data=y; var &v; output out=y_2013 mean= &v;  where cald = 2013.5;
proc means noprint data=y; var &v; output out=y_2014 mean= &v;  where cald = 2014.5;
proc means noprint data=y; var &v; output out=y_2015 mean= &v;  where cald = 2015.5;
proc means noprint data=y; var &v; output out=y_2016 mean= &v;  where cald = 2016.5;
proc means noprint data=y; var &v; output out=y_2017 mean= &v;  where cald = 2017.5;
proc means noprint data=y; var &v; output out=y_2018 mean= &v;  where cald = 2018.5;
proc means noprint data=y; var &v; output out=y_2019 mean= &v;  where cald = 2019.5;
proc means noprint data=y; var &v; output out=y_2020 mean= &v;  where cald = 2020.5;
proc means noprint data=y; var &v; output out=y_2021 mean= &v;  where cald = 2021.5;
proc means noprint data=y; var &v; output out=y_2022 mean= &v;  where cald = 2022.5;
proc means noprint data=y; var &v; output out=y_2023 mean= &v;  where cald = 2023.5;
proc means noprint data=y; var &v; output out=y_2024 mean= &v;  where cald = 2024.5;
proc means noprint data=y; var &v; output out=y_2025 mean= &v;  where cald = 2025.5;
proc means noprint data=y; var &v; output out=y_2026 mean= &v;  where cald = 2026.5;
proc means noprint data=y; var &v; output out=y_2027 mean= &v;  where cald = 2027.5;
proc means noprint data=y; var &v; output out=y_2028 mean= &v;  where cald = 2028.5;
proc means noprint data=y; var &v; output out=y_2029 mean= &v;  where cald = 2029.5;
proc means noprint data=y; var &v; output out=y_2030 mean= &v;  where cald = 2030.5;
proc means noprint data=y; var &v; output out=y_2031 mean= &v;  where cald = 2031.5;
proc means noprint data=y; var &v; output out=y_2032 mean= &v;  where cald = 2032.5;
proc means noprint data=y; var &v; output out=y_2033 mean= &v;  where cald = 2033.5;
proc means noprint data=y; var &v; output out=y_2034 mean= &v;  where cald = 2034.5;
proc means noprint data=y; var &v; output out=y_2035 mean= &v;  where cald = 2035.5;
proc means noprint data=y; var &v; output out=y_2036 mean= &v;  where cald = 2036.5;
proc means noprint data=y; var &v; output out=y_2037 mean= &v;  where cald = 2037.5;
proc means noprint data=y; var &v; output out=y_2038 mean= &v;  where cald = 2038.5;
proc means noprint data=y; var &v; output out=y_2039 mean= &v;  where cald = 2039.5;
proc means noprint data=y; var &v; output out=y_2040 mean= &v;  where cald = 2040.5;
proc means noprint data=y; var &v; output out=y_2041 mean= &v;  where cald = 2041.5;
proc means noprint data=y; var &v; output out=y_2042 mean= &v;  where cald = 2042.5;
proc means noprint data=y; var &v; output out=y_2043 mean= &v;  where cald = 2043.5;
proc means noprint data=y; var &v; output out=y_2044 mean= &v;  where cald = 2044.5;
proc means noprint data=y; var &v; output out=y_2045 mean= &v;  where cald = 2045.5;
proc means noprint data=y; var &v; output out=y_2046 mean= &v;  where cald = 2046.5;
proc means noprint data=y; var &v; output out=y_2047 mean= &v;  where cald = 2047.5;
proc means noprint data=y; var &v; output out=y_2048 mean= &v;  where cald = 2048.5;
proc means noprint data=y; var &v; output out=y_2049 mean= &v;  where cald = 2049.5;
proc means noprint data=y; var &v; output out=y_2050 mean= &v;  where cald = 2050.5;
proc means noprint data=y; var &v; output out=y_2051 mean= &v;  where cald = 2051.5;
proc means noprint data=y; var &v; output out=y_2052 mean= &v;  where cald = 2052.5;
proc means noprint data=y; var &v; output out=y_2053 mean= &v;  where cald = 2053.5;
proc means noprint data=y; var &v; output out=y_2054 mean= &v;  where cald = 2054.5;
proc means noprint data=y; var &v; output out=y_2055 mean= &v;  where cald = 2055.5;
proc means noprint data=y; var &v; output out=y_2056 mean= &v;  where cald = 2056.5;
proc means noprint data=y; var &v; output out=y_2057 mean= &v;  where cald = 2057.5;
proc means noprint data=y; var &v; output out=y_2058 mean= &v;  where cald = 2058.5;
proc means noprint data=y; var &v; output out=y_2059 mean= &v;  where cald = 2059.5;
proc means noprint data=y; var &v; output out=y_2060 mean= &v;  where cald = 2060.5;
proc means noprint data=y; var &v; output out=y_2061 mean= &v;  where cald = 2061.5;
proc means noprint data=y; var &v; output out=y_2062 mean= &v;  where cald = 2062.5;
proc means noprint data=y; var &v; output out=y_2063 mean= &v;  where cald = 2063.5;
proc means noprint data=y; var &v; output out=y_2064 mean= &v;  where cald = 2064.5;
proc means noprint data=y; var &v; output out=y_2065 mean= &v;  where cald = 2065.5;
proc means noprint data=y; var &v; output out=y_2066 mean= &v;  where cald = 2066.5;
proc means noprint data=y; var &v; output out=y_2067 mean= &v;  where cald = 2067.5;
proc means noprint data=y; var &v; output out=y_2068 mean= &v;  where cald = 2068.5;
proc means noprint data=y; var &v; output out=y_2069 mean= &v;  where cald = 2069.5;
proc means noprint data=y; var &v; output out=y_2070 mean= &v;  where cald = 2070.5;
proc means noprint data=y; var &v; output out=y_2071 mean= &v;  where cald = 2071.5;
proc means noprint data=y; var &v; output out=y_2072 mean= &v;  where cald = 2072.5;
proc means noprint data=y; var &v; output out=y_2073 mean= &v;  where cald = 2073.5;
proc means noprint data=y; var &v; output out=y_2074 mean= &v;  where cald = 2074.5;
proc means noprint data=y; var &v; output out=y_2075 mean= &v;  where cald = 2075.5;


/*

proc means noprint data=y; var &v; output out=y_26  mean= &v   ; where cald = 2026.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_27  mean= &v   ; where cald = 2027.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_28  mean= &v   ; where cald = 2028.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_29  mean= &v   ; where cald = 2029.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_30  mean= &v   ; where cald = 2030.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_31  mean= &v   ; where cald = 2031.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_32  mean= &v   ; where cald = 2032.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_33  mean= &v   ; where cald = 2033.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_34  mean= &v   ; where cald = 2034.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_35  mean= &v   ; where cald = 2035.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_36  mean= &v   ; where cald = 2036.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_37  mean= &v   ; where cald = 2037.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_38  mean= &v   ; where cald = 2038.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_39  mean= &v   ; where cald = 2039.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_40  mean= &v   ; where cald = 2040.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_41  mean= &v   ; where cald = 2041.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_42  mean= &v   ; where cald = 2042.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_43  mean= &v   ; where cald = 2043.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_44  mean= &v   ; where cald = 2044.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_45  mean= &v   ; where cald = 2045.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_46  mean= &v   ; where cald = 2046.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_47  mean= &v   ; where cald = 2047.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_48  mean= &v   ; where cald = 2048.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_49  mean= &v   ; where cald = 2049.5 and option=12 ;
proc means noprint data=y; var &v; output out=y_50  mean= &v   ; where cald = 2050.5 and option=12 ;

*/
																										
data &v ; set  
y_1985  y_1986  y_1987  y_1988  y_1989  y_1990  y_1991  y_1992  y_1993  y_1994  y_1995  y_1996  y_1997  y_1998  y_1999  y_2000  y_2001  y_2002  y_2003  y_2004  
y_2005  y_2006  y_2007  y_2008  y_2009  y_2010  y_2011  y_2012  y_2013  y_2014  y_2015  y_2016  y_2017  y_2018  y_2019  y_2020  y_2021  y_2022  y_2023  y_2024  
y_2025  y_2026  y_2027  y_2028  y_2029  y_2030  y_2031  y_2032  y_2033  y_2034  y_2035  y_2036  y_2037  y_2038  y_2039  y_2040  y_2041  y_2042  y_2043  y_2044  
y_2045  y_2046  y_2047  y_2048  y_2049  y_2050  y_2051  y_2052  y_2053  y_2054  y_2055  y_2056  y_2057  y_2058  y_2059  y_2060  y_2061  y_2062  y_2063  y_2064  
y_2065  y_2066  y_2067  y_2068  y_2069  y_2070  y_2071  y_2072  y_2073  y_2074  y_2075  

/*
 y_26 y_27 y_28 y_29 y_30 y_31 y_32 y_33 y_34 y_35 y_36 y_37 y_38 y_39 y_40  y_41 y_42 y_43 y_44 y_45 y_46 y_47 y_48 y_49 y_50  
*/
;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var_stock;


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* flow;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%macro var_flow(v=);

proc means noprint data=y; var &v; output out=z_1985 mean= &v; where 1984.5 < cald <= 1985.5;
proc means noprint data=y; var &v; output out=z_1986 mean= &v; where 1985.5 < cald <= 1986.5;
proc means noprint data=y; var &v; output out=z_1987 mean= &v; where 1986.5 < cald <= 1987.5;
proc means noprint data=y; var &v; output out=z_1988 mean= &v; where 1987.5 < cald <= 1988.5;
proc means noprint data=y; var &v; output out=z_1989 mean= &v; where 1988.5 < cald <= 1989.5;
proc means noprint data=y; var &v; output out=z_1990 mean= &v; where 1989.5 < cald <= 1990.5;
proc means noprint data=y; var &v; output out=z_1991 mean= &v; where 1990.5 < cald <= 1991.5;
proc means noprint data=y; var &v; output out=z_1992 mean= &v; where 1991.5 < cald <= 1992.5;
proc means noprint data=y; var &v; output out=z_1993 mean= &v; where 1992.5 < cald <= 1993.5;
proc means noprint data=y; var &v; output out=z_1994 mean= &v; where 1993.5 < cald <= 1994.5;
proc means noprint data=y; var &v; output out=z_1995 mean= &v; where 1994.5 < cald <= 1995.5;
proc means noprint data=y; var &v; output out=z_1996 mean= &v; where 1995.5 < cald <= 1996.5;
proc means noprint data=y; var &v; output out=z_1997 mean= &v; where 1996.5 < cald <= 1997.5;
proc means noprint data=y; var &v; output out=z_1998 mean= &v; where 1997.5 < cald <= 1998.5;
proc means noprint data=y; var &v; output out=z_1999 mean= &v; where 1998.5 < cald <= 1999.5;
proc means noprint data=y; var &v; output out=z_2000 mean= &v; where 1999.5 < cald <= 2000.5;
proc means noprint data=y; var &v; output out=z_2001 mean= &v; where 2000.5 < cald <= 2001.5;
proc means noprint data=y; var &v; output out=z_2002 mean= &v; where 2001.5 < cald <= 2002.5;
proc means noprint data=y; var &v; output out=z_2003 mean= &v; where 2002.5 < cald <= 2003.5;
proc means noprint data=y; var &v; output out=z_2004 mean= &v; where 2003.5 < cald <= 2004.5;
proc means noprint data=y; var &v; output out=z_2005 mean= &v; where 2004.5 < cald <= 2005.5;
proc means noprint data=y; var &v; output out=z_2006 mean= &v; where 2005.5 < cald <= 2006.5;
proc means noprint data=y; var &v; output out=z_2007 mean= &v; where 2006.5 < cald <= 2007.5;
proc means noprint data=y; var &v; output out=z_2008 mean= &v; where 2007.5 < cald <= 2008.5;
proc means noprint data=y; var &v; output out=z_2009 mean= &v; where 2008.5 < cald <= 2009.5;
proc means noprint data=y; var &v; output out=z_2010 mean= &v; where 2009.5 < cald <= 2010.5;
proc means noprint data=y; var &v; output out=z_2011 mean= &v; where 2010.5 < cald <= 2011.5;
proc means noprint data=y; var &v; output out=z_2012 mean= &v; where 2011.5 < cald <= 2012.5;
proc means noprint data=y; var &v; output out=z_2013 mean= &v; where 2012.5 < cald <= 2013.5;
proc means noprint data=y; var &v; output out=z_2014 mean= &v; where 2013.5 < cald <= 2014.5;
proc means noprint data=y; var &v; output out=z_2015 mean= &v; where 2014.5 < cald <= 2015.5;
proc means noprint data=y; var &v; output out=z_2016 mean= &v; where 2015.5 < cald <= 2016.5;
proc means noprint data=y; var &v; output out=z_2017 mean= &v; where 2016.5 < cald <= 2017.5;
proc means noprint data=y; var &v; output out=z_2018 mean= &v; where 2017.5 < cald <= 2018.5;
proc means noprint data=y; var &v; output out=z_2019 mean= &v; where 2018.5 < cald <= 2019.5;
proc means noprint data=y; var &v; output out=z_2020 mean= &v; where 2019.5 < cald <= 2020.5;
proc means noprint data=y; var &v; output out=z_2021 mean= &v; where 2020.5 < cald <= 2021.5;
proc means noprint data=y; var &v; output out=z_2022 mean= &v; where 2021.5 < cald <= 2022.5;
proc means noprint data=y; var &v; output out=z_2023 mean= &v; where 2022.5 < cald <= 2023.5;
proc means noprint data=y; var &v; output out=z_2024 mean= &v; where 2023.5 < cald <= 2024.5;
proc means noprint data=y; var &v; output out=z_2025 mean= &v; where 2024.5 < cald <= 2025.5;
proc means noprint data=y; var &v; output out=z_2026 mean= &v; where 2025.5 < cald <= 2026.5;
proc means noprint data=y; var &v; output out=z_2027 mean= &v; where 2026.5 < cald <= 2027.5;
proc means noprint data=y; var &v; output out=z_2028 mean= &v; where 2027.5 < cald <= 2028.5;
proc means noprint data=y; var &v; output out=z_2029 mean= &v; where 2028.5 < cald <= 2029.5;
proc means noprint data=y; var &v; output out=z_2030 mean= &v; where 2029.5 < cald <= 2030.5;
proc means noprint data=y; var &v; output out=z_2031 mean= &v; where 2030.5 < cald <= 2031.5;
proc means noprint data=y; var &v; output out=z_2032 mean= &v; where 2031.5 < cald <= 2032.5;
proc means noprint data=y; var &v; output out=z_2033 mean= &v; where 2032.5 < cald <= 2033.5;
proc means noprint data=y; var &v; output out=z_2034 mean= &v; where 2033.5 < cald <= 2034.5;
proc means noprint data=y; var &v; output out=z_2035 mean= &v; where 2034.5 < cald <= 2035.5;
proc means noprint data=y; var &v; output out=z_2036 mean= &v; where 2035.5 < cald <= 2036.5;
proc means noprint data=y; var &v; output out=z_2037 mean= &v; where 2036.5 < cald <= 2037.5;
proc means noprint data=y; var &v; output out=z_2038 mean= &v; where 2037.5 < cald <= 2038.5;
proc means noprint data=y; var &v; output out=z_2039 mean= &v; where 2038.5 < cald <= 2039.5;
proc means noprint data=y; var &v; output out=z_2040 mean= &v; where 2039.5 < cald <= 2040.5;
proc means noprint data=y; var &v; output out=z_2041 mean= &v; where 2040.5 < cald <= 2041.5;
proc means noprint data=y; var &v; output out=z_2042 mean= &v; where 2041.5 < cald <= 2042.5;
proc means noprint data=y; var &v; output out=z_2043 mean= &v; where 2042.5 < cald <= 2043.5;
proc means noprint data=y; var &v; output out=z_2044 mean= &v; where 2043.5 < cald <= 2044.5;
proc means noprint data=y; var &v; output out=z_2045 mean= &v; where 2044.5 < cald <= 2045.5;
proc means noprint data=y; var &v; output out=z_2046 mean= &v; where 2045.5 < cald <= 2046.5;
proc means noprint data=y; var &v; output out=z_2047 mean= &v; where 2046.5 < cald <= 2047.5;
proc means noprint data=y; var &v; output out=z_2048 mean= &v; where 2047.5 < cald <= 2048.5;
proc means noprint data=y; var &v; output out=z_2049 mean= &v; where 2048.5 < cald <= 2049.5;
proc means noprint data=y; var &v; output out=z_2050 mean= &v; where 2049.5 < cald <= 2050.5;
proc means noprint data=y; var &v; output out=z_2051 mean= &v; where 2050.5 < cald <= 2051.5;
proc means noprint data=y; var &v; output out=z_2052 mean= &v; where 2051.5 < cald <= 2052.5;
proc means noprint data=y; var &v; output out=z_2053 mean= &v; where 2052.5 < cald <= 2053.5;
proc means noprint data=y; var &v; output out=z_2054 mean= &v; where 2053.5 < cald <= 2054.5;
proc means noprint data=y; var &v; output out=z_2055 mean= &v; where 2054.5 < cald <= 2055.5;
proc means noprint data=y; var &v; output out=z_2056 mean= &v; where 2055.5 < cald <= 2056.5;
proc means noprint data=y; var &v; output out=z_2057 mean= &v; where 2056.5 < cald <= 2057.5;
proc means noprint data=y; var &v; output out=z_2058 mean= &v; where 2057.5 < cald <= 2058.5;
proc means noprint data=y; var &v; output out=z_2059 mean= &v; where 2058.5 < cald <= 2059.5;
proc means noprint data=y; var &v; output out=z_2060 mean= &v; where 2059.5 < cald <= 2060.5;
proc means noprint data=y; var &v; output out=z_2061 mean= &v; where 2060.5 < cald <= 2061.5;
proc means noprint data=y; var &v; output out=z_2062 mean= &v; where 2061.5 < cald <= 2062.5;
proc means noprint data=y; var &v; output out=z_2063 mean= &v; where 2062.5 < cald <= 2063.5;
proc means noprint data=y; var &v; output out=z_2064 mean= &v; where 2063.5 < cald <= 2064.5;
proc means noprint data=y; var &v; output out=z_2065 mean= &v; where 2064.5 < cald <= 2065.5;
proc means noprint data=y; var &v; output out=z_2066 mean= &v; where 2065.5 < cald <= 2066.5;
proc means noprint data=y; var &v; output out=z_2067 mean= &v; where 2066.5 < cald <= 2067.5;
proc means noprint data=y; var &v; output out=z_2068 mean= &v; where 2067.5 < cald <= 2068.5;
proc means noprint data=y; var &v; output out=z_2069 mean= &v; where 2068.5 < cald <= 2069.5;
proc means noprint data=y; var &v; output out=z_2070 mean= &v; where 2069.5 < cald <= 2070.5;
proc means noprint data=y; var &v; output out=z_2071 mean= &v; where 2070.5 < cald <= 2071.5;
proc means noprint data=y; var &v; output out=z_2072 mean= &v; where 2071.5 < cald <= 2072.5;
proc means noprint data=y; var &v; output out=z_2073 mean= &v; where 2072.5 < cald <= 2073.5;
proc means noprint data=y; var &v; output out=z_2074 mean= &v; where 2073.5 < cald <= 2074.5;
proc means noprint data=y; var &v; output out=z_2075 mean= &v; where 2074.5 < cald <= 2075.5;


/*
proc means noprint data=y; var &v; output out=z_26  mean= &v   ; where 2025.5 < cald <= 2026.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_27  mean= &v   ; where 2026.5 < cald <= 2027.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_28  mean= &v   ; where 2027.5 < cald <= 2028.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_29  mean= &v   ; where 2028.5 < cald <= 2029.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_30  mean= &v   ; where 2029.5 < cald <= 2030.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_31  mean= &v   ; where 2030.5 < cald <= 2031.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_32  mean= &v   ; where 2031.5 < cald <= 2032.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_33  mean= &v   ; where 2032.5 < cald <= 2033.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_34  mean= &v   ; where 2033.5 < cald <= 2034.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_35  mean= &v   ; where 2034.5 < cald <= 2035.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_36  mean= &v   ; where 2035.5 < cald <= 2036.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_37  mean= &v   ; where 2036.5 < cald <= 2037.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_38  mean= &v   ; where 2037.5 < cald <= 2038.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_39  mean= &v   ; where 2038.5 < cald <= 2039.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_40  mean= &v   ; where 2039.5 < cald <= 2040.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_41  mean= &v   ; where 2040.5 < cald <= 2041.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_42  mean= &v   ; where 2041.5 < cald <= 2042.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_43  mean= &v   ; where 2042.5 < cald <= 2043.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_44  mean= &v   ; where 2043.5 < cald <= 2044.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_45  mean= &v   ; where 2044.5 < cald <= 2045.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_46  mean= &v   ; where 2045.5 < cald <= 2046.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_47  mean= &v   ; where 2046.5 < cald <= 2047.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_48  mean= &v   ; where 2047.5 < cald <= 2048.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_49  mean= &v   ; where 2048.5 < cald <= 2049.5 and option=12 ;
proc means noprint data=y; var &v; output out=z_50  mean= &v   ; where 2049.5 < cald <= 2050.5 and option=12 ;
*/

data &v ; set  
z_1985  z_1986  z_1987  z_1988  z_1989  z_1990  z_1991  z_1992  z_1993  z_1994  z_1995  z_1996  z_1997  z_1998  z_1999  z_2000  z_2001  z_2002  z_2003  z_2004  
z_2005  z_2006  z_2007  z_2008  z_2009  z_2010  z_2011  z_2012  z_2013  z_2014  z_2015  z_2016  z_2017  z_2018  z_2019  z_2020  z_2021  z_2022  z_2023  z_2024  
z_2025  z_2026  z_2027  z_2028  z_2029  z_2030  z_2031  z_2032  z_2033  z_2034  z_2035  z_2036  z_2037  z_2038  z_2039  z_2040  z_2041  z_2042  z_2043  z_2044  
z_2045  z_2046  z_2047  z_2048  z_2049  z_2050  z_2051  z_2052  z_2053  z_2054  z_2055  z_2056  z_2057  z_2058  z_2059  z_2060  z_2061  z_2062  z_2063  z_2064  
z_2065  z_2066  z_2067  z_2068  z_2069  z_2070  z_2071  z_2072  z_2073  z_2074  z_2075
/*
z_24 z_25 z_26 z_27 z_28 z_29 z_30 z_31 z_32 z_33 z_34 z_35 z_36 z_37 z_38 z_39 z_40  z_41 z_42 z_43 z_44 z_45 z_46 z_47 z_48 z_49 z_50  
*/
;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var_flow;










* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* stocks ;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%var_stock(v=Total_00_14_M);
%var_stock(v=Total_15_24_M);
%var_stock(v=Total_25_49_M);
%var_stock(v=Total_50_UP_M);
%var_stock(v=Total_00_14_F);
%var_stock(v=Total_15_24_F);
%var_stock(v=Total_25_49_F);
%var_stock(v=Total_50_UP_F);
%var_stock(v=Total_FSW);
%var_stock(v=Total_MSM);
%var_stock(v=PLHIV_00_14_M);
%var_stock(v=PLHIV_15_24_M);
%var_stock(v=PLHIV_25_49_M);
%var_stock(v=PLHIV_50_UP_M);
%var_stock(v=PLHIV_00_14_F);
%var_stock(v=PLHIV_15_24_F);
%var_stock(v=PLHIV_25_49_F);
%var_stock(v=PLHIV_50_UP_F);
%var_stock(v=PLHIV_FSW);
%var_stock(v=PLHIV_MSM);
%var_stock(v=Diagnosed_00_14_M);
%var_stock(v=Diagnosed_15_24_M);
%var_stock(v=Diagnosed_25_49_M);
%var_stock(v=Diagnosed_50_UP_M);
%var_stock(v=Diagnosed_00_14_F);
%var_stock(v=Diagnosed_15_24_F);
%var_stock(v=Diagnosed_25_49_F);
%var_stock(v=Diagnosed_50_UP_F);
%var_stock(v=Diagnosed_FSW);
%var_stock(v=Diagnosed_MSM);
%var_stock(v=ART_00_14_M);
%var_stock(v=ART_15_24_M);
%var_stock(v=ART_25_49_M);
%var_stock(v=ART_50_UP_M);
%var_stock(v=ART_00_14_F);
%var_stock(v=ART_15_24_F);
%var_stock(v=ART_25_49_F);
%var_stock(v=ART_50_UP_F);
%var_stock(v=ART_FSW);
%var_stock(v=ART_MSM);
%var_stock(v=VLS_00_14_M);
%var_stock(v=VLS_15_24_M);
%var_stock(v=VLS_25_49_M);
%var_stock(v=VLS_50_UP_M);
%var_stock(v=VLS_00_14_F);
%var_stock(v=VLS_15_24_F);
%var_stock(v=VLS_25_49_F);
%var_stock(v=VLS_50_UP_F);
%var_stock(v=VLS_FSW);
%var_stock(v=VLS_MSM);



* for status quo - option = 0;

* 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2010 2021 2022 ;


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


proc contents; run;

*
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
;

data  wide_outputs_stocks ; merge 

year

Total_00_14_M
Total_15_24_M
Total_25_49_M
Total_50_UP_M
Total_00_14_F
Total_15_24_F
Total_25_49_F
Total_50_UP_F
Total_FSW
Total_MSM
PLHIV_00_14_M
PLHIV_15_24_M
PLHIV_25_49_M
PLHIV_50_UP_M
PLHIV_00_14_F
PLHIV_15_24_F
PLHIV_25_49_F
PLHIV_50_UP_F
PLHIV_FSW
PLHIV_MSM
Diagnosed_00_14_M
Diagnosed_15_24_M
Diagnosed_25_49_M
Diagnosed_50_UP_M
Diagnosed_00_14_F
Diagnosed_15_24_F
Diagnosed_25_49_F
Diagnosed_50_UP_F
Diagnosed_FSW
Diagnosed_MSM
ART_00_14_M
ART_15_24_M
ART_25_49_M
ART_50_UP_M
ART_00_14_F
ART_15_24_F
ART_25_49_F
ART_50_UP_F
ART_FSW
ART_MSM
VLS_00_14_M
VLS_15_24_M
VLS_25_49_M
VLS_50_UP_M
VLS_00_14_F
VLS_15_24_F
VLS_25_49_F
VLS_50_UP_F
VLS_FSW
VLS_MSM

;

proc print; run;

data stocks; 
retain 
year 

Total_00_14_M
Total_15_24_M
Total_25_49_M
Total_50_UP_M
Total_00_14_F
Total_15_24_F
Total_25_49_F
Total_50_UP_F
Total_FSW
Total_MSM
PLHIV_00_14_M
PLHIV_15_24_M
PLHIV_25_49_M
PLHIV_50_UP_M
PLHIV_00_14_F
PLHIV_15_24_F
PLHIV_25_49_F
PLHIV_50_UP_F
PLHIV_FSW
PLHIV_MSM
Diagnosed_00_14_M
Diagnosed_15_24_M
Diagnosed_25_49_M
Diagnosed_50_UP_M
Diagnosed_00_14_F
Diagnosed_15_24_F
Diagnosed_25_49_F
Diagnosed_50_UP_F
Diagnosed_FSW
Diagnosed_MSM
ART_00_14_M
ART_15_24_M
ART_25_49_M
ART_50_UP_M
ART_00_14_F
ART_15_24_F
ART_25_49_F
ART_50_UP_F
ART_FSW
ART_MSM
VLS_00_14_M
VLS_15_24_M
VLS_25_49_M
VLS_50_UP_M
VLS_00_14_F
VLS_15_24_F
VLS_25_49_F
VLS_50_UP_F
VLS_FSW
VLS_MSM
;
set wide_outputs_stocks;
run;

proc transpose data=stocks out=data_stock ; run;

data a_stock; set data_stock; run;
* drop _name_;

ods html;
proc print noobs data=a_stock; run; 










* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
* flows;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%var_flow(v=Birth_All);
%var_flow(v=Birth_HIV);
%var_flow(v=DeathsAll_00_14_M);
%var_flow(v=DeathsAll_15_24_M);
%var_flow(v=DeathsAll_25_49_M);
%var_flow(v=DeathsAll_50_UP_M);
%var_flow(v=DeathsAll_00_14_F);
%var_flow(v=DeathsAll_15_24_F);
%var_flow(v=DeathsAll_25_49_F);
%var_flow(v=DeathsAll_50_UP_F);
%var_flow(v=NewHIV_00_14_M);
%var_flow(v=NewHIV_15_24_M);
%var_flow(v=NewHIV_25_49_M);
%var_flow(v=NewHIV_50_UP_M);
%var_flow(v=NewHIV_00_14_F);
%var_flow(v=NewHIV_15_24_F);
%var_flow(v=NewHIV_25_49_F);
%var_flow(v=NewHIV_50_UP_F);
%var_flow(v=NewHIV_FSW);
%var_flow(v=NewHIV_MSM);
%var_flow(v=DeathsHIV_00_14_M);
%var_flow(v=DeathsHIV_15_24_M);
%var_flow(v=DeathsHIV_25_49_M);
%var_flow(v=DeathsHIV_50_UP_M);
%var_flow(v=DeathsHIV_00_14_F);
%var_flow(v=DeathsHIV_15_24_F);
%var_flow(v=DeathsHIV_25_49_F);
%var_flow(v=DeathsHIV_50_UP_F);
%var_flow(v=DALYs_Undiscounted);
%var_flow(v=TotalCost_Undiscounted);
%var_flow(v=Percent_circumcised);
%var_flow(v=Percent_condom_use_GP);
%var_flow(v=PrEP_FSW);
%var_flow(v=PrEP_MSM);
%var_flow(v=PrEP_GP);
%var_flow(v=PrEP_Pop_GP);
%var_flow(v=NewHIV_PrEP_Pop_GP);
%var_flow(v=Percent_FSW_reached);
%var_flow(v=Percent_MSM_reached);


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

proc contents; run;

/*
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
*/


data  wide_outputs_flows ; merge 

year

Birth_All
Birth_HIV
DeathsAll_00_14_M
DeathsAll_15_24_M
DeathsAll_25_49_M
DeathsAll_50_UP_M
DeathsAll_00_14_F
DeathsAll_15_24_F
DeathsAll_25_49_F
DeathsAll_50_UP_F
NewHIV_00_14_M
NewHIV_15_24_M
NewHIV_25_49_M
NewHIV_50_UP_M
NewHIV_00_14_F
NewHIV_15_24_F
NewHIV_25_49_F
NewHIV_50_UP_F
NewHIV_FSW
NewHIV_MSM
DeathsHIV_00_14_M
DeathsHIV_15_24_M
DeathsHIV_25_49_M
DeathsHIV_50_UP_M
DeathsHIV_00_14_F
DeathsHIV_15_24_F
DeathsHIV_25_49_F
DeathsHIV_50_UP_F
DALYs_Undiscounted
TotalCost_Undiscounted
Percent_circumcised
Percent_condom_use_GP
PrEP_FSW
PrEP_MSM
PrEP_GP
PrEP_Pop_GP
NewHIV_PrEP_Pop_GP
Percent_FSW_reached
Percent_MSM_reached

;


data flows; 
retain 
year 
Birth_All
Birth_HIV
DeathsAll_00_14_M
DeathsAll_15_24_M
DeathsAll_25_49_M
DeathsAll_50_UP_M
DeathsAll_00_14_F
DeathsAll_15_24_F
DeathsAll_25_49_F
DeathsAll_50_UP_F
NewHIV_00_14_M
NewHIV_15_24_M
NewHIV_25_49_M
NewHIV_50_UP_M
NewHIV_00_14_F
NewHIV_15_24_F
NewHIV_25_49_F
NewHIV_50_UP_F
NewHIV_FSW
NewHIV_MSM
DeathsHIV_00_14_M
DeathsHIV_15_24_M
DeathsHIV_25_49_M
DeathsHIV_50_UP_M
DeathsHIV_00_14_F
DeathsHIV_15_24_F
DeathsHIV_25_49_F
DeathsHIV_50_UP_F
DALYs_Undiscounted
TotalCost_Undiscounted
Percent_circumcised
Percent_condom_use_GP
PrEP_FSW
PrEP_MSM
PrEP_GP
PrEP_Pop_GP
NewHIV_PrEP_Pop_GP
Percent_FSW_reached
Percent_MSM_reached
;
set wide_outputs_flows;
run;

proc transpose data=flows out=data_flow ; run;

data a_flow; set data_flow; run;
* drop _name_;


ods html;
proc print noobs data=a_flow; run; 
ods html close;


ods html;
proc print noobs data=a_stock; run; 
proc print noobs data=a_flow; run; 
ods html close;




