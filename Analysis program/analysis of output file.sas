libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\vmmc\";

***For the paper, use 29_03_21_6pm files, with 120 suffix denoting a change in VMMC costs;

data a;
set a.wide_vmmc_12_10_20_5pm;
if lower_future_art_cov=1 then delete; ***This has now been removed from the core program so only considering runs in which lower_future_art_cov=0 here;
if run in (3224196, 5149305, 6994967, 11383263, 16805161, 16978644) then delete; ***456 runs left after deleting above - remove 6 runs to get 450 and then add in 50 runs from output file below;
run;

data b;
set a.wide_vmmc_29_03_21_6pm;
*set a.wide_vmmc_29_03_21_6pm_120;
*set a.wide_vmmc_29_03_21_6pm_60;
*set a.wide_vmmc_29_03_21_6pm_disc5;
*set a.wide_vmmc_29_03_21_6pm_lowart;
run;
proc freq;table lower_future_art_cov;run;

data c;
set b;  


***option 1= continuation of VMMC;
***option 2= no further VMMC;

*difference in vmmc rates;

d_p_vmmc_inc1014m_21_26_1 = (p_vmmc_inc1014m_21_26_1 - p_vmmc_inc1014m_21_26_2)*100;
d_p_vmmc_1549m_21_26_1 = (p_vmmc_1549m_21_26_1 - p_vmmc_1549m_21_26_2)*100;
d_p_vmmc_1549m_21_26_1 = (p_vmmc_1549m_21_26_1 - p_vmmc_1549m_21_26_2)*100;
d_p_vmmc_1014m_21_26_1 = (p_vmmc_1014m_21_26_1 - p_vmmc_1014m_21_26_2)*100;
d_p_vmmc_1519m_21_26_1 = (p_vmmc_1519m_21_26_1 - p_vmmc_1519m_21_26_2)*100;
d_p_vmmc_2024m_21_26_1 = (p_vmmc_2024m_21_26_1 - p_vmmc_2024m_21_26_2)*100;
d_p_vmmc_2529m_21_26_1 = (p_vmmc_2529m_21_26_1 - p_vmmc_2529m_21_26_2)*100;
d_p_vmmc_3039m_21_26_1 = (p_vmmc_3039m_21_26_1 - p_vmmc_3039m_21_26_2)*100;
d_p_vmmc_4049m_21_26_1 = (p_vmmc_4049m_21_26_1 - p_vmmc_4049m_21_26_2)*100;

d_p_vmmc_inc1014m_21_41_1 = (p_vmmc_inc1014m_21_41_1 - p_vmmc_inc1014m_21_41_2)*100;
d_p_vmmc_1549m_21_41_1 = (p_vmmc_1549m_21_41_1 - p_vmmc_1549m_21_41_2)*100;
d_p_vmmc_1549m_21_41_1 = (p_vmmc_1549m_21_41_1 - p_vmmc_1549m_21_41_2)*100;
d_p_vmmc_1014m_21_41_1 = (p_vmmc_1014m_21_41_1 - p_vmmc_1014m_21_41_2)*100;
d_p_vmmc_1519m_21_41_1 = (p_vmmc_1519m_21_41_1 - p_vmmc_1519m_21_41_2)*100;
d_p_vmmc_2024m_21_41_1 = (p_vmmc_2024m_21_41_1 - p_vmmc_2024m_21_41_2)*100;
d_p_vmmc_2529m_21_41_1 = (p_vmmc_2529m_21_41_1 - p_vmmc_2529m_21_41_2)*100;
d_p_vmmc_3039m_21_41_1 = (p_vmmc_3039m_21_41_1 - p_vmmc_3039m_21_41_2)*100;
d_p_vmmc_4049m_21_41_1 = (p_vmmc_4049m_21_41_1 - p_vmmc_4049m_21_41_2)*100;

d_p_vmmc_inc1014m_21_71_1 = (p_vmmc_inc1014m_21_71_1 - p_vmmc_inc1014m_21_71_2)*100;
d_p_vmmc_1549m_21_71_1 = (p_vmmc_1549m_21_71_1 - p_vmmc_1549m_21_71_2)*100;
d_p_vmmc_1549m_21_71_1 = (p_vmmc_1549m_21_71_1 - p_vmmc_1549m_21_71_2)*100;
d_p_vmmc_1014m_21_71_1 = (p_vmmc_1014m_21_71_1 - p_vmmc_1014m_21_71_2)*100;
d_p_vmmc_1519m_21_71_1 = (p_vmmc_1519m_21_71_1 - p_vmmc_1519m_21_71_2)*100;
d_p_vmmc_2024m_21_71_1 = (p_vmmc_2024m_21_71_1 - p_vmmc_2024m_21_71_2)*100;
d_p_vmmc_2529m_21_71_1 = (p_vmmc_2529m_21_71_1 - p_vmmc_2529m_21_71_2)*100;
d_p_vmmc_3039m_21_71_1 = (p_vmmc_3039m_21_71_1 - p_vmmc_3039m_21_71_2)*100;
d_p_vmmc_4049m_21_71_1 = (p_vmmc_4049m_21_71_1 - p_vmmc_4049m_21_71_2)*100;

