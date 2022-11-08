libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Deaths Malawi\";

data a;
set a.malawi_19;
if run=. then delete;
proc sort;by run;run;
proc freq;table cald;run;

proc freq;table s_dead_undiag;run;

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

* n_alive;						n_alive = s_alive * &sf;
* n_alive_m;					n_alive_m = s_alive_m * &sf;
* n_alive_w;					n_alive_w = s_alive_w * &sf;

* prevalence1564;				prevalence1564 = (s_hiv1564w  + s_hiv1564m ) / (s_alive1564_w + s_alive1564_m);
* prevalence1564m;				prevalence1564m = s_hiv1564m  / s_alive1564_m ;
* prevalence1564w;				prevalence1564w = s_hiv1564w  / s_alive1564_w ;

* incidence1564;                incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1564_m;              incidence1564_m = (s_primary1564m * 4 * 100) / (s_alive1564_m  - s_hiv1564m  + s_primary1564m);
* incidence1564_w;              incidence1564_w = (s_primary1564w * 4 * 100) / (s_alive1564_w  - s_hiv1564w  + s_primary1564w);

* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 



keep cald	run
n_alive			n_alive_m			n_alive_w			prevalence1564		prevalence1564m		prevalence1564w	
incidence1564	incidence1564_m		incidence1564_w		p_diag				p_diag_m			p_diag_w
p_onart_diag	p_onart_diag_m		p_onart_diag_w		p_onart_vl1000		p_onart_vl1000_m	p_onart_vl1000_w

s_dead_undiag  s_dead_diag_not_linked  
s_dead_Alt6_artcd4lt200  s_dead_Alt6_artcd4gt200  
s_dead_int_Alt6_rescd4lt200  s_dead_int_Alt6_rescd4gt200  
s_dead_A_vl1000  s_dead_A_vg1000  s_dead_Alt6_vl1000  s_dead_Alt6_vg1000  
s_dead_Agt6_vl1000  s_dead_Agt6_vg1000  
s_dead_int_lost  s_dead_1stint_lost  s_dead_subintlt6_lost  s_dead_subintgt6_lost  
s_dead_A_cd4lt200  s_dead_A_cd4gt200  
s_dead_Alt6_cd4lt200  s_dead_Alt6_cd4gt200  s_dead_Agt6_cd4lt200  s_dead_Agt6_cd4gt200  

s_dead_undiag_m  s_dead_undiag_w  
s_dead_undiag1519m  s_dead_undiag2024m  s_dead_undiag2529m  s_dead_undiag3034m  s_dead_undiag3539m  
s_dead_undiag4044m  s_dead_undiag4549m  s_dead_undiag5054m  s_dead_undiag5559m  s_dead_undiag6064m  
s_dead_undiag6569m  s_dead_undiag7074m  s_dead_undiag7579m  s_dead_undiag8084m  
s_dead_undiag1519w  s_dead_undiag2024w  s_dead_undiag2529w  s_dead_undiag3034w  s_dead_undiag3539w  
s_dead_undiag4044w  s_dead_undiag4549w  s_dead_undiag5054w  s_dead_undiag5559w  s_dead_undiag6064w  
s_dead_undiag6569w  s_dead_undiag7074w  s_dead_undiag7579w  s_dead_undiag8084w  

s_dead_diag_not_linked_m  s_dead_diag_not_linked_w  
s_dead_diag_not_linked1519m  s_dead_diag_not_linked2024m  s_dead_diag_not_linked2529m  s_dead_diag_not_linked3034m  s_dead_diag_not_linked3539m  
s_dead_diag_not_linked4044m  s_dead_diag_not_linked4549m  s_dead_diag_not_linked5054m  s_dead_diag_not_linked5559m  s_dead_diag_not_linked6064m  
s_dead_diag_not_linked6569m  s_dead_diag_not_linked7074m  s_dead_diag_not_linked7579m  s_dead_diag_not_linked8084m  
s_dead_diag_not_linked1519w  s_dead_diag_not_linked2024w  s_dead_diag_not_linked2529w  s_dead_diag_not_linked3034w  s_dead_diag_not_linked3539w  
s_dead_diag_not_linked4044w  s_dead_diag_not_linked4549w  s_dead_diag_not_linked5054w  s_dead_diag_not_linked5559w  s_dead_diag_not_linked6064w  
s_dead_diag_not_linked6569w  s_dead_diag_not_linked7074w  s_dead_diag_not_linked7579w  s_dead_diag_not_linked8084w  

s_dead_Alt6_artcd4lt200_m  s_dead_Alt6_artcd4lt200_w  
s_dead_Alt6_artcd4lt2001519m  s_dead_Alt6_artcd4lt2002024m  s_dead_Alt6_artcd4lt2002529m  s_dead_Alt6_artcd4lt2003034m  s_dead_Alt6_artcd4lt2003539m  
s_dead_Alt6_artcd4lt2004044m  s_dead_Alt6_artcd4lt2004549m  s_dead_Alt6_artcd4lt2005054m  s_dead_Alt6_artcd4lt2005559m  s_dead_Alt6_artcd4lt2006064m  
s_dead_Alt6_artcd4lt2006569m  s_dead_Alt6_artcd4lt2007074m  s_dead_Alt6_artcd4lt2007579m  s_dead_Alt6_artcd4lt2008084m  
s_dead_Alt6_artcd4lt2001519w  s_dead_Alt6_artcd4lt2002024w  s_dead_Alt6_artcd4lt2002529w  s_dead_Alt6_artcd4lt2003034w  s_dead_Alt6_artcd4lt2003539w  
s_dead_Alt6_artcd4lt2004044w  s_dead_Alt6_artcd4lt2004549w  s_dead_Alt6_artcd4lt2005054w  s_dead_Alt6_artcd4lt2005559w  s_dead_Alt6_artcd4lt2006064w  
s_dead_Alt6_artcd4lt2006569w  s_dead_Alt6_artcd4lt2007074w  s_dead_Alt6_artcd4lt2007579w  s_dead_Alt6_artcd4lt2008084w  

s_dead_Alt6_artcd4gt200_m  s_dead_Alt6_artcd4gt200_w  
s_dead_Alt6_artcd4gt2001519m  s_dead_Alt6_artcd4gt2002024m  s_dead_Alt6_artcd4gt2002529m  s_dead_Alt6_artcd4gt2003034m  s_dead_Alt6_artcd4gt2003539m  
s_dead_Alt6_artcd4gt2004044m  s_dead_Alt6_artcd4gt2004549m  s_dead_Alt6_artcd4gt2005054m  s_dead_Alt6_artcd4gt2005559m  s_dead_Alt6_artcd4gt2006064m  
s_dead_Alt6_artcd4gt2006569m  s_dead_Alt6_artcd4gt2007074m  s_dead_Alt6_artcd4gt2007579m  s_dead_Alt6_artcd4gt2008084m  
s_dead_Alt6_artcd4gt2001519w  s_dead_Alt6_artcd4gt2002024w  s_dead_Alt6_artcd4gt2002529w  s_dead_Alt6_artcd4gt2003034w  s_dead_Alt6_artcd4gt2003539w  
s_dead_Alt6_artcd4gt2004044w  s_dead_Alt6_artcd4gt2004549w  s_dead_Alt6_artcd4gt2005054w  s_dead_Alt6_artcd4gt2005559w  s_dead_Alt6_artcd4gt2006064w  
s_dead_Alt6_artcd4gt2006569w  s_dead_Alt6_artcd4gt2007074w  s_dead_Alt6_artcd4gt2007579w  s_dead_Alt6_artcd4gt2008084w  

s_dead_I_Alt6_Rcd4lt200_m  s_dead_I_Alt6_Rcd4lt200_w  
s_dead_I_Alt6_Rcd4lt2001519m  s_dead_I_Alt6_Rcd4lt2002024m  s_dead_I_Alt6_Rcd4lt2002529m  s_dead_I_Alt6_Rcd4lt2003034m  s_dead_I_Alt6_Rcd4lt2003539m  
s_dead_I_Alt6_Rcd4lt2004044m  s_dead_I_Alt6_Rcd4lt2004549m  s_dead_I_Alt6_Rcd4lt2005054m  s_dead_I_Alt6_Rcd4lt2005559m   s_dead_I_Alt6_Rcd4lt2006064m  
s_dead_I_Alt6_Rcd4lt2006569m  s_dead_I_Alt6_Rcd4lt2007074m  s_dead_I_Alt6_Rcd4lt2007579m  s_dead_I_Alt6_Rcd4lt2008084m  
s_dead_I_Alt6_Rcd4lt2001519w  s_dead_I_Alt6_Rcd4lt2002024w  s_dead_I_Alt6_Rcd4lt2002529w  s_dead_I_Alt6_Rcd4lt2003034w  s_dead_I_Alt6_Rcd4lt2003539w  
s_dead_I_Alt6_Rcd4lt2004044w  s_dead_I_Alt6_Rcd4lt2004549w  s_dead_I_Alt6_Rcd4lt2005054w  s_dead_I_Alt6_Rcd4lt2005559w   s_dead_I_Alt6_Rcd4lt2006064w  
s_dead_I_Alt6_Rcd4lt2006569w  s_dead_I_Alt6_Rcd4lt2007074w  s_dead_I_Alt6_Rcd4lt2007579w  s_dead_I_Alt6_Rcd4lt2008084w  

s_dead_I_Alt6_Rcd4gt200_m  s_dead_I_Alt6_Rcd4gt200_w  
s_dead_I_Alt6_Rcd4gt2001519m  s_dead_I_Alt6_Rcd4gt2002024m  s_dead_I_Alt6_Rcd4gt2002529m  s_dead_I_Alt6_Rcd4gt2003034m  s_dead_I_Alt6_Rcd4gt2003539m  
s_dead_I_Alt6_Rcd4gt2004044m  s_dead_I_Alt6_Rcd4gt2004549m  s_dead_I_Alt6_Rcd4gt2005054m  s_dead_I_Alt6_Rcd4gt2005559m   s_dead_I_Alt6_Rcd4gt2006064m  
s_dead_I_Alt6_Rcd4gt2006569m  s_dead_I_Alt6_Rcd4gt2007074m  s_dead_I_Alt6_Rcd4gt2007579m  s_dead_I_Alt6_Rcd4gt2008084m  
s_dead_I_Alt6_Rcd4gt2001519w  s_dead_I_Alt6_Rcd4gt2002024w  s_dead_I_Alt6_Rcd4gt2002529w  s_dead_I_Alt6_Rcd4gt2003034w  s_dead_I_Alt6_Rcd4gt2003539w  
s_dead_I_Alt6_Rcd4gt2004044w  s_dead_I_Alt6_Rcd4gt2004549w  s_dead_I_Alt6_Rcd4gt2005054w  s_dead_I_Alt6_Rcd4gt2005559w   s_dead_I_Alt6_Rcd4gt2006064w  
s_dead_I_Alt6_Rcd4gt2006569w  s_dead_I_Alt6_Rcd4gt2007074w  s_dead_I_Alt6_Rcd4gt2007579w  s_dead_I_Alt6_Rcd4gt2008084w  

s_dead_A_vl1000_m  s_dead_A_vl1000_w  
s_dead_A_vl10001519m  s_dead_A_vl10002024m  s_dead_A_vl10002529m  s_dead_A_vl10003034m  s_dead_A_vl10003539m  
s_dead_A_vl10004044m  s_dead_A_vl10004549m  s_dead_A_vl10005054m  s_dead_A_vl10005559m  s_dead_A_vl10006064m  
s_dead_A_vl10006569m  s_dead_A_vl10007074m  s_dead_A_vl10007579m   s_dead_A_vl10008084m  
s_dead_A_vl10001519w  s_dead_A_vl10002024w  s_dead_A_vl10002529w  s_dead_A_vl10003034w  s_dead_A_vl10003539w  
s_dead_A_vl10004044w  s_dead_A_vl10004549w  s_dead_A_vl10005054w  s_dead_A_vl10005559w  s_dead_A_vl10006064w  
s_dead_A_vl10006569w  s_dead_A_vl10007074w  s_dead_A_vl10007579w   s_dead_A_vl10008084w  

s_dead_A_vg1000_m  s_dead_A_vg1000_w  
s_dead_A_vg10001519m  s_dead_A_vg10002024m  s_dead_A_vg10002529m  s_dead_A_vg10003034m  s_dead_A_vg10003539m  
s_dead_A_vg10004044m  s_dead_A_vg10004549m  s_dead_A_vg10005054m  s_dead_A_vg10005559m  s_dead_A_vg10006064m  
s_dead_A_vg10006569m  s_dead_A_vg10007074m  s_dead_A_vg10007579m   s_dead_A_vg10008084m  
s_dead_A_vg10001519w  s_dead_A_vg10002024w  s_dead_A_vg10002529w  s_dead_A_vg10003034w  s_dead_A_vg10003539w  
s_dead_A_vg10004044w  s_dead_A_vg10004549w  s_dead_A_vg10005054w  s_dead_A_vg10005559w  s_dead_A_vg10006064w  
s_dead_A_vg10006569w  s_dead_A_vg10007074w  s_dead_A_vg10007579w   s_dead_A_vg10008084w  

