libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\vmmc\";

***new_vmmc was not set to 0 in file used below so did extra runs up to 2020 with corrected file to get vmmc rates for 2019;
data rates;
set a.wide_vmmc_12_8_20_1pm;
run;

proc means n p50 p5 p95;var
n_new_vmmc1549_py_19_20_1  n_new_vmmc1049_py_19_20_1
p_new_vmmc_1549m_u_19_20_1  p_new_vmmc_u_1049m_19_20_1  p_new_vmmc_1014m_u_19_20_1 p_new_vmmc_1519m_u_19_20_1 
p_new_vmmc_2024m_u_19_20_1  p_new_vmmc_2529m_u_19_20_1  p_new_vmmc_3034m_u_19_20_1  p_new_vmmc_3539m_u_19_20_1
p_new_vmmc_4044m_u_19_20_1  p_new_vmmc_4549m_u_19_20_1; 
run;


data a;
set a.wide_vmmc_7_8_20_11am;

*difference in vmmc rates;

d_p_vmmc_inc1014m_20_25_2 = (p_vmmc_inc1014m_20_25_2 - p_vmmc_inc1014m_20_25_1)*100;
d_p_vmmc_1549m_20_25_2 = (p_vmmc_1549m_20_25_2 - p_vmmc_1549m_20_25_1)*100;
d_p_vmmc_1549m_20_25_2 = (p_vmmc_1549m_20_25_2 - p_vmmc_1549m_20_25_1)*100;
d_p_vmmc_1014m_20_25_2 = (p_vmmc_1014m_20_25_2 - p_vmmc_1014m_20_25_1)*100;
d_p_vmmc_1519m_20_25_2 = (p_vmmc_1519m_20_25_2 - p_vmmc_1519m_20_25_1)*100;
d_p_vmmc_2024m_20_25_2 = (p_vmmc_2024m_20_25_2 - p_vmmc_2024m_20_25_1)*100;
d_p_vmmc_2529m_20_25_2 = (p_vmmc_2529m_20_25_2 - p_vmmc_2529m_20_25_1)*100;
d_p_vmmc_3039m_20_25_2 = (p_vmmc_3039m_20_25_2 - p_vmmc_3039m_20_25_1)*100;
d_p_vmmc_4049m_20_25_2 = (p_vmmc_4049m_20_25_2 - p_vmmc_4049m_20_25_1)*100;

d_p_vmmc_inc1014m_20_40_2 = (p_vmmc_inc1014m_20_40_2 - p_vmmc_inc1014m_20_40_1)*100;
d_p_vmmc_1549m_20_40_2 = (p_vmmc_1549m_20_40_2 - p_vmmc_1549m_20_40_1)*100;
d_p_vmmc_1549m_20_40_2 = (p_vmmc_1549m_20_40_2 - p_vmmc_1549m_20_40_1)*100;
d_p_vmmc_1014m_20_40_2 = (p_vmmc_1014m_20_40_2 - p_vmmc_1014m_20_40_1)*100;
d_p_vmmc_1519m_20_40_2 = (p_vmmc_1519m_20_40_2 - p_vmmc_1519m_20_40_1)*100;
d_p_vmmc_2024m_20_40_2 = (p_vmmc_2024m_20_40_2 - p_vmmc_2024m_20_40_1)*100;
d_p_vmmc_2529m_20_40_2 = (p_vmmc_2529m_20_40_2 - p_vmmc_2529m_20_40_1)*100;
d_p_vmmc_3039m_20_40_2 = (p_vmmc_3039m_20_40_2 - p_vmmc_3039m_20_40_1)*100;
d_p_vmmc_4049m_20_40_2 = (p_vmmc_4049m_20_40_2 - p_vmmc_4049m_20_40_1)*100;