*difference in HIV incidence rates - x 10 as incidence is calculated per 100py but we want 1000py for report;
d_incidence1549m_21_26_1 = (incidence1549m_21_26_1 - incidence1549m_21_26_2)*10;
d_incidence1549m_21_41_1 = (incidence1549m_21_41_1 - incidence1549m_21_41_2)*10;
d_incidence1549m_21_71_1 = (incidence1549m_21_71_1 - incidence1549m_21_71_2)*10;

d_incidence1549w_21_26_1 = (incidence1549w_21_26_1 - incidence1549w_21_26_2)*10;
d_incidence1549w_21_41_1 = (incidence1549w_21_41_1 - incidence1549w_21_41_2)*10;
d_incidence1549w_21_71_1 = (incidence1549w_21_71_1 - incidence1549w_21_71_2)*10;

*difference in HIV prevalence rates ;
d_prevalence1549m_21_26_1 =  (prevalence1549m_21_26_1 - prevalence1549m_21_26_2)*100;
d_prevalence1549m_21_41_1 =  (prevalence1549m_21_41_1 - prevalence1549m_21_41_2)*100;
d_prevalence1549m_21_71_1 =  (prevalence1549m_21_71_1 - prevalence1549m_21_71_2)*100;

d_prevalence1549w_21_26_1 =  (prevalence1549w_21_26_1 - prevalence1549w_21_26_2)*100;
d_prevalence1549w_21_41_1 =  (prevalence1549w_21_41_1 - prevalence1549w_21_41_2)*100;
d_prevalence1549w_21_71_1 =  (prevalence1549w_21_71_1 - prevalence1549w_21_71_2)*100; 

*difference in HIV death rate;
ddeath_rate_hiv_m_21_26_1 = death_rate_hiv_m_21_26_1 - death_rate_hiv_m_21_26_2;
ddeath_rate_hiv_m_21_41_1 = death_rate_hiv_m_21_41_1 - death_rate_hiv_m_21_41_2;
ddeath_rate_hiv_m_21_71_1 = death_rate_hiv_m_21_71_1 - death_rate_hiv_m_21_71_2;

*COncvert to per 1000 py (currently per 100py);
ddeath_rate_hiv_all_m_21_26_1 = (death_rate_hiv_all_m_21_26_1 - death_rate_hiv_all_m_21_26_2)*10;
ddeath_rate_hiv_all_m_21_41_1 = (death_rate_hiv_all_m_21_41_1 - death_rate_hiv_all_m_21_41_2)*10;
ddeath_rate_hiv_all_m_21_71_1 = (death_rate_hiv_all_m_21_71_1 - death_rate_hiv_all_m_21_71_2)*10;
 															   
*% infections averted;
inf_avert_21_26_1 = ((n_new_inf1549_21_26_2 - n_new_inf1549_21_26_1)/n_new_inf1549_21_26_2)*100;
inf_avert_21_41_1 = ((n_new_inf1549_21_41_2 - n_new_inf1549_21_41_1)/n_new_inf1549_21_41_2)*100;
inf_avert_21_71_1 = ((n_new_inf1549_21_71_2 - n_new_inf1549_21_71_1)/n_new_inf1549_21_71_2)*100;


*dalys averted;
d_ddaly_adults_21_26_1 = ddaly_adults_21_26_2 - ddaly_adults_21_26_1;
d_ddaly_adults_21_41_1 = ddaly_adults_21_41_2 - ddaly_adults_21_41_1;
d_ddaly_adults_21_71_1 = ddaly_adults_21_71_2 - ddaly_adults_21_71_1;

d_ddaly_adults_21_71_2 = ddaly_adults_21_71_1 - ddaly_adults_21_71_2;

*difference in total costs;
d_dcost_21_26_1 = dcost_21_26_1 - dcost_21_26_2;
d_dcost_21_41_1 = dcost_21_41_1 - dcost_21_41_2;
d_dcost_21_71_1 = dcost_21_71_1 - dcost_21_71_2;

