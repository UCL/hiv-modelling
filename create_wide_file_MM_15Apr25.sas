
*libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";
libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.mm_15Apr25; 
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
* prop_1564m_onprep;			prop_1564m_onprep =   max(s_onprep_m, 0) / (s_alive1564_m - s_hiv1564m) ;
* prop_1564w_onprep;			prop_1564w_onprep =   max(s_onprep_w, 0) / (s_alive1564_w - s_hiv1564w) ;
* n_prep_any_start;				n_prep_any_start = max(s_prep_any_start, 0) * sf;
* prop_elig_on_prep;			if s_prep_any_elig > 0 then prop_elig_on_prep = s_prep_any / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep = 0;
* prop_elig_on_prep_inj;		if s_prep_any_elig > 0 then prop_elig_on_prep_inj = s_prep_inj / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep_inj = 0;
* prop_elig_on_prep_oral;		if s_prep_any_elig > 0 then prop_elig_on_prep_oral = s_prep_oral / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep_oral = 0;




* prop_elig_on_prep_w;			if s_elig_prep_any_w_1549 > 0 then prop_elig_on_prep_w = s_prep_any_w_1549/s_elig_prep_any_w_1549;
								if s_elig_prep_any_w_1549 = 0 then prop_elig_on_prep_w=0;
* prop_elig_on_prep_m;			if s_elig_prep_any_m_1549 > 0 then prop_elig_on_prep_m = s_prep_any_m_1549/s_elig_prep_any_m_1549;
								if s_elig_prep_any_m_1549 = 0 then prop_elig_on_prep_m=0;
*nmm=non mobile men;
* prop_1564m_onprep_nmm;  		prop_1564m_onprep_nmm = (s_onprep_m - s_onprep_mm)/ ((s_alive1564_m - s_hiv1564m) - (s_alive1564mm - s_hiv1564mm));
* p_hiv_nmm;					p_hiv_nmm = s_hiv1564nmm /s_alive1564nmm ;
* p_prep_any_ever_nmm;			p_prep_any_ever_nmm = (s_prep_any_ever_m - s_prep_any_ever_mm)/ (s_alive_m - s_mm);
* prop_elig_on_prep_nmm;		if s_elig_prep_any_nmm_1564_ > 0 then prop_elig_on_prep_nmm = s_onprep_nmm / s_elig_prep_any_nmm_1564_ ;


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

