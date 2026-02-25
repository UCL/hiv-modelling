
libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_MLW";
*turns log back on;
*options notes source source2 mprint mlogic symbolgen;

***97 runs;

data a;
set a.GenesisMLW_18Feb26;
if run=. then delete; 

proc sort;
by run cald option;run;

proc freq;table cald option;run;


data sf;
set a;

*Malawi;
*Source: World Population Prospect, file "World Population Prospect 2022.pdf";
*https://population.un.org/wpp/downloads?folder=Standard%20Projections&group=Population
(Excel sheet, population by select age groups);

if cald=2024;
sf = 12300000 / s_alive1564; 

keep run sf;
proc sort; by run;run;


data y; 
merge a sf;
by run ;

* preparatory code ;


* ================================================================================= ;

* discount rate;

* ================================================================================= ;

* discount rate is by default 3% already calculated in core;
*The code below should only be used for sensitivity analyses if needing to calculate 5% or 10% discount; 

* note discounting is from start of intervention - no adjustment needed;
*check year_start_disc is the same as year_interv+1 in core; 
%let year_start_disc=2025;
discount_5py = 1/(1.05**(cald-&year_start_disc));
discount_10py = 1/(1.10**(cald-&year_start_disc));


* ================================================================================= ;

* dalys and life years;

* ================================================================================= ;



s_ddaly = s_dead_ddaly + s_live_ddaly;

s_ddaly_gbd = s_dyll_GBD + s_live_ddaly;


dead_ddaly_ntd = s_dead_ddaly_ntd * sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * sf * 4;

ddaly_gbd = s_ddaly_gbd * sf * 4;


* sensitivity analysis;
* dead_ddaly_ntd = dead_ddaly_ntd * (0.0061 / 0.0022) ; 

s_mtct = s_birth_with_inf_child + s_child_infected_breastfeeding ;

ddaly_yll_mtct = s_mtct * sf * 4 * 5   * discount ; * 5  yll dalys per infected child ;  

ddaly_mtct = ddaly_yll_mtct + (s_ddaly_mtct * sf * 4); * adding the yll to the live dalys;

dead_ddaly_odabe = s_dead_ddaly_oth_dol_adv_birth_e * sf * 4; * odabe ;

ddaly_non_aids_pre_death = s_ddaly_non_aids_pre_death * sf * 4; * napd;

ddaly_ad_ntd_mtct = ddaly + dead_ddaly_ntd + ddaly_mtct ;

ddaly_ad_ntd_mtct_odabe = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe ;

ddaly_ntd_mtct_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + ddaly_non_aids_pre_death;

ddaly_ntd_mtct_odab_napd = ddaly + dead_ddaly_ntd + ddaly_mtct + dead_ddaly_odabe + ddaly_non_aids_pre_death;

ddaly_all = ddaly_ntd_mtct_odab_napd;

ddaly_ad_mtct = ddaly + ddaly_mtct;

* NOTE !: ;

ddaly = ddaly_ad_mtct ;


* ================================================================================= ;



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

dzdv_cost = s_dcost_zdv * sf * 4 / 1000;
dten_cost = s_dcost_ten * sf * 4 / 1000;
d3tc_cost = s_dcost_3tc * sf * 4 / 1000; 
dnev_cost = s_dcost_nev * sf * 4 / 1000;
dlpr_cost = s_dcost_lpr * sf * 4 / 1000;
ddar_cost = s_dcost_dar * sf * 4 / 1000;
dtaz_cost = s_dcost_taz * sf * 4 / 1000;
defa_cost = s_dcost_efa * sf * 4 / 1000;
ddol_cost = s_dcost_dol * sf * 4 / 1000;
dcab_cost = s_dcost_cab * sf * 4 / 1000;
dlen_cost = s_dcost_len * sf * 4 / 1000;

if s_dart_cost=. then s_dart_cost=0;
if s_dcost_prep_oral=. then s_dcost_prep_oral=0;

