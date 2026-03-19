
***THIS PROGRAM IS USED TO COMPARE GRAPHS OF THE DIFFERENT OPTIONS USING DATASET CREATED FROM CALIBRATION GRAPHS PROGRAM;

libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

data a1;
set a.Zim_options_graphs_znasp_17Mar26;
run;

proc means;var
mean_n_tested_0		p5_n_tested_0		p95_n_tested_0
mean_n_onprep_5		p5_n_onprep_5		p95_n_onprep_5
mean_n_onprep_w_5	p5_n_onprep_w_5		p95_n_onprep_w_5
mean_n_onprep_m_5	p5_n_onprep_m_5		p95_n_onprep_m_5

mean_n_prep_oral_plw_5		p5_n_prep_oral_plw_5		p95_n_prep_oral_plw_5
mean_n_prep_len_plw_5		p5_n_prep_len_plw_5			p95_n_prep_len_plw_5
mean_n_new_vmmc1529m_5		p5_n_new_vmmc1529m_5		p95_n_new_vmmc1529m_5
mean_n_sw_program_visit_6	p5_n_sw_program_visit_6		p95_n_sw_program_visit_6
;where cald=2030;
run;


data a;
set a1;

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

/***Scenarios;
0 = Min;
1 = VMMC at 60% base rate;
2 = Oral PrEP plus Len scale up;
3 = Enhanced FSW;
4 = Condom increase;
5 = VMMC at 60%, oral PrEP plus scale up Len, increase condom use;
6 = VMMC at 60%, oral PrEP plus scale up Len, increase condom use, enhanced FSW program;
*/

ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = "C:\Users\loveleen\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Prevention advocacy\Zimbabwe\Zim_options_znasp.doc" startpage=never; 
ods listing close;


proc sgplot data=a; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1300000 by 100000) valueattrs=(size=10);

label mean_n_hivge15__99 = "SQ";
label mean_n_hivge15__0 = "Base";
label mean_n_hivge15__1 = "VMMC";
label mean_n_hivge15__2 = "Oral PrEP + Len scale up";
label mean_n_hivge15__3 = "Enhanced FSW program";
label mean_n_hivge15__4 = "Condom increase";
label mean_n_hivge15__5 = "VMMC, PrEP, condoms";
label mean_n_hivge15__6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_n_hivge15__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_hivge15__1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Prevalence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)  values = (0 to 0.075 by 0.01) valueattrs=(size=10);

label mean_prevalence1549__99 = "SQ";
label mean_prevalence1549__0 = "Base";
label mean_prevalence1549__1 = "VMMC";
label mean_prevalence1549__2 = "Oral PrEP + Len scale up";
label mean_prevalence1549__3 = "Enhanced FSW program";
label mean_prevalence1549__4 = "Condom increase";
label mean_prevalence1549__5 = "VMMC, PrEP, condoms";
label mean_prevalence1549__6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_prevalence1549__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence1549__1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Incidence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 0.5 by 0.1) valueattrs=(size=10);

