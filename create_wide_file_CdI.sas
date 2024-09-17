* options user="/folders/myfolders/";

libname a "C:\Users\loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\CdI";


data a;
set a.cdi_12Aug24;

proc sort;by run cald option;run;
proc freq;table cald;run;


* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;
set a;

if cald=2022; 
*s_alive = s_alive_m + s_alive_w ;

* https://worldpopulationreview.com/countries/ivory-coast-population
* 58% of CdI population in 2022 >= age 15 (https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=CI&view=chart);

*sf_2024 = (29600000 * 0.58) / s_alive;  


**Population accoding to World Population Prospectus;
*https://population.un.org/dataportal/data/indicators/70/locations/384/start/1990/end/2023/line/linetimeplot?df=fedb2c36-7339-4cea-982e-6339bd045666;
*Total population - 0-14 population;
sf_2022 = (13977488.5)/s_alive1549;
keep run sf_2022;

proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2022;

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

dzdv_cost = s_cost_zdv * &discount * &sf * 4 / 1000;
dten_cost = s_cost_ten * &discount * &sf * 4 / 1000;
d3tc_cost = s_cost_3tc * &discount * &sf * 4 / 1000; 
dnev_cost = s_cost_nev * &discount * &sf * 4 / 1000;
dlpr_cost = s_cost_lpr * &discount * &sf * 4 / 1000;
ddar_cost = s_cost_dar * &discount * &sf * 4 / 1000;
dtaz_cost = s_cost_taz * &discount * &sf * 4 / 1000;
defa_cost = s_cost_efa * &discount * &sf * 4 / 1000;
ddol_cost = s_cost_dol * &discount * &sf * 4 / 1000;


if s_dart_cost=. then s_dart_cost=0;
if s_dcost_cascade_interventions=. then s_dcost_cascade_interventions=0;
if s_dcost_prep=. then s_dcost_prep=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

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
* dcost_non_aids_pre_death = s_dcost_non_aids_pre_death * &sf * 4 / 1000;
  dcost_non_aids_pre_death = ddaly_non_aids_pre_death * 4 / 1000; * each death from dcause 2 gives 0.25 dalys and costs 1 ($1000) ;

dfullvis_cost = s_dfull_vis_cost * &sf * 4 / 1000;
dcost_circ = s_dcost_circ * &sf * 4 / 1000; 
dcost_condom_dn = s_dcost_condom_dn * &sf * 4 / 1000; 
dswitchline_cost = s_dcost_switch_line * &sf * 4 / 1000;
if dswitchline_cost=. then dswitchline_cost=0;
if s_dcost_drug_level_test=. then s_dcost_drug_level_test=0;
dcost_drug_level_test = s_dcost_drug_level_test * &sf * 4 / 1000;
dcost_child_hiv  = s_dcost_child_hiv * &sf * 4 / 1000; * s_cost_child_hiv is discounted cost;
 

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

* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_anc;						if (s_pregnant+s_birth) gt 0 then p_anc = s_anc /(s_pregnant+s_birth);*pregnant=1 at dt_start_pregn, dt_start_pregn+0.25, dt_start_pregn+0.5
* prevalence_hiv_preg;			if s_pregnant gt 0 then prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;


* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;

* p_newp_ge1;					p_newp_ge1_ = s_newp_ge1 / s_alive1564 ;
* p_newp_ge1m;					p_newp_ge1m_ = s_m1549_newp_ge1 / s_alive1549_m ;*check;
* p_newp_ge1w;					p_newp_ge1w_ = s_w1549_newp_ge1 / s_alive1549_w ;


* p_newp_ge5;					p_newp_ge5_ = s_newp_ge5 / s_alive1564 ;
* gender_r_newp;				if s_w_newp gt 0 then gender_r_newp = s_m_newp / s_w_newp; *log_gender_r_newp  = log(gender_r_newp);
* n_tested;						n_tested = s_tested * &sf * 4;
* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;
* p_trad_circ;					p_trad_circ = s_birth_circ /s_alive_m;
* p_vmmc;						p_vmmc = s_vmmc /s_alive_m ;
* n_new_vmmc1549m;				n_new_vmmc1549m = s_new_vmmc1549m * &sf * 4;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				if s_alive1564_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_hiv;					if s_sw_1564 gt 0 then prop_sw_hiv = s_hiv_sw / s_sw_1564 ;
* prop_sw_hiv1549_;				if s_sw_1549 gt 0 then prop_sw_hiv1549_ = s_hiv_sw1549_ / s_sw_1549 ;
* n_sw_1549_;					n_sw_1549_ = s_sw_1549 * &sf;
* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_ = s_sw_newp_cat1 /s_sw_1564;
* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis = s_sw_program_visit / s_sw_1564 ;


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
* incidence1564;                incidence1564_ = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
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

* n_diagnosed (per yr);			n_diagnosed = s_diag_this_period * 4 * &sf;
* n_onart  ;					n_onart   = s_onart   * &sf;
* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;

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

* n_art_start_y;				n_art_start_y = s_art_start * 4 * &sf;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
/*NOT OUTPUTTED YET;
* p_onart_vl1000_1549_;			if s_onart_iicu_1549_  > 0 then p_onart_vl1000_1549_ = s_vl1000_art_iicu_1549_ / s_onart_iicu_1549_ ; 
* p_onart_vl1000_1549m;			if s_onart_iicu_1549m  > 0 then p_onart_vl1000_1549m = s_vl1000_art_iicu_1549m / s_onart_iicu_1549m ; 
* p_onart_vl1000_1549w;			if s_onart_iicu_1549w  > 0 then p_onart_vl1000_1549w = s_vl1000_art_iicu_1549w / s_onart_iicu_1549w ; 
*/

* p_vg1000, p_vl1000;			if s_hivge15_  > 0 then p_vg1000_ = s_vg1000 / s_hivge15_ ;  p_vl1000_ = 1- p_vg1000_ ;
* prevalence_vg1000;			if s_alive > 0 then prevalence_vg1000_ = s_vg1000 / s_alive;
* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
* n_death_hiv_m;				n_death_hiv_m = s_death_hiv_m * 4 * &sf;
* n_death_hiv_w;				n_death_hiv_w = s_death_hiv_w * 4 * &sf;		
* n_death_hiv;					n_death_hiv = n_death_hiv_m + n_death_hiv_w;

* rate_dead_allage;				rate_dead_allage = ((s_deadm_all + s_deadw_all) * 4 * 100) / s_alive ;
* rate_dead_allage_m;			rate_dead_allage_m = (s_deadm_all * 4 * 100) / s_alive_m ; 
* rate_dead_allage_w;			rate_dead_allage_w = (s_deadw_all * 4 * 100) / s_alive_w ; 

* n_cd4_lt200;					n_cd4_lt200_ = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * &sf; 
* n_hiv;						n_hiv = s_hivge15_ * &sf;
* n_hiv_m;						n_hiv_m = s_hivge15m * &sf;
* n_hiv_w;						n_hiv_w = s_hivge15w * &sf;

* n_hiv1549_;					n_hiv1549_ = s_hiv1549 * &sf;
* n_hiv1549m;					n_hiv1549m = s_hiv1549m * &sf;
* n_hiv1549w;					n_hiv1549w = s_hiv1549w * &sf;

