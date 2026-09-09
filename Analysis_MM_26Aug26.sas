***ANALYSIS FILE;


***THE ISSUE WAS WE ONLY HAD ABOUT 12% WITH NEWP GE 1 (p_newp_ge1_mm_26). 
CHANGED INC_RISK_MOBILE, SEE IF THIS HAS AN IMPACT. STRATIFY BY THIS TOO IN CREATE WIDE FILE TO SEE IF THERE IS AN ASSOCIATION;


libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.wide_MM26Aug26;
run;

data b;
set a;

proc means n median p5 p95;var
n_mm_26 				p_mm_26	 			p_1524mm_26		 	p_2534mm_26			p_3544mm_26				p_4554mm_26		
p_5564mm_26				p_newp_ge1_mm_26	p_elig_onprep_mm_26	incidence1564_mm_26	prevalence1564_mm_26	p_diag_mm_26		
p_onart_diag_mm_26  	p_onart_vl1000_mm_26	
p_elig_onprep_m_26		prevalence1549m_26	incidence1549m_26;run;
