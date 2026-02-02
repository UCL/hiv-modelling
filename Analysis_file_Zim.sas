libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";


data a;
set a.wide_Zim_07_12_2026;
run;

/*
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
n_death_hivrel_25	 n_death_hivrel_m_25	n_death_hivrel_w_25 n_new_inf_25;
;run;
*/

data b;
set a;

/*
***Remember the options have automatically renumbered as a result of the create wide file macro;
1 = Minimal;
2 = Low impact FSW program; ***ERROR IN CODE - IGNORE;
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
19 = MSM Outreach; ***NOT CONSIDERED;
20 = Adherence support;
21 = Low scale up;
22 = Medium scale up;
23 = High scale up;
24 = CD4;
25 = VL;
26 = Return interventions;
27 = SQ;

*/

***Difference in discounted new infections and deaths in 5, 20 and 50 years between selected options;

* Infections;

* 20 years;
*d_n_new_inf_20y_2  = n_new_inf_26_46_1 - n_new_inf_26_46_2;
d_n_new_inf_20y_3  = n_new_inf_26_46_1 - n_new_inf_26_46_3;
d_n_new_inf_20y_4  = n_new_inf_26_46_1 - n_new_inf_26_46_4;
d_n_new_inf_20y_5  = n_new_inf_26_46_1 - n_new_inf_26_46_5;
d_n_new_inf_20y_6  = n_new_inf_26_46_1 - n_new_inf_26_46_6;
d_n_new_inf_20y_7  = n_new_inf_26_46_1 - n_new_inf_26_46_7;
d_n_new_inf_20y_8  = n_new_inf_26_46_1 - n_new_inf_26_46_8;
d_n_new_inf_20y_9  = n_new_inf_26_46_1 - n_new_inf_26_46_9;
d_n_new_inf_20y_10 = n_new_inf_26_46_1 - n_new_inf_26_46_10;
d_n_new_inf_20y_11 = n_new_inf_26_46_1 - n_new_inf_26_46_11;
d_n_new_inf_20y_12 = n_new_inf_26_46_1 - n_new_inf_26_46_12;
d_n_new_inf_20y_13 = n_new_inf_26_46_1 - n_new_inf_26_46_13;
d_n_new_inf_20y_14 = n_new_inf_26_46_1 - n_new_inf_26_46_14;
d_n_new_inf_20y_15 = n_new_inf_26_46_1 - n_new_inf_26_46_15;
d_n_new_inf_20y_16 = n_new_inf_26_46_1 - n_new_inf_26_46_16;
d_n_new_inf_20y_17 = n_new_inf_26_46_1 - n_new_inf_26_46_17;
d_n_new_inf_20y_18 = n_new_inf_26_46_1 - n_new_inf_26_46_18;
*d_n_new_inf_20y_19 = n_new_inf_26_46_1 - n_new_inf_26_46_19;
d_n_new_inf_20y_20 = n_new_inf_26_46_1 - n_new_inf_26_46_20;


* 50 years;
*d_n_new_inf_50y_2  = n_new_inf_26_76_1 - n_new_inf_26_76_2;
d_n_new_inf_50y_3  = n_new_inf_26_76_1 - n_new_inf_26_76_3;
d_n_new_inf_50y_4  = n_new_inf_26_76_1 - n_new_inf_26_76_4;
d_n_new_inf_50y_5  = n_new_inf_26_76_1 - n_new_inf_26_76_5;
d_n_new_inf_50y_6  = n_new_inf_26_76_1 - n_new_inf_26_76_6;
d_n_new_inf_50y_7  = n_new_inf_26_76_1 - n_new_inf_26_76_7;
d_n_new_inf_50y_8  = n_new_inf_26_76_1 - n_new_inf_26_76_8;
d_n_new_inf_50y_9  = n_new_inf_26_76_1 - n_new_inf_26_76_9;
d_n_new_inf_50y_10 = n_new_inf_26_76_1 - n_new_inf_26_76_10;
d_n_new_inf_50y_11 = n_new_inf_26_76_1 - n_new_inf_26_76_11;
d_n_new_inf_50y_12 = n_new_inf_26_76_1 - n_new_inf_26_76_12;
d_n_new_inf_50y_13 = n_new_inf_26_76_1 - n_new_inf_26_76_13;
d_n_new_inf_50y_14 = n_new_inf_26_76_1 - n_new_inf_26_76_14;
d_n_new_inf_50y_15 = n_new_inf_26_76_1 - n_new_inf_26_76_15;
d_n_new_inf_50y_16 = n_new_inf_26_76_1 - n_new_inf_26_76_16;
d_n_new_inf_50y_17 = n_new_inf_26_76_1 - n_new_inf_26_76_17;
d_n_new_inf_50y_18 = n_new_inf_26_76_1 - n_new_inf_26_76_18;
*d_n_new_inf_50y_19 = n_new_inf_26_76_1 - n_new_inf_26_76_19;
d_n_new_inf_50y_20 = n_new_inf_26_76_1 - n_new_inf_26_76_20;

*Deaths;

* 20 years;
*d_n_death_hivrel_20y_2  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_2;
d_n_death_hivrel_20y_3  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_3;
d_n_death_hivrel_20y_4  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_4;
d_n_death_hivrel_20y_5  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_5;
d_n_death_hivrel_20y_6  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_6;
d_n_death_hivrel_20y_7  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_7;
d_n_death_hivrel_20y_8  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_8;
d_n_death_hivrel_20y_9  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_9;
d_n_death_hivrel_20y_10 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_10;
d_n_death_hivrel_20y_11 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_11;
d_n_death_hivrel_20y_12 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_12;
d_n_death_hivrel_20y_13 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_13;
d_n_death_hivrel_20y_14 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_14;
d_n_death_hivrel_20y_15 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_15;
d_n_death_hivrel_20y_16 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_16;
d_n_death_hivrel_20y_17 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_17;
d_n_death_hivrel_20y_18 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_18;
*d_n_death_hivrel_20y_19 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_19;
d_n_death_hivrel_20y_20 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_20;


