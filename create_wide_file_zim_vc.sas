libname a "C:\Users\loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\Deaths Zim\";

data a;
set a.zim_06jun23;
if run=. then delete;

*if option ne 0 then delete; *Error in main code where other options were coded in the update statements. Could keep all of them but 
takes ages to run so cut down dataset;
*if run ne  896923088 then delete;

proc sort;by run;run;
proc freq;table cald run;run;


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

s_primary1519_ =  s_primary1519m + s_primary1519w;
s_primary3539_ =  s_primary3539m + s_primary3539w;

n_primary1564m = s_primary1564m * &sf * 4;
n_primary1564w = s_primary1564w * &sf * 4;
n_primary1564_ = n_primary1564m + n_primary1564w;

* n_alive1564_;					n_alive1564_  = s_alive1564 * &sf * 4;
* n_alive1564_m;				n_alive1564_m = s_alive1564_m * &sf * 4;
* n_alive1564_w;				n_alive1564_w = s_alive1564_w * &sf * 4;

* n_hiv1519_;					n_hiv1519_= (s_hiv1519m + s_hiv1519w) * &sf * 4;
* n_hiv2024_;					n_hiv2024_= (s_hiv2024m + s_hiv2024w) * &sf * 4;
* n_hiv2529_;					n_hiv2529_= (s_hiv2529m + s_hiv2529w) * &sf * 4;
* n_hiv3034_;					n_hiv3034_= (s_hiv3034m + s_hiv3034w) * &sf * 4;
* n_hiv3539_;					n_hiv3539_= (s_hiv3539m + s_hiv3539w) * &sf * 4;
* n_hiv4044_;					n_hiv4044_= (s_hiv4044m + s_hiv4044w) * &sf * 4;
* n_hiv4549_;					n_hiv4549_= (s_hiv4549m + s_hiv4549w) * &sf * 4;
* n_hiv5054_;					n_hiv5054_= (s_hiv5054m + s_hiv5054w) * &sf * 4;
* n_hiv5559_;					n_hiv5559_= (s_hiv5559m + s_hiv5559w) * &sf * 4;
* n_hiv6064_;					n_hiv6064_= (s_hiv6064m + s_hiv6064w) * &sf * 4;
* n_hiv6569_;					n_hiv6569_= (s_hiv6569m + s_hiv6569w) * &sf * 4;
* n_hiv7074_;					n_hiv7074_= (s_hiv7074m + s_hiv7074w) * &sf * 4;
* n_hiv7579_;					n_hiv7579_= (s_hiv7579m + s_hiv7579w) * &sf * 4;
* n_hiv8084_;					n_hiv8084_= (s_hiv8084m + s_hiv8084w) * &sf * 4;


* n_hiv1519m;					n_hiv1519m = s_hiv1519m * &sf * 4;
* n_hiv1519w;					n_hiv1519w = s_hiv1519w * &sf * 4;
* n_hiv2024m;					n_hiv2024m = s_hiv2024m * &sf * 4;
* n_hiv2024w;					n_hiv2024w = s_hiv2024w * &sf * 4;
* n_hiv2529m;					n_hiv2529m = s_hiv2529m * &sf * 4;
* n_hiv2529w;					n_hiv2529w = s_hiv2529w * &sf * 4;
* n_hiv3034m;					n_hiv3034m = s_hiv3034m * &sf * 4;
* n_hiv3034w;					n_hiv3034w = s_hiv3034w * &sf * 4;
* n_hiv3539m;					n_hiv3539m = s_hiv3539m * &sf * 4;
* n_hiv3539w;					n_hiv3539w = s_hiv3539w * &sf * 4;
* n_hiv4044m;					n_hiv4044m = s_hiv4044m * &sf * 4;
* n_hiv4044w;					n_hiv4044w = s_hiv4044w * &sf * 4;
* n_hiv4549m;					n_hiv4549m = s_hiv4549m * &sf * 4;
* n_hiv4549w;					n_hiv4549w = s_hiv4549w * &sf * 4;
* n_hiv5054m;					n_hiv5054m = s_hiv5054m * &sf * 4;
* n_hiv5054w;					n_hiv5054w = s_hiv5054w * &sf * 4;
* n_hiv5559m;					n_hiv5559m = s_hiv5559m * &sf * 4;
* n_hiv5559w;					n_hiv5559w = s_hiv5559w * &sf * 4;
* n_hiv6064m;					n_hiv6064m = s_hiv6064m * &sf * 4;
* n_hiv6064w;					n_hiv6064w = s_hiv6064w * &sf * 4;
* n_hiv6569m;					n_hiv6569m = s_hiv6569m * &sf * 4;
* n_hiv6569w;					n_hiv6569w = s_hiv6569w * &sf * 4;
* n_hiv7074m;					n_hiv7074m = s_hiv7074m * &sf * 4;
* n_hiv7074w;					n_hiv7074w = s_hiv7074w * &sf * 4;
* n_hiv7579m;					n_hiv7579m = s_hiv7579m * &sf * 4;
* n_hiv7579w;					n_hiv7579w = s_hiv7579w * &sf * 4;
* n_hiv8084m;					n_hiv8084m = s_hiv8084m * &sf * 4;
* n_hiv8084w;					n_hiv8084w = s_hiv8084w * &sf * 4;


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

* n_hiv_death1519m;				n_hiv_death1519m = s_hiv_death1519m * &sf * 4;
* n_hiv_death1519w;				n_hiv_death1519w = s_hiv_death1519w * &sf * 4;
* n_hiv_death2024m;				n_hiv_death2024m = s_hiv_death2024m * &sf * 4;
* n_hiv_death2024w;				n_hiv_death2024w = s_hiv_death2024w * &sf * 4;
* n_hiv_death2529m;				n_hiv_death2529m = s_hiv_death2529m * &sf * 4;
* n_hiv_death2529w;				n_hiv_death2529w = s_hiv_death2529w * &sf * 4;
* n_hiv_death3034m;				n_hiv_death3034m = s_hiv_death3034m * &sf * 4;
* n_hiv_death3034w;				n_hiv_death3034w = s_hiv_death3034w * &sf * 4;
* n_hiv_death3539m;				n_hiv_death3539m = s_hiv_death3539m * &sf * 4;
* n_hiv_death3539w;				n_hiv_death3539w = s_hiv_death3539w * &sf * 4;
* n_hiv_death4044m;				n_hiv_death4044m = s_hiv_death4044m * &sf * 4;
* n_hiv_death4044w;				n_hiv_death4044w = s_hiv_death4044w * &sf * 4;
* n_hiv_death4549m;				n_hiv_death4549m = s_hiv_death4549m * &sf * 4;
* n_hiv_death4549w;				n_hiv_death4549w = s_hiv_death4549w * &sf * 4;
* n_hiv_death5054m;				n_hiv_death5054m = s_hiv_death5054m * &sf * 4;
* n_hiv_death5054w;				n_hiv_death5054w = s_hiv_death5054w * &sf * 4;
* n_hiv_death5559m;				n_hiv_death5559m = s_hiv_death5559m * &sf * 4;
* n_hiv_death5559w;				n_hiv_death5559w = s_hiv_death5559w * &sf * 4;
* n_hiv_death6064m;				n_hiv_death6064m = s_hiv_death6064m * &sf * 4;
* n_hiv_death6064w;				n_hiv_death6064w = s_hiv_death6064w * &sf * 4;
* n_hiv_death6569m;				n_hiv_death6569m = s_hiv_death6569m * &sf * 4;
* n_hiv_death6569w;				n_hiv_death6569w = s_hiv_death6569w * &sf * 4;
* n_hiv_death7074m;				n_hiv_death7074m = s_hiv_death7074m * &sf * 4;
* n_hiv_death7074w;				n_hiv_death7074w = s_hiv_death7074w * &sf * 4;
* n_hiv_death7579m;				n_hiv_death7579m = s_hiv_death7579m * &sf * 4;
* n_hiv_death7579w;				n_hiv_death7579w = s_hiv_death7579w * &sf * 4;
* n_hiv_death8084m;				n_hiv_death8084m = s_hiv_death8084m * &sf * 4;
* n_hiv_death8084w;				n_hiv_death8084w = s_hiv_death8084w * &sf * 4;

* n_inf1519_;					n_inf1519_ = s_primary1519_ * &sf * 4;
* n_inf2024_;					n_inf2024_ = s_primary2024_ * &sf * 4;
* n_inf2529_;					n_inf2529_ = s_primary2529_ * &sf * 4;
* n_inf3034_;					n_inf3034_ = s_primary3034_ * &sf * 4;
* n_inf3539_;					n_inf3539_ = s_primary3539_ * &sf * 4;
* n_inf4044_;					n_inf4044_ = s_primary4044_ * &sf * 4;
* n_inf4549_;					n_inf4549_ = s_primary4549_ * &sf * 4;
* n_inf5054_;					n_inf5054_ = s_primary5054_ * &sf * 4;
* n_inf5559_;					n_inf5559_ = s_primary5559_ * &sf * 4;
* n_inf6064_;					n_inf6064_ = s_primary6064_ * &sf * 4;
* n_inf6569_;					n_inf6569_ = s_primary6569_ * &sf * 4;
* n_inf7074_;					n_inf7074_ = s_primary7074_ * &sf * 4;
* n_inf7579_;					n_inf7579_ = s_primary7579_ * &sf * 4;
* n_inf8084_;					n_inf8084_ = s_primary8084_ * &sf * 4;

* n_inf1519m;					n_inf1519m = s_primary1519m * &sf * 4;
* n_inf2024m;					n_inf2024m = s_primary2024m * &sf * 4;
* n_inf2529m;					n_inf2529m = s_primary2529m * &sf * 4;
* n_inf3034m;					n_inf3034m = s_primary3034m * &sf * 4;
* n_inf3539m;					n_inf3539m = s_primary3539m * &sf * 4;
* n_inf4044m;					n_inf4044m = s_primary4044m * &sf * 4;
* n_inf4549m;					n_inf4549m = s_primary4549m * &sf * 4;
* n_inf5054m;					n_inf5054m = s_primary5054m * &sf * 4;
* n_inf5559m;					n_inf5559m = s_primary5559m * &sf * 4;
* n_inf6064m;					n_inf6064m = s_primary6064m * &sf * 4;
* n_inf6569m;					n_inf6569m = s_primary6569m * &sf * 4;
* n_inf7074m;					n_inf7074m = s_primary7074m * &sf * 4;
* n_inf7579m;					n_inf7579m = s_primary7579m * &sf * 4;
* n_inf8084m;					n_inf8084m = s_primary8084m * &sf * 4;

* n_inf1519w;					n_inf1519w = s_primary1519w * &sf * 4;
* n_inf2024w;					n_inf2024w = s_primary2024w * &sf * 4;
* n_inf2529w;					n_inf2529w = s_primary2529w * &sf * 4;
* n_inf3034w;					n_inf3034w = s_primary3034w * &sf * 4;
* n_inf3539w;					n_inf3539w = s_primary3539w * &sf * 4;
* n_inf4044w;					n_inf4044w = s_primary4044w * &sf * 4;
* n_inf4549w;					n_inf4549w = s_primary4549w * &sf * 4;
* n_inf5054w;					n_inf5054w = s_primary5054w * &sf * 4;
* n_inf5559w;					n_inf5559w = s_primary5559w * &sf * 4;
* n_inf6064w;					n_inf6064w = s_primary6064w * &sf * 4;
* n_inf6569w;					n_inf6569w = s_primary6569w * &sf * 4;
* n_inf7074w;					n_inf7074w = s_primary7074w * &sf * 4;
* n_inf7579w;					n_inf7579w = s_primary7579w * &sf * 4;
* n_inf8084w;					n_inf8084w = s_primary8084w * &sf * 4;



***Rename so variables are less than <32 char as the macro will add on characters;

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



n_dead_undiag				= s_dead_undiag * &sf * 4;
n_dead_diag_not_linked 		= s_dead_diag_not_linked * &sf * 4;
n_dead_Alt6_Acd4lt200_ 		= s_dead_Alt6_artcd4lt200 * &sf * 4;
n_dead_Alt6_Acd4gt200_ 		= s_dead_Alt6_artcd4gt200 * &sf * 4;
n_d_I_Alt6_Rcd4lt200_ 		= s_dead_I_Alt6_Rcd4lt200 * &sf * 4;
n_d_I_Alt6_Rcd4gt200_ 		= s_dead_I_Alt6_Rcd4gt200 * &sf * 4;
n_dead_A_vl1000_ 			= s_dead_A_vl1000 * &sf * 4;
n_dead_A_vg1000_ 			= s_dead_A_vg1000 * &sf * 4;
n_dead_Alt6_vl1000_ 		= s_dead_Alt6_vl1000 * &sf * 4;
n_dead_Alt6_vg1000_ 		= s_dead_Alt6_vg1000 * &sf * 4;
n_dead_Agt6_vl1000_ 		= s_dead_Agt6_vl1000 * &sf * 4;
n_dead_Agt6_vg1000_ 		= s_dead_Agt6_vg1000 * &sf * 4;
n_dead_int_lost 			= s_dead_int_lost * &sf * 4;
n_dead_1stint_lost	 		= s_dead_1stint_lost * &sf * 4;
n_dead_subintlt6_lost 		= s_dead_subintlt6_lost * &sf * 4;
n_dead_subintgt6_lost 		= s_dead_subintgt6_lost * &sf * 4;
n_dead_A_cd4lt200_ 			= s_dead_A_cd4lt200 * &sf * 4;
n_dead_A_cd4gt200_ 			= s_dead_A_cd4gt200 * &sf * 4;
n_dead_Alt6_cd4lt200_ 		= s_dead_Alt6_cd4lt200 * &sf * 4;
n_dead_Alt6_cd4gt200_ 		= s_dead_Alt6_cd4gt200 * &sf * 4;
n_dead_Agt6_cd4lt200_ 		= s_dead_Agt6_cd4lt200 * &sf * 4;
n_dead_Agt6_cd4gt200_ 		= s_dead_Agt6_cd4gt200 * &sf * 4;

n_dead_undiag_m				= s_dead_undiag_m * &sf * 4;
n_dead_diag_not_linked_m 	= s_dead_diag_not_linked_m * &sf * 4;
n_dead_Alt6_Acd4lt200_m 	= s_dead_Alt6_artcd4lt200_m * &sf * 4;
n_dead_Alt6_Acd4gt200_m 	= s_dead_Alt6_artcd4gt200_m * &sf * 4;
n_d_I_Alt6_Rcd4lt200_m 		= s_dead_I_Alt6_Rcd4lt200_m * &sf * 4;
n_d_I_Alt6_Rcd4gt200_m 		= s_dead_I_Alt6_Rcd4gt200_m * &sf * 4;
n_dead_A_vl1000_m 			= s_dead_A_vl1000_m * &sf * 4;
n_dead_A_vg1000_m 			= s_dead_A_vg1000_m * &sf * 4;
n_dead_Alt6_vl1000_m 		= s_dead_Alt6_vl1000_m * &sf * 4;
n_dead_Alt6_vg1000_m 		= s_dead_Alt6_vg1000_m * &sf * 4;
n_dead_Agt6_vl1000_m 		= s_dead_Agt6_vl1000_m * &sf * 4;
n_dead_Agt6_vg1000_m 		= s_dead_Agt6_vg1000_m * &sf * 4;
n_dead_int_lost_m 			= s_dead_int_lost_m * &sf * 4;
n_dead_1stint_lost_m 		= s_dead_1stint_lost_m * &sf * 4;
n_dead_subintlt6_lost_m 	= s_dead_subintlt6_lost_m * &sf * 4;
n_dead_subintgt6_lost_m 	= s_dead_subintgt6_lost_m * &sf * 4;
n_dead_A_cd4lt200_m 		= s_dead_A_cd4lt200_m * &sf * 4;
n_dead_A_cd4gt200_m 		= s_dead_A_cd4gt200_m * &sf * 4;
n_dead_Alt6_cd4lt200_m 		= s_dead_Alt6_cd4lt200_m * &sf * 4;
n_dead_Alt6_cd4gt200_m 		= s_dead_Alt6_cd4gt200_m * &sf * 4;
n_dead_Agt6_cd4lt200_m 		= s_dead_Agt6_cd4lt200_m * &sf * 4;
n_dead_Agt6_cd4gt200_m 		= s_dead_Agt6_cd4gt200_m * &sf * 4;

n_dead_undiag_w				= s_dead_undiag_w * &sf * 4;
n_dead_diag_not_linked_w 	= s_dead_diag_not_linked_w * &sf * 4;
n_dead_Alt6_Acd4lt200_w 	= s_dead_Alt6_artcd4lt200_w * &sf * 4;
n_dead_Alt6_Acd4gt200_w		= s_dead_Alt6_artcd4gt200_w * &sf * 4;
n_d_I_Alt6_Rcd4lt200_w 		= s_dead_I_Alt6_Rcd4lt200_w * &sf * 4;
n_d_I_Alt6_Rcd4gt200_w 		= s_dead_I_Alt6_Rcd4gt200_w * &sf * 4;
n_dead_A_vl1000_w 			= s_dead_A_vl1000_w * &sf * 4;
n_dead_A_vg1000_w 			= s_dead_A_vg1000_w * &sf * 4;
n_dead_Alt6_vl1000_w 		= s_dead_Alt6_vl1000_w * &sf * 4;
n_dead_Alt6_vg1000_w 		= s_dead_Alt6_vg1000_w * &sf * 4;
n_dead_Agt6_vl1000_w 		= s_dead_Agt6_vl1000_w * &sf * 4;
n_dead_Agt6_vg1000_w 		= s_dead_Agt6_vg1000_w * &sf * 4;
n_dead_int_lost_w 			= s_dead_int_lost_w * &sf * 4;
n_dead_1stint_lost_w 		= s_dead_1stint_lost_w * &sf * 4;
n_dead_subintlt6_lost_w 	= s_dead_subintlt6_lost_w * &sf * 4;
n_dead_subintgt6_lost_w 	= s_dead_subintgt6_lost_w * &sf * 4;
n_dead_A_cd4lt200_w 		= s_dead_A_cd4lt200_w * &sf * 4;
n_dead_A_cd4gt200_w 		= s_dead_A_cd4gt200_w * &sf * 4;
n_dead_Alt6_cd4lt200_w 		= s_dead_Alt6_cd4lt200_w * &sf * 4;
n_dead_Alt6_cd4gt200_w 		= s_dead_Alt6_cd4gt200_w * &sf * 4;
n_dead_Agt6_cd4lt200_w 		= s_dead_Agt6_cd4lt200_w * &sf * 4;
n_dead_Agt6_cd4gt200_w 		= s_dead_Agt6_cd4gt200_w * &sf * 4;

n_I_undiag 			= s_I_undiag * &sf * 4;
n_I_diag_naive 		= s_I_diag_naive  * &sf * 4;
n_I_diag_startart 	= s_I_diag_startart * &sf * 4;
n_I_onart 			= s_I_onart * &sf * 4;
n_I_offart			= s_I_offart * &sf * 4;
n_I_onart_lt6m		= s_I_onart_lt6m * &sf * 4;
n_I_onart_lt6m_nvs	= s_I_onart_lt6m_nvs * &sf * 4;
n_I_onart_gt6m_nvs	= s_I_onart_gt6m_nvs * &sf * 4;
n_I_onart_gt6m_vs	= s_I_onart_gt6m_vs * &sf * 4;
n_I_offart_1stI		= s_I_offart_1stI * &sf * 4;
n_I_offart_SI		= s_I_offart_SI * &sf * 4;     
n_I_offart_SIlt6m	= s_I_offart_SIlt6m * &sf * 4;
n_I_offart_SIgt6m	= s_I_offart_SIgt6m * &sf * 4;

n_I_undiag_m 			= s_I_undiag_m * &sf * 4;
n_I_diag_naive_m 		= s_I_diag_naive_m  * &sf * 4;
n_I_diag_startart_m 	= s_I_diag_startart_m * &sf * 4;
n_I_onart_m 			= s_I_onart_m * &sf * 4;
n_I_offart_m			= s_I_offart_m * &sf * 4;
n_I_onart_lt6m_m		= s_I_onart_lt6m_m * &sf * 4;
n_I_onart_lt6m_nvs_m	= s_I_onart_lt6m_nvs_m * &sf * 4;
n_I_onart_gt6m_nvs_m	= s_I_onart_gt6m_nvs_m * &sf * 4;
n_I_onart_gt6m_vs_m		= s_I_onart_gt6m_vs_m * &sf * 4;
n_I_offart_1stI_m		= s_I_offart_1stI_m * &sf * 4;
n_I_offart_SI_m			= s_I_offart_SI_m * &sf * 4;     
n_I_offart_SIlt6m_m		= s_I_offart_SIlt6m_m * &sf * 4;
n_I_offart_SIgt6m_m		= s_I_offart_SIgt6m_m * &sf * 4;

n_I_undiag_w 			= s_I_undiag_w * &sf * 4;
n_I_diag_naive_w 		= s_I_diag_naive_w  * &sf * 4;
n_I_diag_startart_w 	= s_I_diag_startart_w * &sf * 4;
n_I_onart_w 			= s_I_onart_w * &sf * 4;
n_I_offart_w			= s_I_offart_w * &sf * 4;
n_I_onart_lt6m_w		= s_I_onart_lt6m_w * &sf * 4;
n_I_onart_lt6m_nvs_w	= s_I_onart_lt6m_nvs_w * &sf * 4;
n_I_onart_gt6m_nvs_w	= s_I_onart_gt6m_nvs_w * &sf * 4;
n_I_onart_gt6m_vs_w		= s_I_onart_gt6m_vs_w * &sf * 4;
n_I_offart_1stI_w		= s_I_offart_1stI_w * &sf * 4;
n_I_offart_SI_w			= s_I_offart_SI_w * &sf * 4;     
n_I_offart_SIlt6m_w		= s_I_offart_SIlt6m_w * &sf * 4;
n_I_offart_SIgt6m_w		= s_I_offart_SIgt6m_w * &sf * 4;

%macro scaleup (age, mage, wage);

n_I_undiag&age 			= s_I_undiag&age * &sf * 4;
n_I_diag_naive&age 		= s_I_diag_naive&age  * &sf * 4;
n_I_diag_startart&age 	= s_I_diag_startart&age * &sf * 4;
n_I_onart&age 			= s_I_onart&age * &sf * 4;
n_I_offart&age			= s_I_offart&age * &sf * 4;
n_I_onart_lt6m&age		= s_I_onart_lt6m&age * &sf * 4;
n_I_onart_lt6m_nvs&age	= s_I_onart_lt6m_nvs&age * &sf * 4;
n_I_onart_gt6m_nvs&age	= s_I_onart_gt6m_nvs&age * &sf * 4;
n_I_onart_gt6m_vs&age	= s_I_onart_gt6m_vs&age * &sf * 4;
n_I_offart_1stI&age		= s_I_offart_1stI&age * &sf * 4;
n_I_offart_SI&age		= s_I_offart_SI&age * &sf * 4;     
n_I_offart_SIlt6m&age	= s_I_offart_SIlt6m&age * &sf * 4;
n_I_offart_SIgt6m&age	= s_I_offart_SIgt6m&age * &sf * 4;

n_I_undiag&mage 			= s_I_undiag&mage * &sf * 4;
n_I_diag_naive&mage 		= s_I_diag_naive&mage  * &sf * 4;
n_I_diag_startart&mage 	= s_I_diag_startart&mage * &sf * 4;
n_I_onart&mage 			= s_I_onart&mage * &sf * 4;
n_I_offart&mage			= s_I_offart&mage * &sf * 4;
n_I_onart_lt6m&mage		= s_I_onart_lt6m&mage * &sf * 4;
n_I_onart_lt6m_nvs&mage	= s_I_onart_lt6m_nvs&mage * &sf * 4;
n_I_onart_gt6m_nvs&mage	= s_I_onart_gt6m_nvs&mage * &sf * 4;
n_I_onart_gt6m_vs&mage	= s_I_onart_gt6m_vs&mage * &sf * 4;
n_I_offart_1stI&mage		= s_I_offart_1stI&mage * &sf * 4;
n_I_offart_SI&mage		= s_I_offart_SI&mage * &sf * 4;     
n_I_offart_SIlt6m&mage	= s_I_offart_SIlt6m&mage * &sf * 4;
n_I_offart_SIgt6m&mage	= s_I_offart_SIgt6m&mage * &sf * 4;