if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ad_adh=. then s_dcost_prep_ad_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_cab +  s_dcost_prep_len ;
s_dcost_prep_visit = s_dcost_prep_visit_oral + s_dcost_prep_visit_cab + s_dcost_prep_visit_len   ;


* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * sf * 4 / 1000;

dvis_cost_no_lencab = s_dvis_cost_no_lencab * sf * 4 / 1000;
dvis_cost_lencab = s_dvis_cost_lencab * sf * 4 / 1000;

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
dcost_self_test = s_dcost_self_test * sf * 4 / 1000;
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
dcost_prep_ad_adh = s_dcost_prep_ad_adh * sf * 4 / 1000; 

dtb_lam_cost =  s_dtb_lam_cost  * sf * 4 / 1000;  
dtb_proph_cost = s_dtb_proph_cost * sf * 4 / 1000;  
dcrag_cost =  s_dcrag_cost  * sf * 4 / 1000;  
dcrypm_proph_cost = s_dcrypm_proph_cost * sf * 4 / 1000;  
dsbi_proph_cost = s_dsbi_proph_cost  * sf * 4 / 1000; 

dcost_sw_program = s_dcost_sw_program * sf / 1000;

* dcost_lencab_return = s_cost_lencab_return * discount * sf * 0.2 / 1000;  * $10 for offer of return;
dcost_lencab_return = 0; * since assume $60 per year for clinic costs for lencab which seems on high side especially given possibility of injections in community, 
dont think we need to have an extra cost here.


* note this below can be used if outputs are from program beyond 1-1-20;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf * 4 / 1000;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * sf * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * sf * 4 / 1000;
dcost_circ = s_dcost_circ * sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * sf * 4 * 0.25 / 1000; * 0.25 because cost was overestimated in model program;
dswitchline_cost = s_dcost_switch_line * sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * sf * 4 / 1000;

dcost_child_hiv = (s_birth_with_inf_child + s_child_infected_breastfeeding) * 1 * discount * sf * 4 / 1000; * unit cost of 1000 applied (hence the 1);

dclin_cost = dadc_cost+dnon_tb_who3_cost+dcot_cost+dtb_cost;

* sens analysis;

***USE CONDOM COSTS, ADHERENCE SUPPORT COSTS AND FSW COSTS AS PER HIV CONTROL;

*These need to be divided by a million as all costs so far in millions;
cost_condom_py=1030350/1000000;*FIXED COST;
cost_FSW_services_pppy=132/1000000;*annual cost per year;
cost_AdhSupp_pppy=7.89/1000000;* This cost is from MIHPSA Zim and is per client per year;

* Not assessing condom use as an option so include the same cost for all scenarios;
/*cost_condoms = 0; if option in (99, 3) then cost_condoms = cost_condom_py;*/		* Fixed population-level py cost so scaling not needed;
cost_condoms = cost_condom_py;
dcost_condoms = cost_condoms * discount;

cost_fsw_services=0; if option in (99, 1) then cost_fsw_services = s_sw_program_visit * cost_FSW_services_pppy * sf;
dcost_fsw_services = cost_fsw_services * discount;

cost_adh_support = 0; if option in (99 16) then cost_adh_support = s_diag * cost_AdhSupp_pppy * sf;* Assumes the cost is applied to everyone diagnosed;	
dcost_adh_support = cost_adh_support * discount;


dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost + dcab_cost + dlen_cost;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + 
					dcot_cost + dtb_cost + dres_cost + dtest_cost + d_t_adh_int_cost + dswitchline_cost + 
					dcost_circ + dcost_condoms + dcost_child_hiv + dcost_non_aids_pre_death + dcost_drug_level_test
					+ dcost_prep_visit + dcost_prep + dcost_fsw_services  + dcost_self_test ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost + dtb_lam_cost + dtb_proph_cost + dcrag_cost + dcrypm_proph_cost + dsbi_proph_cost ; 