d_p_vmmc_inc1014m_20_70_2 = (p_vmmc_inc1014m_20_70_2 - p_vmmc_inc1014m_20_70_1)*100;
d_p_vmmc_1549m_20_70_2 = (p_vmmc_1549m_20_70_2 - p_vmmc_1549m_20_70_1)*100;
d_p_vmmc_1549m_20_70_2 = (p_vmmc_1549m_20_70_2 - p_vmmc_1549m_20_70_1)*100;
d_p_vmmc_1014m_20_70_2 = (p_vmmc_1014m_20_70_2 - p_vmmc_1014m_20_70_1)*100;
d_p_vmmc_1519m_20_70_2 = (p_vmmc_1519m_20_70_2 - p_vmmc_1519m_20_70_1)*100;
d_p_vmmc_2024m_20_70_2 = (p_vmmc_2024m_20_70_2 - p_vmmc_2024m_20_70_1)*100;
d_p_vmmc_2529m_20_70_2 = (p_vmmc_2529m_20_70_2 - p_vmmc_2529m_20_70_1)*100;
d_p_vmmc_3039m_20_70_2 = (p_vmmc_3039m_20_70_2 - p_vmmc_3039m_20_70_1)*100;
d_p_vmmc_4049m_20_70_2 = (p_vmmc_4049m_20_70_2 - p_vmmc_4049m_20_70_1)*100;

*difference in HIV incidence rates - x 10 as incidence is calculated per 100py but we want 1000py for report;
d_incidence1549m_20_25_2 = (incidence1549m_20_25_2 - incidence1549m_20_25_1)*10;
d_incidence1549m_20_40_2 = (incidence1549m_20_40_2 - incidence1549m_20_40_1)*10;
d_incidence1549m_20_70_2 = (incidence1549m_20_70_2 - incidence1549m_20_70_1)*10;

d_incidence1549w_20_25_2 = (incidence1549w_20_25_2 - incidence1549w_20_25_1)*10;
d_incidence1549w_20_40_2 = (incidence1549w_20_40_2 - incidence1549w_20_40_1)*10;
d_incidence1549w_20_70_2 = (incidence1549w_20_70_2 - incidence1549w_20_70_1)*10;

*difference in HIV prevalence rates ;
d_prevalence1549m_20_25_2 =  (prevalence1549m_20_25_2 - prevalence1549m_20_25_1)*100;
d_prevalence1549m_20_40_2 =  (prevalence1549m_20_40_2 - prevalence1549m_20_40_1)*100;
d_prevalence1549m_20_70_2 =  (prevalence1549m_20_70_2 - prevalence1549m_20_70_1)*100;

d_prevalence1549w_20_25_2 =  (prevalence1549w_20_25_2 - prevalence1549w_20_25_1)*100;
d_prevalence1549w_20_40_2 =  (prevalence1549w_20_40_2 - prevalence1549w_20_40_1)*100;
d_prevalence1549w_20_70_2 =  (prevalence1549w_20_70_2 - prevalence1549w_20_70_1)*100; 

*difference in HIV death rate;
ddeath_rate_hiv_m_20_25_2 = death_rate_hiv_m_20_25_2 - death_rate_hiv_m_20_25_1;
ddeath_rate_hiv_m_20_40_2 = death_rate_hiv_m_20_40_2 - death_rate_hiv_m_20_40_1;
ddeath_rate_hiv_m_20_70_2 = death_rate_hiv_m_20_70_2 - death_rate_hiv_m_20_70_1;

ddeath_rate_hiv_all_m_20_25_2 = death_rate_hiv_all_m_20_25_2 - death_rate_hiv_all_m_20_25_1;
ddeath_rate_hiv_all_m_20_40_2 = death_rate_hiv_all_m_20_40_2 - death_rate_hiv_all_m_20_40_1;
ddeath_rate_hiv_all_m_20_70_2 = death_rate_hiv_all_m_20_70_2 - death_rate_hiv_all_m_20_70_1;
 															   


*infections averted;
inf_avert_20_25_2 = ((n_new_inf1549_20_25_1 - n_new_inf1549_20_25_2)/n_new_inf1549_20_25_1)*100;
inf_avert_20_40_2 = ((n_new_inf1549_20_40_1 - n_new_inf1549_20_40_2)/n_new_inf1549_20_40_1)*100;
inf_avert_20_70_2 = ((n_new_inf1549_20_70_1 - n_new_inf1549_20_70_2)/n_new_inf1549_20_70_1)*100;

