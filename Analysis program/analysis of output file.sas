libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\fsw\";


data a; 
set a.wide_fsw_22_02_21_8am ;












***table 1;
proc means n p50 p5 p95;var
prevalence1549_15 prevalence1549m_15 prevalence1549w_15
incidence1549_15 incidence1549m_15 incidence1549w_15
prop_1564_onprep_15 
p_diag_15 p_diag_m_15 p_diag_w_15
p_onart_diag_15 p_onart_diag_m_15 p_onart_diag_w_15
p_vl1000_15 p_vl1000_m_15 p_vl1000_w_15
p_onart_vl1000_15 p_onart_vl1000_m_15 p_onart_vl1000_w_15
death_rate_hiv_all_15 death_rate_hiv_all_m_15 death_rate_hiv_all_w_15;
run;

proc means n p50 p5 p95;var
n_sw_1564_15
prop_w_1564_sw_15
prevalence_sw_15
incidence_sw_15
p_diag_sw_15
p_onart_diag_sw_15
p_onart_vl1000_sw_15

p_newp_sw_15;
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
