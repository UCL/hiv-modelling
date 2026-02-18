libname a "C:\Users\Lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_MLW";


data a;
set a.wide_gen_mlw_29_01_2026_ops;;
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
2 = Low impact FSW program at SQ level;
3 = VMMC;
4 = VMMC scale up;
5 = KP Oral PrEP continuation;
6 = KP Oral PrEP continuation plus intro up of Len;
7 = KP Oral PrEP continuation plus scale up of Len;
8 = FSW Oral PrEP continuation;
9 = AGYW Oral PrEP continuation;
10 = MSM Oral PrEP continuation;
11 = FSW Oral PrEP continuation plus intro up of Len;
12 = AGYW Oral PrEP continuation plus intro up of Len;
13 = MSM Oral PrEP continuation plus intro up of Len;
14 = FSW Oral PrEP continuation plus scale up of Len;
15 = AGYW Oral PrEP continuation plus scale up of Len;
16 = MSM Oral PrEP continuation plus scale up of Len;
17 = Adherence support;
18 = CD4 and VL testing;

*/

***Difference in discounted new infections and deaths in 5, 20 and 50 years between selected options;

* Infections;

* 20 years;
d_n_new_inf_20y_2  = n_new_inf_26_46_1 - n_new_inf_26_46_2;
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
*d_n_new_inf_20y_20 = n_new_inf_26_46_1 - n_new_inf_26_46_20;


* 50 years;
d_n_new_inf_50y_2  = n_new_inf_26_76_1 - n_new_inf_26_76_2;
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
*d_n_new_inf_50y_20 = n_new_inf_26_76_1 - n_new_inf_26_76_20;

*Deaths;

* 20 years;
d_n_death_hivrel_20y_2  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_2;
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
*d_n_death_hivrel_20y_20 = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_20;


* 50 years;
d_n_death_hivrel_50y_2  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_2;
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
*d_n_death_hivrel_50y_20 = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_20;

*Difference in number of new infections over 20 and 50 years;
*Using output statement in order to merge the 3 year groups later);
proc means data=b  mean;var 
d_n_new_inf_20y_2	d_n_new_inf_20y_3			d_n_new_inf_20y_4		d_n_new_inf_20y_5	
d_n_new_inf_20y_6 		d_n_new_inf_20y_7		d_n_new_inf_20y_8		d_n_new_inf_20y_9		d_n_new_inf_20y_10
d_n_new_inf_20y_11		d_n_new_inf_20y_12		d_n_new_inf_20y_13		d_n_new_inf_20y_14		d_n_new_inf_20y_15	
d_n_new_inf_20y_16		d_n_new_inf_20y_17		d_n_new_inf_20y_18;
output out=means_new_inf_20y mean=;
run;
proc means data=b  mean;var 
d_n_new_inf_50y_2		d_n_new_inf_50y_3		d_n_new_inf_50y_4		d_n_new_inf_50y_5	
d_n_new_inf_50y_6 		d_n_new_inf_50y_7		d_n_new_inf_50y_8		d_n_new_inf_50y_9		d_n_new_inf_50y_10
d_n_new_inf_50y_11		d_n_new_inf_50y_12		d_n_new_inf_50y_13		d_n_new_inf_50y_14		d_n_new_inf_50y_15	
d_n_new_inf_50y_16		d_n_new_inf_50y_17		d_n_new_inf_50y_18;	
output out=means_new_inf_50y mean=;
run;

proc means data=b  mean;var 
d_n_death_hivrel_20y_2		d_n_death_hivrel_20y_3		d_n_death_hivrel_20y_4		d_n_death_hivrel_20y_5	
d_n_death_hivrel_20y_6 		d_n_death_hivrel_20y_7		d_n_death_hivrel_20y_8		d_n_death_hivrel_20y_9		d_n_death_hivrel_20y_10
d_n_death_hivrel_20y_11		d_n_death_hivrel_20y_12		d_n_death_hivrel_20y_13		d_n_death_hivrel_20y_14		d_n_death_hivrel_20y_15	
d_n_death_hivrel_20y_16		d_n_death_hivrel_20y_17		d_n_death_hivrel_20y_18;
output out=means_death_hivrel_20y mean=;
run;
proc means data=b  mean;var 
d_n_death_hivrel_50y_2		d_n_death_hivrel_50y_3		d_n_death_hivrel_50y_4		d_n_death_hivrel_50y_5	
d_n_death_hivrel_50y_6 		d_n_death_hivrel_50y_7		d_n_death_hivrel_50y_8		d_n_death_hivrel_50y_9		d_n_death_hivrel_50y_10
d_n_death_hivrel_50y_11		d_n_death_hivrel_50y_12		d_n_death_hivrel_50y_13		d_n_death_hivrel_50y_14		d_n_death_hivrel_50y_15	
d_n_death_hivrel_50y_16		d_n_death_hivrel_50y_17		d_n_death_hivrel_50y_18;
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
*diff_dcost_20y_19 = dcost_26_46_19 - dcost_26_46_1;
*diff_dcost_20y_20 = dcost_26_46_20 - dcost_26_46_1;


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
*diff_dcost_50y_19 = dcost_26_76_19 - dcost_26_76_1;
*diff_dcost_50y_20 = dcost_26_76_20 - dcost_26_76_1;

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
*diff_dnewinf_20y_19 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_19;
*diff_dnewinf_20y_20 = d_n_new_inf_26_46_1 - d_n_new_inf_26_46_20;

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
*diff_dnewinf_50y_19 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_19;
*diff_dnewinf_50y_20 = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_20;

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
*diff_ddaly_20y_19 = ddaly_26_46_1 - ddaly_26_46_19;
*diff_ddaly_20y_20 = ddaly_26_46_1 - ddaly_26_46_20;


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
*diff_ddaly_50y_19 = ddaly_26_76_1 - ddaly_26_76_19;
*diff_ddaly_50y_20 = ddaly_26_76_1 - ddaly_26_76_20;

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
*netdalys_20y_19 =  ddaly_26_46_19 + (dcost_26_46_19)/0.0003;
*netdalys_20y_20 =  ddaly_26_46_20 + (dcost_26_46_20)/0.0003;

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
*diff_netdalys_20y_19 = netdalys_20y_19 - netdalys_20y_1;
*diff_netdalys_20y_20 = netdalys_20y_20 - netdalys_20y_1;

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
*netdalys_50y_19 =  ddaly_26_76_19 + (dcost_26_76_19)/0.0003;
*netdalys_50y_20 =  ddaly_26_76_20 + (dcost_26_76_20)/0.0003;

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
*diff_netdalys_50y_19 = netdalys_50y_19 - netdalys_50y_1;
*diff_netdalys_50y_20 = netdalys_50y_20 - netdalys_50y_1;