* n_newinf;						n_newinf = s_primary * 4 * &sf;
* n_newinf1549_;				n_newinf1549_ = s_primary1549 * 4 * &sf;
* n_newinf1549m;				n_newinf1549m = s_primary1549m * 4 * &sf;
* n_newinf1549w;				n_newinf1549w = s_primary1549w * 4 * &sf;
* n_alive;						n_alive = s_alive * &sf;
* n_alive1549_;					n_alive1549_ = s_alive1549* &sf;
* n_alive1549_m;				n_alive1549m = s_alive1549_m* &sf;
* n_alive1549_w;				n_alive1549w = s_alive1549_w* &sf;
* n_alive1564_;					n_alive1564_ = s_alive1564* &sf;
* n_alive1564m;					n_alive1564m = s_alive1564_m* &sf;
* n_alive1564w;					n_alive1564w = s_alive1564_w* &sf;
* n_alive_m;					n_alive_m = s_alive_m * &sf;
* n_alive_w;					n_alive_w = s_alive_w * &sf;
* n_prep;						n_prep = s_prep_any * &sf;
* n_prep_sw;					n_prep_sw = s_onprep_sw * &sf;
* n_prep_ever;					n_prep_ever = s_prep_any_ever * &sf;
* n_pregnant;					n_pregnant= s_pregnant * &sf;
* p_prep_ever;					p_prep_ever = s_prep_any_ever / (s_alive1564_w + s_alive1564_m) ;
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;
* n_prep_oral_ever_sw;  		n_prep_oral_ever_sw    = s_prep_oral_ever_sw * &sf;   

* MSM;

* n_alive_msm;					n_alive_msm = s_alive_msm * &sf ;
* n_alive1564_msm;				n_alive1564_msm = s_alive1564_msm * &sf ;
* incidence1549msm;             incidence1549msm = (s_primary1549msm * 4 * 100) / (s_alive1549_msm  - s_hiv1549msm  + s_primary1549msm);
* incidence1564msm;             incidence1564msm = (s_primary1564msm * 4 * 100) / (s_alive1564_msm  - s_hiv1564msm  + s_primary1564msm);
* prevalence1549_msm;			prevalence1549_msm = s_hiv1549msm / s_alive1549_msm; 
* prevalence1564_msm;			prevalence1564_msm = s_hiv1564msm / s_alive1564_msm; 
* prevalence_msm;				prevalence_msm = s_hiv_msm / s_alive_m;
* p_elig_prep_any_msm_1564_;	p_elig_prep_any_msm_1564_ = s_elig_prep_any_msm_1564 / (s_alive1564_msm - s_hiv1564msm);
* p_onprep_msm;					p_onprep_msm = s_onprep_msm / (s_alive1564_msm - s_hiv1564msm);
* p_onart_msm;					if s_hiv_msm  > 0 then p_onart_msm = s_onart_msm / s_hiv_msm  ;
* prevalence_vg1000_msm;		prevalence_vg1000_msm = s_vg1000_msm / s_alive_msm;
* p_diag_msm;					if s_hiv_msm gt 0 then p_diag_msm = s_diag_msm / s_hiv_msm  ;
* p_onart_diag_msm;				if s_diag_msm gt 0 then p_onart_diag_msm = s_onart_msm / s_diag_msm ;
* p_vl1000_art_gt6m_msm;		if s_onart_gt6m_msm gt 0 then p_vl1000_art_gt6m_msm = s_vl1000_art_gt6m_msm / s_onart_gt6m_msm ;
* p_ever_tested_msm; 			p_ever_tested_msm = s_ever_tested_msm / s_msm;
* p_tested_this_period_msm;		p_tested_this_period_msm = s_tested_msm / (s_msm - s_diag_msm) ;
* p_msm_infected_from_msm;		if s_hiv_msm gt 0 then p_msm_infected_from_msm = s_infected_from_msm / s_hiv_msm ;
* prop_m_msm;					prop_m_msm = s_alive_msm / s_alive_m;

* p_ep;							p_ep = s_ep / s_alive1564;				
* p_ep_msm;						p_ep_msm = s_msm_ep / s_alive1564_msm;
* p_msm_ge1newp;				p_msm_ge1newp = s_msm_ge1newp / s_alive1564_msm;
* p_m_ge1newp;					p_m_ge1newp = s_m_ge1newp / s_alive1564_m;

* PWID;

* n_pwid;						n_pwid = s_pwid * &sf ;
* p_onprep_pwid;				if (s_alive1564_pwid - s_hiv1564pwid) gt 0 then p_onprep_pwid = s_onprep_pwid / (s_alive1564_pwid - s_hiv1564pwid);
* p_onart_pwid;					if s_hiv_pwid  > 0 then p_onart_pwid = s_onart_pwid / s_pwid  ;



keep  cald	run		option	inc_cat		ych2_risk_beh_newp	p_w_giv_birth_this_per			mtct_prop		p_anc	
prevalence_hiv_preg	p_newp_ge1_	 		p_newp_ge5_			p_newp_ge1m_		p_newp_ge1w_		
n_tested			p_tested_past_year_1549m				p_tested_past_year_1549w		test_prop_positive
p_mcirc				p_mcirc_1549m		n_new_vmmc1549m 	p_trad_circ			p_vmmc		s_sw_1549	p_sw_prog_vis
prop_w_1549_sw		prop_w_1564_sw		prop_w_ever_sw		prop_sw_hiv			n_sw_1549_	prop_w_1524_onprep	prop_1564_onprep	
prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1519w		prevalence1519m		prevalence2024w		prevalence2024m		prevalence2529w		prevalence2529m
prevalence3034w		prevalence3034m		prevalence3539w		prevalence3539m		prevalence4044w		prevalence4044m
prevalence4549w		prevalence4549m

prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w		
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w		
incidence4554m		incidence4554w		incidence5564m		incidence5564w	
incidence1549_per1000_	incidence1549m_per1000_  incidence1549w_per1000_
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_diag1549_			p_diag1549m			p_diag1549w			p_artexp_diag	
p_onart_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart				p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	
p_vg1000_			p_vl1000_			prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m	
n_death_hiv_w		n_death_hiv			rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv  				n_hiv_m				n_hiv_w				n_hiv1549_			n_hiv1549m			n_hiv1549w			n_alive			n_alive1549_	
n_alive1549m		n_alive1549w		n_alive_m			n_alive_w			n_alive1564_		n_alive1564m	n_alive1564w
n_art_start_y		n_newinf			n_newinf1549_		n_newinf1549m		n_newinf1549w		n_pregnant		n_prep 			
n_prep_ever			p_prep_ever			adh_pattern	p_fsw_newp0_				n_prep_oral_ever_sw prop_sw_hiv1549_
sw_trans_matrix		n_prep_sw

	
n_alive_msm		n_alive1564_msm		incidence1549msm	incidence1564msm	prevalence1549_msm	prevalence1564_msm
p_elig_prep_any_msm_1564_			p_onprep_msm		p_onart_msm			prevalence_vg1000_msm
p_diag_msm		p_onart_diag_msm	p_vl1000_art_gt6m_msm 					p_ever_tested_msm	p_tested_this_period_msm
p_msm_infected_from_msm				prop_m_msm			p_ep				p_ep_msm			p_msm_ge1newp
p_m_ge1newp		n_pwid				p_onprep_pwid		p_onart_pwid		sw_trans_matrix
;

proc sort data=y;by run option;run;

proc freq;table sw_trans_matrix;run;
proc means mean;var p_diag_msm;where cald=2022;run;

