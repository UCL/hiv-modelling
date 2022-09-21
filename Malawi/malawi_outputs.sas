libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Deaths Malawi\";

data a;
set a.malawi_9;
if run=. then delete;
proc sort;by run;run;

data sf;
set a;
 
if cald=2022.5;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = 10000000 / s_alive;
keep s_alive run sf_2022;

proc sort; by run;run;

%let sf=sf_2022;

proc freq;table s_dead_undiag;run;

data b; 
merge a sf;
by run ;

s_primary1564m = s_primary1549m + s_primary5054m + s_primary5559m + s_primary6064m;
s_primary1564w = s_primary1549w + s_primary5054w + s_primary5559w + s_primary6064w;


* n_alive;						n_alive = s_alive * &sf;
* n_alive_m;					n_alive_m = s_alive_m * &sf;
* n_alive_w;					n_alive_w = s_alive_w * &sf;

* prevalence1564m;				prevalence1564m = s_hiv1564m  / s_alive1564_m ;
* prevalence1564w;				prevalence1564w = s_hiv1564w  / s_alive1564_w ;
* prevalence1564;				prevalence1564 = (s_hiv1564w  + s_hiv1564m ) / (s_alive1564_w + s_alive1564_m);

* incidence1564;                incidence1564 = (s_primary * 4 * 100) / (s_alive1564  - s_hiv1564  + s_primary);
* incidence1564_m;              incidence1564_m = (s_primary1564m * 4 * 100) / (s_alive1564_m  - s_hiv1564m  + s_primary1564m);
* incidence1564_w;              incidence1564_w = (s_primary1564w * 4 * 100) / (s_alive1564_w  - s_hiv1564w  + s_primary1564w);

* p_diag;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_m;						if s_hivge15m  > 0 then p_diag_m = s_diag_m / s_hivge15m ;  p_diag_m = p_diag_m * 100;
* p_diag_w;						if s_hivge15w  > 0 then p_diag_w = s_diag_w / s_hivge15w ;  p_diag_w = p_diag_w * 100;

run;


run;



keep cald
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

s_dead_int_Alt6_rescd4lt200_m  s_dead_int_Alt6_rescd4lt200_w  
s_dead_int_Alt6_rescd4lt2001519m  s_dead_int_Alt6_rescd4lt2002024m  s_dead_int_Alt6_rescd4lt2002529m  s_dead_int_Alt6_rescd4lt2003034m  s_dead_int_Alt6_rescd4lt2003539m  
s_dead_int_Alt6_rescd4lt2004044m  s_dead_int_Alt6_rescd4lt2004549m  s_dead_int_Alt6_rescd4lt2005054m  s_dead_int_Alt6_rescd4lt2005559m   s_dead_int_Alt6_rescd4lt2006064m  
s_dead_int_Alt6_rescd4lt2006569m  s_dead_int_Alt6_rescd4lt2007074m  s_dead_int_Alt6_rescd4lt2007579m  s_dead_int_Alt6_rescd4lt2008084m  
s_dead_int_Alt6_rescd4lt2001519w  s_dead_int_Alt6_rescd4lt2002024w  s_dead_int_Alt6_rescd4lt2002529w  s_dead_int_Alt6_rescd4lt2003034w  s_dead_int_Alt6_rescd4lt2003539w  
s_dead_int_Alt6_rescd4lt2004044w  s_dead_int_Alt6_rescd4lt2004549w  s_dead_int_Alt6_rescd4lt2005054w  s_dead_int_Alt6_rescd4lt2005559w   s_dead_int_Alt6_rescd4lt2006064w  
s_dead_int_Alt6_rescd4lt2006569w  s_dead_int_Alt6_rescd4lt2007074w  s_dead_int_Alt6_rescd4lt2007579w  s_dead_int_Alt6_rescd4lt2008084w  

s_dead_int_Alt6_rescd4gt200_m  s_dead_int_Alt6_rescd4gt200_w  
s_dead_int_Alt6_rescd4gt2001519m  s_dead_int_Alt6_rescd4gt2002024m  s_dead_int_Alt6_rescd4gt2002529m  s_dead_int_Alt6_rescd4gt2003034m  s_dead_int_Alt6_rescd4gt2003539m  
s_dead_int_Alt6_rescd4gt2004044m  s_dead_int_Alt6_rescd4gt2004549m  s_dead_int_Alt6_rescd4gt2005054m  s_dead_int_Alt6_rescd4gt2005559m   s_dead_int_Alt6_rescd4gt2006064m  
s_dead_int_Alt6_rescd4gt2006569m  s_dead_int_Alt6_rescd4gt2007074m  s_dead_int_Alt6_rescd4gt2007579m  s_dead_int_Alt6_rescd4gt2008084m  
s_dead_int_Alt6_rescd4gt2001519w  s_dead_int_Alt6_rescd4gt2002024w  s_dead_int_Alt6_rescd4gt2002529w  s_dead_int_Alt6_rescd4gt2003034w  s_dead_int_Alt6_rescd4gt2003539w  
s_dead_int_Alt6_rescd4gt2004044w  s_dead_int_Alt6_rescd4gt2004549w  s_dead_int_Alt6_rescd4gt2005054w  s_dead_int_Alt6_rescd4gt2005559w   s_dead_int_Alt6_rescd4gt2006064w  
s_dead_int_Alt6_rescd4gt2006569w  s_dead_int_Alt6_rescd4gt2007074w  s_dead_int_Alt6_rescd4gt2007579w  s_dead_int_Alt6_rescd4gt2008084w  

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



