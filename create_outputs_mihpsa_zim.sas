

libname a "C:\Users\ValentinaCambiano\TLO_HMC Dropbox\Valentina Cambiano\hiv synthesis ssa unified program\output files\zimbabwe\";

libname b "C:\Users\ValentinaCambiano\TLO_HMC Dropbox\Valentina Cambiano\hiv synthesis ssa unified program\output files\zimbabwe\base_zim_a_out\";

  data g;    set b.out: ;
*Based on print out of runs that fit prevalence and number on ART;
if run in (
6667456 
7654350 
);



proc sort data=g; 
by run cald option;run;


* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;

set g ;

if cald=2021.5;
s_alive = s_alive_m + s_alive_w ;
sf_2021 = (15117400 * 0.581) / s_alive;  
*Source for Zimbabwe population is https://www.worldometers.info/world-population/zimbabwe-population/ accessed 6/9/2021;
* 58.1% of Zim population in 2020 >= age 15. Source: https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=ZW accessed 6/9/2021;
keep run sf_2021;
proc sort; by run;
*With the following command we can change only here instead of in all the lines below,
in the keep statement, macro par and merge we are still using the variable sf_2019;
%let sf=sf_2021;

data y; 
merge g sf;
by run ;

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;
s_mcirc_1549m = s_mcirc_1519m + s_mcirc_2024m + s_mcirc_2529m + s_mcirc_3034m + s_mcirc_3539m + s_mcirc_4044m + s_mcirc_4549m ;
s_alive = s_alive_m + s_alive_w ;

* n_alive_m;					n_alive_m = s_alive_m * &sf;
* n_alive_w;					n_alive_w = s_alive_w * &sf;
* n_alive;						n_alive = s_alive * &sf;
* n_hiv_m;						n_hiv_m = s_hivge15m * &sf;
* n_hiv_w;						n_hiv_w = s_hivge15w * &sf;
* n_hiv;						n_hiv = s_hivge15 * &sf;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* prevalence1524w;				prevalence1524w = ( s_hiv1519w + s_hiv2024w ) / (s_ageg1519w + s_ageg2024w) ;
* prevalence1524m;				prevalence1524m = ( s_hiv1519m + s_hiv2024m ) / (s_ageg1519m + s_ageg2024m) ;
* prevalence2549w;				prevalence2549w = ( s_hiv2529w + s_hiv3034w +  s_hiv3539w + s_hiv4044w +  s_hiv4549w ) / 
													(s_ageg2529w + s_ageg3034w + s_ageg3539w + s_ageg4044w + s_ageg4549w) ;
* prevalence2549m;				prevalence2549m = ( s_hiv2529m + s_hiv3034m +  s_hiv3539m + s_hiv4044m +  s_hiv4549m ) / 
													(s_ageg2529m + s_ageg3034m + s_ageg3539m + s_ageg4044m + s_ageg4549m) ;

* prevalence_sw;				prevalence_sw = s_hiv_sw / s_sw_1564; 

* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;

* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* incidence1549 ;				incidence1549  = (s_primary1549  * 4 * 100) / (s_alive1549_w + s_alive1549_m - s_hiv1549w - s_hiv1549m + s_primary1549 );

* incidence1524w;				incidence1524w = ((s_primary1519w + s_primary2024w) * 4 * 100) / 
									(s_ageg1519w + s_ageg2024w - s_hiv1519w - s_hiv2024w + s_primary1519w + s_primary2024w);

* incidence2549w;				incidence2549w = ((s_primary2529w + s_primary3034w + s_primary3539w + s_primary4044w + s_primary4549w ) * 4 * 100) / 
									(s_ageg2529w + s_ageg3034w + s_ageg3539w + s_ageg4044w + s_ageg4549w  
									- s_hiv2529w - s_hiv3034w - s_hiv3539w - s_hiv4044w - s_hiv4549w 
									+ s_primary2529w + s_primary3034w + s_primary3539w + s_primary4044w + s_primary4549w
								);

* incidence1524m;				incidence1524m = ((s_primary1519m + s_primary2024m) * 4 * 100) / 
									(s_ageg1519m + s_ageg2024m - s_hiv1519m - s_hiv2024m + s_primary1519m + s_primary2024m);

* incidence2549m;				incidence2549m = ((s_primary2529m + s_primary3034m + s_primary3539m + s_primary4044m + s_primary4549m ) * 4 * 100) / 
									(s_ageg2529m + s_ageg3034m + s_ageg3539m + s_ageg4044m + s_ageg4549m  
									- s_hiv2529m - s_hiv3034m - s_hiv3539m - s_hiv4044m - s_hiv4549m 
									+ s_primary2529m + s_primary3034m + s_primary3539m + s_primary4044m + s_primary4549m
								);

* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = (s_onart_w / s_hivge15w) * 100;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = (s_onart_m / s_hivge15m) * 100;
* p_onart;						p_onart = ((s_onart_m + s_onart_w) / (s_hivge15m + s_hivge15w)) * 100; 
* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;
* n_onart;						n_onart = n_onart_w + n_onart_m;
* p_mcirc_1549m;				p_mcirc_1549m = (s_mcirc_1549m * 100)/ s_ageg1549m ;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w * 100;
* p_diag;						p_diag = (s_diag_w + s_diag_m) / (s_hivge15w + s_hivge15m) ;  p_diag = p_diag * 100;
* p_onart_vl1000_;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = (s_vl1000_art_gt6m_iicu * 100) / s_onart_gt6m_iicu ;
* n_new_inf1549m; 				n_new_inf1549m = s_primary1549m * &sf * 4;
* n_new_inf1549w;				n_new_inf1549w = s_primary1549w * &sf * 4;

* n_new_inf1524w;				n_new_inf1524w = (s_primary1519w + s_primary2024w) * &sf * 4;
* n_new_inf2549w;				n_new_inf2549w = (s_primary2529w + s_primary3034w + s_primary3539w + s_primary4044w + s_primary4549w) * &sf * 4;