dcost_clinical_care_hiv = dadc_cost + dnon_tb_who3_cost + dtb_cost + d_t_adh_int_cost + dswitchline_cost + dcot_cost + dcost_non_aids_pre_death + dres_cost;


cost_clin_care = dcost_clin_care / discount;
cost = dcost / discount;

* ================================================================================= ;
* ================================================================================= ;


***Preparing code;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 

s_alive = s_alive_m + s_alive_w ;

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw;
s_hivge15_ = s_hivge15m + s_hivge15w;

s_new_vmmc1549m = s_new_vmmc1519m + s_new_vmmc2024m + s_new_vmmc2529m + s_new_vmmc3034m + s_new_vmmc3539m + s_new_vmmc4044m +s_new_vmmc4549m;

***general population;

* n_alive;						n_alive = s_alive * sf;
* n_alive_m;					n_alive_m = s_alive_m * sf;
* n_alive_w;					n_alive_w = s_alive_w * sf;

* n_alive1564_;					n_alive1564_ = s_alive1564 * sf;
* n_alive1564m;					n_alive1564m = s_alive1564_m * sf;
* n_alive1564w;					n_alive1564w = s_alive1564_w * sf;

* n_hivge15m;					n_hivge15m = s_hivge15m * sf ;
* n_hivge15w;					n_hivge15w = s_hivge15w * sf ;
* n_hivge15_;					n_hivge15_ = n_hivge15m + n_hivge15w ;
* n_hivge1564_;					n_hivge1564_ = (s_hiv1564m + s_hiv1564w) * sf;

* n_new_inf;					n_new_inf	 = s_primary * sf * 4;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549_;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549_;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* p_onart_w;					if n_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if n_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if n_hivge15_ gt 0 then p_onart = s_onart / s_hivge15_; 

* n_onart_w;					n_onart_w = s_onart_w * sf;
* n_onart_m;					n_onart_m = s_onart_m * sf;
* n_onart  ;					n_onart   = s_onart * sf;

* n_diagnosed;					n_diagnosed = s_diag_this_period * sf * 4;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* n_selftested;					n_selftested = s_self_tested * 4 * sf;
* n_tested;						n_tested  = s_tested * 4 * sf;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000_;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 


* n_onprep_w;					n_onprep_w = max(s_onprep_w, 0) * sf;
* n_onprep_m;					n_onprep_m = max(s_onprep_m, 0) * sf;
* n_onprep;						n_onprep = n_onprep_w + n_onprep_m ;
* prop_1564_onprep;				prop_1564_onprep =   (s_onprep_m + s_onprep_w) / (s_alive1564 - s_hiv1564) ;
* n_onprep_oral;				n_onprep_oral =   (s_onprep_oral_m + s_onprep_oral_w) * sf;
* n_onprep_cab;					n_onprep_cab =   (s_onprep_cab_m + s_onprep_cab_w) * sf ;
* n_onprep_len;					n_onprep_len =   (s_onprep_len_m + s_onprep_len_w)  * sf ;

* prop_elig_on_prep;			if s_prep_any_elig > 0 then prop_elig_on_prep = s_prep_any / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep = 0;
* n_prep_ever;					n_prep_ever = s_prep_any_ever * sf;

* n_sw_1564;					n_sw_1564_ = s_sw_1564 * sf;
* n_sw_1549;					n_sw_1549_ = s_sw_1549 * sf;
* p_w_1549_sw;					if s_alive1549_w gt 0 then p_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* p_w_1564_sw;					if s_alive1564_w gt 0 then p_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prevalence_1564sw;			prevalence_1564sw     = s_hiv_sw / s_sw_1564; 
* incidence_1564sw;				if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_1564sw=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
* p_onprep_sw; 			    	if (s_sw_1564 - s_hiv_sw) gt 0 then p_onprep_sw = max(s_prep_any_sw, 0) / (s_sw_1564 - s_hiv_sw) ;
* n_onprep_sw;					n_onprep_sw = s_onprep_sw * sf;

