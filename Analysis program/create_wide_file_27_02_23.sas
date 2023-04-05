* options user="/folders/myfolders/";

libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\FSW\";

data a;
set a.fsw_27_03_23;  
if run=. then delete; 
proc sort;
by run cald option;run;

proc freq;table run;where cald=1990;run;



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

*ly = s_ly * &sf;  *life years;
*dly = s_dly * &sf; *discounted life years;

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
dcost_avail_self_test = s_dcost_avail_self_test * &sf * 4 / 1000; 

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


s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 


***general population;
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



***FSW;
* n_sw_1549;					n_sw_1549_ = s_sw_1549 * sf_2023;
* n_sw_1564;					n_sw_1564_ = s_sw_1564 * sf_2023;


* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_1519_sw;				if s_ageg1519w gt 0 then  p_fsw1519_ = s_sw_1519 / s_ageg1519w;
* prop_w_2024_sw;				if s_ageg2024w gt 0 then  p_fsw2024_ = s_sw_2024 / s_ageg2024w;
* prop_w_2529_sw;				if s_ageg2529w gt 0 then  p_fsw2529_ = s_sw_2529 / s_ageg2529w;
* prop_w_3039_sw;				if s_ageg3034w gt 0 then  p_fsw3039_ = s_sw_3039 / (s_ageg3034w + s_ageg3539w);

* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ; 

**Of FSW, proportion in each age category;
								if s_sw_1564 gt 0 then do; 
* p_sw_age1519_;					p_sw_age1519_=s_sw_1519/s_sw_1564;
* p_sw_age2024_;					p_sw_age2024_=s_sw_2024/s_sw_1564;
* p_sw_age2529_;					p_sw_age2529_=s_sw_2529/s_sw_1564;
* p_sw_age3039_;					p_sw_age3039_=s_sw_3039/s_sw_1564;
								end;

* p_age_deb_sw1519_;			p_age_deb_sw1519_ = s_age_deb_sw1519_ /s_sw_1564;
* p_age_deb_sw2024_;			p_age_deb_sw2024_ = s_age_deb_sw2024_ /s_sw_1564;
* p_age_deb_sw2529_;			p_age_deb_sw2529_ = s_age_deb_sw2529_ /s_sw_1564;
* p_age_deb_sw3039_;			p_age_deb_sw3039_ = s_age_deb_sw3039_ /s_sw_1564;

* sw_episodes;					sw_episodes = s_episodes_sw/s_ever_sw;
* p_sw_gt1ep;					p_sw_gt1ep   = s_sw_gt1ep     / s_ever_sw;

* duration of sw;				tot_dur_sw= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw= s_act_dur_sw/ s_sw_1564;

								if s_sw_1564 ne 0 then do;
								p_actdur_0to3_   =s_actdur_sw_0to3/s_sw_1564;
								p_actdur_3to5_   =s_actdur_sw_3to5/s_sw_1564;
								p_actdur_6to9_   =s_actdur_sw_6to9/s_sw_1564;
								p_actdur_10to19_ =s_actdur_sw_10to19/s_sw_1564;

								p_totdur_0to3_   =s_totdur_sw_0to3/s_sw_1564;
								p_totdur_3to5_   =s_totdur_sw_3to5/s_sw_1564;
								p_totdur_6to9_   =s_totdur_sw_6to9/s_sw_1564;
								p_totdur_10to19_ =s_totdur_sw_10to19/s_sw_1564;
								end;

* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_ = s_sw_newp_cat1 /s_sw_1564;
* p_fsw_newp1to5;				if s_sw_1564>0 then p_fsw_newp1to5_ = s_sw_newp_cat2 /s_sw_1564;
* p_fsw_newp6to40;				if s_sw_1564>0 then p_fsw_newp6to40_ = s_sw_newp_cat3 /s_sw_1564;
* p_fsw_newp41to130;			if s_sw_1564>0 then p_fsw_newp41to130_ = s_sw_newp_cat4 /s_sw_1564;
* p_fsw_newpov130;				if s_sw_1564>0 then p_fsw_newpov130_ = s_sw_newp_cat5 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp = s_sw_newp/s_sw_1564;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis = s_sw_program_visit / s_sw_1564 ;

