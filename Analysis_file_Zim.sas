libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";


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
diff_ddaly_20y_2 = ddaly_26_46_2 - ddaly_26_46_1;
diff_ddaly_20y_3 = ddaly_26_46_3 - ddaly_26_46_1;
diff_ddaly_20y_4 = ddaly_26_46_4 - ddaly_26_46_1;
diff_ddaly_20y_5 = ddaly_26_46_5 - ddaly_26_46_1;
diff_ddaly_20y_6 = ddaly_26_46_6 - ddaly_26_46_1;
diff_ddaly_20y_7 = ddaly_26_46_7 - ddaly_26_46_1;
diff_ddaly_20y_8 = ddaly_26_46_8 - ddaly_26_46_1;
diff_ddaly_20y_9 = ddaly_26_46_9 - ddaly_26_46_1;
diff_ddaly_20y_10 = ddaly_26_46_10 - ddaly_26_46_1;
diff_ddaly_20y_11 = ddaly_26_46_11 - ddaly_26_46_1;
diff_ddaly_20y_12 = ddaly_26_46_12 - ddaly_26_46_1;
diff_ddaly_20y_13 = ddaly_26_46_13 - ddaly_26_46_1;
diff_ddaly_20y_14 = ddaly_26_46_14 - ddaly_26_46_1;
diff_ddaly_20y_15 = ddaly_26_46_15 - ddaly_26_46_1;
diff_ddaly_20y_16 = ddaly_26_46_16 - ddaly_26_46_1;
diff_ddaly_20y_17 = ddaly_26_46_17 - ddaly_26_46_1;
diff_ddaly_20y_18 = ddaly_26_46_18 - ddaly_26_46_1;
diff_ddaly_20y_19 = ddaly_26_46_19 - ddaly_26_46_1;

*50 years;
diff_ddaly_50y_2 = ddaly_26_76_2 - ddaly_26_76_1;
diff_ddaly_50y_3 = ddaly_26_76_3 - ddaly_26_76_1;
diff_ddaly_50y_4 = ddaly_26_76_4 - ddaly_26_76_1;
diff_ddaly_50y_5 = ddaly_26_76_5 - ddaly_26_76_1;
diff_ddaly_50y_6 = ddaly_26_76_6 - ddaly_26_76_1;
diff_ddaly_50y_7 = ddaly_26_76_7 - ddaly_26_76_1;
diff_ddaly_50y_8 = ddaly_26_76_8 - ddaly_26_76_1;
diff_ddaly_50y_9 = ddaly_26_76_9 - ddaly_26_76_1;
diff_ddaly_50y_10 = ddaly_26_76_10 - ddaly_26_76_1;
diff_ddaly_50y_11 = ddaly_26_76_11 - ddaly_26_76_1;
diff_ddaly_50y_12 = ddaly_26_76_12 - ddaly_26_76_1;
diff_ddaly_50y_13 = ddaly_26_76_13 - ddaly_26_76_1;
diff_ddaly_50y_14 = ddaly_26_76_14 - ddaly_26_76_1;
diff_ddaly_50y_15 = ddaly_26_76_15 - ddaly_26_76_1;
diff_ddaly_50y_16 = ddaly_26_76_16 - ddaly_26_76_1;
diff_ddaly_50y_17 = ddaly_26_76_17 - ddaly_26_76_1;
diff_ddaly_50y_18 = ddaly_26_76_18 - ddaly_26_76_1;
diff_ddaly_50y_19 = ddaly_26_76_19 - ddaly_26_76_1;
diff_ddaly_50y_20 = ddaly_26_76_20 - ddaly_26_76_1;

