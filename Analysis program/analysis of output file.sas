libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\fsw\";


data a; 
set a.wide_fsw_24_05_22 ;
run;

proc contents;run;

data b;
set a;

***table 1;
proc means n p50 p5 p95;var
prevalence1549_22 	 prevalence1549w_22 	prevalence1549m_22 	incidence1549_22 	incidence1549w_22 	incidence1549m_22
p_diag_22	 		 p_onart_diag_22   		p_onart_vl1000_22	p_vg1000_22 		p_vl1000_22 		prevalence_vg1000_22
;run;

/*
p_diag_m_22	 		p_diag_w_22
p_onart_diag_m_22   	p_onart_diag_w_22
p_onart_vl1000_m_22   p_onart_vl1000_w_22
*/


***table 2;
proc means n p50 p5 p95;var
n_sw_1549__22		prop_w_1549_sw_22 		prop_w_ever_sw_22		act_dur_sw_22 
p_sw_age1519__22	p_sw_age2024__22		p_sw_age2529__22 		p_sw_age3039__22
incidence_sw_22		prevalence_sw_22
p_diag_sw_22		p_onart_diag_sw_22		p_onart_vl1000_sw_22;
run;

**option 1=No SW programme, option 2= Yes SW programme;
proc means n p50 p5 p95;var

prevalence1549_20_21_1 prevalence1549m_20_21_1 prevalence1549w_20_21_1
incidence1549_20_21_1 incidence1549m_20_21_1 incidence1549w_20_21_1
p_diag_20_21_1 p_diag_m_20_21_1 p_diag_w_20_21_1
p_onart_diag_20_21_1 p_onart_diag_m_20_21_1 p_onart_diag_w_20_21_1
p_vl1000_20_21_1 p_vl1000_m_20_21_1 p_vl1000_w_20_21_1
p_onart_vl1000_20_21_1 p_onart_vl1000_m_20_21_1 p_onart_vl1000_w_20_21_1
death_rate_hiv_all_20_21_1 death_rate_hiv_all_m_20_21_1 death_rate_hiv_all_w_20_21_1

prevalence1549_20_21_2 prevalence1549m_20_21_2 prevalence1549w_20_21_2
incidence1549_20_21_2 incidence1549m_20_21_2 incidence1549w_20_21_2
p_diag_20_21_2 p_diag_m_20_21_2 p_diag_w_20_21_2
p_onart_diag_20_21_2 p_onart_diag_m_20_21_2 p_onart_diag_w_20_21_2
p_vl1000_20_21_2 p_vl1000_m_20_21_2 p_vl1000_w_20_21_2
p_onart_vl1000_20_21_2 p_onart_vl1000_m_20_21_2 p_onart_vl1000_w_20_21_2
death_rate_hiv_all_20_21_2 death_rate_hiv_all_m_20_21_2 death_rate_hiv_all_w_20_21_2
;
run;


proc means n p50 p5 p95 mean lclm uclm;var
n_sw_1564_20_21_1
prop_w_1564_sw_20_21_1
prevalence_sw_20_21_1
incidence_sw_20_21_1
n_tested_sw_20_21_1
p_diag_sw_20_21_1
p_onart_diag_sw_20_21_1
p_onart_vl1000_sw_20_21_1
t_sw_newp_20_21_1
p_newp_sw_20_21_1
prop_sw_program_visit_20_21_1

n_sw_1564_20_21_2
prop_w_1564_sw_20_21_2
prevalence_sw_20_21_2
incidence_sw_20_21_2
n_tested_sw_20_21_2
p_diag_sw_20_21_2
p_onart_diag_sw_20_21_2
p_onart_vl1000_sw_20_21_2
t_sw_newp_20_21_2
p_newp_sw_20_21_2
prop_sw_program_visit_20_21_2;
run;

proc means n p50 p5 p95 mean lclm uclm;var
n_tested_sw_15_20_1 n_tested_sw_15_20_2;run;

n_sw_1564_15_20_1
prop_w_1564_sw_15_20_1
prevalence_sw_15_20_1
incidence_sw_15_20_1
p_diag_sw_15_20_1
p_onart_diag_sw_15_20_1
p_onart_vl1000_sw_15_20_1
t_sw_newp_15_20_1
p_newp_sw_15_20_1
prop_sw_program_visit_15_20_1

n_sw_1564_15_20_2
prop_w_1564_sw_15_20_2
prevalence_sw_15_20_2
incidence_sw_15_20_2
p_diag_sw_15_20_2
p_onart_diag_sw_15_20_2
p_onart_vl1000_sw_15_20_2
t_sw_newp_15_20_2
p_newp_sw_15_20_2
prop_sw_program_visit_15_20_2;
run;

proc means
