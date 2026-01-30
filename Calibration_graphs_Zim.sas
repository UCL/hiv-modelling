
libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

*libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

data a;
set a.genesiszim_07jan26 a.genesis_zim_07jan26_a; 
if run=. then delete; 

proc sort;
by run cald option;run;

proc freq;table cald option;run;

***zim specific;
data sf;
set a;

*Zimbabwe;
*Source: World Population Prospect, file "World Population Prospect 2022.pdf";
*https://population.un.org/wpp/downloads?folder=Standard%20Projections&group=Population
(Excel sheet, population by select age groups);

if cald=2023;
s_alive = s_alive_m + s_alive_w ;
sf = 9198000 / s_alive; 

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


data a.long_genesis_zim_07jan26;
set y;run;

options nomprint;
option nospool;


***This section is to create graphs in SAS - mostly specific to mobile men for which there is no observed data;

data b;
set y;
proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 1118;
%let year_end = 2045.00 ;
run;
proc sort;by cald option ;run;

*turns log off;
options nonotes nosource nosource2 nomprint nomlogic nosymbolgen;


/*-----------------------------------------*/
/* Step 1: Macro to summarize a single option */
/*-----------------------------------------*/
%macro option_summary(option_num=0);***Option_num is a macro parameter with a default value of 0;

    /* Filter dataset for the selected option */
    data option_data;
        set b;
        where option = &option_num;
    run;

    /* List of variables to summarize */
    %let var =  
        n_alive_m n_alive_w n_alive n_hivge15m n_hivge15w n_hivge15_
        prevalence1549m prevalence1549w prevalence1549_ incidence1549_ incidence1549w incidence1549m
        p_onart p_onart_m p_onart_w n_onart n_onart_m n_onart_w
        p_diag p_diag_m p_diag_w p_onart_diag p_onart_diag_m p_onart_diag_w  
        p_onart_vl1000_ p_onart_vl1000_m p_onart_vl1000_w n_onprep_w n_onprep_m n_onprep
        prop_elig_on_prep n_prep_ever
        n_sw_1564_ n_sw_1549_ p_w_1564_sw p_w_1549_sw prevalence_1564sw incidence_1564sw
        p_onprep_sw n_onprep_sw
        n_msm_1564_ p_m_msm prevalence1549_msm incidence_msm p_onprep_msm n_onprep_msm
		n_agyw p_w_agyw prevalence_agyw	incidence_agyw	p_onprep_agyw n_onprep_agyw

        n_death_hivrel n_death_hivrel_m n_death_hivrel_w;

    /* Count number of variables */
    %let count = 0;
    %do %while (%qscan(&var, &count+1, %str( )) ne %str());
        %let count = %eval(&count + 1);
    %end;

    /* Initialize empty summary dataset (only cald and option) */
    data summary_option_&option_num;
        length cald 8 option 8;
        stop;
    run;

    /* Loop over variables and calculate stats */
    %do i = 1 %to &count;
        %let varb = %scan(&var,&i);

        /* Transpose the variable across simulations */
        proc transpose data=option_data out=tmp prefix=&varb;
            var &varb;
            by cald;
            id count_csim;
        run;

        /* Calculate statistics and keep only suffixed variables */
        data tmp_stat(keep=cald
                          p5_&varb._&option_num p95_&varb._&option_num
                          median_&varb._&option_num mean_&varb._&option_num);
            set tmp;
            p5_&varb._&option_num  = pctl(5, of &varb.1-&varb.&nfit);
            p95_&varb._&option_num = pctl(95, of &varb.1-&varb.&nfit);
            median_&varb._&option_num = median(of &varb.1-&varb.&nfit);
            mean_&varb._&option_num = mean(of &varb.1-&varb.&nfit);
        run;

        /* Merge stats into summary dataset */
        proc sort data=tmp_stat; by cald; run;
        proc sort data=summary_option_&option_num; by cald; run;

        data summary_option_&option_num;
            merge summary_option_&option_num tmp_stat;
            by cald;
            *option = &option_num;
        run;

    %end;