* 50 years;
*d_n_death_hivrel_50y_2  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_2;
d_n_death_hivrel_50y_3  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_3;
d_n_death_hivrel_50y_4  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_4;
d_n_death_hivrel_50y_5  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_5;
d_n_death_hivrel_50y_6  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_6;
d_n_death_hivrel_50y_7  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_7;
d_n_death_hivrel_50y_8  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_8;
d_n_death_hivrel_50y_9  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_9;
d_n_death_hivrel_50y_10 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_10;
d_n_death_hivrel_50y_11 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_11;
d_n_death_hivrel_50y_12 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_12;
d_n_death_hivrel_50y_13 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_13;
d_n_death_hivrel_50y_14 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_14;
d_n_death_hivrel_50y_15 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_15;
d_n_death_hivrel_50y_16 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_16;
d_n_death_hivrel_50y_17 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_17;
d_n_death_hivrel_50y_18 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_18;
*d_n_death_hivrel_50y_19 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_19;
d_n_death_hivrel_50y_20 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_20;

*Difference in number of new infections over 20 and 50 years;
*Using output statement in order to merge the 3 year groups later);
proc means data=b  mean;var 
/*d_n_new_inf_20y_2*/	d_n_new_inf_20y_3		d_n_new_inf_20y_4		d_n_new_inf_20y_5	
d_n_new_inf_20y_6 		d_n_new_inf_20y_7		d_n_new_inf_20y_8		d_n_new_inf_20y_9		d_n_new_inf_20y_10
d_n_new_inf_20y_11		d_n_new_inf_20y_12		d_n_new_inf_20y_13		d_n_new_inf_20y_14		d_n_new_inf_20y_15	
d_n_new_inf_20y_16		d_n_new_inf_20y_17		d_n_new_inf_20y_18		/*d_n_new_inf_20y_19*/		d_n_new_inf_20y_20;
output out=means_new_inf_20y mean=;
run;
proc means data=b  mean;var 
/*d_n_new_inf_50y_2*/	d_n_new_inf_50y_3		d_n_new_inf_50y_4		d_n_new_inf_50y_5	
d_n_new_inf_50y_6 		d_n_new_inf_50y_7		d_n_new_inf_50y_8		d_n_new_inf_50y_9		d_n_new_inf_50y_10
d_n_new_inf_50y_11		d_n_new_inf_50y_12		d_n_new_inf_50y_13		d_n_new_inf_50y_14		d_n_new_inf_50y_15	
d_n_new_inf_50y_16		d_n_new_inf_50y_17		d_n_new_inf_50y_18		/*d_n_new_inf_50y_19*/		d_n_new_inf_50y_20;
output out=means_new_inf_50y mean=;
run;

proc means data=b  mean;var 
/*d_n_death_hivrel_20y_2*/	d_n_death_hivrel_20y_3		d_n_death_hivrel_20y_4		d_n_death_hivrel_20y_5	
d_n_death_hivrel_20y_6 		d_n_death_hivrel_20y_7		d_n_death_hivrel_20y_8		d_n_death_hivrel_20y_9		d_n_death_hivrel_20y_10
d_n_death_hivrel_20y_11		d_n_death_hivrel_20y_12		d_n_death_hivrel_20y_13		d_n_death_hivrel_20y_14		d_n_death_hivrel_20y_15	
d_n_death_hivrel_20y_16		d_n_death_hivrel_20y_17		d_n_death_hivrel_20y_18		/*d_n_death_hivrel_20y_19*/		d_n_death_hivrel_20y_20;
output out=means_death_hivrel_20y mean=;
run;
proc means data=b  mean;var 
/*d_n_death_hivrel_50y_2*/	d_n_death_hivrel_50y_3		d_n_death_hivrel_50y_4		d_n_death_hivrel_50y_5	
d_n_death_hivrel_50y_6 		d_n_death_hivrel_50y_7		d_n_death_hivrel_50y_8		d_n_death_hivrel_50y_9		d_n_death_hivrel_50y_10
d_n_death_hivrel_50y_11		d_n_death_hivrel_50y_12		d_n_death_hivrel_50y_13		d_n_death_hivrel_50y_14		d_n_death_hivrel_50y_15	
d_n_death_hivrel_50y_16		d_n_death_hivrel_50y_17		d_n_death_hivrel_50y_18		/*d_n_death_hivrel_50y_19*/		d_n_death_hivrel_50y_20;
output out=means_death_hivrel_50y mean=;
run;

**Need to transpose the outputs so they are excel ready;
proc transpose data=means_new_inf_20y out=t_newinf_20y(rename=(col1=mean_newinf_20y));run;
proc transpose data=means_new_inf_50y out=t_newinf_50y(rename=(col1=mean_newinf_50y));run;
proc transpose data=means_death_hivrel_20y out=t_death_hivrel_20y(rename=(col1=mean_death_hivrel_20y));run;
proc transpose data=means_death_hivrel_50y out=t_death_hivrel_50y(rename=(col1=mean_death_hivrel_50y));run;

**Use html so can copy and paste into Excel (could automate but this gives more flexibility);
ods html;
data means_final;
    merge t_newinf_20y(rename=(_NAME_=scenario))
          t_newinf_50y
		  t_death_hivrel_20y
		  t_death_hivrel_50y;
drop _name_;
run;

proc print data=means_final noobs;
run;


***COSTS AND DALYS;
data c;
set b;