label mean_incidence1549__99 = "SQ";
label mean_incidence1549__0 = "Base";
label mean_incidence1549__1 = "VMMC";
label mean_incidence1549__2 = "Oral PrEP + Len scale up";
label mean_incidence1549__3 = "Enhanced FSW program";
label mean_incidence1549__4 = "Condom increase";
label mean_incidence1549__5 = "VMMC, PrEP, condoms";
label mean_incidence1549__6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_incidence1549__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "ART coverage (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_99 = "SQ";
label mean_p_onart_0 = "Base";
*label mean_p_onart_1 = "VMMC";
label mean_p_onart_2 = "Oral PrEP + Len scale up";
label mean_p_onart_3 = "Enhanced FSW program";
*label mean_p_onart_4 = "Condom increase";
label mean_p_onart_5 = "VMMC, PrEP, condoms";
label mean_p_onart_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onart_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
*series  x=cald y=mean_p_onart_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion diagnosed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_diag_99 = "SQ";
label mean_p_diag_0 = "Base";
label mean_p_diag_1 = "VMMC";
label mean_p_diag_2 = "Oral PrEP + Len scale up";
label mean_p_diag_3 = "Enhanced FSW program";
label mean_p_diag_4 = "Condom increase";
label mean_p_diag_5 = "VMMC, PrEP, condoms";
label mean_p_diag_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_diag_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
*series  x=cald y=mean_p_diag_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_p_diag_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_99 = "SQ";
label mean_p_onart_diag_0 = "Base";
*label mean_p_onart_diag_1 = "VMMC";
label mean_p_onart_diag_2 = "Oral PrEP + Len scale up";
label mean_p_onart_diag_3 = "Enhanced FSW program";
*label mean_p_onart_diag_4 = "Condom increase";
label mean_p_onart_diag_5 = "VMMC, PrEP, condoms";
label mean_p_onart_diag_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onart_diag_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
*series  x=cald y=mean_p_onart_diag_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_diag_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000__99 = "SQ";
label mean_p_onart_vl1000__0 = "Base";
label mean_p_onart_vl1000__1 = "VMMC";
label mean_p_onart_vl1000__2 = "Oral PrEP + Len scale up";
label mean_p_onart_vl1000__3 = "Enhanced FSW program";
label mean_p_onart_vl1000__4 = "Condom increase";
label mean_p_onart_vl1000__5 = "VMMC, PrEP, condoms";
label mean_p_onart_vl1000__6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onart_vl1000__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
*series  x=cald y=mean_p_onart_vl1000__1/	lineattrs = (color=blue thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_vl1000__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_vl1000__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_vl1000__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Ever initiated PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 3000000 by 200000) valueattrs=(size=10);

label mean_n_prep_ever_99 = "SQ";
label mean_n_prep_ever_0 = "Base";
label mean_n_prep_ever_1 = "VMMC";
label mean_n_prep_ever_2 = "Oral PrEP + Len scale up";
label mean_n_prep_ever_3 = "Enhanced FSW program";
label mean_n_prep_ever_4 = "Condom increase";
label mean_n_prep_ever_5 = "VMMC, PrEP, condoms";
label mean_n_prep_ever_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_n_prep_ever_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_n_prep_ever_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_n_prep_ever_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_6/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Currently on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 300000 by 20000) valueattrs=(size=10);

label mean_n_onprep_99 = "SQ";
label mean_n_onprep_0 = "Base";
label mean_n_onprep_1 = "VMMC";
label mean_n_onprep_2 = "Oral PrEP + Len scale up";
label mean_n_onprep_3 = "Enhanced FSW program";
label mean_n_onprep_4 = "Condom increase";
label mean_n_onprep_5 = "VMMC, PrEP, condoms";
label mean_n_onprep_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_n_onprep_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_n_onprep_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_n_onprep_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in female sex workers";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 0.5 by 0.1)    valueattrs=(size=10);

label mean_prevalence_1564sw_99 = "SQ";
label mean_prevalence_1564sw_0 = "Base";
label mean_prevalence_1564sw_1 = "VMMC";
label mean_prevalence_1564sw_2 = "Oral PrEP + Len scale up";
label mean_prevalence_1564sw_3 = "Enhanced FSW program";
label mean_prevalence_1564sw_4 = "Condom increase";
label mean_prevalence_1564sw_5 = "VMMC, PrEP, condoms";
label mean_prevalence_1564sw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_prevalence_1564sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_prevalence_1564sw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 10 by 2)    valueattrs=(size=10);

label mean_incidence_1564sw_99 = "SQ";
label mean_incidence_1564sw_0 = "Base";
label mean_incidence_1564sw_1 = "VMMC";
label mean_incidence_1564sw_2 = "Oral PrEP + Len scale up";
label mean_incidence_1564sw_3 = "Enhanced FSW program";
label mean_incidence_1564sw_4 = "Condom increase";
label mean_incidence_1564sw_5 = "VMMC, PrEP, condoms";
label mean_incidence_1564sw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_incidence_1564sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_incidence_1564sw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.30 by 0.03) valueattrs=(size=10);

