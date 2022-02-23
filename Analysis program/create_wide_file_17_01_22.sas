* options user="/folders/myfolders/";

libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\FSW";

data a;
set a.fsw_23_02_22;   
run;

proc sort;
by run cald option;run;


data sf;
set a;
 
if cald=2022;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = 10000000 / s_alive;
keep run sf_2022;
proc sort; by run;run;

data a1; 
merge a sf;
by run ;
run;

data a2;
set a1;

* p_diag;						if s_hiv1564  > 0 and option=0 then p_diag = s_diag / s_hiv1564 ; 

proc sort;by cald;
proc means p50;var p_diag;by cald;run; 



data a2;
set a1;

s_diag_all = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_all_m = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_all_w = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 



if option=0 then do;

***general population;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_all / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;

* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 

* n_sw_1564;					n_sw_1564_0_ = s_sw_1564 * sf_2022;
* n_sw_1549;					n_sw_1549_0_ = s_sw_1549 * sf_2022;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_0_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_0_ = s_sw_1564 / s_alive1564_w ;
* prop_w_1519_sw;				if s_ageg1519w gt 0 then  p_fsw1519_0_ = s_sw_1519 / s_ageg1519w;
* prop_w_1519_sw;				if s_ageg2024w gt 0 then  p_fsw2024_0_ = s_sw_2024 / s_ageg2024w;
* prop_w_1519_sw;				if s_ageg2529w gt 0 then  p_fsw2529_0_ = s_sw_2529 / s_ageg2529w;
* prop_w_1519_sw;				if s_ageg3034w gt 0 then  p_fsw3039_0_ = s_sw_3039 / (s_ageg3034w + s_ageg3539w);

* prop_w_ever_sw;				prop_w_ever_sw_0_ = s_ever_sw / s_alive1564_w ;

**Of FSW, proportion in each age category;
								if s_sw_1564 gt 0 then do; 
* p_sw_age1519_0_;					p_sw_age1519_0_=s_sw_1519/s_sw_1564;
* p_sw_age2024_0_;					p_sw_age2024_0_=s_sw_2024/s_sw_1564;
* p_sw_age2529_0_;					p_sw_age2529_0_=s_sw_2529/s_sw_1564;
* p_sw_age3039_0_;					p_sw_age3039_0_=s_sw_3039/s_sw_1564;
								end;

***CHECK CALCULATION - This has now been updated in the core file;
* p_age_deb_sw1519_;			p_age_deb_sw1519_0_ = s_age_deb_sw1519_ /s_sw_1564;
* p_age_deb_sw2024_;			p_age_deb_sw2024_0_ = s_age_deb_sw2024_ /s_sw_1564;
* p_age_deb_sw2529_;			p_age_deb_sw2529_0_ = s_age_deb_sw2529_ /s_sw_1564;
* p_age_deb_sw3039_;			p_age_deb_sw3039_0_ = s_age_deb_sw3039_ /s_sw_1564;

* sw_episodes;					sw_episodes_0_ = s_episodes_sw/s_ever_sw;
* p_sw_gt1ep;					p_sw_gt1ep_0_   = s_sw_gt1ep     / s_ever_sw;

* duration of sw;				tot_dur_sw_0_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_0_= s_act_dur_sw/ s_sw_1564;
								if s_sw_1564 ne 0 then do;
								p_actdur_0to3_0_   =s_actdur_sw_0to3/s_sw_1564;
								p_actdur_3to5_0_   =s_actdur_sw_3to5/s_sw_1564;
								p_actdur_6to9_0_   =s_actdur_sw_6to9/s_sw_1564;
								p_actdur_10to19_0_ =s_actdur_sw_10to19/s_sw_1564;

								p_totdur_0to3_0_   =s_totdur_sw_0to3/s_sw_1564;
								p_totdur_3to5_0_   =s_totdur_sw_3to5/s_sw_1564;
								p_totdur_6to9_0_   =s_totdur_sw_6to9/s_sw_1564;
								p_totdur_10to19_0_ =s_totdur_sw_10to19/s_sw_1564;
								end;

* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_0_ = s_sw_newp_cat1 /s_sw_1564;
* p_fsw_newp1to5;				if s_sw_1564>0 then p_fsw_newp1to5_0_ = s_sw_newp_cat2 /s_sw_1564;
* p_fsw_newp6to40;				if s_sw_1564>0 then p_fsw_newp6to40_0_ = s_sw_newp_cat3 /s_sw_1564;
* p_fsw_newp41to130;			if s_sw_1564>0 then p_fsw_newp41to130_0_ = s_sw_newp_cat4 /s_sw_1564;
* p_fsw_newpov130;				if s_sw_1564>0 then p_fsw_newpov130_0_ = s_sw_newp_cat5 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp_0_ = s_sw_newp/s_sw_1564;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_0_ = s_sw_newp / s_w_newp ;

* prop_sw_hiv;					prop_sw_hiv_0_ = s_hiv_sw / s_sw_1564 ;

* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis_0_ = s_sw_program_visit / s_sw_1564 ;

* n_tested_sw;					n_tested_sw_0_ = s_tested_sw * sf_2022 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_0_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_0_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_0_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_0_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw_0_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_0_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
* incidence1549;				incidence1549_0_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w_0_ = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m_0_ = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);


***no disadv;
if sw_art_disadv=1 then do;
* n_sw_1549;					n_sw_1549_nodis_0_ = s_sw_1549 * sf_2022;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_nodis_0_ = s_sw_1549 / s_alive1549_w ;
* duration of sw;				tot_dur_sw_nodis_0_= s_tot_dur_sw/ s_sw_1564;

* p_fsw_newp0;					if s_sw_1564 gt 0 then p_fsw_newp0_nodis_0_ = s_sw_newp_cat1 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp_nodis_0_ = s_sw_newp/s_sw_1564;

* prop_sw_hiv;					prop_sw_hiv_nodis_0_ = s_hiv_sw / s_sw_1564 ;
* p_sw_prog_vis;				p_sw_prog_vis_nodis_0_ = s_sw_program_visit / s_sw_1564 ;
* n_tested_sw;					n_tested_sw_nodis_0_ = s_tested_sw * sf_2022 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_nodis_0_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_nodis_0_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_nodis_0_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_nodis_0_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw_nodis_0_ = s_hiv_sw / s_sw_1564; 
* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_nodis_0_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
end;