* n_msm_1564_;					n_msm_1564_ = s_alive1564_msm * sf ;
* p_m_msm;						p_m_msm = s_alive1564_msm / s_alive1564_m;
* prevalence1549_msm;			prevalence1549_msm = s_hiv1549msm / s_alive1549_msm; 
* incidence_msm;				if (s_msm  - s_hiv_msm  + s_primary_msm) gt 0 then incidence_msm=(s_primary_msm * 4 * 100) / (s_msm  - s_hiv_msm  + s_primary_msm);
* p_onprep_msm;					p_onprep_msm = s_onprep_msm / (s_alive1564_msm - s_hiv1564msm);
* n_onprep_msm;					n_onprep_msm = s_onprep_msm * sf;

s_ageg1524w = s_ageg1519w + s_ageg2024w;
s_hiv1524w = s_hiv1519w + s_hiv2024w;
s_primary1524w = s_primary1519w + s_primary2024w;

* n_agyw;						n_agyw = s_ageg1524w * sf;
* p_agyw;						p_w_agyw = s_ageg1524w/s_alive1564_w;
* n_agyw_pg;					n_agyw_pg = s_agyw_pg * sf;
* prevalence_agyw;				prevalence_agyw = s_hiv1524w/s_ageg1524w;
* incidence_agyw;				if (s_ageg1524w - s_hiv1524w + s_primary1524w) gt 0 then incidence_agyw = (s_primary1524w *4 * 100)/(s_ageg1524w - s_hiv1524w + s_primary1524w); 
* p_onprep_agyw;				p_onprep_agyw = s_onprep_1524w/ (s_ageg1524w - s_hiv1524w);
* n_onprep_agyw;				n_onprep_agyw = s_onprep_1524w * sf;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel  * 4* sf;
* n_death_hivrel_m;				n_death_hivrel_m = s_death_hivrel_m  * 4* sf;
* n_death_hivrel_w;				n_death_hivrel_w = s_death_hivrel_w * 4* sf;
* n_death;						n_death = s_dead_all * 4 * sf;

* n_hiv_pregnant;				n_hiv_pregnant = s_hiv_pregnant * sf;
* n_pregnant_onart;				n_pregnant_onart = s_pregnant_onart * sf;
* n_give_birth_with_hiv;		n_give_birth_with_hiv = s_give_birth_with_hiv * 4 * sf;
* n_infbirth_testing;			n_infbirth_testing = s_tested_labdel *4 * sf;
* n_postdel_testing;			n_postdel_testing = s_tested_pd * 4 * sf;


* n_vm_this_per;				n_vm_this_per = s_vm_this_per *4 * sf;	
* n_cd4m_this_per;				n_cd4m_this_per = s_cm_this_per*4 * sf;
* n_vmmc1549m;					n_vmmc1549m = s_new_vmmc1549m * 4* sf;
* n_vmmc_all;					n_vmmc_all = s_new_vmmc * 4* sf;
* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_vmmc;						p_vmmc = s_vmmc / s_alive_m ;

* n_death_discount;				n_death_discount = n_death*discount;
* d_n_new_inf;					d_n_new_inf = n_new_inf * discount;


keep run 			 option				cald 				n_alive1564_		n_alive1564m		n_alive1564w	n_new_inf
n_alive_m			 n_alive_w			n_alive				n_hivge15m			n_hivge15w		    n_hivge15_		n_hivge1564_
prevalence1549m 	 prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w 		incidence1549m
p_onart				 p_onart_m			p_onart_w			n_onart				n_onart_m			n_onart_w

n_diagnosed
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	n_onprep_w			n_onprep_m			n_onprep
prop_elig_on_prep	 n_prep_ever		prop_1564_onprep	n_onprep_oral		n_onprep_cab		n_onprep_len

n_sw_1564_			 n_sw_1549_			p_w_1564_sw			p_w_1549_sw			prevalence_1564sw	incidence_1564sw
p_onprep_sw			 n_onprep_sw

n_selftested		 n_tested			

