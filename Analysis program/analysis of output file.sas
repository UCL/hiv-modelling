libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\vmmc\";

data a;
set a.wide_vmmc_28_7_20_10am;

*difference in HIV death rate;

ddeath_rate_hiv_m_20_40_2 = death_rate_hiv_m_20_40_2 - death_rate_hiv_m_20_40_1;

*dalys averted;
d_ddaly_all_20_40_2 = -(ddaly_all_20_40_2 - ddaly_all_20_40_1);

*difference in costs;
d_dcost_20_40_2 = dcost_20_40_2 - dcost_20_40_1;


*net dalys;
ndb_500_20_40_1 =  ddaly_all_20_40_1 + (dcost_20_40_1)/0.0005;
ndb_500_20_40_2 =  ddaly_all_20_40_2 + (dcost_20_40_2)/0.0005; 


*net dalys averted;
d_net_dalys_20_40_2 = -(ndb_500_20_40_2 - ndb_500_20_40_1);


*nnt;
*difference in number of circumcisions;
d_n_mcirc_20_40_2 = n_mcirc1549__20_40_2 - n_mcirc1549__20_40_1;

*difference in number of new infections - all;
d_n_new_inf_20_40_2 = n_new_inf1549_20_40_2 - n_new_inf1549_20_40_1;


*difference in number of new infections - male only;

d_n_new_inf_m_20_40_2 = n_new_inf1549m_20_40_2 - n_new_inf1549m_20_40_1;

if d_n_mcirc_20_40_2 gt 0 and (-d_n_new_inf_20_40_2) gt 0 then nnt_20_40_2 = d_n_mcirc_20_40_2 / (-d_n_new_inf_20_40_2);

*cost per infection averted - all;
if (-d_n_new_inf_20_40_2) gt 0 then cost_inf_avert_20_40_2 = (d_dcost_20_40_2 / (-d_n_new_inf_20_40_2))*1000000;


*cost per infection averted - males only;
if (-d_n_new_inf_20_40_2) gt 0 then cost_inf_avert_m_20_40_2 = (d_dcost_20_40_2 / (-d_n_new_inf_m_20_40_2))*1000000;


*cost per daly averted =icer?;
if d_ddaly_all_20_40_2 gt 0 then cost_daly_avert_20_40_2 = (d_dcost_20_40_2 / d_ddaly_all_20_40_2)*1000000;
run;



***table 1;
proc means n p50 p5 p95;var
prevalence1549_20 prevalence1549m_20 prevalence1549w_20
incidence1549_20 incidence1549m_20 incidence1549w_20
prop_1564_onprep_20 
p_diag_20 p_diag_m_20 p_diag_w_20
p_onart_diag_20 p_onart_diag_m_20 p_onart_diag_w_20
p_vl1000_20 p_vl1000_m_20 p_vl1000_w_20
p_onart_vl1000_20 p_onart_vl1000_m_20 p_onart_vl1000_w_20
p_mcirc_1549m_20 p_mcirc_1519m_20 p_mcirc_2024m_20 p_mcirc_2529m_20 p_mcirc_3039m_20 p_mcirc_4049m_20;
run;

proc means n p50 p5 p95;var
n_vmmc1549_3m_19_20_1
p_vmmc_1549m_u_19_20_1 p_vmmc_1519m_u_19_20_1  p_vmmc_2024m_u_19_20_1  p_vmmc_2529m_u_19_20_1 p_vmmc_3039m_u_19_20_1 p_vmmc_4049m_u_19_20_1;
run;
proc contents;run;


proc means n p50 p5 p95;var

p_vmmc_1519m_20_25_1 p_vmmc_1519m_20_40_1 p_vmmc_1519m_20_70_1
p_vmmc_1519m_20_25_2 p_vmmc_1519m_20_40_2 p_vmmc_1519m_20_70_2

p_vmmc_2024m_20_25_1 p_vmmc_2024m_20_40_1 p_vmmc_2024m_20_70_1
p_vmmc_2024m_20_25_2 p_vmmc_2024m_20_40_2 p_vmmc_2024m_20_70_2

p_vmmc_2529m_20_25_1 p_vmmc_2529m_20_40_1 p_vmmc_2529m_20_70_1
p_vmmc_2529m_20_25_2 p_vmmc_2529m_20_40_2 p_vmmc_2529m_20_70_2