***some disadv;
if sw_art_disadv=2 then do;
* n_sw_1549;					n_sw_1549_dis_0_ = s_sw_1549 * sf_2022;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_dis_0_ = s_sw_1549 / s_alive1549_w ;
* duration of sw;				tot_dur_sw_dis_0_= s_tot_dur_sw/ s_sw_1564;

* p_fsw_newp0;					if s_sw_1564 gt 0 then p_fsw_newp0_dis_0_ = s_sw_newp_cat1 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp_dis_0_ = s_sw_newp/s_sw_1564;

* prop_sw_hiv;					prop_sw_hiv_dis_0_ = s_hiv_sw / s_sw_1564 ;
* p_sw_prog_vis;				p_sw_prog_vis_dis_0_ = s_sw_program_visit / s_sw_1564 ;
* n_tested_sw;					n_tested_sw_dis_0_ = s_tested_sw * sf_2022 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_dis_0_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_dis_0_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_dis_0_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_dis_0_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw_dis_0_ = s_hiv_sw / s_sw_1564; 
* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_dis_0_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
end;

end;

if option=1 then do;
* n_sw_1564;					n_sw_1564_1_ = s_sw_1564 * sf_2022;
* n_sw_1549;					n_sw_1549_1_ = s_sw_1549 * sf_2022;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_1_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_1_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_1_ = s_ever_sw / s_alive1564_w ;

* duration of sw;				tot_dur_sw_1_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_1_= s_act_dur_sw/ s_sw_1564;

* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_1_ = s_sw_newp_cat1 /s_sw_1564;
* p_fsw_newp1to5;				if s_sw_1564>0 then p_fsw_newp1to5_1_ = s_sw_newp_cat2 /s_sw_1564;
* p_fsw_newp6to40;				if s_sw_1564>0 then p_fsw_newp6to40_1_ = s_sw_newp_cat3 /s_sw_1564;
* p_fsw_newp41to130;			if s_sw_1564>0 then p_fsw_newp41to130_1_ = s_sw_newp_cat4 /s_sw_1564;
* p_fsw_newpov130;				if s_sw_1564>0 then p_fsw_newpov130_1_ = s_sw_newp_cat5 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp_1_ = s_sw_newp/s_sw_1564;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_1_ = s_sw_newp / s_w_newp ;

* prop_sw_hiv;					prop_sw_hiv_1_ = s_hiv_sw / s_sw_1564 ;

* p_sw_prog_vis;				p_sw_prog_vis_1_ = s_sw_program_visit / s_sw_1564 ;

* n_tested_sw;					n_tested_sw_1_ = s_tested_sw * sf_2022 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_1_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw_1_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
* incidence1549;				incidence1549_1_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w_1_ = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m_1_ = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

***no disadv;
if sw_art_disadv=1 then do;
* n_sw_1549;					n_sw_1549_nodis_1_ = s_sw_1549 * sf_2022;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_nodis_1_ = s_sw_1549 / s_alive1549_w ;
* duration of sw;				tot_dur_sw_nodis_1_= s_tot_dur_sw/ s_sw_1564;

* p_fsw_newp0;					if s_sw_1564 gt 0 then p_fsw_newp0_nodis_1_ = s_sw_newp_cat1 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp_nodis_1_ = s_sw_newp/s_sw_1564;

* prop_sw_hiv;					prop_sw_hiv_nodis_1_ = s_hiv_sw / s_sw_1564 ;
* p_sw_prog_vis;				p_sw_prog_vis_nodis_1_ = s_sw_program_visit / s_sw_1564 ;
* n_tested_sw;					n_tested_sw_nodis_1_ = s_tested_sw * sf_2022 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_nodis_1_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_nodis_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_nodis_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_nodis_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw_nodis_1_ = s_hiv_sw / s_sw_1564; 
* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_nodis_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
end;

***some disadv;
if sw_art_disadv=2 then do;
* n_sw_1549;					n_sw_1549_dis_1_ = s_sw_1549 * sf_2022;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_dis_1_ = s_sw_1549 / s_alive1549_w ;
* duration of sw;				tot_dur_sw_dis_1_= s_tot_dur_sw/ s_sw_1564;

* p_fsw_newp0;					if s_sw_1564 gt 0 then p_fsw_newp0_dis_1_ = s_sw_newp_cat1 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp_dis_1_ = s_sw_newp/s_sw_1564;

* prop_sw_hiv;					prop_sw_hiv_dis_1_ = s_hiv_sw / s_sw_1564 ;
* p_sw_prog_vis;				p_sw_prog_vis_dis_1_ = s_sw_program_visit / s_sw_1564 ;
* n_tested_sw;					n_tested_sw_dis_1_ = s_tested_sw * sf_2022 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_dis_1_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_dis_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_dis_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_dis_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw_dis_1_ = s_hiv_sw / s_sw_1564; 
* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_dis_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
end;

end;

run;

proc freq;table cald;where option=1;run;

data b;
set a2;

proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***gives each simulation an id;
proc means max data=b;var count_csim;run; ***number of simulations - this is manually inputted in nfit below;
%let nfit=400;  
run;

data c;
set b;

%let var =  

p_diag	 p_diag_m	 p_diag_w   p_onart_diag   p_onart_diag_w   p_onart_diag_m   p_onart_vl1000_w   p_onart_vl1000_m


n_sw_1564_0_  	 	 n_sw_1549_0_ 	   	  prop_w_1564_sw_0_		prop_w_1549_sw_0_ 	 prop_w_ever_sw_0_  
p_fsw1519_0_	  	 p_fsw2024_0_		  p_fsw2529_0_			p_fsw3039_0_	
p_sw_age1519_0_	  	 p_sw_age2024_0_	  p_sw_age2529_0_ 		p_sw_age3039_0_
p_age_deb_sw1519_0_  p_age_deb_sw2024_0_  p_age_deb_sw2529_0_   p_age_deb_sw3039_0_

sw_episodes_0_ 	  	 p_sw_gt1ep_0_
p_fsw_newp0_0_   	 p_fsw_newp1to5_0_    p_fsw_newp6to40_0_  	p_fsw_newp41to130_0_  p_fsw_newpov130_0_
av_sw_newp_0_ 		 p_newp_sw_0_