*Difference in discounted costs;
*20 years;
diff_dcost_20y_2 = dcost_26_46_2 - dcost_26_46_1;
diff_dcost_20y_3 = dcost_26_46_3 - dcost_26_46_1;
diff_dcost_20y_4 = dcost_26_46_4 - dcost_26_46_1;
diff_dcost_20y_5 = dcost_26_46_5 - dcost_26_46_1;
diff_dcost_20y_6 = dcost_26_46_6 - dcost_26_46_1;
diff_dcost_20y_7 = dcost_26_46_7 - dcost_26_46_1;
diff_dcost_20y_8 = dcost_26_46_8 - dcost_26_46_1;
diff_dcost_20y_9 = dcost_26_46_9 - dcost_26_46_1;
diff_dcost_20y_10 = dcost_26_46_10 - dcost_26_46_1;
diff_dcost_20y_11 = dcost_26_46_11 - dcost_26_46_1;
diff_dcost_20y_12 = dcost_26_46_12 - dcost_26_46_1;
diff_dcost_20y_13 = dcost_26_46_13 - dcost_26_46_1;
diff_dcost_20y_14 = dcost_26_46_14 - dcost_26_46_1;
diff_dcost_20y_15 = dcost_26_46_15 - dcost_26_46_1;
diff_dcost_20y_16 = dcost_26_46_16 - dcost_26_46_1;
diff_dcost_20y_17 = dcost_26_46_17 - dcost_26_46_1;
diff_dcost_20y_18 = dcost_26_46_18 - dcost_26_46_1;
diff_dcost_20y_19 = dcost_26_46_19 - dcost_26_46_1;
diff_dcost_20y_20 = dcost_26_46_20 - dcost_26_46_1;


*50 years;
diff_dcost_50y_2 = dcost_26_76_2 - dcost_26_76_1;
diff_dcost_50y_3 = dcost_26_76_3 - dcost_26_76_1;
diff_dcost_50y_4 = dcost_26_76_4 - dcost_26_76_1;
diff_dcost_50y_5 = dcost_26_76_5 - dcost_26_76_1;
diff_dcost_50y_6 = dcost_26_76_6 - dcost_26_76_1;
diff_dcost_50y_7 = dcost_26_76_7 - dcost_26_76_1;
diff_dcost_50y_8 = dcost_26_76_8 - dcost_26_76_1;
diff_dcost_50y_9 = dcost_26_76_9 - dcost_26_76_1;
diff_dcost_50y_10 = dcost_26_76_10 - dcost_26_76_1;
diff_dcost_50y_11 = dcost_26_76_11 - dcost_26_76_1;
diff_dcost_50y_12 = dcost_26_76_12 - dcost_26_76_1;
diff_dcost_50y_13 = dcost_26_76_13 - dcost_26_76_1;
diff_dcost_50y_14 = dcost_26_76_14 - dcost_26_76_1;
diff_dcost_50y_15 = dcost_26_76_15 - dcost_26_76_1;
diff_dcost_50y_16 = dcost_26_76_16 - dcost_26_76_1;
diff_dcost_50y_17 = dcost_26_76_17 - dcost_26_76_1;
diff_dcost_50y_18 = dcost_26_76_18 - dcost_26_76_1;
diff_dcost_50y_19 = dcost_26_76_19 - dcost_26_76_1;
diff_dcost_50y_20 = dcost_26_76_20 - dcost_26_76_1;

*** discounted new infections;
* 20 years;
diff_dnewinf_20y_2  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_2;
diff_dnewinf_20y_3  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_3;
diff_dnewinf_20y_4  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_4;
diff_dnewinf_20y_5  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_5;
diff_dnewinf_20y_6  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_6;
diff_dnewinf_20y_7  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_7;
diff_dnewinf_20y_8  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_8;
diff_dnewinf_20y_9  = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_9;
diff_dnewinf_20y_10 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_10;
diff_dnewinf_20y_11 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_11;
diff_dnewinf_20y_12 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_12;
diff_dnewinf_20y_13 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_13;
diff_dnewinf_20y_14 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_14;
diff_dnewinf_20y_15 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_15;
diff_dnewinf_20y_16 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_16;
diff_dnewinf_20y_17 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_17;
diff_dnewinf_20y_18 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_18;
diff_dnewinf_20y_19 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_19;
diff_dnewinf_20y_20 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_20;

* 50 years;
diff_dnewinf_50y_2  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_2;
diff_dnewinf_50y_3  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_3;
diff_dnewinf_50y_4  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_4;
diff_dnewinf_50y_5  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_5;
diff_dnewinf_50y_6  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_6;
diff_dnewinf_50y_7  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_7;
diff_dnewinf_50y_8  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_8;
diff_dnewinf_50y_9  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_9;
diff_dnewinf_50y_10 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_10;
diff_dnewinf_50y_11 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_11;
diff_dnewinf_50y_12 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_12;
diff_dnewinf_50y_13 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_13;
diff_dnewinf_50y_14 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_14;
diff_dnewinf_50y_15 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_15;
diff_dnewinf_50y_16 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_16;
diff_dnewinf_50y_17 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_17;
diff_dnewinf_50y_18 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_18;
diff_dnewinf_50y_19 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_19;
diff_dnewinf_50y_20 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_20;

*difference in discounted dalys (dalys averted);
* 20 years;

diff_ddaly_20y_2  = ddaly_26_46_1 - ddaly_26_46_2;
diff_ddaly_20y_3  = ddaly_26_46_1 - ddaly_26_46_3;
diff_ddaly_20y_4  = ddaly_26_46_1 - ddaly_26_46_4;
diff_ddaly_20y_5  = ddaly_26_46_1 - ddaly_26_46_5;
diff_ddaly_20y_6  = ddaly_26_46_1 - ddaly_26_46_6;
diff_ddaly_20y_7  = ddaly_26_46_1 - ddaly_26_46_7;
diff_ddaly_20y_8  = ddaly_26_46_1 - ddaly_26_46_8;
diff_ddaly_20y_9  = ddaly_26_46_1 - ddaly_26_46_9;
diff_ddaly_20y_10 = ddaly_26_46_1 - ddaly_26_46_10;
diff_ddaly_20y_11 = ddaly_26_46_1 - ddaly_26_46_11;
diff_ddaly_20y_12 = ddaly_26_46_1 - ddaly_26_46_12;
diff_ddaly_20y_13 = ddaly_26_46_1 - ddaly_26_46_13;
diff_ddaly_20y_14 = ddaly_26_46_1 - ddaly_26_46_14;
diff_ddaly_20y_15 = ddaly_26_46_1 - ddaly_26_46_15;
diff_ddaly_20y_16 = ddaly_26_46_1 - ddaly_26_46_16;
diff_ddaly_20y_17 = ddaly_26_46_1 - ddaly_26_46_17;
diff_ddaly_20y_18 = ddaly_26_46_1 - ddaly_26_46_18;
diff_ddaly_20y_19 = ddaly_26_46_1 - ddaly_26_46_19;
diff_ddaly_20y_20 = ddaly_26_46_1 - ddaly_26_46_20;


