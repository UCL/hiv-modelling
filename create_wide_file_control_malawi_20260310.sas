* Note this create wide file combines runs for the worst case scenario only ;

* options user="/folders/myfolders/";

ods html close;

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_malawi\mlw_control_20260310_out\";


* Define var list needed to create costs and outputs ;
%let keep_var_list = 
/* for scaling */
run cald option s_alive_m s_alive_w
/* for costs */
s_tested		s_self_tested	s_diag			s_onart			s_prep_oral		s_prep_cab		s_prep_len		s_new_vmmc		s_sw_program_visit		s_alive1549_msm
/* for grouping outputs by age */
s_mcirc_1519m	s_mcirc_2024m	s_mcirc_2529m	s_mcirc_3034m	s_mcirc_3539m	s_mcirc_4044m	s_mcirc_4549m	
s_vmmc1519m		s_vmmc2024m		s_vmmc2529m		s_vmmc3034m		s_vmmc3539m		s_vmmc4044m		s_vmmc4549m
s_hiv1519m		s_hiv2024m
s_hiv1519w		s_hiv2024w
s_hiv1564m		s_hiv6569m		s_hiv7074m		s_hiv7579m		s_hiv8084m		s_hiv85plm
s_hiv1564w		s_hiv6569w		s_hiv7074w		s_hiv7579w		s_hiv8084w		s_hiv85plw
s_ageg1519m		s_ageg2024m		s_ageg2529m		s_ageg3034m		s_ageg3539m		s_ageg4044m		s_ageg4549m
s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		s_ageg85plm
s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		s_ageg85plw
s_onart_m5054_	s_onart_m5559_	s_onart_m6064_	s_onart_m6569_	s_onart_m7074_	s_onart_m7579_	s_onart_m8084_	s_onart_m85pl_
s_onart_w5054_	s_onart_w5559_	s_onart_w6064_	s_onart_w6569_	s_onart_w7074_	s_onart_w7579_	s_onart_w8084_	s_onart_w85pl_
/* for HIV control outputs */
s_ageg1m		s_ageg1w		s_alive1549_m	s_ageg1m		s_alive1549_w	s_ageg1w
s_ageg5054m		s_ageg5559m		s_ageg6064m		s_ageg6569m		s_ageg7074m		s_ageg7579m		s_ageg8084m		s_ageg85plm
s_ageg5054w		s_ageg5559w		s_ageg6064w		s_ageg6569w		s_ageg7074w		s_ageg7579w		s_ageg8084w		s_ageg85plw
s_sw_1564		s_alive_msm
s_hiv1549m		s_hiv1549w		s_hiv_sw		s_hiv_msm
s_diag_m_1524	s_diag_m_2549	s_diag_m_50pl	s_diag_w_1524	s_diag_w_2549	s_diag_w_50pl	s_diag_sw		s_diag_msm
s_onart_m		s_onart_w		
s_onart_m1519_	s_onart_m2024_	s_onart_m2529_	s_onart_m3034_	s_onart_m3539_	s_onart_m4044_	s_onart_m4549_
s_onart_w1519_	s_onart_w2024_	s_onart_w2529_	s_onart_w3034_	s_onart_w3539_	s_onart_w4044_	s_onart_w4549_
s_onart_sw		s_onart_msm
s_vl1000_art_1524_m		s_vl1000_art_2549_m		s_vl1000_art_50pl_m
s_vl1000_art_1524_w		s_vl1000_art_2549_w		s_vl1000_art_50pl_w
s_vl1000_art_sw			s_vl1000_art_msm
s_birth					s_give_birth_with_hiv
s_dead1519m_all	s_dead2024m_all	s_dead2529m_all	s_dead3034m_all	s_dead3539m_all	s_dead4044m_all	s_dead4549m_all	
s_dead5054m_all	s_dead5559m_all	s_dead6064m_all	s_dead6569m_all	s_dead7074m_all	s_dead7579m_all	s_dead8084m_all	s_dead85plm_all
s_dead1519w_all	s_dead2024w_all	s_dead2529w_all	s_dead3034w_all	s_dead3539w_all	s_dead4044w_all	s_dead4549w_all	
s_dead5054w_all	s_dead5559w_all	s_dead6064w_all	s_dead6569w_all	s_dead7074w_all	s_dead7579w_all	s_dead8084w_all	s_dead85plw_all
s_death_hiv_age_1524_m	s_death_hiv_age_2549_m	s_death_hiv_age_50pl_m
s_death_hiv_age_1524_w	s_death_hiv_age_2549_w	s_death_hiv_age_50pl_w
s_birth_with_inf_child	s_child_infected_breastfeeding
s_primary1519m	s_primary2024m	s_primary1549m	s_primary5054m	s_primary5559m	s_primary6064m
s_primary1519w	s_primary2024w	s_primary1549w	s_primary5054w	s_primary5559w	s_primary6064w
s_primary_sw	s_primary_msm
s_yllag_hiv_m	s_yllag_hiv_w	s_live_daly
s_onprep_m		s_onprep_w		s_onprep_sw		s_onprep_msm	s_prep_any_agyw_pg		s_agyw_pg
s_elig_prep_any_m_1564			s_elig_prep_any_w_1564			s_primary_prep_elig
/* for graphs */
s_sw_1549		s_prep_any_agyw_plw		s_agyw_plw
s_prep_oral_agyw_pg		s_prep_len_agyw_pg		s_prep_oral_agyw_plw		s_prep_len_agyw_plw
s_onprep_oral_m			s_onprep_len_m			s_onprep_oral_w				s_onprep_len_w				
s_prep_oral_sw			s_prep_len_sw			s_onprep_oral_msm			s_onprep_len_msm
s_elig_prep_any_sw		s_elig_prep_any_w_1549	s_elig_prep_any_w_1564		s_elig_prep_any_msm_1564
s_tested_m				s_tested_f				s_tested_anc_prevdiag
s_self_tested_m			s_self_tested_w			s_tested_due_to_self_test
s_primary1549			s_alive1549				s_hiv1549					s_primary
s_alive1564				s_hiv1564
s_newp_ge1				s_newp_ge5				s_newp						s_ep
s_m_npge1				s_w_npge1				s_alive1564_m				s_alive1564_w
s_diag_msm_age1564
;

