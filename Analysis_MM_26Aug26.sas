***ANALYSIS FILE;


libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Mobile Men\";

data a;
set a.wide_MM18Oct26;
run;

data b;
set a;


proc means n median p5 p95;var
n_mm_26 				p_mm_26	 			p_1524mm_26		 	p_2534mm_26			p_3544mm_26				p_4554mm_26		
p_5564mm_26				p_newp_ge1_mm_26	av_mm_newp_26		p_elig_onprep_mm_26	incidence1564_mm_26		prevalence1564_mm_26	
p_diag_mm_26			p_onart_diag_mm_26  p_onart_vl1000_mm_26	
p_elig_onprep_m_26		prevalence1549m_26	incidence1549m_26	p_mm_prog_visit_26		;run;


proc means n median p5 p95;var
p_elig_onprep_mm_36_1
p_elig_onprep_mm_36_2
p_elig_onprep_mm_36_3
p_elig_onprep_mm_36_4
p_elig_onprep_mm_36_5
p_elig_onprep_mm_36_6
p_elig_onprep_mm_36_7
p_elig_onprep_mm_36_8

p_elig_onprep_oral_mm_36_1
p_elig_onprep_oral_mm_36_2
p_elig_onprep_oral_mm_36_3
p_elig_onprep_oral_mm_36_4
p_elig_onprep_oral_mm_36_5
p_elig_onprep_oral_mm_36_6
p_elig_onprep_oral_mm_36_7
p_elig_onprep_oral_mm_36_8

p_elig_onprep_cab_mm_36_1
p_elig_onprep_cab_mm_36_2
p_elig_onprep_cab_mm_36_3
p_elig_onprep_cab_mm_36_4
p_elig_onprep_cab_mm_36_5
p_elig_onprep_cab_mm_36_6
p_elig_onprep_cab_mm_36_7
p_elig_onprep_cab_mm_36_8

p_elig_onprep_len_mm_36_1
p_elig_onprep_len_mm_36_2
p_elig_onprep_len_mm_36_3
p_elig_onprep_len_mm_36_4
p_elig_onprep_len_mm_36_5
p_elig_onprep_len_mm_36_6
p_elig_onprep_len_mm_36_7
p_elig_onprep_len_mm_36_8

;run;

proc contents;run;