*50 years;
diff_ddaly_50y_2  = ddaly_26_76_1 - ddaly_26_76_2;
diff_ddaly_50y_3  = ddaly_26_76_1 - ddaly_26_76_3;
diff_ddaly_50y_4  = ddaly_26_76_1 - ddaly_26_76_4;
diff_ddaly_50y_5  = ddaly_26_76_1 - ddaly_26_76_5;
diff_ddaly_50y_6  = ddaly_26_76_1 - ddaly_26_76_6;
diff_ddaly_50y_7  = ddaly_26_76_1 - ddaly_26_76_7;
diff_ddaly_50y_8  = ddaly_26_76_1 - ddaly_26_76_8;
diff_ddaly_50y_9  = ddaly_26_76_1 - ddaly_26_76_9;
diff_ddaly_50y_10 = ddaly_26_76_1 - ddaly_26_76_10;
diff_ddaly_50y_11 = ddaly_26_76_1 - ddaly_26_76_11;
diff_ddaly_50y_12 = ddaly_26_76_1 - ddaly_26_76_12;
diff_ddaly_50y_13 = ddaly_26_76_1 - ddaly_26_76_13;
diff_ddaly_50y_14 = ddaly_26_76_1 - ddaly_26_76_14;
diff_ddaly_50y_15 = ddaly_26_76_1 - ddaly_26_76_15;
diff_ddaly_50y_16 = ddaly_26_76_1 - ddaly_26_76_16;
diff_ddaly_50y_17 = ddaly_26_76_1 - ddaly_26_76_17;
diff_ddaly_50y_18 = ddaly_26_76_1 - ddaly_26_76_18;
diff_ddaly_50y_19 = ddaly_26_76_1 - ddaly_26_76_19;
diff_ddaly_50y_20 = ddaly_26_76_1 - ddaly_26_76_20;

*net dalys using $300 - converts costs into DALYs;
*20 years;
netdalys_20y_1 =  ddaly_26_46_1 + (dcost_26_46_1)/0.0003;
netdalys_20y_2 =  ddaly_26_46_2 + (dcost_26_46_2)/0.0003;*expect dalys to be lower here;
netdalys_20y_3 =  ddaly_26_46_3 + (dcost_26_46_3)/0.0003;
netdalys_20y_4 =  ddaly_26_46_4 + (dcost_26_46_4)/0.0003;
netdalys_20y_5 =  ddaly_26_46_5 + (dcost_26_46_5)/0.0003;
netdalys_20y_6 =  ddaly_26_46_6 + (dcost_26_46_6)/0.0003;
netdalys_20y_7 =  ddaly_26_46_7 + (dcost_26_46_7)/0.0003;
netdalys_20y_8 =  ddaly_26_46_8 + (dcost_26_46_8)/0.0003;
netdalys_20y_9 =  ddaly_26_46_9 + (dcost_26_46_9)/0.0003;
netdalys_20y_10 =  ddaly_26_46_10 + (dcost_26_46_10)/0.0003;
netdalys_20y_11 =  ddaly_26_46_11 + (dcost_26_46_11)/0.0003;
netdalys_20y_12 =  ddaly_26_46_12 + (dcost_26_46_12)/0.0003;
netdalys_20y_13 =  ddaly_26_46_13 + (dcost_26_46_13)/0.0003;
netdalys_20y_14 =  ddaly_26_46_14 + (dcost_26_46_14)/0.0003;
netdalys_20y_15 =  ddaly_26_46_15 + (dcost_26_46_15)/0.0003;
netdalys_20y_16 =  ddaly_26_46_16 + (dcost_26_46_16)/0.0003;
netdalys_20y_17 =  ddaly_26_46_17 + (dcost_26_46_17)/0.0003;
netdalys_20y_18 =  ddaly_26_46_18 + (dcost_26_46_18)/0.0003;
netdalys_20y_19 =  ddaly_26_46_19 + (dcost_26_46_19)/0.0003;
netdalys_20y_20 =  ddaly_26_46_20 + (dcost_26_46_20)/0.0003;

*net dalys averted;
diff_netdalys_20y_2 = netdalys_20y_2 - netdalys_20y_1; *take absolute number;
diff_netdalys_20y_3 = netdalys_20y_3 - netdalys_20y_1;
diff_netdalys_20y_4 = netdalys_20y_4 - netdalys_20y_1;
diff_netdalys_20y_5 = netdalys_20y_5 - netdalys_20y_1;
diff_netdalys_20y_6 = netdalys_20y_6 - netdalys_20y_1;
diff_netdalys_20y_7 = netdalys_20y_7 - netdalys_20y_1;
diff_netdalys_20y_8 = netdalys_20y_8 - netdalys_20y_1;
diff_netdalys_20y_9 = netdalys_20y_9 - netdalys_20y_1;
diff_netdalys_20y_10 = netdalys_20y_10 - netdalys_20y_1;
diff_netdalys_20y_11 = netdalys_20y_11 - netdalys_20y_1;
diff_netdalys_20y_12 = netdalys_20y_12 - netdalys_20y_1;
diff_netdalys_20y_13 = netdalys_20y_13 - netdalys_20y_1;
diff_netdalys_20y_14 = netdalys_20y_14 - netdalys_20y_1;
diff_netdalys_20y_15 = netdalys_20y_15 - netdalys_20y_1;
diff_netdalys_20y_16 = netdalys_20y_16 - netdalys_20y_1;
diff_netdalys_20y_17 = netdalys_20y_17 - netdalys_20y_1;
diff_netdalys_20y_18 = netdalys_20y_18 - netdalys_20y_1;
diff_netdalys_20y_19 = netdalys_20y_19 - netdalys_20y_1;
diff_netdalys_20y_20 = netdalys_20y_20 - netdalys_20y_1;