tot_dur_sw_0_  		 act_dur_sw_0_  	 
p_actdur_0to3_0_  	 p_actdur_3to5_0_     p_actdur_6to9_0_  	p_actdur_10to19_0_ 
p_totdur_0to3_0_  	 p_totdur_3to5_0_     p_totdur_6to9_0_  	p_totdur_10to19_0_ 

p_sw_prog_vis_0_  prop_sw_hiv_0_  

n_tested_sw_0_    prop_sw_onprep_0_  prevalence_sw_0_  incidence_sw_0_  p_diag_sw_0_  p_onart_diag_sw_0_
p_onart_vl1000_sw_0_

n_sw_1549_nodis_0_ 		 prop_w_1549_sw_nodis_0_  	tot_dur_sw_nodis_0_
p_fsw_newp0_nodis_0_ 	 av_sw_newp_nodis_0_		prop_sw_hiv_nodis_0_  	p_sw_prog_vis_nodis_0_  	
n_tested_sw_nodis_0_	 prop_sw_onprep_nodis_0_    p_diag_sw_nodis_0_  	p_onart_diag_sw_nodis_0_	p_onart_vl1000_sw_nodis_0_	
prevalence_sw_nodis_0_   incidence_sw_nodis_0_ 
n_sw_1549_dis_0_ 		 prop_w_1549_sw_dis_0_  	tot_dur_sw_dis_0_
p_fsw_newp0_dis_0_ 	 	 av_sw_newp_dis_0_			prop_sw_hiv_dis_0_  	p_sw_prog_vis_dis_0_  	
n_tested_sw_dis_0_	 	 prop_sw_onprep_dis_0_    	p_diag_sw_dis_0_ 	 	p_onart_diag_sw_dis_0_		p_onart_vl1000_sw_dis_0_	
prevalence_sw_dis_0_   	 incidence_sw_dis_0_  


n_sw_1564_1_ 		n_sw_1549_1_  			prop_w_1564_sw_1_ 	prop_w_1549_sw_1_ 	  prop_w_ever_sw_1_
p_sw_prog_vis_1_  	prop_sw_hiv_1_

p_fsw_newp0_1_   	p_fsw_newp1to5_1_   	p_fsw_newp6to40_1_  p_fsw_newp41to130_1_  p_fsw_newpov130_1_
av_sw_newp_1_  		p_newp_sw_1_  

tot_dur_sw_1_  		act_dur_sw_1_

n_tested_sw_1_		prop_sw_onprep_1_  prevalence_sw_1_  incidence_sw_1_  p_diag_sw_1_  p_onart_diag_sw_1_
p_onart_vl1000_sw_1_

n_sw_1549_nodis_1_ 		 prop_w_1549_sw_nodis_1_  	tot_dur_sw_nodis_1_
p_fsw_newp0_nodis_1_ 	 av_sw_newp_nodis_1_		prop_sw_hiv_nodis_1_  	p_sw_prog_vis_nodis_1_  	
n_tested_sw_nodis_1_	 prop_sw_onprep_nodis_1_    p_diag_sw_nodis_1_  	p_onart_diag_sw_nodis_1_	p_onart_vl1000_sw_nodis_1_	
prevalence_sw_nodis_1_   incidence_sw_nodis_1_ 
n_sw_1549_dis_1_ 		 prop_w_1549_sw_dis_1_  	tot_dur_sw_dis_1_
p_fsw_newp0_dis_1_ 	 	 av_sw_newp_dis_1_			prop_sw_hiv_dis_1_  	p_sw_prog_vis_dis_1_  	
n_tested_sw_dis_1_	 	 prop_sw_onprep_dis_1_    	p_diag_sw_dis_1_ 	 	p_onart_diag_sw_dis_1_		p_onart_vl1000_sw_dis_1_	
prevalence_sw_dis_1_   	 incidence_sw_dis_1_  

incidence1549_0_  incidence1549w_0_  incidence1549m_0_
incidence1549_1_  incidence1549w_1_  incidence1549m_1_  

;

***transpose given name; *starts with %macro and ends with %mend;
%macro transpose;
%let p25_var = p25_&var;
%let p75_var = p75_&var;
%let p5_var = p5_&var;
%let p95_var = p95_&var;
%let p50_var = median_&var;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=c out=a&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data a&count;set a&count;***creates one dataset per variable;
p25_&varb  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb = median(of &varb.1-&varb.&nfit);

keep cald p5_&varb p95_&varb p50_&varb p25_&varb p75_&varb;
run;

      proc datasets nodetails nowarn nolist; 
      delete  aa&count;quit;run;
%end;
%mend;


%transpose;
run;

data d;
merge b
a1   a2   a3   a4   a5   a6   a7   a8   a9   a10  a11  a12  a13  a14  a15  a16  a17  a18  a19  a20  a21  a22  a23  a24  a25  a26 
a27  a28  a29  a30  a31  a32  a33  a34  a35  a36  a37  a38  a39  a40  a41  a42  a43  a44  a45  a46  a47  a48  a49  a50  a51  a52 
a53  a54  a55  a56  a57  a58  a59  a60  a61  a62  a63  a64  a65  a66  a67  a68  a69  a70  a71  a72  a73  a74  a75  a76  a77  a78 
a79  a80  a81  a82  a83  a84  a85  a86  a87  a88  a89  a90  a91  a92  a93  a94  a95  a96  a97  a98  a99  a100 a101 a102 a103 a104
a105 a106 a107 a108 a109 a110 a111 a112 a113 a114 a115 a116 a117 a118 a119 a120 a121 a122 a123 a124 a125 a126 a127 a128 a129 a130
a131 a132 a133 a134 a135 a136 a137 a138 /*a139 a140 a141 a142 a143 a144 a145 a146 a147 a148 a149 a150 a151 a152 a153 a154 a155 a156
a157 a158 a159 a160 a161 a162 a163 a164 a165 a166 a167 a168 a169 a170 a171 a172 a173 a174 a175 a176 a177 a178 a179 a180 a181 a182
a183 a184 a185 a186 a187 a188 a189 a190 a191 a192 a193 a194 a195 a196 a197 a198 a199 a200 a201 a202 a203 a204 a205 a206 a207 a208
a209 a210 a211 a212 a213 a214 a215 a216 a217 a218 a219 a220 a221 a222 a223 a224 a225 a226 a227 a228 a229 a230 a231 a232 a233 a234
a235 a236 a237 a238 a239 a240 a241 a242 a243 a244 a245 a246 a247 a248 a249 a250 a251 a252*/;
;by cald;
run;

