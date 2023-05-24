libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\Deaths Zim\";


data a;
set a.zim_19apr23;
if run=. then delete;

if option ne 0 then delete; *Error in main code where other options were coded in the update statements. Could keep all of them but 
takes ages to run so cut down dataset;
proc sort;by run;run;
proc freq;table cald;run;

data sf;
set a;
 
if cald=2022.5;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = 10000000 / s_alive;
keep s_alive run sf_2022;

proc sort; by run;run;

%let sf=sf_2022;


data y; 
merge a sf;
by run ;

s_primary1564m = s_primary1549m + s_primary5054m + s_primary5559m + s_primary6064m;
s_primary1564w = s_primary1549w + s_primary5054w + s_primary5559w + s_primary6064w;

s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 




* n_alive1564_;					n_alive1564_  = s_alive1564 * &sf;
* n_alive1564_m;				n_alive1564_m = s_alive1564_m * &sf;
* n_alive1564_w;				n_alive1564_w = s_alive1564_w * &sf;

* n_hiv1519_;					n_hiv1519_= (s_hiv1519m + s_hiv1519w) * &sf;
* n_hiv2024_;					n_hiv2024_= (s_hiv2024m + s_hiv2024w) * &sf;
* n_hiv2529_;					n_hiv2529_= (s_hiv2529m + s_hiv2529w) * &sf;
* n_hiv3034_;					n_hiv3034_= (s_hiv3034m + s_hiv3034w) * &sf;
* n_hiv3539_;					n_hiv3539_= (s_hiv3539m + s_hiv3539w) * &sf;
* n_hiv4044_;					n_hiv4044_= (s_hiv4044m + s_hiv4044w) * &sf;
* n_hiv4549_;					n_hiv4549_= (s_hiv4549m + s_hiv4549w) * &sf;
* n_hiv5054_;					n_hiv5054_= (s_hiv5054m + s_hiv5054w) * &sf;
* n_hiv5559_;					n_hiv5559_= (s_hiv5559m + s_hiv5559w) * &sf;
* n_hiv6064_;					n_hiv6064_= (s_hiv6064m + s_hiv6064w) * &sf;
* n_hiv6569_;					n_hiv6569_= (s_hiv6569m + s_hiv6569w) * &sf;
* n_hiv7074_;					n_hiv7074_= (s_hiv7074m + s_hiv7074w) * &sf;
* n_hiv7579_;					n_hiv7579_= (s_hiv7579m + s_hiv7579w) * &sf;
* n_hiv8084_;					n_hiv8084_= (s_hiv8084m + s_hiv8084w) * &sf;


* n_hiv1519m;					n_hiv1519m = s_hiv1519m * &sf;
* n_hiv1519w;					n_hiv1519w = s_hiv1519w * &sf;
* n_hiv2024m;					n_hiv2024m = s_hiv2024m * &sf;
* n_hiv2024w;					n_hiv2024w = s_hiv2024w * &sf;
* n_hiv2529m;					n_hiv2529m = s_hiv2529m * &sf;
* n_hiv2529w;					n_hiv2529w = s_hiv2529w * &sf;
* n_hiv3034m;					n_hiv3034m = s_hiv3034m * &sf;
* n_hiv3034w;					n_hiv3034w = s_hiv3034w * &sf;
* n_hiv3539m;					n_hiv3539m = s_hiv3539m * &sf;
* n_hiv3539w;					n_hiv3539w = s_hiv3539w * &sf;
* n_hiv4044m;					n_hiv4044m = s_hiv4044m * &sf;
* n_hiv4044w;					n_hiv4044w = s_hiv4044w * &sf;
* n_hiv4549m;					n_hiv4549m = s_hiv4549m * &sf;
* n_hiv4549w;					n_hiv4549w = s_hiv4549w * &sf;
* n_hiv5054m;					n_hiv5054m = s_hiv5054m * &sf;
* n_hiv5054w;					n_hiv5054w = s_hiv5054w * &sf;
* n_hiv5559m;					n_hiv5559m = s_hiv5559m * &sf;
* n_hiv5559w;					n_hiv5559w = s_hiv5559w * &sf;
* n_hiv6064m;					n_hiv6064m = s_hiv6064m * &sf;
* n_hiv6064w;					n_hiv6064w = s_hiv6064w * &sf;
* n_hiv6569m;					n_hiv6569m = s_hiv6569m * &sf;
* n_hiv6569w;					n_hiv6569w = s_hiv6569w * &sf;
* n_hiv7074m;					n_hiv7074m = s_hiv7074m * &sf;
* n_hiv7074w;					n_hiv7074w = s_hiv7074w * &sf;
* n_hiv7579m;					n_hiv7579m = s_hiv7579m * &sf;
* n_hiv7579w;					n_hiv7579w = s_hiv7579w * &sf;
* n_hiv8084m;					n_hiv8084m = s_hiv8084m * &sf;
* n_hiv8084w;					n_hiv8084w = s_hiv8084w * &sf;


* prevalence1564;				prevalence1564_ = (s_hiv1564w  + s_hiv1564m ) / (s_alive1564_w + s_alive1564_m);
* prevalence1564m;				prevalence1564m = s_hiv1564m  / s_alive1564_m ;
* prevalence1564w;				prevalence1564w = s_hiv1564w  / s_alive1564_w ;

* incidence1564;                incidence1564_ = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1564_m;              incidence1564_m = (s_primary1564m * 4 * 100) / (s_alive1564_m  - s_hiv1564m  + s_primary1564m);
* incidence1564_w;              incidence1564_w = (s_primary1564w * 4 * 100) / (s_alive1564_w  - s_hiv1564w  + s_primary1564w);

* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000_ = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 

***This is currently all 15+;
* n_hiv_death;					n_hiv_death = s_hiv_death * 4 * &sf;
* n_hiv_death_m;				n_hiv_death_m = s_hiv_death_m * 4 * &sf;
* n_hiv_death_w;				n_hiv_death_w = s_hiv_death_w * 4 * &sf;

/* currently not outputted
* n_hiv_death1519m;				n_hiv_death1519m = s_hiv_death1519m * &sf;
* n_hiv_death1519w;				n_hiv_death1519w = s_hiv_death1519w * &sf;
* n_hiv_death2024m;				n_hiv_death2024m = s_hiv_death2024m * &sf;
* n_hiv_death2024w;				n_hiv_death2024w = s_hiv_death2024w * &sf;
* n_hiv_death2529m;				n_hiv_death2529m = s_hiv_death2529m * &sf;
* n_hiv_death2529w;				n_hiv_death2529w = s_hiv_death2529w * &sf;
* n_hiv_death3034m;				n_hiv_death3034m = s_hiv_death3034m * &sf;
* n_hiv_death3034w;				n_hiv_death3034w = s_hiv_death3034w * &sf;
* n_hiv_death3539m;				n_hiv_death3539m = s_hiv_death3539m * &sf;
* n_hiv_death3539w;				n_hiv_death3539w = s_hiv_death3539w * &sf;
* n_hiv_death4044m;				n_hiv_death4044m = s_hiv_death4044m * &sf;
* n_hiv_death4044w;				n_hiv_death4044w = s_hiv_death4044w * &sf;
* n_hiv_death4549m;				n_hiv_death4549m = s_hiv_death4549m * &sf;
* n_hiv_death4549w;				n_hiv_death4549w = s_hiv_death4549w * &sf;
* n_hiv_death5054m;				n_hiv_death5054m = s_hiv_death5054m * &sf;
* n_hiv_death5054w;				n_hiv_death5054w = s_hiv_death5054w * &sf;
* n_hiv_death5559m;				n_hiv_death5559m = s_hiv_death5559m * &sf;
* n_hiv_death5559w;				n_hiv_death5559w = s_hiv_death5559w * &sf;
* n_hiv_death6064m;				n_hiv_death6064m = s_hiv_death6064m * &sf;
* n_hiv_death6064w;				n_hiv_death6064w = s_hiv_death6064w * &sf;
* n_hiv_death6569m;				n_hiv_death6569m = s_hiv_death6569m * &sf;
* n_hiv_death6569w;				n_hiv_death6569w = s_hiv_death6569w * &sf;
* n_hiv_death7074m;				n_hiv_death7074m = s_hiv_death7074m * &sf;
* n_hiv_death7074w;				n_hiv_death7074w = s_hiv_death7074w * &sf;
* n_hiv_death7579m;				n_hiv_death7579m = s_hiv_death7579m * &sf;
* n_hiv_death7579w;				n_hiv_death7579w = s_hiv_death7579w * &sf;
* n_hiv_death8084m;				n_hiv_death8084m = s_hiv_death8084m * &sf;
* n_hiv_death8084w;				n_hiv_death8084w = s_hiv_death8084w * &sf;
*/
***Rename so variables do not end in a number as this breaks the macro;

s_dead_Alt6_artcd4lt200_ 	= s_dead_Alt6_artcd4lt200;
s_dead_Alt6_artcd4gt200_ 	= s_dead_Alt6_artcd4gt200;
s_dead_I_Alt6_Rcd4lt200_ 	= s_dead_I_Alt6_Rcd4lt200;
s_dead_I_Alt6_Rcd4gt200_ 	= s_dead_I_Alt6_Rcd4gt200;
s_dead_A_vl1000_ 			= s_dead_A_vl1000;
s_dead_A_vg1000_ 			= s_dead_A_vg1000;
s_dead_Alt6_vl1000_ 		= s_dead_Alt6_vl1000;
s_dead_Alt6_vg1000_ 		= s_dead_Alt6_vg1000;
s_dead_Agt6_vl1000_ 		= s_dead_Agt6_vl1000;
s_dead_Agt6_vg1000_ 		= s_dead_Agt6_vg1000; 
s_dead_A_cd4lt200_ 			= s_dead_A_cd4lt200;
s_dead_A_cd4gt200_ 			= s_dead_A_cd4gt200;  
s_dead_Alt6_cd4lt200_ 		= s_dead_Alt6_cd4lt200;
s_dead_Alt6_cd4gt200_ 		= s_dead_Alt6_cd4gt200;
s_dead_Agt6_cd4lt200_ 		= s_dead_Agt6_cd4lt200;
s_dead_Agt6_cd4gt200_ 		= s_dead_Agt6_cd4gt200;

s_dead_Alt6_Acd4lt2001519m = s_dead_Alt6_artcd4lt2001519m; s_dead_Alt6_Acd4lt2002024m = s_dead_Alt6_artcd4lt2002024m;
s_dead_Alt6_Acd4lt2002529m = s_dead_Alt6_artcd4lt2002529m; s_dead_Alt6_Acd4lt2003034m = s_dead_Alt6_artcd4lt2003034m;
s_dead_Alt6_Acd4lt2003539m = s_dead_Alt6_artcd4lt2003539m; s_dead_Alt6_Acd4lt2004044m = s_dead_Alt6_artcd4lt2004044m;
s_dead_Alt6_Acd4lt2004549m = s_dead_Alt6_artcd4lt2004549m; s_dead_Alt6_Acd4lt2005054m = s_dead_Alt6_artcd4lt2005054m;
s_dead_Alt6_Acd4lt2005559m = s_dead_Alt6_artcd4lt2005559m; s_dead_Alt6_Acd4lt2006064m = s_dead_Alt6_artcd4lt2006064m;
s_dead_Alt6_Acd4lt2006569m = s_dead_Alt6_artcd4lt2006569m; s_dead_Alt6_Acd4lt2007074m = s_dead_Alt6_artcd4lt2007074m;
s_dead_Alt6_Acd4lt2007579m = s_dead_Alt6_artcd4lt2007579m; s_dead_Alt6_Acd4lt2008084m = s_dead_Alt6_artcd4lt2008084m;
s_dead_Alt6_Acd4lt2001519w = s_dead_Alt6_artcd4lt2001519w; s_dead_Alt6_Acd4lt2002024w = s_dead_Alt6_artcd4lt2002024w;
s_dead_Alt6_Acd4lt2002529w = s_dead_Alt6_artcd4lt2002529w; s_dead_Alt6_Acd4lt2003034w = s_dead_Alt6_artcd4lt2003034w;
s_dead_Alt6_Acd4lt2003539w = s_dead_Alt6_artcd4lt2003539w; s_dead_Alt6_Acd4lt2004044w = s_dead_Alt6_artcd4lt2004044w;
s_dead_Alt6_Acd4lt2004549w = s_dead_Alt6_artcd4lt2004549w; s_dead_Alt6_Acd4lt2005054w = s_dead_Alt6_artcd4lt2005054w;
s_dead_Alt6_Acd4lt2005559w = s_dead_Alt6_artcd4lt2005559w; s_dead_Alt6_Acd4lt2006064w = s_dead_Alt6_artcd4lt2006064w;
s_dead_Alt6_Acd4lt2006569w = s_dead_Alt6_artcd4lt2006569w; s_dead_Alt6_Acd4lt2007074w = s_dead_Alt6_artcd4lt2007074w;
s_dead_Alt6_Acd4lt2007579w = s_dead_Alt6_artcd4lt2007579w; s_dead_Alt6_Acd4lt2008084w = s_dead_Alt6_artcd4lt2008084w;

s_dead_Alt6_Acd4gt2001519m = s_dead_Alt6_artcd4gt2001519m; s_dead_Alt6_Acd4gt2002024m = s_dead_Alt6_artcd4gt2002024m;
s_dead_Alt6_Acd4gt2002529m = s_dead_Alt6_artcd4gt2002529m; s_dead_Alt6_Acd4gt2003034m = s_dead_Alt6_artcd4gt2003034m;
s_dead_Alt6_Acd4gt2003539m = s_dead_Alt6_artcd4gt2003539m; s_dead_Alt6_Acd4gt2004044m = s_dead_Alt6_artcd4gt2004044m;
s_dead_Alt6_Acd4gt2004549m = s_dead_Alt6_artcd4gt2004549m; s_dead_Alt6_Acd4gt2005054m = s_dead_Alt6_artcd4gt2005054m;
s_dead_Alt6_Acd4gt2005559m = s_dead_Alt6_artcd4gt2005559m; s_dead_Alt6_Acd4gt2006064m = s_dead_Alt6_artcd4gt2006064m;
s_dead_Alt6_Acd4gt2006569m = s_dead_Alt6_artcd4gt2006569m; s_dead_Alt6_Acd4gt2007074m = s_dead_Alt6_artcd4gt2007074m;
s_dead_Alt6_Acd4gt2007579m = s_dead_Alt6_artcd4gt2007579m; s_dead_Alt6_Acd4gt2008084m = s_dead_Alt6_artcd4gt2008084m;
s_dead_Alt6_Acd4gt2001519w = s_dead_Alt6_artcd4gt2001519w; s_dead_Alt6_Acd4gt2002024w = s_dead_Alt6_artcd4gt2002024w;
s_dead_Alt6_Acd4gt2002529w = s_dead_Alt6_artcd4gt2002529w; s_dead_Alt6_Acd4gt2003034w = s_dead_Alt6_artcd4gt2003034w;
s_dead_Alt6_Acd4gt2003539w = s_dead_Alt6_artcd4gt2003539w; s_dead_Alt6_Acd4gt2004044w = s_dead_Alt6_artcd4gt2004044w;
s_dead_Alt6_Acd4gt2004549w = s_dead_Alt6_artcd4gt2004549w; s_dead_Alt6_Acd4gt2005054w = s_dead_Alt6_artcd4gt2005054w;
s_dead_Alt6_Acd4gt2005559w = s_dead_Alt6_artcd4gt2005559w; s_dead_Alt6_Acd4gt2006064w = s_dead_Alt6_artcd4gt2006064w;
s_dead_Alt6_Acd4gt2006569w = s_dead_Alt6_artcd4gt2006569w; s_dead_Alt6_Acd4gt2007074w = s_dead_Alt6_artcd4gt2007074w;
s_dead_Alt6_Acd4gt2007579w = s_dead_Alt6_artcd4gt2007579w; s_dead_Alt6_Acd4gt2008084w = s_dead_Alt6_artcd4gt2008084w;

s_d_I_Alt6_Rcd4lt2001519m = s_dead_I_Alt6_Rcd4lt2001519m; s_d_I_Alt6_Rcd4lt2002024m = s_dead_I_Alt6_Rcd4lt2002024m;
s_d_I_Alt6_Rcd4lt2002529m = s_dead_I_Alt6_Rcd4lt2002529m; s_d_I_Alt6_Rcd4lt2003034m = s_dead_I_Alt6_Rcd4lt2003034m;
s_d_I_Alt6_Rcd4lt2003539m = s_dead_I_Alt6_Rcd4lt2003539m; s_d_I_Alt6_Rcd4lt2004044m = s_dead_I_Alt6_Rcd4lt2004044m;
s_d_I_Alt6_Rcd4lt2004549m = s_dead_I_Alt6_Rcd4lt2004549m; s_d_I_Alt6_Rcd4lt2005054m = s_dead_I_Alt6_Rcd4lt2005054m;
s_d_I_Alt6_Rcd4lt2005559m = s_dead_I_Alt6_Rcd4lt2005559m; s_d_I_Alt6_Rcd4lt2006064m = s_dead_I_Alt6_Rcd4lt2006064m;
s_d_I_Alt6_Rcd4lt2006569m = s_dead_I_Alt6_Rcd4lt2006569m; s_d_I_Alt6_Rcd4lt2007074m = s_dead_I_Alt6_Rcd4lt2007074m;
s_d_I_Alt6_Rcd4lt2007579m = s_dead_I_Alt6_Rcd4lt2007579m; s_d_I_Alt6_Rcd4lt2008084m = s_dead_I_Alt6_Rcd4lt2008084m;
s_d_I_Alt6_Rcd4lt2001519w = s_dead_I_Alt6_Rcd4lt2001519w; s_d_I_Alt6_Rcd4lt2002024w = s_dead_I_Alt6_Rcd4lt2002024w;
s_d_I_Alt6_Rcd4lt2002529w = s_dead_I_Alt6_Rcd4lt2002529w; s_d_I_Alt6_Rcd4lt2003034w = s_dead_I_Alt6_Rcd4lt2003034w;
s_d_I_Alt6_Rcd4lt2003539w = s_dead_I_Alt6_Rcd4lt2003539w; s_d_I_Alt6_Rcd4lt2004044w = s_dead_I_Alt6_Rcd4lt2004044w;
s_d_I_Alt6_Rcd4lt2004549w = s_dead_I_Alt6_Rcd4lt2004549w; s_d_I_Alt6_Rcd4lt2005054w = s_dead_I_Alt6_Rcd4lt2005054w;
s_d_I_Alt6_Rcd4lt2005559w = s_dead_I_Alt6_Rcd4lt2005559w; s_d_I_Alt6_Rcd4lt2006064w = s_dead_I_Alt6_Rcd4lt2006064w;
s_d_I_Alt6_Rcd4lt2006569w = s_dead_I_Alt6_Rcd4lt2006569w; s_d_I_Alt6_Rcd4lt2007074w = s_dead_I_Alt6_Rcd4lt2007074w;
s_d_I_Alt6_Rcd4lt2007579w = s_dead_I_Alt6_Rcd4lt2007579w; s_d_I_Alt6_Rcd4lt2008084w = s_dead_I_Alt6_Rcd4lt2008084w;

s_d_I_Alt6_Rcd4gt2001519m = s_dead_I_Alt6_Rcd4gt2001519m; s_d_I_Alt6_Rcd4gt2002024m = s_dead_I_Alt6_Rcd4gt2002024m;
s_d_I_Alt6_Rcd4gt2002529m = s_dead_I_Alt6_Rcd4gt2002529m; s_d_I_Alt6_Rcd4gt2003034m = s_dead_I_Alt6_Rcd4gt2003034m;
s_d_I_Alt6_Rcd4gt2003539m = s_dead_I_Alt6_Rcd4gt2003539m; s_d_I_Alt6_Rcd4gt2004044m = s_dead_I_Alt6_Rcd4gt2004044m;
s_d_I_Alt6_Rcd4gt2004549m = s_dead_I_Alt6_Rcd4gt2004549m; s_d_I_Alt6_Rcd4gt2005054m = s_dead_I_Alt6_Rcd4gt2005054m;
s_d_I_Alt6_Rcd4gt2005559m = s_dead_I_Alt6_Rcd4gt2005559m; s_d_I_Alt6_Rcd4gt2006064m = s_dead_I_Alt6_Rcd4gt2006064m;
s_d_I_Alt6_Rcd4gt2006569m = s_dead_I_Alt6_Rcd4gt2006569m; s_d_I_Alt6_Rcd4gt2007074m = s_dead_I_Alt6_Rcd4gt2007074m;
s_d_I_Alt6_Rcd4gt2007579m = s_dead_I_Alt6_Rcd4gt2007579m; s_d_I_Alt6_Rcd4gt2008084m = s_dead_I_Alt6_Rcd4gt2008084m;
s_d_I_Alt6_Rcd4gt2001519w = s_dead_I_Alt6_Rcd4gt2001519w; s_d_I_Alt6_Rcd4gt2002024w = s_dead_I_Alt6_Rcd4gt2002024w;
s_d_I_Alt6_Rcd4gt2002529w = s_dead_I_Alt6_Rcd4gt2002529w; s_d_I_Alt6_Rcd4gt2003034w = s_dead_I_Alt6_Rcd4gt2003034w;
s_d_I_Alt6_Rcd4gt2003539w = s_dead_I_Alt6_Rcd4gt2003539w; s_d_I_Alt6_Rcd4gt2004044w = s_dead_I_Alt6_Rcd4gt2004044w;
s_d_I_Alt6_Rcd4gt2004549w = s_dead_I_Alt6_Rcd4gt2004549w; s_d_I_Alt6_Rcd4gt2005054w = s_dead_I_Alt6_Rcd4gt2005054w;
s_d_I_Alt6_Rcd4gt2005559w = s_dead_I_Alt6_Rcd4gt2005559w; s_d_I_Alt6_Rcd4gt2006064w = s_dead_I_Alt6_Rcd4gt2006064w;
s_d_I_Alt6_Rcd4gt2006569w = s_dead_I_Alt6_Rcd4gt2006569w; s_d_I_Alt6_Rcd4gt2007074w = s_dead_I_Alt6_Rcd4gt2007074w;
s_d_I_Alt6_Rcd4gt2007579w = s_dead_I_Alt6_Rcd4gt2007579w; s_d_I_Alt6_Rcd4gt2008084w = s_dead_I_Alt6_Rcd4gt2008084w;


****Create sums per age group;
s_dead_undiag1519_ = s_dead_undiag1519m + s_dead_undiag1519w; s_dead_undiag2024_ = s_dead_undiag2024m + s_dead_undiag2024w;
s_dead_undiag2529_ = s_dead_undiag2529m + s_dead_undiag2529w; s_dead_undiag3034_ = s_dead_undiag3034m + s_dead_undiag3034w;
s_dead_undiag3539_ = s_dead_undiag3539m + s_dead_undiag3539w; s_dead_undiag4044_ = s_dead_undiag4044m + s_dead_undiag4044w;
s_dead_undiag4549_ = s_dead_undiag4549m + s_dead_undiag4549w; s_dead_undiag5054_ = s_dead_undiag5054m + s_dead_undiag5054w;
s_dead_undiag5559_ = s_dead_undiag5559m + s_dead_undiag5559w; s_dead_undiag6064_ = s_dead_undiag6064m + s_dead_undiag6064w;
s_dead_undiag6569_ = s_dead_undiag6569m + s_dead_undiag6569w; s_dead_undiag7074_ = s_dead_undiag7074m + s_dead_undiag7074w;
s_dead_undiag7579_ = s_dead_undiag7579m + s_dead_undiag7579w; s_dead_undiag8084_ = s_dead_undiag8084m + s_dead_undiag8084w;

s_dead_diag_not_linked1519_ = s_dead_diag_not_linked1519m + s_dead_diag_not_linked1519w; s_dead_diag_not_linked2024_ = s_dead_diag_not_linked2024m + s_dead_diag_not_linked2024w;
s_dead_diag_not_linked2529_ = s_dead_diag_not_linked2529m + s_dead_diag_not_linked2529w; s_dead_diag_not_linked3034_ = s_dead_diag_not_linked3034m + s_dead_diag_not_linked3034w;
s_dead_diag_not_linked3539_ = s_dead_diag_not_linked3539m + s_dead_diag_not_linked3539w; s_dead_diag_not_linked4044_ = s_dead_diag_not_linked4044m + s_dead_diag_not_linked4044w;
s_dead_diag_not_linked4549_ = s_dead_diag_not_linked4549m + s_dead_diag_not_linked4549w; s_dead_diag_not_linked5054_ = s_dead_diag_not_linked5054m + s_dead_diag_not_linked5054w;
s_dead_diag_not_linked5559_ = s_dead_diag_not_linked5559m + s_dead_diag_not_linked5559w; s_dead_diag_not_linked6064_ = s_dead_diag_not_linked6064m + s_dead_diag_not_linked6064w;
s_dead_diag_not_linked6569_ = s_dead_diag_not_linked6569m + s_dead_diag_not_linked6569w; s_dead_diag_not_linked7074_ = s_dead_diag_not_linked7074m + s_dead_diag_not_linked7074w;
s_dead_diag_not_linked7579_ = s_dead_diag_not_linked7579m + s_dead_diag_not_linked7579w; s_dead_diag_not_linked8084_ = s_dead_diag_not_linked8084m + s_dead_diag_not_linked8084w;

s_dead_Alt6_Acd4lt2001519_ = s_dead_Alt6_Acd4lt2001519m + s_dead_Alt6_Acd4lt2001519w; s_dead_Alt6_Acd4lt2002024_ = s_dead_Alt6_Acd4lt2002024m + s_dead_Alt6_Acd4lt2002024w;
s_dead_Alt6_Acd4lt2002529_ = s_dead_Alt6_Acd4lt2002529m + s_dead_Alt6_Acd4lt2002529w; s_dead_Alt6_Acd4lt2003034_ = s_dead_Alt6_Acd4lt2003034m + s_dead_Alt6_Acd4lt2003034w;
s_dead_Alt6_Acd4lt2003539_ = s_dead_Alt6_Acd4lt2003539m + s_dead_Alt6_Acd4lt2003539w; s_dead_Alt6_Acd4lt2004044_ = s_dead_Alt6_Acd4lt2004044m + s_dead_Alt6_Acd4lt2004044w;
s_dead_Alt6_Acd4lt2004549_ = s_dead_Alt6_Acd4lt2004549m + s_dead_Alt6_Acd4lt2004549w; s_dead_Alt6_Acd4lt2005054_ = s_dead_Alt6_Acd4lt2005054m + s_dead_Alt6_Acd4lt2005054w;
s_dead_Alt6_Acd4lt2005559_ = s_dead_Alt6_Acd4lt2005559m + s_dead_Alt6_Acd4lt2005559w; s_dead_Alt6_Acd4lt2006064_ = s_dead_Alt6_Acd4lt2006064m + s_dead_Alt6_Acd4lt2006064w;
s_dead_Alt6_Acd4lt2006569_ = s_dead_Alt6_Acd4lt2006569m + s_dead_Alt6_Acd4lt2006569w; s_dead_Alt6_Acd4lt2007074_ = s_dead_Alt6_Acd4lt2007074m + s_dead_Alt6_Acd4lt2007074w;
s_dead_Alt6_Acd4lt2007579_ = s_dead_Alt6_Acd4lt2007579m + s_dead_Alt6_Acd4lt2007579w; s_dead_Alt6_Acd4lt2008084_ = s_dead_Alt6_Acd4lt2008084m + s_dead_Alt6_Acd4lt2008084w;

s_dead_Alt6_Acd4gt2001519_ = s_dead_Alt6_Acd4gt2001519m + s_dead_Alt6_Acd4gt2001519w; s_dead_Alt6_Acd4gt2002024_ = s_dead_Alt6_Acd4gt2002024m + s_dead_Alt6_Acd4gt2002024w;
s_dead_Alt6_Acd4gt2002529_ = s_dead_Alt6_Acd4gt2002529m + s_dead_Alt6_Acd4gt2002529w; s_dead_Alt6_Acd4gt2003034_ = s_dead_Alt6_Acd4gt2003034m + s_dead_Alt6_Acd4gt2003034w;
s_dead_Alt6_Acd4gt2003539_ = s_dead_Alt6_Acd4gt2003539m + s_dead_Alt6_Acd4gt2003539w; s_dead_Alt6_Acd4gt2004044_ = s_dead_Alt6_Acd4gt2004044m + s_dead_Alt6_Acd4gt2004044w;
s_dead_Alt6_Acd4gt2004549_ = s_dead_Alt6_Acd4gt2004549m + s_dead_Alt6_Acd4gt2004549w; s_dead_Alt6_Acd4gt2005054_ = s_dead_Alt6_Acd4gt2005054m + s_dead_Alt6_Acd4gt2005054w;
s_dead_Alt6_Acd4gt2005559_ = s_dead_Alt6_Acd4gt2005559m + s_dead_Alt6_Acd4gt2005559w; s_dead_Alt6_Acd4gt2006064_ = s_dead_Alt6_Acd4gt2006064m + s_dead_Alt6_Acd4gt2006064w;
s_dead_Alt6_Acd4gt2006569_ = s_dead_Alt6_Acd4gt2006569m + s_dead_Alt6_Acd4gt2006569w; s_dead_Alt6_Acd4gt2007074_ = s_dead_Alt6_Acd4gt2007074m + s_dead_Alt6_Acd4gt2007074w;
s_dead_Alt6_Acd4gt2007579_ = s_dead_Alt6_Acd4gt2007579m + s_dead_Alt6_Acd4gt2007579w; s_dead_Alt6_Acd4gt2008084_ = s_dead_Alt6_Acd4gt2008084m + s_dead_Alt6_Acd4gt2008084w;

s_d_I_Alt6_Rcd4lt2001519_ = s_d_I_Alt6_Rcd4lt2001519m + s_d_I_Alt6_Rcd4lt2001519w; s_d_I_Alt6_Rcd4lt2002024_ = s_d_I_Alt6_Rcd4lt2002024m + s_d_I_Alt6_Rcd4lt2002024w;
s_d_I_Alt6_Rcd4lt2002529_ = s_d_I_Alt6_Rcd4lt2002529m + s_d_I_Alt6_Rcd4lt2002529w; s_d_I_Alt6_Rcd4lt2003034_ = s_d_I_Alt6_Rcd4lt2003034m + s_d_I_Alt6_Rcd4lt2003034w;
s_d_I_Alt6_Rcd4lt2003539_ = s_d_I_Alt6_Rcd4lt2003539m + s_d_I_Alt6_Rcd4lt2003539w; s_d_I_Alt6_Rcd4lt2004044_ = s_d_I_Alt6_Rcd4lt2004044m + s_d_I_Alt6_Rcd4lt2004044w;
s_d_I_Alt6_Rcd4lt2004549_ = s_d_I_Alt6_Rcd4lt2004549m + s_d_I_Alt6_Rcd4lt2004549w; s_d_I_Alt6_Rcd4lt2005054_ = s_d_I_Alt6_Rcd4lt2005054m + s_d_I_Alt6_Rcd4lt2005054w;
s_d_I_Alt6_Rcd4lt2005559_ = s_d_I_Alt6_Rcd4lt2005559m + s_d_I_Alt6_Rcd4lt2005559w; s_d_I_Alt6_Rcd4lt2006064_ = s_d_I_Alt6_Rcd4lt2006064m + s_d_I_Alt6_Rcd4lt2006064w;
s_d_I_Alt6_Rcd4lt2006569_ = s_d_I_Alt6_Rcd4lt2006569m + s_d_I_Alt6_Rcd4lt2006569w; s_d_I_Alt6_Rcd4lt2007074_ = s_d_I_Alt6_Rcd4lt2007074m + s_d_I_Alt6_Rcd4lt2007074w;
s_d_I_Alt6_Rcd4lt2007579_ = s_d_I_Alt6_Rcd4lt2007579m + s_d_I_Alt6_Rcd4lt2007579w; s_d_I_Alt6_Rcd4lt2008084_ = s_d_I_Alt6_Rcd4lt2008084m + s_d_I_Alt6_Rcd4lt2008084w;

s_d_I_Alt6_Rcd4gt2001519_ = s_d_I_Alt6_Rcd4gt2001519m + s_d_I_Alt6_Rcd4gt2001519w; s_d_I_Alt6_Rcd4gt2002024_ = s_d_I_Alt6_Rcd4gt2002024m + s_d_I_Alt6_Rcd4gt2002024w;
s_d_I_Alt6_Rcd4gt2002529_ = s_d_I_Alt6_Rcd4gt2002529m + s_d_I_Alt6_Rcd4gt2002529w; s_d_I_Alt6_Rcd4gt2003034_ = s_d_I_Alt6_Rcd4gt2003034m + s_d_I_Alt6_Rcd4gt2003034w;
s_d_I_Alt6_Rcd4gt2003539_ = s_d_I_Alt6_Rcd4gt2003539m + s_d_I_Alt6_Rcd4gt2003539w; s_d_I_Alt6_Rcd4gt2004044_ = s_d_I_Alt6_Rcd4gt2004044m + s_d_I_Alt6_Rcd4gt2004044w;
s_d_I_Alt6_Rcd4gt2004549_ = s_d_I_Alt6_Rcd4gt2004549m + s_d_I_Alt6_Rcd4gt2004549w; s_d_I_Alt6_Rcd4gt2005054_ = s_d_I_Alt6_Rcd4gt2005054m + s_d_I_Alt6_Rcd4gt2005054w;
s_d_I_Alt6_Rcd4gt2005559_ = s_d_I_Alt6_Rcd4gt2005559m + s_d_I_Alt6_Rcd4gt2005559w; s_d_I_Alt6_Rcd4gt2006064_ = s_d_I_Alt6_Rcd4gt2006064m + s_d_I_Alt6_Rcd4gt2006064w;
s_d_I_Alt6_Rcd4gt2006569_ = s_d_I_Alt6_Rcd4gt2006569m + s_d_I_Alt6_Rcd4gt2006569w; s_d_I_Alt6_Rcd4gt2007074_ = s_d_I_Alt6_Rcd4gt2007074m + s_d_I_Alt6_Rcd4gt2007074w;
s_d_I_Alt6_Rcd4gt2007579_ = s_d_I_Alt6_Rcd4gt2007579m + s_d_I_Alt6_Rcd4gt2007579w; s_d_I_Alt6_Rcd4gt2008084_ = s_d_I_Alt6_Rcd4gt2008084m + s_d_I_Alt6_Rcd4gt2008084w;

