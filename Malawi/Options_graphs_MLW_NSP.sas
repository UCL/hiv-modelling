
***THIS PROGRAM IS USED TO COMPARE GRAPHS OF THE DIFFERENT OPTIONS;

libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Mlw";

data a;
set a.MLW_options_graphs_NSP;
run;

data b;
set a;
mean_incidence1549__4 = mean_incidence1549__4*10;
p5_incidence1549__4 = p5_incidence1549__4 *10;
p95_incidence1549__4 = p95_incidence1549__4 *10;
	
mean_incidence1549w_4 = mean_incidence1549w_4 *10;
p5_incidence1549w_4 = p5_incidence1549w_4 * 10;
p95_incidence1549w_4 = p95_incidence1549w_4 * 10;

mean_incidence1549m_4 = mean_incidence1549m_4 *10;
p5_incidence1549m_4 = p5_incidence1549m_4 * 10;
p95_incidence1549m_4 = p95_incidence1549m_4 * 10;

mean_incidence_agyw_4 = mean_incidence_agyw_4 *10;
p5_incidence_agyw_4 = p5_incidence_agyw_4 * 10;
p95_incidence_agyw_4 = p95_incidence_agyw_4 * 10;

run;

proc means mean p5 p95;var 

mean_incidence1549__4	p5_incidence1549__4			p95_incidence1549__4
mean_incidence1549w_4	p5_incidence1549w_4			p95_incidence1549w_4
mean_incidence1549m_4	p5_incidence1549m_4			p95_incidence1549m_4
mean_incidence_agyw_4	p5_incidence_agyw_4			p95_incidence_agyw_4

mean_p_diag_4  			p5_p_diag_4  				p95_p_diag_4
mean_p_diag_w_4  		p5_p_diag_w_4  				p95_p_diag_w_4
mean_p_diag_m_4 		p5_p_diag_m_4  				p95_p_diag_m_4
mean_p_diag_w1524_4  	p5_p_diag_w1524_4  			p95_p_diag_w1524_4
mean_p_diag_sw_4  		p5_p_diag_sw_4  			p95_p_diag_sw_4
mean_p_diag_msm_4  		p5_p_diag_msm_4  			p95_p_diag_msm_4
mean_p_onart_4  		p5_p_onart_4  				p95_p_onart_4
mean_p_onart_w_4  		p5_p_onart_w_4  			p95_p_onart_w_4
mean_p_onart_m_4  		p5_p_onart_m_4  			p95_p_onart_m_4
mean_p_onart_w1524__4  	p5_p_onart_w1524__4  		p95_p_onart_w1524__4
mean_p_onart_sw_4  		p5_p_onart_sw_4  			p95_p_onart_sw_4
mean_p_onart_msm_4  	p5_p_onart_msm_4  			p95_p_onart_msm_4
mean_n_vmmc_all_4  		p5_n_vmmc_all_4  			p95_n_vmmc_all_4
mean_n_vmmc_all_4  		p5_n_vmmc_all_4  			p95_n_vmmc_all_4

mean_prop_sw_program_visit_4 p5_prop_sw_program_visit_4  	p95_prop_sw_program_visit_4
mean_n_prep_ever_1524w_4  	p5_n_prep_ever_1524w_4 		p95_n_prep_ever_1524w_4
mean_n_prep_any_ever_w_4  	p5_n_prep_any_ever_w_4 		p95_n_prep_any_ever_w_4
mean_n_prep_any_ever_m_4  	p5_n_prep_any_ever_m_4 		p95_n_prep_any_ever_m_4
mean_n_prep_ever_sw_4  	p5_n_prep_ever_sw_4  	p95_n_prep_ever_sw_4
mean_n_onprep_agyw_4  	p5_n_onprep_agyw_4 		p95_n_onprep_agyw_4
mean_n_onprep_w_4  	p5_n_onprep_w_4 		p95_n_onprep_w_4
mean_n_onprep_m_4  	p5_n_onprep_m_4 		p95_n_onprep_m_4
mean_n_onprep_sw_4  	p5_n_onprep_sw_4  	p95_n_onprep_sw_4
mean_n_onprep_msm_4  	p5_n_onprep_msm_4  	p95_n_onprep_msm_4;
;where cald=2030;

;run;


/***Scenarios;
0 = Min;
1 = VMMC;
2 = PrEP;
3 = Return interventions;
4 = Combination;

99 = SQ;
*/
ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Prevention advocacy\Malawi\Mlw_options_NSP.doc" startpage=never; 
ods listing close;

*ods listing gpath="C:\Users\lovel\Documents";
*ods graphics on / imagename="SGPlot" imagefmt=png;
proc sgplot data=a; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1300000 by 100000) valueattrs=(size=10);