proc freq;table incidence1549_per1000_;where cald=2022;run;
proc freq;table run;where incidence1549_per1000_ > 1 and cald=2022;run;

***Removing low incidence runs;
data low_inc;
set y;


* l.base is the long file after adding in newly defined variables and selecting only variables of interest - will read this in to graph program;
data a.l_base_CdI_12aug24; 
set low_inc;
*set y;  
run;




***CODE BELOW IS TO GET THE FILE READY FOR ANALYSIS. NOT USED UNTIL CALIBRATION USING THE GRAPH FILE IS COMPLETE;
data y; set a.l_base_cDI1; 

proc means;var p_onart_vl1000_m;where cald=2018 and adh_pattern=1;run;
proc means;var p_onart_vl1000_m;where cald=2018 and adh_pattern=2;run;
proc means;var p_onart_vl1000_m;where cald=2018 and adh_pattern=3;run;
proc means;var p_onart_vl1000_m;where cald=2018 and adh_pattern=4;run;
proc means;var p_onart_vl1000_m;where cald=2018 and adh_pattern=5;run;
proc means;var p_onart_vl1000_m;where cald=2018 and adh_pattern=6;run;
proc means;var p_onart_vl1000_m;where cald=2018 and adh_pattern=7;run;

proc freq;table adh_pattern;where cald=2018;run;

proc freq;table cald;run;

/*
if cald = 2017;
out=0;
if prevalence1549 > 0.2 then out=1;
proc logistic....
*/

  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

/* proc means  noprint data=y; var &v; output out=y_19 mean= &v._19; by run ; where 2019.25 <= cald <= 2019.5; */
proc means  noprint data=y; var &v; output out=y_95 mean= &v._95; by run ; where 1994.5 <= cald < 1995.5; 
proc means  noprint data=y; var &v; output out=y_98 mean= &v._98; by run ; where 1997.5 <= cald < 1998.5; 
proc means  noprint data=y; var &v; output out=y_99 mean= &v._99; by run ; where 1998.5 <= cald < 1999.5; 
proc means  noprint data=y; var &v; output out=y_00 mean= &v._00; by run ; where 1999.5 <= cald < 2000.5; 
proc means  noprint data=y; var &v; output out=y_05 mean= &v._05; by run ; where 2004.5 <= cald < 2005.5; 
proc means  noprint data=y; var &v; output out=y_10 mean= &v._10; by run ; where 2009.5 <= cald < 2010.5; 
proc means  noprint data=y; var &v; output out=y_15 mean= &v._15; by run ; where 2014.5 <= cald < 2015.5; 
proc means  noprint data=y; var &v; output out=y_17 mean= &v._17; by run ; where 2016.5 <= cald < 2017.5; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run ; where 2019.5 <= cald < 2020.5; 
proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2020.5 <= cald < 2021.5; 
proc means  noprint data=y; var &v; output out=y_40 mean= &v._40; by run ; where 2039.5 <= cald < 2040.5; 
proc means  noprint data=y; var &v; output out=y_70 mean= &v._70; by run ; where 2069.5 <= cald < 2070.5; 

/* proc means noprint data=y; var &v; output out=y_20b   mean= &v._20b; by run option ; where 2020.25 <= cald < 2020.5; */
/* proc means noprint data=y; var &v; output out=y_20_21 mean= &v._20_21; by run option ; where 2020.25 <= cald < 2021.25;*/   
/* proc means noprint data=y; var &v; output out=y_21 mean= &v._21; by run option ; where cald = 2021.50; */
 proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run option ; where 2021.5 <= cald < 2022.50;
 proc means noprint data=y; var &v; output out=y_21_26 mean= &v._21_26; by run option ; where 2021.5 <= cald < 2026.50;
/* proc means noprint data=y; var &v; output out=y_20_30 mean= &v._20_30; by run option ; where 2020.5 <= cald < 2030.50;*/
/* proc means noprint data=y; var &v; output out=y_20_40 mean= &v._20_40; by run option ; where 2020.5 <= cald < 2040.50; */

 proc means noprint data=y; var &v; output out=y_21_71 mean= &v._21_71; by run option ; where 2021.5 <= cald < 2071.00; * deliberate to choose 2071
 - can change to 2071.5 once changes to program made;
  
/* proc sort data=y_20b; by run; proc transpose data=y_20b out=t_20b prefix=&v._20b_; var &v._20b; by run; */ 
/* proc sort data=y_21; by run; proc transpose data=y_21 out=t_21 prefix=&v._21_; var &v._21; by run; */
/*   proc sort data=y_20_21; by run; proc transpose data=y_20_21 out=t_20_21 prefix=&v._20_21_; var &v._20_21; by run;  */
																													   
																													   
 proc sort data=y_21_22; by run; proc transpose data=y_21_22 out=t_21_22 prefix=&v._21_22_; var &v._21_22; by run; 
 proc sort data=y_21_26; by run; proc transpose data=y_21_26 out=t_21_26 prefix=&v._21_26_; var &v._21_26; by run; 
/* proc sort data=y_20_30; by run; proc transpose data=y_20_30 out=t_20_30 prefix=&v._20_30_; var &v._20_30; by run; */
/* proc sort data=y_20_40; by run; proc transpose data=y_20_40 out=t_20_40 prefix=&v._20_40_; var &v._20_40; by run; */
																														

 proc sort data=y_21_71; by run; proc transpose data=y_21_71 out=t_21_71 prefix=&v._21_71_; var &v._21_71; by run;  

data &v ; merge y_95 y_98 y_99 y_00 y_05 y_10 y_15 y_17 y_20 y_21 y_40 y_70 t_21_26 t_21_22 t_21_71 ;  
drop _NAME_ _TYPE_ _FREQ_;



%mend var;

%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=p_newp_sw); %var(v=prop_sw_newp0);  %var(v=p_newp_prep);
%var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc) ;%var(v=p_mcirc_1519m); %var(v=p_mcirc_2024m);%var(v=p_mcirc_2529m);
%var(v=p_mcirc_3034m);%var(v=p_mcirc_3539m);%var(v=p_mcirc_4044m);%var(v=p_mcirc_4549m); 
%var(v=p_mcirc_5064m); %var(v=p_mcirc_1549m);
%var(v=p_vmmc); %var(v=p_vmmc_1519m); %var(v=p_vmmc_2024m);%var(v=p_vmmc_2529m); %var(v=p_vmmc_3039m); %var(v=p_vmmc_4049m);
%var(v=p_vmmc_5064m); %var(v=p_vmmc_1549m);
%var(v=prop_w_1549_sw); %var(v=prop_w_1564_sw); %var(v=prop_w_ever_sw); %var(v=prop_sw_hiv); %var(v=prop_sw_program_visit); 
%var(v=prop_w_1524_onprep); %var(v=prop_1564_onprep);
%var(v=prop_sw_onprep); %var(v=prevalence1549m); %var(v=prevalence1549w); %var(v=prevalence1549); 
%var(v=prevalence1519w);  	%var(v=prevalence1519m);  	  %var(v=prevalence2024w);  	  %var(v=prevalence2024m);  	  %var(v=prevalence2529w);  	  
%var(v=prevalence2529m);    %var(v=prevalence3034w);    %var(v=prevalence3034m);  	%var(v=prevalence3539w);  	  %var(v=prevalence3539m);  	  
%var(v=prevalence4044w);  	 %var(v=prevalence4044m);  	  %var(v=prevalence4549w);  	  %var(v=prevalence4549m);  
%var(v=prevalence_vg1000); %var(v=incidence1549);  %var(v=incidence1564m); %var(v=incidence1564w); 
%var(v=prevalence1524w); %var(v=prevalence1524m);   %var(v=prevalence_sw);
%var(v=prevalence5054w); %var(v=prevalence5054m); %var(v=prevalence5559w); %var(v=prevalence5559m); %var(v=prevalence6064w); %var(v=prevalence6064m); 
%var(v=prevalence65plw); %var(v=prevalence65plm); %var(v=prevalence_hiv_preg);

