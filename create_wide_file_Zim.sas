
libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

*libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

data a;
set a.Genesis_Zim_17Dec25; 
if run=. then delete; 

proc sort;
by run cald option;run;

proc freq;table cald option;run;

***zim specific;
data sf;
set a;

*Zimbabwe;
*Source for Zimbabwe population is https:https://population.un.org/dataportal/data/indicators/49/locations/716/start/1990/end/2023/line/linetimeplot;
*accessed 9/2/2023;
* 58.1% of Zim population in 2020 >= age 15. Source: https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=ZW accessed 6/9/2021;
if cald=2022.5;
s_alive = s_alive_m + s_alive_w ;
sf = (16320000 * 0.581) / s_alive; 

keep run sf;
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

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw;
s_hivge15_ = s_hivge15m + s_hivge15w;



***ADD AGYW;


***general population;

* n_alive;						n_alive = s_alive * sf;
* n_alive_m;					n_alive_m = s_alive_m * sf;
* n_alive_w;					n_alive_w = s_alive_w * sf;

* n_hivge15m;					n_hivge15m = s_hivge15m * sf ;
* n_hivge15w;					n_hivge15w = s_hivge15w * sf ;
* n_hivge15_;					n_hivge15_ = n_hivge15m + n_hivge15w ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549_;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549_;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* p_onart_w;					if n_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if n_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* p_onart;						if n_hivge15_ gt 0 then p_onart = s_onart / s_hivge15_; 

* n_onart_w;					n_onart_w = s_onart_w * sf;
* n_onart_m;					n_onart_m = s_onart_m * sf;
* n_onart  ;					n_onart   = s_onart   * sf;

* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000_;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 


* n_onprep_w;					n_onprep_w = max(s_onprep_w, 0) * sf;
* n_onprep_m;					n_onprep_m = max(s_onprep_m, 0) * sf;
* n_onprep;						n_onprep = n_onprep_w + n_onprep_m ;
* prop_elig_on_prep;			if s_prep_any_elig > 0 then prop_elig_on_prep = s_prep_any / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep = 0;
* n_prep_ever;					n_prep_ever = s_prep_any_ever * sf;

* n_sw_1564;					n_sw_1564_ = s_sw_1564 * sf;
* n_sw_1549;					n_sw_1549_ = s_sw_1549 * sf;
* p_w_1549_sw;					if s_alive1549_w gt 0 then p_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* p_w_1564_sw;					if s_alive1564_w gt 0 then p_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prevalence_1564sw;			prevalence_1564sw     = s_hiv_sw / s_sw_1564; 
* incidence_1564sw;				if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_1564sw=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
* p_onprep_sw; 			    	if (s_sw_1564 - s_hiv_sw) gt 0 then p_onprep_sw = max(s_prep_any_sw, 0) / (s_sw_1564 - s_hiv_sw) ;
* n_onprep_sw;					n_onprep_sw = s_onprep_sw * sf;

* n_msm_1564_;					n_msm_1564_ = s_alive1564_msm * sf ;
* p_m_msm;						p_m_msm = s_alive1564_msm / s_alive1564_m;
* prevalence1549_msm;			prevalence1549_msm = s_hiv1549msm / s_alive1549_msm; 
* incidence_msm;				if (s_msm  - s_hiv_msm  + s_primary_msm) gt 0 then incidence_msm=(s_primary_msm * 4 * 100) / (s_msm  - s_hiv_msm  + s_primary_msm);
* p_onprep_msm;					p_onprep_msm = s_onprep_msm / (s_alive1564_msm - s_hiv1564msm);
* n_onprep_msm;					n_onprep_msm = s_onprep_msm * sf;

s_ageg1524w = s_ageg1519w + s_ageg2024w;
s_hiv1524w = s_hiv1519w + s_hiv2024w;
s_primary1524w = s_primary1519w + s_primary2024w;

* n_agyw;						n_agyw = s_ageg1524w * sf;
* p_agyw;						p_w_agyw = s_ageg1524w/s_alive1564_w;
* prevalence_agyw;				prevalence_agyw = s_hiv1524w/s_ageg1524w;
* incidence_agyw;				if (s_ageg1524w - s_hiv1524w + s_primary1524w) gt 0 then incidence_agyw = (s_primary1524w *4 * 100)/(s_ageg1524w - s_hiv1524w + s_primary1524w); 
* p_onprep_agyw;				p_onprep_agyw = s_onprep_1524w/ (s_ageg1524w - s_hiv1524w);
* n_onprep_agyw;				n_onprep_agyw = s_onprep_1524w * sf;

* n_death_hivrel;				n_death_hivrel = s_death_hivrel  * 4* sf;
* n_death_hivrel_m;				n_death_hivrel_m = s_death_hivrel_m  * 4* sf;
* n_death_hivrel_w;				n_death_hivrel_w = s_death_hivrel_w * 4* sf;


keep run 			 option				cald 
n_alive_m			 n_alive_w			n_alive				n_hivge15m			n_hivge15w		    n_hivge15_
prevalence1549m 	 prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w 		incidence1549m
p_onart				 p_onart_m			p_onart_w			n_onart				n_onart_m			n_onart_w

p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	n_onprep_w			n_onprep_m			n_onprep
prop_elig_on_prep	 n_prep_ever		

n_sw_1564_			 n_sw_1549_			p_w_1564_sw			p_w_1549_sw			prevalence_1564sw	incidence_1564sw
p_onprep_sw			 n_onprep_sw

