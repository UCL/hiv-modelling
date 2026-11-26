***ANALYSIS FILE;

libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.wide_MM18Nov26;*_1 is higher proportion on prep;
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
;run;

proc means;var p_elig_onprep_mm_36_3 n_prep_any_mm_36_3 p_elig_onprep_36_3 n_onprep_36_3 n_onprep_exc_mm_36_3
p_elig_onprep_mm_36_1 n_prep_any_mm_36_1 p_elig_onprep_36_1 n_onprep_36_1 n_onprep_exc_mm_36_1
;run;

proc means;var  n_onprep_36_1 n_onprep_36_3;run;

***Table 3: Separate according to whether CAB or Len is SQ;
*SQ treatment coverage, 3% decline, 20% decline;

*Options

1  SQ CAB  
2  SQ Len
3  Intervention CAB
4  Intervention Len
;
proc means n median mean p5 p95 lclm uclm;var
/* SQ CAB */
p_elig_onprep_mm_36_1	p_1564mm_onoral_36_1		p_1564mm_oncab_36_1 	p_1564mm_onlen_36_1
incidence1564_mm_36_1	prevalence1564_mm_36_1
incidence1549__36_1		prevalence1549__36_1		p_elig_onprep_36_1

/* Scale up of CAB and oral PrEP in MM; */
p_elig_onprep_mm_36_3	p_1564mm_onoral_36_3		p_1564mm_oncab_36_3	 	p_1564mm_onlen_36_3
incidence1564_mm_36_3	prevalence1564_mm_36_3
incidence1549__36_3		prevalence1549__36_3		p_elig_onprep_36_3

/* SQ Len */
p_elig_onprep_mm_36_2	p_1564mm_onoral_36_2		p_1564mm_oncab_36_2 	p_1564mm_onlen_36_2	
incidence1564_mm_36_2	prevalence1564_mm_36_2
incidence1549__36_2		prevalence1549__36_2		p_elig_onprep_36_2

/* Scale up of Len and oral PrEP in MM; */
p_elig_onprep_mm_36_4	p_1564mm_onoral_36_4		p_1564mm_oncab_36_4		 p_1564mm_onlen_36_4
incidence1564_mm_36_4	prevalence1564_mm_36_4
incidence1549__36_4		prevalence1549__36_4		p_elig_onprep_36_4

;run;




data c;
set b;

***cost-effectiveness analyses;
***options;
/*

*SQ treatment coverage, 3% decline, 20% decline;
1  SQ CAB  
2  SQ Len
3  Intervention CAB
4  Intervention Len
*/

***CEA:
*difference in costs between SQ CAB and Intervention CAB,SQ Len and Intervention Len ;
diff_dcost_3 = dcost_26_76_3 - dcost_26_76_1;
diff_dcost1_3 = dcost1_26_76_3 - dcost1_26_76_1;
diff_dcost2_3 = dcost2_26_76_3 - dcost2_26_76_1;

diff_total_prep_drug_cost_3 = total_prep_drug_cost_26_76_3 - total_prep_drug_cost_26_76_1;
diff_total_vis_drug_cost_3 = total_prep_vis_cost_26_76_3 - total_prep_vis_cost_26_76_1;
diff_total_vis_drug_cost1_3 = total_prep_vis_cost1_26_76_3 - total_prep_vis_cost1_26_76_1;
diff_total_vis_drug_cost2_3 = total_prep_vis_cost2_26_76_3 - total_prep_vis_cost2_26_76_1;



*DALYs averted;
*SQ treatment strategy;
diff_ddaly_3 = ddaly_26_76_1 - ddaly_26_76_3;


*net dalys using $100;
netdalys_1 =  ddaly_26_76_1 + (dcost_26_76_1)/0.0001;
netdalys_cost1_1 =  ddaly_26_76_1 + (dcost1_26_76_1)/0.0001;
netdalys_cost2_1 =  ddaly_26_76_1 + (dcost2_26_76_1)/0.0001;