***INSTEAD OF CALCULATING THE MEAN OF THE MEANS, TAKE MEAN COSTS AND DIVIDE BY MEAN DALYS MANUALLY;
***THIS MEANS NOT USING THE ICER OR COST PER INFECTION AVERTED CODE;

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
*ICER_20y_19 = (diff_dcost_20y_19/diff_ddaly_20y_19)*1000000;
*ICER_20y_20 = (diff_dcost_20y_20/diff_ddaly_20y_20)*1000000;

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
*ICER_50y_19 = (diff_dcost_50y_19/diff_ddaly_50y_19)*1000000;
*ICER_50y_20 = (diff_dcost_50y_20/diff_ddaly_50y_20)*1000000;


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
*cost_inf_avtd_20y_19 = (diff_dcost_20y_19/diff_dnewinf_20y_19)*1000000;
*cost_inf_avtd_20y_20 = (diff_dcost_20y_20/diff_dnewinf_20y_20)*1000000;

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
*cost_inf_avtd_50y_19 = (diff_dcost_50y_19/diff_dnewinf_50y_19)*1000000;
*cost_inf_avtd_50y_20 = (diff_dcost_50y_20/diff_dnewinf_50y_20)*1000000;


***Difference in discounted costs;
proc means data=c  mean;var 
diff_dcost_20y_2		diff_dcost_20y_3		diff_dcost_20y_4		diff_dcost_20y_5	
diff_dcost_20y_6 		diff_dcost_20y_7		diff_dcost_20y_8		diff_dcost_20y_9		diff_dcost_20y_10
diff_dcost_20y_11		diff_dcost_20y_12		diff_dcost_20y_13		diff_dcost_20y_14		diff_dcost_20y_15	
diff_dcost_20y_16		diff_dcost_20y_17		diff_dcost_20y_18		/*diff_dcost_20y_19		diff_dcost_20y_20*/;
output out=means_costs_20y mean=;
run;
proc means data=c  mean;var 
diff_dcost_50y_2		diff_dcost_50y_3		diff_dcost_50y_4		diff_dcost_50y_5	
diff_dcost_50y_6 		diff_dcost_50y_7		diff_dcost_50y_8		diff_dcost_50y_9		diff_dcost_50y_10
diff_dcost_50y_11		diff_dcost_50y_12		diff_dcost_50y_13		diff_dcost_50y_14		diff_dcost_50y_15	
diff_dcost_50y_16		diff_dcost_50y_17		diff_dcost_50y_18		/*diff_dcost_50y_19 	diff_dcost_50y_20*/;
output out=means_costs_50y mean=;
run;

***DALYs averted;
proc means data=c  mean;var 
diff_ddaly_20y_2		diff_ddaly_20y_3		diff_ddaly_20y_4		diff_ddaly_20y_5	
diff_ddaly_20y_6 		diff_ddaly_20y_7		diff_ddaly_20y_8		diff_ddaly_20y_9		diff_ddaly_20y_10
diff_ddaly_20y_11		diff_ddaly_20y_12		diff_ddaly_20y_13		diff_ddaly_20y_14		diff_ddaly_20y_15	
diff_ddaly_20y_16		diff_ddaly_20y_17		diff_ddaly_20y_18		/*diff_ddaly_20y_19		diff_ddaly_20y_20*/;
output out=means_dalys_20y mean=;
run;
proc means data=c  mean;var 
diff_ddaly_50y_2		diff_ddaly_50y_3		diff_ddaly_50y_4		diff_ddaly_50y_5	
diff_ddaly_50y_6 		diff_ddaly_50y_7		diff_ddaly_50y_8		diff_ddaly_50y_9		diff_ddaly_50y_10
diff_ddaly_50y_11		diff_ddaly_50y_12		diff_ddaly_50y_13		diff_ddaly_50y_14		diff_ddaly_50y_15	
diff_ddaly_50y_16		diff_ddaly_50y_17		diff_ddaly_50y_18		/*diff_ddaly_50y_19		diff_ddaly_50y_20*/;
output out=means_dalys_50y mean=;
run;

proc means data=c  mean;var 
/*icer_20y_2*/	icer_20y_3		icer_20y_4		icer_20y_5	
icer_20y_6 		icer_20y_7		icer_20y_8		icer_20y_9		icer_20y_10
icer_20y_11		icer_20y_12		icer_20y_13		icer_20y_14		icer_20y_15	
icer_20y_16		icer_20y_17		icer_20y_18		/*icer_20y_19	icer_20y_20*/;
output out=means_icer_20y mean=;
run;
proc means data=c  mean;var 
icer_50y_2		icer_50y_3		icer_50y_4		icer_50y_5	
icer_50y_6 		icer_50y_7		icer_50y_8		icer_50y_9		icer_50y_10
icer_50y_11		icer_50y_12		icer_50y_13		icer_50y_14		icer_50y_15	
icer_50y_16		icer_50y_17		icer_50y_18		/*icer_50y_19	icer_50y_20*/;
output out=means_icer_50y mean=;
run;

