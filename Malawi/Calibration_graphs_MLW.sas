

libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_mlw";
ods listing;

data y;
set a.long_gen_mlw_22_02_2026;
run;
proc freq;table cald;run;

data b;
set y;
proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 342;
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
	n_alive1564_		 n_alive1564m		n_alive1564w		n_new_inf			
	n_alive_m			 n_alive_w			n_alive				n_hivge15m			n_hivge15w		    n_hivge15_		n_hivge1564_
	prevalence1549m 	 prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w 		incidence1549m
	p_onart				 p_onart_m			p_onart_w			n_onart				n_onart_m			n_onart_w
	n_diagnosed	 
	p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
	p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	n_onprep_w			n_onprep_m			n_onprep
	prop_elig_on_prep	 n_prep_ever		prop_1564_onprep	n_onprep_oral		n_onprep_cab		n_onprep_len
	n_sw_1564_			 n_sw_1549_			p_w_1564_sw			p_w_1549_sw			prevalence_1564sw	incidence_1564sw
	p_onprep_sw			 n_onprep_sw
	n_selftested		 n_tested			

	n_msm_1564_			 p_m_msm			prevalence1549_msm	incidence_msm		p_onprep_msm		n_onprep_msm
	n_agyw				 n_agyw_pg			p_w_agyw			prevalence_agyw		incidence_agyw		p_onprep_agyw		n_onprep_agyw
	n_death_hivrel		 n_death_hivrel_m	n_death_hivrel_w	
	n_hiv_pregnant		 n_pregnant_onart	n_give_birth_with_hiv	n_infbirth_testing	n_postdel_testing
	n_vm_this_per		 n_cd4m_this_per	n_vmmc1549m				n_vmmc_all		p_mcirc				
	n_death_discount	 d_n_new_inf

	dcost	ddaly n_tested_sw p_diag_sw p_onart_diag_sw	p_onart_vl1000_sw
;

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
%summary_all_options(options=0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 99);



*turns log back on;
options notes source source2 mprint mlogic symbolgen;

data d;
set Master_summary;

%include "C:\Users\Lovel\Documents\GitHub\hiv-modelling\Malawi\Observed data_Malawi.sas"; by cald;
run;

DATA A.MLW_options_graphs_22Feb26;
SET d;
RUN;


ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = 'C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Prevention advocacy\Malawi\MLW_calibration_18_02_26.doc' startpage=never; 
ods listing close;


ods html;

proc sgplot data=d; 
Title    height=1.5 justify=center "Population (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 20000000 by 2000000) valueattrs=(size=10);

label mean_n_alive_0 = "Model 15+";
label o_pop_1564_wb  = "World bank 15-64";
label o_pop_15plus_WPP = "World population prospects 15+";

series  x=cald y=mean_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_1564_wb / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_pop_15plus_WPP / markerattrs=(symbol=circle color=blue size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Population Male (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 15000000) valueattrs=(size=10);

label mean_n_alive_m_0 = "Model";
label o_pop_1564m_wb  = "World bank 15-64";

series  x=cald y=mean_n_alive_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_m_0 	upper=p95_n_alive_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_1564m_wb / markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Population Female (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 15000000) valueattrs=(size=10);

label mean_n_alive_w_0 = "Model";
label o_pop_1564w_wb  = "World bank 15-64";

series  x=cald y=mean_n_alive_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_w_0 	upper=p95_n_alive_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_1564w_wb / markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 250000) valueattrs=(size=10);

label mean_n_hivge15__0 = "Model";
label m_livingHIV_15plus_UNAIDS  = "UNAIDS 15+";
label m_livingHIV15plus_unaids = "UNAIDS 15+";
label o_livingHIV_15pl_phia = "PHIA 15+";