n_I_undiag&wage 			= s_I_undiag&wage * &sf * 4;
n_I_diag_naive&wage 		= s_I_diag_naive&wage  * &sf * 4;
n_I_diag_startart&wage 	= s_I_diag_startart&wage * &sf * 4;
n_I_onart&wage 			= s_I_onart&wage * &sf * 4;
n_I_offart&wage			= s_I_offart&wage * &sf * 4;
n_I_onart_lt6m&wage		= s_I_onart_lt6m&wage * &sf * 4;
n_I_onart_lt6m_nvs&wage	= s_I_onart_lt6m_nvs&wage * &sf * 4;
n_I_onart_gt6m_nvs&wage	= s_I_onart_gt6m_nvs&wage * &sf * 4;
n_I_onart_gt6m_vs&wage	= s_I_onart_gt6m_vs&wage * &sf * 4;
n_I_offart_1stI&wage		= s_I_offart_1stI&wage * &sf * 4;
n_I_offart_SI&wage		= s_I_offart_SI&wage * &sf * 4;     
n_I_offart_SIlt6m&wage	= s_I_offart_SIlt6m&wage * &sf * 4;
n_I_offart_SIgt6m&wage	= s_I_offart_SIgt6m&wage * &sf * 4;


n_dead_undiag&age				= s_dead_undiag&age * &sf * 4;
n_dead_diag_not_linked&age 		= s_dead_diag_not_linked&age * &sf * 4;
n_dead_Alt6_Acd4lt200&age 		= s_dead_Alt6_Acd4lt200&age * &sf * 4;
n_dead_Alt6_Acd4gt200&age 		= s_dead_Alt6_Acd4gt200&age * &sf * 4;
n_d_I_Alt6_Rcd4lt200&age 		= s_d_I_Alt6_Rcd4lt200&age * &sf * 4;
n_d_I_Alt6_Rcd4gt200&age 		= s_d_I_Alt6_Rcd4gt200&age * &sf * 4;
n_dead_A_vl1000&age 			= s_dead_A_vl1000&age * &sf * 4;
n_dead_A_vg1000&age 			= s_dead_A_vg1000&age * &sf * 4;
n_dead_Alt6_vl1000&age 			= s_dead_Alt6_vl1000&age * &sf * 4;
n_dead_Alt6_vg1000&age 			= s_dead_Alt6_vg1000&age * &sf * 4;
n_dead_Agt6_vl1000&age 			= s_dead_Agt6_vl1000&age * &sf * 4;
n_dead_Agt6_vg1000&age 			= s_dead_Agt6_vg1000&age * &sf * 4;
n_dead_int_lost&age 			= s_dead_int_lost&age * &sf * 4;
n_dead_1stint_lost&age 			= s_dead_1stint_lost&age * &sf * 4;
n_dead_subintlt6_lost&age 		= s_dead_subintlt6_lost&age * &sf * 4;
n_dead_subintgt6_lost&age 		= s_dead_subintgt6_lost&age * &sf * 4;
n_dead_A_cd4lt200&age 			= s_dead_A_cd4lt200&age * &sf * 4;
n_dead_A_cd4gt200&age 			= s_dead_A_cd4gt200&age * &sf * 4;
n_dead_Alt6_cd4lt200&age 		= s_dead_Alt6_cd4lt200&age * &sf * 4;
n_dead_Alt6_cd4gt200&age 		= s_dead_Alt6_cd4gt200&age * &sf * 4;
n_dead_Agt6_cd4lt200&age 		= s_dead_Agt6_cd4lt200&age * &sf * 4;
n_dead_Agt6_cd4gt200&age 		= s_dead_Agt6_cd4gt200&age * &sf * 4;

n_dead_undiag&mage				= s_dead_undiag&mage * &sf * 4;
n_dead_diag_not_linked&mage 	= s_dead_diag_not_linked&mage * &sf * 4;
n_dead_Alt6_Acd4lt200&mage 		= s_dead_Alt6_Acd4lt200&mage * &sf * 4;
n_dead_Alt6_Acd4gt200&mage 		= s_dead_Alt6_Acd4gt200&mage * &sf * 4;
n_d_I_Alt6_Rcd4lt200&mage 		= s_d_I_Alt6_Rcd4lt200&mage * &sf * 4;
n_d_I_Alt6_Rcd4gt200&mage 		= s_d_I_Alt6_Rcd4gt200&mage * &sf * 4;
n_dead_A_vl1000&mage 			= s_dead_A_vl1000&mage * &sf * 4;
n_dead_A_vg1000&mage 			= s_dead_A_vg1000&mage * &sf * 4;
n_dead_Alt6_vl1000&mage 		= s_dead_Alt6_vl1000&mage * &sf * 4;
n_dead_Alt6_vg1000&mage 		= s_dead_Alt6_vg1000&mage * &sf * 4;
n_dead_Agt6_vl1000&mage 		= s_dead_Agt6_vl1000&mage * &sf * 4;
n_dead_Agt6_vg1000&mage 		= s_dead_Agt6_vg1000&mage * &sf * 4;
n_dead_int_lost&mage 			= s_dead_int_lost&mage * &sf * 4;
n_dead_1stint_lost&mage 		= s_dead_1stint_lost&mage * &sf * 4;
n_dead_subintlt6_lost&mage 		= s_dead_subintlt6_lost&mage * &sf * 4;
n_dead_subintgt6_lost&mage 		= s_dead_subintgt6_lost&mage * &sf * 4;
n_dead_A_cd4lt200&mage 			= s_dead_A_cd4lt200&mage * &sf * 4;
n_dead_A_cd4gt200&mage 			= s_dead_A_cd4gt200&mage * &sf * 4;
n_dead_Alt6_cd4lt200&mage 		= s_dead_Alt6_cd4lt200&mage * &sf * 4;
n_dead_Alt6_cd4gt200&mage 		= s_dead_Alt6_cd4gt200&mage * &sf * 4;
n_dead_Agt6_cd4lt200&mage 		= s_dead_Agt6_cd4lt200&mage * &sf * 4;
n_dead_Agt6_cd4gt200&mage 		= s_dead_Agt6_cd4gt200&mage * &sf * 4;

n_dead_undiag&wage				= s_dead_undiag&wage * &sf * 4;
n_dead_diag_not_linked&wage 		= s_dead_diag_not_linked&wage * &sf * 4;
n_dead_Alt6_Acd4lt200&wage 		= s_dead_Alt6_Acd4lt200&wage * &sf * 4;
n_dead_Alt6_Acd4gt200&wage 		= s_dead_Alt6_Acd4gt200&wage * &sf * 4;
n_d_I_Alt6_Rcd4lt200&wage 		= s_d_I_Alt6_Rcd4lt200&wage * &sf * 4;
n_d_I_Alt6_Rcd4gt200&wage 		= s_d_I_Alt6_Rcd4gt200&wage * &sf * 4;
n_dead_A_vl1000&wage 			= s_dead_A_vl1000&wage * &sf * 4;
n_dead_A_vg1000&wage 			= s_dead_A_vg1000&wage * &sf * 4;
n_dead_Alt6_vl1000&wage 			= s_dead_Alt6_vl1000&wage * &sf * 4;
n_dead_Alt6_vg1000&wage 			= s_dead_Alt6_vg1000&wage * &sf * 4;
n_dead_Agt6_vl1000&wage 			= s_dead_Agt6_vl1000&wage * &sf * 4;
n_dead_Agt6_vg1000&wage 			= s_dead_Agt6_vg1000&wage * &sf * 4;
n_dead_int_lost&wage 			= s_dead_int_lost&wage * &sf * 4;
n_dead_1stint_lost&wage 			= s_dead_1stint_lost&wage * &sf * 4;
n_dead_subintlt6_lost&wage 		= s_dead_subintlt6_lost&wage * &sf * 4;
n_dead_subintgt6_lost&wage 		= s_dead_subintgt6_lost&wage * &sf * 4;
n_dead_A_cd4lt200&wage 			= s_dead_A_cd4lt200&wage * &sf * 4;
n_dead_A_cd4gt200&wage 			= s_dead_A_cd4gt200&wage * &sf * 4;
n_dead_Alt6_cd4lt200&wage 		= s_dead_Alt6_cd4lt200&wage * &sf * 4;
n_dead_Alt6_cd4gt200&wage 		= s_dead_Alt6_cd4gt200&wage * &sf * 4;
n_dead_Agt6_cd4lt200&wage 		= s_dead_Agt6_cd4lt200&wage * &sf * 4;
n_dead_Agt6_cd4gt200&wage 		= s_dead_Agt6_cd4gt200&wage * &sf * 4;

%mend;

%scaleup(1519_,1519m,1519w); %scaleup(2024_,2024m,2024w); %scaleup(2529_,2529m,2529w); %scaleup(3034_,3034m,3034w);
%scaleup(3539_,3539m,3539w); %scaleup(4044_,4044m,4044w); %scaleup(4549_,4549m,4549w); %scaleup(5054_,5054m,5054w);
%scaleup(5559_,5559m,5559w); %scaleup(6064_,6064m,6064w); %scaleup(6569_,6569m,6569w); %scaleup(7074_,7074m,7074w);
%scaleup(7579_,7579m,7579w); %scaleup(8084_,8084m,8084w); 



keep cald	run sf_2022
n_alive1564_	n_alive1564_m		n_alive1564_w		prevalence1564_		prevalence1564m		prevalence1564w	
incidence1564_	incidence1564_m		incidence1564_w		p_diag				p_diag_m			p_diag_w
p_onart_diag	p_onart_diag_m		p_onart_diag_w		p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w
n_hiv1519_  n_hiv2024_  n_hiv2529_  n_hiv3034_  n_hiv3539_  n_hiv4044_  n_hiv4549_  n_hiv5054_  n_hiv5559_  n_hiv6064_ n_hiv6569_  n_hiv7074_  n_hiv7579_  n_hiv8084_  
n_hiv1519m  n_hiv2024m  n_hiv2529m  n_hiv3034m  n_hiv3539m  n_hiv4044m  n_hiv4549m  n_hiv5054m  n_hiv5559m  n_hiv6064m n_hiv6569m  n_hiv7074m  n_hiv7579m  n_hiv8084m  
n_hiv1519w  n_hiv2024w  n_hiv2529w  n_hiv3034w  n_hiv3539w  n_hiv4044w  n_hiv4549w  n_hiv5054w  n_hiv5559w  n_hiv6064w  n_hiv6569w  n_hiv7074w  n_hiv7579w  n_hiv8084w 

n_primary1564_ n_primary1564m n_primary1564w
s_primary1519_ s_primary1519m s_primary1519w
s_primary3539_ s_primary3539m s_primary3539w

/*
n_hiv_death1519_  n_hiv_death2024_  n_hiv_death2529_  n_hiv_death3034_  n_hiv_death3539_  n_hiv_death4044_  n_hiv_death4549_  n_hiv_death5054_  n_hiv_death5559_  n_hiv_death6064_ n_hiv_death6569_  n_hiv_death7074_  n_hiv_death7579_  n_hiv_death8084_  
*/
n_hiv_death1519m  n_hiv_death2024m  n_hiv_death2529m  n_hiv_death3034m  n_hiv_death3539m  n_hiv_death4044m  n_hiv_death4549m  n_hiv_death5054m  n_hiv_death5559m  n_hiv_death6064m n_hiv_death6569m  n_hiv_death7074m  n_hiv_death7579m  n_hiv_death8084m  
n_hiv_death1519w  n_hiv_death2024w  n_hiv_death2529w  n_hiv_death3034w  n_hiv_death3539w  n_hiv_death4044w  n_hiv_death4549w  n_hiv_death5054w  n_hiv_death5559w  n_hiv_death6064w  n_hiv_death6569w  n_hiv_death7074w  n_hiv_death7579w  n_hiv_death8084w 

n_inf1519_  n_inf2024_  n_inf2529_  n_inf3034_  n_inf3539_  n_inf4044_  n_inf4549_  n_inf5054_  n_inf5559_  n_inf6064_ n_inf6569_  n_inf7074_  n_inf7579_  n_inf8084_  
n_inf1519m  n_inf2024m  n_inf2529m  n_inf3034m  n_inf3539m  n_inf4044m  n_inf4549m  n_inf5054m  n_inf5559m  n_inf6064m n_inf6569m  n_inf7074m  n_inf7579m  n_inf8084m  
n_inf1519w  n_inf2024w  n_inf2529w  n_inf3034w  n_inf3539w  n_inf4044w  n_inf4549w  n_inf5054w  n_inf5559w  n_inf6064w  n_inf6569w  n_inf7074w  n_inf7579w  n_inf8084w 


n_hiv_death_m		n_hiv_death_w		n_hiv_death

/*Deaths*/
n_dead_undiag  n_dead_diag_not_linked  
n_dead_Alt6_Acd4lt200_  n_dead_Alt6_Acd4gt200_  
n_d_I_Alt6_Rcd4lt200_  n_d_I_Alt6_Rcd4gt200_  
n_dead_A_vl1000_  n_dead_A_vg1000_  n_dead_Alt6_vl1000_  n_dead_Alt6_vg1000_  
n_dead_Agt6_vl1000_  n_dead_Agt6_vg1000_  
n_dead_int_lost  n_dead_1stint_lost  n_dead_subintlt6_lost  n_dead_subintgt6_lost  
n_dead_A_cd4lt200_  n_dead_A_cd4gt200_  
n_dead_Alt6_cd4lt200_  n_dead_Alt6_cd4gt200_  n_dead_Agt6_cd4lt200_  n_dead_Agt6_cd4gt200_  

n_dead_undiag_m 	n_dead_undiag_w  
n_dead_undiag1519_  n_dead_undiag2024_  n_dead_undiag2529_  n_dead_undiag3034_  n_dead_undiag3539_  
n_dead_undiag4044_  n_dead_undiag4549_  n_dead_undiag5054_  n_dead_undiag5559_  n_dead_undiag6064_  
n_dead_undiag6569_  n_dead_undiag7074_  n_dead_undiag7579_  n_dead_undiag8084_  
n_dead_undiag1519m  n_dead_undiag2024m  n_dead_undiag2529m  n_dead_undiag3034m  n_dead_undiag3539m  
n_dead_undiag4044m  n_dead_undiag4549m  n_dead_undiag5054m  n_dead_undiag5559m  n_dead_undiag6064m  
n_dead_undiag6569m  n_dead_undiag7074m  n_dead_undiag7579m  n_dead_undiag8084m  
n_dead_undiag1519w  n_dead_undiag2024w  n_dead_undiag2529w  n_dead_undiag3034w  n_dead_undiag3539w  
n_dead_undiag4044w  n_dead_undiag4549w  n_dead_undiag5054w  n_dead_undiag5559w  n_dead_undiag6064w  
n_dead_undiag6569w  n_dead_undiag7074w  n_dead_undiag7579w  n_dead_undiag8084w  

n_dead_diag_not_linked_m  	 n_dead_diag_not_linked_w  
n_dead_diag_not_linked1519_  n_dead_diag_not_linked2024_  n_dead_diag_not_linked2529_  n_dead_diag_not_linked3034_  n_dead_diag_not_linked3539_  
n_dead_diag_not_linked4044_  n_dead_diag_not_linked4549_  n_dead_diag_not_linked5054_  n_dead_diag_not_linked5559_  n_dead_diag_not_linked6064_  
n_dead_diag_not_linked6569_  n_dead_diag_not_linked7074_  n_dead_diag_not_linked7579_  n_dead_diag_not_linked8084_  
n_dead_diag_not_linked1519m  n_dead_diag_not_linked2024m  n_dead_diag_not_linked2529m  n_dead_diag_not_linked3034m  n_dead_diag_not_linked3539m  
n_dead_diag_not_linked4044m  n_dead_diag_not_linked4549m  n_dead_diag_not_linked5054m  n_dead_diag_not_linked5559m  n_dead_diag_not_linked6064m  
n_dead_diag_not_linked6569m  n_dead_diag_not_linked7074m  n_dead_diag_not_linked7579m  n_dead_diag_not_linked8084m  
n_dead_diag_not_linked1519w  n_dead_diag_not_linked2024w  n_dead_diag_not_linked2529w  n_dead_diag_not_linked3034w  n_dead_diag_not_linked3539w  
n_dead_diag_not_linked4044w  n_dead_diag_not_linked4549w  n_dead_diag_not_linked5054w  n_dead_diag_not_linked5559w  n_dead_diag_not_linked6064w  
n_dead_diag_not_linked6569w  n_dead_diag_not_linked7074w  n_dead_diag_not_linked7579w  n_dead_diag_not_linked8084w  

n_dead_Alt6_Acd4lt200_m  	n_dead_Alt6_Acd4lt200_w  
n_dead_Alt6_Acd4lt2001519_  n_dead_Alt6_Acd4lt2002024_  n_dead_Alt6_Acd4lt2002529_  n_dead_Alt6_Acd4lt2003034_  n_dead_Alt6_Acd4lt2003539_  
n_dead_Alt6_Acd4lt2004044_  n_dead_Alt6_Acd4lt2004549_  n_dead_Alt6_Acd4lt2005054_  n_dead_Alt6_Acd4lt2005559_  n_dead_Alt6_Acd4lt2006064_  
n_dead_Alt6_Acd4lt2006569_  n_dead_Alt6_Acd4lt2007074_  n_dead_Alt6_Acd4lt2007579_  n_dead_Alt6_Acd4lt2008084_  
n_dead_Alt6_Acd4lt2001519m  n_dead_Alt6_Acd4lt2002024m  n_dead_Alt6_Acd4lt2002529m  n_dead_Alt6_Acd4lt2003034m  n_dead_Alt6_Acd4lt2003539m  
n_dead_Alt6_Acd4lt2004044m  n_dead_Alt6_Acd4lt2004549m  n_dead_Alt6_Acd4lt2005054m  n_dead_Alt6_Acd4lt2005559m  n_dead_Alt6_Acd4lt2006064m  
n_dead_Alt6_Acd4lt2006569m  n_dead_Alt6_Acd4lt2007074m  n_dead_Alt6_Acd4lt2007579m  n_dead_Alt6_Acd4lt2008084m  
n_dead_Alt6_Acd4lt2001519w  n_dead_Alt6_Acd4lt2002024w  n_dead_Alt6_Acd4lt2002529w  n_dead_Alt6_Acd4lt2003034w  n_dead_Alt6_Acd4lt2003539w  
n_dead_Alt6_Acd4lt2004044w  n_dead_Alt6_Acd4lt2004549w  n_dead_Alt6_Acd4lt2005054w  n_dead_Alt6_Acd4lt2005559w  n_dead_Alt6_Acd4lt2006064w  
n_dead_Alt6_Acd4lt2006569w  n_dead_Alt6_Acd4lt2007074w  n_dead_Alt6_Acd4lt2007579w  n_dead_Alt6_Acd4lt2008084w  

n_dead_Alt6_Acd4gt200_m  	n_dead_Alt6_Acd4gt200_w  
n_dead_Alt6_Acd4gt2001519_  n_dead_Alt6_Acd4gt2002024_  n_dead_Alt6_Acd4gt2002529_  n_dead_Alt6_Acd4gt2003034_  n_dead_Alt6_Acd4gt2003539_  
n_dead_Alt6_Acd4gt2004044_  n_dead_Alt6_Acd4gt2004549_  n_dead_Alt6_Acd4gt2005054_  n_dead_Alt6_Acd4gt2005559_  n_dead_Alt6_Acd4gt2006064_  
n_dead_Alt6_Acd4gt2006569_  n_dead_Alt6_Acd4gt2007074_  n_dead_Alt6_Acd4gt2007579_  n_dead_Alt6_Acd4gt2008084_  
n_dead_Alt6_Acd4gt2001519m  n_dead_Alt6_Acd4gt2002024m  n_dead_Alt6_Acd4gt2002529m  n_dead_Alt6_Acd4gt2003034m  n_dead_Alt6_Acd4gt2003539m  
n_dead_Alt6_Acd4gt2004044m  n_dead_Alt6_Acd4gt2004549m  n_dead_Alt6_Acd4gt2005054m  n_dead_Alt6_Acd4gt2005559m  n_dead_Alt6_Acd4gt2006064m  
n_dead_Alt6_Acd4gt2006569m  n_dead_Alt6_Acd4gt2007074m  n_dead_Alt6_Acd4gt2007579m  n_dead_Alt6_Acd4gt2008084m  
n_dead_Alt6_Acd4gt2001519w  n_dead_Alt6_Acd4gt2002024w  n_dead_Alt6_Acd4gt2002529w  n_dead_Alt6_Acd4gt2003034w  n_dead_Alt6_Acd4gt2003539w  
n_dead_Alt6_Acd4gt2004044w  n_dead_Alt6_Acd4gt2004549w  n_dead_Alt6_Acd4gt2005054w  n_dead_Alt6_Acd4gt2005559w  n_dead_Alt6_Acd4gt2006064w  
n_dead_Alt6_Acd4gt2006569w  n_dead_Alt6_Acd4gt2007074w  n_dead_Alt6_Acd4gt2007579w  n_dead_Alt6_Acd4gt2008084w  

n_d_I_Alt6_Rcd4lt200_m     n_d_I_Alt6_Rcd4lt200_w  
n_d_I_Alt6_Rcd4lt2001519_  n_d_I_Alt6_Rcd4lt2002024_  n_d_I_Alt6_Rcd4lt2002529_  n_d_I_Alt6_Rcd4lt2003034_  n_d_I_Alt6_Rcd4lt2003539_  
n_d_I_Alt6_Rcd4lt2004044_  n_d_I_Alt6_Rcd4lt2004549_  n_d_I_Alt6_Rcd4lt2005054_  n_d_I_Alt6_Rcd4lt2005559_   n_d_I_Alt6_Rcd4lt2006064_  
n_d_I_Alt6_Rcd4lt2006569_  n_d_I_Alt6_Rcd4lt2007074_  n_d_I_Alt6_Rcd4lt2007579_  n_d_I_Alt6_Rcd4lt2008084_  
n_d_I_Alt6_Rcd4lt2001519m  n_d_I_Alt6_Rcd4lt2002024m  n_d_I_Alt6_Rcd4lt2002529m  n_d_I_Alt6_Rcd4lt2003034m  n_d_I_Alt6_Rcd4lt2003539m  
n_d_I_Alt6_Rcd4lt2004044m  n_d_I_Alt6_Rcd4lt2004549m  n_d_I_Alt6_Rcd4lt2005054m  n_d_I_Alt6_Rcd4lt2005559m   n_d_I_Alt6_Rcd4lt2006064m  
n_d_I_Alt6_Rcd4lt2006569m  n_d_I_Alt6_Rcd4lt2007074m  n_d_I_Alt6_Rcd4lt2007579m  n_d_I_Alt6_Rcd4lt2008084m  
n_d_I_Alt6_Rcd4lt2001519w  n_d_I_Alt6_Rcd4lt2002024w  n_d_I_Alt6_Rcd4lt2002529w  n_d_I_Alt6_Rcd4lt2003034w  n_d_I_Alt6_Rcd4lt2003539w  
n_d_I_Alt6_Rcd4lt2004044w  n_d_I_Alt6_Rcd4lt2004549w  n_d_I_Alt6_Rcd4lt2005054w  n_d_I_Alt6_Rcd4lt2005559w   n_d_I_Alt6_Rcd4lt2006064w  
n_d_I_Alt6_Rcd4lt2006569w  n_d_I_Alt6_Rcd4lt2007074w  n_d_I_Alt6_Rcd4lt2007579w  n_d_I_Alt6_Rcd4lt2008084w  

n_d_I_Alt6_Rcd4gt200_m	   n_d_I_Alt6_Rcd4gt200_w  
n_d_I_Alt6_Rcd4lt2001519_  n_d_I_Alt6_Rcd4lt2002024_  n_d_I_Alt6_Rcd4lt2002529_  n_d_I_Alt6_Rcd4lt2003034_  n_d_I_Alt6_Rcd4lt2003539_  
n_d_I_Alt6_Rcd4lt2004044_  n_d_I_Alt6_Rcd4lt2004549_  n_d_I_Alt6_Rcd4lt2005054_  n_d_I_Alt6_Rcd4lt2005559_   n_d_I_Alt6_Rcd4lt2006064_  
n_d_I_Alt6_Rcd4lt2006569_  n_d_I_Alt6_Rcd4lt2007074_  n_d_I_Alt6_Rcd4lt2007579_  n_d_I_Alt6_Rcd4lt2008084_  
n_d_I_Alt6_Rcd4gt2001519m  n_d_I_Alt6_Rcd4gt2002024m  n_d_I_Alt6_Rcd4gt2002529m  n_d_I_Alt6_Rcd4gt2003034m  n_d_I_Alt6_Rcd4gt2003539m  
n_d_I_Alt6_Rcd4gt2004044m  n_d_I_Alt6_Rcd4gt2004549m  n_d_I_Alt6_Rcd4gt2005054m  n_d_I_Alt6_Rcd4gt2005559m   n_d_I_Alt6_Rcd4gt2006064m  
n_d_I_Alt6_Rcd4gt2006569m  n_d_I_Alt6_Rcd4gt2007074m  n_d_I_Alt6_Rcd4gt2007579m  n_d_I_Alt6_Rcd4gt2008084m  
n_d_I_Alt6_Rcd4gt2001519w  n_d_I_Alt6_Rcd4gt2002024w  n_d_I_Alt6_Rcd4gt2002529w  n_d_I_Alt6_Rcd4gt2003034w  n_d_I_Alt6_Rcd4gt2003539w  
n_d_I_Alt6_Rcd4gt2004044w  n_d_I_Alt6_Rcd4gt2004549w  n_d_I_Alt6_Rcd4gt2005054w  n_d_I_Alt6_Rcd4gt2005559w   n_d_I_Alt6_Rcd4gt2006064w  
n_d_I_Alt6_Rcd4gt2006569w  n_d_I_Alt6_Rcd4gt2007074w  n_d_I_Alt6_Rcd4gt2007579w  n_d_I_Alt6_Rcd4gt2008084w  