*difference in ART and clinical care costs;
d_dcost_clin_care_21_26_1 = dcost_clin_care_21_26_1 - dcost_clin_care_21_26_2;
d_dcost_clin_care_21_41_1 = dcost_clin_care_21_41_1 - dcost_clin_care_21_41_2;
d_dcost_clin_care_21_71_1 = dcost_clin_care_21_71_1 - dcost_clin_care_21_71_2;

*net dalys averted;
ndb_500_21_26_1_adults =  ddaly_adults_21_26_1 + (dcost_21_26_1)/0.0005;
ndb_500_21_26_2_adults =  ddaly_adults_21_26_2 + (dcost_21_26_2)/0.0005; 
ndb_500_21_41_1_adults =  ddaly_adults_21_41_1 + (dcost_21_41_1)/0.0005;
ndb_500_21_41_2_adults =  ddaly_adults_21_41_2 + (dcost_21_41_2)/0.0005; 
ndb_500_21_71_1_adults =  ddaly_adults_21_71_1 + (dcost_21_71_1)/0.0005;
ndb_500_21_71_2_adults =  ddaly_adults_21_71_2 + (dcost_21_71_2)/0.0005; 

*net dalys averted;
d_net_dalys_21_26_1_adults = ndb_500_21_26_2_adults - ndb_500_21_26_1_adults;
d_net_dalys_21_41_1_adults = ndb_500_21_41_2_adults - ndb_500_21_41_1_adults;
d_net_dalys_21_71_1_adults = ndb_500_21_71_2_adults - ndb_500_21_71_1_adults;

ce_21_26=0;if d_net_dalys_21_26_1_adults gt 0 then ce_21_26=1;
ce_21_41=0;if d_net_dalys_21_41_1_adults gt 0 then ce_21_41=1;
ce_21_71=0;if d_net_dalys_21_71_1_adults gt 0 then ce_21_71=1;

*nnt;
*difference in number of VMMCs;
d_n_vmmc_21_26_1 = n_new_vmmc1549_py_21_26_1 - n_new_vmmc1549_py_21_26_2;
d_n_vmmc_21_41_1 = n_new_vmmc1549_py_21_41_1 - n_new_vmmc1549_py_21_41_2;
d_n_vmmc_21_71_1 = n_new_vmmc1549_py_21_71_1 - n_new_vmmc1549_py_21_71_2;

*infections averted with continuation of VMMC;
d_n_new_inf_21_26_1 = n_new_inf1549_21_26_2 - n_new_inf1549_21_26_1;
d_n_new_inf_21_41_1 = n_new_inf1549_21_41_2 - n_new_inf1549_21_41_1;
d_n_new_inf_21_71_1 = n_new_inf1549_21_71_2 - n_new_inf1549_21_71_1;

***For scenarios in which infections are not averted, assume 1 infection is averted and difference in number of VMMC is 
   maximum difference found above;
/*
proc univariate;var d_n_vmmc_21_26_1 d_n_vmmc_21_41_1 d_n_vmmc_21_71_1;run;
*/

/*lowart;nnt_21_26_1=138543; nnt_21_41_1=122035; nnt_21_71_1=151377;*/

*base/5% disc/120/60;nnt_21_26_1=143072; nnt_21_41_1=116568; nnt_21_71_1=148286;

if d_n_new_inf_21_26_1 gt 0 then nnt_21_26_1 = d_n_vmmc_21_26_1 / d_n_new_inf_21_26_1;
if d_n_new_inf_21_41_1 gt 0 then nnt_21_41_1 = d_n_vmmc_21_41_1 / d_n_new_inf_21_41_1;
if d_n_new_inf_21_71_1 gt 0 then nnt_21_71_1 = d_n_vmmc_21_71_1 / d_n_new_inf_21_71_1;



*cost per infection averted - all;
*use discounted infections;

*discounted infections averted with continuation of VMMC;
d_n_d_new_inf_21_26_1 = d_n_infection_21_26_2 - d_n_infection_21_26_1;
d_n_d_new_inf_21_41_1 = d_n_infection_21_41_2 - d_n_infection_21_41_1;
d_n_d_new_inf_21_71_1 = d_n_infection_21_71_2 - d_n_infection_21_71_1;


***For scenarios in which infections are not averted, assume 1 infection is averted and difference in cost is 
   max difference;
/*
proc univariate;var d_dcost_21_26_1 d_dcost_21_41_1 d_dcost_21_71_1;run;
*base; max= 15.4, 11.7, 7.3;
*$120: max= 19.1, 13.2, 8.7;
*$60: max= 11.8, 10.2, 5.9;
*5% disc; max= 14.9, 10.4, 4.4;
*lower future art cov;: max=13.9, 11.9, 5.3;
*/

***Change the below to reflect which cost/discount is being applied;
*base;cost_inf_avert_21_26_1=15.4*1000000; cost_inf_avert_21_41_1=11.7*1000000; cost_inf_avert_21_71_1 = 7.3*1000000;

