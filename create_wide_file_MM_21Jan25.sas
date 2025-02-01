
libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.mm_21jan25; 
if run=. then delete; 

proc sort;
by run cald option;run;

proc freq;table option cald;run;


data sf;
set a;

if cald=2025.25; ***Update as required;
s_alive = s_alive_m + s_alive_w ;

sf_2025 = (40912109) / s_alive;  * Mihpsa_SA calibration folder in output files using World Bank;
sf=sf_2025;
keep run sf sf_2025;
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

***Scaling up to annual discounted DALYs in the whole population;
ddaly = s_ddaly * sf * 4;


***These are additional potential DALYs to include which have not so far been included;

s_mtct = s_birth_with_inf_child + s_child_infected_breastfeeding ;

ddaly_yll_mtct = s_mtct * sf * 4 * 5   * discount ; * 5  yll dalys per infected child ;  

ddaly_mtct = ddaly_yll_mtct + (s_ddaly_mtct * sf * 4); * adding the yll to the live dalys;

* ddalys accounting for mtct;

ddaly_ac_mtct = ddaly + ddaly_mtct;



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
if s_dcost_prep_inj=. then s_dcost_prep_inj=0;
if s_dcost_prep_visit=. then s_dcost_prep_visit=0;
if s_dcost_prep_ac_adh=. then s_dcost_prep_ac_adh=0;
if s_dcost_circ=. then s_dcost_circ=0;
if s_dcost_condom_dn=. then s_dcost_condom_dn=0;

***Vaginal ring cost will also needed to be added here when used in HIV Synthesis;
s_dcost_prep = s_dcost_prep_oral + s_dcost_prep_inj;
s_dcost_prep_visit = s_dcost_prep_visit_oral + s_dcost_prep_visit_inj;

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
dcost_prep_inj = s_dcost_prep_inj * sf * 4 / 1000; 
dcost_prep_oral = s_dcost_prep_oral * sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf * 4 / 1000; 	
dcost_prep_visit_inj  = s_dcost_prep_visit_inj * sf * 4 / 1000; 	
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

***Will need to add the cost of VG when included in HIV Synthesis;
dcost = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost + dres_cost +
		dtest_cost + d_t_adh_int_cost + dswitchline_cost + dcost_drug_level_test + dcost_circ + dcost_condom_dn +
		+ dcost_avail_self_test + dcost_prep_visit_oral + dcost_prep_oral + dcost_prep_visit_inj + dcost_prep_inj + 
		dcost_sw_program;

dcost_clin_care = dart_cost_y + dadc_cost + dcd4_cost + dvl_cost + dvis_cost + dnon_tb_who3_cost + dcot_cost + dtb_cost +
				  dres_cost + d_t_adh_int_cost + dswitchline_cost; 

***This reverses the discount (if needed);
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


***general population- key outputs;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

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

* incidence1549_;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* n_onprep_w;					n_onprep_w = max(s_onprep_w, 0) * sf;
* n_onprep_m;					n_onprep_m = max(s_onprep_m, 0) * sf;
* n_onprep;						n_onprep = n_onprep_w + n_onprep_m ;
* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;
* n_prep_any_start;				n_prep_any_start = max(s_prep_any_start, 0) * sf;

***Mobile men;
* p_diag_mm;					if s_hiv1564mm  > 0 then p_diag_mm = s_diag_mm1564_ / s_hiv1564mm ; 
* p_onart_diag_mm;				if s_diag > 0 then p_onart_diag_mm = s_onart_iicu / s_diag_mm1564_;
* p_onart_vl1000_mm;			if s_onart_gt6m_iicu_mm   > 0 then p_onart_vl1000_mm = s_vl1000_art_iicu_mm / s_onart_gt6m_iicu_mm; 

* p_vg1000_mm, p_vl1000_mm;		if s_hiv1564mm  > 0 then p_vg1000_mm = s_vg1000_mm / s_hiv1564mm ;  p_vl1000_mm = 1- p_vg1000_mm ;

* prevalence1549_mm;			prevalence1549_mm = s_hiv1549mm  / s_alive1549mm ;
* prevalence1564_mm;			prevalence1564_mm = s_hiv1564mm  / s_alive1564mm ;

