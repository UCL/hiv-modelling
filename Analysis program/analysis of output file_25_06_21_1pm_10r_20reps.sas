*libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\VMMC\vmmc20reps_out_vmmc20reps\";

*lowart;
libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\VMMC\";


***20 reps;

data b;
*set a.wide_vmmc_25_06_21_1pm_20r_F;
*set a.wide_vmmc_25_06_21_1pm_20r_F_60;
*set a.wide_vmmc_25_06_21_1pm_20r_F_120;
*set a.wide_vmmc_25_06_21_1pm_20r_F_5d;
set a.wide_vmmc_02_06_21_9pm_lowart;

*if prevalence1549m_21 lt 0.03 then delete;
*if run ge   906625371 then delete;
run;




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
 															   
*% infections averted 15-49;
inf_avert_21_26_1 = ((n_new_inf1549_21_26_2 - n_new_inf1549_21_26_1)/n_new_inf1549_21_26_2)*100;
inf_avert_21_41_1 = ((n_new_inf1549_21_41_2 - n_new_inf1549_21_41_1)/n_new_inf1549_21_41_2)*100;
inf_avert_21_71_1 = ((n_new_inf1549_21_71_2 - n_new_inf1549_21_71_1)/n_new_inf1549_21_71_2)*100;

*% infections averted all;
inf_avert_all_21_26_1 = ((n_infection_21_26_2 - n_infection_21_26_1)/n_infection_21_26_2)*100;
inf_avert_all_21_41_1 = ((n_infection_21_41_2 - n_infection_21_41_1)/n_infection_21_41_2)*100;
inf_avert_all_21_71_1 = ((n_infection_21_71_2 - n_infection_21_71_1)/n_infection_21_71_2)*100;


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

/*lowart;nnt_21_26_1; nnt_21_26_1=130697; nnt_21_41_1=34465; nnt_21_71_1=13786;*/

*base/5% disc/120/60;nnt_21_26_1=139049; nnt_21_41_1=36549; nnt_21_71_1=14620;


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

*/

***Change the below to reflect which cost/discount is being applied;
/*base;cost_inf_avert_21_26_1= 12.2*1000000; cost_inf_avert_21_41_1= 3.1*1000000; cost_inf_avert_21_71_1 = 1.6*1000000;*/
/*60;cost_inf_avert_21_26_1= 8.4*1000000; cost_inf_avert_21_41_1= 2.1*1000000; cost_inf_avert_21_71_1 = 1.5*1000000;*/
/*120;cost_inf_avert_21_26_1= 16.1*1000000; cost_inf_avert_21_41_1= 4.0*1000000; cost_inf_avert_21_71_1 = 1.8*1000000;*/
/*5% disc;cost_inf_avert_21_26_1= 11.6*1000000; cost_inf_avert_21_41_1= 2.9*1000000; cost_inf_avert_21_71_1 = 1.4*1000000;*/

*lowart;cost_inf_avert_21_26_1=11.9*1000000; cost_inf_avert_21_41_1=3.9*1000000; cost_inf_avert_21_71_1 = 3.5*1000000;

if d_n_new_inf_21_26_1 gt 0 then cost_inf_avert_21_26_1 = (d_dcost_21_26_1 / d_n_d_new_inf_21_26_1)*1000000;
if d_n_new_inf_21_41_1 gt 0 then cost_inf_avert_21_41_1 = (d_dcost_21_41_1 / d_n_d_new_inf_21_41_1)*1000000;
if d_n_new_inf_21_71_1 gt 0 then cost_inf_avert_21_71_1 = (d_dcost_21_71_1 / d_n_d_new_inf_21_71_1)*1000000;


*cost per daly averted - this will be maximum difference in cost if DALYS are not averted; 
cost_daly_avert_21_26_1_adults=11.9*1000000;
cost_daly_avert_21_41_1_adults=3.9*1000000;
cost_daly_avert_21_71_1_adults=3.5*1000000;