s_dead_Alt6_vl1000_m  s_dead_Alt6_vl1000_w  
s_dead_Alt6_vl10001519m  s_dead_Alt6_vl10002024m  s_dead_Alt6_vl10002529m  s_dead_Alt6_vl10003034m  s_dead_Alt6_vl10003539m  
s_dead_Alt6_vl10004044m  s_dead_Alt6_vl10004549m  s_dead_Alt6_vl10005054m  s_dead_Alt6_vl10005559m  s_dead_Alt6_vl10006064m  
s_dead_Alt6_vl10006569m  s_dead_Alt6_vl10007074m  s_dead_Alt6_vl10007579m   s_dead_Alt6_vl10008084m  
s_dead_Alt6_vl10001519w  s_dead_Alt6_vl10002024w  s_dead_Alt6_vl10002529w  s_dead_Alt6_vl10003034w  s_dead_Alt6_vl10003539w  
s_dead_Alt6_vl10004044w  s_dead_Alt6_vl10004549w  s_dead_Alt6_vl10005054w  s_dead_Alt6_vl10005559w  s_dead_Alt6_vl10006064w  
s_dead_Alt6_vl10006569w  s_dead_Alt6_vl10007074w  s_dead_Alt6_vl10007579w   s_dead_Alt6_vl10008084w  

s_dead_Alt6_vg1000_m  s_dead_Alt6_vg1000_w  
s_dead_Alt6_vg10001519m  s_dead_Alt6_vg10002024m  s_dead_Alt6_vg10002529m  s_dead_Alt6_vg10003034m  s_dead_Alt6_vg10003539m  
s_dead_Alt6_vg10004044m  s_dead_Alt6_vg10004549m  s_dead_Alt6_vg10005054m  s_dead_Alt6_vg10005559m  s_dead_Alt6_vg10006064m  
s_dead_Alt6_vg10006569m  s_dead_Alt6_vg10007074m  s_dead_Alt6_vg10007579m   s_dead_Alt6_vg10008084m  
s_dead_Alt6_vg10001519w  s_dead_Alt6_vg10002024w  s_dead_Alt6_vg10002529w  s_dead_Alt6_vg10003034w  s_dead_Alt6_vg10003539w  
s_dead_Alt6_vg10004044w  s_dead_Alt6_vg10004549w  s_dead_Alt6_vg10005054w  s_dead_Alt6_vg10005559w  s_dead_Alt6_vg10006064w  
s_dead_Alt6_vg10006569w  s_dead_Alt6_vg10007074w  s_dead_Alt6_vg10007579w   s_dead_Alt6_vg10008084w  

s_dead_Agt6_vl1000_m  s_dead_Agt6_vl1000_w  
s_dead_Agt6_vl10001519m  s_dead_Agt6_vl10002024m  s_dead_Agt6_vl10002529m  s_dead_Agt6_vl10003034m  s_dead_Agt6_vl10003539m  
s_dead_Agt6_vl10004044m  s_dead_Agt6_vl10004549m  s_dead_Agt6_vl10005054m  s_dead_Agt6_vl10005559m  s_dead_Agt6_vl10006064m  
s_dead_Agt6_vl10006569m  s_dead_Agt6_vl10007074m  s_dead_Agt6_vl10007579m   s_dead_Agt6_vl10008084m  
s_dead_Agt6_vl10001519w  s_dead_Agt6_vl10002024w  s_dead_Agt6_vl10002529w  s_dead_Agt6_vl10003034w  s_dead_Agt6_vl10003539w  
s_dead_Agt6_vl10004044w  s_dead_Agt6_vl10004549w  s_dead_Agt6_vl10005054w  s_dead_Agt6_vl10005559w  s_dead_Agt6_vl10006064w  
s_dead_Agt6_vl10006569w  s_dead_Agt6_vl10007074w  s_dead_Agt6_vl10007579w   s_dead_Agt6_vl10008084w  

s_dead_Agt6_vg1000_m  s_dead_Agt6_vg1000_w  
s_dead_Agt6_vg10001519m  s_dead_Agt6_vg10002024m  s_dead_Agt6_vg10002529m  s_dead_Agt6_vg10003034m  s_dead_Agt6_vg10003539m  
s_dead_Agt6_vg10004044m  s_dead_Agt6_vg10004549m  s_dead_Agt6_vg10005054m  s_dead_Agt6_vg10005559m  s_dead_Agt6_vg10006064m  
s_dead_Agt6_vg10006569m  s_dead_Agt6_vg10007074m  s_dead_Agt6_vg10007579m   s_dead_Agt6_vg10008084m  
s_dead_Agt6_vg10001519w  s_dead_Agt6_vg10002024w  s_dead_Agt6_vg10002529w  s_dead_Agt6_vg10003034w  s_dead_Agt6_vg10003539w  
s_dead_Agt6_vg10004044w  s_dead_Agt6_vg10004549w  s_dead_Agt6_vg10005054w  s_dead_Agt6_vg10005559w  s_dead_Agt6_vg10006064w  
s_dead_Agt6_vg10006569w  s_dead_Agt6_vg10007074w  s_dead_Agt6_vg10007579w   s_dead_Agt6_vg10008084w  

s_dead_int_lost_m  s_dead_int_lost_w  
s_dead_int_lost1519m  s_dead_int_lost2024m  s_dead_int_lost2529m  s_dead_int_lost3034m  s_dead_int_lost3539m  
s_dead_int_lost4044m  s_dead_int_lost4549m  s_dead_int_lost5054m  s_dead_int_lost5559m  s_dead_int_lost6064m  
s_dead_int_lost6569m  s_dead_int_lost7074m  s_dead_int_lost7579m  s_dead_int_lost8084m  
s_dead_int_lost1519w  s_dead_int_lost2024w  s_dead_int_lost2529w  s_dead_int_lost3034w  s_dead_int_lost3539w  
s_dead_int_lost4044w  s_dead_int_lost4549w  s_dead_int_lost5054w  s_dead_int_lost5559w  s_dead_int_lost6064w  
s_dead_int_lost6569w  s_dead_int_lost7074w  s_dead_int_lost7579w  s_dead_int_lost8084w  

s_dead_1stint_lost_m  s_dead_1stint_lost_w  
s_dead_1stint_lost1519m  s_dead_1stint_lost2024m  s_dead_1stint_lost2529m  s_dead_1stint_lost3034m  s_dead_1stint_lost3539m  
s_dead_1stint_lost4044m  s_dead_1stint_lost4549m  s_dead_1stint_lost5054m  s_dead_1stint_lost5559m  s_dead_1stint_lost6064m  
s_dead_1stint_lost6569m  s_dead_1stint_lost7074m  s_dead_1stint_lost7579m  s_dead_1stint_lost8084m  
s_dead_1stint_lost1519w  s_dead_1stint_lost2024w  s_dead_1stint_lost2529w  s_dead_1stint_lost3034w  s_dead_1stint_lost3539w  
s_dead_1stint_lost4044w  s_dead_1stint_lost4549w  s_dead_1stint_lost5054w  s_dead_1stint_lost5559w  s_dead_1stint_lost6064w  
s_dead_1stint_lost6569w  s_dead_1stint_lost7074w  s_dead_1stint_lost7579w  s_dead_1stint_lost8084w  

s_dead_subintlt6_lost_m  s_dead_subintlt6_lost_w  
s_dead_subintlt6_lost1519m  s_dead_subintlt6_lost2024m  s_dead_subintlt6_lost2529m  s_dead_subintlt6_lost3034m  s_dead_subintlt6_lost3539m  
s_dead_subintlt6_lost4044m  s_dead_subintlt6_lost4549m  s_dead_subintlt6_lost5054m  s_dead_subintlt6_lost5559m  s_dead_subintlt6_lost6064m  
s_dead_subintlt6_lost6569m  s_dead_subintlt6_lost7074m  s_dead_subintlt6_lost7579m  s_dead_subintlt6_lost8084m  
s_dead_subintlt6_lost1519w  s_dead_subintlt6_lost2024w  s_dead_subintlt6_lost2529w  s_dead_subintlt6_lost3034w  s_dead_subintlt6_lost3539w  
s_dead_subintlt6_lost4044w  s_dead_subintlt6_lost4549w  s_dead_subintlt6_lost5054w  s_dead_subintlt6_lost5559w  s_dead_subintlt6_lost6064w  
s_dead_subintlt6_lost6569w  s_dead_subintlt6_lost7074w  s_dead_subintlt6_lost7579w  s_dead_subintlt6_lost8084w  

s_dead_subintgt6_lost_m  s_dead_subintgt6_lost_w  
s_dead_subintgt6_lost1519m  s_dead_subintgt6_lost2024m  s_dead_subintgt6_lost2529m  s_dead_subintgt6_lost3034m  s_dead_subintgt6_lost3539m  
s_dead_subintgt6_lost4044m  s_dead_subintgt6_lost4549m  s_dead_subintgt6_lost5054m  s_dead_subintgt6_lost5559m  s_dead_subintgt6_lost6064m  
s_dead_subintgt6_lost6569m  s_dead_subintgt6_lost7074m  s_dead_subintgt6_lost7579m  s_dead_subintgt6_lost8084m  
s_dead_subintgt6_lost1519w  s_dead_subintgt6_lost2024w  s_dead_subintgt6_lost2529w  s_dead_subintgt6_lost3034w  s_dead_subintgt6_lost3539w  
s_dead_subintgt6_lost4044w  s_dead_subintgt6_lost4549w  s_dead_subintgt6_lost5054w  s_dead_subintgt6_lost5559w  s_dead_subintgt6_lost6064w  
s_dead_subintgt6_lost6569w  s_dead_subintgt6_lost7074w  s_dead_subintgt6_lost7579w  s_dead_subintgt6_lost8084w  

s_dead_A_cd4lt200_m  s_dead_A_cd4lt200_w  
s_dead_A_cd4lt2001519m  s_dead_A_cd4lt2002024m  s_dead_A_cd4lt2002529m  s_dead_A_cd4lt2003034m  s_dead_A_cd4lt2003539m  
s_dead_A_cd4lt2004044m  s_dead_A_cd4lt2004549m  s_dead_A_cd4lt2005054m  s_dead_A_cd4lt2005559m  s_dead_A_cd4lt2006064m  
s_dead_A_cd4lt2006569m  s_dead_A_cd4lt2007074m  s_dead_A_cd4lt2007579m  s_dead_A_cd4lt2008084m  
s_dead_A_cd4lt2001519w  s_dead_A_cd4lt2002024w  s_dead_A_cd4lt2002529w  s_dead_A_cd4lt2003034w  s_dead_A_cd4lt2003539w  
s_dead_A_cd4lt2004044w  s_dead_A_cd4lt2004549w  s_dead_A_cd4lt2005054w  s_dead_A_cd4lt2005559w  s_dead_A_cd4lt2006064w  
s_dead_A_cd4lt2006569w  s_dead_A_cd4lt2007074w  s_dead_A_cd4lt2007579w  s_dead_A_cd4lt2008084w  

s_dead_A_cd4gt200_m  s_dead_A_cd4gt200_w  
s_dead_A_cd4gt2001519m  s_dead_A_cd4gt2002024m  s_dead_A_cd4gt2002529m  s_dead_A_cd4gt2003034m  s_dead_A_cd4gt2003539m  
s_dead_A_cd4gt2004044m  s_dead_A_cd4gt2004549m  s_dead_A_cd4gt2005054m  s_dead_A_cd4gt2005559m  s_dead_A_cd4gt2006064m  
s_dead_A_cd4gt2006569m  s_dead_A_cd4gt2007074m  s_dead_A_cd4gt2007579m  s_dead_A_cd4gt2008084m  
s_dead_A_cd4gt2001519w  s_dead_A_cd4gt2002024w  s_dead_A_cd4gt2002529w  s_dead_A_cd4gt2003034w  s_dead_A_cd4gt2003539w  
s_dead_A_cd4gt2004044w  s_dead_A_cd4gt2004549w  s_dead_A_cd4gt2005054w  s_dead_A_cd4gt2005559w  s_dead_A_cd4gt2006064w  
s_dead_A_cd4gt2006569w  s_dead_A_cd4gt2007074w  s_dead_A_cd4gt2007579w  s_dead_A_cd4gt2008084w  

s_dead_Alt6_cd4lt200_m  s_dead_Alt6_cd4lt200_w  
s_dead_Alt6_cd4lt2001519m  s_dead_Alt6_cd4lt2002024m  s_dead_Alt6_cd4lt2002529m  s_dead_Alt6_cd4lt2003034m  s_dead_Alt6_cd4lt2003539m  
s_dead_Alt6_cd4lt2004044m  s_dead_Alt6_cd4lt2004549m  s_dead_Alt6_cd4lt2005054m  s_dead_Alt6_cd4lt2005559m  s_dead_Alt6_cd4lt2006064m  
s_dead_Alt6_cd4lt2006569m  s_dead_Alt6_cd4lt2007074m  s_dead_Alt6_cd4lt2007579m  s_dead_Alt6_cd4lt2008084m  
s_dead_Alt6_cd4lt2001519w  s_dead_Alt6_cd4lt2002024w  s_dead_Alt6_cd4lt2002529w  s_dead_Alt6_cd4lt2003034w  s_dead_Alt6_cd4lt2003539w  
s_dead_Alt6_cd4lt2004044w  s_dead_Alt6_cd4lt2004549w  s_dead_Alt6_cd4lt2005054w  s_dead_Alt6_cd4lt2005559w  s_dead_Alt6_cd4lt2006064w  
s_dead_Alt6_cd4lt2006569w  s_dead_Alt6_cd4lt2007074w  s_dead_Alt6_cd4lt2007579w  s_dead_Alt6_cd4lt2008084w  