s_dead_A_vl10001519_ = s_dead_A_vl10001519m + s_dead_A_vl10001519w; s_dead_A_vl10002024_ = s_dead_A_vl10002024m + s_dead_A_vl10002024w;
s_dead_A_vl10002529_ = s_dead_A_vl10002529m + s_dead_A_vl10002529w; s_dead_A_vl10003034_ = s_dead_A_vl10003034m + s_dead_A_vl10003034w;
s_dead_A_vl10003539_ = s_dead_A_vl10003539m + s_dead_A_vl10003539w; s_dead_A_vl10004044_ = s_dead_A_vl10004044m + s_dead_A_vl10004044w;
s_dead_A_vl10004549_ = s_dead_A_vl10004549m + s_dead_A_vl10004549w; s_dead_A_vl10005054_ = s_dead_A_vl10005054m + s_dead_A_vl10005054w;
s_dead_A_vl10005559_ = s_dead_A_vl10005559m + s_dead_A_vl10005559w; s_dead_A_vl10006064_ = s_dead_A_vl10006064m + s_dead_A_vl10006064w;
s_dead_A_vl10006569_ = s_dead_A_vl10006569m + s_dead_A_vl10006569w; s_dead_A_vl10007074_ = s_dead_A_vl10007074m + s_dead_A_vl10007074w;
s_dead_A_vl10007579_ = s_dead_A_vl10007579m + s_dead_A_vl10007579w; s_dead_A_vl10008084_ = s_dead_A_vl10008084m + s_dead_A_vl10008084w;

s_dead_A_vg10001519_ = s_dead_A_vg10001519m + s_dead_A_vg10001519w; s_dead_A_vg10002024_ = s_dead_A_vg10002024m + s_dead_A_vg10002024w;
s_dead_A_vg10002529_ = s_dead_A_vg10002529m + s_dead_A_vg10002529w; s_dead_A_vg10003034_ = s_dead_A_vg10003034m + s_dead_A_vg10003034w;
s_dead_A_vg10003539_ = s_dead_A_vg10003539m + s_dead_A_vg10003539w; s_dead_A_vg10004044_ = s_dead_A_vg10004044m + s_dead_A_vg10004044w;
s_dead_A_vg10004549_ = s_dead_A_vg10004549m + s_dead_A_vg10004549w; s_dead_A_vg10005054_ = s_dead_A_vg10005054m + s_dead_A_vg10005054w;
s_dead_A_vg10005559_ = s_dead_A_vg10005559m + s_dead_A_vg10005559w; s_dead_A_vg10006064_ = s_dead_A_vg10006064m + s_dead_A_vg10006064w;
s_dead_A_vg10006569_ = s_dead_A_vg10006569m + s_dead_A_vg10006569w; s_dead_A_vg10007074_ = s_dead_A_vg10007074m + s_dead_A_vg10007074w;
s_dead_A_vg10007579_ = s_dead_A_vg10007579m + s_dead_A_vg10007579w; s_dead_A_vg10008084_ = s_dead_A_vg10008084m + s_dead_A_vg10008084w;

s_dead_Alt6_vl10001519_ = s_dead_Alt6_vl10001519m + s_dead_Alt6_vl10001519w; s_dead_Alt6_vl10002024_ = s_dead_Alt6_vl10002024m + s_dead_Alt6_vl10002024w;
s_dead_Alt6_vl10002529_ = s_dead_Alt6_vl10002529m + s_dead_Alt6_vl10002529w; s_dead_Alt6_vl10003034_ = s_dead_Alt6_vl10003034m + s_dead_Alt6_vl10003034w;
s_dead_Alt6_vl10003539_ = s_dead_Alt6_vl10003539m + s_dead_Alt6_vl10003539w; s_dead_Alt6_vl10004044_ = s_dead_Alt6_vl10004044m + s_dead_Alt6_vl10004044w;
s_dead_Alt6_vl10004549_ = s_dead_Alt6_vl10004549m + s_dead_Alt6_vl10004549w; s_dead_Alt6_vl10005054_ = s_dead_Alt6_vl10005054m + s_dead_Alt6_vl10005054w;
s_dead_Alt6_vl10005559_ = s_dead_Alt6_vl10005559m + s_dead_Alt6_vl10005559w; s_dead_Alt6_vl10006064_ = s_dead_Alt6_vl10006064m + s_dead_Alt6_vl10006064w;
s_dead_Alt6_vl10006569_ = s_dead_Alt6_vl10006569m + s_dead_Alt6_vl10006569w; s_dead_Alt6_vl10007074_ = s_dead_Alt6_vl10007074m + s_dead_Alt6_vl10007074w;
s_dead_Alt6_vl10007579_ = s_dead_Alt6_vl10007579m + s_dead_Alt6_vl10007579w; s_dead_Alt6_vl10008084_ = s_dead_Alt6_vl10008084m + s_dead_Alt6_vl10008084w;

s_dead_Alt6_vg10001519_ = s_dead_Alt6_vg10001519m + s_dead_Alt6_vg10001519w; s_dead_Alt6_vg10002024_ = s_dead_Alt6_vg10002024m + s_dead_Alt6_vg10002024w;
s_dead_Alt6_vg10002529_ = s_dead_Alt6_vg10002529m + s_dead_Alt6_vg10002529w; s_dead_Alt6_vg10003034_ = s_dead_Alt6_vg10003034m + s_dead_Alt6_vg10003034w;
s_dead_Alt6_vg10003539_ = s_dead_Alt6_vg10003539m + s_dead_Alt6_vg10003539w; s_dead_Alt6_vg10004044_ = s_dead_Alt6_vg10004044m + s_dead_Alt6_vg10004044w;
s_dead_Alt6_vg10004549_ = s_dead_Alt6_vg10004549m + s_dead_Alt6_vg10004549w; s_dead_Alt6_vg10005054_ = s_dead_Alt6_vg10005054m + s_dead_Alt6_vg10005054w;
s_dead_Alt6_vg10005559_ = s_dead_Alt6_vg10005559m + s_dead_Alt6_vg10005559w; s_dead_Alt6_vg10006064_ = s_dead_Alt6_vg10006064m + s_dead_Alt6_vg10006064w;
s_dead_Alt6_vg10006569_ = s_dead_Alt6_vg10006569m + s_dead_Alt6_vg10006569w; s_dead_Alt6_vg10007074_ = s_dead_Alt6_vg10007074m + s_dead_Alt6_vg10007074w;
s_dead_Alt6_vg10007579_ = s_dead_Alt6_vg10007579m + s_dead_Alt6_vg10007579w; s_dead_Alt6_vg10008084_ = s_dead_Alt6_vg10008084m + s_dead_Alt6_vg10008084w;

s_dead_Agt6_vl10001519_ = s_dead_Agt6_vl10001519m + s_dead_Agt6_vl10001519w; s_dead_Agt6_vl10002024_ = s_dead_Agt6_vl10002024m + s_dead_Agt6_vl10002024w;
s_dead_Agt6_vl10002529_ = s_dead_Agt6_vl10002529m + s_dead_Agt6_vl10002529w; s_dead_Agt6_vl10003034_ = s_dead_Agt6_vl10003034m + s_dead_Agt6_vl10003034w;
s_dead_Agt6_vl10003539_ = s_dead_Agt6_vl10003539m + s_dead_Agt6_vl10003539w; s_dead_Agt6_vl10004044_ = s_dead_Agt6_vl10004044m + s_dead_Agt6_vl10004044w;
s_dead_Agt6_vl10004549_ = s_dead_Agt6_vl10004549m + s_dead_Agt6_vl10004549w; s_dead_Agt6_vl10005054_ = s_dead_Agt6_vl10005054m + s_dead_Agt6_vl10005054w;
s_dead_Agt6_vl10005559_ = s_dead_Agt6_vl10005559m + s_dead_Agt6_vl10005559w; s_dead_Agt6_vl10006064_ = s_dead_Agt6_vl10006064m + s_dead_Agt6_vl10006064w;
s_dead_Agt6_vl10006569_ = s_dead_Agt6_vl10006569m + s_dead_Agt6_vl10006569w; s_dead_Agt6_vl10007074_ = s_dead_Agt6_vl10007074m + s_dead_Agt6_vl10007074w;
s_dead_Agt6_vl10007579_ = s_dead_Agt6_vl10007579m + s_dead_Agt6_vl10007579w; s_dead_Agt6_vl10008084_ = s_dead_Agt6_vl10008084m + s_dead_Agt6_vl10008084w;

s_dead_Agt6_vg10001519_ = s_dead_Agt6_vg10001519m + s_dead_Agt6_vg10001519w; s_dead_Agt6_vg10002024_ = s_dead_Agt6_vg10002024m + s_dead_Agt6_vg10002024w;
s_dead_Agt6_vg10002529_ = s_dead_Agt6_vg10002529m + s_dead_Agt6_vg10002529w; s_dead_Agt6_vg10003034_ = s_dead_Agt6_vg10003034m + s_dead_Agt6_vg10003034w;
s_dead_Agt6_vg10003539_ = s_dead_Agt6_vg10003539m + s_dead_Agt6_vg10003539w; s_dead_Agt6_vg10004044_ = s_dead_Agt6_vg10004044m + s_dead_Agt6_vg10004044w;
s_dead_Agt6_vg10004549_ = s_dead_Agt6_vg10004549m + s_dead_Agt6_vg10004549w; s_dead_Agt6_vg10005054_ = s_dead_Agt6_vg10005054m + s_dead_Agt6_vg10005054w;
s_dead_Agt6_vg10005559_ = s_dead_Agt6_vg10005559m + s_dead_Agt6_vg10005559w; s_dead_Agt6_vg10006064_ = s_dead_Agt6_vg10006064m + s_dead_Agt6_vg10006064w;
s_dead_Agt6_vg10006569_ = s_dead_Agt6_vg10006569m + s_dead_Agt6_vg10006569w; s_dead_Agt6_vg10007074_ = s_dead_Agt6_vg10007074m + s_dead_Agt6_vg10007074w;
s_dead_Agt6_vg10007579_ = s_dead_Agt6_vg10007579m + s_dead_Agt6_vg10007579w; s_dead_Agt6_vg10008084_ = s_dead_Agt6_vg10008084m + s_dead_Agt6_vg10008084w;

s_dead_int_lost1519_ = s_dead_int_lost1519m + s_dead_int_lost1519w; s_dead_int_lost2024_ = s_dead_int_lost2024m + s_dead_int_lost2024w;
s_dead_int_lost2529_ = s_dead_int_lost2529m + s_dead_int_lost2529w; s_dead_int_lost3034_ = s_dead_int_lost3034m + s_dead_int_lost3034w;
s_dead_int_lost3539_ = s_dead_int_lost3539m + s_dead_int_lost3539w; s_dead_int_lost4044_ = s_dead_int_lost4044m + s_dead_int_lost4044w;
s_dead_int_lost4549_ = s_dead_int_lost4549m + s_dead_int_lost4549w; s_dead_int_lost5054_ = s_dead_int_lost5054m + s_dead_int_lost5054w;
s_dead_int_lost5559_ = s_dead_int_lost5559m + s_dead_int_lost5559w; s_dead_int_lost6064_ = s_dead_int_lost6064m + s_dead_int_lost6064w;
s_dead_int_lost6569_ = s_dead_int_lost6569m + s_dead_int_lost6569w; s_dead_int_lost7074_ = s_dead_int_lost7074m + s_dead_int_lost7074w;
s_dead_int_lost7579_ = s_dead_int_lost7579m + s_dead_int_lost7579w; s_dead_int_lost8084_ = s_dead_int_lost8084m + s_dead_int_lost8084w;

s_dead_1stint_lost1519_ = s_dead_1stint_lost1519m + s_dead_1stint_lost1519w; s_dead_1stint_lost2024_ = s_dead_1stint_lost2024m + s_dead_1stint_lost2024w;
s_dead_1stint_lost2529_ = s_dead_1stint_lost2529m + s_dead_1stint_lost2529w; s_dead_1stint_lost3034_ = s_dead_1stint_lost3034m + s_dead_1stint_lost3034w;
s_dead_1stint_lost3539_ = s_dead_1stint_lost3539m + s_dead_1stint_lost3539w; s_dead_1stint_lost4044_ = s_dead_1stint_lost4044m + s_dead_1stint_lost4044w;
s_dead_1stint_lost4549_ = s_dead_1stint_lost4549m + s_dead_1stint_lost4549w; s_dead_1stint_lost5054_ = s_dead_1stint_lost5054m + s_dead_1stint_lost5054w;
s_dead_1stint_lost5559_ = s_dead_1stint_lost5559m + s_dead_1stint_lost5559w; s_dead_1stint_lost6064_ = s_dead_1stint_lost6064m + s_dead_1stint_lost6064w;
s_dead_1stint_lost6569_ = s_dead_1stint_lost6569m + s_dead_1stint_lost6569w; s_dead_1stint_lost7074_ = s_dead_1stint_lost7074m + s_dead_1stint_lost7074w;
s_dead_1stint_lost7579_ = s_dead_1stint_lost7579m + s_dead_1stint_lost7579w; s_dead_1stint_lost8084_ = s_dead_1stint_lost8084m + s_dead_1stint_lost8084w;

s_dead_subintlt6_lost1519_ = s_dead_subintlt6_lost1519m + s_dead_subintlt6_lost1519w; s_dead_subintlt6_lost2024_ = s_dead_subintlt6_lost2024m + s_dead_subintlt6_lost2024w;
s_dead_subintlt6_lost2529_ = s_dead_subintlt6_lost2529m + s_dead_subintlt6_lost2529w; s_dead_subintlt6_lost3034_ = s_dead_subintlt6_lost3034m + s_dead_subintlt6_lost3034w;
s_dead_subintlt6_lost3539_ = s_dead_subintlt6_lost3539m + s_dead_subintlt6_lost3539w; s_dead_subintlt6_lost4044_ = s_dead_subintlt6_lost4044m + s_dead_subintlt6_lost4044w;
s_dead_subintlt6_lost4549_ = s_dead_subintlt6_lost4549m + s_dead_subintlt6_lost4549w; s_dead_subintlt6_lost5054_ = s_dead_subintlt6_lost5054m + s_dead_subintlt6_lost5054w;
s_dead_subintlt6_lost5559_ = s_dead_subintlt6_lost5559m + s_dead_subintlt6_lost5559w; s_dead_subintlt6_lost6064_ = s_dead_subintlt6_lost6064m + s_dead_subintlt6_lost6064w;
s_dead_subintlt6_lost6569_ = s_dead_subintlt6_lost6569m + s_dead_subintlt6_lost6569w; s_dead_subintlt6_lost7074_ = s_dead_subintlt6_lost7074m + s_dead_subintlt6_lost7074w;
s_dead_subintlt6_lost7579_ = s_dead_subintlt6_lost7579m + s_dead_subintlt6_lost7579w; s_dead_subintlt6_lost8084_ = s_dead_subintlt6_lost8084m + s_dead_subintlt6_lost8084w;

s_dead_subintgt6_lost1519_ = s_dead_subintgt6_lost1519m + s_dead_subintgt6_lost1519w; s_dead_subintgt6_lost2024_ = s_dead_subintgt6_lost2024m + s_dead_subintgt6_lost2024w;
s_dead_subintgt6_lost2529_ = s_dead_subintgt6_lost2529m + s_dead_subintgt6_lost2529w; s_dead_subintgt6_lost3034_ = s_dead_subintgt6_lost3034m + s_dead_subintgt6_lost3034w;
s_dead_subintgt6_lost3539_ = s_dead_subintgt6_lost3539m + s_dead_subintgt6_lost3539w; s_dead_subintgt6_lost4044_ = s_dead_subintgt6_lost4044m + s_dead_subintgt6_lost4044w;
s_dead_subintgt6_lost4549_ = s_dead_subintgt6_lost4549m + s_dead_subintgt6_lost4549w; s_dead_subintgt6_lost5054_ = s_dead_subintgt6_lost5054m + s_dead_subintgt6_lost5054w;
s_dead_subintgt6_lost5559_ = s_dead_subintgt6_lost5559m + s_dead_subintgt6_lost5559w; s_dead_subintgt6_lost6064_ = s_dead_subintgt6_lost6064m + s_dead_subintgt6_lost6064w;
s_dead_subintgt6_lost6569_ = s_dead_subintgt6_lost6569m + s_dead_subintgt6_lost6569w; s_dead_subintgt6_lost7074_ = s_dead_subintgt6_lost7074m + s_dead_subintgt6_lost7074w;
s_dead_subintgt6_lost7579_ = s_dead_subintgt6_lost7579m + s_dead_subintgt6_lost7579w; s_dead_subintgt6_lost8084_ = s_dead_subintgt6_lost8084m + s_dead_subintgt6_lost8084w;


s_dead_A_cd4lt2001519_ = s_dead_A_cd4lt2001519m + s_dead_A_cd4lt2001519w; s_dead_A_cd4lt2002024_ = s_dead_A_cd4lt2002024m + s_dead_A_cd4lt2002024w;
s_dead_A_cd4lt2002529_ = s_dead_A_cd4lt2002529m + s_dead_A_cd4lt2002529w; s_dead_A_cd4lt2003034_ = s_dead_A_cd4lt2003034m + s_dead_A_cd4lt2003034w;
s_dead_A_cd4lt2003539_ = s_dead_A_cd4lt2003539m + s_dead_A_cd4lt2003539w; s_dead_A_cd4lt2004044_ = s_dead_A_cd4lt2004044m + s_dead_A_cd4lt2004044w;
s_dead_A_cd4lt2004549_ = s_dead_A_cd4lt2004549m + s_dead_A_cd4lt2004549w; s_dead_A_cd4lt2005054_ = s_dead_A_cd4lt2005054m + s_dead_A_cd4lt2005054w;
s_dead_A_cd4lt2005559_ = s_dead_A_cd4lt2005559m + s_dead_A_cd4lt2005559w; s_dead_A_cd4lt2006064_ = s_dead_A_cd4lt2006064m + s_dead_A_cd4lt2006064w;
s_dead_A_cd4lt2006569_ = s_dead_A_cd4lt2006569m + s_dead_A_cd4lt2006569w; s_dead_A_cd4lt2007074_ = s_dead_A_cd4lt2007074m + s_dead_A_cd4lt2007074w;
s_dead_A_cd4lt2007579_ = s_dead_A_cd4lt2007579m + s_dead_A_cd4lt2007579w; s_dead_A_cd4lt2008084_ = s_dead_A_cd4lt2008084m + s_dead_A_cd4lt2008084w;

s_dead_A_cd4gt2001519_ = s_dead_A_cd4gt2001519m + s_dead_A_cd4gt2001519w; s_dead_A_cd4gt2002024_ = s_dead_A_cd4gt2002024m + s_dead_A_cd4gt2002024w;
s_dead_A_cd4gt2002529_ = s_dead_A_cd4gt2002529m + s_dead_A_cd4gt2002529w; s_dead_A_cd4gt2003034_ = s_dead_A_cd4gt2003034m + s_dead_A_cd4gt2003034w;
s_dead_A_cd4gt2003539_ = s_dead_A_cd4gt2003539m + s_dead_A_cd4gt2003539w; s_dead_A_cd4gt2004044_ = s_dead_A_cd4gt2004044m + s_dead_A_cd4gt2004044w;
s_dead_A_cd4gt2004549_ = s_dead_A_cd4gt2004549m + s_dead_A_cd4gt2004549w; s_dead_A_cd4gt2005054_ = s_dead_A_cd4gt2005054m + s_dead_A_cd4gt2005054w;
s_dead_A_cd4gt2005559_ = s_dead_A_cd4gt2005559m + s_dead_A_cd4gt2005559w; s_dead_A_cd4gt2006064_ = s_dead_A_cd4gt2006064m + s_dead_A_cd4gt2006064w;
s_dead_A_cd4gt2006569_ = s_dead_A_cd4gt2006569m + s_dead_A_cd4gt2006569w; s_dead_A_cd4gt2007074_ = s_dead_A_cd4gt2007074m + s_dead_A_cd4gt2007074w;
s_dead_A_cd4gt2007579_ = s_dead_A_cd4gt2007579m + s_dead_A_cd4gt2007579w; s_dead_A_cd4gt2008084_ = s_dead_A_cd4gt2008084m + s_dead_A_cd4gt2008084w;
  
s_dead_Alt6_cd4lt2001519_ = s_dead_Alt6_cd4lt2001519m + s_dead_Alt6_cd4lt2001519w; s_dead_Alt6_cd4lt2002024_ = s_dead_Alt6_cd4lt2002024m + s_dead_Alt6_cd4lt2002024w;
s_dead_Alt6_cd4lt2002529_ = s_dead_Alt6_cd4lt2002529m + s_dead_Alt6_cd4lt2002529w; s_dead_Alt6_cd4lt2003034_ = s_dead_Alt6_cd4lt2003034m + s_dead_Alt6_cd4lt2003034w;
s_dead_Alt6_cd4lt2003539_ = s_dead_Alt6_cd4lt2003539m + s_dead_Alt6_cd4lt2003539w; s_dead_Alt6_cd4lt2004044_ = s_dead_Alt6_cd4lt2004044m + s_dead_Alt6_cd4lt2004044w;
s_dead_Alt6_cd4lt2004549_ = s_dead_Alt6_cd4lt2004549m + s_dead_Alt6_cd4lt2004549w; s_dead_Alt6_cd4lt2005054_ = s_dead_Alt6_cd4lt2005054m + s_dead_Alt6_cd4lt2005054w;
s_dead_Alt6_cd4lt2005559_ = s_dead_Alt6_cd4lt2005559m + s_dead_Alt6_cd4lt2005559w; s_dead_Alt6_cd4lt2006064_ = s_dead_Alt6_cd4lt2006064m + s_dead_Alt6_cd4lt2006064w;
s_dead_Alt6_cd4lt2006569_ = s_dead_Alt6_cd4lt2006569m + s_dead_Alt6_cd4lt2006569w; s_dead_Alt6_cd4lt2007074_ = s_dead_Alt6_cd4lt2007074m + s_dead_Alt6_cd4lt2007074w;
s_dead_Alt6_cd4lt2007579_ = s_dead_Alt6_cd4lt2007579m + s_dead_Alt6_cd4lt2007579w; s_dead_Alt6_cd4lt2008084_ = s_dead_Alt6_cd4lt2008084m + s_dead_Alt6_cd4lt2008084w;

s_dead_Alt6_cd4gt2001519_ = s_dead_Alt6_cd4gt2001519m + s_dead_Alt6_cd4gt2001519w; s_dead_Alt6_cd4gt2002024_ = s_dead_Alt6_cd4gt2002024m + s_dead_Alt6_cd4gt2002024w;
s_dead_Alt6_cd4gt2002529_ = s_dead_Alt6_cd4gt2002529m + s_dead_Alt6_cd4gt2002529w; s_dead_Alt6_cd4gt2003034_ = s_dead_Alt6_cd4gt2003034m + s_dead_Alt6_cd4gt2003034w;
s_dead_Alt6_cd4gt2003539_ = s_dead_Alt6_cd4gt2003539m + s_dead_Alt6_cd4gt2003539w; s_dead_Alt6_cd4gt2004044_ = s_dead_Alt6_cd4gt2004044m + s_dead_Alt6_cd4gt2004044w;
s_dead_Alt6_cd4gt2004549_ = s_dead_Alt6_cd4gt2004549m + s_dead_Alt6_cd4gt2004549w; s_dead_Alt6_cd4gt2005054_ = s_dead_Alt6_cd4gt2005054m + s_dead_Alt6_cd4gt2005054w;
s_dead_Alt6_cd4gt2005559_ = s_dead_Alt6_cd4gt2005559m + s_dead_Alt6_cd4gt2005559w; s_dead_Alt6_cd4gt2006064_ = s_dead_Alt6_cd4gt2006064m + s_dead_Alt6_cd4gt2006064w;
s_dead_Alt6_cd4gt2006569_ = s_dead_Alt6_cd4gt2006569m + s_dead_Alt6_cd4gt2006569w; s_dead_Alt6_cd4gt2007074_ = s_dead_Alt6_cd4gt2007074m + s_dead_Alt6_cd4gt2007074w;
s_dead_Alt6_cd4gt2007579_ = s_dead_Alt6_cd4gt2007579m + s_dead_Alt6_cd4gt2007579w; s_dead_Alt6_cd4gt2008084_ = s_dead_Alt6_cd4gt2008084m + s_dead_Alt6_cd4gt2008084w;

s_dead_Agt6_cd4lt2001519_ = s_dead_Agt6_cd4lt2001519m + s_dead_Agt6_cd4lt2001519w; s_dead_Agt6_cd4lt2002024_ = s_dead_Agt6_cd4lt2002024m + s_dead_Agt6_cd4lt2002024w;
s_dead_Agt6_cd4lt2002529_ = s_dead_Agt6_cd4lt2002529m + s_dead_Agt6_cd4lt2002529w; s_dead_Agt6_cd4lt2003034_ = s_dead_Agt6_cd4lt2003034m + s_dead_Agt6_cd4lt2003034w;
s_dead_Agt6_cd4lt2003539_ = s_dead_Agt6_cd4lt2003539m + s_dead_Agt6_cd4lt2003539w; s_dead_Agt6_cd4lt2004044_ = s_dead_Agt6_cd4lt2004044m + s_dead_Agt6_cd4lt2004044w;
s_dead_Agt6_cd4lt2004549_ = s_dead_Agt6_cd4lt2004549m + s_dead_Agt6_cd4lt2004549w; s_dead_Agt6_cd4lt2005054_ = s_dead_Agt6_cd4lt2005054m + s_dead_Agt6_cd4lt2005054w;
s_dead_Agt6_cd4lt2005559_ = s_dead_Agt6_cd4lt2005559m + s_dead_Agt6_cd4lt2005559w; s_dead_Agt6_cd4lt2006064_ = s_dead_Agt6_cd4lt2006064m + s_dead_Agt6_cd4lt2006064w;
s_dead_Agt6_cd4lt2006569_ = s_dead_Agt6_cd4lt2006569m + s_dead_Agt6_cd4lt2006569w; s_dead_Agt6_cd4lt2007074_ = s_dead_Agt6_cd4lt2007074m + s_dead_Agt6_cd4lt2007074w;
s_dead_Agt6_cd4lt2007579_ = s_dead_Agt6_cd4lt2007579m + s_dead_Agt6_cd4lt2007579w; s_dead_Agt6_cd4lt2008084_ = s_dead_Agt6_cd4lt2008084m + s_dead_Agt6_cd4lt2008084w;

s_dead_Agt6_cd4gt2001519_ = s_dead_Agt6_cd4gt2001519m + s_dead_Agt6_cd4gt2001519w; s_dead_Agt6_cd4gt2002024_ = s_dead_Agt6_cd4gt2002024m + s_dead_Agt6_cd4gt2002024w;
s_dead_Agt6_cd4gt2002529_ = s_dead_Agt6_cd4gt2002529m + s_dead_Agt6_cd4gt2002529w; s_dead_Agt6_cd4gt2003034_ = s_dead_Agt6_cd4gt2003034m + s_dead_Agt6_cd4gt2003034w;
s_dead_Agt6_cd4gt2003539_ = s_dead_Agt6_cd4gt2003539m + s_dead_Agt6_cd4gt2003539w; s_dead_Agt6_cd4gt2004044_ = s_dead_Agt6_cd4gt2004044m + s_dead_Agt6_cd4gt2004044w;
s_dead_Agt6_cd4gt2004549_ = s_dead_Agt6_cd4gt2004549m + s_dead_Agt6_cd4gt2004549w; s_dead_Agt6_cd4gt2005054_ = s_dead_Agt6_cd4gt2005054m + s_dead_Agt6_cd4gt2005054w;
s_dead_Agt6_cd4gt2005559_ = s_dead_Agt6_cd4gt2005559m + s_dead_Agt6_cd4gt2005559w; s_dead_Agt6_cd4gt2006064_ = s_dead_Agt6_cd4gt2006064m + s_dead_Agt6_cd4gt2006064w;
s_dead_Agt6_cd4gt2006569_ = s_dead_Agt6_cd4gt2006569m + s_dead_Agt6_cd4gt2006569w; s_dead_Agt6_cd4gt2007074_ = s_dead_Agt6_cd4gt2007074m + s_dead_Agt6_cd4gt2007074w;
s_dead_Agt6_cd4gt2007579_ = s_dead_Agt6_cd4gt2007579m + s_dead_Agt6_cd4gt2007579w; s_dead_Agt6_cd4gt2008084_ = s_dead_Agt6_cd4gt2008084m + s_dead_Agt6_cd4gt2008084w;

s_I_undiag1519_ = s_I_undiag1519m + s_I_undiag1519w; s_I_undiag2024_ = s_I_undiag2024m + s_I_undiag2024w;
s_I_undiag2529_ = s_I_undiag2529m + s_I_undiag2529w; s_I_undiag3034_ = s_I_undiag3034m + s_I_undiag3034w;
s_I_undiag3539_ = s_I_undiag3539m + s_I_undiag3539w; s_I_undiag4044_ = s_I_undiag4044m + s_I_undiag4044w;
s_I_undiag4549_ = s_I_undiag4549m + s_I_undiag4549w; s_I_undiag5054_ = s_I_undiag5054m + s_I_undiag5054w;
s_I_undiag5559_ = s_I_undiag5559m + s_I_undiag5559w; s_I_undiag6064_ = s_I_undiag6064m + s_I_undiag6064w;
s_I_undiag6569_ = s_I_undiag6569m + s_I_undiag6569w; s_I_undiag7074_ = s_I_undiag7074m + s_I_undiag7074w;
s_I_undiag7579_ = s_I_undiag7579m + s_I_undiag7579w; s_I_undiag8084_ = s_I_undiag8084m + s_I_undiag8084w;

s_I_diag_naive1519_ = s_I_diag_naive1519m + s_I_diag_naive1519w; s_I_diag_naive2024_ = s_I_diag_naive2024m + s_I_diag_naive2024w;
s_I_diag_naive2529_ = s_I_diag_naive2529m + s_I_diag_naive2529w; s_I_diag_naive3034_ = s_I_diag_naive3034m + s_I_diag_naive3034w;
s_I_diag_naive3539_ = s_I_diag_naive3539m + s_I_diag_naive3539w; s_I_diag_naive4044_ = s_I_diag_naive4044m + s_I_diag_naive4044w;
s_I_diag_naive4549_ = s_I_diag_naive4549m + s_I_diag_naive4549w; s_I_diag_naive5054_ = s_I_diag_naive5054m + s_I_diag_naive5054w;
s_I_diag_naive5559_ = s_I_diag_naive5559m + s_I_diag_naive5559w; s_I_diag_naive6064_ = s_I_diag_naive6064m + s_I_diag_naive6064w;
s_I_diag_naive6569_ = s_I_diag_naive6569m + s_I_diag_naive6569w; s_I_diag_naive7074_ = s_I_diag_naive7074m + s_I_diag_naive7074w;
s_I_diag_naive7579_ = s_I_diag_naive7579m + s_I_diag_naive7579w; s_I_diag_naive8084_ = s_I_diag_naive8084m + s_I_diag_naive8084w;

s_I_diag_startart1519_ = s_I_diag_startart1519m + s_I_diag_startart1519w; s_I_diag_startart2024_ = s_I_diag_startart2024m + s_I_diag_startart2024w;
s_I_diag_startart2529_ = s_I_diag_startart2529m + s_I_diag_startart2529w; s_I_diag_startart3034_ = s_I_diag_startart3034m + s_I_diag_startart3034w;
s_I_diag_startart3539_ = s_I_diag_startart3539m + s_I_diag_startart3539w; s_I_diag_startart4044_ = s_I_diag_startart4044m + s_I_diag_startart4044w;
s_I_diag_startart4549_ = s_I_diag_startart4549m + s_I_diag_startart4549w; s_I_diag_startart5054_ = s_I_diag_startart5054m + s_I_diag_startart5054w;
s_I_diag_startart5559_ = s_I_diag_startart5559m + s_I_diag_startart5559w; s_I_diag_startart6064_ = s_I_diag_startart6064m + s_I_diag_startart6064w;
s_I_diag_startart6569_ = s_I_diag_startart6569m + s_I_diag_startart6569w; s_I_diag_startart7074_ = s_I_diag_startart7074m + s_I_diag_startart7074w;
s_I_diag_startart7579_ = s_I_diag_startart7579m + s_I_diag_startart7579w; s_I_diag_startart8084_ = s_I_diag_startart8084m + s_I_diag_startart8084w;

s_I_onart1519_ = s_I_onart1519m + s_I_onart1519w; s_I_onart2024_ = s_I_onart2024m + s_I_onart2024w;
s_I_onart2529_ = s_I_onart2529m + s_I_onart2529w; s_I_onart3034_ = s_I_onart3034m + s_I_onart3034w;
s_I_onart3539_ = s_I_onart3539m + s_I_onart3539w; s_I_onart4044_ = s_I_onart4044m + s_I_onart4044w;
s_I_onart4549_ = s_I_onart4549m + s_I_onart4549w; s_I_onart5054_ = s_I_onart5054m + s_I_onart5054w;
s_I_onart5559_ = s_I_onart5559m + s_I_onart5559w; s_I_onart6064_ = s_I_onart6064m + s_I_onart6064w;
s_I_onart6569_ = s_I_onart6569m + s_I_onart6569w; s_I_onart7074_ = s_I_onart7074m + s_I_onart7074w;
s_I_onart7579_ = s_I_onart7579m + s_I_onart7579w; s_I_onart8084_ = s_I_onart8084m + s_I_onart8084w;

s_I_offart1519_ = s_I_offart1519m + s_I_offart1519w; s_I_offart2024_ = s_I_offart2024m + s_I_offart2024w;
s_I_offart2529_ = s_I_offart2529m + s_I_offart2529w; s_I_offart3034_ = s_I_offart3034m + s_I_offart3034w;
s_I_offart3539_ = s_I_offart3539m + s_I_offart3539w; s_I_offart4044_ = s_I_offart4044m + s_I_offart4044w;
s_I_offart4549_ = s_I_offart4549m + s_I_offart4549w; s_I_offart5054_ = s_I_offart5054m + s_I_offart5054w;
s_I_offart5559_ = s_I_offart5559m + s_I_offart5559w; s_I_offart6064_ = s_I_offart6064m + s_I_offart6064w;
s_I_offart6569_ = s_I_offart6569m + s_I_offart6569w; s_I_offart7074_ = s_I_offart7074m + s_I_offart7074w;
s_I_offart7579_ = s_I_offart7579m + s_I_offart7579w; s_I_offart8084_ = s_I_offart8084m + s_I_offart8084w;

s_I_onart_lt6m1519_ = s_I_onart_lt6m1519m + s_I_onart_lt6m1519w; s_I_onart_lt6m2024_ = s_I_onart_lt6m2024m + s_I_onart_lt6m2024w;
s_I_onart_lt6m2529_ = s_I_onart_lt6m2529m + s_I_onart_lt6m2529w; s_I_onart_lt6m3034_ = s_I_onart_lt6m3034m + s_I_onart_lt6m3034w;
s_I_onart_lt6m3539_ = s_I_onart_lt6m3539m + s_I_onart_lt6m3539w; s_I_onart_lt6m4044_ = s_I_onart_lt6m4044m + s_I_onart_lt6m4044w;
s_I_onart_lt6m4549_ = s_I_onart_lt6m4549m + s_I_onart_lt6m4549w; s_I_onart_lt6m5054_ = s_I_onart_lt6m5054m + s_I_onart_lt6m5054w;
s_I_onart_lt6m5559_ = s_I_onart_lt6m5559m + s_I_onart_lt6m5559w; s_I_onart_lt6m6064_ = s_I_onart_lt6m6064m + s_I_onart_lt6m6064w;
s_I_onart_lt6m6569_ = s_I_onart_lt6m6569m + s_I_onart_lt6m6569w; s_I_onart_lt6m7074_ = s_I_onart_lt6m7074m + s_I_onart_lt6m7074w;
s_I_onart_lt6m7579_ = s_I_onart_lt6m7579m + s_I_onart_lt6m7579w; s_I_onart_lt6m8084_ = s_I_onart_lt6m8084m + s_I_onart_lt6m8084w;

