
***THIS PROGRAM IS USED TO COMPARE GRAPHS OF THE DIFFERENT OPTIONS;

libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Mlw";

data a;
set a.Mlw_options_graphs_29Jan26;
run;




/***Scenarios;
0 = Min;
1 = FSW SQ;
2 = VMMC;
3 = VMMC increase;
4 = Oral PrEP continuation in KP;
5 = Oral PrEP continuation and introduction of Len in KP;
6 = Oral PrEP continuation and scale up of Len in KP;
7 = FSW oral PrEP;
8 = AGYW oral PrEP;
9 = MSM oral PrEP;
10 = FSW oral PrEP and introduction of Len;
11 = AGYW oral PrEP and introduction of Len;
12 = MSM oral PrEP and introduction of Len;
13 = FSW oral PrEP and scale up of Len;
14 = AGYW oral PrEP and scale up of Len;
15 = MSM oral PrEP and scale up of Len;
16 = Return interventions;
17 = VL and CD4 testing;
99 = SQ;
*/

ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = '"C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\Malawi\Mlw_options_29_01_26.doc' startpage=never; 
ods listing close;


proc sgplot data=e; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (1000000 to 1500000 by 100000) valueattrs=(size=10);

label mean_n_hivge15__99 = "SQ";
label mean_n_hivge15__0 = "Base";
label mean_n_hivge15__1 = "FSW program";
label mean_n_hivge15__2 = "VMMC";
label mean_n_hivge15__3 = "VMMC increase";
label mean_n_hivge15__4 = "Oral PrEP continuation";
label mean_n_hivge15__5 = "Oral PrEP and intro of Len";
label mean_n_hivge15__6 = "Oral PrEP and scale up of Len";
label mean_n_hivge15__16 = "Return interventions";
label mean_n_hivge15__17 = "VL and CD4 testing";


series  x=cald y=mean_n_hivge15__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_hivge15__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__16/lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__17/lineattrs = (color=green thickness = 2 pattern=solid);



run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Prevalence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)  values = (0.025 to 0.075 by 0.01) valueattrs=(size=10);


label mean_prevalence1549__99 = "SQ";
label mean_prevalence1549__0 = "Base";
label mean_prevalence1549__1 = "FSW program";
label mean_prevalence1549__2 = "VMMC";
label mean_prevalence1549__3 = "VMMC increase";
label mean_prevalence1549__4 = "Oral PrEP continuation";
label mean_prevalence1549__5 = "Oral PrEP and intro of Len";
label mean_prevalence1549__6 = "Oral PrEP and scale up of Len";
label mean_prevalence1549__16 = "Return interventions";
label mean_prevalence1549__17 = "VL and CD4 testing";


series  x=cald y=mean_prevalence1549__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence1549__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__16/	lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__17/	lineattrs = (color=green thickness = 2 pattern=solid);


run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "Incidence (15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 0.5 by 0.1) valueattrs=(size=10);

label mean_incidence1549__99 = "SQ";
label mean_incidence1549__0 = "Base";
label mean_incidence1549__1 = "FSW program";
label mean_incidence1549__2 = "VMMC";
label mean_incidence1549__3 = "VMMC increase";
label mean_incidence1549__4 = "Oral PrEP continuation";
label mean_incidence1549__5 = "Oral PrEP and intro of Len";
label mean_incidence1549__6 = "Oral PrEP and scale up of Len";
label mean_incidence1549__16 = "Return interventions";
label mean_incidence1549__17 = "VL and CD4 testing";


series  x=cald y=mean_incidence1549__99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__16/lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__17/lineattrs = (color=green thickness = 2 pattern=solid);


run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "ART coverage (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '%'	labelattrs=(size=12)  values = (0.8 to 0.95 by 0.05) valueattrs=(size=10);

label mean_p_onart__99 = "SQ";
label mean_p_onart__0 = "Base";
label mean_p_onart__1 = "FSW program";
label mean_p_onart__2 = "VMMC";
label mean_p_onart__3 = "VMMC increase";
label mean_p_onart__4 = "Oral PrEP continuation";
label mean_p_onart__5 = "Oral PrEP and intro of Len";
label mean_p_onart__6 = "Oral PrEP and scale up of Len";
label mean_p_onart__16 = "Return interventions";
label mean_p_onart__17 = "VL and CD4 testing";


series  x=cald y=mean_p_onart__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__16/	lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart__17/	lineattrs = (color=green thickness = 2 pattern=solid);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion diagnosed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.9 to 0.98 by 0.01) valueattrs=(size=10);