data e;
set d;
%include '"C:\Loveleen\Synthesis model\Zim\Calibration\Observed data_Zimbabwe_LBMMay2017.sas"'; by cald;
run;

ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Loveleen\Synthesis model\Zim\FSW\23Feb2022.doc' startpage=never; 

proc sgplot data=e; 
Title    height=1.5 justify=center "Of HIV+ people, proportion diagnosed";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Percentage'              labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label p50_p_diag	                  = "All";
label p50_p_diag_m	                  = "Men";
label p50_p_diag_w	                  = "Women";

series  x=cald y=p50_p_diag  /          lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag    	 upper=p95_p_diag / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m  /          lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_m     upper=p95_p_diag_m / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w  /          lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w     upper=p95_p_diag_w / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of people diagnosed, proportion on ART";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'              labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label p50_p_onart_diag                  = "All";
label p50_p_onart_diag_m	            = "Men";
label p50_p_onart_diag_w	            = "Women";

series  x=cald y=p50_p_onart_diag  /          lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag     upper=p95_p_onart_diag / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_m  /          lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_diag_m     upper=p95_p_onart_diag_m / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_w  /          lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w     upper=p95_p_onart_diag_w / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Of people on ART, proportion with VL<1000";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'              labelattrs=(size=12)  values = (0 to 1 by 0.2)  valueattrs=(size=10);
label p50_p_onart_vl1000_m	            = "Men";
label p50_p_onart_vl1000_w	            = "Women";

series  x=cald y=p50_p_onart_vl1000_m  /          lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m     upper=p95_p_onart_vl1000_m / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_w  /          lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w     upper=p95_p_onart_vl1000_w / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 130000)  valueattrs=(size=10);
label p50_n_sw_1549_0_	                  = "model age 15-49 (median)";

label o_pop_fsw_1549w_Fearnon			  = "All FSW age 15-49 - Fearon";
series  x=cald y=p50_n_sw_1549_0_  /          lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549_0_      upper=p95_n_sw_1549_0_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearnon / markerattrs = (symbol=circle color=black size = 12)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearnon yerrorupper=o_pop_fsw_ul_1549w_Fearnon errorbarattrs= (color=black thickness = 2);
run;quit;
 

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label p50_prop_w_1549_sw_0_   = "model - median ";

label o_p_fsw_ab1ts6m_1849w_nbcs = "NBCP: >  1 TSP (age 18-49)";
label o_p_fsw_1549w_Fearnon		 = "Fearon 15-49";

series  x=cald y=p50_prop_w_1549_sw_0_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0_ 	 upper=p95_prop_w_1549_sw_0_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_ab1ts6m_1849w_nbcs / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_1549w_Fearnon / markerattrs = (symbol=circle       color=green size = 12)
										 yerrorlower=o_p_fsw_ll_1549w_Fearnon yerrorupper=o_p_fsw_ul_1549w_Fearnon errorbarattrs= (color=green thickness = 2);
run;quit;


proc sgplot data=e; 
footnote "";
title    height=1.5 justify=center "Proportion of women who are sex workers stratified by age";

xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.08 by 0.01) 		valueattrs=(size=10);
label p50_p_fsw1519_0_   = "15-19";
label p50_p_fsw2024_0_   = "20-24";
label p50_p_fsw2529_0_   = "25-29";
label p50_p_fsw3039_0_   = "30-39";

series  x=cald y=p50_p_fsw1519_0_ / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_fsw1519_0_	 upper=p95_p_fsw1519_0_ / transparency=0.9 fillattrs = (color=black) legendlabel= "15-19 90% range";
series  x=cald y=p50_p_fsw2024_0_ / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw2024_0_	 upper=p95_p_fsw2024_0_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "20-24 90% range";
series  x=cald y=p50_p_fsw2529_0_ / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_fsw2529_0_	 upper=p95_p_fsw2529_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29 90% range";
series  x=cald y=p50_p_fsw3039_0_ / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_fsw3039_0_	 upper=p95_p_fsw3039_0_ / transparency=0.9 fillattrs = (color=green) legendlabel= "30-39 90% range";

run;quit;



proc sgplot data=e; 
footnote1 height=0.9  "Observed data are RDS weighted means from HIV Care Cascade among FSW, Cowan 2017 ";
title    height=1.5 justify=center "Amongst FSW, proportion in each age category";
xaxis label =		 'Year'  labelattrs=(size=12) values = (2010 to 2030 by 2) 		  valueattrs=(size=10); 
yaxis grid label = 	 'Proportion'	 labelattrs=(size=12) values = (0 to 0.6 by 0.1)			  valueattrs=(size=10);
label p50_p_sw_age1519_0_   	= "15-19 Model";
label p50_p_sw_age2024_0_   	= "20-24 Model";
label p50_p_sw_age2529_0_   	= "25-29 Model";
label p50_p_sw_age3039_0_   	= "30-39 Model";

label o_p_1824_fsw_rds = "18-24 RDS 2017";
label o_p_2529_fsw_rds = "25-29 RDS 2017";
label o_p_3039_fsw_rds = "30-39 RDS 2017";
label o_p_ab40_fsw_rds = ">40 RDS 2017";

series  x=cald y=p50_p_sw_age1519_0_     / 		lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_sw_age1519_0_    		upper=p95_p_sw_age1519_0_  / transparency=0.9 fillattrs = (color=black)  legendlabel= "15-19 90% range";
series  x=cald y=p50_p_sw_age2024_0_     / 		lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_age2024_0_    		upper=p95_p_sw_age2024_0_  / transparency=0.9 fillattrs = (color=blue)  legendlabel= "20-24 90% range";
series  x=cald y=p50_p_sw_age2529_0_     / 		lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_age2529_0_    		upper=p95_p_sw_age2529_0_  / transparency=0.9 fillattrs = (color=red)  legendlabel= "25-29 90% range";
series  x=cald y=p50_p_sw_age3039_0_     / 		lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_age3039_0_    		upper=p95_p_sw_age3039_0_  / transparency=0.9 fillattrs = (color=green)  legendlabel= "30-39 90% range";