if d_n_new_inf_21_26_1 gt 0 then cost_inf_avert_21_26_1 = (d_dcost_21_26_1 / d_n_d_new_inf_21_26_1)*1000000;
if d_n_new_inf_21_41_1 gt 0 then cost_inf_avert_21_41_1 = (d_dcost_21_41_1 / d_n_d_new_inf_21_41_1)*1000000;
if d_n_new_inf_21_71_1 gt 0 then cost_inf_avert_21_71_1 = (d_dcost_21_71_1 / d_n_d_new_inf_21_71_1)*1000000;


*cost per daly averted - this will be maximum difference in cost if DALYS are not averted; 
cost_daly_avert_21_26_1_adults=15.4*1000000;
cost_daly_avert_21_41_1_adults=11.7*1000000;
cost_daly_avert_21_71_1_adults=7.3*1000000;

*check everything is the right way;
if d_ddaly_adults_21_26_1 gt 0 then cost_daly_avert_21_26_1_adults = (d_dcost_21_26_1 / d_ddaly_adults_21_26_1)*1000000;
if d_ddaly_adults_21_41_1 gt 0 then cost_daly_avert_21_41_1_adults = (d_dcost_21_41_1 / d_ddaly_adults_21_41_1)*1000000;
if d_ddaly_adults_21_71_1 gt 0 then cost_daly_avert_21_71_1_adults = (d_dcost_21_71_1 / d_ddaly_adults_21_71_1)*1000000;

run;

***table 2;
proc means n p50 p5 p95;var
prevalence1549_21 prevalence1549m_21 prevalence1549w_21
incidence1549_21 incidence1549m_21 incidence1549w_21
prop_1564_onprep_21 
p_diag_21 p_diag_m_21 p_diag_w_21
p_onart_diag_21 p_onart_diag_m_21 p_onart_diag_w_21
p_vl1000_21 p_vl1000_m_21 p_vl1000_w_21
p_onart_vl1000_21 p_onart_vl1000_m_21 p_onart_vl1000_w_21
p_mcirc_1549m_21 p_mcirc_inc1014m_21 p_mcirc_1014m_21 p_mcirc_1519m_21 p_mcirc_2024m_21 p_mcirc_2529m_21 p_mcirc_3034m_21 p_mcirc_3539m_21 
p_mcirc_4044m_21 p_mcirc_4549m_21;
run;

***table 2, vmmc in 2021;
proc means n p50 p5 p95;var
n_new_vmmc1549_py_20_21_1  n_new_vmmc1049_py_20_21_1
p_new_vmmc_1549m_u_20_21_1  p_new_vmmc_1519m_u_20_21_1 
p_new_vmmc_2024m_u_20_21_1  p_new_vmmc_2529m_u_20_21_1  p_new_vmmc_3034m_u_20_21_1  p_new_vmmc_3539m_u_20_21_1
p_new_vmmc_4044m_u_20_21_1  p_new_vmmc_4549m_u_20_21_1; 
run;

***table 3, outputs in 2040 with continuation of VMMC and current ART assumptions;
proc means n p50 p5 p95;var
prevalence1549_40_41_1 
incidence1549_40_41_1 
prop_1564_onprep_40_41_1
p_diag_40_41_1 
p_onart_diag_40_41_1 
p_vl1000_40_41_1 
p_onart_vl1000_40_41_1 
p_mcirc_1549m_40_41_1
p_mcirc_1519m_40_41_1 p_mcirc_2024m_40_41_1 p_mcirc_2529m_40_41_1 p_mcirc_3034m_40_41_1 p_mcirc_3539m_40_41_1 
p_mcirc_4044m_40_41_1 p_mcirc_4549m_40_41_1;
run;

***table 3, outputs in 2040 with continuation of VMMC and assumption of 20% lower ART coverage in 2020;
data lowart;
set a.wide_vmmc_29_03_21_6pm_lowart;
proc freq;table lower_future_art_cov;run;

proc means n p50 p5 p95;var
prevalence1549_40_41_1 
incidence1549_40_41_1 
prop_1564_onprep_40_40_1
p_diag_40_41_1 
p_onart_diag_40_41_1 
p_vl1000_40_41_1 
p_onart_vl1000_40_41_1 
p_mcirc_1549m_40_41_1
p_mcirc_1519m_40_41_1 p_mcirc_2024m_40_41_1 p_mcirc_2529m_40_41_1 p_mcirc_3034m_40_41_1 p_mcirc_3539m_40_41_1 
p_mcirc_4044m_40_41_1 p_mcirc_4549m_40_41_1;
run;


