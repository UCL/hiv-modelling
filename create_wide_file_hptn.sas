

* options user="/folders/myfolders/";

 proc printto      log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";


libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";

libname b "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\hptn5_out\";


data i1; set b.out1:;data i2; set b.out2:; data i3; set b.out3:; data i4; set b.out4:; data i5; set b.out5:; 
data i6; set b.out6:; data i7; set b.out7:; data i8; set b.out8:; data i9; set b.out9:;  


%let laprv = hptn5    ;

data g_&laprv;  set  i1 i2 i3 i4 i5 i6 i7 i8 i9 ;


proc sort data=g_&laprv; 
by run cald option;
run;



* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;

set g_&laprv ;

if cald=2022.5;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = 10000000 / s_alive;
keep run sf_2022;

proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2022;



data y; 
merge g_&laprv sf;
by run ;


* preparatory code ;

* ================================================================================= ;

if s_pregnant_oth_dol_adv_birth_e = . then s_pregnant_oth_dol_adv_birth_e = 0;

pregnant_hiv_diagnosed = s_pregnant - s_pregnant_not_diagnosed_pos;

s_m_newp = s_m_1524_newp  +	 s_m_2534_newp  +  s_m_3544_newp +   s_m_4554_newp  +	s_m_5564_newp ;
s_w_newp = s_w_1524_newp  +	 s_w_2534_newp  +  s_w_3544_newp +   s_w_4554_newp  +	s_w_5564_newp ;

s_i_m_newp = s_i_age1_m_newp + s_i_age2_m_newp + s_i_age3_m_newp + s_i_age4_m_newp + s_i_age5_m_newp ;
s_i_w_newp = s_i_age1_w_newp + s_i_age2_w_newp + s_i_age3_w_newp + s_i_age4_w_newp + s_i_age5_w_newp ;

*r_bir_w_infected_child_ = rate_birth_with_infected_child_;

* ================================================================================= ;


* discount rate;

* ================================================================================= ;

* discount rate is 3%; 
* note discounting is from 2022 - no adjustment needed;
* ts1m - this code needs to change for ts1m;

* %let year_start_disc=2023.5;
* discount_10py = 1/(1.10**(cald-&year_start_disc));
* The following can be changed if we want instead 10% discount rate;
* %let discount=discount_3py;


* ================================================================================= ;





* dalys and life years;

* ================================================================================= ;

ly = s_ly * &sf;
dly = s_dly * &sf;

s_ddaly = s_dead_ddaly + s_live_ddaly;

dead_ddaly_ntd = s_dead_ddaly_ntd * &sf * 4 * (0.0022 / 0.0058); 
*  0.21% is 0.30% minus background rate in hiv uninfected 0.08% ;
*  0.58%  is 0.67% updated Zash data from ias2018 minus background rate in hiv uninfected 0.09% ;

ddaly = s_ddaly * &sf * 4;


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



* ================================================================================= ;



* costs ;

* ================================================================================= ;

* all costs expressed as $ millions per year in 2018 USD;

* ts1m - 12 instead of 4; 

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
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep_oral=. then s_dcost_prep_oral=0;
if s_dcost_prep_inj=. then s_dcost_prep_inj=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_inj;

* ts1m - 12 instead of 4; 
dvis_cost = s_dvis_cost * &sf * 4 / 1000;
dart_1_cost = s_dart_1_cost * &sf * 4 / 1000;
dart_2_cost = s_dart_2_cost * &sf * 4 / 1000;
dart_3_cost = s_dart_3_cost * &sf * 4 / 1000;
dart_cost = s_dart_cost * &sf * 4 / 1000;
dvl_cost = s_dvl_cost * &sf * 4 / 1000;
dcd4_cost = s_dcd4_cost * &sf * 4 / 1000;
dadc_cost = s_dadc_cost * &sf * 4 / 1000;
dnon_tb_who3_cost = s_dnon_tb_who3_cost * &sf * 4 / 1000;
dtb_cost = s_dtb_cost * &sf * 4 / 1000;
dtest_cost = s_dtest_cost * &sf * 4 / 1000;
dcot_cost = s_dcot_cost * &sf * 4 / 1000;
dres_cost = s_dres_cost * &sf * 4 / 1000;
d_t_adh_int_cost = s_d_t_adh_int_cost * &sf * 4 / 1000;  
dcost_cascade_interventions = s_dcost_cascade_interventions * &sf * 4 / 1000;  
dcost_prep = s_dcost_prep * &sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * &sf * 4 / 1000; 			   
dcost_prep_ac_adh = s_dcost_prep_ac_adh * &sf * 4 / 1000; 

* note this below can be used if outputs are from program beyond 1-1-20;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000;
  dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; 

dclin_cost = dadc_cost+dnon_tb_who3_cost+dcot_cost+dtb_cost;

* sens analysis;

* ;


dart_cost_y = dzdv_cost + dten_cost + d3tc_cost + dnev_cost + dlpr_cost + ddar_cost + dtaz_cost +  defa_cost + ddol_cost ;

dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost+dres_cost + dtest_cost + d_t_adh_int_cost
		+ dswitchline_cost + dcost_drug_level_test+dcost_cascade_interventions + dcost_circ + dcost_condom_dn + dcost_prep_visit + dcost_prep +
		dcost_child_hiv + dcost_non_aids_pre_death ;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost + d_t_adh_int_cost + 
				dswitchline_cost; 

cost_clin_care = dcost_clin_care / discount;

cost = dcost / discount;


* ================================================================================= ;


* derived variables relating to population, not only those with hiv ;

if s_ai_naive_no_pmtct_c_nnm_ = . then s_ai_naive_no_pmtct_c_nnm_ = 0; 
if s_ai_naive_no_pmtct_c_pim_ = . then s_ai_naive_no_pmtct_c_pim_ = 0;
if s_ai_naive_no_pmtct_e_inm_ = . then s_ai_naive_no_pmtct_e_inm_ = 0;
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

s_hiv = s_hivge15 ;


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

* p_m_newp_ge1_age1549;			p_m_newp_ge1_age1549 = (s_m1549_newp_ge1) / (s_alive1549_m) ;
* p_w_newp_ge1_age1549;			p_w_newp_ge1_age1549 = (s_w1549_newp_ge1) / (s_alive1549_w) ;

* p_1524_newp_ge1;				p_1524_newp_ge1 = ( s_m1524_newp_ge1 + s_m1524_newp_ge1 ) 
									/ (s_ageg1517m + s_ageg1819m + s_ageg1519m + s_ageg2024m + s_ageg1517w + s_ageg1819w + s_ageg1519w + s_ageg2024w ) ;

* p_newp_ge5;					p_newp_ge5 = s_newp_ge5 / s_alive1564 ;

* p_ep;							p_ep = s_ep / s_alive1564 ;

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
* n_tested_w;					n_tested_w = s_tested_f * &sf * 4;
* n_tested_sw;					n_tested_sw = s_tested_sw * &sf * 4;
* n_tested;						n_tested = s_tested * &sf * 4;

* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* of people alive and within 1 year of infection, proportion diagnosed ;
* prop_diag_infection_1yr;		prop_diag_infection_1yr = s_year_1_infection_diag / s_year_1_infection ;

* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;

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

* p_vmmc;						p_vmmc = s_vmmc / s_alive_m ;
* p_vmmc_1519m;					p_vmmc_1519m = s_vmmc1519m / s_ageg1519m ;
* p_vmmc_2024m;					p_vmmc_2024m = s_vmmc2024m / s_ageg2024m ;
* p_vmmc_2529m;					p_vmmc_2529m = s_vmmc2529m / s_ageg2529m ;
* p_vmmc_3039m;					p_vmmc_3039m = s_vmmc3039m / (s_ageg3034m + s_ageg3539m) ;
* p_vmmc_4049m;					p_vmmc_4049m = s_vmmc4049m / (s_ageg4044m + s_ageg4549m) ;
* p_vmmc_5064m;					p_vmmc_5064m = s_vmmc5064m / (s_ageg5054m + s_ageg5559m + s_ageg6064m) ;
* p_vmmc_1549m;					p_vmmc_1549m = s_vmmc1549m / s_ageg1549m ;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_program_visit;		prop_sw_program_visit = s_sw_program_visit / s_sw_1564 ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then  
								prop_sw_newp0 = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp = s_sw_newp/s_sw_1564;

* prep;

s_hiv_cab = s_hiv_cab_3m + s_hiv_cab_6m + s_hiv_cab_9m + s_hiv_cab_ge12m;

* proportion of those on prep who have ge 1 newp in the period ;
* p_prep_newp ;					if s_prep_all > 0 then p_prep_newp = (s_newp_this_per_hivneg_m_prep + s_newp_this_per_hivneg_w_prep) / s_prep_all ; 

* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;

* p_prep_elig_past_year;		p_prep_elig_past_year = s_prep_all_elig_past_year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);
* p_prep_elig_past_5year;		p_prep_elig_past_5year = s_prep_all_elig_past_5year / ((s_alive1564_w + s_alive1564_m) - s_hiv1564);

* mean_newp_ppers_prep;			if s_prep_all > 0 then mean_newp_ppers_prep = s_prep_newp / s_prep_all ;