scatter x=cald y=o_p_1824_fsw_rds / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_2529_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_rds / markerattrs = (symbol=circle       color=green size = 12);
run;quit;


proc sgplot data=e; 
footnote1 height=0.9  "";
title    height=1.5 justify=center "Number of episodes of sex work ";
xaxis label =		 'Year'  labelattrs=(size=12) values = (2010 to 2030 by 2) 		  valueattrs=(size=10); 
yaxis grid label = 	 'Episodes'	 labelattrs=(size=12) 		  valueattrs=(size=10);
label p50_sw_episodes_0_  	= "Model (median)";

series  x=cald y=p50_sw_episodes_0_     / 		lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_sw_episodes_0_   		upper=p95_sw_episodes_0_ / transparency=0.9 fillattrs = (color=red)  legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
footnote1 height=0.9  "";
title    height=1.5 justify=center "Proportion of FSW with >1 episode of sex work ";
xaxis label =		 'Year'  labelattrs=(size=12) values = (2010 to 2030 by 2) 		  valueattrs=(size=10); 
yaxis grid label = 	 'Proportion'	 labelattrs=(size=12) 		  valueattrs=(size=10);
label p50_p_sw_gt1ep_0_  	= "Model";

series  x=cald y=p50_p_sw_gt1ep_0_    / 		lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_gt1ep_0_   		upper=p95_p_sw_gt1ep_0_ / transparency=0.9 fillattrs = (color=red)  legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
footnote1 height=0.9  "";
title    height=1.5 justify=center "Age debut of female sex workers";

xaxis label =		 'Year'  		labelattrs=(size=12)	values = (2010 to 2030 by 2) 		 valueattrs=(size=10); 
yaxis grid label = 	 'Proportion'	labelattrs=(size=12) 	values = (0 to 1 by 0.1)			 valueattrs=(size=10);
label p50_p_age_deb_sw1519_0_ 		= "Model 15-19";
label p50_p_age_deb_sw2024_0_ 		= "Model 20-24";
label p50_p_age_deb_sw2529_0_ 		= "Model 25-29";
label p50_p_age_deb_sw3039_0_ 		= "Model 30-39";
label o_p_fsw_agedeb1519_rds		= "RDS 2013 <=19";
label o_p_fsw_agedeb2024_rds		= "RDS 2013 20-24";
label o_p_fsw_agedeb2529_rds		= "RDS 2013 25-29";
label o_p_fsw_agedebge30_rds		= "RDS 2013 >=30";

series  x=cald y=p50_p_age_deb_sw1519_0_  / 		lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_age_deb_sw1519_0_ 		upper=p95_p_age_deb_sw1519_0_ / 		transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_age_deb_sw2024_0_  / 		lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_age_deb_sw2024_0_ 		upper=p95_p_age_deb_sw2024_0_ / 		transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_age_deb_sw2529_0_  / 		lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_age_deb_sw2529_0_ 		upper=p95_p_age_deb_sw2529_0_ / 		transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_age_deb_sw3039_0_  / 		lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_age_deb_sw3039_0_ 		upper=p95_p_age_deb_sw3039_0_ / 		transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_p_fsw_agedeb1519_rds / markerattrs = (symbol=circle       color=black size = 12);
scatter x=cald y=o_p_fsw_agedeb2024_rds / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_agedeb2529_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_fsw_agedebge30_rds / markerattrs = (symbol=circle       color=green size = 12);

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of FSW with zero of condomless partners per 3 months";
xaxis label =		 'Year'  labelattrs=(size=12) values = (2010 to 2030 by 2) 		  valueattrs=(size=10); 
yaxis grid label = 	 'Proportion'	 labelattrs=(size=12) values = (0 to 1 by 0.2)			  valueattrs=(size=10);
label p50_p_fsw_newp0_0_  	= "0 partners";

series  x=cald y=p50_p_fsw_newp0_0_     / 		lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_0_    		upper=p95_p_fsw_newp0_0_  / transparency=0.9 fillattrs = (color=black)  legendlabel= "0 partners 90% range";

run;quit;



proc sgplot data=e; 
footnote1 height=0.9  "DREAMS 'no condomless sex in last month, Sapphire consistent condom use in last month";

title    height=1.5 justify=center "Number of condomless partners per 3 months amongst FSW";
xaxis label =		 'Year'  labelattrs=(size=12) values = (2010 to 2030 by 2) 		  valueattrs=(size=10); 
yaxis grid label = 	 'Proportion'	 labelattrs=(size=12) values = (0 to 1 by 0.2)			  valueattrs=(size=10);
label p50_p_fsw_newp0_0_  	= "0 partners Model";
label p50_p_fsw_newp1to5_0_  	= "1 - 5 partners Model";
label p50_p_fsw_newp6to40_0_  	= "6 - 40 partners Model";
label p50_p_fsw_newp41to130_0_ 	= "41 - 130 partners Model";
label p50_p_fsw_newpov130_0_  	= ">130 partners Model";

label o_ccu_dreams = "0 condomless partners in last month, DREAMS";
label o_ccu_sapphire = "0 condomless partners in last month, Sapphire";

series  x=cald y=p50_p_fsw_newp0_0_     / 		lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_0_    		upper=p95_p_fsw_newp0_0_  / transparency=0.9 fillattrs = (color=black)  legendlabel= "0 partners 90% range";
series  x=cald y=p50_p_fsw_newp1to5_0_     / 		lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw_newp1to5_0_    		upper=p95_p_fsw_newp1to5_0_  / transparency=0.9 fillattrs = (color=blue)  legendlabel= "1 to 5 partners 90% range";
series  x=cald y=p50_p_fsw_newp6to40_0_     / 		lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_fsw_newp6to40_0_    		upper=p95_p_fsw_newp6to40_0_  / transparency=0.9 fillattrs = (color=green)  legendlabel= "6 to 40 partners 90% range";
series  x=cald y=p50_p_fsw_newp41to130_0_     / 	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_fsw_newp41to130_0_    	upper=p95_p_fsw_newp41to130_0_  / transparency=0.9 fillattrs = (color=red)  legendlabel= "41 to 130 partners 90% range";
series  x=cald y=p50_p_fsw_newpov130_0_     / 		lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_p_fsw_newpov130_0_    		upper=p95_p_fsw_newpov130_0_  / transparency=0.9 fillattrs = (color=purple)  legendlabel= ">130 partners 90% range";

