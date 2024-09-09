

libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\Zim\";

data a; 
set a.wide_fsw_zim_17_04_24AMT;
if incidence1549_23 <0.02 then delete;
run;

***table 1;
proc means n p50 p5 p95 min max;var
prevalence1549_23 	 prevalence1549w_23 	prevalence1549m_23 	 incidence1549_23 	incidence1549w_23 	incidence1549m_23
p_diag_23			 p_diag_w_23			p_diag_m_23 		 p_onart_diag_23	p_onart_diag_w_23	p_onart_diag_m_23
p_onart_vl1000_23	 p_onart_vl1000_w_23	p_onart_vl1000_m_23	 p_vl1000_23 		
p_vg1000_23 		 prevalence_vg1000_23

incidence_sw_23		p_fsw_newp0__23

;run;



***table 2 - characteristics of FSW in 2024 (these are suffixed 23 but are actually 24);
proc means n p50 p5 p95 mean;var
n_sw_1549__23		prop_w_1549_sw_23 		prop_w_ever_sw_23		act_dur_sw_23 
p_sw_age1519__23	p_sw_age2024__23		p_sw_age2529__23 		p_sw_age3039__23 p_sw_age40pl__23  
p_age_deb_sw1519__23 p_age_deb_sw2024__23	p_age_deb_sw2529__23	p_age_deb_sw3039__23	p_age_deb_sw40pl__23
p_actdur_0to3__23  p_actdur_3to5__23     p_actdur_6to9__23  	p_actdur_10to19__23 
p_totdur_0to3__23  p_totdur_3to5__23     p_totdur_6to9__23  	p_totdur_10to19__23 
p_fsw_newp0__23 prop_sw_onprep_23
p_sti_sw_23
incidence_sw_23		prevalence_sw_23
p_diag_sw_23		p_onart_diag_sw_23		p_onart_vl1000_sw_23 p_sw_prog_vis_23;
run;


proc means n p50 p5 p95;var
/*Current SW program*/
p_sw_prog_vis_30_1  p_tested_past_year_sw_30_1
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549_30_1	prevalence1549_30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000_30_1 p_vl1000_30_1

/*AMETHIST*/
p_sw_prog_vis_30_2  p_tested_past_year_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2		p_fsw_newp0__30_2	prop_sw_onprep_30_2
p_sti_sw_30_2		incidence_sw_30_2	prevalence_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2
;
run;

data b;
set a;

***Within run differences for table 4;
d_p_tested_past_year_sw_lo_none = (p_tested_past_year_sw_30_2-p_tested_past_year_sw_30_1)*100;
d_p_fsw_newp0_lo_none = (p_fsw_newp0__30_2 - p_fsw_newp0__30_1)*100;
d_prop_sw_onprep_lo_none = (prop_sw_onprep_30_2 - prop_sw_onprep_30_1)*100;
d_p_sti_sw_lo_none = (p_sti_sw_30_2 - p_sti_sw_30_1)*100;
d_incidence_sw_lo_none = incidence_sw_30_2 - incidence_sw_30_1;
d_prevalence_sw_lo_none = (prevalence_sw_30_2 - prevalence_sw_30_1)*100;
d_p_diag_sw_lo_none = (p_diag_sw_30_2 - p_diag_sw_30_1)*100;
d_p_onart_diag_sw_lo_none = (p_onart_diag_sw_30_2 - p_onart_diag_sw_30_1)*100;
d_p_onart_vl1000_sw_lo_none = (p_onart_vl1000_sw_30_2 - p_onart_vl1000_sw_30_1)*100;
d_incidence1549_lo_none = incidence1549_30_2 - incidence1549_30_1;
d_prevalence1549_lo_none = (prevalence1549_30_2 - prevalence1549_30_1)*100;
d_p_diag_lo_none = (p_diag_30_2 - p_diag_30_1)*100;
d_p_onart_diag_lo_none = (p_onart_diag_30_2 - p_onart_diag_30_1)*100;
d_p_onart_vl1000_lo_none = (p_onart_vl1000_30_2 - p_onart_vl1000_30_1)*100;
d_p_vl1000_lo_none = (p_vl1000_30_2 - p_vl1000_30_1) *100;

