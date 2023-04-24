/*
* Matt's local machine input;
libname a "C:\Users\sf124046\Box\1.sapphire_modelling\synthesis\";
data hiv_synthesis_base; set a.out:;
*/
* Myriad input;
%let sasoutputdir = %scan(&sysparm,1," ");
libname a "&sasoutputdir/";
%let sasfile = %scan(&sysparm,2," ");
data hiv_synthesis_base; set a.out:;


/* proc contents; run;
* proc print; var cald s_hiv1549; run; */

/** show the contents of the input SAS file */
* proc contents data=a.hiv_synthesis_base;
*	title "Compressed SAS Input Data"
*run;
/*
proc freq; tables run; run;
proc print; var run cald option prevalence1549 incidence1549; where run = 94069056 ; run;  
*/
if run=. then delete; 
proc sort data=hiv_synthesis_base; 
by run cald option;run;


***THIS DATASTEP CALCUATES THE SCALE FACTOR;
data sf;
set hiv_synthesis_base ;

if cald=2023; ***Update as required;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = 10000000 / s_alive; ***If calibrating to a specific setting, change 10000000 to desired 15+ population size;
keep run sf_2023;
proc sort; by run;run;

%let sf=sf_2023;

data y; 
merge hiv_synthesis_base sf;

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

s_ddaly = s_dead_ddaly + s_live_ddaly;

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

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; 

dclin_cost = dadc_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost;

* HYPERTENSION COSTS;
htn_cost_scr = s_htn_cost_scr * 4 / 1000 * &sf; *standardized to population of 10,000,000;
htn_cost_drug = s_htn_cost_drug * 4 / 1000 * &sf; *standardized to population of 10,000,000;
htn_cost_clin = s_htn_cost_clin * 4 / 1000 * &sf; *standardized to population of 10,000,000;
htn_cost_cvd = s_htn_cost_cvd * 4 / 1000 * &sf; *standardized to population of 10,000,000;
htn_cost_total = (htn_cost_scr + htn_cost_drug + htn_cost_clin + htn_cost_cvd) ; 

dhtn_cost_scr = s_dhtn_cost_scr * 4 / 1000 * &sf; *standardized to population of 10,000,000;
dhtn_cost_drug = s_dhtn_cost_drug * 4 / 1000 * &sf; *standardized to population of 10,000,000;
dhtn_cost_clin = s_dhtn_cost_clin * 4 / 1000 * &sf; *standardized to population of 10,000,000;
dhtn_cost_cvd = s_dhtn_cost_cvd * 4 / 1000 * &sf; *standardized to population of 10,000,000;
dhtn_cost_total = (dhtn_cost_scr + dhtn_cost_drug + dhtn_cost_clin + dhtn_cost_cvd) ; 
dhtn_cost_drughalf = dhtn_cost_drug / 2 ;
dhtn_cost_drugdoub = dhtn_cost_drug * 2 ;
dhtn_cost_totdrughalf = (dhtn_cost_scr + dhtn_cost_drughalf + dhtn_cost_clin + dhtn_cost_cvd) ; 
dhtn_cost_totdrugdoub = (dhtn_cost_scr + dhtn_cost_drugdoub + dhtn_cost_clin + dhtn_cost_cvd) ; 
dhtn_cost_tothalf = dhtn_cost_total / 2 ;
dhtn_cost_totdoub = dhtn_cost_total * 2 ;

dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

***Will need to add the cost of VG when included in HIV Synthesis;
dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj + 
		dcost_sw_program +
		dhtn_cost_total;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost +
				  dres_cost + d_t_adh_int_cost + dswitchline_cost + 
				  dhtn_cost_total; 

***This reverses the discount (if needed);
cost_clin_care = dcost_clin_care / discount;

cost = dcost / discount;

* ================================================================================= ;
* ================================================================================= ;


***ADD PROJECT SPECIFIC VARIABLES HERE;


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

* p_age1549_hiv ; 				p_age1549_hiv = (s_hiv1549m + s_hiv1549w) / s_hivge15 ;
* p_age1549_hivneg ;			p_age1549_hivneg = ((s_alive1549_w + s_alive1549_m) - (s_hiv1549m + s_hiv1549w)) / ((s_alive_m + s_alive_w) - s_hivge15);

* s_alive;						s_alive = s_alive_m + s_alive_w ;
* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; log_gender_r_newp  = log(gender_r_newp);

* p_newp_ge1;					p_newp_ge1 = s_newp_ge1 / s_alive1564 ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* av_newp_ge1;					av_newp_ge1 = s_newp / s_newp_ge1 ;

* av number of newp amongst people with newp ge 1, exlcuding sw;
* av_newp_ge1_non_sw;			av_newp_ge1_non_sw = (s_newp - s_newp_sw) / (s_newp_ge1 - (s_sw_newp_cat2 + s_sw_newp_cat3 +s_sw_newp_cat4 +s_sw_newp_cat5));


* p_newp_ge1_age1549;			p_newp_ge1_age1549 = (s_w1549_newp_ge1 + s_m1549_newp_ge1) / (s_alive1549_w + s_alive1549_m) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_m1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_npge2_l4p_1549m ;			p_npge2_l4p_1549m = s_npge2_l4p_1549m / s_alive1549_m ;
* p_npge2_l4p_1549w ;			p_npge2_l4p_1549w = s_npge2_l4p_1549w / s_alive1549_w ;


* n_sw_1564;					n_sw_1564 = s_sw_1564 * &sf;
* n_sw_1549;					n_sw_1549 = s_sw_1549 * &sf;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* rate_susc_np_1549_m;			*rate_susc_np_1549_m = s_susc_newp_1549_m / (s_alive1549_m - s_hiv1549m);
* rate_susc_np_1549_w;			*rate_susc_np_1549_w = s_susc_newp_1549_w / (s_alive1549_w - s_hiv1549w);
* rate_susc_np_ic_1549_m;		*rate_susc_np_ic_1549_m = s_susc_newp_inc_circ_1549_m / (s_alive1549_m - s_hiv1549m);  * circumcised count as not susceptible;

* mean_num_tests_ly_m1549_;		*mean_num_tests_ly_m1549_ = s_tested_ly_m1549_ / (s_alive1549_m  - s_hiv1549m) ;
* mean_num_tests_ly_w1549_;		*mean_num_tests_ly_w1549_ = s_tested_ly_w1549_ / (s_alive1549_w  - s_hiv1549w) ;

* n_tested_m;					n_tested_m = s_tested_m * &sf * 4;
* n_tested_sw;					n_tested_sw = s_tested_sw * &sf * 4;
* n_tested;						n_tested = s_tested * &sf * 4;

* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

* p_mcirc;						p_mcirc = s_mcirc / s_alive1564_m ;
* p_mcirc_1519m;				p_mcirc_1519m = s_mcirc_1519m / s_ageg1519m ;
* p_mcirc_2024m;				p_mcirc_2024m = s_mcirc_2024m / s_ageg2024m ;
* p_mcirc_2529m;				p_mcirc_2529m = s_mcirc_2529m / s_ageg2529m ;
* p_mcirc_3034m;				p_mcirc_3034m = s_mcirc_3034m / s_ageg3034m ;
* p_mcirc_3539m;				p_mcirc_3539m = s_mcirc_3539m / s_ageg3539m ;
* p_mcirc_4044m;				p_mcirc_4044m = s_mcirc_4044m / s_ageg4044m ;
* p_mcirc_4549m;				p_mcirc_4549m = s_mcirc_4549m / s_ageg4549m ;
* p_mcirc_5064m;				p_mcirc_5064m = s_mcirc_5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;

* p_vmmc;						p_vmmc = s_vmmc / s_alive1564_m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_5064m;					p_vmmc_5064m = s_vmmc5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive1564_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive1564_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then  
								prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp = s_sw_newp/s_sw_1564;
* prep;

* proportion of those on prep who have ge 1 newp in the period ;
* p_prep_newp ;					if s_prep > 0 then p_prep_newp = (s_newp_this_per_hivneg_m_prep + s_newp_this_per_hivneg_w_prep) / s_prep ; 
* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;

* p_prep_elig_past_year;		p_prep_elig_past_year = s_prep_elig_past_year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* p_prep_elig_past_5year;		p_prep_elig_past_5year = s_prep_elig_past_5year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* mean_newp_ppers_prep;			if s_prep > 0 then mean_newp_ppers_prep = s_prep_newp / s_prep ;

