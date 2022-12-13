libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Deaths Zim\";

data a;
set a.Zim_02;
proc sort;by run;run;

data sf;
set a;
 
if cald=2021.25;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = (15117400 * 0.581) / s_alive;  
*Source for Zimbabwe population is https://www.worldometers.info/world-population/zimbabwe-population/ accessed 6/9/2021;
* 58.1% of Zim population in 2020 >= age 15. Source: https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=ZW accessed 6/9/2021;
keep run sf_2022;


proc sort; by run;run;

%let sf=sf_2022;


data b; 
merge a sf;
by run;

s_alive = s_alive_m + s_alive_w ;

/*
n_new_inf1549_ = n_new_inf1549;

prev_hiv_preg_1519_ = prev_hiv_preg_1519;
prev_hiv_preg_2024_	= prev_hiv_preg_2024;
prev_hiv_preg_2529_ = prev_hiv_preg_2529;
prev_hiv_preg_3034_ = prev_hiv_preg_3034;
prev_hiv_preg_3539_ = prev_hiv_preg_3539;
prev_hiv_preg_4044_ = prev_hiv_preg_4044;
prev_hiv_preg_4549_ = prev_hiv_preg_4549;
prev_hiv_preg_50pl_ = prev_hiv_preg_50pl;

n_cd4_lt200_ = n_cd4_lt200;

p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_1524_newp_ge1_ = p_1524_newp_ge1 ;
p_1524m_newp_ge1_ = p_1524m_newp_ge1 ;
p_1524w_newp_ge1_ = p_1524w_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;  

loggender_r_newp = log(gender_r_newp+0.0001);

logw15r = log(w15r+0.0001);
logw25r = log(w25r+0.0001);
logw35r = log(w35r+0.0001);
logw45r = log(w45r+0.0001);
logw55r = log(w55r+0.0001);
logm15r = log(m15r+0.0001);
logm25r = log(m25r+0.0001);
logm35r = log(m35r+0.0001);
logm45r = log(m45r+0.0001);
logm55r = log(m55r+0.0001);

*/

***Define variables used in graphs to compare Malawi outputs to observed data;
s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_new_vmmc1549m = s_new_vmmc1519m + s_new_vmmc2024m + s_new_vmmc2529m + s_new_vmmc3034m + s_new_vmmc3539m + s_new_vmmc4044m + s_new_vmmc4549m;
s_hiv1524w = s_hiv1519w + s_hiv2024w ;
s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;

* p_w_giv_birth_this_per;		p_w_giv_birth_this_per = s_pregnant / s_alive1564_w;
* mtct_prop;					if s_give_birth_with_hiv > 0 then mtct_prop = s_birth_with_inf_child / s_give_birth_with_hiv  ;
* p_ai_no_arv_c_nnm;			if s_ai_naive_no_pmtct_ > 0 then p_ai_no_arv_c_nnm = s_ai_naive_no_pmtct_c_nnm_ / s_ai_naive_no_pmtct_;

* p_newp_ge1;					p_newp_ge1_ = s_newp_ge1 / s_alive1564 ;
* p_newp_ge5;					p_newp_ge5_ = s_newp_ge5 / s_alive1564 ;
* gender_r_newp;				gender_r_newp = s_m_newp / s_w_newp; *log_gender_r_newp  = log(gender_r_newp);
* n_tested;						n_tested = s_tested * &sf * 4;
* p_tested_past_year_1549m;		if s_alive1549_m - s_diag_m1549_ > 0 then p_tested_past_year_1549m = s_tested_4p_m1549_ /  (s_alive1549_m - s_diag_m1549_) ;
* p_tested_past_year_1549w;		if s_alive1549_w - s_diag_w1549_ > 0 then p_tested_past_year_1549w = s_tested_4p_w1549_ /  (s_alive1549_w - s_diag_w1549_) ;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;

* p_mcirc;						p_mcirc = s_mcirc / s_alive_m ;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;
* n_new_vmmc1549m;				n_new_vmmc1549m = s_new_vmmc1549m * &sf * 4;


* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_ever_sw;				if s_alive1564_w gt 0 then prop_w_ever_sw = s_ever_sw / s_alive_w ;
* prop_sw_hiv;					prop_sw_hiv = s_hiv_sw / s_sw_1564 ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* prevalence1524w;				prevalence1524w = ( s_hiv1519w + s_hiv2024w ) / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m = ( s_hiv1519m + s_hiv2024m ) / (s_ageg1519m + s_ageg2024m) ;
* prevalence2549w;				prevalence2549w = ( s_hiv2529w + s_hiv3034w +  s_hiv3539w + s_hiv4044w +  s_hiv4549w ) / 
													(s_ageg2529w + s_ageg3034w + s_ageg3539w + s_ageg4044w + s_ageg4549w) ;
* prevalence2549m;				prevalence2549m = ( s_hiv2529m + s_hiv3034m +  s_hiv3539m + s_hiv4044m +  s_hiv4549m ) / 
													(s_ageg2529m + s_ageg3034m + s_ageg3539m + s_ageg4044m + s_ageg4549m) ;

* prevalence_hiv_preg;			if s_pregnant>0 then prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;

* incidence1549;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1564;                incidence1564_ = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
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
* p_artexp_diag;  				if s_diag > 0 then p_artexp_diag = s_artexp / s_diag;
* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
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

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* n_art_start_y;				n_art_start_y = s_art_start * 4 * &sf;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 

