
libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.mm_10Aug2026; 
if run=. then delete; 

proc sort;
by run cald option;run;

proc freq;table cald option;run;


data sf;
set a;

if cald=2025.25; ***Update as required;
s_alive = s_alive_m + s_alive_w ;

*sf_2025 = (40912109) / s_alive;  * Mihpsa_SA calibration folder in output files using World Bank;
sf_2025=10000000/s_alive;
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
dcost_prep_inj = s_dcost_prep_cab * sf * 4 / 1000; 
dcost_prep_oral = s_dcost_prep_oral * sf * 4 / 1000; 
dcost_prep_visit  = s_dcost_prep_visit * sf * 4 / 1000; 	
dcost_prep_visit_inj  = s_dcost_prep_visit_cab * sf * 4 / 1000; 	
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

s_alive = s_alive_m + s_alive_w ;

***general population;

* n_alive;						n_alive = s_alive * sf;
* n_alive_m;					n_alive_m = s_alive_m * sf;
* n_alive_w;					n_alive_w = s_alive_w * sf;

***general population- key outputs;
* p_hiv_m;						p_hiv_m = s_hiv1564m/s_ageg1564m;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000_;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_vg1000_, p_vl1000_;			if s_hiv1564  > 0 then p_vg1000_ = s_vg1000 / s_hiv1564 ;  p_vl1000_ = 1- p_vg1000_ ;
* prevalence_vg1000_;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000_ = s_vg1000 / (s_alive1549_w + s_alive1549_m);

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549_;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549_;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* n_onprep_w;					n_onprep_w = max(s_onprep_w, 0) * sf;
* n_onprep_m;					n_onprep_m = max(s_onprep_m, 0) * sf;
* n_onprep;						n_onprep = n_onprep_w + n_onprep_m ;
* p_1564m_onprep;				p_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* p_1564w_onprep;				p_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;
* n_prep_any_start;				n_prep_any_start = max(s_prep_any_start, 0) * sf;

* p_elig_prep;					p_elig_prep = s_prep_any_elig/((s_alive1564_m - s_hiv1564m)+(s_alive1564_w - s_hiv1564w)) ;
* p_elig_on_prep;				if s_prep_any_elig > 0 then p_elig_on_prep = s_prep_any / s_prep_any_elig ;
								if s_prep_any_elig = 0 then p_elig_on_prep = 0;
* p_elig_on_prep_cab;			if s_prep_any_elig > 0 then p_elig_on_prep_cab = s_prep_cab / s_prep_any_elig ;
								if s_prep_any_elig = 0 then p_elig_on_prep_cab = 0;
* p_elig_on_prep_len;			if s_prep_any_elig > 0 then p_elig_on_prep_len = s_prep_len / s_prep_any_elig ;
								if s_prep_any_elig = 0 then p_elig_on_prep_len = 0;
* p_elig_on_prep_oral;			if s_prep_any_elig > 0 then p_elig_on_prep_oral = s_prep_oral / s_prep_any_elig ;
								if s_prep_any_elig = 0 then p_elig_on_prep_oral = 0;

* n_stop_prep_oral_elig;		n_stop_prep_oral_elig = s_stop_prep_oral_elig * sf;
* n_stop_prep_cab_elig;			n_stop_prep_cab_elig = s_stop_prep_cab_elig * sf;
* n_stop_prep_len_elig;			n_stop_prep_len_elig = s_stop_prep_len_elig * sf;

* n_prep_oral_start;			n_prep_oral_start = s_prep_oral_start * sf;
* n_prep_cab_start;				n_prep_cab_start = s_prep_cab_start * sf;
* n_prep_len_start;				n_prep_len_start = s_prep_len_start * sf;



***Not correctly outputted - should be ok next time;
* p_elig_on_prep_w;			    if s_elig_prep_any_w_1564 > 0 then p_elig_on_prep_w = s_prep_any_w_1564/s_elig_prep_any_w_1564;
								if s_elig_prep_any_w_1564 = 0 then p_elig_on_prep_w=0;