data c; 
set b;
  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

/* proc means  noprint data=y; var &v; output out=y_19 mean= &v._19; by run ; where 2019.25 <= cald <= 2019.5; */
proc means  noprint data=y; var &v; output out=y_95 mean= &v._95; by run ; where 1994.5 <= cald < 1995.5; 
proc means  noprint data=y; var &v; output out=y_00 mean= &v._00; by run ; where 1999.5 <= cald < 2000.5; 
proc means  noprint data=y; var &v; output out=y_05 mean= &v._05; by run ; where 2004.5 <= cald < 2005.5; 
proc means  noprint data=y; var &v; output out=y_10 mean= &v._10; by run ; where 2009.5 <= cald < 2010.5; 
proc means  noprint data=y; var &v; output out=y_15 mean= &v._15; by run ; where 2014.5 <= cald < 2015.5; 
proc means  noprint data=y; var &v; output out=y_17 mean= &v._17; by run ; where 2016.5 <= cald < 2017.5; 
proc means  noprint data=y; var &v; output out=y_20 mean= &v._20; by run ; where 2019.5 <= cald < 2020.5; 
proc means  noprint data=y; var &v; output out=y_21 mean= &v._21; by run ; where 2020.5 <= cald < 2021.5; 
proc means  noprint data=y; var &v; output out=y_40 mean= &v._40; by run ; where 2039.5 <= cald < 2040.5; 
proc means  noprint data=y; var &v; output out=y_70 mean= &v._70; by run ; where 2069.5 <= cald < 2070.5; 

/* proc means noprint data=y; var &v; output out=y_20b   mean= &v._20b; by run option ; where 2020.25 <= cald < 2020.5; */
/* proc means noprint data=y; var &v; output out=y_20_21 mean= &v._20_21; by run option ; where 2020.25 <= cald < 2021.25;*/   
/* proc means noprint data=y; var &v; output out=y_21 mean= &v._21; by run option ; where cald = 2021.50; */
 proc means noprint data=y; var &v; output out=y_21_22 mean= &v._21_22; by run option ; where 2021.5 <= cald < 2022.50;
 proc means noprint data=y; var &v; output out=y_21_26 mean= &v._21_26; by run option ; where 2021.5 <= cald < 2026.50;
/* proc means noprint data=y; var &v; output out=y_20_30 mean= &v._20_30; by run option ; where 2020.5 <= cald < 2030.50;*/
/* proc means noprint data=y; var &v; output out=y_20_40 mean= &v._20_40; by run option ; where 2020.5 <= cald < 2040.50; */

 proc means noprint data=y; var &v; output out=y_21_71 mean= &v._21_71; by run option ; where 2021.5 <= cald < 2071.00; * deliberate to choose 2071
 - can change to 2071.5 once changes to program made;
  
/* proc sort data=y_20b; by run; proc transpose data=y_20b out=t_20b prefix=&v._20b_; var &v._20b; by run; */ 
/* proc sort data=y_21; by run; proc transpose data=y_21 out=t_21 prefix=&v._21_; var &v._21; by run; */
/*   proc sort data=y_20_21; by run; proc transpose data=y_20_21 out=t_20_21 prefix=&v._20_21_; var &v._20_21; by run;  */
																													   
																													   
 proc sort data=y_21_22; by run; proc transpose data=y_21_22 out=t_21_22 prefix=&v._21_22_; var &v._21_22; by run; 
 proc sort data=y_21_26; by run; proc transpose data=y_21_26 out=t_21_26 prefix=&v._21_26_; var &v._21_26; by run; 
/* proc sort data=y_20_30; by run; proc transpose data=y_20_30 out=t_20_30 prefix=&v._20_30_; var &v._20_30; by run; */
/* proc sort data=y_20_40; by run; proc transpose data=y_20_40 out=t_20_40 prefix=&v._20_40_; var &v._20_40; by run; */
																														

 proc sort data=y_21_71; by run; proc transpose data=y_21_71 out=t_21_71 prefix=&v._21_71_; var &v._21_71; by run;  

data &v ; merge y_95 y_00 y_05 y_10 y_15 y_17 y_20 y_21 y_40 y_70 t_21_26 t_21_22 t_21_71 ;  
drop _NAME_ _TYPE_ _FREQ_;



%mend var;