data d;
set c;
**remember the options have been switched, 1=continuation, 2=no vmmc;
***vmmc rates by option;
proc means n mean p50 p5 p95 lclm uclm;var 
p_vmmc_1549m_21_26_1  p_vmmc_1549m_21_41_1  p_vmmc_1549m_21_71_1
p_vmmc_1549m_21_26_2  p_vmmc_1549m_21_41_2  p_vmmc_1549m_21_71_2
/*p_vmmc_inc1014m_21_26_1  p_vmmc_inc1014m_21_41_1  p_vmmc_inc1014m_21_71_1
p_vmmc_inc1014m_21_26_2  p_vmmc_inc1014m_21_41_2  p_vmmc_inc1014m_21_71_2
p_vmmc_1014m_21_26_1  p_vmmc_1014m_21_41_1  p_vmmc_1014m_21_71_1
p_vmmc_1014m_21_26_2  p_vmmc_1014m_21_41_2  p_vmmc_1014m_21_71_2
p_vmmc_1519m_21_26_1  p_vmmc_1519m_21_41_1  p_vmmc_1519m_21_71_1
p_vmmc_1519m_21_26_2  p_vmmc_1519m_21_41_2  p_vmmc_1519m_21_71_2
p_vmmc_2024m_21_26_1  p_vmmc_2024m_21_41_1  p_vmmc_2024m_21_71_1
p_vmmc_2024m_21_26_2  p_vmmc_2024m_21_41_2  p_vmmc_2024m_21_71_2
p_vmmc_2529m_21_26_1  p_vmmc_2529m_21_41_1  p_vmmc_2529m_21_71_1
p_vmmc_2529m_21_26_2  p_vmmc_2529m_21_41_2  p_vmmc_2529m_21_71_2
p_vmmc_3039m_21_26_1  p_vmmc_3039m_21_41_1  p_vmmc_3039m_21_71_1
p_vmmc_3039m_21_26_2  p_vmmc_3039m_21_41_2  p_vmmc_3039m_21_71_2
p_vmmc_4049m_21_26_1  p_vmmc_4049m_21_41_1  p_vmmc_4049m_21_71_1
p_vmmc_4049m_21_26_2  p_vmmc_4049m_21_41_2  p_vmmc_4049m_21_71_2*/
;run;

***difference in vmmc rates according to option - Figure 1a;
proc means n mean p50 p5 p95 lclm uclm;var 
/*d_p_vmmc_inc1014m_21_26_1  d_p_vmmc_inc1014m_21_41_1  d_p_vmmc_inc1014m_21_71_1*/
d_p_vmmc_1549m_21_26_1  d_p_vmmc_1549m_21_41_1  d_p_vmmc_1549m_21_71_1
/*d_p_vmmc_1014m_21_26_1  d_p_vmmc_1014m_21_41_1  d_p_vmmc_1014m_21_71_1*/
d_p_vmmc_1519m_21_26_1  d_p_vmmc_1519m_21_41_1  d_p_vmmc_1519m_21_71_1
d_p_vmmc_2024m_21_26_1  d_p_vmmc_2024m_21_41_1  d_p_vmmc_2024m_21_71_1
d_p_vmmc_2529m_21_26_1  d_p_vmmc_2529m_21_41_1  d_p_vmmc_2529m_21_71_1
d_p_vmmc_3039m_21_26_1  d_p_vmmc_3039m_21_41_1  d_p_vmmc_3039m_21_71_1
d_p_vmmc_4049m_21_26_1  d_p_vmmc_4049m_21_41_1  d_p_vmmc_4049m_21_71_1;
run;

***incidence - Figure 1b;
proc means n mean p50 p5 p95 lclm uclm;var 
incidence1549m_21_26_1  incidence1549m_21_41_1  incidence1549m_21_71_1
incidence1549m_21_26_2  incidence1549m_21_41_2  incidence1549m_21_71_2
d_incidence1549m_21_26_1  d_incidence1549m_21_41_1  d_incidence1549m_21_71_1

incidence1549w_21_26_1  incidence1549w_21_41_1  incidence1549w_21_71_1
incidence1549w_21_26_2  incidence1549w_21_41_2  incidence1549w_21_71_2
d_incidence1549w_21_26_1  d_incidence1549w_21_41_1  d_incidence1549w_21_71_1
;run;

***prevalence;
proc means n mean p50 p5 p95 lclm uclm;var 
prevalence1549m_21_26_1 prevalence1549m_21_41_1 prevalence1549m_21_71_1
prevalence1549m_21_26_2 prevalence1549m_21_41_2  prevalence1549m_21_71_2
d_prevalence1549m_21_26_1 d_prevalence1549m_21_41_1  d_prevalence1549m_21_71_1

