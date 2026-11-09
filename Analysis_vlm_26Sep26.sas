***ANALYSIS FILE;


libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\VLM_2026\";

data a;
set a.wide_vlm_03Nov26;
run;

data b;
set a;

proc means n median mean p5 p95 lclm uclm;var

n_vm_this_yr_26_46_1 p_onart_diag_26_46_1 p_onart_vl1000__26_46_1 p_vg1000__26_46_1 prevalence1549__26_46_1	incidence1549m_26_46_1  hivrel_death_rate_26_46_1
n_vm_this_yr_26_46_2 p_onart_diag_26_46_2 p_onart_vl1000__26_46_2 p_vg1000__26_46_2 prevalence1549__26_46_2	incidence1549m_26_46_2  hivrel_death_rate_26_46_2
n_vm_this_yr_26_46_3 p_onart_diag_26_46_3 p_onart_vl1000__26_46_3 p_vg1000__26_46_3 prevalence1549__26_46_3	incidence1549m_26_46_3  hivrel_death_rate_26_46_3
n_vm_this_yr_26_46_4 p_onart_diag_26_46_4 p_onart_vl1000__26_46_4 p_vg1000__26_46_4 prevalence1549__26_46_4	incidence1549m_26_46_4  hivrel_death_rate_26_46_4
n_vm_this_yr_26_46_5 p_onart_diag_26_46_5 p_onart_vl1000__26_46_5 p_vg1000__26_46_5 prevalence1549__26_46_5	incidence1549m_26_46_5  hivrel_death_rate_26_46_5
n_vm_this_yr_26_46_6 p_onart_diag_26_46_6 p_onart_vl1000__26_46_6 p_vg1000__26_46_6 prevalence1549__26_46_6	incidence1549m_26_46_6  hivrel_death_rate_26_46_6
n_vm_this_yr_26_46_7 p_onart_diag_26_46_7 p_onart_vl1000__26_46_7 p_vg1000__26_46_7 prevalence1549__26_46_7	incidence1549m_26_46_7  hivrel_death_rate_26_46_7
n_vm_this_yr_26_46_8 p_onart_diag_26_46_8 p_onart_vl1000__26_46_8 p_vg1000__26_46_8 prevalence1549__26_46_8	incidence1549m_26_46_8  hivrel_death_rate_26_46_8
n_vm_this_yr_26_46_9 p_onart_diag_26_46_9 p_onart_vl1000__26_46_9 p_vg1000__26_46_9 prevalence1549__26_46_9	incidence1549m_26_46_9  hivrel_death_rate_26_46_9
n_vm_this_yr_26_46_10 p_onart_diag_26_46_10 p_onart_vl1000__26_46_10 p_vg1000__26_46_10 prevalence1549__26_46_10	incidence1549m_26_46_10  hivrel_death_rate_26_46_10
n_vm_this_yr_26_46_11 p_onart_diag_26_46_11 p_onart_vl1000__26_46_11 p_vg1000__26_46_11 prevalence1549__26_46_11	incidence1549m_26_46_11  hivrel_death_rate_26_46_11
n_vm_this_yr_26_46_12 p_onart_diag_26_46_12 p_onart_vl1000__26_46_12 p_vg1000__26_46_12 prevalence1549__26_46_12	incidence1549m_26_46_12  hivrel_death_rate_26_46_12
n_vm_this_yr_26_46_13 p_onart_diag_26_46_13 p_onart_vl1000__26_46_13 p_vg1000__26_46_13 prevalence1549__26_46_13	incidence1549m_26_46_13  hivrel_death_rate_26_46_13
n_vm_this_yr_26_46_14 p_onart_diag_26_46_14 p_onart_vl1000__26_46_14 p_vg1000__26_46_14 prevalence1549__26_46_14	incidence1549m_26_46_14  hivrel_death_rate_26_46_14
n_vm_this_yr_26_46_15 p_onart_diag_26_46_15 p_onart_vl1000__26_46_15 p_vg1000__26_46_15 prevalence1549__26_46_15	incidence1549m_26_46_15  hivrel_death_rate_26_46_15
n_vm_this_yr_26_46_16 p_onart_diag_26_46_16 p_onart_vl1000__26_46_16 p_vg1000__26_46_16 prevalence1549__26_46_16	incidence1549m_26_46_16  hivrel_death_rate_26_46_16
n_vm_this_yr_26_46_17 p_onart_diag_26_46_17 p_onart_vl1000__26_46_17 p_vg1000__26_46_17 prevalence1549__26_46_17	incidence1549m_26_46_17  hivrel_death_rate_26_46_17
n_vm_this_yr_26_46_18 p_onart_diag_26_46_18 p_onart_vl1000__26_46_18 p_vg1000__26_46_18 prevalence1549__26_46_18	incidence1549m_26_46_18  hivrel_death_rate_26_46_18
;run;