%var(v=incidence1549w);  %var(v=incidence1549m);  %var(v=incidence_sw); 
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
%var(v=aids_death_rate);  %var(v=death_rate_onart);   %var(v=dcost);  %var(v= dart_cost_y);
%var(v=dadc_cost);   %var(v=dcd4_cost);   %var(v=dvl_cost);   %var(v=dvis_cost);    %var(v=dcot_cost);   %var(v=dtb_cost);   
%var(v=dres_cost);  %var(v=dtest_cost);   %var(v=d_t_adh_int_cost);   %var(v=dswitchline_cost);  %var(v=dtaz_cost);   %var(v=dcost_drug_level_test);
%var(v=dclin_cost );  
%var(v=dcost_circ );  %var(v=dcost_condom_dn);
%var(v=dcost_prep_visit );   %var(v=dcost_prep );   %var(v=dcost_drug_level_test ); 
%var(v=dcost_clin_care );  %var(v=dcost_non_aids_pre_death );  %var(v=dcost_child_hiv );  %var(v=dzdv_cost );   %var(v=dten_cost );   %var(v=d3tc_cost );   
%var(v=dnev_cost );   %var(v=dlpr_cost );   %var(v=ddar_cost );   %var(v=dtaz_cost );    %var(v=defa_cost );   %var(v=ddol_cost );
%var(v=m15r);  %var(v=m25r);  %var(v=m35r);  %var(v=m45r);  %var(v=m55r);  %var(v=w15r);  %var(v=w25r);  %var(v=w35r);  %var(v=w45r);  %var(v=w55r)
%var(v=r_efa_hiv); %var(v=p_onart_cd4_l200);
%var(v=p_dol_2vg1000_dolr1_adh0); %var(v=p_dol_2vg1000_dolr1_adh1); %var(v=p_dol_2vg1000_dolr0_adh0); %var(v=p_dol_2vg1000_dolr0_adh1);
%var(v=p_onart_cd4_l500);   %var(v=p_startedline2);  %var(v=prop_art_or_prep);  %var(v=n_sw_1564); %var(v=n_sw_1549);   %var(v=prop_sw_onprep);   %var(v=p_onart);
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
%var(v=p_iime);   %var(v=p_pime);   %var(v=p_nnme);     %var(v=n_pregnant_ntd);   %var(v=n_preg_odabe);
%var(v=n_birth_with_inf_child);
%var(v=n_tested); %var(v=n_tested_sw); %var(v=test_prop_positive);
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   %var(v= n_hiv1_prep);
%var(v= n_prep); %var(v=n_covid); %var(v=n_death_covid);  %var(v=n_death);  %var(v=n_death_hivrel); 
%var(v=p_death_hivrel_age_le64);  %var(v=p_prep_ever); %var(v=p_hiv1_prep);  %var(v=incidence1524w);   %var(v=incidence1524m) ;
%var(v=incidence2534w);   %var(v=incidence2534m) ; %var(v=incidence3544w);   %var(v=incidence3544m) ;%var(v=incidence4554w);   %var(v=incidence4554m) ;
%var(v=incidence5564w);   %var(v=incidence5564m) ;
%var(v=incidence_sw);  %var(v=n_infected);
%var (v=n_mcirc1549_3m) ;%var (v=n_vmmc1549_3m); 
%var(v=n_new_inf1549m); %var(v=n_new_inf1549w); %var(v=n_new_inf1549);%var(v=t_sw_newp) ;
 
%var(v=n_cd4_lt50); %var(v=n_cd4_lt200);
%var(v=rate_dead_hivneg_cause5 );  %var(v=rate_dead_allage); %var(v=rate_dead_hivneg_anycause); %var(v=rate_dead_hivpos_anycause); 

%var(v=n_death_hivpos_anycause); %var(v= n_death_2059_m);  %var(v=n_death_2059_w);
%var(v=n_death_hiv_m); %var(v=n_death_hiv_w); 
%var(v=p_age1549_hivneg );  %var(v=p_age1549_hiv ); %var(v=p_onart_m_age50pl ); %var(v=p_onart_w_age50pl ); %var(v=n_onart);
%var(v=prevalence_hiv_preg); %var(v=p_onart_w); %var(v=p_onart_m); %var(v=n_onart_w); %var(v=n_onart_m);  %var(v=p_diag_w); %var(v=p_diag_m); 
%var(v=p_onart_vl1000);  %var(v=n_new_inf1549m); %var(v=n_new_inf1549w); %var(v=n_death_hiv_m); %var(v=n_death_hiv_w); %var(v=n_tested_m); 
%var(v=n_tested_w); %var(v=test_prop_positive);  %var(v=n_alive);  %var(v=n_diagnosed);   %var (v=n_hiv); %var(v=n_tested)
%var(v=prevalence1524w);  %var(v=prevalence1524m);  %var(v=prevalence2549w);  %var(v=prevalence2549m);  %var(v=prevalence_sw); 
/*
%var(v=n_alive_msm);	 %var(v=n_alive1564_msm); %var(v=incidence1549msm); %var(v=incidence1564msm);  %var(v=prevalence1549_msm);	%var(v=prevalence1564_msm);  
%var(v=p_elig_prep_any_msm_1564); %var(v=p_onprep_msm);  %var(v=p_onart_msm);   %var(v=prevalence_vg1000_msm);	 %var(v=p_diag_msm);	 
%var(v=p_onart_diag_msm);  %var(v=p_vl1000_art_gt6m_msm);	 %var(v=p_ever_tested_msm); 	%var(v=p_tested_this_period_msm);  %var(v=p_msm_infected_from_msm)
%var(v=incidence1564); %var(v=n_alive1564_msm);
*/



data   wide_outputs; merge 
s_alive  p_w_giv_birth_this_per  p_newp_ge1 p_newp_ge5  gender_r_newp
p_newp_sw prop_sw_newp0  p_newp_prep  n_tested_m
p_tested_past_year_1549m  p_tested_past_year_1549w  
p_mcirc   p_mcirc_1519m p_mcirc_2024m p_mcirc_2529m p_mcirc_3034m p_mcirc_3539m 
p_mcirc_4044m p_mcirc_4549m  p_mcirc_5064m p_mcirc_1549m
p_vmmc  p_vmmc_1519m p_vmmc_2024m p_vmmc_2529m p_vmmc_3039m p_vmmc_4049m p_vmmc_5064m p_vmmc_1549m
prop_w_1549_sw  prop_w_1564_sw  prop_w_ever_sw  prop_sw_hiv  prop_sw_program_visit  prop_w_1524_onprep  prop_1564_onprep  prop_sw_onprep 
prevalence1549m  prevalence1549w  prevalence1549  prevalence1519w  prevalence1519m  prevalence2024w  prevalence2024m
prevalence2529w  prevalence2529m  prevalence3034w prevalence3034m  prevalence3539w  prevalence3539m  	  
prevalence4044w  prevalence4044m  prevalence4549w prevalence4549m  
prevalence5054w prevalence5054m prevalence5559w prevalence5559m prevalence6064w prevalence6064m prevalence65plw prevalence65plm
prevalence_vg1000  incidence1549  prevalence1524w prevalence1524m   prevalence_sw  prevalence_hiv_preg