*dalys averted;
d_ddaly_all_20_25_2 = ddaly_all_20_25_1 - ddaly_all_20_25_2;
d_ddaly_all_20_40_2 = ddaly_all_20_40_1 - ddaly_all_20_40_2;
d_ddaly_all_20_70_2 = ddaly_all_20_70_1 - ddaly_all_20_70_2;

*difference in costs;
d_dcost_20_25_2 = dcost_20_25_2 - dcost_20_25_1;
d_dcost_20_40_2 = dcost_20_40_2 - dcost_20_40_1;
d_dcost_20_70_2 = dcost_20_70_2 - dcost_20_70_1;

*net dalys averted;
ndb_500_20_25_1 =  ddaly_all_20_25_1 + (dcost_20_25_1)/0.0005;
ndb_500_20_25_2 =  ddaly_all_20_25_2 + (dcost_20_25_2)/0.0005; 
ndb_500_20_40_1 =  ddaly_all_20_40_1 + (dcost_20_40_1)/0.0005;
ndb_500_20_40_2 =  ddaly_all_20_40_2 + (dcost_20_40_2)/0.0005; 
ndb_500_20_70_1 =  ddaly_all_20_70_1 + (dcost_20_70_1)/0.0005;
ndb_500_20_70_2 =  ddaly_all_20_70_2 + (dcost_20_70_2)/0.0005; 

*net dalys averted;
d_net_dalys_20_25_2 = ndb_500_20_25_1 - ndb_500_20_25_2;
d_net_dalys_20_40_2 = ndb_500_20_40_1 - ndb_500_20_40_2;
d_net_dalys_20_70_2 = ndb_500_20_70_1 - ndb_500_20_70_2;

*nnt;
*difference in number of circumcisions;
d_n_mcirc_20_25_2 = n_mcirc1549_py_20_25_2 - n_mcirc1549_py_20_25_1;
d_n_mcirc_20_40_2 = n_mcirc1549_py_20_40_2 - n_mcirc1549_py_20_40_1;
d_n_mcirc_20_70_2 = n_mcirc1549_py_20_70_2 - n_mcirc1549_py_20_70_1;
*difference in number of new infections - all;
d_n_new_inf_20_25_2 = n_new_inf1549_20_25_2 - n_new_inf1549_20_25_1;
d_n_new_inf_20_40_2 = n_new_inf1549_20_40_2 - n_new_inf1549_20_40_1;
d_n_new_inf_20_70_2 = n_new_inf1549_20_70_2 - n_new_inf1549_20_70_1;
*difference in number of new infections - male only;
d_n_new_inf_m_20_25_2 = n_new_inf1549m_20_25_2 - n_new_inf1549m_20_25_1;
d_n_new_inf_m_20_40_2 = n_new_inf1549m_20_40_2 - n_new_inf1549m_20_40_1;
d_n_new_inf_m_20_70_2 = n_new_inf1549m_20_70_2 - n_new_inf1549m_20_70_1;

if (-d_n_new_inf_m_20_25_2) gt 0 then nnt_20_25_2 = d_n_mcirc_20_25_2 / (-d_n_new_inf_m_20_25_2);
if (-d_n_new_inf_m_20_40_2) gt 0 then nnt_20_40_2 = d_n_mcirc_20_40_2 / (-d_n_new_inf_m_20_40_2);
if (-d_n_new_inf_m_20_70_2) gt 0 then nnt_20_70_2 = d_n_mcirc_20_70_2 / (-d_n_new_inf_m_20_70_2);


*cost per infection averted - all;
if (-d_n_new_inf_20_25_2) gt 0 then cost_inf_avert_20_25_2 = (d_dcost_20_25_2 / (-d_n_new_inf_20_25_2))*1000000;
if (-d_n_new_inf_20_40_2) gt 0 then cost_inf_avert_20_40_2 = (d_dcost_20_40_2 / (-d_n_new_inf_20_40_2))*1000000;
if (-d_n_new_inf_20_70_2) gt 0 then cost_inf_avert_20_70_2 = (d_dcost_20_70_2 / (-d_n_new_inf_20_70_2))*1000000;