/*%put &keep_var_list;*/


/*

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_malawi\mlw_control_20260310_out\";

data g1; set a.out1:(keep=&keep_var_list); if not missing(cald);
data g2; set a.out2:(keep=&keep_var_list); if not missing(cald);
data g3; set a.out3:(keep=&keep_var_list); if not missing(cald);
data g4; set a.out4:(keep=&keep_var_list); if not missing(cald);
data g5; set a.out5:(keep=&keep_var_list); if not missing(cald);
data g6; set a.out6:(keep=&keep_var_list); if not missing(cald);
data g7; set a.out7:(keep=&keep_var_list); if not missing(cald);
data g8; set a.out8:(keep=&keep_var_list); if not missing(cald);
data g9; set a.out9:(keep=&keep_var_list); if not missing(cald); 
run;

data g;
	set g1 g2 g3 g4 g5 g6 g7 g8 g9 ;
run;


data a.g;   
	set g;
run;

*/

ods listing;


data g; 
	set a.g;
run;



proc sort data=g; 			* Can omit this if using proc sql to merge;
	by run cald option;
run;

proc freq data=g; table option; where cald=2023.75; run;	* option 0 only;
proc freq data=g; table option; where cald=2024; run;		* option 13 only (worst case);



* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
*Malawi;
* 20.4 million in 2022.5, 58.1% are >=15);

data sf;
	set g;
	where cald=2024;

	s_alive = s_alive_m + s_alive_w ;
	sf_2024 = (20000000 * 0.58) / s_alive;  * 57% of malawi population in 2019 >= age 15 ;
	sf = sf_2024;
	keep run sf sf_2024;
