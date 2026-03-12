
***THIS PROGRAM IS USED TO COMPARE GRAPHS OF THE DIFFERENT OPTIONS USING DATASET CREATED FROM CALIBRATION GRAPHS PROGRAM;

libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";

data a;
set a.Zim_pep_options_graphs_05Mar26;
run;



/***Scenarios;
0 = Min;
1 = FSW low;  ***CODING ERROR, IGNORE. FEWER WOMEN ENGAGING THAN IN SQ;
2 = FSW high; ***CODING ERROR, NOT STRICTLY HIGH INTENSITY:
			  WORSE THAN SQ: NO 6 MONTH TESTING,NO ADDITIONAL PREP WILLING, MORE LIKELY TO HAVE PERSISTENT STI;
			  SAME AS SQ; EFFECT INT, LOSS DIAG;
			  BETTER THAN SQ: EFFECT ON NEWP, ADH;
3 = Condoms;
4 = VMMC;
5 = VMMC increase;
6 = Oral PrEP continuation in KP;
7 = Oral PrEP continuation and introduction of Len in KP;
8 = Oral PrEP continuation and scale up of Len in KP;
9 = FSW oral PrEP;
10 = AGYW oral PrEP;
11 = MSM oral PrEP;
12 = FSW oral PrEP and introduction of Len;
13 = AGYW oral PrEP and introduction of Len;
14 = MSM oral PrEP and introduction of Len;
15 = FSW oral PrEP and scale up of Len;
16 = AGYW oral PrEP and scale up of Len;
17 = MSM oral PrEP and scale up of Len;
18 = MSM outreach NO LONGER CONSIDERED;
19 = Return interventions;
20 = Low scale up combination;
21 = Medium scale up combination;
22 = High scale up combination;
23 = CD4 testing reintroduced;
24 = VL testing reintroduced; **25 and 25 are wrongly coded, they should be one option;
25 = VL measurements;
99 = SQ;
*/

ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Prevention advocacy\Zimbabwe\Zim_options_07_01_26b.doc" startpage=never; 
ods listing close;


proc sgplot data=a; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (1000000 to 1500000 by 100000) valueattrs=(size=10);

label mean_n_hivge15__99 = "SQ";
label mean_n_hivge15__0 = "Base";
label mean_n_hivge15__1 = "PEP_1";
/*
label mean_n_hivge15__2 = "PEP_2";
label mean_n_hivge15__3 = "PEP_3";
label mean_n_hivge15__4 = "PEP_4";
label mean_n_hivge15__5 = "PEP_5";
label mean_n_hivge15__6 = "PEP_6";
label mean_n_hivge15__7 = "PEP_7";
label mean_n_hivge15__8 = "PEP_8";
*/
series  x=cald y=mean_n_hivge15__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_hivge15__1/	lineattrs = (color=green thickness = 2 pattern=solid);

/*series  x=cald y=mean_n_hivge15__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__8/	lineattrs = (color=blue thickness = 2 pattern=solid);*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Prevalence (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence1549__99 = "SQ";
label mean_prevalence1549__0 = "Base";
label mean_prevalence1549__1 = "PEP_1";
/*
label mean_prevalence1549__2 = "PEP_2";
label mean_prevalence1549__3 = "PEP_3";
label mean_prevalence1549__4 = "PEP_4";
label mean_prevalence1549__5 = "PEP_5";
label mean_prevalence1549__6 = "PEP_6";
label mean_prevalence1549__7 = "PEP_7";
label mean_prevalence1549__8 = "PEP_8";
*/
series  x=cald y=mean_prevalence1549__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence1549__1/	lineattrs = (color=green thickness = 2 pattern=solid);

/*series  x=cald y=mean_prevalence1549__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__8/	lineattrs = (color=blue thickness = 2 pattern=solid);*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Incidence (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 0.5 by 0.1)  valueattrs=(size=10);

label mean_incidence1549__99 = "SQ";
label mean_incidence1549__0 = "Base";
label mean_incidence1549__1 = "PEP_1";
/*
label mean_incidence1549__2 = "PEP_2";
label mean_incidence1549__3 = "PEP_3";
label mean_incidence1549__4 = "PEP_4";
label mean_incidence1549__5 = "PEP_5";
label mean_incidence1549__6 = "PEP_6";
label mean_incidence1549__7 = "PEP_7";
label mean_incidence1549__8 = "PEP_8";
*/
series  x=cald y=mean_incidence1549__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=green thickness = 2 pattern=solid);