*cost per infection averted - males only;
if (-d_n_new_inf_20_25_2) gt 0 then cost_inf_avert_m_20_25_2 = (d_dcost_20_25_2 / (-d_n_new_inf_m_20_25_2))*1000000;
if (-d_n_new_inf_20_40_2) gt 0 then cost_inf_avert_m_20_40_2 = (d_dcost_20_40_2 / (-d_n_new_inf_m_20_40_2))*1000000;
if (-d_n_new_inf_20_70_2) gt 0 then cost_inf_avert_m_20_70_2 = (d_dcost_20_70_2 / (-d_n_new_inf_m_20_70_2))*1000000;

*cost per daly averted =icer?;
if d_ddaly_all_20_25_2 gt 0 then cost_daly_avert_20_25_2 = (d_dcost_20_25_2 / d_ddaly_all_20_25_2)*1000000;
if d_ddaly_all_20_40_2 gt 0 then cost_daly_avert_20_40_2 = (d_dcost_20_40_2 / d_ddaly_all_20_40_2)*1000000;
if d_ddaly_all_20_70_2 gt 0 then cost_daly_avert_20_70_2 = (d_dcost_20_70_2 / d_ddaly_all_20_70_2)*1000000;


run;

proc contents;run;

***table 1;
proc means n p50 p5 p95;var
prevalence1549_20 prevalence1549m_20 prevalence1549w_20
incidence1549_20 incidence1549m_20 incidence1549w_20
prop_1564_onprep_20 
p_diag_20 p_diag_m_20 p_diag_w_20
p_onart_diag_20 p_onart_diag_m_20 p_onart_diag_w_20
p_vl1000_20 p_vl1000_m_20 p_vl1000_w_20
p_onart_vl1000_20 p_onart_vl1000_m_20 p_onart_vl1000_w_20
p_mcirc_1549m_20 p_mcirc_inc1014m_20 p_mcirc_1014m_20 p_mcirc_1519m_20 p_mcirc_2024m_20 p_mcirc_2529m_20 p_mcirc_3034m_20 p_mcirc_3539m_20 
p_mcirc_4044m_20 p_mcirc_4549m_20;
run;

***table 1, vmmc in 2019;
proc means n p50 p5 p95;var
n_new_vmmc1549_py_19_20_1  n_new_vmmc1049_py_19_20_1
p_new_vmmc_1549m_u_19_20_1  p_new_vmmc_u_1049m_19_20_1  p_new_vmmc_1014m_u_19_20_1 p_new_vmmc_1519m_u_19_20_1 
p_new_vmmc_2024m_u_19_20_1  p_new_vmmc_2529m_u_19_20_1  p_new_vmmc_3034m_u_19_20_1  p_new_vmmc_3539m_u_19_20_1
p_new_vmmc_4044m_u_19_20_1  p_new_vmmc_4549m_u_19_20_1; 
run;

***vmmc rates by option;
proc means n mean p50 p5 p95 lclm uclm;var 
p_vmmc_1549m_20_25_1  p_vmmc_1549m_20_40_1  p_vmmc_1549m_20_70_1
p_vmmc_1549m_20_25_2  p_vmmc_1549m_20_40_2  p_vmmc_1549m_20_70_2
p_vmmc_inc1014m_20_25_1  p_vmmc_inc1014m_20_40_1  p_vmmc_inc1014m_20_70_1
p_vmmc_inc1014m_20_25_2  p_vmmc_inc1014m_20_40_2  p_vmmc_inc1014m_20_70_2
p_vmmc_1014m_20_25_1  p_vmmc_1014m_20_40_1  p_vmmc_1014m_20_70_1
p_vmmc_1014m_20_25_2  p_vmmc_1014m_20_40_2  p_vmmc_1014m_20_70_2
p_vmmc_1519m_20_25_1  p_vmmc_1519m_20_40_1  p_vmmc_1519m_20_70_1
p_vmmc_1519m_20_25_2  p_vmmc_1519m_20_40_2  p_vmmc_1519m_20_70_2
p_vmmc_2024m_20_25_1  p_vmmc_2024m_20_40_1  p_vmmc_2024m_20_70_1
p_vmmc_2024m_20_25_2  p_vmmc_2024m_20_40_2  p_vmmc_2024m_20_70_2
p_vmmc_2529m_20_25_1  p_vmmc_2529m_20_40_1  p_vmmc_2529m_20_70_1
p_vmmc_2529m_20_25_2  p_vmmc_2529m_20_40_2  p_vmmc_2529m_20_70_2
p_vmmc_3039m_20_25_1  p_vmmc_3039m_20_40_1  p_vmmc_3039m_20_70_1
p_vmmc_3039m_20_25_2  p_vmmc_3039m_20_40_2  p_vmmc_3039m_20_70_2
p_vmmc_4049m_20_25_1  p_vmmc_4049m_20_40_1  p_vmmc_4049m_20_70_1
p_vmmc_4049m_20_25_2  p_vmmc_4049m_20_40_2  p_vmmc_4049m_20_70_2
;run;