s_dead_Alt6_cd4gt200_m  s_dead_Alt6_cd4gt200_w  
s_dead_Alt6_cd4gt2001519m  s_dead_Alt6_cd4gt2002024m  s_dead_Alt6_cd4gt2002529m  s_dead_Alt6_cd4gt2003034m  s_dead_Alt6_cd4gt2003539m  
s_dead_Alt6_cd4gt2004044m  s_dead_Alt6_cd4gt2004549m  s_dead_Alt6_cd4gt2005054m  s_dead_Alt6_cd4gt2005559m  s_dead_Alt6_cd4gt2006064m  
s_dead_Alt6_cd4gt2006569m  s_dead_Alt6_cd4gt2007074m  s_dead_Alt6_cd4gt2007579m  s_dead_Alt6_cd4gt2008084m  
s_dead_Alt6_cd4gt2001519w  s_dead_Alt6_cd4gt2002024w  s_dead_Alt6_cd4gt2002529w  s_dead_Alt6_cd4gt2003034w  s_dead_Alt6_cd4gt2003539w  
s_dead_Alt6_cd4gt2004044w  s_dead_Alt6_cd4gt2004549w  s_dead_Alt6_cd4gt2005054w  s_dead_Alt6_cd4gt2005559w  s_dead_Alt6_cd4gt2006064w  
s_dead_Alt6_cd4gt2006569w  s_dead_Alt6_cd4gt2007074w  s_dead_Alt6_cd4gt2007579w  s_dead_Alt6_cd4gt2008084w  

s_dead_Agt6_cd4lt200_m  s_dead_Agt6_cd4lt200_w  
s_dead_Agt6_cd4lt2001519m  s_dead_Agt6_cd4lt2002024m  s_dead_Agt6_cd4lt2002529m  s_dead_Agt6_cd4lt2003034m  s_dead_Agt6_cd4lt2003539m  
s_dead_Agt6_cd4lt2004044m  s_dead_Agt6_cd4lt2004549m  s_dead_Agt6_cd4lt2005054m  s_dead_Agt6_cd4lt2005559m  s_dead_Agt6_cd4lt2006064m  
s_dead_Agt6_cd4lt2006569m  s_dead_Agt6_cd4lt2007074m  s_dead_Agt6_cd4lt2007579m  s_dead_Agt6_cd4lt2008084m  
s_dead_Agt6_cd4lt2001519w  s_dead_Agt6_cd4lt2002024w  s_dead_Agt6_cd4lt2002529w  s_dead_Agt6_cd4lt2003034w  s_dead_Agt6_cd4lt2003539w  
s_dead_Agt6_cd4lt2004044w  s_dead_Agt6_cd4lt2004549w  s_dead_Agt6_cd4lt2005054w  s_dead_Agt6_cd4lt2005559w  s_dead_Agt6_cd4lt2006064w  
s_dead_Agt6_cd4lt2006569w  s_dead_Agt6_cd4lt2007074w  s_dead_Agt6_cd4lt2007579w  s_dead_Agt6_cd4lt2008084w  

s_dead_Agt6_cd4gt200_m  s_dead_Agt6_cd4gt200_w  
s_dead_Agt6_cd4gt2001519m  s_dead_Agt6_cd4gt2002024m  s_dead_Agt6_cd4gt2002529m  s_dead_Agt6_cd4gt2003034m  s_dead_Agt6_cd4gt2003539m  
s_dead_Agt6_cd4gt2004044m  s_dead_Agt6_cd4gt2004549m  s_dead_Agt6_cd4gt2005054m  s_dead_Agt6_cd4gt2005559m  s_dead_Agt6_cd4gt2006064m  
s_dead_Agt6_cd4gt2006569m  s_dead_Agt6_cd4gt2007074m  s_dead_Agt6_cd4gt2007579m  s_dead_Agt6_cd4gt2008084m  
s_dead_Agt6_cd4gt2001519w  s_dead_Agt6_cd4gt2002024w  s_dead_Agt6_cd4gt2002529w  s_dead_Agt6_cd4gt2003034w  s_dead_Agt6_cd4gt2003539w  
s_dead_Agt6_cd4gt2004044w  s_dead_Agt6_cd4gt2004549w  s_dead_Agt6_cd4gt2005054w  s_dead_Agt6_cd4gt2005559w  s_dead_Agt6_cd4gt2006064w  
s_dead_Agt6_cd4gt2006569w  s_dead_Agt6_cd4gt2007074w  s_dead_Agt6_cd4gt2007579w  s_dead_Agt6_cd4gt2008084w  ;
run;

proc freq;table  s_dead_undiag  s_dead_diag_not_linked  
s_dead_Alt6_artcd4lt200  s_dead_Alt6_artcd4gt200  
s_dead_int_Alt6_rescd4lt200  s_dead_int_Alt6_rescd4gt200  
s_dead_A_vl1000  s_dead_A_vg1000  s_dead_Alt6_vl1000  s_dead_Alt6_vg1000  
s_dead_Agt6_vl1000  s_dead_Agt6_vg1000  
s_dead_int_lost  s_dead_1stint_lost  s_dead_subintlt6_lost  s_dead_subintgt6_lost  
s_dead_A_cd4lt200  s_dead_A_cd4gt200  
s_dead_Alt6_cd4lt200  s_dead_Alt6_cd4gt200  s_dead_Agt6_cd4lt200  s_dead_Agt6_cd4gt200  ;run;

data b; 
set y;
  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

proc means  noprint data=y; var &v; output out=y_00 mean= &v._00; by run ; where 2000 <= cald < 2001; 
proc means  noprint data=y; var &v; output out=y_01 mean= &v._01; by run ; where 2001 <= cald < 2002; 
proc means  noprint data=y; var &v; output out=y_02 mean= &v._02; by run ; where 2002 <= cald < 2003; 
proc means  noprint data=y; var &v; output out=y_03 mean= &v._03; by run ; where 2003 <= cald < 2004; 
proc means  noprint data=y; var &v; output out=y_04 mean= &v._04; by run ; where 2004 <= cald < 2005; 
proc means  noprint data=y; var &v; output out=y_05 mean= &v._05; by run ; where 2005 <= cald < 2006; 
proc means  noprint data=y; var &v; output out=y_06 mean= &v._06; by run ; where 2006 <= cald < 2007; 
proc means  noprint data=y; var &v; output out=y_07 mean= &v._07; by run ; where 2007 <= cald < 2008; 
proc means  noprint data=y; var &v; output out=y_08 mean= &v._08; by run ; where 2008 <= cald < 2009; 
proc means  noprint data=y; var &v; output out=y_09 mean= &v._09; by run ; where 2009 <= cald < 2010; 
proc means  noprint data=y; var &v; output out=y_10 mean= &v._10; by run ; where 2010 <= cald < 2011; 
proc means  noprint data=y; var &v; output out=y_11 mean= &v._11; by run ; where 2011 <= cald < 2012; 
proc means  noprint data=y; var &v; output out=y_12 mean= &v._12; by run ; where 2012 <= cald < 2013; 
proc means  noprint data=y; var &v; output out=y_13 mean= &v._13; by run ; where 2013 <= cald < 2014; 
proc means  noprint data=y; var &v; output out=y_14 mean= &v._14; by run ; where 2014 <= cald < 2015; 
proc means  noprint data=y; var &v; output out=y_15 mean= &v._15; by run ; where 2015 <= cald < 2016; 
proc means  noprint data=y; var &v; output out=y_16 mean= &v._16; by run ; where 2016 <= cald < 2017; 
proc means  noprint data=y; var &v; output out=y_17 mean= &v._17; by run ; where 2017 <= cald < 2018; 
proc means  noprint data=y; var &v; output out=y_18 mean= &v._18; by run ; where 2018 <= cald < 2019; 
proc means  noprint data=y; var &v; output out=y_19 mean= &v._19; by run ; where 2019 <= cald < 2020; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run ; where 2020 <= cald < 2021; 
proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2021 <= cald < 2022;
proc means  noprint data=y; var &v; output out=y_22 mean= &v._22; by run ; where 2022 <= cald < 2023; 
proc means  noprint data=y; var &v; output out=y_23 mean= &v._23; by run ; where 2023 <= cald < 2024;
proc means  noprint data=y; var &v; output out=y_24 mean= &v._24; by run ; where 2024 <= cald < 2025;
proc means  noprint data=y; var &v; output out=y_25 mean= &v._25; by run ; where 2025 <= cald < 2026;
proc means  noprint data=y; var &v; output out=y_26 mean= &v._26; by run ; where 2026 <= cald < 2027;
proc means  noprint data=y; var &v; output out=y_27 mean= &v._27; by run ; where 2027 <= cald < 2028;
proc means  noprint data=y; var &v; output out=y_28 mean= &v._28; by run ; where 2028 <= cald < 2029;
proc means  noprint data=y; var &v; output out=y_29 mean= &v._29; by run ; where 2029 <= cald < 2030;
proc means  noprint data=y; var &v; output out=y_30 mean= &v._30; by run ; where 2030 <= cald < 2031;
proc means  noprint data=y; var &v; output out=y_31 mean= &v._31; by run ; where 2031 <= cald < 2032;
proc means  noprint data=y; var &v; output out=y_32 mean= &v._32; by run ; where 2032 <= cald < 2033;
proc means  noprint data=y; var &v; output out=y_33 mean= &v._33; by run ; where 2033 <= cald < 2034;
proc means  noprint data=y; var &v; output out=y_34 mean= &v._34; by run ; where 2034 <= cald < 2035;
proc means  noprint data=y; var &v; output out=y_35 mean= &v._35; by run ; where 2035 <= cald < 2036;
proc means  noprint data=y; var &v; output out=y_36 mean= &v._36; by run ; where 2036 <= cald < 2037;
proc means  noprint data=y; var &v; output out=y_37 mean= &v._37; by run ; where 2037 <= cald < 2038;
proc means  noprint data=y; var &v; output out=y_38 mean= &v._38; by run ; where 2038 <= cald < 2039;
proc means  noprint data=y; var &v; output out=y_39 mean= &v._39; by run ; where 2039 <= cald < 2040;
proc means  noprint data=y; var &v; output out=y_40 mean= &v._40; by run ; where 2040 <= cald < 2041;
proc means  noprint data=y; var &v; output out=y_41 mean= &v._41; by run ; where 2041 <= cald < 2042;
proc means  noprint data=y; var &v; output out=y_42 mean= &v._42; by run ; where 2042 <= cald < 2043;
proc means  noprint data=y; var &v; output out=y_43 mean= &v._43; by run ; where 2043 <= cald < 2044;
proc means  noprint data=y; var &v; output out=y_44 mean= &v._44; by run ; where 2044 <= cald < 2045;
proc means  noprint data=y; var &v; output out=y_45 mean= &v._45; by run ; where 2045 <= cald < 2046;


data &v ; merge

y_00 y_01 y_02 y_03 y_04 y_05 y_06 y_07 y_08 y_09 y_10 y_11 y_12 y_13 y_14 y_15 y_16 y_17 y_18 y_19 y_20 
y_21 y_22 y_23 y_24 y_25 y_26 y_27 y_28 y_29 y_30 y_31 y_32 y_33 y_34 y_35 y_36 y_37 y_38 y_39 y_40 y_41
y_42 y_43 y_44 y_45;

drop _NAME_ _TYPE_ _FREQ_;

%mend var;

%var(v=n_alive);	   %var(v=n_alive_m);		%var(v=n_alive_w);		 %var(v=prevalence1564); %var(v=prevalence1564m); %var(v=prevalence1564w);	
%var(v=incidence1564); %var(v=incidence1564_m); %var(v=incidence1564_w); %var(v=p_diag);		 %var(v=p_diag_m);		  %var(v=p_diag_w);
%var(v=p_onart_diag);  %var(v=p_onart_diag_m);	%var(v=p_onart_diag_w);  %var(v=p_onart_vl1000); %var(v=p_onart_vl1000_m);%var(v=p_onart_vl1000_w);

%var(v=s_dead_undiag); 		    %var(v=s_dead_diag_not_linked);   %var(v=s_dead_Alt6_artcd4lt200); 	%var(v=s_dead_Alt6_artcd4gt200);
%var(v=s_dead_int_Alt6_rescd4lt200); %var(v=s_dead_int_Alt6_rescd4gt200); 
%var(v=s_dead_A_vl1000); 	    %var(v=s_dead_A_vg1000);		  %var(v=s_dead_Alt6_vl1000); 		%var(v=s_dead_Alt6_vg1000);  
%var(v=s_dead_Agt6_vl1000);	    %var(v=s_dead_Agt6_vg1000);	 	  %var(v=s_dead_int_lost);			%var(v=s_dead_1stint_lost); 
%var(v=s_dead_subintlt6_lost);  %var(v=s_dead_subintgt6_lost);    %var(v=s_dead_A_cd4lt200);        %var(v=s_dead_A_cd4gt200);  
%var(v=s_dead_Alt6_cd4lt200);   %var(v=s_dead_Alt6_cd4gt200); 	  %var(v=s_dead_Agt6_cd4lt200);  	%var(v=s_dead_Agt6_cd4gt200);  

%var(v=s_dead_undiag_m);  %var(v=s_dead_undiag_w);  
%var(v=s_dead_undiag1519m);  %var(v=s_dead_undiag2024m);  %var(v=s_dead_undiag2529m);  %var(v=s_dead_undiag3034m);  %var(v=s_dead_undiag3539m);  
%var(v=s_dead_undiag4044m);  %var(v=s_dead_undiag4549m);  %var(v=s_dead_undiag5054m);  %var(v=s_dead_undiag5559m);  %var(v=s_dead_undiag6064m);  
%var(v=s_dead_undiag6569m);  %var(v=s_dead_undiag7074m);  %var(v=s_dead_undiag7579m);  %var(v=s_dead_undiag8084m);  
%var(v=s_dead_undiag1519w);  %var(v=s_dead_undiag2024w);  %var(v=s_dead_undiag2529w);  %var(v=s_dead_undiag3034w);  %var(v=s_dead_undiag3539w);  
%var(v=s_dead_undiag4044w);  %var(v=s_dead_undiag4549w);  %var(v=s_dead_undiag5054w);  %var(v=s_dead_undiag5559w);  %var(v=s_dead_undiag6064w);  
%var(v=s_dead_undiag6569w);  %var(v=s_dead_undiag7074w);  %var(v=s_dead_undiag7579w);  %var(v=s_dead_undiag8084w);  

