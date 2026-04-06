
***THIS PROGRAM IS USED TO COMPARE GRAPHS OF THE DIFFERENT OPTIONS USING DATASET CREATED FROM CALIBRATION GRAPHS PROGRAM;

libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim_PEP";

data a;
set a.Zim_pep_options_graphs_31Mar26;
run;

/***Scenarios;
0 = Min;
1 = 10% coverage (facility based);
2 = 20% coverage (community based);
3 = 30% coverage (pharmacy);
4 = 10% coverage with scale up of Len;
5 = 20% coverage with scale up of Len;
6 = 30% coverage with scale up of Len;
*/

ods graphics / reset imagefmt=jpeg height=5in width=7in; run;
ods rtf file = "C:\Users\loveleen\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\Genesis\PEP\Zim_options_16_03_26.doc" startpage=never; 
ods listing close;

ods listing gpath="C:\Users\lovel\Documents";
ods graphics on / imagename="SGPlot" imagefmt=png;
ods html;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those eligible, proportion on PEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_prop_elig_on_oral_prep_0 = "Base";
label mean_prop_elig_on_oral_prep_1 = "Facility based PEP";
label mean_prop_elig_on_oral_prep_2 = "Community based PEP";
label mean_prop_elig_on_oral_prep_3 = "Pharmacy based PEP";
label mean_prop_elig_on_oral_prep_4 = "Facility based PEP with scale up of Len";
label mean_prop_elig_on_oral_prep_5 = "Community based PEP with scale up of Len";
label mean_prop_elig_on_oral_prep_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_prop_elig_on_oral_prep_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prop_elig_on_oral_prep_1/	lineattrs = (color=green thickness = 2 pattern=solid); 
series  x=cald y=mean_prop_elig_on_oral_prep_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_oral_prep_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_oral_prep_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_prop_elig_on_oral_prep_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_prop_elig_on_oral_prep_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;



proc sgplot data=a; 
Title    height=1.5 justify=center "Of those eligible, proportion on Len (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_prop_elig_on_Len_prep_0 = "Base";
label mean_prop_elig_on_Len_prep_1 = "Facility based PEP";
label mean_prop_elig_on_Len_prep_2 = "Community based PEP";
label mean_prop_elig_on_Len_prep_3 = "Pharmacy based PEP";
label mean_prop_elig_on_Len_prep_4 = "Facility based PEP with scale up of Len";
label mean_prop_elig_on_Len_prep_5 = "Community based PEP with scale up of Len";
label mean_prop_elig_on_Len_prep_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_prop_elig_on_Len_prep_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_prop_elig_on_Len_prep_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_prop_elig_on_Len_prep_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
series  x=cald y=mean_prop_elig_on_oral_prep_4/	lineattrs = (color=lightgreen thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_oral_prep_5/	lineattrs = (color=lightblue thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_oral_prep_6/	lineattrs = (color=lightorange thickness = 2 pattern=solid);

run;quit;



proc sgplot data=a; 
Title    height=1.5 justify=center "Number eligible";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1500000 by 50000) valueattrs=(size=10);

label mean_n_prep_elig_0 = "Base";

series  x=cald y=mean_n_prep_elig_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Currently on PEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 400000 by 20000) valueattrs=(size=10);

label mean_n_onprep_oral_0 = "Base";
label mean_n_onprep_oral_1 = "Facility based PEP";
label mean_n_onprep_oral_2 = "Community based PEP";
label mean_n_onprep_oral_3 = "Pharmacy based PEP";
label mean_n_onprep_oral_4 = "Facility based PEP with scale up of Len";
label mean_n_onprep_oral_5 = "Community based PEP with scale up of Len";
label mean_n_onprep_oral_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_n_onprep_oral_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_onprep_oral_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_n_onprep_oral_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_oral_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_oral_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_n_onprep_oral_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_n_onprep_oral_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;