* p_vg1000, p_vl1000;			if s_hivge15  > 0 then p_vg1000_ = s_vg1000 / s_hivge15 ;  p_vl1000_ = 1- p_vg1000_ ;
* prevalence_vg1000;			if s_alive > 0 then prevalence_vg1000_ = s_vg1000 / s_alive;
* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
* n_death_hiv_m;				n_death_hiv_m = s_death_hiv_m * 4 * &sf;
* n_death_hiv_w;				n_death_hiv_w = s_death_hiv_w * 4 * &sf;		
* rate_dead_allage;				rate_dead_allage = ((s_deadm_all + s_deadw_all) * 4 * 100) / s_alive ;
* rate_dead_allage_m;			rate_dead_allage_m = (s_deadm_all * 4 * 100) / s_alive_m ; 
* rate_dead_allage_w;			rate_dead_allage_w = (s_deadw_all * 4 * 100) / s_alive_w ; 

* n_cd4_lt200;					n_cd4_lt200_ = (s_cd4_g1 + s_cd4_g2 + s_cd4_g3) * &sf; 
* n_hiv;						n_hiv = s_hivge15 * &sf;
* n_alive;						n_alive = s_alive * &sf;
* n_alive1549_;					n_alive1549_ = s_alive1549* &sf;
* n_alive_m;					n_alive_m = s_alive_m * &sf;
* n_alive_w;					n_alive_w = s_alive_w * &sf;
* n_prep;						n_prep = s_prep_any * &sf;
* n_prep_ever;					n_prep_ever = s_prep_any_ever * &sf;
* p_prep_ever;					p_prep_ever = s_prep_any_ever / (s_alive1564_w + s_alive1564_m) ;
* prop_w_1524_onprep;			prop_w_1524_onprep = s_onprep_1524w / ((s_ageg1519w + s_ageg2024w) - s_hiv1524w) ;
* prop_1564_onprep;				prop_1564_onprep =   max(s_prep_any, 0) / ((s_alive1564_w + s_alive1564_m) - s_hiv1564)  ;

keep	cald	run		option
p_w_giv_birth_this_per	mtct_prop		p_newp_ge1_	 		p_newp_ge5_			
n_tested	p_tested_past_year_1549m	p_tested_past_year_1549w	test_prop_positive
p_mcirc				p_mcirc_1549m		n_new_vmmc1549m 	prop_w_1549_sw		prop_w_ever_sw	
prop_sw_hiv			prop_w_1524_onprep	prop_1564_onprep	prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w		
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w		
incidence4554m		incidence4554w		incidence5564m		incidence5564w	
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_artexp_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	p_vg1000_	p_vl1000_
prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hiv_w
rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv				n_alive				n_alive1549_		n_alive_m			n_alive_w			n_art_start_y	
n_prep 				n_prep_ever			p_prep_ever				;		

proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =86;
%let year_end = 2045.00 ;
proc sort;by cald option ;run;

data option_0;
set b;
if option =1 then delete;

%let var =  
p_w_giv_birth_this_per	mtct_prop		p_newp_ge1_	 		p_newp_ge5_				
n_tested	p_tested_past_year_1549m	p_tested_past_year_1549w	test_prop_positive
p_mcirc		p_mcirc_1549m				n_new_vmmc1549m 	prop_w_1549_sw		prop_w_ever_sw	
prop_sw_hiv	prop_w_1524_onprep			prop_1564_onprep	prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w	
incidence4554m		incidence4554w		incidence5564m		incidence5564w	
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_artexp_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	p_vg1000_	p_vl1000_
prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hiv_w
rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv				n_alive				n_alive1549_		n_alive_m			n_alive_w			 n_art_start_y 	
n_prep				n_prep_ever			p_prep_ever			;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p2p5_var = p2p5_&var_0;
%let p97p5_var = p97p5_&var_0;
%let p50_var = median_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p2p5_&varb._0  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._0 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 p2p5_&varb._0 p97p5_&varb._0;
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

%let var =  

p_w_giv_birth_this_per	mtct_prop		p_newp_ge1_	 		p_newp_ge5_				
n_tested	p_tested_past_year_1549m	p_tested_past_year_1549w	test_prop_positive
p_mcirc		p_mcirc_1549m				n_new_vmmc1549m 	prop_w_1549_sw	prop_w_ever_sw
prop_sw_hiv	prop_w_1524_onprep			prop_1564_onprep	prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w	
incidence4554m		incidence4554w		incidence5564m		incidence5564w	
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_artexp_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	p_vg1000_	p_vl1000_
prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hiv_w
rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv				n_alive				n_alive1549_		n_alive_m			n_alive_w			n_art_start_y	
n_prep				n_prep_ever			p_prep_ever			;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p2p5_var = p2p5_&var_1;
%let p97p5_var = p97p5_&var_1;
%let p50_var = median_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p2p5_&varb._1  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._1 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1 p2p5_&varb._1 p97p5_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;


data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24 g25
g26  g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48  g49 g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71  g72  g73  g74 g75
g76  g77  g78  g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  /*g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100    g101 g102 
g103 g104 g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 */

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52  h53  h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72  h73  h74 
h75	 h77  h78  h79  h80  h81  h82  h83  h84  h85  h86  h87  h88  /*h89  h90 h91  h92  h93  h94  h95  h96  h97  h98 h99  h100 h101 h102
h103 h104 */
;
by cald;


***Observed data;
%include "C:\Users\lovel\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_Zimbabwe_Sep2021.sas";
run;

***Graphs comparing observed data to outputs;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Loveleen\Synthesis model\Modelling Consortium\Attribution of deaths\Zim_02.doc' startpage=never; 

proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);
label p50_n_alive_0 = "Option 0 (median) - 15+ ";
label p50_n_alive1549__0 = "Option 0 (median) - 15-49 ";
label o_pop_all_Zi_cens = "Census - All ages";
label o_pop_1549_Zi_cens = "Census - 15-49";
label o_pop_all_Zi_CIA = "CIA - All ages";
label o_pop_1565_Zi_CIA = "CIA - All 15-64";
series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive1549__0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive1549__0 	upper=p95_n_alive1549__0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_all_Zi_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_pop_1549_Zi_cens / markerattrs = (symbol=square color=green size = 10);
scatter x=cald y=o_pop_all_Zi_CIA / markerattrs = (symbol=triangle color=grey size = 10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs = (symbol=triangle color=brown size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Population 15+ by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);
label p50_n_alive_m_0 = "Option 0 (median) - Males 15+ ";
label p50_n_alive_w_0 = "Option 0 (median) - Females 15+ ";
label o_pop_allm_Zi_cens = "Census - Males all ages";
label o_pop_allw_Zi_cens = "Census - Females all ages";
label o_pop_1549m_Zi_cens = "Census - Males 15-49";
label o_pop_1549w_Zi_cens = "Census - Females 15-49";
series  x=cald y=p50_n_alive_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_alive_m_0 	upper=p95_n_alive_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_alive_w_0 	upper=p95_n_alive_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
scatter x=cald y=o_pop_allm_Zi_cens / markerattrs = (symbol=square color=darkblue size = 10);
scatter x=cald y=o_pop_allw_Zi_cens / markerattrs = (symbol=square color=darkorange size = 10);
scatter x=cald y=o_pop_1549m_Zi_cens / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_pop_1549w_Zi_cens / markerattrs = (symbol=square color=lightorange size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Option 0 (median) ";
label p50_p_w_giv_birth_this_per_1 = "Option 1 (median) ";

series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_0 	upper=p97p5_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Option 0 90% range";
*series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p2p5_p_w_giv_birth_this_per_1 	upper=p97p5_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";
run;
quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0 = "Option 0 (median) ";
label p50_p_newp_ge1__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_1524_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_p_1524_newp_ge1__0 = "Option 0 (median) - Both";
label p50_p_1524_newp_ge1__1 = "Option 1 (median) ";
label p50_p_1524m_newp_ge1__0 = "Option 0 (median) - Men";
label p50_p_1524w_newp_ge1__0 = "Option 0 (median) - Women";
label o_p_cls_last_1524m_zdhs = "CAL - DHS - No condom use at last sex - Men";
label o_p_cls_last_1524w_zdhs = "CAL - DHS - No condom use at last sex - Women";
series  x=cald y=p50_p_1524_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_1524_newp_ge1__0 	upper=p95_p_1524_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_1524m_newp_ge1__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_1524m_newp_ge1__0 	upper=p95_p_1524m_newp_ge1__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_1524w_newp_ge1__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_1524w_newp_ge1__0 	upper=p95_p_1524w_newp_ge1__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*series  x=cald y=p50_p_1524_newp_ge1__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_1524_newp_ge1__1 	upper=p95_p_1524_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_cls_last_1524w_zdhs/	markerattrs = (color=orange);
scatter  x=cald y=o_p_cls_last_1524m_zdhs/	markerattrs = (color=blue);
run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0 = "Option 0 (median) ";
label p50_p_newp_ge5__1 = "Option 1 (median) ";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label p50_log_gender_r_newp_0 = "Option 0 (median) ";
label p50_log_gender_r_newp_1 = "Option 1 (median) ";
series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

*/

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  5000000 by 500000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0 = "Option 0 (median) ";
label p50_p_tested_past_year_1549m_1 = "Option 1 (median) ";
label o_p_testedly_1549m_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_testedly_1549m_zdhs/	markerattrs = (color=black) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0 = "Option 0 (median) ";
label p50_p_tested_past_year_1549w_1 = "Option 1 (median) ";
label o_p_testedly_1549w_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_testedly_1549w_zdhs/	markerattrs = (color=black) ;
run;quit;



*test_prop_positive;
proc sgplot data=d; 
Title    height=1.5 justify=center "Positivity rate";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_test_prop_positive_0 = "Option 0 (median) ";
label p50_test_prop_positive_1 = "Option 1 (median) ";
label o_pos_rate_15ov_z = "CAL - Public sector";
series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_pos_rate_15ov_z/	markerattrs = (color=black ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new diagnoses with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

label p50_n_diagnosed_0 = "Option 0 (median) ";
label p50_n_diagnosed_1 = "Option 1  (median) ";

series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_diagnosed_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of ART initiations";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

*label p50_n_all_ai_y_0 = "Option 0 (median) - all";
*label p50_n_all_ai_y_1 = "Option 1  (median) - all";
label p50_n_art_start_y_0 = "Option 0 (median) - 1st";
label p50_n_art_start_y_1 = "Option 1  (median) - 1st";
*series  x=cald y=p50_n_all_ai_y_0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_0 	upper=p95_n_all_ai_y_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range - all";
*series  x=cald y=p50_n_all_ai_y_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_1 	upper=p95_n_all_ai_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_art_start_y_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_art_start_y_0 	upper=p95_n_art_start_y_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range - 1st";
*series  x=cald y=p50_n_art_start_y_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_art_start_y_1 	upper=p95_n_art_start_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

*!!!!!Note that the observed data are 15+;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised (Data 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Option 0 (median) - 15-49";
label p50_p_mcirc_1549m_1 = "Option 1 (median) ";
label p50_p_mcirc_0 = "Option 0 (median) - 15+?";
label o_p_circ_15pl_DHIS2_z= "CAL - DHIS2 men 15+";
series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_circ_15pl_DHIS2_z /	markerattrs = (color=blue);
run;quit;

 
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual # new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000 by 100000) valueattrs=(size=10);
label p50_n_new_vmmc1549m_0 = "Option 0 (median) ";
label p50_n_new_vmmc1549m_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Annual number of new circumcisions 10-49";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_new_mcirc/	markerattrs = (color=blue ) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
label p50_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";
label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";

label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
label o_p_ever_fsw_1ts_1849w_nbcs = "NBCS - Ever transactional sex 18-49";

series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=lightgreen thickness = 2);
*band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_fsw_1849_Zim_garpr /	markerattrs = (color=orange);
scatter  x=cald y=o_p_fsw_1849_Bulaw_garpr /	markerattrs = (color=red);
scatter  x=cald y=o_p_fsw_1849_Harare_garpr /	markerattrs = (color=pink);
scatter  x=cald y=o_p_ever_fsw_1ts_1849w_nbcs /	markerattrs = (color=green);
run;quit;
/*proc print data=d;var p50_prop_w_1549_sw_0 p5_prop_w_1549_sw_0 p95_prop_w_1549_sw_0;where cald=2020;run;*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";
label o_prev_fsw_dw = "David Wilson";
label o_prev_fsw_rdshm = "RDS Hwange and Mutare";
label o_prev_fsw_rdsvf = "RDS Victoria Falls";
label o_prev_fsw_tested_swvp = "Sisters with a Voice";
label o_prev_fsw_rds = "RDS baseline SAPPH-IRe";
series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_prev_fsw_dw /  yerrorlower=o_prev_fsw_ll_dw yerrorupper=o_prev_fsw_ul_dw markerattrs = (color=black) ERRORBARATTRS = (color = black) ;
scatter x=cald y=o_prev_fsw_rdshm / markerattrs = (color=blue) ;
scatter x=cald y=o_prev_fsw_rdsvf / markerattrs = (color=red) ;
scatter x=cald y=o_prev_fsw_tested_swvp / markerattrs = (color=green) ;
scatter x=cald y=o_prev_fsw_rds /  yerrorlower=o_prev_fsw_ll_rds yerrorupper=o_prev_fsw_ul_rds markerattrs = (color=orange) ERRORBARATTRS = (color = orange) ;
run;quit;
/*proc print data=d;var p50_prop_sw_hiv_0 p5_prop_sw_hiv_0 p95_prop_sw_hiv_0;where cald=2020;run;
proc freq data=d;table p95_n_prep_0;run;*/
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_0 = "Option 0 (median) ";
label p50_n_prep_1 = "Option 1  (median) ";

series  x=cald y=p50_n_prep_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_0 	upper=p95_n_prep_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_prep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
/*proc freq data=d;table p95_n_prep_ever_0;run;*/
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people ever on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5400000   by 100000 ) valueattrs=(size=10);
label p50_n_prep_ever_0 = "Option 0 (median) ";
label p50_n_prep_ever_1 = "Option 1  (median) ";
label o_n_prep_ever = "Cumulative Number of People Initiating PrEP";

series  x=cald y=p50_n_prep_ever_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_ever_0 	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_prep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_n_prep_ever  / markerattrs = (color=black);

run;quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people ever on PrEP - ZOOM";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000   by 25000 ) valueattrs=(size=10);
label p50_n_prep_ever_0 = "Option 0 (median) ";
label p50_n_prep_ever_1 = "Option 1  (median) ";
label o_n_prep_ever = "Cumulative Number of People Initiating PrEP";

series  x=cald y=p50_n_prep_ever_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_ever_0 	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_prep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_n_prep_ever  / markerattrs = (color=black);

run;quit;
*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);
label p50_prop_w_1524_onprep_0 = "Option 0 (median) ";
label p50_prop_w_1524_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.01   by 0.01 ) valueattrs=(size=10);
label p50_prop_1564_onprep_0 = "Option 0 (median) ";
label p50_prop_1564_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
label p50_prevalence1549m_1 = "Men Option 1 (median) ";
label p50_prevalence1549w_0 = "Women Option 0 (median) ";
label p50_prevalence1549w_1 = "Women Option 1 (median) ";
label o_prev1549_Z_ess = "CAL - ZIMPHIA or DHS";
label o_prev1549m_Z_ess = "CAL - ZIMPHIA or DHS - men";
label o_prev1549w_Z_ess = "CAL - ZIMPHIA or DHS - women";