*check everything is the right way;
if d_ddaly_adults_21_26_1 gt 0 then cost_daly_avert_21_26_1_adults = (d_dcost_21_26_1 / d_ddaly_adults_21_26_1)*1000000;
if d_ddaly_adults_21_41_1 gt 0 then cost_daly_avert_21_41_1_adults = (d_dcost_21_41_1 / d_ddaly_adults_21_41_1)*1000000;
if d_ddaly_adults_21_71_1 gt 0 then cost_daly_avert_21_71_1_adults = (d_dcost_21_71_1 / d_ddaly_adults_21_71_1)*1000000;

***Optima method;
*DALYs averted;
d_ddaly_adults_Op_21_26_1 = ddaly_adults_Op_21_26_2 - ddaly_adults_Op_21_26_1;
d_ddaly_adults_Op_21_41_1 = ddaly_adults_Op_21_41_2 - ddaly_adults_Op_21_41_1;
d_ddaly_adults_Op_21_71_1 = ddaly_adults_Op_21_71_2 - ddaly_adults_Op_21_71_1;

*ICER;
cost_daly_avert_Op_21_26=12.9*1000000;
cost_daly_avert_Op_21_41=3.9*1000000;
cost_daly_avert_Op_21_71=4.4*1000000;

if d_ddaly_adults_Op_21_26_1 gt 0 then cost_daly_avert_Op_21_26 = (d_dcost_21_26_1 / d_ddaly_adults_Op_21_26_1)*1000000;
if d_ddaly_adults_Op_21_41_1 gt 0 then cost_daly_avert_Op_21_41 = (d_dcost_21_41_1 / d_ddaly_adults_Op_21_41_1)*1000000;
if d_ddaly_adults_Op_21_71_1 gt 0 then cost_daly_avert_Op_21_71 = (d_dcost_21_71_1 / d_ddaly_adults_Op_21_71_1)*1000000;

*Net DALYs averted;
ndb_500_21_71_1_Op =  ddaly_adults_Op_21_71_1 + (dcost_21_71_1)/0.0005;
ndb_500_21_71_2_Op =  ddaly_adults_Op_21_71_2 + (dcost_21_71_2)/0.0005; 
d_net_dalys_21_71_1_Op = ndb_500_21_71_2_Op - ndb_500_21_71_1_Op;




***Difference in DALYs comparing Optima method with our method;
diff_daly_avert_21_26=d_ddaly_adults_Op_21_26_1 - d_ddaly_adults_21_26_1;
diff_daly_avert_21_41=d_ddaly_adults_Op_21_41_1 - d_ddaly_adults_21_41_1;
diff_daly_avert_21_71=d_ddaly_adults_Op_21_71_1 - d_ddaly_adults_21_71_1;

diff_icer_21_26 = cost_daly_avert_Op_21_26 - cost_daly_avert_21_26_1_adults;
diff_icer_21_41 = cost_daly_avert_Op_21_41 - cost_daly_avert_21_41_1_adults;
diff_icer_21_71 = cost_daly_avert_Op_21_71 - cost_daly_avert_21_71_1_adults;
run;

proc print;var run cost_daly_avert_21_71_1_adults d_dcost_21_71_1 d_ddaly_adults_21_71_1;where 103  < cost_daly_avert_21_71_1_adults < 104;run;

proc print;var run ddaly_adults_21_71_2 ddaly_adults_21_71_1  d_ddaly_adults_21_71_1;run;

***table 2;
proc means n p50 p5 p95;var
prevalence1549_21 prevalence1549m_21 prevalence1549w_21
incidence1549_21 incidence1549m_21 incidence1549w_21
/*prop_1564_onprep_21 
p_diag_21 p_diag_m_21 p_diag_w_21
p_onart_diag_21 p_onart_diag_m_21 p_onart_diag_w_21
p_onart_vl1000_21 p_onart_vl1000_m_21 p_onart_vl1000_w_21

*/
p_vl1000_21 p_vl1000_m_21 p_vl1000_w_21
p_onart_21  p_onart_m_21 p_onart_w_21 
p_mcirc_1549m_21 /*p_mcirc_inc1014m_21 p_mcirc_1014m_21*/ p_mcirc_1519m_21 p_mcirc_2024m_21 p_mcirc_2529m_21 p_mcirc_3034m_21 p_mcirc_3539m_21 
p_mcirc_4044m_21 p_mcirc_4549m_21;
run;