* prop_onprep_newpge1;			if s_prep > 0 then prop_onprep_newpge1 = (s_prep_newpg1 + s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep ;
* prop_onprep_newpge2;			if s_prep > 0 then prop_onprep_newpge2 = (s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep ;
* prop_onprep_newpge3;			if s_prep > 0 then prop_onprep_newpge3 = (s_prep_newpg3 + s_prep_newpg4)/ s_prep ;


* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;
* prop_elig_on_prep;			if s_elig_prep > 0 then prop_elig_on_prep = s_prep / s_elig_prep ; 
* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;
* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;
* prop_1564_hivneg_onprep;		prop_1564_hivneg_onprep =   max((s_prep-s_hiv1_prep), 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;

* p_elig_prep;   				p_elig_prep = s_elig_prep / (s_alive1564 - s_hiv1564);
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;


* n_prep;						n_prep = s_prep * &sf;
* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep * &sf;
* p_hiv1_prep;					if s_prep gt 0 then p_hiv1_prep = s_hiv1_prep / s_prep ;

* n_prep_ever;					n_prep_ever = s_prep_ever * &sf;
* p_prep_ever;					p_prep_ever = s_prep_ever / (s_alive1564_w + s_alive1564_m) ;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_w_1524  * &sf;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_w_2534  * &sf;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_w_3544  * &sf;
* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_w_1524       * &sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_w_2534       * &sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_w_3544  * &sf;

* av_prep_eff_non_res_v;  		if s_prep > 0 then av_prep_eff_non_res_v = s_prep_effectiveness_non_res_v / s_prep;								  
																			 
* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				if s_prep gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

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

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

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


* derived variables relating to people with hiv ;
								if s_primary gt 0 then do;
* p_inf_vlsupp ;				p_inf_vlsupp = s_inf_vlsupp   / s_primary;
* p_inf_newp ;					p_inf_newp = s_inf_newp / s_primary;
* p_inf_ep ;					p_inf_ep = s_inf_ep   / s_primary;
* p_inf_diag ;					p_inf_diag = s_inf_diag   / s_primary;
* p_inf_naive ; 				p_inf_naive = s_inf_naive / s_primary;
* p_inf_primary ;				p_inf_primary = s_inf_primary / s_primary;

*The meaning of the following is: among newly infected people, which proportion are SW, etc..;
* p_sw_newinf;				    p_sw_newinf = s_primary_sw / s_primary;		
* p_w1524_newinf;				p_w1524_newinf = sum(s_primary1519w,s_primary2024w) / s_primary;
* p_w25ov_newinf;				p_w25ov_newinf = sum(s_primary2529w,s_primary3034w,s_primary3539w,s_primary4044w,s_primary4549w,s_primary5054w,s_primary5559w,s_primary6064w) / s_primary;		
* p_m1524_newinf;				p_m1524_newinf = sum(s_primary1519m,s_primary2024m) / s_primary;
* p_m25ov_newinf;				p_m25ov_newinf = sum(s_primary2529m,s_primary3034m,s_primary3539m,s_primary4044m,s_primary4549m,s_primary5054m,s_primary5559m,s_primary6064m) / s_primary;		
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
* p_vl1000_art_12m_onart;		if s_art_12m_onart > 0 then p_vl1000_art_12m_onart = s_vl1000_art_12m_onart / s_art_12m_onart ;

* p_onart_m_age50pl;			p_onart_m_age50pl = s_onart_m50pl / (s_onart_m1549_ + s_onart_m50pl);
* p_onart_w_age50pl;			p_onart_w_age50pl = s_onart_w50pl / (s_onart_w1549_ + s_onart_w50pl);

* prevalence_vg1000;			if s_alive1564 > 0 then prevalence_vg1000 = s_vg1000 / s_alive1564;
* prev_vg1000_newp_m;			prev_vg1000_newp_m = (s_i_m_newp - s_i_vl1000_m_newp) /  s_m_newp;
* prev_vg1000_newp_w;			prev_vg1000_newp_w = (s_i_w_newp - s_i_vl1000_w_newp) /  s_w_newp;
* r_efa_hiv;					if s_hiv1564 > 0 then r_efa_hiv = s_r_efa / s_hiv1564 ;
* p_dol_2vg1000_dolr1_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh0 = s_o_dol_2nd_vlg1000_dolr1_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr1_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr1_adh1 = s_o_dol_2nd_vlg1000_dolr1_adh1 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh0;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh0 = s_o_dol_2nd_vlg1000_dolr0_adh0 / s_o_dol_2nd_vlg1000 ;
* p_dol_2vg1000_dolr0_adh1;		if s_o_dol_2nd_vlg1000 > 0 then p_dol_2vg1000_dolr0_adh1 = s_o_dol_2nd_vlg1000_dolr0_adh1 / s_o_dol_2nd_vlg1000 ;

* p_iime;						p_iime = s_iime_ / s_hiv1564 ;
* p_pime;						p_pime = s_pime_ / s_hiv1564 ;
* p_nnme;						p_nnme = s_nnme_ / s_hiv1564 ;

* *HYPERTENSION* ;

* pop size;
pop1524 = s_ageg1517m + s_ageg1819m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg2024w ;
pop2534 = s_ageg2529m + s_ageg3034m + s_ageg2529w + s_ageg3034w ;
pop3544 = s_ageg3539m + s_ageg4044m + s_ageg3539w + s_ageg4044w ;
pop4554 = s_ageg4549m + s_ageg5054m + s_ageg4549w + s_ageg5054w ;
pop5564 = s_ageg5559m + s_ageg6064m + s_ageg5559w + s_ageg6064w ;
pop6574 = s_ageg6569m + s_ageg7074m +  + s_ageg6569w + s_ageg7074w ;
pop7584 = s_ageg7579m + s_ageg8084m + s_ageg7579w + s_ageg8084w;
popge85 = s_ageg85plm + s_ageg85plw;
popge18 = pop1524 + pop2534 + pop3544 + pop4554 + pop5564 + pop6574 + pop7584 + popge85 ; 

* p_hypert_ge18 ;			p_hypert_ge18 = s_hypertension_ge18 / (popge18) ;
* p_hypert_2534 ;			p_hypert_2534 = s_hypertension_2534 / (pop2534) ;
* p_hypert_3544 ;			p_hypert_3544 = s_hypertension_3544 / (pop3544) ;
* p_hypert_4554 ;			p_hypert_4554 = s_hypertension_4554 / (pop4554) ;
* p_hypert_5564 ;			p_hypert_5564 = s_hypertension_5564 / (pop5564) ;
* p_hypert_2544 ;			p_hypert_2544 = (s_hypertension_2534 + s_hypertension_3544) / (pop2534 + pop3544) ;
* p_hypert_4564 ;			p_hypert_4564 = (s_hypertension_4554 + s_hypertension_5564) / (pop4554 + pop5564) ;
* p_hypert_ge65 ;			p_hypert_ge65 = s_hypertension_ge65 / (pop6574 + pop7584 + popge85) ;

* p_htn_true_ge18 ;			p_htn_true_ge18 = s_htn_true_ge18 / (popge18) ;
* p_htn_true_2534 ;			p_htn_true_2534 = s_htn_true_2534 / (pop2534) ;
* p_htn_true_3544 ;			p_htn_true_3544 = s_htn_true_3544 / (pop3544) ;
* p_htn_true_4554 ;			p_htn_true_4554 = s_htn_true_4554 / (pop4554) ;
* p_htn_true_5564 ;			p_htn_true_5564 = s_htn_true_5564 / (pop5564) ;
* p_htn_true_2544 ;			p_htn_true_2544 = (s_htn_true_2534 + s_htn_true_3544) / (pop2534 + pop3544) ;
* p_htn_true_4564 ;			p_htn_true_4564 = (s_htn_true_4554 + s_htn_true_5564) / (pop4554 + pop5564) ;
* p_htn_true_ge65 ;			p_htn_true_ge65 = s_htn_true_ge65 / (pop6574 + pop7584 + popge85) ;

* p_diagnosed_hypert_ge18 ;	p_diagnosed_hypert_ge18 = s_dx_htn_ge18 / s_hypertension_ge18 ;
* p_diagnosed_hypert_2534 ;	p_diagnosed_hypert_2534 = s_dx_htn_2534 / s_hypertension_2534 ;
* p_diagnosed_hypert_3544 ;	p_diagnosed_hypert_3544 = s_dx_htn_3544 / s_hypertension_3544 ;
* p_diagnosed_hypert_4554 ;	p_diagnosed_hypert_4554 = s_dx_htn_4554 / s_hypertension_4554 ;
* p_diagnosed_hypert_5564 ;	p_diagnosed_hypert_5564 = s_dx_htn_5564 / s_hypertension_5564 ;
* p_diagnosed_hypert_2544 ;	p_diagnosed_hypert_2544 = (s_dx_htn_2534 + s_dx_htn_3544) / (s_hypertension_2534 + s_hypertension_3544) ;
* p_diagnosed_hypert_4564 ;	p_diagnosed_hypert_4564 = (s_dx_htn_4554 + s_dx_htn_5564) / (s_hypertension_4554 + s_hypertension_5564) ;
* p_diagnosed_hypert_ge65 ;	p_diagnosed_hypert_ge65 = s_dx_htn_ge65 / s_hypertension_ge65 ;

* p_dx_htn_true_ge18 ;	p_dx_htn_true_ge18 = s_htn_true_dx_ge18 / s_htn_true_ge18 ;
/* p_dx_htn_true_2534 ;	p_dx_htn_true_2534 = s_htn_true_dx_2534 / s_htn_true_2534 ;
* p_dx_htn_true_3544 ;	p_dx_htn_true_3544 = s_htn_true_dx_3544 / s_htn_true_3544 ;
* p_dx_htn_true_4554 ;	p_dx_htn_true_4554 = s_htn_true_dx_4554 / s_htn_true_4554 ;
* p_dx_htn_true_5564 ;	p_dx_htn_true_5564 = s_htn_true_dx_5564 / s_htn_true_5564 ; */
* p_dx_htn_true_2544 ;	p_dx_htn_true_2544 = (s_htn_true_dx_2534 + s_htn_true_dx_3544) / (s_htn_true_2534 + s_htn_true_3544) ;
* p_dx_htn_true_4564 ;	p_dx_htn_true_4564 = (s_htn_true_dx_4554 + s_htn_true_dx_5564) / (s_htn_true_4554 + s_htn_true_5564) ;
* p_dx_htn_true_ge65 ;	p_dx_htn_true_ge65 = s_htn_true_dx_ge65 / s_htn_true_ge65 ;

* p_dx_htn_over_ge18 ;	p_dx_htn_over_ge18 = s_htn_over_dx_ge18 / s_normotensive_ge18 ;
/* p_dx_htn_over_2534 ;	p_dx_htn_over_2534 = s_htn_over_dx_2534 / s_normotensive_2534 ;
* p_dx_htn_over_3544 ;	p_dx_htn_over_3544 = s_htn_over_dx_3544 / s_normotensive_3544 ;
* p_dx_htn_over_4554 ;	p_dx_htn_over_4554 = s_htn_over_dx_4554 / s_normotensive_4554 ;
* p_dx_htn_over_5564 ;	p_dx_htn_over_5564 = s_htn_over_dx_5564 / s_normotensive_5564 ; */
* p_dx_htn_over_2544 ;	p_dx_htn_over_2544 = (s_htn_over_dx_2534 + s_htn_over_dx_3544) / (s_normotensive_2534 + s_normotensive_3544) ;
* p_dx_htn_over_4564 ;	p_dx_htn_over_4564 = (s_htn_over_dx_4554 + s_htn_over_dx_5564) / (s_normotensive_4554 + s_normotensive_5564) ;
* p_dx_htn_over_ge65 ;	p_dx_htn_over_ge65 = s_htn_over_dx_ge65 / s_normotensive_ge65 ;

* p_on_anti_hypert_ge18 ;		p_on_anti_hypert_ge18 = s_on_tx_htn_ge18 / s_htn_true_ge18 ;
* p_on_anti_hypert_2534 ;		p_on_anti_hypert_2534 = s_on_tx_htn_2534 / s_htn_true_2534 ;
* p_on_anti_hypert_3544 ;		p_on_anti_hypert_3544 = s_on_tx_htn_3544 / s_htn_true_3544 ;
* p_on_anti_hypert_4554 ;		p_on_anti_hypert_4554 = s_on_tx_htn_4554 / s_htn_true_4554 ;
* p_on_anti_hypert_5564 ;		p_on_anti_hypert_5564 = s_on_tx_htn_5564 / s_htn_true_5564 ;
* p_on_anti_hypert_2544 ;		p_on_anti_hypert_2544 = (s_on_tx_htn_2534 + s_on_tx_htn_3544) / (s_htn_true_2534 + s_htn_true_3544) ;
* p_on_anti_hypert_4564 ;		p_on_anti_hypert_4564 = (s_on_tx_htn_4554 + s_on_tx_htn_5564) / (s_htn_true_4554 + s_htn_true_5564) ;
* p_on_anti_hypert_ge65 ;		p_on_anti_hypert_ge65 = s_on_tx_htn_ge65 / s_htn_true_ge65 ;

* p_ever_anti_hypert_ge18 ;		p_ever_anti_hypert_ge18 = s_ever_tx_htn_ge18 / s_htn_true_ge18 ;
* p_ever_anti_hypert_2544 ;		p_ever_anti_hypert_2544 = (s_ever_tx_htn_2534 + s_ever_tx_htn_3544) / (s_htn_true_2534 + s_htn_true_3544) ;
* p_ever_anti_hypert_4564 ;		p_ever_anti_hypert_4564 = (s_ever_tx_htn_4554 + s_ever_tx_htn_5564) / (s_htn_true_4554 + s_htn_true_5564) ;
* p_ever_anti_hypert_ge65 ;		p_ever_anti_hypert_ge65 = s_ever_tx_htn_ge65 / s_htn_true_ge65 ;

* p_on1drug_antihyp_ge18 ;		p_on1drug_antihyp_ge18 = s_on1drug_antihyp_ge18 / (s_on_tx_htn_ge18);
* p_on2drug_antihyp_ge18 ;		p_on2drug_antihyp_ge18 = s_on2drug_antihyp_ge18 / (s_on_tx_htn_ge18);
* p_on3drug_antihyp_ge18 ;		p_on3drug_antihyp_ge18 = s_on3drug_antihyp_ge18 / (s_on_tx_htn_ge18);
* p_on1drug_antihyp_2544 ;		p_on1drug_antihyp_2544 = (s_on1drug_antihyp_2534 + s_on1drug_antihyp_3544) / (s_on_tx_htn_2534 + s_on_tx_htn_3544);
* p_on2drug_antihyp_2544 ;		p_on2drug_antihyp_2544 = (s_on2drug_antihyp_2534 + s_on2drug_antihyp_3544) / (s_on_tx_htn_2534 + s_on_tx_htn_3544);
* p_on3drug_antihyp_2544 ;		p_on3drug_antihyp_2544 = (s_on3drug_antihyp_2534 + s_on3drug_antihyp_3544) / (s_on_tx_htn_2534 + s_on_tx_htn_3544);
* p_on1drug_antihyp_4564 ;		p_on1drug_antihyp_4564 = (s_on1drug_antihyp_4554 + s_on1drug_antihyp_5564) / (s_on_tx_htn_4554 + s_on_tx_htn_5564);
* p_on2drug_antihyp_4564 ;		p_on2drug_antihyp_4564 = (s_on2drug_antihyp_4554 + s_on2drug_antihyp_5564) / (s_on_tx_htn_4554 + s_on_tx_htn_5564);
* p_on3drug_antihyp_4564 ;		p_on3drug_antihyp_4564 = (s_on3drug_antihyp_4554 + s_on3drug_antihyp_5564) / (s_on_tx_htn_4554 + s_on_tx_htn_5564);
* p_on1drug_antihyp_ge65 ;		p_on1drug_antihyp_ge65 = s_on1drug_antihyp_ge65 / (s_on_tx_htn_ge65);
* p_on2drug_antihyp_ge65 ;		p_on2drug_antihyp_ge65 = s_on2drug_antihyp_ge65 / (s_on_tx_htn_ge65);
* p_on3drug_antihyp_ge65 ;		p_on3drug_antihyp_ge65 = s_on3drug_antihyp_ge65 / (s_on_tx_htn_ge65);

* p_hypert_control_ge18 ;		p_hypert_control_ge18 = s_htn_control_ge18 / s_htn_true_ge18 ;
* p_hypert_control_2534 ;		p_hypert_control_2534 = s_htn_control_2534 / s_htn_true_2534 ;
* p_hypert_control_3544 ;		p_hypert_control_3544 = s_htn_control_3544 / s_htn_true_3544 ;
* p_hypert_control_4554 ;		p_hypert_control_4554 = s_htn_control_4554 / s_htn_true_4554 ;
* p_hypert_control_5564 ;		p_hypert_control_5564 = s_htn_control_5564 / s_htn_true_5564 ;
* p_hypert_control_2544 ;		p_hypert_control_2544 = (s_htn_control_2534 + s_htn_control_3544) / (s_htn_true_2534 + s_htn_true_3544) ;
* p_hypert_control_4564 ;		p_hypert_control_4564 = (s_htn_control_4554 + s_htn_control_5564) / (s_htn_true_4554 + s_htn_true_5564) ;
* p_hypert_control_ge65 ;		p_hypert_control_ge65 = s_htn_control_ge65 / s_htn_true_ge65 ;


* Severe Hypertension (sbp >=160);
* p_hypertens160_ge18 ;			p_hypertens160_ge18 = s_hypertens160_ge18 / (popge18) ;
* p_hypertens160_2544 ;			p_hypertens160_2544 = (s_hypertens160_2534 + s_hypertens160_3544) / (pop2534 + pop4554) ;
* p_hypertens160_4564 ;			p_hypertens160_4564 = (s_hypertens160_4554 + s_hypertens160_5564) / (pop4554 + pop5564) ;
* p_hypertens160_ge65 ;			p_hypertens160_ge65 = s_hypertens160_ge65 / (pop6574 + pop7584 + popge85) ;

* p_htn_true160_ge18 ;			p_htn_true160_ge18 = s_htn_true160_ge18 / (popge18) ;
* p_htn_true160_2544 ;			p_htn_true160_2544 = (s_htn_true160_2534 + s_htn_true160_3544) / (pop2534 + pop4554) ;
* p_htn_true160_4564 ;			p_htn_true160_4564 = (s_htn_true160_4554 + s_htn_true160_5564) / (pop4554 + pop5564) ;
* p_htn_true160_ge65 ;			p_htn_true160_ge65 = s_htn_true160_ge65 / (pop6574 + pop7584 + popge85) ;

* p_dx_htn_true160_ge18 ;		p_dx_htn_true160_ge18 = s_htn_true_dx160_ge18 / s_htn_true160_ge18 ;
* p_dx_htn_true160_2544 ;		p_dx_htn_true160_2544 = (s_htn_true_dx160_2534 + s_htn_true_dx160_3544) / (s_htn_true160_2534 + s_htn_true160_3544) ;
* p_dx_htn_true160_4564 ;		p_dx_htn_true160_4564 = (s_htn_true_dx160_4554 + s_htn_true_dx160_5564) / (s_htn_true160_4554 + s_htn_true160_5564) ;
* p_dx_htn_true160_ge65 ;		p_dx_htn_true160_ge65 = s_htn_true_dx160_ge65 / s_htn_true160_ge65 ;

* p_on_anti_hypert160_ge18 ;	p_on_anti_hypert160_ge18 = s_on_tx_htn160_ge18 / s_htn_true160_ge18 ;
* p_on_anti_hypert160_2544 ;	p_on_anti_hypert160_2544 = (s_on_tx_htn160_2534 + s_on_tx_htn160_3544) / (s_htn_true160_2534 + s_htn_true160_3544) ;
* p_on_anti_hypert160_4564 ;	p_on_anti_hypert160_4564 = (s_on_tx_htn160_4554 + s_on_tx_htn160_5564) / (s_htn_true160_4554 + s_htn_true160_5564) ;
* p_on_anti_hypert160_ge65 ;	p_on_anti_hypert160_ge65 = s_on_tx_htn160_ge65 / s_htn_true160_ge65 ;

* p_hypert_control160_ge18 ;	p_hypert_control160_ge18 = s_htn_control160_ge18 / s_htn_true160_ge18 ;
* p_hypert_control160_2544 ;	p_hypert_control160_2544 = (s_htn_control160_2534 + s_htn_control160_3544) / (s_htn_true160_2534 + s_htn_true160_3544) ;
* p_hypert_control160_4564 ;	p_hypert_control160_4564 = (s_htn_control160_4554 + s_htn_control160_5564) / (s_htn_true160_4554 + s_htn_true160_5564) ;
* p_hypert_control160_ge65 ;	p_hypert_control160_ge65 = s_htn_control160_ge65 / s_htn_true160_ge65 ;

* mean SBP;
*m_sbp_1519w  = s_sbp_1519w  / (s_ageg1517w + s_ageg1819w);   
*m_sbp_2024w  = s_sbp_2024w  / s_ageg2024w ;
m_sbp_2529w  = s_sbp_2529w  / s_ageg2529w ;   
m_sbp_3034w  = s_sbp_3034w  / s_ageg3034w ;
m_sbp_3539w  = s_sbp_3539w  / s_ageg3539w ;   
m_sbp_4044w  = s_sbp_4044w  / s_ageg4044w ;
m_sbp_4549w  = s_sbp_4549w  / s_ageg4549w ;   
m_sbp_5054w  = s_sbp_5054w  / s_ageg5054w ;
m_sbp_5559w  = s_sbp_5559w  / s_ageg5559w ;   
m_sbp_6064w  = s_sbp_6064w  / s_ageg6064w ;
m_sbp_6569w  = s_sbp_6569w  / s_ageg6569w ;   
m_sbp_7074w  = s_sbp_7074w  / s_ageg7074w ;
m_sbp_7579w  = s_sbp_7579w  / s_ageg7579w ;   
m_sbp_ge80w  = s_sbp_ge80w  / (s_ageg8084w + s_ageg85plw);

*m_sbp_1519m  = s_sbp_1519m  / (s_ageg1517m + s_ageg1819m) ;   
*m_sbp_2024m  = s_sbp_2024m  / s_ageg2024m ;
m_sbp_2529m  = s_sbp_2529m  / s_ageg2529m ;   
m_sbp_3034m  = s_sbp_3034m  / s_ageg3034m ;
m_sbp_3539m  = s_sbp_3539m  / s_ageg3539m ;   
m_sbp_4044m  = s_sbp_4044m  / s_ageg4044m ;
m_sbp_4549m  = s_sbp_4549m  / s_ageg4549m ;   
m_sbp_5054m  = s_sbp_5054m  / s_ageg5054m ;
m_sbp_5559m  = s_sbp_5559m  / s_ageg5559m ;   
m_sbp_6064m  = s_sbp_6064m  / s_ageg6064m ;
m_sbp_6569m  = s_sbp_6569m  / s_ageg6569m ;   
m_sbp_7074m  = s_sbp_7074m  / s_ageg7074m ;
m_sbp_7579m  = s_sbp_7579m  / s_ageg7579m ;   
m_sbp_ge80m  = s_sbp_ge80m  / (s_ageg8084m + s_ageg85plm) ;

*m_sbp_1519  = (s_sbp_1519w + s_sbp_1519m ) / (s_ageg1517w + s_ageg1819w + s_ageg1517m + s_ageg1819m) ;
*m_sbp_2024  = (s_sbp_2024w + s_sbp_2024m ) / (s_ageg2024w + s_ageg2024m ) ;
m_sbp_2529  = (s_sbp_2529w + s_sbp_2529m ) / (s_ageg2529w + s_ageg2529m ) ;
m_sbp_3034  = (s_sbp_3034w + s_sbp_3034m ) / (s_ageg3034w + s_ageg3034m ) ;
m_sbp_3539  = (s_sbp_3539w + s_sbp_3539m ) / (s_ageg3539w + s_ageg3539m ) ;
m_sbp_4044  = (s_sbp_4044w + s_sbp_4044m ) / (s_ageg4044w + s_ageg4044m ) ;
m_sbp_4549  = (s_sbp_4549w + s_sbp_4549m ) / (s_ageg4549w + s_ageg4549m ) ;
m_sbp_5054  = (s_sbp_5054w + s_sbp_5054m ) / (s_ageg5054w + s_ageg5054m ) ;
m_sbp_5559  = (s_sbp_5559w + s_sbp_5559m ) / (s_ageg5559w + s_ageg5559m ) ;
m_sbp_6064  = (s_sbp_6064w + s_sbp_6064m ) / (s_ageg6064w + s_ageg6064m ) ;
m_sbp_6569  = (s_sbp_6569w + s_sbp_6569m ) / (s_ageg6569w + s_ageg6569m ) ;
m_sbp_7074  = (s_sbp_7074w + s_sbp_7074m ) / (s_ageg7074w + s_ageg7074m ) ;
m_sbp_7579  = (s_sbp_7579w + s_sbp_7579m ) / (s_ageg7579w + s_ageg7579m ) ;
m_sbp_ge80  = (s_sbp_ge80w + s_sbp_ge80m ) / (s_ageg8084w + s_ageg85plw + s_ageg8084m + s_ageg85plm) ;

m_sbp_2544  = (s_sbp_2529w + s_sbp_2529m + s_sbp_3034w + s_sbp_3034m + s_sbp_3539w + s_sbp_3539m + s_sbp_4044w + s_sbp_4044m) / (pop2534 + pop4554) ;
m_sbp_4564  = (s_sbp_4549w + s_sbp_4549m + s_sbp_5054w + s_sbp_5054m + s_sbp_5559w + s_sbp_5559m + s_sbp_6064w + s_sbp_6064m) / (pop4554 + pop5564) ;
m_sbp_ge65  = (s_sbp_6569w + s_sbp_6569m + s_sbp_7074w + s_sbp_7074m + s_sbp_7579w + s_sbp_7579m + s_sbp_ge80w + s_sbp_ge80m) / (pop6574 + pop7584 + popge85) ;

m_sbp_max_over_ge18 = s_sbp_max_over_ge18 / s_htn_over_dx_ge18;
m_sbp_over_ge18 = s_sbp_over_ge18 / s_htn_over_dx_ge18;


* CVD events;
/*
rate_ihd_one = (s_ihd_inc_one * 4 * 100) / s_alive;
rate_ihd_one_4049m = (s_ihd_inc_one_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_ihd_one_5059m = (s_ihd_inc_one_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_ihd_one_6069m = (s_ihd_inc_one_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_ihd_one_7079m = (s_ihd_inc_one_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_ihd_one_ge80m = (s_ihd_inc_one_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_ihd_one_4049w = (s_ihd_inc_one_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_ihd_one_5059w = (s_ihd_inc_one_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_ihd_one_6069w = (s_ihd_inc_one_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_ihd_one_7079w = (s_ihd_inc_one_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_ihd_one_ge80w = (s_ihd_inc_one_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;

rate_cva_one = (s_cva_inc_one * 4 * 100) / s_alive;
rate_cva_one_4049m = (s_cva_inc_one_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_cva_one_5059m = (s_cva_inc_one_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_cva_one_6069m = (s_cva_inc_one_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_cva_one_7079m = (s_cva_inc_one_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_cva_one_ge80m = (s_cva_inc_one_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_cva_one_4049w = (s_cva_inc_one_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_cva_one_5059w = (s_cva_inc_one_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_cva_one_6069w = (s_cva_inc_one_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_cva_one_7079w = (s_cva_inc_one_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_cva_one_ge80w = (s_cva_inc_one_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;

rate_ihd_all = (s_ihd_inc_all * 4 * 100) / s_alive;
rate_ihd_all_4049m = (s_ihd_inc_all_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_ihd_all_5059m = (s_ihd_inc_all_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_ihd_all_6069m = (s_ihd_inc_all_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_ihd_all_7079m = (s_ihd_inc_all_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_ihd_all_ge80m = (s_ihd_inc_all_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_ihd_all_4049w = (s_ihd_inc_all_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_ihd_all_5059w = (s_ihd_inc_all_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_ihd_all_6069w = (s_ihd_inc_all_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_ihd_all_7079w = (s_ihd_inc_all_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_ihd_all_ge80w = (s_ihd_inc_all_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;
rate_ihd_all_4059 = ((s_ihd_inc_all_4049m + s_ihd_inc_all_5059m + s_ihd_inc_all_4049w + s_ihd_inc_all_5059w) * 4 * 100) / (s_ageg4044m + s_ageg4549m + s_ageg5054m + s_ageg5559m + s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w) ;
rate_ihd_all_6079 = ((s_ihd_inc_all_6069m + s_ihd_inc_all_7079m + s_ihd_inc_all_6069w + s_ihd_inc_all_7079w) * 4 * 100) / (s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w) ;

rate_cva_all = (s_cva_inc_all * 4 * 100) / s_alive;
rate_cva_all_4049m = (s_cva_inc_all_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_cva_all_5059m = (s_cva_inc_all_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_cva_all_6069m = (s_cva_inc_all_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_cva_all_7079m = (s_cva_inc_all_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_cva_all_ge80m = (s_cva_inc_all_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_cva_all_4049w = (s_cva_inc_all_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_cva_all_5059w = (s_cva_inc_all_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_cva_all_6069w = (s_cva_inc_all_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_cva_all_7079w = (s_cva_inc_all_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_cva_all_ge80w = (s_cva_inc_all_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;
rate_cva_all_4059 = ((s_cva_inc_all_4049m + s_cva_inc_all_5059m + s_cva_inc_all_4049w + s_cva_inc_all_5059w) * 4 * 100) / (s_ageg4044m + s_ageg4549m + s_ageg5054m + s_ageg5559m + s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w) ;
rate_cva_all_6079 = ((s_cva_inc_all_6069m + s_cva_inc_all_7079m + s_cva_inc_all_6069w + s_cva_inc_all_7079w) * 4 * 100) / (s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w) ;

rate_ihd_one_modsev = (s_ihd_inc_one_modsv * 4 * 100) / s_alive;
rate_ihd_one_modsev_4049m = (s_ihd_inc_one_modsev_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_ihd_one_modsev_5059m = (s_ihd_inc_one_modsev_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_ihd_one_modsev_6069m = (s_ihd_inc_one_modsev_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_ihd_one_modsev_7079m = (s_ihd_inc_one_modsev_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_ihd_one_modsev_ge80m = (s_ihd_inc_one_modsev_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_ihd_one_modsev_4049w = (s_ihd_inc_one_modsev_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_ihd_one_modsev_5059w = (s_ihd_inc_one_modsev_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_ihd_one_modsev_6069w = (s_ihd_inc_one_modsev_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_ihd_one_modsev_7079w = (s_ihd_inc_one_modsev_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_ihd_one_modsev_ge80w = (s_ihd_inc_one_modsev_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;

rate_cva_one_modsev = (s_cva_inc_one_modsev * 4 * 100) / s_alive;
rate_cva_one_modsev_4049m = (s_cva_inc_one_modsev_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_cva_one_modsev_5059m = (s_cva_inc_one_modsev_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_cva_one_modsev_6069m = (s_cva_inc_one_modsev_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_cva_one_modsev_7079m = (s_cva_inc_one_modsev_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_cva_one_modsev_ge80m = (s_cva_inc_one_modsev_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_cva_one_modsev_4049w = (s_cva_inc_one_modsev_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_cva_one_modsev_5059w = (s_cva_inc_one_modsev_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_cva_one_modsev_6069w = (s_cva_inc_one_modsev_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_cva_one_modsev_7079w = (s_cva_inc_one_modsev_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_cva_one_modsev_ge80w = (s_cva_inc_one_modsev_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;
*/
rate_ihd_all_modsev = (s_ihd_inc_all_modsev * 4 * 100) / s_alive;
rate_ihd_all_modsev_4049m = (s_ihd_inc_all_modsev_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_ihd_all_modsev_5059m = (s_ihd_inc_all_modsev_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_ihd_all_modsev_6069m = (s_ihd_inc_all_modsev_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_ihd_all_modsev_7079m = (s_ihd_inc_all_modsev_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_ihd_all_modsev_ge80m = (s_ihd_inc_all_modsev_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_ihd_all_modsev_4049w = (s_ihd_inc_all_modsev_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_ihd_all_modsev_5059w = (s_ihd_inc_all_modsev_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_ihd_all_modsev_6069w = (s_ihd_inc_all_modsev_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_ihd_all_modsev_7079w = (s_ihd_inc_all_modsev_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_ihd_all_modsev_ge80w = (s_ihd_inc_all_modsev_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;
rate_ihd_all_modsev_4059 = ((s_ihd_inc_all_modsev_4049m + s_ihd_inc_all_modsev_5059m + s_ihd_inc_all_modsev_4049w + s_ihd_inc_all_modsev_5059w) * 4 * 100) / (s_ageg4044m + s_ageg4549m + s_ageg5054m + s_ageg5559m + s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w) ;
rate_ihd_all_modsev_6079 = ((s_ihd_inc_all_modsev_6069m + s_ihd_inc_all_modsev_7079m + s_ihd_inc_all_modsev_6069w + s_ihd_inc_all_modsev_7079w) * 4 * 100) / (s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w) ;

rate_cva_all_modsev = (s_cva_inc_all_modsev * 4 * 100) / s_alive;
rate_cva_all_modsev_4049m = (s_cva_inc_all_modsev_4049m * 4 * 100) / (s_ageg4044m + s_ageg4549m) ;
rate_cva_all_modsev_5059m = (s_cva_inc_all_modsev_5059m * 4 * 100) / (s_ageg5054m + s_ageg5559m) ;
rate_cva_all_modsev_6069m = (s_cva_inc_all_modsev_6069m * 4 * 100) / (s_ageg6064m + s_ageg6569m) ;
rate_cva_all_modsev_7079m = (s_cva_inc_all_modsev_7079m * 4 * 100) / (s_ageg7074m + s_ageg7579m) ;
rate_cva_all_modsev_ge80m = (s_cva_inc_all_modsev_ge80m * 4 * 100) / (s_ageg8084m + s_ageg85plm) ;
rate_cva_all_modsev_4049w = (s_cva_inc_all_modsev_4049w * 4 * 100) / (s_ageg4044w + s_ageg4549w) ;
rate_cva_all_modsev_5059w = (s_cva_inc_all_modsev_5059w * 4 * 100) / (s_ageg5054w + s_ageg5559w) ;
rate_cva_all_modsev_6069w = (s_cva_inc_all_modsev_6069w * 4 * 100) / (s_ageg6064w + s_ageg6569w) ;
rate_cva_all_modsev_7079w = (s_cva_inc_all_modsev_7079w * 4 * 100) / (s_ageg7074w + s_ageg7579w) ;
rate_cva_all_modsev_ge80w = (s_cva_inc_all_modsev_ge80w * 4 * 100) / (s_ageg8084w + s_ageg85plw) ;
rate_cva_all_modsev_4059 = ((s_cva_inc_all_modsev_4049m + s_cva_inc_all_modsev_5059m + s_cva_inc_all_modsev_4049w + s_cva_inc_all_modsev_5059w) * 4 * 100) / (s_ageg4044m + s_ageg4549m + s_ageg5054m + s_ageg5559m + s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w) ;
rate_cva_all_modsev_6079 = ((s_cva_inc_all_modsev_6069m + s_cva_inc_all_modsev_7079m + s_cva_inc_all_modsev_6069w + s_cva_inc_all_modsev_7079w) * 4 * 100) / (s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w) ;


prev_ihd = (s_ihd_prev) / s_alive;
prev_ihd_4049m = (s_ihd_prev_4049m * 100) / (s_ageg4044m + s_ageg4549m) ;
prev_ihd_5059m = (s_ihd_prev_5059m * 100) / (s_ageg5054m + s_ageg5559m) ;
prev_ihd_6069m = (s_ihd_prev_6069m * 100) / (s_ageg6064m + s_ageg6569m) ;
prev_ihd_7079m = (s_ihd_prev_7079m * 100) / (s_ageg7074m + s_ageg7579m) ;
prev_ihd_ge80m = (s_ihd_prev_ge80m * 100) / (s_ageg8084m + s_ageg85plm) ;
prev_ihd_4049w = (s_ihd_prev_4049w * 100) / (s_ageg4044w + s_ageg4549w) ;
prev_ihd_5059w = (s_ihd_prev_5059w * 100) / (s_ageg5054w + s_ageg5559w) ;
prev_ihd_6069w = (s_ihd_prev_6069w * 100) / (s_ageg6064w + s_ageg6569w) ;
prev_ihd_7079w = (s_ihd_prev_7079w * 100) / (s_ageg7074w + s_ageg7579w) ;
prev_ihd_ge80w = (s_ihd_prev_ge80w * 100) / (s_ageg8084w + s_ageg85plw) ;
prev_ihd_4059 = ((s_ihd_prev_4049m + s_ihd_prev_5059m + s_ihd_prev_4049w + s_ihd_prev_5059w) * 100) / (s_ageg4044m + s_ageg4549m + s_ageg5054m + s_ageg5559m + s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w) ;
prev_ihd_6079 = ((s_ihd_prev_6069m + s_ihd_prev_7079m + s_ihd_prev_6069w + s_ihd_prev_7079w) * 100) / (s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w) ;

prev_cva = (s_cva_prev) / s_alive;
prev_cva_4049m = (s_cva_prev_4049m * 100) / (s_ageg4044m + s_ageg4549m) ;
prev_cva_5059m = (s_cva_prev_5059m * 100) / (s_ageg5054m + s_ageg5559m) ;
prev_cva_6069m = (s_cva_prev_6069m * 100) / (s_ageg6064m + s_ageg6569m) ;
prev_cva_7079m = (s_cva_prev_7079m * 100) / (s_ageg7074m + s_ageg7579m) ;
prev_cva_ge80m = (s_cva_prev_ge80m * 100) / (s_ageg8084m + s_ageg85plm) ;
prev_cva_4049w = (s_cva_prev_4049w * 100) / (s_ageg4044w + s_ageg4549w) ;
prev_cva_5059w = (s_cva_prev_5059w * 100) / (s_ageg5054w + s_ageg5559w) ;
prev_cva_6069w = (s_cva_prev_6069w * 100) / (s_ageg6064w + s_ageg6569w) ;
prev_cva_7079w = (s_cva_prev_7079w * 100) / (s_ageg7074w + s_ageg7579w) ;
prev_cva_ge80w = (s_cva_prev_ge80w * 100) / (s_ageg8084w + s_ageg85plw) ;
prev_cva_4059 = ((s_cva_prev_4049m + s_cva_prev_5059m + s_cva_prev_4049w + s_cva_prev_5059w) * 100) / (s_ageg4044m + s_ageg4549m + s_ageg5054m + s_ageg5559m + s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w) ;
prev_cva_6079 = ((s_cva_prev_6069m + s_cva_prev_7079m + s_cva_prev_6069w + s_cva_prev_7079w) * 100) / (s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w) ;
 

* p_ahd_re_enter_care_100;		p_ahd_re_enter_care_100 = s_ahd_re_enter_care_100 / s_re_enter_care;
* p_ahd_re_enter_care_200;		p_ahd_re_enter_care_200 = s_ahd_re_enter_care_200 / s_re_enter_care;

* ts1m - below change 4 to 12;
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

* n deaths and death rate by cause and hiv status - age 15+ ;

			n_dead_hivpos_cause1 = s_dead_hivpos_cause1 * &sf; 
			rate_dead_hivpos_cause1 = (s_dead_hivpos_cause1 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_tb = s_dead_hivpos_tb * &sf; 
			rate_dead_hivpos_tb = (s_dead_hivpos_tb * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause4 = s_dead_hivpos_cause4 * &sf; 
			rate_dead_hivpos_cause4 = (s_dead_hivpos_cause4 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_crypm = s_dead_hivpos_crypm * &sf; 
			rate_dead_hivpos_crypm = (s_dead_hivpos_crypm * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_sbi = s_dead_hivpos_sbi * &sf; 
			rate_dead_hivpos_sbi = (s_dead_hivpos_sbi * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_oth_adc = s_dead_hivpos_oth_adc * &sf; 
			rate_dead_hivpos_oth_adc = (s_dead_hivpos_oth_adc * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause2 = s_dead_hivpos_cause2 * &sf; 
			rate_dead_hivpos_cause2 = (s_dead_hivpos_cause2 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause3 = s_dead_hivpos_cause3 * &sf; 
			rate_dead_hivpos_cause3 = (s_dead_hivpos_cause3 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cvd = s_dead_hivpos_cvd * &sf; 
			rate_dead_hivpos_cvd = (s_dead_hivpos_cvd * 4 * 100) / s_hivge15 ;
			n_dead_cvd = s_dead_cvd * 4 * &sf; 
			rate_dead_cvd = (s_dead_cvd * 4 * 100) / s_alive ;
			n_dead_tb = s_dead_tb * &sf; 
			rate_dead_tb = (s_dead_tb * 4 * 100) / s_alive ;
			n_dead_hivneg_cvd = s_dead_hivneg_cvd * &sf; 
			rate_dead_hivneg_cvd = (s_dead_hivneg_cvd * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_tb = s_dead_hivneg_tb * &sf; 
			rate_dead_hivneg_tb = (s_dead_hivneg_tb * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause2 = s_dead_hivneg_cause2 * &sf; 
			rate_dead_hivneg_cause2 = (s_dead_hivneg_cause2 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause3 = s_dead_hivneg_cause3 * &sf; 
			rate_dead_hivneg_cause3 = (s_dead_hivneg_cause3 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause4 = s_dead_hivneg_cause4 * &sf; 
			rate_dead_hivneg_cause4 = (s_dead_hivneg_cause4 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause5 = s_dead_hivneg_cause5 * &sf; 
			rate_dead_hivneg_cause5 = (s_dead_hivneg_cause5 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_allage = s_dead_allage * 4 * &sf ;
			rate_dead_allage = (s_dead_allage * 4 * 100) / s_alive ;
			n_dead_hivneg_anycause = s_dead_hivneg_anycause * 4 * &sf ;
			rate_dead_hivneg_anycause = (s_dead_hivneg_anycause * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivpos_anycause = s_dead_hivpos_anycause * 4 * &sf ;
			rate_dead_hivpos_anycause = (s_dead_hivpos_anycause * 4 * 100) / s_hivge15 ;
			rate_dead_hivpos_cvd = (s_dead_hivpos_cvd * 4 * 100) / s_hivge15 ;
			rate_dead_all_anycause = ((s_dead_hivneg_anycause + s_dead_hivpos_anycause) * 4 * 100) / (s_alive) ;
			n_dead_all_anycause = (s_dead_hivneg_anycause + s_dead_hivpos_anycause) * 4 * &sf ;

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
			rate_dead_cvd_4059 = ((s_dead_cvd_4049m + s_dead_cvd_5059m + s_dead_cvd_4049w + s_dead_cvd_5059w) * 4 * 100) / (s_ageg4044m + s_ageg4549m + s_ageg5054m + s_ageg5559m + s_ageg4044w + s_ageg4549w + s_ageg5054w + s_ageg5559w) ;
			rate_dead_cvd_6079 = ((s_dead_cvd_6069m + s_dead_cvd_7079m + s_dead_cvd_6069w + s_dead_cvd_7079w) * 4 * 100) / (s_ageg6064m + s_ageg6569m + s_ageg7074m + s_ageg7579m + s_ageg6064w + s_ageg6569w + s_ageg7074w + s_ageg7579w) ;

			tot_dyll_cvd = s_dyll_cvd_Optima80 * 4 * &sf;
			tot_dyll = s_dyll_Optima80 * 4 * &sf;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel_allage * &sf;
* n_death_covid;				n_death_covid = s_death_dcause3_allage * &sf;
* n_death;						n_death = s_dead_allage * &sf;
* n_covid;						n_covid = s_covid * &sf;
* n_death_hivneg_anycause;		n_death_hivneg_anycause = s_dead_hivneg_anycause * &sf;
* n_death_hivpos_anycause;		n_death_hivpos_anycause = s_dead_hivpos_anycause * &sf;

inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

* p_death_hivrel_age_le64;		if s_death_hivrel_allage gt 0 then p_death_hivrel_age_le64 = s_death_hivrel / s_death_hivrel_allage ;

* number of women with hiv giving birth per year;

n_give_birth_w_hiv = s_give_birth_with_hiv * &sf * 4;
n_birth_with_inf_child = s_birth_with_inf_child * &sf * 4;
s_pregnant_ntd = s_pregnant_ntd * (0.0022 / 0.0058);
n_pregnant_ntd = s_pregnant_ntd    * &sf * 4 ; 
n_preg_odabe = s_pregnant_oth_dol_adv_birth_e * &sf * 4;  * annual number;


n_mcirc1549_ = s_mcirc_1549m * &sf * 4;
n_mcirc1549_3m = s_mcirc_1549m * &sf;
n_vmmc1549_ = s_vmmc1549m * &sf * 4;
n_vmmc1549_3m = s_vmmc1549m * &sf;
n_new_inf1549m = s_primary1549m * &sf * 4;
n_new_inf1549 = s_primary1549 * &sf * 4;

keep run option cald 
prevalence1549m 	 prevalence1549w 	prevalence1549 		incidence1549 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000 			p_vl1000 			prevalence_vg1000
dcost ddaly

death_rate  death_rate_hiv 

/* *HYPERTENSION */
prob_sbp_increase sbp_cal_eff rr_cvd_tx rr_cvd_tx_effective
popge18 pop2534 pop3544 pop4554 pop5564 pop6574 pop7584 popge85 
p_hypert_ge18 p_hypert_2534 p_hypert_3544 p_hypert_4554 p_hypert_5564 p_hypert_ge65
p_htn_true_ge18 p_htn_true_2534 p_htn_true_3544 p_htn_true_4554 p_htn_true_5564 p_htn_true_ge65
p_dx_htn_true_ge18 p_dx_htn_true_ge65
p_dx_htn_over_ge18 p_dx_htn_over_ge65
p_diagnosed_hypert_ge18 p_diagnosed_hypert_2534 p_diagnosed_hypert_3544 p_diagnosed_hypert_4554 p_diagnosed_hypert_5564 p_diagnosed_hypert_ge65
p_on_anti_hypert_ge18 p_on_anti_hypert_2534 p_on_anti_hypert_3544 p_on_anti_hypert_4554 p_on_anti_hypert_5564 p_on_anti_hypert_ge65
p_hypert_control_ge18 p_hypert_control_2534 p_hypert_control_3544 p_hypert_control_4554 p_hypert_control_5564 p_hypert_control_ge65

p_on1drug_antihyp_ge18 p_on2drug_antihyp_ge18 p_on3drug_antihyp_ge18 	
p_on1drug_antihyp_2544 p_on2drug_antihyp_2544 p_on3drug_antihyp_2544 	
p_on1drug_antihyp_4564 p_on2drug_antihyp_4564 p_on3drug_antihyp_4564 
p_on1drug_antihyp_ge65 p_on2drug_antihyp_ge65 p_on3drug_antihyp_ge65 	

p_hypert_2544 p_hypert_4564
p_htn_true_2544 p_htn_true_4564
p_dx_htn_true_2544 p_dx_htn_true_4564
p_dx_htn_over_2544 p_dx_htn_over_4564 
p_diagnosed_hypert_2544 p_diagnosed_hypert_4564 
p_on_anti_hypert_2544 p_on_anti_hypert_4564 
p_ever_anti_hypert_ge18 p_ever_anti_hypert_2544 p_ever_anti_hypert_4564 p_ever_anti_hypert_ge65 
p_hypert_control_2544 p_hypert_control_4564

p_hypertens160_ge18 p_hypertens160_2544 p_hypertens160_4564 p_hypertens160_ge65 
p_htn_true160_ge18 p_htn_true160_2544 p_htn_true160_4564 p_htn_true160_ge65 
p_dx_htn_true160_ge18 p_dx_htn_true160_2544 p_dx_htn_true160_4564 p_dx_htn_true160_ge65 
p_on_anti_hypert160_ge18 p_on_anti_hypert160_2544 p_on_anti_hypert160_4564 p_on_anti_hypert160_ge65 
p_hypert_control160_ge18 p_hypert_control160_2544 p_hypert_control160_4564 p_hypert_control160_ge65

rate_ihd_all_modsev_4059 rate_ihd_all_modsev_6079
rate_cva_all_modsev_4059 rate_cva_all_modsev_6079 
prev_ihd_4059 prev_ihd_6079 
prev_cva_4059 prev_cva_6079 
rate_dead_cvd_4059 rate_dead_cvd_6079
 
m_sbp_2529w m_sbp_3034w m_sbp_3539w m_sbp_4044w m_sbp_4549w m_sbp_5054w m_sbp_5559w m_sbp_6064w m_sbp_6569w m_sbp_7074w m_sbp_7579w m_sbp_ge80w  
m_sbp_2529m m_sbp_3034m m_sbp_3539m m_sbp_4044m m_sbp_4549m m_sbp_5054m m_sbp_5559m	m_sbp_6064m m_sbp_6569m m_sbp_7074m m_sbp_7579m m_sbp_ge80m 
m_sbp_2529  m_sbp_3034  m_sbp_3539  m_sbp_4044  m_sbp_4549  m_sbp_5054  m_sbp_5559	m_sbp_6064  m_sbp_6569  m_sbp_7074  m_sbp_7579  m_sbp_ge80 
m_sbp_2544 m_sbp_4564 m_sbp_ge65
m_sbp_max_over_ge18 m_sbp_over_ge18 

rate_ihd_all_modsev 
rate_ihd_all_modsev_4049m rate_ihd_all_modsev_5059m rate_ihd_all_modsev_6069m rate_ihd_all_modsev_7079m rate_ihd_all_modsev_ge80m
rate_ihd_all_modsev_4049w rate_ihd_all_modsev_5059w rate_ihd_all_modsev_6069w rate_ihd_all_modsev_7079w rate_ihd_all_modsev_ge80w 
rate_cva_all_modsev 
rate_cva_all_modsev_4049m rate_cva_all_modsev_5059m rate_cva_all_modsev_6069m rate_cva_all_modsev_7079m rate_cva_all_modsev_ge80m
rate_cva_all_modsev_4049w rate_cva_all_modsev_5059w rate_cva_all_modsev_6069w rate_cva_all_modsev_7079w rate_cva_all_modsev_ge80w 

prev_ihd 
prev_ihd_4049m prev_ihd_5059m prev_ihd_6069m prev_ihd_7079m prev_ihd_ge80m
prev_ihd_4049w prev_ihd_5059w prev_ihd_6069w prev_ihd_7079w prev_ihd_ge80w 

prev_cva 
prev_cva_4049m prev_cva_5059m prev_cva_6069m prev_cva_7079m prev_cva_ge80m
prev_cva_4049w prev_cva_5059w prev_cva_6069w prev_cva_7079w prev_cva_ge80w 

/*
rate_ihd_one 
rate_ihd_one_4049m rate_ihd_one_5059m rate_ihd_one_6069m rate_ihd_one_7079m rate_ihd_one_ge80m
rate_ihd_one_4049w rate_ihd_one_5059w rate_ihd_one_6069w rate_ihd_one_7079w rate_ihd_one_ge80w 
rate_cva_one 
rate_cva_one_4049m rate_cva_one_5059m rate_cva_one_6069m rate_cva_one_7079m rate_cva_one_ge80m
rate_cva_one_4049w rate_cva_one_5059w rate_cva_one_6069w rate_cva_one_7079w rate_cva_one_ge80w 
rate_ihd_all 
rate_ihd_all_4049m rate_ihd_all_5059m rate_ihd_all_6069m rate_ihd_all_7079m rate_ihd_all_ge80m
rate_ihd_all_4049w rate_ihd_all_5059w rate_ihd_all_6069w rate_ihd_all_7079w rate_ihd_all_ge80w 
rate_cva_all 
rate_cva_all_4049m rate_cva_all_5059m rate_cva_all_6069m rate_cva_all_7079m rate_cva_all_ge80m
rate_cva_all_4049w rate_cva_all_5059w rate_cva_all_6069w rate_cva_all_7079w rate_cva_all_ge80w 
rate_ihd_one_modsev 
rate_ihd_one_modsev_4049m rate_ihd_one_modsev_5059m rate_ihd_one_modsev_6069m rate_ihd_one_modsev_7079m rate_ihd_one_modsev_ge80m
rate_ihd_one_modsev_4049w rate_ihd_one_modsev_5059w rate_ihd_one_modsev_6069w rate_ihd_one_modsev_7079w rate_ihd_one_modsev_ge80w 
rate_cva_one_modsev 
rate_cva_one_modsev_4049m rate_cva_one_modsev_5059m rate_cva_one_modsev_6069m rate_cva_one_modsev_7079m rate_cva_one_modsev_ge80m
rate_cva_one_modsev_4049w rate_cva_one_modsev_5059w rate_cva_one_modsev_6069w rate_cva_one_modsev_7079w rate_cva_one_modsev_ge80w 
*/

htn_cost_total htn_cost_scr htn_cost_drug htn_cost_clin htn_cost_cvd
dhtn_cost_total dhtn_cost_scr dhtn_cost_drug dhtn_cost_clin dhtn_cost_cvd
dhtn_cost_totdrughalf dhtn_cost_totdrugdoub dhtn_cost_tothalf dhtn_cost_totdoub

n_dead_hivpos_cause1  rate_dead_hivpos_cause1 n_dead_hivpos_tb  rate_dead_hivpos_tb n_dead_hivpos_cause4  rate_dead_hivpos_cause4 
n_dead_hivpos_crypm  rate_dead_hivpos_crypm n_dead_hivpos_sbi  rate_dead_hivpos_sbi n_dead_hivpos_oth_adc  rate_dead_hivpos_oth_adc 
n_dead_hivpos_cause2  rate_dead_hivpos_cause2 	n_dead_hivpos_cause3  rate_dead_hivpos_cause3 	n_dead_hivpos_cvd  rate_dead_hivpos_cvd 
n_dead_cvd  rate_dead_cvd 	n_dead_tb  rate_dead_tb n_dead_hivneg_cvd  rate_dead_hivneg_cvd n_dead_hivneg_tb  rate_dead_hivneg_tb
n_dead_hivneg_cause2 rate_dead_hivneg_cause2 n_dead_hivneg_cause3  rate_dead_hivneg_cause3 	n_dead_hivneg_cause4  rate_dead_hivneg_cause4 
n_dead_hivneg_cause5  rate_dead_hivneg_cause5 rate_dead_allage rate_dead_hivneg_anycause rate_dead_hivpos_anycause rate_dead_hivpos_cvd
rate_dead_all_anycause n_dead_all_anycause
p_age1549_hivneg p_age1549_hiv
rate_dead_cvd_3039m	rate_dead_cvd_4049m rate_dead_cvd_5059m rate_dead_cvd_6069m rate_dead_cvd_7079m rate_dead_cvd_ge80m rate_dead_cvd_3039w 
rate_dead_cvd_4049w rate_dead_cvd_5059w rate_dead_cvd_6069w rate_dead_cvd_7079w rate_dead_cvd_ge80w 
n_dead_allage n_dead_hivneg_anycause n_dead_hivpos_anycause

sf_2023 p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat 



;



proc sort data=y;by run option;run;

* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;
data a.l_base; set y;  




data y; set a.l_base; 

  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

proc means noprint data=y; var &v; output out=y_15 mean= &v._15; by run option ; where 2014.5 <= cald < 2015.5; 
proc means noprint data=y; var &v; output out=y_23 mean= &v._23; by run option ; where 2022.5 <= cald < 2023.5; 

/* proc means noprint data=y; var &v; output out=y_43 mean= &v._43; by run option ; where 2042.5 <= cald < 2043.5; 
proc means noprint data=y; var &v; output out=y_73 mean= &v._73; by run option ; where 2072.5 <= cald < 2073.5; */
proc means noprint data=y; var &v; output out=y_2343 mean= &v._2343; by run option ; where 2023.5 <= cald < 2043.5; 
proc means noprint data=y; var &v; output out=y_2373 mean= &v._2373; by run option ; where 2023.5 <= cald < 2073.5; 
  
																												
/* proc sort data=y_43; by run option ; proc transpose data=y_43 out=t_43 prefix=&v._43_; var &v._43; by run option ; 
proc sort data=y_73; by run option; proc transpose data=y_73 out=t_73 prefix=&v._73_; var &v._73; by run option ;  */
proc sort data=y_2343; by run option; proc transpose data=y_2343 out=t_2343 prefix=&v._2343_; var &v._2343; by run option ;  
proc sort data=y_2373; by run option; proc transpose data=y_2373 out=t_2373 prefix=&v._2373_; var &v._2373; by run option ;  

data &v ; merge   y_15 y_23  y_2343 y_2373 ; by run option; * REMOVED y_43 y_73 to shorten output;
drop _NAME_ _TYPE_ _FREQ_;


***THIS MACRO CALCULATES THE MEANS OVER PERIOD AT EACH OF THE SPECIFIED TIME PERIODS ABOVE ANS STORES THESE IN INDIVIDUAL DATASETS;
%mend var;

%var(v=p_diag);	 		%var(v=p_diag_m);	 		%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000);		%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);
%var(v=p_vg1000); 		%var(v=p_vl1000);			%var(v=prevalence_vg1000);

%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549); 	
%var(v=incidence1549); 	%var(v=incidence1549w); 	%var(v=incidence1549m);
%var(v=dcost);	 		%var(v=ddaly);

*/ADD IN PROJECT SPECIFIC OUTPUTS/*;
%var(v=popge18); %var(v=pop2534); %var(v=pop3544); %var(v=pop4554); %var(v=pop5564); %var(v=pop6574); %var(v=pop7584); %var(v=popge85);
%var(v=death_rate_hiv);

%var(v=prob_sbp_increase); %var(v=sbp_cal_eff); %var(v=rr_cvd_tx); %var(v=rr_cvd_tx_effective);

%var(v=p_hypert_ge18); %var(v=p_hypert_2534); %var(v=p_hypert_3544); %var(v=p_hypert_4554); %var(v=p_hypert_5564); %var(v=p_hypert_ge65); 
%var(v=p_htn_true_ge18); %var(v=p_htn_true_2534); %var(v=p_htn_true_3544); %var(v=p_htn_true_4554); %var(v=p_htn_true_5564); %var(v=p_htn_true_ge65); 
%var(v=p_dx_htn_true_ge18); %var(v=p_dx_htn_true_ge65); 
%var(v=p_dx_htn_over_ge18); %var(v=p_dx_htn_over_ge65); 
%var(v=p_diagnosed_hypert_ge18); %var(v=p_diagnosed_hypert_2534); %var(v=p_diagnosed_hypert_3544); %var(v=p_diagnosed_hypert_4554); %var(v=p_diagnosed_hypert_5564); %var(v=p_diagnosed_hypert_ge65); 
%var(v=p_on_anti_hypert_ge18); %var(v=p_on_anti_hypert_2534); %var(v=p_on_anti_hypert_3544); %var(v=p_on_anti_hypert_4554); %var(v=p_on_anti_hypert_5564); %var(v=p_on_anti_hypert_ge65); 
%var(v=p_hypert_control_ge18); %var(v=p_hypert_control_2534); %var(v=p_hypert_control_3544); %var(v=p_hypert_control_4554); %var(v=p_hypert_control_5564); %var(v=p_hypert_control_ge65); 

%var(v=p_hypert_2544); %var(v=p_hypert_4564);
%var(v=p_htn_true_2544); %var(v=p_htn_true_4564);
%var(v=p_dx_htn_true_2544); %var(v=p_dx_htn_true_4564);
%var(v=p_dx_htn_over_2544); %var(v=p_dx_htn_over_4564);
%var(v=p_diagnosed_hypert_2544); %var(v=p_diagnosed_hypert_4564); 
%var(v=p_on_anti_hypert_2544); %var(v=p_on_anti_hypert_4564); 
%var(v=p_ever_anti_hypert_ge18); %var(v=p_ever_anti_hypert_2544); %var(v=p_ever_anti_hypert_4564); %var(v=p_ever_anti_hypert_ge65);
%var(v=p_hypert_control_2544); %var(v=p_hypert_control_4564);

%var(v=p_on1drug_antihyp_ge18); %var(v=p_on2drug_antihyp_ge18); %var(v=p_on3drug_antihyp_ge18); 	
%var(v=p_on1drug_antihyp_2544); %var(v=p_on2drug_antihyp_2544); %var(v=p_on3drug_antihyp_2544); 	
%var(v=p_on1drug_antihyp_4564); %var(v=p_on2drug_antihyp_4564); %var(v=p_on3drug_antihyp_4564); 
%var(v=p_on1drug_antihyp_ge65); %var(v=p_on2drug_antihyp_ge65); %var(v=p_on3drug_antihyp_ge65); 	

%var(v=p_hypertens160_ge18); %var(v=p_hypertens160_2544); %var(v=p_hypertens160_4564); %var(v=p_hypertens160_ge65); 
%var(v=p_htn_true160_ge18); %var(v=p_htn_true160_2544); %var(v=p_htn_true160_4564); %var(v=p_htn_true160_ge65); 
%var(v=p_dx_htn_true160_ge18); %var(v=p_dx_htn_true160_2544); %var(v=p_dx_htn_true160_4564); %var(v=p_dx_htn_true160_ge65); 
%var(v=p_on_anti_hypert160_ge18); %var(v=p_on_anti_hypert160_2544); %var(v=p_on_anti_hypert160_4564); %var(v=p_on_anti_hypert160_ge65); 
%var(v=p_hypert_control160_ge18); %var(v=p_hypert_control160_2544); %var(v=p_hypert_control160_4564); %var(v=p_hypert_control160_ge65);

/*%var(v=rate_ihd_all_4059); %var(v=rate_ihd_all_6079);
%var(v=rate_cva_all_4059); %var(v=rate_cva_all_6079); */
%var(v=rate_ihd_all_modsev_4059); %var(v=rate_ihd_all_modsev_6079);
%var(v=rate_cva_all_modsev_4059); %var(v=rate_cva_all_modsev_6079);
%var(v=prev_ihd_4059); %var(v=prev_ihd_6079);
%var(v=prev_cva_4059); %var(v=prev_cva_6079);
%var(v=rate_dead_cvd_4059); %var(v=rate_dead_cvd_6079);

%var(v=m_sbp_2529w); %var(v=m_sbp_3034w); %var(v=m_sbp_3539w); %var(v=m_sbp_4044w); %var(v=m_sbp_4549w); %var(v=m_sbp_5054w); %var(v=m_sbp_5559w); %var(v=m_sbp_6064w); %var(v=m_sbp_6569w); %var(v=m_sbp_7074w); %var(v=m_sbp_7579w); %var(v=m_sbp_ge80w);  
%var(v=m_sbp_2529m); %var(v=m_sbp_3034m); %var(v=m_sbp_3539m); %var(v=m_sbp_4044m); %var(v=m_sbp_4549m); %var(v=m_sbp_5054m); %var(v=m_sbp_5559m); %var(v=m_sbp_6064m); %var(v=m_sbp_6569m); %var(v=m_sbp_7074m); %var(v=m_sbp_7579m); %var(v=m_sbp_ge80m); 
%var(v=m_sbp_2529) ; %var(v=m_sbp_3034) ; %var(v=m_sbp_3539) ; %var(v=m_sbp_4044) ; %var(v=m_sbp_4549) ; %var(v=m_sbp_5054) ; %var(v=m_sbp_5559) ; %var(v=m_sbp_6064);  %var(v=m_sbp_6569);  %var(v=m_sbp_7074);  %var(v=m_sbp_7579);  %var(v=m_sbp_ge80); 
%var(v=m_sbp_2544) ; %var(v=m_sbp_4564) ; %var(v=m_sbp_ge65) ;
%var(v=m_sbp_max_over_ge18) ; %var(v=m_sbp_over_ge18) ; 


/*%var(v=rate_ihd_one); 
%var(v=rate_ihd_one_4049m); %var(v=rate_ihd_one_5059m); %var(v=rate_ihd_one_6069m); %var(v=rate_ihd_one_7079m); %var(v=rate_ihd_one_ge80m);
%var(v=rate_ihd_one_4049w); %var(v=rate_ihd_one_5059w); %var(v=rate_ihd_one_6069w); %var(v=rate_ihd_one_7079w); %var(v=rate_ihd_one_ge80w); 
%var(v=rate_cva_one); 
%var(v=rate_cva_one_4049m); %var(v=rate_cva_one_5059m); %var(v=rate_cva_one_6069m); %var(v=rate_cva_one_7079m); %var(v=rate_cva_one_ge80m);
%var(v=rate_cva_one_4049w); %var(v=rate_cva_one_5059w); %var(v=rate_cva_one_6069w); %var(v=rate_cva_one_7079w); %var(v=rate_cva_one_ge80w); 
%var(v=rate_ihd_all); 
%var(v=rate_ihd_all_4049m); %var(v=rate_ihd_all_5059m); %var(v=rate_ihd_all_6069m); %var(v=rate_ihd_all_7079m); %var(v=rate_ihd_all_ge80m);
%var(v=rate_ihd_all_4049w); %var(v=rate_ihd_all_5059w); %var(v=rate_ihd_all_6069w); %var(v=rate_ihd_all_7079w); %var(v=rate_ihd_all_ge80w); 
%var(v=rate_cva_all); 
%var(v=rate_cva_all_4049m); %var(v=rate_cva_all_5059m); %var(v=rate_cva_all_6069m); %var(v=rate_cva_all_7079m); %var(v=rate_cva_all_ge80m);
%var(v=rate_cva_all_4049w); %var(v=rate_cva_all_5059w); %var(v=rate_cva_all_6069w); %var(v=rate_cva_all_7079w); %var(v=rate_cva_all_ge80w); 
%var(v=rate_ihd_one_modsev); 
%var(v=rate_ihd_one_modsev_4049m); %var(v=rate_ihd_one_modsev_5059m); %var(v=rate_ihd_one_modsev_6069m); %var(v=rate_ihd_one_modsev_7079m); %var(v=rate_ihd_one_modsev_ge80m);
%var(v=rate_ihd_one_modsev_4049w); %var(v=rate_ihd_one_modsev_5059w); %var(v=rate_ihd_one_modsev_6069w); %var(v=rate_ihd_one_modsev_7079w); %var(v=rate_ihd_one_modsev_ge80w); 
%var(v=rate_cva_one_modsev); 
%var(v=rate_cva_one_modsev_4049m); %var(v=rate_cva_one_modsev_5059m); %var(v=rate_cva_one_modsev_6069m); %var(v=rate_cva_one_modsev_7079m); %var(v=rate_cva_one_modsev_ge80m);
%var(v=rate_cva_one_modsev_4049w); %var(v=rate_cva_one_modsev_5059w); %var(v=rate_cva_one_modsev_6069w); %var(v=rate_cva_one_modsev_7079w); %var(v=rate_cva_one_modsev_ge80w); 
*/
%var(v=rate_ihd_all_modsev); 
%var(v=rate_ihd_all_modsev_4049m); %var(v=rate_ihd_all_modsev_5059m); %var(v=rate_ihd_all_modsev_6069m); %var(v=rate_ihd_all_modsev_7079m); %var(v=rate_ihd_all_modsev_ge80m);
%var(v=rate_ihd_all_modsev_4049w); %var(v=rate_ihd_all_modsev_5059w); %var(v=rate_ihd_all_modsev_6069w); %var(v=rate_ihd_all_modsev_7079w); %var(v=rate_ihd_all_modsev_ge80w); 
%var(v=rate_cva_all_modsev); 
%var(v=rate_cva_all_modsev_4049m); %var(v=rate_cva_all_modsev_5059m); %var(v=rate_cva_all_modsev_6069m); %var(v=rate_cva_all_modsev_7079m); %var(v=rate_cva_all_modsev_ge80m);
%var(v=rate_cva_all_modsev_4049w); %var(v=rate_cva_all_modsev_5059w); %var(v=rate_cva_all_modsev_6069w); %var(v=rate_cva_all_modsev_7079w); %var(v=rate_cva_all_modsev_ge80w); 

%var(v=prev_ihd); 
%var(v=prev_ihd_4049m); %var(v=prev_ihd_5059m); %var(v=prev_ihd_6069m); %var(v=prev_ihd_7079m); %var(v=prev_ihd_ge80m);
%var(v=prev_ihd_4049w); %var(v=prev_ihd_5059w); %var(v=prev_ihd_6069w); %var(v=prev_ihd_7079w); %var(v=prev_ihd_ge80w); 
%var(v=prev_cva); 
%var(v=prev_cva_4049m); %var(v=prev_cva_5059m); %var(v=prev_cva_6069m); %var(v=prev_cva_7079m); %var(v=prev_cva_ge80m);
%var(v=prev_cva_4049w); %var(v=prev_cva_5059w); %var(v=prev_cva_6069w); %var(v=prev_cva_7079w); %var(v=prev_cva_ge80w); 

%var(v=htn_cost_total); %var(v=htn_cost_scr); %var(v=htn_cost_drug); %var(v=htn_cost_clin); %var(v=htn_cost_cvd);
%var(v=dhtn_cost_total); %var(v=dhtn_cost_scr); %var(v=dhtn_cost_drug); %var(v=dhtn_cost_clin); %var(v=dhtn_cost_cvd);
%var(v=dhtn_cost_totdrughalf); %var(v=dhtn_cost_totdrugdoub); %var(v=dhtn_cost_tothalf); %var(v=dhtn_cost_totdoub);

%var(v=rate_dead_cvd); %var(v=n_dead_cvd );
	%var(v=rate_dead_cvd_3039m); %var(v=rate_dead_cvd_4049m); %var(v=rate_dead_cvd_5059m); %var(v=rate_dead_cvd_6069m);
	%var(v=rate_dead_cvd_7079m); %var(v=rate_dead_cvd_ge80m); %var(v=rate_dead_cvd_3039w); %var(v=rate_dead_cvd_4049w);
	%var(v=rate_dead_cvd_5059w); %var(v=rate_dead_cvd_6069w); %var(v=rate_dead_cvd_7079w); %var(v=rate_dead_cvd_ge80w); 
	%var(v=rate_dead_hivneg_anycause); %var(v=rate_dead_hivpos_anycause); %var(v=rate_dead_all_anycause); %var(v=n_dead_all_anycause);
	%var(v=n_dead_hivpos_cvd ); %var(v=rate_dead_hivpos_cvd );
	%var(v=n_dead_hivneg_cvd ); %var(v=rate_dead_hivneg_cvd);
	%var(v=n_dead_allage ); %var(v=n_dead_hivneg_anycause ); %var(v=n_dead_hivpos_anycause );
	



data wide_outputs;merge
p_diag	 		p_diag_m	 		p_diag_w   			p_onart_diag  	p_onart_diag_w
p_onart_diag_m 	p_onart_vl1000		p_onart_vl1000_w   	p_onart_vl1000_m
p_vg1000 		p_vl1000			prevalence_vg1000
prevalence1549m	prevalence1549w 	prevalence1549 		incidence1549 	incidence1549w 	incidence1549m
dcost			ddaly

death_rate_hiv 
popge18 pop2534 pop3544 pop4554 pop5564 pop6574 pop7584 popge85

prob_sbp_increase sbp_cal_eff rr_cvd_tx rr_cvd_tx_effective

p_hypert_ge18 p_hypert_2534 p_hypert_3544 p_hypert_4554 p_hypert_5564 p_hypert_ge65
p_htn_true_ge18 p_htn_true_2534 p_htn_true_3544 p_htn_true_4554 p_htn_true_5564 p_htn_true_ge65
p_dx_htn_true_ge18 p_dx_htn_true_ge65
p_dx_htn_over_ge18 p_dx_htn_over_ge65
p_diagnosed_hypert_ge18 p_diagnosed_hypert_2534 p_diagnosed_hypert_3544 p_diagnosed_hypert_4554 p_diagnosed_hypert_5564 p_diagnosed_hypert_ge65
p_on_anti_hypert_ge18 p_on_anti_hypert_2534 p_on_anti_hypert_3544 p_on_anti_hypert_4554 p_on_anti_hypert_5564 p_on_anti_hypert_ge65
p_hypert_control_ge18 p_hypert_control_2534 p_hypert_control_3544 p_hypert_control_4554 p_hypert_control_5564 p_hypert_control_ge65

p_on1drug_antihyp_ge18 p_on2drug_antihyp_ge18 p_on3drug_antihyp_ge18 	
p_on1drug_antihyp_2544 p_on2drug_antihyp_2544 p_on3drug_antihyp_2544 	
p_on1drug_antihyp_4564 p_on2drug_antihyp_4564 p_on3drug_antihyp_4564 
p_on1drug_antihyp_ge65 p_on2drug_antihyp_ge65 p_on3drug_antihyp_ge65 	

p_hypert_2544 p_hypert_4564
p_htn_true_2544 p_htn_true_4564
p_dx_htn_true_2544 p_dx_htn_true_4564
p_dx_htn_over_2544 p_dx_htn_over_4564 
p_diagnosed_hypert_2544 p_diagnosed_hypert_4564 
p_on_anti_hypert_2544 p_on_anti_hypert_4564 
p_ever_anti_hypert_ge18 p_ever_anti_hypert_2544 p_ever_anti_hypert_4564 p_ever_anti_hypert_ge65 
p_hypert_control_2544 p_hypert_control_4564

p_hypertens160_ge18 p_hypertens160_2544 p_hypertens160_4564 p_hypertens160_ge65 
p_htn_true160_ge18 p_htn_true160_2544 p_htn_true160_4564 p_htn_true160_ge65 
p_dx_htn_true160_ge18 p_dx_htn_true160_2544 p_dx_htn_true160_4564 p_dx_htn_true160_ge65 
p_on_anti_hypert160_ge18 p_on_anti_hypert160_2544 p_on_anti_hypert160_4564 p_on_anti_hypert160_ge65 
p_hypert_control160_ge18 p_hypert_control160_2544 p_hypert_control160_4564 p_hypert_control160_ge65

rate_ihd_all_modsev_4059 rate_ihd_all_modsev_6079
rate_cva_all_modsev_4059 rate_cva_all_modsev_6079 
prev_ihd_4059 prev_ihd_6079 
prev_cva_4059 prev_cva_6079 
rate_dead_cvd_4059 rate_dead_cvd_6079
 
m_sbp_2529w m_sbp_3034w m_sbp_3539w m_sbp_4044w m_sbp_4549w m_sbp_5054w m_sbp_5559w m_sbp_6064w m_sbp_6569w m_sbp_7074w m_sbp_7579w m_sbp_ge80w  
m_sbp_2529m m_sbp_3034m m_sbp_3539m m_sbp_4044m m_sbp_4549m m_sbp_5054m m_sbp_5559m	m_sbp_6064m m_sbp_6569m m_sbp_7074m m_sbp_7579m m_sbp_ge80m 
m_sbp_2529  m_sbp_3034  m_sbp_3539  m_sbp_4044  m_sbp_4549  m_sbp_5054  m_sbp_5559	m_sbp_6064  m_sbp_6569  m_sbp_7074  m_sbp_7579  m_sbp_ge80 
m_sbp_2544 m_sbp_4564 m_sbp_ge65
m_sbp_max_over_ge18 m_sbp_over_ge18 

rate_ihd_all_modsev 
rate_ihd_all_modsev_4049m rate_ihd_all_modsev_5059m rate_ihd_all_modsev_6069m rate_ihd_all_modsev_7079m rate_ihd_all_modsev_ge80m
rate_ihd_all_modsev_4049w rate_ihd_all_modsev_5059w rate_ihd_all_modsev_6069w rate_ihd_all_modsev_7079w rate_ihd_all_modsev_ge80w 
rate_cva_all_modsev 
rate_cva_all_modsev_4049m rate_cva_all_modsev_5059m rate_cva_all_modsev_6069m rate_cva_all_modsev_7079m rate_cva_all_modsev_ge80m
rate_cva_all_modsev_4049w rate_cva_all_modsev_5059w rate_cva_all_modsev_6069w rate_cva_all_modsev_7079w rate_cva_all_modsev_ge80w 

prev_ihd 
prev_ihd_4049m prev_ihd_5059m prev_ihd_6069m prev_ihd_7079m prev_ihd_ge80m
prev_ihd_4049w prev_ihd_5059w prev_ihd_6069w prev_ihd_7079w prev_ihd_ge80w 

prev_cva 
prev_cva_4049m prev_cva_5059m prev_cva_6069m prev_cva_7079m prev_cva_ge80m
prev_cva_4049w prev_cva_5059w prev_cva_6069w prev_cva_7079w prev_cva_ge80w 

/*
rate_ihd_one 
rate_ihd_one_4049m rate_ihd_one_5059m rate_ihd_one_6069m rate_ihd_one_7079m rate_ihd_one_ge80m
rate_ihd_one_4049w rate_ihd_one_5059w rate_ihd_one_6069w rate_ihd_one_7079w rate_ihd_one_ge80w 
rate_cva_one 
rate_cva_one_4049m rate_cva_one_5059m rate_cva_one_6069m rate_cva_one_7079m rate_cva_one_ge80m
rate_cva_one_4049w rate_cva_one_5059w rate_cva_one_6069w rate_cva_one_7079w rate_cva_one_ge80w 
rate_ihd_all 
rate_ihd_all_4049m rate_ihd_all_5059m rate_ihd_all_6069m rate_ihd_all_7079m rate_ihd_all_ge80m
rate_ihd_all_4049w rate_ihd_all_5059w rate_ihd_all_6069w rate_ihd_all_7079w rate_ihd_all_ge80w 
rate_cva_all 
rate_cva_all_4049m rate_cva_all_5059m rate_cva_all_6069m rate_cva_all_7079m rate_cva_all_ge80m
rate_cva_all_4049w rate_cva_all_5059w rate_cva_all_6069w rate_cva_all_7079w rate_cva_all_ge80w 
rate_ihd_one_modsev 
rate_ihd_one_modsev_4049m rate_ihd_one_modsev_5059m rate_ihd_one_modsev_6069m rate_ihd_one_modsev_7079m rate_ihd_one_modsev_ge80m
rate_ihd_one_modsev_4049w rate_ihd_one_modsev_5059w rate_ihd_one_modsev_6069w rate_ihd_one_modsev_7079w rate_ihd_one_modsev_ge80w 
rate_cva_one_modsev 
rate_cva_one_modsev_4049m rate_cva_one_modsev_5059m rate_cva_one_modsev_6069m rate_cva_one_modsev_7079m rate_cva_one_modsev_ge80m
rate_cva_one_modsev_4049w rate_cva_one_modsev_5059w rate_cva_one_modsev_6069w rate_cva_one_modsev_7079w rate_cva_one_modsev_ge80w 
*/

rate_dead_cvd n_dead_cvd 
rate_dead_cvd_3039m	rate_dead_cvd_4049m rate_dead_cvd_5059m rate_dead_cvd_6069m rate_dead_cvd_7079m rate_dead_cvd_ge80m rate_dead_cvd_3039w 
rate_dead_cvd_4049w rate_dead_cvd_5059w rate_dead_cvd_6069w rate_dead_cvd_7079w rate_dead_cvd_ge80w 
rate_dead_hivneg_anycause rate_dead_hivpos_anycause rate_dead_hivpos_cvd
rate_dead_all_anycause n_dead_all_anycause
n_dead_hivpos_cvd  rate_dead_hivpos_cvd 
n_dead_hivneg_cvd  rate_dead_hivneg_cvd

htn_cost_total htn_cost_scr htn_cost_drug htn_cost_clin htn_cost_cvd
dhtn_cost_total dhtn_cost_scr dhtn_cost_drug dhtn_cost_clin dhtn_cost_cvd
dhtn_cost_totdrughalf dhtn_cost_totdrugdoub dhtn_cost_tothalf dhtn_cost_totdoub

n_dead_allage n_dead_hivneg_anycause n_dead_hivpos_anycause



;


proc sort; by run; run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2022.5; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

/*ADD PROJECT SPECIFIC PARAMETERS OF INTEREST*/
/*
%par(p=sf_2021); %par(p=dataset);
*/

run;

data wide_par; merge 

/* sf_2021 dataset */
;

proc contents; run;

run;
proc sort; by run;run;


* To get one row per run;

  data a.w_base; 
* merge   wide_outputs  wide_par wide_par_after_int_option0  wide_par_after_int_option1  ; * this if you have parameter values changing after
  baseline that you need to track the values of;
  merge   wide_outputs  wide_par ;  
  by run;run;
proc contents;run;


ods html;

proc means data=a.w_base n p50 p5 p95 mean;
var 

;
run;





ods html close;