incidence1564 incidence1564m incidence1564w incidence1549w  incidence1549m incidence_sw  n_infected
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary 
mtct_prop  p_diag  p_diag_m  p_diag_w  p_diag_sw  p_diag_m1524  p_diag_w1524
p_ai_no_arv_c_nnm  p_ai_no_arv_c_pim  p_ai_no_arv_c_rt184m  p_ai_no_arv_c_rt65m  p_ai_no_arv_c_rttams  p_ai_no_arv_c_inm 
p_artexp_diag  p_onart_diag  p_onart_diag_w  p_onart_diag_m  p_onart_diag_sw  
p_efa  p_taz  p_ten  p_zdv  p_dol  p_3tc  p_lpr  p_nev  
p_onart_vl1000  p_artexp_vl1000  p_vl1000  p_vg1000  p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m  p_vl1000_art_12m_onart  p_onart_m p_onart_w  p_onart_vl1000_w  p_onart_vl1000_m   p_onart_vl1000_1524  p_onart_vl1000_sw
prev_vg1000_newp_m  prev_vg1000_newp_w  p_startedline2
p_tle  p_tld  p_zld  p_zla  p_otherreg  p_drug_level_test p_linefail_ge1
aids_death_rate  death_rate_onart  dcost   dart_cost_y
dadc_cost  dcd4_cost  dvl_cost  dvis_cost  dcot_cost  dtb_cost   
dres_cost  dtest_cost  d_t_adh_int_cost  dswitchline_cost  dtaz_cost   dcost_drug_level_test  dclin_cost   
 dcost_circ  dcost_condom_dn  dcost_prep_visit  dcost_prep  dcost_drug_level_test  
dcost_clin_care   dcost_non_aids_pre_death   dcost_child_hiv  dzdv_cost  dten_cost  d3tc_cost    
dnev_cost  dlpr_cost  ddar_cost  dtaz_cost  defa_cost  ddol_cost 
m15r  m25r  m35r  m45r  m55r  w15r  w25r  w35r  w45r  w55r
r_efa_hiv  p_onart_cd4_l200
p_dol_2vg1000_dolr1_adh0  p_dol_2vg1000_dolr1_adh1  p_dol_2vg1000_dolr0_adh0  p_dol_2vg1000_dolr0_adh1
p_onart_cd4_l500  p_startedline2  prop_art_or_prep  n_sw_1564 n_sw_1549  prop_sw_onprep   p_onart
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
p_iime   p_pime   p_nnme     n_pregnant_ntd   n_preg_odabe
n_birth_with_inf_child
n_tested n_tested_sw test_prop_positive
p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  n_hiv1_prep
n_prep  n_covid  n_death_covid  n_death  n_death_hivrel 
p_death_hivrel_age_le64  p_prep_ever p_hiv1_prep  incidence1524w   incidence1524m incidence2534w   incidence2534m incidence3544w   incidence3544m 
incidence4554w   incidence4554m incidence5564w   incidence5564m    incidence_sw
 n_mcirc1549_3m  n_vmmc1549_3m 
n_new_inf1549m n_new_inf1549w n_new_inf1549 
t_sw_newp
rate_dead_allage rate_dead_hivneg_anycause rate_dead_hivpos_anycause n_death_2059_m n_death_2059_w
p_age1549_hivneg p_age1549_hiv
n_death_hivpos_anycause
n_death_hiv_m n_death_hiv_w
p_onart_m_age50pl p_onart_w_age50pl  n_onart
prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m  p_diag_w p_diag_m p_onart_vl1000 n_new_inf1549m n_new_inf1549w n_death_hiv_m 
n_death_hiv_w n_tested_m n_tested_w test_prop_positive n_alive n_diagnosed  n_hiv
/*
n_alive_msm	 n_alive1564_msm incidence1549msm incidence1564msm  prevalence1549_msm	prevalence1564_msm  p_elig_prep_any_msm_1564 p_onprep_msm				
 p_onart_msm  prevalence_vg1000_msm	 p_diag_msm	 p_onart_diag_msm p_vl1000_art_gt6m_msm	 p_ever_tested_msm 		
 p_tested_this_period_msm p_msm_infected_from_msm n_alive1564_msm*/
;

proc sort; by run; run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);

* &p ;
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2020; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=sf_2021); /*%par(p=dataset)*/;
%par(p=sex_beh_trans_matrix_m ); %par(p=sex_beh_trans_matrix_w ); %par(p=sex_age_mixing_matrix_m ); %par(p=sex_age_mixing_matrix_w ); %par(p=p_rred_p );
%par(p=p_hsb_p ); %par(p=newp_factor ); %par(p=eprate ) %par(p=conc_ep ); %par(p=ch_risk_diag ); %par(p=ch_risk_diag_newp );
%par(p=ych_risk_beh_newp ); %par(p=ych2_risk_beh_newp ); %par(p=ych_risk_beh_ep ); %par(p=exp_setting_lower_p_vl1000 );
%par(p=external_exp_factor ); %par(p=rate_exp_set_lower_p_vl1000 ); %par(p=prob_pregnancy_base ); %par(p=fold_change_w );
%par(p=fold_change_yw ); %par(p=fold_change_sti ); %par(p=tr_rate_undetec_vl); %par(p=an_lin_incr_test );
%par(p=date_test_rate_plateau );  %par(p=incr_test_rate_sympt ); %par(p=max_freq_testing );
%par(p=test_targeting ); %par(p=fx );  %par(p=gx );  %par(p=adh_pattern ); %par(p=prob_loss_at_diag ); %par(p=pr_art_init ); 
%par(p=rate_lost ); %par(p=prob_lost_art ); %par(p=rate_return ); %par(p=rate_restart ); %par(p=rate_int_choice );
%par(p=clinic_not_aw_int_frac ); %par(p=res_trans_factor_nn ); %par(p=rate_loss_persistence ); %par(p=incr_rate_int_low_adh );
%par(p=poorer_cd4rise_fail_nn ); %par(p=poorer_cd4rise_fail_ii ); %par(p=rate_res_ten );
%par(p=fold_change_mut_risk ); %par(p=adh_effect_of_meas_alert ); %par(p=pr_switch_line ); %par(p=prob_vl_meas_done );
%par(p=red_adh_tb_adc ); %par(p=red_adh_tox_pop ); %par(p=add_eff_adh_nnrti ); %par(p=altered_adh_sec_line_pop );
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=prob_lossdiag_non_tb_who3e); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=fold_tr_newp); %par(p=switch_for_tox );
 %par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox );     %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg ); 