label mean_p_onprep_sw_99 = "SQ";
label mean_p_onprep_sw_0 = "Base";
*label mean_p_onprep_sw_1 = "VMMC";
label mean_p_onprep_sw_2 = "Oral PrEP + Len scale up";
label mean_p_onprep_sw_3 = "Enhanced FSW program";
label mean_p_onprep_sw_4 = "Condom increase";
label mean_p_onprep_sw_5 = "VMMC, PrEP, condoms";
label mean_p_onprep_sw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onprep_sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_p_onprep_sw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in AGYW";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.0 to 0.05 by 0.01)    valueattrs=(size=10);

label mean_prevalence_agyw_99 = "SQ";
label mean_prevalence_agyw_0 = "Base";
*label mean_prevalence_agyw_1 = "VMMC";
label mean_prevalence_agyw_2 = "Oral PrEP + Len scale up";
label mean_prevalence_agyw_3 = "Enhanced FSW program";
label mean_prevalence_agyw_4 = "Condom increase";
label mean_prevalence_agyw_5 = "VMMC, PrEP, condoms";
label mean_prevalence_agyw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_prevalence_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_prevalence_agyw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst AGYWs";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 1 by 0.1)    valueattrs=(size=10);

label mean_incidence_agyw_99 = "SQ";
label mean_incidence_agyw_0 = "Base";
*label mean_incidence_agyw_1 = "VMMC";
label mean_incidence_agyw_2 = "Oral PrEP + Len scale up";
label mean_incidence_agyw_3 = "Enhanced FSW program";
label mean_incidence_agyw_4 = "Condom increase";
label mean_incidence_agyw_5 = "VMMC, PrEP, condoms";
label mean_incidence_agyw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_incidence_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_incidence_agyw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of AGYW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.08 by 0.01) valueattrs=(size=10);

label mean_p_onprep_agyw_99 = "SQ";
label mean_p_onprep_agyw_0 = "Base";
*label mean_p_onprep_agyw_1 = "VMMC";
label mean_p_onprep_agyw_2 = "Oral PrEP + Len scale up";
label mean_p_onprep_agyw_3 = "Enhanced FSW program";
label mean_p_onprep_agyw_4 = "Condom increase";
label mean_p_onprep_agyw_5 = "VMMC, PrEP, condoms";
label mean_p_onprep_agyw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onprep_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_p_onprep_agyw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;



proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in MSM";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0 to 0.35 by 0.05)    valueattrs=(size=10);

label mean_prevalence1549_msm_99 = "SQ";
label mean_prevalence1549_msm_0 = "Base";
label mean_prevalence1549_msm_1 = "VMMC";
label mean_prevalence1549_msm_2 = "Oral PrEP + Len scale up";
label mean_prevalence1549_msm_3 = "Enhanced FSW program";
label mean_prevalence1549_msm_4 = "Condom increase";
label mean_prevalence1549_msm_5 = "VMMC, PrEP, condoms";
label mean_prevalence1549_msm_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_prevalence1549_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_prevalence1549_msm_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
*series  x=cald y=mean_prevalence1549_msm_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
*series  x=cald y=mean_prevalence1549_msm_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst MSM";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 8 by 2)    valueattrs=(size=10);