%var(v=s_dead_diag_not_linked_m);  %var(v=s_dead_diag_not_linked_w);  
%var(v=s_dead_diag_not_linked1519m);  %var(v=s_dead_diag_not_linked2024m);  %var(v=s_dead_diag_not_linked2529m);  %var(v=s_dead_diag_not_linked3034m);  %var(v=s_dead_diag_not_linked3539m);  
%var(v=s_dead_diag_not_linked4044m);  %var(v=s_dead_diag_not_linked4549m);  %var(v=s_dead_diag_not_linked5054m);  %var(v=s_dead_diag_not_linked5559m);  %var(v=s_dead_diag_not_linked6064m);  
%var(v=s_dead_diag_not_linked6569m);  %var(v=s_dead_diag_not_linked7074m);  %var(v=s_dead_diag_not_linked7579m);  %var(v=s_dead_diag_not_linked8084m);  
%var(v=s_dead_diag_not_linked1519w);  %var(v=s_dead_diag_not_linked2024w);  %var(v=s_dead_diag_not_linked2529w);  %var(v=s_dead_diag_not_linked3034w);  %var(v=s_dead_diag_not_linked3539w);  
%var(v=s_dead_diag_not_linked4044w);  %var(v=s_dead_diag_not_linked4549w);  %var(v=s_dead_diag_not_linked5054w);  %var(v=s_dead_diag_not_linked5559w);  %var(v=s_dead_diag_not_linked6064w);  
%var(v=s_dead_diag_not_linked6569w);  %var(v=s_dead_diag_not_linked7074w);  %var(v=s_dead_diag_not_linked7579w);  %var(v=s_dead_diag_not_linked8084w);  

%var(v=s_dead_Alt6_artcd4lt200_m);  %var(v=s_dead_Alt6_artcd4lt200_w);  
%var(v=s_dead_Alt6_artcd4lt2001519m);  %var(v=s_dead_Alt6_artcd4lt2002024m);  %var(v=s_dead_Alt6_artcd4lt2002529m);  %var(v=s_dead_Alt6_artcd4lt2003034m);  %var(v=s_dead_Alt6_artcd4lt2003539m);  
%var(v=s_dead_Alt6_artcd4lt2004044m);  %var(v=s_dead_Alt6_artcd4lt2004549m);  %var(v=s_dead_Alt6_artcd4lt2005054m);  %var(v=s_dead_Alt6_artcd4lt2005559m);  %var(v=s_dead_Alt6_artcd4lt2006064m);  
%var(v=s_dead_Alt6_artcd4lt2006569m);  %var(v=s_dead_Alt6_artcd4lt2007074m);  %var(v=s_dead_Alt6_artcd4lt2007579m);  %var(v=s_dead_Alt6_artcd4lt2008084m);  
%var(v=s_dead_Alt6_artcd4lt2001519w);  %var(v=s_dead_Alt6_artcd4lt2002024w);  %var(v=s_dead_Alt6_artcd4lt2002529w);  %var(v=s_dead_Alt6_artcd4lt2003034w);  %var(v=s_dead_Alt6_artcd4lt2003539w);  
%var(v=s_dead_Alt6_artcd4lt2004044w);  %var(v=s_dead_Alt6_artcd4lt2004549w);  %var(v=s_dead_Alt6_artcd4lt2005054w);  %var(v=s_dead_Alt6_artcd4lt2005559w);  %var(v=s_dead_Alt6_artcd4lt2006064w);  
%var(v=s_dead_Alt6_artcd4lt2006569w);  %var(v=s_dead_Alt6_artcd4lt2007074w);  %var(v=s_dead_Alt6_artcd4lt2007579w);  %var(v=s_dead_Alt6_artcd4lt2008084w);  

%var(v=s_dead_Alt6_artcd4gt200_m);  %var(v=s_dead_Alt6_artcd4gt200_w);  
%var(v=s_dead_Alt6_artcd4gt2001519m);  %var(v=s_dead_Alt6_artcd4gt2002024m);  %var(v=s_dead_Alt6_artcd4gt2002529m);  %var(v=s_dead_Alt6_artcd4gt2003034m);  %var(v=s_dead_Alt6_artcd4gt2003539m);  
%var(v=s_dead_Alt6_artcd4gt2004044m);  %var(v=s_dead_Alt6_artcd4gt2004549m);  %var(v=s_dead_Alt6_artcd4gt2005054m);  %var(v=s_dead_Alt6_artcd4gt2005559m);  %var(v=s_dead_Alt6_artcd4gt2006064m);  
%var(v=s_dead_Alt6_artcd4gt2006569m);  %var(v=s_dead_Alt6_artcd4gt2007074m);  %var(v=s_dead_Alt6_artcd4gt2007579m);  %var(v=s_dead_Alt6_artcd4gt2008084m);  
%var(v=s_dead_Alt6_artcd4gt2001519w);  %var(v=s_dead_Alt6_artcd4gt2002024w);  %var(v=s_dead_Alt6_artcd4gt2002529w);  %var(v=s_dead_Alt6_artcd4gt2003034w);  %var(v=s_dead_Alt6_artcd4gt2003539w);  
%var(v=s_dead_Alt6_artcd4gt2004044w);  %var(v=s_dead_Alt6_artcd4gt2004549w);  %var(v=s_dead_Alt6_artcd4gt2005054w);  %var(v=s_dead_Alt6_artcd4gt2005559w);  %var(v=s_dead_Alt6_artcd4gt2006064w);  
%var(v=s_dead_Alt6_artcd4gt2006569w);  %var(v=s_dead_Alt6_artcd4gt2007074w);  %var(v=s_dead_Alt6_artcd4gt2007579w);  %var(v=s_dead_Alt6_artcd4gt2008084w);  

%var(v=s_dead_I_Alt6_Rcd4lt200_m);  %var(v=s_dead_I_Alt6_Rcd4lt200_w);  
%var(v=s_dead_I_Alt6_Rcd4lt2001519m);  %var(v=s_dead_I_Alt6_Rcd4lt2002024m);  %var(v=s_dead_I_Alt6_Rcd4lt2002529m);  %var(v=s_dead_I_Alt6_Rcd4lt2003034m);  %var(v=s_dead_I_Alt6_Rcd4lt2003539m);  
%var(v=s_dead_I_Alt6_Rcd4lt2004044m);  %var(v=s_dead_I_Alt6_Rcd4lt2004549m);  %var(v=s_dead_I_Alt6_Rcd4lt2005054m);  %var(v=s_dead_I_Alt6_Rcd4lt2005559m);   %var(v=s_dead_I_Alt6_Rcd4lt2006064m);  
%var(v=s_dead_I_Alt6_Rcd4lt2006569m);  %var(v=s_dead_I_Alt6_Rcd4lt2007074m);  %var(v=s_dead_I_Alt6_Rcd4lt2007579m);  %var(v=s_dead_I_Alt6_Rcd4lt2008084m);  
%var(v=s_dead_I_Alt6_Rcd4lt2001519w);  %var(v=s_dead_I_Alt6_Rcd4lt2002024w);  %var(v=s_dead_I_Alt6_Rcd4lt2002529w);  %var(v=s_dead_I_Alt6_Rcd4lt2003034w);  %var(v=s_dead_I_Alt6_Rcd4lt2003539w);  
%var(v=s_dead_I_Alt6_Rcd4lt2004044w);  %var(v=s_dead_I_Alt6_Rcd4lt2004549w);  %var(v=s_dead_I_Alt6_Rcd4lt2005054w);  %var(v=s_dead_I_Alt6_Rcd4lt2005559w);   %var(v=s_dead_I_Alt6_Rcd4lt2006064w);  
%var(v=s_dead_I_Alt6_Rcd4lt2006569w);  %var(v=s_dead_I_Alt6_Rcd4lt2007074w);  %var(v=s_dead_I_Alt6_Rcd4lt2007579w);  %var(v=s_dead_I_Alt6_Rcd4lt2008084w);  

%var(v=s_dead_I_Alt6_Rcd4gt200_m);  %var(v=s_dead_I_Alt6_Rcd4gt200_w);  
%var(v=s_dead_I_Alt6_Rcd4gt2001519m);  %var(v=s_dead_I_Alt6_Rcd4gt2002024m);  %var(v=s_dead_I_Alt6_Rcd4gt2002529m);  %var(v=s_dead_I_Alt6_Rcd4gt2003034m);  %var(v=s_dead_I_Alt6_Rcd4gt2003539m);  
%var(v=s_dead_I_Alt6_Rcd4gt2004044m);  %var(v=s_dead_I_Alt6_Rcd4gt2004549m);  %var(v=s_dead_I_Alt6_Rcd4gt2005054m);  %var(v=s_dead_I_Alt6_Rcd4gt2005559m);   %var(v=s_dead_I_Alt6_Rcd4gt2006064m);  
%var(v=s_dead_I_Alt6_Rcd4gt2006569m);  %var(v=s_dead_I_Alt6_Rcd4gt2007074m);  %var(v=s_dead_I_Alt6_Rcd4gt2007579m);  %var(v=s_dead_I_Alt6_Rcd4gt2008084m);  
%var(v=s_dead_I_Alt6_Rcd4gt2001519w);  %var(v=s_dead_I_Alt6_Rcd4gt2002024w);  %var(v=s_dead_I_Alt6_Rcd4gt2002529w);  %var(v=s_dead_I_Alt6_Rcd4gt2003034w);  %var(v=s_dead_I_Alt6_Rcd4gt2003539w);  
%var(v=s_dead_I_Alt6_Rcd4gt2004044w);  %var(v=s_dead_I_Alt6_Rcd4gt2004549w);  %var(v=s_dead_I_Alt6_Rcd4gt2005054w);  %var(v=s_dead_I_Alt6_Rcd4gt2005559w);   %var(v=s_dead_I_Alt6_Rcd4gt2006064w);  
%var(v=s_dead_I_Alt6_Rcd4gt2006569w);  %var(v=s_dead_I_Alt6_Rcd4gt2007074w);  %var(v=s_dead_I_Alt6_Rcd4gt2007579w);  %var(v=s_dead_I_Alt6_Rcd4gt2008084w);  

%var(v=s_dead_A_vl1000_m);  %var(v=s_dead_A_vl1000_w);  
%var(v=s_dead_A_vl10001519m);  %var(v=s_dead_A_vl10002024m);  %var(v=s_dead_A_vl10002529m);  %var(v=s_dead_A_vl10003034m);  %var(v=s_dead_A_vl10003539m);  
%var(v=s_dead_A_vl10004044m);  %var(v=s_dead_A_vl10004549m);  %var(v=s_dead_A_vl10005054m);  %var(v=s_dead_A_vl10005559m);  %var(v=s_dead_A_vl10006064m);  
%var(v=s_dead_A_vl10006569m);  %var(v=s_dead_A_vl10007074m);  %var(v=s_dead_A_vl10007579m);   %var(v=s_dead_A_vl10008084m);  
%var(v=s_dead_A_vl10001519w);  %var(v=s_dead_A_vl10002024w);  %var(v=s_dead_A_vl10002529w);  %var(v=s_dead_A_vl10003034w);  %var(v=s_dead_A_vl10003539w);  
%var(v=s_dead_A_vl10004044w);  %var(v=s_dead_A_vl10004549w);  %var(v=s_dead_A_vl10005054w);  %var(v=s_dead_A_vl10005559w);  %var(v=s_dead_A_vl10006064w);  
%var(v=s_dead_A_vl10006569w);  %var(v=s_dead_A_vl10007074w);  %var(v=s_dead_A_vl10007579w);   %var(v=s_dead_A_vl10008084w);  

%var(v=s_dead_A_vg1000_m);  %var(v=s_dead_A_vg1000_w);  
%var(v=s_dead_A_vg10001519m);  %var(v=s_dead_A_vg10002024m);  %var(v=s_dead_A_vg10002529m);  %var(v=s_dead_A_vg10003034m);  %var(v=s_dead_A_vg10003539m);  
%var(v=s_dead_A_vg10004044m);  %var(v=s_dead_A_vg10004549m);  %var(v=s_dead_A_vg10005054m);  %var(v=s_dead_A_vg10005559m);  %var(v=s_dead_A_vg10006064m);  
%var(v=s_dead_A_vg10006569m);  %var(v=s_dead_A_vg10007074m);  %var(v=s_dead_A_vg10007579m);   %var(v=s_dead_A_vg10008084m);  
%var(v=s_dead_A_vg10001519w);  %var(v=s_dead_A_vg10002024w);  %var(v=s_dead_A_vg10002529w);  %var(v=s_dead_A_vg10003034w);  %var(v=s_dead_A_vg10003539w);  
%var(v=s_dead_A_vg10004044w);  %var(v=s_dead_A_vg10004549w);  %var(v=s_dead_A_vg10005054w);  %var(v=s_dead_A_vg10005559w);  %var(v=s_dead_A_vg10006064w);  
%var(v=s_dead_A_vg10006569w);  %var(v=s_dead_A_vg10007074w);  %var(v=s_dead_A_vg10007579w);   %var(v=s_dead_A_vg10008084w);  