s_I_onart_lt6m_nvs1519_ = s_I_onart_lt6m_nvs1519m + s_I_onart_lt6m_nvs1519w; s_I_onart_lt6m_nvs2024_ = s_I_onart_lt6m_nvs2024m + s_I_onart_lt6m_nvs2024w;
s_I_onart_lt6m_nvs2529_ = s_I_onart_lt6m_nvs2529m + s_I_onart_lt6m_nvs2529w; s_I_onart_lt6m_nvs3034_ = s_I_onart_lt6m_nvs3034m + s_I_onart_lt6m_nvs3034w;
s_I_onart_lt6m_nvs3539_ = s_I_onart_lt6m_nvs3539m + s_I_onart_lt6m_nvs3539w; s_I_onart_lt6m_nvs4044_ = s_I_onart_lt6m_nvs4044m + s_I_onart_lt6m_nvs4044w;
s_I_onart_lt6m_nvs4549_ = s_I_onart_lt6m_nvs4549m + s_I_onart_lt6m_nvs4549w; s_I_onart_lt6m_nvs5054_ = s_I_onart_lt6m_nvs5054m + s_I_onart_lt6m_nvs5054w;
s_I_onart_lt6m_nvs5559_ = s_I_onart_lt6m_nvs5559m + s_I_onart_lt6m_nvs5559w; s_I_onart_lt6m_nvs6064_ = s_I_onart_lt6m_nvs6064m + s_I_onart_lt6m_nvs6064w;
s_I_onart_lt6m_nvs6569_ = s_I_onart_lt6m_nvs6569m + s_I_onart_lt6m_nvs6569w; s_I_onart_lt6m_nvs7074_ = s_I_onart_lt6m_nvs7074m + s_I_onart_lt6m_nvs7074w;
s_I_onart_lt6m_nvs7579_ = s_I_onart_lt6m_nvs7579m + s_I_onart_lt6m_nvs7579w; s_I_onart_lt6m_nvs8084_ = s_I_onart_lt6m_nvs8084m + s_I_onart_lt6m_nvs8084w;

s_I_onart_gt6m_nvs1519_ = s_I_onart_gt6m_nvs1519m + s_I_onart_gt6m_nvs1519w; s_I_onart_gt6m_nvs2024_ = s_I_onart_gt6m_nvs2024m + s_I_onart_gt6m_nvs2024w;
s_I_onart_gt6m_nvs2529_ = s_I_onart_gt6m_nvs2529m + s_I_onart_gt6m_nvs2529w; s_I_onart_gt6m_nvs3034_ = s_I_onart_gt6m_nvs3034m + s_I_onart_gt6m_nvs3034w;
s_I_onart_gt6m_nvs3539_ = s_I_onart_gt6m_nvs3539m + s_I_onart_gt6m_nvs3539w; s_I_onart_gt6m_nvs4044_ = s_I_onart_gt6m_nvs4044m + s_I_onart_gt6m_nvs4044w;
s_I_onart_gt6m_nvs4549_ = s_I_onart_gt6m_nvs4549m + s_I_onart_gt6m_nvs4549w; s_I_onart_gt6m_nvs5054_ = s_I_onart_gt6m_nvs5054m + s_I_onart_gt6m_nvs5054w;
s_I_onart_gt6m_nvs5559_ = s_I_onart_gt6m_nvs5559m + s_I_onart_gt6m_nvs5559w; s_I_onart_gt6m_nvs6064_ = s_I_onart_gt6m_nvs6064m + s_I_onart_gt6m_nvs6064w;
s_I_onart_gt6m_nvs6569_ = s_I_onart_gt6m_nvs6569m + s_I_onart_gt6m_nvs6569w; s_I_onart_gt6m_nvs7074_ = s_I_onart_gt6m_nvs7074m + s_I_onart_gt6m_nvs7074w;
s_I_onart_gt6m_nvs7579_ = s_I_onart_gt6m_nvs7579m + s_I_onart_gt6m_nvs7579w; s_I_onart_gt6m_nvs8084_ = s_I_onart_gt6m_nvs8084m + s_I_onart_gt6m_nvs8084w;

s_I_onart_gt6m_vs1519_ = s_I_onart_gt6m_vs1519m + s_I_onart_gt6m_vs1519w; s_I_onart_gt6m_vs2024_ = s_I_onart_gt6m_vs2024m + s_I_onart_gt6m_vs2024w;
s_I_onart_gt6m_vs2529_ = s_I_onart_gt6m_vs2529m + s_I_onart_gt6m_vs2529w; s_I_onart_gt6m_vs3034_ = s_I_onart_gt6m_vs3034m + s_I_onart_gt6m_vs3034w;
s_I_onart_gt6m_vs3539_ = s_I_onart_gt6m_vs3539m + s_I_onart_gt6m_vs3539w; s_I_onart_gt6m_vs4044_ = s_I_onart_gt6m_vs4044m + s_I_onart_gt6m_vs4044w;
s_I_onart_gt6m_vs4549_ = s_I_onart_gt6m_vs4549m + s_I_onart_gt6m_vs4549w; s_I_onart_gt6m_vs5054_ = s_I_onart_gt6m_vs5054m + s_I_onart_gt6m_vs5054w;
s_I_onart_gt6m_vs5559_ = s_I_onart_gt6m_vs5559m + s_I_onart_gt6m_vs5559w; s_I_onart_gt6m_vs6064_ = s_I_onart_gt6m_vs6064m + s_I_onart_gt6m_vs6064w;
s_I_onart_gt6m_vs6569_ = s_I_onart_gt6m_vs6569m + s_I_onart_gt6m_vs6569w; s_I_onart_gt6m_vs7074_ = s_I_onart_gt6m_vs7074m + s_I_onart_gt6m_vs7074w;
s_I_onart_gt6m_vs7579_ = s_I_onart_gt6m_vs7579m + s_I_onart_gt6m_vs7579w; s_I_onart_gt6m_vs8084_ = s_I_onart_gt6m_vs8084m + s_I_onart_gt6m_vs8084w;

s_I_offart_1stI1519_ = s_I_offart_1stI1519m + s_I_offart_1stI1519w; s_I_offart_1stI2024_ = s_I_offart_1stI2024m + s_I_offart_1stI2024w;
s_I_offart_1stI2529_ = s_I_offart_1stI2529m + s_I_offart_1stI2529w; s_I_offart_1stI3034_ = s_I_offart_1stI3034m + s_I_offart_1stI3034w;
s_I_offart_1stI3539_ = s_I_offart_1stI3539m + s_I_offart_1stI3539w; s_I_offart_1stI4044_ = s_I_offart_1stI4044m + s_I_offart_1stI4044w;
s_I_offart_1stI4549_ = s_I_offart_1stI4549m + s_I_offart_1stI4549w; s_I_offart_1stI5054_ = s_I_offart_1stI5054m + s_I_offart_1stI5054w;
s_I_offart_1stI5559_ = s_I_offart_1stI5559m + s_I_offart_1stI5559w; s_I_offart_1stI6064_ = s_I_offart_1stI6064m + s_I_offart_1stI6064w;
s_I_offart_1stI6569_ = s_I_offart_1stI6569m + s_I_offart_1stI6569w; s_I_offart_1stI7074_ = s_I_offart_1stI7074m + s_I_offart_1stI7074w;
s_I_offart_1stI7579_ = s_I_offart_1stI7579m + s_I_offart_1stI7579w; s_I_offart_1stI8084_ = s_I_offart_1stI8084m + s_I_offart_1stI8084w;

s_I_offart_SI1519_ = s_I_offart_SI1519m + s_I_offart_SI1519w; s_I_offart_SI2024_ = s_I_offart_SI2024m + s_I_offart_SI2024w;
s_I_offart_SI2529_ = s_I_offart_SI2529m + s_I_offart_SI2529w; s_I_offart_SI3034_ = s_I_offart_SI3034m + s_I_offart_SI3034w;
s_I_offart_SI3539_ = s_I_offart_SI3539m + s_I_offart_SI3539w; s_I_offart_SI4044_ = s_I_offart_SI4044m + s_I_offart_SI4044w;
s_I_offart_SI4549_ = s_I_offart_SI4549m + s_I_offart_SI4549w; s_I_offart_SI5054_ = s_I_offart_SI5054m + s_I_offart_SI5054w;
s_I_offart_SI5559_ = s_I_offart_SI5559m + s_I_offart_SI5559w; s_I_offart_SI6064_ = s_I_offart_SI6064m + s_I_offart_SI6064w;
s_I_offart_SI6569_ = s_I_offart_SI6569m + s_I_offart_SI6569w; s_I_offart_SI7074_ = s_I_offart_SI7074m + s_I_offart_SI7074w;
s_I_offart_SI7579_ = s_I_offart_SI7579m + s_I_offart_SI7579w; s_I_offart_SI8084_ = s_I_offart_SI8084m + s_I_offart_SI8084w;

s_I_offart_SIlt6m1519_ = s_I_offart_SIlt6m1519m + s_I_offart_SIlt6m1519w; s_I_offart_SIlt6m2024_ = s_I_offart_SIlt6m2024m + s_I_offart_SIlt6m2024w;
s_I_offart_SIlt6m2529_ = s_I_offart_SIlt6m2529m + s_I_offart_SIlt6m2529w; s_I_offart_SIlt6m3034_ = s_I_offart_SIlt6m3034m + s_I_offart_SIlt6m3034w;
s_I_offart_SIlt6m3539_ = s_I_offart_SIlt6m3539m + s_I_offart_SIlt6m3539w; s_I_offart_SIlt6m4044_ = s_I_offart_SIlt6m4044m + s_I_offart_SIlt6m4044w;
s_I_offart_SIlt6m4549_ = s_I_offart_SIlt6m4549m + s_I_offart_SIlt6m4549w; s_I_offart_SIlt6m5054_ = s_I_offart_SIlt6m5054m + s_I_offart_SIlt6m5054w;
s_I_offart_SIlt6m5559_ = s_I_offart_SIlt6m5559m + s_I_offart_SIlt6m5559w; s_I_offart_SIlt6m6064_ = s_I_offart_SIlt6m6064m + s_I_offart_SIlt6m6064w;
s_I_offart_SIlt6m6569_ = s_I_offart_SIlt6m6569m + s_I_offart_SIlt6m6569w; s_I_offart_SIlt6m7074_ = s_I_offart_SIlt6m7074m + s_I_offart_SIlt6m7074w;
s_I_offart_SIlt6m7579_ = s_I_offart_SIlt6m7579m + s_I_offart_SIlt6m7579w; s_I_offart_SIlt6m8084_ = s_I_offart_SIlt6m8084m + s_I_offart_SIlt6m8084w;

s_I_offart_SIgt6m1519_ = s_I_offart_SIgt6m1519m + s_I_offart_SIgt6m1519w; s_I_offart_SIgt6m2024_ = s_I_offart_SIgt6m2024m + s_I_offart_SIgt6m2024w;
s_I_offart_SIgt6m2529_ = s_I_offart_SIgt6m2529m + s_I_offart_SIgt6m2529w; s_I_offart_SIgt6m3034_ = s_I_offart_SIgt6m3034m + s_I_offart_SIgt6m3034w;
s_I_offart_SIgt6m3539_ = s_I_offart_SIgt6m3539m + s_I_offart_SIgt6m3539w; s_I_offart_SIgt6m4044_ = s_I_offart_SIgt6m4044m + s_I_offart_SIgt6m4044w;
s_I_offart_SIgt6m4549_ = s_I_offart_SIgt6m4549m + s_I_offart_SIgt6m4549w; s_I_offart_SIgt6m5054_ = s_I_offart_SIgt6m5054m + s_I_offart_SIgt6m5054w;
s_I_offart_SIgt6m5559_ = s_I_offart_SIgt6m5559m + s_I_offart_SIgt6m5559w; s_I_offart_SIgt6m6064_ = s_I_offart_SIgt6m6064m + s_I_offart_SIgt6m6064w;
s_I_offart_SIgt6m6569_ = s_I_offart_SIgt6m6569m + s_I_offart_SIgt6m6569w; s_I_offart_SIgt6m7074_ = s_I_offart_SIgt6m7074m + s_I_offart_SIgt6m7074w;
s_I_offart_SIgt6m7579_ = s_I_offart_SIgt6m7579m + s_I_offart_SIgt6m7579w; s_I_offart_SIgt6m8084_ = s_I_offart_SIgt6m8084m + s_I_offart_SIgt6m8084w;






keep cald	run
n_alive1564_	n_alive1564_m		n_alive1564_w		prevalence1564_		prevalence1564m		prevalence1564w	
incidence1564_	incidence1564_m		incidence1564_w		p_diag				p_diag_m			p_diag_w
p_onart_diag	p_onart_diag_m		p_onart_diag_w		p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w
n_hiv1519_  n_hiv2024_  n_hiv2529_  n_hiv3034_  n_hiv3539_  n_hiv4044_  n_hiv4549_  n_hiv5054_  n_hiv5559_  n_hiv6064_ n_hiv6569_  n_hiv7074_  n_hiv7579_  n_hiv8084_  
n_hiv1519m  n_hiv2024m  n_hiv2529m  n_hiv3034m  n_hiv3539m  n_hiv4044m  n_hiv4549m  n_hiv5054m  n_hiv5559m  n_hiv6064m n_hiv6569m  n_hiv7074m  n_hiv7579m  n_hiv8084m  
n_hiv1519w  n_hiv2024w  n_hiv2529w  n_hiv3034w  n_hiv3539w  n_hiv4044w  n_hiv4549w  n_hiv5054w  n_hiv5559w  n_hiv6064w  n_hiv6569w  n_hiv7074w  n_hiv7579w  n_hiv8084w 
n_hiv_death_m		n_hiv_death_w		n_hiv_death

/*Deaths*/
s_dead_undiag  s_dead_diag_not_linked  
s_dead_Alt6_artcd4lt200_  s_dead_Alt6_artcd4gt200_  
s_dead_I_Alt6_Rcd4lt200_  s_dead_I_Alt6_Rcd4gt200_  
s_dead_A_vl1000_  s_dead_A_vg1000_  s_dead_Alt6_vl1000_  s_dead_Alt6_vg1000_  
s_dead_Agt6_vl1000_  s_dead_Agt6_vg1000_  
s_dead_int_lost  s_dead_1stint_lost  s_dead_subintlt6_lost  s_dead_subintgt6_lost  
s_dead_A_cd4lt200_  s_dead_A_cd4gt200_  
s_dead_Alt6_cd4lt200_  s_dead_Alt6_cd4gt200_  s_dead_Agt6_cd4lt200_  s_dead_Agt6_cd4gt200_  

s_dead_undiag_m  s_dead_undiag_w  
s_dead_undiag1519_  s_dead_undiag2024_  s_dead_undiag2529_  s_dead_undiag3034_  s_dead_undiag3539_  
s_dead_undiag4044_  s_dead_undiag4549_  s_dead_undiag5054_  s_dead_undiag5559_  s_dead_undiag6064_  
s_dead_undiag6569_  s_dead_undiag7074_  s_dead_undiag7579_  s_dead_undiag8084_  
s_dead_undiag1519m  s_dead_undiag2024m  s_dead_undiag2529m  s_dead_undiag3034m  s_dead_undiag3539m  
s_dead_undiag4044m  s_dead_undiag4549m  s_dead_undiag5054m  s_dead_undiag5559m  s_dead_undiag6064m  
s_dead_undiag6569m  s_dead_undiag7074m  s_dead_undiag7579m  s_dead_undiag8084m  
s_dead_undiag1519w  s_dead_undiag2024w  s_dead_undiag2529w  s_dead_undiag3034w  s_dead_undiag3539w  
s_dead_undiag4044w  s_dead_undiag4549w  s_dead_undiag5054w  s_dead_undiag5559w  s_dead_undiag6064w  
s_dead_undiag6569w  s_dead_undiag7074w  s_dead_undiag7579w  s_dead_undiag8084w  

s_dead_diag_not_linked_m  s_dead_diag_not_linked_w  
s_dead_diag_not_linked1519_  s_dead_diag_not_linked2024_  s_dead_diag_not_linked2529_  s_dead_diag_not_linked3034_  s_dead_diag_not_linked3539_  
s_dead_diag_not_linked4044_  s_dead_diag_not_linked4549_  s_dead_diag_not_linked5054_  s_dead_diag_not_linked5559_  s_dead_diag_not_linked6064_  
s_dead_diag_not_linked6569_  s_dead_diag_not_linked7074_  s_dead_diag_not_linked7579_  s_dead_diag_not_linked8084_  
s_dead_diag_not_linked1519m  s_dead_diag_not_linked2024m  s_dead_diag_not_linked2529m  s_dead_diag_not_linked3034m  s_dead_diag_not_linked3539m  
s_dead_diag_not_linked4044m  s_dead_diag_not_linked4549m  s_dead_diag_not_linked5054m  s_dead_diag_not_linked5559m  s_dead_diag_not_linked6064m  
s_dead_diag_not_linked6569m  s_dead_diag_not_linked7074m  s_dead_diag_not_linked7579m  s_dead_diag_not_linked8084m  
s_dead_diag_not_linked1519w  s_dead_diag_not_linked2024w  s_dead_diag_not_linked2529w  s_dead_diag_not_linked3034w  s_dead_diag_not_linked3539w  
s_dead_diag_not_linked4044w  s_dead_diag_not_linked4549w  s_dead_diag_not_linked5054w  s_dead_diag_not_linked5559w  s_dead_diag_not_linked6064w  
s_dead_diag_not_linked6569w  s_dead_diag_not_linked7074w  s_dead_diag_not_linked7579w  s_dead_diag_not_linked8084w  

s_dead_Alt6_artcd4lt200_m  s_dead_Alt6_artcd4lt200_w  
s_dead_Alt6_Acd4lt2001519_  s_dead_Alt6_Acd4lt2002024_  s_dead_Alt6_Acd4lt2002529_  s_dead_Alt6_Acd4lt2003034_  s_dead_Alt6_Acd4lt2003539_  
s_dead_Alt6_Acd4lt2004044_  s_dead_Alt6_Acd4lt2004549_  s_dead_Alt6_Acd4lt2005054_  s_dead_Alt6_Acd4lt2005559_  s_dead_Alt6_Acd4lt2006064_  
s_dead_Alt6_Acd4lt2006569_  s_dead_Alt6_Acd4lt2007074_  s_dead_Alt6_Acd4lt2007579_  s_dead_Alt6_Acd4lt2008084_  
s_dead_Alt6_Acd4lt2001519m  s_dead_Alt6_Acd4lt2002024m  s_dead_Alt6_Acd4lt2002529m  s_dead_Alt6_Acd4lt2003034m  s_dead_Alt6_Acd4lt2003539m  
s_dead_Alt6_Acd4lt2004044m  s_dead_Alt6_Acd4lt2004549m  s_dead_Alt6_Acd4lt2005054m  s_dead_Alt6_Acd4lt2005559m  s_dead_Alt6_Acd4lt2006064m  
s_dead_Alt6_Acd4lt2006569m  s_dead_Alt6_Acd4lt2007074m  s_dead_Alt6_Acd4lt2007579m  s_dead_Alt6_Acd4lt2008084m  
s_dead_Alt6_Acd4lt2001519w  s_dead_Alt6_Acd4lt2002024w  s_dead_Alt6_Acd4lt2002529w  s_dead_Alt6_Acd4lt2003034w  s_dead_Alt6_Acd4lt2003539w  
s_dead_Alt6_Acd4lt2004044w  s_dead_Alt6_Acd4lt2004549w  s_dead_Alt6_Acd4lt2005054w  s_dead_Alt6_Acd4lt2005559w  s_dead_Alt6_Acd4lt2006064w  
s_dead_Alt6_Acd4lt2006569w  s_dead_Alt6_Acd4lt2007074w  s_dead_Alt6_Acd4lt2007579w  s_dead_Alt6_Acd4lt2008084w  

s_dead_Alt6_artcd4gt200_m  s_dead_Alt6_artcd4gt200_w  
s_dead_Alt6_Acd4gt2001519_  s_dead_Alt6_Acd4gt2002024_  s_dead_Alt6_Acd4gt2002529_  s_dead_Alt6_Acd4gt2003034_  s_dead_Alt6_Acd4gt2003539_  
s_dead_Alt6_Acd4gt2004044_  s_dead_Alt6_Acd4gt2004549_  s_dead_Alt6_Acd4gt2005054_  s_dead_Alt6_Acd4gt2005559_  s_dead_Alt6_Acd4gt2006064_  
s_dead_Alt6_Acd4gt2006569_  s_dead_Alt6_Acd4gt2007074_  s_dead_Alt6_Acd4gt2007579_  s_dead_Alt6_Acd4gt2008084_  
s_dead_Alt6_Acd4gt2001519m  s_dead_Alt6_Acd4gt2002024m  s_dead_Alt6_Acd4gt2002529m  s_dead_Alt6_Acd4gt2003034m  s_dead_Alt6_Acd4gt2003539m  
s_dead_Alt6_Acd4gt2004044m  s_dead_Alt6_Acd4gt2004549m  s_dead_Alt6_Acd4gt2005054m  s_dead_Alt6_Acd4gt2005559m  s_dead_Alt6_Acd4gt2006064m  
s_dead_Alt6_Acd4gt2006569m  s_dead_Alt6_Acd4gt2007074m  s_dead_Alt6_Acd4gt2007579m  s_dead_Alt6_Acd4gt2008084m  
s_dead_Alt6_Acd4gt2001519w  s_dead_Alt6_Acd4gt2002024w  s_dead_Alt6_Acd4gt2002529w  s_dead_Alt6_Acd4gt2003034w  s_dead_Alt6_Acd4gt2003539w  
s_dead_Alt6_Acd4gt2004044w  s_dead_Alt6_Acd4gt2004549w  s_dead_Alt6_Acd4gt2005054w  s_dead_Alt6_Acd4gt2005559w  s_dead_Alt6_Acd4gt2006064w  
s_dead_Alt6_Acd4gt2006569w  s_dead_Alt6_Acd4gt2007074w  s_dead_Alt6_Acd4gt2007579w  s_dead_Alt6_Acd4gt2008084w  

s_dead_I_Alt6_Rcd4lt200_m  s_dead_I_Alt6_Rcd4lt200_w  
s_d_I_Alt6_Rcd4lt2001519_  s_d_I_Alt6_Rcd4lt2002024_  s_d_I_Alt6_Rcd4lt2002529_  s_d_I_Alt6_Rcd4lt2003034_  s_d_I_Alt6_Rcd4lt2003539_  
s_d_I_Alt6_Rcd4lt2004044_  s_d_I_Alt6_Rcd4lt2004549_  s_d_I_Alt6_Rcd4lt2005054_  s_d_I_Alt6_Rcd4lt2005559_   s_d_I_Alt6_Rcd4lt2006064_  
s_d_I_Alt6_Rcd4lt2006569_  s_d_I_Alt6_Rcd4lt2007074_  s_d_I_Alt6_Rcd4lt2007579_  s_d_I_Alt6_Rcd4lt2008084_  
s_d_I_Alt6_Rcd4lt2001519m  s_d_I_Alt6_Rcd4lt2002024m  s_d_I_Alt6_Rcd4lt2002529m  s_d_I_Alt6_Rcd4lt2003034m  s_d_I_Alt6_Rcd4lt2003539m  
s_d_I_Alt6_Rcd4lt2004044m  s_d_I_Alt6_Rcd4lt2004549m  s_d_I_Alt6_Rcd4lt2005054m  s_d_I_Alt6_Rcd4lt2005559m   s_d_I_Alt6_Rcd4lt2006064m  
s_d_I_Alt6_Rcd4lt2006569m  s_d_I_Alt6_Rcd4lt2007074m  s_d_I_Alt6_Rcd4lt2007579m  s_d_I_Alt6_Rcd4lt2008084m  
s_d_I_Alt6_Rcd4lt2001519w  s_d_I_Alt6_Rcd4lt2002024w  s_d_I_Alt6_Rcd4lt2002529w  s_d_I_Alt6_Rcd4lt2003034w  s_d_I_Alt6_Rcd4lt2003539w  
s_d_I_Alt6_Rcd4lt2004044w  s_d_I_Alt6_Rcd4lt2004549w  s_d_I_Alt6_Rcd4lt2005054w  s_d_I_Alt6_Rcd4lt2005559w   s_d_I_Alt6_Rcd4lt2006064w  
s_d_I_Alt6_Rcd4lt2006569w  s_d_I_Alt6_Rcd4lt2007074w  s_d_I_Alt6_Rcd4lt2007579w  s_d_I_Alt6_Rcd4lt2008084w  

s_dead_I_Alt6_Rcd4gt200_m  s_dead_I_Alt6_Rcd4gt200_w  
s_d_I_Alt6_Rcd4lt2001519_  s_d_I_Alt6_Rcd4lt2002024_  s_d_I_Alt6_Rcd4lt2002529_  s_d_I_Alt6_Rcd4lt2003034_  s_d_I_Alt6_Rcd4lt2003539_  
s_d_I_Alt6_Rcd4lt2004044_  s_d_I_Alt6_Rcd4lt2004549_  s_d_I_Alt6_Rcd4lt2005054_  s_d_I_Alt6_Rcd4lt2005559_   s_d_I_Alt6_Rcd4lt2006064_  
s_d_I_Alt6_Rcd4lt2006569_  s_d_I_Alt6_Rcd4lt2007074_  s_d_I_Alt6_Rcd4lt2007579_  s_d_I_Alt6_Rcd4lt2008084_  
s_d_I_Alt6_Rcd4gt2001519m  s_d_I_Alt6_Rcd4gt2002024m  s_d_I_Alt6_Rcd4gt2002529m  s_d_I_Alt6_Rcd4gt2003034m  s_d_I_Alt6_Rcd4gt2003539m  
s_d_I_Alt6_Rcd4gt2004044m  s_d_I_Alt6_Rcd4gt2004549m  s_d_I_Alt6_Rcd4gt2005054m  s_d_I_Alt6_Rcd4gt2005559m   s_d_I_Alt6_Rcd4gt2006064m  
s_d_I_Alt6_Rcd4gt2006569m  s_d_I_Alt6_Rcd4gt2007074m  s_d_I_Alt6_Rcd4gt2007579m  s_d_I_Alt6_Rcd4gt2008084m  
s_d_I_Alt6_Rcd4gt2001519w  s_d_I_Alt6_Rcd4gt2002024w  s_d_I_Alt6_Rcd4gt2002529w  s_d_I_Alt6_Rcd4gt2003034w  s_d_I_Alt6_Rcd4gt2003539w  
s_d_I_Alt6_Rcd4gt2004044w  s_d_I_Alt6_Rcd4gt2004549w  s_d_I_Alt6_Rcd4gt2005054w  s_d_I_Alt6_Rcd4gt2005559w   s_d_I_Alt6_Rcd4gt2006064w  
s_d_I_Alt6_Rcd4gt2006569w  s_d_I_Alt6_Rcd4gt2007074w  s_d_I_Alt6_Rcd4gt2007579w  s_d_I_Alt6_Rcd4gt2008084w  

s_dead_A_vl1000_m  s_dead_A_vl1000_w  
s_dead_A_vl10001519_  s_dead_A_vl10002024_  s_dead_A_vl10002529_  s_dead_A_vl10003034_  s_dead_A_vl10003539_  
s_dead_A_vl10004044_  s_dead_A_vl10004549_  s_dead_A_vl10005054_  s_dead_A_vl10005559_  s_dead_A_vl10006064_  
s_dead_A_vl10006569_  s_dead_A_vl10007074_  s_dead_A_vl10007579_   s_dead_A_vl10008084_  
s_dead_A_vl10001519m  s_dead_A_vl10002024m  s_dead_A_vl10002529m  s_dead_A_vl10003034m  s_dead_A_vl10003539m  
s_dead_A_vl10004044m  s_dead_A_vl10004549m  s_dead_A_vl10005054m  s_dead_A_vl10005559m  s_dead_A_vl10006064m  
s_dead_A_vl10006569m  s_dead_A_vl10007074m  s_dead_A_vl10007579m   s_dead_A_vl10008084m  
s_dead_A_vl10001519w  s_dead_A_vl10002024w  s_dead_A_vl10002529w  s_dead_A_vl10003034w  s_dead_A_vl10003539w  
s_dead_A_vl10004044w  s_dead_A_vl10004549w  s_dead_A_vl10005054w  s_dead_A_vl10005559w  s_dead_A_vl10006064w  
s_dead_A_vl10006569w  s_dead_A_vl10007074w  s_dead_A_vl10007579w   s_dead_A_vl10008084w  

s_dead_A_vg1000_m  s_dead_A_vg1000_w  
s_dead_A_vg10001519_  s_dead_A_vg10002024_  s_dead_A_vg10002529_  s_dead_A_vg10003034_  s_dead_A_vg10003539_  
s_dead_A_vg10004044_  s_dead_A_vg10004549_  s_dead_A_vg10005054_  s_dead_A_vg10005559_  s_dead_A_vg10006064_  
s_dead_A_vg10006569_  s_dead_A_vg10007074_  s_dead_A_vg10007579_   s_dead_A_vg10008084_  
s_dead_A_vg10001519m  s_dead_A_vg10002024m  s_dead_A_vg10002529m  s_dead_A_vg10003034m  s_dead_A_vg10003539m  
s_dead_A_vg10004044m  s_dead_A_vg10004549m  s_dead_A_vg10005054m  s_dead_A_vg10005559m  s_dead_A_vg10006064m  
s_dead_A_vg10006569m  s_dead_A_vg10007074m  s_dead_A_vg10007579m   s_dead_A_vg10008084m  
s_dead_A_vg10001519w  s_dead_A_vg10002024w  s_dead_A_vg10002529w  s_dead_A_vg10003034w  s_dead_A_vg10003539w  
s_dead_A_vg10004044w  s_dead_A_vg10004549w  s_dead_A_vg10005054w  s_dead_A_vg10005559w  s_dead_A_vg10006064w  
s_dead_A_vg10006569w  s_dead_A_vg10007074w  s_dead_A_vg10007579w   s_dead_A_vg10008084w  

s_dead_Alt6_vl1000_m  s_dead_Alt6_vl1000_w  
s_dead_Alt6_vl10001519_  s_dead_Alt6_vl10002024_  s_dead_Alt6_vl10002529_  s_dead_Alt6_vl10003034_  s_dead_Alt6_vl10003539_  
s_dead_Alt6_vl10004044_  s_dead_Alt6_vl10004549_  s_dead_Alt6_vl10005054_  s_dead_Alt6_vl10005559_  s_dead_Alt6_vl10006064_  
s_dead_Alt6_vl10006569_  s_dead_Alt6_vl10007074_  s_dead_Alt6_vl10007579_   s_dead_Alt6_vl10008084_  
s_dead_Alt6_vl10001519m  s_dead_Alt6_vl10002024m  s_dead_Alt6_vl10002529m  s_dead_Alt6_vl10003034m  s_dead_Alt6_vl10003539m  
s_dead_Alt6_vl10004044m  s_dead_Alt6_vl10004549m  s_dead_Alt6_vl10005054m  s_dead_Alt6_vl10005559m  s_dead_Alt6_vl10006064m  
s_dead_Alt6_vl10006569m  s_dead_Alt6_vl10007074m  s_dead_Alt6_vl10007579m   s_dead_Alt6_vl10008084m  
s_dead_Alt6_vl10001519w  s_dead_Alt6_vl10002024w  s_dead_Alt6_vl10002529w  s_dead_Alt6_vl10003034w  s_dead_Alt6_vl10003539w  
s_dead_Alt6_vl10004044w  s_dead_Alt6_vl10004549w  s_dead_Alt6_vl10005054w  s_dead_Alt6_vl10005559w  s_dead_Alt6_vl10006064w  
s_dead_Alt6_vl10006569w  s_dead_Alt6_vl10007074w  s_dead_Alt6_vl10007579w   s_dead_Alt6_vl10008084w  

s_dead_Alt6_vg1000_m  s_dead_Alt6_vg1000_w  
s_dead_Alt6_vg10001519_  s_dead_Alt6_vg10002024_  s_dead_Alt6_vg10002529_  s_dead_Alt6_vg10003034_  s_dead_Alt6_vg10003539_  
s_dead_Alt6_vg10004044_  s_dead_Alt6_vg10004549_  s_dead_Alt6_vg10005054_  s_dead_Alt6_vg10005559_  s_dead_Alt6_vg10006064_  
s_dead_Alt6_vg10006569_  s_dead_Alt6_vg10007074_  s_dead_Alt6_vg10007579_   s_dead_Alt6_vg10008084_  
s_dead_Alt6_vg10001519m  s_dead_Alt6_vg10002024m  s_dead_Alt6_vg10002529m  s_dead_Alt6_vg10003034m  s_dead_Alt6_vg10003539m  
s_dead_Alt6_vg10004044m  s_dead_Alt6_vg10004549m  s_dead_Alt6_vg10005054m  s_dead_Alt6_vg10005559m  s_dead_Alt6_vg10006064m  
s_dead_Alt6_vg10006569m  s_dead_Alt6_vg10007074m  s_dead_Alt6_vg10007579m   s_dead_Alt6_vg10008084m  
s_dead_Alt6_vg10001519w  s_dead_Alt6_vg10002024w  s_dead_Alt6_vg10002529w  s_dead_Alt6_vg10003034w  s_dead_Alt6_vg10003539w  
s_dead_Alt6_vg10004044w  s_dead_Alt6_vg10004549w  s_dead_Alt6_vg10005054w  s_dead_Alt6_vg10005559w  s_dead_Alt6_vg10006064w  
s_dead_Alt6_vg10006569w  s_dead_Alt6_vg10007074w  s_dead_Alt6_vg10007579w   s_dead_Alt6_vg10008084w  

s_dead_Agt6_vl1000_m  s_dead_Agt6_vl1000_w  
s_dead_Agt6_vl10001519_  s_dead_Agt6_vl10002024_  s_dead_Agt6_vl10002529_  s_dead_Agt6_vl10003034_  s_dead_Agt6_vl10003539_  
s_dead_Agt6_vl10004044_  s_dead_Agt6_vl10004549_  s_dead_Agt6_vl10005054_  s_dead_Agt6_vl10005559_  s_dead_Agt6_vl10006064_  
s_dead_Agt6_vl10006569_  s_dead_Agt6_vl10007074_  s_dead_Agt6_vl10007579_   s_dead_Agt6_vl10008084_  

