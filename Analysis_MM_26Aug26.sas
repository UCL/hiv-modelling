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
6  Intervention CAB
8  Intervention Len
*/

***CEA:
*difference in costs between SQ CAB and Intervention CAB,SQ Len and Intervention Len ;
diff_dcost_6 = dcost_26_76_1 - dcost_26_76_6;
diff_dcost1_6 = dcost_1_26_76_1 - dcost_1_26_76_6;
diff_dcost2_6 = dcost_2_26_76_1 - dcost_2_26_76_6;
diff_dcost3_6 = dcost_3_26_76_1 - dcost_3_26_76_6;
diff_dcost4_6 = dcost_4_26_76_1 - dcost_4_26_76_6;

diff_total_prep_cost_6 = dcost_total_prep_26_76_1 - dcost_total_prep_26_76_6;
diff_total_prep_cost_1_6 = dcost_total_prep_1_26_76_1 - dcost_total_prep_1_26_76_6;
diff_total_prep_cost_2_6 = dcost_total_prep_2_26_76_1 - dcost_total_prep_2_26_76_6;
diff_total_prep_cost_3_6 = dcost_total_prep_3_26_76_1 - dcost_total_prep_3_26_76_6;
diff_total_prep_cost_4_6 = dcost_total_prep_4_26_76_1 - dcost_total_prep_4_26_76_6;

*DALYs averted;
*SQ treatment strategy;
diff_ddaly_6 = ddaly_26_76_6 - ddaly_26_76_1;


*net dalys using $100;
netdalys_1 =  ddaly_26_76_1 + (dcost_26_76_1)/0.0001;
netdalys_cost1_1 =  ddaly_26_76_1 + (dcost_1_26_76_1)/0.0001;
netdalys_cost2_1 =  ddaly_26_76_1 + (dcost_2_26_76_1)/0.0001;
netdalys_cost3_1 =  ddaly_26_76_1 + (dcost_3_26_76_1)/0.0001;
netdalys_cost4_1 =  ddaly_26_76_1 + (dcost_4_26_76_1)/0.0001;

netdalys_6 =  ddaly_26_76_6 + (dcost_26_76_6)/0.0001;
netdalys_cost1_6 =  ddaly_26_76_6 + (dcost_1_26_76_6)/0.0001;
netdalys_cost2_6 =  ddaly_26_76_6 + (dcost_2_26_76_6)/0.0001;
netdalys_cost3_6 =  ddaly_26_76_6+ (dcost_3_26_76_6)/0.0001;
netdalys_cost4_6 =  ddaly_26_76_6 + (dcost_4_26_76_6)/0.0001;

proc means n p50 mean p5 p95;var 
diff_dcost_6  			diff_dcost1_6			  diff_dcost2_6				diff_dcost3_6				diff_dcost4_6
diff_total_prep_cost_6	diff_total_prep_cost_1_6  diff_total_prep_cost_2_6  diff_total_prep_cost_3_6	diff_total_prep_cost_4_6
diff_ddaly_6
netdalys_1				netdalys_cost1_1		  netdalys_cost2_1			netdalys_cost3_1			netdalys_cost4_1
netdalys_6				netdalys_cost1_6		  netdalys_cost2_6			netdalys_cost3_6			netdalys_cost4_6;
run;