***difference in vmmc rates according to option;
proc means n mean p50 p5 p95 lclm uclm;var 
d_p_vmmc_inc1014m_20_25_2  d_p_vmmc_inc1014m_20_40_2  d_p_vmmc_inc1014m_20_70_2
d_p_vmmc_1549m_20_25_2  d_p_vmmc_1549m_20_40_2  d_p_vmmc_1549m_20_70_2
d_p_vmmc_1014m_20_25_2  d_p_vmmc_1014m_20_40_2  d_p_vmmc_1014m_20_70_2
d_p_vmmc_1519m_20_25_2  d_p_vmmc_1519m_20_40_2  d_p_vmmc_1519m_20_70_2
d_p_vmmc_2024m_20_25_2  d_p_vmmc_2024m_20_40_2  d_p_vmmc_2024m_20_70_2
d_p_vmmc_2529m_20_25_2  d_p_vmmc_2529m_20_40_2  d_p_vmmc_2529m_20_70_2
d_p_vmmc_3039m_20_25_2  d_p_vmmc_3039m_20_40_2  d_p_vmmc_3039m_20_70_2
d_p_vmmc_4049m_20_25_2  d_p_vmmc_4049m_20_40_2  d_p_vmmc_4049m_20_70_2;
run;

***incidence;
proc means n mean p50 p5 p95 lclm uclm;var 
incidence1549m_20_25_1  incidence1549m_20_40_1  incidence1549m_20_70_1
incidence1549m_20_25_2  incidence1549m_20_40_2  incidence1549m_20_70_2
d_incidence1549m_20_25_2  d_incidence1549m_20_40_2  d_incidence1549m_20_70_2

incidence1549w_20_25_1  incidence1549w_20_40_1  incidence1549w_20_70_1
incidence1549w_20_25_2  incidence1549w_20_40_2  incidence1549w_20_70_2
d_incidence1549w_20_25_2  d_incidence1549w_20_40_2  d_incidence1549w_20_70_2
;run;

***prevalence;
proc means n mean p50 p5 p95 lclm uclm;var 
prevalence1549m_20_25_1 prevalence1549m_20_40_1 prevalence1549m_20_70_1
prevalence1549m_20_25_2 prevalence1549m_20_40_2  prevalence1549m_20_70_2
d_prevalence1549m_20_25_2 d_prevalence1549m_20_40_2  d_prevalence1549m_20_70_2

prevalence1549w_20_25_1 prevalence1549w_20_40_1 prevalence1549w_20_70_1
prevalence1549w_20_25_2 prevalence1549w_20_40_2  prevalence1549w_20_70_2
d_prevalence1549w_20_25_2 d_prevalence1549w_20_40_2  d_prevalence1549w_20_70_2
;run;

***HIV death rate;
proc means n mean p50 p5 p95 lclm uclm;var 
death_rate_hiv_m_20_25_1 death_rate_hiv_m_20_40_1 death_rate_hiv_m_20_70_1
death_rate_hiv_m_20_25_2 death_rate_hiv_m_20_40_2 death_rate_hiv_m_20_70_2
ddeath_rate_hiv_m_20_25_2 ddeath_rate_hiv_m_20_40_2  ddeath_rate_hiv_m_20_70_2

death_rate_hiv_all_m_20_25_1 death_rate_hiv_all_m_20_40_1 death_rate_hiv_all_m_20_70_1
death_rate_hiv_all_m_20_25_2 death_rate_hiv_all_m_20_40_2 death_rate_hiv_all_m_20_70_2
ddeath_rate_hiv_all_m_20_25_2 ddeath_rate_hiv_all_m_20_40_2  ddeath_rate_hiv_all_m_20_70_2
;run;