* prop_1564mm_onprep_mm;		if (s_alive1564mm - s_hiv1564mm) > 0 then prop_1564mm_onprep_mm =   max(s_onprep_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;
* prop_1564mm_onprep_inj_mm;	if (s_alive1564mm - s_hiv1564mm) > 0 then prop_1564mm_onprep_inj_mm =   max(s_onprep_inj_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;
* prop_1564mm_onprep_oral_mm;	if (s_alive1564mm - s_hiv1564mm) > 0 then prop_1564mm_onprep_oral_mm =   max(s_onprep_oral_mm, 0) / (s_alive1564mm - s_hiv1564mm) ;

* prop_elig_on_prep_mm;			if s_elig_prep_any_mm_1564_ > 0 then prop_elig_on_prep_mm = s_onprep_mm / s_elig_prep_any_mm_1564_ ;
* prop_elig_on_prep_oral_mm;	if s_elig_prep_any_mm_1564_ > 0 then prop_elig_on_prep_oral_mm = s_prep_oral_mm / s_elig_prep_any_mm_1564_ ;
* prop_elig_on_prep_inj_mm;		if s_elig_prep_any_mm_1564_ > 0 then prop_elig_on_prep_inj_mm = s_prep_inj_mm / s_elig_prep_any_mm_1564_ ;



* n_prep_any_mm;				n_prep_any_mm = s_onprep_mm * sf;
* n_prep_oral_mm;				n_prep_oral_mm = s_onprep_oral_mm * sf;
* n_prep_inj_mm;				n_prep_inj_mm = s_onprep_inj_mm * sf;

* n_prep_ever_mm;				n_prep_ever_mm = s_prep_any_ever_mm * sf;
* p_prep_any_ever_mm;			if  s_mm > 0 then p_prep_any_ever_mm = s_prep_any_ever_mm / s_mm;

* p_newp_ge1_mm;				if s_alive1564mm  > 0 then p_newp_ge1_mm = s_newp_ge1_mm / s_alive1564mm ;
* p_prep_any_willing;			p_prep_any_willing = s_prep_any_willing/s_alive;

keep run option cald n_alive_m			n_alive_w			n_alive				p_mm				p_hiv_mm	p_hiv_m
prevalence1549m 	 prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000_ 			p_vl1000_ 			prevalence_vg1000_
n_onprep_w			 n_onprep_m			n_onprep			prop_1564m_onprep   prop_1564w_onprep	n_prep_any_start
prop_elig_on_prep_w	 prop_elig_on_prep_m	prop_elig_on_prep	prop_elig_on_prep_mm	prop_elig_on_prep_nmm
prop_1564m_onprep_nmm	p_hiv_nmm		p_prep_any_ever_nmm

dcost ddaly


p_diag_mm			p_onart_diag_mm		p_onart_vl1000_mm		p_vg1000_mm		p_vl1000_mm		prevalence1549_mm	
prevalence1564_mm	incidence1549_mm	incidence1564_mm		n_tested_mm		prop_1564mm_onprep_mm	p_hiv_mm
prop_1564mm_onprep_inj_mm				prop_1564mm_onprep_oral_mm				prop_elig_on_prep_mm
n_prep_any_mm		n_prep_oral_mm		n_prep_inj_mm			n_prep_ever_mm	p_prep_any_ever_mm
p_newp_ge1_mm		p_prep_any_willing	n_prep_oral_mm			n_prep_inj_mm	prop_elig_on_prep_inj	prop_elig_on_prep_oral
prop_elig_on_prep_oral_mm	prop_elig_on_prep_inj_mm
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
%let nfit = 546   ;
%let year_end = 2045.00 ;
run;
proc sort;by cald option ;run;

***Three macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;
if option =2 then delete;

%let var =  
p_mm				p_hiv_mm			p_hiv_m
p_diag_mm			p_onart_diag_mm		p_onart_vl1000_mm		p_vg1000_mm			p_vl1000_mm		prevalence1549_mm	
prevalence1564_mm	incidence1549_mm	incidence1564_mm		n_tested_mm			prop_1564mm_onprep_mm
prop_1564mm_onprep_inj_mm				prop_1564mm_onprep_oral_mm					prop_elig_on_prep_mm
n_prep_any_mm		n_prep_oral_mm		n_prep_inj_mm			n_prep_ever_mm		p_prep_any_ever_mm
p_newp_ge1_mm		p_prep_any_willing	prop_1564m_onprep		prop_1564w_onprep 	prop_elig_on_prep_w	 prop_elig_on_prep
prop_elig_on_prep_m prop_elig_on_prep_mm	prop_elig_on_prep_nmm
prop_1564m_onprep_nmm	p_hiv_nmm		p_prep_any_ever_nmm
n_prep_oral_mm			n_prep_inj_mm	prop_elig_on_prep_inj	prop_elig_on_prep_oral
prop_elig_on_prep_oral_mm	prop_elig_on_prep_inj_mm

;


*starts with %macro and ends with %mend;
%macro option_0;

%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
data g&count;set g&count;***creates one dataset per variable;
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._0 p95_&varb._0 p50_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

%option_0;
run;



data option_1;
set b;
if option =0 then delete;
if option =2 then delete;

%let var =  
p_mm				p_hiv_mm			p_hiv_m
p_diag_mm			p_onart_diag_mm		p_onart_vl1000_mm		p_vg1000_mm			p_vl1000_mm		prevalence1549_mm	
prevalence1564_mm	incidence1549_mm	incidence1564_mm		n_tested_mm			prop_1564mm_onprep_mm
prop_1564mm_onprep_inj_mm				prop_1564mm_onprep_oral_mm					prop_elig_on_prep_mm
n_prep_any_mm		n_prep_oral_mm		n_prep_inj_mm			n_prep_ever_mm		p_prep_any_ever_mm
p_newp_ge1_mm		p_prep_any_willing	prop_1564m_onprep		prop_1564w_onprep 	prop_elig_on_prep_w	 prop_elig_on_prep
prop_elig_on_prep_m prop_elig_on_prep_mm	prop_elig_on_prep_nmm
prop_1564m_onprep_nmm	p_hiv_nmm		p_prep_any_ever_nmm
n_prep_oral_mm			n_prep_inj_mm	prop_elig_on_prep_inj	prop_elig_on_prep_oral
prop_elig_on_prep_oral_mm	prop_elig_on_prep_inj_mm

;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p50_var = median_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._1 p95_&varb._1 p50_&varb._1 ;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;

%option_1;
run;

data option_2;
set b;
if option =0 then delete;
if option =1 then delete;

%let var =  
p_mm				p_hiv_mm			p_hiv_m
p_diag_mm			p_onart_diag_mm		p_onart_vl1000_mm		p_vg1000_mm			p_vl1000_mm		prevalence1549_mm	
prevalence1564_mm	incidence1549_mm	incidence1564_mm		n_tested_mm			prop_1564mm_onprep_mm
prop_1564mm_onprep_inj_mm				prop_1564mm_onprep_oral_mm					prop_elig_on_prep_mm
n_prep_any_mm		n_prep_oral_mm		n_prep_inj_mm			n_prep_ever_mm		p_prep_any_ever_mm
p_newp_ge1_mm		p_prep_any_willing	prop_1564m_onprep		prop_1564w_onprep 	prop_elig_on_prep_w	 prop_elig_on_prep
prop_elig_on_prep_m prop_elig_on_prep_mm	prop_elig_on_prep_nmm
prop_1564m_onprep_nmm	p_hiv_nmm		p_prep_any_ever_nmm
n_prep_oral_mm			n_prep_inj_mm	prop_elig_on_prep_inj	prop_elig_on_prep_oral
prop_elig_on_prep_oral_mm	prop_elig_on_prep_inj_mm
;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_2;
%let p5_var = p5_&var_2;
%let p95_var = p95_&var_2;
%let p50_var = median_&var_2;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_2 out=i&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data i&count;set i&count;***creates one dataset per variable;
p5_&varb._2  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._2 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._2 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._2 p95_&varb._2 p50_&varb._2 ;
run;

      proc datasets nodetails nowarn nolist; 
      delete  ii&count;quit;run;
%end;
%mend;

%option_2;
run;




data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  
g25  g26  g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40 /* g41  g42  g43  g44  g45  g46  g47  g48  g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60 g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71 g72 /* g73 g74 g75  g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100 g101 g102 g103 g104
g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252*/ 

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20	h21  h22  h23  h24
h25  h26  h27  h28  h29	 h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40 
i1   i2   i3   i4   i5   i6   i7   i8   i9   i10  i11  i12  i13  i14  i15  i16  i17  i18  i19  i20	i21  i22  i23  i24
i25  i26  i27  i28  i29  i30  i31  i32  i33  i34  i35  i36  i37  i38  i39  i40 
;
by cald;

ods listing close;
ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = 'C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Mobile Men\
graphs_14_04_25.doc' startpage=never; 


***Diagnostic;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);

label p50_prop_1564m_onprep_0 = "Men";
label p50_prop_1564w_onprep_0 = "Women";

series  x=cald y=p50_prop_1564m_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564m_onprep_0 	upper=p95_prop_1564m_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564w_onprep_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564w_onprep_0 	upper=p95_prop_1564w_onprep_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people with an indication for PrEP currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_prop_elig_on_prep_0 = "All";
label p50_prop_elig_on_prep_w_0 = "Women";
label p50_prop_elig_on_prep_m_0 = "Men";

series  x=cald y=p50_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "model 90% range";
series  x=cald y=p50_prop_elig_on_prep_w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_w_0 	upper=p95_prop_elig_on_prep_w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";
series  x=cald y=p50_prop_elig_on_prep_m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_m_0 	upper=p95_prop_elig_on_prep_m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "model 90% range";

run;quit;

*On oral/injectable;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with an indication for PrEP currently on oral and injectable PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_prop_elig_on_prep_oral_0 = "Oral";
label p50_prop_elig_on_prep_inj_0 = "Injectable";

series  x=cald y=p50_prop_elig_on_prep_oral_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_oral_0 	upper=p95_prop_elig_on_prep_oral_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "model 90% range";
series  x=cald y=p50_prop_elig_on_prep_inj_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_inj_0 	upper=p95_prop_elig_on_prep_inj_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";
run;quit;




***First lot of graphs up until 2025;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of men, proportion mobile with increased risk";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_mm_0 = "Median";

series  x=cald y=p50_p_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mm_0 	upper=p95_p_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_hiv_mm_0 = "Mobile men";
label p50_p_hiv_nmm_0 = "non-mobile men";

series  x=cald y=p50_p_hiv_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hiv_mm_0 	upper=p95_p_hiv_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_hiv_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hiv_nmm_0 	upper=p95_p_hiv_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Percentage of men ever on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.7 by 0.1) valueattrs=(size=10);