netdalys_3 =  ddaly_26_76_3 + (dcost_26_76_3)/0.0001;
netdalys_cost1_3 =  ddaly_26_76_3 + (dcost1_26_76_3)/0.0001;
netdalys_cost2_3 =  ddaly_26_76_3 + (dcost2_26_76_3)/0.0001;

***repeat for Len;

diff_dcost_4 = dcost_26_76_4 - dcost_26_76_2;
diff_dcost1_4 = dcost1_26_76_4 - dcost1_26_76_2;
diff_dcost2_4 = dcost2_26_76_4 - dcost2_26_76_2;

diff_total_prep_drug_cost_4 = total_prep_drug_cost_26_76_4 - total_prep_drug_cost_26_76_1;
diff_total_vis_drug_cost_4 = total_prep_vis_cost_26_76_4 - total_prep_vis_cost_26_76_1;
diff_total_vis_drug_cost1_4 = total_prep_vis_cost1_26_76_4 - total_prep_vis_cost1_26_76_1;
diff_total_vis_drug_cost2_4 = total_prep_vis_cost2_26_76_4 - total_prep_vis_cost2_26_76_1;

*DALYs averted;
*SQ treatment strategy;
diff_ddaly_4 = ddaly_26_76_2 - ddaly_26_76_4;


*net dalys using $100;
netdalys_2 =  ddaly_26_76_2 + (dcost_26_76_2)/0.0001;
netdalys_cost1_2 =  ddaly_26_76_2 + (dcost1_26_76_2)/0.0001;
netdalys_cost2_2 =  ddaly_26_76_2 + (dcost2_26_76_2)/0.0001;

netdalys_4 =  ddaly_26_76_4 + (dcost_26_76_4)/0.0001;
netdalys_cost1_4 =  ddaly_26_76_4 + (dcost1_26_76_4)/0.0001;
netdalys_cost2_4 =  ddaly_26_76_4 + (dcost2_26_76_4)/0.0001;

proc means n mean p5 p95 lclm uclm;var 
dcost1_26_76_1				dcost1_26_76_3  			diff_dcost1_3							

ddaly_26_76_1				ddaly_26_76_3				diff_ddaly_3

dcost_26_76_1				dcost_26_76_3  				diff_dcost_3							

dcost1_26_76_2				dcost1_26_76_4  			diff_dcost1_4				

ddaly_26_76_2				ddaly_26_76_4				diff_ddaly_4

dcost_26_76_2				dcost_26_76_4				diff_dcost_4	
;
run;

proc means;var 
dcost_total_prep_1_26_76_1  dcost_total_prep_2_26_76_1	dcost_total_prep_3_26_76_1 	dcost_total_prep_4_26_76_1
dcost_total_prep_1_26_76_3  dcost_total_prep_2_26_76_3	dcost_total_prep_3_26_76_3 	dcost_total_prep_4_26_76_3
diff_total_prep_cost_1_3 	diff_total_prep_cost_2_3  	diff_total_prep_cost_3_3	diff_total_prep_cost_4_3

dcost_total_prep_1_26_76_1  dcost_total_prep_2_26_76_1	dcost_total_prep_3_26_76_1 	dcost_total_prep_4_26_76_1
dcost_total_prep_1_26_76_3  dcost_total_prep_2_26_76_3	dcost_total_prep_3_26_76_3 	dcost_total_prep_4_26_76_3
diff_total_prep_cost_1_3 	diff_total_prep_cost_2_3  	diff_total_prep_cost_3_3	diff_total_prep_cost_4_3
;run;




proc means;var 
netdalys_1				netdalys_cost1_1		  netdalys_cost2_1			netdalys_cost3_1			netdalys_cost4_1
netdalys_3				netdalys_cost1_3		  netdalys_cost2_3			netdalys_cost3_3			netdalys_cost4_3;
;run;
