

libname a "C:\Users\Toshiba\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\malawi\";

data g; set  a.base_sa_32 ;

proc sort data=g; 
by run cald option;run;


* calculate the scale factor for the run, based on 1000000 / s_alive in 2019 ;
data sf;

set g ;

if cald=2021.5;
s_alive = s_alive_m + s_alive_w ;
sf_2021 = 58500000 / s_alive;
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

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence_hiv_preg;			prevalence_hiv_preg = s_hiv_pregnant / s_pregnant ;
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);
* p_onart_w;					if s_hivge15w gt 0 then p_onart_w = s_onart_w / s_hivge15w;
* p_onart_m;					if s_hivge15m gt 0 then p_onart_m = s_onart_m / s_hivge15m;
* n_onart_w;					n_onart_w = s_onart_w * &sf;
* n_onart_m;					n_onart_m = s_onart_m * &sf;
* p_mcirc_1549m;				p_mcirc_1549m = s_mcirc_1549m / s_ageg1549m ;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w * 100;
* p_onart_vl1000_;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu ;
* n_new_inf1549m; 				n_new_inf1549m = s_primary1549m * &sf * 4;
* n_new_inf1549w;				n_new_inf1549w = s_primary1549w * &sf * 4;
* n_death_hiv_m;				n_death_hiv_m = s_death_hiv_m * &sf * 4;
* n_death_hiv_w;				n_death_hiv_w = s_death_hiv_w * &sf * 4;
* n_death_2059_m;				n_death_2059_m = 	(s_dead2024m_all+ s_dead2529m_all+ s_dead3034m_all+ s_dead3539m_all+
													s_dead4044m_all+ s_dead4549m_all+ s_dead5054m_all+ s_dead5559m_all)  * 4 * &sf ;
* n_death_2059_w;				n_death_2059_w = 	(s_dead2024w_all+ s_dead2529w_all+ s_dead3034w_all+ s_dead3539w_all+
													s_dead4044w_all+ s_dead4549w_all+ s_dead5054w_all+ s_dead5559w_all) * 4 * &sf ;
* n_tested_m;					n_tested_m = s_tested_m * &sf * 4;
* n_tested_w;					n_tested_w = s_tested_f * &sf * 4;
* test_prop_positive;			if s_tested gt 0 then test_prop_positive = s_diag_this_period / s_tested;


keep run option cald 

prevalence1549m prevalence1549w prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m p_mcirc_1549m p_diag_w p_diag_m p_onart_vl1000_
incidence1549w incidence1549m n_new_inf1549m n_new_inf1549w n_death_hiv_m n_death_hiv_w n_death_2059_w n_death_2059_m n_tested_m n_tested_w
test_prop_positive

;

  options nomprint;
  option nospool;

%macro var(v=);

proc univariate noprint data=y; var &v; output out=y_9091 mean= &v._9091 ; by run ; where 1990.5 <= cald < 1991.5; 
proc univariate noprint data=y_9091; var &v._9091; output out=t_9091 median= &v._9091_med pctlpts=2.5 97.5 pctlpre= &v._9091_; 
proc transpose data=t_9091 out = r_9091; data e_9091; set r_9091; y9091 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9192 mean= &v._9192 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9192; var &v._9192; output out=t_9192 median= &v._9192_med pctlpts=2.5 97.5 pctlpre= &v._9192_; 
proc transpose data=t_9192 out = r_9192; data e_9192; set r_9192; y9192 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9293 mean= &v._9293 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9293; var &v._9293; output out=t_9293 median= &v._9293_med pctlpts=2.5 97.5 pctlpre= &v._9293_; 
proc transpose data=t_9293 out = r_9293; data e_9293; set r_9293; y9293 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9394 mean= &v._9394 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9394; var &v._9394; output out=t_9394 median= &v._9394_med pctlpts=2.5 97.5 pctlpre= &v._9394_; 
proc transpose data=t_9394 out = r_9394; data e_9394; set r_9394; y9394 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9495 mean= &v._9495 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9495; var &v._9495; output out=t_9495 median= &v._9495_med pctlpts=2.5 97.5 pctlpre= &v._9495_; 
proc transpose data=t_9495 out = r_9495; data e_9495; set r_9495; y9495 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9596 mean= &v._9596 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9596; var &v._9596; output out=t_9596 median= &v._9596_med pctlpts=2.5 97.5 pctlpre= &v._9596_; 
proc transpose data=t_9596 out = r_9596; data e_9596; set r_9596; y9596 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9697 mean= &v._9697 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9697; var &v._9697; output out=t_9697 median= &v._9697_med pctlpts=2.5 97.5 pctlpre= &v._9697_; 
proc transpose data=t_9697 out = r_9697; data e_9697; set r_9697; y9697 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9798 mean= &v._9798 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9798; var &v._9798; output out=t_9798 median= &v._9798_med pctlpts=2.5 97.5 pctlpre= &v._9798_; 
proc transpose data=t_9798 out = r_9798; data e_9798; set r_9798; y9798 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9899 mean= &v._9899 ; by run ; where 1994.5 <= cald < 1995.5; 
proc univariate noprint data=y_9899; var &v._9899; output out=t_9899 median= &v._9899_med pctlpts=2.5 97.5 pctlpre= &v._9899_; 
proc transpose data=t_9899 out = r_9899; data e_9899; set r_9899; y9899 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_9900 mean= &v._9900 ; by run ; where 1994.5 <= cald < 1995.5; 
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
proc univariate noprint data=y; var &v; output out=y_2324 mean= &v._2324 ; by run ; where 2023.5 <= cald < 2024.5; 
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
proc univariate noprint data=y_2829; var &v._2819; output out=t_2829 median= &v._2829_med pctlpts=2.5 97.5 pctlpre= &v._2829_; 
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
proc univariate noprint data=y; var &v; output out=y_3223 mean= &v._3233 ; by run ; where 2032.5 <= cald < 2033.5; 
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
proc univariate noprint data=y_3839; var &v._3819; output out=t_3839 median= &v._3839_med pctlpts=2.5 97.5 pctlpre= &v._3839_; 
proc transpose data=t_3839 out = r_3839; data e_3839; set r_3839; y3839 = COL1; drop _label_ _name_ COL1 ;
proc univariate noprint data=y; var &v; output out=y_3930 mean= &v._3930 ; by run ; where 2039.5 <= cald < 2040.5; 
proc univariate noprint data=y_3930; var &v._3930; output out=t_3930 median= &v._3940_med pctlpts=2.5 97.5 pctlpre= &v._3940_; 
proc transpose data=t_3940 out = r_3940; data e_3940; set r_3940; y3940 = COL1; drop _label_ _name_ COL1 ;