n_msm_1564_			 p_m_msm			prevalence1549_msm	incidence_msm		p_onprep_msm		n_onprep_msm
n_agyw				 n_agyw_pg			p_w_agyw			prevalence_agyw		incidence_agyw		p_onprep_agyw		n_onprep_agyw

n_death_hivrel		 n_death_hivrel_m	n_death_hivrel_w	
n_hiv_pregnant		 n_pregnant_onart	n_give_birth_with_hiv	n_infbirth_testing	n_postdel_testing
n_vm_this_per		 n_cd4m_this_per	n_vmmc1549m				n_vmmc_all		p_mcirc				p_vmmc
n_death_discount	 d_n_new_inf

dcost	ddaly  cost dcost_fsw_services



;

proc sort data=y;by run option;run;


data a.long_gen_mlw_18_02_2026;
set y;
run;


libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_MLW";

data y;
set a.long_gen_mlw_18_02_2026;
run; 

options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);


***baseline outputs in 2025;
proc means  noprint data=y; var &v; output out=y_25 mean= &v._25; by run; where 2025 <= cald < 2026; 

**Outputs in 5, 20 and 50 years time;

**the ones commented out are now included in the budget impact;
/*proc means noprint data=y; var &v; output out=y_31 mean= &v._31; by run option; where 2031.0 <= cald < 2032; 
proc means noprint data=y; var &v; output out=y_46 mean= &v._46; by run option; where 2046.0 <= cald < 2047; */
proc means noprint data=y; var &v; output out=y_76 mean= &v._76; by run option; where 2076.0 <= cald < 2077;

**Outputs in each year for budget impact;
proc means noprint data=y; var &v; output out=y_26 mean=&v._26; by run option; where 2026.0 <= cald < 2027;
proc means noprint data=y; var &v; output out=y_27 mean=&v._27; by run option; where 2027.0 <= cald < 2028;
proc means noprint data=y; var &v; output out=y_28 mean=&v._28; by run option; where 2028.0 <= cald < 2029;
proc means noprint data=y; var &v; output out=y_29 mean=&v._29; by run option; where 2029.0 <= cald < 2030;
proc means noprint data=y; var &v; output out=y_30 mean=&v._30; by run option; where 2030.0 <= cald < 2031;
proc means noprint data=y; var &v; output out=y_31 mean=&v._31; by run option; where 2031.0 <= cald < 2032;
proc means noprint data=y; var &v; output out=y_32 mean=&v._32; by run option; where 2032.0 <= cald < 2033;
proc means noprint data=y; var &v; output out=y_33 mean=&v._33; by run option; where 2033.0 <= cald < 2034;
proc means noprint data=y; var &v; output out=y_34 mean=&v._34; by run option; where 2034.0 <= cald < 2035;
proc means noprint data=y; var &v; output out=y_35 mean=&v._35; by run option; where 2035.0 <= cald < 2036;
proc means noprint data=y; var &v; output out=y_36 mean=&v._36; by run option; where 2036.0 <= cald < 2037;
proc means noprint data=y; var &v; output out=y_37 mean=&v._37; by run option; where 2037.0 <= cald < 2038;
proc means noprint data=y; var &v; output out=y_38 mean=&v._38; by run option; where 2038.0 <= cald < 2039;
proc means noprint data=y; var &v; output out=y_39 mean=&v._39; by run option; where 2039.0 <= cald < 2040;
proc means noprint data=y; var &v; output out=y_40 mean=&v._40; by run option; where 2040.0 <= cald < 2041;
proc means noprint data=y; var &v; output out=y_41 mean=&v._41; by run option; where 2041.0 <= cald < 2042;
proc means noprint data=y; var &v; output out=y_42 mean=&v._42; by run option; where 2042.0 <= cald < 2043;
proc means noprint data=y; var &v; output out=y_43 mean=&v._43; by run option; where 2043.0 <= cald < 2044;
proc means noprint data=y; var &v; output out=y_44 mean=&v._44; by run option; where 2044.0 <= cald < 2045;
proc means noprint data=y; var &v; output out=y_45 mean=&v._45; by run option; where 2045.0 <= cald < 2046;
proc means noprint data=y; var &v; output out=y_46 mean=&v._46; by run option; where 2046.0 <= cald < 2047;