label mean_incidence_msm_99 = "SQ";
label mean_incidence_msm_0 = "Base";
label mean_incidence_msm_1 = "VMMC";
label mean_incidence_msm_2 = "Oral PrEP + Len scale up";
label mean_incidence_msm_3 = "Enhanced FSW program";
label mean_incidence_msm_4 = "Condom increase";
label mean_incidence_msm_5 = "VMMC, PrEP, condoms";
label mean_incidence_msm_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_incidence_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_incidence_msm_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
*series  x=cald y=mean_incidence_msm_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
*series  x=cald y=mean_incidence_msm_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_msm_99 = "SQ";
label mean_p_onprep_msm_0 = "Base";
*label mean_p_onprep_msm_1 = "VMMC";
label mean_p_onprep_msm_2 = "Oral PrEP + Len scale up";
*label mean_p_onprep_msm_3 = "Enhanced FSW program";
label mean_p_onprep_msm_4 = "Condom increase";
label mean_p_onprep_msm_5 = "VMMC, PrEP, condoms";
*label mean_p_onprep_msm_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onprep_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_p_onprep_msm_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Number of VMMCs";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 200000 by 20000 ) valueattrs=(size=10);

label mean_n_vmmc_all_99 = "SQ";
label mean_n_vmmc_all_0 = "Base";
label mean_n_vmmc_all_1 = "VMMC";
label mean_n_vmmc_all_2 = "Oral PrEP + Len scale up";
label mean_n_vmmc_all_3 = "Enhanced FSW program";
label mean_n_vmmc_all_4 = "Condom increase";
label mean_n_vmmc_all_5 = "VMMC, PrEP, condoms";
label mean_n_vmmc_all_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_n_vmmc_all_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_vmmc_all_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_n_vmmc_all_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
*series  x=cald y=mean_n_vmmc_all_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
*series  x=cald y=mean_n_vmmc_all_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_n_vmmc_all_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
*series  x=cald y=mean_n_vmmc_all_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
*series  x=cald y=mean_n_vmmc_all_6/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Number of VMMCs in 15-29 year olds";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 200000 by 20000 ) valueattrs=(size=10);

label mean_n_new_vmmc1529m_99 = "SQ";
label mean_n_new_vmmc1529m_0 = "Base";
label mean_n_new_vmmc1529m_1 = "VMMC";
label mean_n_new_vmmc1529m_2 = "Oral PrEP + Len scale up";
label mean_n_new_vmmc1529m_3 = "Enhanced FSW program";
label mean_n_new_vmmc1529m_4 = "Condom increase";
label mean_n_new_vmmc1529m_5 = "VMMC, PrEP, condoms";
label mean_n_new_vmmc1529m_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_n_new_vmmc1529m_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_new_vmmc1529m_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_n_new_vmmc1529m_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
*series  x=cald y=mean_n_new_vmmc1529m_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
*series  x=cald y=mean_n_new_vmmc1529m_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_n_new_vmmc1529m_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
*series  x=cald y=mean_n_new_vmmc1529m_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
*series  x=cald y=mean_n_new_vmmc1529m_6/	lineattrs = (color=purple thickness = 2 pattern=solid);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Number of HIV-related deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 12000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_99 = "SQ";
label mean_n_death_hivrel_0 = "Base";
label mean_n_death_hivrel_1 = "VMMC";
label mean_n_death_hivrel_2 = "Oral PrEP + Len scale up";
label mean_n_death_hivrel_3 = "Enhanced FSW program";
label mean_n_death_hivrel_4 = "Condom increase";
label mean_n_death_hivrel_5 = "VMMC, PrEP, condoms";
label mean_n_death_hivrel_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_n_death_hivrel_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_n_death_hivrel_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion SW diagnosed (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1 by 0.2)	  valueattrs=(size=10);

label mean_p_diag_sw_99 = "SQ";
label mean_p_diag_sw_0 = "Base";
label mean_p_diag_sw_1 = "VMMC";
label mean_p_diag_sw_2 = "Oral PrEP + Len scale up";
label mean_p_diag_sw_3 = "Enhanced FSW program";
label mean_p_diag_sw_4 = "Condom increase";
label mean_p_diag_sw_5 = "VMMC, PrEP, condoms";
label mean_p_diag_sw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_diag_sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_sw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_p_diag_sw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_p_diag_sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;



proc sgplot data=a; 
Title    height=1.5 justify=center "Of those diagnosed, proportion SW on ART (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1 by 0.2)	  valueattrs=(size=10);