series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
*band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
*band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";

*MIHPSA essential;
scatter x=cald y=o_prev1549_Z_ess  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=black) errorbarattrs = (color = black) ;
scatter x=cald y=o_prev1549m_Z_ess /  yerrorlower=o_prev1549m_ll_Z_ess yerrorupper=o_prev1549m_ul_Z_ess markerattrs = (color=blue) errorbarattrs = (color = blue) ;
scatter x=cald y=o_prev1549w_Z_ess /  yerrorlower=o_prev1549w_ll_Z_ess yerrorupper=o_prev1549w_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange) ;
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Option 0 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";

series  x=cald y=p50_prevalence_hiv_preg_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_prev1549w_Z_anc  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence 15-24 - by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence1524m_0 = "Option 0 (median) - Males 15-24";
label p50_prevalence1524w_0 = "Option 0 (median) - Females 15-24";
label o_prev1524m_yas = "Zimbabwe Young Adult Survey - Males";
label o_prev1524w_yas = "Zimbabwe Young Adult Survey - Females";
label o_prev1524m_Z_dhs = "DHS - Males";
label o_prev1524w_Z_dhs = "DHS - Females";

series  x=cald y=p50_prevalence1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1524m_0 	upper=p95_prevalence1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1524w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1524w_0 	upper=p95_prevalence1524w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