d_p_tested_past_year_sw_hi_none = (p_tested_past_year_sw_30_3-p_tested_past_year_sw_30_1)*100;
d_p_fsw_newp0_hi_none = (p_fsw_newp0__30_3 - p_fsw_newp0__30_1)*100;
d_prop_sw_onprep_hi_none = (prop_sw_onprep_30_3 - prop_sw_onprep_30_1)*100;
d_p_sti_sw_hi_none = (p_sti_sw_30_3 - p_sti_sw_30_1)*100;
d_incidence_sw_hi_none = incidence_sw_30_3 - incidence_sw_30_1;
d_prevalence_sw_hi_none = (prevalence_sw_30_3 - prevalence_sw_30_1)*100;
d_p_diag_sw_hi_none = (p_diag_sw_30_3 - p_diag_sw_30_1)*100;
d_p_onart_diag_sw_hi_none = (p_onart_diag_sw_30_3 - p_onart_diag_sw_30_1)*100;
d_p_onart_vl1000_sw_hi_none = (p_onart_vl1000_sw_30_3 - p_onart_vl1000_sw_30_1)*100;
d_incidence1549_hi_none = incidence1549_30_3 - incidence1549_30_1;
d_prevalence1549_hi_none = (prevalence1549_30_3 - prevalence1549_30_1)*100;
d_p_diag_hi_none = (p_diag_30_3 - p_diag_30_1)*100;
d_p_onart_diag_hi_none = (p_onart_diag_30_3 - p_onart_diag_30_1)*100;
d_p_onart_vl1000_hi_none = (p_onart_vl1000_30_3 - p_onart_vl1000_30_1)*100;
d_p_vl1000_hi_none = (p_vl1000_30_3 - p_vl1000_30_1) *100;


run;

proc freq;table p_sw_prog_vis_1 p_sw_prog_vis_2 p_sw_prog_vis_3;run;

***table 3 - characteristics in 2030 by option;

proc means n p50 p5 p95;var
/*discontinuted*/
p_sw_prog_vis_30_1  p_tested_past_year_sw_30_1
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549_30_1	prevalence1549_30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000_30_1 p_vl1000_30_1

/*current level*/
p_sw_prog_vis_30_2  p_tested_past_year_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2		p_fsw_newp0__30_2	prop_sw_onprep_30_2
p_sti_sw_30_2		incidence_sw_30_2	prevalence_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2

/*high impact*/
p_sw_prog_vis_30_3	p_tested_past_year_sw_30_3
p_diag_sw_30_3		p_onart_diag_sw_30_3	p_onart_vl1000_sw_30_3		p_fsw_newp0__30_3	prop_sw_onprep_30_3
p_sti_sw_30_3		incidence_sw_30_3	prevalence_sw_30_3
incidence1549_30_3	prevalence1549_30_3		p_diag_30_3	  p_onart_diag_30_3   p_onart_vl1000_30_3;
run;

proc means n p50 p5 p95;var
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
p_diag_sw_30_3		p_onart_diag_sw_30_3	p_onart_vl1000_sw_30_3;run;



***Within run differences;
proc means n mean lclm uclm;var 
d_p_tested_past_year_sw_lo_none 
d_p_diag_sw_lo_none		d_p_onart_diag_sw_lo_none	d_p_onart_vl1000_sw_lo_none
d_p_fsw_newp0_lo_none	d_prop_sw_onprep_lo_none		d_p_sti_sw_lo_none	d_incidence_sw_lo_none	d_prevalence_sw_lo_none
d_incidence1549_lo_none	d_prevalence1549_lo_none		d_p_diag_lo_none	  	d_p_onart_diag_lo_none   d_p_onart_vl1000_lo_none