* incidence1549_mm;				incidence1549_mm = (s_primary1549mm * 4 * 100) / (s_alive1549mm  - s_hiv1549mm  + s_primary1549mm);
* incidence1564_mm;				incidence1564_mm = (s_primary1564mm * 4 * 100) / (s_alive1564mm  - s_hiv1564mm  + s_primary1564mm);

* n_tested_mm;					n_tested_mm = s_tested_mm * sf ;

* prop_1564mm_onprep_mm;		prop_1564mm_onprep_mm =   max(s_onprep_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;
* prop_1564mm_onprep_inj_mm;	prop_1564mm_onprep_inj_mm =   max(s_onprep_inj_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;
* prop_1564mm_onprep_oral_mm;	prop_1564mm_onprep_oral_mm =   max(s_onprep_oral_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;

* prop_elig_on_prep_mm;			if s_elig_prep_any_mm_1564_ > 0 then prop_elig_on_prep_mm = s_onprep_mm / s_elig_prep_any_mm_1564_ ;

* n_prep_any_mm;				n_prep_any_mm = s_onprep_mm * sf;
* n_prep_oral_mm;				n_prep_oral_mm = s_onprep_oral_mm * sf;
* n_prep_inj_mm;				n_prep_inj_mm = s_onprep_inj_mm * sf;

* n_prep_ever_mm;				n_prep_ever_mm = s_prep_any_ever_mm * sf;
* p_prep_any_ever_mm;			p_prep_any_ever_mm = s_prep_any_ever_mm / s_mm;

keep run option cald 
prevalence1549m 	 prevalence1549w 	prevalence1549 		incidence1549_ 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000 			p_vl1000 			prevalence_vg1000
n_onprep_w			 n_onprep_m			n_onprep			prop_1564m_onprep   prop_1564w_onprep	n_prep_any_start

dcost ddaly

p_diag_mm			p_onart_diag_mm		p_onart_vl1000_mm		p_vg1000_mm		p_vl1000_mm		prevalence1549_mm	
prevalence1564_mm	incidence1549_mm	incidence1564_mm		n_tested_mm		prop_1564mm_onprep_mm
prop_1564mm_onprep_inj_mm				prop_1564mm_onprep_oral_mm				prop_elig_on_prep_mm
n_prep_any_mm		n_prep_oral_mm		n_prep_inj_mm			n_prep_ever_mm	p_prep_any_ever_mm
;

proc sort data=y;by run option;run;

options nomprint;
option nospool;

****Baseline data for calibration;

data z; 
set y; 
  option nospool;

%macro var(v=);

* &v ;

  options nomprint;

proc means  noprint data=y; var &v; output out=y_00 mean= &v;  ; where 2000   <= cald < 2001  ; 
proc means  noprint data=y; var &v; output out=y_01 mean= &v;  ; where 2001   <= cald < 2002  ; 
proc means  noprint data=y; var &v; output out=y_02 mean= &v;  ; where 2002   <= cald < 2003  ; 
proc means  noprint data=y; var &v; output out=y_03 mean= &v;  ; where 2003   <= cald < 2004  ; 
proc means  noprint data=y; var &v; output out=y_04 mean= &v;  ; where 2004   <= cald < 2005  ; 
proc means  noprint data=y; var &v; output out=y_05 mean= &v;  ; where 2005   <= cald < 2006  ; 
proc means  noprint data=y; var &v; output out=y_06 mean= &v;  ; where 2006   <= cald < 2007  ; 
proc means  noprint data=y; var &v; output out=y_07 mean= &v;  ; where 2007   <= cald < 2008  ; 
proc means  noprint data=y; var &v; output out=y_08 mean= &v;  ; where 2008   <= cald < 2009  ; 
proc means  noprint data=y; var &v; output out=y_09 mean= &v;  ; where 2009   <= cald < 2010  ; 
proc means  noprint data=y; var &v; output out=y_10 mean= &v;  ; where 2010   <= cald < 2011  ; 
proc means  noprint data=y; var &v; output out=y_11 mean= &v;  ; where 2011   <= cald < 2012  ; 
proc means  noprint data=y; var &v; output out=y_12 mean= &v;  ; where 2012   <= cald < 2013  ; 
proc means  noprint data=y; var &v; output out=y_13 mean= &v;  ; where 2013   <= cald < 2014  ; 
proc means  noprint data=y; var &v; output out=y_14 mean= &v;  ; where 2014   <= cald < 2015  ; 
proc means  noprint data=y; var &v; output out=y_15 mean= &v;  ; where 2015   <= cald < 2016  ; 
proc means  noprint data=y; var &v; output out=y_16 mean= &v;  ; where 2016   <= cald < 2017  ; 
proc means  noprint data=y; var &v; output out=y_17 mean= &v;  ; where 2017   <= cald < 2018  ; 
proc means  noprint data=y; var &v; output out=y_18 mean= &v;  ; where 2018   <= cald < 2019  ; 
proc means  noprint data=y; var &v; output out=y_19 mean= &v;  ; where 2019   <= cald < 2020  ; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v;  ; where 2020   <= cald < 2021  ; 
proc means  noprint data=y; var &v; output out=y_21 mean= &v;  ; where 2021   <= cald < 2022  ; 
proc means  noprint data=y; var &v; output out=y_22 mean= &v;  ; where 2022   <= cald < 2023  ; 
proc means  noprint data=y; var &v; output out=y_23 mean= &v;  ; where 2023   <= cald < 2024  ; 
proc means  noprint data=y; var &v; output out=y_24 mean= &v;  ; where 2024   <= cald < 2025  ; 
 																										   
																										
data &v ; set 

y_00 y_01 y_02 y_03 y_04 y_05 y_06 y_07 y_08 y_09 y_10 y_11 y_12 y_13 y_14 y_15 y_16 y_17 y_18 y_19 y_20 y_21
y_22 y_23 y_24
;
drop _NAME_ _TYPE_ _FREQ_;

***Align these vars with baseline calibration sheet; include incidence; 

%mend var;

%var(v=n_alive_m);			%var(v=n_alive_w);    		%var(v=n_alive);		%var(v=prevalence_m);		%var(v=prevalence_w);  
%var(v=prevalence); 		%var(v=incidence1549m);		%var(v=incidence1549w);	%var(v=incidence1549_);		%var(v=p_diag1549m);    	
%var(v=p_diag1549w);     	%var(v=p_diag1549_); 		%var(v=p_onart_diag_m);	%var(v=p_onart_diag_w);		%var(v=p_onart_diag); 
%var(v=p_onart_vl1000_m);  	%var(v=p_onart_vl1000_w);  	%var(v=p_onart_vl1000_);%var(v=n_onprep_m);			%var(v=n_onprep_m);
%var(v=prop_1564m_onprep);	%var(v=prop_1564w_onprep);

/*
%var(v=n_infected_m); 		%var(v=n_infected_w); 		%var(v=n_infected);		%var(v=prop_w_1564_sw);		%var(v=prop_sw_hiv1549_); 
%var(v=p_mcirc);			%var(v=p_vmmc);				%var(v=p_trad_circ);	%var(v=n_death_hivrel_m );  %var(v=n_death_hivrel_w ); 
%var(v=n_death_hivrel ); 	%var(v=n_hiv_m);			%var(v=n_hiv_w);		%var(v=n_hiv);				%var(v=prevalence_msm);
%var(v=prop_m_msm);    		%var(v=incidence1524m);		%var(v=incidence1524w);	%var(v=incidence1564m);		%var(v=incidence1564w);
%var(v=incidence1564_);		%var(v=n_onart); 			%var(v=n_infected_agyw);%var(v=incidence_agyw);		%var(v=incidence_sw);	
%var(v=incidence_msm);		%var(v=n_onprep_m);			%var(v=n_onprep_w);		%var(v=n_onprep);			%var(v=p_1564_onprep);	
%var(v=n_onprep_sw);		%var(v=p_onprep_sw);		%var(v=n_onprep_msm);	%var(v=p_onprep_msm);		%var(v=yll_m); 	
%var(v=cost);			%var(v=daly_gbd);
*/


data year;

input year;
cards;
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



data   wide_outputs; merge year 


n_alive_m			n_alive_w    		n_alive			prevalence_m		prevalence_w  
prevalence 			incidence1549m		incidence1549w	incidence1549_		p_diag1549m    	
p_diag1549w     	p_diag1549_ 		p_onart_diag_m	p_onart_diag_w		p_onart_diag 
p_onart_vl1000_m  	p_onart_vl1000_w  	p_onart_vl1000_	n_onprep_m			n_onprep_m
prop_1564m_onprep	prop_1564w_onprep;

run;


ods html;
proc print noobs ; run; 
ods html close;


***or can print to excel;
/*
ods excel file="C:\Users\loveleen\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\WHO Ivory Coast\Op1.xlsx"
options(sheet_name='intervention' start_at='A2');
proc print data=wide_outputs noobs;run;
*/







***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

***OUTPUTS IN SPECIFIC YEARS - AMEND TO E.G. PROJECT SPECIFIC BASELINE (NOTE THESE ARE NOT BY OPTION);
proc means  noprint data=y; var &v; output out=y_22 mean= &v._22; by run; where 2021.0 <= cald < 2022.0; 

***OUTPUTS IN SPECIFIC YEARS BY OPTION - THIS MAY NOT BE NEEDED IN ALL ANALYSES;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option; where 2029.0 <= cald < 2030.25; 

***OUTPUTS FOR CE ANALYSES OVER 5, 20 AND 50 years BY OPTION;
proc means noprint data=y; var &v; output out=y_22_27 mean= &v._22_27; by run option ; where 2022.5 <= cald < 2027.50;
proc means noprint data=y; var &v; output out=y_22_42 mean= &v._22_42; by run option ; where 2022.5 <= cald < 2042.50;
proc means noprint data=y; var &v; output out=y_22_72 mean= &v._22_72; by run option ; where 2022.5 <= cald < 2072.50;

***SORT OUTPUT DATASETS BY RUN BEFORE MERGING;
proc sort data=y_22; by run; proc transpose data=y_22 out=t_22 prefix=&v._22_; var &v._22; by run;
proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;
proc sort data=y_22_27; by run; proc transpose data=y_22_27 out=t_22_27 prefix=&v._22_27_; var &v._22_27; by run;
proc sort data=y_22_42; by run; proc transpose data=y_22_42 out=t_22_42 prefix=&v._22_42_; var &v._22_42; by run;
proc sort data=y_22_72; by run; proc transpose data=y_22_72 out=t_22_72 prefix=&v._22_72_; var &v._22_72; by run;

***MERGE TOGETHER SO THE DATASET NOW CONTAINS MEANS OVER SPECIFIED PERIODS;
data &v ; merge  y_22 t_30 t_22_27 t_22_42 t_22_72;  


***THIS MACRO CALCULATES THE MEANS OVER PERIOD AT EACH OF THE SPECIFIED TIME PERIODS ABOVE ANS STORES THESE IN INDIVIDUAL DATASETS;
%mend var;


%var(v=p_diag);	 		%var(v=p_diag_m);	 		%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000);		%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);
%var(v=p_vg1000); 		%var(v=p_vl1000);			%var(v=prevalence_vg1000);

%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549); 	
%var(v=incidence1549); 	%var(v=incidence1549w); 	%var(v=incidence1549m);
%var(v=dcost);	 		%var(v=ddaly);

*/ADD IN PROJECT SPECIFIC OUTPUTS/*;

run;


***MERGE THE DATASETS CREATED ABOVE INTO ONE DATASET;
data wide_outputs;merge
p_diag	 		p_diag_m	 		p_diag_w   			p_onart_diag  	p_onart_diag_w
p_onart_diag_m 	p_onart_vl1000		p_onart_vl1000_w   	p_onart_vl1000_m
p_vg1000 		p_vl1000			prevalence_vg1000
prevalence1549m	prevalence1549w 	prevalence1549 		incidence1549 	incidence1549w 	incidence1549m
dcost			ddaly

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
%par(p=effect_sw_prog_pers_sti); %par(p=sw_trans_matrix);
run;


data wide_par; merge 
sw_art_disadv		sw_program			effect_sw_prog_newp			effect_sw_prog_6mtest	
effect_sw_prog_int	effect_sw_prog_adh	effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti
sw_trans_matrix;
;proc sort; by run;run;

***SAVE DATASET READY FOR ANALYSIS;
data a.wide_XXX;
merge   wide_outputs  wide_par ;  
by run;run;