label mean_n_hivge15__99 = "SQ";
label mean_n_hivge15__0 = "Base";
label mean_n_hivge15__1 = "VMMC";
label mean_n_hivge15__2 = "PrEP including Len";
label mean_n_hivge15__3 = "Return interventions";
label mean_n_hivge15__4 = "Combination";

series  x=cald y=mean_n_hivge15__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_hivge15__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Number of new infections (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2070 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 75000 by 10000) valueattrs=(size=10);

label mean_n_new_inf_99 = "SQ";
label mean_n_new_inf_0 = "Base";
label mean_n_new_inf_1 = "VMMC";
label mean_n_new_inf_2 = "PrEP including Len";
label mean_n_new_inf_3 = "Return interventions";
label mean_n_new_inf_4 = "Combination";

series  x=cald y=mean_n_new_inf_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_new_inf_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_new_inf_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_new_inf_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_new_inf_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_new_inf_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Prevalence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)  values = (0 to 0.075 by 0.01) valueattrs=(size=10);

label mean_prevalence1549__99 = "SQ";
label mean_prevalence1549__0 = "Base";
label mean_prevalence1549__1 = "VMMC";
label mean_prevalence1549__2 = "PrEP including Len";
label mean_prevalence1549__3 = "Return interventions";
label mean_prevalence1549__4 = "Combination";

series  x=cald y=mean_prevalence1549__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence1549__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Incidence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 0.5 by 0.1) valueattrs=(size=10);

label mean_incidence1549__99 = "SQ";
label mean_incidence1549__0 = "Base";
label mean_incidence1549__1 = "VMMC";
label mean_incidence1549__2 = "PrEP including Len";
label mean_incidence1549__3 = "Return interventions";
label mean_incidence1549__4 = "Combination";

series  x=cald y=mean_incidence1549__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "ART coverage (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '%'	labelattrs=(size=12)  values = (0.8 to 0.95 by 0.05) valueattrs=(size=10);

label mean_p_onart_99 = "SQ";
label mean_p_onart_0 = "Base";
label mean_p_onart_1 = "VMMC";
label mean_p_onart_2 = "PrEP including Len";
label mean_p_onart_3 = "Return interventions";
label mean_p_onart_4 = "Combination";

series  x=cald y=mean_p_onart_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion diagnosed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.9 to 0.98 by 0.01) valueattrs=(size=10);

label mean_p_diag_99 = "SQ";
label mean_p_diag_0 = "Base";
label mean_p_diag_1 = "VMMC";
label mean_p_diag_2 = "PrEP including Len";
label mean_p_diag_3 = "Return interventions";
label mean_p_diag_4 = "Combination";

series  x=cald y=mean_p_diag_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_diag_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.9 to 1 by 0.01) valueattrs=(size=10);

label mean_p_onart_diag_99 = "SQ";
label mean_p_onart_diag_0 = "Base";
label mean_p_onart_diag_1 = "VMMC";
label mean_p_onart_diag_2 = "PrEP including Len";
label mean_p_onart_diag_3 = "Return interventions";
label mean_p_onart_diag_4 = "Combination";

series  x=cald y=mean_p_onart_diag_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_diag_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.96 to 1 by 0.01) valueattrs=(size=10);

label mean_p_onart_vl1000__99 = "SQ";
label mean_p_onart_vl1000__0 = "Base";
label mean_p_onart_vl1000__1 = "VMMC";
label mean_p_onart_vl1000__2 = "PrEP including Len";
label mean_p_onart_vl1000__3 = "Return interventions";
label mean_p_onart_vl1000__4 = "Combination";

series  x=cald y=mean_p_onart_vl1000__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_vl1000__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Ever initiated PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 3000000 by 200000) valueattrs=(size=10);

label mean_n_prep_ever_99 = "SQ";
label mean_n_prep_ever_0 = "Base";
label mean_n_prep_ever_1 = "VMMC";
label mean_n_prep_ever_2 = "PrEP including Len";
label mean_n_prep_ever_3 = "Return interventions";
label mean_n_prep_ever_4 = "Combination";

series  x=cald y=mean_n_prep_ever_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_prep_ever_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Currently on PrEP (All, 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 300000 by 20000) valueattrs=(size=10);

label mean_n_onprep_99 = "SQ";
label mean_n_onprep_0 = "Base";
label mean_n_onprep_1 = "VMMC";
label mean_n_onprep_2 = "PrEP including Len";
label mean_n_onprep_3 = "Return interventions";
label mean_n_onprep_4 = "Combination";

series  x=cald y=mean_n_onprep_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_onprep_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;

proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in female sex workers";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 0.5 by 0.05)    valueattrs=(size=10);