* p_elig_on_prep_m;			    if s_elig_prep_any_m_1564 > 0 then p_elig_on_prep_m = s_prep_any_m_1564/s_elig_prep_any_m_1564;
								if s_elig_prep_any_m_1564 = 0 then p_elig_on_prep_m=0;
*nmm=non mobile men;
* p_1564m_onprep_nmm;  		    p_1564m_onprep_nmm = (s_onprep_cab_m + s_onprep_oral_m - s_prep_any_mm_1564)/ ((s_alive1564_m - s_hiv1564m) - (s_alive1564mm - s_hiv1564mm));
* p_hiv_nmm;					p_hiv_nmm = s_hiv1564nmm /s_alive1564nmm ;
* p_prep_any_ever_nmm;			p_prep_any_ever_nmm = (s_prep_any_ever_m - s_prep_any_ever_mm)/ (s_alive_m - s_alive1564mm);
* p_elig_on_prep_nmm;			if s_elig_prep_any_nmm_1564_ > 0 then p_elig_on_prep_nmm = (s_onprep_m - s_prep_any_mm_1564) / s_elig_prep_any_nmm_1564_ ;
* p_elig_on_prep_msm;			if s_elig_prep_any_msm_1564 > 0 then p_elig_on_prep_msm = s_onprep_msm/s_elig_prep_any_msm_1564;

* p_elig_on_prep_genmen;		if (s_elig_prep_any_nmm_1564_ - s_elig_prep_any_msm_1564 - s_elig_prep_any_pwid_1564)>0 then 
								p_elig_on_prep_genmen = (s_onprep_m - s_prep_any_mm_1564 - s_onprep_msm - s_onprep_pwid)/(s_elig_prep_any_nmm_1564_ - s_elig_prep_any_msm_1564 - s_elig_prep_any_pwid_1564);
***Mobile men;
* p_mm;							p_mm = s_alive1564mm/s_ageg1564m;

* p_hiv_mm;						if s_alive1564mm > 0 then  p_hiv_mm = s_hiv1564mm/s_alive1564mm;

* p_diag_mm;					if s_hiv1564mm  > 0 then p_diag_mm = s_diag_mm1564_ / s_hiv1564mm ;
 
* p_onart_diag_mm;				if s_diag_mm1564_ > 0 then p_onart_diag_mm = s_onart_iicu / s_diag_mm1564_;
* p_onart_vl1000_mm;			if s_onart_gt6m_iicu_mm   > 0 then p_onart_vl1000_mm = s_vl1000_art_iicu_mm / s_onart_gt6m_iicu_mm; 

* p_vg1000_mm, p_vl1000_mm;		if s_hiv1564mm  > 0 then p_vg1000_mm = s_vg1000_mm / s_hiv1564mm ;  p_vl1000_mm = 1- p_vg1000_mm ;

* prevalence1549_mm;			if s_alive1549mm > 0 then prevalence1549_mm = s_hiv1549mm  / s_alive1549mm ;
* prevalence1564_mm;			if s_alive1564mm > 0 then prevalence1564_mm = s_hiv1564mm  / s_alive1564mm ;

* incidence1549_mm;				if (s_alive1549mm  - s_hiv1549mm  + s_primary1549mm) > 0 then 
								incidence1549_mm = (s_primary1549mm * 4 * 100) / (s_alive1549mm  - s_hiv1549mm  + s_primary1549mm);
* incidence1564_mm;				if (s_alive1564mm  - s_hiv1564mm  + s_primary1564mm) > 0 then 
								incidence1564_mm = (s_primary1564mm * 4 * 100) / (s_alive1564mm  - s_hiv1564mm  + s_primary1564mm);

* n_tested_mm;					n_tested_mm = s_tested_mm * sf ;