prevalence1549w_21_26_1 prevalence1549w_21_41_1 prevalence1549w_21_71_1
prevalence1549w_21_26_2 prevalence1549w_21_41_2  prevalence1549w_21_71_2
d_prevalence1549w_21_26_1 d_prevalence1549w_21_41_1  d_prevalence1549w_21_71_1
;run;

***HIV death rate - Figure 1c;
proc means n mean p50 p5 p95 lclm uclm;var 
death_rate_hiv_m_21_26_1 death_rate_hiv_m_21_41_1 death_rate_hiv_m_21_71_1
death_rate_hiv_m_21_26_2 death_rate_hiv_m_21_41_2 death_rate_hiv_m_21_71_2
ddeath_rate_hiv_m_21_26_1 ddeath_rate_hiv_m_21_41_1  ddeath_rate_hiv_m_21_71_1

death_rate_hiv_all_m_21_26_1 death_rate_hiv_all_m_21_41_1 death_rate_hiv_all_m_21_71_1
death_rate_hiv_all_m_21_26_2 death_rate_hiv_all_m_21_41_2 death_rate_hiv_all_m_21_71_2
ddeath_rate_hiv_all_m_21_26_1 ddeath_rate_hiv_all_m_21_41_1  ddeath_rate_hiv_all_m_21_71_1
;run;

proc univariate CIPCTLDF CIPCTLNORMAL; var 
ddeath_rate_hiv_all_m_21_26_1 ddeath_rate_hiv_all_m_21_41_1  ddeath_rate_hiv_all_m_21_71_1;
run;


***% infections averted - Figure 1d;
proc means n mean p50 p5 p95 lclm uclm;var 
inf_avert_21_26_1  inf_avert_21_41_1  inf_avert_21_71_1
;run;


***VMMC cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_circ_21_26_1  dcost_circ_21_41_1  dcost_circ_21_71_1
dcost_circ_21_26_2  dcost_circ_21_41_2  dcost_circ_21_71_2
;run;

**ART and clinical care cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_clin_care_21_26_1  dcost_clin_care_21_41_1  dcost_clin_care_21_71_1
dcost_clin_care_21_26_2  dcost_clin_care_21_41_2  dcost_clin_care_21_71_2
d_dcost_clin_care_21_26_1  d_dcost_clin_care_21_41_1  d_dcost_clin_care_21_71_1
;run;

***HIV test cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dtest_cost_21_26_1  dtest_cost_21_41_1  dtest_cost_21_71_1
dtest_cost_21_26_2  dtest_cost_21_41_2  dtest_cost_21_71_2
;run;

***Other costs;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_condom_dn_21_26_1 dcost_drug_level_test_21_26_1  dcost_prep_visit_21_26_1
dcost_prep_21_26_1 dcost_child_hiv_21_26_1  dcost_non_aids_pre_death_21_26_1
dcost_condom_dn_21_41_1 dcost_drug_level_test_21_41_1  dcost_prep_visit_21_41_1
dcost_prep_21_41_1 dcost_child_hiv_21_41_1  dcost_non_aids_pre_death_21_41_1
dcost_condom_dn_21_71_1 dcost_drug_level_test_21_71_1  dcost_prep_visit_21_71_1
dcost_prep_21_71_1 dcost_child_hiv_21_71_1  dcost_non_aids_pre_death_21_71_1

dcost_condom_dn_21_26_2 dcost_drug_level_test_21_26_2  dcost_prep_visit_21_26_2
dcost_prep_21_26_2 dcost_child_hiv_21_26_2  dcost_non_aids_pre_death_21_26_2
dcost_condom_dn_21_41_2 dcost_drug_level_test_21_41_2  dcost_prep_visit_21_41_2
dcost_prep_21_41_2 dcost_child_hiv_21_41_2  dcost_non_aids_pre_death_21_41_2
dcost_condom_dn_21_71_2 dcost_drug_level_test_21_71_2  dcost_prep_visit_21_71_2
dcost_prep_21_71_2 dcost_child_hiv_21_71_2  dcost_non_aids_pre_death_21_71_2;
run;


***Total cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_21_26_1  dcost_21_41_1  dcost_21_71_1 /*continuation*/
dcost_21_26_2  dcost_21_41_2  dcost_21_71_2 /*no further vmmc*/
;run;

***difference in total cost;
proc means n mean p50 p5 p95 lclm uclm;var 
d_dcost_21_26_1  d_dcost_21_41_1  d_dcost_21_71_1
;run;

***cost per infection averted;
proc means n mean p50 p5 p95 lclm uclm;var 
cost_inf_avert_21_26_1  cost_inf_avert_21_41_1  cost_inf_avert_21_71_1
;run;