label mean_prevalence_1564sw_99 = "SQ";
label mean_prevalence_1564sw_0 = "Base";
label mean_prevalence_1564sw_1 = "VMMC";
label mean_prevalence_1564sw_2 = "PrEP including Len";
label mean_prevalence_1564sw_3 = "Return interventions";
label mean_prevalence_1564sw_4 = "Combination";

series  x=cald y=mean_prevalence_1564sw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_1564sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 10 by 2)    valueattrs=(size=10);

label mean_incidence_1564sw_99 = "SQ";
label mean_incidence_1564sw_0 = "Base";
label mean_incidence_1564sw_1 = "VMMC";
label mean_incidence_1564sw_2 = "PrEP including Len";
label mean_incidence_1564sw_3 = "Return interventions";
label mean_incidence_1564sw_4 = "Combination";

series  x=cald y=mean_incidence_1564sw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_1564sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.30 by 0.03) valueattrs=(size=10);

label mean_p_onprep_sw_99 = "SQ";
label mean_p_onprep_sw_0 = "Base";
label mean_p_onprep_sw_1 = "VMMC";
label mean_p_onprep_sw_2 = "PrEP including Len";
label mean_p_onprep_sw_3 = "Return interventions";
label mean_p_onprep_sw_4 = "Combination";

series  x=cald y=mean_p_onprep_sw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in AGYW";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.0 to 0.05 by 0.01)    valueattrs=(size=10);

label mean_prevalence_agyw_99 = "SQ";
label mean_prevalence_agyw_0 = "Base";
label mean_prevalence_agyw_1 = "VMMC";
label mean_prevalence_agyw_2 = "PrEP including Len";
label mean_prevalence_agyw_3 = "Return interventions";
label mean_prevalence_agyw_4 = "Combination";

series  x=cald y=mean_prevalence_agyw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_agyw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst AGYW";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 1 by 0.1)    valueattrs=(size=10);

label mean_incidence_agyw_99 = "SQ";
label mean_incidence_agyw_0 = "Base";
label mean_incidence_agyw_1 = "VMMC";
label mean_incidence_agyw_2 = "PrEP including Len";
label mean_incidence_agyw_3 = "Return interventions";
label mean_incidence_agyw_4 = "Combination";

series  x=cald y=mean_incidence_agyw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_agyw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of AGYW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.08 by 0.01) valueattrs=(size=10);

label mean_p_onprep_agyw_99 = "SQ";
label mean_p_onprep_agyw_0 = "Base";
label mean_p_onprep_agyw_1 = "VMMC";
label mean_p_onprep_agyw_2 = "PrEP including Len";
label mean_p_onprep_agyw_3 = "Return interventions";
label mean_p_onprep_agyw_4 = "Combination";

series  x=cald y=mean_p_onprep_agyw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_agyw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in MSM";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 0.35 by 0.05)    valueattrs=(size=10);

label mean_prevalence1549_msm_99 = "SQ";
label mean_prevalence1549_msm_0 = "Base";
label mean_prevalence1549_msm_1 = "VMMC";
label mean_prevalence1549_msm_2 = "PrEP including Len";
label mean_prevalence1549_msm_3 = "Return interventions";
label mean_prevalence1549_msm_4 = "Combination";

series  x=cald y=mean_prevalence1549_msm_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence1549_msm_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst MSM";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 8 by 2)    valueattrs=(size=10);

label mean_incidence_msm_99 = "SQ";
label mean_incidence_msm_0 = "Base";
label mean_incidence_msm_1 = "VMMC";
label mean_incidence_msm_2 = "PrEP including Len";
label mean_incidence_msm_3 = "Return interventions";
label mean_incidence_msm_4 = "Combination";

series  x=cald y=mean_incidence_msm_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_msm_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_msm_99 = "SQ";
label mean_p_onprep_msm_0 = "Base";
label mean_p_onprep_msm_1 = "VMMC";
label mean_p_onprep_msm_2 = "PrEP including Len";
label mean_p_onprep_msm_3 = "Return interventions";
label mean_p_onprep_msm_4 = "Combination";

series  x=cald y=mean_p_onprep_msm_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_msm_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Number of VMMCs";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 300000 by 20000 ) valueattrs=(size=10);

label mean_n_vmmc_all_99 = "SQ";
label mean_n_vmmc_all_0 = "Base";
label mean_n_vmmc_all_1 = "VMMC";
label mean_n_vmmc_all_2 = "PrEP including Len";
label mean_n_vmmc_all_3 = "Return interventions";
label mean_n_vmmc_all_4 = "Combination";

series  x=cald y=mean_n_vmmc_all_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_vmmc_all_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_vmmc_all_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_vmmc_all_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_vmmc_all_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_vmmc_all_4/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;