* n_new_inf1549 ;				n_new_inf1549  = n_new_inf1549m + n_new_inf1549w ;
* n_death_hiv_m;				n_death_hiv_m = s_death_hiv_m * &sf * 4;
* n_death_hiv_w;				n_death_hiv_w = s_death_hiv_w * &sf * 4;
* n_death_hiv;					n_death_hiv = n_death_hiv_m + n_death_hiv_w ;
* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
* n_death_2059;					n_death_2059 = n_death_2059_m + n_death_2059_w;
* n_death;						n_death = s_dead_allage  * 4 * &sf;

* n_tested_m;					n_tested_m = s_tested_m * &sf * 4;
* n_tested_w;					n_tested_w = s_tested_f * &sf * 4;
* n_tested  ;					n_tested   = n_tested_w + n_tested_m ;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = (s_diag_this_period * 100) / s_tested;
* n_diag;						n_diag = s_diag * &sf ;
* n_diag_w;						n_diag_w = s_diag_w * &sf ;
* n_diag_m;						n_diag_m = s_diag_m * &sf ;

keep run option cald n_alive_m n_alive_w n_alive n_hiv_m n_hiv_w n_hiv
prevalence1549m prevalence1549w prevalence1549 prevalence_hiv_preg p_onart_w p_onart_m p_onart  n_onart_w n_onart_m n_onart p_mcirc_1549m p_diag_w 
p_diag_m p_diag p_onart_vl1000_ incidence1549w incidence1549m incidence1549  n_new_inf1549m n_new_inf1549w n_new_inf1549 n_death_hiv_m n_death_hiv_w 
n_death_hiv n_death_2059_w n_death_2059_m n_tested_m n_tested_w test_prop_positive n_death_2059 n_tested
prevalence1524w prevalence1524m prevalence2549w prevalence2549m prevalence_sw n_death 
n_new_inf1524w n_new_inf2549w incidence1524w  incidence2549w incidence1524m  incidence2549m n_diag  n_diag_m  n_diag_w
;

  options nomprint;
  option nospool;

%macro var(v=);

proc univariate noprint data=y; var &v; output out=y_9091 mean= &v._9091 ; by run ; where 1990.5 <= cald < 1991.5; 
proc univariate noprint data=y_9091; var &v._9091; output out=t_9091 median= &v._9091_med pctlpts=2.5 97.5 pctlpre= &v._9091_; 
proc transpose data=t_9091 out = r_9091; data e_9091; set r_9091; y9091 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9192 mean= &v._9192 ; by run ; where 1991.5 <= cald < 1992.5; 
proc univariate noprint data=y_9192; var &v._9192; output out=t_9192 median= &v._9192_med pctlpts=2.5 97.5 pctlpre= &v._9192_; 
proc transpose data=t_9192 out = r_9192; data e_9192; set r_9192; y9192 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9293 mean= &v._9293 ; by run ; where 1992.5 <= cald < 1993.5; 
proc univariate noprint data=y_9293; var &v._9293; output out=t_9293 median= &v._9293_med pctlpts=2.5 97.5 pctlpre= &v._9293_; 
proc transpose data=t_9293 out = r_9293; data e_9293; set r_9293; y9293 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9394 mean= &v._9394 ; by run ; where 1993.5 <= cald < 1994.5; 
proc univariate noprint data=y_9394; var &v._9394; output out=t_9394 median= &v._9394_med pctlpts=2.5 97.5 pctlpre= &v._9394_; 
proc transpose data=t_9394 out = r_9394; data e_9394; set r_9394; y9394 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9495 mean= &v._9495 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9495; var &v._9495; output out=t_9495 median= &v._9495_med pctlpts=2.5 97.5 pctlpre= &v._9495_; 
proc transpose data=t_9495 out = r_9495; data e_9495; set r_9495; y9495 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9596 mean= &v._9596 ; by run ; where 1995.5 <= cald < 1996.5; 
proc univariate noprint data=y_9596; var &v._9596; output out=t_9596 median= &v._9596_med pctlpts=2.5 97.5 pctlpre= &v._9596_; 
proc transpose data=t_9596 out = r_9596; data e_9596; set r_9596; y9596 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9697 mean= &v._9697 ; by run ; where 1996.5 <= cald < 1997.5; 
proc univariate noprint data=y_9697; var &v._9697; output out=t_9697 median= &v._9697_med pctlpts=2.5 97.5 pctlpre= &v._9697_; 
proc transpose data=t_9697 out = r_9697; data e_9697; set r_9697; y9697 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9798 mean= &v._9798 ; by run ; where 1997.5 <= cald < 1998.5; 
proc univariate noprint data=y_9798; var &v._9798; output out=t_9798 median= &v._9798_med pctlpts=2.5 97.5 pctlpre= &v._9798_; 
proc transpose data=t_9798 out = r_9798; data e_9798; set r_9798; y9798 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9899 mean= &v._9899 ; by run ; where 1998.5 <= cald < 1999.5; 
proc univariate noprint data=y_9899; var &v._9899; output out=t_9899 median= &v._9899_med pctlpts=2.5 97.5 pctlpre= &v._9899_; 
proc transpose data=t_9899 out = r_9899; data e_9899; set r_9899; y9899 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9900 mean= &v._9900 ; by run ; where 1999.5 <= cald < 2000.5; 
proc univariate noprint data=y_9900; var &v._9900; output out=t_9900 median= &v._9900_med pctlpts=2.5 97.5 pctlpre= &v._9900_; 
proc transpose data=t_9900 out = r_9900; data e_9900; set r_9900; y9900 = COL1; drop _label_ _name_ COL1 ;