n_dead_A_vl1000_m  n_dead_A_vl1000_w  
n_dead_A_vl10001519_  n_dead_A_vl10002024_  n_dead_A_vl10002529_  n_dead_A_vl10003034_  n_dead_A_vl10003539_  
n_dead_A_vl10004044_  n_dead_A_vl10004549_  n_dead_A_vl10005054_  n_dead_A_vl10005559_  n_dead_A_vl10006064_  
n_dead_A_vl10006569_  n_dead_A_vl10007074_  n_dead_A_vl10007579_   n_dead_A_vl10008084_  
n_dead_A_vl10001519m  n_dead_A_vl10002024m  n_dead_A_vl10002529m  n_dead_A_vl10003034m  n_dead_A_vl10003539m  
n_dead_A_vl10004044m  n_dead_A_vl10004549m  n_dead_A_vl10005054m  n_dead_A_vl10005559m  n_dead_A_vl10006064m  
n_dead_A_vl10006569m  n_dead_A_vl10007074m  n_dead_A_vl10007579m   n_dead_A_vl10008084m  
n_dead_A_vl10001519w  n_dead_A_vl10002024w  n_dead_A_vl10002529w  n_dead_A_vl10003034w  n_dead_A_vl10003539w  
n_dead_A_vl10004044w  n_dead_A_vl10004549w  n_dead_A_vl10005054w  n_dead_A_vl10005559w  n_dead_A_vl10006064w  
n_dead_A_vl10006569w  n_dead_A_vl10007074w  n_dead_A_vl10007579w   n_dead_A_vl10008084w  

n_dead_A_vg1000_m  n_dead_A_vg1000_w  
n_dead_A_vg10001519_  n_dead_A_vg10002024_  n_dead_A_vg10002529_  n_dead_A_vg10003034_  n_dead_A_vg10003539_  
n_dead_A_vg10004044_  n_dead_A_vg10004549_  n_dead_A_vg10005054_  n_dead_A_vg10005559_  n_dead_A_vg10006064_  
n_dead_A_vg10006569_  n_dead_A_vg10007074_  n_dead_A_vg10007579_   n_dead_A_vg10008084_  
n_dead_A_vg10001519m  n_dead_A_vg10002024m  n_dead_A_vg10002529m  n_dead_A_vg10003034m  n_dead_A_vg10003539m  
n_dead_A_vg10004044m  n_dead_A_vg10004549m  n_dead_A_vg10005054m  n_dead_A_vg10005559m  n_dead_A_vg10006064m  
n_dead_A_vg10006569m  n_dead_A_vg10007074m  n_dead_A_vg10007579m   n_dead_A_vg10008084m  
n_dead_A_vg10001519w  n_dead_A_vg10002024w  n_dead_A_vg10002529w  n_dead_A_vg10003034w  n_dead_A_vg10003539w  
n_dead_A_vg10004044w  n_dead_A_vg10004549w  n_dead_A_vg10005054w  n_dead_A_vg10005559w  n_dead_A_vg10006064w  
n_dead_A_vg10006569w  n_dead_A_vg10007074w  n_dead_A_vg10007579w   n_dead_A_vg10008084w  

n_dead_Alt6_vl1000_m  n_dead_Alt6_vl1000_w  
n_dead_Alt6_vl10001519_  n_dead_Alt6_vl10002024_  n_dead_Alt6_vl10002529_  n_dead_Alt6_vl10003034_  n_dead_Alt6_vl10003539_  
n_dead_Alt6_vl10004044_  n_dead_Alt6_vl10004549_  n_dead_Alt6_vl10005054_  n_dead_Alt6_vl10005559_  n_dead_Alt6_vl10006064_  
n_dead_Alt6_vl10006569_  n_dead_Alt6_vl10007074_  n_dead_Alt6_vl10007579_   n_dead_Alt6_vl10008084_  
n_dead_Alt6_vl10001519m  n_dead_Alt6_vl10002024m  n_dead_Alt6_vl10002529m  n_dead_Alt6_vl10003034m  n_dead_Alt6_vl10003539m  
n_dead_Alt6_vl10004044m  n_dead_Alt6_vl10004549m  n_dead_Alt6_vl10005054m  n_dead_Alt6_vl10005559m  n_dead_Alt6_vl10006064m  
n_dead_Alt6_vl10006569m  n_dead_Alt6_vl10007074m  n_dead_Alt6_vl10007579m   n_dead_Alt6_vl10008084m  
n_dead_Alt6_vl10001519w  n_dead_Alt6_vl10002024w  n_dead_Alt6_vl10002529w  n_dead_Alt6_vl10003034w  n_dead_Alt6_vl10003539w  
n_dead_Alt6_vl10004044w  n_dead_Alt6_vl10004549w  n_dead_Alt6_vl10005054w  n_dead_Alt6_vl10005559w  n_dead_Alt6_vl10006064w  
n_dead_Alt6_vl10006569w  n_dead_Alt6_vl10007074w  n_dead_Alt6_vl10007579w   n_dead_Alt6_vl10008084w  

n_dead_Alt6_vg1000_m  n_dead_Alt6_vg1000_w  
n_dead_Alt6_vg10001519_  n_dead_Alt6_vg10002024_  n_dead_Alt6_vg10002529_  n_dead_Alt6_vg10003034_  n_dead_Alt6_vg10003539_  
n_dead_Alt6_vg10004044_  n_dead_Alt6_vg10004549_  n_dead_Alt6_vg10005054_  n_dead_Alt6_vg10005559_  n_dead_Alt6_vg10006064_  
n_dead_Alt6_vg10006569_  n_dead_Alt6_vg10007074_  n_dead_Alt6_vg10007579_   n_dead_Alt6_vg10008084_  
n_dead_Alt6_vg10001519m  n_dead_Alt6_vg10002024m  n_dead_Alt6_vg10002529m  n_dead_Alt6_vg10003034m  n_dead_Alt6_vg10003539m  
n_dead_Alt6_vg10004044m  n_dead_Alt6_vg10004549m  n_dead_Alt6_vg10005054m  n_dead_Alt6_vg10005559m  n_dead_Alt6_vg10006064m  
n_dead_Alt6_vg10006569m  n_dead_Alt6_vg10007074m  n_dead_Alt6_vg10007579m   n_dead_Alt6_vg10008084m  
n_dead_Alt6_vg10001519w  n_dead_Alt6_vg10002024w  n_dead_Alt6_vg10002529w  n_dead_Alt6_vg10003034w  n_dead_Alt6_vg10003539w  
n_dead_Alt6_vg10004044w  n_dead_Alt6_vg10004549w  n_dead_Alt6_vg10005054w  n_dead_Alt6_vg10005559w  n_dead_Alt6_vg10006064w  
n_dead_Alt6_vg10006569w  n_dead_Alt6_vg10007074w  n_dead_Alt6_vg10007579w   n_dead_Alt6_vg10008084w  

n_dead_Agt6_vl1000_m  n_dead_Agt6_vl1000_w  
n_dead_Agt6_vl10001519_  n_dead_Agt6_vl10002024_  n_dead_Agt6_vl10002529_  n_dead_Agt6_vl10003034_  n_dead_Agt6_vl10003539_  
n_dead_Agt6_vl10004044_  n_dead_Agt6_vl10004549_  n_dead_Agt6_vl10005054_  n_dead_Agt6_vl10005559_  n_dead_Agt6_vl10006064_  
n_dead_Agt6_vl10006569_  n_dead_Agt6_vl10007074_  n_dead_Agt6_vl10007579_   n_dead_Agt6_vl10008084_  

n_dead_Agt6_vl10001519m  n_dead_Agt6_vl10002024m  n_dead_Agt6_vl10002529m  n_dead_Agt6_vl10003034m  n_dead_Agt6_vl10003539m  
n_dead_Agt6_vl10004044m  n_dead_Agt6_vl10004549m  n_dead_Agt6_vl10005054m  n_dead_Agt6_vl10005559m  n_dead_Agt6_vl10006064m  
n_dead_Agt6_vl10006569m  n_dead_Agt6_vl10007074m  n_dead_Agt6_vl10007579m   n_dead_Agt6_vl10008084m  
n_dead_Agt6_vl10001519w  n_dead_Agt6_vl10002024w  n_dead_Agt6_vl10002529w  n_dead_Agt6_vl10003034w  n_dead_Agt6_vl10003539w  
n_dead_Agt6_vl10004044w  n_dead_Agt6_vl10004549w  n_dead_Agt6_vl10005054w  n_dead_Agt6_vl10005559w  n_dead_Agt6_vl10006064w  
n_dead_Agt6_vl10006569w  n_dead_Agt6_vl10007074w  n_dead_Agt6_vl10007579w   n_dead_Agt6_vl10008084w  

n_dead_Agt6_vg1000_m  n_dead_Agt6_vg1000_w  
n_dead_Agt6_vg10001519_  n_dead_Agt6_vg10002024_  n_dead_Agt6_vg10002529_  n_dead_Agt6_vg10003034_  n_dead_Agt6_vg10003539_  
n_dead_Agt6_vg10004044_  n_dead_Agt6_vg10004549_  n_dead_Agt6_vg10005054_  n_dead_Agt6_vg10005559_  n_dead_Agt6_vg10006064_  
n_dead_Agt6_vg10006569_  n_dead_Agt6_vg10007074_  n_dead_Agt6_vg10007579_   n_dead_Agt6_vg10008084_  

n_dead_Agt6_vg10001519m  n_dead_Agt6_vg10002024m  n_dead_Agt6_vg10002529m  n_dead_Agt6_vg10003034m  n_dead_Agt6_vg10003539m  
n_dead_Agt6_vg10004044m  n_dead_Agt6_vg10004549m  n_dead_Agt6_vg10005054m  n_dead_Agt6_vg10005559m  n_dead_Agt6_vg10006064m  
n_dead_Agt6_vg10006569m  n_dead_Agt6_vg10007074m  n_dead_Agt6_vg10007579m   n_dead_Agt6_vg10008084m  
n_dead_Agt6_vg10001519w  n_dead_Agt6_vg10002024w  n_dead_Agt6_vg10002529w  n_dead_Agt6_vg10003034w  n_dead_Agt6_vg10003539w  
n_dead_Agt6_vg10004044w  n_dead_Agt6_vg10004549w  n_dead_Agt6_vg10005054w  n_dead_Agt6_vg10005559w  n_dead_Agt6_vg10006064w  
n_dead_Agt6_vg10006569w  n_dead_Agt6_vg10007074w  n_dead_Agt6_vg10007579w   n_dead_Agt6_vg10008084w  

n_dead_int_lost_m  n_dead_int_lost_w  
n_dead_int_lost1519_  n_dead_int_lost2024_  n_dead_int_lost2529_  n_dead_int_lost3034_  n_dead_int_lost3539_  
n_dead_int_lost4044_  n_dead_int_lost4549_  n_dead_int_lost5054_  n_dead_int_lost5559_  n_dead_int_lost6064_  
n_dead_int_lost6569_  n_dead_int_lost7074_  n_dead_int_lost7579_  n_dead_int_lost8084_  

n_dead_int_lost1519m  n_dead_int_lost2024m  n_dead_int_lost2529m  n_dead_int_lost3034m  n_dead_int_lost3539m  
n_dead_int_lost4044m  n_dead_int_lost4549m  n_dead_int_lost5054m  n_dead_int_lost5559m  n_dead_int_lost6064m  
n_dead_int_lost6569m  n_dead_int_lost7074m  n_dead_int_lost7579m  n_dead_int_lost8084m  
n_dead_int_lost1519w  n_dead_int_lost2024w  n_dead_int_lost2529w  n_dead_int_lost3034w  n_dead_int_lost3539w  
n_dead_int_lost4044w  n_dead_int_lost4549w  n_dead_int_lost5054w  n_dead_int_lost5559w  n_dead_int_lost6064w  
n_dead_int_lost6569w  n_dead_int_lost7074w  n_dead_int_lost7579w  n_dead_int_lost8084w  

n_dead_1stint_lost_m  n_dead_1stint_lost_w  
n_dead_1stint_lost1519_  n_dead_1stint_lost2024_  n_dead_1stint_lost2529_  n_dead_1stint_lost3034_  n_dead_1stint_lost3539_  
n_dead_1stint_lost4044_  n_dead_1stint_lost4549_  n_dead_1stint_lost5054_  n_dead_1stint_lost5559_  n_dead_1stint_lost6064_  
n_dead_1stint_lost6569_  n_dead_1stint_lost7074_  n_dead_1stint_lost7579_  n_dead_1stint_lost8084_  

n_dead_1stint_lost1519m  n_dead_1stint_lost2024m  n_dead_1stint_lost2529m  n_dead_1stint_lost3034m  n_dead_1stint_lost3539m  
n_dead_1stint_lost4044m  n_dead_1stint_lost4549m  n_dead_1stint_lost5054m  n_dead_1stint_lost5559m  n_dead_1stint_lost6064m  
n_dead_1stint_lost6569m  n_dead_1stint_lost7074m  n_dead_1stint_lost7579m  n_dead_1stint_lost8084m  
n_dead_1stint_lost1519w  n_dead_1stint_lost2024w  n_dead_1stint_lost2529w  n_dead_1stint_lost3034w  n_dead_1stint_lost3539w  
n_dead_1stint_lost4044w  n_dead_1stint_lost4549w  n_dead_1stint_lost5054w  n_dead_1stint_lost5559w  n_dead_1stint_lost6064w  
n_dead_1stint_lost6569w  n_dead_1stint_lost7074w  n_dead_1stint_lost7579w  n_dead_1stint_lost8084w  

n_dead_subintlt6_lost_m  n_dead_subintlt6_lost_w  
n_dead_subintlt6_lost1519_  n_dead_subintlt6_lost2024_  n_dead_subintlt6_lost2529_  n_dead_subintlt6_lost3034_  n_dead_subintlt6_lost3539_  
n_dead_subintlt6_lost4044_  n_dead_subintlt6_lost4549_  n_dead_subintlt6_lost5054_  n_dead_subintlt6_lost5559_  n_dead_subintlt6_lost6064_  
n_dead_subintlt6_lost6569_  n_dead_subintlt6_lost7074_  n_dead_subintlt6_lost7579_  n_dead_subintlt6_lost8084_  

n_dead_subintlt6_lost1519m  n_dead_subintlt6_lost2024m  n_dead_subintlt6_lost2529m  n_dead_subintlt6_lost3034m  n_dead_subintlt6_lost3539m  
n_dead_subintlt6_lost4044m  n_dead_subintlt6_lost4549m  n_dead_subintlt6_lost5054m  n_dead_subintlt6_lost5559m  n_dead_subintlt6_lost6064m  
n_dead_subintlt6_lost6569m  n_dead_subintlt6_lost7074m  n_dead_subintlt6_lost7579m  n_dead_subintlt6_lost8084m  
n_dead_subintlt6_lost1519w  n_dead_subintlt6_lost2024w  n_dead_subintlt6_lost2529w  n_dead_subintlt6_lost3034w  n_dead_subintlt6_lost3539w  
n_dead_subintlt6_lost4044w  n_dead_subintlt6_lost4549w  n_dead_subintlt6_lost5054w  n_dead_subintlt6_lost5559w  n_dead_subintlt6_lost6064w  
n_dead_subintlt6_lost6569w  n_dead_subintlt6_lost7074w  n_dead_subintlt6_lost7579w  n_dead_subintlt6_lost8084w  

n_dead_subintgt6_lost_m  n_dead_subintgt6_lost_w  
n_dead_subintgt6_lost1519_  n_dead_subintgt6_lost2024_  n_dead_subintgt6_lost2529_  n_dead_subintgt6_lost3034_  n_dead_subintgt6_lost3539_  
n_dead_subintgt6_lost4044_  n_dead_subintgt6_lost4549_  n_dead_subintgt6_lost5054_  n_dead_subintgt6_lost5559_  n_dead_subintgt6_lost6064_  
n_dead_subintgt6_lost6569_  n_dead_subintgt6_lost7074_  n_dead_subintgt6_lost7579_  n_dead_subintgt6_lost8084_  

n_dead_subintgt6_lost1519m  n_dead_subintgt6_lost2024m  n_dead_subintgt6_lost2529m  n_dead_subintgt6_lost3034m  n_dead_subintgt6_lost3539m  
n_dead_subintgt6_lost4044m  n_dead_subintgt6_lost4549m  n_dead_subintgt6_lost5054m  n_dead_subintgt6_lost5559m  n_dead_subintgt6_lost6064m  
n_dead_subintgt6_lost6569m  n_dead_subintgt6_lost7074m  n_dead_subintgt6_lost7579m  n_dead_subintgt6_lost8084m  
n_dead_subintgt6_lost1519w  n_dead_subintgt6_lost2024w  n_dead_subintgt6_lost2529w  n_dead_subintgt6_lost3034w  n_dead_subintgt6_lost3539w  
n_dead_subintgt6_lost4044w  n_dead_subintgt6_lost4549w  n_dead_subintgt6_lost5054w  n_dead_subintgt6_lost5559w  n_dead_subintgt6_lost6064w  
n_dead_subintgt6_lost6569w  n_dead_subintgt6_lost7074w  n_dead_subintgt6_lost7579w  n_dead_subintgt6_lost8084w  

n_dead_A_cd4lt200_m  n_dead_A_cd4lt200_w  
n_dead_A_cd4lt2001519_  n_dead_A_cd4lt2002024_  n_dead_A_cd4lt2002529_  n_dead_A_cd4lt2003034_  n_dead_A_cd4lt2003539_  
n_dead_A_cd4lt2004044_  n_dead_A_cd4lt2004549_  n_dead_A_cd4lt2005054_  n_dead_A_cd4lt2005559_  n_dead_A_cd4lt2006064_  
n_dead_A_cd4lt2006569_  n_dead_A_cd4lt2007074_  n_dead_A_cd4lt2007579_  n_dead_A_cd4lt2008084_  
n_dead_A_cd4lt2001519m  n_dead_A_cd4lt2002024m  n_dead_A_cd4lt2002529m  n_dead_A_cd4lt2003034m  n_dead_A_cd4lt2003539m  
n_dead_A_cd4lt2004044m  n_dead_A_cd4lt2004549m  n_dead_A_cd4lt2005054m  n_dead_A_cd4lt2005559m  n_dead_A_cd4lt2006064m  
n_dead_A_cd4lt2006569m  n_dead_A_cd4lt2007074m  n_dead_A_cd4lt2007579m  n_dead_A_cd4lt2008084m  
n_dead_A_cd4lt2001519w  n_dead_A_cd4lt2002024w  n_dead_A_cd4lt2002529w  n_dead_A_cd4lt2003034w  n_dead_A_cd4lt2003539w  
n_dead_A_cd4lt2004044w  n_dead_A_cd4lt2004549w  n_dead_A_cd4lt2005054w  n_dead_A_cd4lt2005559w  n_dead_A_cd4lt2006064w  
n_dead_A_cd4lt2006569w  n_dead_A_cd4lt2007074w  n_dead_A_cd4lt2007579w  n_dead_A_cd4lt2008084w  

n_dead_A_cd4gt200_m  n_dead_A_cd4gt200_w  
n_dead_A_cd4gt2001519_  n_dead_A_cd4gt2002024_  n_dead_A_cd4gt2002529_  n_dead_A_cd4gt2003034_  n_dead_A_cd4gt2003539_  
n_dead_A_cd4gt2004044_  n_dead_A_cd4gt2004549_  n_dead_A_cd4gt2005054_  n_dead_A_cd4gt2005559_  n_dead_A_cd4gt2006064_  
n_dead_A_cd4gt2006569_  n_dead_A_cd4gt2007074_  n_dead_A_cd4gt2007579_  n_dead_A_cd4gt2008084_  

n_dead_A_cd4gt2001519m  n_dead_A_cd4gt2002024m  n_dead_A_cd4gt2002529m  n_dead_A_cd4gt2003034m  n_dead_A_cd4gt2003539m  
n_dead_A_cd4gt2004044m  n_dead_A_cd4gt2004549m  n_dead_A_cd4gt2005054m  n_dead_A_cd4gt2005559m  n_dead_A_cd4gt2006064m  
n_dead_A_cd4gt2006569m  n_dead_A_cd4gt2007074m  n_dead_A_cd4gt2007579m  n_dead_A_cd4gt2008084m  
n_dead_A_cd4gt2001519w  n_dead_A_cd4gt2002024w  n_dead_A_cd4gt2002529w  n_dead_A_cd4gt2003034w  n_dead_A_cd4gt2003539w  
n_dead_A_cd4gt2004044w  n_dead_A_cd4gt2004549w  n_dead_A_cd4gt2005054w  n_dead_A_cd4gt2005559w  n_dead_A_cd4gt2006064w  
n_dead_A_cd4gt2006569w  n_dead_A_cd4gt2007074w  n_dead_A_cd4gt2007579w  n_dead_A_cd4gt2008084w  

n_dead_Alt6_cd4lt200_m  n_dead_Alt6_cd4lt200_w  
n_dead_Alt6_cd4lt2001519_  n_dead_Alt6_cd4lt2002024_  n_dead_Alt6_cd4lt2002529_  n_dead_Alt6_cd4lt2003034_  n_dead_Alt6_cd4lt2003539_  
n_dead_Alt6_cd4lt2004044_  n_dead_Alt6_cd4lt2004549_  n_dead_Alt6_cd4lt2005054_  n_dead_Alt6_cd4lt2005559_  n_dead_Alt6_cd4lt2006064_  
n_dead_Alt6_cd4lt2006569_  n_dead_Alt6_cd4lt2007074_  n_dead_Alt6_cd4lt2007579_  n_dead_Alt6_cd4lt2008084_  
n_dead_Alt6_cd4lt2001519m  n_dead_Alt6_cd4lt2002024m  n_dead_Alt6_cd4lt2002529m  n_dead_Alt6_cd4lt2003034m  n_dead_Alt6_cd4lt2003539m  
n_dead_Alt6_cd4lt2004044m  n_dead_Alt6_cd4lt2004549m  n_dead_Alt6_cd4lt2005054m  n_dead_Alt6_cd4lt2005559m  n_dead_Alt6_cd4lt2006064m  
n_dead_Alt6_cd4lt2006569m  n_dead_Alt6_cd4lt2007074m  n_dead_Alt6_cd4lt2007579m  n_dead_Alt6_cd4lt2008084m  
n_dead_Alt6_cd4lt2001519w  n_dead_Alt6_cd4lt2002024w  n_dead_Alt6_cd4lt2002529w  n_dead_Alt6_cd4lt2003034w  n_dead_Alt6_cd4lt2003539w  
n_dead_Alt6_cd4lt2004044w  n_dead_Alt6_cd4lt2004549w  n_dead_Alt6_cd4lt2005054w  n_dead_Alt6_cd4lt2005559w  n_dead_Alt6_cd4lt2006064w  
n_dead_Alt6_cd4lt2006569w  n_dead_Alt6_cd4lt2007074w  n_dead_Alt6_cd4lt2007579w  n_dead_Alt6_cd4lt2008084w  

n_dead_Alt6_cd4gt200_m  n_dead_Alt6_cd4gt200_w  
n_dead_Alt6_cd4gt2001519_  n_dead_Alt6_cd4gt2002024_  n_dead_Alt6_cd4gt2002529_  n_dead_Alt6_cd4gt2003034_  n_dead_Alt6_cd4gt2003539_  
n_dead_Alt6_cd4gt2004044_  n_dead_Alt6_cd4gt2004549_  n_dead_Alt6_cd4gt2005054_  n_dead_Alt6_cd4gt2005559_  n_dead_Alt6_cd4gt2006064_  
n_dead_Alt6_cd4gt2006569_  n_dead_Alt6_cd4gt2007074_  n_dead_Alt6_cd4gt2007579_  n_dead_Alt6_cd4gt2008084_  