d_p_tested_past_year_sw_hi_none 
d_p_diag_sw_hi_none		d_p_onart_diag_sw_hi_none	d_p_onart_vl1000_sw_hi_none
d_p_fsw_newp0_hi_none	d_prop_sw_onprep_hi_none		d_p_sti_sw_hi_none	d_incidence_sw_hi_none	d_prevalence_sw_hi_none
d_incidence1549_hi_none	d_prevalence1549_hi_none		d_p_diag_hi_none	  	d_p_onart_diag_hi_none   d_p_onart_vl1000_hi_none;
run;

proc means n p50 p5 p95;var 
d_p_tested_past_year_sw_lo_none 
d_p_diag_sw_lo_none		d_p_onart_diag_sw_lo_none	d_p_onart_vl1000_sw_lo_none
d_p_fsw_newp0_lo_none	d_prop_sw_onprep_lo_none		d_p_sti_sw_lo_none	d_incidence_sw_lo_none	d_prevalence_sw_lo_none
d_incidence1549_lo_none	d_prevalence1549_lo_none		d_p_diag_lo_none	  	d_p_onart_diag_lo_none   d_p_onart_vl1000_lo_none

d_p_tested_past_year_sw_hi_none 
d_p_diag_sw_hi_none		d_p_onart_diag_sw_hi_none	d_p_onart_vl1000_sw_hi_none
d_p_fsw_newp0_hi_none	d_prop_sw_onprep_hi_none		d_p_sti_sw_hi_none	d_incidence_sw_hi_none	d_prevalence_sw_hi_none
d_incidence1549_hi_none	d_prevalence1549_hi_none		d_p_diag_hi_none	  	d_p_onart_diag_hi_none   d_p_onart_vl1000_hi_none;
run;


**Impact of specific aspects of a SW program;

**Assuming SW only improves PrEP;
data prep;
set a.wide_fsw_16_08_22_prep;
if incidence1549_22 <0.1 then delete;
run;

data prep1;
set prep;

***Within run differences for table 4;
d_p_fsw_newp0__30 = (p_fsw_newp0__30_2 - p_fsw_newp0__30_1)*100;
d_prop_sw_onprep_30 = (prop_sw_onprep_30_2 - prop_sw_onprep_30_1)*100;
d_p_sti_sw_30 = (p_sti_sw_30_2 - p_sti_sw_30_1)*100;
d_incidence_sw_30 = incidence_sw_30_2 - incidence_sw_30_1;
d_prevalence_sw_30 = (prevalence_sw_30_2 - prevalence_sw_30_1)*100;
d_p_diag_sw_30 = (p_diag_sw_30_2 - p_diag_sw_30_1)*100;
d_p_onart_diag_sw_30 = (p_onart_diag_sw_30_2 - p_onart_diag_sw_30_1)*100;
d_p_onart_vl1000_sw_30 = (p_onart_vl1000_sw_30_2 - p_onart_vl1000_sw_30_1)*100;
d_incidence1549_30 = incidence1549_30_2 - incidence1549_30_1;
d_prevalence1549_30 = (prevalence1549_30_2 - prevalence1549_30_1)*100;
d_p_diag_30 = (p_diag_30_2 - p_diag_30_1)*100;
d_p_onart_diag_30 = (p_onart_diag_30_2 - p_onart_diag_30_1)*100;
d_p_onart_vl1000_30 = (p_onart_vl1000_30_2 - p_onart_vl1000_30_1)*100;