%var(v=s_dead_Alt6_vl1000_m);  %var(v=s_dead_Alt6_vl1000_w);  
%var(v=s_dead_Alt6_vl10001519m);  %var(v=s_dead_Alt6_vl10002024m);  %var(v=s_dead_Alt6_vl10002529m);  %var(v=s_dead_Alt6_vl10003034m);  %var(v=s_dead_Alt6_vl10003539m);  
%var(v=s_dead_Alt6_vl10004044m);  %var(v=s_dead_Alt6_vl10004549m);  %var(v=s_dead_Alt6_vl10005054m);  %var(v=s_dead_Alt6_vl10005559m);  %var(v=s_dead_Alt6_vl10006064m);  
%var(v=s_dead_Alt6_vl10006569m);  %var(v=s_dead_Alt6_vl10007074m);  %var(v=s_dead_Alt6_vl10007579m);   %var(v=s_dead_Alt6_vl10008084m);  
%var(v=s_dead_Alt6_vl10001519w);  %var(v=s_dead_Alt6_vl10002024w);  %var(v=s_dead_Alt6_vl10002529w);  %var(v=s_dead_Alt6_vl10003034w);  %var(v=s_dead_Alt6_vl10003539w);  
%var(v=s_dead_Alt6_vl10004044w);  %var(v=s_dead_Alt6_vl10004549w);  %var(v=s_dead_Alt6_vl10005054w);  %var(v=s_dead_Alt6_vl10005559w);  %var(v=s_dead_Alt6_vl10006064w);  
%var(v=s_dead_Alt6_vl10006569w);  %var(v=s_dead_Alt6_vl10007074w);  %var(v=s_dead_Alt6_vl10007579w);   %var(v=s_dead_Alt6_vl10008084w);  

%var(v=s_dead_Alt6_vg1000_m);  %var(v=s_dead_Alt6_vg1000_w);  
%var(v=s_dead_Alt6_vg10001519m);  %var(v=s_dead_Alt6_vg10002024m);  %var(v=s_dead_Alt6_vg10002529m);  %var(v=s_dead_Alt6_vg10003034m);  %var(v=s_dead_Alt6_vg10003539m);  
%var(v=s_dead_Alt6_vg10004044m);  %var(v=s_dead_Alt6_vg10004549m);  %var(v=s_dead_Alt6_vg10005054m);  %var(v=s_dead_Alt6_vg10005559m);  %var(v=s_dead_Alt6_vg10006064m);  
%var(v=s_dead_Alt6_vg10006569m);  %var(v=s_dead_Alt6_vg10007074m);  %var(v=s_dead_Alt6_vg10007579m);   %var(v=s_dead_Alt6_vg10008084m);  
%var(v=s_dead_Alt6_vg10001519w);  %var(v=s_dead_Alt6_vg10002024w);  %var(v=s_dead_Alt6_vg10002529w);  %var(v=s_dead_Alt6_vg10003034w);  %var(v=s_dead_Alt6_vg10003539w);  
%var(v=s_dead_Alt6_vg10004044w);  %var(v=s_dead_Alt6_vg10004549w);  %var(v=s_dead_Alt6_vg10005054w);  %var(v=s_dead_Alt6_vg10005559w);  %var(v=s_dead_Alt6_vg10006064w);  
%var(v=s_dead_Alt6_vg10006569w);  %var(v=s_dead_Alt6_vg10007074w);  %var(v=s_dead_Alt6_vg10007579w);   %var(v=s_dead_Alt6_vg10008084w);  

%var(v=s_dead_Agt6_vl1000_m);  %var(v=s_dead_Agt6_vl1000_w);  
%var(v=s_dead_Agt6_vl10001519m);  %var(v=s_dead_Agt6_vl10002024m);  %var(v=s_dead_Agt6_vl10002529m);  %var(v=s_dead_Agt6_vl10003034m);  %var(v=s_dead_Agt6_vl10003539m);  
%var(v=s_dead_Agt6_vl10004044m);  %var(v=s_dead_Agt6_vl10004549m);  %var(v=s_dead_Agt6_vl10005054m);  %var(v=s_dead_Agt6_vl10005559m);  %var(v=s_dead_Agt6_vl10006064m);  
%var(v=s_dead_Agt6_vl10006569m);  %var(v=s_dead_Agt6_vl10007074m);  %var(v=s_dead_Agt6_vl10007579m);   %var(v=s_dead_Agt6_vl10008084m);  
%var(v=s_dead_Agt6_vl10001519w);  %var(v=s_dead_Agt6_vl10002024w);  %var(v=s_dead_Agt6_vl10002529w);  %var(v=s_dead_Agt6_vl10003034w);  %var(v=s_dead_Agt6_vl10003539w);  
%var(v=s_dead_Agt6_vl10004044w);  %var(v=s_dead_Agt6_vl10004549w);  %var(v=s_dead_Agt6_vl10005054w);  %var(v=s_dead_Agt6_vl10005559w);  %var(v=s_dead_Agt6_vl10006064w);  
%var(v=s_dead_Agt6_vl10006569w);  %var(v=s_dead_Agt6_vl10007074w);  %var(v=s_dead_Agt6_vl10007579w);   %var(v=s_dead_Agt6_vl10008084w);  

%var(v=s_dead_Agt6_vg1000_m);  %var(v=s_dead_Agt6_vg1000_w);  
%var(v=s_dead_Agt6_vg10001519m);  %var(v=s_dead_Agt6_vg10002024m);  %var(v=s_dead_Agt6_vg10002529m);  %var(v=s_dead_Agt6_vg10003034m);  %var(v=s_dead_Agt6_vg10003539m);  
%var(v=s_dead_Agt6_vg10004044m);  %var(v=s_dead_Agt6_vg10004549m);  %var(v=s_dead_Agt6_vg10005054m);  %var(v=s_dead_Agt6_vg10005559m);  %var(v=s_dead_Agt6_vg10006064m);  
%var(v=s_dead_Agt6_vg10006569m);  %var(v=s_dead_Agt6_vg10007074m);  %var(v=s_dead_Agt6_vg10007579m);   %var(v=s_dead_Agt6_vg10008084m);  
%var(v=s_dead_Agt6_vg10001519w);  %var(v=s_dead_Agt6_vg10002024w);  %var(v=s_dead_Agt6_vg10002529w);  %var(v=s_dead_Agt6_vg10003034w);  %var(v=s_dead_Agt6_vg10003539w);  
%var(v=s_dead_Agt6_vg10004044w);  %var(v=s_dead_Agt6_vg10004549w);  %var(v=s_dead_Agt6_vg10005054w);  %var(v=s_dead_Agt6_vg10005559w);  %var(v=s_dead_Agt6_vg10006064w);  
%var(v=s_dead_Agt6_vg10006569w);  %var(v=s_dead_Agt6_vg10007074w);  %var(v=s_dead_Agt6_vg10007579w);   %var(v=s_dead_Agt6_vg10008084w);  

%var(v=s_dead_int_lost_m);  %var(v=s_dead_int_lost_w);  
%var(v=s_dead_int_lost1519m);  %var(v=s_dead_int_lost2024m);  %var(v=s_dead_int_lost2529m);  %var(v=s_dead_int_lost3034m);  %var(v=s_dead_int_lost3539m);  
%var(v=s_dead_int_lost4044m);  %var(v=s_dead_int_lost4549m);  %var(v=s_dead_int_lost5054m);  %var(v=s_dead_int_lost5559m);  %var(v=s_dead_int_lost6064m);  
%var(v=s_dead_int_lost6569m);  %var(v=s_dead_int_lost7074m);  %var(v=s_dead_int_lost7579m);  %var(v=s_dead_int_lost8084m);  
%var(v=s_dead_int_lost1519w);  %var(v=s_dead_int_lost2024w);  %var(v=s_dead_int_lost2529w);  %var(v=s_dead_int_lost3034w);  %var(v=s_dead_int_lost3539w);  
%var(v=s_dead_int_lost4044w);  %var(v=s_dead_int_lost4549w);  %var(v=s_dead_int_lost5054w);  %var(v=s_dead_int_lost5559w);  %var(v=s_dead_int_lost6064w);  
%var(v=s_dead_int_lost6569w);  %var(v=s_dead_int_lost7074w);  %var(v=s_dead_int_lost7579w);  %var(v=s_dead_int_lost8084w);  

%var(v=s_dead_1stint_lost_m);  %var(v=s_dead_1stint_lost_w);  
%var(v=s_dead_1stint_lost1519m);  %var(v=s_dead_1stint_lost2024m);  %var(v=s_dead_1stint_lost2529m);  %var(v=s_dead_1stint_lost3034m);  %var(v=s_dead_1stint_lost3539m);  
%var(v=s_dead_1stint_lost4044m);  %var(v=s_dead_1stint_lost4549m);  %var(v=s_dead_1stint_lost5054m);  %var(v=s_dead_1stint_lost5559m);  %var(v=s_dead_1stint_lost6064m);  
%var(v=s_dead_1stint_lost6569m);  %var(v=s_dead_1stint_lost7074m);  %var(v=s_dead_1stint_lost7579m);  %var(v=s_dead_1stint_lost8084m);  
%var(v=s_dead_1stint_lost1519w);  %var(v=s_dead_1stint_lost2024w);  %var(v=s_dead_1stint_lost2529w);  %var(v=s_dead_1stint_lost3034w);  %var(v=s_dead_1stint_lost3539w);  
%var(v=s_dead_1stint_lost4044w);  %var(v=s_dead_1stint_lost4549w);  %var(v=s_dead_1stint_lost5054w);  %var(v=s_dead_1stint_lost5559w);  %var(v=s_dead_1stint_lost6064w);  
%var(v=s_dead_1stint_lost6569w);  %var(v=s_dead_1stint_lost7074w);  %var(v=s_dead_1stint_lost7579w);  %var(v=s_dead_1stint_lost8084w);  

%var(v=s_dead_subintlt6_lost_m);  %var(v=s_dead_subintlt6_lost_w);  
%var(v=s_dead_subintlt6_lost1519m);  %var(v=s_dead_subintlt6_lost2024m);  %var(v=s_dead_subintlt6_lost2529m);  %var(v=s_dead_subintlt6_lost3034m);  %var(v=s_dead_subintlt6_lost3539m);  
%var(v=s_dead_subintlt6_lost4044m);  %var(v=s_dead_subintlt6_lost4549m);  %var(v=s_dead_subintlt6_lost5054m);  %var(v=s_dead_subintlt6_lost5559m);  %var(v=s_dead_subintlt6_lost6064m);  
%var(v=s_dead_subintlt6_lost6569m);  %var(v=s_dead_subintlt6_lost7074m);  %var(v=s_dead_subintlt6_lost7579m);  %var(v=s_dead_subintlt6_lost8084m);  
%var(v=s_dead_subintlt6_lost1519w);  %var(v=s_dead_subintlt6_lost2024w);  %var(v=s_dead_subintlt6_lost2529w);  %var(v=s_dead_subintlt6_lost3034w);  %var(v=s_dead_subintlt6_lost3539w);  
%var(v=s_dead_subintlt6_lost4044w);  %var(v=s_dead_subintlt6_lost4549w);  %var(v=s_dead_subintlt6_lost5054w);  %var(v=s_dead_subintlt6_lost5559w);  %var(v=s_dead_subintlt6_lost6064w);  
%var(v=s_dead_subintlt6_lost6569w);  %var(v=s_dead_subintlt6_lost7074w);  %var(v=s_dead_subintlt6_lost7579w);  %var(v=s_dead_subintlt6_lost8084w);  

%var(v=s_dead_subintgt6_lost_m);  %var(v=s_dead_subintgt6_lost_w);  
%var(v=s_dead_subintgt6_lost1519m);  %var(v=s_dead_subintgt6_lost2024m);  %var(v=s_dead_subintgt6_lost2529m);  %var(v=s_dead_subintgt6_lost3034m);  %var(v=s_dead_subintgt6_lost3539m);  
%var(v=s_dead_subintgt6_lost4044m);  %var(v=s_dead_subintgt6_lost4549m);  %var(v=s_dead_subintgt6_lost5054m);  %var(v=s_dead_subintgt6_lost5559m);  %var(v=s_dead_subintgt6_lost6064m);  
%var(v=s_dead_subintgt6_lost6569m);  %var(v=s_dead_subintgt6_lost7074m);  %var(v=s_dead_subintgt6_lost7579m);  %var(v=s_dead_subintgt6_lost8084m);  
%var(v=s_dead_subintgt6_lost1519w);  %var(v=s_dead_subintgt6_lost2024w);  %var(v=s_dead_subintgt6_lost2529w);  %var(v=s_dead_subintgt6_lost3034w);  %var(v=s_dead_subintgt6_lost3539w);  
%var(v=s_dead_subintgt6_lost4044w);  %var(v=s_dead_subintgt6_lost4549w);  %var(v=s_dead_subintgt6_lost5054w);  %var(v=s_dead_subintgt6_lost5559w);  %var(v=s_dead_subintgt6_lost6064w);  
%var(v=s_dead_subintgt6_lost6569w);  %var(v=s_dead_subintgt6_lost7074w);  %var(v=s_dead_subintgt6_lost7579w);  %var(v=s_dead_subintgt6_lost8084w);  