proc univariate noprint data=y; var &v; output out=y_0001 mean= &v._0001 ; by run ; where 2000.5 <= cald < 2001.5; 
proc univariate noprint data=y_0001; var &v._0001; output out=t_0001 median= &v._0001_med pctlpts=2.5 97.5 pctlpre= &v._0001_; 
proc transpose data=t_0001 out = r_0001; data e_0001; set r_0001; y0001 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0102 mean= &v._0102 ; by run ; where 2001.5 <= cald < 2002.5; 
proc univariate noprint data=y_0102; var &v._0102; output out=t_0102 median= &v._0102_med pctlpts=2.5 97.5 pctlpre= &v._0102_; 
proc transpose data=t_0102 out = r_0102; data e_0102; set r_0102; y0102 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0203 mean= &v._0203 ; by run ; where 2002.5 <= cald < 2003.5; 
proc univariate noprint data=y_0203; var &v._0203; output out=t_0203 median= &v._0203_med pctlpts=2.5 97.5 pctlpre= &v._0203_; 
proc transpose data=t_0203 out = r_0203; data e_0203; set r_0203; y0203 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0304 mean= &v._0304 ; by run ; where 2003.5 <= cald < 2004.5; 
proc univariate noprint data=y_0304; var &v._0304; output out=t_0304 median= &v._0304_med pctlpts=2.5 97.5 pctlpre= &v._0304_; 
proc transpose data=t_0304 out = r_0304; data e_0304; set r_0304; y0304 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0405 mean= &v._0405 ; by run ; where 2004.5 <= cald < 2005.5; 
proc univariate noprint data=y_0405; var &v._0405; output out=t_0405 median= &v._0405_med pctlpts=2.5 97.5 pctlpre= &v._0405_; 
proc transpose data=t_0405 out = r_0405; data e_0405; set r_0405; y0405 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0506 mean= &v._0506 ; by run ; where 2005.5 <= cald < 2006.5; 
proc univariate noprint data=y_0506; var &v._0506; output out=t_0506 median= &v._0506_med pctlpts=2.5 97.5 pctlpre= &v._0506_; 
proc transpose data=t_0506 out = r_0506; data e_0506; set r_0506; y0506 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0607 mean= &v._0607 ; by run ; where 2006.5 <= cald < 2007.5; 
proc univariate noprint data=y_0607; var &v._0607; output out=t_0607 median= &v._0607_med pctlpts=2.5 97.5 pctlpre= &v._0607_; 
proc transpose data=t_0607 out = r_0607; data e_0607; set r_0607; y0607 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0708 mean= &v._0708 ; by run ; where 2007.5 <= cald < 2008.5; 
proc univariate noprint data=y_0708; var &v._0708; output out=t_0708 median= &v._0708_med pctlpts=2.5 97.5 pctlpre= &v._0708_; 
proc transpose data=t_0708 out = r_0708; data e_0708; set r_0708; y0708 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0809 mean= &v._0809 ; by run ; where 2008.5 <= cald < 2009.5; 
proc univariate noprint data=y_0809; var &v._0809; output out=t_0809 median= &v._0809_med pctlpts=2.5 97.5 pctlpre= &v._0809_; 
proc transpose data=t_0809 out = r_0809; data e_0809; set r_0809; y0809 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_0910 mean= &v._0910 ; by run ; where 2009.5 <= cald < 2010.5; 
proc univariate noprint data=y_0910; var &v._0910; output out=t_0910 median= &v._0910_med pctlpts=2.5 97.5 pctlpre= &v._0910_; 
proc transpose data=t_0910 out = r_0910; data e_0910; set r_0910; y0910 = COL1; drop _label_ _name_ COL1 ;

proc univariate noprint data=y; var &v; output out=y_1011 mean= &v._1011 ; by run ; where 2010.5 <= cald < 2011.5; 
proc univariate noprint data=y_1011; var &v._1011; output out=t_1011 median= &v._1011_med pctlpts=2.5 97.5 pctlpre= &v._1011_; 
proc transpose data=t_1011 out = r_1011; data e_1011; set r_1011; y1011 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1112 mean= &v._1112 ; by run ; where 2011.5 <= cald < 2012.5; 
proc univariate noprint data=y_1112; var &v._1112; output out=t_1112 median= &v._1112_med pctlpts=2.5 97.5 pctlpre= &v._1112_; 
proc transpose data=t_1112 out = r_1112; data e_1112; set r_1112; y1112 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1213 mean= &v._1213 ; by run ; where 2012.5 <= cald < 2013.5; 
proc univariate noprint data=y_1213; var &v._1213; output out=t_1213 median= &v._1213_med pctlpts=2.5 97.5 pctlpre= &v._1213_; 
proc transpose data=t_1213 out = r_1213; data e_1213; set r_1213; y1213 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1314 mean= &v._1314 ; by run ; where 2013.5 <= cald < 2014.5; 
proc univariate noprint data=y_1314; var &v._1314; output out=t_1314 median= &v._1314_med pctlpts=2.5 97.5 pctlpre= &v._1314_; 
proc transpose data=t_1314 out = r_1314; data e_1314; set r_1314; y1314 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1415 mean= &v._1415 ; by run ; where 2014.5 <= cald < 2015.5; 
proc univariate noprint data=y_1415; var &v._1415; output out=t_1415 median= &v._1415_med pctlpts=2.5 97.5 pctlpre= &v._1415_; 
proc transpose data=t_1415 out = r_1415; data e_1415; set r_1415; y1415 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1516 mean= &v._1516 ; by run ; where 2015.5 <= cald < 2016.5; 
proc univariate noprint data=y_1516; var &v._1516; output out=t_1516 median= &v._1516_med pctlpts=2.5 97.5 pctlpre= &v._1516_; 
proc transpose data=t_1516 out = r_1516; data e_1516; set r_1516; y1516 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1617 mean= &v._1617 ; by run ; where 2016.5 <= cald < 2017.5; 
proc univariate noprint data=y_1617; var &v._1617; output out=t_1617 median= &v._1617_med pctlpts=2.5 97.5 pctlpre= &v._1617_; 
proc transpose data=t_1617 out = r_1617; data e_1617; set r_1617; y1617 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1718 mean= &v._1718 ; by run ; where 2017.5 <= cald < 2018.5; 
proc univariate noprint data=y_1718; var &v._1718; output out=t_1718 median= &v._1718_med pctlpts=2.5 97.5 pctlpre= &v._1718_; 
proc transpose data=t_1718 out = r_1718; data e_1718; set r_1718; y1718 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1819 mean= &v._1819 ; by run ; where 2018.5 <= cald < 2019.5; 
proc univariate noprint data=y_1819; var &v._1819; output out=t_1819 median= &v._1819_med pctlpts=2.5 97.5 pctlpre= &v._1819_; 
proc transpose data=t_1819 out = r_1819; data e_1819; set r_1819; y1819 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_1920 mean= &v._1920 ; by run ; where 2019.5 <= cald < 2020.5; 
proc univariate noprint data=y_1920; var &v._1920; output out=t_1920 median= &v._1920_med pctlpts=2.5 97.5 pctlpre= &v._1920_; 
proc transpose data=t_1920 out = r_1920; data e_1920; set r_1920; y1920 = COL1; drop _label_ _name_ COL1 ;