/*
*net dalys using $500;
netdalys_1 =  ddaly_24_74_1 + (dcost_24_74_1)/0.0005;
netdalys_2 =  ddaly_24_74_2 + (dcost_24_74_2)/0.0005;*expect dalys to be lower here;
netdalys_3 =  ddaly_24_74_3 + (dcost_24_74_3)/0.0005;
netdalys_4 =  ddaly_24_74_4 + (dcost_24_74_4)/0.0005;
netdalys_5 =  ddaly_24_74_5 + (dcost_24_74_5)/0.0005;
netdalys_6 =  ddaly_24_74_6 + (dcost_24_74_6)/0.0005;
netdalys_7 =  ddaly_24_74_7 + (dcost_24_74_7)/0.0005;
netdalys_8 =  ddaly_24_74_8 + (dcost_24_74_8)/0.0005;
netdalys_9 =  ddaly_24_74_9 + (dcost_24_74_9)/0.0005;
netdalys_10 =  ddaly_24_74_10 + (dcost_24_74_10)/0.0005;
netdalys_11 =  ddaly_24_74_11 + (dcost_24_74_11)/0.0005;
netdalys_12 =  ddaly_24_74_12 + (dcost_24_74_12)/0.0005;
netdalys_13 =  ddaly_24_74_13 + (dcost_24_74_13)/0.0005;
netdalys_14 =  ddaly_24_74_14 + (dcost_24_74_14)/0.0005;
netdalys_15 =  ddaly_24_74_15 + (dcost_24_74_15)/0.0005;
netdalys_16 =  ddaly_24_74_16 + (dcost_24_74_16)/0.0005;
netdalys_17 =  ddaly_24_74_17 + (dcost_24_74_17)/0.0005;
netdalys_18 =  ddaly_24_74_18 + (dcost_24_74_18/0.0005;
netdalys_19 =  ddaly_24_74_19 + (dcost_24_74_19)/0.0005;
netdalys_20 =  ddaly_24_74_20 + (dcost_24_74_20)/0.0005;
netdalys_21 =  ddaly_24_74_21 + (dcost_24_74_21)/0.0005;
netdalys_22 =  ddaly_24_74_22 + (dcost_24_74_22)/0.0005;
netdalys_24 =  ddaly_24_74_24 + (dcost_24_74_24)/0.0005;
netdalys_25 =  ddaly_24_74_25 + (dcost_24_74_25)/0.0005;
netdalys_26 =  ddaly_24_74_26 + (dcost_24_74_26)/0.0005;


*net dalys averted;
diff_netdalys_2 = netdalys_2 - netdalys_1; *take absolute number;
diff_netdalys_3 = netdalys_3 - netdalys_1;
diff_netdalys_4 = netdalys_4 - netdalys_1;
diff_netdalys_5 = netdalys_5 - netdalys_1;
diff_netdalys_6 = netdalys_6 - netdalys_1;
diff_netdalys_7 = netdalys_7 - netdalys_1;
diff_netdalys_8 = netdalys_8 - netdalys_1;
diff_netdalys_9 = netdalys_9 - netdalys_1;
diff_netdalys_10 = netdalys_10 - netdalys_1;
diff_netdalys_11 = netdalys_11 - netdalys_1;
diff_netdalys_12 = netdalys_12 - netdalys_1;
diff_netdalys_13 = netdalys_13 - netdalys_1;
diff_netdalys_14 = netdalys_14 - netdalys_1;
diff_netdalys_15 = netdalys_15 - netdalys_1;
diff_netdalys_16 = netdalys_16 - netdalys_1;
diff_netdalys_17 = netdalys_17 - netdalys_1;
diff_netdalys_18 = netdalys_18 - netdalys_1;
diff_netdalys_19 = netdalys_19 - netdalys_1;
diff_netdalys_20 = netdalys_20 - netdalys_1;
diff_netdalys_21 = netdalys_21 - netdalys_1;
diff_netdalys_22 = netdalys_22 - netdalys_1;
diff_netdalys_24 = netdalys_24 - netdalys_1;
diff_netdalys_25 = netdalys_25 - netdalys_1;
diff_netdalys_26 = netdalys_26 - netdalys_1;
*/


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

proc means data=c  mean;var 
/*diff_dcost_20y_2*/	diff_dcost_20y_3		diff_dcost_20y_4		diff_dcost_20y_5	
diff_dcost_20y_6 		diff_dcost_20y_7		diff_dcost_20y_8		diff_dcost_20y_9		diff_dcost_20y_10
diff_dcost_20y_11		diff_dcost_20y_12		diff_dcost_20y_13		diff_dcost_20y_14		diff_dcost_20y_15	
diff_dcost_20y_16		diff_dcost_20y_17		diff_dcost_20y_18		/*diff_dcost_20y_19*/		diff_dcost_20y_20;
*output out=means_costs_20y mean=;
run;
proc means data=b  mean;var 
/*diff_dcost_50y_2*/	diff_dcost_50y_3		diff_dcost_50y_4		diff_dcost_50y_5	
diff_dcost_50y_6 		diff_dcost_50y_7		diff_dcost_50y_8		diff_dcost_50y_9		diff_dcost_50y_10
diff_dcost_50y_11		diff_dcost_50y_12		diff_dcost_50y_13		diff_dcost_50y_14		diff_dcost_50y_15	
diff_dcost_50y_16		diff_dcost_50y_17		diff_dcost_50y_18		/*diff_dcost_50y_19*/		diff_dcost_50y_20;
output out=means_costs_50y mean=;
run;



