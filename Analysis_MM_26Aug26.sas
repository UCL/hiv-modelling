***ANALYSIS FILE;

libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.wide_MM11Nov26;
run;

data b;
set a;

PROC CONTENTS;RUN;

*Table 1 - setting scenarios characteristics;

proc means n mean median p5 p95;var
prevalence1549__26  prevalence1549w_26  prevalence1549m_26  incidence1549__26  incidence1549w_26  incidence1549m_26
p_diag_26			p_diag_w_26			p_diag_m_26			p_onart_diag_26	   p_onart_diag_w_26  p_onart_diag_m_26
p_onart_vl1000__26	p_onart_vl1000_w_26 p_onart_vl1000_m_26
p_vl1000__26		prevalence_vg1000__26;run;

proc means n median mean p5 p95;var
n_mm_26 				p_mm_26	 			p_1524mm_26		 	p_2534mm_26			p_3544mm_26				p_4554mm_26		
p_5564mm_26				p_newp_ge1_mm_26	av_mm_newp_26		p_elig_onprep_mm_26	incidence1564_mm_26		prevalence1564_mm_26	
p_diag_mm_26			p_onart_diag_mm_26  p_onart_vl1000_mm_26	
p_elig_onprep_m_26		prevalence1549m_26	incidence1549m_26	p_mm_prog_visit_26		;run;

proc means n median p5 p95;var
p_mm_prog_visit_36_1	
p_mm_prog_visit_36_2
p_mm_prog_visit_36_3
p_mm_prog_visit_36_4	
p_mm_prog_visit_36_5
p_mm_prog_visit_36_6
p_mm_prog_visit_36_7
p_mm_prog_visit_36_8

;run;

***Table 3: Separate according to whether CAB or Len is SQ;

proc means n median mean p5 p95 lclm uclm;var
/* SQ CAB */
p_elig_onprep_mm_36_1	p_1564mm_onoral_36_1		p_1564mm_oncab_36_1 	p_1564mm_onlen_36_1
incidence1564_mm_36_1	prevalence1564_mm_36_1
incidence1549__36_1		prevalence1549__36_1		p_elig_onprep_36_1

/* Scale up of CAB and oral PrEP in MM; */
p_elig_onprep_mm_36_6	p_1564mm_onoral_36_6		p_1564mm_oncab_36_6	 	p_1564mm_onlen_36_6
incidence1564_mm_36_6	prevalence1564_mm_36_6
incidence1549__36_6		prevalence1549__36_6		p_elig_onprep_36_6

/* SQ Len */
p_elig_onprep_mm_36_2	p_1564mm_onoral_36_2		p_1564mm_oncab_36_2 	p_1564mm_onlen_36_2	
incidence1564_mm_36_2	prevalence1564_mm_36_2
incidence1549__36_2		prevalence1549__36_2		p_elig_onprep_36_2

/* Scale up of Len and oral PrEP in MM; */
p_elig_onprep_mm_36_8	p_1564mm_onoral_36_8		p_1564mm_oncab_36_8		 p_1564mm_onlen_36_8
incidence1564_mm_36_8	prevalence1564_mm_36_8
incidence1549__36_8		prevalence1549__36_8		p_elig_onprep_36_8

;run;

data c;
set b;

***cost-effectiveness analyses;
***options;
/*

*SQ treatment coverage, 3% decline, 20% decline;
1  SQ CAB  
2  SQ Len
7  Intervention CAB
8  Intervention Len
*/

***CEA:
*difference in costs between SQ CAB and Intervention CAB,SQ Len and Intervention Len ;

diff_dcost_cab = dcost_26_76_7 - dcost_26_76_1;
diff_prep_cost_cab = dprep_cost_26_76_7 - dprep_cost_26_76_1;
diff_dcost_len = dcost_26_76_7 - dcost_26_76_1;
diff_prep_cost_len = dprep_cost_26_76_7 - dprep_cost_26_76_1;


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

