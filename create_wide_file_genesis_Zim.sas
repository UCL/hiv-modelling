
*libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

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

***general population;

* n_alive;						n_alive = s_alive * sf;
* n_alive_m;					n_alive_m = s_alive_m * sf;
* n_alive_w;					n_alive_w = s_alive_w * sf;

* n_hivge15m;					n_hivge15m = (s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm) * sf ;
* n_hivge15w;					n_hivge15w = (s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw) * sf ;
* n_hivge15_;					n_hivge15_ = n_hivge15m + n_hivge15w ;

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549_;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549_;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* p_onart_w;					if n_hivge15w gt 0 then p_onart_w = s_onart_w / n_hivge15w;
* p_onart_m;					if n_hivge15m gt 0 then p_onart_m = s_onart_m / n_hivge15m;
* p_onart;						if n_hivge15_ gt 0 then p_onart = s_onart / n_hivge15_; 

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

n_death_hivrel		 n_death_hivrel_m	n_death_hivrel_w


;

proc sort data=y;by run option;run;


options nomprint;
option nospool;


***This section is to create graphs in SAS - mostly specific to mobile men for which there is no observed data;

data b;
set y;
proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 400;
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
            option = &option_num;
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
data e;
set Master_summary;
%include "C:\Users\lovel\Documents\GitHub\hiv-modelling\Observed data_Zimbabwe.sas"; by cald;
run;


ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = '"C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Zim_graphs_29_12_25.doc' startpage=never; 
ods listing close;


ods html;

proc sgplot data=e; 
Title    height=1.5 justify=center "Population (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 15000000) valueattrs=(size=10);

label mean_n_alive_0 = "Population";
label o_pop_15plus_Zim_cens  = "Census";
label o_pop_1565_Zi_CIA = "CIA 15-65";
label o_pop_15plus_WPP = "World population prospectus";

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

label mean_n_alive_m_0 = "Population";
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

label mean_n_alive_w_0 = "Population";
label o_pop_15plus_w_Zim_cens  = "Census";

series  x=cald y=mean_n_alive_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_w_0 	upper=p95_n_alive_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_15plus_w_Zim_cens / markerattrs=(symbol=circle color=red size=10);
run;quit;

n_hivge15m n_hivge15w n_hivge15_

proc sgplot data=e; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)   valueattrs=(size=10);

label n_hivge15_ = "PLHIV";
*label o_pop_15plus_Zim_cens  = "Census";
*label o_pop_1565_Zi_CIA = "CIA 15-65";
*label o_pop_15plus_WPP = "World population prospectus";

series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hivge15__0 	upper=p95_n_hivge15__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

*scatter x=cald y=o_pop_15plus_Zim_cens / markerattrs=(symbol=circle color=red size=10);
*scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs=(symbol=circle color=green size=10);
*scatter x=cald y=o_pop_15plus_WPP / markerattrs=(symbol=circle color=blue size=10);
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);

label p50_prop_1564m_onprep_0 = "Men";
label p50_prop_1564w_onprep_0 = "Women";

series  x=cald y=p50_prop_1564m_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564m_onprep_0 	upper=p95_prop_1564m_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564w_onprep_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564w_onprep_0 	upper=p95_prop_1564w_onprep_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people with an indication for PrEP currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_prop_elig_on_prep_0 = "All";
label p50_prop_elig_on_prep_w_0 = "Women";
label p50_prop_elig_on_prep_m_0 = "Men";

series  x=cald y=p50_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "model 90% range";
series  x=cald y=p50_prop_elig_on_prep_w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_w_0 	upper=p95_prop_elig_on_prep_w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";
series  x=cald y=p50_prop_elig_on_prep_m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_m_0 	upper=p95_prop_elig_on_prep_m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "model 90% range";

run;quit;

*On oral/injectable;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people with an indication for PrEP currently on oral and injectable PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_prop_elig_on_prep_oral_0 = "Oral";
label p50_prop_elig_on_prep_inj_0 = "Injectable";

series  x=cald y=p50_prop_elig_on_prep_oral_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_oral_0 	upper=p95_prop_elig_on_prep_oral_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "model 90% range";
series  x=cald y=p50_prop_elig_on_prep_inj_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_inj_0 	upper=p95_prop_elig_on_prep_inj_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "model 90% range";
run;quit;




***Mobile men;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of men, proportion mobile with increased risk";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_mm_0 = "Median";

series  x=cald y=p50_p_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mm_0 	upper=p95_p_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_hiv_mm_0 = "Mobile men";
label p50_p_hiv_nmm_0 = "non-mobile men";