*50 years;
netdalys_50y_1 =  ddaly_26_76_1 + (dcost_26_76_1)/0.0003;
netdalys_50y_2 =  ddaly_26_76_2 + (dcost_26_76_2)/0.0003;*expect dalys to be lower here;
netdalys_50y_3 =  ddaly_26_76_3 + (dcost_26_76_3)/0.0003;
netdalys_50y_4 =  ddaly_26_76_4 + (dcost_26_76_4)/0.0003;
netdalys_50y_5 =  ddaly_26_76_5 + (dcost_26_76_5)/0.0003;
netdalys_50y_6 =  ddaly_26_76_6 + (dcost_26_76_6)/0.0003;
netdalys_50y_7 =  ddaly_26_76_7 + (dcost_26_76_7)/0.0003;
netdalys_50y_8 =  ddaly_26_76_8 + (dcost_26_76_8)/0.0003;
netdalys_50y_9 =  ddaly_26_76_9 + (dcost_26_76_9)/0.0003;
netdalys_50y_10 =  ddaly_26_76_10 + (dcost_26_76_10)/0.0003;
netdalys_50y_11 =  ddaly_26_76_11 + (dcost_26_76_11)/0.0003;
netdalys_50y_12 =  ddaly_26_76_12 + (dcost_26_76_12)/0.0003;
netdalys_50y_13 =  ddaly_26_76_13 + (dcost_26_76_13)/0.0003;
netdalys_50y_14 =  ddaly_26_76_14 + (dcost_26_76_14)/0.0003;
netdalys_50y_15 =  ddaly_26_76_15 + (dcost_26_76_15)/0.0003;
netdalys_50y_16 =  ddaly_26_76_16 + (dcost_26_76_16)/0.0003;
netdalys_50y_17 =  ddaly_26_76_17 + (dcost_26_76_17)/0.0003;
netdalys_50y_18 =  ddaly_26_76_18 + (dcost_26_76_18)/0.0003;
netdalys_50y_19 =  ddaly_26_76_19 + (dcost_26_76_19)/0.0003;
netdalys_50y_20 =  ddaly_26_76_20 + (dcost_26_76_20)/0.0003;

*net dalys averted;
diff_netdalys_50y_2 = netdalys_50y_2 - netdalys_50y_1; *take absolute number;
diff_netdalys_50y_3 = netdalys_50y_3 - netdalys_50y_1;
diff_netdalys_50y_4 = netdalys_50y_4 - netdalys_50y_1;
diff_netdalys_50y_5 = netdalys_50y_5 - netdalys_50y_1;
diff_netdalys_50y_6 = netdalys_50y_6 - netdalys_50y_1;
diff_netdalys_50y_7 = netdalys_50y_7 - netdalys_50y_1;
diff_netdalys_50y_8 = netdalys_50y_8 - netdalys_50y_1;
diff_netdalys_50y_9 = netdalys_50y_9 - netdalys_50y_1;
diff_netdalys_50y_10 = netdalys_50y_10 - netdalys_50y_1;
diff_netdalys_50y_11 = netdalys_50y_11 - netdalys_50y_1;
diff_netdalys_50y_12 = netdalys_50y_12 - netdalys_50y_1;
diff_netdalys_50y_13 = netdalys_50y_13 - netdalys_50y_1;
diff_netdalys_50y_14 = netdalys_50y_14 - netdalys_50y_1;
diff_netdalys_50y_15 = netdalys_50y_15 - netdalys_50y_1;
diff_netdalys_50y_16 = netdalys_50y_16 - netdalys_50y_1;
diff_netdalys_50y_17 = netdalys_50y_17 - netdalys_50y_1;
diff_netdalys_50y_18 = netdalys_50y_18 - netdalys_50y_1;
diff_netdalys_50y_19 = netdalys_50y_19 - netdalys_50y_1;
diff_netdalys_50y_20 = netdalys_50y_20 - netdalys_50y_1;

***ICER (cost per DALY averted);
* 20 years;
ICER_20y_2 = (diff_dcost_20y_2/diff_ddaly_20y_2)*1000000;
ICER_20y_3 = (diff_dcost_20y_3/diff_ddaly_20y_3)*1000000;
ICER_20y_4 = (diff_dcost_20y_4/diff_ddaly_20y_4)*1000000;
ICER_20y_5 = (diff_dcost_20y_5/diff_ddaly_20y_5)*1000000;
ICER_20y_6 = (diff_dcost_20y_6/diff_ddaly_20y_6)*1000000;
ICER_20y_7 = (diff_dcost_20y_7/diff_ddaly_20y_7)*1000000;
ICER_20y_8 = (diff_dcost_20y_8/diff_ddaly_20y_8)*1000000;
ICER_20y_9 = (diff_dcost_20y_9/diff_ddaly_20y_9)*1000000;
ICER_20y_10 = (diff_dcost_20y_10/diff_ddaly_20y_10)*1000000;
ICER_20y_11 = (diff_dcost_20y_11/diff_ddaly_20y_11)*1000000;
ICER_20y_12 = (diff_dcost_20y_12/diff_ddaly_20y_12)*1000000;
ICER_20y_13 = (diff_dcost_20y_13/diff_ddaly_20y_13)*1000000;
ICER_20y_14 = (diff_dcost_20y_14/diff_ddaly_20y_14)*1000000;
ICER_20y_15 = (diff_dcost_20y_15/diff_ddaly_20y_15)*1000000;
ICER_20y_16 = (diff_dcost_20y_16/diff_ddaly_20y_16)*1000000;
ICER_20y_17 = (diff_dcost_20y_17/diff_ddaly_20y_17)*1000000;
ICER_20y_18 = (diff_dcost_20y_18/diff_ddaly_20y_18)*1000000;
ICER_20y_19 = (diff_dcost_20y_19/diff_ddaly_20y_19)*1000000;
ICER_20y_20 = (diff_dcost_20y_20/diff_ddaly_20y_20)*1000000;