n_dead_Alt6_cd4gt2001519m  n_dead_Alt6_cd4gt2002024m  n_dead_Alt6_cd4gt2002529m  n_dead_Alt6_cd4gt2003034m  n_dead_Alt6_cd4gt2003539m  
n_dead_Alt6_cd4gt2004044m  n_dead_Alt6_cd4gt2004549m  n_dead_Alt6_cd4gt2005054m  n_dead_Alt6_cd4gt2005559m  n_dead_Alt6_cd4gt2006064m  
n_dead_Alt6_cd4gt2006569m  n_dead_Alt6_cd4gt2007074m  n_dead_Alt6_cd4gt2007579m  n_dead_Alt6_cd4gt2008084m  
n_dead_Alt6_cd4gt2001519w  n_dead_Alt6_cd4gt2002024w  n_dead_Alt6_cd4gt2002529w  n_dead_Alt6_cd4gt2003034w  n_dead_Alt6_cd4gt2003539w  
n_dead_Alt6_cd4gt2004044w  n_dead_Alt6_cd4gt2004549w  n_dead_Alt6_cd4gt2005054w  n_dead_Alt6_cd4gt2005559w  n_dead_Alt6_cd4gt2006064w  
n_dead_Alt6_cd4gt2006569w  n_dead_Alt6_cd4gt2007074w  n_dead_Alt6_cd4gt2007579w  n_dead_Alt6_cd4gt2008084w  

n_dead_Agt6_cd4lt200_m  n_dead_Agt6_cd4lt200_w  
n_dead_Agt6_cd4lt2001519_  n_dead_Agt6_cd4lt2002024_  n_dead_Agt6_cd4lt2002529_  n_dead_Agt6_cd4lt2003034_  n_dead_Agt6_cd4lt2003539_  
n_dead_Agt6_cd4lt2004044_  n_dead_Agt6_cd4lt2004549_  n_dead_Agt6_cd4lt2005054_  n_dead_Agt6_cd4lt2005559_  n_dead_Agt6_cd4lt2006064_  
n_dead_Agt6_cd4lt2006569_  n_dead_Agt6_cd4lt2007074_  n_dead_Agt6_cd4lt2007579_  n_dead_Agt6_cd4lt2008084_  

n_dead_Agt6_cd4lt2001519m  n_dead_Agt6_cd4lt2002024m  n_dead_Agt6_cd4lt2002529m  n_dead_Agt6_cd4lt2003034m  n_dead_Agt6_cd4lt2003539m  
n_dead_Agt6_cd4lt2004044m  n_dead_Agt6_cd4lt2004549m  n_dead_Agt6_cd4lt2005054m  n_dead_Agt6_cd4lt2005559m  n_dead_Agt6_cd4lt2006064m  
n_dead_Agt6_cd4lt2006569m  n_dead_Agt6_cd4lt2007074m  n_dead_Agt6_cd4lt2007579m  n_dead_Agt6_cd4lt2008084m  
n_dead_Agt6_cd4lt2001519w  n_dead_Agt6_cd4lt2002024w  n_dead_Agt6_cd4lt2002529w  n_dead_Agt6_cd4lt2003034w  n_dead_Agt6_cd4lt2003539w  
n_dead_Agt6_cd4lt2004044w  n_dead_Agt6_cd4lt2004549w  n_dead_Agt6_cd4lt2005054w  n_dead_Agt6_cd4lt2005559w  n_dead_Agt6_cd4lt2006064w  
n_dead_Agt6_cd4lt2006569w  n_dead_Agt6_cd4lt2007074w  n_dead_Agt6_cd4lt2007579w  n_dead_Agt6_cd4lt2008084w  

n_dead_Agt6_cd4gt200_m  n_dead_Agt6_cd4gt200_w  
n_dead_Agt6_cd4gt2001519_  n_dead_Agt6_cd4gt2002024_  n_dead_Agt6_cd4gt2002529_  n_dead_Agt6_cd4gt2003034_  n_dead_Agt6_cd4gt2003539_  
n_dead_Agt6_cd4gt2004044_  n_dead_Agt6_cd4gt2004549_  n_dead_Agt6_cd4gt2005054_  n_dead_Agt6_cd4gt2005559_  n_dead_Agt6_cd4gt2006064_  
n_dead_Agt6_cd4gt2006569_  n_dead_Agt6_cd4gt2007074_  n_dead_Agt6_cd4gt2007579_  n_dead_Agt6_cd4gt2008084_  
n_dead_Agt6_cd4gt2001519m  n_dead_Agt6_cd4gt2002024m  n_dead_Agt6_cd4gt2002529m  n_dead_Agt6_cd4gt2003034m  n_dead_Agt6_cd4gt2003539m  
n_dead_Agt6_cd4gt2004044m  n_dead_Agt6_cd4gt2004549m  n_dead_Agt6_cd4gt2005054m  n_dead_Agt6_cd4gt2005559m  n_dead_Agt6_cd4gt2006064m  
n_dead_Agt6_cd4gt2006569m  n_dead_Agt6_cd4gt2007074m  n_dead_Agt6_cd4gt2007579m  n_dead_Agt6_cd4gt2008084m  
n_dead_Agt6_cd4gt2001519w  n_dead_Agt6_cd4gt2002024w  n_dead_Agt6_cd4gt2002529w  n_dead_Agt6_cd4gt2003034w  n_dead_Agt6_cd4gt2003539w  
n_dead_Agt6_cd4gt2004044w  n_dead_Agt6_cd4gt2004549w  n_dead_Agt6_cd4gt2005054w  n_dead_Agt6_cd4gt2005559w  n_dead_Agt6_cd4gt2006064w  
n_dead_Agt6_cd4gt2006569w  n_dead_Agt6_cd4gt2007074w  n_dead_Agt6_cd4gt2007579w  n_dead_Agt6_cd4gt2008084w  

/*Transmissions*/

n_I_undiag 			n_I_diag_naive  	n_I_diag_startart  	n_I_onart		n_I_offart 		   n_I_onart_lt6m 	 n_I_onart_lt6m_nvs 
n_I_onart_gt6m_nvs	n_I_onart_gt6m_vs   n_I_offart_1stI 	n_I_offart_SI 	n_I_offart_SIlt6m  n_I_offart_SIgt6m 


n_I_undiag_m n_I_diag_naive_m n_I_diag_startart_m n_I_onart_m n_I_offart_m n_I_onart_lt6m_m n_I_onart_lt6m_nvs_m 
n_I_onart_gt6m_nvs_m n_I_onart_gt6m_vs_m n_I_offart_1stI_m n_I_offart_SI_m n_I_offart_SIlt6m_m n_I_offart_SIgt6m_m 
n_I_undiag_w n_I_diag_naive_w n_I_diag_startart_w n_I_onart_w n_I_offart_w n_I_onart_lt6m_w n_I_onart_lt6m_nvs_w 
n_I_onart_gt6m_nvs_w n_I_onart_gt6m_vs_w n_I_offart_1stI_w n_I_offart_SI_w n_I_offart_SIlt6m_w n_I_offart_SIgt6m_w 


n_I_undiag1519_ n_I_diag_naive1519_ n_I_diag_startart1519_ n_I_onart1519_ n_I_offart1519_ n_I_onart_lt6m1519_ 
n_I_onart_lt6m_nvs1519_ n_I_onart_gt6m_nvs1519_ n_I_onart_gt6m_vs1519_ n_I_offart_1stI1519_ n_I_offart_SI1519_ 
n_I_offart_SIlt6m1519_ n_I_offart_SIgt6m1519_ 
n_I_undiag2024_ n_I_diag_naive2024_ n_I_diag_startart2024_ n_I_onart2024_ n_I_offart2024_ n_I_onart_lt6m2024_ 
n_I_onart_lt6m_nvs2024_ n_I_onart_gt6m_nvs2024_ n_I_onart_gt6m_vs2024_ n_I_offart_1stI2024_ n_I_offart_SI2024_ 
n_I_offart_SIlt6m2024_ n_I_offart_SIgt6m2024_ 
n_I_undiag2529_ n_I_diag_naive2529_ n_I_diag_startart2529_ n_I_onart2529_ n_I_offart2529_ n_I_onart_lt6m2529_ 
n_I_onart_lt6m_nvs2529_ n_I_onart_gt6m_nvs2529_ n_I_onart_gt6m_vs2529_ n_I_offart_1stI2529_ n_I_offart_SI2529_ 
n_I_offart_SIlt6m2529_ n_I_offart_SIgt6m2529_ 
n_I_undiag3034_ n_I_diag_naive3034_ n_I_diag_startart3034_ n_I_onart3034_ n_I_offart3034_ n_I_onart_lt6m3034_ 
n_I_onart_lt6m_nvs3034_ n_I_onart_gt6m_nvs3034_ n_I_onart_gt6m_vs3034_ n_I_offart_1stI3034_ n_I_offart_SI3034_ 
n_I_offart_SIlt6m3034_ n_I_offart_SIgt6m3034_ 
n_I_undiag3539_ n_I_diag_naive3539_ n_I_diag_startart3539_ n_I_onart3539_ n_I_offart3539_ n_I_onart_lt6m3539_ 
n_I_onart_lt6m_nvs3539_ n_I_onart_gt6m_nvs3539_ n_I_onart_gt6m_vs3539_ n_I_offart_1stI3539_ n_I_offart_SI3539_ 
n_I_offart_SIlt6m3539_ n_I_offart_SIgt6m3539_ 
n_I_undiag4044_ n_I_diag_naive4044_ n_I_diag_startart4044_ n_I_onart4044_ n_I_offart4044_ n_I_onart_lt6m4044_ 
n_I_onart_lt6m_nvs4044_ n_I_onart_gt6m_nvs4044_ n_I_onart_gt6m_vs4044_ n_I_offart_1stI4044_ n_I_offart_SI4044_ 
n_I_offart_SIlt6m4044_ n_I_offart_SIgt6m4044_ 
n_I_undiag4549_ n_I_diag_naive4549_ n_I_diag_startart4549_ n_I_onart4549_ n_I_offart4549_ n_I_onart_lt6m4549_ 
n_I_onart_lt6m_nvs4549_ n_I_onart_gt6m_nvs4549_ n_I_onart_gt6m_vs4549_ n_I_offart_1stI4549_ n_I_offart_SI4549_ 
n_I_offart_SIlt6m4549_ n_I_offart_SIgt6m4549_ 
n_I_undiag5054_ n_I_diag_naive5054_ n_I_diag_startart5054_ n_I_onart5054_ n_I_offart5054_ n_I_onart_lt6m5054_ 
n_I_onart_lt6m_nvs5054_ n_I_onart_gt6m_nvs5054_ n_I_onart_gt6m_vs5054_ n_I_offart_1stI5054_ n_I_offart_SI5054_ 
n_I_offart_SIlt6m5054_ n_I_offart_SIgt6m5054_ 
n_I_undiag5559_ n_I_diag_naive5559_ n_I_diag_startart5559_ n_I_onart5559_ n_I_offart5559_ n_I_onart_lt6m5559_ 
n_I_onart_lt6m_nvs5559_ n_I_onart_gt6m_nvs5559_ n_I_onart_gt6m_vs5559_ n_I_offart_1stI5559_ n_I_offart_SI5559_ 
n_I_offart_SIlt6m5559_ n_I_offart_SIgt6m5559_ 
n_I_undiag6064_ n_I_diag_naive6064_ n_I_diag_startart6064_ n_I_onart6064_ n_I_offart6064_ n_I_onart_lt6m6064_ 
n_I_onart_lt6m_nvs6064_ n_I_onart_gt6m_nvs6064_ n_I_onart_gt6m_vs6064_ n_I_offart_1stI6064_ n_I_offart_SI6064_ 
n_I_offart_SIlt6m6064_ n_I_offart_SIgt6m6064_ 
n_I_undiag6569_ n_I_diag_naive6569_ n_I_diag_startart6569_ n_I_onart6569_ n_I_offart6569_ n_I_onart_lt6m6569_ 
n_I_onart_lt6m_nvs6569_ n_I_onart_gt6m_nvs6569_ n_I_onart_gt6m_vs6569_ n_I_offart_1stI6569_ n_I_offart_SI6569_ 
n_I_offart_SIlt6m6569_ n_I_offart_SIgt6m6569_ 
n_I_undiag7074_ n_I_diag_naive7074_ n_I_diag_startart7074_ n_I_onart7074_ n_I_offart7074_ n_I_onart_lt6m7074_ 
n_I_onart_lt6m_nvs7074_ n_I_onart_gt6m_nvs7074_ n_I_onart_gt6m_vs7074_ n_I_offart_1stI7074_ n_I_offart_SI7074_ 
n_I_offart_SIlt6m7074_ n_I_offart_SIgt6m7074_ 
n_I_undiag7579_ n_I_diag_naive7579_ n_I_diag_startart7579_ n_I_onart7579_ n_I_offart7579_ n_I_onart_lt6m7579_ 
n_I_onart_lt6m_nvs7579_ n_I_onart_gt6m_nvs7579_ n_I_onart_gt6m_vs7579_ n_I_offart_1stI7579_ n_I_offart_SI7579_ 
n_I_offart_SIlt6m7579_ n_I_offart_SIgt6m7579_ 
n_I_undiag8084_ n_I_diag_naive8084_ n_I_diag_startart8084_ n_I_onart8084_ n_I_offart8084_ n_I_onart_lt6m8084_ 
n_I_onart_lt6m_nvs8084_ n_I_onart_gt6m_nvs8084_ n_I_onart_gt6m_vs8084_ n_I_offart_1stI8084_ n_I_offart_SI8084_ 
n_I_offart_SIlt6m8084_ n_I_offart_SIgt6m8084_ 


n_I_undiag1519m n_I_diag_naive1519m n_I_diag_startart1519m n_I_onart1519m n_I_offart1519m n_I_onart_lt6m1519m 
n_I_onart_lt6m_nvs1519m n_I_onart_gt6m_nvs1519m n_I_onart_gt6m_vs1519m n_I_offart_1stI1519m n_I_offart_SI1519m 
n_I_offart_SIlt6m1519m n_I_offart_SIgt6m1519m 
n_I_undiag2024m n_I_diag_naive2024m n_I_diag_startart2024m n_I_onart2024m n_I_offart2024m n_I_onart_lt6m2024m 
n_I_onart_lt6m_nvs2024m n_I_onart_gt6m_nvs2024m n_I_onart_gt6m_vs2024m n_I_offart_1stI2024m n_I_offart_SI2024m 
n_I_offart_SIlt6m2024m n_I_offart_SIgt6m2024m 
n_I_undiag2529m n_I_diag_naive2529m n_I_diag_startart2529m n_I_onart2529m n_I_offart2529m n_I_onart_lt6m2529m 
n_I_onart_lt6m_nvs2529m n_I_onart_gt6m_nvs2529m n_I_onart_gt6m_vs2529m n_I_offart_1stI2529m n_I_offart_SI2529m 
n_I_offart_SIlt6m2529m n_I_offart_SIgt6m2529m 
n_I_undiag3034m n_I_diag_naive3034m n_I_diag_startart3034m n_I_onart3034m n_I_offart3034m n_I_onart_lt6m3034m 
n_I_onart_lt6m_nvs3034m n_I_onart_gt6m_nvs3034m n_I_onart_gt6m_vs3034m n_I_offart_1stI3034m n_I_offart_SI3034m 
n_I_offart_SIlt6m3034m n_I_offart_SIgt6m3034m 
n_I_undiag3539m n_I_diag_naive3539m n_I_diag_startart3539m n_I_onart3539m n_I_offart3539m n_I_onart_lt6m3539m 
n_I_onart_lt6m_nvs3539m n_I_onart_gt6m_nvs3539m n_I_onart_gt6m_vs3539m n_I_offart_1stI3539m n_I_offart_SI3539m 
n_I_offart_SIlt6m3539m n_I_offart_SIgt6m3539m 
n_I_undiag4044m n_I_diag_naive4044m n_I_diag_startart4044m n_I_onart4044m n_I_offart4044m n_I_onart_lt6m4044m 
n_I_onart_lt6m_nvs4044m n_I_onart_gt6m_nvs4044m n_I_onart_gt6m_vs4044m n_I_offart_1stI4044m n_I_offart_SI4044m 
n_I_offart_SIlt6m4044m n_I_offart_SIgt6m4044m 
n_I_undiag4549m n_I_diag_naive4549m n_I_diag_startart4549m n_I_onart4549m n_I_offart4549m n_I_onart_lt6m4549m 
n_I_onart_lt6m_nvs4549m n_I_onart_gt6m_nvs4549m n_I_onart_gt6m_vs4549m n_I_offart_1stI4549m n_I_offart_SI4549m 
n_I_offart_SIlt6m4549m n_I_offart_SIgt6m4549m 
n_I_undiag5054m n_I_diag_naive5054m n_I_diag_startart5054m n_I_onart5054m n_I_offart5054m n_I_onart_lt6m5054m 
n_I_onart_lt6m_nvs5054m n_I_onart_gt6m_nvs5054m n_I_onart_gt6m_vs5054m n_I_offart_1stI5054m n_I_offart_SI5054m 
n_I_offart_SIlt6m5054m n_I_offart_SIgt6m5054m 
n_I_undiag5559m n_I_diag_naive5559m n_I_diag_startart5559m n_I_onart5559m n_I_offart5559m n_I_onart_lt6m5559m 
n_I_onart_lt6m_nvs5559m n_I_onart_gt6m_nvs5559m n_I_onart_gt6m_vs5559m n_I_offart_1stI5559m n_I_offart_SI5559m 
n_I_offart_SIlt6m5559m n_I_offart_SIgt6m5559m 
n_I_undiag6064m n_I_diag_naive6064m n_I_diag_startart6064m n_I_onart6064m n_I_offart6064m n_I_onart_lt6m6064m 
n_I_onart_lt6m_nvs6064m n_I_onart_gt6m_nvs6064m n_I_onart_gt6m_vs6064m n_I_offart_1stI6064m n_I_offart_SI6064m 
n_I_offart_SIlt6m6064m n_I_offart_SIgt6m6064m 
n_I_undiag6569m n_I_diag_naive6569m n_I_diag_startart6569m n_I_onart6569m n_I_offart6569m n_I_onart_lt6m6569m 
n_I_onart_lt6m_nvs6569m n_I_onart_gt6m_nvs6569m n_I_onart_gt6m_vs6569m n_I_offart_1stI6569m n_I_offart_SI6569m 
n_I_offart_SIlt6m6569m n_I_offart_SIgt6m6569m 
n_I_undiag7074m n_I_diag_naive7074m n_I_diag_startart7074m n_I_onart7074m n_I_offart7074m n_I_onart_lt6m7074m 
n_I_onart_lt6m_nvs7074m n_I_onart_gt6m_nvs7074m n_I_onart_gt6m_vs7074m n_I_offart_1stI7074m n_I_offart_SI7074m 
n_I_offart_SIlt6m7074m n_I_offart_SIgt6m7074m 
n_I_undiag7579m n_I_diag_naive7579m n_I_diag_startart7579m n_I_onart7579m n_I_offart7579m n_I_onart_lt6m7579m 
n_I_onart_lt6m_nvs7579m n_I_onart_gt6m_nvs7579m n_I_onart_gt6m_vs7579m n_I_offart_1stI7579m n_I_offart_SI7579m 
n_I_offart_SIlt6m7579m n_I_offart_SIgt6m7579m 
n_I_undiag8084m n_I_diag_naive8084m n_I_diag_startart8084m n_I_onart8084m n_I_offart8084m n_I_onart_lt6m8084m 
n_I_onart_lt6m_nvs8084m n_I_onart_gt6m_nvs8084m n_I_onart_gt6m_vs8084m n_I_offart_1stI8084m n_I_offart_SI8084m 
n_I_offart_SIlt6m8084m n_I_offart_SIgt6m8084m 

n_I_undiag1519w n_I_diag_naive1519w n_I_diag_startart1519w n_I_onart1519w n_I_offart1519w n_I_onart_lt6m1519w 
n_I_onart_lt6m_nvs1519w n_I_onart_gt6m_nvs1519w n_I_onart_gt6m_vs1519w n_I_offart_1stI1519w n_I_offart_SI1519w 
n_I_offart_SIlt6m1519w n_I_offart_SIgt6m1519w 
n_I_undiag2024w n_I_diag_naive2024w n_I_diag_startart2024w n_I_onart2024w n_I_offart2024w n_I_onart_lt6m2024w 
n_I_onart_lt6m_nvs2024w n_I_onart_gt6m_nvs2024w n_I_onart_gt6m_vs2024w n_I_offart_1stI2024w n_I_offart_SI2024w 
n_I_offart_SIlt6m2024w n_I_offart_SIgt6m2024w 
n_I_undiag2529w n_I_diag_naive2529w n_I_diag_startart2529w n_I_onart2529w n_I_offart2529w n_I_onart_lt6m2529w 
n_I_onart_lt6m_nvs2529w n_I_onart_gt6m_nvs2529w n_I_onart_gt6m_vs2529w n_I_offart_1stI2529w n_I_offart_SI2529w 
n_I_offart_SIlt6m2529w n_I_offart_SIgt6m2529w 
n_I_undiag3034w n_I_diag_naive3034w n_I_diag_startart3034w n_I_onart3034w n_I_offart3034w n_I_onart_lt6m3034w 
n_I_onart_lt6m_nvs3034w n_I_onart_gt6m_nvs3034w n_I_onart_gt6m_vs3034w n_I_offart_1stI3034w n_I_offart_SI3034w 
n_I_offart_SIlt6m3034w n_I_offart_SIgt6m3034w 
n_I_undiag3539w n_I_diag_naive3539w n_I_diag_startart3539w n_I_onart3539w n_I_offart3539w n_I_onart_lt6m3539w 
n_I_onart_lt6m_nvs3539w n_I_onart_gt6m_nvs3539w n_I_onart_gt6m_vs3539w n_I_offart_1stI3539w n_I_offart_SI3539w 
n_I_offart_SIlt6m3539w n_I_offart_SIgt6m3539w 
n_I_undiag4044w n_I_diag_naive4044w n_I_diag_startart4044w n_I_onart4044w n_I_offart4044w n_I_onart_lt6m4044w 
n_I_onart_lt6m_nvs4044w n_I_onart_gt6m_nvs4044w n_I_onart_gt6m_vs4044w n_I_offart_1stI4044w n_I_offart_SI4044w 
n_I_offart_SIlt6m4044w n_I_offart_SIgt6m4044w 
n_I_undiag4549w n_I_diag_naive4549w n_I_diag_startart4549w n_I_onart4549w n_I_offart4549w n_I_onart_lt6m4549w 
n_I_onart_lt6m_nvs4549w n_I_onart_gt6m_nvs4549w n_I_onart_gt6m_vs4549w n_I_offart_1stI4549w n_I_offart_SI4549w 
n_I_offart_SIlt6m4549w n_I_offart_SIgt6m4549w 
n_I_undiag5054w n_I_diag_naive5054w n_I_diag_startart5054w n_I_onart5054w n_I_offart5054w n_I_onart_lt6m5054w 
n_I_onart_lt6m_nvs5054w n_I_onart_gt6m_nvs5054w n_I_onart_gt6m_vs5054w n_I_offart_1stI5054w n_I_offart_SI5054w 
n_I_offart_SIlt6m5054w n_I_offart_SIgt6m5054w 
n_I_undiag5559w n_I_diag_naive5559w n_I_diag_startart5559w n_I_onart5559w n_I_offart5559w n_I_onart_lt6m5559w 
n_I_onart_lt6m_nvs5559w n_I_onart_gt6m_nvs5559w n_I_onart_gt6m_vs5559w n_I_offart_1stI5559w n_I_offart_SI5559w 
n_I_offart_SIlt6m5559w n_I_offart_SIgt6m5559w 
n_I_undiag6064w n_I_diag_naive6064w n_I_diag_startart6064w n_I_onart6064w n_I_offart6064w n_I_onart_lt6m6064w 
n_I_onart_lt6m_nvs6064w n_I_onart_gt6m_nvs6064w n_I_onart_gt6m_vs6064w n_I_offart_1stI6064w n_I_offart_SI6064w 
n_I_offart_SIlt6m6064w n_I_offart_SIgt6m6064w 
n_I_undiag6569w n_I_diag_naive6569w n_I_diag_startart6569w n_I_onart6569w n_I_offart6569w n_I_onart_lt6m6569w 
n_I_onart_lt6m_nvs6569w n_I_onart_gt6m_nvs6569w n_I_onart_gt6m_vs6569w n_I_offart_1stI6569w n_I_offart_SI6569w 
n_I_offart_SIlt6m6569w n_I_offart_SIgt6m6569w 
n_I_undiag7074w n_I_diag_naive7074w n_I_diag_startart7074w n_I_onart7074w n_I_offart7074w n_I_onart_lt6m7074w 
n_I_onart_lt6m_nvs7074w n_I_onart_gt6m_nvs7074w n_I_onart_gt6m_vs7074w n_I_offart_1stI7074w n_I_offart_SI7074w 
n_I_offart_SIlt6m7074w n_I_offart_SIgt6m7074w 
n_I_undiag7579w n_I_diag_naive7579w n_I_diag_startart7579w n_I_onart7579w n_I_offart7579w n_I_onart_lt6m7579w 
n_I_onart_lt6m_nvs7579w n_I_onart_gt6m_nvs7579w n_I_onart_gt6m_vs7579w n_I_offart_1stI7579w n_I_offart_SI7579w 
n_I_offart_SIlt6m7579w n_I_offart_SIgt6m7579w 
n_I_undiag8084w n_I_diag_naive8084w n_I_diag_startart8084w n_I_onart8084w n_I_offart8084w n_I_onart_lt6m8084w 
n_I_onart_lt6m_nvs8084w n_I_onart_gt6m_nvs8084w n_I_onart_gt6m_vs8084w n_I_offart_1stI8084w n_I_offart_SI8084w 
n_I_offart_SIlt6m8084w n_I_offart_SIgt6m8084w