%par(p=effect_visit_prob_diag_l);  %par(p=tb_base_prob_diag_l); %par(p=crypm_base_prob_diag_l); %par(p=tblam_eff_prob_diag_l);  
%par(p=crag_eff_prob_diag_l);%par(p=sbi_base_prob_diag_l); %par(p=rel_rate_death_tb_diag_e); %par(p=rel_rate_death_oth_adc_diag_e); 
%par(p=rel_rate_death_crypm_diag_e);%par(p=rel_rate_death_sbi_diag_e);  %par(p=incr_death_rate_tb); %par(p=incr_death_rate_oth_adc);
%par(p=incr_death_rate_crypm); %par(p=incr_death_rate_sbi);%par(p=cm_1stvis_return_vlmg1000);  %par(p=crag_cd4_l200); %par(p=crag_cd4_l100);  
%par(p=tblam_cd4_l200);  %par(p=tblam_cd4_l100);    %par(p=effect_tb_proph);   %par(p=effect_crypm_proph);  %par(p=effect_sbi_proph);

%par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); 
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); 
/*
%par(p=msm_rred);  %par(p=prop_m_msm); %par(p=prob_start_pwid);  %par(p=prob_stop_pwid);  %par(p=rr_pwid_female);   %par(p=fold_tr_pwid fold_tr_msm); 
*/
run;

data wide_par; merge 
sf_2021 /*dataset*/ sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl  an_lin_incr_test
date_test_rate_plateau  incr_test_rate_sympt max_freq_testing
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
incr_mort_risk_dol_weightg  sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph
/*msm_rred prop_m_msm prob_start_pwid prob_stop_pwid rr_pwid_female  fold_tr_pwid fold_tr_msm*/
;

proc contents; run;

run;
proc sort; by run;run;


* To get one row per run;

  data a.w_base_kenya_f; 
* merge   wide_outputs  wide_par wide_par_after_int_option0  wide_par_after_int_option1  ; * this if you have parameter values changing after
  baseline that you need to track the values of;
  merge   wide_outputs  wide_par ;  
  by run;


ods html;

proc means data=a.w_base_kenya_f n p50 p5 p95 mean;
var p_w_giv_birth_this_per_98	p_mcirc_98	prevalence1549m_98 prevalence1549w_98
incidence1549w_98  incidence1549m_98   incidence_sw_98  	p_diag_98 	p_diag_m_98   p_diag_w_98	p_ai_no_arv_c_nnm_98   
prop_w_1549_sw_98  mtct_prop_98  prop_1564_onprep_98
p_onart_diag_98 p_onart_vl1000_98   p_vl1000_98	p_onart_vl1000_w_98	p_onart_vl1000_m_98   p_onart_cd4_l500_98  p_onart_m_age50pl_98 p_onart_w_age50pl_98
p_onart_cd4_l200_98  p_startedline2_98 prop_sw_newp0_98  prop_sw_hiv_98 p_newp_sw_98 
m15r_98 m25r_98 m35r_98 m45r_98 m55r_98 w15r_98 w25r_98 w35r_98 w45r_98 w55r_98 p_newp_ge1_98 p_newp_ge5_98 p_iime_98 prevalence_vg1000_98
s_alive_98
rate_dead_hivpos_cause1_98   rate_dead_hivpos_tb_98  rate_dead_hivpos_cause4_98 rate_dead_hivpos_crypm_98 
rate_dead_hivpos_sbi_98  rate_dead_hivpos_oth_adc_98  rate_dead_hivpos_cause2_98  rate_dead_hivpos_cause3_98  rate_dead_hivpos_cvd_98 
rate_dead_cvd_98 rate_dead_tb_98  rate_dead_hivneg_cvd_98  rate_dead_hivneg_tb_98  rate_dead_hivneg_cause2_98 rate_dead_hivneg_cause3_98 
rate_dead_hivneg_cause4_98 rate_dead_hivneg_cause5_98 
n_cd4_lt50_98 n_cd4_lt200_98
p_ahd_re_enter_care_100_98 p_ahd_re_enter_care_200_98
incidence1524w_98   incidence1524m_98 incidence2534w_98   incidence2534m_98 incidence3544w_98   incidence3544m_98 
incidence4554w_98   incidence4554m_98 incidence5564w_98   incidence5564m_98 
prevalence1519w_98 	prevalence1519m_98 prevalence2024w_98 	prevalence2024m_98 prevalence2529w_98 	prevalence2529m_98
prevalence3034w_98 	prevalence3034m_98 prevalence3539w_98 	prevalence3539m_98 prevalence4044w_98 	prevalence4044m_98 
prevalence4549w_98 	prevalence4549m_98 prevalence5054w_98 	prevalence5054m_98 prevalence5054w_98 	prevalence5054m_98
prevalence5559w_98 	prevalence5559m_98 prevalence6064w_98 	prevalence6064m_98 prevalence65plw_98 	prevalence65plm_98

p_age1549_hivneg_98 p_age1549_hiv_98  n_death_hivpos_anycause_98  n_death_2059_m_98 n_death_2059_w_98
;
run;

proc means data=a.w_base_kenya_f n p50 p5 p95 mean;
var p_w_giv_birth_this_per_05	p_mcirc_05		prevalence1549m_05 prevalence1549w_05
incidence1549w_05  incidence1549m_05   incidence_sw_05  	p_diag_05 	p_diag_m_05   p_diag_w_05	p_ai_no_arv_c_nnm_05   
prop_w_1549_sw_05  mtct_prop_05  prop_1564_onprep_05
p_onart_diag_05 p_onart_vl1000_05   p_vl1000_05	p_onart_vl1000_w_05	p_onart_vl1000_m_05   p_onart_cd4_l500_05  p_onart_m_age50pl_05 p_onart_w_age50pl_05  
p_onart_cd4_l200_05  p_startedline2_05 prop_sw_newp0_05  prop_sw_hiv_05 p_newp_sw_05 
m15r_05 m25r_05 m35r_05 m45r_05 m55r_05 w15r_05 w25r_05 w35r_05 w45r_05 w55r_05 p_newp_ge1_05 p_newp_ge5_05 p_iime_05 prevalence_vg1000_05
s_alive_05
rate_dead_hivpos_cause1_05   rate_dead_hivpos_tb_05  rate_dead_hivpos_cause4_05 rate_dead_hivpos_crypm_05 
rate_dead_hivpos_sbi_05  rate_dead_hivpos_oth_adc_05  rate_dead_hivpos_cause2_05  rate_dead_hivpos_cause3_05  rate_dead_hivpos_cvd_05 
rate_dead_cvd_05 rate_dead_tb_05  rate_dead_hivneg_cvd_05  rate_dead_hivneg_tb_05  rate_dead_hivneg_cause2_05 rate_dead_hivneg_cause3_05 
rate_dead_hivneg_cause4_05 rate_dead_hivneg_cause5_05  rate_dead_allage_05 rate_dead_hivneg_anycause_05 rate_dead_hivpos_anycause_05
n_cd4_lt50_05 n_cd4_lt200_05
p_ahd_re_enter_care_100_05 p_ahd_re_enter_care_200_05
incidence1524w_05   incidence1524m_05 incidence2534w_05   incidence2534m_05 incidence3544w_05   incidence3544m_05 
incidence4554w_05   incidence4554m_05 incidence5564w_05   incidence5564m_05
prevalence1519w_05 	prevalence1519m_05 prevalence2024w_05 	prevalence2024m_05 prevalence2529w_05 	prevalence2529m_05
prevalence3034w_05 	prevalence3034m_05 prevalence3539w_05 	prevalence3539m_05 prevalence4044w_05 	prevalence4044m_05 
prevalence4549w_05 	prevalence4549m_05 prevalence5054w_05 	prevalence5054m_05 prevalence5054w_05 	prevalence5054m_05
prevalence5559w_05 	prevalence5559m_05 prevalence6064w_05 	prevalence6064m_05 prevalence65plw_05 	prevalence65plm_05
p_age1549_hivneg_05 p_age1549_hiv_05  n_onart_05  n_death_hivpos_anycause_05  n_death_2059_m_05 
n_death_2059_w_05 n_death_hivrel_05
;
run;