label p50_p_prep_any_ever_mm_0 = "Mobile men";
label p50_p_prep_any_ever_nmm_0 = "Non-mobile men";

series  x=cald y=p50_p_prep_any_ever_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_any_ever_mm_0 	upper=p95_p_prep_any_ever_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_prep_any_ever_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_prep_any_ever_nmm_0 	upper=p95_p_prep_any_ever_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those with an indication for PrEP, proportion of men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_prop_elig_on_prep_mm_0 = "Mobile men";
label p50_prop_elig_on_prep_nmm_0 = "Non-Mobile men";

series  x=cald y=p50_prop_elig_on_prep_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_0 	upper=p95_prop_elig_on_prep_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prop_elig_on_prep_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_nmm_0 	upper=p95_prop_elig_on_prep_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those with an indication for PrEP, proportion of mobile men currently on oral and injectable PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_prop_elig_on_prep_oral_mm_0 = "Oral";
label p50_prop_elig_on_prep_inj_mm_0 = "Injectable";

series  x=cald y=p50_prop_elig_on_prep_oral_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_oral_mm_0 	upper=p95_prop_elig_on_prep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prop_elig_on_prep_inj_mm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_inj_mm_0 	upper=p95_prop_elig_on_prep_inj_mm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of mobile men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000) valueattrs=(size=10);