* p_1564mm_onprep_mm;			if (s_alive1564mm - s_hiv1564mm) > 0 then p_1564mm_onprep_mm =   max(s_prep_any_mm_1564, 0) / (s_alive1564mm - s_hiv1564mm) ;
* p_1564mm_onprep_cab_mm;		if (s_alive1564mm - s_hiv1564mm) > 0 then p_1564mm_onprep_cab_mm =   max(s_prep_cab_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;
* p_1564mm_onprep_len_mm;		if (s_alive1564mm - s_hiv1564mm) > 0 then p_1564mm_onprep_len_mm =   max(s_prep_len_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;

* p_1564mm_onprep_oral_mm;		if (s_alive1564mm - s_hiv1564mm) > 0 then p_1564mm_onprep_oral_mm =   max(s_prep_oral_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;

* p_elig_on_prep_mm;			if s_elig_prep_any_mm_1564_ > 0 then p_elig_on_prep_mm = s_prep_any_mm_1564 / s_elig_prep_any_mm_1564_ ;
* p_elig_on_prep_oral_mm;		if s_elig_prep_any_mm_1564_ > 0 then p_elig_on_prep_oral_mm = s_prep_oral_mm / s_elig_prep_any_mm_1564_ ;
* p_elig_on_prep_cab_mm;		if s_elig_prep_any_mm_1564_ > 0 then p_elig_on_prep_cab_mm = s_prep_cab_mm / s_elig_prep_any_mm_1564_ ;
* p_elig_on_prep_len_mm;		if s_elig_prep_any_mm_1564_ > 0 then p_elig_on_prep_len_mm = s_prep_len_mm / s_elig_prep_any_mm_1564_ ;




* n_prep_any_mm;				n_prep_any_mm = s_prep_any_mm_1564 * sf;
* n_prep_oral_mm;				n_prep_oral_mm = s_prep_oral_mm * sf;
* n_prep_cab_mm;				n_prep_cab_mm = s_prep_cab_mm * sf;
* n_prep_len_mm;				n_prep_len_mm = s_prep_len_mm * sf;


* n_prep_ever_mm;				n_prep_ever_mm = s_prep_any_ever_mm * sf;
* p_prep_any_ever_mm;			if  s_alive1564mm > 0 then p_prep_any_ever_mm = s_prep_any_ever_mm / s_alive1564mm;

* p_newp_ge1_mm;				if s_alive1564mm  > 0 then p_newp_ge1_mm = s_newp_ge1_mm / s_alive1564mm ;
* p_prep_any_willing;			p_prep_any_willing = s_prep_any_willing/s_alive;


keep run option cald n_alive_m			n_alive_w			n_alive				p_mm				p_hiv_mm	p_hiv_m
prevalence1549m 	 prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000_ 			p_vl1000_ 			prevalence_vg1000_
n_onprep_w			 n_onprep_m			n_onprep			p_1564m_onprep   	p_1564w_onprep		n_prep_any_start
p_elig_on_prep_w	 p_elig_on_prep_m	p_elig_on_prep		p_elig_on_prep_mm	p_elig_on_prep_nmm	p_elig_prep
p_1564m_onprep_nmm	 p_hiv_nmm			p_prep_any_ever_nmm p_elig_on_prep_genmen
dcost ddaly			 n_prep_oral_start	n_prep_cab_start	n_prep_len_start	
n_stop_prep_oral_elig	n_stop_prep_cab_elig 	n_stop_prep_len_elig


p_diag_mm			p_onart_diag_mm		p_onart_vl1000_mm		p_vg1000_mm		p_vl1000_mm		prevalence1549_mm	
prevalence1564_mm	incidence1549_mm	incidence1564_mm		n_tested_mm		p_1564mm_onprep_mm	p_hiv_mm
p_1564mm_onprep_cab_mm		p_1564mm_onprep_len_mm				p_1564mm_onprep_oral_mm				p_elig_on_prep_mm
n_prep_any_mm		n_prep_oral_mm		n_prep_cab_mm			n_prep_len_mm	n_prep_ever_mm	p_prep_any_ever_mm
p_newp_ge1_mm		p_prep_any_willing	n_prep_oral_mm			p_elig_on_prep_cab p_elig_on_prep_len	p_elig_on_prep_oral
p_elig_on_prep_oral_mm	p_elig_on_prep_cab_mm	p_elig_on_prep_len_mm	p_elig_on_prep_genmen
;

proc sort data=y;by run option;run;


options nomprint;
option nospool;


***This section is to create graphs in SAS - mostly specific to mobile men for which there is no observed data;

data b;
set y;
proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 800;
%let year_end = 2045.00 ;
run;
proc sort;by cald option ;run;


*turns log off;
options nonotes nosource nosource2 nomprint nomlogic nosymbolgen;


/*-----------------------------------------*/
/* Step 1: Macro to summarize a single option */
/*-----------------------------------------*/

%macro option_summary(option_num=0);***Option_num is a macro parameter with a default value of 0;

    /* Filter dataset for the selected option */
    data option_data;
        set b;
        where option = &option_num;
    run;

    /* List of variables to summarize */
    %let var =  
p_mm				p_hiv_mm			p_hiv_m
p_diag_mm			p_onart_diag_mm		p_onart_vl1000_mm		p_vg1000_mm			p_vl1000_mm		prevalence1549_mm	
prevalence1564_mm	incidence1549_mm	incidence1564_mm		n_tested_mm			p_1564mm_onprep_mm	
p_1564mm_onprep_cab_mm	p_1564mm_onprep_len_mm					p_1564mm_onprep_oral_mm						p_elig_on_prep_mm	
n_prep_any_mm		n_prep_oral_mm		n_prep_cab_mm			n_prep_len_mm		n_prep_ever_mm		p_prep_any_ever_mm
p_newp_ge1_mm		p_prep_any_willing	p_1564m_onprep			p_1564w_onprep 		p_elig_on_prep
p_elig_on_prep_mm	p_elig_on_prep_nmm	p_elig_prep
p_1564m_onprep_nmm	p_hiv_nmm		
n_prep_oral_mm		p_elig_on_prep_cab	p_elig_on_prep_len		p_elig_on_prep_oral
p_elig_on_prep_oral_mm	p_elig_on_prep_cab_mm	p_elig_on_prep_len_mm           		p_elig_on_prep_genmen
p_elig_on_prep_m	p_elig_on_prep_w 	p_prep_any_ever_nmm	 	n_prep_oral_start	n_prep_cab_start	n_prep_len_start	
n_stop_prep_oral_elig	n_stop_prep_cab_elig 	n_stop_prep_len_elig	
;
    /* Count number of variables */
    %let count = 0;
    %do %while (%qscan(&var, &count+1, %str( )) ne %str());
        %let count = %eval(&count + 1);
    %end;

    /* Initialize empty summary dataset (only cald and option) */
    data summary_option_&option_num;
        length cald 8 option 8;
        stop;
    run;

    /* Loop over variables and calculate stats */
    %do i = 1 %to &count;
        %let varb = %scan(&var,&i);

        /* Transpose the variable across simulations */
        proc transpose data=option_data out=tmp prefix=&varb;
            var &varb;
            by cald;
            id count_csim;
        run;

        /* Calculate statistics and keep only suffixed variables */
        data tmp_stat(keep=cald
                          p5_&varb._&option_num p95_&varb._&option_num
                          median_&varb._&option_num mean_&varb._&option_num);
            set tmp;
            p5_&varb._&option_num  = pctl(5, of &varb.1-&varb.&nfit);
            p95_&varb._&option_num = pctl(95, of &varb.1-&varb.&nfit);
            median_&varb._&option_num = median(of &varb.1-&varb.&nfit);
            mean_&varb._&option_num = mean(of &varb.1-&varb.&nfit);
        run;

        /* Merge stats into summary dataset */
        proc sort data=tmp_stat; by cald; run;
        proc sort data=summary_option_&option_num; by cald; run;

        data summary_option_&option_num;
            merge summary_option_&option_num tmp_stat;
            by cald;
            *option = &option_num;
        run;

    %end;

%mend;


/*-----------------------------------------*/
/* Step 2: Macro to combine multiple options */
/*-----------------------------------------*/
%macro summary_all_options(options=);

    /* Initialize empty master dataset */
    data master_summary;
        length cald 8 option 8;
        stop;
    run;

    %do j=1 %to %sysfunc(countw(&options));
        %let opt = %scan(&options, &j);

        /* Generate summary for this option */
        %option_summary(option_num= &opt);

        /* Merge option summary into master dataset */
        data master_summary;
            merge master_summary summary_option_&opt;
            by cald;
        run;

    %end;

%mend;

/*-----------------------------------------*/
/* Step 3: Example call for options 0, 1, 2 */
/*-----------------------------------------*/
%summary_all_options(options=0 1 2 3 4 5 6 7);



data d;
set master_summary;
run;

*turns log back on;
options notes source source2 mprint mlogic symbolgen;


ods listing close;
ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = 'C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Mobile Men\
graphs_22_07_26.doc' startpage=never; 


***Diagnostic;
ods listing close;
ods html style=htmlblue;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);

label median_p_1564m_onprep_0 = "Men";
label median_p_1564w_onprep_0 = "Women";

series  x=cald y=median_p_1564m_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_1564m_onprep_0 	upper=p95_p_1564m_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=median_p_1564w_onprep_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_1564w_onprep_0 	upper=p95_p_1564w_onprep_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people with an indication for PrEP currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label median_p_elig_on_prep_0 = "All";
label median_p_elig_on_prep_w_0 = "Women";
label median_p_elig_on_prep_m_0 = "Men";

series  x=cald y=median_p_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_0 	upper=p95_p_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "model 90% range";
series  x=cald y=median_p_elig_on_prep_w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_w_0 	upper=p95_p_elig_on_prep_w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";
series  x=cald y=median_p_elig_on_prep_m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_m_0 	upper=p95_p_elig_on_prep_m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "model 90% range";

run;quit;

*On oral/injectable;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people with an indication for PrEP currently on oral and injectable PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'portion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label median_p_elig_on_prep_oral_0 = "Oral (when injectable is Cab)";
label median_p_elig_on_prep_cab_0 = "CAB-LA";
label median_p_elig_on_prep_oral_1 = "Oral (when injectable is Len)";
label median_p_elig_on_prep_len_1 = "Len";
/*
series  x=cald y=median_p_elig_on_prep_oral_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_oral_0 	upper=p95_p_elig_on_prep_oral_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "model 90% range";
series  x=cald y=median_p_elig_on_prep_cab_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_cab_0 	upper=p95_p_elig_on_prep_cab_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";
*/
series  x=cald y=median_p_elig_on_prep_oral_1/	lineattrs = (color=black thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_oral_1 	upper=p95_p_elig_on_prep_oral_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "model 90% range";
series  x=cald y=median_p_elig_on_prep_len_1/	lineattrs = (color=red thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_len_1 	upper=p95_p_elig_on_prep_len_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";

run;quit;




***Mobile men;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of men, proportion mobile with increased risk";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label median_p_mm_0 = "Median";

series  x=cald y=median_p_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mm_0 	upper=p95_p_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label median_p_hiv_mm_0 = "Mobile men";
label median_p_hiv_nmm_0 = "non-mobile men";

series  x=cald y=median_p_hiv_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hiv_mm_0 	upper=p95_p_hiv_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=median_p_hiv_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hiv_nmm_0 	upper=p95_p_hiv_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Percentage of men ever on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.01) valueattrs=(size=10);

label median_p_prep_any_ever_mm_0 = "Mobile men";
label median_p_prep_any_ever_nmm_0 = "Non-mobile men (inc. MSM and PWID)";

series  x=cald y=median_p_prep_any_ever_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_any_ever_mm_0 	upper=p95_p_prep_any_ever_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

*this line is to check if it is any different with len introduced instead of cab - it shouldnt be;
series  x=cald y=median_p_prep_any_ever_mm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_prep_any_ever_mm_1 	upper=p95_p_prep_any_ever_mm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";


series  x=cald y=median_p_prep_any_ever_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_prep_any_ever_nmm_0 	upper=p95_p_prep_any_ever_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

***The _1s are just to ensure that len instead cab makes no difference to anything;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of those with an indication for PrEP, proportion of men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_p_elig_on_prep_mm_0 = "Mobile men (CAB SQ)";
label median_p_elig_on_prep_nmm_0 = "Non-Mobile men (CAB SQ)";
label median_p_elig_on_prep_mm_1 = "Mobile men (Len SQ)";
label median_p_elig_on_prep_nmm_1 = "Non-Mobile men (Len SQ)";

series  x=cald y=median_p_elig_on_prep_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_0 	upper=p95_p_elig_on_prep_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_mm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_1 	upper=p95_p_elig_on_prep_mm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";


series  x=cald y=median_p_elig_on_prep_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_nmm_0 	upper=p95_p_elig_on_prep_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_nmm_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_nmm_1 	upper=p95_p_elig_on_prep_nmm_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";


run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of mobile men with an indication for PrEP, proportion currently on oral and injectable PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_p_elig_on_prep_oral_mm_0 = "Oral";
label median_p_elig_on_prep_cab_mm_0 = "Injectable (CAB)";
label median_p_elig_on_prep_len_mm_1 = "Injectable (Len)";


series  x=cald y=median_p_elig_on_prep_oral_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_oral_mm_0 	upper=p95_p_elig_on_prep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_cab_mm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_cab_mm_0 	upper=p95_p_elig_on_prep_cab_mm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_len_mm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_len_mm_1 	upper=p95_p_elig_on_prep_len_mm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of mobile men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000) valueattrs=(size=10);

label median_n_prep_any_mm_0 = "Mobile men (Cab)";
label median_n_prep_any_mm_1 = "Mobile men (Len)";

series  x=cald y=median_n_prep_any_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_any_mm_0 	upper=p95_n_prep_any_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=median_n_prep_any_mm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_any_mm_1 	upper=p95_n_prep_any_mm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;



***After intervention;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men currently on ANY PrEP by option";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_p_elig_on_prep_mm_0 = "Status Quo 1: No PrEP for MM,CAB-LA for high risk women";
label median_p_elig_on_prep_mm_1 = "Status Quo 2: No PrEP for MM, Len for high risk women";
label median_p_elig_on_prep_mm_2 = "Scale up of oral PrEP, CAB-LA introduction (Op 2)";
label median_p_elig_on_prep_mm_3 = "Scale up of oral PrEP, Len introduction (Op 3)";
label median_p_elig_on_prep_mm_4 = "Scale up of CAB-LA (Op 4)";
label median_p_elig_on_prep_mm_5 = "Scale up of Len (Op 5)";
label median_p_elig_on_prep_mm_6 = "Scale up of oral PrEP and CAB-LA (Op 6)";
label median_p_elig_on_prep_mm_7 = "Scale up of oral PrEP and Len (Op 7)";

series  x=cald y=median_p_elig_on_prep_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_0 	upper=p95_p_elig_on_prep_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_1 	upper=p95_p_elig_on_prep_mm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_2/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_2 	upper=p95_p_elig_on_prep_mm_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_3/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_3 	upper=p95_p_elig_on_prep_mm_3  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_4/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_4 	upper=p95_p_elig_on_prep_mm_4  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_5/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_5 	upper=p95_p_elig_on_prep_mm_5  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_6/	lineattrs = (color=brown thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_6 	upper=p95_p_elig_on_prep_mm_6  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_7/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_7 	upper=p95_p_elig_on_prep_mm_7  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";


run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men currently on any PrEP where both CAB-LA and oral PrEP is scaled up";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_p_elig_on_prep_mm_0= "Status quo (Op 0, Cab available to high risk women) ";
label median_p_elig_on_prep_mm_5 = "Scale up of oral PrEP and CAB-LA (Op 5) ";
label median_p_elig_on_prep_cab_mm_5 = "CAB-LA (Op 5)";
label median_p_elig_on_prep_oral_mm_5 = "oral PrEP (Op 5)";

series  x=cald y=median_p_elig_on_prep_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_0 	upper=p95_p_elig_on_prep_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_mm_5/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_5 	upper=p95_p_elig_on_prep_mm_5  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_cab_mm_5/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_cab_mm_5 	upper=p95_p_elig_on_prep_cab_mm_5  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_oral_mm_5/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_oral_mm_5 	upper=p95_p_elig_on_prep_oral_5  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men currently on any PrEP where both Len and oral PrEP is scaled up";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_p_elig_on_prep_mm_1= "Status quo (Op 1, Len available to high risk women) ";
label median_p_elig_on_prep_mm_7 = "Scale up of oral PrEP and Len (Op 7) ";
label median_p_elig_on_prep_len_mm_7 = "Len (Op 7)";
label median_p_elig_on_prep_oral_mm_7 = "oral PrEP (Op 7)";

series  x=cald y=median_p_elig_on_prep_mm_1/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_1 	upper=p95_p_elig_on_prep_mm_1  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_mm_7/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_7 	upper=p95_p_elig_on_prep_mm_7  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_oral_mm_7/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_oral_mm_7 	upper=p95_p_elig_on_prep_oral_7  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_len_mm_7/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_len_mm_7 	upper=p95_p_elig_on_prep_len_mm_7  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men currently on oral and CAB by option";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_p_elig_on_prep_oral_mm_4 = "Oral PrEP when only CAB-LA scaled up (Op 4)"; 
label median_p_elig_on_prep_cab_mm_4 = "CAB-LA when only CAB-LA scaled up (Op 4)";
label median_p_elig_on_prep_mm_4 = "PrEP any when only CAB-LA scaled up (Op 4)"; 

label median_p_elig_on_prep_oral_mm_5 = "Oral PrEP when both oral and CAB-LA scaled up (Op 5)";
label median_p_elig_on_prep_cab_mm_5 = "CAB-LA when both oral and CAB-LA scaled up (Op 5)";
label median_p_elig_on_prep_mm_5 = "PrEP any when both oral and CAB-LA scaled up (Op 5)"; 

series  x=cald y=median_p_elig_on_prep_oral_mm_4/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_oral_mm_4 	upper=p95_p_elig_on_prep_oral_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_cab_mm_4/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_cab_mm_4 	upper=p95_p_elig_on_prep_cab_mm_4  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=median_p_elig_on_prep_mm_4/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_p_elig_on_prep_mm_4 	upper=p95_p_elig_on_prep_4 / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_oral_mm_5/	lineattrs = (color=green thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_oral_mm_5 	upper=p95_p_elig_on_prep_oral_5  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_cab_mm_5/	lineattrs = (color=red thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_cab_mm_5 	upper=p95_p_elig_on_prep_cab_mm_5  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_5/	lineattrs = (color=black thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_mm_5 	upper=p95_p_elig_on_prep_5  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc freq;table median_p_elig_on_prep_oral_mm_6;run;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men currently on oral and Len by option";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_p_elig_on_prep_oral_mm_6 = "Oral PrEP when only Len scaled up (Op 6)"; 
label median_p_elig_on_prep_len_mm_6 = "Len when only Len scaled up (Op 6)";
label median_p_elig_on_prep_mm_6 = "PrEP any when only Len scaled up (Op 6)"; 

label median_p_elig_on_prep_len_mm_7 = "Len when both oral and Len scaled up (Op 7)";
label median_p_elig_on_prep_oral_mm_7 = "Oral PrEP when both oral and Len scaled up (Op 7)";
label median_p_elig_on_prep_mm_7 = "PrEP any when both oral and Len scaled up (Op 7)"; 

series  x=cald y=median_p_elig_on_prep_oral_mm_6/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_oral_mm_6 	upper=p95_p_elig_on_prep_oral_6 / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_len_mm_6/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_len_mm_6 	upper=p95_p_elig_on_prep_len_mm_6  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_6/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_on_prep_mm_6 	upper=p95_p_elig_on_prep_6 / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=median_p_elig_on_prep_oral_mm_7/	lineattrs = (color=green thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_oral_mm_7 	upper=p95_p_elig_on_prep_oral_7  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_len_mm_7/	lineattrs = (color=red thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_len_mm_7 	upper=p95_p_elig_on_prep_len_mm_7  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_on_prep_mm_7/	lineattrs = (color=black thickness = 2 pattern=dash);
band    x=cald lower=p5_p_elig_on_prep_mm_7 	upper=p95_p_elig_on_prep_7  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc freq;table median_p_elig_on_prep_mm_2 median_p_elig_on_prep_mm_3 median_p_elig_on_prep_mm_4 median_p_elig_on_prep_mm_5 median_p_elig_on_prep_mm_6;
where cald=2030;run;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of ALL people eligible to take PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.30 by 0.05)  valueattrs=(size=10);

label median_p_elig_prep_4 = "Same for all options";

series  x=cald y=median_p_elig_prep_4/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_elig_prep_4 	upper=p95_p_elig_prep_4  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=median_p_elig_prep_0/	lineattrs = (color=red thickness = 2);
series  x=cald y=median_p_elig_prep_1/	lineattrs = (color=green thickness = 2);
series  x=cald y=median_p_elig_prep_2/	lineattrs = (color=yellow thickness = 2);
series  x=cald y=median_p_elig_prep_3/	lineattrs = (color=blue thickness = 2);
series  x=cald y=median_p_elig_prep_5/	lineattrs = (color=purple thickness = 2);
series  x=cald y=median_p_elig_prep_6/	lineattrs = (color=brown thickness = 2);


run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of ALL people willing to take PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)   values = (0 to 1) valueattrs=(size=10);

label median_p_prep_any_willing_4 = "Same for all options";

series  x=cald y=median_p_prep_any_willing_4/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_prep_any_willing_4 	upper=p95_p_prep_any_willing_4  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;




***restart here;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of ALL people starting PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   values = (0 to 150000 by 25000) valueattrs=(size=10);

label median_n_prep_oral_start_4 = "Number starting oral PrEP when both oral and CAB-LA available (Op 4)";
label median_n_prep_cab_start_4 = "Number starting CAB-LA when both oral and CAB-LA available (Op 4)";
label median_n_prep_oral_start_1 = "Number starting oral PrEP when only oral available (Op 1)";
label median_n_prep_cab_start_2 = "Number starting CAB-LA when only CAB-LA available (Op 2)";

series  x=cald y=median_n_prep_oral_start_4/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_oral_start_4 	upper=p95_n_prep_oral_start_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

series  x=cald y=median_n_prep_cab_start_4/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_cab_start_4 	upper=p95_n_prep_cab_start_4  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=median_n_prep_oral_start_1/	lineattrs = (color=green thickness = 2 pattern=dash);
band    x=cald lower=p5_n_prep_oral_start_1 	upper=p95_n_prep_oral_start_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

series  x=cald y=median_n_prep_cab_start_2/	lineattrs = (color=red thickness = 2 pattern=dash);
band    x=cald lower=p5_n_prep_cab_start_2 	upper=p95_n_prep_cab_start_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of ALL people no longer eligible for PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label median_n_stop_prep_oral_elig_4 = "If last PrEP used was oral PrEP (Op 4)";
label median_n_stop_prep_cab_elig_4 = "If last PrEP used was CAB (Op 4)";
label median_n_stop_prep_oral_elig_1 = "If last PrEP used was oral PrEP (Op 1)";
label median_n_stop_prep_cab_elig_2 = "If last PrEP used was CAB (Op 2)";
label median_n_stop_prep_len_elig_3 = "If last PrEP used was Len (Op 3)";
label median_n_stop_prep_len_elig_5 = "If last PrEP used was Len (Op 5)";

series  x=cald y=median_n_stop_prep_oral_elig_4/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_stop_prep_oral_elig_4 	upper=p95_n_stop_prep_oral_elig_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

series  x=cald y=median_n_stop_prep_cab_elig_4/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_stop_prep_cab_elig_4 	upper=p95_n_stop_prep_cab_elig_4  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=median_n_stop_prep_oral_elig_1/	lineattrs = (color=green thickness = 2 pattern=dash);
band    x=cald lower=p5_n_stop_prep_oral_elig_1 	upper=p95_n_stop_prep_oral_elig_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

series  x=cald y=median_n_stop_prep_cab_elig_2/	lineattrs = (color=red thickness = 2 pattern=dash);
band    x=cald lower=p5_n_stop_prep_cab_elig_2 	upper=p95_n_stop_prep_cab_elig_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=median_n_stop_prep_len_elig_3/	lineattrs = (color=purple thickness = 2 pattern=dash);
band    x=cald lower=p5_n_stop_prep_len_elig_3 	upper=p95_n_stop_prep_len_elig_3  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";

series  x=cald y=median_n_stop_prep_len_elig_5/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_stop_prep_len_elig_5 	upper=p95_n_stop_prep_len_elig_5  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";


run;quit;


ods rtf close;
ods listing;
run;


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