s_dead_Agt6_vl10001519m  s_dead_Agt6_vl10002024m  s_dead_Agt6_vl10002529m  s_dead_Agt6_vl10003034m  s_dead_Agt6_vl10003539m  
s_dead_Agt6_vl10004044m  s_dead_Agt6_vl10004549m  s_dead_Agt6_vl10005054m  s_dead_Agt6_vl10005559m  s_dead_Agt6_vl10006064m  
s_dead_Agt6_vl10006569m  s_dead_Agt6_vl10007074m  s_dead_Agt6_vl10007579m   s_dead_Agt6_vl10008084m  
s_dead_Agt6_vl10001519w  s_dead_Agt6_vl10002024w  s_dead_Agt6_vl10002529w  s_dead_Agt6_vl10003034w  s_dead_Agt6_vl10003539w  
s_dead_Agt6_vl10004044w  s_dead_Agt6_vl10004549w  s_dead_Agt6_vl10005054w  s_dead_Agt6_vl10005559w  s_dead_Agt6_vl10006064w  
s_dead_Agt6_vl10006569w  s_dead_Agt6_vl10007074w  s_dead_Agt6_vl10007579w   s_dead_Agt6_vl10008084w  

s_dead_Agt6_vg1000_m  s_dead_Agt6_vg1000_w  
s_dead_Agt6_vg10001519_  s_dead_Agt6_vg10002024_  s_dead_Agt6_vg10002529_  s_dead_Agt6_vg10003034_  s_dead_Agt6_vg10003539_  
s_dead_Agt6_vg10004044_  s_dead_Agt6_vg10004549_  s_dead_Agt6_vg10005054_  s_dead_Agt6_vg10005559_  s_dead_Agt6_vg10006064_  
s_dead_Agt6_vg10006569_  s_dead_Agt6_vg10007074_  s_dead_Agt6_vg10007579_   s_dead_Agt6_vg10008084_  

s_dead_Agt6_vg10001519m  s_dead_Agt6_vg10002024m  s_dead_Agt6_vg10002529m  s_dead_Agt6_vg10003034m  s_dead_Agt6_vg10003539m  
s_dead_Agt6_vg10004044m  s_dead_Agt6_vg10004549m  s_dead_Agt6_vg10005054m  s_dead_Agt6_vg10005559m  s_dead_Agt6_vg10006064m  
s_dead_Agt6_vg10006569m  s_dead_Agt6_vg10007074m  s_dead_Agt6_vg10007579m   s_dead_Agt6_vg10008084m  
s_dead_Agt6_vg10001519w  s_dead_Agt6_vg10002024w  s_dead_Agt6_vg10002529w  s_dead_Agt6_vg10003034w  s_dead_Agt6_vg10003539w  
s_dead_Agt6_vg10004044w  s_dead_Agt6_vg10004549w  s_dead_Agt6_vg10005054w  s_dead_Agt6_vg10005559w  s_dead_Agt6_vg10006064w  
s_dead_Agt6_vg10006569w  s_dead_Agt6_vg10007074w  s_dead_Agt6_vg10007579w   s_dead_Agt6_vg10008084w  

s_dead_int_lost_m  s_dead_int_lost_w  
s_dead_int_lost1519_  s_dead_int_lost2024_  s_dead_int_lost2529_  s_dead_int_lost3034_  s_dead_int_lost3539_  
s_dead_int_lost4044_  s_dead_int_lost4549_  s_dead_int_lost5054_  s_dead_int_lost5559_  s_dead_int_lost6064_  
s_dead_int_lost6569_  s_dead_int_lost7074_  s_dead_int_lost7579_  s_dead_int_lost8084_  

s_dead_int_lost1519m  s_dead_int_lost2024m  s_dead_int_lost2529m  s_dead_int_lost3034m  s_dead_int_lost3539m  
s_dead_int_lost4044m  s_dead_int_lost4549m  s_dead_int_lost5054m  s_dead_int_lost5559m  s_dead_int_lost6064m  
s_dead_int_lost6569m  s_dead_int_lost7074m  s_dead_int_lost7579m  s_dead_int_lost8084m  
s_dead_int_lost1519w  s_dead_int_lost2024w  s_dead_int_lost2529w  s_dead_int_lost3034w  s_dead_int_lost3539w  
s_dead_int_lost4044w  s_dead_int_lost4549w  s_dead_int_lost5054w  s_dead_int_lost5559w  s_dead_int_lost6064w  
s_dead_int_lost6569w  s_dead_int_lost7074w  s_dead_int_lost7579w  s_dead_int_lost8084w  

s_dead_1stint_lost_m  s_dead_1stint_lost_w  
s_dead_1stint_lost1519_  s_dead_1stint_lost2024_  s_dead_1stint_lost2529_  s_dead_1stint_lost3034_  s_dead_1stint_lost3539_  
s_dead_1stint_lost4044_  s_dead_1stint_lost4549_  s_dead_1stint_lost5054_  s_dead_1stint_lost5559_  s_dead_1stint_lost6064_  
s_dead_1stint_lost6569_  s_dead_1stint_lost7074_  s_dead_1stint_lost7579_  s_dead_1stint_lost8084_  

s_dead_1stint_lost1519m  s_dead_1stint_lost2024m  s_dead_1stint_lost2529m  s_dead_1stint_lost3034m  s_dead_1stint_lost3539m  
s_dead_1stint_lost4044m  s_dead_1stint_lost4549m  s_dead_1stint_lost5054m  s_dead_1stint_lost5559m  s_dead_1stint_lost6064m  
s_dead_1stint_lost6569m  s_dead_1stint_lost7074m  s_dead_1stint_lost7579m  s_dead_1stint_lost8084m  
s_dead_1stint_lost1519w  s_dead_1stint_lost2024w  s_dead_1stint_lost2529w  s_dead_1stint_lost3034w  s_dead_1stint_lost3539w  
s_dead_1stint_lost4044w  s_dead_1stint_lost4549w  s_dead_1stint_lost5054w  s_dead_1stint_lost5559w  s_dead_1stint_lost6064w  
s_dead_1stint_lost6569w  s_dead_1stint_lost7074w  s_dead_1stint_lost7579w  s_dead_1stint_lost8084w  

s_dead_subintlt6_lost_m  s_dead_subintlt6_lost_w  
s_dead_subintlt6_lost1519_  s_dead_subintlt6_lost2024_  s_dead_subintlt6_lost2529_  s_dead_subintlt6_lost3034_  s_dead_subintlt6_lost3539_  
s_dead_subintlt6_lost4044_  s_dead_subintlt6_lost4549_  s_dead_subintlt6_lost5054_  s_dead_subintlt6_lost5559_  s_dead_subintlt6_lost6064_  
s_dead_subintlt6_lost6569_  s_dead_subintlt6_lost7074_  s_dead_subintlt6_lost7579_  s_dead_subintlt6_lost8084_  

s_dead_subintlt6_lost1519m  s_dead_subintlt6_lost2024m  s_dead_subintlt6_lost2529m  s_dead_subintlt6_lost3034m  s_dead_subintlt6_lost3539m  
s_dead_subintlt6_lost4044m  s_dead_subintlt6_lost4549m  s_dead_subintlt6_lost5054m  s_dead_subintlt6_lost5559m  s_dead_subintlt6_lost6064m  
s_dead_subintlt6_lost6569m  s_dead_subintlt6_lost7074m  s_dead_subintlt6_lost7579m  s_dead_subintlt6_lost8084m  
s_dead_subintlt6_lost1519w  s_dead_subintlt6_lost2024w  s_dead_subintlt6_lost2529w  s_dead_subintlt6_lost3034w  s_dead_subintlt6_lost3539w  
s_dead_subintlt6_lost4044w  s_dead_subintlt6_lost4549w  s_dead_subintlt6_lost5054w  s_dead_subintlt6_lost5559w  s_dead_subintlt6_lost6064w  
s_dead_subintlt6_lost6569w  s_dead_subintlt6_lost7074w  s_dead_subintlt6_lost7579w  s_dead_subintlt6_lost8084w  

s_dead_subintgt6_lost_m  s_dead_subintgt6_lost_w  
s_dead_subintgt6_lost1519_  s_dead_subintgt6_lost2024_  s_dead_subintgt6_lost2529_  s_dead_subintgt6_lost3034_  s_dead_subintgt6_lost3539_  
s_dead_subintgt6_lost4044_  s_dead_subintgt6_lost4549_  s_dead_subintgt6_lost5054_  s_dead_subintgt6_lost5559_  s_dead_subintgt6_lost6064_  
s_dead_subintgt6_lost6569_  s_dead_subintgt6_lost7074_  s_dead_subintgt6_lost7579_  s_dead_subintgt6_lost8084_  

s_dead_subintgt6_lost1519m  s_dead_subintgt6_lost2024m  s_dead_subintgt6_lost2529m  s_dead_subintgt6_lost3034m  s_dead_subintgt6_lost3539m  
s_dead_subintgt6_lost4044m  s_dead_subintgt6_lost4549m  s_dead_subintgt6_lost5054m  s_dead_subintgt6_lost5559m  s_dead_subintgt6_lost6064m  
s_dead_subintgt6_lost6569m  s_dead_subintgt6_lost7074m  s_dead_subintgt6_lost7579m  s_dead_subintgt6_lost8084m  
s_dead_subintgt6_lost1519w  s_dead_subintgt6_lost2024w  s_dead_subintgt6_lost2529w  s_dead_subintgt6_lost3034w  s_dead_subintgt6_lost3539w  
s_dead_subintgt6_lost4044w  s_dead_subintgt6_lost4549w  s_dead_subintgt6_lost5054w  s_dead_subintgt6_lost5559w  s_dead_subintgt6_lost6064w  
s_dead_subintgt6_lost6569w  s_dead_subintgt6_lost7074w  s_dead_subintgt6_lost7579w  s_dead_subintgt6_lost8084w  

s_dead_A_cd4lt200_m  s_dead_A_cd4lt200_w  
s_dead_A_cd4lt2001519_  s_dead_A_cd4lt2002024_  s_dead_A_cd4lt2002529_  s_dead_A_cd4lt2003034_  s_dead_A_cd4lt2003539_  
s_dead_A_cd4lt2004044_  s_dead_A_cd4lt2004549_  s_dead_A_cd4lt2005054_  s_dead_A_cd4lt2005559_  s_dead_A_cd4lt2006064_  
s_dead_A_cd4lt2006569_  s_dead_A_cd4lt2007074_  s_dead_A_cd4lt2007579_  s_dead_A_cd4lt2008084_  
s_dead_A_cd4lt2001519m  s_dead_A_cd4lt2002024m  s_dead_A_cd4lt2002529m  s_dead_A_cd4lt2003034m  s_dead_A_cd4lt2003539m  
s_dead_A_cd4lt2004044m  s_dead_A_cd4lt2004549m  s_dead_A_cd4lt2005054m  s_dead_A_cd4lt2005559m  s_dead_A_cd4lt2006064m  
s_dead_A_cd4lt2006569m  s_dead_A_cd4lt2007074m  s_dead_A_cd4lt2007579m  s_dead_A_cd4lt2008084m  
s_dead_A_cd4lt2001519w  s_dead_A_cd4lt2002024w  s_dead_A_cd4lt2002529w  s_dead_A_cd4lt2003034w  s_dead_A_cd4lt2003539w  
s_dead_A_cd4lt2004044w  s_dead_A_cd4lt2004549w  s_dead_A_cd4lt2005054w  s_dead_A_cd4lt2005559w  s_dead_A_cd4lt2006064w  
s_dead_A_cd4lt2006569w  s_dead_A_cd4lt2007074w  s_dead_A_cd4lt2007579w  s_dead_A_cd4lt2008084w  

s_dead_A_cd4gt200_m  s_dead_A_cd4gt200_w  
s_dead_A_cd4gt2001519_  s_dead_A_cd4gt2002024_  s_dead_A_cd4gt2002529_  s_dead_A_cd4gt2003034_  s_dead_A_cd4gt2003539_  
s_dead_A_cd4gt2004044_  s_dead_A_cd4gt2004549_  s_dead_A_cd4gt2005054_  s_dead_A_cd4gt2005559_  s_dead_A_cd4gt2006064_  
s_dead_A_cd4gt2006569_  s_dead_A_cd4gt2007074_  s_dead_A_cd4gt2007579_  s_dead_A_cd4gt2008084_  

s_dead_A_cd4gt2001519m  s_dead_A_cd4gt2002024m  s_dead_A_cd4gt2002529m  s_dead_A_cd4gt2003034m  s_dead_A_cd4gt2003539m  
s_dead_A_cd4gt2004044m  s_dead_A_cd4gt2004549m  s_dead_A_cd4gt2005054m  s_dead_A_cd4gt2005559m  s_dead_A_cd4gt2006064m  
s_dead_A_cd4gt2006569m  s_dead_A_cd4gt2007074m  s_dead_A_cd4gt2007579m  s_dead_A_cd4gt2008084m  
s_dead_A_cd4gt2001519w  s_dead_A_cd4gt2002024w  s_dead_A_cd4gt2002529w  s_dead_A_cd4gt2003034w  s_dead_A_cd4gt2003539w  
s_dead_A_cd4gt2004044w  s_dead_A_cd4gt2004549w  s_dead_A_cd4gt2005054w  s_dead_A_cd4gt2005559w  s_dead_A_cd4gt2006064w  
s_dead_A_cd4gt2006569w  s_dead_A_cd4gt2007074w  s_dead_A_cd4gt2007579w  s_dead_A_cd4gt2008084w  

s_dead_Alt6_cd4lt200_m  s_dead_Alt6_cd4lt200_w  
s_dead_Alt6_cd4lt2001519_  s_dead_Alt6_cd4lt2002024_  s_dead_Alt6_cd4lt2002529_  s_dead_Alt6_cd4lt2003034_  s_dead_Alt6_cd4lt2003539_  
s_dead_Alt6_cd4lt2004044_  s_dead_Alt6_cd4lt2004549_  s_dead_Alt6_cd4lt2005054_  s_dead_Alt6_cd4lt2005559_  s_dead_Alt6_cd4lt2006064_  
s_dead_Alt6_cd4lt2006569_  s_dead_Alt6_cd4lt2007074_  s_dead_Alt6_cd4lt2007579_  s_dead_Alt6_cd4lt2008084_  
s_dead_Alt6_cd4lt2001519m  s_dead_Alt6_cd4lt2002024m  s_dead_Alt6_cd4lt2002529m  s_dead_Alt6_cd4lt2003034m  s_dead_Alt6_cd4lt2003539m  
s_dead_Alt6_cd4lt2004044m  s_dead_Alt6_cd4lt2004549m  s_dead_Alt6_cd4lt2005054m  s_dead_Alt6_cd4lt2005559m  s_dead_Alt6_cd4lt2006064m  
s_dead_Alt6_cd4lt2006569m  s_dead_Alt6_cd4lt2007074m  s_dead_Alt6_cd4lt2007579m  s_dead_Alt6_cd4lt2008084m  
s_dead_Alt6_cd4lt2001519w  s_dead_Alt6_cd4lt2002024w  s_dead_Alt6_cd4lt2002529w  s_dead_Alt6_cd4lt2003034w  s_dead_Alt6_cd4lt2003539w  
s_dead_Alt6_cd4lt2004044w  s_dead_Alt6_cd4lt2004549w  s_dead_Alt6_cd4lt2005054w  s_dead_Alt6_cd4lt2005559w  s_dead_Alt6_cd4lt2006064w  
s_dead_Alt6_cd4lt2006569w  s_dead_Alt6_cd4lt2007074w  s_dead_Alt6_cd4lt2007579w  s_dead_Alt6_cd4lt2008084w  

s_dead_Alt6_cd4gt200_m  s_dead_Alt6_cd4gt200_w  
s_dead_Alt6_cd4gt2001519_  s_dead_Alt6_cd4gt2002024_  s_dead_Alt6_cd4gt2002529_  s_dead_Alt6_cd4gt2003034_  s_dead_Alt6_cd4gt2003539_  
s_dead_Alt6_cd4gt2004044_  s_dead_Alt6_cd4gt2004549_  s_dead_Alt6_cd4gt2005054_  s_dead_Alt6_cd4gt2005559_  s_dead_Alt6_cd4gt2006064_  
s_dead_Alt6_cd4gt2006569_  s_dead_Alt6_cd4gt2007074_  s_dead_Alt6_cd4gt2007579_  s_dead_Alt6_cd4gt2008084_  

s_dead_Alt6_cd4gt2001519m  s_dead_Alt6_cd4gt2002024m  s_dead_Alt6_cd4gt2002529m  s_dead_Alt6_cd4gt2003034m  s_dead_Alt6_cd4gt2003539m  
s_dead_Alt6_cd4gt2004044m  s_dead_Alt6_cd4gt2004549m  s_dead_Alt6_cd4gt2005054m  s_dead_Alt6_cd4gt2005559m  s_dead_Alt6_cd4gt2006064m  
s_dead_Alt6_cd4gt2006569m  s_dead_Alt6_cd4gt2007074m  s_dead_Alt6_cd4gt2007579m  s_dead_Alt6_cd4gt2008084m  
s_dead_Alt6_cd4gt2001519w  s_dead_Alt6_cd4gt2002024w  s_dead_Alt6_cd4gt2002529w  s_dead_Alt6_cd4gt2003034w  s_dead_Alt6_cd4gt2003539w  
s_dead_Alt6_cd4gt2004044w  s_dead_Alt6_cd4gt2004549w  s_dead_Alt6_cd4gt2005054w  s_dead_Alt6_cd4gt2005559w  s_dead_Alt6_cd4gt2006064w  
s_dead_Alt6_cd4gt2006569w  s_dead_Alt6_cd4gt2007074w  s_dead_Alt6_cd4gt2007579w  s_dead_Alt6_cd4gt2008084w  

s_dead_Agt6_cd4lt200_m  s_dead_Agt6_cd4lt200_w  
s_dead_Agt6_cd4lt2001519_  s_dead_Agt6_cd4lt2002024_  s_dead_Agt6_cd4lt2002529_  s_dead_Agt6_cd4lt2003034_  s_dead_Agt6_cd4lt2003539_  
s_dead_Agt6_cd4lt2004044_  s_dead_Agt6_cd4lt2004549_  s_dead_Agt6_cd4lt2005054_  s_dead_Agt6_cd4lt2005559_  s_dead_Agt6_cd4lt2006064_  
s_dead_Agt6_cd4lt2006569_  s_dead_Agt6_cd4lt2007074_  s_dead_Agt6_cd4lt2007579_  s_dead_Agt6_cd4lt2008084_  

s_dead_Agt6_cd4lt2001519m  s_dead_Agt6_cd4lt2002024m  s_dead_Agt6_cd4lt2002529m  s_dead_Agt6_cd4lt2003034m  s_dead_Agt6_cd4lt2003539m  
s_dead_Agt6_cd4lt2004044m  s_dead_Agt6_cd4lt2004549m  s_dead_Agt6_cd4lt2005054m  s_dead_Agt6_cd4lt2005559m  s_dead_Agt6_cd4lt2006064m  
s_dead_Agt6_cd4lt2006569m  s_dead_Agt6_cd4lt2007074m  s_dead_Agt6_cd4lt2007579m  s_dead_Agt6_cd4lt2008084m  
s_dead_Agt6_cd4lt2001519w  s_dead_Agt6_cd4lt2002024w  s_dead_Agt6_cd4lt2002529w  s_dead_Agt6_cd4lt2003034w  s_dead_Agt6_cd4lt2003539w  
s_dead_Agt6_cd4lt2004044w  s_dead_Agt6_cd4lt2004549w  s_dead_Agt6_cd4lt2005054w  s_dead_Agt6_cd4lt2005559w  s_dead_Agt6_cd4lt2006064w  
s_dead_Agt6_cd4lt2006569w  s_dead_Agt6_cd4lt2007074w  s_dead_Agt6_cd4lt2007579w  s_dead_Agt6_cd4lt2008084w  

s_dead_Agt6_cd4gt200_m  s_dead_Agt6_cd4gt200_w  
s_dead_Agt6_cd4gt2001519_  s_dead_Agt6_cd4gt2002024_  s_dead_Agt6_cd4gt2002529_  s_dead_Agt6_cd4gt2003034_  s_dead_Agt6_cd4gt2003539_  
s_dead_Agt6_cd4gt2004044_  s_dead_Agt6_cd4gt2004549_  s_dead_Agt6_cd4gt2005054_  s_dead_Agt6_cd4gt2005559_  s_dead_Agt6_cd4gt2006064_  
s_dead_Agt6_cd4gt2006569_  s_dead_Agt6_cd4gt2007074_  s_dead_Agt6_cd4gt2007579_  s_dead_Agt6_cd4gt2008084_  
s_dead_Agt6_cd4gt2001519m  s_dead_Agt6_cd4gt2002024m  s_dead_Agt6_cd4gt2002529m  s_dead_Agt6_cd4gt2003034m  s_dead_Agt6_cd4gt2003539m  
s_dead_Agt6_cd4gt2004044m  s_dead_Agt6_cd4gt2004549m  s_dead_Agt6_cd4gt2005054m  s_dead_Agt6_cd4gt2005559m  s_dead_Agt6_cd4gt2006064m  
s_dead_Agt6_cd4gt2006569m  s_dead_Agt6_cd4gt2007074m  s_dead_Agt6_cd4gt2007579m  s_dead_Agt6_cd4gt2008084m  
s_dead_Agt6_cd4gt2001519w  s_dead_Agt6_cd4gt2002024w  s_dead_Agt6_cd4gt2002529w  s_dead_Agt6_cd4gt2003034w  s_dead_Agt6_cd4gt2003539w  
s_dead_Agt6_cd4gt2004044w  s_dead_Agt6_cd4gt2004549w  s_dead_Agt6_cd4gt2005054w  s_dead_Agt6_cd4gt2005559w  s_dead_Agt6_cd4gt2006064w  
s_dead_Agt6_cd4gt2006569w  s_dead_Agt6_cd4gt2007074w  s_dead_Agt6_cd4gt2007579w  s_dead_Agt6_cd4gt2008084w  

/*Transmissions*/

s_I_undiag 			s_I_diag_naive  	s_I_diag_startart  	s_I_onart		s_I_offart 		   s_I_onart_lt6m 	 s_I_onart_lt6m_nvs 
s_I_onart_gt6m_nvs	s_I_onart_gt6m_vs   s_I_offart_1stI 	s_I_offart_SI 	s_I_offart_SIlt6m  s_I_offart_SIgt6m 


s_I_undiag_m s_I_diag_naive_m s_I_diag_startart_m s_I_onart_m s_I_offart_m s_I_onart_lt6m_m s_I_onart_lt6m_nvs_m 
s_I_onart_gt6m_nvs_m s_I_onart_gt6m_vs_m s_I_offart_1stI_m s_I_offart_SI_m s_I_offart_SIlt6m_m s_I_offart_SIgt6m_m 
s_I_undiag_w s_I_diag_naive_w s_I_diag_startart_w s_I_onart_w s_I_offart_w s_I_onart_lt6m_w s_I_onart_lt6m_nvs_w 
s_I_onart_gt6m_nvs_w s_I_onart_gt6m_vs_w s_I_offart_1stI_w s_I_offart_SI_w s_I_offart_SIlt6m_w s_I_offart_SIgt6m_w 


s_I_undiag1519_ s_I_diag_naive1519_ s_I_diag_startart1519_ s_I_onart1519_ s_I_offart1519_ s_I_onart_lt6m1519_ 
s_I_onart_lt6m_nvs1519_ s_I_onart_gt6m_nvs1519_ s_I_onart_gt6m_vs1519_ s_I_offart_1stI1519_ s_I_offart_SI1519_ 
s_I_offart_SIlt6m1519_ s_I_offart_SIgt6m1519_ 
s_I_undiag2024_ s_I_diag_naive2024_ s_I_diag_startart2024_ s_I_onart2024_ s_I_offart2024_ s_I_onart_lt6m2024_ 
s_I_onart_lt6m_nvs2024_ s_I_onart_gt6m_nvs2024_ s_I_onart_gt6m_vs2024_ s_I_offart_1stI2024_ s_I_offart_SI2024_ 
s_I_offart_SIlt6m2024_ s_I_offart_SIgt6m2024_ 
s_I_undiag2529_ s_I_diag_naive2529_ s_I_diag_startart2529_ s_I_onart2529_ s_I_offart2529_ s_I_onart_lt6m2529_ 
s_I_onart_lt6m_nvs2529_ s_I_onart_gt6m_nvs2529_ s_I_onart_gt6m_vs2529_ s_I_offart_1stI2529_ s_I_offart_SI2529_ 
s_I_offart_SIlt6m2529_ s_I_offart_SIgt6m2529_ 
s_I_undiag3034_ s_I_diag_naive3034_ s_I_diag_startart3034_ s_I_onart3034_ s_I_offart3034_ s_I_onart_lt6m3034_ 
s_I_onart_lt6m_nvs3034_ s_I_onart_gt6m_nvs3034_ s_I_onart_gt6m_vs3034_ s_I_offart_1stI3034_ s_I_offart_SI3034_ 
s_I_offart_SIlt6m3034_ s_I_offart_SIgt6m3034_ 
s_I_undiag3539_ s_I_diag_naive3539_ s_I_diag_startart3539_ s_I_onart3539_ s_I_offart3539_ s_I_onart_lt6m3539_ 
s_I_onart_lt6m_nvs3539_ s_I_onart_gt6m_nvs3539_ s_I_onart_gt6m_vs3539_ s_I_offart_1stI3539_ s_I_offart_SI3539_ 
s_I_offart_SIlt6m3539_ s_I_offart_SIgt6m3539_ 
s_I_undiag4044_ s_I_diag_naive4044_ s_I_diag_startart4044_ s_I_onart4044_ s_I_offart4044_ s_I_onart_lt6m4044_ 
s_I_onart_lt6m_nvs4044_ s_I_onart_gt6m_nvs4044_ s_I_onart_gt6m_vs4044_ s_I_offart_1stI4044_ s_I_offart_SI4044_ 
s_I_offart_SIlt6m4044_ s_I_offart_SIgt6m4044_ 
s_I_undiag4549_ s_I_diag_naive4549_ s_I_diag_startart4549_ s_I_onart4549_ s_I_offart4549_ s_I_onart_lt6m4549_ 
s_I_onart_lt6m_nvs4549_ s_I_onart_gt6m_nvs4549_ s_I_onart_gt6m_vs4549_ s_I_offart_1stI4549_ s_I_offart_SI4549_ 
s_I_offart_SIlt6m4549_ s_I_offart_SIgt6m4549_ 
s_I_undiag5054_ s_I_diag_naive5054_ s_I_diag_startart5054_ s_I_onart5054_ s_I_offart5054_ s_I_onart_lt6m5054_ 
s_I_onart_lt6m_nvs5054_ s_I_onart_gt6m_nvs5054_ s_I_onart_gt6m_vs5054_ s_I_offart_1stI5054_ s_I_offart_SI5054_ 
s_I_offart_SIlt6m5054_ s_I_offart_SIgt6m5054_ 
s_I_undiag5559_ s_I_diag_naive5559_ s_I_diag_startart5559_ s_I_onart5559_ s_I_offart5559_ s_I_onart_lt6m5559_ 
s_I_onart_lt6m_nvs5559_ s_I_onart_gt6m_nvs5559_ s_I_onart_gt6m_vs5559_ s_I_offart_1stI5559_ s_I_offart_SI5559_ 
s_I_offart_SIlt6m5559_ s_I_offart_SIgt6m5559_ 
s_I_undiag6064_ s_I_diag_naive6064_ s_I_diag_startart6064_ s_I_onart6064_ s_I_offart6064_ s_I_onart_lt6m6064_ 
s_I_onart_lt6m_nvs6064_ s_I_onart_gt6m_nvs6064_ s_I_onart_gt6m_vs6064_ s_I_offart_1stI6064_ s_I_offart_SI6064_ 
s_I_offart_SIlt6m6064_ s_I_offart_SIgt6m6064_ 
s_I_undiag6569_ s_I_diag_naive6569_ s_I_diag_startart6569_ s_I_onart6569_ s_I_offart6569_ s_I_onart_lt6m6569_ 
s_I_onart_lt6m_nvs6569_ s_I_onart_gt6m_nvs6569_ s_I_onart_gt6m_vs6569_ s_I_offart_1stI6569_ s_I_offart_SI6569_ 
s_I_offart_SIlt6m6569_ s_I_offart_SIgt6m6569_ 
s_I_undiag7074_ s_I_diag_naive7074_ s_I_diag_startart7074_ s_I_onart7074_ s_I_offart7074_ s_I_onart_lt6m7074_ 
s_I_onart_lt6m_nvs7074_ s_I_onart_gt6m_nvs7074_ s_I_onart_gt6m_vs7074_ s_I_offart_1stI7074_ s_I_offart_SI7074_ 
s_I_offart_SIlt6m7074_ s_I_offart_SIgt6m7074_ 
s_I_undiag7579_ s_I_diag_naive7579_ s_I_diag_startart7579_ s_I_onart7579_ s_I_offart7579_ s_I_onart_lt6m7579_ 
s_I_onart_lt6m_nvs7579_ s_I_onart_gt6m_nvs7579_ s_I_onart_gt6m_vs7579_ s_I_offart_1stI7579_ s_I_offart_SI7579_ 
s_I_offart_SIlt6m7579_ s_I_offart_SIgt6m7579_ 
s_I_undiag8084_ s_I_diag_naive8084_ s_I_diag_startart8084_ s_I_onart8084_ s_I_offart8084_ s_I_onart_lt6m8084_ 
s_I_onart_lt6m_nvs8084_ s_I_onart_gt6m_nvs8084_ s_I_onart_gt6m_vs8084_ s_I_offart_1stI8084_ s_I_offart_SI8084_ 
s_I_offart_SIlt6m8084_ s_I_offart_SIgt6m8084_ 


s_I_undiag1519m s_I_diag_naive1519m s_I_diag_startart1519m s_I_onart1519m s_I_offart1519m s_I_onart_lt6m1519m 
s_I_onart_lt6m_nvs1519m s_I_onart_gt6m_nvs1519m s_I_onart_gt6m_vs1519m s_I_offart_1stI1519m s_I_offart_SI1519m 
s_I_offart_SIlt6m1519m s_I_offart_SIgt6m1519m 
s_I_undiag2024m s_I_diag_naive2024m s_I_diag_startart2024m s_I_onart2024m s_I_offart2024m s_I_onart_lt6m2024m 
s_I_onart_lt6m_nvs2024m s_I_onart_gt6m_nvs2024m s_I_onart_gt6m_vs2024m s_I_offart_1stI2024m s_I_offart_SI2024m 
s_I_offart_SIlt6m2024m s_I_offart_SIgt6m2024m 
s_I_undiag2529m s_I_diag_naive2529m s_I_diag_startart2529m s_I_onart2529m s_I_offart2529m s_I_onart_lt6m2529m 
s_I_onart_lt6m_nvs2529m s_I_onart_gt6m_nvs2529m s_I_onart_gt6m_vs2529m s_I_offart_1stI2529m s_I_offart_SI2529m 
s_I_offart_SIlt6m2529m s_I_offart_SIgt6m2529m 
s_I_undiag3034m s_I_diag_naive3034m s_I_diag_startart3034m s_I_onart3034m s_I_offart3034m s_I_onart_lt6m3034m 
s_I_onart_lt6m_nvs3034m s_I_onart_gt6m_nvs3034m s_I_onart_gt6m_vs3034m s_I_offart_1stI3034m s_I_offart_SI3034m 
s_I_offart_SIlt6m3034m s_I_offart_SIgt6m3034m 
s_I_undiag3539m s_I_diag_naive3539m s_I_diag_startart3539m s_I_onart3539m s_I_offart3539m s_I_onart_lt6m3539m 
s_I_onart_lt6m_nvs3539m s_I_onart_gt6m_nvs3539m s_I_onart_gt6m_vs3539m s_I_offart_1stI3539m s_I_offart_SI3539m 
s_I_offart_SIlt6m3539m s_I_offart_SIgt6m3539m 
s_I_undiag4044m s_I_diag_naive4044m s_I_diag_startart4044m s_I_onart4044m s_I_offart4044m s_I_onart_lt6m4044m 
s_I_onart_lt6m_nvs4044m s_I_onart_gt6m_nvs4044m s_I_onart_gt6m_vs4044m s_I_offart_1stI4044m s_I_offart_SI4044m 
s_I_offart_SIlt6m4044m s_I_offart_SIgt6m4044m 
s_I_undiag4549m s_I_diag_naive4549m s_I_diag_startart4549m s_I_onart4549m s_I_offart4549m s_I_onart_lt6m4549m 
s_I_onart_lt6m_nvs4549m s_I_onart_gt6m_nvs4549m s_I_onart_gt6m_vs4549m s_I_offart_1stI4549m s_I_offart_SI4549m 
s_I_offart_SIlt6m4549m s_I_offart_SIgt6m4549m 
s_I_undiag5054m s_I_diag_naive5054m s_I_diag_startart5054m s_I_onart5054m s_I_offart5054m s_I_onart_lt6m5054m 
s_I_onart_lt6m_nvs5054m s_I_onart_gt6m_nvs5054m s_I_onart_gt6m_vs5054m s_I_offart_1stI5054m s_I_offart_SI5054m 
s_I_offart_SIlt6m5054m s_I_offart_SIgt6m5054m 
s_I_undiag5559m s_I_diag_naive5559m s_I_diag_startart5559m s_I_onart5559m s_I_offart5559m s_I_onart_lt6m5559m 
s_I_onart_lt6m_nvs5559m s_I_onart_gt6m_nvs5559m s_I_onart_gt6m_vs5559m s_I_offart_1stI5559m s_I_offart_SI5559m 
s_I_offart_SIlt6m5559m s_I_offart_SIgt6m5559m 
s_I_undiag6064m s_I_diag_naive6064m s_I_diag_startart6064m s_I_onart6064m s_I_offart6064m s_I_onart_lt6m6064m 
s_I_onart_lt6m_nvs6064m s_I_onart_gt6m_nvs6064m s_I_onart_gt6m_vs6064m s_I_offart_1stI6064m s_I_offart_SI6064m 
s_I_offart_SIlt6m6064m s_I_offart_SIgt6m6064m 
s_I_undiag6569m s_I_diag_naive6569m s_I_diag_startart6569m s_I_onart6569m s_I_offart6569m s_I_onart_lt6m6569m 
s_I_onart_lt6m_nvs6569m s_I_onart_gt6m_nvs6569m s_I_onart_gt6m_vs6569m s_I_offart_1stI6569m s_I_offart_SI6569m 
s_I_offart_SIlt6m6569m s_I_offart_SIgt6m6569m 
s_I_undiag7074m s_I_diag_naive7074m s_I_diag_startart7074m s_I_onart7074m s_I_offart7074m s_I_onart_lt6m7074m 
s_I_onart_lt6m_nvs7074m s_I_onart_gt6m_nvs7074m s_I_onart_gt6m_vs7074m s_I_offart_1stI7074m s_I_offart_SI7074m 
s_I_offart_SIlt6m7074m s_I_offart_SIgt6m7074m 
s_I_undiag7579m s_I_diag_naive7579m s_I_diag_startart7579m s_I_onart7579m s_I_offart7579m s_I_onart_lt6m7579m 
s_I_onart_lt6m_nvs7579m s_I_onart_gt6m_nvs7579m s_I_onart_gt6m_vs7579m s_I_offart_1stI7579m s_I_offart_SI7579m 
s_I_offart_SIlt6m7579m s_I_offart_SIgt6m7579m 
s_I_undiag8084m s_I_diag_naive8084m s_I_diag_startart8084m s_I_onart8084m s_I_offart8084m s_I_onart_lt6m8084m 
s_I_onart_lt6m_nvs8084m s_I_onart_gt6m_nvs8084m s_I_onart_gt6m_vs8084m s_I_offart_1stI8084m s_I_offart_SI8084m 
s_I_offart_SIlt6m8084m s_I_offart_SIgt6m8084m 