/*series  x=cald y=mean_incidence1549__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__8/	lineattrs = (color=blue thickness = 2 pattern=solid);*/
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "ART coverage (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.8 to 0.95 by 0.05) valueattrs=(size=10);

label mean_p_onart_99 = "SQ";
label mean_p_onart_0 = "Base";
label mean_p_onart_1 = "PEP_1";
/*
label mean_p_onart_2 = "PEP_2";
label mean_p_onart_3 = "PEP_3";
label mean_p_onart_4 = "PEP_4";
label mean_p_onart_5 = "PEP_5";
label mean_p_onart_6 = "PEP_6";
label mean_p_onart_7 = "PEP_7";
label mean_p_onart_8 = "PEP_8";
*/

series  x=cald y=mean_p_onart_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_1/	lineattrs = (color=green thickness = 2 pattern=solid);

/*series  x=cald y=mean_p_onart_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_8/	lineattrs = (color=blue thickness = 2 pattern=solid);*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion diagnosed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.9 to 0.98 by 0.01) valueattrs=(size=10);

label mean_p_diag_99 = "SQ";
label mean_p_diag_0 = "Base";
label mean_p_diag_1 = "PEP_1";
/*
label mean_p_diag_2 = "PEP_2";
label mean_p_diag_3 = "PEP_3";
label mean_p_diag_4 = "PEP_4";
label mean_p_diag_5 = "PEP_5";
label mean_p_diag_6 = "PEP_6";
label mean_p_diag_7 = "PEP_7";
label mean_p_diag_8 = "PEP_8";
*/

series  x=cald y=mean_p_diag_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_diag_1/	lineattrs = (color=green thickness = 2 pattern=solid);

/*
series  x=cald y=mean_p_diag_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_19/lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.9 to 1 by 0.01) valueattrs=(size=10);

label mean_p_onart_diag_99 = "SQ";
label mean_p_onart_diag_0 = "Base";
label mean_p_onart_diag_1 = "PEP_1";
/*
label mean_p_onart_diag_2 = "PEP_2";
label mean_p_onart_diag_3 = "PEP_3";
label mean_p_onart_diag_4 = "PEP_4";
label mean_p_onart_diag_5 = "PEP_5";
label mean_p_onart_diag_6 = "PEP_6";
label mean_p_onart_diag_7 = "PEP_7";
label mean_p_onart_diag_8 = "PEP_8";
*/

series  x=cald y=mean_p_onart_diag_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_diag_1/	lineattrs = (color=green thickness = 2 pattern=solid);
/*
series  x=cald y=mean_p_onart_diag_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.96 to 1 by 0.01) valueattrs=(size=10);

label mean_p_onart_vl1000_99 = "SQ";
label mean_p_onart_vl1000_0 = "Base";
label mean_p_onart_vl1000_1 = "PEP_1";
/*
label mean_p_onart_vl1000_2 = "PEP_2";
label mean_p_onart_vl1000_3 = "PEP_3";
label mean_p_onart_vl1000_4 = "PEP_4";
label mean_p_onart_vl1000_5 = "PEP_5";
label mean_p_onart_vl1000_6 = "PEP_6";
label mean_p_onart_vl1000_7 = "PEP_7";
label mean_p_onart_vl1000_8 = "PEP_8";
*/

series  x=cald y=mean_p_onart_vl1000__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_vl1000__1/	lineattrs = (color=green thickness = 2 pattern=solid);
/*
series  x=cald y=mean_p_onart_vl1000__2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Ever initiated PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 3000000 by 200000) valueattrs=(size=10);

label mean_n_prep_ever_99 = "SQ";
label mean_n_prep_ever_0 = "Base";
label mean_n_prep_ever_1 = "PEP_1";
/*
label mean_n_prep_ever_2 = "PEP_2";
label mean_n_prep_ever_3 = "PEP_3";
label mean_n_prep_ever_4 = "PEP_4";
label mean_n_prep_ever_5 = "PEP_5";
label mean_n_prep_ever_6 = "PEP_6";
label mean_n_prep_ever_7 = "PEP_7";
label mean_n_prep_ever_8 = "PEP_8";
*/
series  x=cald y=mean_n_prep_ever_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_prep_ever_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_n_prep_ever_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Currently on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 300000 by 20000) valueattrs=(size=10);