***% infections averted;
proc means n mean p50 p5 p95 lclm uclm;var 
inf_avert_20_25_2  inf_avert_20_40_2  inf_avert_20_70_2
;run;

***DALYs averted;
proc means n mean p50 p5 p95 lclm uclm;var 
d_ddaly_all_20_25_2  d_ddaly_all_20_40_2  d_ddaly_all_20_70_2
;run;

***Total cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_20_25_1  dcost_20_40_1  dcost_20_70_1
dcost_20_25_2  dcost_20_40_2  dcost_20_70_2
;run;

***VMMC cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_circ_20_25_1  dcost_circ_20_40_1  dcost_circ_20_70_1
dcost_circ_20_25_2  dcost_circ_20_40_2  dcost_circ_20_70_2
;run;

**ART and clinical care cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_clin_care_20_25_1  dcost_clin_care_20_40_1  dcost_clin_care_20_70_1
dcost_clin_care_20_25_2  dcost_clin_care_20_40_2  dcost_clin_care_20_70_2
;run;

***HIV test cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dtest_cost_20_25_1  dtest_cost_20_40_1  dtest_cost_20_70_1
dtest_cost_20_25_2  dtest_cost_20_40_2  dtest_cost_20_70_2
;run;

***Other costs;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_condom_dn_20_25_1 dcost_drug_level_test_20_25_1  dcost_prep_visit_20_25_1
dcost_prep_20_25_1 dcost_child_hiv_20_25_1  dcost_non_aids_pre_death_20_25_1
dcost_condom_dn_20_40_1 dcost_drug_level_test_20_40_1  dcost_prep_visit_20_40_1
dcost_prep_20_40_1 dcost_child_hiv_20_40_1  dcost_non_aids_pre_death_20_40_1
dcost_condom_dn_20_70_1 dcost_drug_level_test_20_70_1  dcost_prep_visit_20_70_1
dcost_prep_20_70_1 dcost_child_hiv_20_70_1  dcost_non_aids_pre_death_20_70_1

dcost_condom_dn_20_25_2 dcost_drug_level_test_20_25_2  dcost_prep_visit_20_25_2
dcost_prep_20_25_2 dcost_child_hiv_20_25_2  dcost_non_aids_pre_death_20_25_2
dcost_condom_dn_20_40_2 dcost_drug_level_test_20_40_2  dcost_prep_visit_20_40_2
dcost_prep_20_40_2 dcost_child_hiv_20_40_2  dcost_non_aids_pre_death_20_40_2
dcost_condom_dn_20_70_2 dcost_drug_level_test_20_70_2  dcost_prep_visit_20_70_2
dcost_prep_20_70_2 dcost_child_hiv_20_70_2  dcost_non_aids_pre_death_20_70_2;
run;


***difference in total cost;
proc means n mean p50 p5 p95 lclm uclm;var 
d_dcost_20_25_2  d_dcost_20_40_2  d_dcost_20_70_2
;run;

***net DALYs averted;
proc means n mean p50 p5 p95 lclm uclm;var 
d_net_dalys_20_25_2  d_net_dalys_20_40_2  d_net_dalys_20_70_2
;run;

proc freq;table d_net_dalys_20_25_2 ;where d_net_dalys_20_25_2 gt 0; run;
proc freq;table d_net_dalys_20_40_2 ;where d_net_dalys_20_40_2 gt 0; run;
proc freq;table d_net_dalys_20_70_2 ;where d_net_dalys_20_70_2 gt 0; run;



***NNT;
proc means n mean p50 p5 p95 lclm uclm;var 
nnt_20_25_2  nnt_20_40_2  nnt_20_70_2
;run;

***cost per infection averted;
proc means n mean p50 p5 p95 lclm uclm;var 
cost_inf_avert_20_25_2  cost_inf_avert_20_40_2  cost_inf_avert_20_70_2
;run;

***icer;
proc means n p50 p5 p95;var 
cost_daly_avert_20_25_2  cost_daly_avert_20_40_2 cost_daly_avert_20_70_2
;run;