s_I_undiag1519w s_I_diag_naive1519w s_I_diag_startart1519w s_I_onart1519w s_I_offart1519w s_I_onart_lt6m1519w 
s_I_onart_lt6m_nvs1519w s_I_onart_gt6m_nvs1519w s_I_onart_gt6m_vs1519w s_I_offart_1stI1519w s_I_offart_SI1519w 
s_I_offart_SIlt6m1519w s_I_offart_SIgt6m1519w 
s_I_undiag2024w s_I_diag_naive2024w s_I_diag_startart2024w s_I_onart2024w s_I_offart2024w s_I_onart_lt6m2024w 
s_I_onart_lt6m_nvs2024w s_I_onart_gt6m_nvs2024w s_I_onart_gt6m_vs2024w s_I_offart_1stI2024w s_I_offart_SI2024w 
s_I_offart_SIlt6m2024w s_I_offart_SIgt6m2024w 
s_I_undiag2529w s_I_diag_naive2529w s_I_diag_startart2529w s_I_onart2529w s_I_offart2529w s_I_onart_lt6m2529w 
s_I_onart_lt6m_nvs2529w s_I_onart_gt6m_nvs2529w s_I_onart_gt6m_vs2529w s_I_offart_1stI2529w s_I_offart_SI2529w 
s_I_offart_SIlt6m2529w s_I_offart_SIgt6m2529w 
s_I_undiag3034w s_I_diag_naive3034w s_I_diag_startart3034w s_I_onart3034w s_I_offart3034w s_I_onart_lt6m3034w 
s_I_onart_lt6m_nvs3034w s_I_onart_gt6m_nvs3034w s_I_onart_gt6m_vs3034w s_I_offart_1stI3034w s_I_offart_SI3034w 
s_I_offart_SIlt6m3034w s_I_offart_SIgt6m3034w 
s_I_undiag3539w s_I_diag_naive3539w s_I_diag_startart3539w s_I_onart3539w s_I_offart3539w s_I_onart_lt6m3539w 
s_I_onart_lt6m_nvs3539w s_I_onart_gt6m_nvs3539w s_I_onart_gt6m_vs3539w s_I_offart_1stI3539w s_I_offart_SI3539w 
s_I_offart_SIlt6m3539w s_I_offart_SIgt6m3539w 
s_I_undiag4044w s_I_diag_naive4044w s_I_diag_startart4044w s_I_onart4044w s_I_offart4044w s_I_onart_lt6m4044w 
s_I_onart_lt6m_nvs4044w s_I_onart_gt6m_nvs4044w s_I_onart_gt6m_vs4044w s_I_offart_1stI4044w s_I_offart_SI4044w 
s_I_offart_SIlt6m4044w s_I_offart_SIgt6m4044w 
s_I_undiag4549w s_I_diag_naive4549w s_I_diag_startart4549w s_I_onart4549w s_I_offart4549w s_I_onart_lt6m4549w 
s_I_onart_lt6m_nvs4549w s_I_onart_gt6m_nvs4549w s_I_onart_gt6m_vs4549w s_I_offart_1stI4549w s_I_offart_SI4549w 
s_I_offart_SIlt6m4549w s_I_offart_SIgt6m4549w 
s_I_undiag5054w s_I_diag_naive5054w s_I_diag_startart5054w s_I_onart5054w s_I_offart5054w s_I_onart_lt6m5054w 
s_I_onart_lt6m_nvs5054w s_I_onart_gt6m_nvs5054w s_I_onart_gt6m_vs5054w s_I_offart_1stI5054w s_I_offart_SI5054w 
s_I_offart_SIlt6m5054w s_I_offart_SIgt6m5054w 
s_I_undiag5559w s_I_diag_naive5559w s_I_diag_startart5559w s_I_onart5559w s_I_offart5559w s_I_onart_lt6m5559w 
s_I_onart_lt6m_nvs5559w s_I_onart_gt6m_nvs5559w s_I_onart_gt6m_vs5559w s_I_offart_1stI5559w s_I_offart_SI5559w 
s_I_offart_SIlt6m5559w s_I_offart_SIgt6m5559w 
s_I_undiag6064w s_I_diag_naive6064w s_I_diag_startart6064w s_I_onart6064w s_I_offart6064w s_I_onart_lt6m6064w 
s_I_onart_lt6m_nvs6064w s_I_onart_gt6m_nvs6064w s_I_onart_gt6m_vs6064w s_I_offart_1stI6064w s_I_offart_SI6064w 
s_I_offart_SIlt6m6064w s_I_offart_SIgt6m6064w 
s_I_undiag6569w s_I_diag_naive6569w s_I_diag_startart6569w s_I_onart6569w s_I_offart6569w s_I_onart_lt6m6569w 
s_I_onart_lt6m_nvs6569w s_I_onart_gt6m_nvs6569w s_I_onart_gt6m_vs6569w s_I_offart_1stI6569w s_I_offart_SI6569w 
s_I_offart_SIlt6m6569w s_I_offart_SIgt6m6569w 
s_I_undiag7074w s_I_diag_naive7074w s_I_diag_startart7074w s_I_onart7074w s_I_offart7074w s_I_onart_lt6m7074w 
s_I_onart_lt6m_nvs7074w s_I_onart_gt6m_nvs7074w s_I_onart_gt6m_vs7074w s_I_offart_1stI7074w s_I_offart_SI7074w 
s_I_offart_SIlt6m7074w s_I_offart_SIgt6m7074w 
s_I_undiag7579w s_I_diag_naive7579w s_I_diag_startart7579w s_I_onart7579w s_I_offart7579w s_I_onart_lt6m7579w 
s_I_onart_lt6m_nvs7579w s_I_onart_gt6m_nvs7579w s_I_onart_gt6m_vs7579w s_I_offart_1stI7579w s_I_offart_SI7579w 
s_I_offart_SIlt6m7579w s_I_offart_SIgt6m7579w 
s_I_undiag8084w s_I_diag_naive8084w s_I_diag_startart8084w s_I_onart8084w s_I_offart8084w s_I_onart_lt6m8084w 
s_I_onart_lt6m_nvs8084w s_I_onart_gt6m_nvs8084w s_I_onart_gt6m_vs8084w s_I_offart_1stI8084w s_I_offart_SI8084w 
s_I_offart_SIlt6m8084w s_I_offart_SIgt6m8084w;
run;


proc freq;table  s_dead_undiag  s_dead_diag_not_linked  
s_dead_Alt6_artcd4lt200_  s_dead_Alt6_artcd4gt200_  
s_dead_I_Alt6_Rcd4lt200_  s_dead_I_Alt6_Rcd4gt200_  
s_dead_A_vl1000_  s_dead_A_vg1000_  s_dead_Alt6_vl1000_  s_dead_Alt6_vg1000_  
s_dead_Agt6_vl1000_  s_dead_Agt6_vg1000_  
s_dead_int_lost  s_dead_1stint_lost  s_dead_subintlt6_lost  s_dead_subintgt6_lost  
s_dead_A_cd4lt200_  s_dead_A_cd4gt200_  
s_dead_Alt6_cd4lt200_  s_dead_Alt6_cd4gt200_  s_dead_Agt6_cd4lt200_  s_dead_Agt6_cd4gt200_  ;run;

proc freq;table 
s_I_undiag 			s_I_diag_naive  	s_I_diag_startart  	s_I_onart		s_I_offart 		   s_I_onart_lt6m 	 s_I_onart_lt6m_nvs 
s_I_onart_gt6m_nvs	s_I_onart_gt6m_vs   s_I_offart_1stI 	s_I_offart_SI 	s_I_offart_SIlt6m  s_I_offart_SIgt6m;run;

proc freq;table
s_I_undiag_m s_I_diag_naive_m s_I_diag_startart_m s_I_onart_m s_I_offart_m s_I_onart_lt6m_m s_I_onart_lt6m_nvs_m 
s_I_onart_gt6m_nvs_m s_I_onart_gt6m_vs_m s_I_offart_1stI_m s_I_offart_SI_m s_I_offart_SIlt6m_m s_I_offart_SIgt6m_m 
s_I_undiag_w s_I_diag_naive_w s_I_diag_startart_w s_I_onart_w s_I_offart_w s_I_onart_lt6m_w s_I_onart_lt6m_nvs_w 
s_I_onart_gt6m_nvs_w s_I_onart_gt6m_vs_w s_I_offart_1stI_w s_I_offart_SI_w s_I_offart_SIlt6m_w s_I_offart_SIgt6m_w 

s_I_undiag1519m s_I_diag_naive1519m s_I_diag_startart1519m s_I_onart1519m s_I_offart1519m s_I_onart_lt6m1519m 
s_I_onart_lt6m_nvs1519m s_I_onart_gt6m_nvs1519m s_I_onart_gt6m_vs1519m s_I_offart_1stI1519m s_I_offart_SI1519m 
s_I_offart_SIlt6m1519m s_I_offart_SIgt6m1519m 
s_I_undiag2024m s_I_diag_naive2024m s_I_diag_startart2024m s_I_onart2024m s_I_offart2024m s_I_onart_lt6m2024m 
s_I_onart_lt6m_nvs2024m s_I_onart_gt6m_nvs2024m s_I_onart_gt6m_vs2024m s_I_offart_1stI2024m s_I_offart_SI2024m 
s_I_offart_SIlt6m2024m s_I_offart_SIgt6m2024m 
s_I_undiag2529m s_I_diag_naive2529m s_I_diag_startart2529m s_I_onart2529m s_I_offart2529m s_I_onart_lt6m2529m 
s_I_onart_lt6m_nvs2529m s_I_onart_gt6m_nvs2529m s_I_onart_gt6m_vs2529m s_I_offart_1stI2529m s_I_offart_SI2529m 
s_I_offart_SIlt6m2529m s_I_offart_SIgt6m2529m 
s_I_undiag3034m s_I_diag_naive3034m s_I_diag_startart3034m s_I_onart3034m s_I_offart3034m s_I_onart_lt6m3034m 
s_I_onart_lt6m_nvs3034m s_I_onart_gt6m_nvs3034m s_I_onart_gt6m_vs3034m s_I_offart_1stI3034m s_I_offart_SI3034m 
s_I_offart_SIlt6m3034m s_I_offart_SIgt6m3034m 
s_I_undiag3539m s_I_diag_naive3539m s_I_diag_startart3539m s_I_onart3539m s_I_offart3539m s_I_onart_lt6m3539m 
s_I_onart_lt6m_nvs3539m s_I_onart_gt6m_nvs3539m s_I_onart_gt6m_vs3539m s_I_offart_1stI3539m s_I_offart_SI3539m 
s_I_offart_SIlt6m3539m s_I_offart_SIgt6m3539m 
s_I_undiag4044m s_I_diag_naive4044m s_I_diag_startart4044m s_I_onart4044m s_I_offart4044m s_I_onart_lt6m4044m 
s_I_onart_lt6m_nvs4044m s_I_onart_gt6m_nvs4044m s_I_onart_gt6m_vs4044m s_I_offart_1stI4044m s_I_offart_SI4044m 
s_I_offart_SIlt6m4044m s_I_offart_SIgt6m4044m 
s_I_undiag4549m s_I_diag_naive4549m s_I_diag_startart4549m s_I_onart4549m s_I_offart4549m s_I_onart_lt6m4549m 
s_I_onart_lt6m_nvs4549m s_I_onart_gt6m_nvs4549m s_I_onart_gt6m_vs4549m s_I_offart_1stI4549m s_I_offart_SI4549m 
s_I_offart_SIlt6m4549m s_I_offart_SIgt6m4549m 
s_I_undiag5054m s_I_diag_naive5054m s_I_diag_startart5054m s_I_onart5054m s_I_offart5054m s_I_onart_lt6m5054m 
s_I_onart_lt6m_nvs5054m s_I_onart_gt6m_nvs5054m s_I_onart_gt6m_vs5054m s_I_offart_1stI5054m s_I_offart_SI5054m 
s_I_offart_SIlt6m5054m s_I_offart_SIgt6m5054m 
s_I_undiag5559m s_I_diag_naive5559m s_I_diag_startart5559m s_I_onart5559m s_I_offart5559m s_I_onart_lt6m5559m 
s_I_onart_lt6m_nvs5559m s_I_onart_gt6m_nvs5559m s_I_onart_gt6m_vs5559m s_I_offart_1stI5559m s_I_offart_SI5559m 
s_I_offart_SIlt6m5559m s_I_offart_SIgt6m5559m 
s_I_undiag6064m s_I_diag_naive6064m s_I_diag_startart6064m s_I_onart6064m s_I_offart6064m s_I_onart_lt6m6064m 
s_I_onart_lt6m_nvs6064m s_I_onart_gt6m_nvs6064m s_I_onart_gt6m_vs6064m s_I_offart_1stI6064m s_I_offart_SI6064m 
s_I_offart_SIlt6m6064m s_I_offart_SIgt6m6064m 
s_I_undiag6569m s_I_diag_naive6569m s_I_diag_startart6569m s_I_onart6569m s_I_offart6569m s_I_onart_lt6m6569m 
s_I_onart_lt6m_nvs6569m s_I_onart_gt6m_nvs6569m s_I_onart_gt6m_vs6569m s_I_offart_1stI6569m s_I_offart_SI6569m 
s_I_offart_SIlt6m6569m s_I_offart_SIgt6m6569m 
s_I_undiag7074m s_I_diag_naive7074m s_I_diag_startart7074m s_I_onart7074m s_I_offart7074m s_I_onart_lt6m7074m 
s_I_onart_lt6m_nvs7074m s_I_onart_gt6m_nvs7074m s_I_onart_gt6m_vs7074m s_I_offart_1stI7074m s_I_offart_SI7074m 
s_I_offart_SIlt6m7074m s_I_offart_SIgt6m7074m 
s_I_undiag7579m s_I_diag_naive7579m s_I_diag_startart7579m s_I_onart7579m s_I_offart7579m s_I_onart_lt6m7579m 
s_I_onart_lt6m_nvs7579m s_I_onart_gt6m_nvs7579m s_I_onart_gt6m_vs7579m s_I_offart_1stI7579m s_I_offart_SI7579m 
s_I_offart_SIlt6m7579m s_I_offart_SIgt6m7579m 
s_I_undiag8084m s_I_diag_naive8084m s_I_diag_startart8084m s_I_onart8084m s_I_offart8084m s_I_onart_lt6m8084m 
s_I_onart_lt6m_nvs8084m s_I_onart_gt6m_nvs8084m s_I_onart_gt6m_vs8084m s_I_offart_1stI8084m s_I_offart_SI8084m 
s_I_offart_SIlt6m8084m s_I_offart_SIgt6m8084m 

s_I_undiag1519w s_I_diag_naive1519w s_I_diag_startart1519w s_I_onart1519w s_I_offart1519w s_I_onart_lt6m1519w 
s_I_onart_lt6m_nvs1519w s_I_onart_gt6m_nvs1519w s_I_onart_gt6m_vs1519w s_I_offart_1stI1519w s_I_offart_SI1519w 
s_I_offart_SIlt6m1519w s_I_offart_SIgt6m1519w 
s_I_undiag2024w s_I_diag_naive2024w s_I_diag_startart2024w s_I_onart2024w s_I_offart2024w s_I_onart_lt6m2024w 
s_I_onart_lt6m_nvs2024w s_I_onart_gt6m_nvs2024w s_I_onart_gt6m_vs2024w s_I_offart_1stI2024w s_I_offart_SI2024w 
s_I_offart_SIlt6m2024w s_I_offart_SIgt6m2024w 
s_I_undiag2529w s_I_diag_naive2529w s_I_diag_startart2529w s_I_onart2529w s_I_offart2529w s_I_onart_lt6m2529w 
s_I_onart_lt6m_nvs2529w s_I_onart_gt6m_nvs2529w s_I_onart_gt6m_vs2529w s_I_offart_1stI2529w s_I_offart_SI2529w 
s_I_offart_SIlt6m2529w s_I_offart_SIgt6m2529w 
s_I_undiag3034w s_I_diag_naive3034w s_I_diag_startart3034w s_I_onart3034w s_I_offart3034w s_I_onart_lt6m3034w 
s_I_onart_lt6m_nvs3034w s_I_onart_gt6m_nvs3034w s_I_onart_gt6m_vs3034w s_I_offart_1stI3034w s_I_offart_SI3034w 
s_I_offart_SIlt6m3034w s_I_offart_SIgt6m3034w 
s_I_undiag3539w s_I_diag_naive3539w s_I_diag_startart3539w s_I_onart3539w s_I_offart3539w s_I_onart_lt6m3539w 
s_I_onart_lt6m_nvs3539w s_I_onart_gt6m_nvs3539w s_I_onart_gt6m_vs3539w s_I_offart_1stI3539w s_I_offart_SI3539w 
s_I_offart_SIlt6m3539w s_I_offart_SIgt6m3539w 
s_I_undiag4044w s_I_diag_naive4044w s_I_diag_startart4044w s_I_onart4044w s_I_offart4044w s_I_onart_lt6m4044w 
s_I_onart_lt6m_nvs4044w s_I_onart_gt6m_nvs4044w s_I_onart_gt6m_vs4044w s_I_offart_1stI4044w s_I_offart_SI4044w 
s_I_offart_SIlt6m4044w s_I_offart_SIgt6m4044w 
s_I_undiag4549w s_I_diag_naive4549w s_I_diag_startart4549w s_I_onart4549w s_I_offart4549w s_I_onart_lt6m4549w 
s_I_onart_lt6m_nvs4549w s_I_onart_gt6m_nvs4549w s_I_onart_gt6m_vs4549w s_I_offart_1stI4549w s_I_offart_SI4549w 
s_I_offart_SIlt6m4549w s_I_offart_SIgt6m4549w 
s_I_undiag5054w s_I_diag_naive5054w s_I_diag_startart5054w s_I_onart5054w s_I_offart5054w s_I_onart_lt6m5054w 
s_I_onart_lt6m_nvs5054w s_I_onart_gt6m_nvs5054w s_I_onart_gt6m_vs5054w s_I_offart_1stI5054w s_I_offart_SI5054w 
s_I_offart_SIlt6m5054w s_I_offart_SIgt6m5054w 
s_I_undiag5559w s_I_diag_naive5559w s_I_diag_startart5559w s_I_onart5559w s_I_offart5559w s_I_onart_lt6m5559w 
s_I_onart_lt6m_nvs5559w s_I_onart_gt6m_nvs5559w s_I_onart_gt6m_vs5559w s_I_offart_1stI5559w s_I_offart_SI5559w 
s_I_offart_SIlt6m5559w s_I_offart_SIgt6m5559w 
s_I_undiag6064w s_I_diag_naive6064w s_I_diag_startart6064w s_I_onart6064w s_I_offart6064w s_I_onart_lt6m6064w 
s_I_onart_lt6m_nvs6064w s_I_onart_gt6m_nvs6064w s_I_onart_gt6m_vs6064w s_I_offart_1stI6064w s_I_offart_SI6064w 
s_I_offart_SIlt6m6064w s_I_offart_SIgt6m6064w 
s_I_undiag6569w s_I_diag_naive6569w s_I_diag_startart6569w s_I_onart6569w s_I_offart6569w s_I_onart_lt6m6569w 
s_I_onart_lt6m_nvs6569w s_I_onart_gt6m_nvs6569w s_I_onart_gt6m_vs6569w s_I_offart_1stI6569w s_I_offart_SI6569w 
s_I_offart_SIlt6m6569w s_I_offart_SIgt6m6569w 
s_I_undiag7074w s_I_diag_naive7074w s_I_diag_startart7074w s_I_onart7074w s_I_offart7074w s_I_onart_lt6m7074w 
s_I_onart_lt6m_nvs7074w s_I_onart_gt6m_nvs7074w s_I_onart_gt6m_vs7074w s_I_offart_1stI7074w s_I_offart_SI7074w 
s_I_offart_SIlt6m7074w s_I_offart_SIgt6m7074w 
s_I_undiag7579w s_I_diag_naive7579w s_I_diag_startart7579w s_I_onart7579w s_I_offart7579w s_I_onart_lt6m7579w 
s_I_onart_lt6m_nvs7579w s_I_onart_gt6m_nvs7579w s_I_onart_gt6m_vs7579w s_I_offart_1stI7579w s_I_offart_SI7579w 
s_I_offart_SIlt6m7579w s_I_offart_SIgt6m7579w 
s_I_undiag8084w s_I_diag_naive8084w s_I_diag_startart8084w s_I_onart8084w s_I_offart8084w s_I_onart_lt6m8084w 
s_I_onart_lt6m_nvs8084w s_I_onart_gt6m_nvs8084w s_I_onart_gt6m_vs8084w s_I_offart_1stI8084w s_I_offart_SI8084w 
s_I_offart_SIlt6m8084w s_I_offart_SIgt6m8084w 
;run;



proc sort data=y; by cald run ;run;
data y;set y;count_csim+1;by  cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=y;var count_csim cald;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 275  ;
%let year_end = 2045 ;
proc sort;by cald ;run;


  ***Macro var used to calculate means across each year and transpose to one line per run,
  need to write manually all the years to merge;
/*
  
proc sort data=y; by count_csim cald ;run;
data one;set y;keep s_dead_undiag count_csim cald ;run;
proc means  noprint data=one; var s_dead_undiag; output out=y_00 mean= s_dead_undiag_00; by count_csim ; where 2000 <= cald < 2001;run; 
proc means  noprint data=one; var s_dead_undiag; output out=y_01 mean= s_dead_undiag_01; by count_csim ; where 2001 <= cald < 2002;run;

data s_dead_undiag ; merge y_00 y_01  ;  
drop _NAME_ _TYPE_ _FREQ_;run;
proc transpose data=s_dead_undiag out=l_s_dead_undiag prefix=s_dead_undiag; id count_csim;run;

data l_s_dead_undiag;set l_s_dead_undiag;
*cald_c= substr(_NAME_,length(_NAME_)-3,4);
*cald= input(cald_c,4.);
cald_d= input(substr(_NAME_,length(_NAME_)-3,4),4.);
run;

data l_s_dead_undiag;set l_s_dead_undiag;***creates one dataset per variable;
p5_s_dead_undiag  = PCTL(5,of s_dead_undiag1-s_dead_undiag55);
p95_s_dead_undiag = PCTL(95,of s_dead_undiag1-s_dead_undiag55);
p50_s_dead_undiag = median(of s_dead_undiag1-s_dead_undiag55);
keep cald p5_s_dead_undiag p95_s_dead_undiag p50_s_dead_undiag;
  run;
  */
%macro var_d(v);
data one;set y;keep &v count_csim cald;
proc sort;by count_csim cald;
%let count=2000;
%do %while (&count le 2050);
proc means noprint data = one; var &v; output out = y_&count mean=&v._&count; by count_csim ; where &count <= cald < &count+1;
%let count = %eval(&count + 1);
%end;

data &v ;merge 
y_2000 y_2001 y_2002 y_2003 y_2004 y_2005 y_2006 y_2007 y_2008 y_2009 y_2010
	   y_2011 y_2012 y_2013 y_2014 y_2015 y_2016 y_2017 y_2018 y_2019 y_2020
	   y_2021 y_2022 y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030
	   y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040
   	   y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050;

drop _NAME_ _TYPE_ _FREQ_;run;
proc datasets nodetails nowarn nolist;

delete y_2000 y_2001 y_2002 y_2003 y_2004 y_2005 y_2006 y_2007 y_2008 y_2009 y_2010
	   		  y_2011 y_2012 y_2013 y_2014 y_2015 y_2016 y_2017 y_2018 y_2019 y_2020
	   		  y_2021 y_2022 y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030
	   		  y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040
   	   		  y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050;quit;

proc transpose data=&v out=l_&v prefix=&v;id  count_csim;run;
data l_&v;set l_&v;
cald= input(substr(_NAME_,length(_NAME_)-3,4),4.);drop _NAME_;run;

data l_&v;set l_&v;
*p5_&v  = PCTL(5,of &v.1-&v.&nfit);
*p95_&v = PCTL(95,of &v.1-&v.&nfit);
p50_&v = median(of &v.1-&v.&nfit);
keep cald /*p5_&v p95_&v*/ p50_&v;
run;
proc datasets nodetails nowarn nolist;delete &v;run;
%mend var_d;


%var_d(n_alive1564_);	   %var_d(n_alive1564_m);		%var_d(n_alive1564_w);		 %var_d(prevalence1564_); %var_d(prevalence1564m); %var_d(prevalence1564w);	
%var_d(incidence1564_);%var_d(incidence1564_m); %var_d(incidence1564_w); %var_d(p_diag);		  %var_d(p_diag_m);		  %var_d(p_diag_w);
%var_d(p_onart_diag);  %var_d(p_onart_diag_m);	%var_d(p_onart_diag_w);  %var_d(p_onart_vl1000_); %var_d(p_onart_vl1000_m);%var_d(p_onart_vl1000_w);

%var_d(n_hiv1519_);  %var_d(n_hiv2024_);  %var_d(n_hiv2529_);  %var_d(n_hiv3034_);  %var_d(n_hiv3539_);  %var_d(n_hiv4044_);  %var_d(n_hiv4549_);  %var_d(n_hiv5054_); 
%var_d(n_hiv5559_);  %var_d(n_hiv6064_);  %var_d(n_hiv6569_);  %var_d(n_hiv7074_);  %var_d(n_hiv7579_);  %var_d(n_hiv8084_);  
%var_d(n_hiv1519m);  %var_d(n_hiv2024m);  %var_d(n_hiv2529m);  %var_d(n_hiv3034m);  %var_d(n_hiv3539m);  %var_d(n_hiv4044m);  %var_d(n_hiv4549m);  %var_d(n_hiv5054m); 
%var_d(n_hiv5559m);  %var_d(n_hiv6064m);  %var_d(n_hiv6569m);  %var_d(n_hiv7074m);  %var_d(n_hiv7579m);  %var_d(n_hiv8084m);  
%var_d(n_hiv1519w);  %var_d(n_hiv2024w);  %var_d(n_hiv2529w);  %var_d(n_hiv3034w);  %var_d(n_hiv3539w);  %var_d(n_hiv4044w);  %var_d(n_hiv4549w);  %var_d(n_hiv5054w);  
%var_d(n_hiv5559w);  %var_d(n_hiv6064w);  %var_d(n_hiv6569w);  %var_d(n_hiv7074w);  %var_d(n_hiv7579w);  %var_d(n_hiv8084w); 

%var_d(n_hiv_death_m); %var_d(n_hiv_death_w); %var_d(n_hiv_death);
/* These were not outputted but should be in the next round;
%var_d(n_hiv_death1519m);  %var_d(n_hiv_death2024m);  %var_d(n_hiv_death2529m);  %var_d(n_hiv_death3034m);  %var_d(n_hiv_death3539m);  %var_d(n_hiv_death4044m);  %var_d(n_hiv_death4549m); 
%var_d(n_hiv_death5054m);  %var_d(n_hiv_death5559m);  %var_d(n_hiv_death6064m);  %var_d(n_hiv_death6569m);  %var_d(n_hiv_death7074m);  %var_d(n_hiv_death7579m);  %var_d(n_hiv_death8084m);  
%var_d(n_hiv_death1519w);  %var_d(n_hiv_death2024w);  %var_d(n_hiv_death2529w);  %var_d(n_hiv_death3034w);  %var_d(n_hiv_death3539w);  %var_d(n_hiv_death4044w);  %var_d(n_hiv_death4549w); 
%var_d(n_hiv_death5054w);  %var_d(n_hiv_death5559w);  %var_d(n_hiv_death6064w);  %var_d(n_hiv_death6569w);  %var_d(n_hiv_death7074w);  %var_d(n_hiv_death7579w);  %var_d(n_hiv_death8084w); 
*/

%var_d(s_dead_undiag); 		    %var_d(s_dead_diag_not_linked);   %var_d(s_dead_Alt6_artcd4lt200_); %var_d(s_dead_Alt6_artcd4gt200_);
%var_d(s_dead_I_Alt6_Rcd4lt200_); %var_d(s_dead_I_Alt6_Rcd4gt200_); 
%var_d(s_dead_A_vl1000_); 	    %var_d(s_dead_A_vg1000_);		  %var_d(s_dead_Alt6_vl1000_); 		%var_d(s_dead_Alt6_vg1000_);  
%var_d(s_dead_Agt6_vl1000_);	%var_d(s_dead_Agt6_vg1000_);	  %var_d(s_dead_int_lost);			%var_d(s_dead_1stint_lost); 
%var_d(s_dead_subintlt6_lost);  %var_d(s_dead_subintgt6_lost);    %var_d(s_dead_A_cd4lt200_);       %var_d(s_dead_A_cd4gt200_);  
%var_d(s_dead_Alt6_cd4lt200_);  %var_d(s_dead_Alt6_cd4gt200_); 	  %var_d(s_dead_Agt6_cd4lt200_);  	%var_d(s_dead_Agt6_cd4gt200_);  

%var_d(s_dead_undiag_m); 	 %var_d(s_dead_undiag_w);  
%var_d(s_dead_undiag1519_);  %var_d(s_dead_undiag2024_);  %var_d(s_dead_undiag2529_);  %var_d(s_dead_undiag3034_);  %var_d(s_dead_undiag3539_);  
%var_d(s_dead_undiag4044_);  %var_d(s_dead_undiag4549_);  %var_d(s_dead_undiag5054_);  %var_d(s_dead_undiag5559_);  %var_d(s_dead_undiag6064_);  
%var_d(s_dead_undiag6569_);  %var_d(s_dead_undiag7074_);  %var_d(s_dead_undiag7579_);  %var_d(s_dead_undiag8084_);  
%var_d(s_dead_undiag1519m);  %var_d(s_dead_undiag2024m);  %var_d(s_dead_undiag2529m);  %var_d(s_dead_undiag3034m);  %var_d(s_dead_undiag3539m);  
%var_d(s_dead_undiag4044m);  %var_d(s_dead_undiag4549m);  %var_d(s_dead_undiag5054m);  %var_d(s_dead_undiag5559m);  %var_d(s_dead_undiag6064m);  
%var_d(s_dead_undiag6569m);  %var_d(s_dead_undiag7074m);  %var_d(s_dead_undiag7579m);  %var_d(s_dead_undiag8084m);  
%var_d(s_dead_undiag1519w);  %var_d(s_dead_undiag2024w);  %var_d(s_dead_undiag2529w);  %var_d(s_dead_undiag3034w);  %var_d(s_dead_undiag3539w);  
%var_d(s_dead_undiag4044w);  %var_d(s_dead_undiag4549w);  %var_d(s_dead_undiag5054w);  %var_d(s_dead_undiag5559w);  %var_d(s_dead_undiag6064w);  
%var_d(s_dead_undiag6569w);  %var_d(s_dead_undiag7074w);  %var_d(s_dead_undiag7579w);  %var_d(s_dead_undiag8084w);  

%var_d(s_dead_diag_not_linked_m);  	  %var_d(s_dead_diag_not_linked_w);  
%var_d(s_dead_diag_not_linked1519_);  %var_d(s_dead_diag_not_linked2024_);  %var_d(s_dead_diag_not_linked2529_);  %var_d(s_dead_diag_not_linked3034_);  %var_d(s_dead_diag_not_linked3539_);  
%var_d(s_dead_diag_not_linked4044_);  %var_d(s_dead_diag_not_linked4549_);  %var_d(s_dead_diag_not_linked5054_);  %var_d(s_dead_diag_not_linked5559_);  %var_d(s_dead_diag_not_linked6064_);  
%var_d(s_dead_diag_not_linked6569_);  %var_d(s_dead_diag_not_linked7074_);  %var_d(s_dead_diag_not_linked7579_);  %var_d(s_dead_diag_not_linked8084_);  
%var_d(s_dead_diag_not_linked1519m);  %var_d(s_dead_diag_not_linked2024m);  %var_d(s_dead_diag_not_linked2529m);  %var_d(s_dead_diag_not_linked3034m);  %var_d(s_dead_diag_not_linked3539m);  
%var_d(s_dead_diag_not_linked4044m);  %var_d(s_dead_diag_not_linked4549m);  %var_d(s_dead_diag_not_linked5054m);  %var_d(s_dead_diag_not_linked5559m);  %var_d(s_dead_diag_not_linked6064m);  
%var_d(s_dead_diag_not_linked6569m);  %var_d(s_dead_diag_not_linked7074m);  %var_d(s_dead_diag_not_linked7579m);  %var_d(s_dead_diag_not_linked8084m);  
%var_d(s_dead_diag_not_linked1519w);  %var_d(s_dead_diag_not_linked2024w);  %var_d(s_dead_diag_not_linked2529w);  %var_d(s_dead_diag_not_linked3034w);  %var_d(s_dead_diag_not_linked3539w);  
%var_d(s_dead_diag_not_linked4044w);  %var_d(s_dead_diag_not_linked4549w);  %var_d(s_dead_diag_not_linked5054w);  %var_d(s_dead_diag_not_linked5559w);  %var_d(s_dead_diag_not_linked6064w);  
%var_d(s_dead_diag_not_linked6569w);  %var_d(s_dead_diag_not_linked7074w);  %var_d(s_dead_diag_not_linked7579w);  %var_d(s_dead_diag_not_linked8084w);  

%var_d(s_dead_Alt6_artcd4lt200_m);     %var_d(s_dead_Alt6_artcd4lt200_w);  
%var_d(s_dead_Alt6_Acd4lt2001519_);  %var_d(s_dead_Alt6_Acd4lt2002024_);  %var_d(s_dead_Alt6_Acd4lt2002529_);  %var_d(s_dead_Alt6_Acd4lt2003034_);  %var_d(s_dead_Alt6_Acd4lt2003539_);  
%var_d(s_dead_Alt6_Acd4lt2004044_);  %var_d(s_dead_Alt6_Acd4lt2004549_);  %var_d(s_dead_Alt6_Acd4lt2005054_);  %var_d(s_dead_Alt6_Acd4lt2005559_);  %var_d(s_dead_Alt6_Acd4lt2006064_);  
%var_d(s_dead_Alt6_Acd4lt2006569_);  %var_d(s_dead_Alt6_Acd4lt2007074_);  %var_d(s_dead_Alt6_Acd4lt2007579_);  %var_d(s_dead_Alt6_Acd4lt2008084_);  
%var_d(s_dead_Alt6_Acd4lt2001519m);  %var_d(s_dead_Alt6_Acd4lt2002024m);  %var_d(s_dead_Alt6_Acd4lt2002529m);  %var_d(s_dead_Alt6_Acd4lt2003034m);  %var_d(s_dead_Alt6_Acd4lt2003539m);  
%var_d(s_dead_Alt6_Acd4lt2004044m);  %var_d(s_dead_Alt6_Acd4lt2004549m);  %var_d(s_dead_Alt6_Acd4lt2005054m);  %var_d(s_dead_Alt6_Acd4lt2005559m);  %var_d(s_dead_Alt6_Acd4lt2006064m);  
%var_d(s_dead_Alt6_Acd4lt2006569m);  %var_d(s_dead_Alt6_Acd4lt2007074m);  %var_d(s_dead_Alt6_Acd4lt2007579m);  %var_d(s_dead_Alt6_Acd4lt2008084m);  
%var_d(s_dead_Alt6_Acd4lt2001519w);  %var_d(s_dead_Alt6_Acd4lt2002024w);  %var_d(s_dead_Alt6_Acd4lt2002529w);  %var_d(s_dead_Alt6_Acd4lt2003034w);  %var_d(s_dead_Alt6_Acd4lt2003539w);  
%var_d(s_dead_Alt6_Acd4lt2004044w);  %var_d(s_dead_Alt6_Acd4lt2004549w);  %var_d(s_dead_Alt6_Acd4lt2005054w);  %var_d(s_dead_Alt6_Acd4lt2005559w);  %var_d(s_dead_Alt6_Acd4lt2006064w);  
%var_d(s_dead_Alt6_Acd4lt2006569w);  %var_d(s_dead_Alt6_Acd4lt2007074w);  %var_d(s_dead_Alt6_Acd4lt2007579w);  %var_d(s_dead_Alt6_Acd4lt2008084w);  