***Absolute costs and differences;
proc means n mean lclm uclm;
var dcost_24_74_1 dcost_24_74_2 diff_dcost
	dart_cost_y_24_74_1 dart_cost_y_24_74_2  diff_artcost
	dtest_cost_24_74_1 dtest_cost_24_74_2 diff_testcost 
	dtest_cost_sw_24_74_1 dtest_cost_sw_24_74_2 diff_testcost_sw
	oth_prog_costs_1 oth_prog_costs_2 diff_oth_prog_costs
;run;

***DALYs;
proc means n mean lclm uclm;
var	ddaly_24_74_1 ddaly_24_74_2 diff_ddaly;
run;

***Since DALYs are averted and costs are saved, no need to calculate an ICER;
proc means n mean lclm uclm;
var ICER;RUN;

proc means n mean lclm uclm;var
netdalys_sis netdalys_amt diff_netdalys;run;


***Identifying when AMETHIST becomes CE;
proc means n mean lclm uclm;
var	diff_dcost diff_ddaly diff_dcost5yAS diff_ddaly5yAS  diff_dcost10yAS diff_ddaly10yAS diff_dcost15yAS diff_ddaly15yAS
diff_dcost20yAS diff_ddaly20yAS diff_dcost25yAS diff_ddaly25yAS diff_dcost30yAS diff_ddaly30yAS diff_dcost35yAS diff_ddaly35yAS
diff_dcost40yAS diff_ddaly40yAS diff_dcost45yAS diff_ddaly45yAS diff_dcost50yAS diff_ddaly50yAS;
run;

**After 15y, costs are saved and DALYs averted. Check actual costs and DALYs to make sure this is correct;
proc means n mean lclm uclm;
var	dcost_24_39_2 dcost_24_39_1 ddaly_24_39_2 ddaly_24_39_1  diff_dcost15yAS diff_ddaly15yAS;
run;


***Identifying when Sisters becomes CE compared to discontinuation;
proc means n mean lclm uclm;
var	diff_dcost diff_ddaly diff_dcost5ySD diff_ddaly5ySD  diff_dcost10ySD diff_ddaly10ySD diff_dcost15ySD diff_ddaly15ySD
diff_dcost20ySD diff_ddaly20ySD diff_dcost25ySD diff_ddaly25ySD diff_dcost30ySD diff_ddaly30ySD diff_dcost35ySD diff_ddaly35ySD
diff_dcost40ySD diff_ddaly40ySD diff_dcost45ySD diff_ddaly45ySD diff_dcost50ySD diff_ddaly50ySD;
run;


***Breakdown of costs;
proc means n mean lclm uclm;var
dcost_24_74_1
dart_cost_y_24_74_1
d_clin_costs_1
dcd4_cost_24_74_1 
dvl_cost_24_74_1 
dvis_cost_24_74_1 
dres_cost_24_74_1 
dtest_cost_24_74_1 
dcost_drug_level_test_24_74_1 
dcost_circ_24_74_1 
dcost_condom_dn_24_74_1 
dcost_avail_self_test_24_74_1 
dcost_prep_visit_oral_24_74_1 
dcost_prep_oral_24_74_1 
dcost_prep_visit_inj_24_74_1
dcost_prep_inj_24_74_1 	
dcost_sisprog__24_74_1
total_prep_1

dcost_24_74_2
dart_cost_y_24_74_2
d_clin_costs_2
dcd4_cost_24_74_2 
dvl_cost_24_74_2 
dvis_cost_24_74_2 
dres_cost_24_74_2 
dtest_cost_24_74_2 
dcost_drug_level_test_24_74_2 
dcost_circ_24_74_2 
dcost_condom_dn_24_74_2 
dcost_avail_self_test_24_74_2 
dcost_prep_visit_oral_24_74_2 
dcost_prep_oral_24_74_2 
dcost_prep_visit_inj_24_74_2
dcost_prep_inj_24_74_2 	
dcost_amtprog__24_74_2
total_prep_2