proc means data=c  mean;var 
diff_netdalys_20y_2			diff_netdalys_20y_3		diff_netdalys_20y_4		diff_netdalys_20y_5	
diff_netdalys_20y_6 		diff_netdalys_20y_7		diff_netdalys_20y_8		diff_netdalys_20y_9		diff_netdalys_20y_10
diff_netdalys_20y_11		diff_netdalys_20y_12	diff_netdalys_20y_13	diff_netdalys_20y_14	diff_netdalys_20y_15	
diff_netdalys_20y_16		diff_netdalys_20y_17	diff_netdalys_20y_18	/*diff_netdalys_20y_19	diff_netdalys_20y_20*/;
output out=means_diff_netdalys_20y mean=;
run;
proc means data=c  mean;var 
diff_netdalys_50y_2		diff_netdalys_50y_3		diff_netdalys_50y_4		diff_netdalys_50y_5	
diff_netdalys_50y_6 	diff_netdalys_50y_7		diff_netdalys_50y_8		diff_netdalys_50y_9		diff_netdalys_50y_10
diff_netdalys_50y_11	diff_netdalys_50y_12	diff_netdalys_50y_13	diff_netdalys_50y_14	diff_netdalys_50y_15	
diff_netdalys_50y_16	diff_netdalys_50y_17	diff_netdalys_50y_18	/*diff_netdalys_50y_19	diff_netdalys_50y_20*/;
output out=means_diff_netdalys_50y mean=;
run;

***MANUALLY CALCULATE ICER;
proc transpose data=means_costs_20y out=t_costs_20y(rename=(col1=mean_costs_20y));run;
proc transpose data=means_costs_50y out=t_costs_50y(rename=(col1=mean_costs_50y));run;
proc transpose data=means_dalys_20y out=t_dalys_20y(rename=(col1=mean_dalys_20y));run;
proc transpose data=means_dalys_50y out=t_dalys_50y(rename=(col1=mean_dalys_50y));run;
/*proc transpose data=means_icer_20y out=t_icer_20y(rename=(col1=mean_icer_20y));run;
proc transpose data=means_icer_50y out=t_icer_50y(rename=(col1=mean_icer_50y));run;*/
proc transpose data=means_diff_netdalys_20y out=t_diff_netdalys_20y(rename=(col1=mean_diff_netdalys_20y));run;
proc transpose data=means_diff_netdalys_50y out=t_diff_netdalys_50y(rename=(col1=mean_diff_netdalys_50y));run;
*/

**Use html so can copy and paste into Excel (could automate but this gives more flexibility);
ods html;
data means_costs_dalys;
    merge t_costs_20y(rename=(_NAME_=scenario))
		  t_dalys_20y
		  t_diff_netdalys_20y
          t_costs_50y
		  t_dalys_50y
		  t_diff_netdalys_50y;
drop _name_;
run;

proc print data=means_costs_dalys noobs;
run;