%var_d(s_dead_Alt6_artcd4gt200_m);     %var_d(s_dead_Alt6_artcd4gt200_w);  
%var_d(s_dead_Alt6_Acd4gt2001519_);  %var_d(s_dead_Alt6_Acd4gt2002024_);  %var_d(s_dead_Alt6_Acd4gt2002529_);  %var_d(s_dead_Alt6_Acd4gt2003034_);  %var_d(s_dead_Alt6_Acd4gt2003539_);  
%var_d(s_dead_Alt6_Acd4gt2004044_);  %var_d(s_dead_Alt6_Acd4gt2004549_);  %var_d(s_dead_Alt6_Acd4gt2005054_);  %var_d(s_dead_Alt6_Acd4gt2005559_);  %var_d(s_dead_Alt6_Acd4gt2006064_);  
%var_d(s_dead_Alt6_Acd4gt2006569_);  %var_d(s_dead_Alt6_Acd4gt2007074_);  %var_d(s_dead_Alt6_Acd4gt2007579_);  %var_d(s_dead_Alt6_Acd4gt2008084_);  
%var_d(s_dead_Alt6_Acd4gt2001519m);  %var_d(s_dead_Alt6_Acd4gt2002024m);  %var_d(s_dead_Alt6_Acd4gt2002529m);  %var_d(s_dead_Alt6_Acd4gt2003034m);  %var_d(s_dead_Alt6_Acd4gt2003539m);  
%var_d(s_dead_Alt6_Acd4gt2004044m);  %var_d(s_dead_Alt6_Acd4gt2004549m);  %var_d(s_dead_Alt6_Acd4gt2005054m);  %var_d(s_dead_Alt6_Acd4gt2005559m);  %var_d(s_dead_Alt6_Acd4gt2006064m);  
%var_d(s_dead_Alt6_Acd4gt2006569m);  %var_d(s_dead_Alt6_Acd4gt2007074m);  %var_d(s_dead_Alt6_Acd4gt2007579m);  %var_d(s_dead_Alt6_Acd4gt2008084m);  
%var_d(s_dead_Alt6_Acd4gt2001519w);  %var_d(s_dead_Alt6_Acd4gt2002024w);  %var_d(s_dead_Alt6_Acd4gt2002529w);  %var_d(s_dead_Alt6_Acd4gt2003034w);  %var_d(s_dead_Alt6_Acd4gt2003539w);  
%var_d(s_dead_Alt6_Acd4gt2004044w);  %var_d(s_dead_Alt6_Acd4gt2004549w);  %var_d(s_dead_Alt6_Acd4gt2005054w);  %var_d(s_dead_Alt6_Acd4gt2005559w);  %var_d(s_dead_Alt6_Acd4gt2006064w);  
%var_d(s_dead_Alt6_Acd4gt2006569w);  %var_d(s_dead_Alt6_Acd4gt2007074w);  %var_d(s_dead_Alt6_Acd4gt2007579w);  %var_d(s_dead_Alt6_Acd4gt2008084w);  

%var_d(s_dead_I_Alt6_Rcd4lt200_m);  %var_d(s_dead_I_Alt6_Rcd4lt200_w);  
%var_d(s_d_I_Alt6_Rcd4lt2001519_);  %var_d(s_d_I_Alt6_Rcd4lt2002024_);  %var_d(s_d_I_Alt6_Rcd4lt2002529_);  %var_d(s_d_I_Alt6_Rcd4lt2003034_);  %var_d(s_d_I_Alt6_Rcd4lt2003539_);  
%var_d(s_d_I_Alt6_Rcd4lt2004044_);  %var_d(s_d_I_Alt6_Rcd4lt2004549_);  %var_d(s_d_I_Alt6_Rcd4lt2005054_);  %var_d(s_d_I_Alt6_Rcd4lt2005559_);   %var_d(s_d_I_Alt6_Rcd4lt2006064_);  
%var_d(s_d_I_Alt6_Rcd4lt2006569_);  %var_d(s_d_I_Alt6_Rcd4lt2007074_);  %var_d(s_d_I_Alt6_Rcd4lt2007579_);  %var_d(s_d_I_Alt6_Rcd4lt2008084_);  
%var_d(s_d_I_Alt6_Rcd4lt2001519m);  %var_d(s_d_I_Alt6_Rcd4lt2002024m);  %var_d(s_d_I_Alt6_Rcd4lt2002529m);  %var_d(s_d_I_Alt6_Rcd4lt2003034m);  %var_d(s_d_I_Alt6_Rcd4lt2003539m);  
%var_d(s_d_I_Alt6_Rcd4lt2004044m);  %var_d(s_d_I_Alt6_Rcd4lt2004549m);  %var_d(s_d_I_Alt6_Rcd4lt2005054m);  %var_d(s_d_I_Alt6_Rcd4lt2005559m);   %var_d(s_d_I_Alt6_Rcd4lt2006064m);  
%var_d(s_d_I_Alt6_Rcd4lt2006569m);  %var_d(s_d_I_Alt6_Rcd4lt2007074m);  %var_d(s_d_I_Alt6_Rcd4lt2007579m);  %var_d(s_d_I_Alt6_Rcd4lt2008084m);  
%var_d(s_d_I_Alt6_Rcd4lt2001519w);  %var_d(s_d_I_Alt6_Rcd4lt2002024w);  %var_d(s_d_I_Alt6_Rcd4lt2002529w);  %var_d(s_d_I_Alt6_Rcd4lt2003034w);  %var_d(s_d_I_Alt6_Rcd4lt2003539w);  
%var_d(s_d_I_Alt6_Rcd4lt2004044w);  %var_d(s_d_I_Alt6_Rcd4lt2004549w);  %var_d(s_d_I_Alt6_Rcd4lt2005054w);  %var_d(s_d_I_Alt6_Rcd4lt2005559w);   %var_d(s_d_I_Alt6_Rcd4lt2006064w);  
%var_d(s_d_I_Alt6_Rcd4lt2006569w);  %var_d(s_d_I_Alt6_Rcd4lt2007074w);  %var_d(s_d_I_Alt6_Rcd4lt2007579w);  %var_d(s_d_I_Alt6_Rcd4lt2008084w);  

%var_d(s_dead_I_Alt6_Rcd4gt200_m);  %var_d(s_dead_I_Alt6_Rcd4gt200_w);  
%var_d(s_d_I_Alt6_Rcd4gt2001519_);  %var_d(s_d_I_Alt6_Rcd4gt2002024_);  %var_d(s_d_I_Alt6_Rcd4gt2002529_);  %var_d(s_d_I_Alt6_Rcd4gt2003034_);  %var_d(s_d_I_Alt6_Rcd4gt2003539_);  
%var_d(s_d_I_Alt6_Rcd4gt2004044_);  %var_d(s_d_I_Alt6_Rcd4gt2004549_);  %var_d(s_d_I_Alt6_Rcd4gt2005054_);  %var_d(s_d_I_Alt6_Rcd4gt2005559_);   %var_d(s_d_I_Alt6_Rcd4gt2006064_);  
%var_d(s_d_I_Alt6_Rcd4gt2006569_);  %var_d(s_d_I_Alt6_Rcd4gt2007074_);  %var_d(s_d_I_Alt6_Rcd4gt2007579_);  %var_d(s_d_I_Alt6_Rcd4gt2008084_);  
%var_d(s_d_I_Alt6_Rcd4gt2001519m);  %var_d(s_d_I_Alt6_Rcd4gt2002024m);  %var_d(s_d_I_Alt6_Rcd4gt2002529m);  %var_d(s_d_I_Alt6_Rcd4gt2003034m);  %var_d(s_d_I_Alt6_Rcd4gt2003539m);  
%var_d(s_d_I_Alt6_Rcd4gt2004044m);  %var_d(s_d_I_Alt6_Rcd4gt2004549m);  %var_d(s_d_I_Alt6_Rcd4gt2005054m);  %var_d(s_d_I_Alt6_Rcd4gt2005559m);   %var_d(s_d_I_Alt6_Rcd4gt2006064m);  
%var_d(s_d_I_Alt6_Rcd4gt2006569m);  %var_d(s_d_I_Alt6_Rcd4gt2007074m);  %var_d(s_d_I_Alt6_Rcd4gt2007579m);  %var_d(s_d_I_Alt6_Rcd4gt2008084m);  
%var_d(s_d_I_Alt6_Rcd4gt2001519w);  %var_d(s_d_I_Alt6_Rcd4gt2002024w);  %var_d(s_d_I_Alt6_Rcd4gt2002529w);  %var_d(s_d_I_Alt6_Rcd4gt2003034w);  %var_d(s_d_I_Alt6_Rcd4gt2003539w);  
%var_d(s_d_I_Alt6_Rcd4gt2004044w);  %var_d(s_d_I_Alt6_Rcd4gt2004549w);  %var_d(s_d_I_Alt6_Rcd4gt2005054w);  %var_d(s_d_I_Alt6_Rcd4gt2005559w);   %var_d(s_d_I_Alt6_Rcd4gt2006064w);  
%var_d(s_d_I_Alt6_Rcd4gt2006569w);  %var_d(s_d_I_Alt6_Rcd4gt2007074w);  %var_d(s_d_I_Alt6_Rcd4gt2007579w);  %var_d(s_d_I_Alt6_Rcd4gt2008084w);  

%var_d(s_dead_A_vl1000_m);     %var_d(s_dead_A_vl1000_w);  
%var_d(s_dead_A_vl10001519_);  %var_d(s_dead_A_vl10002024_);  %var_d(s_dead_A_vl10002529_);  %var_d(s_dead_A_vl10003034_);  %var_d(s_dead_A_vl10003539_);  
%var_d(s_dead_A_vl10004044_);  %var_d(s_dead_A_vl10004549_);  %var_d(s_dead_A_vl10005054_);  %var_d(s_dead_A_vl10005559_);  %var_d(s_dead_A_vl10006064_);  
%var_d(s_dead_A_vl10006569_);  %var_d(s_dead_A_vl10007074_);  %var_d(s_dead_A_vl10007579_);   %var_d(s_dead_A_vl10008084_);  
%var_d(s_dead_A_vl10001519m);  %var_d(s_dead_A_vl10002024m);  %var_d(s_dead_A_vl10002529m);  %var_d(s_dead_A_vl10003034m);  %var_d(s_dead_A_vl10003539m);  
%var_d(s_dead_A_vl10004044m);  %var_d(s_dead_A_vl10004549m);  %var_d(s_dead_A_vl10005054m);  %var_d(s_dead_A_vl10005559m);  %var_d(s_dead_A_vl10006064m);  
%var_d(s_dead_A_vl10006569m);  %var_d(s_dead_A_vl10007074m);  %var_d(s_dead_A_vl10007579m);   %var_d(s_dead_A_vl10008084m);  
%var_d(s_dead_A_vl10001519w);  %var_d(s_dead_A_vl10002024w);  %var_d(s_dead_A_vl10002529w);  %var_d(s_dead_A_vl10003034w);  %var_d(s_dead_A_vl10003539w);  
%var_d(s_dead_A_vl10004044w);  %var_d(s_dead_A_vl10004549w);  %var_d(s_dead_A_vl10005054w);  %var_d(s_dead_A_vl10005559w);  %var_d(s_dead_A_vl10006064w);  
%var_d(s_dead_A_vl10006569w);  %var_d(s_dead_A_vl10007074w);  %var_d(s_dead_A_vl10007579w);   %var_d(s_dead_A_vl10008084w);  

%var_d(s_dead_A_vg1000_m); 	   %var_d(s_dead_A_vg1000_w);  
%var_d(s_dead_A_vg10001519_);  %var_d(s_dead_A_vg10002024_);  %var_d(s_dead_A_vg10002529_);  %var_d(s_dead_A_vg10003034_);  %var_d(s_dead_A_vg10003539_);  
%var_d(s_dead_A_vg10004044_);  %var_d(s_dead_A_vg10004549_);  %var_d(s_dead_A_vg10005054_);  %var_d(s_dead_A_vg10005559_);  %var_d(s_dead_A_vg10006064_);  
%var_d(s_dead_A_vg10006569_);  %var_d(s_dead_A_vg10007074_);  %var_d(s_dead_A_vg10007579_);   %var_d(s_dead_A_vg10008084_);  
%var_d(s_dead_A_vg10001519m);  %var_d(s_dead_A_vg10002024m);  %var_d(s_dead_A_vg10002529m);  %var_d(s_dead_A_vg10003034m);  %var_d(s_dead_A_vg10003539m);  
%var_d(s_dead_A_vg10004044m);  %var_d(s_dead_A_vg10004549m);  %var_d(s_dead_A_vg10005054m);  %var_d(s_dead_A_vg10005559m);  %var_d(s_dead_A_vg10006064m);  
%var_d(s_dead_A_vg10006569m);  %var_d(s_dead_A_vg10007074m);  %var_d(s_dead_A_vg10007579m);   %var_d(s_dead_A_vg10008084m);  
%var_d(s_dead_A_vg10001519w);  %var_d(s_dead_A_vg10002024w);  %var_d(s_dead_A_vg10002529w);  %var_d(s_dead_A_vg10003034w);  %var_d(s_dead_A_vg10003539w);  
%var_d(s_dead_A_vg10004044w);  %var_d(s_dead_A_vg10004549w);  %var_d(s_dead_A_vg10005054w);  %var_d(s_dead_A_vg10005559w);  %var_d(s_dead_A_vg10006064w);  
%var_d(s_dead_A_vg10006569w);  %var_d(s_dead_A_vg10007074w);  %var_d(s_dead_A_vg10007579w);   %var_d(s_dead_A_vg10008084w);  

%var_d(s_dead_Alt6_vl1000_m); 	  %var_d(s_dead_Alt6_vl1000_w);  
%var_d(s_dead_Alt6_vl10001519_);  %var_d(s_dead_Alt6_vl10002024_);  %var_d(s_dead_Alt6_vl10002529_);  %var_d(s_dead_Alt6_vl10003034_);  %var_d(s_dead_Alt6_vl10003539_);  
%var_d(s_dead_Alt6_vl10004044_);  %var_d(s_dead_Alt6_vl10004549_);  %var_d(s_dead_Alt6_vl10005054_);  %var_d(s_dead_Alt6_vl10005559_);  %var_d(s_dead_Alt6_vl10006064_);  
%var_d(s_dead_Alt6_vl10006569_);  %var_d(s_dead_Alt6_vl10007074_);  %var_d(s_dead_Alt6_vl10007579_);   %var_d(s_dead_Alt6_vl10008084_);  
%var_d(s_dead_Alt6_vl10001519m);  %var_d(s_dead_Alt6_vl10002024m);  %var_d(s_dead_Alt6_vl10002529m);  %var_d(s_dead_Alt6_vl10003034m);  %var_d(s_dead_Alt6_vl10003539m);  
%var_d(s_dead_Alt6_vl10004044m);  %var_d(s_dead_Alt6_vl10004549m);  %var_d(s_dead_Alt6_vl10005054m);  %var_d(s_dead_Alt6_vl10005559m);  %var_d(s_dead_Alt6_vl10006064m);  
%var_d(s_dead_Alt6_vl10006569m);  %var_d(s_dead_Alt6_vl10007074m);  %var_d(s_dead_Alt6_vl10007579m);   %var_d(s_dead_Alt6_vl10008084m);  
%var_d(s_dead_Alt6_vl10001519w);  %var_d(s_dead_Alt6_vl10002024w);  %var_d(s_dead_Alt6_vl10002529w);  %var_d(s_dead_Alt6_vl10003034w);  %var_d(s_dead_Alt6_vl10003539w);  
%var_d(s_dead_Alt6_vl10004044w);  %var_d(s_dead_Alt6_vl10004549w);  %var_d(s_dead_Alt6_vl10005054w);  %var_d(s_dead_Alt6_vl10005559w);  %var_d(s_dead_Alt6_vl10006064w);  
%var_d(s_dead_Alt6_vl10006569w);  %var_d(s_dead_Alt6_vl10007074w);  %var_d(s_dead_Alt6_vl10007579w);   %var_d(s_dead_Alt6_vl10008084w);  

%var_d(s_dead_Alt6_vg1000_m);  	  %var_d(s_dead_Alt6_vg1000_w);  
%var_d(s_dead_Alt6_vg10001519_);  %var_d(s_dead_Alt6_vg10002024_);  %var_d(s_dead_Alt6_vg10002529_);  %var_d(s_dead_Alt6_vg10003034_);  %var_d(s_dead_Alt6_vg10003539_);  
%var_d(s_dead_Alt6_vg10004044_);  %var_d(s_dead_Alt6_vg10004549_);  %var_d(s_dead_Alt6_vg10005054_);  %var_d(s_dead_Alt6_vg10005559_);  %var_d(s_dead_Alt6_vg10006064_);  
%var_d(s_dead_Alt6_vg10006569_);  %var_d(s_dead_Alt6_vg10007074_);  %var_d(s_dead_Alt6_vg10007579_);   %var_d(s_dead_Alt6_vg10008084_);  
%var_d(s_dead_Alt6_vg10001519m);  %var_d(s_dead_Alt6_vg10002024m);  %var_d(s_dead_Alt6_vg10002529m);  %var_d(s_dead_Alt6_vg10003034m);  %var_d(s_dead_Alt6_vg10003539m);  
%var_d(s_dead_Alt6_vg10004044m);  %var_d(s_dead_Alt6_vg10004549m);  %var_d(s_dead_Alt6_vg10005054m);  %var_d(s_dead_Alt6_vg10005559m);  %var_d(s_dead_Alt6_vg10006064m);  
%var_d(s_dead_Alt6_vg10006569m);  %var_d(s_dead_Alt6_vg10007074m);  %var_d(s_dead_Alt6_vg10007579m);   %var_d(s_dead_Alt6_vg10008084m);  
%var_d(s_dead_Alt6_vg10001519w);  %var_d(s_dead_Alt6_vg10002024w);  %var_d(s_dead_Alt6_vg10002529w);  %var_d(s_dead_Alt6_vg10003034w);  %var_d(s_dead_Alt6_vg10003539w);  
%var_d(s_dead_Alt6_vg10004044w);  %var_d(s_dead_Alt6_vg10004549w);  %var_d(s_dead_Alt6_vg10005054w);  %var_d(s_dead_Alt6_vg10005559w);  %var_d(s_dead_Alt6_vg10006064w);  
%var_d(s_dead_Alt6_vg10006569w);  %var_d(s_dead_Alt6_vg10007074w);  %var_d(s_dead_Alt6_vg10007579w);   %var_d(s_dead_Alt6_vg10008084w);  

%var_d(s_dead_Agt6_vl1000_m);  	  %var_d(s_dead_Agt6_vl1000_w);  
%var_d(s_dead_Agt6_vl10001519_);  %var_d(s_dead_Agt6_vl10002024_);  %var_d(s_dead_Agt6_vl10002529_);  %var_d(s_dead_Agt6_vl10003034_);  %var_d(s_dead_Agt6_vl10003539_);  
%var_d(s_dead_Agt6_vl10004044_);  %var_d(s_dead_Agt6_vl10004549_);  %var_d(s_dead_Agt6_vl10005054_);  %var_d(s_dead_Agt6_vl10005559_);  %var_d(s_dead_Agt6_vl10006064_);  
%var_d(s_dead_Agt6_vl10006569_);  %var_d(s_dead_Agt6_vl10007074_);  %var_d(s_dead_Agt6_vl10007579_);   %var_d(s_dead_Agt6_vl10008084_);  
%var_d(s_dead_Agt6_vl10001519m);  %var_d(s_dead_Agt6_vl10002024m);  %var_d(s_dead_Agt6_vl10002529m);  %var_d(s_dead_Agt6_vl10003034m);  %var_d(s_dead_Agt6_vl10003539m);  
%var_d(s_dead_Agt6_vl10004044m);  %var_d(s_dead_Agt6_vl10004549m);  %var_d(s_dead_Agt6_vl10005054m);  %var_d(s_dead_Agt6_vl10005559m);  %var_d(s_dead_Agt6_vl10006064m);  
%var_d(s_dead_Agt6_vl10006569m);  %var_d(s_dead_Agt6_vl10007074m);  %var_d(s_dead_Agt6_vl10007579m);   %var_d(s_dead_Agt6_vl10008084m);  
%var_d(s_dead_Agt6_vl10001519w);  %var_d(s_dead_Agt6_vl10002024w);  %var_d(s_dead_Agt6_vl10002529w);  %var_d(s_dead_Agt6_vl10003034w);  %var_d(s_dead_Agt6_vl10003539w);  
%var_d(s_dead_Agt6_vl10004044w);  %var_d(s_dead_Agt6_vl10004549w);  %var_d(s_dead_Agt6_vl10005054w);  %var_d(s_dead_Agt6_vl10005559w);  %var_d(s_dead_Agt6_vl10006064w);  
%var_d(s_dead_Agt6_vl10006569w);  %var_d(s_dead_Agt6_vl10007074w);  %var_d(s_dead_Agt6_vl10007579w);   %var_d(s_dead_Agt6_vl10008084w);  

%var_d(s_dead_Agt6_vg1000_m);  	  %var_d(s_dead_Agt6_vg1000_w);  
%var_d(s_dead_Agt6_vg10001519_);  %var_d(s_dead_Agt6_vg10002024_);  %var_d(s_dead_Agt6_vg10002529_);  %var_d(s_dead_Agt6_vg10003034_);  %var_d(s_dead_Agt6_vg10003539_);  
%var_d(s_dead_Agt6_vg10004044_);  %var_d(s_dead_Agt6_vg10004549_);  %var_d(s_dead_Agt6_vg10005054_);  %var_d(s_dead_Agt6_vg10005559_);  %var_d(s_dead_Agt6_vg10006064_);  
%var_d(s_dead_Agt6_vg10006569_);  %var_d(s_dead_Agt6_vg10007074_);  %var_d(s_dead_Agt6_vg10007579_);   %var_d(s_dead_Agt6_vg10008084_);  
%var_d(s_dead_Agt6_vg10001519m);  %var_d(s_dead_Agt6_vg10002024m);  %var_d(s_dead_Agt6_vg10002529m);  %var_d(s_dead_Agt6_vg10003034m);  %var_d(s_dead_Agt6_vg10003539m);  
%var_d(s_dead_Agt6_vg10004044m);  %var_d(s_dead_Agt6_vg10004549m);  %var_d(s_dead_Agt6_vg10005054m);  %var_d(s_dead_Agt6_vg10005559m);  %var_d(s_dead_Agt6_vg10006064m);  
%var_d(s_dead_Agt6_vg10006569m);  %var_d(s_dead_Agt6_vg10007074m);  %var_d(s_dead_Agt6_vg10007579m);   %var_d(s_dead_Agt6_vg10008084m);  
%var_d(s_dead_Agt6_vg10001519w);  %var_d(s_dead_Agt6_vg10002024w);  %var_d(s_dead_Agt6_vg10002529w);  %var_d(s_dead_Agt6_vg10003034w);  %var_d(s_dead_Agt6_vg10003539w);  
%var_d(s_dead_Agt6_vg10004044w);  %var_d(s_dead_Agt6_vg10004549w);  %var_d(s_dead_Agt6_vg10005054w);  %var_d(s_dead_Agt6_vg10005559w);  %var_d(s_dead_Agt6_vg10006064w);  
%var_d(s_dead_Agt6_vg10006569w);  %var_d(s_dead_Agt6_vg10007074w);  %var_d(s_dead_Agt6_vg10007579w);   %var_d(s_dead_Agt6_vg10008084w);  

%var_d(s_dead_int_lost_m);     %var_d(s_dead_int_lost_w);  
%var_d(s_dead_int_lost1519_);  %var_d(s_dead_int_lost2024_);  %var_d(s_dead_int_lost2529_);  %var_d(s_dead_int_lost3034_);  %var_d(s_dead_int_lost3539_);  
%var_d(s_dead_int_lost4044_);  %var_d(s_dead_int_lost4549_);  %var_d(s_dead_int_lost5054_);  %var_d(s_dead_int_lost5559_);  %var_d(s_dead_int_lost6064_);  
%var_d(s_dead_int_lost6569_);  %var_d(s_dead_int_lost7074_);  %var_d(s_dead_int_lost7579_);  %var_d(s_dead_int_lost8084_);  
%var_d(s_dead_int_lost1519m);  %var_d(s_dead_int_lost2024m);  %var_d(s_dead_int_lost2529m);  %var_d(s_dead_int_lost3034m);  %var_d(s_dead_int_lost3539m);  
%var_d(s_dead_int_lost4044m);  %var_d(s_dead_int_lost4549m);  %var_d(s_dead_int_lost5054m);  %var_d(s_dead_int_lost5559m);  %var_d(s_dead_int_lost6064m);  
%var_d(s_dead_int_lost6569m);  %var_d(s_dead_int_lost7074m);  %var_d(s_dead_int_lost7579m);  %var_d(s_dead_int_lost8084m);  
%var_d(s_dead_int_lost1519w);  %var_d(s_dead_int_lost2024w);  %var_d(s_dead_int_lost2529w);  %var_d(s_dead_int_lost3034w);  %var_d(s_dead_int_lost3539w);  
%var_d(s_dead_int_lost4044w);  %var_d(s_dead_int_lost4549w);  %var_d(s_dead_int_lost5054w);  %var_d(s_dead_int_lost5559w);  %var_d(s_dead_int_lost6064w);  
%var_d(s_dead_int_lost6569w);  %var_d(s_dead_int_lost7074w);  %var_d(s_dead_int_lost7579w);  %var_d(s_dead_int_lost8084w);  

%var_d(s_dead_1stint_lost_m);  	  %var_d(s_dead_1stint_lost_w);  
%var_d(s_dead_1stint_lost1519_);  %var_d(s_dead_1stint_lost2024_);  %var_d(s_dead_1stint_lost2529_);  %var_d(s_dead_1stint_lost3034_);  %var_d(s_dead_1stint_lost3539_);  
%var_d(s_dead_1stint_lost4044_);  %var_d(s_dead_1stint_lost4549_);  %var_d(s_dead_1stint_lost5054_);  %var_d(s_dead_1stint_lost5559_);  %var_d(s_dead_1stint_lost6064_);  
%var_d(s_dead_1stint_lost6569_);  %var_d(s_dead_1stint_lost7074_);  %var_d(s_dead_1stint_lost7579_);  %var_d(s_dead_1stint_lost8084_);  
%var_d(s_dead_1stint_lost1519m);  %var_d(s_dead_1stint_lost2024m);  %var_d(s_dead_1stint_lost2529m);  %var_d(s_dead_1stint_lost3034m);  %var_d(s_dead_1stint_lost3539m);  
%var_d(s_dead_1stint_lost4044m);  %var_d(s_dead_1stint_lost4549m);  %var_d(s_dead_1stint_lost5054m);  %var_d(s_dead_1stint_lost5559m);  %var_d(s_dead_1stint_lost6064m);  
%var_d(s_dead_1stint_lost6569m);  %var_d(s_dead_1stint_lost7074m);  %var_d(s_dead_1stint_lost7579m);  %var_d(s_dead_1stint_lost8084m);  
%var_d(s_dead_1stint_lost1519w);  %var_d(s_dead_1stint_lost2024w);  %var_d(s_dead_1stint_lost2529w);  %var_d(s_dead_1stint_lost3034w);  %var_d(s_dead_1stint_lost3539w);  
%var_d(s_dead_1stint_lost4044w);  %var_d(s_dead_1stint_lost4549w);  %var_d(s_dead_1stint_lost5054w);  %var_d(s_dead_1stint_lost5559w);  %var_d(s_dead_1stint_lost6064w);  
%var_d(s_dead_1stint_lost6569w);  %var_d(s_dead_1stint_lost7074w);  %var_d(s_dead_1stint_lost7579w);  %var_d(s_dead_1stint_lost8084w);  

%var_d(s_dead_subintlt6_lost_m);  	 %var_d(s_dead_subintlt6_lost_w);  
%var_d(s_dead_subintlt6_lost1519_);  %var_d(s_dead_subintlt6_lost2024_);  %var_d(s_dead_subintlt6_lost2529_);  %var_d(s_dead_subintlt6_lost3034_);  %var_d(s_dead_subintlt6_lost3539_);  
%var_d(s_dead_subintlt6_lost4044_);  %var_d(s_dead_subintlt6_lost4549_);  %var_d(s_dead_subintlt6_lost5054_);  %var_d(s_dead_subintlt6_lost5559_);  %var_d(s_dead_subintlt6_lost6064_);  
%var_d(s_dead_subintlt6_lost6569_);  %var_d(s_dead_subintlt6_lost7074_);  %var_d(s_dead_subintlt6_lost7579_);  %var_d(s_dead_subintlt6_lost8084_);  
%var_d(s_dead_subintlt6_lost1519m);  %var_d(s_dead_subintlt6_lost2024m);  %var_d(s_dead_subintlt6_lost2529m);  %var_d(s_dead_subintlt6_lost3034m);  %var_d(s_dead_subintlt6_lost3539m);  
%var_d(s_dead_subintlt6_lost4044m);  %var_d(s_dead_subintlt6_lost4549m);  %var_d(s_dead_subintlt6_lost5054m);  %var_d(s_dead_subintlt6_lost5559m);  %var_d(s_dead_subintlt6_lost6064m);  
%var_d(s_dead_subintlt6_lost6569m);  %var_d(s_dead_subintlt6_lost7074m);  %var_d(s_dead_subintlt6_lost7579m);  %var_d(s_dead_subintlt6_lost8084m);  
%var_d(s_dead_subintlt6_lost1519w);  %var_d(s_dead_subintlt6_lost2024w);  %var_d(s_dead_subintlt6_lost2529w);  %var_d(s_dead_subintlt6_lost3034w);  %var_d(s_dead_subintlt6_lost3539w);  
%var_d(s_dead_subintlt6_lost4044w);  %var_d(s_dead_subintlt6_lost4549w);  %var_d(s_dead_subintlt6_lost5054w);  %var_d(s_dead_subintlt6_lost5559w);  %var_d(s_dead_subintlt6_lost6064w);  
%var_d(s_dead_subintlt6_lost6569w);  %var_d(s_dead_subintlt6_lost7074w);  %var_d(s_dead_subintlt6_lost7579w);  %var_d(s_dead_subintlt6_lost8084w);  

%var_d(s_dead_subintgt6_lost_m);  	 %var_d(s_dead_subintgt6_lost_w);  
%var_d(s_dead_subintgt6_lost1519_);  %var_d(s_dead_subintgt6_lost2024_);  %var_d(s_dead_subintgt6_lost2529_);  %var_d(s_dead_subintgt6_lost3034_);  %var_d(s_dead_subintgt6_lost3539_);  
%var_d(s_dead_subintgt6_lost4044_);  %var_d(s_dead_subintgt6_lost4549_);  %var_d(s_dead_subintgt6_lost5054_);  %var_d(s_dead_subintgt6_lost5559_);  %var_d(s_dead_subintgt6_lost6064_);  
%var_d(s_dead_subintgt6_lost6569_);  %var_d(s_dead_subintgt6_lost7074_);  %var_d(s_dead_subintgt6_lost7579_);  %var_d(s_dead_subintgt6_lost8084_);  
%var_d(s_dead_subintgt6_lost1519m);  %var_d(s_dead_subintgt6_lost2024m);  %var_d(s_dead_subintgt6_lost2529m);  %var_d(s_dead_subintgt6_lost3034m);  %var_d(s_dead_subintgt6_lost3539m);  
%var_d(s_dead_subintgt6_lost4044m);  %var_d(s_dead_subintgt6_lost4549m);  %var_d(s_dead_subintgt6_lost5054m);  %var_d(s_dead_subintgt6_lost5559m);  %var_d(s_dead_subintgt6_lost6064m);  
%var_d(s_dead_subintgt6_lost6569m);  %var_d(s_dead_subintgt6_lost7074m);  %var_d(s_dead_subintgt6_lost7579m);  %var_d(s_dead_subintgt6_lost8084m);  
%var_d(s_dead_subintgt6_lost1519w);  %var_d(s_dead_subintgt6_lost2024w);  %var_d(s_dead_subintgt6_lost2529w);  %var_d(s_dead_subintgt6_lost3034w);  %var_d(s_dead_subintgt6_lost3539w);  
%var_d(s_dead_subintgt6_lost4044w);  %var_d(s_dead_subintgt6_lost4549w);  %var_d(s_dead_subintgt6_lost5054w);  %var_d(s_dead_subintgt6_lost5559w);  %var_d(s_dead_subintgt6_lost6064w);  
%var_d(s_dead_subintgt6_lost6569w);  %var_d(s_dead_subintgt6_lost7074w);  %var_d(s_dead_subintgt6_lost7579w);  %var_d(s_dead_subintgt6_lost8084w);  