label mean_n_onprep_99 = "SQ";
label mean_n_onprep_0 = "Base";
label mean_n_onprep_1 = "PEP_1";
/*
label mean_n_onprep_2 = "PEP_2";
label mean_n_onprep_3 = "PEP_3";
label mean_n_onprep_4 = "PEP_4";
label mean_n_onprep_5 = "PEP_5";
label mean_n_onprep_6 = "PEP_6";
label mean_n_onprep_7 = "PEP_7";
label mean_n_onprep_8 = "PEP_8";
*/
series  x=cald y=mean_n_onprep_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_onprep_0/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_n_onprep_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those eligible, proportion on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_prop_elig_on_prep_99 = "SQ";
label mean_prop_elig_on_prep_0 = "Base";
label mean_prop_elig_on_prep_1 = "PEP_1";
/*
label mean_prop_elig_on_prep_2 = "PEP_2";
label mean_prop_elig_on_prep_3 = "PEP_3";
label mean_prop_elig_on_prep_4 = "PEP_4";
label mean_prop_elig_on_prep_5 = "PEP_5";
label mean_prop_elig_on_prep_6 = "PEP_6";
label mean_prop_elig_on_prep_7 = "PEP_7";
label mean_prop_elig_on_prep_8 = "PEP_8";
*/
series  x=cald y=mean_prop_elig_on_prep_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prop_elig_on_prep_0/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_prop_elig_on_prep_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in female sex workers";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.2 to 0.5 by 0.05)    valueattrs=(size=10);

label mean_prevalence_1564sw_99 = "SQ";
label mean_prevalence_1564sw_0 = "Base";
label mean_prevalence_1564sw_1 = "PEP_1";
/*
label mean_prevalence_1564sw_2 = "PEP_2";
label mean_prevalence_1564sw_3 = "PEP_3";
label mean_prevalence_1564sw_4 = "PEP_4";
label mean_prevalence_1564sw_5 = "PEP_5";
label mean_prevalence_1564sw_6 = "PEP_6";
label mean_prevalence_1564sw_7 = "PEP_7";
label mean_prevalence_1564sw_8 = "PEP_8";
*/
series  x=cald y=mean_prevalence_1564sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_1564sw_0/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_prevalence_1564sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 10 by 2)    valueattrs=(size=10);

label mean_incidence_1564sw_99 = "SQ";
label mean_incidence_1564sw_0 = "Base";
label mean_incidence_1564sw_1 = "PEP_1";
/*
label mean_incidence_1564sw_2 = "PEP_2";
label mean_incidence_1564sw_3 = "PEP_3";
label mean_incidence_1564sw_4 = "PEP_4";
label mean_incidence_1564sw_5 = "PEP_5";
label mean_incidence_1564sw_6 = "PEP_6";
label mean_incidence_1564sw_7 = "PEP_7";
label mean_incidence_1564sw_8 = "PEP_8";
*/
series  x=cald y=mean_incidence_1564sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_1564sw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_incidence_1564sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.30 by 0.03) valueattrs=(size=10);

label mean_p_onprep_sw_99 = "SQ";
label mean_p_onprep_sw_0 = "Base";
label mean_p_onprep_sw_1 = "PEP_1";
/*
label mean_p_onprep_sw_2 = "PEP_2";
label mean_p_onprep_sw_3 = "PEP_3";
label mean_p_onprep_sw_4 = "PEP_4";
label mean_p_onprep_sw_5 = "PEP_5";
label mean_p_onprep_sw_6 = "PEP_6";
label mean_p_onprep_sw_7 = "PEP_7";
label mean_p_onprep_sw_8 = "PEP_8";
*/
series  x=cald y=mean_p_onprep_sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_sw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_p_onprep_sw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;

proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in AGYW";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.0 to 0.05 by 0.01)    valueattrs=(size=10);

label mean_prevalence_agyw_99 = "SQ";
label mean_prevalence_agyw_0 = "Base";
label mean_prevalence_agyw_1 = "PEP_1";
/*
label mean_prevalence_agyw_2 = "PEP_2";
label mean_prevalence_agyw_3 = "PEP_3";
label mean_prevalence_agyw_4 = "PEP_4";
label mean_prevalence_agyw_5 = "PEP_5";
label mean_prevalence_agyw_6 = "PEP_6";
label mean_prevalence_agyw_7 = "PEP_7";
label mean_prevalence_agyw_8 = "PEP_8";
*/
series  x=cald y=mean_prevalence_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_agyw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_prevalence_agyw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst AGYWs";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 1 by 0.1)    valueattrs=(size=10);