proc univariate noprint data=y; var &v; output out=y_2021 mean= &v._2021 ; by run ; where 2020.5 <= cald < 2021.5; 
proc univariate noprint data=y_2021; var &v._2021; output out=t_2021 median= &v._2021_med pctlpts=2.5 97.5 pctlpre= &v._2021_; 
proc transpose data=t_2021 out = r_2021; data e_2021; set r_2021; y2021 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2122 mean= &v._2122 ; by run ; where 2021.5 <= cald < 2022.5; 
proc univariate noprint data=y_2122; var &v._2122; output out=t_2122 median= &v._2122_med pctlpts=2.5 97.5 pctlpre= &v._2122_; 
proc transpose data=t_2122 out = r_2122; data e_2122; set r_2122; y2122 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2223 mean= &v._2223 ; by run ; where 2022.5 <= cald < 2023.5; 
proc univariate noprint data=y_2223; var &v._2223; output out=t_2223 median= &v._2223_med pctlpts=2.5 97.5 pctlpre= &v._2223_; 
proc transpose data=t_2223 out = r_2223; data e_2223; set r_2223; y2223 = COL1; drop _label_ _name_ COL1 ;
proc univariat
e noprint data=y; var &v; output out=y_2324 mean= &v._2324 ; by run ; where 2023.5 <= cald < 2024.5; 
proc univariate noprint data=y_2324; var &v._2324; output out=t_2324 median= &v._2324_med pctlpts=2.5 97.5 pctlpre= &v._2324_; 
proc transpose data=t_2324 out = r_2324; data e_2324; set r_2324; y2324 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2425 mean= &v._2425 ; by run ; where 2024.5 <= cald < 2025.5; 
proc univariate noprint data=y_2425; var &v._2425; output out=t_2425 median= &v._2425_med pctlpts=2.5 97.5 pctlpre= &v._2425_; 
proc transpose data=t_2425 out = r_2425; data e_2425; set r_2425; y2425 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2526 mean= &v._2526 ; by run ; where 2025.5 <= cald < 2026.5; 
proc univariate noprint data=y_2526; var &v._2526; output out=t_2526 median= &v._2526_med pctlpts=2.5 97.5 pctlpre= &v._2526_; 
proc transpose data=t_2526 out = r_2526; data e_2526; set r_2526; y2526 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2627 mean= &v._2627 ; by run ; where 2026.5 <= cald < 2027.5; 
proc univariate noprint data=y_2627; var &v._2627; output out=t_2627 median= &v._2627_med pctlpts=2.5 97.5 pctlpre= &v._2627_; 
proc transpose data=t_2627 out = r_2627; data e_2627; set r_2627; y2627 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2728 mean= &v._2728 ; by run ; where 2027.5 <= cald < 2028.5; 
proc univariate noprint data=y_2728; var &v._2728; output out=t_2728 median= &v._2728_med pctlpts=2.5 97.5 pctlpre= &v._2728_; 
proc transpose data=t_2728 out = r_2728; data e_2728; set r_2728; y2728 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2829 mean= &v._2829 ; by run ; where 2028.5 <= cald < 2029.5; 
proc univariate noprint data=y_2829; var &v._2829; output out=t_2829 median= &v._2829_med pctlpts=2.5 97.5 pctlpre= &v._2829_; 
proc transpose data=t_2829 out = r_2829; data e_2829; set r_2829; y2829 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_2930 mean= &v._2930 ; by run ; where 2029.5 <= cald < 2030.5; 
proc univariate noprint data=y_2930; var &v._2930; output out=t_2930 median= &v._2930_med pctlpts=2.5 97.5 pctlpre= &v._2930_; 
proc transpose data=t_2930 out = r_2930; data e_2930; set r_2930; y2930 = COL1; drop _label_ _name_ COL1 ;