dcost_24_74_3
dart_cost_y_24_74_3
d_clin_costs_3
dcd4_cost_24_74_3 
dvl_cost_24_74_3 
dvis_cost_24_74_3 
dres_cost_24_74_3 
dtest_cost_24_74_3 
dcost_drug_level_test_24_74_3 
dcost_circ_24_74_3 
dcost_condom_dn_24_74_3 
dcost_avail_self_test_24_74_3 
dcost_prep_visit_oral_24_74_3 
dcost_prep_oral_24_74_3 
dcost_prep_visit_inj_24_74_3
dcost_prep_inj_24_74_3 
total_prep_3
;
run;



***ANALYSING THE IMPACT OF FUNDING CUTS - OPTION 3;

data one;
set a;

***table 3 - outputs in 2030 for Sisters and Sisters + Amethist;
proc means n p50 mean p5 p95;var
/*Current SW program*/
p_sw_prog_vis_30_1  p_tested_past_year_sw_30_1	p_tested_swprog_30_1
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549__30_1	prevalence1549__30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000__30_1 

/*Discontinuation*/
p_sw_prog_vis_30_3  p_tested_past_year_sw_30_3 p_tested_swprog_30_3
p_diag_sw_30_3		p_onart_diag_sw_30_3	p_onart_vl1000_sw_30_3		p_fsw_newp0__30_3	prop_sw_onprep_30_3
p_sti_sw_30_3		incidence_sw_30_3	prevalence_sw_30_3
incidence1549__30_3	prevalence1549__30_3		p_diag_30_3	  p_onart_diag_30_3   p_onart_vl1000__30_3

;
run;

proc means n p50 mean p5 p95;var prop_sw_onprep_inj_30_1 prop_sw_onprep_oral_30_1;run;

data two;
set one;


****Cost effectiveness;
/*
_1=Sisters
_2=Amethist
_3=Discontinuation;
*/

*difference in costs KP-discont;
diff_dcost = dcost_24_74_1 - dcost_24_74_3;
diff_artcost= dart_cost_y_24_74_1 - dart_cost_y_24_74_3;
diff_testcost = dtest_cost_24_74_1 - dtest_cost_24_74_3;
diff_testcost_sw = dtest_cost_sw_24_74_1 - dtest_cost_sw_24_74_3;
diff_dcost_sisprog = dcost_sisprog__24_74_1-0;

*difference in dalys (dalys averted);
diff_ddaly = ddaly_24_74_1 - ddaly_24_74_3;

***DALYs averted * CET - this gives max cost for SW prog to be CE
   (multiplied by -1 since we want to cost the DALYs averted rather than the difference which is negative);
dalys_avert_x_CET = (diff_ddaly * 0.0005)*-1;

***Max cost of a SW program - additional $m paid for averting DALYs + initial cost savings;
maxcost= (diff_dcost)*-1 +  dalys_avert_x_CET;

*net dalys using $500;
netdalys_sis =  ddaly_24_74_1 + (dcost_24_74_1)/0.0005;
netdalys_discon =  ddaly_24_74_3 + (dcost_24_74_3)/0.0005;*expect dalys to be lower here;

*net dalys averted;
diff_netdalys = netdalys_sis - netdalys_discon; *take absolute number;

*net monetary benefit (Dalys * cost-effectivenss threshold) + costs;
nmb_sis = (ddaly_24_74_1*0.0005) + dcost_24_74_1;
nmb_discon= (ddaly_24_74_3*0.0005) + dcost_24_74_3;
diff_nmb = nmb_sis - nmb_discon;


diff_cost = dcost_24_74_1 - dcost_24_74_3;
ICER = (diff_cost/diff_ddaly)*1000000;



***Absolute costs and differences;
proc means n mean lclm uclm;
var dcost_24_74_1 dcost_24_74_3 diff_dcost
	dart_cost_y_24_74_1 dart_cost_y_24_74_3  diff_artcost
	dtest_cost_24_74_1 dtest_cost_24_74_3 diff_testcost 
	dtest_cost_sw_24_74_1 dtest_cost_sw_24_74_3 diff_testcost_sw
	dcost_sisprog__24_74_1 diff_dcost_sisprog;
;run;

***DALYs;
proc means n mean lclm uclm;
var	ddaly_24_74_1 ddaly_24_74_3 diff_ddaly;
run;

***Since DALYs are averted and costs are saved, no need to calculate an ICER;
proc means n mean lclm uclm;
var ICER;RUN;

proc means n mean lclm uclm;var
netdalys_sis netdalys_discon diff_netdalys;run;