***DALYs averted;
proc means n mean p50 p5 p95 lclm uclm;var 
d_ddaly_adults_21_26_1  d_ddaly_adults_21_41_1  d_ddaly_adults_21_71_1
;run;

***net DALYs averted;
proc means n mean p50 p5 p95 lclm uclm;var 
d_net_dalys_21_26_1_adults  d_net_dalys_21_41_1_adults  d_net_dalys_21_71_1_adults
;run;
proc freq;table ce_21_26 ce_21_41 ce_21_71;run;

***cost per DALY averted - icer;
proc means n mean p50 p5 p95 lclm uclm;var 
cost_daly_avert_21_26_1_adults  cost_daly_avert_21_41_1_adults cost_daly_avert_21_71_1_adults
;run;


***NNT;
proc means n mean p50 p5 p95 lclm uclm;var 
nnt_21_26_1  nnt_21_41_1  nnt_21_71_1
;run;

proc means n mean p50 p5 p95 lclm uclm;var nnt_21_26_1;where d_n_new_inf_21_26_1 >0;run;
proc means n mean p50 p5 p95 lclm uclm;var nnt_21_41_1;where d_n_new_inf_21_41_1 >0;run;
proc means n mean p50 p5 p95 lclm uclm;var nnt_21_71_1;where d_n_new_inf_21_71_1 >0;run;







***Predictors of CE scenarios;
data one;
set c;
if 0  le incidence1549_21 le 0.10 then incid=0;
if 0.10  lt incidence1549_21 le 0.20 then incid=1;
if 0.20 lt incidence1549_21 le 0.30 then incid=2;
if 0.30 lt incidence1549_21 le 0.50 then incid=3;
if 0.50 lt incidence1549_21 le 1 then incid=4;
if 1 lt incidence1549_21 le 2 then incid=5;
if 2 lt incidence1549_21         then incid=6;


*incidence;
if 0  le incidence1549_21 le 0.30 then incid_cat3=1;
if 0.30 lt incidence1549_21 le 0.60 then incid_cat3=2;
if 0.60 lt incidence1549_21 then incid_cat3=3;

if 0  le incidence1549_40_41_1 le 0.30 then incid_cat2040_3=1;
if 0.30 lt incidence1549_40_41_1 le 0.60 then incid_cat2040_3=2;
if 0.60 lt incidence1549_40_41_1 then incid_cat2040_3=3;

*prop diag;
if 60 le p_diag_21 le 85 then p_diag=1;
if 85 lt p_diag_21 le 92 then p_diag=2;
if 92 lt p_diag_21 le 100 then p_diag=3;

*on ART of those diag;
if 0.60 le p_onart_diag_21 le 0.75 then artcov=1;
if 0.75 lt p_onart_diag_21 le 0.90 then artcov=2;
if 0.90 lt p_onart_diag_21 le 1 then artcov=3;

*HIV+ with VL<1000;
if 0.50 le p_vl1000_21 le 0.65 then p_vl1000=1;
if 0.65 lt p_vl1000_21 le 0.75 then p_vl1000=2;
if 0.75 lt p_vl1000_21 le 1.00 then p_vl1000=3;

*On ART with VL<1000;
if 0.50 le p_onart_vl1000_21 le 0.80 then onart_vl1000=1;
if 0.80 lt p_onart_vl1000_21 le 0.90 then onart_vl1000=2;
if 0.90 lt p_onart_vl1000_21 le 1.00 then onart_vl1000=3;

*circ by 2020;
if 0 le p_mcirc_1549m_21 le 0.40 then p_circ=1;
if 0.40 lt p_mcirc_1549m_21 le 0.60 then p_circ=2;
if 0.60 lt p_mcirc_1549m_21 le 1 then p_circ=3;

proc freq;table p_circ;run;

Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="3") artcov (ref="3") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_20_70  = incid_cat3;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_20_70  =p_diag;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_20_70  = artcov;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="3") artcov (ref="3") onart_vl1000 (ref="1") p_circ (ref="1") p_vl1000 (ref="1");
model  ce_20_70  = p_vl1000;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_20_70  = onart_vl1000;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_20_70  = p_circ;run;

Proc logistic desc;class incid_cat3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_20_70  = incid_cat3 p_vl1000 p_circ;run;

***And with incidence in 2040;
Proc logistic desc;class incid_cat3 (ref="1") incid_cat2040_3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_20_70  = incid_cat3 incid_cat2040_3 p_vl1000 p_circ;run;


***Table 5;
proc freq;table ce_21_71*incid;run;

proc freq;table incid_cat2040_3;run;

proc freq;table incid_cat3*incid_cat2040_3;run;