proc univariate noprint data=y; var &v; output out=y_3031 mean= &v._3031 ; by run ; where 2030.5 <= cald < 2031.5; 
proc univariate noprint data=y_3031; var &v._3031; output out=t_3031 median= &v._3031_med pctlpts=2.5 97.5 pctlpre= &v._3031_; 
proc transpose data=t_3031 out = r_3031; data e_3031; set r_3031; y3031 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3132 mean= &v._3132 ; by run ; where 2031.5 <= cald < 2032.5; 
proc univariate noprint data=y_3132; var &v._3132; output out=t_3132 median= &v._3132_med pctlpts=2.5 97.5 pctlpre= &v._3132_; 
proc transpose data=t_3132 out = r_3132; data e_3132; set r_3132; y3132 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3233 mean= &v._3233 ; by run ; where 2032.5 <= cald < 2033.5; 
proc univariate noprint data=y_3233; var &v._3233; output out=t_3233 median= &v._3233_med pctlpts=2.5 97.5 pctlpre= &v._3233_; 
proc transpose data=t_3233 out = r_3233; data e_3233; set r_3233; y3233 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3334 mean= &v._3334 ; by run ; where 2033.5 <= cald < 2034.5; 
proc univariate noprint data=y_3334; var &v._3334; output out=t_3334 median= &v._3334_med pctlpts=2.5 97.5 pctlpre= &v._3334_; 
proc transpose data=t_3334 out = r_3334; data e_3334; set r_3334; y3334 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3435 mean= &v._3435 ; by run ; where 2034.5 <= cald < 2035.5; 
proc univariate noprint data=y_3435; var &v._3435; output out=t_3435 median= &v._3435_med pctlpts=2.5 97.5 pctlpre= &v._3435_; 
proc transpose data=t_3435 out = r_3435; data e_3435; set r_3435; y3435 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3536 mean= &v._3536 ; by run ; where 2035.5 <= cald < 2036.5; 
proc univariate noprint data=y_3536; var &v._3536; output out=t_3536 median= &v._3536_med pctlpts=2.5 97.5 pctlpre= &v._3536_; 
proc transpose data=t_3536 out = r_3536; data e_3536; set r_3536; y3536 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3637 mean= &v._3637 ; by run ; where 2036.5 <= cald < 2037.5; 
proc univariate noprint data=y_3637; var &v._3637; output out=t_3637 median= &v._3637_med pctlpts=2.5 97.5 pctlpre= &v._3637_; 
proc transpose data=t_3637 out = r_3637; data e_3637; set r_3637; y3637 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3738 mean= &v._3738 ; by run ; where 2037.5 <= cald < 2038.5; 
proc univariate noprint data=y_3738; var &v._3738; output out=t_3738 median= &v._3738_med pctlpts=2.5 97.5 pctlpre= &v._3738_; 
proc transpose data=t_3738 out = r_3738; data e_3738; set r_3738; y3738 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3839 mean= &v._3839 ; by run ; where 2038.5 <= cald < 2039.5; 
proc univariate noprint data=y_3839; var &v._3839; output out=t_3839 median= &v._3839_med pctlpts=2.5 97.5 pctlpre= &v._3839_; 
proc transpose data=t_3839 out = r_3839; data e_3839; set r_3839; y3839 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3940 mean= &v._3940 ; by run ; where 2039.5 <= cald < 2040.5; 
proc univariate noprint data=y_3940; var &v._3940; output out=t_3940 median= &v._3940_med pctlpts=2.5 97.5 pctlpre= &v._3940_; 
proc transpose data=t_3940 out = r_3940; data e_3940; set r_3940; y3940 = COL1; drop _label_ _name_ COL1 ;

proc univariate noprint data=y; var &v; output out=y_4041 mean= &v._4041 ; by run ; where 2040.5 <= cald < 2041.5; 
proc univariate noprint data=y_4041; var &v._4041; output out=t_4041 median= &v._4041_med pctlpts=2.5 97.5 pctlpre= &v._4041_; 
proc transpose data=t_4041 out = r_4041; data e_4041; set r_4041; y4041 = COL1; drop _label_ _name_ COL1 ;