%var(v=s_dead_A_cd4lt200_m);  %var(v=s_dead_A_cd4lt200_w);  
%var(v=s_dead_A_cd4lt2001519m);  %var(v=s_dead_A_cd4lt2002024m);  %var(v=s_dead_A_cd4lt2002529m);  %var(v=s_dead_A_cd4lt2003034m);  %var(v=s_dead_A_cd4lt2003539m);  
%var(v=s_dead_A_cd4lt2004044m);  %var(v=s_dead_A_cd4lt2004549m);  %var(v=s_dead_A_cd4lt2005054m);  %var(v=s_dead_A_cd4lt2005559m);  %var(v=s_dead_A_cd4lt2006064m);  
%var(v=s_dead_A_cd4lt2006569m);  %var(v=s_dead_A_cd4lt2007074m);  %var(v=s_dead_A_cd4lt2007579m);  %var(v=s_dead_A_cd4lt2008084m);  
%var(v=s_dead_A_cd4lt2001519w);  %var(v=s_dead_A_cd4lt2002024w);  %var(v=s_dead_A_cd4lt2002529w);  %var(v=s_dead_A_cd4lt2003034w);  %var(v=s_dead_A_cd4lt2003539w);  
%var(v=s_dead_A_cd4lt2004044w);  %var(v=s_dead_A_cd4lt2004549w);  %var(v=s_dead_A_cd4lt2005054w);  %var(v=s_dead_A_cd4lt2005559w);  %var(v=s_dead_A_cd4lt2006064w);  
%var(v=s_dead_A_cd4lt2006569w);  %var(v=s_dead_A_cd4lt2007074w);  %var(v=s_dead_A_cd4lt2007579w);  %var(v=s_dead_A_cd4lt2008084w);  

%var(v=s_dead_A_cd4gt200_m);  %var(v=s_dead_A_cd4gt200_w);  
%var(v=s_dead_A_cd4gt2001519m);  %var(v=s_dead_A_cd4gt2002024m);  %var(v=s_dead_A_cd4gt2002529m);  %var(v=s_dead_A_cd4gt2003034m);  %var(v=s_dead_A_cd4gt2003539m);  
%var(v=s_dead_A_cd4gt2004044m);  %var(v=s_dead_A_cd4gt2004549m);  %var(v=s_dead_A_cd4gt2005054m);  %var(v=s_dead_A_cd4gt2005559m);  %var(v=s_dead_A_cd4gt2006064m);  
%var(v=s_dead_A_cd4gt2006569m);  %var(v=s_dead_A_cd4gt2007074m);  %var(v=s_dead_A_cd4gt2007579m);  %var(v=s_dead_A_cd4gt2008084m);  
%var(v=s_dead_A_cd4gt2001519w);  %var(v=s_dead_A_cd4gt2002024w);  %var(v=s_dead_A_cd4gt2002529w);  %var(v=s_dead_A_cd4gt2003034w);  %var(v=s_dead_A_cd4gt2003539w);  
%var(v=s_dead_A_cd4gt2004044w);  %var(v=s_dead_A_cd4gt2004549w);  %var(v=s_dead_A_cd4gt2005054w);  %var(v=s_dead_A_cd4gt2005559w);  %var(v=s_dead_A_cd4gt2006064w);  
%var(v=s_dead_A_cd4gt2006569w);  %var(v=s_dead_A_cd4gt2007074w);  %var(v=s_dead_A_cd4gt2007579w);  %var(v=s_dead_A_cd4gt2008084w);  

%var(v=s_dead_Alt6_cd4lt200_m);  %var(v=s_dead_Alt6_cd4lt200_w);  
%var(v=s_dead_Alt6_cd4lt2001519m);  %var(v=s_dead_Alt6_cd4lt2002024m);  %var(v=s_dead_Alt6_cd4lt2002529m);  %var(v=s_dead_Alt6_cd4lt2003034m);  %var(v=s_dead_Alt6_cd4lt2003539m);  
%var(v=s_dead_Alt6_cd4lt2004044m);  %var(v=s_dead_Alt6_cd4lt2004549m);  %var(v=s_dead_Alt6_cd4lt2005054m);  %var(v=s_dead_Alt6_cd4lt2005559m);  %var(v=s_dead_Alt6_cd4lt2006064m);  
%var(v=s_dead_Alt6_cd4lt2006569m);  %var(v=s_dead_Alt6_cd4lt2007074m);  %var(v=s_dead_Alt6_cd4lt2007579m);  %var(v=s_dead_Alt6_cd4lt2008084m);  
%var(v=s_dead_Alt6_cd4lt2001519w);  %var(v=s_dead_Alt6_cd4lt2002024w);  %var(v=s_dead_Alt6_cd4lt2002529w);  %var(v=s_dead_Alt6_cd4lt2003034w);  %var(v=s_dead_Alt6_cd4lt2003539w);  
%var(v=s_dead_Alt6_cd4lt2004044w);  %var(v=s_dead_Alt6_cd4lt2004549w);  %var(v=s_dead_Alt6_cd4lt2005054w);  %var(v=s_dead_Alt6_cd4lt2005559w);  %var(v=s_dead_Alt6_cd4lt2006064w);  
%var(v=s_dead_Alt6_cd4lt2006569w);  %var(v=s_dead_Alt6_cd4lt2007074w);  %var(v=s_dead_Alt6_cd4lt2007579w);  %var(v=s_dead_Alt6_cd4lt2008084w);  

%var(v=s_dead_Alt6_cd4gt200_m);  %var(v=s_dead_Alt6_cd4gt200_w);  
%var(v=s_dead_Alt6_cd4gt2001519m);  %var(v=s_dead_Alt6_cd4gt2002024m);  %var(v=s_dead_Alt6_cd4gt2002529m);  %var(v=s_dead_Alt6_cd4gt2003034m);  %var(v=s_dead_Alt6_cd4gt2003539m);  
%var(v=s_dead_Alt6_cd4gt2004044m);  %var(v=s_dead_Alt6_cd4gt2004549m);  %var(v=s_dead_Alt6_cd4gt2005054m);  %var(v=s_dead_Alt6_cd4gt2005559m);  %var(v=s_dead_Alt6_cd4gt2006064m);  
%var(v=s_dead_Alt6_cd4gt2006569m);  %var(v=s_dead_Alt6_cd4gt2007074m);  %var(v=s_dead_Alt6_cd4gt2007579m);  %var(v=s_dead_Alt6_cd4gt2008084m);  
%var(v=s_dead_Alt6_cd4gt2001519w);  %var(v=s_dead_Alt6_cd4gt2002024w);  %var(v=s_dead_Alt6_cd4gt2002529w);  %var(v=s_dead_Alt6_cd4gt2003034w);  %var(v=s_dead_Alt6_cd4gt2003539w);  
%var(v=s_dead_Alt6_cd4gt2004044w);  %var(v=s_dead_Alt6_cd4gt2004549w);  %var(v=s_dead_Alt6_cd4gt2005054w);  %var(v=s_dead_Alt6_cd4gt2005559w);  %var(v=s_dead_Alt6_cd4gt2006064w);  
%var(v=s_dead_Alt6_cd4gt2006569w);  %var(v=s_dead_Alt6_cd4gt2007074w);  %var(v=s_dead_Alt6_cd4gt2007579w);  %var(v=s_dead_Alt6_cd4gt2008084w);  

%var(v=s_dead_Agt6_cd4lt200_m);  %var(v=s_dead_Agt6_cd4lt200_w);  
%var(v=s_dead_Agt6_cd4lt2001519m);  %var(v=s_dead_Agt6_cd4lt2002024m);  %var(v=s_dead_Agt6_cd4lt2002529m);  %var(v=s_dead_Agt6_cd4lt2003034m);  %var(v=s_dead_Agt6_cd4lt2003539m);  
%var(v=s_dead_Agt6_cd4lt2004044m);  %var(v=s_dead_Agt6_cd4lt2004549m);  %var(v=s_dead_Agt6_cd4lt2005054m);  %var(v=s_dead_Agt6_cd4lt2005559m);  %var(v=s_dead_Agt6_cd4lt2006064m);  
%var(v=s_dead_Agt6_cd4lt2006569m);  %var(v=s_dead_Agt6_cd4lt2007074m);  %var(v=s_dead_Agt6_cd4lt2007579m);  %var(v=s_dead_Agt6_cd4lt2008084m);  
%var(v=s_dead_Agt6_cd4lt2001519w);  %var(v=s_dead_Agt6_cd4lt2002024w);  %var(v=s_dead_Agt6_cd4lt2002529w);  %var(v=s_dead_Agt6_cd4lt2003034w);  %var(v=s_dead_Agt6_cd4lt2003539w);  
%var(v=s_dead_Agt6_cd4lt2004044w);  %var(v=s_dead_Agt6_cd4lt2004549w);  %var(v=s_dead_Agt6_cd4lt2005054w);  %var(v=s_dead_Agt6_cd4lt2005559w);  %var(v=s_dead_Agt6_cd4lt2006064w);  
%var(v=s_dead_Agt6_cd4lt2006569w);  %var(v=s_dead_Agt6_cd4lt2007074w);  %var(v=s_dead_Agt6_cd4lt2007579w);  %var(v=s_dead_Agt6_cd4lt2008084w);  

%var(v=s_dead_Agt6_cd4gt200_m);  %var(v=s_dead_Agt6_cd4gt200_w);  
%var(v=s_dead_Agt6_cd4gt2001519m);  %var(v=s_dead_Agt6_cd4gt2002024m);  %var(v=s_dead_Agt6_cd4gt2002529m);  %var(v=s_dead_Agt6_cd4gt2003034m);  %var(v=s_dead_Agt6_cd4gt2003539m);  
%var(v=s_dead_Agt6_cd4gt2004044m);  %var(v=s_dead_Agt6_cd4gt2004549m);  %var(v=s_dead_Agt6_cd4gt2005054m);  %var(v=s_dead_Agt6_cd4gt2005559m);  %var(v=s_dead_Agt6_cd4gt2006064m);  
%var(v=s_dead_Agt6_cd4gt2006569m);  %var(v=s_dead_Agt6_cd4gt2007074m);  %var(v=s_dead_Agt6_cd4gt2007579m);  %var(v=s_dead_Agt6_cd4gt2008084m);  
%var(v=s_dead_Agt6_cd4gt2001519w);  %var(v=s_dead_Agt6_cd4gt2002024w);  %var(v=s_dead_Agt6_cd4gt2002529w);  %var(v=s_dead_Agt6_cd4gt2003034w);  %var(v=s_dead_Agt6_cd4gt2003539w);  
%var(v=s_dead_Agt6_cd4gt2004044w);  %var(v=s_dead_Agt6_cd4gt2004549w);  %var(v=s_dead_Agt6_cd4gt2005054w);  %var(v=s_dead_Agt6_cd4gt2005559w);  %var(v=s_dead_Agt6_cd4gt2006064w);  
%var(v=s_dead_Agt6_cd4gt2006569w);  %var(v=s_dead_Agt6_cd4gt2007074w);  %var(v=s_dead_Agt6_cd4gt2007579w);  %var(v=s_dead_Agt6_cd4gt2008084w);  ;

data   wide_outputs; merge 
n_alive	  		 n_alive_m			n_alive_w		 prevalence1564 	prevalence1564m 	prevalence1564w	
incidence1564 	 incidence1564_m 	incidence1564_w	 p_diag		 		p_diag_m		    p_diag_w
p_onart_diag  	 p_onart_diag_m		p_onart_diag_w   p_onart_vl1000 	p_onart_vl1000_m	p_onart_vl1000_w

s_dead_undiag 		    s_dead_diag_not_linked   s_dead_Alt6_artcd4lt200 	s_dead_Alt6_artcd4gt200
s_dead_int_Alt6_rescd4lt200 s_dead_int_Alt6_rescd4gt200 
s_dead_A_vl1000 	    s_dead_A_vg1000		 	 s_dead_Alt6_vl1000 		s_dead_Alt6_vg1000  
s_dead_Agt6_vl1000	    s_dead_Agt6_vg1000	 	 s_dead_int_lost			s_dead_1stint_lost 
s_dead_subintlt6_lost   s_dead_subintgt6_lost    s_dead_A_cd4lt200       	s_dead_A_cd4gt200  
s_dead_Alt6_cd4lt200    s_dead_Alt6_cd4gt200 	 s_dead_Agt6_cd4lt200  		s_dead_Agt6_cd4gt200  

s_dead_undiag_m  s_dead_undiag_w  
s_dead_undiag1519m  s_dead_undiag2024m  s_dead_undiag2529m  s_dead_undiag3034m  s_dead_undiag3539m  
s_dead_undiag4044m  s_dead_undiag4549m  s_dead_undiag5054m  s_dead_undiag5559m  s_dead_undiag6064m  
s_dead_undiag6569m  s_dead_undiag7074m  s_dead_undiag7579m  s_dead_undiag8084m  
s_dead_undiag1519w  s_dead_undiag2024w  s_dead_undiag2529w  s_dead_undiag3034w  s_dead_undiag3539w  
s_dead_undiag4044w  s_dead_undiag4549w  s_dead_undiag5054w  s_dead_undiag5559w  s_dead_undiag6064w  
s_dead_undiag6569w  s_dead_undiag7074w  s_dead_undiag7579w  s_dead_undiag8084w  

s_dead_diag_not_linked_m  s_dead_diag_not_linked_w  
s_dead_diag_not_linked1519m  s_dead_diag_not_linked2024m  s_dead_diag_not_linked2529m  s_dead_diag_not_linked3034m  s_dead_diag_not_linked3539m  
s_dead_diag_not_linked4044m  s_dead_diag_not_linked4549m  s_dead_diag_not_linked5054m  s_dead_diag_not_linked5559m  s_dead_diag_not_linked6064m  
s_dead_diag_not_linked6569m  s_dead_diag_not_linked7074m  s_dead_diag_not_linked7579m  s_dead_diag_not_linked8084m  
s_dead_diag_not_linked1519w  s_dead_diag_not_linked2024w  s_dead_diag_not_linked2529w  s_dead_diag_not_linked3034w  s_dead_diag_not_linked3539w  
s_dead_diag_not_linked4044w  s_dead_diag_not_linked4549w  s_dead_diag_not_linked5054w  s_dead_diag_not_linked5559w  s_dead_diag_not_linked6064w  
s_dead_diag_not_linked6569w  s_dead_diag_not_linked7074w  s_dead_diag_not_linked7579w  s_dead_diag_not_linked8084w  