%var_d(s_dead_A_cd4lt200_m);  	 %var_d(s_dead_A_cd4lt200_w);  
%var_d(s_dead_A_cd4lt2001519_);  %var_d(s_dead_A_cd4lt2002024_);  %var_d(s_dead_A_cd4lt2002529_);  %var_d(s_dead_A_cd4lt2003034_);  %var_d(s_dead_A_cd4lt2003539_);  
%var_d(s_dead_A_cd4lt2004044_);  %var_d(s_dead_A_cd4lt2004549_);  %var_d(s_dead_A_cd4lt2005054_);  %var_d(s_dead_A_cd4lt2005559_);  %var_d(s_dead_A_cd4lt2006064_);  
%var_d(s_dead_A_cd4lt2006569_);  %var_d(s_dead_A_cd4lt2007074_);  %var_d(s_dead_A_cd4lt2007579_);  %var_d(s_dead_A_cd4lt2008084_);  
%var_d(s_dead_A_cd4lt2001519m);  %var_d(s_dead_A_cd4lt2002024m);  %var_d(s_dead_A_cd4lt2002529m);  %var_d(s_dead_A_cd4lt2003034m);  %var_d(s_dead_A_cd4lt2003539m);  
%var_d(s_dead_A_cd4lt2004044m);  %var_d(s_dead_A_cd4lt2004549m);  %var_d(s_dead_A_cd4lt2005054m);  %var_d(s_dead_A_cd4lt2005559m);  %var_d(s_dead_A_cd4lt2006064m);  
%var_d(s_dead_A_cd4lt2006569m);  %var_d(s_dead_A_cd4lt2007074m);  %var_d(s_dead_A_cd4lt2007579m);  %var_d(s_dead_A_cd4lt2008084m);  
%var_d(s_dead_A_cd4lt2001519w);  %var_d(s_dead_A_cd4lt2002024w);  %var_d(s_dead_A_cd4lt2002529w);  %var_d(s_dead_A_cd4lt2003034w);  %var_d(s_dead_A_cd4lt2003539w);  
%var_d(s_dead_A_cd4lt2004044w);  %var_d(s_dead_A_cd4lt2004549w);  %var_d(s_dead_A_cd4lt2005054w);  %var_d(s_dead_A_cd4lt2005559w);  %var_d(s_dead_A_cd4lt2006064w);  
%var_d(s_dead_A_cd4lt2006569w);  %var_d(s_dead_A_cd4lt2007074w);  %var_d(s_dead_A_cd4lt2007579w);  %var_d(s_dead_A_cd4lt2008084w);  

%var_d(s_dead_A_cd4gt200_m);  	 %var_d(s_dead_A_cd4gt200_w);  
%var_d(s_dead_A_cd4gt2001519_);  %var_d(s_dead_A_cd4gt2002024_);  %var_d(s_dead_A_cd4gt2002529_);  %var_d(s_dead_A_cd4gt2003034_);  %var_d(s_dead_A_cd4gt2003539_);  
%var_d(s_dead_A_cd4gt2004044_);  %var_d(s_dead_A_cd4gt2004549_);  %var_d(s_dead_A_cd4gt2005054_);  %var_d(s_dead_A_cd4gt2005559_);  %var_d(s_dead_A_cd4gt2006064_);  
%var_d(s_dead_A_cd4gt2006569_);  %var_d(s_dead_A_cd4gt2007074_);  %var_d(s_dead_A_cd4gt2007579_);  %var_d(s_dead_A_cd4gt2008084_);  
%var_d(s_dead_A_cd4gt2001519m);  %var_d(s_dead_A_cd4gt2002024m);  %var_d(s_dead_A_cd4gt2002529m);  %var_d(s_dead_A_cd4gt2003034m);  %var_d(s_dead_A_cd4gt2003539m);  
%var_d(s_dead_A_cd4gt2004044m);  %var_d(s_dead_A_cd4gt2004549m);  %var_d(s_dead_A_cd4gt2005054m);  %var_d(s_dead_A_cd4gt2005559m);  %var_d(s_dead_A_cd4gt2006064m);  
%var_d(s_dead_A_cd4gt2006569m);  %var_d(s_dead_A_cd4gt2007074m);  %var_d(s_dead_A_cd4gt2007579m);  %var_d(s_dead_A_cd4gt2008084m);  
%var_d(s_dead_A_cd4gt2001519w);  %var_d(s_dead_A_cd4gt2002024w);  %var_d(s_dead_A_cd4gt2002529w);  %var_d(s_dead_A_cd4gt2003034w);  %var_d(s_dead_A_cd4gt2003539w);  
%var_d(s_dead_A_cd4gt2004044w);  %var_d(s_dead_A_cd4gt2004549w);  %var_d(s_dead_A_cd4gt2005054w);  %var_d(s_dead_A_cd4gt2005559w);  %var_d(s_dead_A_cd4gt2006064w);  
%var_d(s_dead_A_cd4gt2006569w);  %var_d(s_dead_A_cd4gt2007074w);  %var_d(s_dead_A_cd4gt2007579w);  %var_d(s_dead_A_cd4gt2008084w);  

%var_d(s_dead_Alt6_cd4lt200_m);  	%var_d(s_dead_Alt6_cd4lt200_w);  
%var_d(s_dead_Alt6_cd4lt2001519_);  %var_d(s_dead_Alt6_cd4lt2002024_);  %var_d(s_dead_Alt6_cd4lt2002529_);  %var_d(s_dead_Alt6_cd4lt2003034_);  %var_d(s_dead_Alt6_cd4lt2003539_);  
%var_d(s_dead_Alt6_cd4lt2004044_);  %var_d(s_dead_Alt6_cd4lt2004549_);  %var_d(s_dead_Alt6_cd4lt2005054_);  %var_d(s_dead_Alt6_cd4lt2005559_);  %var_d(s_dead_Alt6_cd4lt2006064_);  
%var_d(s_dead_Alt6_cd4lt2006569_);  %var_d(s_dead_Alt6_cd4lt2007074_);  %var_d(s_dead_Alt6_cd4lt2007579_);  %var_d(s_dead_Alt6_cd4lt2008084_);  
%var_d(s_dead_Alt6_cd4lt2001519m);  %var_d(s_dead_Alt6_cd4lt2002024m);  %var_d(s_dead_Alt6_cd4lt2002529m);  %var_d(s_dead_Alt6_cd4lt2003034m);  %var_d(s_dead_Alt6_cd4lt2003539m);  
%var_d(s_dead_Alt6_cd4lt2004044m);  %var_d(s_dead_Alt6_cd4lt2004549m);  %var_d(s_dead_Alt6_cd4lt2005054m);  %var_d(s_dead_Alt6_cd4lt2005559m);  %var_d(s_dead_Alt6_cd4lt2006064m);  
%var_d(s_dead_Alt6_cd4lt2006569m);  %var_d(s_dead_Alt6_cd4lt2007074m);  %var_d(s_dead_Alt6_cd4lt2007579m);  %var_d(s_dead_Alt6_cd4lt2008084m);  
%var_d(s_dead_Alt6_cd4lt2001519w);  %var_d(s_dead_Alt6_cd4lt2002024w);  %var_d(s_dead_Alt6_cd4lt2002529w);  %var_d(s_dead_Alt6_cd4lt2003034w);  %var_d(s_dead_Alt6_cd4lt2003539w);  
%var_d(s_dead_Alt6_cd4lt2004044w);  %var_d(s_dead_Alt6_cd4lt2004549w);  %var_d(s_dead_Alt6_cd4lt2005054w);  %var_d(s_dead_Alt6_cd4lt2005559w);  %var_d(s_dead_Alt6_cd4lt2006064w);  
%var_d(s_dead_Alt6_cd4lt2006569w);  %var_d(s_dead_Alt6_cd4lt2007074w);  %var_d(s_dead_Alt6_cd4lt2007579w);  %var_d(s_dead_Alt6_cd4lt2008084w);  

%var_d(s_dead_Alt6_cd4gt200_m);  	%var_d(s_dead_Alt6_cd4gt200_w);  
%var_d(s_dead_Alt6_cd4gt2001519_);  %var_d(s_dead_Alt6_cd4gt2002024_);  %var_d(s_dead_Alt6_cd4gt2002529_);  %var_d(s_dead_Alt6_cd4gt2003034_);  %var_d(s_dead_Alt6_cd4gt2003539_);  
%var_d(s_dead_Alt6_cd4gt2004044_);  %var_d(s_dead_Alt6_cd4gt2004549_);  %var_d(s_dead_Alt6_cd4gt2005054_);  %var_d(s_dead_Alt6_cd4gt2005559_);  %var_d(s_dead_Alt6_cd4gt2006064_);  
%var_d(s_dead_Alt6_cd4gt2006569_);  %var_d(s_dead_Alt6_cd4gt2007074_);  %var_d(s_dead_Alt6_cd4gt2007579_);  %var_d(s_dead_Alt6_cd4gt2008084_);  
%var_d(s_dead_Alt6_cd4gt2001519m);  %var_d(s_dead_Alt6_cd4gt2002024m);  %var_d(s_dead_Alt6_cd4gt2002529m);  %var_d(s_dead_Alt6_cd4gt2003034m);  %var_d(s_dead_Alt6_cd4gt2003539m);  
%var_d(s_dead_Alt6_cd4gt2004044m);  %var_d(s_dead_Alt6_cd4gt2004549m);  %var_d(s_dead_Alt6_cd4gt2005054m);  %var_d(s_dead_Alt6_cd4gt2005559m);  %var_d(s_dead_Alt6_cd4gt2006064m);  
%var_d(s_dead_Alt6_cd4gt2006569m);  %var_d(s_dead_Alt6_cd4gt2007074m);  %var_d(s_dead_Alt6_cd4gt2007579m);  %var_d(s_dead_Alt6_cd4gt2008084m);  
%var_d(s_dead_Alt6_cd4gt2001519w);  %var_d(s_dead_Alt6_cd4gt2002024w);  %var_d(s_dead_Alt6_cd4gt2002529w);  %var_d(s_dead_Alt6_cd4gt2003034w);  %var_d(s_dead_Alt6_cd4gt2003539w);  
%var_d(s_dead_Alt6_cd4gt2004044w);  %var_d(s_dead_Alt6_cd4gt2004549w);  %var_d(s_dead_Alt6_cd4gt2005054w);  %var_d(s_dead_Alt6_cd4gt2005559w);  %var_d(s_dead_Alt6_cd4gt2006064w);  
%var_d(s_dead_Alt6_cd4gt2006569w);  %var_d(s_dead_Alt6_cd4gt2007074w);  %var_d(s_dead_Alt6_cd4gt2007579w);  %var_d(s_dead_Alt6_cd4gt2008084w);  

%var_d(s_dead_Agt6_cd4lt200_m); 	%var_d(s_dead_Agt6_cd4lt200_w);  
%var_d(s_dead_Agt6_cd4lt2001519_);  %var_d(s_dead_Agt6_cd4lt2002024_);  %var_d(s_dead_Agt6_cd4lt2002529_);  %var_d(s_dead_Agt6_cd4lt2003034_);  %var_d(s_dead_Agt6_cd4lt2003539_);  
%var_d(s_dead_Agt6_cd4lt2004044_);  %var_d(s_dead_Agt6_cd4lt2004549_);  %var_d(s_dead_Agt6_cd4lt2005054_);  %var_d(s_dead_Agt6_cd4lt2005559_);  %var_d(s_dead_Agt6_cd4lt2006064_);  
%var_d(s_dead_Agt6_cd4lt2006569_);  %var_d(s_dead_Agt6_cd4lt2007074_);  %var_d(s_dead_Agt6_cd4lt2007579_);  %var_d(s_dead_Agt6_cd4lt2008084_);  
%var_d(s_dead_Agt6_cd4lt2001519m);  %var_d(s_dead_Agt6_cd4lt2002024m);  %var_d(s_dead_Agt6_cd4lt2002529m);  %var_d(s_dead_Agt6_cd4lt2003034m);  %var_d(s_dead_Agt6_cd4lt2003539m);  
%var_d(s_dead_Agt6_cd4lt2004044m);  %var_d(s_dead_Agt6_cd4lt2004549m);  %var_d(s_dead_Agt6_cd4lt2005054m);  %var_d(s_dead_Agt6_cd4lt2005559m);  %var_d(s_dead_Agt6_cd4lt2006064m);  
%var_d(s_dead_Agt6_cd4lt2006569m);  %var_d(s_dead_Agt6_cd4lt2007074m);  %var_d(s_dead_Agt6_cd4lt2007579m);  %var_d(s_dead_Agt6_cd4lt2008084m);  
%var_d(s_dead_Agt6_cd4lt2001519w);  %var_d(s_dead_Agt6_cd4lt2002024w);  %var_d(s_dead_Agt6_cd4lt2002529w);  %var_d(s_dead_Agt6_cd4lt2003034w);  %var_d(s_dead_Agt6_cd4lt2003539w);  
%var_d(s_dead_Agt6_cd4lt2004044w);  %var_d(s_dead_Agt6_cd4lt2004549w);  %var_d(s_dead_Agt6_cd4lt2005054w);  %var_d(s_dead_Agt6_cd4lt2005559w);  %var_d(s_dead_Agt6_cd4lt2006064w);  
%var_d(s_dead_Agt6_cd4lt2006569w);  %var_d(s_dead_Agt6_cd4lt2007074w);  %var_d(s_dead_Agt6_cd4lt2007579w);  %var_d(s_dead_Agt6_cd4lt2008084w);  

%var_d(s_dead_Agt6_cd4gt200_m); 	%var_d(s_dead_Agt6_cd4gt200_w);  
%var_d(s_dead_Agt6_cd4gt2001519_);  %var_d(s_dead_Agt6_cd4gt2002024_);  %var_d(s_dead_Agt6_cd4gt2002529_);  %var_d(s_dead_Agt6_cd4gt2003034_);  %var_d(s_dead_Agt6_cd4gt2003539_);  
%var_d(s_dead_Agt6_cd4gt2004044_);  %var_d(s_dead_Agt6_cd4gt2004549_);  %var_d(s_dead_Agt6_cd4gt2005054_);  %var_d(s_dead_Agt6_cd4gt2005559_);  %var_d(s_dead_Agt6_cd4gt2006064_);  
%var_d(s_dead_Agt6_cd4gt2006569_);  %var_d(s_dead_Agt6_cd4gt2007074_);  %var_d(s_dead_Agt6_cd4gt2007579_);  %var_d(s_dead_Agt6_cd4gt2008084_);  
%var_d(s_dead_Agt6_cd4gt2001519m);  %var_d(s_dead_Agt6_cd4gt2002024m);  %var_d(s_dead_Agt6_cd4gt2002529m);  %var_d(s_dead_Agt6_cd4gt2003034m);  %var_d(s_dead_Agt6_cd4gt2003539m);  
%var_d(s_dead_Agt6_cd4gt2004044m);  %var_d(s_dead_Agt6_cd4gt2004549m);  %var_d(s_dead_Agt6_cd4gt2005054m);  %var_d(s_dead_Agt6_cd4gt2005559m);  %var_d(s_dead_Agt6_cd4gt2006064m);  
%var_d(s_dead_Agt6_cd4gt2006569m);  %var_d(s_dead_Agt6_cd4gt2007074m);  %var_d(s_dead_Agt6_cd4gt2007579m);  %var_d(s_dead_Agt6_cd4gt2008084m);  
%var_d(s_dead_Agt6_cd4gt2001519w);  %var_d(s_dead_Agt6_cd4gt2002024w);  %var_d(s_dead_Agt6_cd4gt2002529w);  %var_d(s_dead_Agt6_cd4gt2003034w);  %var_d(s_dead_Agt6_cd4gt2003539w);  
%var_d(s_dead_Agt6_cd4gt2004044w);  %var_d(s_dead_Agt6_cd4gt2004549w);  %var_d(s_dead_Agt6_cd4gt2005054w);  %var_d(s_dead_Agt6_cd4gt2005559w);  %var_d(s_dead_Agt6_cd4gt2006064w);  
%var_d(s_dead_Agt6_cd4gt2006569w);  %var_d(s_dead_Agt6_cd4gt2007074w);  %var_d(s_dead_Agt6_cd4gt2007579w);  %var_d(s_dead_Agt6_cd4gt2008084w);  ;

***transmissions;
%var_d(s_I_undiag); 		%var_d(s_I_diag_naive);  	%var_d(s_I_diag_startart); 	%var_d(s_I_onart);		%var_d(s_I_offart); 	%var_d(s_I_onart_lt6m);
%var_d(s_I_onart_lt6m_nvs); %var_d(s_I_onart_gt6m_nvs);	%var_d(s_I_onart_gt6m_vs);  %var_d(s_I_offart_1stI);%var_d(s_I_offart_SI); 	%var_d(s_I_offart_SIlt6m);
%var_d(s_I_offart_SIgt6m);

%var_d(s_I_undiag_m);		 %var_d(s_I_diag_naive_m);	   %var_d(s_I_diag_startart_m);	%var_d(s_I_onart_m);	  %var_d(s_I_offart_m);	  %var_d(s_I_onart_lt6m_m);
%var_d(s_I_onart_lt6m_nvs_m);%var_d(s_I_onart_gt6m_nvs_m); %var_d(s_I_onart_gt6m_vs_m);	%var_d(s_I_offart_1stI_m);%var_d(s_I_offart_SI_m);%var_d(s_I_offart_SIlt6m_m);
%var_d(s_I_offart_SIgt6m_m); 

%var_d(s_I_undiag_w); 		 %var_d(s_I_diag_naive_w); 	   %var_d(s_I_diag_startart_w); %var_d(s_I_onart_w);	  %var_d(s_I_offart_w);   %var_d(s_I_onart_lt6m_w); 
%var_d(s_I_onart_lt6m_nvs_w);%var_d(s_I_onart_gt6m_nvs_w); %var_d(s_I_onart_gt6m_vs_w); %var_d(s_I_offart_1stI_w);%var_d(s_I_offart_SI_w);%var_d(s_I_offart_SIlt6m_w); 
%var_d(s_I_offart_SIgt6m_w); 

%var_d(s_I_undiag1519_); 		%var_d(s_I_diag_naive1519_);	 %var_d(s_I_diag_startart1519_); 	%var_d(s_I_onart1519_);	   		%var_d(s_I_offart1519_); 	
%var_d(s_I_onart_lt6m1519_);    %var_d(s_I_onart_lt6m_nvs1519_); %var_d(s_I_onart_gt6m_nvs1519_);	%var_d(s_I_onart_gt6m_vs1519_); %var_d(s_I_offart_1stI1519_);
%var_d(s_I_offart_SI1519_); 	%var_d(s_I_offart_SIlt6m1519_);  %var_d(s_I_offart_SIgt6m1519_); 

%var_d(s_I_undiag2024_); 		%var_d(s_I_diag_naive2024_);	 %var_d(s_I_diag_startart2024_);	%var_d(s_I_onart2024_); 		%var_d(s_I_offart2024_);
%var_d(s_I_onart_lt6m2024_); 	%var_d(s_I_onart_lt6m_nvs2024_); %var_d(s_I_onart_gt6m_nvs2024_);	%var_d(s_I_onart_gt6m_vs2024_); %var_d(s_I_offart_1stI2024_); 
%var_d(s_I_offart_SI2024_); 	%var_d(s_I_offart_SIlt6m2024_);  %var_d(s_I_offart_SIgt6m2024_); 

%var_d(s_I_undiag2529_);		%var_d(s_I_diag_naive2529_); 	 %var_d(s_I_diag_startart2529_); 	%var_d(s_I_onart2529_);			%var_d(s_I_offart2529_);
%var_d(s_I_onart_lt6m2529_); 	%var_d(s_I_onart_lt6m_nvs2529_); %var_d(s_I_onart_gt6m_nvs2529_);   %var_d(s_I_onart_gt6m_vs2529_); %var_d(s_I_offart_1stI2529_); 
%var_d(s_I_offart_SI2529_); 	%var_d(s_I_offart_SIlt6m2529_);  %var_d(s_I_offart_SIgt6m2529_); 

%var_d(s_I_undiag3034_); 		%var_d(s_I_diag_naive3034_); 	 %var_d(s_I_diag_startart3034_); 	%var_d(s_I_onart3034_);			 %var_d(s_I_offart3034_); 
%var_d(s_I_onart_lt6m3034_); 	%var_d(s_I_onart_lt6m_nvs3034_); %var_d(s_I_onart_gt6m_nvs3034_);   %var_d(s_I_onart_gt6m_vs3034_);  %var_d(s_I_offart_1stI3034_); 
%var_d(s_I_offart_SI3034_); 	%var_d(s_I_offart_SIlt6m3034_);  %var_d(s_I_offart_SIgt6m3034_); 

%var_d(s_I_undiag3539_); 		%var_d(s_I_diag_naive3539_);	 %var_d(s_I_diag_startart3539_); 	%var_d(s_I_onart3539_); 		 %var_d(s_I_offart3539_);
%var_d(s_I_onart_lt6m3539_); 	%var_d(s_I_onart_lt6m_nvs3539_); %var_d(s_I_onart_gt6m_nvs3539_);   %var_d(s_I_onart_gt6m_vs3539_);  %var_d(s_I_offart_1stI3539_);
%var_d(s_I_offart_SI3539_); 	%var_d(s_I_offart_SIlt6m3539_);  %var_d(s_I_offart_SIgt6m3539_); 

%var_d(s_I_undiag4044_); 		%var_d(s_I_diag_naive4044_);	 %var_d(s_I_diag_startart4044_); 	%var_d(s_I_onart4044_); 		 %var_d(s_I_offart4044_);
%var_d(s_I_onart_lt6m4044_); 	%var_d(s_I_onart_lt6m_nvs4044_); %var_d(s_I_onart_gt6m_nvs4044_);   %var_d(s_I_onart_gt6m_vs4044_);  %var_d(s_I_offart_1stI4044_);
%var_d(s_I_offart_SI4044_); 	%var_d(s_I_offart_SIlt6m4044_);  %var_d(s_I_offart_SIgt6m4044_); 

%var_d(s_I_undiag4549_); 		%var_d(s_I_diag_naive4549_);	 %var_d(s_I_diag_startart4549_); 	%var_d(s_I_onart4549_); 		 %var_d(s_I_offart4549_);
%var_d(s_I_onart_lt6m4549_); 	%var_d(s_I_onart_lt6m_nvs4549_); %var_d(s_I_onart_gt6m_nvs4549_);   %var_d(s_I_onart_gt6m_vs4549_);  %var_d(s_I_offart_1stI4549_);
%var_d(s_I_offart_SI4549_); 	%var_d(s_I_offart_SIlt6m4549_);  %var_d(s_I_offart_SIgt6m4549_); 

%var_d(s_I_undiag5054_); 		%var_d(s_I_diag_naive5054_);	 %var_d(s_I_diag_startart5054_); 	%var_d(s_I_onart5054_); 		 %var_d(s_I_offart5054_);
%var_d(s_I_onart_lt6m5054_); 	%var_d(s_I_onart_lt6m_nvs5054_); %var_d(s_I_onart_gt6m_nvs5054_);   %var_d(s_I_onart_gt6m_vs5054_);  %var_d(s_I_offart_1stI5054_);
%var_d(s_I_offart_SI5054_); 	%var_d(s_I_offart_SIlt6m5054_);  %var_d(s_I_offart_SIgt6m5054_); 

%var_d(s_I_undiag5559_); 		%var_d(s_I_diag_naive5559_);	 %var_d(s_I_diag_startart5559_); 	%var_d(s_I_onart5559_); 		 %var_d(s_I_offart5559_);
%var_d(s_I_onart_lt6m5559_); 	%var_d(s_I_onart_lt6m_nvs5559_); %var_d(s_I_onart_gt6m_nvs5559_);   %var_d(s_I_onart_gt6m_vs5559_);  %var_d(s_I_offart_1stI5559_);
%var_d(s_I_offart_SI5559_); 	%var_d(s_I_offart_SIlt6m5559_);  %var_d(s_I_offart_SIgt6m5559_); 

%var_d(s_I_undiag6064_); 		%var_d(s_I_diag_naive6064_);	 %var_d(s_I_diag_startart6064_); 	%var_d(s_I_onart6064_); 		 %var_d(s_I_offart6064_);
%var_d(s_I_onart_lt6m6064_); 	%var_d(s_I_onart_lt6m_nvs6064_); %var_d(s_I_onart_gt6m_nvs6064_);   %var_d(s_I_onart_gt6m_vs6064_);  %var_d(s_I_offart_1stI6064_);
%var_d(s_I_offart_SI6064_); 	%var_d(s_I_offart_SIlt6m6064_);  %var_d(s_I_offart_SIgt6m6064_); 

%var_d(s_I_undiag6569_); 		%var_d(s_I_diag_naive6569_);	 %var_d(s_I_diag_startart6569_); 	%var_d(s_I_onart6569_); 		 %var_d(s_I_offart6569_);
%var_d(s_I_onart_lt6m6569_); 	%var_d(s_I_onart_lt6m_nvs6569_); %var_d(s_I_onart_gt6m_nvs6569_);   %var_d(s_I_onart_gt6m_vs6569_);  %var_d(s_I_offart_1stI6569_);
%var_d(s_I_offart_SI6569_); 	%var_d(s_I_offart_SIlt6m6569_);  %var_d(s_I_offart_SIgt6m6569_); 

%var_d(s_I_undiag7074_); 		%var_d(s_I_diag_naive7074_);	 %var_d(s_I_diag_startart7074_); 	%var_d(s_I_onart7074_); 		 %var_d(s_I_offart7074_);
%var_d(s_I_onart_lt6m7074_); 	%var_d(s_I_onart_lt6m_nvs7074_); %var_d(s_I_onart_gt6m_nvs7074_);   %var_d(s_I_onart_gt6m_vs7074_);  %var_d(s_I_offart_1stI7074_);
%var_d(s_I_offart_SI7074_); 	%var_d(s_I_offart_SIlt6m7074_);  %var_d(s_I_offart_SIgt6m7074_); 

%var_d(s_I_undiag7579_); 		%var_d(s_I_diag_naive7579_);	 %var_d(s_I_diag_startart7579_); 	%var_d(s_I_onart7579_); 		 %var_d(s_I_offart7579_);
%var_d(s_I_onart_lt6m7579_); 	%var_d(s_I_onart_lt6m_nvs7579_); %var_d(s_I_onart_gt6m_nvs7579_);   %var_d(s_I_onart_gt6m_vs7579_);  %var_d(s_I_offart_1stI7579_);
%var_d(s_I_offart_SI7579_); 	%var_d(s_I_offart_SIlt6m7579_);  %var_d(s_I_offart_SIgt6m7579_); 

%var_d(s_I_undiag8084_); 		%var_d(s_I_diag_naive8084_);	 %var_d(s_I_diag_startart8084_); 	%var_d(s_I_onart8084_); 		 %var_d(s_I_offart8084_);
%var_d(s_I_onart_lt6m8084_); 	%var_d(s_I_onart_lt6m_nvs8084_); %var_d(s_I_onart_gt6m_nvs8084_);   %var_d(s_I_onart_gt6m_vs8084_);  %var_d(s_I_offart_1stI8084_);
%var_d(s_I_offart_SI8084_); 	%var_d(s_I_offart_SIlt6m8084_);  %var_d(s_I_offart_SIgt6m8084_); 

%var_d(s_I_undiag1519m); 		%var_d(s_I_diag_naive1519m);	 %var_d(s_I_diag_startart1519m); 	%var_d(s_I_onart1519m);	   		%var_d(s_I_offart1519m); 	
%var_d(s_I_onart_lt6m1519m);    %var_d(s_I_onart_lt6m_nvs1519m); %var_d(s_I_onart_gt6m_nvs1519m);	%var_d(s_I_onart_gt6m_vs1519m); %var_d(s_I_offart_1stI1519m);
%var_d(s_I_offart_SI1519m); 	%var_d(s_I_offart_SIlt6m1519m);  %var_d(s_I_offart_SIgt6m1519m); 

%var_d(s_I_undiag2024m); 		%var_d(s_I_diag_naive2024m);	 %var_d(s_I_diag_startart2024m);	%var_d(s_I_onart2024m); 		%var_d(s_I_offart2024m);
%var_d(s_I_onart_lt6m2024m); 	%var_d(s_I_onart_lt6m_nvs2024m); %var_d(s_I_onart_gt6m_nvs2024m);	%var_d(s_I_onart_gt6m_vs2024m); %var_d(s_I_offart_1stI2024m); 
%var_d(s_I_offart_SI2024m); 	%var_d(s_I_offart_SIlt6m2024m);  %var_d(s_I_offart_SIgt6m2024m); 

%var_d(s_I_undiag2529m);		%var_d(s_I_diag_naive2529m); 	 %var_d(s_I_diag_startart2529m); 	%var_d(s_I_onart2529m);			%var_d(s_I_offart2529m);
%var_d(s_I_onart_lt6m2529m); 	%var_d(s_I_onart_lt6m_nvs2529m); %var_d(s_I_onart_gt6m_nvs2529m);   %var_d(s_I_onart_gt6m_vs2529m); %var_d(s_I_offart_1stI2529m); 
%var_d(s_I_offart_SI2529m); 	%var_d(s_I_offart_SIlt6m2529m);  %var_d(s_I_offart_SIgt6m2529m); 

%var_d(s_I_undiag3034m); 		%var_d(s_I_diag_naive3034m); 	 %var_d(s_I_diag_startart3034m); 	%var_d(s_I_onart3034m);			 %var_d(s_I_offart3034m); 
%var_d(s_I_onart_lt6m3034m); 	%var_d(s_I_onart_lt6m_nvs3034m); %var_d(s_I_onart_gt6m_nvs3034m);   %var_d(s_I_onart_gt6m_vs3034m);  %var_d(s_I_offart_1stI3034m); 
%var_d(s_I_offart_SI3034m); 	%var_d(s_I_offart_SIlt6m3034m);  %var_d(s_I_offart_SIgt6m3034m); 

%var_d(s_I_undiag3539m); 		%var_d(s_I_diag_naive3539m);	 %var_d(s_I_diag_startart3539m); 	%var_d(s_I_onart3539m); 		 %var_d(s_I_offart3539m);
%var_d(s_I_onart_lt6m3539m); 	%var_d(s_I_onart_lt6m_nvs3539m); %var_d(s_I_onart_gt6m_nvs3539m);   %var_d(s_I_onart_gt6m_vs3539m);  %var_d(s_I_offart_1stI3539m);
%var_d(s_I_offart_SI3539m); 	%var_d(s_I_offart_SIlt6m3539m);  %var_d(s_I_offart_SIgt6m3539m); 

%var_d(s_I_undiag4044m); 		%var_d(s_I_diag_naive4044m);	 %var_d(s_I_diag_startart4044m); 	%var_d(s_I_onart4044m); 		 %var_d(s_I_offart4044m);
%var_d(s_I_onart_lt6m4044m); 	%var_d(s_I_onart_lt6m_nvs4044m); %var_d(s_I_onart_gt6m_nvs4044m);   %var_d(s_I_onart_gt6m_vs4044m);  %var_d(s_I_offart_1stI4044m);
%var_d(s_I_offart_SI4044m); 	%var_d(s_I_offart_SIlt6m4044m);  %var_d(s_I_offart_SIgt6m4044m); 

%var_d(s_I_undiag4549m); 		%var_d(s_I_diag_naive4549m);	 %var_d(s_I_diag_startart4549m); 	%var_d(s_I_onart4549m); 		 %var_d(s_I_offart4549m);
%var_d(s_I_onart_lt6m4549m); 	%var_d(s_I_onart_lt6m_nvs4549m); %var_d(s_I_onart_gt6m_nvs4549m);   %var_d(s_I_onart_gt6m_vs4549m);  %var_d(s_I_offart_1stI4549m);
%var_d(s_I_offart_SI4549m); 	%var_d(s_I_offart_SIlt6m4549m);  %var_d(s_I_offart_SIgt6m4549m); 

%var_d(s_I_undiag5054m); 		%var_d(s_I_diag_naive5054m);	 %var_d(s_I_diag_startart5054m); 	%var_d(s_I_onart5054m); 		 %var_d(s_I_offart5054m);
%var_d(s_I_onart_lt6m5054m); 	%var_d(s_I_onart_lt6m_nvs5054m); %var_d(s_I_onart_gt6m_nvs5054m);   %var_d(s_I_onart_gt6m_vs5054m);  %var_d(s_I_offart_1stI5054m);
%var_d(s_I_offart_SI5054m); 	%var_d(s_I_offart_SIlt6m5054m);  %var_d(s_I_offart_SIgt6m5054m); 

%var_d(s_I_undiag5559m); 		%var_d(s_I_diag_naive5559m);	 %var_d(s_I_diag_startart5559m); 	%var_d(s_I_onart5559m); 		 %var_d(s_I_offart5559m);
%var_d(s_I_onart_lt6m5559m); 	%var_d(s_I_onart_lt6m_nvs5559m); %var_d(s_I_onart_gt6m_nvs5559m);   %var_d(s_I_onart_gt6m_vs5559m);  %var_d(s_I_offart_1stI5559m);
%var_d(s_I_offart_SI5559m); 	%var_d(s_I_offart_SIlt6m5559m);  %var_d(s_I_offart_SIgt6m5559m); 

%var_d(s_I_undiag6064m); 		%var_d(s_I_diag_naive6064m);	 %var_d(s_I_diag_startart6064m); 	%var_d(s_I_onart6064m); 		 %var_d(s_I_offart6064m);
%var_d(s_I_onart_lt6m6064m); 	%var_d(s_I_onart_lt6m_nvs6064m); %var_d(s_I_onart_gt6m_nvs6064m);   %var_d(s_I_onart_gt6m_vs6064m);  %var_d(s_I_offart_1stI6064m);
%var_d(s_I_offart_SI6064m); 	%var_d(s_I_offart_SIlt6m6064m);  %var_d(s_I_offart_SIgt6m6064m); 

%var_d(s_I_undiag6569m); 		%var_d(s_I_diag_naive6569m);	 %var_d(s_I_diag_startart6569m); 	%var_d(s_I_onart6569m); 		 %var_d(s_I_offart6569m);
%var_d(s_I_onart_lt6m6569m); 	%var_d(s_I_onart_lt6m_nvs6569m); %var_d(s_I_onart_gt6m_nvs6569m);   %var_d(s_I_onart_gt6m_vs6569m);  %var_d(s_I_offart_1stI6569m);
%var_d(s_I_offart_SI6569m); 	%var_d(s_I_offart_SIlt6m6569m);  %var_d(s_I_offart_SIgt6m6569m); 

%var_d(s_I_undiag7074m); 		%var_d(s_I_diag_naive7074m);	 %var_d(s_I_diag_startart7074m); 	%var_d(s_I_onart7074m); 		 %var_d(s_I_offart7074m);
%var_d(s_I_onart_lt6m7074m); 	%var_d(s_I_onart_lt6m_nvs7074m); %var_d(s_I_onart_gt6m_nvs7074m);   %var_d(s_I_onart_gt6m_vs7074m);  %var_d(s_I_offart_1stI7074m);
%var_d(s_I_offart_SI7074m); 	%var_d(s_I_offart_SIlt6m7074m);  %var_d(s_I_offart_SIgt6m7074m); 

%var_d(s_I_undiag7579m); 		%var_d(s_I_diag_naive7579m);	 %var_d(s_I_diag_startart7579m); 	%var_d(s_I_onart7579m); 		 %var_d(s_I_offart7579m);
%var_d(s_I_onart_lt6m7579m); 	%var_d(s_I_onart_lt6m_nvs7579m); %var_d(s_I_onart_gt6m_nvs7579m);   %var_d(s_I_onart_gt6m_vs7579m);  %var_d(s_I_offart_1stI7579m);
%var_d(s_I_offart_SI7579m); 	%var_d(s_I_offart_SIlt6m7579m);  %var_d(s_I_offart_SIgt6m7579m); 

%var_d(s_I_undiag8084m); 		%var_d(s_I_diag_naive8084m);	 %var_d(s_I_diag_startart8084m); 	%var_d(s_I_onart8084m); 		 %var_d(s_I_offart8084m);
%var_d(s_I_onart_lt6m8084m); 	%var_d(s_I_onart_lt6m_nvs8084m); %var_d(s_I_onart_gt6m_nvs8084m);   %var_d(s_I_onart_gt6m_vs8084m);  %var_d(s_I_offart_1stI8084m);
%var_d(s_I_offart_SI8084m); 	%var_d(s_I_offart_SIlt6m8084m);  %var_d(s_I_offart_SIgt6m8084m); 