/*these are lept just to check the orignal outputs add up correctly;*/
s_I_undiag1519m s_I_diag_naive1519m s_I_diag_startart1519m s_I_onart1519m s_I_offart1519m s_I_onart_lt6m1519m 
s_I_onart_lt6m_nvs1519m s_I_onart_gt6m_nvs1519m s_I_onart_gt6m_vs1519m s_I_offart_1stI1519m s_I_offart_SI1519m 
s_I_offart_SIlt6m1519m s_I_offart_SIgt6m1519m 

s_I_undiag3539m s_I_diag_naive3539m s_I_diag_startart3539m s_I_onart3539m s_I_offart3539m s_I_onart_lt6m3539m 
s_I_onart_lt6m_nvs3539m s_I_onart_gt6m_nvs3539m s_I_onart_gt6m_vs3539m s_I_offart_1stI3539m s_I_offart_SI3539m 
s_I_offart_SIlt6m3539m s_I_offart_SIgt6m3539m 

;

run;

***Use this datastep to output just one run to check that the totals etc. add up;
data y1;
set y;

keep 
cald s_primary3539_ s_primary3539m s_primary3539w
s_I_undiag3539m s_I_diag_naive3539m s_I_diag_startart3539m s_I_onart3539m s_I_offart3539m s_I_onart_lt6m3539m 
s_I_onart_lt6m_nvs3539m s_I_onart_gt6m_nvs3539m s_I_onart_gt6m_vs3539m s_I_offart_1stI3539m s_I_offart_SI3539m 
s_I_offart_SIlt6m3539m s_I_offart_SIgt6m3539m 
;

if cald lt 2010 then delete;
if cald ge 2017 then delete;
run;

proc export 
data=y1      dbms=xlsx  
outfile="C:\Loveleen\Synthesis model\Modelling Consortium\Attribution of deaths\Transmissions\check35.xlsx"
replace;
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
%let nfit = 127  ;
%let year_end = 2045 ;
proc sort;by cald ;run;


  ***Macro var used to calculate means across each year and transpose to one line per run;
 
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

%var_d(n_primary1564_);%var_d(n_primary1564m);%var_d(n_primary1564w);
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

%var_d(n_dead_undiag); 		    %var_d(n_dead_diag_not_linked);   %var_d(n_dead_Alt6_artcd4lt200_); %var_d(n_dead_Alt6_artcd4gt200_);
%var_d(n_dead_I_Alt6_Rcd4lt200_); %var_d(n_dead_I_Alt6_Rcd4gt200_); 
%var_d(n_dead_A_vl1000_); 	    %var_d(n_dead_A_vg1000_);		  %var_d(n_dead_Alt6_vl1000_); 		%var_d(n_dead_Alt6_vg1000_);  
%var_d(n_dead_Agt6_vl1000_);	%var_d(n_dead_Agt6_vg1000_);	  %var_d(n_dead_int_lost);			%var_d(n_dead_1stint_lost); 
%var_d(n_dead_subintlt6_lost);  %var_d(n_dead_subintgt6_lost);    %var_d(n_dead_A_cd4lt200_);       %var_d(n_dead_A_cd4gt200_);  
%var_d(n_dead_Alt6_cd4lt200_);  %var_d(n_dead_Alt6_cd4gt200_); 	  %var_d(n_dead_Agt6_cd4lt200_);  	%var_d(n_dead_Agt6_cd4gt200_);  

%var_d(n_dead_undiag_m); 	 %var_d(n_dead_undiag_w);  
%var_d(n_dead_undiag1519_);  %var_d(n_dead_undiag2024_);  %var_d(n_dead_undiag2529_);  %var_d(n_dead_undiag3034_);  %var_d(n_dead_undiag3539_);  
%var_d(n_dead_undiag4044_);  %var_d(n_dead_undiag4549_);  %var_d(n_dead_undiag5054_);  %var_d(n_dead_undiag5559_);  %var_d(n_dead_undiag6064_);  
%var_d(n_dead_undiag6569_);  %var_d(n_dead_undiag7074_);  %var_d(n_dead_undiag7579_);  %var_d(n_dead_undiag8084_);  
%var_d(n_dead_undiag1519m);  %var_d(n_dead_undiag2024m);  %var_d(n_dead_undiag2529m);  %var_d(n_dead_undiag3034m);  %var_d(n_dead_undiag3539m);  
%var_d(n_dead_undiag4044m);  %var_d(n_dead_undiag4549m);  %var_d(n_dead_undiag5054m);  %var_d(n_dead_undiag5559m);  %var_d(n_dead_undiag6064m);  
%var_d(n_dead_undiag6569m);  %var_d(n_dead_undiag7074m);  %var_d(n_dead_undiag7579m);  %var_d(n_dead_undiag8084m);  
%var_d(n_dead_undiag1519w);  %var_d(n_dead_undiag2024w);  %var_d(n_dead_undiag2529w);  %var_d(n_dead_undiag3034w);  %var_d(n_dead_undiag3539w);  
%var_d(n_dead_undiag4044w);  %var_d(n_dead_undiag4549w);  %var_d(n_dead_undiag5054w);  %var_d(n_dead_undiag5559w);  %var_d(n_dead_undiag6064w);  
%var_d(n_dead_undiag6569w);  %var_d(n_dead_undiag7074w);  %var_d(n_dead_undiag7579w);  %var_d(n_dead_undiag8084w);  

%var_d(n_dead_diag_not_linked_m);  	  %var_d(n_dead_diag_not_linked_w);  
%var_d(n_dead_diag_not_linked1519_);  %var_d(n_dead_diag_not_linked2024_);  %var_d(n_dead_diag_not_linked2529_);  %var_d(n_dead_diag_not_linked3034_);  %var_d(n_dead_diag_not_linked3539_);  
%var_d(n_dead_diag_not_linked4044_);  %var_d(n_dead_diag_not_linked4549_);  %var_d(n_dead_diag_not_linked5054_);  %var_d(n_dead_diag_not_linked5559_);  %var_d(n_dead_diag_not_linked6064_);  
%var_d(n_dead_diag_not_linked6569_);  %var_d(n_dead_diag_not_linked7074_);  %var_d(n_dead_diag_not_linked7579_);  %var_d(n_dead_diag_not_linked8084_);  
%var_d(n_dead_diag_not_linked1519m);  %var_d(n_dead_diag_not_linked2024m);  %var_d(n_dead_diag_not_linked2529m);  %var_d(n_dead_diag_not_linked3034m);  %var_d(n_dead_diag_not_linked3539m);  
%var_d(n_dead_diag_not_linked4044m);  %var_d(n_dead_diag_not_linked4549m);  %var_d(n_dead_diag_not_linked5054m);  %var_d(n_dead_diag_not_linked5559m);  %var_d(n_dead_diag_not_linked6064m);  
%var_d(n_dead_diag_not_linked6569m);  %var_d(n_dead_diag_not_linked7074m);  %var_d(n_dead_diag_not_linked7579m);  %var_d(n_dead_diag_not_linked8084m);  
%var_d(n_dead_diag_not_linked1519w);  %var_d(n_dead_diag_not_linked2024w);  %var_d(n_dead_diag_not_linked2529w);  %var_d(n_dead_diag_not_linked3034w);  %var_d(n_dead_diag_not_linked3539w);  
%var_d(n_dead_diag_not_linked4044w);  %var_d(n_dead_diag_not_linked4549w);  %var_d(n_dead_diag_not_linked5054w);  %var_d(n_dead_diag_not_linked5559w);  %var_d(n_dead_diag_not_linked6064w);  
%var_d(n_dead_diag_not_linked6569w);  %var_d(n_dead_diag_not_linked7074w);  %var_d(n_dead_diag_not_linked7579w);  %var_d(n_dead_diag_not_linked8084w);  

%var_d(n_dead_Alt6_artcd4lt200_m);     %var_d(n_dead_Alt6_artcd4lt200_w);  
%var_d(n_dead_Alt6_Acd4lt2001519_);  %var_d(n_dead_Alt6_Acd4lt2002024_);  %var_d(n_dead_Alt6_Acd4lt2002529_);  %var_d(n_dead_Alt6_Acd4lt2003034_);  %var_d(n_dead_Alt6_Acd4lt2003539_);  
%var_d(n_dead_Alt6_Acd4lt2004044_);  %var_d(n_dead_Alt6_Acd4lt2004549_);  %var_d(n_dead_Alt6_Acd4lt2005054_);  %var_d(n_dead_Alt6_Acd4lt2005559_);  %var_d(n_dead_Alt6_Acd4lt2006064_);  
%var_d(n_dead_Alt6_Acd4lt2006569_);  %var_d(n_dead_Alt6_Acd4lt2007074_);  %var_d(n_dead_Alt6_Acd4lt2007579_);  %var_d(n_dead_Alt6_Acd4lt2008084_);  
%var_d(n_dead_Alt6_Acd4lt2001519m);  %var_d(n_dead_Alt6_Acd4lt2002024m);  %var_d(n_dead_Alt6_Acd4lt2002529m);  %var_d(n_dead_Alt6_Acd4lt2003034m);  %var_d(n_dead_Alt6_Acd4lt2003539m);  
%var_d(n_dead_Alt6_Acd4lt2004044m);  %var_d(n_dead_Alt6_Acd4lt2004549m);  %var_d(n_dead_Alt6_Acd4lt2005054m);  %var_d(n_dead_Alt6_Acd4lt2005559m);  %var_d(n_dead_Alt6_Acd4lt2006064m);  
%var_d(n_dead_Alt6_Acd4lt2006569m);  %var_d(n_dead_Alt6_Acd4lt2007074m);  %var_d(n_dead_Alt6_Acd4lt2007579m);  %var_d(n_dead_Alt6_Acd4lt2008084m);  
%var_d(n_dead_Alt6_Acd4lt2001519w);  %var_d(n_dead_Alt6_Acd4lt2002024w);  %var_d(n_dead_Alt6_Acd4lt2002529w);  %var_d(n_dead_Alt6_Acd4lt2003034w);  %var_d(n_dead_Alt6_Acd4lt2003539w);  
%var_d(n_dead_Alt6_Acd4lt2004044w);  %var_d(n_dead_Alt6_Acd4lt2004549w);  %var_d(n_dead_Alt6_Acd4lt2005054w);  %var_d(n_dead_Alt6_Acd4lt2005559w);  %var_d(n_dead_Alt6_Acd4lt2006064w);  
%var_d(n_dead_Alt6_Acd4lt2006569w);  %var_d(n_dead_Alt6_Acd4lt2007074w);  %var_d(n_dead_Alt6_Acd4lt2007579w);  %var_d(n_dead_Alt6_Acd4lt2008084w);  

%var_d(n_dead_Alt6_artcd4gt200_m);     %var_d(n_dead_Alt6_artcd4gt200_w);  
%var_d(n_dead_Alt6_Acd4gt2001519_);  %var_d(n_dead_Alt6_Acd4gt2002024_);  %var_d(n_dead_Alt6_Acd4gt2002529_);  %var_d(n_dead_Alt6_Acd4gt2003034_);  %var_d(n_dead_Alt6_Acd4gt2003539_);  
%var_d(n_dead_Alt6_Acd4gt2004044_);  %var_d(n_dead_Alt6_Acd4gt2004549_);  %var_d(n_dead_Alt6_Acd4gt2005054_);  %var_d(n_dead_Alt6_Acd4gt2005559_);  %var_d(n_dead_Alt6_Acd4gt2006064_);  
%var_d(n_dead_Alt6_Acd4gt2006569_);  %var_d(n_dead_Alt6_Acd4gt2007074_);  %var_d(n_dead_Alt6_Acd4gt2007579_);  %var_d(n_dead_Alt6_Acd4gt2008084_);  
%var_d(n_dead_Alt6_Acd4gt2001519m);  %var_d(n_dead_Alt6_Acd4gt2002024m);  %var_d(n_dead_Alt6_Acd4gt2002529m);  %var_d(n_dead_Alt6_Acd4gt2003034m);  %var_d(n_dead_Alt6_Acd4gt2003539m);  
%var_d(n_dead_Alt6_Acd4gt2004044m);  %var_d(n_dead_Alt6_Acd4gt2004549m);  %var_d(n_dead_Alt6_Acd4gt2005054m);  %var_d(n_dead_Alt6_Acd4gt2005559m);  %var_d(n_dead_Alt6_Acd4gt2006064m);  
%var_d(n_dead_Alt6_Acd4gt2006569m);  %var_d(n_dead_Alt6_Acd4gt2007074m);  %var_d(n_dead_Alt6_Acd4gt2007579m);  %var_d(n_dead_Alt6_Acd4gt2008084m);  
%var_d(n_dead_Alt6_Acd4gt2001519w);  %var_d(n_dead_Alt6_Acd4gt2002024w);  %var_d(n_dead_Alt6_Acd4gt2002529w);  %var_d(n_dead_Alt6_Acd4gt2003034w);  %var_d(n_dead_Alt6_Acd4gt2003539w);  
%var_d(n_dead_Alt6_Acd4gt2004044w);  %var_d(n_dead_Alt6_Acd4gt2004549w);  %var_d(n_dead_Alt6_Acd4gt2005054w);  %var_d(n_dead_Alt6_Acd4gt2005559w);  %var_d(n_dead_Alt6_Acd4gt2006064w);  
%var_d(n_dead_Alt6_Acd4gt2006569w);  %var_d(n_dead_Alt6_Acd4gt2007074w);  %var_d(n_dead_Alt6_Acd4gt2007579w);  %var_d(n_dead_Alt6_Acd4gt2008084w);  

%var_d(n_dead_I_Alt6_Rcd4lt200_m);  %var_d(n_dead_I_Alt6_Rcd4lt200_w);  
%var_d(n_d_I_Alt6_Rcd4lt2001519_);  %var_d(n_d_I_Alt6_Rcd4lt2002024_);  %var_d(n_d_I_Alt6_Rcd4lt2002529_);  %var_d(n_d_I_Alt6_Rcd4lt2003034_);  %var_d(n_d_I_Alt6_Rcd4lt2003539_);  
%var_d(n_d_I_Alt6_Rcd4lt2004044_);  %var_d(n_d_I_Alt6_Rcd4lt2004549_);  %var_d(n_d_I_Alt6_Rcd4lt2005054_);  %var_d(n_d_I_Alt6_Rcd4lt2005559_);   %var_d(n_d_I_Alt6_Rcd4lt2006064_);  
%var_d(n_d_I_Alt6_Rcd4lt2006569_);  %var_d(n_d_I_Alt6_Rcd4lt2007074_);  %var_d(n_d_I_Alt6_Rcd4lt2007579_);  %var_d(n_d_I_Alt6_Rcd4lt2008084_);  
%var_d(n_d_I_Alt6_Rcd4lt2001519m);  %var_d(n_d_I_Alt6_Rcd4lt2002024m);  %var_d(n_d_I_Alt6_Rcd4lt2002529m);  %var_d(n_d_I_Alt6_Rcd4lt2003034m);  %var_d(n_d_I_Alt6_Rcd4lt2003539m);  
%var_d(n_d_I_Alt6_Rcd4lt2004044m);  %var_d(n_d_I_Alt6_Rcd4lt2004549m);  %var_d(n_d_I_Alt6_Rcd4lt2005054m);  %var_d(n_d_I_Alt6_Rcd4lt2005559m);   %var_d(n_d_I_Alt6_Rcd4lt2006064m);  
%var_d(n_d_I_Alt6_Rcd4lt2006569m);  %var_d(n_d_I_Alt6_Rcd4lt2007074m);  %var_d(n_d_I_Alt6_Rcd4lt2007579m);  %var_d(n_d_I_Alt6_Rcd4lt2008084m);  
%var_d(n_d_I_Alt6_Rcd4lt2001519w);  %var_d(n_d_I_Alt6_Rcd4lt2002024w);  %var_d(n_d_I_Alt6_Rcd4lt2002529w);  %var_d(n_d_I_Alt6_Rcd4lt2003034w);  %var_d(n_d_I_Alt6_Rcd4lt2003539w);  
%var_d(n_d_I_Alt6_Rcd4lt2004044w);  %var_d(n_d_I_Alt6_Rcd4lt2004549w);  %var_d(n_d_I_Alt6_Rcd4lt2005054w);  %var_d(n_d_I_Alt6_Rcd4lt2005559w);   %var_d(n_d_I_Alt6_Rcd4lt2006064w);  
%var_d(n_d_I_Alt6_Rcd4lt2006569w);  %var_d(n_d_I_Alt6_Rcd4lt2007074w);  %var_d(n_d_I_Alt6_Rcd4lt2007579w);  %var_d(n_d_I_Alt6_Rcd4lt2008084w);  

%var_d(n_dead_I_Alt6_Rcd4gt200_m);  %var_d(n_dead_I_Alt6_Rcd4gt200_w);  
%var_d(n_d_I_Alt6_Rcd4gt2001519_);  %var_d(n_d_I_Alt6_Rcd4gt2002024_);  %var_d(n_d_I_Alt6_Rcd4gt2002529_);  %var_d(n_d_I_Alt6_Rcd4gt2003034_);  %var_d(n_d_I_Alt6_Rcd4gt2003539_);  
%var_d(n_d_I_Alt6_Rcd4gt2004044_);  %var_d(n_d_I_Alt6_Rcd4gt2004549_);  %var_d(n_d_I_Alt6_Rcd4gt2005054_);  %var_d(n_d_I_Alt6_Rcd4gt2005559_);   %var_d(n_d_I_Alt6_Rcd4gt2006064_);  
%var_d(n_d_I_Alt6_Rcd4gt2006569_);  %var_d(n_d_I_Alt6_Rcd4gt2007074_);  %var_d(n_d_I_Alt6_Rcd4gt2007579_);  %var_d(n_d_I_Alt6_Rcd4gt2008084_);  
%var_d(n_d_I_Alt6_Rcd4gt2001519m);  %var_d(n_d_I_Alt6_Rcd4gt2002024m);  %var_d(n_d_I_Alt6_Rcd4gt2002529m);  %var_d(n_d_I_Alt6_Rcd4gt2003034m);  %var_d(n_d_I_Alt6_Rcd4gt2003539m);  
%var_d(n_d_I_Alt6_Rcd4gt2004044m);  %var_d(n_d_I_Alt6_Rcd4gt2004549m);  %var_d(n_d_I_Alt6_Rcd4gt2005054m);  %var_d(n_d_I_Alt6_Rcd4gt2005559m);   %var_d(n_d_I_Alt6_Rcd4gt2006064m);  
%var_d(n_d_I_Alt6_Rcd4gt2006569m);  %var_d(n_d_I_Alt6_Rcd4gt2007074m);  %var_d(n_d_I_Alt6_Rcd4gt2007579m);  %var_d(n_d_I_Alt6_Rcd4gt2008084m);  
%var_d(n_d_I_Alt6_Rcd4gt2001519w);  %var_d(n_d_I_Alt6_Rcd4gt2002024w);  %var_d(n_d_I_Alt6_Rcd4gt2002529w);  %var_d(n_d_I_Alt6_Rcd4gt2003034w);  %var_d(n_d_I_Alt6_Rcd4gt2003539w);  
%var_d(n_d_I_Alt6_Rcd4gt2004044w);  %var_d(n_d_I_Alt6_Rcd4gt2004549w);  %var_d(n_d_I_Alt6_Rcd4gt2005054w);  %var_d(n_d_I_Alt6_Rcd4gt2005559w);   %var_d(n_d_I_Alt6_Rcd4gt2006064w);  
%var_d(n_d_I_Alt6_Rcd4gt2006569w);  %var_d(n_d_I_Alt6_Rcd4gt2007074w);  %var_d(n_d_I_Alt6_Rcd4gt2007579w);  %var_d(n_d_I_Alt6_Rcd4gt2008084w);  

%var_d(n_dead_A_vl1000_m);     %var_d(n_dead_A_vl1000_w);  
%var_d(n_dead_A_vl10001519_);  %var_d(n_dead_A_vl10002024_);  %var_d(n_dead_A_vl10002529_);  %var_d(n_dead_A_vl10003034_);  %var_d(n_dead_A_vl10003539_);  
%var_d(n_dead_A_vl10004044_);  %var_d(n_dead_A_vl10004549_);  %var_d(n_dead_A_vl10005054_);  %var_d(n_dead_A_vl10005559_);  %var_d(n_dead_A_vl10006064_);  
%var_d(n_dead_A_vl10006569_);  %var_d(n_dead_A_vl10007074_);  %var_d(n_dead_A_vl10007579_);   %var_d(n_dead_A_vl10008084_);  
%var_d(n_dead_A_vl10001519m);  %var_d(n_dead_A_vl10002024m);  %var_d(n_dead_A_vl10002529m);  %var_d(n_dead_A_vl10003034m);  %var_d(n_dead_A_vl10003539m);  
%var_d(n_dead_A_vl10004044m);  %var_d(n_dead_A_vl10004549m);  %var_d(n_dead_A_vl10005054m);  %var_d(n_dead_A_vl10005559m);  %var_d(n_dead_A_vl10006064m);  
%var_d(n_dead_A_vl10006569m);  %var_d(n_dead_A_vl10007074m);  %var_d(n_dead_A_vl10007579m);   %var_d(n_dead_A_vl10008084m);  
%var_d(n_dead_A_vl10001519w);  %var_d(n_dead_A_vl10002024w);  %var_d(n_dead_A_vl10002529w);  %var_d(n_dead_A_vl10003034w);  %var_d(n_dead_A_vl10003539w);  
%var_d(n_dead_A_vl10004044w);  %var_d(n_dead_A_vl10004549w);  %var_d(n_dead_A_vl10005054w);  %var_d(n_dead_A_vl10005559w);  %var_d(n_dead_A_vl10006064w);  
%var_d(n_dead_A_vl10006569w);  %var_d(n_dead_A_vl10007074w);  %var_d(n_dead_A_vl10007579w);   %var_d(n_dead_A_vl10008084w);  

%var_d(n_dead_A_vg1000_m); 	   %var_d(n_dead_A_vg1000_w);  
%var_d(n_dead_A_vg10001519_);  %var_d(n_dead_A_vg10002024_);  %var_d(n_dead_A_vg10002529_);  %var_d(n_dead_A_vg10003034_);  %var_d(n_dead_A_vg10003539_);  
%var_d(n_dead_A_vg10004044_);  %var_d(n_dead_A_vg10004549_);  %var_d(n_dead_A_vg10005054_);  %var_d(n_dead_A_vg10005559_);  %var_d(n_dead_A_vg10006064_);  
%var_d(n_dead_A_vg10006569_);  %var_d(n_dead_A_vg10007074_);  %var_d(n_dead_A_vg10007579_);   %var_d(n_dead_A_vg10008084_);  
%var_d(n_dead_A_vg10001519m);  %var_d(n_dead_A_vg10002024m);  %var_d(n_dead_A_vg10002529m);  %var_d(n_dead_A_vg10003034m);  %var_d(n_dead_A_vg10003539m);  
%var_d(n_dead_A_vg10004044m);  %var_d(n_dead_A_vg10004549m);  %var_d(n_dead_A_vg10005054m);  %var_d(n_dead_A_vg10005559m);  %var_d(n_dead_A_vg10006064m);  
%var_d(n_dead_A_vg10006569m);  %var_d(n_dead_A_vg10007074m);  %var_d(n_dead_A_vg10007579m);   %var_d(n_dead_A_vg10008084m);  
%var_d(n_dead_A_vg10001519w);  %var_d(n_dead_A_vg10002024w);  %var_d(n_dead_A_vg10002529w);  %var_d(n_dead_A_vg10003034w);  %var_d(n_dead_A_vg10003539w);  
%var_d(n_dead_A_vg10004044w);  %var_d(n_dead_A_vg10004549w);  %var_d(n_dead_A_vg10005054w);  %var_d(n_dead_A_vg10005559w);  %var_d(n_dead_A_vg10006064w);  
%var_d(n_dead_A_vg10006569w);  %var_d(n_dead_A_vg10007074w);  %var_d(n_dead_A_vg10007579w);   %var_d(n_dead_A_vg10008084w);  