* 50 years;
ICER_50y_2 = (diff_dcost_50y_2/diff_ddaly_50y_2)*1000000;
ICER_50y_3 = (diff_dcost_50y_3/diff_ddaly_50y_3)*1000000;
ICER_50y_4 = (diff_dcost_50y_4/diff_ddaly_50y_4)*1000000;
ICER_50y_5 = (diff_dcost_50y_5/diff_ddaly_50y_5)*1000000;
ICER_50y_6 = (diff_dcost_50y_6/diff_ddaly_50y_6)*1000000;
ICER_50y_7 = (diff_dcost_50y_7/diff_ddaly_50y_7)*1000000;
ICER_50y_8 = (diff_dcost_50y_8/diff_ddaly_50y_8)*1000000;
ICER_50y_9 = (diff_dcost_50y_9/diff_ddaly_50y_9)*1000000;
ICER_50y_10 = (diff_dcost_50y_10/diff_ddaly_50y_10)*1000000;
ICER_50y_11 = (diff_dcost_50y_11/diff_ddaly_50y_11)*1000000;
ICER_50y_12 = (diff_dcost_50y_12/diff_ddaly_50y_12)*1000000;
ICER_50y_13 = (diff_dcost_50y_13/diff_ddaly_50y_13)*1000000;
ICER_50y_14 = (diff_dcost_50y_14/diff_ddaly_50y_14)*1000000;
ICER_50y_15 = (diff_dcost_50y_15/diff_ddaly_50y_15)*1000000;
ICER_50y_16 = (diff_dcost_50y_16/diff_ddaly_50y_16)*1000000;
ICER_50y_17 = (diff_dcost_50y_17/diff_ddaly_50y_17)*1000000;
ICER_50y_18 = (diff_dcost_50y_18/diff_ddaly_50y_18)*1000000;
ICER_50y_19 = (diff_dcost_50y_19/diff_ddaly_50y_19)*1000000;
ICER_50y_20 = (diff_dcost_50y_20/diff_ddaly_50y_20)*1000000;


***Cost per infection averted;
* 20 years;
cost_inf_avtd_20y_2 = (diff_dcost_20y_2/diff_dnewinf_20y_2)*1000000;
cost_inf_avtd_20y_3 = (diff_dcost_20y_3/diff_dnewinf_20y_3)*1000000;
cost_inf_avtd_20y_4 = (diff_dcost_20y_4/diff_dnewinf_20y_4)*1000000;
cost_inf_avtd_20y_5 = (diff_dcost_20y_5/diff_dnewinf_20y_5)*1000000;
cost_inf_avtd_20y_6 = (diff_dcost_20y_6/diff_dnewinf_20y_6)*1000000;
cost_inf_avtd_20y_7 = (diff_dcost_20y_7/diff_dnewinf_20y_7)*1000000;
cost_inf_avtd_20y_8 = (diff_dcost_20y_8/diff_dnewinf_20y_8)*1000000;
cost_inf_avtd_20y_9 = (diff_dcost_20y_9/diff_dnewinf_20y_9)*1000000;
cost_inf_avtd_20y_10 = (diff_dcost_20y_10/diff_dnewinf_20y_10)*1000000;
cost_inf_avtd_20y_11 = (diff_dcost_20y_11/diff_dnewinf_20y_11)*1000000;
cost_inf_avtd_20y_12 = (diff_dcost_20y_12/diff_dnewinf_20y_12)*1000000;
cost_inf_avtd_20y_13 = (diff_dcost_20y_13/diff_dnewinf_20y_13)*1000000;
cost_inf_avtd_20y_14 = (diff_dcost_20y_14/diff_dnewinf_20y_14)*1000000;
cost_inf_avtd_20y_15 = (diff_dcost_20y_15/diff_dnewinf_20y_15)*1000000;
cost_inf_avtd_20y_16 = (diff_dcost_20y_16/diff_dnewinf_20y_16)*1000000;
cost_inf_avtd_20y_17 = (diff_dcost_20y_17/diff_dnewinf_20y_17)*1000000;
cost_inf_avtd_20y_18 = (diff_dcost_20y_18/diff_dnewinf_20y_18)*1000000;
cost_inf_avtd_20y_19 = (diff_dcost_20y_19/diff_dnewinf_20y_19)*1000000;
cost_inf_avtd_20y_20 = (diff_dcost_20y_20/diff_dnewinf_20y_20)*1000000;

* 50 years;
cost_inf_avtd_50y_2 = (diff_dcost_50y_2/diff_dnewinf_50y_2)*1000000;
cost_inf_avtd_50y_3 = (diff_dcost_50y_3/diff_dnewinf_50y_3)*1000000;
cost_inf_avtd_50y_4 = (diff_dcost_50y_4/diff_dnewinf_50y_4)*1000000;
cost_inf_avtd_50y_5 = (diff_dcost_50y_5/diff_dnewinf_50y_5)*1000000;
cost_inf_avtd_50y_6 = (diff_dcost_50y_6/diff_dnewinf_50y_6)*1000000;
cost_inf_avtd_50y_7 = (diff_dcost_50y_7/diff_dnewinf_50y_7)*1000000;
cost_inf_avtd_50y_8 = (diff_dcost_50y_8/diff_dnewinf_50y_8)*1000000;
cost_inf_avtd_50y_9 = (diff_dcost_50y_9/diff_dnewinf_50y_9)*1000000;
cost_inf_avtd_50y_10 = (diff_dcost_50y_10/diff_dnewinf_50y_10)*1000000;
cost_inf_avtd_50y_11 = (diff_dcost_50y_11/diff_dnewinf_50y_11)*1000000;
cost_inf_avtd_50y_12 = (diff_dcost_50y_12/diff_dnewinf_50y_12)*1000000;
cost_inf_avtd_50y_13 = (diff_dcost_50y_13/diff_dnewinf_50y_13)*1000000;
cost_inf_avtd_50y_14 = (diff_dcost_50y_14/diff_dnewinf_50y_14)*1000000;
cost_inf_avtd_50y_15 = (diff_dcost_50y_15/diff_dnewinf_50y_15)*1000000;
cost_inf_avtd_50y_16 = (diff_dcost_50y_16/diff_dnewinf_50y_16)*1000000;
cost_inf_avtd_50y_17 = (diff_dcost_50y_17/diff_dnewinf_50y_17)*1000000;
cost_inf_avtd_50y_18 = (diff_dcost_50y_18/diff_dnewinf_50y_18)*1000000;
cost_inf_avtd_50y_19 = (diff_dcost_50y_19/diff_dnewinf_50y_19)*1000000;
cost_inf_avtd_50y_20 = (diff_dcost_50y_20/diff_dnewinf_50y_20)*1000000;