label mean_incidence_agyw_99 = "SQ";
label mean_incidence_agyw_0 = "Base";
label mean_incidence_agyw_1 = "PEP_1";
/*
label mean_incidence_agyw_2 = "PEP_2";
label mean_incidence_agyw_3 = "PEP_3";
label mean_incidence_agyw_4 = "PEP_4";
label mean_incidence_agyw_5 = "PEP_5";
label mean_incidence_agyw_6 = "PEP_6";
label mean_incidence_agyw_7 = "PEP_7";
label mean_incidence_agyw_8 = "PEP_8";
*/
series  x=cald y=mean_incidence_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_0/		lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_agyw_1/		lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_incidence_agyw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of AGYW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.08 by 0.01) valueattrs=(size=10);

label mean_p_onprep_agyw_99 = "SQ";
label mean_p_onprep_agyw_0 = "Base";
label mean_p_onprep_agyw_1 = "PEP_1";
/*
label mean_p_onprep_agyw_2 = "PEP_2";
label mean_p_onprep_agyw_3 = "PEP_3";
label mean_p_onprep_agyw_4 = "PEP_4";
label mean_p_onprep_agyw_5 = "PEP_5";
label mean_p_onprep_agyw_6 = "PEP_6";
label mean_p_onprep_agyw_7 = "PEP_7";
label mean_p_onprep_agyw_8 = "PEP_8";
*/
series  x=cald y=mean_p_onprep_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_agyw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_p_onprep_agyw_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;



proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in MSM";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.15 to 0.35 by 0.05)    valueattrs=(size=10);

label mean_prevalence1549_msm_99 = "SQ";
label mean_prevalence1549_msm_0 = "Base";
label mean_prevalence1549_msm_1 = "PEP_1";
/*
label mean_prevalence1549_msm_2 = "PEP_2";
label mean_prevalence1549_msm_3 = "PEP_3";
label mean_prevalence1549_msm_4 = "PEP_4";
label mean_prevalence1549_msm_5 = "PEP_5";
label mean_prevalence1549_msm_6 = "PEP_6";
label mean_prevalence1549_msm_7 = "PEP_7";
label mean_prevalence1549_msm_8 = "PEP_8";
*/
series  x=cald y=mean_prevalence1549_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_0	/	lineattrs = (color=red thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_1	/	lineattrs = (color=green thickness = 2 pattern=solid);

/*
series  x=cald y=mean_prevalence1549_msm_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst MSM";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 8 by 2)    valueattrs=(size=10);

label mean_incidence_msm_99 = "SQ";
label mean_incidence_msm_0 = "Base";
label mean_incidence_msm_1 = "PEP_1";
/*
label mean_incidence_msm_2 = "PEP_2";
label mean_incidence_msm_3 = "PEP_3";
label mean_incidence_msm_4 = "PEP_4";
label mean_incidence_msm_5 = "PEP_5";
label mean_incidence_msm_6 = "PEP_6";
label mean_incidence_msm_7 = "PEP_7";
label mean_incidence_msm_8 = "PEP_8";
*/
series  x=cald y=mean_incidence_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_msm_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_incidence_msm_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_msm_99 = "SQ";
label mean_p_onprep_msm_0 = "Base";
label mean_p_onprep_msm_1 = "PEP_1";
/*
label mean_p_onprep_msm_2 = "PEP_2";
label mean_p_onprep_msm_3 = "PEP_3";
label mean_p_onprep_msm_4 = "PEP_4";
label mean_p_onprep_msm_5 = "PEP_5";
label mean_p_onprep_msm_6 = "PEP_6";
label mean_p_onprep_msm_7 = "PEP_7";
label mean_p_onprep_msm_8 = "PEP_8";
*/
series  x=cald y=mean_p_onprep_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_msm_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_p_onprep_msm_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;



proc sgplot data=a; 
Title    height=1.5 justify=center "Number of HIV-related deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (2000 to 12000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_99 = "SQ";
label mean_n_death_hivrel_0 = "Base";
label mean_n_death_hivrel_1 = "PEP_1";
/*
label mean_n_death_hivrel_2 = "PEP_2";
label mean_n_death_hivrel_3 = "PEP_3";
label mean_n_death_hivrel_4 = "PEP_4";
label mean_n_death_hivrel_5 = "PEP_5";
label mean_n_death_hivrel_6 = "PEP_6";
label mean_n_death_hivrel_7 = "PEP_7";
label mean_n_death_hivrel_8 = "PEP_8";
*/

series  x=cald y=mean_n_death_hivrel_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_death_hivrel_1/	lineattrs = (color=green thickness = 3 pattern=solid); 

/*
series  x=cald y=mean_n_death_hivrel_2/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_3/	lineattrs = (color=teal thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_4/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_5/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_6/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_7/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_8/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_19/	lineattrs = (color=pink thickness = 2 pattern=solid);
*/
run;quit;



ods rtf close;
ods listing;
run;