* prop_onprep_newpge1;			if s_prep_all > 0 then prop_onprep_newpge1 = (s_prep_newpg1 + s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_all ;
* prop_onprep_newpge2;			if s_prep_all > 0 then prop_onprep_newpge2 = (s_prep_newpg2 + s_prep_newpg3 + s_prep_newpg4)/ s_prep_all ;
* prop_onprep_newpge3;			if s_prep_all > 0 then prop_onprep_newpge3 = (s_prep_newpg3 + s_prep_newpg4)/ s_prep_all ;

* p_newp_this_per_prep;			p_newp_this_per_prep = s_newp_this_per_prep / s_newp_this_per_hivneg ;  * newp this per means at least one newp ;

* prop_elig_on_prep;			if s_elig_prep_all > 0 then prop_elig_on_prep = s_prep_all / s_elig_prep_all ;

* p_newp_prep;					p_newp_prep = s_prep_newp / (s_m_newp + s_w_newp) ;  * proportion of all newp for which person is on prep;

* p_newp_prep_hivneg;			p_newp_prep_hivneg = s_prep_newp / s_newp_hivneg ;  * proportion of all newp in hiv-ve people for which person is on prep;

* prop_1564_hivneg_onprep;		prop_1564_hivneg_onprep =   max((s_prep_all -s_hiv1_prep_all), 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564) ;

* p_elig_prep;   				p_elig_prep = s_elig_prep_all / (s_alive1564 - s_hiv1564);

* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_all, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = max(s_onprep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* n_prep_all;					n_prep_all = s_prep_all * &sf;

* n_hiv1_prep;					n_hiv1_prep = s_hiv1_prep_all * &sf;

* p_hiv1_prep;					if s_prep_all gt 0 then p_hiv1_prep = s_hiv1_prep_all / s_prep_all ;

* n_prep_ever;					n_prep_ever = s_prep_all_ever * &sf;
* p_prep_all_ever;				p_prep_all_ever = s_prep_all_ever / s_alive;

* n_elig_prep_w_1524 ;			n_elig_prep_w_1524  =  s_elig_prep_all_w_1524  * &sf;
* n_elig_prep_w_2534 ;			n_elig_prep_w_2534  =  s_elig_prep_all_w_2534  * &sf;
* n_elig_prep_w_3544 ;			n_elig_prep_w_3544  = s_elig_prep_all_w_3544  * &sf;

* n_prep_w_1524  ;				n_prep_w_1524   =    s_prep_all_w_1524       * &sf;
* n_prep_w_2534  ;				n_prep_w_2534   =  s_prep_all_w_2534       * &sf;
* n_prep_w_3544  ;				n_prep_w_3544   = s_prep_all_w_3544  * &sf;

* av_prep_oral_eff_non_res_v;  	if s_prep_oral > 0 then av_prep_oral_eff_non_res_v = s_prep_oral_effect_non_res_v  / s_prep_oral;								  
																	 
* prop_art_or_prep;				prop_art_or_prep =  ( max(s_prep_all,0) + s_onart) / (s_alive1564_w + s_alive1564_m) ;

* p_prep_adhg80 ;				if s_prep_oral gt 0 then p_prep_adhg80 = s_prep_adhg80 / s_prep_oral ;

* prop_prep_inj ; 				if s_prep_all > 0 then prop_prep_inj = s_prep_inj / s_prep_all ;

* ratio_inj_prep_on_tail;		if s_prep_inj > 0 then ratio_inj_prep_on_tail = s_currently_in_prep_inj_tail / s_prep_inj ;

* pr_ever_prep_inj_res_cab;		pr_ever_prep_inj_res_cab = (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail) / s_prep_inj_ever ;
* pr_ev_prep_inj_res_cab_hiv;	pr_ev_prep_inj_res_cab_hiv = (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  / s_prep_inj_ever_hiv ; 

* of people with resistance emerging on cab-la or tail, proportion on cab-la;  
* prop_cab_res_o_cab;			prop_cab_res_o_cab = s_em_inm_res_o_cab_off_3m / (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  ;
* of people with resistance emerging on cab-la or tail, proportion in tail;
* prop_cab_res_tail;			prop_cab_res_tail = s_emerge_inm_res_cab_tail / (s_em_inm_res_o_cab_off_3m + s_emerge_inm_res_cab_tail)  ;

* of people who initiate prep_inj in same period as primary infection, proportion developing insti resistance in the period; 
* p_prep_init_primary_res;		p_prep_init_primary_res = s_prep_init_primary_res / s_prep_init_primary;
* as above but including also all reinitiations of prep;
* p_prep_reinit_primary_res;	p_prep_reinit_primary_res = (s_prep_reinit_primary_res + s_prep_init_primary_res) / 
															(s_prep_reinit_primary + s_prep_init_primary);

* of people with hiv on cab who do not have resistance, proportion developing resistance in given period; 
* p_emerge_inm_res_cab ;		p_emerge_inm_res_cab = s_em_inm_res_o_cab_off_3m /  s_o_cab_or_o_cab_tm1_no_r;
* as above but not including people in primary infection ;
* p_emerge_inm_res_cab_notpr ; 	p_emerge_inm_res_cab_notpr = s_em_inm_res_o_cab_off_3m_npr /  
															 (s_o_cab_or_o_cab_tm1_no_r - s_prep_inj_inf_or_off_3m);

* ************************ this above still needs attention;


* of people with hiv in cab tail period who do not have resistance, proportion developing resistance in given period; 
* p_emerge_inm_res_cab_tail ;	p_emerge_inm_res_cab_tail = s_emerge_inm_res_cab_tail / s_cur_in_prep_inj_tail_no_r; 

* of people on cab at time of infection, proportion developing resistance in primary infection period;
* p_emerge_inm_res_cab_prim;	p_emerge_inm_res_cab_prim = s_cab_res_prep_inj_primary / s_prep_inj_inf_or_off_3m;

* n_prep_primary_prevented;		n_prep_primary_prevented = s_prep_primary_prevented * &sf;

* p_prep_primary_prevented ; 	p_prep_primary_prevented = s_prep_primary_prevented /(s_prep_reinit_primary + s_prep_init_primary + s_prep_primary_prevented);


* prop_cab_dol_res_attr_cab ;	prop_cab_dol_res_attr_cab = (s_cab_res_o_cab + s_cab_res_tail + s_cab_res_1st_per) / s_cur_res_cab ;

* prop_prep_inj_at_inf_diag;	if s_prep_inj_at_infection + s_diagprim_prep_inj > 0 then prop_prep_inj_at_inf_diag =  s_diagprim_prep_inj /  (s_prep_inj_at_infection + s_diagprim_prep_inj);

* n_o_cab_at_3m;				n_o_cab_at_3m = s_hiv_cab_3m * &sf;  
* n_o_cab_at_6m;				n_o_cab_at_6m = s_hiv_cab_6m * &sf;  
* n_o_cab_at_9m;				n_o_cab_at_9m = s_hiv_cab_9m * &sf;  
* n_o_cab_at_ge12m;				n_o_cab_at_ge12m = s_hiv_cab_ge12m * &sf;  

* of_all_o_cab_prop_dur_3m ;    if s_hiv_cab > 0 then of_all_o_cab_prop_dur_3m = s_hiv_cab_3m / s_hiv_cab ;
* of_all_o_cab_prop_dur_6m ;    if s_hiv_cab > 0 then of_all_o_cab_prop_dur_6m = s_hiv_cab_6m / s_hiv_cab ;
* of_all_o_cab_prop_dur_9m;  	if s_hiv_cab > 0 then of_all_o_cab_prop_dur_9m = s_hiv_cab_9m / s_hiv_cab ;
* of_all_o_cab_prop_dur_ge12m ; if s_hiv_cab > 0 then of_all_o_cab_prop_dur_ge12m = s_hiv_cab_ge12m / s_hiv_cab ;

* p_prep_inj_hiv;				if s_prep_inj > 0 then p_prep_inj_hiv = s_hiv_cab / s_prep_inj ; 
								  
* n_emerge_inm_res_cab ;		n_emerge_inm_res_cab = s_emerge_inm_res_cab * &sf;
* p_em_inm_res_ever_prep_inj ;	p_em_inm_res_ever_prep_inj = s_emerge_inm_res_cab / s_prep_inj_ever ;

* n_switch_prep_from_oral ; 	n_switch_prep_from_oral = s_switch_prep_from_oral  * &sf;
* n_switch_prep_from_inj ;		n_switch_prep_from_inj = s_switch_prep_from_inj * &sf ;
* n_switch_prep_to_oral ; 		n_switch_prep_to_oral = s_switch_prep_to_oral * &sf ;
* n_switch_prep_to_inj ;		n_switch_prep_to_inj = s_switch_prep_to_inj * &sf ;

* n_prep_all_start;				n_prep_all_start = s_prep_all_start * &sf; 
* n_prep_oral_start;			n_prep_oral_start = s_prep_oral_start * &sf; 
* n_prep_inj_start;				n_prep_inj_start = s_prep_inj_start * &sf; 
* n_prep_vr_start;				n_prep_vr_start = s_prep_vr_start * &sf; 

* n_cur_res_cab;				n_cur_res_cab = s_cur_res_cab * &sf ;
* n_cur_res_dol;				n_cur_res_dol = s_iime_ * &sf ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;

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

* incidence_onprep ; 			if s_prep_all > 0 then incidence_onprep  = (s_primary_prep * 4 * 100) / s_prep_all ;

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

* r_prev_sex_1549 ;				r_prev_sex_1549 = prevalence1549w / prevalence1549m ;


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
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag / s_hiv     ;  p_diag = p_diag * 100;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w * 100;

* p_diag_m1524;					if s_hiv1524m > 0 then p_diag_m1524 = (s_diag_m1519_+s_diag_m2024_)/(s_hiv1524m);
* p_diag_w1524;					if s_hiv1524w > 0 then p_diag_w1524 = (s_diag_w1519_+s_diag_w2024_)/(s_hiv1524w);

* p_diag_sw;					if s_sw_1564 > 0 then p_diag_sw = s_diag_sw / s_sw_1564; 

* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_pim;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_pim = s_ai_naive_no_pmtct_c_pim_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt184m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt184m = s_ai_naive_no_pmtct_c_rt184m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rt65m;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rt65m = s_ai_naive_no_pmtct_c_rt65m_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_c_rttams;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_rttams = s_ai_naive_no_pmtct_c_rttams_ / s_ai_naive_no_pmtct_;
* p_ai_no_arv_e_inm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_e_inm = s_ai_naive_no_pmtct_e_inm_ / s_ai_naive_no_pmtct_;

* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if s_hivge15 gt 0 then p_onart = s_onart / s_hivge15; 

* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;
* n_onart  ;					n_onart   = s_onart   * &sf;

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

* p_u_vfail1_this_period;		p_u_vfail1_this_period = s_u_vfail1_this_period / (s_onart - s_u_vfail1);

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

* p_onart_m;					if s_hivge15m > 0 then p_onart_m = s_onart_m / s_hivge15m  ;
* p_onart_w;					if s_hivge15w  > 0 then p_onart_w = s_onart_w / s_hivge15w  ;  
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_1524;			if s_onart_gt6m_iicu_1524_ > 0 then p_onart_vl1000_1524 = s_vl1000_art_gt6m_iicu_1524_ / s_onart_gt6m_iicu_1524_ ;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

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

* n deaths and death rate by cause and hiv status - age 15+ ;

			n_dead_hivpos_cause1 = s_dead_hivpos_cause1 * 4 * &sf; 
			rate_dead_hivpos_cause1 = (s_dead_hivpos_cause1 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_tb = s_dead_hivpos_tb  * 4* &sf; 
			rate_dead_hivpos_tb = (s_dead_hivpos_tb * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause4 = s_dead_hivpos_cause4  * 4* &sf; 
			rate_dead_hivpos_cause4 = (s_dead_hivpos_cause4 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_crypm = s_dead_hivpos_crypm  * 4* &sf; 
			rate_dead_hivpos_crypm = (s_dead_hivpos_crypm * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_sbi = s_dead_hivpos_sbi  * 4* &sf; 
			rate_dead_hivpos_sbi = (s_dead_hivpos_sbi * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_oth_adc = s_dead_hivpos_oth_adc  * 4* &sf; 
			rate_dead_hivpos_oth_adc = (s_dead_hivpos_oth_adc * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause2 = s_dead_hivpos_cause2  * 4* &sf; 
			rate_dead_hivpos_cause2 = (s_dead_hivpos_cause2 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cause3 = s_dead_hivpos_cause3  * 4* &sf; 
			rate_dead_hivpos_cause3 = (s_dead_hivpos_cause3 * 4 * 100) / s_hivge15 ;
			n_dead_hivpos_cvd = s_dead_hivpos_cvd  * 4* &sf; 
			rate_dead_hivpos_cvd = (s_dead_hivpos_cvd * 4 * 100) / s_hivge15 ;
			n_dead_cvd = s_dead_cvd  * 4* &sf; 
			rate_dead_cvd = (s_dead_cvd * 4 * 100) / s_alive ;
			n_dead_tb = s_dead_tb  * 4* &sf; 
			rate_dead_tb = (s_dead_tb * 4 * 100) / s_alive ;
			n_dead_hivneg_cvd = s_dead_hivneg_cvd  * 4* &sf; 
			rate_dead_hivneg_cvd = (s_dead_hivneg_cvd * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_tb = s_dead_hivneg_tb  * 4* &sf; 
			rate_dead_hivneg_tb = (s_dead_hivneg_tb * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause2 = s_dead_hivneg_cause2  * 4* &sf; 
			rate_dead_hivneg_cause2 = (s_dead_hivneg_cause2 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause3 = s_dead_hivneg_cause3  * 4* &sf; 
			rate_dead_hivneg_cause3 = (s_dead_hivneg_cause3 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause4 = s_dead_hivneg_cause4  * 4* &sf; 
			rate_dead_hivneg_cause4 = (s_dead_hivneg_cause4 * 4 * 100) / (s_alive - s_hivge15) ;
			n_dead_hivneg_cause5 = s_dead_hivneg_cause5  * 4* &sf; 
			rate_dead_hivneg_cause5 = (s_dead_hivneg_cause5 * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_allage = (s_dead_allage * 4 * 100) / s_alive ;
			rate_dead_hivneg_anycause = (s_dead_hivneg_anycause * 4 * 100) / (s_alive - s_hivge15) ;
			rate_dead_hivpos_anycause = (s_dead_hivpos_anycause * 4 * 100) / s_hivge15 ;

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


* n_death_hiv;					n_death_hiv = s_death_hiv  * 4* &sf;
* n_death_covid;				n_death_covid = s_death_dcause3_allage  * 4* &sf;
* n_death;						n_death = s_dead  * 4 * &sf;
* n_covid;						n_covid = s_covid  * 4 * &sf;
* n_death_hivneg_anycause;		n_death_hivneg_anycause = s_dead_hivneg_anycause  * 4 * &sf;
* n_death_hivpos_anycause;		n_death_hivpos_anycause = s_dead_hivpos_anycause  * 4 * &sf;

* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
													
* n_cd4_lt200;					n_cd4_lt200 = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * &sf; 

* n_cd4_lt50;					n_cd4_lt50 = s_cd4_g1 * &sf; 
* n_hiv;						n_hiv = s_hivge15 * &sf;
* n_alive;						n_alive = s_alive * &sf;

inc_adeathr_disrup_covid = inc_death_rate_aids_disrup_covid ;

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
n_new_inf1549w = s_primary1549w * &sf * 4;
n_new_inf1549 = s_primary1549 * &sf * 4;
n_infection  = s_primary     * &sf * 4;

keep run option &sf cald cost dataset  p_m_newp_ge1_age1549 p_w_newp_ge1_age1549 n_hiv n_alive
s_alive p_w_giv_birth_this_per p_newp_ge1 p_1524_newp_ge1 p_newp_ge5 p_newp_ge1_age1549 gender_r_newp  av_newp_ge1  av_newp_ge1_non_sw
p_newp_sw  n_tested_m  n_tested_w   p_tested_past_year_1549m  p_tested_past_year_1549w
p_diag_m1524 p_diag_w1524 p_diag_sw  p_onart_cd4_l200
p_mcirc p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3034m p_mcirc_3539m p_mcirc_4044m p_mcirc_4549m p_mcirc_5064m p_mcirc_1549m
p_vmmc p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_5064m p_vmmc_1549m																								 
prop_w_1549_sw  prop_w_1564_sw	prop_w_ever_sw prop_sw_program_visit
prop_sw_hiv prop_w_1524_onprep prop_1564_hivneg_onprep prop_sw_onprep p_prep_adhg80
prevalence1549m prevalence1549w prevalence1549 
prevalence1519w 	prevalence1519m 	  prevalence2024w 	  prevalence2024m 	  prevalence2529w 	  prevalence2529m   prevalence3034w   
prevalence3034m 	prevalence3539w 	  prevalence3539m 	  prevalence4044w 	 prevalence4044m 	  prevalence4549w 	  prevalence4549m 		
prevalence5054w prevalence5054m prevalence5559w prevalence5559m prevalence6064w prevalence6064m prevalence65plw prevalence65plm
prevalence1524w prevalence1524m  prevalence_sw  r_prev_sex_1549  prevalence_hiv_preg
r_prev_1519w_4549w r_prev_2024w_4549w r_prev_2529w_4549w r_prev_3034w_4549w r_prev_3539w_4549w 	
r_prev_4044w_4549w  r_prev_5054w_4549w r_prev_5559w_4549w r_prev_6064w_4549w r_prev_65plw_4549w 
r_prev_1519m_4549w r_prev_2024m_4549w  r_prev_2529m_4549w r_prev_3034m_4549w r_prev_3539m_4549w r_prev_4044m_4549w r_prev_4549m_4549w
r_prev_5054m_4549w r_prev_5559m_4549w r_prev_6064m_4549w r_prev_65plm_4549w
incidence1549 incidence1564 incidence1549w  incidence1549m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive p_inf_primary 
p_sw_newinf p_w1524_newinf p_w25ov_newinf p_m1524_newinf p_m25ov_newinf mtct_prop  incidence_onprep
p_diag p_diag_m p_diag_w prop_diag_infection_1yr p_ai_no_arv_c_nnm prop_sw_newp0  t_sw_newp
p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m   p_ai_no_arv_c_rttams  p_ai_no_arv_e_inm
p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw
p_efa p_taz p_ten p_zdv p_dol  p_3tc p_lpr p_nev 
p_onart_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w   p_vl1000_m_1524  p_vl1000_w_1524    
p_onart_m p_onart_w p_onart_vl1000_w p_onart_vl1000_m  p_onart_vl1000_1524	  p_onart_vl1000_sw
prevalence_vg1000  prev_vg1000_newp_m prev_vg1000_newp_w  p_startedline2
 p_tle p_tld p_zld p_zla p_otherreg p_drug_level_test p_linefail_ge1 aids_death_rate  death_rate_onart  ddaly  ddaly_all  dcost dart_cost_y
dadc_cost   dcd4_cost   dvl_cost   dvis_cost   dnon_tb_who3_cost   dcot_cost   dtb_cost   dres_cost   dtest_cost   d_t_adh_int_cost   dswitchline_cost
dclin_cost     dcost_circ  dcost_condom_dn dcost_prep_visit  dcost_prep  dcost_drug_level_test
dcost_clin_care dcost_non_aids_pre_death  dcost_child_hiv  dzdv_cost   dten_cost   d3tc_cost   dnev_cost   dlpr_cost   ddar_cost   dtaz_cost    
defa_cost   ddol_cost
m15r m25r m35r m45r m55r w15r w25r w35r w45r w55r r_efa_hiv 
p_dol_2vg1000_dolr1_adh0 p_dol_2vg1000_dolr1_adh1 p_dol_2vg1000_dolr0_adh0 p_dol_2vg1000_dolr0_adh1 p_onart_cd4_l500  p_startedline2  prop_art_or_prep
n_sw_1564 n_sw_1549  prop_sw_onprep  p_onart  p_vl1000_art_12m  p_vl1000_art_12m_onart
p_o_zdv_tox p_o_3tc_tox p_o_ten_tox p_o_taz_tox p_o_lpr_tox p_o_efa_tox p_o_nev_tox p_o_dol_tox p_o_zdv_adh_hi p_o_3tc_adh_hi p_o_ten_adh_hi
p_o_taz_adh_hi p_o_lpr_adh_hi p_o_efa_adh_hi p_o_nev_adh_hi p_o_dol_adh_hi
 p_o_tle_tox  p_o_tld_tox  p_o_zla_tox  p_o_zld_tox   p_o_tle_adh_hi  p_o_tld_adh_hi  p_o_zla_adh_hi  p_o_zld_adh_hi  p_adh_hi  
s_a_zld_if_reg_op_116  p_nactive_ge2p75_xyz p_adh_hi_xyz_ot1  p_adh_hi_xyz_ot2  p_adh_hi_xyz_itt  p_e_rt65m_xyz  
p_nactive_ge2p00_xyz  p_nactive_ge1p50_xyz  p_k65m  p_m184m  p_artexp_vl1000 p_k65m_all p_m184m_all
p_184m_ontle_vlg1000  p_65m_ontle_vlg1000  p_nnm_ontle_vlg1000   p_184m_ontld_vlg1000   p_65m_ontld_vlg1000  
p_nnm_ontld_vlg1000   p_inm_ontld_vlg1000   p_inm_ontld_vlg1000  p_tams_ontle_vlg1000   p_tams_ontld_vlg1000 p_vlg1000_184m p_vlg1000_65m
death_rate_hiv death_rate_hiv_w death_rate_hiv_m death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w
n_new_inf1549m n_new_inf1549w n_new_inf1549 n_infection p_iime   p_pime   p_nnme  n_pregnant_ntd  n_preg_odabe
ddaly_non_aids_pre_death ddaly_ac_ntd_mtct ddaly_ac_ntd_mtct_odabe ddaly_ntd_mtct_napd ddaly_ntd_mtct_odab_napd ddaly  ddaly_all 
n_birth_with_inf_child  dead_ddaly_ntd   ddaly_mtct   dead_ddaly_odabe n_tested n_tested_sw p_vlg1000_onart_65m  p_vlg1000_onart_184m  p_elig_prep
prop_elig_on_prep n_hiv1_prep  n_prep  n_covid  n_death_covid n_death n_death_hiv 
p_prep_ever  p_hiv1_prep incidence1524w   incidence1524m incidence2534w   incidence2534m incidence3544w   incidence3544m 
incidence4554w   incidence4554m incidence5564w   incidence5564m incidence_sw test_prop_positive  p_newp_prep  
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
n_cd4_lt50 n_cd4_lt200
p_age1549_hivneg p_age1549_hiv
rate_dead_cvd_3039m	rate_dead_cvd_4049m rate_dead_cvd_5059m rate_dead_cvd_6069m rate_dead_cvd_7079m rate_dead_cvd_ge80m rate_dead_cvd_3039w 
rate_dead_cvd_4049w rate_dead_cvd_5059w rate_dead_cvd_6069w rate_dead_cvd_7079w rate_dead_cvd_ge80w n_death_hivpos_anycause
sf_2021 sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e  higher_newp_less_engagement
fold_tr switch_for_tox  rate_test_startprep_all 
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv
higher_future_prep_coverage  sens_test_prep

eff_max_freq_testing     eff_rate_restart    eff_prob_loss_at_diag     eff_rate_lost  eff_prob_lost_art   eff_rate_return   eff_pr_art_init  
eff_rate_int_choice      eff_prob_vl_meas_done    eff_pr_switch_line    eff_rate_test_startprep       eff_rate_choose_stop_prep   
eff_prob_prep_restart_choice    eff_test_targeting 

circ_improvements  reg_option_104

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

exp_setting_lower_p_vl1000  
external_exp_factor   rate_exp_set_lower_p_vl1000    max_freq_testing  
test_targeting    prob_loss_at_diag   pr_art_init   
rate_lost   prob_lost_art   rate_return   rate_restart   rate_int_choice  
clinic_not_aw_int_frac    rate_loss_persistence   incr_rate_int_low_adh  
fold_change_mut_risk   adh_effect_of_meas_alert   pr_switch_line   prob_vl_meas_done  
red_adh_tb_adc   red_adh_tox_pop   add_eff_adh_nnrti   altered_adh_sec_line_pop  
prob_return_adc   higher_newp_less_engagement  higher_newp_with_lower_adhav
fold_tr fold_tr_newp  switch_for_tox     base_rate_sw   prep_depends_on_pr_vl_1000

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
	
e_decr_hard_reach_year_i   
vmmc_disrup_covid  condom_disrup_covid  prep_disrup_covid  swprog_disrup_covid  
testing_disrup_covid  art_tld_disrup_covid  art_tld_eod_disrup_covid   art_init_disrup_covid   
vl_adh_switch_disrup_covid  cotrim_disrup_covid    no_art_disrup_covid 
inc_adeathr_disrup_covid art_low_adh_disrup_covid  cov_death_risk_mult 

n_mcirc1549_  n_mcirc1549_3m n_vmmc1549_ n_vmmc1549_3m n_new_inf1549m n_new_inf1549w n_new_inf1549 

p_prep_newp  prop_1564m_onprep  prop_1564w_onprep  p_prep_elig_past_year  p_prep_elig_past_5year  mean_newp_ppers_prep  prop_onprep_newpge1
prop_onprep_newpge2 prop_onprep_newpge3  prop_1564_onprep

p_onart_m_age50pl p_onart_w_age50pl  n_onart

prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m  p_diag_w p_diag_m p_onart_vl1000 
 n_new_inf1549m n_new_inf1549w  n_tested_m n_tested_w
test_prop_positive   eff_rate_choose_stop_prep    sens_vct_test_type_3  prep_efficacy   p_ep  prob_prep_all_visit_counsel
 s_cost_prep s_cost_prep_visit

dcost_80 ddaly_80

prop_prep_inj  ratio_inj_prep_on_tail pr_ever_prep_inj_res_cab pr_ev_prep_inj_res_cab_hiv
prop_cab_res_o_cab prop_cab_res_tail  prop_prep_inj_at_inf_diag 
of_all_o_cab_prop_dur_3m  of_all_o_cab_prop_dur_6m   of_all_o_cab_prop_dur_9m of_all_o_cab_prop_dur_ge12m
p_prep_inj_hiv  prop_cab_dol_res_attr_cab  n_cur_res_cab  n_cur_res_dol

n_emerge_inm_res_cab  n_switch_prep_from_oral  n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_all_start n_prep_oral_start n_prep_inj_start n_prep_vr_start n_prep_all

prop_elig_on_prep p_elig_prep p_hiv1_prep prop_onprep_newpge1 p_prep_elig_past_year p_prep_newp prop_sw_onprep rate_choose_stop_prep_oral
adh_pattern_prep_oral prep_all_strategy prep_all_uptake_pop effect_sw_prog_prep_all prob_prep_all_restart_choice rate_test_onprep_all

prep_willingness_threshold  pr_prep_oral_b  pr_prep_inj_b  rel_prep_oral_adh_younger  prep_oral_efficacy  higher_future_prep_oral_cov
prep_inj_efficacy  rate_choose_stop_prep_inj  

prep_inj_effect_inm_partner  rel_pr_inm_inj_prep_tail_1st_per
rr_res_cab_dol   hivtest_type_1_init_prep_inj    
hivtest_type_1_prep_inj 
sens_testtype3_from_inf_0    sens_testtype3_from_inf_p25   sens_testtype3_from_inf_gep5 
sens_testtype1_from_inf_0    sens_testtype1_from_inf_p25   sens_testtype1_from_inf_gep5  prep_all_uptake_pop 
p_prep_all_ever  cab_time_to_lower_threshold_g  sens_tests_prep_inj
 
n_o_cab_at_3m   n_o_cab_at_6m   n_o_cab_at_9m   n_o_cab_at_ge12m  dol_higher_potency  p_em_inm_res_ever_prep_inj

ddaly  p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail  pr_inm_inj_prep_1st_per

 s_em_inm_res_o_cab_off_3m  s_o_cab_or_o_cab_tm1_no_r   s_emerge_inm_res_cab_tail   s_cur_in_prep_inj_tail_no_r  res_trans_factor_ii

p_emerge_inm_res_cab p_emerge_inm_res_cab_tail

p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented
p_emerge_inm_res_cab_notpr   p_u_vfail1_this_period

pref_prep_inj_beta_s1    s_prep_inj_willing
;





proc sort data=y;by run option;run;

* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;

data    a.l_&laprv; set y;  

proc freq; tables run; where cald = 2020;

run;



data y; set    a.l_&laprv; 


  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2021.0 <= cald < 2022.0; 

proc means noprint data=y; var &v; output out=y_22 mean= &v._22; by run option ; where 2022.0 <= cald < 2023.0 ;
proc means noprint data=y; var &v; output out=y_23 mean= &v._23; by run option ; where 2023.0 <= cald < 2024.0 ;
proc means noprint data=y; var &v; output out=y_24 mean= &v._24; by run option ; where 2024.0 <= cald < 2025.0 ;
proc means noprint data=y; var &v; output out=y_25 mean= &v._25; by run option ; where 2025.0 <= cald < 2026.0 ;
proc means noprint data=y; var &v; output out=y_26 mean= &v._26; by run option ; where 2026.0 <= cald < 2027.0 ;
proc means noprint data=y; var &v; output out=y_27 mean= &v._27; by run option ; where 2027.0 <= cald < 2028.0 ;
proc means noprint data=y; var &v; output out=y_28 mean= &v._28; by run option ; where 2028.0 <= cald < 2029.0 ;
proc means noprint data=y; var &v; output out=y_29 mean= &v._29; by run option ; where 2029.0 <= cald < 2030.0 ;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option ; where 2030.0 <= cald < 2031.0 ;
proc means noprint data=y; var &v; output out=y_31 mean= &v._31; by run option ; where 2031.0 <= cald < 2032.0 ;
proc means noprint data=y; var &v; output out=y_22 mean= &v._22; by run option ; where 2022.0 <= cald < 2033.0 ;
proc means noprint data=y; var &v; output out=y_33 mean= &v._33; by run option ; where 2033.0 <= cald < 2034.0 ;
proc means noprint data=y; var &v; output out=y_34 mean= &v._34; by run option ; where 2034.0 <= cald < 2035.0 ;
proc means noprint data=y; var &v; output out=y_35 mean= &v._35; by run option ; where 2035.0 <= cald < 2036.0 ;
proc means noprint data=y; var &v; output out=y_36 mean= &v._36; by run option ; where 2036.0 <= cald < 2037.0 ;
proc means noprint data=y; var &v; output out=y_37 mean= &v._37; by run option ; where 2037.0 <= cald < 2038.0 ;
proc means noprint data=y; var &v; output out=y_38 mean= &v._38; by run option ; where 2038.0 <= cald < 2039.0 ;
proc means noprint data=y; var &v; output out=y_39 mean= &v._39; by run option ; where 2039.0 <= cald < 2030.0 ;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option ; where 2030.0 <= cald < 2031.0 ;
proc means noprint data=y; var &v; output out=y_41 mean= &v._41; by run option ; where 2041.0 <= cald < 2042.0 ;
proc means noprint data=y; var &v; output out=y_42 mean= &v._42; by run option ; where 2042.0 <= cald < 2043.0 ;
																									
proc sort data=y_22; by run; proc transpose data=y_22 out=t_22 prefix=&v._22_; var &v._22; by run; 																														
proc sort data=y_23; by run; proc transpose data=y_23 out=t_23 prefix=&v._23_; var &v._23; by run; 																														
proc sort data=y_24; by run; proc transpose data=y_24 out=t_24 prefix=&v._24_; var &v._24; by run; 																														
proc sort data=y_25; by run; proc transpose data=y_25 out=t_25 prefix=&v._25_; var &v._25; by run; 																														
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
proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run; 																														
proc sort data=y_41; by run; proc transpose data=y_41 out=t_31 prefix=&v._41_; var &v._41; by run; 																														
proc sort data=y_42; by run; proc transpose data=y_42 out=t_32 prefix=&v._42_; var &v._42; by run; 	

data &v ; merge y_21 
t_22 t_23 t_24 t_25 t_26 t_27 t_28 t_29 t_30 t_31 t_32 t_33 t_34 t_35 t_36 t_37 t_38 t_39 t_40 t_41 t_42;
drop _NAME_ _TYPE_ _FREQ_;

%mend var; 

%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=p_newp_sw); %var(v=prop_sw_newp0);  %var(v=p_newp_prep);
%var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc) ; * %var(v=p_mcirc_1519m); * %var(v=p_mcirc_2024m);* %var(v=p_mcirc_2529m);
* %var(v=p_mcirc_3034m);* %var(v=p_mcirc_3539m);* %var(v=p_mcirc_4044m);* %var(v=p_mcirc_4549m); 
* %var(v=p_mcirc_5064m); * %var(v=p_mcirc_1549m);
* %var(v=p_vmmc); * %var(v=p_vmmc_1519m); * %var(v=p_vmmc_2024m);* %var(v=p_vmmc_2529m); * %var(v=p_vmmc_3039m);*  %var(v=p_vmmc_4049m);
* %var(v=p_vmmc_5064m); *  %var(v=p_vmmc_1549m);
%var(v=prop_w_1549_sw); %var(v=prop_w_1564_sw); %var(v=prop_w_ever_sw); %var(v=prop_sw_hiv); %var(v=prop_sw_program_visit); 
%var(v=prop_w_1524_onprep); %var(v=prop_1564_onprep);
%var(v=prop_sw_onprep); %var(v=prevalence1549m); %var(v=prevalence1549w); %var(v=prevalence1549); 
* %var(v=prevalence1519w); * %var(v=prevalence1519m); * %var(v=prevalence2024w); * %var(v=prevalence2024m); * %var(v=prevalence2529w);  	  
* %var(v=prevalence2529m); * %var(v=prevalence3034w);*  %var(v=prevalence3034m);* %var(v=prevalence3539w); * %var(v=prevalence3539m);  	  
* %var(v=prevalence4044w); *  %var(v=prevalence4044m); *  %var(v=prevalence4549w); *  %var(v=prevalence4549m);  
%var(v=prevalence_vg1000); %var(v=incidence1549);  %var(v=incidence1564);  %var(v=n_infection);
%var(v=prevalence1524w); *  %var(v=prevalence1524m); %var(v=prevalence_sw);
* %var(v=prevalence5054w); * %var(v=prevalence5054m); * %var(v=prevalence5559w); * %var(v=prevalence5559m); * %var(v=prevalence6064w); * %var(v=prevalence6064m); 
* %var(v=prevalence65plw); * %var(v=prevalence65plm); * %var(v=r_prev_sex_1549); * %var(v=prevalence_hiv_preg);
* %var(v=r_prev_1519w_4549w );  * %var(v=r_prev_2024w_4549w  );  * %var(v=r_prev_2529w_4549w );  * %var(v=r_prev_3034w_4549w  ); 
* %var(v=r_prev_3539w_4549w );  * %var(v=r_prev_4044w_4549w  );  * %var(v=r_prev_5054w_4549w );  * %var(v=r_prev_5559w_4549w );
* %var(v=r_prev_6064w_4549w );  * %var(v=r_prev_65plw_4549w  );  * %var(v=r_prev_1519m_4549w );  * %var(v=r_prev_2024m_4549w  );  * %var(v=r_prev_2529m_4549w );
* %var(v=r_prev_3034m_4549w );  * %var(v=r_prev_3539m_4549w  );  * %var(v=r_prev_4044m_4549w );  * %var(v=r_prev_4549m_4549w  );  * %var(v=r_prev_5054m_4549w );
* %var(v=r_prev_5559m_4549w );  * %var(v=r_prev_6064m_4549w );  * %var(v=r_prev_65plm_4549w );
%var(v=incidence1549w);  %var(v=incidence1549m);  %var(v=incidence_sw); 
%var(v=p_inf_vlsupp);  %var(v=p_inf_newp);  %var(v=p_inf_ep);  %var(v=p_inf_diag);  %var(v=p_inf_naive);   %var(v=p_inf_primary); 
%var(v=mtct_prop); %var(v=p_diag); %var(v=p_diag_m); %var(v=p_diag_w); %var(v=p_diag_sw);
* %var(v=p_diag_m1524); * %var(v=p_diag_w1524);
%var(v=p_ai_no_arv_c_nnm); %var(v=p_ai_no_arv_c_pim); %var(v=p_ai_no_arv_c_rt184m); %var(v=p_ai_no_arv_c_rt65m); %var(v=p_ai_no_arv_c_rttams); 
%var(v=p_ai_no_arv_e_inm); 
%var(v=p_artexp_diag); %var(v=p_onart_diag); %var(v=p_onart_diag_w); %var(v=p_onart_diag_m); %var(v=p_onart_diag_sw); %var(v=p_efa); %var(v=p_taz);
%var(v=p_ten); %var(v=p_zdv); %var(v=p_dol); %var(v=p_3tc); %var(v=p_lpr); %var(v=p_nev); %var(v=p_onart_vl1000);  %var(v=p_artexp_vl1000);
%var(v=p_vl1000); %var(v=p_vg1000); %var(v=p_vl1000_m);  %var(v=p_vl1000_w);  %var(v=p_vl1000_m_1524);  %var(v=p_vl1000_w_1524);  
%var(v=p_vl1000_art_12m); %var(v=p_vl1000_art_12m_onart); 
* %var(v=p_onart_m); * %var(v=p_onart_w); 
%var(v=p_onart_vl1000_w); %var(v=p_onart_vl1000_m); * %var(v= p_onart_vl1000_1524); * %var(v=p_onart_vl1000_sw);
* %var(v=prev_vg1000_newp_m); * %var(v=prev_vg1000_newp_w);  %var(v= p_startedline2) ;
* %var(v=p_tle);  * %var(v=p_tld);  * %var(v=p_zld);  * %var(v=p_zla);  * %var(v=p_otherreg);  * %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
* %var(v=aids_death_rate);    %var(v=death_rate_onart);     %var(v=dcost); *  %var(v= dart_cost_y);
* %var(v=dadc_cost); *   %var(v=dcd4_cost); *   %var(v=dvl_cost); *   %var(v=dvis_cost);  *   %var(v=dcot_cost);  *  %var(v=dtb_cost);   
* %var(v=dres_cost); *  %var(v=dtest_cost); *   %var(v=d_t_adh_int_cost); *   %var(v=dswitchline_cost); *  %var(v=dtaz_cost); *   %var(v=dcost_drug_level_test);
* %var(v=dclin_cost );  
* %var(v=dcost_circ ); *  %var(v=dcost_condom_dn);
* %var(v=dcost_prep_visit );     %var(v=dcost_prep );   * %var(v=dcost_drug_level_test ); 
  %var(v=dcost_clin_care );  * %var(v=dcost_non_aids_pre_death );  * %var(v=dcost_child_hiv );  * %var(v=dzdv_cost );   * %var(v=dten_cost );   * %var(v=d3tc_cost );   
* %var(v=dnev_cost );   * %var(v=dlpr_cost );   * %var(v=ddar_cost );   * %var(v=dtaz_cost );    * %var(v=defa_cost );   * %var(v=ddol_cost );
%var(v=m15r);  %var(v=m25r);  %var(v=m35r);  %var(v=m45r);  %var(v=m55r);  %var(v=w15r);  %var(v=w25r);  %var(v=w35r);  %var(v=w45r);  %var(v=w55r)
* %var(v=r_efa_hiv); * %var(v=p_onart_cd4_l200);
* %var(v=p_dol_2vg1000_dolr1_adh0); * %var(v=p_dol_2vg1000_dolr1_adh1); * %var(v=p_dol_2vg1000_dolr0_adh0); * %var(v=p_dol_2vg1000_dolr0_adh1);
%var(v=p_onart_cd4_l500);  %var(v=prop_art_or_prep);  * %var(v=n_sw_1564); * %var(v=n_sw_1549);   %var(v=prop_sw_onprep);   %var(v=p_onart);
* %var(v=p_o_zdv_tox);   * %var(v=p_o_3tc_tox);   * %var(v=p_o_ten_tox);   * %var(v=p_o_taz_tox);   * %var(v=p_o_lpr_tox);   * %var(v=p_o_efa_tox);   
* %var(v=p_o_nev_tox);  * %var(v=p_o_dol_tox);   * %var(v=p_o_zdv_adh_hi);   * %var(v=p_o_3tc_adh_hi);   * %var(v=p_o_ten_adh_hi);  
* %var(v=p_o_taz_adh_hi);   * %var(v=p_o_lpr_adh_hi);   * %var(v=p_o_efa_adh_hi);   * %var(v=p_o_nev_adh_hi);   * %var(v=p_o_dol_adh_hi);  
* %var(v= p_o_tle_tox);   * %var(v=p_o_tld_tox);   * %var(v=p_o_zla_tox);   * %var(v=p_o_zld_tox);    * %var(v=p_o_tle_adh_hi);   * %var(v=p_o_tld_adh_hi);   
* %var(v=p_o_zla_adh_hi);   * %var(v=p_o_zld_adh_hi);   * %var(v=p_adh_hi);    * %var(v=s_a_zld_if_reg_op_116);
* %var(v=p_nactive_ge2p75_xyz);  * %var(v=p_adh_hi_xyz_ot1);   * %var(v=p_adh_hi_xyz_ot2);   * %var(v=p_adh_hi_xyz_itt);   * %var(v=p_e_rt65m_xyz);   
%var(v=p_nactive_ge2p00_xyz);   %var(v=p_nactive_ge1p50_xyz); 
* %var(v=p_184m_ontle_vlg1000);  * %var(v=p_65m_ontle_vlg1000);  * %var(v=p_nnm_ontle_vlg1000);   * %var(v=p_184m_ontld_vlg1000);   * %var(v=p_65m_ontld_vlg1000);  
* %var(v=p_nnm_ontld_vlg1000);   * %var(v=p_inm_ontld_vlg1000);   * %var(v=p_inm_ontld_vlg1000);   
* %var(v=p_tams_ontle_vlg1000);  * %var(v=p_tams_ontld_vlg1000);    %var(v=p_k65m);   %var(v=p_m184m);
%var(v=death_rate_hiv); %var(v=death_rate_hiv_m); %var(v=death_rate_hiv_w);
%var(v=death_rate_hiv_all);%var(v=death_rate_hiv_all_m);%var(v=death_rate_hiv_all_w);
%var(v=p_iime); * %var(v=p_pime); * %var(v=p_nnme);   *  %var(v=n_pregnant_ntd); *  %var(v=n_preg_odabe);
  %var(v=n_birth_with_inf_child);  %var(v=n_tested); %var(v=n_tested_sw); %var(v=test_prop_positive);
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   * %var(v= n_hiv1_prep);
* %var(v= n_prep_all); * %var(v=n_covid); * %var(v=n_death_covid);  * %var(v=n_death);   %var(v=n_death_hiv); 
%var(v=p_prep_all_ever); %var(v=p_hiv1_prep);  %var(v=incidence1524w);   * %var(v=incidence1524m) ;
* %var(v=incidence2534w);   * %var(v=incidence2534m) ; * %var(v=incidence3544w);   * %var(v=incidence3544m) ;* %var(v=incidence4554w);   * %var(v=incidence4554m) ;
* %var(v=incidence5564w);   * %var(v=incidence5564m) ;  %var(v=incidence_sw);  * %var (v=n_mcirc1549_3m) ;* %var (v=n_vmmc1549_3m); 
* %var(v=n_new_inf1549m); * %var(v=n_new_inf1549w); * %var(v=n_new_inf1549);* %var(v=t_sw_newp) ;
* %var(v=p_hypert_1549); * %var(v=p_hypert_5059); * %var(v=p_hypert_6069); * %var(v=p_hypert_7079); * %var(v=p_hypert_ge80);
* %var(v=p_diagnosed_hypert_1549); * %var(v=p_diagnosed_hypert_5059); * %var(v=p_diagnosed_hypert_6069); * %var(v=p_diagnosed_hypert_7079); 
* %var(v=p_diagnosed_hypert_ge80);  * %var(v=p_on_anti_hypert_1549); * %var(v=p_on_anti_hypert_5059); * %var(v=p_on_anti_hypert_6069); 
* %var(v=p_on_anti_hypert_7079); * %var(v=p_on_anti_hypert_ge80); 
* %var(v=p_hypert180_1549);  * %var(v=p_hypert180_5059);  * %var(v=p_hypert180_6069);  * %var(v=p_hypert180_7079);  * %var(v=p_hypert180_ge80); 
* %var(v=p_on1drug_antihyp_1549);   * %var(v=p_on2drug_antihyp_1549);   * %var(v=p_on3drug_antihyp_1549);    * %var(v=p_on1drug_antihyp_5059);   
* %var(v=p_on2drug_antihyp_5059); 
* %var(v=p_on3drug_antihyp_5059);    * %var(v=p_on1drug_antihyp_6069);    * %var(v=p_on2drug_antihyp_6069);    * %var(v=p_on3drug_antihyp_6069);   
* %var(v=p_on1drug_antihyp_7079);    * %var(v=p_on2drug_antihyp_7079); 
* %var(v=p_on3drug_antihyp_7079);    * %var(v=p_on1drug_antihyp_ge80);    * %var(v=p_on2drug_antihyp_ge80);    * %var(v=p_on3drug_antihyp_ge80); 
* %var(v=p_ahd_re_enter_care_100);   * %var(v=p_ahd_re_enter_care_200); 
* %var(v=p_hypert_1549m);  * %var(v=p_hypert_5059m); * %var(v=p_hypert_6069m);  * %var(v=p_hypert_7079m);  * %var(v=p_hypert_ge80m);  
* %var(v=p_diagnosed_hypert_1549m); 
* %var(v=p_diagnosed_hypert_5059m);  * %var(v=p_diagnosed_hypert_6069m);  * %var(v=p_diagnosed_hypert_7079m);  * %var(v=p_diagnosed_hypert_ge80m);  
* %var(v=p_on_anti_hypert_1549m); * %var(v=p_on_anti_hypert_5059m);  * %var(v=p_on_anti_hypert_6069m);  * %var(v=p_on_anti_hypert_7079m);  
* %var(v=p_on_anti_hypert_ge80m);
* %var(v=p_hypert_1549w);  * %var(v=p_hypert_5059w); * %var(v=p_hypert_6069w);  * %var(v=p_hypert_7079w);  * %var(v=p_hypert_ge80w);  
* %var(v=p_diagnosed_hypert_1549w); 
* %var(v=p_diagnosed_hypert_5059w);  * %var(v=p_diagnosed_hypert_6069w);  * %var(v=p_diagnosed_hypert_7079w);  * %var(v=p_diagnosed_hypert_ge80w);  
* %var(v=p_on_anti_hypert_1549w); * %var(v=p_on_anti_hypert_5059w);  * %var(v=p_on_anti_hypert_6069w);  * %var(v=p_on_anti_hypert_7079w);  
* %var(v=p_on_anti_hypert_ge80w);
* %var(v=n_dead_hivpos_cause1 ); %var(v=rate_dead_hivpos_cause1); * %var(v=n_dead_hivpos_tb ); * %var(v=rate_dead_hivpos_tb); * %var(v=n_dead_hivpos_cause4 ); 
* %var(v=rate_dead_hivpos_cause4 );* %var(v=n_dead_hivpos_crypm ); * %var(v=rate_dead_hivpos_crypm); * %var(v=n_dead_hivpos_sbi ); * %var(v=rate_dead_hivpos_sbi);
* %var(v=n_dead_hivpos_oth_adc ); * %var(v=rate_dead_hivpos_oth_adc );* %var(v=n_dead_hivpos_cause2 ); * %var(v=rate_dead_hivpos_cause2 );
* %var(v=n_dead_hivpos_cause3 ); * %var(v=rate_dead_hivpos_cause3 );	* %var(v=n_dead_hivpos_cvd ); * %var(v=rate_dead_hivpos_cvd );
* %var(v=n_dead_cvd ); * %var(v=rate_dead_cvd );	* %var(v=n_dead_tb ); * %var(v=rate_dead_tb ); * %var(v=n_dead_hivneg_cvd ); * %var(v=rate_dead_hivneg_cvd);
* %var(v=n_dead_hivneg_tb ); * %var(v=rate_dead_hivneg_tb); * %var(v=n_dead_hivneg_cause2); * %var(v=rate_dead_hivneg_cause2 ); * %var(v=n_dead_hivneg_cause3 ); 
* %var(v=rate_dead_hivneg_cause3 );	* %var(v=n_dead_hivneg_cause4 ); * %var(v=rate_dead_hivneg_cause4 ); * %var(v=n_dead_hivneg_cause5 ); 
* %var(v=n_cd4_lt50); * %var(v=n_cd4_lt200);
* %var(v=rate_dead_hivneg_cause5 );  * %var(v=rate_dead_allage); * %var(v=rate_dead_hivneg_anycause); * %var(v=rate_dead_hivpos_anycause); 
* %var(v=rate_dead_cvd_3039m);	* %var(v=rate_dead_cvd_4049m); * %var(v=rate_dead_cvd_5059m); * %var(v=rate_dead_cvd_6069m); * %var(v=rate_dead_cvd_7079m); 
* %var(v=rate_dead_cvd_ge80m); * %var(v=rate_dead_cvd_3039w); 
* %var(v=rate_dead_cvd_4049w); * %var(v=rate_dead_cvd_5059w); * %var(v=rate_dead_cvd_6069w); * %var(v=rate_dead_cvd_7079w); * %var(v=rate_dead_cvd_ge80w); 
* %var(v=n_death_hivpos_anycause); * %var(v= n_death_2059_m);  * %var(v=n_death_2059_w);
* %var(v=p_age1549_hivneg );  * %var(v=p_age1549_hiv ); * %var(v=p_onart_m_age50pl ); * %var(v=p_onart_w_age50pl ); * %var(v=n_onart);
* %var(v=prevalence_hiv_preg); %var(v=p_onart_w); %var(v=p_onart_m); * %var(v=n_onart_w); * %var(v=n_onart_m);  %var(v=p_diag_w); %var(v=p_diag_m); 
%var(v=p_onart_vl1000);  * %var(v=n_new_inf1549m); * %var(v=n_new_inf1549w); 
%var(v=n_tested_w); %var(v=test_prop_positive);
%var(v=prop_prep_inj);   %var(v=ratio_inj_prep_on_tail);    %var(v=pr_ever_prep_inj_res_cab);    %var(v=pr_ev_prep_inj_res_cab_hiv);
%var(v=prop_cab_res_o_cab);    %var(v=prop_cab_res_tail);      %var(v=prop_prep_inj_at_inf_diag);   
%var(v=of_all_o_cab_prop_dur_3m);
%var(v=of_all_o_cab_prop_dur_6m);   %var(v=p_prep_inj_hiv);  %var(v=prop_cab_dol_res_attr_cab);   %var(v=n_cur_res_cab);  %var(v=n_cur_res_dol);  
%var(v=n_emerge_inm_res_cab);  %var(v=n_switch_prep_from_oral); %var(v=n_switch_prep_from_inj);  %var(v=n_switch_prep_to_oral);  
%var(v=n_switch_prep_to_inj);  %var(v=n_prep_all_start); %var(v=n_prep_oral_start);  %var(v=n_prep_inj_start); %var(v=n_prep_vr_start);
%var(v=n_prep_all); %var(v=prop_elig_on_prep); %var(v=p_elig_prep);  %var(v=p_hiv1_prep);  %var(v=prop_onprep_newpge1); %var(v=p_prep_elig_past_year); 
%var(v=p_prep_newp); %var(v=prop_sw_onprep);  %var(v=p_em_inm_res_ever_prep_inj);
%var(v=n_o_cab_at_3m);    %var(v=n_o_cab_at_6m);    %var(v=n_o_cab_at_9m);   %var(v=n_o_cab_at_ge12m); 
%var(v=ddaly); %var(v=p_emerge_inm_res_cab);  %var(v=p_emerge_inm_res_cab_tail); %var(v=ddaly_ac_ntd_mtct);
%var(v=of_all_o_cab_prop_dur_9m); %var(v=of_all_o_cab_prop_dur_ge12m);
%var(v=s_em_inm_res_o_cab_off_3m);  %var(v=s_o_cab_or_o_cab_tm1_no_r);   %var(v=s_emerge_inm_res_cab_tail);   %var(v=s_cur_in_prep_inj_tail_no_r);
%var(v=p_emerge_inm_res_cab); %var(v=p_emerge_inm_res_cab_tail);
%var(v=p_prep_init_primary_res); %var(v=p_prep_reinit_primary_res);   %var(v=p_emerge_inm_res_cab_prim);  %var(v=n_prep_primary_prevented);   
%var(v=p_prep_primary_prevented); %var(v=p_u_vfail1_this_period); %var(v=d_cost_prep); %var(v=d_cost_clin_care);




data   wide_outputs; merge 
s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5   gender_r_newp p_newp_sw prop_sw_newp0  p_newp_prep  dcost
n_tested_m p_tested_past_year_1549m   p_tested_past_year_1549w  p_mcirc  prop_w_1549_sw prop_w_1564_sw prop_w_ever_sw prop_sw_hiv 
prop_sw_program_visit prop_w_1524_onprep prop_1564_onprep prop_sw_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence_vg1000 incidence1549  incidence1564  prevalence1524w prevalence_sw incidence1549w  incidence1549m  incidence_sw 
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary mtct_prop p_diag p_diag_m p_diag_w p_diag_sw
p_ai_no_arv_c_nnm p_ai_no_arv_c_pim p_ai_no_arv_c_rt184m p_ai_no_arv_c_rt65m p_ai_no_arv_c_rttams  p_k65m  p_m184m
p_ai_no_arv_e_inm p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw p_efa p_taz
p_ten p_zdv p_dol p_3tc p_lpr p_nev p_onart_vl1000  p_artexp_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m p_vl1000_art_12m_onart  p_onart_vl1000_w p_onart_vl1000_m  p_startedline2 p_linefail_ge1 m15r  m25r  m35r  m45r  m55r  w15r  
w25r  w35r  w45r  w55r p_onart_cd4_l500  prop_art_or_prep  prop_sw_onprep   p_onart p_nactive_ge2p00_xyz   p_nactive_ge1p50_xyz death_rate_hiv 
death_rate_hiv_m death_rate_hiv_w death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w p_iime 
n_tested n_tested_sw test_prop_positive p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  
p_prep_all_ever p_hiv1_prep  incidence1524w  incidence_sw p_onart_w p_onart_m  p_diag_w p_diag_m p_onart_vl1000 n_tested_w test_prop_positive
prop_prep_inj   ratio_inj_prep_on_tail    pr_ever_prep_inj_res_cab    pr_ev_prep_inj_res_cab_hiv prop_cab_res_o_cab    prop_cab_res_tail    
prop_prep_inj_at_inf_diag   of_all_o_cab_prop_dur_3m of_all_o_cab_prop_dur_6m   p_prep_inj_hiv  prop_cab_dol_res_attr_cab   
n_cur_res_cab  n_cur_res_dol  n_emerge_inm_res_cab  n_switch_prep_from_oral n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_all_start n_prep_oral_start  n_prep_inj_start n_prep_vr_start n_prep_all prop_elig_on_prep p_elig_prep  p_hiv1_prep  prop_onprep_newpge1 
p_prep_elig_past_year p_prep_newp prop_sw_onprep  p_em_inm_res_ever_prep_inj n_o_cab_at_3m    n_o_cab_at_6m    n_o_cab_at_9m   n_o_cab_at_ge12m 
ddaly  p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail of_all_o_cab_prop_dur_9m of_all_o_cab_prop_dur_ge12m
s_em_inm_res_o_cab_off_3m  s_o_cab_or_o_cab_tm1_no_r   s_emerge_inm_res_cab_tail   s_cur_in_prep_inj_tail_no_r  p_emerge_inm_res_cab 
p_emerge_inm_res_cab_tail  n_death_hiv death_rate_onart n_birth_with_inf_child  p_u_vfail1_this_period n_infection
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented ddaly_ac_ntd_mtct
dcost_prep dcost_clin_care
;


proc sort; by run; run;

***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2022.5; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=&sf); 
%par(p=sex_beh_trans_matrix_m ); %par(p=sex_beh_trans_matrix_w ); %par(p=sex_age_mixing_matrix_m ); %par(p=sex_age_mixing_matrix_w ); %par(p=p_rred_p );
%par(p=p_hsb_p ); %par(p=newp_factor ); %par(p=eprate ) %par(p=conc_ep ); %par(p=ch_risk_diag ); %par(p=ch_risk_diag_newp );
%par(p=ych_risk_beh_newp ); %par(p=ych2_risk_beh_newp ); %par(p=ych_risk_beh_ep ); %par(p=exp_setting_lower_p_vl1000 );
%par(p=external_exp_factor ); %par(p=rate_exp_set_lower_p_vl1000 ); %par(p=prob_pregnancy_base ); %par(p=fold_change_w );
%par(p=fold_change_yw ); %par(p=fold_change_sti ); %par(p=tr_rate_undetec_vl); %par(p=super_infection_pop ); %par(p=an_lin_incr_test );
%par(p=date_test_rate_plateau ); %par(p=rate_testanc_inc ); %par(p=incr_test_rate_sympt ); %par(p=max_freq_testing );
%par(p=test_targeting ); %par(p=fx );  %par(p=gx );  %par(p=adh_pattern ); %par(p=prob_loss_at_diag ); %par(p=pr_art_init ); 
%par(p=rate_lost ); %par(p=prob_lost_art ); %par(p=rate_return ); %par(p=rate_restart ); %par(p=rate_int_choice );
%par(p=clinic_not_aw_int_frac ); %par(p=res_trans_factor_nn ); %par(p=rate_loss_persistence ); %par(p=incr_rate_int_low_adh );
%par(p=poorer_cd4rise_fail_nn ); %par(p=poorer_cd4rise_fail_ii ); %par(p=rate_res_ten );
%par(p=fold_change_mut_risk ); %par(p=adh_effect_of_meas_alert ); %par(p=pr_switch_line ); %par(p=prob_vl_meas_done );
%par(p=red_adh_tb_adc ); %par(p=red_adh_tox_pop ); %par(p=add_eff_adh_nnrti ); %par(p=altered_adh_sec_line_pop );
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=prob_lossdiag_non_tb_who3e); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=fold_tr_newp); %par(p=switch_for_tox ); %par(p=adh_pattern_prep_oral ); %par(p=rate_test_startprep_all ); 
%par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox );     %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg ); %par(p=prep_all_strategy ); 

%par(p=effect_visit_prob_diag_l);  %par(p=tb_base_prob_diag_l); %par(p=crypm_base_prob_diag_l); %par(p=tblam_eff_prob_diag_l);  
%par(p=crag_eff_prob_diag_l);%par(p=sbi_base_prob_diag_l); %par(p=rel_rate_death_tb_diag_e); %par(p=rel_rate_death_oth_adc_diag_e); 
%par(p=rel_rate_death_crypm_diag_e);%par(p=rel_rate_death_sbi_diag_e);  %par(p=incr_death_rate_tb); %par(p=incr_death_rate_oth_adc);
%par(p=incr_death_rate_crypm); %par(p=incr_death_rate_sbi);%par(p=cm_1stvis_return_vlmg1000);  %par(p=crag_cd4_l200); %par(p=crag_cd4_l100);  
%par(p=tblam_cd4_l200);  %par(p=tblam_cd4_l100);    %par(p=effect_tb_proph);   %par(p=effect_crypm_proph);  %par(p=effect_sbi_proph);

%par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); 
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); 

%par(p=effect_sw_prog_prep_all);  %par(p=prob_prep_all_restart_choice);  %par(p=prep_all_uptake_pop); 
%par(p=prob_prep_all_visit_counsel);  %par(p=rate_test_onprep_all); %par(p=prep_willingness_threshold);  
%par(p=prep_all_uptake_pop);   %par(p=prob_prep_all_restart_choice);  
%par(p=pr_prep_oral_b);  %par(p=rel_prep_oral_adh_younger); %par(p=prep_oral_efficacy);    
%par(p=rate_choose_stop_prep_oral);  %par(p=higher_future_prep_oral_cov);  %par(p=pr_prep_inj_b);  %par(p=prep_inj_efficacy);
%par(p=rate_choose_stop_prep_inj);   %par(p=prep_inj_effect_inm_partner);  %par(p=res_trans_factor_ii);
%par(p=rel_pr_inm_inj_prep_tail_1st_per);      %par(p=rr_res_cab_dol);  %par(p=hivtest_type_1_init_prep_inj);   %par(p=hivtest_type_1_prep_inj);
%par(p=sens_testtype3_from_inf_0);   %par(p=sens_testtype3_from_inf_p25);  %par(p=sens_testtype3_from_inf_gep5);
%par(p=sens_testtype1_from_inf_0);   %par(p=sens_testtype1_from_inf_p25);  %par(p=sens_testtype1_from_inf_gep5); %par(p=prep_all_uptake_pop);
%par(p=dol_higher_potency); %par(p=cab_time_to_lower_threshold_g);  %par(p=sens_tests_prep_inj);  %par(p=pr_inm_inj_prep_1st_per);
%par(p=pref_prep_inj_beta_s1);

data wide_par; merge 
&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr fold_tr_newp switch_for_tox  
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

effect_sw_prog_prep_all  prob_prep_all_restart_choice  prep_all_uptake_pop
adh_pattern_prep_oral   rate_test_startprep_all    rate_choose_stop_prep_oral
prep_all_strategy   prob_prep_all_visit_counsel  rate_test_onprep_all  prep_willingness_threshold  
prep_all_uptake_pop   prob_prep_all_restart_choice  
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy    
higher_future_prep_oral_cov  pr_prep_inj_b  prep_inj_efficacy
rate_choose_stop_prep_inj   prep_inj_effect_inm_partner  res_trans_factor_ii
rel_pr_inm_inj_prep_tail_1st_per      rr_res_cab_dol  hivtest_type_1_init_prep_inj   hivtest_type_1_prep_inj
sens_testtype3_from_inf_0   sens_testtype3_from_inf_p25  sens_testtype3_from_inf_gep5
sens_testtype1_from_inf_0   sens_testtype1_from_inf_p25  sens_testtype1_from_inf_gep5

effect_sw_prog_prep_all prob_prep_all_restart_choice dol_higher_potency  cab_time_to_lower_threshold_g
sens_tests_prep_inj  pr_inm_inj_prep_1st_per
pref_prep_inj_beta_s1
;

run;
proc sort; by run;run;


* To get one row per run;


  data   a.w_&laprv ;
  merge   wide_outputs  wide_par ;  
  by run;


if hivtest_type_1_prep_inj = . then hivtest_type_1_prep_inj=0;

d_n_cur_res_dol_50y_2 = n_cur_res_dol_50y_2 - n_cur_res_dol_50y_1;  
d_n_prep_all_50y_2 = n_prep_all_50y_2 - n_prep_all_50y_1 ;
d_prop_elig_on_prep_50y_2 =  prop_elig_on_prep_50y_2 -  prop_elig_on_prep_50y_1 ;  
d_p_hiv1_prep_50y_2 =  p_hiv1_prep_50y_2 -  p_hiv1_prep_50y_1;  
d_p_iime_50y_2 = p_iime_50y_2 -  p_iime_50y_1;
d_n_death_hiv_50y_2 = n_death_hiv_50y_1 - n_death_hiv_50y_2 ;

d_n_cur_res_dol_32_2 = n_cur_res_dol_32_2 - n_cur_res_dol_32_1;  
d_n_prep_all_32_2 = n_prep_all_32_2 - n_prep_all_32_1 ;
d_prop_elig_on_prep_32_2 =  prop_elig_on_prep_32_2 -  prop_elig_on_prep_32_1 ;  
d_p_hiv1_prep_32_2 =  p_hiv1_prep_32_2 -  p_hiv1_prep_32_1;  

d_n_cur_res_dol_42_2 = n_cur_res_dol_42_2 - n_cur_res_dol_42_1;  
d_n_prep_all_42_2 = n_prep_all_42_2 - n_prep_all_42_1 ;
d_prop_elig_on_prep_42_2 =  prop_elig_on_prep_42_2 -  prop_elig_on_prep_42_1 ;  
d_p_hiv1_prep_42_2 =  p_hiv1_prep_42_2 -  p_hiv1_prep_42_1;  

d_p_iime_32_2 = p_iime_32_2 -  p_iime_32_1;
d_incidence1549_32_2 = incidence1549_32_2 - incidence1549_32_1 ;
d_p_iime_42_2 = p_iime_42_2 -  p_iime_42_1;
r_p_iime_42_2 = p_iime_42_2 / p_iime_42_1;
d_incidence1549_42_2 = incidence1549_42_2 - incidence1549_42_1 ;
d_p_iime_50y_2 = p_iime_50y_2 -  p_iime_50y_1;
d_incidence1549_50y_2 = incidence1549_50y_2 - incidence1549_50y_1 ;
d_n_death_hiv_42_2 = n_death_hiv_42_1 - n_death_hiv_42_2 ;

d_n_infection_50y_2 = n_infection_50y_1 - n_infection_50y_2 ;
d_ddaly_ac_ntd_mtct_50y_2 = ddaly_ac_ntd_mtct_50y_1 - ddaly_ac_ntd_mtct_50y_2;
d_ddaly_50y_2 = ddaly_50y_1 - ddaly_50y_2;
d_dcost_50y_2 = dcost_50y_2 - dcost_50y_1;

d_dcost_prep_50y_2 = dcost_prep_50y_2 - dcost_prep_50y_1 ;
d_dcost_clin_care_50y_2 = dcost_clin_care_50y_2 - dcost_clin_care_50y_1 ;

netdaly500_1 = ddaly_50y_1 + (dcost_50y_1 / 0.0005);
netdaly500_2 = ddaly_50y_2 + (dcost_50y_2 / 0.0005);
netdaly_averted = netdaly500_1 - netdaly500_2;

d_dcost_10y_2 = dcost_10y_2 - dcost_10y_1;
d_n_infection_10y_2 = n_infection_10y_1 - n_infection_10y_2 ;

if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat3=1; else hiv_test_strat3=0;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat2=1; else hiv_test_strat2=0;

d_p_vl1000_art_12m_32_2 = p_vl1000_art_12m_32_1 - p_vl1000_art_12m_32_2; 
d_p_vl1000_art_12m_42_2 = p_vl1000_art_12m_42_1 - p_vl1000_art_12m_42_2; 

p_emerge_inm_res_cab_50y_2 = s_em_inm_res_o_cab_off_3m_50y_2 /  s_o_cab_or_o_cab_tm1_no_r_50y_2 ;
* p_emerge_inm_res_cab_tail_50y_2 = s_emerge_inm_res_cab_tail_50y_2 / s_cur_in_prep_inj_tail_no_r_50y_2 ; 


/*

proc means data=  a.w_&laprv n p50 p5 p95 mean;
var p_w_giv_birth_this_per_22	p_mcirc_22	prevalence1549m_22 prevalence1549w_22  prevalence_hiv_preg_22
incidence1549w_22  incidence1549m_22   incidence_sw_22  	p_diag_22 	p_diag_m_22   p_diag_w_22	p_ai_no_arv_c_nnm_22   
prop_w_1549_sw_22  mtct_prop_22  prop_1564_onprep_22
p_onart_diag_22 p_onart_vl1000_22   p_vl1000_22	p_onart_vl1000_w_22	p_onart_vl1000_m_22   p_onart_cd4_l500_22  p_onart_m_age50pl_22 p_onart_w_age50pl_22  
p_onart_cd4_l200_22  p_startedline2_22 prop_sw_newp0_22  prop_sw_hiv_22 p_newp_sw_22 
m15r_22 m25r_22 m35r_22 m45r_22 m55r_22 w15r_22 w25r_22 w35r_22 w45r_22 w55r_22 p_newp_ge1_22 p_newp_ge5_22 p_iime_22 prevalence_vg1000_22
s_alive_22
rate_dead_hivpos_cause1_22   rate_dead_hivpos_tb_22  rate_dead_hivpos_cause4_22 rate_dead_hivpos_crypm_22 
rate_dead_hivpos_sbi_22  rate_dead_hivpos_oth_adc_22  rate_dead_hivpos_cause2_22  rate_dead_hivpos_cause3_22  rate_dead_hivpos_cvd_22 
rate_dead_cvd_22 rate_dead_tb_22  rate_dead_hivneg_cvd_22  rate_dead_hivneg_tb_22  rate_dead_hivneg_cause2_22 rate_dead_hivneg_cause3_22 
rate_dead_hivneg_cause4_22 rate_dead_hivneg_cause5_22  rate_dead_allage_22  rate_dead_hivneg_anycause_22 rate_dead_hivpos_anycause_22
n_cd4_lt50_22 n_cd4_lt200_22
p_ahd_re_enter_care_100_22 p_ahd_re_enter_care_200_22
incidence1524w_22   incidence1524m_22 incidence2534w_22   incidence2534m_22 incidence3544w_22   incidence3544m_22 
incidence4554w_22   incidence4554m_22 incidence5564w_22   incidence5564m_22
prevalence1519w_22 	prevalence1519m_22 prevalence2024w_22 	prevalence2024m_22 prevalence2529w_22 	prevalence2529m_22
prevalence3034w_22 	prevalence3034m_22 prevalence3539w_22 	prevalence3539m_22 prevalence4044w_22 	prevalence4044m_22 
prevalence4549w_22 	prevalence4549m_22 prevalence5054w_22 	prevalence5054m_22 prevalence5054w_22 	prevalence5054m_22
prevalence5559w_22 	prevalence5559m_22 prevalence6064w_22 	prevalence6064m_22 prevalence65plw_22 	prevalence65plm_22
r_prev_1519w_4549w_22 r_prev_2024w_4549w_22 r_prev_2529w_4549w_22 r_prev_3034w_4549w_22 r_prev_3539w_4549w_22 	
r_prev_4044w_4549w_22 r_prev_5054w_4549w_22 r_prev_5559w_4549w_22 r_prev_6064w_4549w_22 r_prev_65plw_4549w_22 r_prev_1519m_4549w_22 r_prev_2024m_4549w_22 
r_prev_2529m_4549w_22 r_prev_3034m_4549w_22 r_prev_3539m_4549w_22 r_prev_4044m_4549w_22 r_prev_4549m_4549w_22 r_prev_5054m_4549w_22 r_prev_5559m_4549w_22 
r_prev_6064m_4549w_22 r_prev_65plm_4549w_22 p_age1549_hivneg_22 p_age1549_hiv_22
n_onart_22 n_death_hivpos_anycause_22  n_death_2059_m_22 n_death_2059_w_22
;
run;

*/


* table 1;
ods html;
proc means data=  a.w_lapr24_s2 n p50 p5 p95;  *  a.w_&laprv ;
var prevalence1549_22 incidence1549w_22 p_diag_22 p_onart_diag_22 p_onart_vl1000_22  prop_1564_onprep_22  p_iime_22 ;
run;
ods html close;


/*

proc means data=  a.w_&laprv n p50 p5 p95 mean lclm uclm;
var 
prop_prep_inj_50y_1   ratio_inj_prep_on_tail_50y_1    pr_ever_prep_inj_res_cab_50y_1    pr_ev_prep_inj_res_cab_hiv_50y_1
prop_cab_res_o_cab_50y_1    prop_cab_res_tail_50y_1       prop_prep_inj_at_inf_diag_50y_1   
of_all_o_cab_prop_dur_3m_50y_1
of_all_o_cab_prop_dur_6m_50y_1   p_prep_inj_hiv_50y_1  prop_cab_dol_res_attr_cab_50y_1   n_cur_res_cab_50y_1  n_cur_res_dol_50y_1  
n_emerge_inm_res_cab_50y_1  n_switch_prep_from_oral_50y_1 n_switch_prep_from_inj_50y_1  n_switch_prep_to_oral_50y_1  
n_switch_prep_to_inj_50y_1  n_prep_all_start_50y_1 n_prep_oral_start_50y_1  n_prep_inj_start_50y_1 n_prep_vr_start_50y_1
n_prep_all_50y_1 prop_elig_on_prep_50y_1 p_elig_prep_50y_1  p_hiv1_prep_50y_1  prop_onprep_newpge1_50y_1 p_prep_elig_past_year_50y_1 
p_prep_newp_50y_1 prop_sw_onprep_50y_1  p_iime_50y_1 incidence1549_50y_1
prop_prep_inj_50y_2   ratio_inj_prep_on_tail_50y_2    pr_ever_prep_inj_res_cab_50y_2    pr_ev_prep_inj_res_cab_hiv_50y_2
prop_cab_res_o_cab_50y_2    prop_cab_res_tail_50y_2       prop_prep_inj_at_inf_diag_50y_2   
of_all_o_cab_prop_dur_3m_50y_2
of_all_o_cab_prop_dur_6m_50y_2   p_prep_inj_hiv_50y_2  prop_cab_dol_res_attr_cab_50y_2   n_cur_res_cab_50y_2  n_cur_res_dol_50y_2  
n_emerge_inm_res_cab_50y_2  n_switch_prep_from_oral_50y_2 n_switch_prep_from_inj_50y_2  n_switch_prep_to_oral_50y_2  
n_switch_prep_to_inj_50y_2  n_prep_all_start_50y_2 n_prep_oral_start_50y_2  n_prep_inj_start_50y_2 n_prep_vr_start_50y_2
n_prep_all_50y_2 prop_elig_on_prep_50y_2 p_elig_prep_50y_2  p_hiv1_prep_50y_2  prop_onprep_newpge1_50y_2 p_prep_elig_past_year_50y_2 
p_prep_newp_50y_2 prop_sw_onprep_50y_2 p_iime_50y_2  incidence1549_50y_2

d_n_cur_res_dol_50y_2 d_n_prep_all_50y_2 d_prop_elig_on_prep_50y_2  d_p_hiv1_prep_50y_2  d_p_iime_50y_2 

;
run;



proc means data=  a.w_&laprv n p50 p5 p95 mean;
var 
prop_prep_inj_32_1   ratio_inj_prep_on_tail_32_1    pr_ever_prep_inj_res_cab_32_1    pr_ev_prep_inj_res_cab_hiv_32_1
prop_cab_res_o_cab_32_1    prop_cab_res_tail_32_1       prop_prep_inj_at_inf_diag_32_1   
of_all_o_cab_prop_dur_3m_32_1
of_all_o_cab_prop_dur_6m_32_1   p_prep_inj_hiv_32_1  prop_cab_dol_res_attr_cab_32_1   n_cur_res_cab_32_1  n_cur_res_dol_32_1  
n_emerge_inm_res_cab_32_1  n_switch_prep_from_oral_32_1 n_switch_prep_from_inj_32_1  n_switch_prep_to_oral_32_1  
n_switch_prep_to_inj_32_1  n_prep_all_start_32_1 n_prep_oral_start_32_1  n_prep_inj_start_32_1 n_prep_vr_start_32_1
n_prep_all_32_1 prop_elig_on_prep_32_1 p_elig_prep_32_1  p_hiv1_prep_32_1  prop_onprep_newpge1_32_1 p_prep_elig_past_year_32_1 
p_prep_newp_32_1 prop_sw_onprep_32_1  p_iime_32_1
prop_prep_inj_32_2   ratio_inj_prep_on_tail_32_2    pr_ever_prep_inj_res_cab_32_2    pr_ev_prep_inj_res_cab_hiv_32_2
prop_cab_res_o_cab_32_2    prop_cab_res_tail_32_2    prop_cab_res_1st_per_32_2    prop_prep_inj_at_inf_diag_32_2   
of_all_o_cab_prop_dur_3m_32_2
of_all_o_cab_prop_dur_6m_32_2   p_prep_inj_hiv_32_2  prop_cab_dol_res_attr_cab_32_2   n_cur_res_cab_32_2  n_cur_res_dol_32_2  
n_emerge_inm_res_cab_32_2  n_switch_prep_from_oral_32_2 n_switch_prep_from_inj_32_2  n_switch_prep_to_oral_32_2  
n_switch_prep_to_inj_32_2  n_prep_all_start_32_2 n_prep_oral_start_32_2  n_prep_inj_start_32_2 n_prep_vr_start_32_2
n_prep_all_32_2 prop_elig_on_prep_32_2 p_elig_prep_32_2  p_hiv1_prep_32_2  prop_onprep_newpge1_32_2 p_prep_elig_past_year_32_2 
p_prep_newp_32_2 prop_sw_onprep_32_2 p_iime_32_2

d_n_cur_res_dol_32_2 d_n_prep_all_32_2 d_prop_elig_on_prep_32_2  d_p_hiv1_prep_32_2  d_p_iime_32_2 

;
run;

*/


proc glm  data= a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3;
model d_p_iime_50y_2 =
/* p_iime_22 incidence1549w_22 p_vl1000_22 prop_1564_onprep_22 */
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 / solution
;
run;

proc univariate data= a.w_lapr24_s2; * data= a.w_&laprv ; var d_p_iime_42_2; run;

proc freq data= a.w_&laprv; tables
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 d_p_iime_42_2
;
run;



proc glm data=  a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii ;
model p_iime_42_2 =
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 / solution
;
run;




proc glm; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii ;
model p_ai_no_arv_e_inm_42_2 =
p_iime_22 prevalence1549_22 incidence1549w_22 p_diag_22 p_onart_diag_22 p_onart_vl1000_22  prop_1564_onprep_22 
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 / solution
;
* where hiv_test_strat2 =0 and hiv_test_strat3 = 0;
run;

* hivtest_type_1_init_prep_inj ;






*  p_emerge_inm_res_cab_50y_2 ********** ;

proc glm data=  a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii ;
model p_emerge_inm_res_cab_50y_2 = 
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii / solution;
run;

proc univariate data=  a.w_&laprv; var p_emerge_inm_res_cab_50y_2; where dataset_50y_2=19 ; run;



*  p_emerge_inm_res_cab_tail_50y_2 ********** ;

proc glm data=  a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii ;
model p_emerge_inm_res_cab_tail_50y_2 = 
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii / solution;
where  rel_pr_inm_inj_prep_tail_1st_per <= 1 and pr_inm_inj_prep_1st_per <= 0.5 ; ; 
run;




proc glm data=  a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 ;
model d_n_death_hiv_50y_2 =
n_death_hiv_22
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 
/ solution;

run;

proc means data=a.w_&laprv; var d_n_death_hiv_42_2 n_death_hiv_42_1 n_death_hiv_42_2; 
where hivtest_type_1_init_prep_inj ne 1;
run;


proc glm data=  a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 ;
model d_n_prep_all_50y_2 =
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 
/ solution;
run;



proc glm data=  a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 ;
model d_incidence1549_32_2 =
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 
/ solution;
run;



proc glm data=  a.w_&laprv; 
class fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 ;
model d_p_vl1000_art_12m_42_2 =
fold_change_mut_risk  prep_all_uptake_pop  prob_prep_all_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_1st_per  rel_pr_inm_inj_prep_tail_1st_per  rr_res_cab_dol   prep_all_uptake_pop 
cab_time_to_lower_threshold_g sens_tests_prep_inj res_trans_factor_ii hiv_test_strat2 hiv_test_strat3 
/ solution;
run;


proc means; var p_vl1000_art_12m_42_1 p_vl1000_art_12m_42_2 d_p_vl1000_art_12m_42_2;  
where hivtest_type_1_prep_inj = 1 ; run;
proc means; var p_vl1000_art_12m_42_1 p_vl1000_art_12m_42_2 d_p_vl1000_art_12m_42_2;  
where hivtest_type_1_init_prep_inj = 1 ; run;
proc means; var p_vl1000_art_12m_42_1 p_vl1000_art_12m_42_2 d_p_vl1000_art_12m_42_2;  
where hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1; run;


proc univariate data=   a.w_&laprv; var p_emerge_inm_res_cab_50y_2  p_emerge_inm_res_cab_tail_50y_2; * data=  a.w_&laprv ;
run;



proc means; var d_n_infection_50y_2  n_infection_50y_1  n_infection_50y_2 
d_ddaly_ac_ntd_mtct_50y_2  ddaly_ac_ntd_mtct_50y_1  ddaly_ac_ntd_mtct_50y_2
d_ddaly_50y_2  ddaly_50y_1  ddaly_50y_2  d_dcost_50y_2  dcost_50y_2  dcost_50y_1
netdaly500_1 netdaly500_2 netdaly_averted 
d_dcost_10y_2 dcost_10y_2 dcost_10y_1
d_n_infection_10y_2 n_infection_10y_1 n_infection_10y_2 
d_dcost_prep_50y_2  dcost_prep_50y_2  dcost_prep_50y_1
d_dcost_clin_care_50y_2  dcost_clin_care_50y_2  dcost_clin_care_50y_1 
;
run;


proc means; var n_cur_res_cab_32_1 n_cur_res_cab_32_2 ; run;