run;

proc sort data=sf; 
	by run;
run;


/*
* alternative merge - avoids sorting g and sf;
proc sql;
    create table y as
    select a.*, b.sf, b.sf_2022
    from g as a
    left join sf as b
    on a.run = b.run;
quit;
*/




data y; 
merge g sf;
by run ; 





* ================================================================================= ;

* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* ts1m - this code needs to change for ts1m;

%let year_start_disc=2025  ; * year_interv + 1;
discount_3py = min(1, 1/(1.03**(cald-&year_start_disc)));	* Value = 1 before year_interv;
discount_10py = min(1, 1/(1.10**(cald-&year_start_disc)));
*The following can be changed if we want instead 10% discount rate;
%let discount=discount_3py;






* ================================================================================= ;

* costs ;

* ================================================================================= ;


* Adjustments to costs for Malawi - HIV Control ;
* Original costs in 000s of USD;
* Use costs provided in spreadsheet unit_cost-kp_cvg-2025-07-14_draft;
* Updated Jan 26;

* NB 
1. *4 to get annual cost for each time step (because we take the mean over several 3-month time steps) for testing and VMMC only (item-based costs) 
2. *sf to scale up to Malawi population size
3. total cost required for output spreadsheet so do not /1e6

Order of adding interventions:
	0 = Minimal 
	1 =  + condoms
	2 =  + vmmc
	3 =  + fsw-prep-mix
	4 =  + adh-supp
	5 =  + msm-program
	6 =  + fsw-program
	7 =  + agyw-prep-mix
	8 =  + msm-prep-mix
	9 =  + testing
	99 = status quo
;

%include "C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Malawi_costs.sas";
/*%put &cost_VMMC;*/


* Testing;
cost_test = s_tested * &cost_per_facility_test * 4 * sf;			* Using facility-based testing cost for all test costs;
dcost_test = cost_test * &discount;

cost_self_test = s_self_tested * &cost_per_self_test * 4 * sf;
dcost_self_test = cost_self_test * &discount;

* ART;
cost_art = s_onart * &cost_art_pppy * sf;							* Using one ART cost for all ART;	* removed  * 4 ;
dcost_art = cost_art * &discount;

* PMTCT;
* The PMTCT cost provided is for ANC testing. This is the same cost as facility-based testing so will be included in the total testing cost above;

* Condoms;
* Cost applies to all interventions except minimal;
cost_condoms = 0; if option ne 0 then cost_condoms = &cost_condom_py;		* Fixed population-level py cost so scaling not needed;
dcost_condoms = cost_condoms * &discount;

* PrEP;
* NB only LEN-PrEP is introduced in the injectable PrEP scenarios;
* Omitting VR PrEP costs;
* Omitting PrEP clinic costs as these are incorporated in the PPPY costs;
cost_prep_oral = s_prep_oral * &cost_prep_oral_pppy * sf;		* removed  * 4 ;
cost_prep_cab = s_prep_cab * &cost_prep_cab_pppy * sf;			* removed  * 4 ;
cost_prep_len = s_prep_len * &cost_prep_len_pppy * sf;			* removed  * 4 ;

dcost_prep_oral = cost_prep_oral * &discount;
dcost_prep_cab = cost_prep_cab * &discount;
dcost_prep_len = cost_prep_len * &discount;

cost_prep_tot = cost_prep_oral + cost_prep_cab + cost_prep_len;
dcost_prep_tot = dcost_prep_oral + dcost_prep_cab + dcost_prep_len;

* VMMC;
* Use 10-49;
cost_vmmc = 	s_new_vmmc * &cost_VMMC_per_procedure * 4 * sf;				* Replacing original s_cost_circ because that does not include VMMC for age 10-14;
dcost_vmmc = 	cost_vmmc * &discount;

