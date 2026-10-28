***ANALYSIS FILE;


libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\VLM_2026\";

data a;
set a.wide_vlm_14Oct26;
run;

data b;
set a;

proc means n median mean p5 p95;var

prevalence1549m_46_1  p_onart_vl1000__46_1  p_vl1000__46_1  p_vg1000__46_1	 prevalence_vg1000__46_1  hivrel_death_rate_46_1  
prevalence1549m_46_2  p_onart_vl1000__46_2  p_vl1000__46_2  p_vg1000__46_2	 prevalence_vg1000__46_2  hivrel_death_rate_46_2  
prevalence1549m_46_3  p_onart_vl1000__46_3  p_vl1000__46_3  p_vg1000__46_3	 prevalence_vg1000__46_3  hivrel_death_rate_46_3  
prevalence1549m_46_4  p_onart_vl1000__46_4  p_vl1000__46_4  p_vg1000__46_4	 prevalence_vg1000__46_4  hivrel_death_rate_46_4
prevalence1549m_46_5  p_onart_vl1000__46_5  p_vl1000__46_5  p_vg1000__46_5	 prevalence_vg1000__46_5  hivrel_death_rate_46_5
prevalence1549m_46_6  p_onart_vl1000__46_6  p_vl1000__46_6  p_vg1000__46_6	 prevalence_vg1000__46_6  hivrel_death_rate_46_6
prevalence1549m_46_7  p_onart_vl1000__46_7  p_vl1000__46_7  p_vg1000__46_7	 prevalence_vg1000__46_7  hivrel_death_rate_46_7
prevalence1549m_46_8  p_onart_vl1000__46_8  p_vl1000__46_8  p_vg1000__46_8	 prevalence_vg1000__46_8  hivrel_death_rate_46_8
prevalence1549m_46_9  p_onart_vl1000__46_9  p_vl1000__46_9  p_vg1000__46_9	 prevalence_vg1000__46_9  hivrel_death_rate_46_9
prevalence1549m_46_10  p_onart_vl1000__46_10  p_vl1000__46_10  p_vg1000__46_10	 prevalence_vg1000__46_10  hivrel_death_rate_46_10
prevalence1549m_46_11  p_onart_vl1000__46_11  p_vl1000__46_11  p_vg1000__46_11	 prevalence_vg1000__46_11  hivrel_death_rate_46_11
prevalence1549m_46_12  p_onart_vl1000__46_12  p_vl1000__46_12  p_vg1000__46_12	 prevalence_vg1000__46_12  hivrel_death_rate_46_12


;run;

proc means n median mean p5 p95;var 

p_diag_46_1  p_diag_46_2  p_diag_46_3  p_diag_46_4  p_diag_46_5 p_diag_46_6
p_diag_46_7  p_diag_46_8  p_diag_46_9  p_diag_46_10 p_diag_46_11 p_diag_46_12
p_onart_diag_46_1  p_onart_diag_46_2  p_onart_diag_46_3  p_onart_diag_46_4  p_onart_diag_46_5 p_onart_diag_46_6
p_onart_diag_46_7  p_onart_diag_46_8  p_onart_diag_46_9  p_onart_diag_46_10 p_onart_diag_46_11 p_onart_diag_46_12
n_vm_this_per_46_1 n_vm_this_per_46_2 n_vm_this_per_46_3 n_vm_this_per_46_4	n_vm_this_per_46_5 n_vm_this_per_46_6
n_vm_this_per_46_7 n_vm_this_per_46_8 n_vm_this_per_46_9 n_vm_this_per_46_10	n_vm_this_per_46_11 n_vm_this_per_46_12 

p_fail_this_per_46_1 p_fail_this_per_46_2 p_fail_this_per_46_3 p_fail_this_per_46_4	p_fail_this_per_46_5 p_fail_this_per_46_6
p_fail_this_per_46_7 p_fail_this_per_46_8 p_fail_this_per_46_9 p_fail_this_per_46_10	p_fail_this_per_46_11 p_fail_this_per_46_12 


;run;


proc means n median mean p5 p95;var 
p_onart_diag_46_1 p_onart_diag_46_2 p_onart_diag_46_3 p_onart_diag_46_4	p_onart_diag_46_5 p_onart_diag_46_6
p_onart_diag_46_7 p_onart_diag_46_8 p_onart_diag_46_9 p_onart_diag_46_10	p_onart_diag_46_11 p_onart_diag_46_12 ;
run;

%var(v=p_fail_this_per);
/*

prevalence1549w 	prevalence1549_ 	incidence1549_ 		incidence1549w  	
incidence1549m			p_diag	 			p_diag_m	 	 	p_diag_w
p_onart_diag  	  		p_onart_diag_m   	p_onart_diag_w  	p_onart_vl1000_ 	p_onart_vl1000_m 
p_onart_vl1000_w 		p_vg1000_			p_vl1000_ 			prevalence_vg1000_	
hivrel_death_rate;
*/





n_mm_26 				p_mm_26	 			p_1524mm_26		 	p_2534mm_26			p_3544mm_26				p_4554mm_26		
p_5564mm_26				p_newp_ge1_mm_26	av_mm_newp_26		p_elig_onprep_mm_26	incidence1564_mm_26		prevalence1564_mm_26	
p_diag_mm_26			p_onart_diag_mm_26  p_onart_vl1000_mm_26	
p_elig_onprep_m_26		prevalence1549m_26	incidence1549m_26	p_mm_prog_visit_36_6		;run;


proc means n median p5 p95;var p_newp_ge1_mm_26;where inc_risk_mobile=100;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where inc_risk_mobile=200;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where inc_risk_mobile=300;run;

proc freq;table sex_age_mixing_matrix_w	;run;

proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=1;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=2;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=3;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=4;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=5;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=6;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=7;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=8;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=9;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=10;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=11;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=12;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=13;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=14;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_m=15;run;


proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=1;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=2;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=3;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=4;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=5;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=6;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=7;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=8;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=9;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=10;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=11;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=12;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=13;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=14;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where sex_beh_trans_matrix_w=15;run;

proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_m=1;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_m=2;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_m=3;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_m=4;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_m=5;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_m=6;run;

proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_w=1;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_w=2;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_w=3;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_w=4;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_w=5;run;
proc means n median p5 p95;var p_newp_ge1_mm_26;where  sex_age_mixing_matrix_w=6;run;