proc univariate noprint data=y; var &v; output out=y_4041 mean= &v._4041 ; by run ; where 2040.5 <= cald < 2041.5; 
proc univariate noprint data=y_4041; var &v._4041; output out=t_4041 median= &v._4041_med pctlpts=2.5 97.5 pctlpre= &v._4041_; 
proc transpose data=t_4041 out = r_4041; data e_4041; set r_4041; y4041 = COL1; drop _label_ _name_ COL1 ;

data &v; merge e9091 e9192 e9293 e9394 e9495 e9596 e_9697 e_9798 e_9899 e_9900 e_0001 e_0102 e_0203 e_0304 e_0405 e_0506 e_0607 e_0708 e_0809 e_0910 
e_1011 e_1112 e_1213 e_1314 e_1415 e_1516 e_1617 e_1718 e_1819 e_1920 e_2021 e_2122 e_2223 e_2324 e_2425 e_2526 e_2627 e_2728 e_2829 e_2930 
e_3031 e_3132 e_3233 e_3334 e_3435 e_3536 e_3637 e_3738 e_3839 e_3940 e_4041

;

%mend var;

%var(v=prevalence1549w); 

/*

%var(v=prevalence1549m);
%var(v=p_mcirc_1549m);  %var(v=p_diag_w);  %var(v=p_diag_m);  %var(v=p_onart_vl1000_); %var(v=incidence1549w); 
%var(v=incidence1549m); %var(v=n_new_inf1549m); %var(v=n_new_inf1549w); %var(v=n_death_hiv_m); %var(v=n_death_hiv_w); 
%var(v=n_death_2059_w); %var(v=n_death_2059_m); %var(v=n_tested_m); %var(v=n_tested_w);  %var(v=test_prop_positive);
%var(v=prevalence_hiv_preg); %var(v=p_onart_w); %var(v=p_onart_m); %var(v=n_onart_w); %var(v=n_onart_m);  %var(v=p_diag_w); 
%var(v=p_diag_m); %var(v=p_onart_vl1000);  %var(v=n_new_inf1549m); %var(v=n_new_inf1549w); %var(v=n_death_hiv_m); 
%var(v=n_death_hiv_w); 

*/


/*
prevalence_hiv_preg p_onart_w p_onart_m n_onart_w n_onart_m p_mcirc_1549m 
p_diag_w p_diag_m p_onart_vl1000_ incidence1549w incidence1549m n_new_inf1549m n_new_inf1549w n_death_hiv_m n_death_hiv_w 
n_death_2059_w n_death_2059_m n_tested_m n_tested_w test_prop_positive;
*/

proc print;
run;





/*



proc export 
data=a.wide_misc_ex dbms=xlsx outfile="C:\Users\Toshiba\Dropbox\hiv synthesis ssa unified program\output files\unaids\unaids_synthesis_misc_all_ex_3" replace; run;



*/

