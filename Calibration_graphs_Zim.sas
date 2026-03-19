
libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim_PEP";

data y;
set a.long_gen_PEP_16Mar26;
run;
proc freq;table cald;run;

data b;
set y;
proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 28;

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
	n_alive1564_		n_alive1564m		n_alive1564w	n_new_inf
	n_alive_m			 n_alive_w			n_alive				n_hivge15m			n_hivge15w		    n_hivge15_		n_hivge1564_
	prevalence1549m 	 prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w 		incidence1549m
	p_onart				 p_onart_m			p_onart_w			n_onart				n_onart_m			n_onart_w

	p_diag	 			 p_diag_m	 		p_diag_w  			p_onart_diag   		p_onart_diag_m   	p_onart_diag_w  
	p_onart_vl1000_		 p_onart_vl1000_m   p_onart_vl1000_w	n_onprep_w			n_onprep_m			n_onprep
	prop_elig_on_prep	 n_prep_ever		prop_1564_onprep	n_onprep_oral		n_onprep_cab		n_onprep_len
	prop_elig_on_oral_prep

	n_sw_1564_			 n_sw_1549_			p_w_1564_sw			p_w_1549_sw			prevalence_1564sw	incidence_1564sw
	p_onprep_sw			 n_onprep_sw

	n_selftested		 n_tested			

	n_msm_1564_			 p_m_msm			prevalence1549_msm	incidence_msm		p_onprep_msm		n_onprep_msm
	n_agyw				 n_agyw_pg			p_w_agyw			prevalence_agyw		incidence_agyw		p_onprep_agyw		n_onprep_agyw

	n_death_hivrel		 n_death_hivrel_m	n_death_hivrel_w	
	n_hiv_pregnant		 n_pregnant_onart	n_give_birth_with_hiv	n_infbirth_testing	n_postdel_testing
	n_vm_this_per		 n_cd4m_this_per	n_vmmc1549m				n_vmmc_all		 p_mcirc			p_vmmc
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
%summary_all_options(options=0 1 2 3 4 5 6);





*turns log back on;
options notes source source2 mprint mlogic symbolgen;

data d;
set Master_summary;

%include "C:\Users\loveleen\Documents\GitHub\hiv-modelling\Observed data_Zimbabwe_Jan2026.sas"; by cald;

*ZNASP targets from Genesis;

if cald=2024 then do; 
	znasp_testing_target=1905127;
	znasp_vmmc1529_target=138869;
	znasp_fsw_target=47523;
end;

if cald=2026 then do;
	znasp_testing_target=1614000;
	znasp_prep_target=57407;
	znasp_prep_plw_target=5940;
	znasp_vmmc1529_target=62894;
	znasp_fsw_target=65473;
end;

if cald=2027 then do;
	znasp_testing_target=1613444;
	znasp_prep_target=86111;
	znasp_prep_plw_target=6213;
	znasp_vmmc1529_target=62894;
	znasp_fsw_target=75169;
end;

if cald=2028 then do;
	znasp_testing_target=1612788;
	znasp_prep_target=89241;
	znasp_prep_plw_target=6960;
	znasp_vmmc1529_target=62894;
	znasp_fsw_target=84864;
end;

if cald=2029 then do;
	znasp_testing_target=1612132;
	znasp_prep_target=96024;
	znasp_prep_plw_target=6960;
	znasp_vmmc1529_target=62894;
	znasp_fsw_target=94560;
end;

if cald=2030 then do;
	znasp_testing_target=1611476;
	znasp_prep_target=100043;
	znasp_prep_plw_target=6960;
	znasp_vmmc1529_target=62894;
	znasp_fsw_target=104256;
end;

run;

data e;
set d;
%include "C:\Users\Loveleen\Documents\GitHub\hiv-modelling\Observed data_FSW_Zimbabwe.sas"; by cald;
run;


DATA A.Zim_pep_options_graphs_16Mar26;
SET E;
RUN;


ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\PEP\Zim_calibration_12_03_26.doc" startpage=never; 
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
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.10) valueattrs=(size=10);

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
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.10) valueattrs=(size=10);