scatter x=cald y=o_ccu_dreams/ markerattrs = (symbol=circle       color=black size = 12);
scatter x=cald y=o_ccu_sapphire / markerattrs = (symbol=circle       color=blue size = 12);

run;quit;


proc sgplot data=e; 
Footnote "RDS data: <3y=22%, 3-5y=29%, 6-9y=24%, 10-29y=19%, >29y=6%";
Title    height=1.5 justify=center "Duration of sex work";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Median number of years'          labelattrs=(size=12)  valueattrs=(size=10);
label p50_tot_dur_sw_0_ = "Median duration of sex work";
label p50_act_dur_sw_0_ = "Median duration of active sex work";

series  x=cald y=p50_tot_dur_sw_0_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_tot_dur_sw_0_      upper=p95_tot_dur_sw_0_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "Total 90% range";
series  x=cald y=p50_act_dur_sw_0_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_act_dur_sw_0_      upper=p95_act_dur_sw_0_ / transparency=0.9 fillattrs = (color=green) legendlabel= "Active 90% range";

run;quit;


proc sgplot data=e; 
footnote "";
title    height=1.5 justify=center "Proportion of FSW with active duration of sex work in given categories";

xaxis label =		 'Year'  labelattrs=(size=12) values = (2010 to 2030 by 2) 		  valueattrs=(size=10); 
yaxis grid label = 	 'Proportion'	 labelattrs=(size=12) 	values = (0 to 1 by 0.2)  valueattrs=(size=10);
label p50_p_actdur_0to3_0_ = "0 to 3 years";
label p50_p_actdur_3to5_0_ = "3 to 5 years";
label p50_p_actdur_6to9_0_ = "6 to 9 years";
label p50_p_actdur_10to19_0_ = "10 to 19 years";

series  x=cald y=p50_p_actdur_0to3_0_  / 		lineattrs = (color=black thickness = 2 );
band    x=cald lower=p5_p_actdur_0to3_0_ 		upper=p95_p_actdur_0to3_0_/ 	transparency=0.9 fillattrs = (color=black) legendlabel= "0-3y Range";
series  x=cald y=p50_p_actdur_3to5_0_  / 		lineattrs = (color=blue thickness = 2 );
band    x=cald lower=p5_p_actdur_3to5_0_ 		upper=p95_p_actdur_3to5_0_ / 	transparency=0.9 fillattrs = (color=blue) legendlabel= "3-5y Range";
series  x=cald y=p50_p_actdur_6to9_0_  / 		lineattrs = (color=red thickness = 2 );
band    x=cald lower=p5_p_actdur_6to9_0_		upper=p95_p_actdur_6to9_0_ / 	transparency=0.9 fillattrs = (color=red) legendlabel= "6-9y Range";
series  x=cald y=p50_p_actdur_10to19_0_  / 	lineattrs = (color=green thickness = 2 );
band    x=cald lower=p5_p_actdur_10to19_0_ 	upper=p95_p_actdur_10to19_0_ / transparency=0.9 fillattrs = (color=green) legendlabel= "10-19y Range";
run;quit;

proc sgplot data=e; 
footnote1 height=0.9  "Observed data from Targeted combination prevention to support FSW - 'time in sex work'";
title    height=1.5 justify=center "Proportion of FSW with total duration of sex work in given categories";

xaxis label =		 'Year'  labelattrs=(size=12) values = (2010 to 2030 by 2) 		  valueattrs=(size=10); 
yaxis grid label = 	 'Proportion'	 labelattrs=(size=12) 	values = (0 to 0.5 by 0.1)  valueattrs=(size=10);
label p50_p_totdur_0to3_0_ = "0 to 3y Model";
label p50_p_totdur_3to5_0_ = "3 to 5y Model";
label p50_p_totdur_6to9_0_ = "6 to 9y Model";
label p50_p_totdur_10to19_0_ = "10 to 19y Model";

label o_p_dur_0to3y_rds = "0 to 3y RDS";
label o_p_dur_3to5y_rds = "3 to 5y RDS";
label o_p_dur_6to9y_rds = "6 to 9y RDS";
label o_p_dur_10to19y_rds = "10 to 19y RDS";

series  x=cald y=p50_p_totdur_0to3_0_  / 		lineattrs = (color=black thickness = 2 );
band    x=cald lower=p5_p_totdur_0to3_0_ 		upper=p95_p_totdur_0to3_0_/ 	transparency=0.9 fillattrs = (color=black) legendlabel= "Model Range";
series  x=cald y=p50_p_totdur_3to5_0_  / 		lineattrs = (color=blue thickness = 2 );
band    x=cald lower=p5_p_totdur_3to5_0_ 		upper=p95_p_totdur_3to5_0_ / 	transparency=0.9 fillattrs = (color=blue) legendlabel= "Model Range";
series  x=cald y=p50_p_totdur_6to9_0_  / 		lineattrs = (color=red thickness = 2 );
band    x=cald lower=p5_p_totdur_6to9_0_		upper=p95_p_totdur_6to9_0_ / 	transparency=0.9 fillattrs = (color=red) legendlabel= "Model Range";
series  x=cald y=p50_p_totdur_10to19_0_  / 	lineattrs = (color=green thickness = 2 );
band    x=cald lower=p5_p_totdur_10to19_0_ 	upper=p95_p_totdur_10to19_0_ / transparency=0.9 fillattrs = (color=green) legendlabel= "Model Range";

scatter x=cald y=o_p_dur_0to3y_rds / markerattrs = (symbol=circle       color=black size = 12);
scatter x=cald y=o_p_dur_3to5y_rds / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_dur_6to9y_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_dur_10to19y_rds / markerattrs = (symbol=circle       color=green size = 12);
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Assuming a sex-worker program is in place, proportion of sex workers who have a program visit";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 1 by 0.2) 		valueattrs=(size=10);
label p50_p_sw_prog_vis_0_ = "Proportion with a program visit - no prog";
label p50_p_sw_prog_vis_1_ = "Proportion with a program visit";