%var_d(n_dead_Alt6_vl1000_m); 	  %var_d(n_dead_Alt6_vl1000_w);  
%var_d(n_dead_Alt6_vl10001519_);  %var_d(n_dead_Alt6_vl10002024_);  %var_d(n_dead_Alt6_vl10002529_);  %var_d(n_dead_Alt6_vl10003034_);  %var_d(n_dead_Alt6_vl10003539_);  
%var_d(n_dead_Alt6_vl10004044_);  %var_d(n_dead_Alt6_vl10004549_);  %var_d(n_dead_Alt6_vl10005054_);  %var_d(n_dead_Alt6_vl10005559_);  %var_d(n_dead_Alt6_vl10006064_);  
%var_d(n_dead_Alt6_vl10006569_);  %var_d(n_dead_Alt6_vl10007074_);  %var_d(n_dead_Alt6_vl10007579_);   %var_d(n_dead_Alt6_vl10008084_);  
%var_d(n_dead_Alt6_vl10001519m);  %var_d(n_dead_Alt6_vl10002024m);  %var_d(n_dead_Alt6_vl10002529m);  %var_d(n_dead_Alt6_vl10003034m);  %var_d(n_dead_Alt6_vl10003539m);  
%var_d(n_dead_Alt6_vl10004044m);  %var_d(n_dead_Alt6_vl10004549m);  %var_d(n_dead_Alt6_vl10005054m);  %var_d(n_dead_Alt6_vl10005559m);  %var_d(n_dead_Alt6_vl10006064m);  
%var_d(n_dead_Alt6_vl10006569m);  %var_d(n_dead_Alt6_vl10007074m);  %var_d(n_dead_Alt6_vl10007579m);   %var_d(n_dead_Alt6_vl10008084m);  
%var_d(n_dead_Alt6_vl10001519w);  %var_d(n_dead_Alt6_vl10002024w);  %var_d(n_dead_Alt6_vl10002529w);  %var_d(n_dead_Alt6_vl10003034w);  %var_d(n_dead_Alt6_vl10003539w);  
%var_d(n_dead_Alt6_vl10004044w);  %var_d(n_dead_Alt6_vl10004549w);  %var_d(n_dead_Alt6_vl10005054w);  %var_d(n_dead_Alt6_vl10005559w);  %var_d(n_dead_Alt6_vl10006064w);  
%var_d(n_dead_Alt6_vl10006569w);  %var_d(n_dead_Alt6_vl10007074w);  %var_d(n_dead_Alt6_vl10007579w);   %var_d(n_dead_Alt6_vl10008084w);  

%var_d(n_dead_Alt6_vg1000_m);  	  %var_d(n_dead_Alt6_vg1000_w);  
%var_d(n_dead_Alt6_vg10001519_);  %var_d(n_dead_Alt6_vg10002024_);  %var_d(n_dead_Alt6_vg10002529_);  %var_d(n_dead_Alt6_vg10003034_);  %var_d(n_dead_Alt6_vg10003539_);  
%var_d(n_dead_Alt6_vg10004044_);  %var_d(n_dead_Alt6_vg10004549_);  %var_d(n_dead_Alt6_vg10005054_);  %var_d(n_dead_Alt6_vg10005559_);  %var_d(n_dead_Alt6_vg10006064_);  
%var_d(n_dead_Alt6_vg10006569_);  %var_d(n_dead_Alt6_vg10007074_);  %var_d(n_dead_Alt6_vg10007579_);   %var_d(n_dead_Alt6_vg10008084_);  
%var_d(n_dead_Alt6_vg10001519m);  %var_d(n_dead_Alt6_vg10002024m);  %var_d(n_dead_Alt6_vg10002529m);  %var_d(n_dead_Alt6_vg10003034m);  %var_d(n_dead_Alt6_vg10003539m);  
%var_d(n_dead_Alt6_vg10004044m);  %var_d(n_dead_Alt6_vg10004549m);  %var_d(n_dead_Alt6_vg10005054m);  %var_d(n_dead_Alt6_vg10005559m);  %var_d(n_dead_Alt6_vg10006064m);  
%var_d(n_dead_Alt6_vg10006569m);  %var_d(n_dead_Alt6_vg10007074m);  %var_d(n_dead_Alt6_vg10007579m);   %var_d(n_dead_Alt6_vg10008084m);  
%var_d(n_dead_Alt6_vg10001519w);  %var_d(n_dead_Alt6_vg10002024w);  %var_d(n_dead_Alt6_vg10002529w);  %var_d(n_dead_Alt6_vg10003034w);  %var_d(n_dead_Alt6_vg10003539w);  
%var_d(n_dead_Alt6_vg10004044w);  %var_d(n_dead_Alt6_vg10004549w);  %var_d(n_dead_Alt6_vg10005054w);  %var_d(n_dead_Alt6_vg10005559w);  %var_d(n_dead_Alt6_vg10006064w);  
%var_d(n_dead_Alt6_vg10006569w);  %var_d(n_dead_Alt6_vg10007074w);  %var_d(n_dead_Alt6_vg10007579w);   %var_d(n_dead_Alt6_vg10008084w);  

%var_d(n_dead_Agt6_vl1000_m);  	  %var_d(n_dead_Agt6_vl1000_w);  
%var_d(n_dead_Agt6_vl10001519_);  %var_d(n_dead_Agt6_vl10002024_);  %var_d(n_dead_Agt6_vl10002529_);  %var_d(n_dead_Agt6_vl10003034_);  %var_d(n_dead_Agt6_vl10003539_);  
%var_d(n_dead_Agt6_vl10004044_);  %var_d(n_dead_Agt6_vl10004549_);  %var_d(n_dead_Agt6_vl10005054_);  %var_d(n_dead_Agt6_vl10005559_);  %var_d(n_dead_Agt6_vl10006064_);  
%var_d(n_dead_Agt6_vl10006569_);  %var_d(n_dead_Agt6_vl10007074_);  %var_d(n_dead_Agt6_vl10007579_);   %var_d(n_dead_Agt6_vl10008084_);  
%var_d(n_dead_Agt6_vl10001519m);  %var_d(n_dead_Agt6_vl10002024m);  %var_d(n_dead_Agt6_vl10002529m);  %var_d(n_dead_Agt6_vl10003034m);  %var_d(n_dead_Agt6_vl10003539m);  
%var_d(n_dead_Agt6_vl10004044m);  %var_d(n_dead_Agt6_vl10004549m);  %var_d(n_dead_Agt6_vl10005054m);  %var_d(n_dead_Agt6_vl10005559m);  %var_d(n_dead_Agt6_vl10006064m);  
%var_d(n_dead_Agt6_vl10006569m);  %var_d(n_dead_Agt6_vl10007074m);  %var_d(n_dead_Agt6_vl10007579m);   %var_d(n_dead_Agt6_vl10008084m);  
%var_d(n_dead_Agt6_vl10001519w);  %var_d(n_dead_Agt6_vl10002024w);  %var_d(n_dead_Agt6_vl10002529w);  %var_d(n_dead_Agt6_vl10003034w);  %var_d(n_dead_Agt6_vl10003539w);  
%var_d(n_dead_Agt6_vl10004044w);  %var_d(n_dead_Agt6_vl10004549w);  %var_d(n_dead_Agt6_vl10005054w);  %var_d(n_dead_Agt6_vl10005559w);  %var_d(n_dead_Agt6_vl10006064w);  
%var_d(n_dead_Agt6_vl10006569w);  %var_d(n_dead_Agt6_vl10007074w);  %var_d(n_dead_Agt6_vl10007579w);   %var_d(n_dead_Agt6_vl10008084w);  

%var_d(n_dead_Agt6_vg1000_m);  	  %var_d(n_dead_Agt6_vg1000_w);  
%var_d(n_dead_Agt6_vg10001519_);  %var_d(n_dead_Agt6_vg10002024_);  %var_d(n_dead_Agt6_vg10002529_);  %var_d(n_dead_Agt6_vg10003034_);  %var_d(n_dead_Agt6_vg10003539_);  
%var_d(n_dead_Agt6_vg10004044_);  %var_d(n_dead_Agt6_vg10004549_);  %var_d(n_dead_Agt6_vg10005054_);  %var_d(n_dead_Agt6_vg10005559_);  %var_d(n_dead_Agt6_vg10006064_);  
%var_d(n_dead_Agt6_vg10006569_);  %var_d(n_dead_Agt6_vg10007074_);  %var_d(n_dead_Agt6_vg10007579_);   %var_d(n_dead_Agt6_vg10008084_);  
%var_d(n_dead_Agt6_vg10001519m);  %var_d(n_dead_Agt6_vg10002024m);  %var_d(n_dead_Agt6_vg10002529m);  %var_d(n_dead_Agt6_vg10003034m);  %var_d(n_dead_Agt6_vg10003539m);  
%var_d(n_dead_Agt6_vg10004044m);  %var_d(n_dead_Agt6_vg10004549m);  %var_d(n_dead_Agt6_vg10005054m);  %var_d(n_dead_Agt6_vg10005559m);  %var_d(n_dead_Agt6_vg10006064m);  
%var_d(n_dead_Agt6_vg10006569m);  %var_d(n_dead_Agt6_vg10007074m);  %var_d(n_dead_Agt6_vg10007579m);   %var_d(n_dead_Agt6_vg10008084m);  
%var_d(n_dead_Agt6_vg10001519w);  %var_d(n_dead_Agt6_vg10002024w);  %var_d(n_dead_Agt6_vg10002529w);  %var_d(n_dead_Agt6_vg10003034w);  %var_d(n_dead_Agt6_vg10003539w);  
%var_d(n_dead_Agt6_vg10004044w);  %var_d(n_dead_Agt6_vg10004549w);  %var_d(n_dead_Agt6_vg10005054w);  %var_d(n_dead_Agt6_vg10005559w);  %var_d(n_dead_Agt6_vg10006064w);  
%var_d(n_dead_Agt6_vg10006569w);  %var_d(n_dead_Agt6_vg10007074w);  %var_d(n_dead_Agt6_vg10007579w);   %var_d(n_dead_Agt6_vg10008084w);  

%var_d(n_dead_int_lost_m);     %var_d(n_dead_int_lost_w);  
%var_d(n_dead_int_lost1519_);  %var_d(n_dead_int_lost2024_);  %var_d(n_dead_int_lost2529_);  %var_d(n_dead_int_lost3034_);  %var_d(n_dead_int_lost3539_);  
%var_d(n_dead_int_lost4044_);  %var_d(n_dead_int_lost4549_);  %var_d(n_dead_int_lost5054_);  %var_d(n_dead_int_lost5559_);  %var_d(n_dead_int_lost6064_);  
%var_d(n_dead_int_lost6569_);  %var_d(n_dead_int_lost7074_);  %var_d(n_dead_int_lost7579_);  %var_d(n_dead_int_lost8084_);  
%var_d(n_dead_int_lost1519m);  %var_d(n_dead_int_lost2024m);  %var_d(n_dead_int_lost2529m);  %var_d(n_dead_int_lost3034m);  %var_d(n_dead_int_lost3539m);  
%var_d(n_dead_int_lost4044m);  %var_d(n_dead_int_lost4549m);  %var_d(n_dead_int_lost5054m);  %var_d(n_dead_int_lost5559m);  %var_d(n_dead_int_lost6064m);  
%var_d(n_dead_int_lost6569m);  %var_d(n_dead_int_lost7074m);  %var_d(n_dead_int_lost7579m);  %var_d(n_dead_int_lost8084m);  
%var_d(n_dead_int_lost1519w);  %var_d(n_dead_int_lost2024w);  %var_d(n_dead_int_lost2529w);  %var_d(n_dead_int_lost3034w);  %var_d(n_dead_int_lost3539w);  
%var_d(n_dead_int_lost4044w);  %var_d(n_dead_int_lost4549w);  %var_d(n_dead_int_lost5054w);  %var_d(n_dead_int_lost5559w);  %var_d(n_dead_int_lost6064w);  
%var_d(n_dead_int_lost6569w);  %var_d(n_dead_int_lost7074w);  %var_d(n_dead_int_lost7579w);  %var_d(n_dead_int_lost8084w);  

%var_d(n_dead_1stint_lost_m);  	  %var_d(n_dead_1stint_lost_w);  
%var_d(n_dead_1stint_lost1519_);  %var_d(n_dead_1stint_lost2024_);  %var_d(n_dead_1stint_lost2529_);  %var_d(n_dead_1stint_lost3034_);  %var_d(n_dead_1stint_lost3539_);  
%var_d(n_dead_1stint_lost4044_);  %var_d(n_dead_1stint_lost4549_);  %var_d(n_dead_1stint_lost5054_);  %var_d(n_dead_1stint_lost5559_);  %var_d(n_dead_1stint_lost6064_);  
%var_d(n_dead_1stint_lost6569_);  %var_d(n_dead_1stint_lost7074_);  %var_d(n_dead_1stint_lost7579_);  %var_d(n_dead_1stint_lost8084_);  
%var_d(n_dead_1stint_lost1519m);  %var_d(n_dead_1stint_lost2024m);  %var_d(n_dead_1stint_lost2529m);  %var_d(n_dead_1stint_lost3034m);  %var_d(n_dead_1stint_lost3539m);  
%var_d(n_dead_1stint_lost4044m);  %var_d(n_dead_1stint_lost4549m);  %var_d(n_dead_1stint_lost5054m);  %var_d(n_dead_1stint_lost5559m);  %var_d(n_dead_1stint_lost6064m);  
%var_d(n_dead_1stint_lost6569m);  %var_d(n_dead_1stint_lost7074m);  %var_d(n_dead_1stint_lost7579m);  %var_d(n_dead_1stint_lost8084m);  
%var_d(n_dead_1stint_lost1519w);  %var_d(n_dead_1stint_lost2024w);  %var_d(n_dead_1stint_lost2529w);  %var_d(n_dead_1stint_lost3034w);  %var_d(n_dead_1stint_lost3539w);  
%var_d(n_dead_1stint_lost4044w);  %var_d(n_dead_1stint_lost4549w);  %var_d(n_dead_1stint_lost5054w);  %var_d(n_dead_1stint_lost5559w);  %var_d(n_dead_1stint_lost6064w);  
%var_d(n_dead_1stint_lost6569w);  %var_d(n_dead_1stint_lost7074w);  %var_d(n_dead_1stint_lost7579w);  %var_d(n_dead_1stint_lost8084w);  

%var_d(n_dead_subintlt6_lost_m);  	 %var_d(n_dead_subintlt6_lost_w);  
%var_d(n_dead_subintlt6_lost1519_);  %var_d(n_dead_subintlt6_lost2024_);  %var_d(n_dead_subintlt6_lost2529_);  %var_d(n_dead_subintlt6_lost3034_);  %var_d(n_dead_subintlt6_lost3539_);  
%var_d(n_dead_subintlt6_lost4044_);  %var_d(n_dead_subintlt6_lost4549_);  %var_d(n_dead_subintlt6_lost5054_);  %var_d(n_dead_subintlt6_lost5559_);  %var_d(n_dead_subintlt6_lost6064_);  
%var_d(n_dead_subintlt6_lost6569_);  %var_d(n_dead_subintlt6_lost7074_);  %var_d(n_dead_subintlt6_lost7579_);  %var_d(n_dead_subintlt6_lost8084_);  
%var_d(n_dead_subintlt6_lost1519m);  %var_d(n_dead_subintlt6_lost2024m);  %var_d(n_dead_subintlt6_lost2529m);  %var_d(n_dead_subintlt6_lost3034m);  %var_d(n_dead_subintlt6_lost3539m);  
%var_d(n_dead_subintlt6_lost4044m);  %var_d(n_dead_subintlt6_lost4549m);  %var_d(n_dead_subintlt6_lost5054m);  %var_d(n_dead_subintlt6_lost5559m);  %var_d(n_dead_subintlt6_lost6064m);  
%var_d(n_dead_subintlt6_lost6569m);  %var_d(n_dead_subintlt6_lost7074m);  %var_d(n_dead_subintlt6_lost7579m);  %var_d(n_dead_subintlt6_lost8084m);  
%var_d(n_dead_subintlt6_lost1519w);  %var_d(n_dead_subintlt6_lost2024w);  %var_d(n_dead_subintlt6_lost2529w);  %var_d(n_dead_subintlt6_lost3034w);  %var_d(n_dead_subintlt6_lost3539w);  
%var_d(n_dead_subintlt6_lost4044w);  %var_d(n_dead_subintlt6_lost4549w);  %var_d(n_dead_subintlt6_lost5054w);  %var_d(n_dead_subintlt6_lost5559w);  %var_d(n_dead_subintlt6_lost6064w);  
%var_d(n_dead_subintlt6_lost6569w);  %var_d(n_dead_subintlt6_lost7074w);  %var_d(n_dead_subintlt6_lost7579w);  %var_d(n_dead_subintlt6_lost8084w);  

%var_d(n_dead_subintgt6_lost_m);  	 %var_d(n_dead_subintgt6_lost_w);  
%var_d(n_dead_subintgt6_lost1519_);  %var_d(n_dead_subintgt6_lost2024_);  %var_d(n_dead_subintgt6_lost2529_);  %var_d(n_dead_subintgt6_lost3034_);  %var_d(n_dead_subintgt6_lost3539_);  
%var_d(n_dead_subintgt6_lost4044_);  %var_d(n_dead_subintgt6_lost4549_);  %var_d(n_dead_subintgt6_lost5054_);  %var_d(n_dead_subintgt6_lost5559_);  %var_d(n_dead_subintgt6_lost6064_);  
%var_d(n_dead_subintgt6_lost6569_);  %var_d(n_dead_subintgt6_lost7074_);  %var_d(n_dead_subintgt6_lost7579_);  %var_d(n_dead_subintgt6_lost8084_);  
%var_d(n_dead_subintgt6_lost1519m);  %var_d(n_dead_subintgt6_lost2024m);  %var_d(n_dead_subintgt6_lost2529m);  %var_d(n_dead_subintgt6_lost3034m);  %var_d(n_dead_subintgt6_lost3539m);  
%var_d(n_dead_subintgt6_lost4044m);  %var_d(n_dead_subintgt6_lost4549m);  %var_d(n_dead_subintgt6_lost5054m);  %var_d(n_dead_subintgt6_lost5559m);  %var_d(n_dead_subintgt6_lost6064m);  
%var_d(n_dead_subintgt6_lost6569m);  %var_d(n_dead_subintgt6_lost7074m);  %var_d(n_dead_subintgt6_lost7579m);  %var_d(n_dead_subintgt6_lost8084m);  
%var_d(n_dead_subintgt6_lost1519w);  %var_d(n_dead_subintgt6_lost2024w);  %var_d(n_dead_subintgt6_lost2529w);  %var_d(n_dead_subintgt6_lost3034w);  %var_d(n_dead_subintgt6_lost3539w);  
%var_d(n_dead_subintgt6_lost4044w);  %var_d(n_dead_subintgt6_lost4549w);  %var_d(n_dead_subintgt6_lost5054w);  %var_d(n_dead_subintgt6_lost5559w);  %var_d(n_dead_subintgt6_lost6064w);  
%var_d(n_dead_subintgt6_lost6569w);  %var_d(n_dead_subintgt6_lost7074w);  %var_d(n_dead_subintgt6_lost7579w);  %var_d(n_dead_subintgt6_lost8084w);  

%var_d(n_dead_A_cd4lt200_m);  	 %var_d(n_dead_A_cd4lt200_w);  
%var_d(n_dead_A_cd4lt2001519_);  %var_d(n_dead_A_cd4lt2002024_);  %var_d(n_dead_A_cd4lt2002529_);  %var_d(n_dead_A_cd4lt2003034_);  %var_d(n_dead_A_cd4lt2003539_);  
%var_d(n_dead_A_cd4lt2004044_);  %var_d(n_dead_A_cd4lt2004549_);  %var_d(n_dead_A_cd4lt2005054_);  %var_d(n_dead_A_cd4lt2005559_);  %var_d(n_dead_A_cd4lt2006064_);  
%var_d(n_dead_A_cd4lt2006569_);  %var_d(n_dead_A_cd4lt2007074_);  %var_d(n_dead_A_cd4lt2007579_);  %var_d(n_dead_A_cd4lt2008084_);  
%var_d(n_dead_A_cd4lt2001519m);  %var_d(n_dead_A_cd4lt2002024m);  %var_d(n_dead_A_cd4lt2002529m);  %var_d(n_dead_A_cd4lt2003034m);  %var_d(n_dead_A_cd4lt2003539m);  
%var_d(n_dead_A_cd4lt2004044m);  %var_d(n_dead_A_cd4lt2004549m);  %var_d(n_dead_A_cd4lt2005054m);  %var_d(n_dead_A_cd4lt2005559m);  %var_d(n_dead_A_cd4lt2006064m);  
%var_d(n_dead_A_cd4lt2006569m);  %var_d(n_dead_A_cd4lt2007074m);  %var_d(n_dead_A_cd4lt2007579m);  %var_d(n_dead_A_cd4lt2008084m);  
%var_d(n_dead_A_cd4lt2001519w);  %var_d(n_dead_A_cd4lt2002024w);  %var_d(n_dead_A_cd4lt2002529w);  %var_d(n_dead_A_cd4lt2003034w);  %var_d(n_dead_A_cd4lt2003539w);  
%var_d(n_dead_A_cd4lt2004044w);  %var_d(n_dead_A_cd4lt2004549w);  %var_d(n_dead_A_cd4lt2005054w);  %var_d(n_dead_A_cd4lt2005559w);  %var_d(n_dead_A_cd4lt2006064w);  
%var_d(n_dead_A_cd4lt2006569w);  %var_d(n_dead_A_cd4lt2007074w);  %var_d(n_dead_A_cd4lt2007579w);  %var_d(n_dead_A_cd4lt2008084w);  

%var_d(n_dead_A_cd4gt200_m);  	 %var_d(n_dead_A_cd4gt200_w);  
%var_d(n_dead_A_cd4gt2001519_);  %var_d(n_dead_A_cd4gt2002024_);  %var_d(n_dead_A_cd4gt2002529_);  %var_d(n_dead_A_cd4gt2003034_);  %var_d(n_dead_A_cd4gt2003539_);  
%var_d(n_dead_A_cd4gt2004044_);  %var_d(n_dead_A_cd4gt2004549_);  %var_d(n_dead_A_cd4gt2005054_);  %var_d(n_dead_A_cd4gt2005559_);  %var_d(n_dead_A_cd4gt2006064_);  
%var_d(n_dead_A_cd4gt2006569_);  %var_d(n_dead_A_cd4gt2007074_);  %var_d(n_dead_A_cd4gt2007579_);  %var_d(n_dead_A_cd4gt2008084_);  
%var_d(n_dead_A_cd4gt2001519m);  %var_d(n_dead_A_cd4gt2002024m);  %var_d(n_dead_A_cd4gt2002529m);  %var_d(n_dead_A_cd4gt2003034m);  %var_d(n_dead_A_cd4gt2003539m);  
%var_d(n_dead_A_cd4gt2004044m);  %var_d(n_dead_A_cd4gt2004549m);  %var_d(n_dead_A_cd4gt2005054m);  %var_d(n_dead_A_cd4gt2005559m);  %var_d(n_dead_A_cd4gt2006064m);  
%var_d(n_dead_A_cd4gt2006569m);  %var_d(n_dead_A_cd4gt2007074m);  %var_d(n_dead_A_cd4gt2007579m);  %var_d(n_dead_A_cd4gt2008084m);  
%var_d(n_dead_A_cd4gt2001519w);  %var_d(n_dead_A_cd4gt2002024w);  %var_d(n_dead_A_cd4gt2002529w);  %var_d(n_dead_A_cd4gt2003034w);  %var_d(n_dead_A_cd4gt2003539w);  
%var_d(n_dead_A_cd4gt2004044w);  %var_d(n_dead_A_cd4gt2004549w);  %var_d(n_dead_A_cd4gt2005054w);  %var_d(n_dead_A_cd4gt2005559w);  %var_d(n_dead_A_cd4gt2006064w);  
%var_d(n_dead_A_cd4gt2006569w);  %var_d(n_dead_A_cd4gt2007074w);  %var_d(n_dead_A_cd4gt2007579w);  %var_d(n_dead_A_cd4gt2008084w);  