***Difference in discounted costs;
proc means data=c  mean;var 
/*diff_dcost_20y_2*/	diff_dcost_20y_3		diff_dcost_20y_4		diff_dcost_20y_5	
diff_dcost_20y_6 		diff_dcost_20y_7		diff_dcost_20y_8		diff_dcost_20y_9		diff_dcost_20y_10
diff_dcost_20y_11		diff_dcost_20y_12		diff_dcost_20y_13		diff_dcost_20y_14		diff_dcost_20y_15	
diff_dcost_20y_16		diff_dcost_20y_17		diff_dcost_20y_18		/*diff_dcost_20y_19*/	diff_dcost_20y_20;
output out=means_costs_20y mean=;
run;
proc means data=c  mean;var 
/*diff_dcost_50y_2*/	diff_dcost_50y_3		diff_dcost_50y_4		diff_dcost_50y_5	
diff_dcost_50y_6 		diff_dcost_50y_7		diff_dcost_50y_8		diff_dcost_50y_9		diff_dcost_50y_10
diff_dcost_50y_11		diff_dcost_50y_12		diff_dcost_50y_13		diff_dcost_50y_14		diff_dcost_50y_15	
diff_dcost_50y_16		diff_dcost_50y_17		diff_dcost_50y_18		/*diff_dcost_50y_19*/	diff_dcost_50y_20;
output out=means_costs_50y mean=;
run;

***DALYs averted;
proc means data=c  mean;var 
/*diff_ddaly_20y_2*/	diff_ddaly_20y_3		diff_ddaly_20y_4		diff_ddaly_20y_5	
diff_ddaly_20y_6 		diff_ddaly_20y_7		diff_ddaly_20y_8		diff_ddaly_20y_9		diff_ddaly_20y_10
diff_ddaly_20y_11		diff_ddaly_20y_12		diff_ddaly_20y_13		diff_ddaly_20y_14		diff_ddaly_20y_15	
diff_ddaly_20y_16		diff_ddaly_20y_17		diff_ddaly_20y_18		/*diff_ddaly_20y_19*/	diff_ddaly_20y_20;
output out=means_dalys_20y mean=;
run;
proc means data=c  mean;var 
/*diff_ddaly_50y_2*/	diff_ddaly_50y_3		diff_ddaly_50y_4		diff_ddaly_50y_5	
diff_ddaly_50y_6 		diff_ddaly_50y_7		diff_ddaly_50y_8		diff_ddaly_50y_9		diff_ddaly_50y_10
diff_ddaly_50y_11		diff_ddaly_50y_12		diff_ddaly_50y_13		diff_ddaly_50y_14		diff_ddaly_50y_15	
diff_ddaly_50y_16		diff_ddaly_50y_17		diff_ddaly_50y_18		/*diff_ddaly_50y_19*/	diff_ddaly_50y_20;
output out=means_dalys_50y mean=;
run;

proc means data=c  mean;var 
/*icer_20y_2*/	icer_20y_3		icer_20y_4		icer_20y_5	
icer_20y_6 		icer_20y_7		icer_20y_8		icer_20y_9		icer_20y_10
icer_20y_11		icer_20y_12		icer_20y_13		icer_20y_14		icer_20y_15	
icer_20y_16		icer_20y_17		icer_20y_18		/*icer_20y_19*/	icer_20y_20;
output out=means_icer_20y mean=;
run;
proc means data=c  mean;var 
/*icer_50y_2*/	icer_50y_3		icer_50y_4		icer_50y_5	
icer_50y_6 		icer_50y_7		icer_50y_8		icer_50y_9		icer_50y_10
icer_50y_11		icer_50y_12		icer_50y_13		icer_50y_14		icer_50y_15	
icer_50y_16		icer_50y_17		icer_50y_18		/*icer_50y_19*/	icer_50y_20;
output out=means_icer_50y mean=;
run;

proc means data=c  mean;var 
/*diff_netdalys_20y_2*/		diff_netdalys_20y_3		diff_netdalys_20y_4		diff_netdalys_20y_5	
diff_netdalys_20y_6 		diff_netdalys_20y_7		diff_netdalys_20y_8		diff_netdalys_20y_9		diff_netdalys_20y_10
diff_netdalys_20y_11		diff_netdalys_20y_12	diff_netdalys_20y_13	diff_netdalys_20y_14	diff_netdalys_20y_15	
diff_netdalys_20y_16		diff_netdalys_20y_17	diff_netdalys_20y_18	/*diff_netdalys_20y_19*/diff_netdalys_20y_20;
output out=means_diff_netdalys_20y mean=;
run;
proc means data=c  mean;var 
/*diff_netdalys_50y_2*/	diff_netdalys_50y_3		diff_netdalys_50y_4		diff_netdalys_50y_5	
diff_netdalys_50y_6 	diff_netdalys_50y_7		diff_netdalys_50y_8		diff_netdalys_50y_9		diff_netdalys_50y_10
diff_netdalys_50y_11	diff_netdalys_50y_12	diff_netdalys_50y_13	diff_netdalys_50y_14	diff_netdalys_50y_15	
diff_netdalys_50y_16	diff_netdalys_50y_17	diff_netdalys_50y_18	/*diff_netdalys_50y_19*/diff_netdalys_50y_20;
output out=means_diff_netdalys_50y mean=;
run;