series  x=cald y=p50_p_sw_prog_vis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_0_ 	 upper=p95_p_sw_prog_vis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_sw_prog_vis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_1_ 	 upper=p95_p_sw_prog_vis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of HIV+ FSW diagnosed (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_0_  = "% diagnosed with no SW program ";
label p50_p_diag_sw_1_  = "% diagnosed with SW program ";

series  x=cald y=p50_p_diag_sw_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_0_ 	 upper=p95_p_diag_sw_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_ 	 upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of HIV+ FSW without disadvantages diagnosed (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_nodis_0_  = "% FSW without disadvantages diagnosed with no SW program ";
label p50_p_diag_sw_nodis_1_  = "% FSW without disadvantages diagnosed with SW program ";

series  x=cald y=p50_p_diag_sw_nodis_0_   / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_0_  	 upper=p95_p_diag_sw_nodis_0_  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_diag_sw_nodis_1_   / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_1_  	 upper=p95_p_diag_sw_nodis_1_  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of HIV+ FSW with disadvantages diagnosed (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_dis_0_  = "% FSW with disadvantages diagnosed with no SW program ";
label p50_p_diag_sw_dis_1_  = "% FSW with disadvantages diagnosed with SW program ";

series  x=cald y=p50_p_diag_sw_dis_0_   / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_dis_0_  	 upper=p95_p_diag_sw_dis_0_  / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_diag_sw_dis_1_   / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_dis_1_  	 upper=p95_p_diag_sw_dis_1_  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Of FSW diagnosed, proportion on ART (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_diag_sw_0_  = "% on ART with no SW program ";
label p50_p_onart_diag_sw_1_  = "% on ART with SW program ";

series  x=cald y=p50_p_onart_diag_sw_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_0_ 	 upper=p95_p_onart_diag_sw_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_ 	 upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Of FSW with no disadvantages diagnosed, proportion on ART (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_diag_sw_nodis_0_  = "% on ART with no SW program ";
label p50_p_onart_diag_sw_nodis_1_  = "% on ART with SW program ";

series  x=cald y=p50_p_onart_diag_sw_nodis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_0_ 	 upper=p95_p_onart_diag_sw_nodis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_sw_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_1_ 	 upper=p95_p_onart_diag_sw_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Of FSW with disadvantages diagnosed, proportion on ART (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_diag_sw_dis_0_  = "% on ART with no SW program ";
label p50_p_onart_diag_sw_dis_1_  = "% on ART with SW program ";

series  x=cald y=p50_p_onart_diag_sw_dis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_dis_0_ 	 upper=p95_p_onart_diag_sw_dis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_sw_dis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_dis_1_ 	 upper=p95_p_onart_diag_sw_dis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Of those on ART, proportion with VL<1000 copies (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_vl1000_sw_0_  = "% with VL<1000 with no SW program ";
label p50_p_onart_vl1000_sw_1_  = "% with VL<1000 with SW program ";

series  x=cald y=p50_p_onart_vl1000_sw_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_0_ 	 upper=p95_p_onart_vl1000_sw_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_ 	 upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Of FSW without disadvantages on ART, proportion with VL<1000 copies (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_vl1000_sw_nodis_0_ = "% with VL<1000 with no SW program ";
label p50_p_onart_vl1000_sw_nodis_1_  = "% with VL<1000 with SW program ";

series  x=cald y=p50_p_onart_vl1000_sw_nodis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_0_ 	 upper=p95_p_onart_vl1000_sw_nodis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000_sw_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_1_ 	 upper=p95_p_onart_vl1000_sw_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Of FSW with disadvantages on ART, proportion with VL<1000 copies (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_vl1000_sw_dis_0_ = "% with VL<1000 with no SW program ";
label p50_p_onart_vl1000_sw_dis_1_  = "% with VL<1000 with SW program ";

series  x=cald y=p50_p_onart_vl1000_sw_dis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_dis_0_ 	 upper=p95_p_onart_vl1000_sw_dis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000_sw_dis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_dis_1_ 	 upper=p95_p_onart_vl1000_sw_dis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Average number of condomless partners stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_av_sw_newp_0_ = "No sex worker program ";
label p50_av_sw_newp_1_ = "Sex worker program ";

series  x=cald y=p50_av_sw_newp_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_av_sw_newp_0_	 upper=p95_av_sw_newp_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_av_sw_newp_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_av_sw_newp_1_	 upper=p95_av_sw_newp_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Average number of condomless partners stratified by existence of a program amongst FSW with no disadvantages";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_av_sw_newp_nodis_0_ = "No sex worker program ";
label p50_av_sw_newp_nodis_1_ = "Sex worker program ";

series  x=cald y=p50_av_sw_newp_nodis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_av_sw_newp_nodis_0_	 upper=p95_av_sw_newp_nodis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_av_sw_newp_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_av_sw_newp_nodis_1_	 upper=p95_av_sw_newp_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Average number of condomless partners stratified by existence of a program amongst FSW with disadvantages";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_av_sw_newp_dis_0_ = "No sex worker program ";
label p50_av_sw_newp_dis_1_ = "Sex worker program ";

series  x=cald y=p50_av_sw_newp_dis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_av_sw_newp_dis_0_	 upper=p95_av_sw_newp_dis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_av_sw_newp_dis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_av_sw_newp_dis_1_	 upper=p95_av_sw_newp_dis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_fsw_newp0_0_ = "No sex worker program ";
label p50_p_fsw_newp0_1_ = "Sex worker program ";

series  x=cald y=p50_p_fsw_newp0_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_0_	 upper=p95_p_fsw_newp0_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_fsw_newp0_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_1_	 upper=p95_p_fsw_newp0_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers without disadvantages with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.8 by 0.2) 		valueattrs=(size=10);

label p50_p_fsw_newp0_nodis_0_ = "No sex worker program ";
label p50_p_fsw_newp0_nodis_1_ = "Sex worker program ";

series  x=cald y=p50_p_fsw_newp0_nodis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_nodis_0_	 upper=p95_p_fsw_newp0_nodis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_fsw_newp0_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_nodis_1_	 upper=p95_p_fsw_newp0_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with disadvantages with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.8 by 0.2)  		valueattrs=(size=10);

label p50_p_fsw_newp0_dis_0_ = "No sex worker program ";
label p50_p_fsw_newp0_dis_1_ = "Sex worker program ";

series  x=cald y=p50_p_fsw_newp0_dis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_dis_0_	 upper=p95_p_fsw_newp0_dis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_fsw_newp0_dis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_dis_1_	 upper=p95_p_fsw_newp0_dis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers on PrEP stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.8 by 0.1) 		valueattrs=(size=10);

label p50_prop_sw_onprep_0_ = "No sex worker program ";
label p50_prop_sw_onprep_1_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_onprep_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_0_	 upper=p95_prop_sw_onprep_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_prop_sw_onprep_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_1_	 upper=p95_prop_sw_onprep_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers without disadvantages on PrEP stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.8 by 0.1) 		valueattrs=(size=10);

label p50_prop_sw_onprep_nodis_0_ = "No sex worker program ";
label p50_prop_sw_onprep_nodis_1_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_onprep_nodis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_nodis_0_	 upper=p95_prop_sw_onprep_nodis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_prop_sw_onprep_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_nodis_1_	 upper=p95_prop_sw_onprep_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with disadvantages on PrEP stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.8 by 0.1) 		valueattrs=(size=10);

label p50_prop_sw_onprep_dis_0_ = "No sex worker program ";
label p50_prop_sw_onprep_dis_1_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_onprep_dis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_dis_0_	 upper=p95_prop_sw_onprep_dis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_prop_sw_onprep_dis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_dis_1_	 upper=p95_prop_sw_onprep_dis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Number of HIV tests amongst sex workers stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)  values = (0 to 150000 by 10000) 		valueattrs=(size=10);

label p50_n_tested_sw_0_ = "No sex worker program ";
label p50_n_tested_sw_1_ = "Sex worker program ";

series  x=cald y=p50_n_tested_sw_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_0_	 upper=p95_n_tested_sw_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_n_tested_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_sw_1_	 upper=p95_n_tested_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Number of HIV tests amongst sex workers without disadvantages stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'		labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)  values = (0 to 150000 by 10000) 		valueattrs=(size=10);

label p50_n_tested_sw_nodis_0_ = "No sex worker program ";
label p50_n_tested_sw_nodis_1_ = "Sex worker program ";

series  x=cald y=p50_n_tested_sw_nodis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_nodis_0_	 upper=p95_n_tested_sw_nodis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_n_tested_sw_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_sw_nodis_1_	 upper=p95_n_tested_sw_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Number of HIV tests amongst sex workers with disadvantages stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'		labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)  values = (0 to 150000 by 10000) 		valueattrs=(size=10);

label p50_n_tested_sw_dis_0_ = "No sex worker program ";
label p50_n_tested_sw_dis_1_ = "Sex worker program ";

series  x=cald y=p50_n_tested_sw_dis_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_dis_0_	 upper=p95_n_tested_sw_dis_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_n_tested_sw_dis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_sw_dis_1_	 upper=p95_n_tested_sw_dis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 50 by 5)    valueattrs=(size=10);

label p50_incidence_sw_0_  = "No sex worker program ";
label p50_incidence_sw_1_ = "Sex worker program";

series  x=cald y=p50_incidence_sw_0_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_0_  upper=p95_incidence_sw_0_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";
series  x=cald y=p50_incidence_sw_1_ /  lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence_sw_1_  upper=p95_incidence_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "No program - model 90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst sex workers without disadvantages";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 50 by 5)    valueattrs=(size=10);

label p50_incidence_sw_nodis_0_  = "No sex worker program ";
label p50_incidence_sw_nodis_1_ = "Sex worker program";

series  x=cald y=p50_incidence_sw_nodis_0_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_nodis_0_  upper=p95_incidence_sw_nodis_0_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";
series  x=cald y=p50_incidence_sw_nodis_1_ /  lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence_sw_nodis_1_  upper=p95_incidence_sw_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "No program - model 90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst sex workers with disadvantages";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 50 by 5)    valueattrs=(size=10);