series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hivge15__0 	upper=p95_n_hivge15__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=m_livingHIV_15plus_UNAIDS / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=m_livingHIV15plus_unaids / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=o_livingHIV_15pl_phia/ markerattrs=(symbol=circle color=blue size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "People living with HIV (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 250000) valueattrs=(size=10);

label mean_n_hivge15m_0 = "Model";
label m_livingHIV_15plus_m_UNAIDS  = "UNAIDS";

series  x=cald y=mean_n_hivge15m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hivge15m_0 	upper=p95_n_hivge15m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=m_livingHIV_15plus_m_UNAIDS / markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "People living with HIV (Females 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 250000) valueattrs=(size=10);

label mean_n_hivge15w_0 = "Model";
label m_livingHIV_15plus_w_UNAIDS  = "UNAIDS";

series  x=cald y=mean_n_hivge15w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hivge15w_0 	upper=p95_n_hivge15w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=m_livingHIV_15plus_w_UNAIDS / markerattrs=(symbol=circle color=red size=10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence1549__0 = "Model";
label prevalence1549_obs_mlw_mdhs  = "DHS";
label prevalence1549_obs_mlw_mphia = "MPHIA";
label m_prevalence1549_mlw_unaids = "UNAIDS";

series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=prevalence1549_obs_mlw_mdhs / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=prevalence1549_obs_mlw_mphia / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=m_prevalence1549_mlw_unaids / markerattrs=(symbol=circle color=blue size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (Males 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence1549m_0 = "Model";
label prevalence1549m_obs_mlw_mdhs  = "DHS";
label prevalence1549m_obs_mlw_mphia = "MPHIA";

series  x=cald y=mean_prevalence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549m_0	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=prevalence1549m_obs_mlw_mdhs / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=prevalence1549m_obs_mlw_mphia / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (Females 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence1549w_0 = "Model";
label prevalence1549w_obs_mlw_mdhs  = "DHS";
label prevalence1549w_obs_mlw_mphia = "MPHIA";

series  x=cald y=mean_prevalence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549w_0	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=prevalence1549w_obs_mlw_mdhs / markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=prevalence1549w_obs_mlw_mphia / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);

label mean_incidence1549__0 = "Model";
label o_incidence1549_obs_mlw_phia = "MPHIA";

series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_incidence1549_obs_mlw_phia / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (Males 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);

label mean_incidence1549m_0 = "Model";
label o_incidence1549m_obs_mlw_phia = "MPHIA";

series  x=cald y=mean_incidence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_incidence1549m_obs_mlw_phia / markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (Females 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);

label mean_incidence1549w_0 = "Model";
label o_incidence1549w_obs_mlw_phia = "MPHIA";

series  x=cald y=mean_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_incidence1549w_obs_mlw_phia / markerattrs=(symbol=circle color=green size=10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "ART coverage (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '%'	labelattrs=(size=12)  values = (0 to 1 by 0.10) valueattrs=(size=10);

label mean_p_onart_0 = "Model";
label p_onart_obs_mlw_all_moh = "MoH Quartely reports (all ages) ";
label p_onart_obs_mlw_all_15pl_moh = "MoH Quartely reports 15+ ";
label p_onart_obs_mlw_15pl_unaids = "UNAIDS 15+";

series  x=cald y=mean_p_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_0	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_onart_obs_mlw_15pl_unaids / markerattrs=(symbol=circle color=orange size=10);
scatter x=cald y=p_onart_obs_mlw_all_moh / markerattrs=(symbol=circle color=lightgreen size=10);
scatter x=cald y=p_onart_obs_mlw_all_15pl_moh / markerattrs=(symbol=circle color=green size=10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);

label mean_n_onart_0 = "Model";
label n_onart_obs_mlw_all_moh = "MoH Quartely reports (all ages) ";
label n_onart_obs_mlw_15pl_moh = "MoH Quartely reports 15+ ";
label n_onart_obs_mlw_all_unaids = "UNAIDS (all ages)";
label n_onart_obs_mlw_15pl_unaids = "UNAIDS 15+";

series  x=cald y=mean_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=n_onart_obs_mlw_all_moh / markerattrs=(symbol=circle color=lightgreen size=10);
scatter x=cald y=n_onart_obs_mlw_15pl_moh / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=n_onart_obs_mlw_15pl_unaids / markerattrs=(symbol=circle color=orange size=10);
scatter x=cald y=n_onart_obs_mlw_all_unaids / markerattrs=(symbol=circle color=red size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV tests (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 5000000) valueattrs=(size=10);

label mean_n_tested_0 = "Model";
label n_tests_obs_mlw_moh = "MoH Quarterly report";

series  x=cald y=mean_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=n_tests_obs_mlw_moh / markerattrs = (symbol=circle  color=green size = 12);
run;quit;

***NEEDS TO BE CORRECTED IN CORE - CURRENTLY TOO HIGH;
/* 
=======
>>>>>>> Stashed changes
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV self-tests (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 20000000 by 5000000) valueattrs=(size=10);

label mean_n_selftested_0 = "Model";
label n_self_tested_obs_mlw_moh = "MoH Quarterly report";
label n_self_tested_obs_mlw = "MoH?";

series  x=cald y=mean_n_selftested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_selftested_0 	upper=p95_n_selftested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=n_self_tested_obs_mlw_moh / markerattrs = (symbol=circle  color=green size = 12);
scatter x=cald y=n_self_tested_obs_mlw / markerattrs = (symbol=circle  color=lightgreen size = 12);

run;quit;
*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of VMMCs";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 300000 by 100000) valueattrs=(size=10);

label mean_n_vmmc1549m_0 = "Model 15+";
label mean_n_vmmc_all_0 = "Model 10+";

label n_new_vmmc_obs_mlw_amr = "MoH Quarterly report";

series  x=cald y=mean_n_vmmc1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_vmmc1549m_0 	upper=p95_n_vmmc1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_vmmc_all_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_vmmc_all_0 	upper=p95_n_vmmc_all_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=n_new_vmmc_obs_mlw_amr / markerattrs = (symbol=circle  color=green size = 12);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_mcirc_0 = "Model proportion circumcised";
label o_p_circ_1549_dhs = "DHS";
label o_p_circ_1549_phia = "MPHIA";

series  x=cald y=mean_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_circ_1549_dhs / markerattrs = (symbol=circle  color=green size = 12);
scatter x=cald y=o_p_circ_1549_phia  / markerattrs = (symbol=circle  color=blue size = 12);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion diagnosed (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_diag_0 = "Model";
label o_p_diag_1549_mdhs = "DHS 15-49";
label o_p_diag_15pl_phia = "MPHIA 15+";
label o_p_diag_obs_mlw_moh = "MoH Quarterly reports";

series  x=cald y=mean_p_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_0	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_diag_15pl_phia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_1549_mdhs / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=o_p_diag_obs_mlw_moh / markerattrs=(symbol=circle color=blue size=10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion diagnosed (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_diag_m_0 = "Model";
label o_p_diag_m1549_mdhs = "DHS 15-49";
label o_p_diag_m15pl_phia = "MPHIA 15+";

series  x=cald y=mean_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_diag_m15pl_phia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_m1549_mdhs / markerattrs=(symbol=circle color=green size=10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion diagnosed (Females 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_diag_w_0 = "Model";
label o_p_diag_w1549_mdhs = "DHS 15-49";
label o_p_diag_w15pl_phia = "MPHIA 15+";

series  x=cald y=mean_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_diag_w15pl_phia/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=o_p_diag_w1549_mdhs / markerattrs=(symbol=circle color=green size=10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number diagnosed per year (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1000000) valueattrs=(size=10);

label mean_n_diagnosed_0 = "Model";
label n_diag_obs_mlw_moh = "MoH Quarterly reports - all ages";

series  x=cald y=mean_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=n_diag_obs_mlw_moh / markerattrs=(symbol=circle color=blue size=10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_0 = "Model";
label p_diag_onart_mlw_15pl_phia = "MPHIA 15-64";
label p_diag_onart_mlw_all_moh = "MoH Quarterly reports (all ages)";

series  x=cald y=mean_p_onart_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_0	upper=p95_p_onart_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_diag_onart_mlw_15pl_phia/ markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=p_diag_onart_mlw_all_moh/ markerattrs=(symbol=circle color=blue size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (Males 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_m_0 = "Model";
label p_diag_onart_mlw_m15pl_phia = "MPHIA 15-64";

series  x=cald y=mean_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_diag_onart_mlw_m15pl_phia/ markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (Females 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_w_0 = "Model";
label p_diag_onart_mlw_w15pl_phia = "MPHIA 15-64";

series  x=cald y=mean_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_diag_onart_mlw_w15pl_phia/ markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000__0 = "Model";
label p_onart_vl1000_obs_mlw_unaids = "UNAIDS";
label p_onart_vl1000_obs_mlw_moh = "MoH Quarterly reports";
label p_onart_vl1000_mlw_15pl_phia = "MPHIA";

series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_onart_vl1000_obs_mlw_unaids/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=p_onart_vl1000_obs_mlw_moh/ markerattrs=(symbol=circle color=blue size=10);
scatter x=cald y=p_onart_vl1000_mlw_15pl_phia/ markerattrs=(symbol=circle color=green size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (Males 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000_m_0 = "Model";
label p_onart_vl1000_mlw_m15pl_phia = "MPHIA";

series  x=cald y=mean_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_onart_vl1000_mlw_m15pl_phia/ markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (Females 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000_w_0 = "Model";
label p_onart_vl1000_mlw_w15pl_phia = "MPHIA";

series  x=cald y=mean_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_onart_vl1000_mlw_w15pl_phia/ markerattrs=(symbol=circle color=green size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Currently on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 200000 by 20000) valueattrs=(size=10);

label mean_n_onprep_0 = "Model";
label n_onprep_obs_mlw_moh = "MoH Quarterly reports";

series  x=cald y=mean_n_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onprep_0	upper=p95_n_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=n_onprep_obs_mlw_moh/ markerattrs=(symbol=circle color=red size=10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Ever initiated PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2026 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1000000 by 50000) valueattrs=(size=10);

label mean_n_prep_ever_0 = "Model";
label o_n_prepever_mlw_pw = "PrEPWatch";

series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_ever_0	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_n_prepever_mlw_pw/ markerattrs=(symbol=circle color=red size=10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of those eligible, proportion on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 0.5 by 0.1) valueattrs=(size=10);

label mean_prop_elig_on_prep_0 = "Model";

series  x=cald y=mean_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "FSW Population (15-49)";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 200000 by 50000)  valueattrs=(size=10);

label mean_n_sw_1549__0	    = "Model";
label m_pop_sw_unaids		= "UNAIDS";

series  x=cald y=mean_n_sw_1549__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549__0      upper=p95_n_sw_1549__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=m_pop_sw_unaids / markerattrs = (symbol=circle color=red size = 10);
run;quit;


proc sgplot data=d; 
title    height=1.5 justify=center "HIV prevalence in female sex workers";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 1 by 0.2)    valueattrs=(size=10);

label mean_prevalence_1564sw_0 = "Model";
label m_prevalence_fsw_mlw_unaids = "UNAIDS";
label o_prevalence_fsw_mlw_mbbs = "Beh Survey";

series  x=cald y=mean_prevalence_1564sw_0 /  lineattrs = (color=black thickness = 2);
band   x=cald lower=p5_prevalence_1564sw_0  upper=p95_prevalence_1564sw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

scatter x=cald y=m_prevalence_fsw_mlw_unaids/ markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_prevalence_fsw_mlw_mbbs/ markerattrs = (symbol=circle       color=green size = 12);
run;quit;


proc sgplot data=d; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 20 by 2)    valueattrs=(size=10);

label mean_incidence_1564sw_0  = "Model";

series  x=cald y=mean_incidence_1564sw_0 /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_1564sw_0  upper=p95_incidence_1564sw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_sw_0 = "Model";

series  x=cald y=mean_p_onprep_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_sw_0 	upper=p95_p_onprep_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000) valueattrs=(size=10);

label mean_p_onprep_sw_0 = "Model";
label o_n_onprep_fsw_mlw_moh = "Global AIDS Monitoring Report 2024";

series  x=cald y=mean_n_onprep_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onprep_sw_0 	upper=p95_n_onprep_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_n_onprep_fsw_mlw_moh / markerattrs = (symbol=circle       color=red size = 10);
run;quit;
 

proc sgplot data=d; 
Title    height=1.5 justify=center "MSM Population (15-64)";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 200000 by 50000)  valueattrs=(size=10);

label mean_n_msm_1564__0     = "Model";
label m_pop_msm_unaids		 = "UNAIDS";

series  x=cald y=mean_n_msm_1564__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_msm_1564__0      upper=p95_n_msm_1564__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=m_pop_msm_unaids / markerattrs = (symbol=circle       color=red size = 10);

run;quit;


proc sgplot data=d; 
title    height=1.5 justify=center "HIV prevalence in MSM";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 1 by 0.2)    valueattrs=(size=10);

label mean_prevalence1549_msm_0 = "Model";
label o_prevalence_msm_mlw_mbbs = "Beh Survey";

series x=cald y=mean_prevalence1549_msm_0 /  lineattrs = (color=black thickness = 2);
band   x=cald lower=p5_prevalence1549_msm_0  upper=p95_prevalence1549_msm_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

scatter x=cald y=o_prevalence_msm_mlw_mbbs / markerattrs = (symbol=circle       color=red size = 10);
run;quit;


proc sgplot data=d; 
title    height=1.5 justify=center "HIV incidence amongst MSM";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 20 by 2)    valueattrs=(size=10);

label mean_incidence_msm_0  = "Mean";

series  x=cald y=mean_incidence_msm_0 /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_msm_0  upper=p95_incidence_msm_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_msm_0 = "Model";

series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_msm_0 	upper=p95_p_onprep_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5000) valueattrs=(size=10);

label mean_n_onprep_msm_0 = "Model";
label o_n_onprep_msm_mlw_moh = "Beh survey";

series  x=cald y=mean_n_onprep_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onprep_msm_0 	upper=p95_n_onprep_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_n_onprep_msm_mlw_moh / markerattrs = (symbol=circle       color=red size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "AGYW Population";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 3000000 by 250000)  valueattrs=(size=10);

label mean_n_agyw_0        	= "Model";

series  x=cald y=mean_n_agyw_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_agyw_0     		 upper=p95_n_agyw_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of women aged 15-64, proportion AGYW";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'              labelattrs=(size=12)  values = (0 to 0.5 by 0.1)  valueattrs=(size=10);

label mean_p_w_agyw_0	    = "Model";

series  x=cald y=mean_p_w_agyw_0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_w_agyw_0      upper=p95_p_w_agyw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
title    height=1.5 justify=center "HIV prevalence in AGYW";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 0.2 by 0.05)    valueattrs=(size=10);

label mean_prevalence_agyw_0 = "Model";
label prevalence_agyw_mlw_dhs = "DHS";
label prevalence_agyw_mlw_phia = "MPHIA";

series  x=cald y=mean_prevalence_agyw_0 /  lineattrs = (color=black thickness = 2);
band   x=cald lower=p5_prevalence_agyw_0 upper=p95_prevalence_agyw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

scatter x=cald y=prevalence_agyw_mlw_dhs / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=prevalence_agyw_mlw_phia / markerattrs = (symbol=circle  color=green size = 12);
run;quit;


proc sgplot data=d; 
title    height=1.5 justify=center "HIV incidence amongst AGYW";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 5 by 1)    valueattrs=(size=10);

label mean_incidence_agyw_0  = "Model";
label o_incidence_agyw_obs_mlw_phia = "MPHIA";

series  x=cald y=mean_incidence_agyw_0 /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_agyw_0  upper=p95_incidence_agyw_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";

scatter x=cald y=o_incidence_agyw_obs_mlw_phia / markerattrs = (symbol=circle  color=green size = 12);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of AGYW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_agyw_0 = "Model";

series  x=cald y=mean_p_onprep_agyw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_agyw_0 	upper=p95_p_onprep_agyw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV-related deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 30000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_0 = "Model";
series  x=cald y=mean_n_death_hivrel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_0 	upper=p95_n_death_hivrel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV-related deaths (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 20000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_m_0 = "Model";
label o_s_deaths_HIVrel_unaids_m= "UNAIDS 15+";

series  x=cald y=mean_n_death_hivrel_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_m_0 	upper=p95_n_death_hivrel_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV-related deaths (Females 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 20000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_w_0 = "Model";
label o_s_deaths_HIVrel_unaids_w= "UNAIDS 15+";

series  x=cald y=mean_n_death_hivrel_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_w_0 	upper=p95_n_death_hivrel_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

ods rtf close;
ods listing;
run;