proc freq;table ce_20_70;where incid_cat3=1 and incid_cat2040_3=1;run;
proc freq;table ce_20_70;where incid_cat3=1 and incid_cat2040_3=2;run;
proc freq;table ce_20_70;where incid_cat3=1 and incid_cat2040_3=3;run;

proc freq;table ce_20_70;where incid_cat3=2 and incid_cat2040_3=1;run;
proc freq;table ce_20_70;where incid_cat3=2 and incid_cat2040_3=2;run;
proc freq;table ce_20_70;where incid_cat3=2 and incid_cat2040_3=3;run;

proc freq;table ce_20_70;where incid_cat3=3 and incid_cat2040_3=1;run;
proc freq;table ce_20_70;where incid_cat3=3 and incid_cat2040_3=2;run;
proc freq;table ce_20_70;where incid_cat3=3 and incid_cat2040_3=3;run;



***Lower future art cov - looking only at 50 year time horizon;
data lowart;
set a.wide_vmmc_23_10_20_lowart_120;
run;

data lowart1;
set lowart;

*% infections averted;
inf_avert_20_70_1 = ((n_new_inf1549_20_70_2 - n_new_inf1549_20_70_1)/n_new_inf1549_20_70_2)*100;

*dalys averted;
d_ddaly_adults_20_70_1 = ddaly_adults_20_70_2 - ddaly_adults_20_70_1;
d_ddaly_adults_20_70_2 = ddaly_adults_20_70_1 - ddaly_adults_20_70_2;

*difference in costs;
d_dcost_20_70_1 = dcost_20_70_1 - dcost_20_70_2;

*net dalys averted;
ndb_500_20_70_1_adults =  ddaly_adults_20_70_1 + (dcost_20_70_1)/0.0005;
ndb_500_20_70_2_adults =  ddaly_adults_20_70_2 + (dcost_20_70_2)/0.0005; 

*net dalys averted;
d_net_dalys_20_70_1_adults = ndb_500_20_70_2_adults - ndb_500_20_70_1_adults;

ce_20_70=0;if d_net_dalys_20_70_1_adults gt 0 then ce_20_70=1;

*nnt;
*difference in number of VMMCs;
d_n_vmmc_20_70_1 = n_new_vmmc1549_py_20_70_1 - n_new_vmmc1549_py_20_70_2;

*infections averted with continuation of VMMC;
d_n_new_inf_20_70_1 = n_new_inf1549_20_70_2 - n_new_inf1549_20_70_1;

***For scenarios in which infections are not averted, assume 1 infection is averted and difference in number of VMMC is 
   maximum difference found above;
/*
proc univariate;var  d_n_vmmc_20_70_1;run;
*/

nnt_20_70_1=188993;
if d_n_new_inf_20_70_1 gt 0 then nnt_20_70_1 = d_n_vmmc_20_70_1 / d_n_new_inf_20_70_1;


*cost per infection averted - all;
*use discounted infections;

*discounted infections averted with continuation of VMMC;
d_n_d_new_inf_20_70_1 = d_n_infection_20_70_2 - d_n_infection_20_70_1;


***For scenarios in which infections are not averted, assume 1 infection is averted and difference in cost is 
   max difference;
/*
proc univariate;var  d_dcost_20_70_1;run;
*max=9.9;
*/
cost_inf_avert_20_70_1 = 9.9*1000000;
if d_n_new_inf_20_70_1 gt 0 then cost_inf_avert_20_70_1 = (d_dcost_20_70_1 / d_n_d_new_inf_20_70_1)*1000000;


*cost per daly averted =icer; 
cost_daly_avert_20_70_1_adults=9.9*1000000;

if d_ddaly_adults_20_70_1 gt 0 then cost_daly_avert_20_70_1_adults = (d_dcost_20_70_1 / d_ddaly_adults_20_70_1)*1000000;

run;

***Total cost;
proc means n mean p50 p5 p95 lclm uclm;var 
dcost_20_70_1 /*continuation*/
dcost_20_70_2 /*no further vmmc*/
;run;


***difference in total cost;
proc means n mean p50 p5 p95 lclm uclm;var 
d_dcost_20_70_1
;run;

***cost per infection averted;
proc means n mean p50 p5 p95 lclm uclm;var 
cost_inf_avert_20_70_1
;run;

***DALYs averted;
proc means n mean p50 p5 p95 lclm uclm;var 
d_ddaly_adults_20_70_1
;run;

***net DALYs averted;
proc means n mean p50 p5 p95 lclm uclm;var 
d_net_dalys_20_70_1_adults
;run;

***icer;
proc means n mean p50 p5 p95 lclm uclm;var 
cost_daly_avert_20_70_1_adults
;run;