%var_d(n_dead_Alt6_cd4lt200_m);  	%var_d(n_dead_Alt6_cd4lt200_w);  
%var_d(n_dead_Alt6_cd4lt2001519_);  %var_d(n_dead_Alt6_cd4lt2002024_);  %var_d(n_dead_Alt6_cd4lt2002529_);  %var_d(n_dead_Alt6_cd4lt2003034_);  %var_d(n_dead_Alt6_cd4lt2003539_);  
%var_d(n_dead_Alt6_cd4lt2004044_);  %var_d(n_dead_Alt6_cd4lt2004549_);  %var_d(n_dead_Alt6_cd4lt2005054_);  %var_d(n_dead_Alt6_cd4lt2005559_);  %var_d(n_dead_Alt6_cd4lt2006064_);  
%var_d(n_dead_Alt6_cd4lt2006569_);  %var_d(n_dead_Alt6_cd4lt2007074_);  %var_d(n_dead_Alt6_cd4lt2007579_);  %var_d(n_dead_Alt6_cd4lt2008084_);  
%var_d(n_dead_Alt6_cd4lt2001519m);  %var_d(n_dead_Alt6_cd4lt2002024m);  %var_d(n_dead_Alt6_cd4lt2002529m);  %var_d(n_dead_Alt6_cd4lt2003034m);  %var_d(n_dead_Alt6_cd4lt2003539m);  
%var_d(n_dead_Alt6_cd4lt2004044m);  %var_d(n_dead_Alt6_cd4lt2004549m);  %var_d(n_dead_Alt6_cd4lt2005054m);  %var_d(n_dead_Alt6_cd4lt2005559m);  %var_d(n_dead_Alt6_cd4lt2006064m);  
%var_d(n_dead_Alt6_cd4lt2006569m);  %var_d(n_dead_Alt6_cd4lt2007074m);  %var_d(n_dead_Alt6_cd4lt2007579m);  %var_d(n_dead_Alt6_cd4lt2008084m);  
%var_d(n_dead_Alt6_cd4lt2001519w);  %var_d(n_dead_Alt6_cd4lt2002024w);  %var_d(n_dead_Alt6_cd4lt2002529w);  %var_d(n_dead_Alt6_cd4lt2003034w);  %var_d(n_dead_Alt6_cd4lt2003539w);  
%var_d(n_dead_Alt6_cd4lt2004044w);  %var_d(n_dead_Alt6_cd4lt2004549w);  %var_d(n_dead_Alt6_cd4lt2005054w);  %var_d(n_dead_Alt6_cd4lt2005559w);  %var_d(n_dead_Alt6_cd4lt2006064w);  
%var_d(n_dead_Alt6_cd4lt2006569w);  %var_d(n_dead_Alt6_cd4lt2007074w);  %var_d(n_dead_Alt6_cd4lt2007579w);  %var_d(n_dead_Alt6_cd4lt2008084w);  

%var_d(n_dead_Alt6_cd4gt200_m);  	%var_d(n_dead_Alt6_cd4gt200_w);  
%var_d(n_dead_Alt6_cd4gt2001519_);  %var_d(n_dead_Alt6_cd4gt2002024_);  %var_d(n_dead_Alt6_cd4gt2002529_);  %var_d(n_dead_Alt6_cd4gt2003034_);  %var_d(n_dead_Alt6_cd4gt2003539_);  
%var_d(n_dead_Alt6_cd4gt2004044_);  %var_d(n_dead_Alt6_cd4gt2004549_);  %var_d(n_dead_Alt6_cd4gt2005054_);  %var_d(n_dead_Alt6_cd4gt2005559_);  %var_d(n_dead_Alt6_cd4gt2006064_);  
%var_d(n_dead_Alt6_cd4gt2006569_);  %var_d(n_dead_Alt6_cd4gt2007074_);  %var_d(n_dead_Alt6_cd4gt2007579_);  %var_d(n_dead_Alt6_cd4gt2008084_);  
%var_d(n_dead_Alt6_cd4gt2001519m);  %var_d(n_dead_Alt6_cd4gt2002024m);  %var_d(n_dead_Alt6_cd4gt2002529m);  %var_d(n_dead_Alt6_cd4gt2003034m);  %var_d(n_dead_Alt6_cd4gt2003539m);  
%var_d(n_dead_Alt6_cd4gt2004044m);  %var_d(n_dead_Alt6_cd4gt2004549m);  %var_d(n_dead_Alt6_cd4gt2005054m);  %var_d(n_dead_Alt6_cd4gt2005559m);  %var_d(n_dead_Alt6_cd4gt2006064m);  
%var_d(n_dead_Alt6_cd4gt2006569m);  %var_d(n_dead_Alt6_cd4gt2007074m);  %var_d(n_dead_Alt6_cd4gt2007579m);  %var_d(n_dead_Alt6_cd4gt2008084m);  
%var_d(n_dead_Alt6_cd4gt2001519w);  %var_d(n_dead_Alt6_cd4gt2002024w);  %var_d(n_dead_Alt6_cd4gt2002529w);  %var_d(n_dead_Alt6_cd4gt2003034w);  %var_d(n_dead_Alt6_cd4gt2003539w);  
%var_d(n_dead_Alt6_cd4gt2004044w);  %var_d(n_dead_Alt6_cd4gt2004549w);  %var_d(n_dead_Alt6_cd4gt2005054w);  %var_d(n_dead_Alt6_cd4gt2005559w);  %var_d(n_dead_Alt6_cd4gt2006064w);  
%var_d(n_dead_Alt6_cd4gt2006569w);  %var_d(n_dead_Alt6_cd4gt2007074w);  %var_d(n_dead_Alt6_cd4gt2007579w);  %var_d(n_dead_Alt6_cd4gt2008084w);  

%var_d(n_dead_Agt6_cd4lt200_m); 	%var_d(n_dead_Agt6_cd4lt200_w);  
%var_d(n_dead_Agt6_cd4lt2001519_);  %var_d(n_dead_Agt6_cd4lt2002024_);  %var_d(n_dead_Agt6_cd4lt2002529_);  %var_d(n_dead_Agt6_cd4lt2003034_);  %var_d(n_dead_Agt6_cd4lt2003539_);  
%var_d(n_dead_Agt6_cd4lt2004044_);  %var_d(n_dead_Agt6_cd4lt2004549_);  %var_d(n_dead_Agt6_cd4lt2005054_);  %var_d(n_dead_Agt6_cd4lt2005559_);  %var_d(n_dead_Agt6_cd4lt2006064_);  
%var_d(n_dead_Agt6_cd4lt2006569_);  %var_d(n_dead_Agt6_cd4lt2007074_);  %var_d(n_dead_Agt6_cd4lt2007579_);  %var_d(n_dead_Agt6_cd4lt2008084_);  
%var_d(n_dead_Agt6_cd4lt2001519m);  %var_d(n_dead_Agt6_cd4lt2002024m);  %var_d(n_dead_Agt6_cd4lt2002529m);  %var_d(n_dead_Agt6_cd4lt2003034m);  %var_d(n_dead_Agt6_cd4lt2003539m);  
%var_d(n_dead_Agt6_cd4lt2004044m);  %var_d(n_dead_Agt6_cd4lt2004549m);  %var_d(n_dead_Agt6_cd4lt2005054m);  %var_d(n_dead_Agt6_cd4lt2005559m);  %var_d(n_dead_Agt6_cd4lt2006064m);  
%var_d(n_dead_Agt6_cd4lt2006569m);  %var_d(n_dead_Agt6_cd4lt2007074m);  %var_d(n_dead_Agt6_cd4lt2007579m);  %var_d(n_dead_Agt6_cd4lt2008084m);  
%var_d(n_dead_Agt6_cd4lt2001519w);  %var_d(n_dead_Agt6_cd4lt2002024w);  %var_d(n_dead_Agt6_cd4lt2002529w);  %var_d(n_dead_Agt6_cd4lt2003034w);  %var_d(n_dead_Agt6_cd4lt2003539w);  
%var_d(n_dead_Agt6_cd4lt2004044w);  %var_d(n_dead_Agt6_cd4lt2004549w);  %var_d(n_dead_Agt6_cd4lt2005054w);  %var_d(n_dead_Agt6_cd4lt2005559w);  %var_d(n_dead_Agt6_cd4lt2006064w);  
%var_d(n_dead_Agt6_cd4lt2006569w);  %var_d(n_dead_Agt6_cd4lt2007074w);  %var_d(n_dead_Agt6_cd4lt2007579w);  %var_d(n_dead_Agt6_cd4lt2008084w);  

%var_d(n_dead_Agt6_cd4gt200_m); 	%var_d(n_dead_Agt6_cd4gt200_w);  
%var_d(n_dead_Agt6_cd4gt2001519_);  %var_d(n_dead_Agt6_cd4gt2002024_);  %var_d(n_dead_Agt6_cd4gt2002529_);  %var_d(n_dead_Agt6_cd4gt2003034_);  %var_d(n_dead_Agt6_cd4gt2003539_);  
%var_d(n_dead_Agt6_cd4gt2004044_);  %var_d(n_dead_Agt6_cd4gt2004549_);  %var_d(n_dead_Agt6_cd4gt2005054_);  %var_d(n_dead_Agt6_cd4gt2005559_);  %var_d(n_dead_Agt6_cd4gt2006064_);  
%var_d(n_dead_Agt6_cd4gt2006569_);  %var_d(n_dead_Agt6_cd4gt2007074_);  %var_d(n_dead_Agt6_cd4gt2007579_);  %var_d(n_dead_Agt6_cd4gt2008084_);  
%var_d(n_dead_Agt6_cd4gt2001519m);  %var_d(n_dead_Agt6_cd4gt2002024m);  %var_d(n_dead_Agt6_cd4gt2002529m);  %var_d(n_dead_Agt6_cd4gt2003034m);  %var_d(n_dead_Agt6_cd4gt2003539m);  
%var_d(n_dead_Agt6_cd4gt2004044m);  %var_d(n_dead_Agt6_cd4gt2004549m);  %var_d(n_dead_Agt6_cd4gt2005054m);  %var_d(n_dead_Agt6_cd4gt2005559m);  %var_d(n_dead_Agt6_cd4gt2006064m);  
%var_d(n_dead_Agt6_cd4gt2006569m);  %var_d(n_dead_Agt6_cd4gt2007074m);  %var_d(n_dead_Agt6_cd4gt2007579m);  %var_d(n_dead_Agt6_cd4gt2008084m);  
%var_d(n_dead_Agt6_cd4gt2001519w);  %var_d(n_dead_Agt6_cd4gt2002024w);  %var_d(n_dead_Agt6_cd4gt2002529w);  %var_d(n_dead_Agt6_cd4gt2003034w);  %var_d(n_dead_Agt6_cd4gt2003539w);  
%var_d(n_dead_Agt6_cd4gt2004044w);  %var_d(n_dead_Agt6_cd4gt2004549w);  %var_d(n_dead_Agt6_cd4gt2005054w);  %var_d(n_dead_Agt6_cd4gt2005559w);  %var_d(n_dead_Agt6_cd4gt2006064w);  
%var_d(n_dead_Agt6_cd4gt2006569w);  %var_d(n_dead_Agt6_cd4gt2007074w);  %var_d(n_dead_Agt6_cd4gt2007579w);  %var_d(n_dead_Agt6_cd4gt2008084w);  ;

***transmissions;
%var_d(n_inf1519_);  %var_d(n_inf2024_);  %var_d(n_inf2529_);  %var_d(n_inf3034_);  %var_d(n_inf3539_);  %var_d(n_inf4044_);  %var_d(n_inf4549_);  %var_d(n_inf5054_); 
%var_d(n_inf5559_);  %var_d(n_inf6064_);  %var_d(n_inf6569_);  %var_d(n_inf7074_);  %var_d(n_inf7579_);  %var_d(n_inf8084_);  
%var_d(n_inf1519m);  %var_d(n_inf2024m);  %var_d(n_inf2529m);  %var_d(n_inf3034m);  %var_d(n_inf3539m);  %var_d(n_inf4044m);  %var_d(n_inf4549m);  %var_d(n_inf5054m); 
%var_d(n_inf5559m);  %var_d(n_inf6064m);  %var_d(n_inf6569m);  %var_d(n_inf7074m);  %var_d(n_inf7579m);  %var_d(n_inf8084m);  
%var_d(n_inf1519w);  %var_d(n_inf2024w);  %var_d(n_inf2529w);  %var_d(n_inf3034w);  %var_d(n_inf3539w);  %var_d(n_inf4044w);  %var_d(n_inf4549w);  %var_d(n_inf5054w);  
%var_d(n_inf5559w);  %var_d(n_inf6064w);  %var_d(n_inf6569w);  %var_d(n_inf7074w);  %var_d(n_inf7579w);  %var_d(n_inf8084w); 

%var_d(n_I_undiag); 		%var_d(n_I_diag_naive);  	%var_d(n_I_diag_startart); 	%var_d(n_I_onart);		%var_d(n_I_offart); 	%var_d(n_I_onart_lt6m);
%var_d(n_I_onart_lt6m_nvs); %var_d(n_I_onart_gt6m_nvs);	%var_d(n_I_onart_gt6m_vs);  %var_d(n_I_offart_1stI);%var_d(n_I_offart_SI); 	%var_d(n_I_offart_SIlt6m);
%var_d(n_I_offart_SIgt6m);

%var_d(n_I_undiag_m);		 %var_d(n_I_diag_naive_m);	   %var_d(n_I_diag_startart_m);	%var_d(n_I_onart_m);	  %var_d(n_I_offart_m);	  %var_d(n_I_onart_lt6m_m);
%var_d(n_I_onart_lt6m_nvn_m);%var_d(n_I_onart_gt6m_nvn_m); %var_d(n_I_onart_gt6m_vn_m);	%var_d(n_I_offart_1stI_m);%var_d(n_I_offart_SI_m);%var_d(n_I_offart_SIlt6m_m);
%var_d(n_I_offart_SIgt6m_m); 

%var_d(n_I_undiag_w); 		 %var_d(n_I_diag_naive_w); 	   %var_d(n_I_diag_startart_w); %var_d(n_I_onart_w);	  %var_d(n_I_offart_w);   %var_d(n_I_onart_lt6m_w); 
%var_d(n_I_onart_lt6m_nvn_w);%var_d(n_I_onart_gt6m_nvn_w); %var_d(n_I_onart_gt6m_vn_w); %var_d(n_I_offart_1stI_w);%var_d(n_I_offart_SI_w);%var_d(n_I_offart_SIlt6m_w); 
%var_d(n_I_offart_SIgt6m_w); 

%var_d(n_I_undiag1519_); 		%var_d(n_I_diag_naive1519_);	 %var_d(n_I_diag_startart1519_); 	%var_d(n_I_onart1519_);	   		%var_d(n_I_offart1519_); 	
%var_d(n_I_onart_lt6m1519_);    %var_d(n_I_onart_lt6m_nvs1519_); %var_d(n_I_onart_gt6m_nvs1519_);	%var_d(n_I_onart_gt6m_vs1519_); %var_d(n_I_offart_1stI1519_);
%var_d(n_I_offart_SI1519_); 	%var_d(n_I_offart_SIlt6m1519_);  %var_d(n_I_offart_SIgt6m1519_); 

%var_d(n_I_undiag2024_); 		%var_d(n_I_diag_naive2024_);	 %var_d(n_I_diag_startart2024_);	%var_d(n_I_onart2024_); 		%var_d(n_I_offart2024_);
%var_d(n_I_onart_lt6m2024_); 	%var_d(n_I_onart_lt6m_nvs2024_); %var_d(n_I_onart_gt6m_nvs2024_);	%var_d(n_I_onart_gt6m_vs2024_); %var_d(n_I_offart_1stI2024_); 
%var_d(n_I_offart_SI2024_); 	%var_d(n_I_offart_SIlt6m2024_);  %var_d(n_I_offart_SIgt6m2024_); 

%var_d(n_I_undiag2529_);		%var_d(n_I_diag_naive2529_); 	 %var_d(n_I_diag_startart2529_); 	%var_d(n_I_onart2529_);			%var_d(n_I_offart2529_);
%var_d(n_I_onart_lt6m2529_); 	%var_d(n_I_onart_lt6m_nvs2529_); %var_d(n_I_onart_gt6m_nvs2529_);   %var_d(n_I_onart_gt6m_vs2529_); %var_d(n_I_offart_1stI2529_); 
%var_d(n_I_offart_SI2529_); 	%var_d(n_I_offart_SIlt6m2529_);  %var_d(n_I_offart_SIgt6m2529_); 

%var_d(n_I_undiag3034_); 		%var_d(n_I_diag_naive3034_); 	 %var_d(n_I_diag_startart3034_); 	%var_d(n_I_onart3034_);			 %var_d(n_I_offart3034_); 
%var_d(n_I_onart_lt6m3034_); 	%var_d(n_I_onart_lt6m_nvs3034_); %var_d(n_I_onart_gt6m_nvs3034_);   %var_d(n_I_onart_gt6m_vs3034_);  %var_d(n_I_offart_1stI3034_); 
%var_d(n_I_offart_SI3034_); 	%var_d(n_I_offart_SIlt6m3034_);  %var_d(n_I_offart_SIgt6m3034_); 

%var_d(n_I_undiag3539_); 		%var_d(n_I_diag_naive3539_);	 %var_d(n_I_diag_startart3539_); 	%var_d(n_I_onart3539_); 		 %var_d(n_I_offart3539_);
%var_d(n_I_onart_lt6m3539_); 	%var_d(n_I_onart_lt6m_nvs3539_); %var_d(n_I_onart_gt6m_nvs3539_);   %var_d(n_I_onart_gt6m_vs3539_);  %var_d(n_I_offart_1stI3539_);
%var_d(n_I_offart_SI3539_); 	%var_d(n_I_offart_SIlt6m3539_);  %var_d(n_I_offart_SIgt6m3539_); 

%var_d(n_I_undiag4044_); 		%var_d(n_I_diag_naive4044_);	 %var_d(n_I_diag_startart4044_); 	%var_d(n_I_onart4044_); 		 %var_d(n_I_offart4044_);
%var_d(n_I_onart_lt6m4044_); 	%var_d(n_I_onart_lt6m_nvs4044_); %var_d(n_I_onart_gt6m_nvs4044_);   %var_d(n_I_onart_gt6m_vs4044_);  %var_d(n_I_offart_1stI4044_);
%var_d(n_I_offart_SI4044_); 	%var_d(n_I_offart_SIlt6m4044_);  %var_d(n_I_offart_SIgt6m4044_); 

%var_d(n_I_undiag4549_); 		%var_d(n_I_diag_naive4549_);	 %var_d(n_I_diag_startart4549_); 	%var_d(n_I_onart4549_); 		 %var_d(n_I_offart4549_);
%var_d(n_I_onart_lt6m4549_); 	%var_d(n_I_onart_lt6m_nvs4549_); %var_d(n_I_onart_gt6m_nvs4549_);   %var_d(n_I_onart_gt6m_vs4549_);  %var_d(n_I_offart_1stI4549_);
%var_d(n_I_offart_SI4549_); 	%var_d(n_I_offart_SIlt6m4549_);  %var_d(n_I_offart_SIgt6m4549_); 

%var_d(n_I_undiag5054_); 		%var_d(n_I_diag_naive5054_);	 %var_d(n_I_diag_startart5054_); 	%var_d(n_I_onart5054_); 		 %var_d(n_I_offart5054_);
%var_d(n_I_onart_lt6m5054_); 	%var_d(n_I_onart_lt6m_nvs5054_); %var_d(n_I_onart_gt6m_nvs5054_);   %var_d(n_I_onart_gt6m_vs5054_);  %var_d(n_I_offart_1stI5054_);
%var_d(n_I_offart_SI5054_); 	%var_d(n_I_offart_SIlt6m5054_);  %var_d(n_I_offart_SIgt6m5054_); 

%var_d(n_I_undiag5559_); 		%var_d(n_I_diag_naive5559_);	 %var_d(n_I_diag_startart5559_); 	%var_d(n_I_onart5559_); 		 %var_d(n_I_offart5559_);
%var_d(n_I_onart_lt6m5559_); 	%var_d(n_I_onart_lt6m_nvs5559_); %var_d(n_I_onart_gt6m_nvs5559_);   %var_d(n_I_onart_gt6m_vs5559_);  %var_d(n_I_offart_1stI5559_);
%var_d(n_I_offart_SI5559_); 	%var_d(n_I_offart_SIlt6m5559_);  %var_d(n_I_offart_SIgt6m5559_); 

%var_d(n_I_undiag6064_); 		%var_d(n_I_diag_naive6064_);	 %var_d(n_I_diag_startart6064_); 	%var_d(n_I_onart6064_); 		 %var_d(n_I_offart6064_);
%var_d(n_I_onart_lt6m6064_); 	%var_d(n_I_onart_lt6m_nvs6064_); %var_d(n_I_onart_gt6m_nvs6064_);   %var_d(n_I_onart_gt6m_vs6064_);  %var_d(n_I_offart_1stI6064_);
%var_d(n_I_offart_SI6064_); 	%var_d(n_I_offart_SIlt6m6064_);  %var_d(n_I_offart_SIgt6m6064_); 

%var_d(n_I_undiag6569_); 		%var_d(n_I_diag_naive6569_);	 %var_d(n_I_diag_startart6569_); 	%var_d(n_I_onart6569_); 		 %var_d(n_I_offart6569_);
%var_d(n_I_onart_lt6m6569_); 	%var_d(n_I_onart_lt6m_nvs6569_); %var_d(n_I_onart_gt6m_nvs6569_);   %var_d(n_I_onart_gt6m_vs6569_);  %var_d(n_I_offart_1stI6569_);
%var_d(n_I_offart_SI6569_); 	%var_d(n_I_offart_SIlt6m6569_);  %var_d(n_I_offart_SIgt6m6569_); 

%var_d(n_I_undiag7074_); 		%var_d(n_I_diag_naive7074_);	 %var_d(n_I_diag_startart7074_); 	%var_d(n_I_onart7074_); 		 %var_d(n_I_offart7074_);
%var_d(n_I_onart_lt6m7074_); 	%var_d(n_I_onart_lt6m_nvs7074_); %var_d(n_I_onart_gt6m_nvs7074_);   %var_d(n_I_onart_gt6m_vs7074_);  %var_d(n_I_offart_1stI7074_);
%var_d(n_I_offart_SI7074_); 	%var_d(n_I_offart_SIlt6m7074_);  %var_d(n_I_offart_SIgt6m7074_); 

%var_d(n_I_undiag7579_); 		%var_d(n_I_diag_naive7579_);	 %var_d(n_I_diag_startart7579_); 	%var_d(n_I_onart7579_); 		 %var_d(n_I_offart7579_);
%var_d(n_I_onart_lt6m7579_); 	%var_d(n_I_onart_lt6m_nvs7579_); %var_d(n_I_onart_gt6m_nvs7579_);   %var_d(n_I_onart_gt6m_vs7579_);  %var_d(n_I_offart_1stI7579_);
%var_d(n_I_offart_SI7579_); 	%var_d(n_I_offart_SIlt6m7579_);  %var_d(n_I_offart_SIgt6m7579_); 

%var_d(n_I_undiag8084_); 		%var_d(n_I_diag_naive8084_);	 %var_d(n_I_diag_startart8084_); 	%var_d(n_I_onart8084_); 		 %var_d(n_I_offart8084_);
%var_d(n_I_onart_lt6m8084_); 	%var_d(n_I_onart_lt6m_nvs8084_); %var_d(n_I_onart_gt6m_nvs8084_);   %var_d(n_I_onart_gt6m_vs8084_);  %var_d(n_I_offart_1stI8084_);
%var_d(n_I_offart_SI8084_); 	%var_d(n_I_offart_SIlt6m8084_);  %var_d(n_I_offart_SIgt6m8084_); 

%var_d(n_I_undiag1519m); 		%var_d(n_I_diag_naive1519m);	 %var_d(n_I_diag_startart1519m); 	%var_d(n_I_onart1519m);	   		%var_d(n_I_offart1519m); 	
%var_d(n_I_onart_lt6m1519m);    %var_d(n_I_onart_lt6m_nvs1519m); %var_d(n_I_onart_gt6m_nvs1519m);	%var_d(n_I_onart_gt6m_vs1519m); %var_d(n_I_offart_1stI1519m);
%var_d(n_I_offart_SI1519m); 	%var_d(n_I_offart_SIlt6m1519m);  %var_d(n_I_offart_SIgt6m1519m); 

%var_d(n_I_undiag2024m); 		%var_d(n_I_diag_naive2024m);	 %var_d(n_I_diag_startart2024m);	%var_d(n_I_onart2024m); 		%var_d(n_I_offart2024m);
%var_d(n_I_onart_lt6m2024m); 	%var_d(n_I_onart_lt6m_nvs2024m); %var_d(n_I_onart_gt6m_nvs2024m);	%var_d(n_I_onart_gt6m_vs2024m); %var_d(n_I_offart_1stI2024m); 
%var_d(n_I_offart_SI2024m); 	%var_d(n_I_offart_SIlt6m2024m);  %var_d(n_I_offart_SIgt6m2024m); 

%var_d(n_I_undiag2529m);		%var_d(n_I_diag_naive2529m); 	 %var_d(n_I_diag_startart2529m); 	%var_d(n_I_onart2529m);			%var_d(n_I_offart2529m);
%var_d(n_I_onart_lt6m2529m); 	%var_d(n_I_onart_lt6m_nvs2529m); %var_d(n_I_onart_gt6m_nvs2529m);   %var_d(n_I_onart_gt6m_vs2529m); %var_d(n_I_offart_1stI2529m); 
%var_d(n_I_offart_SI2529m); 	%var_d(n_I_offart_SIlt6m2529m);  %var_d(n_I_offart_SIgt6m2529m); 