label mean_p_onart_diag_sw_99 = "SQ";
label mean_p_onart_diag_sw_0 = "Base";
*label mean_p_onart_diag_sw_1 = "VMMC";
label mean_p_onart_diag_sw_2 = "Oral PrEP + Len scale up";
label mean_p_onart_diag_sw_3 = "Enhanced FSW program";
*label mean_p_onart_diag_sw_4 = "Condom increase";
label mean_p_onart_diag_sw_5 = "VMMC, PrEP, condoms";
label mean_p_onart_diag_sw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onart_diag_sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_sw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
series  x=cald y=mean_p_onart_diag_sw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Of those on ART, proportion SW suppressed (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 1 by 0.2)	  valueattrs=(size=10);

label mean_p_onart_vl1000_sw_99 = "SQ";
label mean_p_onart_vl1000_sw_0 = "Base";
label mean_p_onart_vl1000_sw_1 = "VMMC";
label mean_p_onart_vl1000_sw_2 = "Oral PrEP + Len scale up";
label mean_p_onart_vl1000_sw_3 = "Enhanced FSW program";
label mean_p_onart_vl1000_sw_4 = "Condom increase";
label mean_p_onart_vl1000_sw_5 = "VMMC, PrEP, condoms";
label mean_p_onart_vl1000_sw_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_onart_vl1000_sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000_sw_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_p_onart_vl1000_sw_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000_sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000_sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_p_onart_vl1000_sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000_sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000_sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Number of SW program visits (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 150000)	  valueattrs=(size=10);

label mean_n_sw_program_visit_99 = "SQ";
label mean_n_sw_program_visit_0 = "Base";
label mean_n_sw_program_visit_1 = "VMMC";
label mean_n_sw_program_visit_2 = "Oral PrEP + Len scale up";
label mean_n_sw_program_visit_3 = "Enhanced FSW program";
label mean_n_sw_program_visit_4 = "Condom increase";
label mean_n_sw_program_visit_5 = "VMMC, PrEP, condoms";
label mean_n_sw_program_visit_6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_n_sw_program_visit_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_sw_program_visit_0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_n_sw_program_visit_1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_sw_program_visit_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_sw_program_visit_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
*series  x=cald y=mean_n_sw_program_visit_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_sw_program_visit_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_sw_program_visit_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of people with at least one condomless partner";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12) values = (0 to 0.1 by 0.01)	  valueattrs=(size=10);

label mean_p_newp_ge1__99 = "SQ";
label mean_p_newp_ge1__0 = "Base";
label mean_p_newp_ge1__1 = "VMMC";
label mean_p_newp_ge1__2 = "Oral PrEP + Len scale up";
label mean_p_newp_ge1__3 = "Enhanced FSW program";
label mean_p_newp_ge1__4 = "Condom increase";
label mean_p_newp_ge1__5 = "VMMC, PrEP, condoms";
label mean_p_newp_ge1__6 = "VMMC, PrEP, condoms, enhanced FSW program";

series  x=cald y=mean_p_newp_ge1__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_newp_ge1__0/	lineattrs = (color=red thickness = 2 pattern=solid); 
*series  x=cald y=mean_p_newp_ge1__1/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_newp_ge1__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_newp_ge1__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_newp_ge1__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_newp_ge1__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_newp_ge1__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
run;quit;

ods rtf close;
ods listing;
run;


***ZNASP targets;
proc means data = a;var
mean_n_tested_0 p5_n_tested_0 p95_n_tested_0
mean_n_onprep_5 p5_n_onprep_5 p95_n_onprep_5
mean_n_prep_oral_plw_5 p5_n_prep_oral_plw_5 p95_n_prep_oral_plw_5
mean_n_new_vmmc1529m_5 p5_n_new_vmmc1529m_5 p95_n_new_vmmc1529m_5
mean_n_sw_program_visit_0 p5_n_sw_program_visit_0 p95_n_sw_program_visit_0
;run;