proc means n p50 p5 p95;var
p_fsw_newp0__30_2	prop_sw_onprep_30_2		p_sti_sw_30_2	incidence_sw_30_2	prevalence_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2;
run;
***Within run differences;
proc means n mean lclm uclm;var 
d_p_fsw_newp0__30	d_prop_sw_onprep_30		d_p_sti_sw_30	d_incidence_sw_30	d_prevalence_sw_30
d_p_diag_sw_30		d_p_onart_diag_sw_30	d_p_onart_vl1000_sw_30
d_incidence1549_30	d_prevalence1549_30		d_p_diag_30	  	d_p_onart_diag_30   d_p_onart_vl1000_30;
run;


**Assuming SW only improves condomless sex;
data newp;
set a.wide_fsw_16_08_22_newp;
if incidence1549_22 <0.1 then delete;
run;

data newp1;
set newp;

***Within run differences for table 4;
d_p_fsw_newp0__30 = (p_fsw_newp0__30_2 - p_fsw_newp0__30_1)*100;
d_prop_sw_onprep_30 = (prop_sw_onprep_30_2 - prop_sw_onprep_30_1)*100;
d_p_sti_sw_30 = (p_sti_sw_30_2 - p_sti_sw_30_1)*100;
d_incidence_sw_30 = incidence_sw_30_2 - incidence_sw_30_1;
d_prevalence_sw_30 = (prevalence_sw_30_2 - prevalence_sw_30_1)*100;
d_p_diag_sw_30 = (p_diag_sw_30_2 - p_diag_sw_30_1)*100;
d_p_onart_diag_sw_30 = (p_onart_diag_sw_30_2 - p_onart_diag_sw_30_1)*100;
d_p_onart_vl1000_sw_30 = (p_onart_vl1000_sw_30_2 - p_onart_vl1000_sw_30_1)*100;
d_incidence1549_30 = incidence1549_30_2 - incidence1549_30_1;
d_prevalence1549_30 = (prevalence1549_30_2 - prevalence1549_30_1)*100;
d_p_diag_30 = (p_diag_30_2 - p_diag_30_1)*100;
d_p_onart_diag_30 = (p_onart_diag_30_2 - p_onart_diag_30_1)*100;
d_p_onart_vl1000_30 = (p_onart_vl1000_30_2 - p_onart_vl1000_30_1)*100;

proc means n p50 p5 p95;var
p_fsw_newp0__30_2	prop_sw_onprep_30_2		p_sti_sw_30_2	incidence_sw_30_2	prevalence_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2;
run;
***Within run differences;
proc means n mean lclm uclm;var 
d_p_fsw_newp0__30	d_prop_sw_onprep_30		d_p_sti_sw_30	d_incidence_sw_30	d_prevalence_sw_30
d_p_diag_sw_30		d_p_onart_diag_sw_30	d_p_onart_vl1000_sw_30
d_incidence1549_30	d_prevalence1549_30		d_p_diag_30	  	d_p_onart_diag_30   d_p_onart_vl1000_30;
run;

**Assuming SW only improves ART retention;
data art;
set a.wide_fsw_16_08_22_art;
if incidence1549_22 <0.1 then delete;
run;

data art1;
set art;

***Within run differences for table 4;
d_p_fsw_newp0__30 = (p_fsw_newp0__30_2 - p_fsw_newp0__30_1)*100;
d_prop_sw_onprep_30 = (prop_sw_onprep_30_2 - prop_sw_onprep_30_1)*100;
d_p_sti_sw_30 = (p_sti_sw_30_2 - p_sti_sw_30_1)*100;
d_incidence_sw_30 = incidence_sw_30_2 - incidence_sw_30_1;
d_prevalence_sw_30 = (prevalence_sw_30_2 - prevalence_sw_30_1)*100;
d_p_diag_sw_30 = (p_diag_sw_30_2 - p_diag_sw_30_1)*100;
d_p_onart_diag_sw_30 = (p_onart_diag_sw_30_2 - p_onart_diag_sw_30_1)*100;
d_p_onart_vl1000_sw_30 = (p_onart_vl1000_sw_30_2 - p_onart_vl1000_sw_30_1)*100;
d_incidence1549_30 = incidence1549_30_2 - incidence1549_30_1;
d_prevalence1549_30 = (prevalence1549_30_2 - prevalence1549_30_1)*100;
d_p_diag_30 = (p_diag_30_2 - p_diag_30_1)*100;
d_p_onart_diag_30 = (p_onart_diag_30_2 - p_onart_diag_30_1)*100;
d_p_onart_vl1000_30 = (p_onart_vl1000_30_2 - p_onart_vl1000_30_1)*100;