series  x=cald y=p50_p_hiv_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hiv_mm_0 	upper=p95_p_hiv_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_hiv_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_hiv_nmm_0 	upper=p95_p_hiv_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Percentage of men ever on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.01) valueattrs=(size=10);

label p50_p_prep_any_ever_mm_0 = "Mobile men";
label p50_p_prep_any_ever_nmm_0 = "Non-mobile men (inc. MSM and PWID)";

series  x=cald y=p50_p_prep_any_ever_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_any_ever_mm_0 	upper=p95_p_prep_any_ever_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_prep_any_ever_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_prep_any_ever_nmm_0 	upper=p95_p_prep_any_ever_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those with an indication for PrEP, proportion of men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_prop_elig_on_prep_mm_0 = "Mobile men";
label p50_prop_elig_on_prep_nmm_0 = "Non-Mobile men";

series  x=cald y=p50_prop_elig_on_prep_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_0 	upper=p95_prop_elig_on_prep_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prop_elig_on_prep_nmm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_nmm_0 	upper=p95_prop_elig_on_prep_nmm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of mobile men with an indication for PrEP, proportion currently on oral and injectable PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_prop_elig_on_prep_oral_mm_0 = "Oral";
label p50_prop_elig_on_prep_inj_mm_0 = "Injectable";

series  x=cald y=p50_prop_elig_on_prep_oral_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_oral_mm_0 	upper=p95_prop_elig_on_prep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prop_elig_on_prep_inj_mm_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_inj_mm_0 	upper=p95_prop_elig_on_prep_inj_mm_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of mobile men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000) valueattrs=(size=10);

label p50_n_prep_any_mm_0 = "Mobile men";

series  x=cald y=p50_n_prep_any_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_any_mm_0 	upper=p95_n_prep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of mobile men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000) valueattrs=(size=10);

label p50_n_prep_oral_mm_0 = "Option 0 (SQ, No CAB-LA, No PrEP for MM)";
label p50_n_prep_oral_mm_1 = "Option 1 (MM intervention - CAB-LA, MM PrEP elig and not hard to reach)";
label p50_n_prep_oral_mm_2 = "Option 2 (MM PrEP elig - No CAB, % MM still hard to reach)";
label p50_n_prep_oral_mm_3 = "Option 3 (MM PrEP elig and not hard to reach - No CAB)";
label p50_n_prep_oral_mm_4 = "Option 4 (MM PrEP elig, CAB-LA avail - % MM still hard to reach)";

series  x=cald y=p50_n_prep_oral_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_mm_0 	upper=p95_n_prep_oral_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;
*/

***After intervention;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of mobile men currently on any PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_prop_elig_on_prep_mm_0 = "Option 0 (SQ, No CAB-LA, No PrEP for MM)";
label p50_prop_elig_on_prep_mm_1 = "Option 1 (MM intervention - CAB-LA, MM PrEP elig and not hard to reach)";
label p50_prop_elig_on_prep_mm_2 = "Option 2 (MM PrEP elig - No CAB, % MM still hard to reach)";
label p50_prop_elig_on_prep_mm_3 = "Option 3 (MM PrEP elig and not hard to reach - No CAB)";
label p50_prop_elig_on_prep_mm_4 = "Option 4 (MM PrEP elig, CAB-LA avail - % MM still hard to reach)";
series  x=cald y=p50_prop_elig_on_prep_mm_2/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_2 	upper=p95_prop_elig_on_prep_mm_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";


/*
series  x=cald y=p50_prop_elig_on_prep_mm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_0 	upper=p95_prop_elig_on_prep_mm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_elig_on_prep_mm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_1 	upper=p95_prop_elig_on_prep_mm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_elig_on_prep_mm_2/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_2 	upper=p95_prop_elig_on_prep_mm_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_elig_on_prep_mm_3/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_3 	upper=p95_prop_elig_on_prep_mm_3  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_elig_on_prep_mm_4/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_mm_4 	upper=p95_prop_elig_on_prep_mm_4  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*/
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prep willing";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2045 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)    valueattrs=(size=10);

label p50_p_prep_any_willing_0 = "Without intervention";
label p50_p_prep_any_willing_1 = "With intervention";

series  x=cald y=p50_p_prep_any_willing_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_any_willing_0 	upper=p95_p_prep_any_willing_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_prep_any_willing_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_prep_any_willing_1 	upper=p95_p_prep_any_willing_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

ods rtf close;
ods listing;
run;


***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

***OUTPUTS IN SPECIFIC YEARS - AMEND TO E.G. PROJECT SPECIFIC BASELINE (NOTE THESE ARE NOT BY OPTION);
proc means  noprint data=y; var &v; output out=y_22 mean= &v._22; by run; where 2021.0 <= cald < 2022.0; 