* FSW and MSM services;
* MSM services cost applies to option 5 onwards;
cost_fsw_services = s_sw_program_visit * &cost_FSW_services_pppy * sf;		* removed  * 4 ;
cost_msm_services = 0; if option ge 5 then cost_msm_services = s_alive1549_msm / 2 * &cost_MSM_services_pppy * sf;			* removed  * 4 ;	
	* Assumes 50% of 15-49 year-old MSM are reached by MSM services? - to discuss ;

dcost_fsw_services = cost_fsw_services * &discount;
dcost_msm_services = cost_msm_services * &discount;

* Adherence support;
* Cost applies to option 4 onwards;
cost_adh_support = 0; if option ge 4 then cost_adh_support = s_diag * &cost_AdhSupp_pppy * sf;		* Assumes the cost is applied to everyone diagnosed (changed from on ART Feb 26);	* removed  * 4 ;
dcost_adh_support = cost_adh_support * &discount;

total_cost_hiv_control =	sum( cost_test,  cost_self_test,  cost_art,  cost_condoms,  cost_prep_tot,  cost_vmmc,  cost_fsw_services,  cost_msm_services,  cost_adh_support);
total_dcost_hiv_control = 	sum(dcost_test, dcost_self_test, dcost_art, dcost_condoms, dcost_prep_tot, dcost_vmmc, dcost_fsw_services, dcost_msm_services, dcost_adh_support);





* ================================================================================= ;


* derived variables relating to population, not only those with hiv ;

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
* n_sw_1549;					n_sw_1549 = s_sw_1549 * sf;
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
* n_onprep_oral_sw;				n_onprep_oral_sw = s_prep_oral_sw * sf;		* NB different notation to other prep outputs;
* n_onprep_len_sw;				n_onprep_len_sw = s_prep_len_sw * sf;		* NB different notation to other prep outputs;
* n_onprep_oral_msm;			n_onprep_oral_msm = s_onprep_oral_msm * sf;
* n_onprep_len_msm;				n_onprep_len_msm = s_onprep_len_msm * sf;

* n_elig_prep_any_sw;			n_elig_prep_any_sw = s_elig_prep_any_sw * sf;
* n_elig_prep_w_1549_;			n_elig_prep_w_1549_ = s_elig_prep_any_w_1549 * sf;
* n_elig_prep_w_1564_;			n_elig_prep_w_1564_ = s_elig_prep_any_w_1564 * sf;
* n_elig_prep_any_msm_1564_;	n_elig_prep_any_msm_1564_ = s_elig_prep_any_msm_1564 * sf;

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

* n_diag_sw;					n_diag_sw = s_diag_sw * sf;
* n_diag_msm_age1564_;			n_diag_msm_age1564_ = s_diag_msm_age1564 * sf;
* n_undiag_sw;					n_undiag_sw = n_sw_1564 - n_diag_sw;
* n_undiag_msm;					n_undiag_msm = n_alive_msm - n_diag_msm_age1564_;
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
n_daly			total_cost_hiv_control			p_mcirc_1549m			n_sw_program_visit
n_circumcised_15_24_m			n_onprep_agyw_pg		n_agyw_pg	/* added Sept 2025 */

/*Extra outputs for calibration*/	/* added Sept 2025 */
/* Stocks */
n_sw_1549
n_onprep_agyw_plw				n_agyw_plw
n_onprep_oral_agyw_pg			n_onprep_len_agyw_pg			n_onprep_oral_agyw_plw				n_onprep_len_agyw_plw
n_onprep_oral_m					n_onprep_len_m					n_onprep_oral_w						n_onprep_len_w
n_onprep_oral_sw				n_onprep_len_sw					n_onprep_oral_msm					n_onprep_len_msm
n_elig_prep_any_sw				n_elig_prep_w_1549_				n_elig_prep_w_1564_					n_elig_prep_any_msm_1564_

n_tested_m						n_tested_w
n_self_tested_m					n_self_tested_w					n_tested_due_to_self_test

