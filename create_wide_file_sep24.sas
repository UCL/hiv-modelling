
***INSERT FILE EXPLORER PATH WHERE OUTPUT FILES ARE KEPT (USUALLY ON TLO HMC DROPBOX);
libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\vl_monitoring\dalys_averted_per_vl_out\";


/*

data a.vl_23_gbd; set a.out:;  

*/

data a;
set a.vl_23_gbd; ***INSERT OUTPUT FILENAME; 
if run=. then delete; 

proc sort;
by run cald option;run;


***THIS DATASTEP CALCUATES THE SCALE FACTOR;
data sf;
set a;

if cald=2023.25; ***Update as required;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = 10000000 / s_alive; ***If calibrating to a specific setting, change 10000000 to desired 15+ population size;
keep run sf_2023;
proc sort; by run;run;


%let sf=sf_2023;


data y; 
merge a sf;
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


s_ddaly_gbd = s_dyll_GBD + s_live_ddaly;

***Scaling up to annual discounted DALYs in the whole population;
ddaly = s_ddaly * &sf * 4;
ddaly_gbd = s_ddaly_gbd * &sf * 4;


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


***ADD PROJECT SPECIFIC VARIABLES HERE;


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

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* n_vl;							n_vl = s_vm_this_per * &sf ;
* n_death_hiv;					n_death_hiv = s_death_hiv * &sf ;

***ADD PROJECT SPECIFIC OUTPUTS HERE;

keep run option cald 
prevalence1549m 	 prevalence1549w 	prevalence1549 		incidence1549 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000 			p_vl1000 			prevalence_vg1000
dcost ddaly  n_vl  n_death_hiv ddaly_gbd
rate_int_choice  

/*ADD PROJECT SPECIFIC OUTPUTS HERE*/;
;

proc sort data=y;by run option;run;

options nomprint;
option nospool;


***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

***OUTPUTS IN SPECIFIC YEARS - AMEND TO E.G. PROJECT SPECIFIC BASELINE (NOTE THESE ARE NOT BY OPTION);
proc means  noprint data=y; var &v; output out=y_23 mean= &v._23; by run; where 2023.0 <= cald < 2024.0; 

***OUTPUTS IN SPECIFIC YEARS BY OPTION - THIS MAY NOT BE NEEDED IN ALL ANALYSES;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option; where 2029.0 <= cald < 2030.25; 

***OUTPUTS FOR CE ANALYSES OVER 5, 20 AND 50 years BY OPTION;
proc means noprint data=y; var &v; output out=y_24_27 mean= &v._24_27; by run option ; where 2024.0 <= cald < 2027.00;
proc means noprint data=y; var &v; output out=y_24_29 mean= &v._24_29; by run option ; where 2024.0 <= cald < 2029.00;
proc means noprint data=y; var &v; output out=y_24_34 mean= &v._24_34; by run option ; where 2024.0 <= cald < 2034.00;
proc means noprint data=y; var &v; output out=y_24_74 mean= &v._24_74; by run option ; where 2024.0 <= cald < 2074.00;

***SORT OUTPUT DATASETS BY RUN BEFORE MERGING;
proc sort data=y_23; by run; proc transpose data=y_23 out=t_23 prefix=&v._23_; var &v._23; by run;
proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;
proc sort data=y_24_27; by run; proc transpose data=y_24_27 out=t_24_27 prefix=&v._24_27_; var &v._24_27; by run;
proc sort data=y_24_29; by run; proc transpose data=y_24_29 out=t_24_29 prefix=&v._24_29_; var &v._24_29; by run;
proc sort data=y_24_34; by run; proc transpose data=y_24_34 out=t_24_34 prefix=&v._24_34_; var &v._24_34; by run;
proc sort data=y_24_74; by run; proc transpose data=y_24_74 out=t_24_74 prefix=&v._24_74_; var &v._24_74; by run;

***MERGE TOGETHER SO THE DATASET NOW CONTAINS MEANS OVER SPECIFIED PERIODS;
data &v ; merge  y_23 t_30 t_24_27 t_24_29 t_24_34 t_24_74;  


***THIS MACRO CALCULATES THE MEANS OVER PERIOD AT EACH OF THE SPECIFIED TIME PERIODS ABOVE ANS STORES THESE IN INDIVIDUAL DATASETS;
%mend var;


