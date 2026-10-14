
libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\VLM_2026\";

data a;
set a.vlm_26Sep26; 
if run=. then delete; 

proc sort;
by run cald option;run;

proc freq;table cald option;run;


data sf;
set a;

if cald=2025.25; ***Update as required;
s_alive = s_alive_m + s_alive_w ;

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

* p_inf_vlsupp ;				if s_primary > 0 then p_inf_vlsupp = s_inf_vlsupp   / s_primary;

* hivrel_death_rate;			if s_hiv1564 gt 0 then hivrel_death_rate = (4 * 100 * s_death_hivrel) / s_hiv1564 ;

* n_vm_this_per;				s_vm_this_per = n_vm_this_per * sf;
* p_fail_this_per;				if s_onart gt 0 then p_fail_this_per = s_fail_this_per/s_onart;

keep run option cald 
n_alive_m			 n_alive_w			n_alive						
prevalence1549m 	 prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000_ 			p_vl1000_ 			prevalence_vg1000_
p_inf_vlsupp		 hivrel_death_rate;

/*
n_onprep_w			 n_onprep_m			n_onprep			p_1564m_onprep   	p_1564w_onprep		n_prep_any_start
p_elig_onprep_w	 	 p_elig_onprep_m	p_elig_onprep		p_elig_onprep_mm	p_elig_onprep_nmm	p_elig_prep
p_1564m_onprep_nmm	 p_hiv_nmm			p_prep_any_ever_nmm p_elig_onprep_genmen
dcost ddaly			 n_prep_oral_start	n_prep_cab_start	n_prep_len_start	
n_stop_prep_oral_elig					n_stop_prep_cab_elig 					n_stop_prep_len_elig

*/

;

proc sort data=y;by run option;run;


***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

***OUTPUTS IN SPECIFIC YEARS - AMEND TO E.G. PROJECT SPECIFIC BASELINE (NOTE THESE ARE NOT BY OPTION);
proc means  noprint data=y; var &v; output out=y_26 mean= &v._26; by run; where 2025.0 <= cald < 2026.0; 

***OUTPUTS IN SPECIFIC YEARS BY OPTION - IN 2036;
proc means noprint data=y; var &v; output out=y_46 mean= &v._46; by run option; where 2046.0 <= cald < 2047.0; 


***OUTPUTS FOR CE ANALYSES OVER 50 years BY OPTION;
/*proc means noprint data=y; var &v; output out=y_26_46 mean= &v._26_46; by run option ; where 2026.0 <= cald < 2046.0;*/
/*proc means noprint data=y; var &v; output out=y_26_76 mean= &v._26_76; by run option ; where 2026.0 <= cald < 2076.0;*/

***SORT OUTPUT DATASETS BY RUN BEFORE MERGING;
proc sort data=y_26; by run; proc transpose data=y_26 out=t_26 prefix=&v._26_; var &v._26; by run;
proc sort data=y_46; by run; proc transpose data=y_46 out=t_46 prefix=&v._46_; var &v._46; by run;
/*proc sort data=y_26_46; by run; proc transpose data=y_26_46 out=t_26_46 prefix=&v._26_46_; var &v._26_46; by run;*/
/*proc sort data=y_26_76; by run; proc transpose data=y_26_76 out=t_26_76 prefix=&v._26_76_; var &v._26_76; by run;*/


***MERGE TOGETHER SO THE DATASET NOW CONTAINS MEANS OVER SPECIFIED PERIODS;
data &v ; merge  y_26 t_46 /*t_26_46 t_26_46*/; 


***THIS MACRO CALCULATES THE MEANS OVER PERIOD AT EACH OF THE SPECIFIED TIME PERIODS ABOVE ANS STORES THESE IN INDIVIDUAL DATASETS;
%mend var;

%var(v=n_alive_w);		  %var(v=n_alive);						
%var(v=prevalence1549m);  %var(v=prevalence1549w); 		%var(v=prevalence1549_); 	%var(v=incidence1549_); 	%var(v=incidence1549w);  
%var(v=incidence1549m);	  %var(v=p_diag);	 			%var(v=p_diag_m);	 	 	%var(v=p_diag_w);
%var(v=p_onart_diag);  	  %var(v=p_onart_diag_m);   	%var(v=p_onart_diag_w);  	%var(v=p_onart_vl1000_); 	%var(v=p_onart_vl1000_m); 
%var(v=p_onart_vl1000_w); %var(v=p_vg1000_);			%var(v=p_vl1000_); 			%var(v=prevalence_vg1000_);
%var(v=p_inf_vlsupp);	  %var(v=hivrel_death_rate);
run;
		 

***MERGE THE DATASETS CREATED ABOVE INTO ONE DATASET;
data wide_outputs;merge
n_alive_w		  	n_alive				
prevalence1549m 	prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w  	
incidence1549m		p_diag	 			p_diag_m	 	 	p_diag_w
p_onart_diag  	  	p_onart_diag_m   	p_onart_diag_w  	p_onart_vl1000_ 	p_onart_vl1000_m 
p_onart_vl1000_w 	p_vg1000_			p_vl1000_ 			prevalence_vg1000_	p_inf_vlsupp
hivrel_death_rate;
run;

proc sort; by run;run;

/*
***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2025.5; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;
%mend par; 

%par(p=inc_risk_mobile);		%par(p=sex_beh_trans_matrix_m);		%par(p=sex_beh_trans_matrix_w);	
%par(p=sex_age_mixing_matrix_m);%par(p=sex_age_mixing_matrix_w); %par(p=inc_risk_newp_mm);		
run;


data wide_par; merge 
inc_risk_mobile		sex_beh_trans_matrix_m	sex_beh_trans_matrix_w		sex_age_mixing_matrix_m		
sex_age_mixing_matrix_w	inc_risk_newp_mm;

;proc sort; by run;run;
*/
***SAVE DATASET READY FOR ANALYSIS;
data a.wide_vlm_26Sep26;;
merge   wide_outputs  /*wide_par*/ ;  
by run;run;