scatter x=cald y=o_prev1524m_yas /  markerattrs = (color=blue);
scatter x=cald y=o_prev1524w_yas /  markerattrs = (color=orange);
scatter x=cald y=o_prev1524m_Z_DHS /  markerattrs = (color=darkblue);
scatter x=cald y=o_prev1524w_Z_DHS /  markerattrs = (color=darkorange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence 25-49 - by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence2549m_0 = "Option 0 (median) - Males 25-49";
label p50_prevalence2549w_0 = "Option 0 (median) - Females 25-49";
label o_prev2549m_Z_DHS = "DHS - Males";
label o_prev2549w_Z_DHS = "DHS - Females";
series  x=cald y=p50_prevalence2549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence2549m_0 	upper=p95_prevalence2549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence2549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence2549w_0 	upper=p95_prevalence2549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
scatter x=cald y=o_prev2549m_Z_DHS /  markerattrs = (color=darkblue);
scatter x=cald y=o_prev2549w_Z_DHS /  markerattrs = (color=darkorange);
run;quit;


/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women - by age";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Option 0 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";

series  x=cald y=p50_prev_hiv_preg_1519__0/	lineattrs = (color=yellow thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_1519__0 	upper=p95_prev_hiv_preg_1519__0  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_2024__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_2024__0 	upper=p95_prev_hiv_preg_2024__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_2529__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_2529__0 	upper=p95_prev_hiv_preg_2529__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_3034__0/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_3034__0 	upper=p95_prev_hiv_preg_3034__0  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_3539__0/	lineattrs = (color=violet thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_3539__0 	upper=p95_prev_hiv_preg_3539__0  / transparency=0.9 fillattrs = (color=violet) legendlabel= "Model 90% range";

series  x=cald y=p50_prev_hiv_preg_4044__0/	lineattrs = (color=brown thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_4044__0 	upper=p95_prev_hiv_preg_4044__0  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_4549__0/	lineattrs = (color=darkbrown thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_4549__0 	upper=p95_prev_hiv_preg_4549__0  / transparency=0.9 fillattrs = (color=darkbrown) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_prev1519w_Z_anc  /  markerattrs = (color=yellow);
scatter x=cald y=o_prev2024w_Z_anc  /  markerattrs = (color=orange);
scatter x=cald y=o_prev2529w_Z_anc  /  markerattrs = (color=red);
scatter x=cald y=o_prev3034w_Z_anc  /  markerattrs = (color=purple);
scatter x=cald y=o_prev3539w_Z_anc  /  markerattrs = (color=violet);
scatter x=cald y=o_prev4044w_Z_anc  /  markerattrs = (color=brown);
scatter x=cald y=o_prev4549w_Z_anc  /  markerattrs = (color=darkbrown);
run;quit;
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1549__0 = "Option 0 (median) ";
label p50_incidence1549__1 = "Option 1  (median) ";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1564__0 = "Option 0 (median) ";
label p50_incidence1564__1 = "Option 1  (median) ";
label o_HIVincid_1564_Zimphia = "ZIMPHIA 15-64";
series  x=cald y=p50_incidence1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564__0 	upper=p95_incidence1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1564__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1564__1 	upper=p95_incidence1564__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1564_Zimphia / yerrorlower=o_HIVincid_1564_ll_Zimphia yerrorupper=o_HIVincid_1564_ul_Zimphia markerattrs = (symbol=square color=black size = 10) errorbarattrs = (color = black);
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1549m_0 = "Option 0 (median) - Men";
label p50_incidence1549m_1 = "Option 1  (median) - Men";
label p50_incidence1549w_0 = "Option 0 (median) - Women";
label p50_incidence1549w_1 = "Option 1  (median) - Women";
label o_HIVincid_1549m_Zimphia = "ZIMPHIA Men 15-49";
label o_HIVincid_1549w_Zimphia = "ZIMPHIA Women 15-49";
series  x=cald y=p50_incidence1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549m__1 	upper=p95_incidence1549m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549w__1 	upper=p95_incidence1549w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1549m_Zimphia / yerrorlower=o_HIVincid_1549m_ll_Zimphia yerrorupper=o_HIVincid_1549m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_1549w_Zimphia / yerrorlower=o_HIVincid_1549w_ll_Zimphia yerrorupper=o_HIVincid_1549w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 15-24";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1524m_0 = "Option 0 (median) - Men";
label p50_incidence1524m_1 = "Option 1  (median) - Men";
label p50_incidence1524w_0 = "Option 0 (median) - Women";
label p50_incidence1524w_1 = "Option 1  (median) - Women";
label o_HIVincid_1524m_Zimphia = "ZIMPHIA Men 15-24";
label o_HIVincid_1524w_Zimphia = "ZIMPHIA Women 15-24";

series  x=cald y=p50_incidence1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1524m_0 	upper=p95_incidence1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1524m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1524m__1 	upper=p95_incidence1524m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1524w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1524w_0 	upper=p95_incidence1524w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1524w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1524w__1 	upper=p95_incidence1524w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1524m_Zimphia / yerrorlower=o_HIVincid_1524m_ll_Zimphia yerrorupper=o_HIVincid_1524m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_1524w_Zimphia / yerrorlower=o_HIVincid_1524w_ll_Zimphia yerrorupper=o_HIVincid_1524w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2534";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence2534m_0 = "Option 0 (median) - Men";
label p50_incidence2534m_1 = "Option 1  (median) - Men";
label p50_incidence2534w_0 = "Option 0 (median) - Women";
label p50_incidence2534w_1 = "Option 1  (median) - Women";
label o_HIVincid_2534m_Zimphia = "ZIMPHIA Men 25-34";
label o_HIVincid_2534w_Zimphia = "ZIMPHIA Women 25-34";

series  x=cald y=p50_incidence2534m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence2534m_0 	upper=p95_incidence2534m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2534m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2534m_1 	upper=p95_incidence2534m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence2534w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence2534w_0 	upper=p95_incidence2534w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2534w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2534w_1 	upper=p95_incidence2534w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_2534m_Zimphia / yerrorlower=o_HIVincid_2534m_ll_Zimphia yerrorupper=o_HIVincid_2534m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_2534w_Zimphia / yerrorlower=o_HIVincid_2534w_ll_Zimphia yerrorupper=o_HIVincid_2534w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 3544";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence3544m_0 = "Option 0 (median) - Men";
label p50_incidence3544m_1 = "Option 1  (median) - Men";
label p50_incidence3544w_0 = "Option 0 (median) - Women";
label p50_incidence3544w_1 = "Option 1  (median) - Women";
label o_HIVincid_3549m_Zimphia = "ZIMPHIA Men 35-49";
label o_HIVincid_3549w_Zimphia = "ZIMPHIA Women 35-49";
series  x=cald y=p50_incidence3544m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence3544m_0 	upper=p95_incidence3544m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence3544m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence3544m_1 	upper=p95_incidence3544m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence3544w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence3544w_0 	upper=p95_incidence3544w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence3544w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence3544w_1 	upper=p95_incidence3544w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_3549m_Zimphia / yerrorlower=o_HIVincid_3549m_ll_Zimphia yerrorupper=o_HIVincid_3549m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_3549w_Zimphia / yerrorlower=o_HIVincid_3549w_ll_Zimphia yerrorupper=o_HIVincid_3549w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 4554";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence4554m_0 = "Option 0 (median) - Men";
label p50_incidence4554m_1 = "Option 1  (median) - Men";
label p50_incidence4554w_0 = "Option 0 (median) - Women";
label p50_incidence4554w_1 = "Option 1  (median) - Women";
series  x=cald y=p50_incidence4554m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence4554m_0 	upper=p95_incidence4554m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence4554m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence4554m_1 	upper=p95_incidence4554m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence4554w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence4554w_0 	upper=p95_incidence4554w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence4554w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence4554w_1 	upper=p95_incidence4554w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 5564";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence5564m_0 = "Option 0 (median) - Men";
label p50_incidence5564m_1 = "Option 1  (median) - Men";
label p50_incidence5564w_0 = "Option 0 (median) - Women";
label p50_incidence5564w_1 = "Option 1  (median) - Women";
series  x=cald y=p50_incidence5564m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence5564m_0 	upper=p95_incidence5564m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence5564m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence5564m_1 	upper=p95_incidence5564m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence5564w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence5564w_0 	upper=p95_incidence5564w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence5564w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence5564w_1 	upper=p95_incidence5564w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_ep_0 = "Option 0 (median) ";
label p50_p_inf_ep_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_ep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_ep_1 	upper=p95_p_inf_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_newp_0 = "Option 0 (median) ";
label p50_p_inf_newp_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_newp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_newp_1 	upper=p95_p_inf_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prop infections coming from people VL suppressed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_vlsupp_0 = "Option 0 (median) ";
label p50_p_inf_vlsupp_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_vlsupp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_primary_0 = "Option 0 (median) ";
label p50_p_inf_primary_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_primary_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_naive_0 = "Option 0 (median) ";
label p50_p_inf_naive_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_naive_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_naive_1 	upper=p95_p_inf_naive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_diag_0 = "Option 0 (median) ";
label p50_p_inf_diag_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);
label p50_mtct_prop_0 = "Option 0 (median) ";
label p50_mtct_prop_1 = "Option 1  (median) ";
series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

*****START HERE****;
proc sgplot data=d; 
Title    height=1.5 justify=center "of men with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_m_0 = "Option 0 (median) - 15+";
label p50_p_diag_m_1 = "Option 1  (median) ";
label o_p_diag_m1549_dhs = "DHS - 15-49";
label o_p_diag_1564m_zimphia = "ZIMPHIA - 15-64";

series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_m1549_dhs / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_p_diag_1564m_zimphia / markerattrs = (symbol=square color=blue size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of women with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_w_0 = "Option 0 (median) _ 15+";
label p50_p_diag_w_1 = "Option 1  (median) ";
label o_p_diag_w1549_dhs = "DHS - 15-49";
label o_p_diag_1564w_zimphia = "ZIMPHIA - 15-64";

series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_w1549_dhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_diag_1564w_zimphia / markerattrs = (symbol=square color=red size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "Option 0 (median) ";
label p50_p_ai_no_arv_c_nnm_1 = "Option 1  (median) ";

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_ai_no_arv_c_nnm_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Option 0 (median) ";
label p50_p_artexp_diag_1 = "Option 1  (median) ";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_m_0 = "Option 0 (median) ";
label p50_p_onart_diag_m_1 = "Option 1  (median) ";
label o_p_onart_1564m_diag_zimphia = "ZIMPHIA";

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564m_diag_zimphia / markerattrs = (symbol=square color=blue size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_w_0 = "Option 0 (median) ";
label p50_p_onart_diag_w_1 = "Option 1  (median) ";
label o_p_onart_1564f_diag_zimphia = "ZIMPHIA";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564f_diag_zimphia / markerattrs = (symbol=square color=orange size = 10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_onart_0 = "Option 0 (median) - Both";
label p50_n_onart_1 = "Option 1  (median) ";
label p50_n_onart_m_0 = "Option 0 (median) - Men";
label p50_n_onart_w_0 = "Option 0 (median) - Women";
label o_s_all_onart_NAC = "CAL - NAC";
series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_efa_0 = "Option 0 (median) ";
label p50_p_efa_1 = "Option 1  (median) ";
series  x=cald y=p50_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_efa_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_efa_1 	upper=p95_p_efa_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_taz_0 = "Option 0 (median) ";
label p50_p_taz_1 = "Option 1  (median) ";
series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_taz_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_ten_0 = "Option 0 (median) ";
label p50_p_ten_1 = "Option 1  (median) ";
series  x=cald y=p50_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_ten_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_ten_1 	upper=p95_p_ten_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_zdv_0 = "Option 0 (median) ";
label p50_p_zdv_1 = "Option 1  (median) ";
series  x=cald y=p50_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_zdv_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_zdv_1 	upper=p95_p_zdv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_dol_0 = "Option 0 (median) ";
label p50_p_dol_1 = "Option 1  (median) ";
series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_dol_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_3TC_0 = "Option 0 (median) ";
label p50_p_3TC_1 = "Option 1  (median) ";
series  x=cald y=p50_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_3TC_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_3TC_1 	upper=p95_p_3TC_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_lpr_0 = "Option 0 (median) ";
label p50_p_lpr_1 = "Option 1  (median) ";
series  x=cald y=p50_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_lpr_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_lpr_1 	upper=p95_p_lpr_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_nev_0 = "Option 0 (median) ";
label p50_p_nev_1 = "Option 1  (median) ";
series  x=cald y=p50_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_nev_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_nev_1 	upper=p95_p_nev_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000__0 = "Option 0 (median) ";
label p50_p_onart_vl1000__1 = "Option 1  (median) ";
label o_p_vll1000_6mart_garcpr = "CAL - GARCPR";
series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_p_vll1000_6mart_garcpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_m_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_m_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_w_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_w_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vl1000__0 = "Option 0 (median) ";
label p50_p_vl1000__1 = "Option 1  (median) ";
label o_p_vlsupp_hiv_15pl_phia = "ZIMPHIA 15+";
label o_p_vlsupp_hiv_1564_phia = "ZIMPHIA 15-64";
label o_p_vlsupp_hiv_1549_phia = "ZIMPHIA 15-49";
series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_vlsupp_hiv_15pl_phia / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_p_vlsupp_hiv_1564_phia / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_p_vlsupp_hiv_1549_phia / markerattrs = (symbol=square color=brown size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vg1000__0 = "Option 0 (median) ";
label p50_p_vg1000__1 = "Option 1  (median) ";
series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_m_0 = "Option 0 (median) ";
label p50_p_onart_m_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_w_0 = "Option 0 (median) ";
label p50_p_onart_w_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_prevalence_vg1000__0 = "Option 0 (median) ";
label p50_prevalence_vg1000__1 = "Option 1  (median) ";
series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Rate of death ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate (per 100 person-years)'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_allage_0 = "Option 0 (median) - 15+ both";
label p50_rate_dead_allage_1 = "Option 1  (median) ";
label p50_rate_dead_allage_m_0 = "Option 0 (median) - 15+ Men";
label p50_rate_dead_allage_w_0 = "Option 0 (median) - 15+ Women";
label o_r_death_cens = "CAL - Census - All ages both ";
label o_r_death_m_dhs = "CAL - DHS - All ages Men";
label o_r_death_w_dhs = "CAL - DHS - All ages Women";
label o_r_death_15plm_cens = "CAL - Census - 15+ Men";
label o_r_death_15plw_cens = "CAL - Census - 15+ Women";
series  x=cald y=p50_rate_dead_allage_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_rate_dead_allage_0 	upper=p95_rate_dead_allage_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_allage_m_0 	upper=p95_rate_dead_allage_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_allage_w_0 	upper=p95_rate_dead_allage_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_r_death_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_r_death_m_dhs / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_r_death_w_dhs / markerattrs = (symbol=square color=red size = 10);
scatter x=cald y=o_r_death_15plm_cens / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_r_death_15plw_cens / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_death_2059_w_0 = "Option 0 (median) - Women 20-59";
label p50_n_death_hiv_w_0 = "Option 0  (median) - women with HIV";
series  x=cald y=p50_n_death_2059_w_0/	lineattrs = (color=ORANGE thickness = 2);
band    x=cald lower=p5_n_death_2059_w_0 	upper=p95_n_death_2059_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_death_2059_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_death_2059_w_1 	upper=p95_n_death_2059_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_hiv_w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_death_hiv_w_0 	upper=p95_n_death_hiv_w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_w_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_death_2059_m_0 = "Option 0 (median) - Men 20-59";
label p50_n_death_HIV_m_0 = "Option 1  (median) - Men with HIV";
series  x=cald y=p50_n_death_2059_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_death_2059_m_0 	upper=p95_n_death_2059_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_death_2059_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_death_2059_m_1 	upper=p95_n_death_2059_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_hiv_m_0/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_death_hiv_m_0 	upper=p95_n_death_hiv_m_0  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

/*
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 15-24";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_1524m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_1524w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_1524m_0 	upper=p95_rate_dead_hivneg_1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_1524w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_1524w_0 	upper=p95_rate_dead_hivneg_1524w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 25-34";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_2534m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_2534w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_2534m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_2534m_0 	upper=p95_rate_dead_hivneg_2534m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_2534w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_2534w_0 	upper=p95_rate_dead_hivneg_2534w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 35-44";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_3544m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_3544w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_3544m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_3544m_0 	upper=p95_rate_dead_hivneg_3544m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_3544w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_3544w_0 	upper=p95_rate_dead_hivneg_3544w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 45-54";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_4554m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_4554w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_4554m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_4554m_0 	upper=p95_rate_dead_hivneg_4554m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_4554w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_4554w_0 	upper=p95_rate_dead_hivneg_4554w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 55-64";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_5564m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_5564w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_5564m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_5564m_0 	upper=p95_rate_dead_hivneg_5564m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_5564w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_5564w_0 	upper=p95_rate_dead_hivneg_5564w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 65+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_65plm_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_65plw_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_65plm_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_65plm_0 	upper=p95_rate_dead_hivneg_65plm_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_65plw_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_65plw_0 	upper=p95_rate_dead_hivneg_65plw_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);
label p50_n_cd4_lt200__0 = "Option 0 (median) ";
series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_hiv_0 = "Option 0 (median) ";
series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv in men and women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_hiv_m_0 = "Option 0 (median) - Men";
label p50_n_hiv_w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_n_hiv_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_hiv_m_0 	upper=p95_n_hiv_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_hiv_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_hiv_w_0 	upper=p95_n_hiv_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;
*/



/*

proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw55r_0 	upper=p95_logw55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
*/

title;

* ods rtf close;
* ods listing;
run;


ods rtf close;
run;





/************************************************************************************************************/
/*										SELECTION MIHPSA													*/
/************************************************************************************************************/

/*
ods rtf file="C:\Users\ValentinaCambiano\TLO_HMC Dropbox\Valentina Cambiano\hiv synthesis ssa unified program\output files\zimbabwe\graphsMIHPSA_20220708.rtf";

* 1a - HIV PREVALENCE 15-49 BY GENDER;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
label p50_prevalence1549m_1 = "Men Option 1 (median) ";
label p50_prevalence1549w_0 = "Women Option 0 (median) ";
label p50_prevalence1549w_1 = "Women Option 1 (median) ";
label o_prev1549_Z_ess = "CAL - ZIMPHIA or DHS";
label o_prev1549m_Z_ess = "CAL - ZIMPHIA or DHS - men";
label o_prev1549w_Z_ess = "CAL - ZIMPHIA or DHS - women";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
*band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
*band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";

*MIHPSA essential;
scatter x=cald y=o_prev1549_Z_ess  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=black) errorbarattrs = (color = black) ;
scatter x=cald y=o_prev1549m_Z_ess /  yerrorlower=o_prev1549m_ll_Z_ess yerrorupper=o_prev1549m_ul_Z_ess markerattrs = (color=blue) errorbarattrs = (color = blue) ;
scatter x=cald y=o_prev1549w_Z_ess /  yerrorlower=o_prev1549w_ll_Z_ess yerrorupper=o_prev1549w_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange) ;
run;quit;


* 2a - NUMBER OF ADULTS ON ART;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);
label p50_n_onart_0 = "Option 0 (median) - Both";
label p50_n_onart_1 = "Option 1  (median) ";
label p50_n_onart_m_0 = "Option 0 (median) - Men";
label p50_n_onart_w_0 = "Option 0 (median) - Women";
label o_s_all_onart_NAC = "CAL - NAC";

series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;


* 2b - % VL<1000 among ADULTS ON ART;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "Option 0 (median) ";
label p50_p_onart_vl1000__1 = "Option 1  (median) ";
label o_p_vll1000_6mart_garcpr = "CAL - GARCPR";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_p_vll1000_6mart_garcpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


* 3 - HIV PREVALENCE IN ANTENATAL CLIENTS;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Option 0 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";

series  x=cald y=p50_prevalence_hiv_preg_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_prev1549w_Z_anc  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange);
run;quit;

* 4a - % EVER CIRCUMCISED;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised (Data 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Option 0 (median) - 15-49";
label p50_p_mcirc_1549m_1 = "Option 1 (median) ";
label p50_p_mcirc_0 = "Option 0 (median) - 15+?";
label o_p_circ_15pl_DHIS2_z= "CAL - DHIS2 men 15+";
series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_circ_15pl_DHIS2_z /	markerattrs = (color=blue);
run;quit;


* 4b - ANNUAL NUMBER OF NEW CIRCUMCISIONS;
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual # new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000 by 100000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Annual number of new circumcisions 10-49";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_new_mcirc/	markerattrs = (color=blue ) ;
run;quit;


* 5a - NUMBER OF TESTS;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  5000000 by 100000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
run;quit;

* 5b - POSITIVITY RATE;
*test_prop_positive;
proc sgplot data=d; 
Title    height=1.5 justify=center "Positivity rate";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_test_prop_positive_0 = "Option 0 (median) ";
label p50_test_prop_positive_1 = "Option 1 (median) ";
label o_pos_rate_15ov_z = "CAL - Public sector";
series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_pos_rate_15ov_z/	markerattrs = (color=black ) ;
run;quit;

* 7 - DEATH RATE;

proc sgplot data=d; 
Title    height=1.5 justify=center "Rate of death ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate (per 100 person-years)'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_allage__0 = "Option 0 (median) - 15+ both";
label p50_rate_dead_allage__1 = "Option 1  (median) ";
label p50_rate_dead_allage_m_0 = "Option 0 (median) - 15+ Men";
label p50_rate_dead_allage_w_0 = "Option 0 (median) - 15+ Women";
label o_r_death_cens = "CAL - Census - All ages both ";
label o_r_death_m_dhs = "CAL - DHS - All ages Men";
label o_r_death_w_dhs = "CAL - DHS - All ages Women";
label o_r_death_15plm_cens = "CAL - Census - 15+ Men";
label o_r_death_15plw_cens = "CAL - Census - 15+ Women";
series  x=cald y=p50_rate_dead_allage_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_rate_dead_allage_0 	upper=p95_rate_dead_allage_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_allage_m_0 	upper=p95_rate_dead_allage_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_allage_w_0 	upper=p95_rate_dead_allage_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_r_death_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_r_death_m_dhs / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_r_death_w_dhs / markerattrs = (symbol=square color=red size = 10);
scatter x=cald y=o_r_death_15plm_cens / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_r_death_15plw_cens / markerattrs = (symbol=square color=orange size = 10);
run;quit;

ods rtf close; run;
*/