proc univariate noprint data=y; var &v; output out=y_90   mean= &v._90   ; by run ; where cald = 1990.5; 
proc univariate noprint data=y_90  ; var &v._90  ; output out=t_90   median= &v._90  _med pctlpts=2.5 97.5 pctlpre= &v._90_; 
proc transpose data=t_90 out = r_90; data e_90; set r_90; y90 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_91   mean= &v._91   ; by run ; where cald = 1991.5; 
proc univariate noprint data=y_91  ; var &v._91  ; output out=t_91   median= &v._91  _med pctlpts=2.5 97.5 pctlpre= &v._91_; 
proc transpose data=t_91 out = r_91; data e_91; set r_91; y91 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_92   mean= &v._92   ; by run ; where cald = 1992.5; 
proc univariate noprint data=y_92  ; var &v._92  ; output out=t_92   median= &v._92  _med pctlpts=2.5 97.5 pctlpre= &v._92_; 
proc transpose data=t_92 out = r_92; data e_92; set r_92; y92 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_93   mean= &v._93   ; by run ; where cald = 1993.5; 
proc univariate noprint data=y_93  ; var &v._93  ; output out=t_93   median= &v._93  _med pctlpts=2.5 97.5 pctlpre= &v._93_; 
proc transpose data=t_93 out = r_93; data e_93; set r_93; y93 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_94   mean= &v._94   ; by run ; where cald = 1994.5; 
proc univariate noprint data=y_94  ; var &v._94  ; output out=t_94   median= &v._94  _med pctlpts=2.5 97.5 pctlpre= &v._94_; 
proc transpose data=t_94 out = r_94; data e_94; set r_94; y94 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_95   mean= &v._95   ; by run ; where cald = 1995.5; 
proc univariate noprint data=y_95  ; var &v._95  ; output out=t_95   median= &v._95  _med pctlpts=2.5 97.5 pctlpre= &v._95_; 
proc transpose data=t_95 out = r_95; data e_95; set r_95; y95 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_96   mean= &v._96   ; by run ; where cald = 1996.5; 
proc univariate noprint data=y_96  ; var &v._96  ; output out=t_96   median= &v._96  _med pctlpts=2.5 97.5 pctlpre= &v._96_; 
proc transpose data=t_96 out = r_96; data e_96; set r_96; y96 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_97   mean= &v._97   ; by run ; where cald = 1997.5; 
proc univariate noprint data=y_97  ; var &v._97  ; output out=t_97   median= &v._97  _med pctlpts=2.5 97.5 pctlpre= &v._97_; 
proc transpose data=t_97 out = r_97; data e_97; set r_97; y97 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_98   mean= &v._98   ; by run ; where cald = 1998.5; 
proc univariate noprint data=y_98  ; var &v._98  ; output out=t_98   median= &v._98  _med pctlpts=2.5 97.5 pctlpre= &v._98_; 
proc transpose data=t_98 out = r_98; data e_98; set r_98; y98 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_99   mean= &v._99   ; by run ; where cald = 1999.5; 
proc univariate noprint data=y_99  ; var &v._99  ; output out=t_99   median= &v._99  _med pctlpts=2.5 97.5 pctlpre= &v._99_; 
proc transpose data=t_99 out = r_99; data e_99; set r_99; y99 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_00   mean= &v._00   ; by run ; where cald = 2000.5; 
proc univariate noprint data=y_00  ; var &v._00  ; output out=t_00   median= &v._00  _med pctlpts=2.5 97.5 pctlpre= &v._00_; 
proc transpose data=t_00 out = r_00; data e_00; set r_00; y00 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_01   mean= &v._01   ; by run ; where cald = 2001.5; 
proc univariate noprint data=y_01  ; var &v._01  ; output out=t_01   median= &v._01  _med pctlpts=2.5 97.5 pctlpre= &v._01_; 
proc transpose data=t_01 out = r_01; data e_01; set r_01; y01 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_02   mean= &v._02   ; by run ; where cald = 2002.5; 
proc univariate noprint data=y_02  ; var &v._02  ; output out=t_02   median= &v._02  _med pctlpts=2.5 97.5 pctlpre= &v._02_; 
proc transpose data=t_02 out = r_02; data e_02; set r_02; y02 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_03   mean= &v._03   ; by run ; where cald = 2003.5; 
proc univariate noprint data=y_03  ; var &v._03  ; output out=t_03   median= &v._03  _med pctlpts=2.5 97.5 pctlpre= &v._03_; 
proc transpose data=t_03 out = r_03; data e_03; set r_03; y03 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_04   mean= &v._04   ; by run ; where cald = 2004.5; 
proc univariate noprint data=y_04  ; var &v._04  ; output out=t_04   median= &v._04  _med pctlpts=2.5 97.5 pctlpre= &v._04_; 
proc transpose data=t_04 out = r_04; data e_04; set r_04; y04 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_05   mean= &v._05   ; by run ; where cald = 2005.5; 
proc univariate noprint data=y_05  ; var &v._05  ; output out=t_05   median= &v._05  _med pctlpts=2.5 97.5 pctlpre= &v._05_; 
proc transpose data=t_05 out = r_05; data e_05; set r_05; y05 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_06   mean= &v._06   ; by run ; where cald = 2006.5; 
proc univariate noprint data=y_06  ; var &v._06  ; output out=t_06   median= &v._06  _med pctlpts=2.5 97.5 pctlpre= &v._06_; 
proc transpose data=t_06 out = r_06; data e_06; set r_06; y06 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_07   mean= &v._07   ; by run ; where cald = 2007.5; 
proc univariate noprint data=y_07  ; var &v._07  ; output out=t_07   median= &v._07  _med pctlpts=2.5 97.5 pctlpre= &v._07_; 
proc transpose data=t_07 out = r_07; data e_07; set r_07; y07 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_08   mean= &v._08   ; by run ; where cald = 2008.5; 
proc univariate noprint data=y_08  ; var &v._08  ; output out=t_08   median= &v._08  _med pctlpts=2.5 97.5 pctlpre= &v._08_; 
proc transpose data=t_08 out = r_08; data e_08; set r_08; y08 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_09   mean= &v._09   ; by run ; where cald = 2009.5; 
proc univariate noprint data=y_09  ; var &v._09  ; output out=t_09   median= &v._09  _med pctlpts=2.5 97.5 pctlpre= &v._09_; 
proc transpose data=t_09 out = r_09; data e_09; set r_09; y09 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_10   mean= &v._10   ; by run ; where cald = 2010.5; 
proc univariate noprint data=y_10  ; var &v._10  ; output out=t_10   median= &v._10  _med pctlpts=2.5 97.5 pctlpre= &v._10_; 
proc transpose data=t_10 out = r_10; data e_10; set r_10; y10 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_11   mean= &v._11   ; by run ; where cald = 2011.5; 
proc univariate noprint data=y_11  ; var &v._11  ; output out=t_11   median= &v._11  _med pctlpts=2.5 97.5 pctlpre= &v._11_; 
proc transpose data=t_11 out = r_11; data e_11; set r_11; y11 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_12   mean= &v._12   ; by run ; where cald = 2012.5; 
proc univariate noprint data=y_12  ; var &v._12  ; output out=t_12   median= &v._12  _med pctlpts=2.5 97.5 pctlpre= &v._12_; 
proc transpose data=t_12 out = r_12; data e_12; set r_12; y12 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_13   mean= &v._13   ; by run ; where cald = 2013.5; 
proc univariate noprint data=y_13  ; var &v._13  ; output out=t_13   median= &v._13  _med pctlpts=2.5 97.5 pctlpre= &v._13_; 
proc transpose data=t_13 out = r_13; data e_13; set r_13; y13 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_14   mean= &v._14   ; by run ; where cald = 2014.5; 
proc univariate noprint data=y_14  ; var &v._14  ; output out=t_14   median= &v._14  _med pctlpts=2.5 97.5 pctlpre= &v._14_; 
proc transpose data=t_14 out = r_14; data e_14; set r_14; y14 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_15   mean= &v._15   ; by run ; where cald = 2015.5; 
proc univariate noprint data=y_15  ; var &v._15  ; output out=t_15   median= &v._15  _med pctlpts=2.5 97.5 pctlpre= &v._15_; 
proc transpose data=t_15 out = r_15; data e_15; set r_15; y15 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_16   mean= &v._16   ; by run ; where cald = 2016.5; 
proc univariate noprint data=y_16  ; var &v._16  ; output out=t_16   median= &v._16  _med pctlpts=2.5 97.5 pctlpre= &v._16_; 
proc transpose data=t_16 out = r_16; data e_16; set r_16; y16 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_17   mean= &v._17   ; by run ; where cald = 2017.5; 
proc univariate noprint data=y_17  ; var &v._17  ; output out=t_17   median= &v._17  _med pctlpts=2.5 97.5 pctlpre= &v._17_; 
proc transpose data=t_17 out = r_17; data e_17; set r_17; y17 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_18   mean= &v._18   ; by run ; where cald = 2018.5; 
proc univariate noprint data=y_18  ; var &v._18  ; output out=t_18   median= &v._18  _med pctlpts=2.5 97.5 pctlpre= &v._18_; 
proc transpose data=t_18 out = r_18; data e_18; set r_18; y18 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_19   mean= &v._19   ; by run ; where cald = 2019.5; 
proc univariate noprint data=y_19  ; var &v._19  ; output out=t_19   median= &v._19  _med pctlpts=2.5 97.5 pctlpre= &v._19_; 
proc transpose data=t_19 out = r_19; data e_19; set r_19; y19 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_20   mean= &v._20   ; by run ; where cald = 2020.5; 
proc univariate noprint data=y_20  ; var &v._20  ; output out=t_20   median= &v._20  _med pctlpts=2.5 97.5 pctlpre= &v._20_; 
proc transpose data=t_20 out = r_20; data e_20; set r_20; y20 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_21   mean= &v._21   ; by run ; where cald = 2021.5; 
proc univariate noprint data=y_21  ; var &v._21  ; output out=t_21   median= &v._21  _med pctlpts=2.5 97.5 pctlpre= &v._21_; 
proc transpose data=t_21 out = r_21; data e_21; set r_21; y21 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_22   mean= &v._22   ; by run ; where cald = 2022.5; 
proc univariate noprint data=y_22  ; var &v._22  ; output out=t_22   median= &v._22  _med pctlpts=2.5 97.5 pctlpre= &v._22_; 
proc transpose data=t_22 out = r_22; data e_22; set r_22; y22 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_23   mean= &v._23   ; by run ; where cald = 2023.5; 
proc univariate noprint data=y_23  ; var &v._23  ; output out=t_23   median= &v._23  _med pctlpts=2.5 97.5 pctlpre= &v._23_; 
proc transpose data=t_23 out = r_23; data e_23; set r_23; y23 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_24   mean= &v._24   ; by run ; where cald = 2024.5; 
proc univariate noprint data=y_24  ; var &v._24  ; output out=t_24   median= &v._24  _med pctlpts=2.5 97.5 pctlpre= &v._24_; 
proc transpose data=t_24 out = r_24; data e_24; set r_24; y24 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_25   mean= &v._25   ; by run ; where cald = 2025.5; 
proc univariate noprint data=y_25  ; var &v._25  ; output out=t_25   median= &v._25  _med pctlpts=2.5 97.5 pctlpre= &v._25_; 
proc transpose data=t_25 out = r_25; data e_25; set r_25; y25 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_26   mean= &v._26   ; by run ; where cald = 2026.5; 
proc univariate noprint data=y_26  ; var &v._26  ; output out=t_26   median= &v._26  _med pctlpts=2.5 97.5 pctlpre= &v._26_; 
proc transpose data=t_26 out = r_26; data e_26; set r_26; y26 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_27   mean= &v._27   ; by run ; where cald = 2027.5; 
proc univariate noprint data=y_27  ; var &v._27  ; output out=t_27   median= &v._27  _med pctlpts=2.5 97.5 pctlpre= &v._27_; 
proc transpose data=t_27 out = r_27; data e_27; set r_27; y27 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_28   mean= &v._28   ; by run ; where cald = 2028.5; 
proc univariate noprint data=y_28  ; var &v._28  ; output out=t_28   median= &v._28  _med pctlpts=2.5 97.5 pctlpre= &v._28_; 
proc transpose data=t_28 out = r_28; data e_28; set r_28; y28 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_29   mean= &v._29   ; by run ; where cald = 2029.5; 
proc univariate noprint data=y_29  ; var &v._29  ; output out=t_29   median= &v._29  _med pctlpts=2.5 97.5 pctlpre= &v._29_; 
proc transpose data=t_29 out = r_29; data e_29; set r_29; y29 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_30   mean= &v._30   ; by run ; where cald = 2030.5; 
proc univariate noprint data=y_30  ; var &v._30  ; output out=t_30   median= &v._30  _med pctlpts=2.5 97.5 pctlpre= &v._30_; 
proc transpose data=t_30 out = r_30; data e_30; set r_30; y30 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_31   mean= &v._31   ; by run ; where cald = 2031.5; 
proc univariate noprint data=y_31  ; var &v._31  ; output out=t_31   median= &v._31  _med pctlpts=2.5 97.5 pctlpre= &v._31_; 
proc transpose data=t_31 out = r_31; data e_31; set r_31; y31 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_32   mean= &v._32   ; by run ; where cald = 2032.5; 
proc univariate noprint data=y_32  ; var &v._32  ; output out=t_32   median= &v._32  _med pctlpts=2.5 97.5 pctlpre= &v._32_; 
proc transpose data=t_32 out = r_32; data e_32; set r_32; y32 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_33   mean= &v._33   ; by run ; where cald = 2033.5; 
proc univariate noprint data=y_33  ; var &v._33  ; output out=t_33   median= &v._33  _med pctlpts=2.5 97.5 pctlpre= &v._33_; 
proc transpose data=t_33 out = r_33; data e_33; set r_33; y33 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_34   mean= &v._34   ; by run ; where cald = 2034.5; 
proc univariate noprint data=y_34  ; var &v._34  ; output out=t_34   median= &v._34  _med pctlpts=2.5 97.5 pctlpre= &v._34_; 
proc transpose data=t_34 out = r_34; data e_34; set r_34; y34 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_35   mean= &v._35   ; by run ; where cald = 2035.5; 
proc univariate noprint data=y_35  ; var &v._35  ; output out=t_35   median= &v._35  _med pctlpts=2.5 97.5 pctlpre= &v._35_; 
proc transpose data=t_35 out = r_35; data e_35; set r_35; y35 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_36   mean= &v._36   ; by run ; where cald = 2036.5; 
proc univariate noprint data=y_36  ; var &v._36  ; output out=t_36   median= &v._36  _med pctlpts=2.5 97.5 pctlpre= &v._36_; 
proc transpose data=t_36 out = r_36; data e_36; set r_36; y36 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_37   mean= &v._37   ; by run ; where cald = 2037.5; 
proc univariate noprint data=y_37  ; var &v._37  ; output out=t_37   median= &v._37  _med pctlpts=2.5 97.5 pctlpre= &v._37_; 
proc transpose data=t_37 out = r_37; data e_37; set r_37; y37 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_38   mean= &v._38   ; by run ; where cald = 2038.5; 
proc univariate noprint data=y_38  ; var &v._38  ; output out=t_38   median= &v._38  _med pctlpts=2.5 97.5 pctlpre= &v._38_; 
proc transpose data=t_38 out = r_38; data e_38; set r_38; y38 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_39   mean= &v._39   ; by run ; where cald = 2039.5; 
proc univariate noprint data=y_39  ; var &v._39  ; output out=t_39   median= &v._39  _med pctlpts=2.5 97.5 pctlpre= &v._39_; 
proc transpose data=t_39 out = r_39; data e_39; set r_39; y39 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_40   mean= &v._40   ; by run ; where cald = 2040.5; 
proc univariate noprint data=y_40  ; var &v._40  ; output out=t_40   median= &v._40  _med pctlpts=2.5 97.5 pctlpre= &v._40_; 
proc transpose data=t_40 out = r_40; data e_40; set r_40; y40 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_41   mean= &v._41   ; by run ; where cald = 2041.5; 
proc univariate noprint data=y_41  ; var &v._41  ; output out=t_41   median= &v._41  _med pctlpts=2.5 97.5 pctlpre= &v._41_; 
proc transpose data=t_41 out = r_41; data e_41; set r_41; y41 = COL1; drop _label_ _name_ COL1 ;