proc transpose data=means_costs_20y out=t_costs_20y(rename=(col1=mean_costs_20y));run;
proc transpose data=means_costs_50y out=t_costs_50y(rename=(col1=mean_costs_50y));run;
proc transpose data=means_dalys_20y out=t_dalys_20y(rename=(col1=mean_dalys_20y));run;
proc transpose data=means_dalys_50y out=t_dalys_50y(rename=(col1=mean_dalys_50y));run;
proc transpose data=means_icer_20y out=t_icer_20y(rename=(col1=mean_icer_20y));run;
proc transpose data=means_icer_50y out=t_icer_50y(rename=(col1=mean_icer_50y));run;
proc transpose data=means_diff_netdalys_20y out=t_diff_netdalys_20y(rename=(col1=mean_diff_netdalys_20y));run;
proc transpose data=means_diff_netdalys_50y out=t_diff_netdalys_50y(rename=(col1=mean_diff_netdalys_50y));run;

**Use html so can copy and paste into Excel (could automate but this gives more flexibility);
ods html;
data means_costs_dalys;
    merge t_costs_20y(rename=(_NAME_=scenario))
		  t_dalys_20y
		  t_icer_20y
		  t_diff_netdalys_20y
          t_costs_50y
		  t_dalys_50y
		  t_icer_50y
		  t_diff_netdalys_50y;
drop _name_;
run;

proc print data=means_costs_dalys noobs;
run;



proc means data=c  mean;var 
/*diff_dnewinf_20y_2*/	diff_dnewinf_20y_3		diff_dnewinf_20y_4		diff_dnewinf_20y_5	
diff_dnewinf_20y_6 		diff_dnewinf_20y_7		diff_dnewinf_20y_8		diff_dnewinf_20y_9		diff_dnewinf_20y_10
diff_dnewinf_20y_11		diff_dnewinf_20y_12		diff_dnewinf_20y_13		diff_dnewinf_20y_14		diff_dnewinf_20y_15	
diff_dnewinf_20y_16		diff_dnewinf_20y_17		diff_dnewinf_20y_18		/*diff_dnewinf_20y_19*/	diff_dnewinf_20y_20;
output out=means_dnewinf_20y mean=;
run;
proc means data=c  mean;var 
/*diff_dnewinf_50y_2*/	diff_dnewinf_50y_3		diff_dnewinf_50y_4		diff_dnewinf_50y_5	
diff_dnewinf_50y_6 		diff_dnewinf_50y_7		diff_dnewinf_50y_8		diff_dnewinf_50y_9		diff_dnewinf_50y_10
diff_dnewinf_50y_11		diff_dnewinf_50y_12		diff_dnewinf_50y_13		diff_dnewinf_50y_14		diff_dnewinf_50y_15	
diff_dnewinf_50y_16		diff_dnewinf_50y_17		diff_dnewinf_50y_18		/*diff_dnewinf_50y_19*/	diff_dnewinf_50y_20;
output out=means_dnewinf_50y mean=;
run;
***Cost per infection averted;
proc means data=c  mean;var 
/*cost_inf_avtd_20y_2*/		cost_inf_avtd_20y_3		cost_inf_avtd_20y_4		cost_inf_avtd_20y_5	
cost_inf_avtd_20y_6 		cost_inf_avtd_20y_7		cost_inf_avtd_20y_8		cost_inf_avtd_20y_9		cost_inf_avtd_20y_10
cost_inf_avtd_20y_11		cost_inf_avtd_20y_12		cost_inf_avtd_20y_13		cost_inf_avtd_20y_14		cost_inf_avtd_20y_15	
cost_inf_avtd_20y_16		cost_inf_avtd_20y_17		cost_inf_avtd_20y_18		/*cost_inf_avtd_20y_19*/	cost_inf_avtd_20y_20;
output out=means_inf_avt_20y mean=;
run;
proc means data=c  mean;var 
/*cost_inf_avtd_50y_2*/		cost_inf_avtd_50y_3		cost_inf_avtd_50y_4		cost_inf_avtd_50y_5	
cost_inf_avtd_50y_6 		cost_inf_avtd_50y_7		cost_inf_avtd_50y_8		cost_inf_avtd_50y_9		cost_inf_avtd_50y_10
cost_inf_avtd_50y_11		cost_inf_avtd_50y_12		cost_inf_avtd_50y_13		cost_inf_avtd_50y_14		cost_inf_avtd_50y_15	
cost_inf_avtd_50y_16		cost_inf_avtd_50y_17		cost_inf_avtd_50y_18		/*cost_inf_avtd_50y_19*/	cost_inf_avtd_50y_20;
output out=means_inf_avt_50y mean=;
run;



proc transpose data=means_dnewinf_20y out=t_dnewinf_20y(rename=(col1=mean_dnewinf_20y));run;
proc transpose data=means_dnewinf_50y out=t_dnewinf_50y(rename=(col1=mean_dnewinf_50y));run;
proc transpose data=means_inf_avt_20y out=t_inf_avt_20y(rename=(col1=mean_inf_avt_20y));run;
proc transpose data=means_inf_avt_50y out=t_inf_avt_50y(rename=(col1=mean_inf_avt_50y));run;

ods html;
data means_inf_avtd;
    merge t_dnewinf_20y(rename=(_NAME_=scenario))
		  t_inf_avt_20y
		  t_dnewinf_50y
          t_inf_avt_50y;
drop _name_;
run;

proc print data=means_inf_avtd noobs;
run;
