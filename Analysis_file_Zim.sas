libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim";


data a.wide_Zim_17_12_2025;
set wide_outputs  ;  
by run;run; 

data b;
set a;

***Pre-funding cuts outputs;
proc means n p50 mean p5 p95;
var 
n_hivge15m_25		 n_hivge15w_25		    n_hivge15__25		prevalence1549m_25  prevalence1549w_25 	prevalence1549__25
incidence1549__25 	 incidence1549w_25 		incidence1549m_25	p_onart_25			p_onart_m_25		p_onart_w_25	
n_onart_25			 n_onart_m_25			n_onart_w_25		p_diag_25	 		p_diag_m	 		p_diag_w_25  
p_onart_diag_25   	 p_onart_diag_m_25   	p_onart_diag_w_25   p_onart_vl1000__25	p_onart_vl1000_m   	p_onart_vl1000_w_25
n_onprep_w_25		 n_onprep_m_25			n_onprep_25			prop_elig_on_prep_25 n_prep_ever		
n_sw_1564__25		 n_sw_1549__25			p_w_1564_sw_25		p_w_1549_sw_25		prevalence_1564sw_25
incidence_1564sw_25  p_onprep_sw_25			n_onprep_sw_25	
n_msm_1564__25		 p_m_msm_25				prevalence1549_msm_25	incidence_msm_25		p_onprep_msm_25		n_onprep_msm_25
n_agyw_25			 p_w_agyw_25			prevalence_agyw_25		incidence_agyw_25		p_onprep_agyw_25	n_onprep_agyw_25
n_death_hivrel_25	 n_death_hivrel_m_25	n_death_hivrel_w_25
;run;