%mend;


/*-----------------------------------------*/
/* Step 2: Macro to combine multiple options */
/*-----------------------------------------*/
%macro summary_all_options(options=);

    /* Initialize empty master dataset */
    data master_summary;
        length cald 8 option 8;
        stop;
    run;

    %do j=1 %to %sysfunc(countw(&options));
        %let opt = %scan(&options, &j);

        /* Generate summary for this option */
        %option_summary(option_num= &opt);

        /* Merge option summary into master dataset */
        data master_summary;
            merge master_summary summary_option_&opt;
            by cald;
        run;

    %end;

%mend;

/*-----------------------------------------*/
/* Step 3: Example call for options 0, 1, 2 */
/*-----------------------------------------*/
%summary_all_options(options=0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 99);




*turns log back on;
options notes source source2 mprint mlogic symbolgen;

data d;
set Master_summary;

%include "C:\Users\Loveleen\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_Zimbabwe_Jan2026.sas"; by cald;
run;

data e;
set d;
%include "C:\Users\Loveleen\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_FSW_Zimbabwe.sas"; by cald;
run;


DATA A.Zim_options_graphs_07Jan26;
SET E;
RUN;


ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = '"C:\Users\loveleen\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Zim_calibration_29_01_26.doc' startpage=never; 
ods listing close;


ods html;

proc sgplot data=e; 
Title    height=1.5 justify=center "Population (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 15000000) valueattrs=(size=10);

label mean_n_alive_0 = "Model 15+";
label o_pop_15plus_Zim_cens  = "Census 15+";
label o_pop_1565_Zi_CIA = "CIA 15-65";
label o_pop_15plus_WPP = "World population prospectus 15+";

series  x=cald y=mean_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_15plus_Zim_cens / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=o_pop_15plus_WPP / markerattrs=(symbol=circle color=blue size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Population Male (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 15000000) valueattrs=(size=10);

label mean_n_alive_m_0 = "Model";
label o_pop_15plus_m_Zim_cens  = "Census";
label o_pop_1564m_Zi_CIA = "CIA 15-65";

series  x=cald y=mean_n_alive_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_m_0 	upper=p95_n_alive_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_15plus_m_Zim_cens / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_pop_1564m_Zi_CIA / markerattrs=(symbol=circle color=green size=10);

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Population Female (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 15000000) valueattrs=(size=10);

label mean_n_alive_w_0 = "Model";
label o_pop_15plus_w_Zim_cens  = "Census";

series  x=cald y=mean_n_alive_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_w_0 	upper=p95_n_alive_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_15plus_w_Zim_cens / markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 250000) valueattrs=(size=10);

label mean_n_hivge15__0 = "Model";
label o_livingHIV_15plus_UNAIDS  = "UNAIDS";
label e_hiv_15plus_nac = "National AIDS Council";
label o_livingHIV_all_GARPR = "Global AIDS Progress Report (All ages)";