proc sgplot data=a; 
Title    height=1.5 justify=center "Number of HIV-related deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2076 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (2000 to 12000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_99 = "SQ";
label mean_n_death_hivrel_0 = "Base";
label mean_n_death_hivrel_1 = "VMMC";
label mean_n_death_hivrel_2 = "PrEP including Len";
label mean_n_death_hivrel_3 = "Return interventions";
label mean_n_death_hivrel_4 = "Combination";

series  x=cald y=mean_n_death_hivrel_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_death_hivrel_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

/*

proc sgplot data=a; 
Title    height=1.5 justify=center "Number of all cause deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2076 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_n_death_99 = "SQ";
label mean_n_death_0 = "Base";
label mean_n_death_1 = "FSW program";
label mean_n_death_2 = "VMMC";
label mean_n_death_3 = "VMMC increase";
label mean_n_death_4 = "Oral PrEP continuation";
label mean_n_death_5 = "Oral PrEP and intro of Len";
label mean_n_death_6 = "Oral PrEP and scale up of Len";
label mean_n_death_16 = "Return interventions";
label mean_n_death_17 = "VL and CD4 testing";

*series  x=cald y=mean_n_death_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_death_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
*series  x=cald y=mean_n_death_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
*series  x=cald y=mean_n_death_3/	lineattrs = (color=blue thickness = 2 pattern=solid);
*series  x=cald y=mean_n_death_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
*series  x=cald y=mean_n_death_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
*series  x=cald y=mean_n_death_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
*series  x=cald y=mean_n_death_16/lineattrs = (color=pink thickness = 2 pattern=solid);
*series  x=cald y=mean_n_death_17/lineattrs = (color=green thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion CD4<200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2076 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)   values = (0 to 0.2 by 0.02) valueattrs=(size=10);

label mean_p_onart_cd4_l200_0 = "Base";
label mean_p_onart_cd4_l200_1 = "FSW program";

*series  x=cald y=mean_n_death_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_cd4_l200_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_cd4_l200_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2076 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)   values = (0 to 0.2 by 0.02) valueattrs=(size=10);

label mean_p_newp_ge1__0 = "Base";
label mean_p_newp_ge1__1 = "FSW program";

*series  x=cald y=mean_n_death_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_newp_ge1__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_newp_ge1__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "n_new_inf_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2076 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  valueattrs=(size=10);

label mean_n_new_inf_sw_0 = "Base";
label mean_n_new_inf_sw_1 = "FSW program";

*series  x=cald y=mean_n_death_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_new_inf_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_new_inf_sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "n_sw_program_visit";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2076 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  valueattrs=(size=10);

label mean_n_sw_program_visit_0 = "Base";
label mean_n_sw_program_visit_1 = "FSW program";

*series  x=cald y=mean_n_death_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_sw_program_visit_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_sw_program_visit_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Number of HIV tests in SW (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_n_tested_sw_99 = "SQ";
label mean_n_tested_sw_0 = "Base";
label mean_n_tested_sw_1 = "FSW program";

*series  x=cald y=mean_n_tested_sw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_tested_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_tested_sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion SW diagnosed (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0.8 to 1 by 0.2)	  valueattrs=(size=10);

label mean_p_diag_sw_99 = "SQ";
label mean_p_diag_sw_0 = "Base";
label mean_p_diag_sw_1 = "FSW program";

*series  x=cald y=mean_p_diag_sw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_diag_sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
run;quit;



proc sgplot data=a; 
Title    height=1.5 justify=center "Of those diagnosed, proportion SW on ART (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0.8 to 1 by 0.2)	  valueattrs=(size=10);

label mean_p_onart_diag_sw_99 = "SQ";
label mean_p_onart_diag_sw_0 = "Base";
label mean_p_onart_diag_sw_1 = "FSW program";
label mean_p_onart_diag_sw_16 = "Return";


*series  x=cald y=mean_p_onart_diag_sw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_diag_sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_diag_sw_16/	lineattrs = (color=pink thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Of those on ART, proportion SW suppressed (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0.8 to 1 by 0.05)	  valueattrs=(size=10);

label mean_p_onart_vl1000_sw_99 = "SQ";
label mean_p_onart_vl1000_sw_0 = "Base";
label mean_p_onart_vl1000_sw_1 = "FSW program";
label mean_p_onart_vl1000_sw_16 = "Return interventions";


*series  x=cald y=mean_p_onart_vl1000_sw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_vl1000_sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_vl1000_sw_16/	lineattrs = (color=pink thickness = 2 pattern=solid);

run;quit;
*/
ods rtf close;
ods listing;
run;