proc means n p50 p5 p95;var
p_fsw_newp0__30_2	prop_sw_onprep_30_2		p_sti_sw_30_2	incidence_sw_30_2	prevalence_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2;
run;
***Within run differences;
proc means n mean lclm uclm;var 
d_p_fsw_newp0__30	d_prop_sw_onprep_30		d_p_sti_sw_30	d_incidence_sw_30	d_prevalence_sw_30
d_p_diag_sw_30		d_p_onart_diag_sw_30	d_p_onart_vl1000_sw_30
d_incidence1549_30	d_prevalence1549_30		d_p_diag_30	  	d_p_onart_diag_30   d_p_onart_vl1000_30;
run;


data costs;
set a;

if 0< incidence1549_22 <= 0.1 then incidence=1;
if 0.1< incidence1549_22 <=0.3 then incidence=2;
if 0.3< incidence1549_22 <= 0.5 then incidence=3;
if 0.5< incidence1549_22 <= 1 then incidence=4;
if 1< incidence1549_22 then incidence =5;


****Cost effectiveness;
/*
_1=no program
_2=low impact sw program
_3=high impact sw program
*/


*difference in costs;
*high vs. none;
diff_dcost_high_v_none = dcost_22_72_3 - dcost_22_72_1;
diff_artcost_high_v_none= dart_cost_y_22_72_3 - dart_cost_y_22_72_1;
diff_testcost_high_v_none = dtest_cost_22_72_3 - dtest_cost_22_72_1;
diff_testcost_sw_high_v_none = dtest_cost_sw_22_72_3 - dtest_cost_sw_22_72_1;

*low vs. none;
diff_dcost_low_v_none = dcost_22_72_2 - dcost_22_72_1;
diff_artcost_low_v_none = dart_cost_y_22_72_2 - dart_cost_y_22_72_1;
diff_testcost_low_v_none = dtest_cost_22_72_2 - dtest_cost_22_72_1;
diff_testcost_sw_low_v_none = dtest_cost_sw_22_72_2 - dtest_cost_sw_22_72_1;

*difference in dalys (dalys averted);
diff_ddaly_high_v_none = ddaly_22_72_3 - ddaly_22_72_1;
diff_ddaly_low_v_none = ddaly_22_72_2 - ddaly_22_72_1;

***DALYs averted * CET - this gives max cost for SW prog to be CE
   (multiplied by -1 since we want to cost the DALYs averted rather than the difference which is negative);
dalys_avert_x_CET_high_v_none = (diff_ddaly_high_v_none * 0.0005)*-1;
dalys_avert_x_CET_low_v_none = (diff_ddaly_low_v_none * 0.0005)*-1;

***Max cost of a SW program - additional $m paid for averting DALYs + initial cost savings;
maxcost_low_v_none= (diff_dcost_low_v_none)*-1 +  dalys_avert_x_CET_low_v_none;
maxcost_high_v_none= (diff_dcost_high_v_none)*-1 +  dalys_avert_x_CET_high_v_none;


*net dalys using $500;
netdalys_no_swprog =  ddaly_22_72_1 + (dcost_22_72_1)/0.0005;
netdalys_swprog_low =  ddaly_22_72_2 + (dcost_22_72_2)/0.0005;*expect dalys to be lower here;
netdalys_swprog_high =  ddaly_22_72_3 + (dcost_22_72_3)/0.0005;*expect dalys to be lower here;