s_dead_Alt6_artcd4lt200_m  s_dead_Alt6_artcd4lt200_w  
s_dead_Alt6_artcd4lt2001519m  s_dead_Alt6_artcd4lt2002024m  s_dead_Alt6_artcd4lt2002529m  s_dead_Alt6_artcd4lt2003034m  s_dead_Alt6_artcd4lt2003539m  
s_dead_Alt6_artcd4lt2004044m  s_dead_Alt6_artcd4lt2004549m  s_dead_Alt6_artcd4lt2005054m  s_dead_Alt6_artcd4lt2005559m  s_dead_Alt6_artcd4lt2006064m  
s_dead_Alt6_artcd4lt2006569m  s_dead_Alt6_artcd4lt2007074m  s_dead_Alt6_artcd4lt2007579m  s_dead_Alt6_artcd4lt2008084m  
s_dead_Alt6_artcd4lt2001519w  s_dead_Alt6_artcd4lt2002024w  s_dead_Alt6_artcd4lt2002529w  s_dead_Alt6_artcd4lt2003034w  s_dead_Alt6_artcd4lt2003539w  
s_dead_Alt6_artcd4lt2004044w  s_dead_Alt6_artcd4lt2004549w  s_dead_Alt6_artcd4lt2005054w  s_dead_Alt6_artcd4lt2005559w  s_dead_Alt6_artcd4lt2006064w  
s_dead_Alt6_artcd4lt2006569w  s_dead_Alt6_artcd4lt2007074w  s_dead_Alt6_artcd4lt2007579w  s_dead_Alt6_artcd4lt2008084w  

s_dead_Alt6_artcd4gt200_m  s_dead_Alt6_artcd4gt200_w  
s_dead_Alt6_artcd4gt2001519m  s_dead_Alt6_artcd4gt2002024m  s_dead_Alt6_artcd4gt2002529m  s_dead_Alt6_artcd4gt2003034m  s_dead_Alt6_artcd4gt2003539m  
s_dead_Alt6_artcd4gt2004044m  s_dead_Alt6_artcd4gt2004549m  s_dead_Alt6_artcd4gt2005054m  s_dead_Alt6_artcd4gt2005559m  s_dead_Alt6_artcd4gt2006064m  
s_dead_Alt6_artcd4gt2006569m  s_dead_Alt6_artcd4gt2007074m  s_dead_Alt6_artcd4gt2007579m  s_dead_Alt6_artcd4gt2008084m  
s_dead_Alt6_artcd4gt2001519w  s_dead_Alt6_artcd4gt2002024w  s_dead_Alt6_artcd4gt2002529w  s_dead_Alt6_artcd4gt2003034w  s_dead_Alt6_artcd4gt2003539w  
s_dead_Alt6_artcd4gt2004044w  s_dead_Alt6_artcd4gt2004549w  s_dead_Alt6_artcd4gt2005054w  s_dead_Alt6_artcd4gt2005559w  s_dead_Alt6_artcd4gt2006064w  
s_dead_Alt6_artcd4gt2006569w  s_dead_Alt6_artcd4gt2007074w  s_dead_Alt6_artcd4gt2007579w  s_dead_Alt6_artcd4gt2008084w  

s_dead_I_Alt6_Rcd4lt200_m  s_dead_I_Alt6_Rcd4lt200_w  
s_dead_I_Alt6_Rcd4lt2001519m  s_dead_I_Alt6_Rcd4lt2002024m  s_dead_I_Alt6_Rcd4lt2002529m  s_dead_I_Alt6_Rcd4lt2003034m  s_dead_I_Alt6_Rcd4lt2003539m  
s_dead_I_Alt6_Rcd4lt2004044m  s_dead_I_Alt6_Rcd4lt2004549m  s_dead_I_Alt6_Rcd4lt2005054m  s_dead_I_Alt6_Rcd4lt2005559m   s_dead_I_Alt6_Rcd4lt2006064m  
s_dead_I_Alt6_Rcd4lt2006569m  s_dead_I_Alt6_Rcd4lt2007074m  s_dead_I_Alt6_Rcd4lt2007579m  s_dead_I_Alt6_Rcd4lt2008084m  
s_dead_I_Alt6_Rcd4lt2001519w  s_dead_I_Alt6_Rcd4lt2002024w  s_dead_I_Alt6_Rcd4lt2002529w  s_dead_I_Alt6_Rcd4lt2003034w  s_dead_I_Alt6_Rcd4lt2003539w  
s_dead_I_Alt6_Rcd4lt2004044w  s_dead_I_Alt6_Rcd4lt2004549w  s_dead_I_Alt6_Rcd4lt2005054w  s_dead_I_Alt6_Rcd4lt2005559w   s_dead_I_Alt6_Rcd4lt2006064w  
s_dead_I_Alt6_Rcd4lt2006569w  s_dead_I_Alt6_Rcd4lt2007074w  s_dead_I_Alt6_Rcd4lt2007579w  s_dead_I_Alt6_Rcd4lt2008084w  

s_dead_I_Alt6_Rcd4gt200_m  s_dead_I_Alt6_Rcd4gt200_w  
s_dead_I_Alt6_Rcd4gt2001519m  s_dead_I_Alt6_Rcd4gt2002024m  s_dead_I_Alt6_Rcd4gt2002529m  s_dead_I_Alt6_Rcd4gt2003034m  s_dead_I_Alt6_Rcd4gt2003539m  
s_dead_I_Alt6_Rcd4gt2004044m  s_dead_I_Alt6_Rcd4gt2004549m  s_dead_I_Alt6_Rcd4gt2005054m  s_dead_I_Alt6_Rcd4gt2005559m   s_dead_I_Alt6_Rcd4gt2006064m  
s_dead_I_Alt6_Rcd4gt2006569m  s_dead_I_Alt6_Rcd4gt2007074m  s_dead_I_Alt6_Rcd4gt2007579m  s_dead_I_Alt6_Rcd4gt2008084m  
s_dead_I_Alt6_Rcd4gt2001519w  s_dead_I_Alt6_Rcd4gt2002024w  s_dead_I_Alt6_Rcd4gt2002529w  s_dead_I_Alt6_Rcd4gt2003034w  s_dead_I_Alt6_Rcd4gt2003539w  
s_dead_I_Alt6_Rcd4gt2004044w  s_dead_I_Alt6_Rcd4gt2004549w  s_dead_I_Alt6_Rcd4gt2005054w  s_dead_I_Alt6_Rcd4gt2005559w   s_dead_I_Alt6_Rcd4gt2006064w  
s_dead_I_Alt6_Rcd4gt2006569w  s_dead_I_Alt6_Rcd4gt2007074w  s_dead_I_Alt6_Rcd4gt2007579w  s_dead_I_Alt6_Rcd4gt2008084w  

s_dead_A_vl1000_m  s_dead_A_vl1000_w  
s_dead_A_vl10001519m  s_dead_A_vl10002024m  s_dead_A_vl10002529m  s_dead_A_vl10003034m  s_dead_A_vl10003539m  
s_dead_A_vl10004044m  s_dead_A_vl10004549m  s_dead_A_vl10005054m  s_dead_A_vl10005559m  s_dead_A_vl10006064m  
s_dead_A_vl10006569m  s_dead_A_vl10007074m  s_dead_A_vl10007579m   s_dead_A_vl10008084m  
s_dead_A_vl10001519w  s_dead_A_vl10002024w  s_dead_A_vl10002529w  s_dead_A_vl10003034w  s_dead_A_vl10003539w  
s_dead_A_vl10004044w  s_dead_A_vl10004549w  s_dead_A_vl10005054w  s_dead_A_vl10005559w  s_dead_A_vl10006064w  
s_dead_A_vl10006569w  s_dead_A_vl10007074w  s_dead_A_vl10007579w   s_dead_A_vl10008084w  

s_dead_A_vg1000_m  s_dead_A_vg1000_w  
s_dead_A_vg10001519m  s_dead_A_vg10002024m  s_dead_A_vg10002529m  s_dead_A_vg10003034m  s_dead_A_vg10003539m  
s_dead_A_vg10004044m  s_dead_A_vg10004549m  s_dead_A_vg10005054m  s_dead_A_vg10005559m  s_dead_A_vg10006064m  
s_dead_A_vg10006569m  s_dead_A_vg10007074m  s_dead_A_vg10007579m   s_dead_A_vg10008084m  
s_dead_A_vg10001519w  s_dead_A_vg10002024w  s_dead_A_vg10002529w  s_dead_A_vg10003034w  s_dead_A_vg10003539w  
s_dead_A_vg10004044w  s_dead_A_vg10004549w  s_dead_A_vg10005054w  s_dead_A_vg10005559w  s_dead_A_vg10006064w  
s_dead_A_vg10006569w  s_dead_A_vg10007074w  s_dead_A_vg10007579w   s_dead_A_vg10008084w  

s_dead_Alt6_vl1000_m  s_dead_Alt6_vl1000_w  
s_dead_Alt6_vl10001519m  s_dead_Alt6_vl10002024m  s_dead_Alt6_vl10002529m  s_dead_Alt6_vl10003034m  s_dead_Alt6_vl10003539m  
s_dead_Alt6_vl10004044m  s_dead_Alt6_vl10004549m  s_dead_Alt6_vl10005054m  s_dead_Alt6_vl10005559m  s_dead_Alt6_vl10006064m  
s_dead_Alt6_vl10006569m  s_dead_Alt6_vl10007074m  s_dead_Alt6_vl10007579m   s_dead_Alt6_vl10008084m  
s_dead_Alt6_vl10001519w  s_dead_Alt6_vl10002024w  s_dead_Alt6_vl10002529w  s_dead_Alt6_vl10003034w  s_dead_Alt6_vl10003539w  
s_dead_Alt6_vl10004044w  s_dead_Alt6_vl10004549w  s_dead_Alt6_vl10005054w  s_dead_Alt6_vl10005559w  s_dead_Alt6_vl10006064w  
s_dead_Alt6_vl10006569w  s_dead_Alt6_vl10007074w  s_dead_Alt6_vl10007579w   s_dead_Alt6_vl10008084w  

s_dead_Alt6_vg1000_m  s_dead_Alt6_vg1000_w  
s_dead_Alt6_vg10001519m  s_dead_Alt6_vg10002024m  s_dead_Alt6_vg10002529m  s_dead_Alt6_vg10003034m  s_dead_Alt6_vg10003539m  
s_dead_Alt6_vg10004044m  s_dead_Alt6_vg10004549m  s_dead_Alt6_vg10005054m  s_dead_Alt6_vg10005559m  s_dead_Alt6_vg10006064m  
s_dead_Alt6_vg10006569m  s_dead_Alt6_vg10007074m  s_dead_Alt6_vg10007579m   s_dead_Alt6_vg10008084m  
s_dead_Alt6_vg10001519w  s_dead_Alt6_vg10002024w  s_dead_Alt6_vg10002529w  s_dead_Alt6_vg10003034w  s_dead_Alt6_vg10003539w  
s_dead_Alt6_vg10004044w  s_dead_Alt6_vg10004549w  s_dead_Alt6_vg10005054w  s_dead_Alt6_vg10005559w  s_dead_Alt6_vg10006064w  
s_dead_Alt6_vg10006569w  s_dead_Alt6_vg10007074w  s_dead_Alt6_vg10007579w   s_dead_Alt6_vg10008084w  

s_dead_Agt6_vl1000_m  s_dead_Agt6_vl1000_w  
s_dead_Agt6_vl10001519m  s_dead_Agt6_vl10002024m  s_dead_Agt6_vl10002529m  s_dead_Agt6_vl10003034m  s_dead_Agt6_vl10003539m  
s_dead_Agt6_vl10004044m  s_dead_Agt6_vl10004549m  s_dead_Agt6_vl10005054m  s_dead_Agt6_vl10005559m  s_dead_Agt6_vl10006064m  
s_dead_Agt6_vl10006569m  s_dead_Agt6_vl10007074m  s_dead_Agt6_vl10007579m   s_dead_Agt6_vl10008084m  
s_dead_Agt6_vl10001519w  s_dead_Agt6_vl10002024w  s_dead_Agt6_vl10002529w  s_dead_Agt6_vl10003034w  s_dead_Agt6_vl10003539w  
s_dead_Agt6_vl10004044w  s_dead_Agt6_vl10004549w  s_dead_Agt6_vl10005054w  s_dead_Agt6_vl10005559w  s_dead_Agt6_vl10006064w  
s_dead_Agt6_vl10006569w  s_dead_Agt6_vl10007074w  s_dead_Agt6_vl10007579w   s_dead_Agt6_vl10008084w  

s_dead_Agt6_vg1000_m  s_dead_Agt6_vg1000_w  
s_dead_Agt6_vg10001519m  s_dead_Agt6_vg10002024m  s_dead_Agt6_vg10002529m  s_dead_Agt6_vg10003034m  s_dead_Agt6_vg10003539m  
s_dead_Agt6_vg10004044m  s_dead_Agt6_vg10004549m  s_dead_Agt6_vg10005054m  s_dead_Agt6_vg10005559m  s_dead_Agt6_vg10006064m  
s_dead_Agt6_vg10006569m  s_dead_Agt6_vg10007074m  s_dead_Agt6_vg10007579m   s_dead_Agt6_vg10008084m  
s_dead_Agt6_vg10001519w  s_dead_Agt6_vg10002024w  s_dead_Agt6_vg10002529w  s_dead_Agt6_vg10003034w  s_dead_Agt6_vg10003539w  
s_dead_Agt6_vg10004044w  s_dead_Agt6_vg10004549w  s_dead_Agt6_vg10005054w  s_dead_Agt6_vg10005559w  s_dead_Agt6_vg10006064w  
s_dead_Agt6_vg10006569w  s_dead_Agt6_vg10007074w  s_dead_Agt6_vg10007579w   s_dead_Agt6_vg10008084w  