label p50_incidence_sw_dis_0_  = "No sex worker program ";
label p50_incidence_sw_dis_1_ = "Sex worker program";

series  x=cald y=p50_incidence_sw_dis_0_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_dis_0_  upper=p95_incidence_sw_dis_0_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";
series  x=cald y=p50_incidence_sw_dis_1_ /  lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence_sw_dis_1_  upper=p95_incidence_sw_dis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "No program - model 90% range";
run;quit;



proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence in general population";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 2 by 0.2)    valueattrs=(size=10);

label p50_incidence1549_0_  = "No sex worker program ";
label p50_incidence1549_1_ = "Sex worker program";

series  x=cald y=p50_incidence1549_0_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549_0_  upper=p95_incidence1549_0_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";
series  x=cald y=p50_incidence1549_1_ /  lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549_1_  upper=p95_incidence1549_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "No program - model 90% range";
run;quit;


ods rtf close;
ods listing;
run;





proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst all sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_ 	 upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_	 upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_	 upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst sex workers with no disadvantages (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_nodis_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_nodis_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_nodis_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_1_ 	 upper=p95_p_diag_sw_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_nodis_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_1_	 upper=p95_p_onart_diag_sw_nodis_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_nodis_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_1_	 upper=p95_p_onart_vl1000_sw_nodis_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst sex workers with mild disadvantages (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_mild_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_mild_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_mild_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_mild_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_mild_1_ 	 upper=p95_p_diag_sw_mild_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_mild_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_mild_1_	 upper=p95_p_onart_diag_sw_mild_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_mild_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_mild_1_	 upper=p95_p_onart_vl1000_sw_mild_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_diag_sw_nodis_2_  = "No disadvantages ";
label p50_p_diag_sw_mild_2_  = "Mild disadvantages ";


series  x=cald y=p50_p_diag_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_2_  upper=p95_p_diag_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_diag_sw_mild_2_/  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_diag_sw_mild_2_  upper=p95_p_diag_sw_mild_2_/ transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV on ART by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_diag_sw_nodis_2_  = "No disadvantages";
label p50_p_onart_diag_sw_mild_2_  = "Mild disadvantages ";

series  x=cald y=p50_p_onart_diag_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_2_  upper=p95_p_onart_diag_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_diag_sw_2_ /  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_2_  upper=p95_p_onart_diag_sw_2_ / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers on ART and virally suppressed by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_vl1000_sw_nodis_2_  = "No disadvantages";
label p50_p_onart_vl1000_sw_mild_2_  = "Mild disadvantages ";

series  x=cald y=p50_p_onart_vl1000_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_2_  upper=p95_p_onart_vl1000_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_vl1000_sw_mild_2_ /  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_mild_2_  upper=p95_p_onart_vl1000_sw_mild_2_ / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;