*net dalys averted;
diff_netdalys_swprog_high_v_none = netdalys_swprog_high - netdalys_no_swprog; *take absolute number;

*net monetary benefit (Dalys * cost-effectivenss threshold) + costs;
nmb_none = (ddaly_22_72_1*0.0005) + dcost_22_72_1;
nmb_swprog_low= (ddaly_22_72_2*0.0005) + dcost_22_72_2;
nmb_swprog_high = (ddaly_22_72_3*0.0005) + dcost_22_72_3;

diff_nmb_swprog_high_v_none=nmb_swprog_high - nmb_none;
diff_nmb_swprog_low_v_none=nmb_swprog_low - nmb_none;

***max cost of SW prog;
maxcost_swprog_high_v_none= diff_netdalys_swprog_high_v_none * 500;


***No program vs. low impact;
*dalys averted;
diff_ddaly_swprog_low_v_none = ddaly_22_72_2 - ddaly_22_72_1;

*difference in total costs;
diff_dcost_swprog_low_v_none = dcost_22_72_2 - dcost_22_72_1;

***look at individual costs;
diff_artcost_swprog_low_v_none = dart_cost_y_22_72_2 - dart_cost_y_22_72_1;
diff_testcost_swprog_low_v_none = dtest_cost_22_72_2 - dtest_cost_22_72_1;


*net dalys averted;
diff_netdalys_swprog_low_v_none = netdalys_swprog_low - netdalys_no_swprog; *take absolute number;

***cost of SW prog;
maxcost_swprog_low_v_none= diff_netdalys_swprog_low_v_none * 500;


***(DALYs averted *500) - difference in costs;



***Low program vs. high impact;
*dalys averted;
diff_ddaly_swprog_high_v_low = ddaly_22_72_3 - ddaly_22_72_2;

*difference in total costs;
diff_dcost_swprog_high_v_low = dcost_22_72_3 - dcost_22_72_2;

***look at individual costs;
diff_artcost_swprog_high_v_low = dart_cost_y_22_72_3 - dart_cost_y_22_72_2;
diff_testcost_swprog_high_v_low = dtest_cost_22_72_3 - dtest_cost_22_72_2;

*net dalys averted;
diff_netdalys_swprog_high_v_low = netdalys_swprog_high - netdalys_swprog_low; *take absolute number;

***cost of SW prog;
maxcost_swprog_high_v_low= diff_netdalys_swprog_high_v_low*500;

proc means n mean p50 p5 p95 lclm uclm;var dcost_23_24_1 dcost_23_24_2 dcost_23_24_3;run;


***Absolute costs;
proc means n mean p50 p5 p95 lclm uclm;
var dcost_22_72_1 dcost_22_72_2 dcost_22_72_3
	dart_cost_y_22_72_1 dart_cost_y_22_72_2 dart_cost_y_22_72_3
	dtest_cost_22_72_1 dtest_cost_22_72_2 dtest_cost_22_72_3
	dtest_cost_sw_22_72_1 dtest_cost_sw_22_72_2 dtest_cost_sw_22_72_3
;run;

***Difference in costs - high vs. none;
proc means n mean p50 p5 p95 lclm uclm;
var diff_dcost_low_v_none diff_artcost_low_v_none diff_testcost_low_v_none diff_testcost_sw_low_v_none
	diff_dcost_high_v_none diff_artcost_high_v_none diff_testcost_high_v_none diff_testcost_sw_high_v_none;
run;

***DALYs;
proc means n mean p50 p5 p95 lclm uclm;
var	ddaly_22_72_1 ddaly_22_72_2 ddaly_22_72_3
	diff_ddaly_low_v_none diff_ddaly_high_v_none;
run;

***Additional we can spend taking into account DALYs averted using $500 threshold;
proc means n mean p50 p5 p95 lclm uclm;
var dalys_avert_x_CET_low_v_none dalys_avert_x_CET_high_v_none ;
run;

