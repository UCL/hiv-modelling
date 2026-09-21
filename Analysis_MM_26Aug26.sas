***ANALYSIS FILE;


***THE ISSUE WAS WE ONLY HAD ABOUT 12% WITH NEWP GE 1 (p_newp_ge1_mm_26). 
CHANGED INC_RISK_MOBILE, SEE IF THIS HAS AN IMPACT. STRATIFY BY THIS TOO IN CREATE WIDE FILE TO SEE IF THERE IS AN ASSOCIATION;

*COULD ALSO STRATIFY BY SEX BEH MATRICES;


libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.wide_MM16Sep26;
run;

data b;
set a;




proc means n median p5 p95;var
n_mm_26 				p_mm_26	 			p_1524mm_26		 	p_2534mm_26			p_3544mm_26				p_4554mm_26		
p_5564mm_26				p_newp_ge1_mm_26	p_elig_onprep_mm_26	incidence1564_mm_26	prevalence1564_mm_26	p_diag_mm_26		
p_onart_diag_mm_26  	p_onart_vl1000_mm_26	
p_elig_onprep_m_26		prevalence1549m_26	incidence1549m_26;run;


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