proc sgplot data=a; 
Title    height=1.5 justify=center "People living with HIV (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label mean_n_hivge15__0 = "Base";
label mean_n_hivge15__1 = "Facility based PEP";
label mean_n_hivge15__2 = "Community based PEP";
label mean_n_hivge15__3 = "Pharmacy based PEP";
label mean_n_hivge15__4 = "Facility based PEP with scale up of Len";
label mean_n_hivge15__5 = "Community based PEP with scale up of Len";
label mean_n_hivge15__6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_n_hivge15__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_hivge15__1/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_hivge15__4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_n_hivge15__5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_n_hivge15__6/	lineattrs = (color=orange thickness = 2 pattern=dash);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Prevalence (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'	labelattrs=(size=12)   valueattrs=(size=10);

label mean_prevalence_1549__0 = "Base";
label mean_prevalence_1549__1 = "Facility based PEP";
label mean_prevalence_1549__2 = "Community based PEP";
label mean_prevalence_1549__3 = "Pharmacy based PEP";
label mean_prevalence_1549__4 = "Facility based PEP with scale up of Len";
label mean_prevalence_1549__5 = "Community based PEP with scale up of Len";
label mean_prevalence_1549__6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence1549__1/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549__4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence1549__5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence1549__6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Incidence (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence/100py'	labelattrs=(size=12)  values = (0 to 0.5 by 0.1)  valueattrs=(size=10);

label mean_incidence1549__0 = "Base";
label mean_incidence1549__1 = "Facility based PEP";
label mean_incidence1549__2 = "Community based PEP";
label mean_incidence1549__3 = "Pharmacy based PEP";
label mean_incidence1549__4 = "Facility based PEP with scale up of Len";
label mean_incidence1549__5 = "Community based PEP with scale up of Len";
label mean_incidence1549__6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_incidence1549__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_incidence1549__5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_incidence1549__6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "ART coverage (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_0 = "Base";
label mean_p_onart_1 = "Facility based PEP";
label mean_p_onart_2 = "Community based PEP";
label mean_p_onart_3 = "Pharmacy based PEP";
label mean_p_onart_4 = "Facility based PEP with scale up of Len";
label mean_p_onart_5 = "Community based PEP with scale up of Len";
label mean_p_onart_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_p_onart_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_1/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_p_onart_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_p_onart_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion diagnosed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_diag_0 = "Base";
label mean_p_diag_1 = "Facility based PEP";
label mean_p_diag_2 = "Community based PEP";
label mean_p_diag_3 = "Pharmacy based PEP";
label mean_p_diag_4 = "Facility based PEP with scale up of Len";
label mean_p_diag_5 = "Community based PEP with scale up of Len";
label mean_p_diag_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_p_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_diag_1/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_diag_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_p_diag_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_p_diag_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those diagnosed, proportion on ART (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_diag_0 = "Base";
label mean_p_onart_diag_1 = "Facility based PEP";
label mean_p_onart_diag_2 = "Community based PEP";
label mean_p_onart_diag_3 = "Pharmacy based PEP";
label mean_p_onart_diag_4 = "Facility based PEP with scale up of Len";
label mean_p_onart_diag_5 = "Community based PEP with scale up of Len";
label mean_p_onart_diag_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_p_onart_diag_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_diag_1/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_diag_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_p_onart_diag_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_p_onart_diag_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those on ART, proportion virally suppressed (15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_onart_vl1000__0 = "Base";
label mean_p_onart_vl1000__1 = "Facility based PEP";
label mean_p_onart_vl1000__2 = "Community based PEP";
label mean_p_onart_vl1000__3 = "Pharmacy based PEP";
label mean_p_onart_vl1000__4 = "Facility based PEP with scale up of Len";
label mean_p_onart_vl1000__5 = "Community based PEP with scale up of Len";
label mean_p_onart_vl1000__6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onart_vl1000__1/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onart_vl1000__4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_p_onart_vl1000__5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_p_onart_vl1000__6/	lineattrs = (color=orange thickness = 2 pattern=dash);

run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Ever taken any PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 3000000 by 200000) valueattrs=(size=10);

label mean_n_prep_ever_0 = "Base";
label mean_n_prep_ever_1 = "Facility based PEP";
label mean_n_prep_ever_2 = "Community based PEP";
label mean_n_prep_ever_3 = "Pharmacy based PEP";
label mean_n_prep_ever_4 = "Facility based PEP with scale up of Len";
label mean_n_prep_ever_5 = "Community based PEP with scale up of Len";
label mean_n_prep_ever_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_n_prep_ever_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_prep_ever_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_n_prep_ever_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_prep_ever_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_n_prep_ever_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_n_prep_ever_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Currently on any PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (0 to 400000 by 20000) valueattrs=(size=10);

label mean_n_onprep_0 = "Base";
label mean_n_onprep_1 = "Facility based PEP";
label mean_n_onprep_2 = "Community based PEP";
label mean_n_onprep_3 = "Pharmacy based PEP";
label mean_n_onprep_4 = "Facility based PEP with scale up of Len";
label mean_n_onprep_5 = "Community based PEP with scale up of Len";
label mean_n_onprep_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_n_onprep_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_onprep_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_n_onprep_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_onprep_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_n_onprep_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_n_onprep_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Of those eligible, proportion on PrEP (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_prop_elig_on_prep_0 = "Base";
label mean_prop_elig_on_prep_1 = "Facility based PEP";
label mean_prop_elig_on_prep_2 = "Community based PEP";
label mean_prop_elig_on_prep_3 = "Pharmacy based PEP";
label mean_prop_elig_on_prep_4 = "Facility based PEP with scale up of Len";
label mean_prop_elig_on_prep_5 = "Community based PEP with scale up of Len";
label mean_prop_elig_on_prep_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_prop_elig_on_prep_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prop_elig_on_prep_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_prop_elig_on_prep_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prop_elig_on_prep_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_prop_elig_on_prep_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_prop_elig_on_prep_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in female sex workers";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.2 to 0.5 by 0.05)    valueattrs=(size=10);

label mean_prevalence_1564sw_0 = "Base";
label mean_prevalence_1564sw_1 = "Facility based PEP";
label mean_prevalence_1564sw_2 = "Community based PEP";
label mean_prevalence_1564sw_3 = "Pharmacy based PEP";
label mean_prevalence_1564sw_4 = "Facility based PEP with scale up of Len";
label mean_prevalence_1564sw_5 = "Community based PEP with scale up of Len";
label mean_prevalence_1564sw_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_prevalence_1564sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_1564sw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_1564sw_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_1564sw_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence_1564sw_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence_1564sw_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 10 by 2)    valueattrs=(size=10);

label mean_incidence_1564sw_0 = "Base";
label mean_incidence_1564sw_1 = "Facility based PEP";
label mean_incidence_1564sw_2 = "Community based PEP";
label mean_incidence_1564sw_3 = "Pharmacy based PEP";
label mean_incidence_1564sw_4 = "Facility based PEP with scale up of Len";
label mean_incidence_1564sw_5 = "Community based PEP with scale up of Len";
label mean_incidence_1564sw_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_incidence_1564sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_1564sw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_1564sw_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_1564sw_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_incidence_1564sw_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_incidence_1564sw_6/	lineattrs = (color=orange thickness = 2 pattern=dash);

run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.60 by 0.1) valueattrs=(size=10);

label mean_p_onprep_sw_0 = "Base";
label mean_p_onprep_sw_1 = "Facility based PEP";
label mean_p_onprep_sw_2 = "Community based PEP";
label mean_p_onprep_sw_3 = "Pharmacy based PEP";
label mean_p_onprep_sw_4 = "Facility based PEP with scale up of Len";
label mean_p_onprep_sw_5 = "Community based PEP with scale up of Len";
label mean_p_onprep_sw_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_p_onprep_sw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_sw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_sw_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_sw_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_p_onprep_sw_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_p_onprep_sw_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in AGYW";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.0 to 0.05 by 0.01)    valueattrs=(size=10);

label mean_prevalence_agyw_0 = "Base";
label mean_prevalence_agyw_1 = "Facility based PEP";
label mean_prevalence_agyw_2 = "Community based PEP";
label mean_prevalence_agyw_3 = "Pharmacy based PEP";
label mean_prevalence_agyw_4 = "Facility based PEP with scale up of Len";
label mean_prevalence_agyw_5 = "Community based PEP with scale up of Len";
label mean_prevalence_agyw_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_prevalence_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_agyw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_prevalence_agyw_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence_agyw_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence_agyw_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence_agyw_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst AGYWs";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 1 by 0.1)    valueattrs=(size=10);

label mean_incidence_agyw_0 = "Base";
label mean_incidence_agyw_1 = "Facility based PEP";
label mean_incidence_agyw_2 = "Community based PEP";
label mean_incidence_agyw_3 = "Pharmacy based PEP";
label mean_incidence_agyw_4 = "Facility based PEP with scale up of Len";
label mean_incidence_agyw_5 = "Community based PEP with scale up of Len";
label mean_incidence_agyw_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_incidence_agyw_0/		lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_agyw_1/		lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_agyw_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_agyw_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_incidence_agyw_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_incidence_agyw_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;


proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of AGYW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label mean_p_onprep_agyw_0 = "Base";
label mean_p_onprep_agyw_1 = "Facility based PEP";
label mean_p_onprep_agyw_2 = "Community based PEP";
label mean_p_onprep_agyw_3 = "Pharmacy based PEP";
label mean_p_onprep_agyw_4 = "Facility based PEP with scale up of Len";
label mean_p_onprep_agyw_5 = "Community based PEP with scale up of Len";
label mean_p_onprep_agyw_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_p_onprep_agyw_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_agyw_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_agyw_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_agyw_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_p_onprep_agyw_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_p_onprep_agyw_6/	lineattrs = (color=orange thickness = 2 pattern=dash);

run;quit;



proc sgplot data=a; 
title    height=1.5 justify=center "HIV prevalence in MSM";
xaxis label      = 'Year'                labelattrs=(size=12)  values = (2020 to 2050 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Prevalence'          labelattrs=(size=12)    values = (0.15 to 0.35 by 0.05)    valueattrs=(size=10);

label mean_prevalence_msm_0 = "Base";
label mean_prevalence_msm_1 = "Facility based PEP";
label mean_prevalence_msm_2 = "Community based PEP";
label mean_prevalence_msm_3 = "Pharmacy based PEP";
label mean_prevalence_msm_4 = "Facility based PEP with scale up of Len";
label mean_prevalence_msm_5 = "Community based PEP with scale up of Len";
label mean_prevalence_msm_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_prevalence1549_msm_0	/	lineattrs = (color=red thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_1	/	lineattrs = (color=green thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_prevalence1549_msm_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence1549_msm_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_prevalence1549_msm_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;


proc sgplot data=a; 
title    height=1.5 justify=center "HIV incidence amongst MSM";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2020 to 2050  by 2)       valueattrs=(size=10); 
yaxis grid label 		= 'Incidence per 100py' labelattrs=(size=12)    values = (0 to 8 by 2)    valueattrs=(size=10);

label mean_incidence_msm_0 = "Base";
label mean_incidence_msm_1 = "Facility based PEP";
label mean_incidence_msm_2 = "Community based PEP";
label mean_incidence_msm_3 = "Pharmacy based PEP";
label mean_incidence_msm_4 = "Facility based PEP with scale up of Len";
label mean_incidence_msm_5 = "Community based PEP with scale up of Len";
label mean_incidence_msm_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_incidence_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_msm_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_incidence_msm_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_incidence_msm_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_incidence_msm_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_incidence_msm_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;

proc sgplot data=a; 
Title    height=1.5 justify=center "Proportion of MSM on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02 ) valueattrs=(size=10);

label mean_p_onprep_msm_0 = "Base";
label mean_p_onprep_msm_1 = "Facility based PEP";
label mean_p_onprep_msm_2 = "Community based PEP";
label mean_p_onprep_msm_3 = "Pharmacy based PEP";
label mean_p_onprep_msm_4 = "Facility based PEP with scale up of Len";
label mean_p_onprep_msm_5 = "Community based PEP with scale up of Len";
label mean_p_onprep_msm_6 = "Pharmacy based PEP with scale up of Len";

series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_msm_1/	lineattrs = (color=green thickness = 3 pattern=solid); 
series  x=cald y=mean_p_onprep_msm_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_p_onprep_msm_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_p_onprep_msm_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_p_onprep_msm_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;



proc sgplot data=a; 
Title    height=1.5 justify=center "Number of HIV-related deaths (15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2020 to 2050 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'	labelattrs=(size=12)  values = (2000 to 12000 by 2000 ) valueattrs=(size=10);

label mean_n_death_hivrel_0 = "Base";
label mean_n_death_hivrel_1 = "Facility based PEP";
label mean_n_death_hivrel_2 = "Community based PEP";
label mean_n_death_hivrel_3 = "Pharmacy based PEP";
label mean_n_death_hivrel_4 = "Facility based PEP with scale up of Len";
label mean_n_death_hivrel_5 = "Community based PEP with scale up of Len";
label mean_n_death_hivrel_6 = "Pharmacy based PEP with scale up of Len";


series  x=cald y=mean_n_death_hivrel_0/	lineattrs = (color=red thickness = 3 pattern=solid); 
series  x=cald y=mean_n_death_hivrel_1/	lineattrs = (color=green thickness = 2 pattern=solid); 
series  x=cald y=mean_n_death_hivrel_2/	lineattrs = (color=blue thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_3/	lineattrs = (color=orange thickness = 2 pattern=solid);
series  x=cald y=mean_n_death_hivrel_4/	lineattrs = (color=green thickness = 2 pattern=dash);
series  x=cald y=mean_n_death_hivrel_5/	lineattrs = (color=blue thickness = 2 pattern=dash);
series  x=cald y=mean_n_death_hivrel_6/	lineattrs = (color=orange thickness = 2 pattern=dash);
run;quit;



ods rtf close;
ods listing;
run;