* n_tested_sw;					n_tested_sw = s_tested_sw * sf_2023 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw = s_hiv_sw1549_ / s_sw_1549; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw =(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

*sti;							p_sti_sw = s_sti_sw/s_sw_1564;


keep run option cald 
prevalence1549m 	 prevalence1549w 	prevalence1549 		incidence1549 		incidence1549w 		incidence1549m
p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000		 p_onart_vl1000_m   p_onart_vl1000_w	p_vg1000 			p_vl1000 			prevalence_vg1000

n_sw_1564_  	 	 n_sw_1549_ 	 	prop_w_1564_sw		prop_w_1549_sw 	 	prop_w_ever_sw  
p_fsw1519_	  		 p_fsw2024_		  	p_fsw2529_			p_fsw3039_	
p_sw_age1519_	  	 p_sw_age2024_	  	p_sw_age2529_ 		p_sw_age3039_
p_age_deb_sw1519_  	 p_age_deb_sw2024_  p_age_deb_sw2529_   p_age_deb_sw3039_
sw_episodes 	  	 p_sw_gt1ep
p_fsw_newp0_   	 	 p_fsw_newp1to5_    p_fsw_newp6to40_  	p_fsw_newp41to130_  p_fsw_newpov130_
av_sw_newp	 		 p_newp_sw
tot_dur_sw  		 act_dur_sw  	 
p_actdur_0to3_  	 p_actdur_3to5_     p_actdur_6to9_  	p_actdur_10to19_ 
p_totdur_0to3_  	 p_totdur_3to5_     p_totdur_6to9_  	p_totdur_10to19_ 
p_sw_prog_vis		 n_tested_sw	    prop_sw_onprep		prevalence_sw	  	incidence_sw
p_diag_sw			 p_onart_diag_sw	p_onart_vl1000_sw
p_sti_sw

/*Sampled parameters*/
sw_art_disadv	sw_program	effect_sw_prog_newp		effect_sw_prog_6mtest	effect_sw_prog_int	effect_sw_prog_adh
effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti		sw_trans_matrix

dcost ddaly dcost_sw_program;

proc sort data=y;by run option;run;


proc freq;table dcost_sw_program;where option=0 and cald=2023;run;

proc freq;table s_sw_program_visit;where option=0 and cald =2023;run;


data a.fsw_03_02_23_short; set y;run;

data y; set a.fsw_03_02_22_short;run;

/*


proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=1;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=2;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=3;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=4;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=5;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where 2021.0 <= cald < 2022.0 and sw_trans_matrix=6;run;


proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=1;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=2;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=3;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=4;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=5;run;
proc means n p5 p50 p95;var incidence_sw p_fsw_newp0_;where cald in (2022,2022.25.2022.5,2022.75) and sw_trans_matrix=6;run;


proc glm; class sw_trans_matrix; model p_fsw_newp0_= sw_trans_matrix/solutions;where cald=2022;run;
proc glm; class sw_trans_matrix; model incidence_sw= sw_trans_matrix/solutions;where cald=2022;run;


*/



options nomprint;
  option nospool;





***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);


proc means  noprint data=y; var &v; output out=y_10 mean= &v._10; by run; where 2010.0 <= cald < 2011.0; 
proc means  noprint data=y; var &v; output out=y_15 mean= &v._15; by run; where 2015.0 <= cald < 2016.0; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run; where 2020.0 <= cald < 2021.0; 

***baseline outputs in 2022;
proc means  noprint data=y; var &v; output out=y_22 mean= &v._22; by run; where 2021.0 <= cald < 2022.0; 

***outputs in 2030 by option;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option; where 2029.0 <= cald < 2030.25; 

**Outputs for CE analyses, 5, 20 and 50 years by option;
proc means noprint data=y; var &v; output out=y_22_27 mean= &v._22_27; by run option ; where 2022.5 <= cald < 2027.50;
proc means noprint data=y; var &v; output out=y_22_42 mean= &v._22_42; by run option ; where 2022.5 <= cald < 2042.50;
proc means noprint data=y; var &v; output out=y_22_72 mean= &v._22_72; by run option ; where 2022.5 <= cald < 2072.50;

proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;
proc sort data=y_22_27; by run; proc transpose data=y_22_27 out=t_22_27 prefix=&v._22_27_; var &v._22_27; by run;
proc sort data=y_22_42; by run; proc transpose data=y_22_42 out=t_22_42 prefix=&v._22_42_; var &v._22_42; by run;
proc sort data=y_22_72; by run; proc transpose data=y_22_72 out=t_22_72 prefix=&v._22_72_; var &v._22_72; by run;

data &v ; merge  y_10 y_15 y_20 y_22 t_30 t_22_27 t_22_42 t_22_72;  

%mend var;
%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549); 	
%var(v=incidence1549); 	%var(v=incidence1549w); 	%var(v=incidence1549m);

%var(v=p_diag);	 		%var(v=p_diag_m);	 		%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000);		%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);
%var(v=p_vg1000); 		%var(v=p_vl1000);			%var(v=prevalence_vg1000);