label p50_n_prep_oral_mm_0 = "Mobile men";

series  x=cald y=p50_n_prep_oral_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_mm_0 	upper=p95_n_prep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of men currently on oral PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000) valueattrs=(size=10);

label p50_n_prep_oral_mm_0 = "Option 0";
label p50_n_prep_oral_mm_1 = "Option 1";
label p50_n_prep_oral_mm_2 = "Option 2";

series  x=cald y=p50_n_prep_oral_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_mm_0 	upper=p95_n_prep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of men currently on injectable PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000) valueattrs=(size=10);

label p50_n_prep_inj_mm_0 = "Option 0";
label p50_n_prep_inj_mm_1 = "Option 1";
label p50_n_prep_inj_mm_2 = "Option 2";

series  x=cald y=p50_n_prep_inj_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_inj_mm_0 	upper=p95_n_prep_inj_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men on oral PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05) valueattrs=(size=10);

label p50_prop_1564mm_onprep_oral_mm_0 = "Option 0";
label p50_prop_1564mm_onprep_oral_mm_1 = "Option 1";
label p50_prop_1564mm_onprep_oral_mm_2 = "Option 2";

series  x=cald y=p50_prop_1564mm_onprep_oral_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564mm_onprep_oral_mm_0 	upper=p95_prop_1564mm_onprep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564mm_onprep_oral_mm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564mm_onprep_oral_mm_1 	upper=p95_prop_1564mm_onprep_oral_mm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564mm_onprep_oral_mm_2/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_1564mm_onprep_oral_mm_2 	upper=p95_prop_1564mm_onprep_oral_mm_2  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men number on inj PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.005) valueattrs=(size=10);

label p50_prop_1564mm_onprep_inj_mm_0 = "Option 0";
label p50_prop_1564mm_onprep_inj_mm_1 = "Option 1";
label p50_prop_1564mm_onprep_inj_mm_2 = "Option 2";

series  x=cald y=p50_prop_1564mm_onprep_inj_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564mm_onprep_inj_mm_0 	upper=p95_prop_1564mm_onprep_inj_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564mm_onprep_inj_mm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564mm_onprep_inj_mm_1 	upper=p95_prop_1564mm_onprep_inj_mm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564mm_onprep_inj_mm_2/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_1564mm_onprep_inj_mm_2 	upper=p95_prop_1564mm_onprep_inj_mm_2  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


***Longer time horizon;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_prop_elig_on_prep_mm_0 = "Without intervention";
label p50_prop_elig_on_prep_mm_2 = "With intervention";

series  x=cald y=p50_prop_elig_on_prep_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_0 	upper=p95_prop_elig_on_prep_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_elig_on_prep_mm_1/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prop_elig_on_prep_mm_1 	upper=p95_prop_elig_on_prep_mm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_elig_on_prep_mm_2/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_2 	upper=p95_prop_elig_on_prep_mm_2  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prep willing";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_p_prep_any_willing_0 = "Without intervention";
label p50_p_prep_any_willing_1 = "With intervention";

series  x=cald y=p50_p_prep_any_willing_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_any_willing_0 	upper=p95_p_prep_any_willing_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_prep_any_willing_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_prep_any_willing_1 	upper=p95_p_prep_any_willing_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

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