***table 2, vmmc in 2021;
proc means n p50 p5 p95;var
n_new_vmmc1549_py_20_21_1  n_new_vmmc1049_py_20_21_1
p_new_vmmc_1549m_u_20_21_1  p_new_vmmc_1519m_u_20_21_1 
p_new_vmmc_2024m_u_20_21_1  p_new_vmmc_2529m_u_20_21_1  p_new_vmmc_3034m_u_20_21_1  p_new_vmmc_3539m_u_20_21_1
p_new_vmmc_4044m_u_20_21_1  p_new_vmmc_4549m_u_20_21_1; 
run;

***table 3, outputs in 2041 with continuation of VMMC and current ART assumptions;
proc means n p50 p5 p95;var
prevalence1549_40_41_1 
incidence1549_40_41_1 
/*prop_1564_onprep_40_41_1
p_diag_40_41_1 
p_onart_diag_40_41_1 
*/
p_vl1000_40_41_1 
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
/*prop_1564_onprep_40_40_1*/
p_diag_40_41_1 
p_onart_diag_40_41_1 
p_vl1000_40_41_1 
p_onart_40_41_1 

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
/*d_p_vmmc_1014m_21_26_1  d_p_vmmc_1014m_21_41_1  d_p_vmmc_1014m_21_71_1
d_p_vmmc_1519m_21_26_1  d_p_vmmc_1519m_21_41_1  d_p_vmmc_1519m_21_71_1
d_p_vmmc_2024m_21_26_1  d_p_vmmc_2024m_21_41_1  d_p_vmmc_2024m_21_71_1
d_p_vmmc_2529m_21_26_1  d_p_vmmc_2529m_21_41_1  d_p_vmmc_2529m_21_71_1
d_p_vmmc_3039m_21_26_1  d_p_vmmc_3039m_21_41_1  d_p_vmmc_3039m_21_71_1
d_p_vmmc_4049m_21_26_1  d_p_vmmc_4049m_21_41_1  d_p_vmmc_4049m_21_71_1;*/
;run;

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
inf_avert_all_21_26_1  inf_avert_all_21_41_1  inf_avert_all_21_71_1

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
d_ddaly_adults_Op_21_26_1 d_ddaly_adults_Op_21_41_1 d_ddaly_adults_Op_21_71_1
;run;

proc print;var run d_ddaly_adults_21_71_1;run;

***net DALYs averted;
proc means n mean p50 p5 p95 lclm uclm;var 
d_net_dalys_21_26_1_adults  d_net_dalys_21_41_1_adults  d_net_dalys_21_71_1_adults
;run;
proc freq;table ce_21_26 ce_21_41 ce_21_71;run;

***cost per DALY averted - icer;
proc means n mean p50 p5 p95 lclm uclm ;var 
cost_daly_avert_21_26_1_adults  cost_daly_avert_21_41_1_adults cost_daly_avert_21_71_1_adults
cost_daly_avert_Op_21_26 cost_daly_avert_Op_21_41 cost_daly_avert_Op_21_71
;run;

***Optima vs Synthesis;
proc means n mean p50 p5 p95 lclm uclm ;var 
diff_daly_avert_21_26  diff_daly_avert_21_41  diff_daly_avert_21_71
diff_icer_21_26 diff_icer_21_41 diff_icer_21_71;
run;
proc univariate CIPCTLDF CIPCTLNORMAL; var cost_daly_avert_21_71_1_adults;run;

***NNT;
proc means n mean p50 p5 p95 lclm uclm;var 
nnt_21_26_1  nnt_21_41_1  nnt_21_71_1
;run;

proc means n mean p50 p5 p95 lclm uclm;var nnt_21_26_1;where d_n_new_inf_21_26_1 >0;run;
proc means n mean p50 p5 p95 lclm uclm;var nnt_21_41_1;where d_n_new_inf_21_41_1 >0;run;
proc means n mean p50 p5 p95 lclm uclm;var nnt_21_71_1;where d_n_new_inf_21_71_1 >0;run;



proc print;var ddaly_adults_21_71_2 ddaly_adults_21_71_1 d_ddaly_adults_21_71_1 
ndb_500_21_71_2_adults ndb_500_21_71_1_adults d_net_dalys_21_71_1_adults 
death_rate_hiv_all_m_21_71_1 death_rate_hiv_all_m_21_71_2 ddeath_rate_hiv_all_m_21_71_1
disc_dead_daly80_21_71_1 disc_dead_daly80_21_71_2