p_vmmc_3039m_20_25_1 p_vmmc_3039m_20_40_1 p_vmmc_3039m_20_70_1
p_vmmc_3039m_20_25_2 p_vmmc_3039m_20_40_2 p_vmmc_3039m_20_70_2

p_vmmc_4049m_20_25_1 p_vmmc_4049m_20_40_1 p_vmmc_4049m_20_70_1
p_vmmc_4049m_20_25_2 p_vmmc_4049m_20_40_2 p_vmmc_4049m_20_70_2

p_vmmc_1549m_20_25_1 p_vmmc_1549m_20_40_1 p_vmmc_1549m_20_70_1
p_vmmc_1549m_20_25_2 p_vmmc_1549m_20_40_2 p_vmmc_1549m_20_70_2
;run;

proc means n p50 p5 p95;var 
incidence1549_20_25_1  incidence1549_20_40_1
incidence1549_20_25_2  incidence1549_20_40_2
incidence1549_20_25_3  incidence1549_20_40_3
incidence1549_20_25_4  incidence1549_20_40_4
;run;

proc means n p50 p5 p95;var 
prevalence1549_20_25_1 prevalence1549_20_40_1
prevalence1549_20_25_2 prevalence1549_20_40_2
prevalence1549_20_25_3 prevalence1549_20_40_3
prevalence1549_20_25_4 prevalence1549_20_40_4
;run;


proc means n p50 p5 p95;var 
prevalence1549m_20_25_1 prevalence1549m_20_40_1
prevalence1549m_20_25_2 prevalence1549m_20_40_2
prevalence1549m_20_25_3 prevalence1549m_20_40_3
prevalence1549m_20_25_4 prevalence1549m_20_40_4
;run;

proc means n p50 p5 p95;var 
death_rate_hiv_m_20_25_1 death_rate_hiv_m_20_40_1
death_rate_hiv_m_20_25_2 death_rate_hiv_m_20_40_2
death_rate_hiv_m_20_25_3 death_rate_hiv_m_20_40_3
death_rate_hiv_m_20_25_4 death_rate_hiv_m_20_40_4
;run;

proc means n p50 p5 p95;var 
ddeath_rate_hiv_m_20_25_2 ddeath_rate_hiv_m_20_40_2
ddeath_rate_hiv_m_20_25_3  ddeath_rate_hiv_m_20_40_3
ddeath_rate_hiv_m_20_25_4  ddeath_rate_hiv_m_20_40_4
;run;

proc means n p50 p5 p95;var  
d_ddaly_all_20_25_2  d_ddaly_all_20_40_2
d_ddaly_all_20_25_3  d_ddaly_all_20_40_3
d_ddaly_all_20_25_4  d_ddaly_all_20_40_4
;run;

proc means n p50 p5 p95;var
dcost_20_25_1 dcost_20_40_1
dcost_20_25_2 dcost_20_40_2
dcost_20_25_3 dcost_20_40_3
dcost_20_25_4 dcost_20_40_4
;run;

proc means n p50 p5 p95;var 
d_dcost_20_25_2 d_dcost_20_40_2
d_dcost_20_25_3 d_dcost_20_40_3
d_dcost_20_25_4 d_dcost_20_40_4
;run;

proc means n p50 p5 p95;var 
d_net_dalys_20_25_2  d_net_dalys_20_40_2
d_net_dalys_20_25_3  d_net_dalys_20_40_3
d_net_dalys_20_25_4  d_net_dalys_20_40_4
;run;

proc means n p50 p5 p95;var 
nnt_20_25_2  nnt_20_40_2
nnt_20_25_3  nnt_20_40_3
nnt_20_25_4  nnt_20_40_4
;run;

proc means n p50 p5 p95;var 
cost_inf_avert_20_25_2  cost_inf_avert_20_40_2
cost_inf_avert_20_25_3  cost_inf_avert_20_40_3
cost_inf_avert_20_25_4  cost_inf_avert_20_40_4
;run;

proc means n p50 p5 p95;var 
cost_daly_avert_20_25_2  cost_daly_avert_20_40_2
cost_daly_avert_20_25_3  cost_daly_avert_20_40_3
cost_daly_avert_20_25_4  cost_daly_avert_20_40_4
;run;