series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hivge15__0 	upper=p95_n_hivge15__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_livingHIV_15plus_UNAIDS / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=e_hiv_15plus_nac / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=o_livingHIV_all_GARPR / markerattrs=(symbol=circle color=blue size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "People living with HIV (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 250000) valueattrs=(size=10);

label mean_n_hivge15m_0 = "Model";
label o_livingHIV_15plus_m_UNAIDS  = "UNAIDS";

series  x=cald y=mean_n_hivge15m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hivge15m_0 	upper=p95_n_hivge15m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_livingHIV_15plus_m_UNAIDS / markerattrs=(symbol=circle color=red size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "People living with HIV (Females 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 250000) valueattrs=(size=10);

label mean_n_hivge15m_0 = "Model";
label o_livingHIV_15plus_m_UNAIDS  = "UNAIDS";

series  x=cald y=mean_n_hivge15m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hivge15m_0 	upper=p95_n_hivge15m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_livingHIV_15plus_m_UNAIDS / markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Prevalence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence1549__0 = "Model";
label m_prev1549_2016unaids  = "UNAIDS";
label m_prev1549_2014unaids = "UNAIDS";
label m_prev1549_unaids = "UNAIDS";
label o_prev1549_Z_DHS = "DHS";
label o_prev_1549_zimphia = "ZIMPHIA";
label o_prev_1549_garpr = "GARPR";

series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=m_prev1549_2016unaids / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=m_prev1549_2014unaids / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=m_prev1549_unaids / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_prev1549_Z_DHS / markerattrs=(symbol=circle color=blue size=10);
scatter x=cald y=o_prev_1549_zimphia / markerattrs=(symbol=circle color=orange size=10);
scatter x=cald y=o_prev_1549_garpr / markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Prevalence (Males 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence1549m_0 = "Model";
label o_prev1549m_Z_DHS = "DHS";
label o_prev_1549m_zimphia = "ZIMPHIA";

series  x=cald y=mean_prevalence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549m_0	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_prev1549m_Z_DHS / markerattrs=(symbol=circle color=blue size=10);
scatter x=cald y=o_prev_1549m_zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Prevalence (Females 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence1549w_0 = "Model";
label o_prev1549w_Z_DHS = "DHS";
label o_prev_1549w_zimphia = "ZIMPHIA";

series  x=cald y=mean_prevalence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549w_0	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_prev1549w_Z_DHS / markerattrs=(symbol=circle color=blue size=10);
scatter x=cald y=o_prev_1549w_zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Incidence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);

label mean_incidence1549__0 = "Model";
label m_HIVIncid_1549_2016UNAIDS  = "UNAIDS 2016 report";
label m_HIVIncid1549_Zim_unaids = "UNAIDS";
label m_HIVIncid_GARPR = "GARPR";
label o_HIVincid_1549_Zimphia = "ZIMPHIA";

series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=m_HIVIncid_1549_2016UNAIDS / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=m_HIVIncid1549_Zim_unaids / markerattrs=(symbol=circle color=maroon size=10);
scatter x=cald y=m_HIVIncid_GARPR / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=o_HIVincid_1549_Zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Incidence (Males 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);

label mean_incidence1549m_0 = "Model";
label o_HIVincid_1549m_Zimphia = "ZIMPHIA";

series  x=cald y=mean_incidence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_HIVincid_1549m_Zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Incidence (Females 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);

label mean_incidence1549w_0 = "Model";
label o_HIVincid_1549w_Zimphia = "ZIMPHIA";

series  x=cald y=mean_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_HIVincid_1549w_Zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "ART coverage (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '%'	labelattrs=(size=12)  values = (0 to 1 by 0.10) valueattrs=(size=10);

label mean_p_onart_0 = "Model";
label e_p_onart_15ovhivpos_nac = "NAC";
label o_p_onart_1564_zimphia = "ZIMPHIA (15-64)";

series  x=cald y=mean_p_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_0	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_onart_1564_zimphia / markerattrs=(symbol=circle color=orange size=10);
scatter x=cald y=e_p_onart_15ovhivpos_nac / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "ART coverage (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '%'	labelattrs=(size=12)  values = (0 to 1 by 0.10) valueattrs=(size=10);

label mean_p_onart_m_0 = "Model";
label o_p_onart_1564m_zimphia = "ZIMPHIA (15-64)";

series  x=cald y=mean_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_onart_1564m_zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "ART coverage (Females 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '%'	labelattrs=(size=12)  values = (0 to 1 by 0.10) valueattrs=(size=10);

label mean_p_onart_w_0 = "Model";
label o_p_onart_1564f_zimphia = "ZIMPHIA (15-64)";

series  x=cald y=mean_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_onart_1564f_zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Number on ART (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);

label mean_n_onart_0 = "Model";
label o_s_onart_adults_garpr = "UNAIDS";
label o_s_all_onart_NAC = "NAC";

series  x=cald y=mean_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_s_onart_adults_garpr / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_s_all_onart_NAC / markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Number on ART (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);

label mean_n_onart_m_0 = "Model";
label m_n_onart_m_spectrum = "Spectrum";

series  x=cald y=mean_n_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_m_0	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=m_n_onart_m_spectrum / markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Number on ART (Females 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);

label mean_n_onart_w_0 = "Modelled number on ART";
label m_n_onart_w_spectrum = "Spectrum";

series  x=cald y=mean_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=m_n_onart_w_spectrum / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion diagnosed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_diag_0 = "Model";
label o_p_diag_1549_dhs = "DHS 15-49";
label o_p_diag_1564_zimphia = "ZIMPHIA 15-64";
label o_p_diag_15pl_zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_0	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_diag_1564_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_15pl_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_1549_dhs / markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion diagnosed (Males 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_diag_0 = "Model";
label o_p_diag_m1549_dhs = "DHS 15-49";
label o_p_diag_1564m_zimphia = "ZIMPHIA 15-64";
label o_p_diag_15plm_zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_diag_1564m_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_15plm_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_m1549_dhs / markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion diagnosed (Females 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_diag_w_0 = "Model";
label o_p_diag_w1549_dhs = "DHS 15-49";
label o_p_diag_1564w_zimphia = "ZIMPHIA 15-64";
label o_p_diag_15plw_zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_diag_1564w_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_15plw_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_w1549_dhs / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_0 = "Model";
label o_p_onart_1564_diag_zimphia = "ZIMPHIA 15-64";
label o_p_onart_15pl_diag_zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_onart_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_0	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_onart_1564_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_onart_15pl_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (Males 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_m_0 = "Model";

label o_p_onart_1564m_diag_zimphia = "ZIMPHIA 15-64";
label o_p_onart_15plm_diag_zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_onart_1564m_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_onart_15plm_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (Females 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_w_0 = "Model";

label o_p_onart_1564f_diag_zimphia = "ZIMPHIA 15-64";
label o_p_onart_15plf_diag_zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_onart_1564f_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_onart_15plf_diag_zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000__0 = "Model";
label o_p_vlsupp_1564_Zimphia = "ZIMPHIA 15-64";
label o_p_vlsupp_15pl_Zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_vlsupp_1564_Zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_vlsupp_15pl_Zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (Males 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000_m_0 = "Model";
label o_p_vlsupp_1564m_Zimphia = "ZIMPHIA 15-64";
label o_p_vlsupp_15plm_Zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_vlsupp_1564m_Zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_vlsupp_15plm_Zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (Females 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000_w_0 = "Model";
label o_p_vlsupp_1564w_Zimphia = "ZIMPHIA 15-64";
label o_p_vlsupp_15plw_Zimphia = "ZIMPHIA 15+";

series  x=cald y=mean_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_vlsupp_1564w_Zimphia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_vlsupp_15plw_Zimphia/ markerattrs=(symbol=circle color=red size=10);
run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "Currently on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 100000 by 10000) valueattrs=(size=10);

label mean_n_onprep_0 = "Model";
label o_n_prep_all_NSP = "National Strategic Plan 2021-25";

series  x=cald y=mean_n_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onprep_0	upper=p95_n_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_n_prep_all_NSP/ markerattrs=(symbol=circle color=red size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Ever initiated PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2026 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 500000 by 50000) valueattrs=(size=10);

label mean_n_prep_ever_0 = "Model";
label o_n_prep_ever = "PrEPWatch";

series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_ever_0	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_n_prep_ever/ markerattrs=(symbol=circle color=red size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of those eligible, proportion on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2026 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 0.5 by 0.1) valueattrs=(size=10);

label mean_prop_elig_on_prep_0 = "Model";

series  x=cald y=mean_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (15-49)";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 200000 by 50000)  valueattrs=(size=10);

label mean_n_sw_1549__0	                  = "Model";
label o_pop_fsw_1549w_Fearon			  = "Fearon";

series  x=cald y=mean_n_sw_1549__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549__0      upper=p95_n_sw_1549__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearon / markerattrs = (symbol=circle color=red size = 10)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearon yerrorupper=o_pop_fsw_ul_1549w_Fearon errorbarattrs= (color=red thickness = 1);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Of all women, proportion FSW (15-49)";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'              labelattrs=(size=12)  values = (0 to 0.1 by 0.01)  valueattrs=(size=10);

label mean_p_w_1549_sw_0	          = "Model";
label o_p_fsw_1549w_Fearon			  = "Fearon/Chabata FSW Size Estimation studies";

series  x=cald y=mean_p_w_1549_sw_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_w_1549_sw_0      upper=p95_p_w_1549_sw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_p_fsw_1549w_Fearon / markerattrs = (symbol=circle color=red size = 10)
										   yerrorlower=o_p_fsw_ll_1549w_Fearon yerrorupper=o_p_fsw_ul_1549w_Fearon errorbarattrs= (color=red thickness = 1);
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "HIV prevalence in female sex workers";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 1 by 0.2)    valueattrs=(size=10);

label mean_prevalence_1564sw_0 = "Model";
label o_prev_fsw_rds_mut = "RDS Mutare";
label o_prev_fsw_rds_vf = "RDS Vic Falls";
label o_prev_fsw_rds_hwa = "RDS Hwange";
label o_prev_fsw_rds = "RDS Sapphire";
label o_prev_fsw_AMT = "RDS Amethist";

series  x=cald y=mean_prevalence_1564sw_0 /  lineattrs = (color=black thickness = 2);
band   x=cald lower=p5_prevalence_1564sw_0  upper=p95_prevalence_1564sw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

scatter x=cald y=o_prev_fsw_rds_mut / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_prev_fsw_rds_vf / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_prev_fsw_rds_hwa / markerattrs = (symbol=circle       color=purple size = 12);
scatter x=cald y=o_prev_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_prev_fsw_AMT / markerattrs = (symbol=circle       color=black size = 12);
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 20 by 2)    valueattrs=(size=10);

label mean_incidence_1564sw_0  = "Mean";
label o_HIVIncid_fsw = "JH JAIDS";
label o_HIVIncid1824_fsw= "18-24 SAli";
label o_HIVIncid2539_fsw= "25-39 SAli";
label o_HIVIncid_fsw_dreams = "DREAMS";
label o_HIVIncid1539_fsw_hj = "15-39 HJones";

series  x=cald y=mean_incidence_1564sw_0 /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_1564sw_0  upper=p95_incidence_1564sw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

scatter x=cald y=o_HIVIncid_fsw / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_HIVIncid1824_fsw / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_HIVIncid2539_fsw / markerattrs = (symbol=circle       color=yellow size = 12);
scatter x=cald y=o_HIVIncid_fsw_dreams / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_HIVIncid1539_fsw_hj / markerattrs = (symbol=circle       color=black size = 12);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_sw_0 = "Model";
label o_n_prep_fsw_AMT_SR = "AMETHIST self-report";
label o_n_prep_fsw_AMT_TDF = "AMETHIST TDF samples";

series  x=cald y=mean_p_onprep_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_sw_0 	upper=p95_p_onprep_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_n_prep_fsw_AMT_SR / markerattrs = (symbol=circle       color=red size = 10);
scatter x=cald y=o_n_prep_fsw_AMT_TDF / markerattrs = (symbol=circle       color=blue size = 10);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "MSM Population (15-64)";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 200000 by 50000)  valueattrs=(size=10);

label mean_n_msm_1564__0                  = "Model";

series  x=cald y=mean_n_msm_1564__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_msm_1564__0      upper=p95_n_msm_1564__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Of all men, proportion MSM (15-64)";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'              labelattrs=(size=12)  values = (0 to 0.1 by 0.01)  valueattrs=(size=10);

label mean_p_m_msm_0	          = "Model";

series  x=cald y=mean_p_m_msm_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_m_msm_0      upper=p95_p_m_msm_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV prevalence in MSM";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 1 by 0.2)    valueattrs=(size=10);

label mean_prevalence1549_msm_0 = "Model";

series  x=cald y=mean_prevalence1549_msm_0 /  lineattrs = (color=black thickness = 2);
band   x=cald lower=p5_prevalence1549_msm_0  upper=p95_prevalence1549_msm_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst MSM";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 20 by 2)    valueattrs=(size=10);

label mean_incidence_msm_0  = "Mean";

series  x=cald y=mean_incidence_msm_0 /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_msm_0  upper=p95_incidence_msm_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_msm_0 = "Model";

series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_msm_0 	upper=p95_p_onprep_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "AGYW Population";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 2000000 by 250000)  valueattrs=(size=10);

label mean_n_agyw_0        	= "Model";
label o_pop_agyw_census		= "Census";

series  x=cald y=mean_n_agyw_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_agyw_0     		 upper=p95_n_agyw_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_agyw_census / markerattrs = (symbol=circle       color=blue size = 12);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Of women aged 15-64, proportion AGYW";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'              labelattrs=(size=12)  values = (0 to 0.5 by 0.1)  valueattrs=(size=10);

label mean_p_w_agyw_0	    = "Model";
label o_p_agyw_census		= "Census";

series  x=cald y=mean_p_w_agyw_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_w_agyw_0      upper=p95_p_w_agyw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_p_agyw_census / markerattrs = (symbol=circle       color=blue size = 12);

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV prevalence in AGYW";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 0.2 by 0.05)    valueattrs=(size=10);

label mean_prevalence_agyw_0 = "Model";
label o_prev_agyw_un = "UN";
label o_prev_agyw_zimphia = "ZIMPHIA";

series  x=cald y=mean_prevalence_agyw_0 /  lineattrs = (color=black thickness = 2);
band   x=cald lower=p5_prevalence_agyw_0 upper=p95_prevalence_agyw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

scatter x=cald y=o_prev_agyw_un / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_prev_agyw_zimphia / markerattrs = (symbol=circle  color=green size = 12);

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst AGYW";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 5 by 1)    valueattrs=(size=10);

label mean_incidence_agyw_0  = "Mean";
label o_incid_agyw_un = "UN";
label o_incid_agyw_zimphia = "ZIMPHIA";

series  x=cald y=mean_incidence_agyw_0 /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_agyw_0  upper=p95_incidence_agyw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";

scatter x=cald y=o_incid_agyw_un / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_incid_agyw_zimphia / markerattrs = (symbol=circle  color=green size = 12);

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion of AGYW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_agyw_0 = "Model";

series  x=cald y=mean_p_onprep_agyw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_agyw_0 	upper=p95_p_onprep_agyw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "Number of HIV-related deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 30000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_0 = "Model";
label o_s_deaths_HIVrel_GARPR = "GARPR all ages";
label o_s_deaths_HIVrel_unaids= "UNAIDS 15+";

series  x=cald y=mean_n_death_hivrel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_0 	upper=p95_n_death_hivrel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_s_deaths_HIVrel_GARPR / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_s_deaths_HIVrel_unaids / markerattrs = (symbol=circle       color=green size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Number of HIV-related deaths (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 20000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_m_0 = "Model";
label o_s_deaths_HIVrel_unaids_m= "UNAIDS 15+";

series  x=cald y=mean_n_death_hivrel_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_m_0 	upper=p95_n_death_hivrel_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_s_deaths_HIVrel_unaids_m / markerattrs = (symbol=circle       color=green size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Number of HIV-related deaths (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 20000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_w_0 = "Model";
label o_s_deaths_HIVrel_unaids_w= "UNAIDS 15+";

series  x=cald y=mean_n_death_hivrel_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_w_0 	upper=p95_n_death_hivrel_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_s_deaths_HIVrel_unaids_w / markerattrs = (symbol=circle       color=green size = 12);
run;quit;

ods rtf close;
ods listing;
run;