%var(v=n_sw_1564_);     %var(v=n_sw_1549_);		    %var(v=prop_w_1564_sw);		%var(v=prop_w_1549_sw); %var(v=prop_w_ever_sw);  
%var(v=p_fsw1519_);	  	%var(v=p_fsw2024_);		    %var(v=p_fsw2529_);			%var(v=p_fsw3039_);	

%var(v=p_sw_age1519_);	  %var(v=p_sw_age2024_);	%var(v=p_sw_age2529_) 		%var(v=p_sw_age3039_);
%var(v=p_age_deb_sw1519_);%var(v=p_age_deb_sw2024_);%var(v=p_age_deb_sw2529_)  	%var(v=p_age_deb_sw3039_);

%var(v=sw_episodes); 	%var(v=p_sw_gt1ep);
%var(v=p_fsw_newp0_);   %var(v=p_fsw_newp1to5_);    %var(v=p_fsw_newp6to40_);  	%var(v=p_fsw_newp41to130_);%var(v=p_fsw_newpov130_);
%var(v=av_sw_newp);	 	%var(v=p_newp_sw);

%var(v=tot_dur_sw);  	%var(v=act_dur_sw);  	 
%var(v=p_actdur_0to3_); %var(v=p_actdur_3to5_);     %var(v=p_actdur_6to9_);  	%var(v=p_actdur_10to19_); 
%var(v=p_totdur_0to3_); %var(v=p_totdur_3to5_);     %var(v=p_totdur_6to9_);  	%var(v=p_totdur_10to19_); 

%var(v=p_sw_prog_vis);  %var(v=n_tested_sw);	    %var(v=prop_sw_onprep);	    %var(v=prevalence_sw);	  %var(v=incidence_sw);
%var(v=p_diag_sw);		%var(v=p_onart_diag_sw);	%var(v=p_onart_vl1000_sw);	%var(v=p_sti_sw);
%var(v=dcost);			%var(v=ddaly);
run;

data wide_outputs;merge
prevalence1549m	prevalence1549w 	prevalence1549 		incidence1549 	incidence1549w 	incidence1549m

p_diag	 		p_diag_m	 		p_diag_w   			p_onart_diag  	p_onart_diag_w
p_onart_diag_m 	p_onart_vl1000		p_onart_vl1000_w   	p_onart_vl1000_m
p_vg1000 		p_vl1000			prevalence_vg1000

n_sw_1564_      n_sw_1549_		    prop_w_1564_sw		prop_w_1549_sw 	prop_w_ever_sw  
p_fsw1519_	  	p_fsw2024_		    p_fsw2529_			p_fsw3039_	

p_sw_age1519_	  p_sw_age2024_		p_sw_age2529_ 		p_sw_age3039_
p_age_deb_sw1519_ p_age_deb_sw2024_ p_age_deb_sw2529_  	p_age_deb_sw3039_

sw_episodes 	p_sw_gt1ep
p_fsw_newp0_   	p_fsw_newp1to5_    p_fsw_newp6to40_  	p_fsw_newp41to130_	p_fsw_newpov130_
av_sw_newp	 	p_newp_sw

tot_dur_sw  	act_dur_sw  	 
p_actdur_0to3_  p_actdur_3to5_     p_actdur_6to9_  	p_actdur_10to19_ 
p_totdur_0to3_  p_totdur_3to5_     p_totdur_6to9_  	p_totdur_10to19_ 

p_sw_prog_vis   n_tested_sw	   	   prop_sw_onprep	prevalence_sw	  incidence_sw
p_diag_sw		p_onart_diag_sw	   p_onart_vl1000_sw	p_sti_sw
dcost			ddaly;

proc sort; by run;run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2021; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 
%par(p=sw_art_disadv);		%par(p=sw_program);			%par(p=effect_sw_prog_newp);	%par(p=effect_sw_prog_6mtest);	
%par(p=effect_sw_prog_int);	%par(p=effect_sw_prog_adh);	%par(p=effect_sw_prog_lossdiag);%par(p=effect_sw_prog_prep_any);
%par(p=effect_sw_prog_pers_sti); %par(p=sw_trans_matrix);
run;


data wide_par; merge 
sw_art_disadv		sw_program			effect_sw_prog_newp			effect_sw_prog_6mtest	
effect_sw_prog_int	effect_sw_prog_adh	effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti
sw_trans_matrix;
;proc sort; by run;run;

data a.wide_fsw_12_12_22;
merge   wide_outputs  wide_par ;  
by run;run;
run;