label mean_p_diag_99 = "SQ";
label mean_p_diag_0 = "Base";
label mean_p_diag_1 = "FSW program";
label mean_p_diag_2 = "VMMC";
label mean_p_diag_3 = "VMMC increase";
label mean_p_diag_4 = "Oral PrEP continuation";
label mean_p_diag_5 = "Oral PrEP and intro of Len";
label mean_p_diag_6 = "Oral PrEP and scale up of Len";
label mean_p_diag_16 = "Return interventions";
label mean_p_diag_17 = "VL and CD4 testing";


series  x=cald y=mean_p_diag_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_diag_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_16/lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_17/lineattrs = (color=green thickness = 2 pattern=solid);

run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.9 to 1 by 0.01) valueattrs=(size=10);

label mean_p_onart_diag_99 = "SQ";
label mean_p_onart_diag_0 = "Base";
label mean_p_onart_diag_1 = "FSW program";
label mean_p_onart_diag_2 = "VMMC";
label mean_p_onart_diag_3 = "VMMC increase";
label mean_p_onart_diag_4 = "Oral PrEP continuation";
label mean_p_onart_diag_5 = "Oral PrEP and intro of Len";
label mean_p_onart_diag_6 = "Oral PrEP and scale up of Len";
label mean_p_onart_diag_16 = "Return interventions";
label mean_p_onart_diag_17 = "VL and CD4 testing";


series  x=cald y=mean_p_onart_diag_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_diag_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_16/	lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_17/	lineattrs = (color=green thickness = 2 pattern=solid);

run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0.96 to 1 by 0.01) valueattrs=(size=10);

label mean_p_onart_vl1000__99 = "SQ";
label mean_p_onart_vl1000__0 = "Base";
label mean_p_onart_vl1000__1 = "FSW program";
label mean_p_onart_vl1000__2 = "VMMC";
label mean_p_onart_vl1000__3 = "VMMC increase";
label mean_p_onart_vl1000__4 = "Oral PrEP continuation";
label mean_p_onart_vl1000__5 = "Oral PrEP and intro of Len";
label mean_p_onart_vl1000__6 = "Oral PrEP and scale up of Len";
label mean_p_onart_vl1000__16 = "Return interventions";
label mean_p_onart_vl1000__16 = "VL and CD4 testing";

series  x=cald y=mean_p_onart_vl1000__99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_vl1000__1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__16/	lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__17/	lineattrs = (color=green thickness = 2 pattern=solid);

run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Ever initiated PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label mean_n_prep_ever_99 = "SQ";
label mean_n_prep_ever_0 = "Base";
label mean_n_prep_ever_1 = "FSW program";
label mean_n_prep_ever_4 = "Oral PrEP continuation";
label mean_n_prep_ever_5 = "Oral PrEP and intro of Len";
label mean_n_prep_ever_6 = "Oral PrEP and scale up of Len";

series  x=cald y=mean_n_prep_ever_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_prep_ever_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Currently on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 150000 by 10000) valueattrs=(size=10);

label mean_n_onprep_99 = "SQ";
label mean_n_onprep_0 = "Base";
label mean_n_onprep_1 = "FSW program";
label mean_n_onprep_4 = "Oral PrEP continuation";
label mean_n_onprep_5 = "Oral PrEP and intro of Len";
label mean_n_onprep_6 = "Oral PrEP and scale up of Len";

series  x=cald y=mean_n_onprep_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_onprep_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
run;quit;



proc sgplot data=e; 
title    height=1.5 justify=center "HIV prevalence in female sex workers";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.2 to 0.5 by 0.05)    valueattrs=(size=10);

label mean_n_prep_ever_99 = "SQ";
label mean_n_prep_ever_0 = "Base";
label mean_n_prep_ever_1 = "FSW program";
label mean_n_prep_ever_4 = "Oral PrEP continuation";
label mean_n_prep_ever_5 = "Oral PrEP and intro of Len";
label mean_n_prep_ever_6 = "Oral PrEP and scale up of Len";
label mean_n_prep_ever_7 = "Oral PrEP FSW only";
label mean_n_prep_ever_10 = "Oral PrEP and intro of Len FSW only";
label mean_n_prep_ever_13 = "Oral PrEP and scale up of Len FSW only";