proc means data=a.w_base_kenya_f n p50 p5 p95 mean;
var p_w_giv_birth_this_per_15	p_mcirc_15	prevalence1549m_15 prevalence1549w_15
incidence1549w_15  incidence1549m_15   incidence_sw_15  	p_diag_15 	p_diag_m_15   p_diag_w_15	p_ai_no_arv_c_nnm_15   
prop_w_1549_sw_15  mtct_prop_15  prop_1564_onprep_15
p_onart_diag_15 p_onart_vl1000_15   p_vl1000_15	p_onart_vl1000_w_15	p_onart_vl1000_m_15   p_onart_cd4_l500_15  p_onart_m_age50pl_15 p_onart_w_age50pl_15  
p_onart_cd4_l200_15  p_startedline2_15 prop_sw_newp0_15  prop_sw_hiv_15 p_newp_sw_15 
m15r_15 m25r_15 m35r_15 m45r_15 m55r_15 w15r_15 w25r_15 w35r_15 w45r_15 w55r_15 p_newp_ge1_15 p_newp_ge5_15 p_iime_15 prevalence_vg1000_15
s_alive_15
rate_dead_hivpos_cause1_15   rate_dead_hivpos_tb_15  rate_dead_hivpos_cause4_15 rate_dead_hivpos_crypm_15 
rate_dead_hivpos_sbi_15  rate_dead_hivpos_oth_adc_15  rate_dead_hivpos_cause2_15  rate_dead_hivpos_cause3_15  rate_dead_hivpos_cvd_15 
rate_dead_cvd_15 rate_dead_tb_15  rate_dead_hivneg_cvd_15  rate_dead_hivneg_tb_15  rate_dead_hivneg_cause2_15 rate_dead_hivneg_cause3_15 
rate_dead_hivneg_cause4_15 rate_dead_hivneg_cause5_15  rate_dead_allage_15 rate_dead_hivneg_anycause_15 rate_dead_hivpos_anycause_15
n_cd4_lt50_15 n_cd4_lt200_15
p_ahd_re_enter_care_100_15 p_ahd_re_enter_care_200_15
incidence1524w_15   incidence1524m_15 incidence2534w_15   incidence2534m_15 incidence3544w_15   incidence3544m_15 
incidence4554w_15   incidence4554m_15 incidence5564w_15   incidence5564m_15
prevalence1519w_15 	prevalence1519m_15 prevalence2024w_15 	prevalence2024m_15 prevalence2529w_15 	prevalence2529m_15
prevalence3034w_15 	prevalence3034m_15 prevalence3539w_15 	prevalence3539m_15 prevalence4044w_15 	prevalence4044m_15 
prevalence4549w_15 	prevalence4549m_15 prevalence5054w_15 	prevalence5054m_15 prevalence5054w_15 	prevalence5054m_15
prevalence5559w_15 	prevalence5559m_15 prevalence6064w_15 	prevalence6064m_15 prevalence65plw_15 	prevalence65plm_15
p_age1549_hivneg_15 p_age1549_hiv_15  n_onart_15 n_death_hivpos_anycause_15  n_death_2059_m_15 n_death_2059_w_15
;
run;




proc means data=a.w_base_kenya_f n p50 p5 p95 mean;
var p_w_giv_birth_this_per_21	p_mcirc_21	prevalence1549_21	prevalence1549m_21 prevalence1549w_21  prevalence_hiv_preg_21
incidence1549w_21  incidence1549m_21   incidence_sw_21  	p_diag_21 	p_diag_m_21   p_diag_w_21	p_ai_no_arv_c_nnm_21   
prop_w_1549_sw_21  mtct_prop_21  prop_1564_onprep_21
p_onart_diag_21 p_onart_vl1000_21   p_vl1000_21	p_onart_vl1000_w_21	p_onart_vl1000_m_21   p_onart_cd4_l500_21  p_onart_m_age50pl_21 p_onart_w_age50pl_21  
p_onart_cd4_l200_21  p_startedline2_21 prop_sw_newp0_21  prop_sw_hiv_21 p_newp_sw_21 
m15r_21 m25r_21 m35r_21 m45r_21 m55r_21 w15r_21 w25r_21 w35r_21 w45r_21 w55r_21 p_newp_ge1_21 p_newp_ge5_21 p_iime_21 prevalence_vg1000_21
s_alive_21
rate_dead_hivpos_cause1_21   rate_dead_hivpos_tb_21  rate_dead_hivpos_cause4_21 rate_dead_hivpos_crypm_21 
rate_dead_hivpos_sbi_21  rate_dead_hivpos_oth_adc_21  rate_dead_hivpos_cause2_21  rate_dead_hivpos_cause3_21  rate_dead_hivpos_cvd_21 
rate_dead_cvd_21 rate_dead_tb_21  rate_dead_hivneg_cvd_21  rate_dead_hivneg_tb_21  rate_dead_hivneg_cause2_21 rate_dead_hivneg_cause3_21 
rate_dead_hivneg_cause4_21 rate_dead_hivneg_cause5_21 /*  rate_dead_allage_21  rate_dead_hivneg_anycause_21 rate_dead_hivpos_anycause_21 */
n_cd4_lt50_21 n_cd4_lt200_21
p_ahd_re_enter_care_100_21 p_ahd_re_enter_care_200_21
incidence1524w_21   incidence1524m_21 incidence2534w_21   incidence2534m_21 incidence3544w_21   incidence3544m_21 
incidence4554w_21   incidence4554m_21 incidence5564w_21   incidence5564m_21
prevalence1519w_21 	prevalence1519m_21 prevalence2024w_21 	prevalence2024m_21 prevalence2529w_21 	prevalence2529m_21
prevalence3034w_21 	prevalence3034m_21 prevalence3539w_21 	prevalence3539m_21 prevalence4044w_21 	prevalence4044m_21 
prevalence4549w_21 	prevalence4549m_21 prevalence5054w_21 	prevalence5054m_21 prevalence5054w_21 	prevalence5054m_21
prevalence5559w_21 	prevalence5559m_21 prevalence6064w_21 	prevalence6064m_21 prevalence65plw_21 	prevalence65plm_21
p_age1549_hivneg_21 p_age1549_hiv_21

n_onart_21 n_death_hivpos_anycause_21  n_death_2059_m_21 n_death_2059_w_21
/*
n_alive_msm_21  n_alive1564_msm_21 incidence1549msm_21 incidence1564msm_21  prevalence1549_msm_21	prevalence1564_msm_21  p_elig_prep_any_msm_1564_21 
p_onprep_msm_21  p_onart_msm_21  prevalence_vg1000_msm_21	 p_diag_msm_21	 p_onart_diag_msm_21 p_vl1000_art_gt6m_msm_21	 
p_ever_tested_msm_21  p_tested_this_period_msm_21 p_msm_infected_from_msm_21*/
;
run;