s_dead_int_lost_m  s_dead_int_lost_w  
s_dead_int_lost1519m  s_dead_int_lost2024m  s_dead_int_lost2529m  s_dead_int_lost3034m  s_dead_int_lost3539m  
s_dead_int_lost4044m  s_dead_int_lost4549m  s_dead_int_lost5054m  s_dead_int_lost5559m  s_dead_int_lost6064m  
s_dead_int_lost6569m  s_dead_int_lost7074m  s_dead_int_lost7579m  s_dead_int_lost8084m  
s_dead_int_lost1519w  s_dead_int_lost2024w  s_dead_int_lost2529w  s_dead_int_lost3034w  s_dead_int_lost3539w  
s_dead_int_lost4044w  s_dead_int_lost4549w  s_dead_int_lost5054w  s_dead_int_lost5559w  s_dead_int_lost6064w  
s_dead_int_lost6569w  s_dead_int_lost7074w  s_dead_int_lost7579w  s_dead_int_lost8084w  

s_dead_1stint_lost_m  s_dead_1stint_lost_w  
s_dead_1stint_lost1519m  s_dead_1stint_lost2024m  s_dead_1stint_lost2529m  s_dead_1stint_lost3034m  s_dead_1stint_lost3539m  
s_dead_1stint_lost4044m  s_dead_1stint_lost4549m  s_dead_1stint_lost5054m  s_dead_1stint_lost5559m  s_dead_1stint_lost6064m  
s_dead_1stint_lost6569m  s_dead_1stint_lost7074m  s_dead_1stint_lost7579m  s_dead_1stint_lost8084m  
s_dead_1stint_lost1519w  s_dead_1stint_lost2024w  s_dead_1stint_lost2529w  s_dead_1stint_lost3034w  s_dead_1stint_lost3539w  
s_dead_1stint_lost4044w  s_dead_1stint_lost4549w  s_dead_1stint_lost5054w  s_dead_1stint_lost5559w  s_dead_1stint_lost6064w  
s_dead_1stint_lost6569w  s_dead_1stint_lost7074w  s_dead_1stint_lost7579w  s_dead_1stint_lost8084w  

s_dead_subintlt6_lost_m  s_dead_subintlt6_lost_w  
s_dead_subintlt6_lost1519m  s_dead_subintlt6_lost2024m  s_dead_subintlt6_lost2529m  s_dead_subintlt6_lost3034m  s_dead_subintlt6_lost3539m  
s_dead_subintlt6_lost4044m  s_dead_subintlt6_lost4549m  s_dead_subintlt6_lost5054m  s_dead_subintlt6_lost5559m  s_dead_subintlt6_lost6064m  
s_dead_subintlt6_lost6569m  s_dead_subintlt6_lost7074m  s_dead_subintlt6_lost7579m  s_dead_subintlt6_lost8084m  
s_dead_subintlt6_lost1519w  s_dead_subintlt6_lost2024w  s_dead_subintlt6_lost2529w  s_dead_subintlt6_lost3034w  s_dead_subintlt6_lost3539w  
s_dead_subintlt6_lost4044w  s_dead_subintlt6_lost4549w  s_dead_subintlt6_lost5054w  s_dead_subintlt6_lost5559w  s_dead_subintlt6_lost6064w  
s_dead_subintlt6_lost6569w  s_dead_subintlt6_lost7074w  s_dead_subintlt6_lost7579w  s_dead_subintlt6_lost8084w  

s_dead_subintgt6_lost_m  s_dead_subintgt6_lost_w  
s_dead_subintgt6_lost1519m  s_dead_subintgt6_lost2024m  s_dead_subintgt6_lost2529m  s_dead_subintgt6_lost3034m  s_dead_subintgt6_lost3539m  
s_dead_subintgt6_lost4044m  s_dead_subintgt6_lost4549m  s_dead_subintgt6_lost5054m  s_dead_subintgt6_lost5559m  s_dead_subintgt6_lost6064m  
s_dead_subintgt6_lost6569m  s_dead_subintgt6_lost7074m  s_dead_subintgt6_lost7579m  s_dead_subintgt6_lost8084m  
s_dead_subintgt6_lost1519w  s_dead_subintgt6_lost2024w  s_dead_subintgt6_lost2529w  s_dead_subintgt6_lost3034w  s_dead_subintgt6_lost3539w  
s_dead_subintgt6_lost4044w  s_dead_subintgt6_lost4549w  s_dead_subintgt6_lost5054w  s_dead_subintgt6_lost5559w  s_dead_subintgt6_lost6064w  
s_dead_subintgt6_lost6569w  s_dead_subintgt6_lost7074w  s_dead_subintgt6_lost7579w  s_dead_subintgt6_lost8084w  

s_dead_A_cd4lt200_m  s_dead_A_cd4lt200_w  
s_dead_A_cd4lt2001519m  s_dead_A_cd4lt2002024m  s_dead_A_cd4lt2002529m  s_dead_A_cd4lt2003034m  s_dead_A_cd4lt2003539m  
s_dead_A_cd4lt2004044m  s_dead_A_cd4lt2004549m  s_dead_A_cd4lt2005054m  s_dead_A_cd4lt2005559m  s_dead_A_cd4lt2006064m  
s_dead_A_cd4lt2006569m  s_dead_A_cd4lt2007074m  s_dead_A_cd4lt2007579m  s_dead_A_cd4lt2008084m  
s_dead_A_cd4lt2001519w  s_dead_A_cd4lt2002024w  s_dead_A_cd4lt2002529w  s_dead_A_cd4lt2003034w  s_dead_A_cd4lt2003539w  
s_dead_A_cd4lt2004044w  s_dead_A_cd4lt2004549w  s_dead_A_cd4lt2005054w  s_dead_A_cd4lt2005559w  s_dead_A_cd4lt2006064w  
s_dead_A_cd4lt2006569w  s_dead_A_cd4lt2007074w  s_dead_A_cd4lt2007579w  s_dead_A_cd4lt2008084w  

s_dead_A_cd4gt200_m  s_dead_A_cd4gt200_w  
s_dead_A_cd4gt2001519m  s_dead_A_cd4gt2002024m  s_dead_A_cd4gt2002529m  s_dead_A_cd4gt2003034m  s_dead_A_cd4gt2003539m  
s_dead_A_cd4gt2004044m  s_dead_A_cd4gt2004549m  s_dead_A_cd4gt2005054m  s_dead_A_cd4gt2005559m  s_dead_A_cd4gt2006064m  
s_dead_A_cd4gt2006569m  s_dead_A_cd4gt2007074m  s_dead_A_cd4gt2007579m  s_dead_A_cd4gt2008084m  
s_dead_A_cd4gt2001519w  s_dead_A_cd4gt2002024w  s_dead_A_cd4gt2002529w  s_dead_A_cd4gt2003034w  s_dead_A_cd4gt2003539w  
s_dead_A_cd4gt2004044w  s_dead_A_cd4gt2004549w  s_dead_A_cd4gt2005054w  s_dead_A_cd4gt2005559w  s_dead_A_cd4gt2006064w  
s_dead_A_cd4gt2006569w  s_dead_A_cd4gt2007074w  s_dead_A_cd4gt2007579w  s_dead_A_cd4gt2008084w  

s_dead_Alt6_cd4lt200_m  s_dead_Alt6_cd4lt200_w  
s_dead_Alt6_cd4lt2001519m  s_dead_Alt6_cd4lt2002024m  s_dead_Alt6_cd4lt2002529m  s_dead_Alt6_cd4lt2003034m  s_dead_Alt6_cd4lt2003539m  
s_dead_Alt6_cd4lt2004044m  s_dead_Alt6_cd4lt2004549m  s_dead_Alt6_cd4lt2005054m  s_dead_Alt6_cd4lt2005559m  s_dead_Alt6_cd4lt2006064m  
s_dead_Alt6_cd4lt2006569m  s_dead_Alt6_cd4lt2007074m  s_dead_Alt6_cd4lt2007579m  s_dead_Alt6_cd4lt2008084m  
s_dead_Alt6_cd4lt2001519w  s_dead_Alt6_cd4lt2002024w  s_dead_Alt6_cd4lt2002529w  s_dead_Alt6_cd4lt2003034w  s_dead_Alt6_cd4lt2003539w  
s_dead_Alt6_cd4lt2004044w  s_dead_Alt6_cd4lt2004549w  s_dead_Alt6_cd4lt2005054w  s_dead_Alt6_cd4lt2005559w  s_dead_Alt6_cd4lt2006064w  
s_dead_Alt6_cd4lt2006569w  s_dead_Alt6_cd4lt2007074w  s_dead_Alt6_cd4lt2007579w  s_dead_Alt6_cd4lt2008084w  

s_dead_Alt6_cd4gt200_m  s_dead_Alt6_cd4gt200_w  
s_dead_Alt6_cd4gt2001519m  s_dead_Alt6_cd4gt2002024m  s_dead_Alt6_cd4gt2002529m  s_dead_Alt6_cd4gt2003034m  s_dead_Alt6_cd4gt2003539m  
s_dead_Alt6_cd4gt2004044m  s_dead_Alt6_cd4gt2004549m  s_dead_Alt6_cd4gt2005054m  s_dead_Alt6_cd4gt2005559m  s_dead_Alt6_cd4gt2006064m  
s_dead_Alt6_cd4gt2006569m  s_dead_Alt6_cd4gt2007074m  s_dead_Alt6_cd4gt2007579m  s_dead_Alt6_cd4gt2008084m  
s_dead_Alt6_cd4gt2001519w  s_dead_Alt6_cd4gt2002024w  s_dead_Alt6_cd4gt2002529w  s_dead_Alt6_cd4gt2003034w  s_dead_Alt6_cd4gt2003539w  
s_dead_Alt6_cd4gt2004044w  s_dead_Alt6_cd4gt2004549w  s_dead_Alt6_cd4gt2005054w  s_dead_Alt6_cd4gt2005559w  s_dead_Alt6_cd4gt2006064w  
s_dead_Alt6_cd4gt2006569w  s_dead_Alt6_cd4gt2007074w  s_dead_Alt6_cd4gt2007579w  s_dead_Alt6_cd4gt2008084w  

s_dead_Agt6_cd4lt200_m  s_dead_Agt6_cd4lt200_w  
s_dead_Agt6_cd4lt2001519m  s_dead_Agt6_cd4lt2002024m  s_dead_Agt6_cd4lt2002529m  s_dead_Agt6_cd4lt2003034m  s_dead_Agt6_cd4lt2003539m  
s_dead_Agt6_cd4lt2004044m  s_dead_Agt6_cd4lt2004549m  s_dead_Agt6_cd4lt2005054m  s_dead_Agt6_cd4lt2005559m  s_dead_Agt6_cd4lt2006064m  
s_dead_Agt6_cd4lt2006569m  s_dead_Agt6_cd4lt2007074m  s_dead_Agt6_cd4lt2007579m  s_dead_Agt6_cd4lt2008084m  
s_dead_Agt6_cd4lt2001519w  s_dead_Agt6_cd4lt2002024w  s_dead_Agt6_cd4lt2002529w  s_dead_Agt6_cd4lt2003034w  s_dead_Agt6_cd4lt2003539w  
s_dead_Agt6_cd4lt2004044w  s_dead_Agt6_cd4lt2004549w  s_dead_Agt6_cd4lt2005054w  s_dead_Agt6_cd4lt2005559w  s_dead_Agt6_cd4lt2006064w  
s_dead_Agt6_cd4lt2006569w  s_dead_Agt6_cd4lt2007074w  s_dead_Agt6_cd4lt2007579w  s_dead_Agt6_cd4lt2008084w  

s_dead_Agt6_cd4gt200_m  s_dead_Agt6_cd4gt200_w  
s_dead_Agt6_cd4gt2001519m  s_dead_Agt6_cd4gt2002024m  s_dead_Agt6_cd4gt2002529m  s_dead_Agt6_cd4gt2003034m  s_dead_Agt6_cd4gt2003539m  
s_dead_Agt6_cd4gt2004044m  s_dead_Agt6_cd4gt2004549m  s_dead_Agt6_cd4gt2005054m  s_dead_Agt6_cd4gt2005559m  s_dead_Agt6_cd4gt2006064m  
s_dead_Agt6_cd4gt2006569m  s_dead_Agt6_cd4gt2007074m  s_dead_Agt6_cd4gt2007579m  s_dead_Agt6_cd4gt2008084m  
s_dead_Agt6_cd4gt2001519w  s_dead_Agt6_cd4gt2002024w  s_dead_Agt6_cd4gt2002529w  s_dead_Agt6_cd4gt2003034w  s_dead_Agt6_cd4gt2003539w  
s_dead_Agt6_cd4gt2004044w  s_dead_Agt6_cd4gt2004549w  s_dead_Agt6_cd4gt2005054w  s_dead_Agt6_cd4gt2005559w  s_dead_Agt6_cd4gt2006064w  
s_dead_Agt6_cd4gt2006569w  s_dead_Agt6_cd4gt2007074w  s_dead_Agt6_cd4gt2007579w  s_dead_Agt6_cd4gt2008084w  ;

proc sort; by run; run;