%var_d(n_I_undiag3034m); 		%var_d(n_I_diag_naive3034m); 	 %var_d(n_I_diag_startart3034m); 	%var_d(n_I_onart3034m);			 %var_d(n_I_offart3034m); 
%var_d(n_I_onart_lt6m3034m); 	%var_d(n_I_onart_lt6m_nvs3034m); %var_d(n_I_onart_gt6m_nvs3034m);   %var_d(n_I_onart_gt6m_vs3034m);  %var_d(n_I_offart_1stI3034m); 
%var_d(n_I_offart_SI3034m); 	%var_d(n_I_offart_SIlt6m3034m);  %var_d(n_I_offart_SIgt6m3034m); 

%var_d(n_I_undiag3539m); 		%var_d(n_I_diag_naive3539m);	 %var_d(n_I_diag_startart3539m); 	%var_d(n_I_onart3539m); 		 %var_d(n_I_offart3539m);
%var_d(n_I_onart_lt6m3539m); 	%var_d(n_I_onart_lt6m_nvs3539m); %var_d(n_I_onart_gt6m_nvs3539m);   %var_d(n_I_onart_gt6m_vs3539m);  %var_d(n_I_offart_1stI3539m);
%var_d(n_I_offart_SI3539m); 	%var_d(n_I_offart_SIlt6m3539m);  %var_d(n_I_offart_SIgt6m3539m); 

%var_d(n_I_undiag4044m); 		%var_d(n_I_diag_naive4044m);	 %var_d(n_I_diag_startart4044m); 	%var_d(n_I_onart4044m); 		 %var_d(n_I_offart4044m);
%var_d(n_I_onart_lt6m4044m); 	%var_d(n_I_onart_lt6m_nvs4044m); %var_d(n_I_onart_gt6m_nvs4044m);   %var_d(n_I_onart_gt6m_vs4044m);  %var_d(n_I_offart_1stI4044m);
%var_d(n_I_offart_SI4044m); 	%var_d(n_I_offart_SIlt6m4044m);  %var_d(n_I_offart_SIgt6m4044m); 

%var_d(n_I_undiag4549m); 		%var_d(n_I_diag_naive4549m);	 %var_d(n_I_diag_startart4549m); 	%var_d(n_I_onart4549m); 		 %var_d(n_I_offart4549m);
%var_d(n_I_onart_lt6m4549m); 	%var_d(n_I_onart_lt6m_nvs4549m); %var_d(n_I_onart_gt6m_nvs4549m);   %var_d(n_I_onart_gt6m_vs4549m);  %var_d(n_I_offart_1stI4549m);
%var_d(n_I_offart_SI4549m); 	%var_d(n_I_offart_SIlt6m4549m);  %var_d(n_I_offart_SIgt6m4549m); 

%var_d(n_I_undiag5054m); 		%var_d(n_I_diag_naive5054m);	 %var_d(n_I_diag_startart5054m); 	%var_d(n_I_onart5054m); 		 %var_d(n_I_offart5054m);
%var_d(n_I_onart_lt6m5054m); 	%var_d(n_I_onart_lt6m_nvs5054m); %var_d(n_I_onart_gt6m_nvs5054m);   %var_d(n_I_onart_gt6m_vs5054m);  %var_d(n_I_offart_1stI5054m);
%var_d(n_I_offart_SI5054m); 	%var_d(n_I_offart_SIlt6m5054m);  %var_d(n_I_offart_SIgt6m5054m); 

%var_d(n_I_undiag5559m); 		%var_d(n_I_diag_naive5559m);	 %var_d(n_I_diag_startart5559m); 	%var_d(n_I_onart5559m); 		 %var_d(n_I_offart5559m);
%var_d(n_I_onart_lt6m5559m); 	%var_d(n_I_onart_lt6m_nvs5559m); %var_d(n_I_onart_gt6m_nvs5559m);   %var_d(n_I_onart_gt6m_vs5559m);  %var_d(n_I_offart_1stI5559m);
%var_d(n_I_offart_SI5559m); 	%var_d(n_I_offart_SIlt6m5559m);  %var_d(n_I_offart_SIgt6m5559m); 

%var_d(n_I_undiag6064m); 		%var_d(n_I_diag_naive6064m);	 %var_d(n_I_diag_startart6064m); 	%var_d(n_I_onart6064m); 		 %var_d(n_I_offart6064m);
%var_d(n_I_onart_lt6m6064m); 	%var_d(n_I_onart_lt6m_nvs6064m); %var_d(n_I_onart_gt6m_nvs6064m);   %var_d(n_I_onart_gt6m_vs6064m);  %var_d(n_I_offart_1stI6064m);
%var_d(n_I_offart_SI6064m); 	%var_d(n_I_offart_SIlt6m6064m);  %var_d(n_I_offart_SIgt6m6064m); 

%var_d(n_I_undiag6569m); 		%var_d(n_I_diag_naive6569m);	 %var_d(n_I_diag_startart6569m); 	%var_d(n_I_onart6569m); 		 %var_d(n_I_offart6569m);
%var_d(n_I_onart_lt6m6569m); 	%var_d(n_I_onart_lt6m_nvs6569m); %var_d(n_I_onart_gt6m_nvs6569m);   %var_d(n_I_onart_gt6m_vs6569m);  %var_d(n_I_offart_1stI6569m);
%var_d(n_I_offart_SI6569m); 	%var_d(n_I_offart_SIlt6m6569m);  %var_d(n_I_offart_SIgt6m6569m); 

%var_d(n_I_undiag7074m); 		%var_d(n_I_diag_naive7074m);	 %var_d(n_I_diag_startart7074m); 	%var_d(n_I_onart7074m); 		 %var_d(n_I_offart7074m);
%var_d(n_I_onart_lt6m7074m); 	%var_d(n_I_onart_lt6m_nvs7074m); %var_d(n_I_onart_gt6m_nvs7074m);   %var_d(n_I_onart_gt6m_vs7074m);  %var_d(n_I_offart_1stI7074m);
%var_d(n_I_offart_SI7074m); 	%var_d(n_I_offart_SIlt6m7074m);  %var_d(n_I_offart_SIgt6m7074m); 

%var_d(n_I_undiag7579m); 		%var_d(n_I_diag_naive7579m);	 %var_d(n_I_diag_startart7579m); 	%var_d(n_I_onart7579m); 		 %var_d(n_I_offart7579m);
%var_d(n_I_onart_lt6m7579m); 	%var_d(n_I_onart_lt6m_nvs7579m); %var_d(n_I_onart_gt6m_nvs7579m);   %var_d(n_I_onart_gt6m_vs7579m);  %var_d(n_I_offart_1stI7579m);
%var_d(n_I_offart_SI7579m); 	%var_d(n_I_offart_SIlt6m7579m);  %var_d(n_I_offart_SIgt6m7579m); 

%var_d(n_I_undiag8084m); 		%var_d(n_I_diag_naive8084m);	 %var_d(n_I_diag_startart8084m); 	%var_d(n_I_onart8084m); 		 %var_d(n_I_offart8084m);
%var_d(n_I_onart_lt6m8084m); 	%var_d(n_I_onart_lt6m_nvs8084m); %var_d(n_I_onart_gt6m_nvs8084m);   %var_d(n_I_onart_gt6m_vs8084m);  %var_d(n_I_offart_1stI8084m);
%var_d(n_I_offart_SI8084m); 	%var_d(n_I_offart_SIlt6m8084m);  %var_d(n_I_offart_SIgt6m8084m); 

%var_d(n_I_undiag1519w); 		%var_d(n_I_diag_naive1519w);	 %var_d(n_I_diag_startart1519w); 	%var_d(n_I_onart1519w);	   		%var_d(n_I_offart1519w); 	
%var_d(n_I_onart_lt6m1519w);    %var_d(n_I_onart_lt6m_nvs1519w); %var_d(n_I_onart_gt6m_nvs1519w);	%var_d(n_I_onart_gt6m_vs1519w); %var_d(n_I_offart_1stI1519w);
%var_d(n_I_offart_SI1519w); 	%var_d(n_I_offart_SIlt6m1519w);  %var_d(n_I_offart_SIgt6m1519w); 

%var_d(n_I_undiag2024w); 		%var_d(n_I_diag_naive2024w);	 %var_d(n_I_diag_startart2024w);	%var_d(n_I_onart2024w); 		%var_d(n_I_offart2024w);
%var_d(n_I_onart_lt6m2024w); 	%var_d(n_I_onart_lt6m_nvs2024w); %var_d(n_I_onart_gt6m_nvs2024w);	%var_d(n_I_onart_gt6m_vs2024w); %var_d(n_I_offart_1stI2024w); 
%var_d(n_I_offart_SI2024w); 	%var_d(n_I_offart_SIlt6m2024w);  %var_d(n_I_offart_SIgt6m2024w); 

%var_d(n_I_undiag2529w);		%var_d(n_I_diag_naive2529w); 	 %var_d(n_I_diag_startart2529w); 	%var_d(n_I_onart2529w);			%var_d(n_I_offart2529w);
%var_d(n_I_onart_lt6m2529w); 	%var_d(n_I_onart_lt6m_nvs2529w); %var_d(n_I_onart_gt6m_nvs2529w);   %var_d(n_I_onart_gt6m_vs2529w); %var_d(n_I_offart_1stI2529w); 
%var_d(n_I_offart_SI2529w); 	%var_d(n_I_offart_SIlt6m2529w);  %var_d(n_I_offart_SIgt6m2529w); 

%var_d(n_I_undiag3034w); 		%var_d(n_I_diag_naive3034w); 	 %var_d(n_I_diag_startart3034w); 	%var_d(n_I_onart3034w);			 %var_d(n_I_offart3034w); 
%var_d(n_I_onart_lt6m3034w); 	%var_d(n_I_onart_lt6m_nvs3034w); %var_d(n_I_onart_gt6m_nvs3034w);   %var_d(n_I_onart_gt6m_vs3034w);  %var_d(n_I_offart_1stI3034w); 
%var_d(n_I_offart_SI3034w); 	%var_d(n_I_offart_SIlt6m3034w);  %var_d(n_I_offart_SIgt6m3034w); 

%var_d(n_I_undiag3539w); 		%var_d(n_I_diag_naive3539w);	 %var_d(n_I_diag_startart3539w); 	%var_d(n_I_onart3539w); 		 %var_d(n_I_offart3539w);
%var_d(n_I_onart_lt6m3539w); 	%var_d(n_I_onart_lt6m_nvs3539w); %var_d(n_I_onart_gt6m_nvs3539w);   %var_d(n_I_onart_gt6m_vs3539w);  %var_d(n_I_offart_1stI3539w);
%var_d(n_I_offart_SI3539w); 	%var_d(n_I_offart_SIlt6m3539w);  %var_d(n_I_offart_SIgt6m3539w); 

%var_d(n_I_undiag4044w); 		%var_d(n_I_diag_naive4044w);	 %var_d(n_I_diag_startart4044w); 	%var_d(n_I_onart4044w); 		 %var_d(n_I_offart4044w);
%var_d(n_I_onart_lt6m4044w); 	%var_d(n_I_onart_lt6m_nvs4044w); %var_d(n_I_onart_gt6m_nvs4044w);   %var_d(n_I_onart_gt6m_vs4044w);  %var_d(n_I_offart_1stI4044w);
%var_d(n_I_offart_SI4044w); 	%var_d(n_I_offart_SIlt6m4044w);  %var_d(n_I_offart_SIgt6m4044w); 

%var_d(n_I_undiag4549w); 		%var_d(n_I_diag_naive4549w);	 %var_d(n_I_diag_startart4549w); 	%var_d(n_I_onart4549w); 		 %var_d(n_I_offart4549w);
%var_d(n_I_onart_lt6m4549w); 	%var_d(n_I_onart_lt6m_nvs4549w); %var_d(n_I_onart_gt6m_nvs4549w);   %var_d(n_I_onart_gt6m_vs4549w);  %var_d(n_I_offart_1stI4549w);
%var_d(n_I_offart_SI4549w); 	%var_d(n_I_offart_SIlt6m4549w);  %var_d(n_I_offart_SIgt6m4549w); 

%var_d(n_I_undiag5054w); 		%var_d(n_I_diag_naive5054w);	 %var_d(n_I_diag_startart5054w); 	%var_d(n_I_onart5054w); 		 %var_d(n_I_offart5054w);
%var_d(n_I_onart_lt6m5054w); 	%var_d(n_I_onart_lt6m_nvs5054w); %var_d(n_I_onart_gt6m_nvs5054w);   %var_d(n_I_onart_gt6m_vs5054w);  %var_d(n_I_offart_1stI5054w);
%var_d(n_I_offart_SI5054w); 	%var_d(n_I_offart_SIlt6m5054w);  %var_d(n_I_offart_SIgt6m5054w); 

%var_d(n_I_undiag5559w); 		%var_d(n_I_diag_naive5559w);	 %var_d(n_I_diag_startart5559w); 	%var_d(n_I_onart5559w); 		 %var_d(n_I_offart5559w);
%var_d(n_I_onart_lt6m5559w); 	%var_d(n_I_onart_lt6m_nvs5559w); %var_d(n_I_onart_gt6m_nvs5559w);   %var_d(n_I_onart_gt6m_vs5559w);  %var_d(n_I_offart_1stI5559w);
%var_d(n_I_offart_SI5559w); 	%var_d(n_I_offart_SIlt6m5559w);  %var_d(n_I_offart_SIgt6m5559w); 

%var_d(n_I_undiag6064w); 		%var_d(n_I_diag_naive6064w);	 %var_d(n_I_diag_startart6064w); 	%var_d(n_I_onart6064w); 		 %var_d(n_I_offart6064w);
%var_d(n_I_onart_lt6m6064w); 	%var_d(n_I_onart_lt6m_nvs6064w); %var_d(n_I_onart_gt6m_nvs6064w);   %var_d(n_I_onart_gt6m_vs6064w);  %var_d(n_I_offart_1stI6064w);
%var_d(n_I_offart_SI6064w); 	%var_d(n_I_offart_SIlt6m6064w);  %var_d(n_I_offart_SIgt6m6064w); 

%var_d(n_I_undiag6569w); 		%var_d(n_I_diag_naive6569w);	 %var_d(n_I_diag_startart6569w); 	%var_d(n_I_onart6569w); 		 %var_d(n_I_offart6569w);
%var_d(n_I_onart_lt6m6569w); 	%var_d(n_I_onart_lt6m_nvs6569w); %var_d(n_I_onart_gt6m_nvs6569w);   %var_d(n_I_onart_gt6m_vs6569w);  %var_d(n_I_offart_1stI6569w);
%var_d(n_I_offart_SI6569w); 	%var_d(n_I_offart_SIlt6m6569w);  %var_d(n_I_offart_SIgt6m6569w); 

%var_d(n_I_undiag7074w); 		%var_d(n_I_diag_naive7074w);	 %var_d(n_I_diag_startart7074w); 	%var_d(n_I_onart7074w); 		 %var_d(n_I_offart7074w);
%var_d(n_I_onart_lt6m7074w); 	%var_d(n_I_onart_lt6m_nvs7074w); %var_d(n_I_onart_gt6m_nvs7074w);   %var_d(n_I_onart_gt6m_vs7074w);  %var_d(n_I_offart_1stI7074w);
%var_d(n_I_offart_SI7074w); 	%var_d(n_I_offart_SIlt6m7074w);  %var_d(n_I_offart_SIgt6m7074w); 

%var_d(n_I_undiag7579w); 		%var_d(n_I_diag_naive7579w);	 %var_d(n_I_diag_startart7579w); 	%var_d(n_I_onart7579w); 		 %var_d(n_I_offart7579w);
%var_d(n_I_onart_lt6m7579w); 	%var_d(n_I_onart_lt6m_nvs7579w); %var_d(n_I_onart_gt6m_nvs7579w);   %var_d(n_I_onart_gt6m_vs7579w);  %var_d(n_I_offart_1stI7579w);
%var_d(n_I_offart_SI7579w); 	%var_d(n_I_offart_SIlt6m7579w);  %var_d(n_I_offart_SIgt6m7579w); 

%var_d(n_I_undiag8084w); 		%var_d(n_I_diag_naive8084w);	 %var_d(n_I_diag_startart8084w); 	%var_d(n_I_onart8084w); 		 %var_d(n_I_offart8084w);
%var_d(n_I_onart_lt6m8084w); 	%var_d(n_I_onart_lt6m_nvs8084w); %var_d(n_I_onart_gt6m_nvs8084w);   %var_d(n_I_onart_gt6m_vs8084w);  %var_d(n_I_offart_1stI8084w);
%var_d(n_I_offart_SI8084w); 	%var_d(n_I_offart_SIlt6m8084w);  %var_d(n_I_offart_SIgt6m8084w); 

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
%macro agecat_d(age,mage,wage);
data a.deaths&age;

merge 

l_n_hiv&age	 l_n_hiv&mage	 	l_n_hiv&wage 	/*n_hiv_death1519	n_hiv_death&mage	n_hiv_death&wage*/
l_n_dead_undiag&age				l_n_dead_undiag&mage				l_n_dead_undiag&wage	
l_n_dead_diag_not_linked&age	l_n_dead_diag_not_linked&mage		l_n_dead_diag_not_linked&wage
l_n_dead_Alt6_Acd4lt200&age 	l_n_dead_Alt6_Acd4lt200&mage 		l_n_dead_Alt6_Acd4lt200&wage
l_n_dead_Alt6_Acd4gt200&age		l_n_dead_Alt6_Acd4gt200&mage		l_n_dead_Alt6_Acd4gt200&wage
l_n_d_I_Alt6_Rcd4lt200&age		l_n_d_I_Alt6_Rcd4lt200&mage 		l_n_d_I_Alt6_Rcd4lt200&wage 
l_n_d_I_Alt6_Rcd4gt200&age		l_n_d_I_Alt6_Rcd4gt200&mage 		l_n_d_I_Alt6_Rcd4gt200&wage 
l_n_dead_A_vl1000&age			l_n_dead_A_vl1000&mage				l_n_dead_A_vl1000&wage
l_n_dead_A_vg1000&age			l_n_dead_A_vg1000&mage				l_n_dead_A_vg1000&wage
l_n_dead_Alt6_vl1000&age		l_n_dead_Alt6_vl1000&mage			l_n_dead_Alt6_vl1000&wage
l_n_dead_Alt6_vg1000&age		l_n_dead_Alt6_vg1000&mage			l_n_dead_Alt6_vg1000&wage
l_n_dead_Agt6_vl1000&age		l_n_dead_Agt6_vl1000&mage			l_n_dead_Agt6_vl1000&wage
l_n_dead_Agt6_vg1000&age		l_n_dead_Agt6_vg1000&mage			l_n_dead_Agt6_vg1000&wage
l_n_dead_int_lost&age			l_n_dead_int_lost&mage				l_n_dead_int_lost&wage	
l_n_dead_1stint_lost&age		l_n_dead_1stint_lost&mage			l_n_dead_1stint_lost&wage
l_n_dead_subintlt6_lost&age		l_n_dead_subintlt6_lost&mage		l_n_dead_subintlt6_lost&wage
l_n_dead_subintgt6_lost&age		l_n_dead_subintgt6_lost&mage		l_n_dead_subintgt6_lost&wage
l_n_dead_A_cd4lt200&age			l_n_dead_A_cd4lt200&mage			l_n_dead_A_cd4lt200&wage
l_n_dead_A_cd4gt200&age			l_n_dead_A_cd4gt200&mage			l_n_dead_A_cd4gt200&wage
l_n_dead_Alt6_cd4lt200&age		l_n_dead_Alt6_cd4lt200&mage			l_n_dead_Alt6_cd4lt200&wage
l_n_dead_Alt6_cd4gt200&age		l_n_dead_Alt6_cd4gt200&mage			l_n_dead_Alt6_cd4gt200&wage
l_n_dead_Agt6_cd4lt200&age		l_n_dead_Agt6_cd4lt200&mage 		l_n_dead_Agt6_cd4lt200&wage
l_n_dead_Agt6_cd4gt200&age		l_n_dead_Agt6_cd4gt200&mage 		l_n_dead_Agt6_cd4gt200&wage;
%mend;

%agecat_d(1519_,1519m,1519w); %agecat_d(2024_,2024m,2024w); %agecat_d(2529_,2529m,2529w); %agecat_d(3034_,3034m,3034w);
%agecat_d(3539_,3539m,3539w); %agecat_d(4044_,4044m,4044w); %agecat_d(4549_,4549m,4549w); %agecat_d(5054_,5054m,5054w);
%agecat_d(5559_,5559m,5559w); %agecat_d(6064_,6064m,6064w); %agecat_d(6569_,6569m,6569w); %agecat_d(7074_,7074m,7074w);
%agecat_d(7579_,7579m,7579w); %agecat_d(8084_,8084m,8084w); 


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

***Create datasets that resemble the Excel template. Order these in the same order as the Excel template;
data a.wide_base;
merge 
l_n_alive1564_m		l_n_alive1564_w		l_n_alive1564_  	 l_prevalence1564m 		l_prevalence1564w	l_prevalence1564_   
l_n_primary1564m	l_n_primary1564w	l_n_primary1564_	 	l_p_diag_m		  		l_p_diag_w		    l_p_diag
l_p_onart_diag_m	l_p_onart_diag_w  	l_p_onart_diag  	 l_p_onart_vl1000_m 	l_p_onart_vl1000_w  l_p_onart_vl1000_ 	 
;run;


***This macro creates age-specific datasets which resemble the sheets in Excel; 
%macro agecat_t(age,mage,wage);
data a.trans&age;

merge 

l_n_hiv&age	 l_n_hiv&mage	l_n_hiv&wage 	/*n_inf&age	n_inf&mage	n_inf&wage*/
l_n_I_undiag&age			l_n_I_undiag&mage			l_n_I_undiag&wage
l_n_I_diag_naive&age		l_n_I_diag_naive&mage		l_n_I_diag_naive&wage
l_n_I_diag_startart&age		l_n_I_diag_startart&mage	l_n_I_diag_startart&wage
l_n_I_onart&age				l_n_I_onart&mage			l_n_I_onart&wage
l_n_I_onart_lt6m&age		l_n_I_onart_lt6m&mage		l_n_I_onart_lt6m&wage
l_n_I_onart_lt6m_nvs&age	l_n_I_onart_lt6m_nvs&mage	l_n_I_onart_lt6m_nvs&wage
l_n_I_onart_gt6m_nvs&age	l_n_I_onart_gt6m_nvs&mage	l_n_I_onart_gt6m_nvs&wage
l_n_I_onart_gt6m_vs&age		l_n_I_onart_gt6m_vs&mage	l_n_I_onart_gt6m_vs&wage
l_n_I_offart_1stI&age		l_n_I_offart_1stI&mage		l_n_I_offart_1stI&wage
l_n_I_offart_SI&age			l_n_I_offart_SI&mage		l_n_I_offart_SI&wage
l_n_I_offart_SIlt6m&age		l_n_I_offart_SIlt6m&mage	l_n_I_offart_SIlt6m&wage
l_n_I_offart_SIgt6m&age		l_n_I_offart_SIgt6m&mage	l_n_I_offart_SIgt6m&wage

%mend;

%agecat_t(1519_,1519m,1519w); %agecat_t(2024_,2024m,2024w); %agecat_t(2529_,2529m,2529w); %agecat_t(3034_,3034m,3034w);
%agecat_t(3539_,3539m,3539w); %agecat_t(4044_,4044m,4044w); %agecat_t(4549_,4549m,4549w); %agecat_t(5054_,5054m,5054w);
%agecat_t(5559_,5559m,5559w); %agecat_t(6064_,6064m,6064w); %agecat_t(6569_,6569m,6569w); %agecat_t(7074_,7074m,7074w);
%agecat_t(7579_,7579m,7579w); %agecat_t(8084_,8084m,8084w); 


***This prints to an Excel sheet, starting at row A2/A3. Will need to go into Excel sheet to do final column title edits;
ods listing close;
ods results off;

ods excel file="C:\Loveleen\Synthesis model\Modelling Consortium\Attribution of deaths\Transmissions\Trans Template_HIVSynthesis2.xlsx"
options(sheet_name='base1' start_at='A2');
proc print data=a.wide_base noobs;run;

**This macro avoids having to write out these lines for each age band;
%macro out(age);
ods excel options(sheet_name="trans&age" start_at='A3');
proc print data=a.deaths&age noobs;run;
%mend;

%out(1519_); %out(2024_); %out(2529_); %out(3034_); %out(3539_); %out(4044_); %out(4549_); %out(5054_); %out(5559_);
%out(6064_); %out(6569_); %out(7074_); %out(7579_); %out(8084_);
ods excel close;