proc means data=a.w_base_kenya_f n p50 p5 p95 mean;
var p_w_giv_birth_this_per_40	p_mcirc_40	prevalence1549m_40 	prevalence1549w_40
incidence1549w_40  incidence1549m_40   incidence_sw_40  	p_diag_40 	p_diag_m_40   p_diag_w_40	p_ai_no_arv_c_nnm_40   
prop_w_1549_sw_40  mtct_prop_40  prop_1564_onprep_40
p_onart_diag_40 p_onart_vl1000_40   p_vl1000_40	p_onart_vl1000_w_40	p_onart_vl1000_m_40   p_onart_cd4_l500_40  p_onart_m_age50pl_40 p_onart_w_age50pl_40  
p_onart_cd4_l200_40  p_startedline2_40 prop_sw_newp0_40  prop_sw_hiv_40 p_newp_sw_40 
m15r_40 m25r_40 m35r_40 m45r_40 m55r_40 w15r_40 w25r_40 w35r_40 w45r_40 w55r_40 p_newp_ge1_40 p_newp_ge5_40 p_iime_40 prevalence_vg1000_40
s_alive_40
rate_dead_hivpos_cause1_40   rate_dead_hivpos_tb_40  rate_dead_hivpos_cause4_40 rate_dead_hivpos_crypm_40 
rate_dead_hivpos_sbi_40  rate_dead_hivpos_oth_adc_40  rate_dead_hivpos_cause2_40  rate_dead_hivpos_cause3_40  rate_dead_hivpos_cvd_40 
rate_dead_cvd_40 rate_dead_tb_40  rate_dead_hivneg_cvd_40  rate_dead_hivneg_tb_40  rate_dead_hivneg_cause2_40 rate_dead_hivneg_cause3_40 
rate_dead_hivneg_cause4_40 rate_dead_hivneg_cause5_40  rate_dead_allage_40   rate_dead_hivneg_anycause_40 rate_dead_hivpos_anycause_40
p_ahd_re_enter_care_100_40 p_ahd_re_enter_care_200_40
incidence1524w_40   incidence1524m_40 incidence2534w_40   incidence2534m_40 incidence3544w_40   incidence3544m_40 
incidence4554w_40   incidence4554m_40 incidence5564w_40   incidence5564m_40
prevalence1519w_40 	prevalence1519m_40 prevalence2024w_40 	prevalence2024m_40 prevalence2529w_40 	prevalence2529m_40
prevalence3034w_40 	prevalence3034m_40 prevalence3539w_40 	prevalence3539m_40 prevalence4044w_40 	prevalence4044m_40 
prevalence4549w_40 	prevalence4549m_40 prevalence5054w_40 	prevalence5054m_40 prevalence5054w_40 	prevalence5054m_40
prevalence5559w_40 	prevalence5559m_40 prevalence6064w_40 	prevalence6064m_40 prevalence65plw_40 	prevalence65plm_40
 p_age1549_hivneg_40 p_age1549_hiv_40
;
run;

proc means data=a.w_base_kenya_f n p50 p5 p95 mean;
var p_w_giv_birth_this_per_70	p_mcirc_70		prevalence1549m_70 prevalence1549w_70
incidence1549w_70  incidence1549m_70   incidence_sw_70  	p_diag_70 	p_diag_m_70   p_diag_w_70	p_ai_no_arv_c_nnm_70   
prop_w_1549_sw_70  mtct_prop_70  prop_1564_onprep_70
p_onart_diag_70 p_onart_vl1000_70   p_vl1000_70	p_onart_vl1000_w_70	p_onart_vl1000_m_70   p_onart_cd4_l500_70  p_onart_m_age50pl_70 p_onart_w_age50pl_70  
p_onart_cd4_l200_70  p_startedline2_70 prop_sw_newp0_70  prop_sw_hiv_70 p_newp_sw_70 
m15r_70 m25r_70 m35r_70 m45r_70 m55r_70 w15r_70 w25r_70 w35r_70 w45r_70 w55r_70 p_newp_ge1_70 p_newp_ge5_70 p_iime_70 prevalence_vg1000_70
s_alive_70
rate_dead_hivpos_cause1_70   rate_dead_hivpos_tb_70  rate_dead_hivpos_cause4_70 rate_dead_hivpos_crypm_70 
rate_dead_hivpos_sbi_70  rate_dead_hivpos_oth_adc_70  rate_dead_hivpos_cause2_70  rate_dead_hivpos_cause3_70  rate_dead_hivpos_cvd_70 
rate_dead_cvd_70 rate_dead_tb_70  rate_dead_hivneg_cvd_70  rate_dead_hivneg_tb_70  rate_dead_hivneg_cause2_70 rate_dead_hivneg_cause3_70 
rate_dead_hivneg_cause4_70 rate_dead_hivneg_cause5_70 rate_dead_allage_70  rate_dead_hivneg_anycause_70 rate_dead_hivpos_anycause_70
p_ahd_re_enter_care_100_70 p_ahd_re_enter_care_200_70
incidence1524w_70   incidence1524m_70 incidence2534w_70   incidence2534m_70 incidence3544w_70   incidence3544m_70 
incidence4554w_70   incidence4554m_70 incidence5564w_70   incidence5564m_70
prevalence1519w_70 	prevalence1519m_70 prevalence2024w_70 	prevalence2024m_70 prevalence2529w_70 	prevalence2529m_70
prevalence3034w_70 	prevalence3034m_70 prevalence3539w_70 	prevalence3539m_70 prevalence4044w_70 	prevalence4044m_70 
prevalence4549w_70 	prevalence4549m_70 prevalence5054w_70 	prevalence5054m_70 prevalence5054w_70 	prevalence5054m_70
prevalence5559w_70 	prevalence5559m_70 prevalence6064w_70 	prevalence6064m_70 prevalence65plw_70 	prevalence65plm_70
p_age1549_hivneg_70 p_age1549_hiv_70
;
run;

ods html close;



data q1; set a.w_base_kenya_f;

/*
if n_onart_15 < 700000 and r_prev_4044w_4549w_17 > 0.9  and 0.08 <= prevalence1549_17 < 0.12 and 0.06 <= prevalence1549_98 < 0.19
and p_vl1000_20 > 0.75 and incidence1549_20 < 0.50 ;
*/

run_keep = run;

/*
proc freq; tables sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl an_lin_incr_test
date_test_rate_plateau  incr_test_rate_sympt max_freq_testing
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
incr_mort_risk_dol_weightg  sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph
; run;
*/

keep run run_keep;

run;




data a.l_base_keep_kenya_f; merge a.l_base_kenya_f q1 ; by run;

if run_keep ne .;

ods html;
proc print noobs; var run; 
where cald = 2021.25;
run;
ods html close;


proc freq data = a.l_base_keep_kenya_f; tables
sf_2021 /*dataset*/ sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl an_lin_incr_test
date_test_rate_plateau  incr_test_rate_sympt max_freq_testing
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
incr_mort_risk_dol_weightg sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph;
run;






/*

proc glm; 
class sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w ;

model r_prev_sex_1549_17 =    ych_risk_beh_ep fold_change_w base_rate_sw   rred_a_p 
sex_beh_trans_matrix_m sex_beh_trans_matrix_w  / solution ; run;

* p_rred_p p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep  fold_change_w
fold_change_yw  base_rate_sw base_rate_stop_sexwork   rred_a_p
sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w 
/ solution;
run;

*
exp_setting_lower_p_vl1000  external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base
fold_change_sti tr_rate_undetec_vl super_infection an_lin_incr_test
date_test_rate_plateau incr_test_rate_sympt max_freq_testing
test_targeting fx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr switch_for_tox  
 circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat 
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

;

*/