data c;
set b;
***options;
/*

*SQ treatment coverage, 3% decline, 20% decline;
1  7   13	No VLM
2  8   14	Annual
3  9   15	3 yearly
4  10  16	Symptomatic
5  11  17	6 months after ART
6  12  18	Pregnant women
*/

***CEA:
*difference in costs;
*SQ treatment strategy;
diff_dcost_2 = dcost_26_76_2 - dcost_26_76_1;
diff_dvl_cost_2 = dvl_cost_26_76_2 - dvl_cost_26_76_1;
diff_dcost_3 = dcost_26_76_3 - dcost_26_76_1;
diff_dvl_cost_3 = dvl_cost_26_76_3 - dvl_cost_26_76_1;
diff_dcost_4 = dcost_26_76_4 - dcost_26_76_1;
diff_dvl_cost_4 = dvl_cost_26_76_4 - dvl_cost_26_76_1;
diff_dcost_5 = dcost_26_76_5 - dcost_26_76_1;
diff_dvl_cost_5 = dvl_cost_26_76_5 - dvl_cost_26_76_1;
diff_dcost_6 = dcost_26_76_6 - dcost_26_76_1;
diff_dvl_cost_6 = dvl_cost_26_76_6 - dvl_cost_26_76_1;

*3% decline in treatment coverage;
diff_dcost_8 = dcost_26_76_8 - dcost_26_76_7;
diff_dvl_cost_8 = dvl_cost_26_76_8 - dvl_cost_26_76_7;
diff_dcost_9 = dcost_26_76_9 - dcost_26_76_7;
diff_dvl_cost_9 = dvl_cost_26_76_9 - dvl_cost_26_76_7;
diff_dcost_10 = dcost_26_76_10 - dcost_26_76_7;
diff_dvl_cost_10 = dvl_cost_26_76_10 - dvl_cost_26_76_7;
diff_dcost_11 = dcost_26_76_11 - dcost_26_76_7;
diff_dvl_cost_11 = dvl_cost_26_76_11 - dvl_cost_26_76_7;
diff_dcost_12 = dcost_26_76_12 - dcost_26_76_7;
diff_dvl_cost_12 = dvl_cost_26_76_12 - dvl_cost_26_76_7;

*20% decline in treatment coverage;
diff_dcost_14 = dcost_26_76_14 - dcost_26_76_13;
diff_dvl_cost_14 = dvl_cost_26_76_14 - dvl_cost_26_76_13;
diff_dcost_15 = dcost_26_76_15 - dcost_26_76_13;
diff_dvl_cost_15 = dvl_cost_26_76_15 - dvl_cost_26_76_13;
diff_dcost_16 = dcost_26_76_16 - dcost_26_76_13;
diff_dvl_cost_16 = dvl_cost_26_76_16 - dvl_cost_26_76_13;
diff_dcost_17 = dcost_26_76_17 - dcost_26_76_13;
diff_dvl_cost_17 = dvl_cost_26_76_17 - dvl_cost_26_76_13;
diff_dcost_18 = dcost_26_76_18 - dcost_26_76_13;
diff_dvl_cost_18 = dvl_cost_26_76_18 - dvl_cost_26_76_13;

*DALYs averted;
*SQ treatment strategy;
diff_ddaly_2 = ddaly_26_76_1 - ddaly_26_76_2;
diff_ddaly_3 = ddaly_26_76_1 - ddaly_26_76_3;
diff_ddaly_4 = ddaly_26_76_1 - ddaly_26_76_4;
diff_ddaly_5 = ddaly_26_76_1 - ddaly_26_76_5;
diff_ddaly_6 = ddaly_26_76_1 - ddaly_26_76_6;

*3% decline in treatment coverage;
diff_ddaly_8 = ddaly_26_76_7 - ddaly_26_76_8;
diff_ddaly_9 = ddaly_26_76_7 - ddaly_26_76_9;
diff_ddaly_10 = ddaly_26_76_7 - ddaly_26_76_10;
diff_ddaly_11 = ddaly_26_76_7 - ddaly_26_76_11;
diff_ddaly_12 = ddaly_26_76_7 - ddaly_26_76_12;

*20% decline in treatment coverage;
diff_ddaly_14 = ddaly_26_76_13 - ddaly_26_76_14;
diff_ddaly_15 = ddaly_26_76_13 - ddaly_26_76_15;
diff_ddaly_16 = ddaly_26_76_13 - ddaly_26_76_16;
diff_ddaly_17 = ddaly_26_76_13 - ddaly_26_76_17;
diff_ddaly_18 = ddaly_26_76_13 - ddaly_26_76_18;