**Outputs for CE analyses, across 5, 20 and 50 years by option;
proc means noprint data=y; var &v; output out=y_26_31 mean= &v._26_31; by run option ; where 2026.25 <= cald < 2031;
proc means noprint data=y; var &v; output out=y_26_46 mean= &v._26_46; by run option ; where 2026.25 <= cald < 2046;
proc means noprint data=y; var &v; output out=y_26_76 mean= &v._26_76; by run option ; where 2026.25 <= cald < 2076;


/*proc sort data=y_31; by run; proc transpose data=y_31 out=t_31 prefix=&v._31_; var &v._31; by run;
proc sort data=y_46; by run; proc transpose data=y_46 out=t_46 prefix=&v._46_; var &v._46; by run;*/
proc sort data=y_76; by run; proc transpose data=y_76 out=t_76 prefix=&v._76_; var &v._76; by run;

proc sort data=y_26; by run; proc transpose data=y_26 out=t_26 prefix=&v._26_; var &v._26; by run;
proc sort data=y_27; by run; proc transpose data=y_27 out=t_27 prefix=&v._27_; var &v._27; by run;
proc sort data=y_28; by run; proc transpose data=y_28 out=t_28 prefix=&v._28_; var &v._28; by run;
proc sort data=y_29; by run; proc transpose data=y_29 out=t_29 prefix=&v._29_; var &v._29; by run;
proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;
proc sort data=y_31; by run; proc transpose data=y_31 out=t_31 prefix=&v._31_; var &v._31; by run;
proc sort data=y_32; by run; proc transpose data=y_32 out=t_32 prefix=&v._32_; var &v._32; by run;
proc sort data=y_33; by run; proc transpose data=y_33 out=t_33 prefix=&v._33_; var &v._33; by run;
proc sort data=y_34; by run; proc transpose data=y_34 out=t_34 prefix=&v._34_; var &v._34; by run;
proc sort data=y_35; by run; proc transpose data=y_35 out=t_35 prefix=&v._35_; var &v._35; by run;
proc sort data=y_36; by run; proc transpose data=y_36 out=t_36 prefix=&v._36_; var &v._36; by run;
proc sort data=y_37; by run; proc transpose data=y_37 out=t_37 prefix=&v._37_; var &v._37; by run;
proc sort data=y_38; by run; proc transpose data=y_38 out=t_38 prefix=&v._38_; var &v._38; by run;
proc sort data=y_39; by run; proc transpose data=y_39 out=t_39 prefix=&v._39_; var &v._39; by run;
proc sort data=y_40; by run; proc transpose data=y_40 out=t_40 prefix=&v._40_; var &v._40; by run;
proc sort data=y_41; by run; proc transpose data=y_41 out=t_41 prefix=&v._41_; var &v._41; by run;
proc sort data=y_42; by run; proc transpose data=y_42 out=t_42 prefix=&v._42_; var &v._42; by run;
proc sort data=y_43; by run; proc transpose data=y_43 out=t_43 prefix=&v._43_; var &v._43; by run;
proc sort data=y_44; by run; proc transpose data=y_44 out=t_44 prefix=&v._44_; var &v._44; by run;
proc sort data=y_45; by run; proc transpose data=y_45 out=t_45 prefix=&v._45_; var &v._45; by run;
proc sort data=y_46; by run; proc transpose data=y_46 out=t_46 prefix=&v._46_; var &v._46; by run;


proc sort data=y_26_31; by run; proc transpose data=y_26_31 out=t_26_31 prefix=&v._26_31_; var &v._26_31; by run;
proc sort data=y_26_46; by run; proc transpose data=y_26_46 out=t_26_46 prefix=&v._26_46_; var &v._26_46; by run;
proc sort data=y_26_76; by run; proc transpose data=y_26_76 out=t_26_76 prefix=&v._26_76_; var &v._26_76; by run;