%var_d(s_I_undiag1519w); 		%var_d(s_I_diag_naive1519w);	 %var_d(s_I_diag_startart1519w); 	%var_d(s_I_onart1519w);	   		%var_d(s_I_offart1519w); 	
%var_d(s_I_onart_lt6m1519w);    %var_d(s_I_onart_lt6m_nvs1519w); %var_d(s_I_onart_gt6m_nvs1519w);	%var_d(s_I_onart_gt6m_vs1519w); %var_d(s_I_offart_1stI1519w);
%var_d(s_I_offart_SI1519w); 	%var_d(s_I_offart_SIlt6m1519w);  %var_d(s_I_offart_SIgt6m1519w); 

%var_d(s_I_undiag2024w); 		%var_d(s_I_diag_naive2024w);	 %var_d(s_I_diag_startart2024w);	%var_d(s_I_onart2024w); 		%var_d(s_I_offart2024w);
%var_d(s_I_onart_lt6m2024w); 	%var_d(s_I_onart_lt6m_nvs2024w); %var_d(s_I_onart_gt6m_nvs2024w);	%var_d(s_I_onart_gt6m_vs2024w); %var_d(s_I_offart_1stI2024w); 
%var_d(s_I_offart_SI2024w); 	%var_d(s_I_offart_SIlt6m2024w);  %var_d(s_I_offart_SIgt6m2024w); 

%var_d(s_I_undiag2529w);		%var_d(s_I_diag_naive2529w); 	 %var_d(s_I_diag_startart2529w); 	%var_d(s_I_onart2529w);			%var_d(s_I_offart2529w);
%var_d(s_I_onart_lt6m2529w); 	%var_d(s_I_onart_lt6m_nvs2529w); %var_d(s_I_onart_gt6m_nvs2529w);   %var_d(s_I_onart_gt6m_vs2529w); %var_d(s_I_offart_1stI2529w); 
%var_d(s_I_offart_SI2529w); 	%var_d(s_I_offart_SIlt6m2529w);  %var_d(s_I_offart_SIgt6m2529w); 

%var_d(s_I_undiag3034w); 		%var_d(s_I_diag_naive3034w); 	 %var_d(s_I_diag_startart3034w); 	%var_d(s_I_onart3034w);			 %var_d(s_I_offart3034w); 
%var_d(s_I_onart_lt6m3034w); 	%var_d(s_I_onart_lt6m_nvs3034w); %var_d(s_I_onart_gt6m_nvs3034w);   %var_d(s_I_onart_gt6m_vs3034w);  %var_d(s_I_offart_1stI3034w); 
%var_d(s_I_offart_SI3034w); 	%var_d(s_I_offart_SIlt6m3034w);  %var_d(s_I_offart_SIgt6m3034w); 

%var_d(s_I_undiag3539w); 		%var_d(s_I_diag_naive3539w);	 %var_d(s_I_diag_startart3539w); 	%var_d(s_I_onart3539w); 		 %var_d(s_I_offart3539w);
%var_d(s_I_onart_lt6m3539w); 	%var_d(s_I_onart_lt6m_nvs3539w); %var_d(s_I_onart_gt6m_nvs3539w);   %var_d(s_I_onart_gt6m_vs3539w);  %var_d(s_I_offart_1stI3539w);
%var_d(s_I_offart_SI3539w); 	%var_d(s_I_offart_SIlt6m3539w);  %var_d(s_I_offart_SIgt6m3539w); 

%var_d(s_I_undiag4044w); 		%var_d(s_I_diag_naive4044w);	 %var_d(s_I_diag_startart4044w); 	%var_d(s_I_onart4044w); 		 %var_d(s_I_offart4044w);
%var_d(s_I_onart_lt6m4044w); 	%var_d(s_I_onart_lt6m_nvs4044w); %var_d(s_I_onart_gt6m_nvs4044w);   %var_d(s_I_onart_gt6m_vs4044w);  %var_d(s_I_offart_1stI4044w);
%var_d(s_I_offart_SI4044w); 	%var_d(s_I_offart_SIlt6m4044w);  %var_d(s_I_offart_SIgt6m4044w); 

%var_d(s_I_undiag4549w); 		%var_d(s_I_diag_naive4549w);	 %var_d(s_I_diag_startart4549w); 	%var_d(s_I_onart4549w); 		 %var_d(s_I_offart4549w);
%var_d(s_I_onart_lt6m4549w); 	%var_d(s_I_onart_lt6m_nvs4549w); %var_d(s_I_onart_gt6m_nvs4549w);   %var_d(s_I_onart_gt6m_vs4549w);  %var_d(s_I_offart_1stI4549w);
%var_d(s_I_offart_SI4549w); 	%var_d(s_I_offart_SIlt6m4549w);  %var_d(s_I_offart_SIgt6m4549w); 

%var_d(s_I_undiag5054w); 		%var_d(s_I_diag_naive5054w);	 %var_d(s_I_diag_startart5054w); 	%var_d(s_I_onart5054w); 		 %var_d(s_I_offart5054w);
%var_d(s_I_onart_lt6m5054w); 	%var_d(s_I_onart_lt6m_nvs5054w); %var_d(s_I_onart_gt6m_nvs5054w);   %var_d(s_I_onart_gt6m_vs5054w);  %var_d(s_I_offart_1stI5054w);
%var_d(s_I_offart_SI5054w); 	%var_d(s_I_offart_SIlt6m5054w);  %var_d(s_I_offart_SIgt6m5054w); 

%var_d(s_I_undiag5559w); 		%var_d(s_I_diag_naive5559w);	 %var_d(s_I_diag_startart5559w); 	%var_d(s_I_onart5559w); 		 %var_d(s_I_offart5559w);
%var_d(s_I_onart_lt6m5559w); 	%var_d(s_I_onart_lt6m_nvs5559w); %var_d(s_I_onart_gt6m_nvs5559w);   %var_d(s_I_onart_gt6m_vs5559w);  %var_d(s_I_offart_1stI5559w);
%var_d(s_I_offart_SI5559w); 	%var_d(s_I_offart_SIlt6m5559w);  %var_d(s_I_offart_SIgt6m5559w); 

%var_d(s_I_undiag6064w); 		%var_d(s_I_diag_naive6064w);	 %var_d(s_I_diag_startart6064w); 	%var_d(s_I_onart6064w); 		 %var_d(s_I_offart6064w);
%var_d(s_I_onart_lt6m6064w); 	%var_d(s_I_onart_lt6m_nvs6064w); %var_d(s_I_onart_gt6m_nvs6064w);   %var_d(s_I_onart_gt6m_vs6064w);  %var_d(s_I_offart_1stI6064w);
%var_d(s_I_offart_SI6064w); 	%var_d(s_I_offart_SIlt6m6064w);  %var_d(s_I_offart_SIgt6m6064w); 

%var_d(s_I_undiag6569w); 		%var_d(s_I_diag_naive6569w);	 %var_d(s_I_diag_startart6569w); 	%var_d(s_I_onart6569w); 		 %var_d(s_I_offart6569w);
%var_d(s_I_onart_lt6m6569w); 	%var_d(s_I_onart_lt6m_nvs6569w); %var_d(s_I_onart_gt6m_nvs6569w);   %var_d(s_I_onart_gt6m_vs6569w);  %var_d(s_I_offart_1stI6569w);
%var_d(s_I_offart_SI6569w); 	%var_d(s_I_offart_SIlt6m6569w);  %var_d(s_I_offart_SIgt6m6569w); 

%var_d(s_I_undiag7074w); 		%var_d(s_I_diag_naive7074w);	 %var_d(s_I_diag_startart7074w); 	%var_d(s_I_onart7074w); 		 %var_d(s_I_offart7074w);
%var_d(s_I_onart_lt6m7074w); 	%var_d(s_I_onart_lt6m_nvs7074w); %var_d(s_I_onart_gt6m_nvs7074w);   %var_d(s_I_onart_gt6m_vs7074w);  %var_d(s_I_offart_1stI7074w);
%var_d(s_I_offart_SI7074w); 	%var_d(s_I_offart_SIlt6m7074w);  %var_d(s_I_offart_SIgt6m7074w); 

%var_d(s_I_undiag7579w); 		%var_d(s_I_diag_naive7579w);	 %var_d(s_I_diag_startart7579w); 	%var_d(s_I_onart7579w); 		 %var_d(s_I_offart7579w);
%var_d(s_I_onart_lt6m7579w); 	%var_d(s_I_onart_lt6m_nvs7579w); %var_d(s_I_onart_gt6m_nvs7579w);   %var_d(s_I_onart_gt6m_vs7579w);  %var_d(s_I_offart_1stI7579w);
%var_d(s_I_offart_SI7579w); 	%var_d(s_I_offart_SIlt6m7579w);  %var_d(s_I_offart_SIgt6m7579w); 

%var_d(s_I_undiag8084w); 		%var_d(s_I_diag_naive8084w);	 %var_d(s_I_diag_startart8084w); 	%var_d(s_I_onart8084w); 		 %var_d(s_I_offart8084w);
%var_d(s_I_onart_lt6m8084w); 	%var_d(s_I_onart_lt6m_nvs8084w); %var_d(s_I_onart_gt6m_nvs8084w);   %var_d(s_I_onart_gt6m_vs8084w);  %var_d(s_I_offart_1stI8084w);
%var_d(s_I_offart_SI8084w); 	%var_d(s_I_offart_SIlt6m8084w);  %var_d(s_I_offart_SIgt6m8084w); 

run;


***DEATHS OUTPUTS;
***Create datasets that resemble the Excel template. Order these in the same order as the Excel template;
data a.wide_base;
merge 
l_n_alive1564_m		l_n_alive1564_w		l_n_alive1564_  	 l_prevalence1564m 		l_prevalence1564w	l_prevalence1564_   
l_incidence1564_m	l_incidence1564_w	l_incidence1564_	 l_p_diag_m		  		l_p_diag_w		    l_p_diag
l_p_onart_diag_m	l_p_onart_diag_w  	l_p_onart_diag  	 l_p_onart_vl1000_m 	l_p_onart_vl1000_w  l_p_onart_vl1000_ 	 
;run;


***This macro creates age-specific datasets which resemble the sheets in Excel; 
%macro agecat(age,mage,wage);
data a.deaths&age;

merge 

l_n_hiv&age	 l_n_hiv&mage	 	l_n_hiv&wage 	/*n_hiv_death1519	n_hiv_death&mage	n_hiv_death&wage*/
l_s_dead_undiag&age				l_s_dead_undiag&mage				l_s_dead_undiag&wage	
l_s_dead_diag_not_linked&age	l_s_dead_diag_not_linked&mage		l_s_dead_diag_not_linked&wage
l_s_dead_Alt6_Acd4lt200&age 	l_s_dead_Alt6_Acd4lt200&mage 		l_s_dead_Alt6_Acd4lt200&wage
l_s_dead_Alt6_Acd4gt200&age		l_s_dead_Alt6_Acd4gt200&mage		l_s_dead_Alt6_Acd4gt200&wage
l_s_d_I_Alt6_Rcd4lt200&age		l_s_d_I_Alt6_Rcd4lt200&mage 		l_s_d_I_Alt6_Rcd4lt200&wage 
l_s_d_I_Alt6_Rcd4gt200&age		l_s_d_I_Alt6_Rcd4gt200&mage 		l_s_d_I_Alt6_Rcd4gt200&wage 
l_s_dead_A_vl1000&age			l_s_dead_A_vl1000&mage				l_s_dead_A_vl1000&wage
l_s_dead_A_vg1000&age			l_s_dead_A_vg1000&mage				l_s_dead_A_vg1000&wage
l_s_dead_Alt6_vl1000&age		l_s_dead_Alt6_vl1000&mage			l_s_dead_Alt6_vl1000&wage
l_s_dead_Alt6_vg1000&age		l_s_dead_Alt6_vg1000&mage			l_s_dead_Alt6_vg1000&wage
l_s_dead_Agt6_vl1000&age		l_s_dead_Agt6_vl1000&mage			l_s_dead_Agt6_vl1000&wage
l_s_dead_Agt6_vg1000&age		l_s_dead_Agt6_vg1000&mage			l_s_dead_Agt6_vg1000&wage
l_s_dead_int_lost&age			l_s_dead_int_lost&mage				l_s_dead_int_lost&wage	
l_s_dead_1stint_lost&age		l_s_dead_1stint_lost&mage			l_s_dead_1stint_lost&wage
l_s_dead_subintlt6_lost&age		l_s_dead_subintlt6_lost&mage		l_s_dead_subintlt6_lost&wage
l_s_dead_subintgt6_lost&age		l_s_dead_subintgt6_lost&mage		l_s_dead_subintgt6_lost&wage
l_s_dead_A_cd4lt200&age			l_s_dead_A_cd4lt200&mage			l_s_dead_A_cd4lt200&wage
l_s_dead_A_cd4gt200&age			l_s_dead_A_cd4gt200&mage			l_s_dead_A_cd4gt200&wage
l_s_dead_Alt6_cd4lt200&age		l_s_dead_Alt6_cd4lt200&mage			l_s_dead_Alt6_cd4lt200&wage
l_s_dead_Alt6_cd4gt200&age		l_s_dead_Alt6_cd4gt200&mage			l_s_dead_Alt6_cd4gt200&wage
l_s_dead_Agt6_cd4lt200&age		l_s_dead_Agt6_cd4lt200&mage 		l_s_dead_Agt6_cd4lt200&wage
l_s_dead_Agt6_cd4gt200&age		l_s_dead_Agt6_cd4gt200&mage 		l_s_dead_Agt6_cd4gt200&wage;
%mend;

%agecat(1519_,1519m,1519w); %agecat(2024_,2024m,2024w); %agecat(2529_,2529m,2529w); %agecat(3034_,3034m,3034w);
%agecat(3539_,3539m,3539w); %agecat(4044_,4044m,4044w); %agecat(4549_,4549m,4549w); %agecat(5054_,5054m,5054w);
%agecat(5559_,5559m,5559w); %agecat(6064_,6064m,6064w); %agecat(6569_,6569m,6569w); %agecat(7074_,7074m,7074w);
%agecat(7579_,7579m,7579w); %agecat(8084_,8084m,8084w); 


***This prints to an Excel sheet, starting at row A2/A3. Will need to go into Excel sheet to do final column title edits;
ods listing close;
ods results off;

ods excel file="C:\Loveleen\Synthesis model\Modelling Consortium\Attribution of deaths\Deaths\Deaths Template_HIVSynthesis.xlsx"
options(sheet_name='base' start_at='A2');
proc print data=a.wide_base noobs;run;

**This macro avoids having to write out these lines for each age band;
%macro out(age);
ods excel options(sheet_name="deaths&age" start_at='A3');
proc print data=a.deaths&age noobs;run;
%mend;

%out(1519_); %out(2024_); %out(2529_); %out(3034_); %out(3539_); %out(4044_); %out(4549_); %out(5054_); %out(5559_);
%out(6064_); %out(6569_); %out(7074_); %out(7579_); %out(8084_);
ods excel close;







***TRANSMISSIONS TEMPLATE;

***DEATHS OUTPUTS;
***Create datasets that resemble the Excel template. Order these in the same order as the Excel template;
data a.wide_base;
merge 
l_n_alive1564_m		l_n_alive1564_w		l_n_alive1564_  	 l_prevalence1564m 		l_prevalence1564w	l_prevalence1564_   
l_incidence1564_m	l_incidence1564_w	l_incidence1564_	 l_p_diag_m		  		l_p_diag_w		    l_p_diag
l_p_onart_diag_m	l_p_onart_diag_w  	l_p_onart_diag  	 l_p_onart_vl1000_m 	l_p_onart_vl1000_w  l_p_onart_vl1000_ 	 
;run;


***This macro creates age-specific datasets which resemble the sheets in Excel; 
%macro agecat(age,mage,wage);
data a.deaths&age;

merge 

l_n_hiv&age	 l_n_hiv&mage	 	l_n_hiv&wage 	/*n_hiv_death1519	n_hiv_death&mage	n_hiv_death&wage*/

l_s_dead_undiag&age				l_s_dead_undiag&mage				l_s_dead_undiag&wage	
l_s_dead_diag_not_linked&age	l_s_dead_diag_not_linked&mage		l_s_dead_diag_not_linked&wage
l_s_dead_Alt6_Acd4lt200&age 	l_s_dead_Alt6_Acd4lt200&mage 		l_s_dead_Alt6_Acd4lt200&wage
l_s_dead_Alt6_Acd4gt200&age		l_s_dead_Alt6_Acd4gt200&mage		l_s_dead_Alt6_Acd4gt200&wage
l_s_d_I_Alt6_Rcd4lt200&age		l_s_d_I_Alt6_Rcd4lt200&mage 		l_s_d_I_Alt6_Rcd4lt200&wage 
l_s_d_I_Alt6_Rcd4gt200&age		l_s_d_I_Alt6_Rcd4gt200&mage 		l_s_d_I_Alt6_Rcd4gt200&wage 
l_s_dead_A_vl1000&age			l_s_dead_A_vl1000&mage				l_s_dead_A_vl1000&wage
l_s_dead_A_vg1000&age			l_s_dead_A_vg1000&mage				l_s_dead_A_vg1000&wage
l_s_dead_Alt6_vl1000&age		l_s_dead_Alt6_vl1000&mage			l_s_dead_Alt6_vl1000&wage
l_s_dead_Alt6_vg1000&age		l_s_dead_Alt6_vg1000&mage			l_s_dead_Alt6_vg1000&wage
l_s_dead_Agt6_vl1000&age		l_s_dead_Agt6_vl1000&mage			l_s_dead_Agt6_vl1000&wage
l_s_dead_Agt6_vg1000&age		l_s_dead_Agt6_vg1000&mage			l_s_dead_Agt6_vg1000&wage
l_s_dead_int_lost&age			l_s_dead_int_lost&mage				l_s_dead_int_lost&wage	
l_s_dead_1stint_lost&age		l_s_dead_1stint_lost&mage			l_s_dead_1stint_lost&wage
l_s_dead_subintlt6_lost&age		l_s_dead_subintlt6_lost&mage		l_s_dead_subintlt6_lost&wage
l_s_dead_subintgt6_lost&age		l_s_dead_subintgt6_lost&mage		l_s_dead_subintgt6_lost&wage
l_s_dead_A_cd4lt200&age			l_s_dead_A_cd4lt200&mage			l_s_dead_A_cd4lt200&wage
l_s_dead_A_cd4gt200&age			l_s_dead_A_cd4gt200&mage			l_s_dead_A_cd4gt200&wage
l_s_dead_Alt6_cd4lt200&age		l_s_dead_Alt6_cd4lt200&mage			l_s_dead_Alt6_cd4lt200&wage
l_s_dead_Alt6_cd4gt200&age		l_s_dead_Alt6_cd4gt200&mage			l_s_dead_Alt6_cd4gt200&wage
l_s_dead_Agt6_cd4lt200&age		l_s_dead_Agt6_cd4lt200&mage 		l_s_dead_Agt6_cd4lt200&wage
l_s_dead_Agt6_cd4gt200&age		l_s_dead_Agt6_cd4gt200&mage 		l_s_dead_Agt6_cd4gt200&wage;
%mend;

%agecat(1519_,1519m,1519w); %agecat(2024_,2024m,2024w); %agecat(2529_,2529m,2529w); %agecat(3034_,3034m,3034w);
%agecat(3539_,3539m,3539w); %agecat(4044_,4044m,4044w); %agecat(4549_,4549m,4549w); %agecat(5054_,5054m,5054w);
%agecat(5559_,5559m,5559w); %agecat(6064_,6064m,6064w); %agecat(6569_,6569m,6569w); %agecat(7074_,7074m,7074w);
%agecat(7579_,7579m,7579w); %agecat(8084_,8084m,8084w); 


***This prints to an Excel sheet, starting at row A2/A3. Will need to go into Excel sheet to do final column title edits;
ods listing close;
ods results off;

ods excel file="C:\Loveleen\Synthesis model\Modelling Consortium\Attribution of deaths\Deaths\Deaths Template_HIVSynthesis.xlsx"
options(sheet_name='base' start_at='A2');
proc print data=a.wide_base noobs;run;

**This macro avoids having to write out these lines for each age band;
%macro out(age);
ods excel options(sheet_name="deaths&age" start_at='A3');
proc print data=a.deaths&age noobs;run;
%mend;

%out(1519_); %out(2024_); %out(2529_); %out(3034_); %out(3539_); %out(4044_); %out(4549_); %out(5054_); %out(5559_);
%out(6064_); %out(6569_); %out(7074_); %out(7579_); %out(8084_);
ods excel close;





data c.I_undiag;merge 
s_I_undiag 		s_I_undiag_m 	s_I_undiag_w 
s_I_undiag1519m  s_I_undiag2024m  s_I_undiag2529m  s_I_undiag3034m  s_I_undiag3539m  s_I_undiag4044m  s_I_undiag4549m  s_I_undiag5054m  s_I_undiag5559m   
s_I_undiag6064m  s_I_undiag6569m  s_I_undiag7074m  s_I_undiag7579m  s_I_undiag8084m 
s_I_undiag1519w  s_I_undiag2024w  s_I_undiag2529w  s_I_undiag3034w  s_I_undiag3539w  s_I_undiag4044w  s_I_undiag4549w  s_I_undiag5054w  s_I_undiag5559w   
s_I_undiag6064w  s_I_undiag6569w  s_I_undiag7074w  s_I_undiag7579w  s_I_undiag8084w;
proc sort;by run;run;

data c.I_diag_naive;merge 
s_I_diag_naive 		s_I_diag_naive_m 	s_I_diag_naive_w 
s_I_diag_naive1519m  s_I_diag_naive2024m  s_I_diag_naive2529m  s_I_diag_naive3034m  s_I_diag_naive3539m  s_I_diag_naive4044m  s_I_diag_naive4549m  s_I_diag_naive5054m  s_I_diag_naive5559m   
s_I_diag_naive6064m  s_I_diag_naive6569m  s_I_diag_naive7074m  s_I_diag_naive7579m  s_I_diag_naive8084m 
s_I_diag_naive1519w  s_I_diag_naive2024w  s_I_diag_naive2529w  s_I_diag_naive3034w  s_I_diag_naive3539w  s_I_diag_naive4044w  s_I_diag_naive4549w  s_I_diag_naive5054w  s_I_diag_naive5559w   
s_I_diag_naive6064w  s_I_diag_naive6569w  s_I_diag_naive7074w  s_I_diag_naive7579w  s_I_diag_naive8084w;
proc sort;by run;run;

data c.I_diag_startart;merge 
s_I_diag_startart 		s_I_diag_startart_m 	s_I_diag_startart_w 
s_I_diag_startart1519m  s_I_diag_startart2024m  s_I_diag_startart2529m  s_I_diag_startart3034m  s_I_diag_startart3539m  s_I_diag_startart4044m  s_I_diag_startart4549m  s_I_diag_startart5054m  s_I_diag_startart5559m   
s_I_diag_startart6064m  s_I_diag_startart6569m  s_I_diag_startart7074m  s_I_diag_startart7579m  s_I_diag_startart8084m 
s_I_diag_startart1519w  s_I_diag_startart2024w  s_I_diag_startart2529w  s_I_diag_startart3034w  s_I_diag_startart3539w  s_I_diag_startart4044w  s_I_diag_startart4549w  s_I_diag_startart5054w  s_I_diag_startart5559w   
s_I_diag_startart6064w  s_I_diag_startart6569w  s_I_diag_startart7074w  s_I_diag_startart7579w  s_I_diag_startart8084w;
proc sort;by run;run;

data c.I_onart;merge 
s_I_onart 		s_I_onart_m 	s_I_onart_w 
s_I_onart1519m  s_I_onart2024m  s_I_onart2529m  s_I_onart3034m  s_I_onart3539m  s_I_onart4044m  s_I_onart4549m  s_I_onart5054m  s_I_onart5559m   
s_I_onart6064m  s_I_onart6569m  s_I_onart7074m  s_I_onart7579m  s_I_onart8084m 
s_I_onart1519w  s_I_onart2024w  s_I_onart2529w  s_I_onart3034w  s_I_onart3539w  s_I_onart4044w  s_I_onart4549w  s_I_onart5054w  s_I_onart5559w   
s_I_onart6064w  s_I_onart6569w  s_I_onart7074w  s_I_onart7579w  s_I_onart8084w;
proc sort;by run;run;

data c.I_onart_lt6m;merge 
s_I_onart_lt6m 		s_I_onart_lt6m_m 	s_I_onart_lt6m_w 
s_I_onart_lt6m1519m  s_I_onart_lt6m2024m  s_I_onart_lt6m2529m  s_I_onart_lt6m3034m  s_I_onart_lt6m3539m  s_I_onart_lt6m4044m  s_I_onart_lt6m4549m  s_I_onart_lt6m5054m  s_I_onart_lt6m5559m   
s_I_onart_lt6m6064m  s_I_onart_lt6m6569m  s_I_onart_lt6m7074m  s_I_onart_lt6m7579m  s_I_onart_lt6m8084m 
s_I_onart_lt6m1519w  s_I_onart_lt6m2024w  s_I_onart_lt6m2529w  s_I_onart_lt6m3034w  s_I_onart_lt6m3539w  s_I_onart_lt6m4044w  s_I_onart_lt6m4549w  s_I_onart_lt6m5054w  s_I_onart_lt6m5559w   
s_I_onart_lt6m6064w  s_I_onart_lt6m6569w  s_I_onart_lt6m7074w  s_I_onart_lt6m7579w  s_I_onart_lt6m8084w;
proc sort;by run;run;

data c.I_diag_onart_lt6m_nvs;merge 
s_I_onart_lt6m_nvs 		s_I_onart_lt6m_nvs_m 	s_I_onart_lt6m_nvs_w 
s_I_onart_lt6m_nvs1519m  s_I_onart_lt6m_nvs2024m  s_I_onart_lt6m_nvs2529m  s_I_onart_lt6m_nvs3034m  s_I_onart_lt6m_nvs3539m  s_I_onart_lt6m_nvs4044m  s_I_onart_lt6m_nvs4549m  s_I_onart_lt6m_nvs5054m  s_I_onart_lt6m_nvs5559m   
s_I_onart_lt6m_nvs6064m  s_I_onart_lt6m_nvs6569m  s_I_onart_lt6m_nvs7074m  s_I_onart_lt6m_nvs7579m  s_I_onart_lt6m_nvs8084m 
s_I_onart_lt6m_nvs1519w  s_I_onart_lt6m_nvs2024w  s_I_onart_lt6m_nvs2529w  s_I_onart_lt6m_nvs3034w  s_I_onart_lt6m_nvs3539w  s_I_onart_lt6m_nvs4044w  s_I_onart_lt6m_nvs4549w  s_I_onart_lt6m_nvs5054w  s_I_onart_lt6m_nvs5559w   
s_I_onart_lt6m_nvs6064w  s_I_onart_lt6m_nvs6569w  s_I_onart_lt6m_nvs7074w  s_I_onart_lt6m_nvs7579w  s_I_onart_lt6m_nvs8084w;
proc sort;by run;run;

data c.I_onart_gt6m_nvs;merge 
s_I_onart_gt6m_nvs 		s_I_onart_gt6m_nvs_m 	s_I_onart_gt6m_nvs_w 
s_I_onart_gt6m_nvs1519m  s_I_onart_gt6m_nvs2024m  s_I_onart_gt6m_nvs2529m  s_I_onart_gt6m_nvs3034m  s_I_onart_gt6m_nvs3539m  s_I_onart_gt6m_nvs4044m  s_I_onart_gt6m_nvs4549m  s_I_onart_gt6m_nvs5054m  s_I_onart_gt6m_nvs5559m   
s_I_onart_gt6m_nvs6064m  s_I_onart_gt6m_nvs6569m  s_I_onart_gt6m_nvs7074m  s_I_onart_gt6m_nvs7579m  s_I_onart_gt6m_nvs8084m 
s_I_onart_gt6m_nvs1519w  s_I_onart_gt6m_nvs2024w  s_I_onart_gt6m_nvs2529w  s_I_onart_gt6m_nvs3034w  s_I_onart_gt6m_nvs3539w  s_I_onart_gt6m_nvs4044w  s_I_onart_gt6m_nvs4549w  s_I_onart_gt6m_nvs5054w  s_I_onart_gt6m_nvs5559w   
s_I_onart_gt6m_nvs6064w  s_I_onart_gt6m_nvs6569w  s_I_onart_gt6m_nvs7074w  s_I_onart_gt6m_nvs7579w  s_I_onart_gt6m_nvs8084w;
proc sort;by run;run;

data c.I_onart_gt6m_vs;merge 
s_I_onart_gt6m_vs 		s_I_onart_gt6m_vs_m 	s_I_onart_gt6m_vs_w 
s_I_onart_gt6m_vs1519m  s_I_onart_gt6m_vs2024m  s_I_onart_gt6m_vs2529m  s_I_onart_gt6m_vs3034m  s_I_onart_gt6m_vs3539m  s_I_onart_gt6m_vs4044m  s_I_onart_gt6m_vs4549m  s_I_onart_gt6m_vs5054m  s_I_onart_gt6m_vs5559m   
s_I_onart_gt6m_vs6064m  s_I_onart_gt6m_vs6569m  s_I_onart_gt6m_vs7074m  s_I_onart_gt6m_vs7579m  s_I_onart_gt6m_vs8084m 
s_I_onart_gt6m_vs1519w  s_I_onart_gt6m_vs2024w  s_I_onart_gt6m_vs2529w  s_I_onart_gt6m_vs3034w  s_I_onart_gt6m_vs3539w  s_I_onart_gt6m_vs4044w  s_I_onart_gt6m_vs4549w  s_I_onart_gt6m_vs5054w  s_I_onart_gt6m_vs5559w   
s_I_onart_gt6m_vs6064w  s_I_onart_gt6m_vs6569w  s_I_onart_gt6m_vs7074w  s_I_onart_gt6m_vs7579w  s_I_onart_gt6m_vs8084w;
proc sort;by run;run;

data c.I_offart_1stI;merge 
s_I_offart_1stI 		s_I_offart_1stI_m 	s_I_offart_1stI_w 
s_I_offart_1stI1519m  s_I_offart_1stI2024m  s_I_offart_1stI2529m  s_I_offart_1stI3034m  s_I_offart_1stI3539m  s_I_offart_1stI4044m  s_I_offart_1stI4549m  s_I_offart_1stI5054m  s_I_offart_1stI5559m   
s_I_offart_1stI6064m  s_I_offart_1stI6569m  s_I_offart_1stI7074m  s_I_offart_1stI7579m  s_I_offart_1stI8084m 
s_I_offart_1stI1519w  s_I_offart_1stI2024w  s_I_offart_1stI2529w  s_I_offart_1stI3034w  s_I_offart_1stI3539w  s_I_offart_1stI4044w  s_I_offart_1stI4549w  s_I_offart_1stI5054w  s_I_offart_1stI5559w   
s_I_offart_1stI6064w  s_I_offart_1stI6569w  s_I_offart_1stI7074w  s_I_offart_1stI7579w  s_I_offart_1stI8084w;
proc sort;by run;run;

data c.I_offart_SI;merge 
s_I_offart_SI 		s_I_offart_SI_m 	s_I_offart_SI_w 
s_I_offart_SI1519m  s_I_offart_SI2024m  s_I_offart_SI2529m  s_I_offart_SI3034m  s_I_offart_SI3539m  s_I_offart_SI4044m  s_I_offart_SI4549m  s_I_offart_SI5054m  s_I_offart_SI5559m   
s_I_offart_SI6064m  s_I_offart_SI6569m  s_I_offart_SI7074m  s_I_offart_SI7579m  s_I_offart_SI8084m 
s_I_offart_SI1519w  s_I_offart_SI2024w  s_I_offart_SI2529w  s_I_offart_SI3034w  s_I_offart_SI3539w  s_I_offart_SI4044w  s_I_offart_SI4549w  s_I_offart_SI5054w  s_I_offart_SI5559w   
s_I_offart_SI6064w  s_I_offart_SI6569w  s_I_offart_SI7074w  s_I_offart_SI7579w  s_I_offart_SI8084w;
proc sort;by run;run;

data c.I_offart_SIlt6m;merge 
s_I_offart_SIlt6m 		s_I_offart_SIlt6m_m 	s_I_offart_SIlt6m_w 
s_I_offart_SIlt6m1519m  s_I_offart_SIlt6m2024m  s_I_offart_SIlt6m2529m  s_I_offart_SIlt6m3034m  s_I_offart_SIlt6m3539m  s_I_offart_SIlt6m4044m  s_I_offart_SIlt6m4549m  s_I_offart_SIlt6m5054m  s_I_offart_SIlt6m5559m   
s_I_offart_SIlt6m6064m  s_I_offart_SIlt6m6569m  s_I_offart_SIlt6m7074m  s_I_offart_SIlt6m7579m  s_I_offart_SIlt6m8084m 
s_I_offart_SIlt6m1519w  s_I_offart_SIlt6m2024w  s_I_offart_SIlt6m2529w  s_I_offart_SIlt6m3034w  s_I_offart_SIlt6m3539w  s_I_offart_SIlt6m4044w  s_I_offart_SIlt6m4549w  s_I_offart_SIlt6m5054w  s_I_offart_SIlt6m5559w   
s_I_offart_SIlt6m6064w  s_I_offart_SIlt6m6569w  s_I_offart_SIlt6m7074w  s_I_offart_SIlt6m7579w  s_I_offart_SIlt6m8084w;
proc sort;by run;run;

data c.I_offart_SIgt6m;merge 
s_I_offart_SIgt6m 		s_I_offart_SIgt6m_m 	s_I_offart_SIgt6m_w 
s_I_offart_SIgt6m1519m  s_I_offart_SIgt6m2024m  s_I_offart_SIgt6m2529m  s_I_offart_SIgt6m3034m  s_I_offart_SIgt6m3539m  s_I_offart_SIgt6m4044m  s_I_offart_SIgt6m4549m  s_I_offart_SIgt6m5054m  s_I_offart_SIgt6m5559m   
s_I_offart_SIgt6m6064m  s_I_offart_SIgt6m6569m  s_I_offart_SIgt6m7074m  s_I_offart_SIgt6m7579m  s_I_offart_SIgt6m8084m 
s_I_offart_SIgt6m1519w  s_I_offart_SIgt6m2024w  s_I_offart_SIgt6m2529w  s_I_offart_SIgt6m3034w  s_I_offart_SIgt6m3539w  s_I_offart_SIgt6m4044w  s_I_offart_SIgt6m4549w  s_I_offart_SIgt6m5054w  s_I_offart_SIgt6m5559w   
s_I_offart_SIgt6m6064w  s_I_offart_SIgt6m6569w  s_I_offart_SIgt6m7074w  s_I_offart_SIgt6m7579w  s_I_offart_SIgt6m8084w;
proc sort;by run;run;