ICER2 = (diff_dcost_2/diff_ddaly_2)*1000000;
ICER3 = (diff_dcost_3/diff_ddaly_3)*1000000;
ICER4 = (diff_dcost_4/diff_ddaly_4)*1000000;
ICER5 = (diff_dcost_5/diff_ddaly_5)*1000000;
ICER6 = (diff_dcost_6/diff_ddaly_6)*1000000;
ICER8 = (diff_dcost_8/diff_ddaly_8)*1000000;
ICER9 = (diff_dcost_9/diff_ddaly_9)*1000000;
ICER10 = (diff_dcost_10/diff_ddaly_10)*1000000;
ICER11 = (diff_dcost_11/diff_ddaly_11)*1000000;
ICER12 = (diff_dcost_12/diff_ddaly_12)*1000000;
ICER14 = (diff_dcost_14/diff_ddaly_14)*1000000;
ICER15 = (diff_dcost_15/diff_ddaly_15)*1000000;
ICER16 = (diff_dcost_16/diff_ddaly_16)*1000000;
ICER17 = (diff_dcost_17/diff_ddaly_17)*1000000;
ICER18 = (diff_dcost_18/diff_ddaly_18)*1000000;

*net dalys using $100;
netdalys_1 =  ddaly_26_76_1 + (dcost_26_76_1)/0.0001;
netdalys_2 =  ddaly_26_76_2 + (dcost_26_76_2)/0.0001;
netdalys_3 =  ddaly_26_76_3 + (dcost_26_76_3)/0.0001;
netdalys_4 =  ddaly_26_76_4 + (dcost_26_76_4)/0.0001;
netdalys_5 =  ddaly_26_76_5 + (dcost_26_76_5)/0.0001;
netdalys_6 =  ddaly_26_76_6 + (dcost_26_76_6)/0.0001;
netdalys_7 =  ddaly_26_76_7 + (dcost_26_76_7)/0.0001;
netdalys_8 =  ddaly_26_76_8 + (dcost_26_76_8)/0.0001;
netdalys_9 =  ddaly_26_76_9 + (dcost_26_76_9)/0.0001;
netdalys_10 =  ddaly_26_76_10 + (dcost_26_76_10)/0.0001;
netdalys_11 =  ddaly_26_76_11 + (dcost_26_76_11)/0.0001;
netdalys_12 =  ddaly_26_76_12 + (dcost_26_76_12)/0.0001;
netdalys_13 =  ddaly_26_76_13 + (dcost_26_76_13)/0.0001;
netdalys_14 =  ddaly_26_76_14 + (dcost_26_76_14)/0.0001;
netdalys_15 =  ddaly_26_76_15 + (dcost_26_76_15)/0.0001;
netdalys_16 =  ddaly_26_76_16 + (dcost_26_76_16)/0.0001;
netdalys_17 =  ddaly_26_76_17 + (dcost_26_76_17)/0.0001;
netdalys_18 =  ddaly_26_76_18 + (dcost_26_76_18)/0.0001;

proc means n p50 mean p5 p95;var 
diff_dcost_2  		diff_dvl_cost_2		diff_ddaly_2	ICER2 	netdalys_2
diff_dcost_3  		diff_dvl_cost_3		diff_ddaly_3	ICER3 	netdalys_3
diff_dcost_4  		diff_dvl_cost_4		diff_ddaly_4	ICER4 	netdalys_4
diff_dcost_5  		diff_dvl_cost_5		diff_ddaly_5	ICER5 	netdalys_5
diff_dcost_6  		diff_dvl_cost_6		diff_ddaly_6	ICER6 	netdalys_6

diff_dcost_8  		diff_dvl_cost_8		diff_ddaly_8	ICER8 	netdalys_8
diff_dcost_9  		diff_dvl_cost_9		diff_ddaly_9	ICER9 	netdalys_9
diff_dcost_10  		diff_dvl_cost_10	diff_ddaly_10	ICER10 	netdalys_10
diff_dcost_11  		diff_dvl_cost_11	diff_ddaly_11	ICER11 	netdalys_11
diff_dcost_12  		diff_dvl_cost_12	diff_ddaly_12	ICER12 	netdalys_12

diff_dcost_14  		diff_dvl_cost_14	diff_ddaly_14	ICER14 	netdalys_14
diff_dcost_15  		diff_dvl_cost_15	diff_ddaly_15	ICER15 	netdalys_15
diff_dcost_16  		diff_dvl_cost_16	diff_ddaly_16	ICER16 	netdalys_16
diff_dcost_17  		diff_dvl_cost_17	diff_ddaly_17	ICER17 	netdalys_17
diff_dcost_18  		diff_dvl_cost_18	diff_ddaly_18	ICER18 	netdalys_18

netdalys_1			netdalys_7				netdalys_13

;run;