***Max we can spend for a SW prog to be CE;
proc means n mean p50 p5 p95 lclm uclm;
var maxcost_low_v_none maxcost_high_v_none;run;

proc means n mean p50 p5 p95 lclm uclm;
var maxcost_low_v_none maxcost_high_v_none;where incidence=1;run;
proc means n mean p50 p5 p95 lclm uclm;
var maxcost_low_v_none maxcost_high_v_none;where incidence=2;run;
proc means n mean p50 p5 p95 lclm uclm;
var maxcost_low_v_none maxcost_high_v_none;where incidence=3;run;
proc means n mean p50 p5 p95 lclm uclm;
var maxcost_low_v_none maxcost_high_v_none;where incidence=4;run;
proc means n mean p50 p5 p95 lclm uclm;
var maxcost_low_v_none maxcost_high_v_none;where incidence=5;run;








***Cost per DALY using CET;

***Net DALYs;
proc means n mean p50 p5 p95 lclm uclm;
var	netdalys_no_swprog netdalys_swprog_low netdalys_swprog_high
	diff_netdalys_swprog_low_v_none diff_netdalys_swprog_high_v_none
;run;

***Net monetary benefit;
proc means n mean p50 p5 p95 lclm uclm;
var	nmb_none nmb_swprog_high nmb_swprog_low
	diff_nmb_swprog_low_v_none diff_nmb_swprog_high_v_none
;run;


***max cost to spend on a SW program;
proc means n mean p50 p5 p95 lclm uclm;
var	maxcost_swprog_low_v_none maxcost_swprog_high_v_none;
run;










proc means n p50;VAR
dart_cost_y_22_72_1
dadc_cost_22_72_1 dcd4_cost_22_72_1 dvl_cost_22_72_1 dvis_cost_22_72_1 dnon_tb_who3_cost_22_72_1 dcot_cost_22_72_1
dtb_cost_22_72_1 dres_cost_22_72_1 dtest_cost_22_72_1 d_t_adh_int_cost_22_72_1 
dswitchline_cost_22_72_1 
dcost_prep_visit_oral_22_72_1 dcost_prep_oral_22_72_1 
dcost_prep_visit_inj_22_72_1 dcost_prep_inj_22_72_1
prop_sw_onprep_22_72_1
dart_cost_y_22_72_3
dadc_cost_22_72_3 dcd4_cost_22_72_3 dvl_cost_22_72_3 dvis_cost_22_72_3 dnon_tb_who3_cost_22_72_3 dcot_cost_22_72_3
dtb_cost_22_72_3 dres_cost_22_72_3 dtest_cost_22_72_3 d_t_adh_int_cost_22_72_3 
dswitchline_cost_22_72_3 
dcost_prep_visit_oral_22_72_3 dcost_prep_oral_22_72_3 
dcost_prep_visit_inj_22_72_3 dcost_prep_inj_22_72_3
prop_sw_onprep_22_72_3
;run;


proc means n mean p50 p5 p95 lclm uclm;var netdalys_no_swprog netdalys_swprog_high diff_netdalys_swprog_high maxcost_swprog_high ;run;

proc univariate;var maxcost_swprog_high;run;

diff_netdalys_swprog_high cost_swprog_high;run;

*sw prog cost-effective?;
ce_swprog_high=0;if diff_netdalys_swprog_high gt 0 then ce_swprog_high=1;

*cost per daly averted - this will be maximum difference in cost if DALYS are not averted; 
/*proc freq;table diff_dcost_swprog_high;run;*/

cost_daly_avert_swprog_high=*1000000;
if diff_ddaly_swprog_high gt 0 then cost_daly_avert_swprog_high = (diff_dcost_swprog_high / diff_ddaly_swprog_high)*1000000;


proc means n mean p50 p5 p95 lclm uclm;var cost_daly_avert_swprog_high;run;