series  x=cald y=mean_n_prep_ever_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_prep_ever_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_7/	lineattrs = (color=darkgrey thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_10/	lineattrs = (color=grey thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_13/	lineattrs = (color=lightgrey thickness = 2 pattern=solid);

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 10 by 2)    valueattrs=(size=10);

label mean_incidence_1564sw_99 = "SQ";
label mean_incidence_1564sw_0 = "Base";
label mean_incidence_1564sw_1 = "FSW program";
label mean_incidence_1564sw_4 = "Oral PrEP continuation";
label mean_incidence_1564sw_5 = "Oral PrEP and intro of Len";
label mean_incidence_1564sw_6 = "Oral PrEP and scale up of Len";
label mean_incidence_1564sw_7 = "Oral PrEP FSW only";
label mean_incidence_1564sw_10 = "Oral PrEP and intro of Len FSW only";
label mean_incidence_1564sw_13 = "Oral PrEP and scale up of Len FSW only";

series  x=cald y=mean_incidence_1564sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_1564sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_7/	lineattrs = (color=darkgrey thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_10/	lineattrs = (color=grey thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_13/	lineattrs = (color=lightgrey thickness = 2 pattern=solid);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.30 by 0.03) valueattrs=(size=10);

label mean_p_onprep_sw_99 = "SQ";
label mean_p_onprep_sw_0 = "Base";
label mean_p_onprep_sw_1 = "FSW program";
label mean_p_onprep_sw_4 = "Oral PrEP continuation";
label mean_p_onprep_sw_5 = "Oral PrEP and intro of Len";
label mean_p_onprep_sw_6 = "Oral PrEP and scale up of Len";
label mean_p_onprep_sw_7 = "Oral PrEP FSW only";
label mean_p_onprep_sw_10 = "Oral PrEP and intro of Len FSW only";
label mean_p_onprep_sw_13 = "Oral PrEP and scale up of Len FSW only";

series  x=cald y=mean_p_onprep_sw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_sw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_7/	lineattrs = (color=darkgrey thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_10/	lineattrs = (color=grey thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_13/	lineattrs = (color=lightgrey thickness = 2 pattern=solid);

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV prevalence in AGYW";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.0 to 0.05 by 0.01)    valueattrs=(size=10);

label mean_prevalence_agyw_99 = "SQ";
label mean_prevalence_agyw_0 = "Base";
label mean_prevalence_agyw_1 = "FSW program";
label mean_prevalence_agyw_4 = "Oral PrEP continuation";
label mean_prevalence_agyw_5 = "Oral PrEP and intro of Len";
label mean_prevalence_agyw_6 = "Oral PrEP and scale up of Len";
label mean_prevalence_agyw_8 = "Oral PrEP AGYW only";
label mean_prevalence_agyw_11 = "Oral PrEP and intro of Len AGYW only";
label mean_prevalence_agyw_14 = "Oral PrEP and scale up of Len AGYW only";

series  x=cald y=mean_prevalence_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_agyw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_8/	lineattrs = (color=lavendar thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_11/	lineattrs = (color=plum thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_14/	lineattrs = (color=indigo thickness = 2 pattern=solid);
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst AGYWs";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 1 by 0.1)    valueattrs=(size=10);

label mean_incidence_agyw_99 = "SQ";
label mean_incidence_agyw_0 = "Base";
label mean_incidence_agyw_1 = "FSW program";
label mean_incidence_agyw_4 = "Oral PrEP continuation";
label mean_incidence_agyw_5 = "Oral PrEP and intro of Len";
label mean_incidence_agyw_6 = "Oral PrEP and scale up of Len";
label mean_incidence_agyw_8 = "Oral PrEP AGYW only";
label mean_incidence_agyw_11 = "Oral PrEP and intro of Len AGYW only";
label mean_incidence_agyw_14 = "Oral PrEP and scale up of Len AGYW only";

series  x=cald y=mean_incidence_agyw_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_agyw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_8/	lineattrs = (color=lavendar thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_11/lineattrs = (color=plum thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_14/lineattrs = (color=indigo thickness = 2 pattern=solid);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion of AGYW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.08 by 0.01) valueattrs=(size=10);

label mean_p_onprep_agyw_99 = "SQ";
label mean_p_onprep_agyw_0 = "Base";
label mean_p_onprep_agyw_1 = "FSW program";
label mean_p_onprep_agyw_4 = "Oral PrEP continuation";
label mean_p_onprep_agyw_5 = "Oral PrEP and intro of Len";
label mean_p_onprep_agyw_6 = "Oral PrEP and scale up of Len";
label mean_p_onprep_agyw_8 = "Oral PrEP AGYW only";
label mean_p_onprep_agyw_11 = "Oral PrEP and intro of Len AGYW only";
label mean_p_onprep_agyw_14 = "Oral PrEP and scale up of Len AGYW only";

series  x=cald y=mean_p_onprep_agyw_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_agyw_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_8/	lineattrs = (color=lavendar thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_11/	lineattrs = (color=plum thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_14/	lineattrs = (color=indigo thickness = 2 pattern=solid);
run;quit;



proc sgplot data=e; 
title    height=1.5 justify=center "HIV prevalence in MSM";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.15 to 0.35 by 0.05)    valueattrs=(size=10);

label mean_prevalence1549_msm_99 = "SQ";
label mean_prevalence1549_msm_0 = "Base";
label mean_prevalence1549_msm_4 = "Oral PrEP continuation";
label mean_prevalence1549_msm_5 = "Oral PrEP and intro of Len";
label mean_prevalence1549_msm_6 = "Oral PrEP and scale up of Len";
label mean_prevalence1549_msm_9 = "Oral PrEP MSM only";
label mean_prevalence1549_msm_12 = "Oral PrEP and intro of Len MSM only";
label mean_prevalence1549_msm_15 = "Oral PrEP and scale up of Len MSM only";

series  x=cald y=mean_prevalence1549_msm_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence1549_msm_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_9/	lineattrs = (color=darkyellow thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_12/lineattrs = (color=yellow thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_15/lineattrs = (color=orange thickness = 2 pattern=solid);
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst MSM";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2030  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 8 by 2)    valueattrs=(size=10);

label mean_prevalence1549_msm_99 = "SQ";
label mean_incidence_msm_0 = "Base";
label mean_incidence_msm_4 = "Oral PrEP continuation";
label mean_incidence_msm_5 = "Oral PrEP and intro of Len";
label mean_incidence_msm_6 = "Oral PrEP and scale up of Len";
label mean_incidence_msm_9 = "Oral PrEP MSM only";
label mean_incidence_msm_12 = "Oral PrEP and intro of Len MSM only";
label mean_incidence_msm_15 = "Oral PrEP and scale up of Len MSM only";

series  x=cald y=mean_incidence_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_msm_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_9/	lineattrs = (color=darkyellow thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_12/	lineattrs = (color=yellow thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_15/	lineattrs = (color=orange thickness = 2 pattern=solid);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_msm_99 = "SQ";
label mean_p_onprep_msm_0 = "Base";
label mean_p_onprep_msm_4 = "Oral PrEP continuation";
label mean_p_onprep_msm_5 = "Oral PrEP and intro of Len";
label mean_p_onprep_msm_6 = "Oral PrEP and scale up of Len";
label mean_p_onprep_msm_9 = "Oral PrEP MSM only";
label mean_p_onprep_msm_12 = "Oral PrEP and intro of Len MSM only";
label mean_p_onprep_msm_15 = "Oral PrEP and scale up of Len MSM only";

series  x=cald y=mean_p_onprep_msm_99/	lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_msm_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_9/	lineattrs = (color=darkyellow thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_12/	lineattrs = (color=yellow thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_15/	lineattrs = (color=orange thickness = 2 pattern=solid);

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Number of HIV-related deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (2000 to 12000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_99 = "SQ";
label mean_n_death_hivrel_0 = "Base";
label mean_n_death_hivrel_1 = "FSW program";
label mean_n_death_hivrel_2 = "VMMC";
label mean_n_death_hivrel_3 = "VMMC increase";
label mean_n_death_hivrel_4 = "Oral PrEP continuation";
label mean_n_death_hivrel_5 = "Oral PrEP and intro of Len";
label mean_n_death_hivrel_6 = "Oral PrEP and scale up of Len";
label mean_n_death_hivrel_16 = "Return interventions";
label mean_n_death_hivrel_17 = "VL and CD4 testing";



series  x=cald y=mean_n_death_hivrel_99/lineattrs = (color=black thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_death_hivrel_1/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_2/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_3/	lineattrs = (color=maroon thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_4/	lineattrs = (color=purple thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_5/	lineattrs = (color=lightpurple thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_6/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_16/lineattrs = (color=pink thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_17/lineattrs = (color=green thickness = 2 pattern=solid);
run;quit;


ods rtf close;
ods listing;
run;