s_live_ddaly_80_21_71_1 s_live_ddaly_80_21_71_2;
;run;

proc print;var ddaly_adults_Op_21_71_2 ddaly_adults_Op_21_71_1 d_ddaly_adults_Op_21_71_1  cost_daly_avert_Op_21_71
ndb_500_21_71_2_Op ndb_500_21_71_1_Op d_net_dalys_21_71_1_Op;
;run;



***Predictors of CE scenarios;
data one;
set c;
if 0  le incidence1549_21 le 0.10 then incid=0;
if 0.10  lt incidence1549_21 le 0.20 then incid=1;
if 0.20 lt incidence1549_21 le 0.30 then incid=2;
if 0.30 lt incidence1549_21 le 0.50 then incid=3;
if 0.50 lt incidence1549_21 le 1 then incid=4;
if         incidence1549_21 gt 1 then incid=5;

*incidence;
if 0  le incidence1549_21 le 0.30 then incid_cat3=1;
if 0.30 lt incidence1549_21 le 0.60 then incid_cat3=2;
if 0.60 lt incidence1549_21 then incid_cat3=3;

if 0  le incidence1549_40_41_1 le 0.30 then incid_cat2040_3=1;
if 0.30 lt incidence1549_40_41_1 le 0.60 then incid_cat2040_3=2;
if 0.60 lt incidence1549_40_41_1 then incid_cat2040_3=3;

incidence1549_scaled=incidence1549_21 * 10;

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

p_vl1000_21_scaled=p_vl1000_21 * 100;

*On ART with VL<1000;
if 0.50 le p_onart_vl1000_21 le 0.80 then onart_vl1000=1;
if 0.80 lt p_onart_vl1000_21 le 0.90 then onart_vl1000=2;
if 0.90 lt p_onart_vl1000_21 le 1.00 then onart_vl1000=3;

*circ by 2020;
if 0 le p_mcirc_1549m_21 le 0.40 then p_circ=1;
if 0.40 lt p_mcirc_1549m_21 le 0.60 then p_circ=2;
if 0.60 lt p_mcirc_1549m_21 le 1 then p_circ=3;

p_mcirc_1549m_21_scaled=p_mcirc_1549m_21*100;

prevalence_vg1000_scaled=prevalence_vg1000_21*100;
proc freq;table incid_cat3 p_vl1000;run;

Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="3") artcov (ref="3") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_21_71  = incid_cat3;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_21_71  =p_diag;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_21_71  = artcov;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="3") artcov (ref="3") onart_vl1000 (ref="1") p_circ (ref="1") p_vl1000 (ref="1");
model  ce_21_71  = p_vl1000;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_21_71  = onart_vl1000;run;
Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1") onart_vl1000 (ref="1") p_circ (ref="1");
model  ce_21_71  = p_circ;run;

Proc logistic data=one desc;class incid_cat3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_21_71  =incid_cat3  p_vl1000  p_circ;run;


*Continuous variables;
Proc logistic data=one desc;class incid_cat3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_21_71  = incidence1549_scaled;run;
Proc logistic data=one desc;class incid_cat3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_21_71  = p_vl1000_21_scaled;run;
Proc logistic data=one desc;class incid_cat3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_21_71  = p_mcirc_1549m_21_scaled;run;


Proc logistic data=one desc;class incid_cat3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_21_71  = incidence1549_scaled  p_mcirc_1549m_21_scaled prevalence_vg1000_scaled;run;



***And with incidence in 2040;
Proc logistic data=one desc;class incid_cat3 (ref="1") incid_cat2040_3 (ref="1")  p_circ (ref="1") p_vl1000 (ref="1");
model  ce_20_70  = incid_cat3 incid_cat2040_3 p_vl1000 p_mcirc_1549m_21 prevalence_vg1000_scaled;run;

***Population growth;
Proc logistic data=one desc;class inc_cat (ref="1");
model  ce_21_71  = inc_cat;run;

***Table 5;
proc freq;table ce_21_71*incid;run;


proc freq;table inc_cat;run;



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