data &v ; merge y_25 t_26 t_27 t_28 t_29 t_30 t_31 t_32 t_33 t_34 t_35 t_36 t_37 t_38 t_39 t_40 t_41 t_42 t_43 t_44
t_45 t_46 t_76 t_26_31 t_26_46 t_26_76;  

%mend var;

%var(v=n_alive_m);		 	%var(v=n_alive_w);			%var(v=n_alive);			%var(v=n_hivge15m);		%var(v=n_hivge15w);		    %var(v=n_hivge15_);
%var(v=prevalence1549m); 	%var(v=prevalence1549w);	%var(v=prevalence1549_); 	%var(v=incidence1549_); %var(v=incidence1549w); 	%var(v=incidence1549m);
%var(v=p_onart);		 	%var(v=p_onart_m);			%var(v=p_onart_w);			%var(v=n_onart);		%var(v=n_onart_m);			%var(v=n_onart_w);

%var(v=n_new_inf);

%var(v=p_diag);	 		 	%var(v=p_diag_m); 			%var(v=p_diag_w);  			%var(v=p_onart_diag);   %var(v=p_onart_diag_m);   	%var(v=p_onart_diag_w);  
%var(v=p_onart_vl1000_);	%var(v=p_onart_vl1000_m);	%var(v=p_onart_vl1000_w);	%var(v=n_onprep_w);		%var(v=n_onprep_m);			%var(v=n_onprep);
%var(v=prop_elig_on_prep);	%var(v=n_prep_ever);		

%var(v=n_sw_1564_);			%var(v=n_sw_1549_);			%var(v=p_w_1564_sw);		%var(v=p_w_1549_sw);	%var(v=prevalence_1564sw);	%var(v=incidence_1564sw);
%var(v=p_onprep_sw);		%var(v=n_onprep_sw);

%var(v=n_msm_1564_);		%var(v=p_m_msm);			%var(v=prevalence1549_msm);	%var(v=incidence_msm);	%var(v=p_onprep_msm);		%var(v=n_onprep_msm);
%var(v=n_agyw);				%var(v=p_w_agyw);			%var(v=prevalence_agyw);	%var(v=incidence_agyw);	%var(v=p_onprep_agyw);		%var(v=n_onprep_agyw);

%var(v=n_death_hivrel);		%var(v=n_death_hivrel_m);	%var(v=n_death_hivrel_w);
%var(v=n_death_discount);	%var(v=d_n_new_inf);

%var(v=dcost);	%var(v=ddaly);	%var(v=cost);

	 

data wide_outputs;merge
n_alive_m		 	n_alive_w			n_alive				n_hivge15m		n_hivge15w		    n_hivge15_
prevalence1549m 	prevalence1549w		prevalence1549_ 	incidence1549_ 	incidence1549w	 	incidence1549m
p_onart		 		p_onart_m			p_onart_w			n_onart			n_onart_m			n_onart_w

n_new_inf

p_diag	 		 	p_diag_m 			p_diag_w  			p_onart_diag  	p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	n_onprep_w		n_onprep_m			n_onprep
prop_elig_on_prep	n_prep_ever		

n_sw_1564_			n_sw_1549_			p_w_1564_sw			p_w_1549_sw		prevalence_1564sw	incidence_1564sw
p_onprep_sw			n_onprep_sw

n_msm_1564_			p_m_msm				prevalence1549_msm	incidence_msm	p_onprep_msm		n_onprep_msm
n_agyw				p_w_agyw			prevalence_agyw		incidence_agyw	p_onprep_agyw		n_onprep_agyw

n_death_hivrel		n_death_hivrel_m	n_death_hivrel_w	n_death_discount	 d_n_new_inf

dcost ddaly cost
;

proc sort; by run;run;


data a.wide_gen_mlw_18_02_2026;
set wide_outputs  ;  
by run;run; 