***OUTPUTS IN SPECIFIC YEARS BY OPTION - THIS MAY NOT BE NEEDED IN ALL ANALYSES;
proc means noprint data=y; var &v; output out=y_30 mean= &v._30; by run option; where 2029.0 <= cald < 2030.25; 

***OUTPUTS FOR CE ANALYSES OVER 5, 20 AND 50 years BY OPTION;
proc means noprint data=y; var &v; output out=y_22_27 mean= &v._22_27; by run option ; where 2022.5 <= cald < 2027.50;
proc means noprint data=y; var &v; output out=y_22_42 mean= &v._22_42; by run option ; where 2022.5 <= cald < 2042.50;
proc means noprint data=y; var &v; output out=y_22_72 mean= &v._22_72; by run option ; where 2022.5 <= cald < 2072.50;

***SORT OUTPUT DATASETS BY RUN BEFORE MERGING;
proc sort data=y_22; by run; proc transpose data=y_22 out=t_22 prefix=&v._22_; var &v._22; by run;
proc sort data=y_30; by run; proc transpose data=y_30 out=t_30 prefix=&v._30_; var &v._30; by run;
proc sort data=y_22_27; by run; proc transpose data=y_22_27 out=t_22_27 prefix=&v._22_27_; var &v._22_27; by run;
proc sort data=y_22_42; by run; proc transpose data=y_22_42 out=t_22_42 prefix=&v._22_42_; var &v._22_42; by run;
proc sort data=y_22_72; by run; proc transpose data=y_22_72 out=t_22_72 prefix=&v._22_72_; var &v._22_72; by run;

***MERGE TOGETHER SO THE DATASET NOW CONTAINS MEANS OVER SPECIFIED PERIODS;
data &v ; merge  y_22 t_30 t_22_27 t_22_42 t_22_72;  


***THIS MACRO CALCULATES THE MEANS OVER PERIOD AT EACH OF THE SPECIFIED TIME PERIODS ABOVE ANS STORES THESE IN INDIVIDUAL DATASETS;
%mend var;


%var(v=p_diag);	 		%var(v=p_diag_m);	 		%var(v=p_diag_w);   		%var(v=p_onart_diag);   %var(v=p_onart_diag_w);
%var(v=p_onart_diag_m); %var(v=p_onart_vl1000);		%var(v=p_onart_vl1000_w);   %var(v=p_onart_vl1000_m);
%var(v=p_vg1000); 		%var(v=p_vl1000);			%var(v=prevalence_vg1000);

%var(v=prevalence1549m);%var(v=prevalence1549w); 	%var(v=prevalence1549); 	
%var(v=incidence1549); 	%var(v=incidence1549w); 	%var(v=incidence1549m);
%var(v=dcost);	 		%var(v=ddaly);

*/ADD IN PROJECT SPECIFIC OUTPUTS/*;

run;


***MERGE THE DATASETS CREATED ABOVE INTO ONE DATASET;
data wide_outputs;merge
p_diag	 		p_diag_m	 		p_diag_w   			p_onart_diag  	p_onart_diag_w
p_onart_diag_m 	p_onart_vl1000		p_onart_vl1000_w   	p_onart_vl1000_m
p_vg1000 		p_vl1000			prevalence_vg1000
prevalence1549m	prevalence1549w 	prevalence1549 		incidence1549 	incidence1549w 	incidence1549m
dcost			ddaly

/*ADD IN PROJECT SPECIFIC OUTPUTS*/
;

proc sort; by run;run;


***Macro par used to add in values of all sampled parameters - values before intervention;
%macro par(p=);
proc means noprint data=y; var &p ; output out=y_ mean= &p; by run ; where cald = 2022.5; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

/*ADD PROJECT SPECIFIC PARAMETERS OF INTEREST*/
%par(p=sw_art_disadv);		%par(p=sw_program);			%par(p=effect_sw_prog_newp);	%par(p=effect_sw_prog_6mtest);	
%par(p=effect_sw_prog_int);	%par(p=effect_sw_prog_adh);	%par(p=effect_sw_prog_lossdiag);%par(p=effect_sw_prog_prep_any);
%par(p=effect_sw_prog_pers_sti); %par(p=sw_trans_matrix);
run;


data wide_par; merge 
sw_art_disadv		sw_program			effect_sw_prog_newp			effect_sw_prog_6mtest	
effect_sw_prog_int	effect_sw_prog_adh	effect_sw_prog_lossdiag		effect_sw_prog_prep_any		effect_sw_prog_pers_sti
sw_trans_matrix;
;proc sort; by run;run;

***SAVE DATASET READY FOR ANALYSIS;
data a.wide_XXX;
merge   wide_outputs  wide_par ;  
by run;run;

