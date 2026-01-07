libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";


data a;
set a.wide_Zim_17_12_2025;
run;

data b;
set a;

/*
***Remember the options have automatically renumbered as a result of the create wide file macro;
1 = Minimal;
2 = Low impact FSW program;
3 = High impact FSW program;
4 = Condoms;
5 = VMMC;
6 = VMMC scale up;
7 = KP Oral PrEP continuation;
8 = KP Oral PrEP continuation plus intro up of Len;
9 = KP Oral PrEP continuation plus scale up of Len;
10 = FSW Oral PrEP continuation;
11 = AGYW Oral PrEP continuation;
12 = MSM Oral PrEP continuation;
13 = FSW Oral PrEP continuation plus intro up of Len;
14 = AGYW Oral PrEP continuation plus intro up of Len;
15 = MSM Oral PrEP continuation plus intro up of Len;
16 = FSW Oral PrEP continuation plus scale up of Len;
17 = AGYW Oral PrEP continuation plus scale up of Len;
18 = MSM Oral PrEP continuation plus scale up of Len;
19 = MSM Outreach;
20 = Adherence support;
21 = Low scale up;
22 = Medium scale up;
23 = High scale up;
24 = CD4;
25 = VL;
26 = Return interventions;
27 = SQ;

*/


***Pre-funding cuts outputs;
proc means n mean p5 p95;
var 

n_hivge15m_25		 n_hivge15w_25		    n_hivge15__25		prevalence1549m_25  prevalence1549w_25 	prevalence1549__25
incidence1549__25 	 incidence1549w_25 		incidence1549m_25	p_diag_25	 		p_diag_m_25	 		p_diag_w_25  
p_onart_diag_25   	 p_onart_diag_m_25   	p_onart_diag_w_25   p_onart_vl1000__25	p_onart_vl1000_m_25	p_onart_vl1000_w_25
n_onprep_w_25		 n_onprep_m_25			n_onprep_25			prop_elig_on_prep_25 n_prep_ever_25		
prevalence_1564sw_25 incidence_1564sw_25    p_onprep_sw_25		n_onprep_sw_25	
prevalence1549_msm_25	incidence_msm_25	p_onprep_msm_25		n_onprep_msm_25
prevalence_agyw_25		incidence_agyw_25	p_onprep_agyw_25	n_onprep_agyw_25
n_death_hivrel_25	 n_death_hivrel_m_25	n_death_hivrel_w_25
;run;

***Difference in incidence and deaths in 5, 20 and 50 years;

proc means n mean p5 p95;
var 

incidence1549__31_1	n_death_hivrel_31_1	incidence1549__46_1	n_death_hivrel_46_1	incidence1549__76_1	n_death_hivrel_76_1

proc contents;run;