/* Flows */
incidence1549					incidence1549w					incidence1549m						incidence1564
p_newp_ge1						p_newp_ge5						av_newp_ge1							p_ep
p_m_npge1_						p_w_npge1_
p_mcirc_1524m
n_diag_sw						n_undiag_sw
n_diag_msm_age1564_				n_undiag_msm

/* Check costs */
total_dcost_hiv_control
cost_test	cost_self_test	cost_art	cost_condoms	cost_prep_tot	cost_vmmc	cost_fsw_services	cost_msm_services	cost_adh_support
dcost_test	dcost_self_test	dcost_art	dcost_condoms	dcost_prep_tot	dcost_vmmc	dcost_fsw_services	dcost_msm_services	dcost_adh_support
;
run;



data a.long_mlw_control; 
	set y;
run;

/*proc contents data = a.long_mlw_control; run;*/
/*proc freq data=a.long_mlw_control; table option;run;*/






************************************************************************************************************************************************************;
** GENERATE OUTPUTS FOR HIV CONTROL SPREADSHEET;
************************************************************************************************************************************************************;

/*
OPTIONS
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
13 = worst case

99 = status quo
*/


* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Variable lists;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

* Define lists of variables that we need to run in the macros and keep as outputs;

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
** Load data and update variable names for outputs;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

data y; set a.long_mlw_control; 

	year_stock=floor(cald);			* calendar year variable to group stocks when calculating means;
	year_flow=floor(cald+0.25);		* mid-year to mid-year variable to group flows when calculating means (.75 - .5);


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
	TotalCost_Undiscounted = total_cost_hiv_control;
	Percent_circumcised = p_mcirc_1549m * 100;
	Percent_condom_use_GP = .; /* (1 - (p_m_npge1_ + p_w_npge1_) / 2) * 100;	* Estimate is percent of population with no condomless sex (mean m and w); */
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

	year_stock
	year_flow

	&stock_list
	&flow_list
	;
run;
 
 options nomprint;
 option nospool;




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Set option number here;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

%let op_num=13;



* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** proc means for all stocks and flows;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

proc means noprint data=y;
    /* Filter data by calendar year and option */
    where (cald < 2024 and option = 0)				/* option 0 from 1984 to end 2023 */
       or (cald >= 2024 and option = &op_num);		/* option &op_num from 2024 onwards */
       
    /* Group by year_stock */
    class year_stock;

    /* Specify the list of variables */
    var &stock_list;

    /* Output means into a new dataset, keeping only means and grouping vars */
    output out=stock_means(drop=_type_ _freq_)
        mean=;
run;

data stock_means; 
	set stock_means; if not missing(year_stock);
	year = year_stock;								/* replace column year_stock with year */
	drop year_stock;
run;


proc means noprint data=y;
    /* Filter data by calendar year and option */
    where (cald < 2024 and option = 0)				/* option 0 from 1984 to end 2023 */
       or (cald >= 2024 and option = &op_num);		/* option &op_num from 2024 onwards */
       
    /* Group by year_stock */
    class year_flow;

    /* Specify the list of variables */
    var &flow_list;

    /* Output means into a new dataset, keeping only means and grouping vars */
    output out=flow_means(drop=_type_ _freq_)
        mean=;
run;

data flow_means; 
	set flow_means; if not missing(year_flow);
	year = year_flow;								/* replace column year_flow with year */
	drop year_flow;
run;




* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
** Save outputs;
* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;

data outputs_&op_num; 
	retain year &keep_vars_in_order;				/* sort variables into order needed for output spreadsheet */
	merge stock_means flow_means;
	by year;
	if year >= 1985;								/* keep only year 1985 onwards */
run;

proc transpose data=outputs_&op_num out=outputs_&op_num; run;			/* transpose to change outputs from columns to rows */

proc export data=outputs_&op_num										/* export to csv in output folder */
	outfile= "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_malawi\mlw_control_20260310_out\outputs_&op_num..csv" 
	dbms=csv replace; 
	putnames=no;
run;