data &v; merge e_9091 e_9192 e_9293 e_9394 e_9495 e_9596 e_9697 e_9798 e_9899 e_9900 e_0001 e_0102 e_0203 e_0304 e_0405 e_0506 e_0607 e_0708 
e_0809 e_0910 e_1011 e_1112 e_1213 e_1314 e_1415 e_1516 e_1617 e_1718 e_1819 e_1920 e_2021 e_2122 e_2223 e_2324 e_2425 e_2526 e_2627 e_2728 
e_2829 e_2930 e_3031 e_3132 e_3233 e_3334 e_3435 e_3536 e_3637 e_3738 e_3839 e_3940 e_4041

e_90 e_91 e_92 e_93 e_94 e_95 e_96 e_97 e_98 e_99 e_00 e_01 e_02 e_03 e_04 e_05 e_06 e_07 
e_08 e_09 e_10 e_11 e_12 e_13 e_14 e_15 e_16 e_17 e_18 e_19 e_20 e_21 e_22 e_23 e_24 e_25 e_26 e_27 
e_28 e_29 e_30 e_31 e_32 e_33 e_34 e_35 e_36 e_37 e_38 e_39 e_40

;

%mend var;

%var(v=n_hiv  ); 

/*

%var(v=n_alive_m);  %var(v=n_hiv_w);  
%var(v=prevalence1549m);%var(v=prevalence1549w);%var(v = test_prop_positive );
%var(v=p_mcirc_1549m);  %var(v=p_diag_w);  %var(v=p_diag_m);  %var(v=p_onart_vl1000_); %var(v=incidence1549w); 
%var(v=incidence1549m); %var(v=incidence1549 ); %var(v=n_new_inf1549m); %var(v=n_new_inf1549w); 
%var(v=n_death_2059_w); %var(v=n_death_2059_m); %var(v=n_tested_m); %var(v=n_tested_w);  %var(v=test_prop_positive);
%var(v=prevalence_hiv_preg); %var(v=p_onart_w); %var(v=p_onart_m); %var(v=p_onart); %var(v=n_onart_w); %var(v=n_onart_m);  %var(v=p_diag_w); 
%var(v=p_diag_m); %var(v=p_onart_vl1000);  %var(v=n_new_inf1549m); %var(v=n_new_inf1549w); %var(v=n_new_inf1549); %var(v=n_death_hiv_m); 
%var(v=n_death_hiv_w); %var(v=n_death_hiv); %var(v=n_death_2059);
%var(v=prevalence1524w);  %var(v=prevalence1524m);  %var(v=prevalence2549w);  %var(v=prevalence2549m);  %var(v=prevalence_sw); 

*/