n_msm_1564_			 p_m_msm			prevalence1549_msm	incidence_msm		p_onprep_msm		n_onprep_msm
n_agyw				 p_w_agyw			prevalence_agyw		incidence_agyw		p_onprep_agyw		n_onprep_agyw

n_death_hivrel		 n_death_hivrel_m	n_death_hivrel_w


;

proc sort data=y;by run option;run;


options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);


***baseline outputs in 2022;
proc means  noprint data=y; var &v; output out=y_25 mean= &v._25; by run; where 2024.5 <= cald < 2025.5; 

**Outputs in 5, 20 and 50 years time;
proc means noprint data=y; var &v; output out=y_31 mean= &v._31; by run option; where 2030.0 <= cald < 2031; 
proc means noprint data=y; var &v; output out=y_46 mean= &v._46; by run option; where 2045.0 <= cald < 2046; 
proc means noprint data=y; var &v; output out=y_76 mean= &v._76; by run option; where 2075.0 <= cald < 2076;

**Outputs for CE analyses, across 5, 20 and 50 years by option;
proc means noprint data=y; var &v; output out=y_26_31 mean= &v._26_31; by run option ; where 2026.25 <= cald < 2031;
proc means noprint data=y; var &v; output out=y_26_46 mean= &v._26_46; by run option ; where 2026.25 <= cald < 2046;
proc means noprint data=y; var &v; output out=y_26_76 mean= &v._26_76; by run option ; where 2026.25 <= cald < 2076;

proc sort data=y_31; by run; proc transpose data=y_31 out=t_31 prefix=&v._31_; var &v._31; by run;
proc sort data=y_46; by run; proc transpose data=y_46 out=t_46 prefix=&v._46_; var &v._46; by run;
proc sort data=y_76; by run; proc transpose data=y_76 out=t_76 prefix=&v._76_; var &v._76; by run;

proc sort data=y_26_31; by run; proc transpose data=y_26_31 out=t_26_31 prefix=&v._26_31_; var &v._26_31; by run;
proc sort data=y_26_46; by run; proc transpose data=y_26_46 out=t_26_46 prefix=&v._26_46_; var &v._26_46; by run;
proc sort data=y_26_76; by run; proc transpose data=y_26_76 out=t_26_76 prefix=&v._26_76_; var &v._26_76; by run;

data &v ; merge y_25 t_31 t_46 t_76 t_26_31 t_26_46 t_26_76;  

%mend var;

%var(v=n_alive_m);		 	%var(v=n_alive_w);			%var(v=n_alive);			%var(v=n_hivge15m);		%var(v=n_hivge15w);		    %var(v=n_hivge15_);
%var(v=prevalence1549m); 	%var(v=prevalence1549w);	%var(v=prevalence1549_); 	%var(v=incidence1549_); %var(v=incidence1549w); 	%var(v=incidence1549m);
%var(v=p_onart);		 	%var(v=p_onart_m);			%var(v=p_onart_w);			%var(v=n_onart);		%var(v=n_onart_m);			%var(v=n_onart_w);

%var(v=p_diag);	 		 	%var(v=p_diag_m); 			%var(v=p_diag_w);  			%var(v=p_onart_diag);   %var(v=p_onart_diag_m);   	%var(v=p_onart_diag_w);  
%var(v=p_onart_vl1000_);	%var(v=p_onart_vl1000_m);	%var(v=p_onart_vl1000_w);	%var(v=n_onprep_w);		%var(v=n_onprep_m);			%var(v=n_onprep);
%var(v=prop_elig_on_prep);	%var(v=n_prep_ever);		

%var(v=n_sw_1564_);			%var(v=n_sw_1549_);			%var(v=p_w_1564_sw);		%var(v=p_w_1549_sw);	%var(v=prevalence_1564sw);	%var(v=incidence_1564sw);
%var(v=p_onprep_sw);		%var(v=n_onprep_sw);

%var(v=n_msm_1564_);		%var(v=p_m_msm);			%var(v=prevalence1549_msm);	%var(v=incidence_msm);	%var(v=p_onprep_msm);		%var(v=n_onprep_msm);
%var(v=n_agyw);				%var(v=p_w_agyw);			%var(v=prevalence_agyw);	%var(v=incidence_agyw);	%var(v=p_onprep_agyw);		%var(v=n_onprep_agyw);

%var(v=n_death_hivrel);		%var(v=n_death_hivrel_m);	%var(v=n_death_hivrel_w);

data wide_outputs;merge
n_alive_m		 	n_alive_w			n_alive				n_hivge15m		n_hivge15w		    n_hivge15_
prevalence1549m 	prevalence1549w		prevalence1549_ 	incidence1549_ 	incidence1549w	 	incidence1549m
p_onart		 		p_onart_m			p_onart_w			n_onart			n_onart_m			n_onart_w

p_diag	 		 	p_diag_m 			p_diag_w  			p_onart_diag  	p_onart_diag_m   	p_onart_diag_w  
p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	n_onprep_w		n_onprep_m			n_onprep
prop_elig_on_prep	n_prep_ever		

n_sw_1564_			n_sw_1549_			p_w_1564_sw			p_w_1549_sw		prevalence_1564sw	incidence_1564sw
p_onprep_sw			n_onprep_sw

n_msm_1564_			p_m_msm				prevalence1549_msm	incidence_msm	p_onprep_msm		n_onprep_msm
n_agyw				p_w_agyw			prevalence_agyw		incidence_agyw	p_onprep_agyw		n_onprep_agyw

n_death_hivrel		n_death_hivrel_m	n_death_hivrel_w;

proc sort; by run;run;

data a.wide_Zim_17_12_2025;
set wide_outputs  ;  
by run;run; 