%var(v=p_diag);	 		%var(v=p_diag_m);	 		%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000);		%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);
%var(v=p_vg1000); 		%var(v=p_vl1000);			%var(v=prevalence_vg1000);  %var(v=n_vl);

%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549); 	
%var(v=incidence1549); 	%var(v=incidence1549w); 	%var(v=incidence1549m);
%var(v=dcost);	 		%var(v=ddaly);  %var(v=n_death_hiv);  %var(v=ddaly_gbd);

*/ADD IN PROJECT SPECIFIC OUTPUTS/*;

run;


***MERGE THE DATASETS CREATED ABOVE INTO ONE DATASET;
data wide_outputs;merge
p_diag	 		p_diag_m	 		p_diag_w   			p_onart_diag  	p_onart_diag_w
p_onart_diag_m 	p_onart_vl1000		p_onart_vl1000_w   	p_onart_vl1000_m
p_vg1000 		p_vl1000			prevalence_vg1000  n_vl
prevalence1549m	prevalence1549w 	prevalence1549 		incidence1549 	incidence1549w 	incidence1549m
dcost			ddaly  n_death_hiv  ddaly_gbd

/*ADD IN PROJECT SPECIFIC OUTPUTS*/
;

proc sort; by run;run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2024.5; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

/*ADD PROJECT SPECIFIC PARAMETERS OF INTEREST*/
%par(p=rate_int_choice);
run;


data wide_par; merge 
rate_int_choice ;
;proc sort; by run;run;


***SAVE DATASET READY FOR ANALYSIS;
data a.wide_vl_23_gbd;
merge   wide_outputs  wide_par ;  
by run; run;




libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\vl_monitoring\dalys_averted_per_vl_out\";


data f; set a.wide_vl_23_gbd;

d_n_vl_24_27_2_1 = n_vl_24_27_2 - n_vl_24_27_1 ;
d_n_death_hiv_24_27_2_1 = n_death_hiv_24_27_2 - n_death_hiv_24_27_1 ;
d_n_death_hiv_24_29_2_1 = n_death_hiv_24_29_2 - n_death_hiv_24_29_1 ;
d_n_death_hiv_24_34_2_1 = n_death_hiv_24_34_2 - n_death_hiv_24_34_1 ;
d_ddaly_24_27_2_1 = ddaly_24_27_2 - ddaly_24_27_1 ;
d_ddaly_24_29_2_1 = ddaly_24_29_2 - ddaly_24_29_1 ;
d_ddaly_24_34_2_1 = ddaly_24_34_2 - ddaly_24_34_1 ;

d_ddaly_gbd_24_27_2_1 = ddaly_gbd_24_27_2 - ddaly_gbd_24_27_1 ;
d_ddaly_gbd_24_34_2_1 = ddaly_gbd_24_34_2 - ddaly_gbd_24_34_1 ;


proc means mean n p50 p5 p95;
var p_diag_23 		p_diag_m_23 	 		p_diag_w_23    			p_onart_diag_23   	p_onart_diag_w_23 
p_onart_diag_m_23  	p_onart_vl1000_23 		p_onart_vl1000_w_23    	p_onart_vl1000_m_23 
p_vg1000_23  		p_vl1000_23 			prevalence_vg1000_23   n_vl_23 
prevalence1549m_23 	prevalence1549w_23  	prevalence1549_23  		incidence1549_23  	incidence1549w_23  	incidence1549m_23 
n_death_hiv_23 ;
run;


proc means mean stderr n p50 p5 p95; 

var n_vl_24_27_1  n_vl_24_27_2  n_vl_24_34_1  n_vl_24_34_2  

ddaly_24_27_1  ddaly_24_27_2  ddaly_24_34_1  ddaly_24_34_2  

d_ddaly_24_27_2_1  d_ddaly_gbd_24_27_2_1  d_ddaly_24_29_2_1     d_ddaly_24_34_2_1   d_ddaly_gbd_24_34_2_1  

d_n_death_hiv_24_27_2_1  d_n_death_hiv_24_29_2_1  d_n_death_hiv_24_34_2_1 ; 

run; 