proc means data=c  mean;var 
diff_dnewinf_20y_2		diff_dnewinf_20y_3		diff_dnewinf_20y_4		diff_dnewinf_20y_5	
diff_dnewinf_20y_6 		diff_dnewinf_20y_7		diff_dnewinf_20y_8		diff_dnewinf_20y_9		diff_dnewinf_20y_10
diff_dnewinf_20y_11		diff_dnewinf_20y_12		diff_dnewinf_20y_13		diff_dnewinf_20y_14		diff_dnewinf_20y_15	
diff_dnewinf_20y_16		diff_dnewinf_20y_17		diff_dnewinf_20y_18		/*diff_dnewinf_20y_19	diff_dnewinf_20y_20*/;
output out=means_dnewinf_20y mean=;
run;
proc means data=c  mean;var 
diff_dnewinf_50y_2		diff_dnewinf_50y_3		diff_dnewinf_50y_4		diff_dnewinf_50y_5	
diff_dnewinf_50y_6 		diff_dnewinf_50y_7		diff_dnewinf_50y_8		diff_dnewinf_50y_9		diff_dnewinf_50y_10
diff_dnewinf_50y_11		diff_dnewinf_50y_12		diff_dnewinf_50y_13		diff_dnewinf_50y_14		diff_dnewinf_50y_15	
diff_dnewinf_50y_16		diff_dnewinf_50y_17		diff_dnewinf_50y_18		/*diff_dnewinf_50y_19	diff_dnewinf_50y_20*/;
output out=means_dnewinf_50y mean=;
run;
***Cost per infection averted;
proc means data=c  mean;var 
cost_inf_avtd_20y_2`		cost_inf_avtd_20y_3		cost_inf_avtd_20y_4		cost_inf_avtd_20y_5	
cost_inf_avtd_20y_6 		cost_inf_avtd_20y_7		cost_inf_avtd_20y_8		cost_inf_avtd_20y_9		cost_inf_avtd_20y_10
cost_inf_avtd_20y_11		cost_inf_avtd_20y_12	cost_inf_avtd_20y_13	cost_inf_avtd_20y_14	cost_inf_avtd_20y_15	
cost_inf_avtd_20y_16		cost_inf_avtd_20y_17	cost_inf_avtd_20y_18	/*cost_inf_avtd_20y_19	cost_inf_avtd_20y_20*/;
output out=means_inf_avt_20y mean=;
run;
proc means data=c  mean;var 
cost_inf_avtd_50y_2			cost_inf_avtd_50y_3		cost_inf_avtd_50y_4		cost_inf_avtd_50y_5	
cost_inf_avtd_50y_6 		cost_inf_avtd_50y_7		cost_inf_avtd_50y_8		cost_inf_avtd_50y_9		cost_inf_avtd_50y_10
cost_inf_avtd_50y_11		cost_inf_avtd_50y_12	cost_inf_avtd_50y_13	cost_inf_avtd_50y_14	cost_inf_avtd_50y_15	
cost_inf_avtd_50y_16		cost_inf_avtd_50y_17	cost_inf_avtd_50y_18	/*cost_inf_avtd_50y_19	cost_inf_avtd_50y_20*/;
output out=means_inf_avt_50y mean=;
run;



proc transpose data=means_dnewinf_20y out=t_dnewinf_20y(rename=(col1=mean_dnewinf_20y));run;
proc transpose data=means_dnewinf_50y out=t_dnewinf_50y(rename=(col1=mean_dnewinf_50y));run;
/*proc transpose data=means_inf_avt_20y out=t_inf_avt_20y(rename=(col1=mean_inf_avt_20y));run;
proc transpose data=means_inf_avt_50y out=t_inf_avt_50y(rename=(col1=mean_inf_avt_50y));run;
*/
ods html;
data means_inf_avtd;
    merge t_dnewinf_20y(rename=(_NAME_=scenario))

		  t_dnewinf_50y;
drop _name_;
run;

proc print data=means_inf_avtd noobs;
run;

ods html;

***budget impact;
data budget;
set a;

***Need to do this for 20 years. The macro below should work;
/*
diff_cost_26y_2  = cost_26_2  - cost_26_1;
diff_cost_26y_3  = cost_26_3  - cost_26_1;
diff_cost_26y_4  = cost_26_4  - cost_26_1;
diff_cost_26y_5  = cost_26_5  - cost_26_1;
diff_cost_26y_6  = cost_26_6  - cost_26_1;
diff_cost_26y_7  = cost_26_7  - cost_26_1;
diff_cost_26y_8  = cost_26_8  - cost_26_1;
diff_cost_26y_9  = cost_26_9  - cost_26_1;
diff_cost_26y_10 = cost_26_10 - cost_26_1;
diff_cost_26y_11 = cost_26_11 - cost_26_1;
diff_cost_26y_12 = cost_26_12 - cost_26_1;
diff_cost_26y_13 = cost_26_13 - cost_26_1;
diff_cost_26y_14 = cost_26_14 - cost_26_1;
diff_cost_26y_15 = cost_26_15 - cost_26_1;
diff_cost_26y_16 = cost_26_16 - cost_26_1;
diff_cost_26y_17 = cost_26_17 - cost_26_1;
diff_cost_26y_18 = cost_26_18 - cost_26_1;
diff_cost_26y_19 = cost_26_19 - cost_26_1;
diff_cost_26y_20 = cost_26_20 - cost_26_1;
*/


%macro diff_cost(start_y=26, end_y=46, start_i=2, end_i=20);

%do y = &start_y %to &end_y;
  %do i = &start_i %to &end_i;
    diff_cost_&y.y_&i = cost_&y._&i - cost_&y._1;
  %end;
%end;

%mend diff_cost;

***calls the macro;
%diff_cost(start_y=26, end_y=46, start_i=2, end_i=20);

proc means data=budget mean;var 
cost_26_1 cost_27_1 cost_28_1 cost_29_1 cost_30_1 cost_31_1 cost_32_1 cost_33_1 cost_34_1 cost_35_1 cost_36_1 cost_37_1 
cost_38_1 cost_39_1 cost_40_1 cost_41_1 cost_42_1 cost_43_1 cost_44_1 cost_45_1 cost_46_1 ;
output out=sc1 mean=;run;
data sc1; set sc1; group=1;
rename 
cost_26_1 = cost_26		cost_27_1 = cost_27		cost_28_1 = cost_28		cost_29_1 = cost_29		cost_30_1 = cost_30
cost_31_1 = cost_31		cost_32_1 = cost_32		cost_33_1 = cost_33		cost_34_1 = cost_34		cost_35_1 = cost_35
cost_36_1 = cost_36		cost_37_1 = cost_37		cost_38_1 = cost_38		cost_39_1 = cost_39		cost_40_1 = cost_40
cost_41_1 = cost_41		cost_42_1 = cost_42		cost_43_1 = cost_43		cost_44_1 = cost_44		cost_45_1 = cost_45
cost_46_1 = cost_46;
run;
/* LOW SW PROG INCORRECTLY CODED;
proc means data=budget mean;var 
cost_26_2 cost_26_2 cost_27_2 cost_28_2 cost_29_2 cost_30_2 cost_31_2 cost_32_2 cost_33_2 cost_34_2 cost_35_2 cost_36_2 cost_37_2 
cost_38_2 cost_39_2 cost_40_2 cost_41_2 cost_42_2 cost_43_2 cost_44_2 cost_45_2 cost_46_2;
output out=sc2 mean=;run;
data sc2; set sc2; group=2;
rename 
cost_26_2 = cost_26		cost_27_2 = cost_27		cost_28_2 = cost_28		cost_29_2 = cost_29		cost_30_2 = cost_30
cost_31_2 = cost_31		cost_32_2 = cost_32		cost_33_2 = cost_33		cost_34_2 = cost_34		cost_35_2 = cost_35
cost_36_2 = cost_36		cost_37_2 = cost_37		cost_38_2 = cost_38		cost_39_2 = cost_39		cost_40_2 = cost_40
cost_41_2 = cost_41		cost_42_2 = cost_42		cost_43_2 = cost_43		cost_44_2 = cost_44		cost_45_2 = cost_45
cost_46_2 = cost_46;
run;
*/
proc means data=budget mean;var 
cost_26_3 cost_27_3 cost_28_3 cost_29_3 cost_30_3 cost_31_3 cost_32_3 cost_33_3 cost_34_3 cost_35_3 cost_36_3 cost_37_3
cost_38_3 cost_39_3 cost_40_3 cost_41_3 cost_42_3 cost_43_3 cost_44_3 cost_45_3 cost_46_3;
output out=sc3 mean=;run;
data sc3; set sc3; group=3;
rename 
cost_26_3 = cost_26		cost_27_3 = cost_27		cost_28_3 = cost_28		cost_29_3 = cost_29		cost_30_3 = cost_30
cost_31_3 = cost_31		cost_32_3 = cost_32		cost_33_3 = cost_33		cost_34_3 = cost_34		cost_35_3 = cost_35
cost_36_3 = cost_36		cost_37_3 = cost_37		cost_38_3 = cost_38		cost_39_3 = cost_39		cost_40_3 = cost_40
cost_41_3 = cost_41		cost_42_3 = cost_42		cost_43_3 = cost_43		cost_44_3 = cost_44		cost_45_3 = cost_45
cost_46_3 = cost_46;
run;

proc means data=budget mean;var 
cost_26_4 cost_27_4 cost_28_4 cost_29_4 cost_30_4 cost_31_4 cost_32_4 cost_33_4 cost_34_4 cost_35_4 cost_36_4 cost_37_4
cost_38_4 cost_39_4 cost_40_4 cost_41_4 cost_42_4 cost_43_4 cost_44_4 cost_45_4 cost_46_4;
output out=sc4 mean=;run;
data sc4; set sc4; group=4;
rename 
cost_26_4 = cost_26		cost_27_4 = cost_27		cost_28_4 = cost_28		cost_29_4 = cost_29		cost_30_4 = cost_30
cost_31_4 = cost_31		cost_32_4 = cost_32		cost_33_4 = cost_33		cost_34_4 = cost_34		cost_35_4 = cost_35
cost_36_4 = cost_36		cost_37_4 = cost_37		cost_38_4 = cost_38		cost_39_4 = cost_39		cost_40_4 = cost_40
cost_41_4 = cost_41		cost_42_4 = cost_42		cost_43_4 = cost_43		cost_44_4 = cost_44		cost_45_4 = cost_45
cost_46_4 = cost_46;
run;

proc means data=budget mean;var 
cost_26_5 cost_27_5 cost_28_5 cost_29_5 cost_30_5 cost_31_5 cost_32_5 cost_33_5 cost_34_5 cost_35_5 cost_36_5 cost_37_5 
cost_38_5 cost_39_5 cost_40_5 cost_41_5 cost_42_5 cost_43_5 cost_44_5 cost_45_5 cost_46_5;
output out=sc5 mean=;run;
data sc5; set sc5; group=5;
rename 
cost_26_5 = cost_26		cost_27_5 = cost_27		cost_28_5 = cost_28		cost_29_5 = cost_29		cost_30_5 = cost_30
cost_31_5 = cost_31		cost_32_5 = cost_32		cost_33_5 = cost_33		cost_34_5 = cost_34		cost_35_5 = cost_35
cost_36_5 = cost_36		cost_37_5 = cost_37		cost_38_5 = cost_38		cost_39_5 = cost_39		cost_40_5 = cost_40
cost_41_5 = cost_41		cost_42_5 = cost_42		cost_43_5 = cost_43		cost_44_5 = cost_44		cost_45_5 = cost_45
cost_46_5 = cost_46;
run;

proc means data=budget mean;var 
cost_26_6 cost_27_6 cost_28_6 cost_29_6 cost_30_6 cost_31_6 cost_32_6 cost_33_6 cost_34_6 cost_35_6 cost_36_6 cost_37_6 
cost_38_6 cost_39_6 cost_40_6 cost_41_6 cost_42_6 cost_43_6 cost_44_6 cost_45_6 cost_46_6;
output out=sc6 mean=;run;
data sc6; set sc6; group=6;
rename 
cost_26_6 = cost_26		cost_27_6 = cost_27		cost_28_6 = cost_28		cost_29_6 = cost_29		cost_30_6 = cost_30
cost_31_6 = cost_31		cost_32_6 = cost_32		cost_33_6 = cost_33		cost_34_6 = cost_34		cost_35_6 = cost_35
cost_36_6 = cost_36		cost_37_6 = cost_37		cost_38_6 = cost_38		cost_39_6 = cost_39		cost_40_6 = cost_40
cost_41_6 = cost_41		cost_42_6 = cost_42		cost_43_6 = cost_43		cost_44_6 = cost_44		cost_45_6 = cost_45
cost_46_6 = cost_46;
run;

proc means data=budget mean;var 
cost_26_7 cost_27_7 cost_28_7 cost_29_7 cost_30_7 cost_31_7 cost_32_7 cost_33_7 cost_34_7 cost_35_7 cost_36_7 cost_37_7 
cost_38_7 cost_39_7 cost_40_7 cost_41_7 cost_42_7 cost_43_7 cost_44_7 cost_45_7 cost_46_7;
output out=sc7 mean=;run;
data sc7; set sc7; group=7;
rename 
cost_26_7 = cost_26		cost_27_7 = cost_27		cost_28_7 = cost_28		cost_29_7 = cost_29		cost_30_7 = cost_30
cost_31_7 = cost_31		cost_32_7 = cost_32		cost_33_7 = cost_33		cost_34_7 = cost_34		cost_35_7 = cost_35
cost_36_7 = cost_36		cost_37_7 = cost_37		cost_38_7 = cost_38		cost_39_7 = cost_39		cost_40_7 = cost_40
cost_41_7 = cost_41		cost_42_7 = cost_42		cost_43_7 = cost_43		cost_44_7 = cost_44		cost_45_7 = cost_45
cost_46_7 = cost_46;
run;

proc means data=budget mean;var 
cost_26_8 cost_27_8 cost_28_8 cost_29_8 cost_30_8 cost_31_8 cost_32_8 cost_33_8 cost_34_8 cost_35_8 cost_36_8 cost_37_8 
cost_38_8 cost_39_8 cost_40_8 cost_41_8 cost_42_8 cost_43_8 cost_44_8 cost_45_8 cost_46_8;
output out=sc8 mean=;run;
data sc8; set sc8; group=8;
rename 
cost_26_8 = cost_26		cost_27_8 = cost_27		cost_28_8 = cost_28		cost_29_8 = cost_29		cost_30_8 = cost_30
cost_31_8 = cost_31		cost_32_8 = cost_32		cost_33_8 = cost_33		cost_34_8 = cost_34		cost_35_8 = cost_35
cost_36_8 = cost_36		cost_37_8 = cost_37		cost_38_8 = cost_38		cost_39_8 = cost_39		cost_40_8 = cost_40
cost_41_8 = cost_41		cost_42_8 = cost_42		cost_43_8 = cost_43		cost_44_8 = cost_44		cost_45_8 = cost_45
cost_46_8 = cost_46;
run;

proc means data=budget mean;var 
cost_26_9 cost_27_9 cost_28_9 cost_29_9 cost_30_9 cost_31_9 cost_32_9 cost_33_9 cost_34_9 cost_35_9 cost_36_9 cost_37_9
cost_38_9 cost_39_9 cost_40_9 cost_41_9 cost_42_9 cost_43_9 cost_44_9 cost_45_9 cost_46_9;
output out=sc9 mean=;run;
data sc9; set sc9; group=9;
rename 
cost_26_9 = cost_26		cost_27_9 = cost_27		cost_28_9 = cost_28		cost_29_9 = cost_29		cost_30_9 = cost_30
cost_31_9 = cost_31		cost_32_9 = cost_32		cost_33_9 = cost_33		cost_34_9 = cost_34		cost_35_9 = cost_35
cost_36_9 = cost_36		cost_37_9 = cost_37		cost_38_9 = cost_38		cost_39_9 = cost_39		cost_40_9 = cost_40
cost_41_9 = cost_41		cost_42_9 = cost_42		cost_43_9 = cost_43		cost_44_9 = cost_44		cost_45_9 = cost_45
cost_46_9 = cost_46;
run;

proc means data=budget mean;var 
cost_26_10 cost_27_10 cost_28_10 cost_29_10 cost_30_10 cost_31_10 cost_32_10 cost_33_10 cost_34_10 cost_35_10 cost_36_10 
cost_37_10 cost_38_10 cost_39_10 cost_40_10 cost_41_10 cost_42_10 cost_43_10 cost_44_10 cost_45_10 cost_46_10;
output out=sc10 mean=;run;
data sc10; set sc10; group=10;
rename 
cost_26_10 = cost_26		cost_27_10 = cost_27		cost_28_10 = cost_28		cost_29_10 = cost_29		cost_30_10 = cost_30
cost_31_10 = cost_31		cost_32_10 = cost_32		cost_33_10 = cost_33		cost_34_10 = cost_34		cost_35_10 = cost_35
cost_36_10 = cost_36		cost_37_10 = cost_37		cost_38_10 = cost_38		cost_39_10 = cost_39		cost_40_10 = cost_40
cost_41_10 = cost_41		cost_42_10 = cost_42		cost_43_10 = cost_43		cost_44_10 = cost_44		cost_45_10 = cost_45
cost_46_10 = cost_46;
run;

proc means data=budget mean;var 
cost_26_11 cost_27_11 cost_28_11 cost_29_11 cost_30_11 cost_31_11 cost_32_11 cost_33_11 cost_34_11 cost_35_11 cost_36_11 
cost_37_11 cost_38_11 cost_39_11 cost_40_11 cost_41_11 cost_42_11 cost_43_11 cost_44_11 cost_45_11 cost_46_11;
output out=sc11 mean=;run;
data sc11; set sc11; group=11;
rename 
cost_26_11 = cost_26		cost_27_11 = cost_27		cost_28_11 = cost_28		cost_29_11 = cost_29		cost_30_11 = cost_30
cost_31_11 = cost_31		cost_32_11 = cost_32		cost_33_11 = cost_33		cost_34_11 = cost_34		cost_35_11 = cost_35
cost_36_11 = cost_36		cost_37_11 = cost_37		cost_38_11 = cost_38		cost_39_11 = cost_39		cost_40_11 = cost_40
cost_41_11 = cost_41		cost_42_11 = cost_42		cost_43_11 = cost_43		cost_44_11 = cost_44		cost_45_11 = cost_45
cost_46_11 = cost_46;
run;

proc means data=budget mean;var 
cost_26_12 cost_27_12 cost_28_12 cost_29_12 cost_30_12 cost_31_12 cost_32_12 cost_33_12 cost_34_12 cost_35_12 cost_36_12
cost_37_12 cost_38_12 cost_39_12 cost_40_12 cost_41_12 cost_42_12 cost_43_12 cost_44_12 cost_45_12 cost_46_12;
output out=sc12 mean=;run;
data sc12; set sc12; group=12;
rename 
cost_26_12 = cost_26		cost_27_12 = cost_27		cost_28_12 = cost_28		cost_29_12 = cost_29		cost_30_12 = cost_30
cost_31_12 = cost_31		cost_32_12 = cost_32		cost_33_12 = cost_33		cost_34_12 = cost_34		cost_35_12 = cost_35
cost_36_12 = cost_36		cost_37_12 = cost_37		cost_38_12 = cost_38		cost_39_12 = cost_39		cost_40_12 = cost_40
cost_41_12 = cost_41		cost_42_12 = cost_42		cost_43_12 = cost_43		cost_44_12 = cost_44		cost_45_12 = cost_45
cost_46_12 = cost_46;
run;

proc means data=budget mean;var 
cost_26_13 cost_27_13 cost_28_13 cost_29_13 cost_30_13 cost_31_13 cost_32_13 cost_33_13 cost_34_13 cost_35_13 cost_36_13 
cost_37_13 cost_38_13 cost_39_13 cost_40_13 cost_41_13 cost_42_13 cost_43_13 cost_44_13 cost_45_13 cost_46_13;
output out=sc13 mean=;run;
data sc13; set sc13; group=13;
rename 
cost_26_13 = cost_26		cost_27_13 = cost_27		cost_28_13 = cost_28		cost_29_13 = cost_29		cost_30_13 = cost_30
cost_31_13 = cost_31		cost_32_13 = cost_32		cost_33_13 = cost_33		cost_34_13 = cost_34		cost_35_13 = cost_35
cost_36_13 = cost_36		cost_37_13 = cost_37		cost_38_13 = cost_38		cost_39_13 = cost_39		cost_40_13 = cost_40
cost_41_13 = cost_41		cost_42_13 = cost_42		cost_43_13 = cost_43		cost_44_13 = cost_44		cost_45_13 = cost_45
cost_46_13 = cost_46;
run;

proc means data=budget mean;var 
cost_26_14 cost_27_14 cost_28_14 cost_29_14 cost_30_14 cost_31_14 cost_32_14 cost_33_14 cost_34_14 cost_35_14 cost_36_14
cost_37_14 cost_38_14 cost_39_14 cost_40_14 cost_41_14 cost_42_14 cost_43_14 cost_44_14 cost_45_14 cost_46_14;
output out=sc14 mean=;run;
data sc14; set sc14; group=14;
rename 
cost_26_14 = cost_26		cost_27_14 = cost_27		cost_28_14 = cost_28		cost_29_14 = cost_29		cost_30_14 = cost_30
cost_31_14 = cost_31		cost_32_14 = cost_32		cost_33_14 = cost_33		cost_34_14 = cost_34		cost_35_14 = cost_35
cost_36_14 = cost_36		cost_37_14 = cost_37		cost_38_14 = cost_38		cost_39_14 = cost_39		cost_40_14 = cost_40
cost_41_14 = cost_41		cost_42_14 = cost_42		cost_43_14 = cost_43		cost_44_14 = cost_44		cost_45_14 = cost_45
cost_46_14 = cost_46;
run;

proc means data=budget mean;var 
cost_26_15 cost_27_15 cost_28_15 cost_29_15 cost_30_15 cost_31_15 cost_32_15 cost_33_15 cost_34_15 cost_35_15 cost_36_15
cost_37_15 cost_38_15 cost_39_15 cost_40_15 cost_41_15 cost_42_15 cost_43_15 cost_44_15 cost_45_15 cost_46_15;
output out=sc15 mean=;run;
data sc15; set sc15; group=15;
rename 
cost_26_15 = cost_26		cost_27_15 = cost_27		cost_28_15 = cost_28		cost_29_15 = cost_29		cost_30_15 = cost_30
cost_31_15 = cost_31		cost_32_15 = cost_32		cost_33_15 = cost_33		cost_34_15 = cost_34		cost_35_15 = cost_35
cost_36_15 = cost_36		cost_37_15 = cost_37		cost_38_15 = cost_38		cost_39_15 = cost_39		cost_40_15 = cost_40
cost_41_15 = cost_41		cost_42_15 = cost_42		cost_43_15 = cost_43		cost_44_15 = cost_44		cost_45_15 = cost_45
cost_46_15 = cost_46;
run;

proc means data=budget mean;var 
cost_26_16 cost_27_16 cost_28_16 cost_29_16 cost_30_16 cost_31_16 cost_32_16 cost_33_16 cost_34_16 cost_35_16 cost_36_16 
cost_37_16 cost_38_16 cost_39_16 cost_40_16 cost_41_16 cost_42_16 cost_43_16 cost_44_16 cost_45_16 cost_46_16;
output out=sc16 mean=;run;
data sc16; set sc16; group=16;
rename 
cost_26_16 = cost_26		cost_27_16 = cost_27		cost_28_16 = cost_28		cost_29_16 = cost_29		cost_30_16 = cost_30
cost_31_16 = cost_31		cost_32_16 = cost_32		cost_33_16 = cost_33		cost_34_16 = cost_34		cost_35_16 = cost_35
cost_36_16 = cost_36		cost_37_16 = cost_37		cost_38_16 = cost_38		cost_39_16 = cost_39		cost_40_16 = cost_40
cost_41_16 = cost_41		cost_42_16 = cost_42		cost_43_16 = cost_43		cost_44_16 = cost_44		cost_45_16 = cost_45
cost_46_16 = cost_46;
run;

proc means data=budget mean;var 
cost_26_17 cost_27_17 cost_28_17 cost_29_17 cost_30_17 cost_31_17 cost_32_17 cost_33_17 cost_34_17 cost_35_17 cost_36_17
cost_37_17 cost_38_17 cost_39_17 cost_40_17 cost_41_17 cost_42_17 cost_43_17 cost_44_17 cost_45_17 cost_46_17;
output out=sc17 mean=;run;
data sc17; set sc17; group=17;
rename 
cost_26_17 = cost_26		cost_27_17 = cost_27		cost_28_17 = cost_28		cost_29_17 = cost_29		cost_30_17 = cost_30
cost_31_17 = cost_31		cost_32_17 = cost_32		cost_33_17 = cost_33		cost_34_17 = cost_34		cost_35_17 = cost_35
cost_36_17 = cost_36		cost_37_17 = cost_37		cost_38_17 = cost_38		cost_39_17 = cost_39		cost_40_17 = cost_40
cost_41_17 = cost_41		cost_42_17 = cost_42		cost_43_17 = cost_43		cost_44_17 = cost_44		cost_45_17 = cost_45
cost_46_17 = cost_46;
run;

proc means data=budget mean;var 
cost_26_18 cost_27_18 cost_28_18 cost_29_18 cost_30_18 cost_31_18 cost_32_18 cost_33_18 cost_34_18 cost_35_18 cost_36_18 
cost_37_18 cost_38_18 cost_39_18 cost_40_18 cost_41_18 cost_42_18 cost_43_18 cost_44_18 cost_45_18 cost_46_18;
output out=sc18 mean=;run;
data sc18; set sc18; group=18;
rename 
cost_26_18 = cost_26		cost_27_18 = cost_27		cost_28_18 = cost_28		cost_29_18 = cost_29		cost_30_18 = cost_30
cost_31_18 = cost_31		cost_32_18 = cost_32		cost_33_18 = cost_33		cost_34_18 = cost_34		cost_35_18 = cost_35
cost_36_18 = cost_36		cost_37_18 = cost_37		cost_38_18 = cost_38		cost_39_18 = cost_39		cost_40_18 = cost_40
cost_41_18 = cost_41		cost_42_18 = cost_42		cost_43_18 = cost_43		cost_44_18 = cost_44		cost_45_18 = cost_45
cost_46_18 = cost_46;
run;
/*
proc means data=budget mean;var 
cost_26_19 cost_27_19 cost_28_19 cost_29_19 cost_30_19 cost_31_19 cost_32_19 cost_33_19 cost_34_19 cost_35_19 cost_36_19 
cost_37_19 cost_38_19 cost_39_19 cost_40_19 cost_41_19 cost_42_19 cost_43_19 cost_44_19 cost_45_19 cost_46_19;
output out=sc19 mean=;run;
data sc19; set sc19; group=19;
rename 
cost_26_19 = cost_26		cost_27_19 = cost_27		cost_28_19 = cost_28		cost_29_19 = cost_29		cost_30_19 = cost_30
cost_31_19 = cost_31		cost_32_19 = cost_32		cost_33_19 = cost_33		cost_34_19 = cost_34		cost_35_19 = cost_35
cost_36_19 = cost_36		cost_37_19 = cost_37		cost_38_19 = cost_38		cost_39_19 = cost_39		cost_40_19 = cost_40
cost_41_19 = cost_41		cost_42_19 = cost_42		cost_43_19 = cost_43		cost_44_19 = cost_44		cost_45_19 = cost_45
cost_46_19 = cost_46;
run;
*/
proc means data=budget mean;var 
cost_26_20 cost_27_20 cost_28_20 cost_29_20 cost_30_20 cost_31_20 cost_32_20 cost_33_20 cost_34_20 cost_35_20 cost_36_20 
cost_37_20 cost_38_20 cost_39_20 cost_40_20 cost_41_20 cost_42_20 cost_43_20 cost_44_20 cost_45_20 cost_46_20;
output out=sc20 mean=;run;
data sc20; set sc20; group=20;
rename 
cost_26_20 = cost_26		cost_27_20 = cost_27		cost_28_20 = cost_28		cost_29_20 = cost_29		cost_30_20 = cost_30
cost_31_20 = cost_31		cost_32_20 = cost_32		cost_33_20 = cost_33		cost_34_20 = cost_34		cost_35_20 = cost_35
cost_36_20 = cost_36		cost_37_20 = cost_37		cost_38_20 = cost_38		cost_39_20 = cost_39		cost_40_20 = cost_40
cost_41_20 = cost_41		cost_42_20 = cost_42		cost_43_20 = cost_43		cost_44_20 = cost_44		cost_45_20 = cost_45
cost_46_20 = cost_46;
run;
;

data final_means;
set sc1 /*sc2*/ sc3 sc4 sc5 sc6 sc7 sc8 sc9 sc10 sc11 sc12 sc13 sc14 sc15 sc16 sc17 sc18 /*sc19*/ sc20;
run;
proc print;var group cost_26-cost_46;
run;

proc means data=budget mean;var
diff_cost_26y_2-diff_cost_26y_20
diff_cost_27y_2-diff_cost_27y_20
diff_cost_28y_2-diff_cost_28y_20
diff_cost_29y_2-diff_cost_29y_20
diff_cost_30y_2-diff_cost_30y_20
diff_cost_31y_2-diff_cost_31y_20
diff_cost_32y_2-diff_cost_32y_20
diff_cost_33y_2-diff_cost_33y_20
diff_cost_34y_2-diff_cost_34y_20
diff_cost_35y_2-diff_cost_35y_20
diff_cost_36y_2-diff_cost_36y_20
diff_cost_37y_2-diff_cost_37y_20
diff_cost_38y_2-diff_cost_38y_20
diff_cost_39y_2-diff_cost_39y_20
diff_cost_40y_2-diff_cost_40y_20
diff_cost_41y_2-diff_cost_41y_20
diff_cost_42y_2-diff_cost_42y_20
diff_cost_43y_2-diff_cost_43y_20
diff_cost_44y_2-diff_cost_44y_20
diff_cost_45y_2-diff_cost_45y_20
diff_cost_46y_2-diff_cost_46y_20;
output out=diff_costs mean=;run;

proc transpose data=diff_costs out=diff_costs_long name=varname;run;

data diff_costs_long_1;
  set diff_costs_long;

  /* splits the variable name using _ and y as delimiters i.e. diff_cost_26y_2 ? diff cost 26 2. It takes the 3rd component which is 26*/
  year = input(scan(varname, 3, '_y'), 8.);
  group  = input(scan(varname, 4, '_y'), 8.);
run;

proc sort data=diff_costs_long_1; by group;run;

proc transpose data=diff_costs_long_1 out=final_diff_costs(drop=_name_)
               prefix=y_;
  by group;
  id year;
  var col1;
run;

**REMOVE 2 AND 19;
data final;
set final_diff_costs;
if group in (2,19) then delete;
run;

proc print;var group y_26-y_46;run;