/*
prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m p_mcirc_1549m 
p_diag_w p_diag_m p_onart_vl1000_ incidence1549w incidence1549m n_new_inf1549m n_new_inf1549w n_death_hiv_m n_death_hiv_w 
n_death_2059_w n_death_2059_m n_tested_m n_tested_w test_prop_positive;
*/


ods html;
title '';
proc print noobs;
var 
y9091 y9192 y9293 y9394 y9495 y9596 y9697 y9798 y9899 y9900 y0001 y0102 y0203 y0304 y0405 y0506 y0607 y0708 
y0809 y0910 y1011 y1112 y1213 y1314 y1415 y1516 y1617 y1718 y1819 y1920 y2021 y2122 y2223 y2324 y2425 y2526 y2627 y2728 
y2829 y2930 y3031 y3132 y3233 y3334 y3435 y3536 y3637 y3738 y3839 y3940 y4041 ;
run;
ods html close;


ods html;
title '';
proc print noobs;
var 
y90 y91 y92 y93 y94 y95 y96 y97 y98 y99 y00 y01 y02 y03 y04 y05 y06 y07 
y08 y09 y10 y11 y12 y13 y14 y15 y16 y17 y18 y19 y20 y21 y22 y23 y24 y25 y26 y27 
y28 y29 y30 y31 y32 y33 y34 y35 y36 y37 y38 y39 y40;
run;
ods html close;