label mean_p_onart_m_0 = "Model";
label o_p_onart_1564m_zimphia = "ZIMPHIA (15-64)";

series  x=cald y=mean_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_p_onart_1564m_zimphia / markerattrs=(symbol=circle color=orange size=10);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "ART coverage (Females 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.10) valueattrs=(size=10);

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
Title    height=1.5 justify=center "Number tested (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to 2035 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12) valueattrs=(size=10);

label mean_n_tested_0 = "Model";
label o_s_tested_1549_py_garcpr = "GARPR 15-49";
label target_s_tested_1549_py_NSP = "NSP targets";
label o_s_test_15ov_py_z = "Isaac Taramusi";
label znasp_testing_target = "ZNASP targets";

series  x=cald y=mean_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_s_tested_1549_py_garcpr/ markerattrs=(symbol=circle color=red size=10);
scatter x=cald y=target_s_tested_1549_py_NSP/ markerattrs=(symbol=circle color=blue size=10);
scatter x=cald y=o_s_test_15ov_py_z / markerattrs=(symbol=circle color=green size=10);
scatter x=cald y=znasp_testing_target/ markerattrs=(symbol=circle color=purple size=10);

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
Title    height=1.5 justify=center "Number of VMMCs";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 300000 by 25000)  valueattrs=(size=10);

label mean_n_vmmc1549m_0    = "Model 15-49";
label mean_n_vmmc_all_0    = "Model 10+";
label o_s_new_vmmc  = "WHO 15+";
label o_s_new_vmmc_1049m  = "Ministry of Health 10+";
label o_s_new_vmmc_all = "UNAIDS 10+";

series  x=cald y=mean_n_vmmc1549m_0 /           lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_vmmc1549m_0      upper=p95_n_vmmc1549m_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_vmmc_all_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_vmmc_all_0      upper=p95_n_vmmc_all_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";


scatter x=cald y=o_s_new_vmmc / markerattrs = (symbol=circle color=red size = 10);
scatter x=cald y=o_s_new_vmmc_1049m / markerattrs = (symbol=circle color=green size = 10);
scatter x=cald y=o_s_new_vmmc_all / markerattrs = (symbol=circle color=blue size = 10);
run;quit; 

proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion circumcised";
xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'              labelattrs=(size=12)  values = (0 to 0.6 by 0.1)  valueattrs=(size=10);

label mean_p_vmmc_0    = "Model VMMCs";
label mean_p_mcirc_0    = "Model All circumcisions";
label o_p_circ_15pl_DHS_z  = "DHS";
label o_p_circ_1549_zimphia  = "ZIMPHIA";

series  x=cald y=mean_p_vmmc_0 /           lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vmmc_0      upper=p95_p_vmmc_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_mcirc_0 /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_0      upper=p95_p_mcirc_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_p_circ_15pl_DHS_z / markerattrs = (symbol=circle color=red size = 10);
scatter x=cald y=o_p_circ_1549_zimphia / markerattrs = (symbol=circle color=green size = 10);
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
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)       valueattrs=(size=10); 
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
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)       valueattrs=(size=10); 
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
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025  by 2)       valueattrs=(size=10); 
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
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 30000 by 2000 ) valueattrs=(size=10);

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
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 20000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_m_0 = "Model";
label o_s_deaths_HIVrel_unaids_m= "UNAIDS 15+";

series  x=cald y=mean_n_death_hivrel_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_m_0 	upper=p95_n_death_hivrel_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_s_deaths_HIVrel_unaids_m / markerattrs = (symbol=circle       color=green size = 12);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Number of HIV-related deaths (Males 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2025 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 20000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_w_0 = "Model";
label o_s_deaths_HIVrel_unaids_w= "UNAIDS 15+";

series  x=cald y=mean_n_death_hivrel_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hivrel_w_0 	upper=p95_n_death_hivrel_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_s_deaths_HIVrel_unaids_w / markerattrs = (symbol=circle       color=green size = 12);
run;quit;

ods rtf close;
ods listing;
run;


