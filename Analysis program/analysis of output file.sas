
libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\";


***This version used for the paper;
data a; 

*if incidence_sw_22 <0.1 then delete;
*set a.wide_fsw_17_08_23d; ***Used for the paper without the 'd' - the d file just added in 2 more parameters so should be the same as orignal file;
*set a.wide_fsw_17_08_23c;***this is with various costs for a SW program to check if it's CE;

set a.wide_fsw_17_08_23_final ;

if incidence1549_22 =0 then delete;
if n_sw_1549__22 <15000 then delete; ***low number of sw, greater stochastic effects;
 
if p_diag_sw_22=. then p_diag_sw_22=1;
if p_diag_sw_22 gt  0.9499370033

then delete;

proc freq;table run;run;

proc freq;table p_sw_prog_vis_30_1;run;


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

d_incidence1549_72_1_50y=incidence1549_72_3-incidence1549_72_1;
run;

***table 1;
proc means n p50 p5 p95 min max;var
prevalence1549_22 	 prevalence1549w_22 	prevalence1549m_22 	incidence1549_22 	incidence1549w_22 	incidence1549m_22
p_diag_22	 		 p_onart_diag_22   		p_onart_vl1000_22	p_vg1000_22 		p_vl1000_22 		prevalence_vg1000_22
incidence_sw_22		p_fsw_newp0__22

p_diag_w_22 p_diag_m_22;
;run;

/*
p_diag_m_22	 		p_diag_w_22
p_onart_diag_m_22   	p_onart_diag_w_22
p_onart_vl1000_m_22   p_onart_vl1000_w_22
*/


***table 2 - characteristics of FSW in 2022;
proc means n p50 p5 p95;var
n_sw_1549__22		prop_w_1549_sw_22 		prop_w_ever_sw_22		act_dur_sw_22 
p_sw_age1519__22	p_sw_age2024__22		p_sw_age2529__22 		p_sw_age3039__22  p_fsw_newp0__22 prop_sw_onprep_22
p_sti_sw_22
incidence_sw_22		prevalence_sw_22
p_diag_sw_22		p_onart_diag_sw_22		p_onart_vl1000_sw_22 p_sw_prog_vis_22;
run;

proc freq;table p_sw_prog_vis_1 p_sw_prog_vis_2 p_sw_prog_vis_3;run;

***table 3 - characteristics in 2030 by option;

proc means n p50 p5 p95  mean lclm uclm;var
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


***Outputs in 2072;
 proc means n p50 p5 p95;var 
incidence1549_72_1 incidence1549_72_2 incidence1549_72_3 d_incidence1549_72_1_50y;run;


***Within run differences - means;
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
*medians;
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

***runs in which outputs have not improved;
proc print;var run d_p_onart_diag_sw_lo_none p_onart_diag_sw_30_1  p_onart_diag_sw_30_2
 ;where d_p_onart_diag_sw_lo_none<0;run;

proc print;var run d_p_diag_sw_lo_none p_diag_sw_30_1 p_diag_sw_30_2 n_sw_1549__22
 ;where d_p_diag_sw_lo_none<0;run;

d_p_diag_sw_lo_none = (p_diag_sw_30_2 - p_diag_sw_30_1)*100;


**Impact of specific aspects of a SW program;
/*
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
*/

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
dcost_prep_22_72_1 = dcost_prep_oral_22_72_1 + dcost_prep_inj_22_72_1;
dcost_prep_22_72_2 = dcost_prep_oral_22_72_2 + dcost_prep_inj_22_72_2;
dcost_prep_22_72_3 = dcost_prep_oral_22_72_3 + dcost_prep_inj_22_72_3;

*high vs. none;
diff_dcost_high_v_none = dcost_22_72_3 - dcost_22_72_1;
diff_artcost_high_v_none= dart_cost_y_22_72_3 - dart_cost_y_22_72_1;
diff_testcost_high_v_none = dtest_cost_22_72_3 - dtest_cost_22_72_1;
diff_testcost_sw_high_v_none = dtest_cost_sw_22_72_3 - dtest_cost_sw_22_72_1;
diff_prepcost_high_v_none = dcost_prep_22_72_3 - dcost_prep_22_72_1;
*low vs. none;
diff_dcost_low_v_none = dcost_22_72_2 - dcost_22_72_1;
diff_artcost_low_v_none = dart_cost_y_22_72_2 - dart_cost_y_22_72_1;
diff_testcost_low_v_none = dtest_cost_22_72_2 - dtest_cost_22_72_1;
diff_testcost_sw_low_v_none = dtest_cost_sw_22_72_2 - dtest_cost_sw_22_72_1;
diff_prepcost_low_v_none = dcost_prep_22_72_2 - dcost_prep_22_72_1;

***difference in costs considering different costs for sw programs;
diff_dcost_high_v_none19_ = dcost19__22_72_3 - dcost19__22_72_1;

diff_dcost_high_v_none10_ = dcost10__22_72_3 - dcost10__22_72_1;
diff_dcost_high_v_none15_ = dcost15__22_72_3 - dcost15__22_72_1;
diff_dcost_high_v_none20_ = dcost20__22_72_3 - dcost20__22_72_1;
diff_dcost_high_v_none25_ = dcost25__22_72_3 - dcost25__22_72_1;
diff_dcost_high_v_none30_ = dcost30__22_72_3 - dcost30__22_72_1;
diff_dcost_high_v_none35_ = dcost35__22_72_3 - dcost35__22_72_1;
diff_dcost_high_v_none40_ = dcost40__22_72_3 - dcost40__22_72_1;
diff_dcost_high_v_none45_ = dcost45__22_72_3 - dcost45__22_72_1;
diff_dcost_high_v_none50_ = dcost50__22_72_3 - dcost50__22_72_1;
diff_dcost_high_v_none55_ = dcost55__22_72_3 - dcost55__22_72_1;
diff_dcost_high_v_none60_ = dcost60__22_72_3 - dcost60__22_72_1;

diff_dcost_high_v_none65_ = dcost65__22_72_3 - dcost65__22_72_1;
diff_dcost_high_v_none70_ = dcost70__22_72_3 - dcost70__22_72_1;
diff_dcost_high_v_none75_ = dcost75__22_72_3 - dcost75__22_72_1;
diff_dcost_high_v_none80_ = dcost80__22_72_3 - dcost80__22_72_1;


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

***net dalys averted using different costs of sw program and different thresholds;

*500, no program;
netdalys500_no_swprog10 =  ddaly_22_72_1 + (dcost10__22_72_1)/0.0005;
netdalys500_no_swprog15 =  ddaly_22_72_1 + (dcost15__22_72_1)/0.0005;
netdalys500_no_swprog20 =  ddaly_22_72_1 + (dcost20__22_72_1)/0.0005;
netdalys500_no_swprog25 =  ddaly_22_72_1 + (dcost25__22_72_1)/0.0005;
netdalys500_no_swprog30 =  ddaly_22_72_1 + (dcost30__22_72_1)/0.0005;
netdalys500_no_swprog35 =  ddaly_22_72_1 + (dcost35__22_72_1)/0.0005;
netdalys500_no_swprog40 =  ddaly_22_72_1 + (dcost40__22_72_1)/0.0005;
netdalys500_no_swprog45 =  ddaly_22_72_1 + (dcost45__22_72_1)/0.0005;
netdalys500_no_swprog50 =  ddaly_22_72_1 + (dcost50__22_72_1)/0.0005;
netdalys500_no_swprog55 =  ddaly_22_72_1 + (dcost55__22_72_1)/0.0005;
netdalys500_no_swprog60 =  ddaly_22_72_1 + (dcost60__22_72_1)/0.0005;
netdalys500_no_swprog65 =  ddaly_22_72_1 + (dcost65__22_72_1)/0.0005;
netdalys500_no_swprog70 =  ddaly_22_72_1 + (dcost70__22_72_1)/0.0005;
netdalys500_no_swprog75 =  ddaly_22_72_1 + (dcost75__22_72_1)/0.0005;
netdalys500_no_swprog80 =  ddaly_22_72_1 + (dcost80__22_72_1)/0.0005;
netdalys500_no_swprog85 =  ddaly_22_72_1 + (dcost85__22_72_1)/0.0005;
netdalys500_no_swprog90 =  ddaly_22_72_1 + (dcost90__22_72_1)/0.0005;
netdalys500_no_swprog95 =  ddaly_22_72_1 + (dcost95__22_72_1)/0.0005;
netdalys500_no_swprog100 =  ddaly_22_72_1 + (dcost100__22_72_1)/0.0005;
netdalys500_no_swprog105 =  ddaly_22_72_1 + (dcost105__22_72_1)/0.0005;
netdalys500_no_swprog110 =  ddaly_22_72_1 + (dcost110__22_72_1)/0.0005;
netdalys500_no_swprog115 =  ddaly_22_72_1 + (dcost115__22_72_1)/0.0005;
netdalys500_no_swprog120 =  ddaly_22_72_1 + (dcost120__22_72_1)/0.0005;
netdalys500_no_swprog125 =  ddaly_22_72_1 + (dcost125__22_72_1)/0.0005;
netdalys500_no_swprog130 =  ddaly_22_72_1 + (dcost130__22_72_1)/0.0005;
netdalys500_no_swprog135 =  ddaly_22_72_1 + (dcost135__22_72_1)/0.0005;
netdalys500_no_swprog140 =  ddaly_22_72_1 + (dcost140__22_72_1)/0.0005;
netdalys500_no_swprog145 =  ddaly_22_72_1 + (dcost145__22_72_1)/0.0005;
netdalys500_no_swprog150 =  ddaly_22_72_1 + (dcost150__22_72_1)/0.0005;
netdalys500_no_swprog155 =  ddaly_22_72_1 + (dcost155__22_72_1)/0.0005;
netdalys500_no_swprog160 =  ddaly_22_72_1 + (dcost160__22_72_1)/0.0005;
netdalys500_no_swprog165 =  ddaly_22_72_1 + (dcost165__22_72_1)/0.0005;
netdalys500_no_swprog170 =  ddaly_22_72_1 + (dcost170__22_72_1)/0.0005;
netdalys500_no_swprog175 =  ddaly_22_72_1 + (dcost175__22_72_1)/0.0005;
netdalys500_no_swprog180 =  ddaly_22_72_1 + (dcost180__22_72_1)/0.0005;
netdalys500_no_swprog185 =  ddaly_22_72_1 + (dcost185__22_72_1)/0.0005;
netdalys500_no_swprog190 =  ddaly_22_72_1 + (dcost190__22_72_1)/0.0005;
netdalys500_no_swprog195 =  ddaly_22_72_1 + (dcost195__22_72_1)/0.0005;
netdalys500_no_swprog200 =  ddaly_22_72_1 + (dcost200__22_72_1)/0.0005;
netdalys500_no_swprog205 =  ddaly_22_72_1 + (dcost205__22_72_1)/0.0005;
netdalys500_no_swprog210 =  ddaly_22_72_1 + (dcost210__22_72_1)/0.0005;
netdalys500_no_swprog215 =  ddaly_22_72_1 + (dcost215__22_72_1)/0.0005;
netdalys500_no_swprog220 =  ddaly_22_72_1 + (dcost220__22_72_1)/0.0005;
netdalys500_no_swprog225 =  ddaly_22_72_1 + (dcost225__22_72_1)/0.0005;
netdalys500_no_swprog230 =  ddaly_22_72_1 + (dcost230__22_72_1)/0.0005;
netdalys500_no_swprog235 =  ddaly_22_72_1 + (dcost235__22_72_1)/0.0005;
netdalys500_no_swprog240 =  ddaly_22_72_1 + (dcost240__22_72_1)/0.0005;
netdalys500_no_swprog245 =  ddaly_22_72_1 + (dcost245__22_72_1)/0.0005;
netdalys500_no_swprog250 =  ddaly_22_72_1 + (dcost250__22_72_1)/0.0005;

*500, low program;
netdalys500_low_swprog10 =  ddaly_22_72_2 + (dcost10__22_72_2)/0.0005;
netdalys500_low_swprog15 =  ddaly_22_72_2 + (dcost15__22_72_2)/0.0005;
netdalys500_low_swprog20 =  ddaly_22_72_2 + (dcost20__22_72_2)/0.0005;
netdalys500_low_swprog25 =  ddaly_22_72_2 + (dcost25__22_72_2)/0.0005;
netdalys500_low_swprog30 =  ddaly_22_72_2 + (dcost30__22_72_2)/0.0005;
netdalys500_low_swprog35 =  ddaly_22_72_2 + (dcost35__22_72_2)/0.0005;
netdalys500_low_swprog40 =  ddaly_22_72_2 + (dcost40__22_72_2)/0.0005;
netdalys500_low_swprog45 =  ddaly_22_72_2 + (dcost45__22_72_2)/0.0005;
netdalys500_low_swprog50 =  ddaly_22_72_2 + (dcost50__22_72_2)/0.0005;
netdalys500_low_swprog55 =  ddaly_22_72_2 + (dcost55__22_72_2)/0.0005;
netdalys500_low_swprog60 =  ddaly_22_72_2 + (dcost60__22_72_2)/0.0005;
netdalys500_low_swprog65 =  ddaly_22_72_2 + (dcost65__22_72_2)/0.0005;
netdalys500_low_swprog70 =  ddaly_22_72_2 + (dcost70__22_72_2)/0.0005;
netdalys500_low_swprog75 =  ddaly_22_72_2 + (dcost75__22_72_2)/0.0005;
netdalys500_low_swprog80 =  ddaly_22_72_2 + (dcost80__22_72_2)/0.0005;
netdalys500_low_swprog85 =  ddaly_22_72_2 + (dcost85__22_72_2)/0.0005;
netdalys500_low_swprog90 =  ddaly_22_72_2 + (dcost90__22_72_2)/0.0005;
netdalys500_low_swprog95 =  ddaly_22_72_2 + (dcost95__22_72_2)/0.0005;
netdalys500_low_swprog100 =  ddaly_22_72_2 + (dcost100__22_72_2)/0.0005;
netdalys500_low_swprog105 =  ddaly_22_72_2 + (dcost105__22_72_2)/0.0005;
netdalys500_low_swprog110 =  ddaly_22_72_2 + (dcost110__22_72_2)/0.0005;
netdalys500_low_swprog115 =  ddaly_22_72_2 + (dcost115__22_72_2)/0.0005;
netdalys500_low_swprog120 =  ddaly_22_72_2 + (dcost120__22_72_2)/0.0005;
netdalys500_low_swprog125 =  ddaly_22_72_2 + (dcost125__22_72_2)/0.0005;
netdalys500_low_swprog130 =  ddaly_22_72_2 + (dcost130__22_72_2)/0.0005;
netdalys500_low_swprog135 =  ddaly_22_72_2 + (dcost135__22_72_2)/0.0005;
netdalys500_low_swprog140 =  ddaly_22_72_2 + (dcost140__22_72_2)/0.0005;
netdalys500_low_swprog145 =  ddaly_22_72_2 + (dcost145__22_72_2)/0.0005;
netdalys500_low_swprog150 =  ddaly_22_72_2 + (dcost150__22_72_2)/0.0005;
netdalys500_low_swprog155 =  ddaly_22_72_2 + (dcost155__22_72_2)/0.0005;
netdalys500_low_swprog160 =  ddaly_22_72_2 + (dcost160__22_72_2)/0.0005;
netdalys500_low_swprog165 =  ddaly_22_72_2 + (dcost165__22_72_2)/0.0005;
netdalys500_low_swprog170 =  ddaly_22_72_2 + (dcost170__22_72_2)/0.0005;
netdalys500_low_swprog175 =  ddaly_22_72_2 + (dcost175__22_72_2)/0.0005;
netdalys500_low_swprog180 =  ddaly_22_72_2 + (dcost180__22_72_2)/0.0005;
netdalys500_low_swprog185 =  ddaly_22_72_2 + (dcost185__22_72_2)/0.0005;
netdalys500_low_swprog190 =  ddaly_22_72_2 + (dcost190__22_72_2)/0.0005;
netdalys500_low_swprog195 =  ddaly_22_72_2 + (dcost195__22_72_2)/0.0005;
netdalys500_low_swprog200 =  ddaly_22_72_2 + (dcost200__22_72_2)/0.0005;
netdalys500_low_swprog205 =  ddaly_22_72_2 + (dcost205__22_72_2)/0.0005;
netdalys500_low_swprog210 =  ddaly_22_72_2 + (dcost210__22_72_2)/0.0005;
netdalys500_low_swprog215 =  ddaly_22_72_2 + (dcost215__22_72_2)/0.0005;
netdalys500_low_swprog220 =  ddaly_22_72_2 + (dcost220__22_72_2)/0.0005;
netdalys500_low_swprog225 =  ddaly_22_72_2 + (dcost225__22_72_2)/0.0005;
netdalys500_low_swprog230 =  ddaly_22_72_2 + (dcost230__22_72_2)/0.0005;
netdalys500_low_swprog235 =  ddaly_22_72_2 + (dcost235__22_72_2)/0.0005;
netdalys500_low_swprog240 =  ddaly_22_72_2 + (dcost240__22_72_2)/0.0005;
netdalys500_low_swprog245 =  ddaly_22_72_2 + (dcost245__22_72_2)/0.0005;
netdalys500_low_swprog250 =  ddaly_22_72_2 + (dcost250__22_72_2)/0.0005;

*500, high program;
netdalys500_high_swprog10 =  ddaly_22_72_3 + (dcost10__22_72_3)/0.0005;
netdalys500_high_swprog15 =  ddaly_22_72_3 + (dcost15__22_72_3)/0.0005;
netdalys500_high_swprog20 =  ddaly_22_72_3 + (dcost20__22_72_3)/0.0005;
netdalys500_high_swprog25 =  ddaly_22_72_3 + (dcost25__22_72_3)/0.0005;
netdalys500_high_swprog30 =  ddaly_22_72_3 + (dcost30__22_72_3)/0.0005;
netdalys500_high_swprog35 =  ddaly_22_72_3 + (dcost35__22_72_3)/0.0005;
netdalys500_high_swprog40 =  ddaly_22_72_3 + (dcost40__22_72_3)/0.0005;
netdalys500_high_swprog45 =  ddaly_22_72_3 + (dcost45__22_72_3)/0.0005;
netdalys500_high_swprog50 =  ddaly_22_72_3 + (dcost50__22_72_3)/0.0005;
netdalys500_high_swprog55 =  ddaly_22_72_3 + (dcost55__22_72_3)/0.0005;
netdalys500_high_swprog60 =  ddaly_22_72_3 + (dcost60__22_72_3)/0.0005;
netdalys500_high_swprog65 =  ddaly_22_72_3 + (dcost65__22_72_3)/0.0005;
netdalys500_high_swprog70 =  ddaly_22_72_3 + (dcost70__22_72_3)/0.0005;
netdalys500_high_swprog75 =  ddaly_22_72_3 + (dcost75__22_72_3)/0.0005;
netdalys500_high_swprog80 =  ddaly_22_72_3 + (dcost80__22_72_3)/0.0005;
netdalys500_high_swprog85 =  ddaly_22_72_3 + (dcost85__22_72_3)/0.0005;
netdalys500_high_swprog90 =  ddaly_22_72_3 + (dcost90__22_72_3)/0.0005;
netdalys500_high_swprog95 =  ddaly_22_72_3 + (dcost95__22_72_3)/0.0005;
netdalys500_high_swprog100 =  ddaly_22_72_3 + (dcost100__22_72_3)/0.0005;
netdalys500_high_swprog105 =  ddaly_22_72_3 + (dcost105__22_72_3)/0.0005;
netdalys500_high_swprog110 =  ddaly_22_72_3 + (dcost110__22_72_3)/0.0005;
netdalys500_high_swprog115 =  ddaly_22_72_3 + (dcost115__22_72_3)/0.0005;
netdalys500_high_swprog120 =  ddaly_22_72_3 + (dcost120__22_72_3)/0.0005;
netdalys500_high_swprog125 =  ddaly_22_72_3 + (dcost125__22_72_3)/0.0005;
netdalys500_high_swprog130 =  ddaly_22_72_3 + (dcost130__22_72_3)/0.0005;
netdalys500_high_swprog135 =  ddaly_22_72_3 + (dcost135__22_72_3)/0.0005;
netdalys500_high_swprog140 =  ddaly_22_72_3 + (dcost140__22_72_3)/0.0005;
netdalys500_high_swprog145 =  ddaly_22_72_3 + (dcost145__22_72_3)/0.0005;
netdalys500_high_swprog150 =  ddaly_22_72_3 + (dcost150__22_72_3)/0.0005;
netdalys500_high_swprog155 =  ddaly_22_72_3 + (dcost155__22_72_3)/0.0005;
netdalys500_high_swprog160 =  ddaly_22_72_3 + (dcost160__22_72_3)/0.0005;
netdalys500_high_swprog165 =  ddaly_22_72_3 + (dcost165__22_72_3)/0.0005;
netdalys500_high_swprog170 =  ddaly_22_72_3 + (dcost170__22_72_3)/0.0005;
netdalys500_high_swprog175 =  ddaly_22_72_3 + (dcost175__22_72_3)/0.0005;
netdalys500_high_swprog180 =  ddaly_22_72_3 + (dcost180__22_72_3)/0.0005;
netdalys500_high_swprog185 =  ddaly_22_72_3 + (dcost185__22_72_3)/0.0005;
netdalys500_high_swprog190 =  ddaly_22_72_3 + (dcost190__22_72_3)/0.0005;
netdalys500_high_swprog195 =  ddaly_22_72_3 + (dcost195__22_72_3)/0.0005;
netdalys500_high_swprog200 =  ddaly_22_72_3 + (dcost200__22_72_3)/0.0005;
netdalys500_high_swprog205 =  ddaly_22_72_3 + (dcost205__22_72_3)/0.0005;
netdalys500_high_swprog210 =  ddaly_22_72_3 + (dcost210__22_72_3)/0.0005;
netdalys500_high_swprog215 =  ddaly_22_72_3 + (dcost215__22_72_3)/0.0005;
netdalys500_high_swprog220 =  ddaly_22_72_3 + (dcost220__22_72_3)/0.0005;
netdalys500_high_swprog225 =  ddaly_22_72_3 + (dcost225__22_72_3)/0.0005;
netdalys500_high_swprog230 =  ddaly_22_72_3 + (dcost230__22_72_3)/0.0005;
netdalys500_high_swprog235 =  ddaly_22_72_3 + (dcost235__22_72_3)/0.0005;
netdalys500_high_swprog240 =  ddaly_22_72_3 + (dcost240__22_72_3)/0.0005;
netdalys500_high_swprog245 =  ddaly_22_72_3 + (dcost245__22_72_3)/0.0005;
netdalys500_high_swprog250 =  ddaly_22_72_3 + (dcost250__22_72_3)/0.0005;

*300, no program;
netdalys300_no_swprog10 =  ddaly_22_72_1 + (dcost10__22_72_1)/0.0003;
netdalys300_no_swprog15 =  ddaly_22_72_1 + (dcost15__22_72_1)/0.0003;
netdalys300_no_swprog20 =  ddaly_22_72_1 + (dcost20__22_72_1)/0.0003;
netdalys300_no_swprog25 =  ddaly_22_72_1 + (dcost25__22_72_1)/0.0003;
netdalys300_no_swprog30 =  ddaly_22_72_1 + (dcost30__22_72_1)/0.0003;
netdalys300_no_swprog35 =  ddaly_22_72_1 + (dcost35__22_72_1)/0.0003;
netdalys300_no_swprog40 =  ddaly_22_72_1 + (dcost40__22_72_1)/0.0003;
netdalys300_no_swprog45 =  ddaly_22_72_1 + (dcost45__22_72_1)/0.0003;
netdalys300_no_swprog50 =  ddaly_22_72_1 + (dcost50__22_72_1)/0.0003;
netdalys300_no_swprog55 =  ddaly_22_72_1 + (dcost55__22_72_1)/0.0003;
netdalys300_no_swprog60 =  ddaly_22_72_1 + (dcost60__22_72_1)/0.0003;
netdalys300_no_swprog65 =  ddaly_22_72_1 + (dcost65__22_72_1)/0.0003;
netdalys300_no_swprog70 =  ddaly_22_72_1 + (dcost70__22_72_1)/0.0003;
netdalys300_no_swprog75 =  ddaly_22_72_1 + (dcost75__22_72_1)/0.0003;
netdalys300_no_swprog80 =  ddaly_22_72_1 + (dcost80__22_72_1)/0.0003;
netdalys300_no_swprog85 =  ddaly_22_72_1 + (dcost85__22_72_1)/0.0003;
netdalys300_no_swprog90 =  ddaly_22_72_1 + (dcost90__22_72_1)/0.0003;
netdalys300_no_swprog95 =  ddaly_22_72_1 + (dcost95__22_72_1)/0.0003;
netdalys300_no_swprog100 =  ddaly_22_72_1 + (dcost100__22_72_1)/0.0003;
netdalys300_no_swprog105 =  ddaly_22_72_1 + (dcost105__22_72_1)/0.0003;
netdalys300_no_swprog110 =  ddaly_22_72_1 + (dcost110__22_72_1)/0.0003;
netdalys300_no_swprog115 =  ddaly_22_72_1 + (dcost115__22_72_1)/0.0003;
netdalys300_no_swprog120 =  ddaly_22_72_1 + (dcost120__22_72_1)/0.0003;
netdalys300_no_swprog125 =  ddaly_22_72_1 + (dcost125__22_72_1)/0.0003;
netdalys300_no_swprog130 =  ddaly_22_72_1 + (dcost130__22_72_1)/0.0003;
netdalys300_no_swprog135 =  ddaly_22_72_1 + (dcost135__22_72_1)/0.0003;
netdalys300_no_swprog140 =  ddaly_22_72_1 + (dcost140__22_72_1)/0.0003;
netdalys300_no_swprog145 =  ddaly_22_72_1 + (dcost145__22_72_1)/0.0003;
netdalys300_no_swprog150 =  ddaly_22_72_1 + (dcost150__22_72_1)/0.0003;
netdalys300_no_swprog155 =  ddaly_22_72_1 + (dcost155__22_72_1)/0.0003;
netdalys300_no_swprog160 =  ddaly_22_72_1 + (dcost160__22_72_1)/0.0003;
netdalys300_no_swprog165 =  ddaly_22_72_1 + (dcost165__22_72_1)/0.0003;
netdalys300_no_swprog170 =  ddaly_22_72_1 + (dcost170__22_72_1)/0.0003;
netdalys300_no_swprog175 =  ddaly_22_72_1 + (dcost175__22_72_1)/0.0003;
netdalys300_no_swprog180 =  ddaly_22_72_1 + (dcost180__22_72_1)/0.0003;
netdalys300_no_swprog185 =  ddaly_22_72_1 + (dcost185__22_72_1)/0.0003;
netdalys300_no_swprog190 =  ddaly_22_72_1 + (dcost190__22_72_1)/0.0003;
netdalys300_no_swprog195 =  ddaly_22_72_1 + (dcost195__22_72_1)/0.0003;
netdalys300_no_swprog200 =  ddaly_22_72_1 + (dcost200__22_72_1)/0.0003;
netdalys300_no_swprog205 =  ddaly_22_72_1 + (dcost205__22_72_1)/0.0003;
netdalys300_no_swprog210 =  ddaly_22_72_1 + (dcost210__22_72_1)/0.0003;
netdalys300_no_swprog215 =  ddaly_22_72_1 + (dcost215__22_72_1)/0.0003;
netdalys300_no_swprog220 =  ddaly_22_72_1 + (dcost220__22_72_1)/0.0003;
netdalys300_no_swprog225 =  ddaly_22_72_1 + (dcost225__22_72_1)/0.0003;
netdalys300_no_swprog230 =  ddaly_22_72_1 + (dcost230__22_72_1)/0.0003;
netdalys300_no_swprog235 =  ddaly_22_72_1 + (dcost235__22_72_1)/0.0003;
netdalys300_no_swprog240 =  ddaly_22_72_1 + (dcost240__22_72_1)/0.0003;
netdalys300_no_swprog245 =  ddaly_22_72_1 + (dcost245__22_72_1)/0.0003;
netdalys300_no_swprog250 =  ddaly_22_72_1 + (dcost250__22_72_1)/0.0003;

*300, low program;
netdalys300_low_swprog10 =  ddaly_22_72_2 + (dcost10__22_72_2)/0.0003;
netdalys300_low_swprog15 =  ddaly_22_72_2 + (dcost15__22_72_2)/0.0003;
netdalys300_low_swprog20 =  ddaly_22_72_2 + (dcost20__22_72_2)/0.0003;
netdalys300_low_swprog25 =  ddaly_22_72_2 + (dcost25__22_72_2)/0.0003;
netdalys300_low_swprog30 =  ddaly_22_72_2 + (dcost30__22_72_2)/0.0003;
netdalys300_low_swprog35 =  ddaly_22_72_2 + (dcost35__22_72_2)/0.0003;
netdalys300_low_swprog40 =  ddaly_22_72_2 + (dcost40__22_72_2)/0.0003;
netdalys300_low_swprog45 =  ddaly_22_72_2 + (dcost45__22_72_2)/0.0003;
netdalys300_low_swprog50 =  ddaly_22_72_2 + (dcost50__22_72_2)/0.0003;
netdalys300_low_swprog55 =  ddaly_22_72_2 + (dcost55__22_72_2)/0.0003;
netdalys300_low_swprog60 =  ddaly_22_72_2 + (dcost60__22_72_2)/0.0003;
netdalys300_low_swprog65 =  ddaly_22_72_2 + (dcost65__22_72_2)/0.0003;
netdalys300_low_swprog70 =  ddaly_22_72_2 + (dcost70__22_72_2)/0.0003;
netdalys300_low_swprog75 =  ddaly_22_72_2 + (dcost75__22_72_2)/0.0003;
netdalys300_low_swprog80 =  ddaly_22_72_2 + (dcost80__22_72_2)/0.0003;
netdalys300_low_swprog85 =  ddaly_22_72_2 + (dcost85__22_72_2)/0.0003;
netdalys300_low_swprog90 =  ddaly_22_72_2 + (dcost90__22_72_2)/0.0003;
netdalys300_low_swprog95 =  ddaly_22_72_2 + (dcost95__22_72_2)/0.0003;
netdalys300_low_swprog100 =  ddaly_22_72_2 + (dcost100__22_72_2)/0.0003;
netdalys300_low_swprog105 =  ddaly_22_72_2 + (dcost105__22_72_2)/0.0003;
netdalys300_low_swprog110 =  ddaly_22_72_2 + (dcost110__22_72_2)/0.0003;
netdalys300_low_swprog115 =  ddaly_22_72_2 + (dcost115__22_72_2)/0.0003;
netdalys300_low_swprog120 =  ddaly_22_72_2 + (dcost120__22_72_2)/0.0003;
netdalys300_low_swprog125 =  ddaly_22_72_2 + (dcost125__22_72_2)/0.0003;
netdalys300_low_swprog130 =  ddaly_22_72_2 + (dcost130__22_72_2)/0.0003;
netdalys300_low_swprog135 =  ddaly_22_72_2 + (dcost135__22_72_2)/0.0003;
netdalys300_low_swprog140 =  ddaly_22_72_2 + (dcost140__22_72_2)/0.0003;
netdalys300_low_swprog145 =  ddaly_22_72_2 + (dcost145__22_72_2)/0.0003;
netdalys300_low_swprog150 =  ddaly_22_72_2 + (dcost150__22_72_2)/0.0003;
netdalys300_low_swprog155 =  ddaly_22_72_2 + (dcost155__22_72_2)/0.0003;
netdalys300_low_swprog160 =  ddaly_22_72_2 + (dcost160__22_72_2)/0.0003;
netdalys300_low_swprog165 =  ddaly_22_72_2 + (dcost165__22_72_2)/0.0003;
netdalys300_low_swprog170 =  ddaly_22_72_2 + (dcost170__22_72_2)/0.0003;
netdalys300_low_swprog175 =  ddaly_22_72_2 + (dcost175__22_72_2)/0.0003;
netdalys300_low_swprog180 =  ddaly_22_72_2 + (dcost180__22_72_2)/0.0003;
netdalys300_low_swprog185 =  ddaly_22_72_2 + (dcost185__22_72_2)/0.0003;
netdalys300_low_swprog190 =  ddaly_22_72_2 + (dcost190__22_72_2)/0.0003;
netdalys300_low_swprog195 =  ddaly_22_72_2 + (dcost195__22_72_2)/0.0003;
netdalys300_low_swprog200 =  ddaly_22_72_2 + (dcost200__22_72_2)/0.0003;
netdalys300_low_swprog205 =  ddaly_22_72_2 + (dcost205__22_72_2)/0.0003;
netdalys300_low_swprog210 =  ddaly_22_72_2 + (dcost210__22_72_2)/0.0003;
netdalys300_low_swprog215 =  ddaly_22_72_2 + (dcost215__22_72_2)/0.0003;
netdalys300_low_swprog220 =  ddaly_22_72_2 + (dcost220__22_72_2)/0.0003;
netdalys300_low_swprog225 =  ddaly_22_72_2 + (dcost225__22_72_2)/0.0003;
netdalys300_low_swprog230 =  ddaly_22_72_2 + (dcost230__22_72_2)/0.0003;
netdalys300_low_swprog235 =  ddaly_22_72_2 + (dcost235__22_72_2)/0.0003;
netdalys300_low_swprog240 =  ddaly_22_72_2 + (dcost240__22_72_2)/0.0003;
netdalys300_low_swprog245 =  ddaly_22_72_2 + (dcost245__22_72_2)/0.0003;
netdalys300_low_swprog250 =  ddaly_22_72_2 + (dcost250__22_72_2)/0.0003;

*300, high program;
netdalys300_high_swprog10 =  ddaly_22_72_3 + (dcost10__22_72_3)/0.0003;
netdalys300_high_swprog15 =  ddaly_22_72_3 + (dcost15__22_72_3)/0.0003;
netdalys300_high_swprog20 =  ddaly_22_72_3 + (dcost20__22_72_3)/0.0003;
netdalys300_high_swprog25 =  ddaly_22_72_3 + (dcost25__22_72_3)/0.0003;
netdalys300_high_swprog30 =  ddaly_22_72_3 + (dcost30__22_72_3)/0.0003;
netdalys300_high_swprog35 =  ddaly_22_72_3 + (dcost35__22_72_3)/0.0003;
netdalys300_high_swprog40 =  ddaly_22_72_3 + (dcost40__22_72_3)/0.0003;
netdalys300_high_swprog45 =  ddaly_22_72_3 + (dcost45__22_72_3)/0.0003;
netdalys300_high_swprog50 =  ddaly_22_72_3 + (dcost50__22_72_3)/0.0003;
netdalys300_high_swprog55 =  ddaly_22_72_3 + (dcost55__22_72_3)/0.0003;
netdalys300_high_swprog60 =  ddaly_22_72_3 + (dcost60__22_72_3)/0.0003;
netdalys300_high_swprog65 =  ddaly_22_72_3 + (dcost65__22_72_3)/0.0003;
netdalys300_high_swprog70 =  ddaly_22_72_3 + (dcost70__22_72_3)/0.0003;
netdalys300_high_swprog75 =  ddaly_22_72_3 + (dcost75__22_72_3)/0.0003;
netdalys300_high_swprog80 =  ddaly_22_72_3 + (dcost80__22_72_3)/0.0003;
netdalys300_high_swprog85 =  ddaly_22_72_3 + (dcost85__22_72_3)/0.0003;
netdalys300_high_swprog90 =  ddaly_22_72_3 + (dcost90__22_72_3)/0.0003;
netdalys300_high_swprog95 =  ddaly_22_72_3 + (dcost95__22_72_3)/0.0003;
netdalys300_high_swprog100 =  ddaly_22_72_3 + (dcost100__22_72_3)/0.0003;
netdalys300_high_swprog105 =  ddaly_22_72_3 + (dcost105__22_72_3)/0.0003;
netdalys300_high_swprog110 =  ddaly_22_72_3 + (dcost110__22_72_3)/0.0003;
netdalys300_high_swprog115 =  ddaly_22_72_3 + (dcost115__22_72_3)/0.0003;
netdalys300_high_swprog120 =  ddaly_22_72_3 + (dcost120__22_72_3)/0.0003;
netdalys300_high_swprog125 =  ddaly_22_72_3 + (dcost125__22_72_3)/0.0003;
netdalys300_high_swprog130 =  ddaly_22_72_3 + (dcost130__22_72_3)/0.0003;
netdalys300_high_swprog135 =  ddaly_22_72_3 + (dcost135__22_72_3)/0.0003;
netdalys300_high_swprog140 =  ddaly_22_72_3 + (dcost140__22_72_3)/0.0003;
netdalys300_high_swprog145 =  ddaly_22_72_3 + (dcost145__22_72_3)/0.0003;
netdalys300_high_swprog150 =  ddaly_22_72_3 + (dcost150__22_72_3)/0.0003;
netdalys300_high_swprog155 =  ddaly_22_72_3 + (dcost155__22_72_3)/0.0003;
netdalys300_high_swprog160 =  ddaly_22_72_3 + (dcost160__22_72_3)/0.0003;
netdalys300_high_swprog165 =  ddaly_22_72_3 + (dcost165__22_72_3)/0.0003;
netdalys300_high_swprog170 =  ddaly_22_72_3 + (dcost170__22_72_3)/0.0003;
netdalys300_high_swprog175 =  ddaly_22_72_3 + (dcost175__22_72_3)/0.0003;
netdalys300_high_swprog180 =  ddaly_22_72_3 + (dcost180__22_72_3)/0.0003;
netdalys300_high_swprog185 =  ddaly_22_72_3 + (dcost185__22_72_3)/0.0003;
netdalys300_high_swprog190 =  ddaly_22_72_3 + (dcost190__22_72_3)/0.0003;
netdalys300_high_swprog195 =  ddaly_22_72_3 + (dcost195__22_72_3)/0.0003;
netdalys300_high_swprog200 =  ddaly_22_72_3 + (dcost200__22_72_3)/0.0003;
netdalys300_high_swprog205 =  ddaly_22_72_3 + (dcost205__22_72_3)/0.0003;
netdalys300_high_swprog210 =  ddaly_22_72_3 + (dcost210__22_72_3)/0.0003;
netdalys300_high_swprog215 =  ddaly_22_72_3 + (dcost215__22_72_3)/0.0003;
netdalys300_high_swprog220 =  ddaly_22_72_3 + (dcost220__22_72_3)/0.0003;
netdalys300_high_swprog225 =  ddaly_22_72_3 + (dcost225__22_72_3)/0.0003;
netdalys300_high_swprog230 =  ddaly_22_72_3 + (dcost230__22_72_3)/0.0003;
netdalys300_high_swprog235 =  ddaly_22_72_3 + (dcost235__22_72_3)/0.0003;
netdalys300_high_swprog240 =  ddaly_22_72_3 + (dcost240__22_72_3)/0.0003;
netdalys300_high_swprog245 =  ddaly_22_72_3 + (dcost245__22_72_3)/0.0003;
netdalys300_high_swprog250 =  ddaly_22_72_3 + (dcost250__22_72_3)/0.0003;

*100, no program;
netdalys100_no_swprog10 =  ddaly_22_72_1 + (dcost10__22_72_1)/0.0001;
netdalys100_no_swprog15 =  ddaly_22_72_1 + (dcost15__22_72_1)/0.0001;
netdalys100_no_swprog20 =  ddaly_22_72_1 + (dcost20__22_72_1)/0.0001;
netdalys100_no_swprog25 =  ddaly_22_72_1 + (dcost25__22_72_1)/0.0001;
netdalys100_no_swprog30 =  ddaly_22_72_1 + (dcost30__22_72_1)/0.0001;
netdalys100_no_swprog35 =  ddaly_22_72_1 + (dcost35__22_72_1)/0.0001;
netdalys100_no_swprog40 =  ddaly_22_72_1 + (dcost40__22_72_1)/0.0001;
netdalys100_no_swprog45 =  ddaly_22_72_1 + (dcost45__22_72_1)/0.0001;
netdalys100_no_swprog50 =  ddaly_22_72_1 + (dcost50__22_72_1)/0.0001;
netdalys100_no_swprog55 =  ddaly_22_72_1 + (dcost55__22_72_1)/0.0001;
netdalys100_no_swprog60 =  ddaly_22_72_1 + (dcost60__22_72_1)/0.0001;
netdalys100_no_swprog65 =  ddaly_22_72_1 + (dcost65__22_72_1)/0.0001;
netdalys100_no_swprog70 =  ddaly_22_72_1 + (dcost70__22_72_1)/0.0001;
netdalys100_no_swprog75 =  ddaly_22_72_1 + (dcost75__22_72_1)/0.0001;
netdalys100_no_swprog80 =  ddaly_22_72_1 + (dcost80__22_72_1)/0.0001;
netdalys100_no_swprog85 =  ddaly_22_72_1 + (dcost85__22_72_1)/0.0001;
netdalys100_no_swprog90 =  ddaly_22_72_1 + (dcost90__22_72_1)/0.0001;
netdalys100_no_swprog95 =  ddaly_22_72_1 + (dcost95__22_72_1)/0.0001;
netdalys100_no_swprog100 =  ddaly_22_72_1 + (dcost100__22_72_1)/0.0001;
netdalys100_no_swprog105 =  ddaly_22_72_1 + (dcost105__22_72_1)/0.0001;
netdalys100_no_swprog110 =  ddaly_22_72_1 + (dcost110__22_72_1)/0.0001;
netdalys100_no_swprog115 =  ddaly_22_72_1 + (dcost115__22_72_1)/0.0001;
netdalys100_no_swprog120 =  ddaly_22_72_1 + (dcost120__22_72_1)/0.0001;
netdalys100_no_swprog125 =  ddaly_22_72_1 + (dcost125__22_72_1)/0.0001;
netdalys100_no_swprog130 =  ddaly_22_72_1 + (dcost130__22_72_1)/0.0001;
netdalys100_no_swprog135 =  ddaly_22_72_1 + (dcost135__22_72_1)/0.0001;
netdalys100_no_swprog140 =  ddaly_22_72_1 + (dcost140__22_72_1)/0.0001;
netdalys100_no_swprog145 =  ddaly_22_72_1 + (dcost145__22_72_1)/0.0001;
netdalys100_no_swprog150 =  ddaly_22_72_1 + (dcost150__22_72_1)/0.0001;
netdalys100_no_swprog155 =  ddaly_22_72_1 + (dcost155__22_72_1)/0.0001;
netdalys100_no_swprog160 =  ddaly_22_72_1 + (dcost160__22_72_1)/0.0001;
netdalys100_no_swprog165 =  ddaly_22_72_1 + (dcost165__22_72_1)/0.0001;
netdalys100_no_swprog170 =  ddaly_22_72_1 + (dcost170__22_72_1)/0.0001;
netdalys100_no_swprog175 =  ddaly_22_72_1 + (dcost175__22_72_1)/0.0001;
netdalys100_no_swprog180 =  ddaly_22_72_1 + (dcost180__22_72_1)/0.0001;
netdalys100_no_swprog185 =  ddaly_22_72_1 + (dcost185__22_72_1)/0.0001;
netdalys100_no_swprog190 =  ddaly_22_72_1 + (dcost190__22_72_1)/0.0001;
netdalys100_no_swprog195 =  ddaly_22_72_1 + (dcost195__22_72_1)/0.0001;
netdalys100_no_swprog200 =  ddaly_22_72_1 + (dcost200__22_72_1)/0.0001;
netdalys100_no_swprog205 =  ddaly_22_72_1 + (dcost205__22_72_1)/0.0001;
netdalys100_no_swprog210 =  ddaly_22_72_1 + (dcost210__22_72_1)/0.0001;
netdalys100_no_swprog215 =  ddaly_22_72_1 + (dcost215__22_72_1)/0.0001;
netdalys100_no_swprog220 =  ddaly_22_72_1 + (dcost220__22_72_1)/0.0001;
netdalys100_no_swprog225 =  ddaly_22_72_1 + (dcost225__22_72_1)/0.0001;
netdalys100_no_swprog230 =  ddaly_22_72_1 + (dcost230__22_72_1)/0.0001;
netdalys100_no_swprog235 =  ddaly_22_72_1 + (dcost235__22_72_1)/0.0001;
netdalys100_no_swprog240 =  ddaly_22_72_1 + (dcost240__22_72_1)/0.0001;
netdalys100_no_swprog245 =  ddaly_22_72_1 + (dcost245__22_72_1)/0.0001;
netdalys100_no_swprog250 =  ddaly_22_72_1 + (dcost250__22_72_1)/0.0001;

*100, low program;
netdalys100_low_swprog10 =  ddaly_22_72_2 + (dcost10__22_72_2)/0.0001;
netdalys100_low_swprog15 =  ddaly_22_72_2 + (dcost15__22_72_2)/0.0001;
netdalys100_low_swprog20 =  ddaly_22_72_2 + (dcost20__22_72_2)/0.0001;
netdalys100_low_swprog25 =  ddaly_22_72_2 + (dcost25__22_72_2)/0.0001;
netdalys100_low_swprog30 =  ddaly_22_72_2 + (dcost30__22_72_2)/0.0001;
netdalys100_low_swprog35 =  ddaly_22_72_2 + (dcost35__22_72_2)/0.0001;
netdalys100_low_swprog40 =  ddaly_22_72_2 + (dcost40__22_72_2)/0.0001;
netdalys100_low_swprog45 =  ddaly_22_72_2 + (dcost45__22_72_2)/0.0001;
netdalys100_low_swprog50 =  ddaly_22_72_2 + (dcost50__22_72_2)/0.0001;
netdalys100_low_swprog55 =  ddaly_22_72_2 + (dcost55__22_72_2)/0.0001;
netdalys100_low_swprog60 =  ddaly_22_72_2 + (dcost60__22_72_2)/0.0001;
netdalys100_low_swprog65 =  ddaly_22_72_2 + (dcost65__22_72_2)/0.0001;
netdalys100_low_swprog70 =  ddaly_22_72_2 + (dcost70__22_72_2)/0.0001;
netdalys100_low_swprog75 =  ddaly_22_72_2 + (dcost75__22_72_2)/0.0001;
netdalys100_low_swprog80 =  ddaly_22_72_2 + (dcost80__22_72_2)/0.0001;
netdalys100_low_swprog85 =  ddaly_22_72_2 + (dcost85__22_72_2)/0.0001;
netdalys100_low_swprog90 =  ddaly_22_72_2 + (dcost90__22_72_2)/0.0001;
netdalys100_low_swprog95 =  ddaly_22_72_2 + (dcost95__22_72_2)/0.0001;
netdalys100_low_swprog100 =  ddaly_22_72_2 + (dcost100__22_72_2)/0.0001;
netdalys100_low_swprog105 =  ddaly_22_72_2 + (dcost105__22_72_2)/0.0001;
netdalys100_low_swprog110 =  ddaly_22_72_2 + (dcost110__22_72_2)/0.0001;
netdalys100_low_swprog115 =  ddaly_22_72_2 + (dcost115__22_72_2)/0.0001;
netdalys100_low_swprog120 =  ddaly_22_72_2 + (dcost120__22_72_2)/0.0001;
netdalys100_low_swprog125 =  ddaly_22_72_2 + (dcost125__22_72_2)/0.0001;
netdalys100_low_swprog130 =  ddaly_22_72_2 + (dcost130__22_72_2)/0.0001;
netdalys100_low_swprog135 =  ddaly_22_72_2 + (dcost135__22_72_2)/0.0001;
netdalys100_low_swprog140 =  ddaly_22_72_2 + (dcost140__22_72_2)/0.0001;
netdalys100_low_swprog145 =  ddaly_22_72_2 + (dcost145__22_72_2)/0.0001;
netdalys100_low_swprog150 =  ddaly_22_72_2 + (dcost150__22_72_2)/0.0001;
netdalys100_low_swprog155 =  ddaly_22_72_2 + (dcost155__22_72_2)/0.0001;
netdalys100_low_swprog160 =  ddaly_22_72_2 + (dcost160__22_72_2)/0.0001;
netdalys100_low_swprog165 =  ddaly_22_72_2 + (dcost165__22_72_2)/0.0001;
netdalys100_low_swprog170 =  ddaly_22_72_2 + (dcost170__22_72_2)/0.0001;
netdalys100_low_swprog175 =  ddaly_22_72_2 + (dcost175__22_72_2)/0.0001;
netdalys100_low_swprog180 =  ddaly_22_72_2 + (dcost180__22_72_2)/0.0001;
netdalys100_low_swprog185 =  ddaly_22_72_2 + (dcost185__22_72_2)/0.0001;
netdalys100_low_swprog190 =  ddaly_22_72_2 + (dcost190__22_72_2)/0.0001;
netdalys100_low_swprog195 =  ddaly_22_72_2 + (dcost195__22_72_2)/0.0001;
netdalys100_low_swprog200 =  ddaly_22_72_2 + (dcost200__22_72_2)/0.0001;
netdalys100_low_swprog205 =  ddaly_22_72_2 + (dcost205__22_72_2)/0.0001;
netdalys100_low_swprog210 =  ddaly_22_72_2 + (dcost210__22_72_2)/0.0001;
netdalys100_low_swprog215 =  ddaly_22_72_2 + (dcost215__22_72_2)/0.0001;
netdalys100_low_swprog220 =  ddaly_22_72_2 + (dcost220__22_72_2)/0.0001;
netdalys100_low_swprog225 =  ddaly_22_72_2 + (dcost225__22_72_2)/0.0001;
netdalys100_low_swprog230 =  ddaly_22_72_2 + (dcost230__22_72_2)/0.0001;
netdalys100_low_swprog235 =  ddaly_22_72_2 + (dcost235__22_72_2)/0.0001;
netdalys100_low_swprog240 =  ddaly_22_72_2 + (dcost240__22_72_2)/0.0001;
netdalys100_low_swprog245 =  ddaly_22_72_2 + (dcost245__22_72_2)/0.0001;
netdalys100_low_swprog250 =  ddaly_22_72_2 + (dcost250__22_72_2)/0.0001;

*100, high program;
netdalys100_high_swprog10 =  ddaly_22_72_3 + (dcost10__22_72_3)/0.0001;
netdalys100_high_swprog15 =  ddaly_22_72_3 + (dcost15__22_72_3)/0.0001;
netdalys100_high_swprog20 =  ddaly_22_72_3 + (dcost20__22_72_3)/0.0001;
netdalys100_high_swprog25 =  ddaly_22_72_3 + (dcost25__22_72_3)/0.0001;
netdalys100_high_swprog30 =  ddaly_22_72_3 + (dcost30__22_72_3)/0.0001;
netdalys100_high_swprog35 =  ddaly_22_72_3 + (dcost35__22_72_3)/0.0001;
netdalys100_high_swprog40 =  ddaly_22_72_3 + (dcost40__22_72_3)/0.0001;
netdalys100_high_swprog45 =  ddaly_22_72_3 + (dcost45__22_72_3)/0.0001;
netdalys100_high_swprog50 =  ddaly_22_72_3 + (dcost50__22_72_3)/0.0001;
netdalys100_high_swprog55 =  ddaly_22_72_3 + (dcost55__22_72_3)/0.0001;
netdalys100_high_swprog60 =  ddaly_22_72_3 + (dcost60__22_72_3)/0.0001;
netdalys100_high_swprog65 =  ddaly_22_72_3 + (dcost65__22_72_3)/0.0001;
netdalys100_high_swprog70 =  ddaly_22_72_3 + (dcost70__22_72_3)/0.0001;
netdalys100_high_swprog75 =  ddaly_22_72_3 + (dcost75__22_72_3)/0.0001;
netdalys100_high_swprog80 =  ddaly_22_72_3 + (dcost80__22_72_3)/0.0001;
netdalys100_high_swprog85 =  ddaly_22_72_3 + (dcost85__22_72_3)/0.0001;
netdalys100_high_swprog90 =  ddaly_22_72_3 + (dcost90__22_72_3)/0.0001;
netdalys100_high_swprog95 =  ddaly_22_72_3 + (dcost95__22_72_3)/0.0001;
netdalys100_high_swprog100 =  ddaly_22_72_3 + (dcost100__22_72_3)/0.0001;
netdalys100_high_swprog105 =  ddaly_22_72_3 + (dcost105__22_72_3)/0.0001;
netdalys100_high_swprog110 =  ddaly_22_72_3 + (dcost110__22_72_3)/0.0001;
netdalys100_high_swprog115 =  ddaly_22_72_3 + (dcost115__22_72_3)/0.0001;
netdalys100_high_swprog120 =  ddaly_22_72_3 + (dcost120__22_72_3)/0.0001;
netdalys100_high_swprog125 =  ddaly_22_72_3 + (dcost125__22_72_3)/0.0001;
netdalys100_high_swprog130 =  ddaly_22_72_3 + (dcost130__22_72_3)/0.0001;
netdalys100_high_swprog135 =  ddaly_22_72_3 + (dcost135__22_72_3)/0.0001;
netdalys100_high_swprog140 =  ddaly_22_72_3 + (dcost140__22_72_3)/0.0001;
netdalys100_high_swprog145 =  ddaly_22_72_3 + (dcost145__22_72_3)/0.0001;
netdalys100_high_swprog150 =  ddaly_22_72_3 + (dcost150__22_72_3)/0.0001;
netdalys100_high_swprog155 =  ddaly_22_72_3 + (dcost155__22_72_3)/0.0001;
netdalys100_high_swprog160 =  ddaly_22_72_3 + (dcost160__22_72_3)/0.0001;
netdalys100_high_swprog165 =  ddaly_22_72_3 + (dcost165__22_72_3)/0.0001;
netdalys100_high_swprog170 =  ddaly_22_72_3 + (dcost170__22_72_3)/0.0001;
netdalys100_high_swprog175 =  ddaly_22_72_3 + (dcost175__22_72_3)/0.0001;
netdalys100_high_swprog180 =  ddaly_22_72_3 + (dcost180__22_72_3)/0.0001;
netdalys100_high_swprog185 =  ddaly_22_72_3 + (dcost185__22_72_3)/0.0001;
netdalys100_high_swprog190 =  ddaly_22_72_3 + (dcost190__22_72_3)/0.0001;
netdalys100_high_swprog195 =  ddaly_22_72_3 + (dcost195__22_72_3)/0.0001;
netdalys100_high_swprog200 =  ddaly_22_72_3 + (dcost200__22_72_3)/0.0001;
netdalys100_high_swprog205 =  ddaly_22_72_3 + (dcost205__22_72_3)/0.0001;
netdalys100_high_swprog210 =  ddaly_22_72_3 + (dcost210__22_72_3)/0.0001;
netdalys100_high_swprog215 =  ddaly_22_72_3 + (dcost215__22_72_3)/0.0001;
netdalys100_high_swprog220 =  ddaly_22_72_3 + (dcost220__22_72_3)/0.0001;
netdalys100_high_swprog225 =  ddaly_22_72_3 + (dcost225__22_72_3)/0.0001;
netdalys100_high_swprog230 =  ddaly_22_72_3 + (dcost230__22_72_3)/0.0001;
netdalys100_high_swprog235 =  ddaly_22_72_3 + (dcost235__22_72_3)/0.0001;
netdalys100_high_swprog240 =  ddaly_22_72_3 + (dcost240__22_72_3)/0.0001;
netdalys100_high_swprog245 =  ddaly_22_72_3 + (dcost245__22_72_3)/0.0001;
netdalys100_high_swprog250 =  ddaly_22_72_3 + (dcost250__22_72_3)/0.0001;

***20 YEAR HORIZON - SENS ANALYSIS FOR REVIEWER;

*500, no program;
netdalys500_no_swprog10_20 =  ddaly_22_42_1 + (dcost10__22_42_1)/0.0005;
netdalys500_no_swprog15_20 =  ddaly_22_42_1 + (dcost15__22_42_1)/0.0005;
netdalys500_no_swprog20_20 =  ddaly_22_42_1 + (dcost20__22_42_1)/0.0005;
netdalys500_no_swprog25_20 =  ddaly_22_42_1 + (dcost25__22_42_1)/0.0005;
netdalys500_no_swprog30_20 =  ddaly_22_42_1 + (dcost30__22_42_1)/0.0005;
netdalys500_no_swprog35_20 =  ddaly_22_42_1 + (dcost35__22_42_1)/0.0005;
netdalys500_no_swprog40_20 =  ddaly_22_42_1 + (dcost40__22_42_1)/0.0005;
netdalys500_no_swprog45_20 =  ddaly_22_42_1 + (dcost45__22_42_1)/0.0005;
netdalys500_no_swprog50_20 =  ddaly_22_42_1 + (dcost50__22_42_1)/0.0005;
netdalys500_no_swprog55_20 =  ddaly_22_42_1 + (dcost55__22_42_1)/0.0005;
netdalys500_no_swprog60_20 =  ddaly_22_42_1 + (dcost60__22_42_1)/0.0005;
netdalys500_no_swprog65_20 =  ddaly_22_42_1 + (dcost65__22_42_1)/0.0005;
netdalys500_no_swprog70_20 =  ddaly_22_42_1 + (dcost70__22_42_1)/0.0005;
netdalys500_no_swprog75_20 =  ddaly_22_42_1 + (dcost75__22_42_1)/0.0005;
netdalys500_no_swprog80_20 =  ddaly_22_42_1 + (dcost80__22_42_1)/0.0005;
netdalys500_no_swprog85_20 =  ddaly_22_42_1 + (dcost85__22_42_1)/0.0005;
netdalys500_no_swprog90_20 =  ddaly_22_42_1 + (dcost90__22_42_1)/0.0005;
netdalys500_no_swprog95_20 =  ddaly_22_42_1 + (dcost95__22_42_1)/0.0005;
netdalys500_no_swprog100_20 =  ddaly_22_42_1 + (dcost100__22_42_1)/0.0005;
netdalys500_no_swprog105_20 =  ddaly_22_42_1 + (dcost105__22_42_1)/0.0005;
netdalys500_no_swprog110_20 =  ddaly_22_42_1 + (dcost110__22_42_1)/0.0005;
netdalys500_no_swprog115_20 =  ddaly_22_42_1 + (dcost115__22_42_1)/0.0005;
netdalys500_no_swprog120_20 =  ddaly_22_42_1 + (dcost120__22_42_1)/0.0005;
netdalys500_no_swprog125_20 =  ddaly_22_42_1 + (dcost125__22_42_1)/0.0005;
netdalys500_no_swprog130_20 =  ddaly_22_42_1 + (dcost130__22_42_1)/0.0005;
netdalys500_no_swprog135_20 =  ddaly_22_42_1 + (dcost135__22_42_1)/0.0005;
netdalys500_no_swprog140_20 =  ddaly_22_42_1 + (dcost140__22_42_1)/0.0005;
netdalys500_no_swprog145_20 =  ddaly_22_42_1 + (dcost145__22_42_1)/0.0005;
netdalys500_no_swprog150_20 =  ddaly_22_42_1 + (dcost150__22_42_1)/0.0005;
netdalys500_no_swprog155_20 =  ddaly_22_42_1 + (dcost155__22_42_1)/0.0005;
netdalys500_no_swprog160_20 =  ddaly_22_42_1 + (dcost160__22_42_1)/0.0005;
netdalys500_no_swprog165_20 =  ddaly_22_42_1 + (dcost165__22_42_1)/0.0005;
netdalys500_no_swprog170_20 =  ddaly_22_42_1 + (dcost170__22_42_1)/0.0005;
netdalys500_no_swprog175_20 =  ddaly_22_42_1 + (dcost175__22_42_1)/0.0005;
netdalys500_no_swprog180_20 =  ddaly_22_42_1 + (dcost180__22_42_1)/0.0005;
netdalys500_no_swprog185_20 =  ddaly_22_42_1 + (dcost185__22_42_1)/0.0005;
netdalys500_no_swprog190_20 =  ddaly_22_42_1 + (dcost190__22_42_1)/0.0005;
netdalys500_no_swprog195_20 =  ddaly_22_42_1 + (dcost195__22_42_1)/0.0005;
netdalys500_no_swprog200_20 =  ddaly_22_42_1 + (dcost200__22_42_1)/0.0005;
netdalys500_no_swprog205_20 =  ddaly_22_42_1 + (dcost205__22_42_1)/0.0005;
netdalys500_no_swprog210_20 =  ddaly_22_42_1 + (dcost210__22_42_1)/0.0005;
netdalys500_no_swprog215_20 =  ddaly_22_42_1 + (dcost215__22_42_1)/0.0005;
netdalys500_no_swprog220_20 =  ddaly_22_42_1 + (dcost220__22_42_1)/0.0005;
netdalys500_no_swprog225_20 =  ddaly_22_42_1 + (dcost225__22_42_1)/0.0005;
netdalys500_no_swprog230_20 =  ddaly_22_42_1 + (dcost230__22_42_1)/0.0005;
netdalys500_no_swprog235_20 =  ddaly_22_42_1 + (dcost235__22_42_1)/0.0005;
netdalys500_no_swprog240_20 =  ddaly_22_42_1 + (dcost240__22_42_1)/0.0005;
netdalys500_no_swprog245_20 =  ddaly_22_42_1 + (dcost245__22_42_1)/0.0005;
netdalys500_no_swprog250_20 =  ddaly_22_42_1 + (dcost250__22_42_1)/0.0005;

*500, lo program;
netdalys500_lo_swprog10_20 =  ddaly_22_42_2 + (dcost10__22_42_2)/0.0005;
netdalys500_lo_swprog15_20 =  ddaly_22_42_2 + (dcost15__22_42_2)/0.0005;
netdalys500_lo_swprog20_20 =  ddaly_22_42_2 + (dcost20__22_42_2)/0.0005;
netdalys500_lo_swprog25_20 =  ddaly_22_42_2 + (dcost25__22_42_2)/0.0005;
netdalys500_lo_swprog30_20 =  ddaly_22_42_2 + (dcost30__22_42_2)/0.0005;
netdalys500_lo_swprog35_20 =  ddaly_22_42_2 + (dcost35__22_42_2)/0.0005;
netdalys500_lo_swprog40_20 =  ddaly_22_42_2 + (dcost40__22_42_2)/0.0005;
netdalys500_lo_swprog45_20 =  ddaly_22_42_2 + (dcost45__22_42_2)/0.0005;
netdalys500_lo_swprog50_20 =  ddaly_22_42_2 + (dcost50__22_42_2)/0.0005;
netdalys500_lo_swprog55_20 =  ddaly_22_42_2 + (dcost55__22_42_2)/0.0005;
netdalys500_lo_swprog60_20 =  ddaly_22_42_2 + (dcost60__22_42_2)/0.0005;
netdalys500_lo_swprog65_20 =  ddaly_22_42_2 + (dcost65__22_42_2)/0.0005;
netdalys500_lo_swprog70_20 =  ddaly_22_42_2 + (dcost70__22_42_2)/0.0005;
netdalys500_lo_swprog75_20 =  ddaly_22_42_2 + (dcost75__22_42_2)/0.0005;
netdalys500_lo_swprog80_20 =  ddaly_22_42_2 + (dcost80__22_42_2)/0.0005;
netdalys500_lo_swprog85_20 =  ddaly_22_42_2 + (dcost85__22_42_2)/0.0005;
netdalys500_lo_swprog90_20 =  ddaly_22_42_2 + (dcost90__22_42_2)/0.0005;
netdalys500_lo_swprog95_20 =  ddaly_22_42_2 + (dcost95__22_42_2)/0.0005;
netdalys500_lo_swprog100_20 =  ddaly_22_42_2 + (dcost100__22_42_2)/0.0005;
netdalys500_lo_swprog105_20 =  ddaly_22_42_2 + (dcost105__22_42_2)/0.0005;
netdalys500_lo_swprog110_20 =  ddaly_22_42_2 + (dcost110__22_42_2)/0.0005;
netdalys500_lo_swprog115_20 =  ddaly_22_42_2 + (dcost115__22_42_2)/0.0005;
netdalys500_lo_swprog120_20 =  ddaly_22_42_2 + (dcost120__22_42_2)/0.0005;
netdalys500_lo_swprog125_20 =  ddaly_22_42_2 + (dcost125__22_42_2)/0.0005;
netdalys500_lo_swprog130_20 =  ddaly_22_42_2 + (dcost130__22_42_2)/0.0005;
netdalys500_lo_swprog135_20 =  ddaly_22_42_2 + (dcost135__22_42_2)/0.0005;
netdalys500_lo_swprog140_20 =  ddaly_22_42_2 + (dcost140__22_42_2)/0.0005;
netdalys500_lo_swprog145_20 =  ddaly_22_42_2 + (dcost145__22_42_2)/0.0005;
netdalys500_lo_swprog150_20 =  ddaly_22_42_2 + (dcost150__22_42_2)/0.0005;
netdalys500_lo_swprog155_20 =  ddaly_22_42_2 + (dcost155__22_42_2)/0.0005;
netdalys500_lo_swprog160_20 =  ddaly_22_42_2 + (dcost160__22_42_2)/0.0005;
netdalys500_lo_swprog165_20 =  ddaly_22_42_2 + (dcost165__22_42_2)/0.0005;
netdalys500_lo_swprog170_20 =  ddaly_22_42_2 + (dcost170__22_42_2)/0.0005;
netdalys500_lo_swprog175_20 =  ddaly_22_42_2 + (dcost175__22_42_2)/0.0005;
netdalys500_lo_swprog180_20 =  ddaly_22_42_2 + (dcost180__22_42_2)/0.0005;
netdalys500_lo_swprog185_20 =  ddaly_22_42_2 + (dcost185__22_42_2)/0.0005;
netdalys500_lo_swprog190_20 =  ddaly_22_42_2 + (dcost190__22_42_2)/0.0005;
netdalys500_lo_swprog195_20 =  ddaly_22_42_2 + (dcost195__22_42_2)/0.0005;
netdalys500_lo_swprog200_20 =  ddaly_22_42_2 + (dcost200__22_42_2)/0.0005;
netdalys500_lo_swprog205_20 =  ddaly_22_42_2 + (dcost205__22_42_2)/0.0005;
netdalys500_lo_swprog210_20 =  ddaly_22_42_2 + (dcost210__22_42_2)/0.0005;
netdalys500_lo_swprog215_20 =  ddaly_22_42_2 + (dcost215__22_42_2)/0.0005;
netdalys500_lo_swprog220_20 =  ddaly_22_42_2 + (dcost220__22_42_2)/0.0005;
netdalys500_lo_swprog225_20 =  ddaly_22_42_2 + (dcost225__22_42_2)/0.0005;
netdalys500_lo_swprog230_20 =  ddaly_22_42_2 + (dcost230__22_42_2)/0.0005;
netdalys500_lo_swprog235_20 =  ddaly_22_42_2 + (dcost235__22_42_2)/0.0005;
netdalys500_lo_swprog240_20 =  ddaly_22_42_2 + (dcost240__22_42_2)/0.0005;
netdalys500_lo_swprog245_20 =  ddaly_22_42_2 + (dcost245__22_42_2)/0.0005;
netdalys500_lo_swprog250_20 =  ddaly_22_42_2 + (dcost250__22_42_2)/0.0005;

*500, hi program;
netdalys500_hi_swprog10_20 =  ddaly_22_42_3 + (dcost10__22_42_3)/0.0005;
netdalys500_hi_swprog15_20 =  ddaly_22_42_3 + (dcost15__22_42_3)/0.0005;
netdalys500_hi_swprog20_20 =  ddaly_22_42_3 + (dcost20__22_42_3)/0.0005;
netdalys500_hi_swprog25_20 =  ddaly_22_42_3 + (dcost25__22_42_3)/0.0005;
netdalys500_hi_swprog30_20 =  ddaly_22_42_3 + (dcost30__22_42_3)/0.0005;
netdalys500_hi_swprog35_20 =  ddaly_22_42_3 + (dcost35__22_42_3)/0.0005;
netdalys500_hi_swprog40_20 =  ddaly_22_42_3 + (dcost40__22_42_3)/0.0005;
netdalys500_hi_swprog45_20 =  ddaly_22_42_3 + (dcost45__22_42_3)/0.0005;
netdalys500_hi_swprog50_20 =  ddaly_22_42_3 + (dcost50__22_42_3)/0.0005;
netdalys500_hi_swprog55_20 =  ddaly_22_42_3 + (dcost55__22_42_3)/0.0005;
netdalys500_hi_swprog60_20 =  ddaly_22_42_3 + (dcost60__22_42_3)/0.0005;
netdalys500_hi_swprog65_20 =  ddaly_22_42_3 + (dcost65__22_42_3)/0.0005;
netdalys500_hi_swprog70_20 =  ddaly_22_42_3 + (dcost70__22_42_3)/0.0005;
netdalys500_hi_swprog75_20 =  ddaly_22_42_3 + (dcost75__22_42_3)/0.0005;
netdalys500_hi_swprog80_20 =  ddaly_22_42_3 + (dcost80__22_42_3)/0.0005;
netdalys500_hi_swprog85_20 =  ddaly_22_42_3 + (dcost85__22_42_3)/0.0005;
netdalys500_hi_swprog90_20 =  ddaly_22_42_3 + (dcost90__22_42_3)/0.0005;
netdalys500_hi_swprog95_20 =  ddaly_22_42_3 + (dcost95__22_42_3)/0.0005;
netdalys500_hi_swprog100_20 =  ddaly_22_42_3 + (dcost100__22_42_3)/0.0005;
netdalys500_hi_swprog105_20 =  ddaly_22_42_3 + (dcost105__22_42_3)/0.0005;
netdalys500_hi_swprog110_20 =  ddaly_22_42_3 + (dcost110__22_42_3)/0.0005;
netdalys500_hi_swprog115_20 =  ddaly_22_42_3 + (dcost115__22_42_3)/0.0005;
netdalys500_hi_swprog120_20 =  ddaly_22_42_3 + (dcost120__22_42_3)/0.0005;
netdalys500_hi_swprog125_20 =  ddaly_22_42_3 + (dcost125__22_42_3)/0.0005;
netdalys500_hi_swprog130_20 =  ddaly_22_42_3 + (dcost130__22_42_3)/0.0005;
netdalys500_hi_swprog135_20 =  ddaly_22_42_3 + (dcost135__22_42_3)/0.0005;
netdalys500_hi_swprog140_20 =  ddaly_22_42_3 + (dcost140__22_42_3)/0.0005;
netdalys500_hi_swprog145_20 =  ddaly_22_42_3 + (dcost145__22_42_3)/0.0005;
netdalys500_hi_swprog150_20 =  ddaly_22_42_3 + (dcost150__22_42_3)/0.0005;
netdalys500_hi_swprog155_20 =  ddaly_22_42_3 + (dcost155__22_42_3)/0.0005;
netdalys500_hi_swprog160_20 =  ddaly_22_42_3 + (dcost160__22_42_3)/0.0005;
netdalys500_hi_swprog165_20 =  ddaly_22_42_3 + (dcost165__22_42_3)/0.0005;
netdalys500_hi_swprog170_20 =  ddaly_22_42_3 + (dcost170__22_42_3)/0.0005;
netdalys500_hi_swprog175_20 =  ddaly_22_42_3 + (dcost175__22_42_3)/0.0005;
netdalys500_hi_swprog180_20 =  ddaly_22_42_3 + (dcost180__22_42_3)/0.0005;
netdalys500_hi_swprog185_20 =  ddaly_22_42_3 + (dcost185__22_42_3)/0.0005;
netdalys500_hi_swprog190_20 =  ddaly_22_42_3 + (dcost190__22_42_3)/0.0005;
netdalys500_hi_swprog195_20 =  ddaly_22_42_3 + (dcost195__22_42_3)/0.0005;
netdalys500_hi_swprog200_20 =  ddaly_22_42_3 + (dcost200__22_42_3)/0.0005;
netdalys500_hi_swprog205_20 =  ddaly_22_42_3 + (dcost205__22_42_3)/0.0005;
netdalys500_hi_swprog210_20 =  ddaly_22_42_3 + (dcost210__22_42_3)/0.0005;
netdalys500_hi_swprog215_20 =  ddaly_22_42_3 + (dcost215__22_42_3)/0.0005;
netdalys500_hi_swprog220_20 =  ddaly_22_42_3 + (dcost220__22_42_3)/0.0005;
netdalys500_hi_swprog225_20 =  ddaly_22_42_3 + (dcost225__22_42_3)/0.0005;
netdalys500_hi_swprog230_20 =  ddaly_22_42_3 + (dcost230__22_42_3)/0.0005;
netdalys500_hi_swprog235_20 =  ddaly_22_42_3 + (dcost235__22_42_3)/0.0005;
netdalys500_hi_swprog240_20 =  ddaly_22_42_3 + (dcost240__22_42_3)/0.0005;
netdalys500_hi_swprog245_20 =  ddaly_22_42_3 + (dcost245__22_42_3)/0.0005;
netdalys500_hi_swprog250_20 =  ddaly_22_42_3 + (dcost250__22_42_3)/0.0005;



*net dalys averted;
diff_netdalys_swprog_high_v_none = netdalys_swprog_high - netdalys_no_swprog; *take absolute number;

***high vs. none., 500 threshold;
d_netdalys500_sw10_high_v_none = netdalys500_high_swprog10 - netdalys500_no_swprog10;
d_netdalys500_sw15_high_v_none = netdalys500_high_swprog15 - netdalys500_no_swprog15;
d_netdalys500_sw20_high_v_none = netdalys500_high_swprog20 - netdalys500_no_swprog20;
d_netdalys500_sw25_high_v_none = netdalys500_high_swprog25 - netdalys500_no_swprog25;
d_netdalys500_sw30_high_v_none = netdalys500_high_swprog30 - netdalys500_no_swprog30;
d_netdalys500_sw35_high_v_none = netdalys500_high_swprog35 - netdalys500_no_swprog35;
d_netdalys500_sw40_high_v_none = netdalys500_high_swprog40 - netdalys500_no_swprog40;
d_netdalys500_sw45_high_v_none = netdalys500_high_swprog45 - netdalys500_no_swprog45;
d_netdalys500_sw50_high_v_none = netdalys500_high_swprog50 - netdalys500_no_swprog50;
d_netdalys500_sw55_high_v_none = netdalys500_high_swprog55 - netdalys500_no_swprog55;
d_netdalys500_sw60_high_v_none = netdalys500_high_swprog60 - netdalys500_no_swprog60;
d_netdalys500_sw65_high_v_none = netdalys500_high_swprog65 - netdalys500_no_swprog65;
d_netdalys500_sw70_high_v_none = netdalys500_high_swprog70 - netdalys500_no_swprog70;
d_netdalys500_sw75_high_v_none = netdalys500_high_swprog75 - netdalys500_no_swprog75;
d_netdalys500_sw80_high_v_none = netdalys500_high_swprog80 - netdalys500_no_swprog80;
d_netdalys500_sw85_high_v_none = netdalys500_high_swprog85 - netdalys500_no_swprog85;
d_netdalys500_sw90_high_v_none = netdalys500_high_swprog90 - netdalys500_no_swprog90;
d_netdalys500_sw95_high_v_none = netdalys500_high_swprog95 - netdalys500_no_swprog95;
d_netdalys500_sw100_high_v_none = netdalys500_high_swprog100 - netdalys500_no_swprog100;
d_netdalys500_sw105_high_v_none = netdalys500_high_swprog105 - netdalys500_no_swprog105;
d_netdalys500_sw110_high_v_none = netdalys500_high_swprog110 - netdalys500_no_swprog110;
d_netdalys500_sw115_high_v_none = netdalys500_high_swprog115 - netdalys500_no_swprog115;
d_netdalys500_sw120_high_v_none = netdalys500_high_swprog120 - netdalys500_no_swprog120;
d_netdalys500_sw125_high_v_none = netdalys500_high_swprog125 - netdalys500_no_swprog125;
d_netdalys500_sw130_high_v_none = netdalys500_high_swprog130 - netdalys500_no_swprog130;
d_netdalys500_sw135_high_v_none = netdalys500_high_swprog135 - netdalys500_no_swprog135;
d_netdalys500_sw140_high_v_none = netdalys500_high_swprog140 - netdalys500_no_swprog140;
d_netdalys500_sw145_high_v_none = netdalys500_high_swprog145 - netdalys500_no_swprog145;
d_netdalys500_sw150_high_v_none = netdalys500_high_swprog150 - netdalys500_no_swprog150;
d_netdalys500_sw155_high_v_none = netdalys500_high_swprog155 - netdalys500_no_swprog155;
d_netdalys500_sw160_high_v_none = netdalys500_high_swprog160 - netdalys500_no_swprog160;
d_netdalys500_sw165_high_v_none = netdalys500_high_swprog165 - netdalys500_no_swprog165;
d_netdalys500_sw170_high_v_none = netdalys500_high_swprog170 - netdalys500_no_swprog170;
d_netdalys500_sw175_high_v_none = netdalys500_high_swprog175 - netdalys500_no_swprog175;
d_netdalys500_sw180_high_v_none = netdalys500_high_swprog180 - netdalys500_no_swprog180;
d_netdalys500_sw185_high_v_none = netdalys500_high_swprog185 - netdalys500_no_swprog185;
d_netdalys500_sw190_high_v_none = netdalys500_high_swprog190 - netdalys500_no_swprog190;
d_netdalys500_sw195_high_v_none = netdalys500_high_swprog195 - netdalys500_no_swprog195;
d_netdalys500_sw200_high_v_none = netdalys500_high_swprog200 - netdalys500_no_swprog200;
d_netdalys500_sw205_high_v_none = netdalys500_high_swprog205 - netdalys500_no_swprog205;
d_netdalys500_sw210_high_v_none = netdalys500_high_swprog210 - netdalys500_no_swprog210;
d_netdalys500_sw215_high_v_none = netdalys500_high_swprog215 - netdalys500_no_swprog215;
d_netdalys500_sw220_high_v_none = netdalys500_high_swprog220 - netdalys500_no_swprog220;
d_netdalys500_sw225_high_v_none = netdalys500_high_swprog225 - netdalys500_no_swprog225;
d_netdalys500_sw230_high_v_none = netdalys500_high_swprog230 - netdalys500_no_swprog230;
d_netdalys500_sw235_high_v_none = netdalys500_high_swprog235 - netdalys500_no_swprog235;
d_netdalys500_sw240_high_v_none = netdalys500_high_swprog240 - netdalys500_no_swprog240;
d_netdalys500_sw245_high_v_none = netdalys500_high_swprog245 - netdalys500_no_swprog245;
d_netdalys500_sw250_high_v_none = netdalys500_high_swprog250 - netdalys500_no_swprog250;


***high vs. none, 300 threshold;
d_netdalys300_sw10_high_v_none = netdalys300_high_swprog10 - netdalys300_no_swprog10;
d_netdalys300_sw15_high_v_none = netdalys300_high_swprog15 - netdalys300_no_swprog15;
d_netdalys300_sw20_high_v_none = netdalys300_high_swprog20 - netdalys300_no_swprog20;
d_netdalys300_sw25_high_v_none = netdalys300_high_swprog25 - netdalys300_no_swprog25;
d_netdalys300_sw30_high_v_none = netdalys300_high_swprog30 - netdalys300_no_swprog30;
d_netdalys300_sw35_high_v_none = netdalys300_high_swprog35 - netdalys300_no_swprog35;
d_netdalys300_sw40_high_v_none = netdalys300_high_swprog40 - netdalys300_no_swprog40;
d_netdalys300_sw45_high_v_none = netdalys300_high_swprog45 - netdalys300_no_swprog45;
d_netdalys300_sw50_high_v_none = netdalys300_high_swprog50 - netdalys300_no_swprog50;
d_netdalys300_sw55_high_v_none = netdalys300_high_swprog55 - netdalys300_no_swprog55;
d_netdalys300_sw60_high_v_none = netdalys300_high_swprog60 - netdalys300_no_swprog60;
d_netdalys300_sw65_high_v_none = netdalys300_high_swprog65 - netdalys300_no_swprog65;
d_netdalys300_sw70_high_v_none = netdalys300_high_swprog70 - netdalys300_no_swprog70;
d_netdalys300_sw75_high_v_none = netdalys300_high_swprog75 - netdalys300_no_swprog75;
d_netdalys300_sw80_high_v_none = netdalys300_high_swprog80 - netdalys300_no_swprog80;
d_netdalys300_sw85_high_v_none = netdalys300_high_swprog85 - netdalys300_no_swprog85;
d_netdalys300_sw90_high_v_none = netdalys300_high_swprog90 - netdalys300_no_swprog90;
d_netdalys300_sw95_high_v_none = netdalys300_high_swprog95 - netdalys300_no_swprog95;
d_netdalys300_sw100_high_v_none = netdalys300_high_swprog100 - netdalys300_no_swprog100;
d_netdalys300_sw105_high_v_none = netdalys300_high_swprog105 - netdalys300_no_swprog105;
d_netdalys300_sw110_high_v_none = netdalys300_high_swprog110 - netdalys300_no_swprog110;
d_netdalys300_sw115_high_v_none = netdalys300_high_swprog115 - netdalys300_no_swprog115;
d_netdalys300_sw120_high_v_none = netdalys300_high_swprog120 - netdalys300_no_swprog120;
d_netdalys300_sw125_high_v_none = netdalys300_high_swprog125 - netdalys300_no_swprog125;
d_netdalys300_sw130_high_v_none = netdalys300_high_swprog130 - netdalys300_no_swprog130;
d_netdalys300_sw135_high_v_none = netdalys300_high_swprog135 - netdalys300_no_swprog135;
d_netdalys300_sw140_high_v_none = netdalys300_high_swprog140 - netdalys300_no_swprog140;
d_netdalys300_sw145_high_v_none = netdalys300_high_swprog145 - netdalys300_no_swprog145;
d_netdalys300_sw150_high_v_none = netdalys300_high_swprog150 - netdalys300_no_swprog150;
d_netdalys300_sw155_high_v_none = netdalys300_high_swprog155 - netdalys300_no_swprog155;
d_netdalys300_sw160_high_v_none = netdalys300_high_swprog160 - netdalys300_no_swprog160;
d_netdalys300_sw165_high_v_none = netdalys300_high_swprog165 - netdalys300_no_swprog165;
d_netdalys300_sw170_high_v_none = netdalys300_high_swprog170 - netdalys300_no_swprog170;
d_netdalys300_sw175_high_v_none = netdalys300_high_swprog175 - netdalys300_no_swprog175;
d_netdalys300_sw180_high_v_none = netdalys300_high_swprog180 - netdalys300_no_swprog180;
d_netdalys300_sw185_high_v_none = netdalys300_high_swprog185 - netdalys300_no_swprog185;
d_netdalys300_sw190_high_v_none = netdalys300_high_swprog190 - netdalys300_no_swprog190;
d_netdalys300_sw195_high_v_none = netdalys300_high_swprog195 - netdalys300_no_swprog195;
d_netdalys300_sw200_high_v_none = netdalys300_high_swprog200 - netdalys300_no_swprog200;
d_netdalys300_sw205_high_v_none = netdalys300_high_swprog205 - netdalys300_no_swprog205;
d_netdalys300_sw210_high_v_none = netdalys300_high_swprog210 - netdalys300_no_swprog210;
d_netdalys300_sw215_high_v_none = netdalys300_high_swprog215 - netdalys300_no_swprog215;
d_netdalys300_sw220_high_v_none = netdalys300_high_swprog220 - netdalys300_no_swprog220;
d_netdalys300_sw225_high_v_none = netdalys300_high_swprog225 - netdalys300_no_swprog225;
d_netdalys300_sw230_high_v_none = netdalys300_high_swprog230 - netdalys300_no_swprog230;
d_netdalys300_sw235_high_v_none = netdalys300_high_swprog235 - netdalys300_no_swprog235;
d_netdalys300_sw240_high_v_none = netdalys300_high_swprog240 - netdalys300_no_swprog240;
d_netdalys300_sw245_high_v_none = netdalys300_high_swprog245 - netdalys300_no_swprog245;
d_netdalys300_sw250_high_v_none = netdalys300_high_swprog250 - netdalys300_no_swprog250;

***high vs. none, 100 threshold;
d_netdalys100_sw10_high_v_none = netdalys100_high_swprog10 - netdalys100_no_swprog10;
d_netdalys100_sw15_high_v_none = netdalys100_high_swprog15 - netdalys100_no_swprog15;
d_netdalys100_sw20_high_v_none = netdalys100_high_swprog20 - netdalys100_no_swprog20;
d_netdalys100_sw25_high_v_none = netdalys100_high_swprog25 - netdalys100_no_swprog25;
d_netdalys100_sw30_high_v_none = netdalys100_high_swprog30 - netdalys100_no_swprog30;
d_netdalys100_sw35_high_v_none = netdalys100_high_swprog35 - netdalys100_no_swprog35;
d_netdalys100_sw40_high_v_none = netdalys100_high_swprog40 - netdalys100_no_swprog40;
d_netdalys100_sw45_high_v_none = netdalys100_high_swprog45 - netdalys100_no_swprog45;
d_netdalys100_sw50_high_v_none = netdalys100_high_swprog50 - netdalys100_no_swprog50;
d_netdalys100_sw55_high_v_none = netdalys100_high_swprog55 - netdalys100_no_swprog55;
d_netdalys100_sw60_high_v_none = netdalys100_high_swprog60 - netdalys100_no_swprog60;
d_netdalys100_sw65_high_v_none = netdalys100_high_swprog65 - netdalys100_no_swprog65;
d_netdalys100_sw70_high_v_none = netdalys100_high_swprog70 - netdalys100_no_swprog70;
d_netdalys100_sw75_high_v_none = netdalys100_high_swprog75 - netdalys100_no_swprog75;
d_netdalys100_sw80_high_v_none = netdalys100_high_swprog80 - netdalys100_no_swprog80;
d_netdalys100_sw85_high_v_none = netdalys100_high_swprog85 - netdalys100_no_swprog85;
d_netdalys100_sw90_high_v_none = netdalys100_high_swprog90 - netdalys100_no_swprog90;
d_netdalys100_sw95_high_v_none = netdalys100_high_swprog95 - netdalys100_no_swprog95;
d_netdalys100_sw100_high_v_none = netdalys100_high_swprog100 - netdalys100_no_swprog100;
d_netdalys100_sw105_high_v_none = netdalys100_high_swprog105 - netdalys100_no_swprog105;
d_netdalys100_sw110_high_v_none = netdalys100_high_swprog110 - netdalys100_no_swprog110;
d_netdalys100_sw115_high_v_none = netdalys100_high_swprog115 - netdalys100_no_swprog115;
d_netdalys100_sw120_high_v_none = netdalys100_high_swprog120 - netdalys100_no_swprog120;
d_netdalys100_sw125_high_v_none = netdalys100_high_swprog125 - netdalys100_no_swprog125;
d_netdalys100_sw130_high_v_none = netdalys100_high_swprog130 - netdalys100_no_swprog130;
d_netdalys100_sw135_high_v_none = netdalys100_high_swprog135 - netdalys100_no_swprog135;
d_netdalys100_sw140_high_v_none = netdalys100_high_swprog140 - netdalys100_no_swprog140;
d_netdalys100_sw145_high_v_none = netdalys100_high_swprog145 - netdalys100_no_swprog145;
d_netdalys100_sw150_high_v_none = netdalys100_high_swprog150 - netdalys100_no_swprog150;
d_netdalys100_sw155_high_v_none = netdalys100_high_swprog155 - netdalys100_no_swprog155;
d_netdalys100_sw160_high_v_none = netdalys100_high_swprog160 - netdalys100_no_swprog160;
d_netdalys100_sw165_high_v_none = netdalys100_high_swprog165 - netdalys100_no_swprog165;
d_netdalys100_sw170_high_v_none = netdalys100_high_swprog170 - netdalys100_no_swprog170;
d_netdalys100_sw175_high_v_none = netdalys100_high_swprog175 - netdalys100_no_swprog175;
d_netdalys100_sw180_high_v_none = netdalys100_high_swprog180 - netdalys100_no_swprog180;
d_netdalys100_sw185_high_v_none = netdalys100_high_swprog185 - netdalys100_no_swprog185;
d_netdalys100_sw190_high_v_none = netdalys100_high_swprog190 - netdalys100_no_swprog190;
d_netdalys100_sw195_high_v_none = netdalys100_high_swprog195 - netdalys100_no_swprog195;
d_netdalys100_sw200_high_v_none = netdalys100_high_swprog200 - netdalys100_no_swprog200;
d_netdalys100_sw205_high_v_none = netdalys100_high_swprog205 - netdalys100_no_swprog205;
d_netdalys100_sw210_high_v_none = netdalys100_high_swprog210 - netdalys100_no_swprog210;
d_netdalys100_sw215_high_v_none = netdalys100_high_swprog215 - netdalys100_no_swprog215;
d_netdalys100_sw220_high_v_none = netdalys100_high_swprog220 - netdalys100_no_swprog220;
d_netdalys100_sw225_high_v_none = netdalys100_high_swprog225 - netdalys100_no_swprog225;
d_netdalys100_sw230_high_v_none = netdalys100_high_swprog230 - netdalys100_no_swprog230;
d_netdalys100_sw235_high_v_none = netdalys100_high_swprog235 - netdalys100_no_swprog235;
d_netdalys100_sw240_high_v_none = netdalys100_high_swprog240 - netdalys100_no_swprog240;
d_netdalys100_sw245_high_v_none = netdalys100_high_swprog245 - netdalys100_no_swprog245;
d_netdalys100_sw250_high_v_none = netdalys100_high_swprog250 - netdalys100_no_swprog250;




***low vs. none, 500 threshold;
d_netdalys500_sw10_low_v_none = netdalys500_low_swprog10 - netdalys500_no_swprog10;
d_netdalys500_sw15_low_v_none = netdalys500_low_swprog15 - netdalys500_no_swprog15;
d_netdalys500_sw20_low_v_none = netdalys500_low_swprog20 - netdalys500_no_swprog20;
d_netdalys500_sw25_low_v_none = netdalys500_low_swprog25 - netdalys500_no_swprog25;
d_netdalys500_sw30_low_v_none = netdalys500_low_swprog30 - netdalys500_no_swprog30;
d_netdalys500_sw35_low_v_none = netdalys500_low_swprog35 - netdalys500_no_swprog35;
d_netdalys500_sw40_low_v_none = netdalys500_low_swprog40 - netdalys500_no_swprog40;
d_netdalys500_sw45_low_v_none = netdalys500_low_swprog45 - netdalys500_no_swprog45;
d_netdalys500_sw50_low_v_none = netdalys500_low_swprog50 - netdalys500_no_swprog50;
d_netdalys500_sw55_low_v_none = netdalys500_low_swprog55 - netdalys500_no_swprog55;
d_netdalys500_sw60_low_v_none = netdalys500_low_swprog60 - netdalys500_no_swprog60;
d_netdalys500_sw65_low_v_none = netdalys500_low_swprog65 - netdalys500_no_swprog65;
d_netdalys500_sw70_low_v_none = netdalys500_low_swprog70 - netdalys500_no_swprog70;
d_netdalys500_sw75_low_v_none = netdalys500_low_swprog75 - netdalys500_no_swprog75;
d_netdalys500_sw80_low_v_none = netdalys500_low_swprog80 - netdalys500_no_swprog80;
d_netdalys500_sw85_low_v_none = netdalys500_low_swprog85 - netdalys500_no_swprog85;
d_netdalys500_sw90_low_v_none = netdalys500_low_swprog90 - netdalys500_no_swprog90;
d_netdalys500_sw95_low_v_none = netdalys500_low_swprog95 - netdalys500_no_swprog95;
d_netdalys500_sw100_low_v_none = netdalys500_low_swprog100 - netdalys500_no_swprog100;
d_netdalys500_sw105_low_v_none = netdalys500_low_swprog105 - netdalys500_no_swprog105;
d_netdalys500_sw110_low_v_none = netdalys500_low_swprog110 - netdalys500_no_swprog110;
d_netdalys500_sw115_low_v_none = netdalys500_low_swprog115 - netdalys500_no_swprog115;
d_netdalys500_sw120_low_v_none = netdalys500_low_swprog120 - netdalys500_no_swprog120;
d_netdalys500_sw125_low_v_none = netdalys500_low_swprog125 - netdalys500_no_swprog125;
d_netdalys500_sw130_low_v_none = netdalys500_low_swprog130 - netdalys500_no_swprog130;
d_netdalys500_sw135_low_v_none = netdalys500_low_swprog135 - netdalys500_no_swprog135;
d_netdalys500_sw140_low_v_none = netdalys500_low_swprog140 - netdalys500_no_swprog140;
d_netdalys500_sw145_low_v_none = netdalys500_low_swprog145 - netdalys500_no_swprog145;
d_netdalys500_sw150_low_v_none = netdalys500_low_swprog150 - netdalys500_no_swprog150;
d_netdalys500_sw155_low_v_none = netdalys500_low_swprog155 - netdalys500_no_swprog155;
d_netdalys500_sw160_low_v_none = netdalys500_low_swprog160 - netdalys500_no_swprog160;
d_netdalys500_sw165_low_v_none = netdalys500_low_swprog165 - netdalys500_no_swprog165;
d_netdalys500_sw170_low_v_none = netdalys500_low_swprog170 - netdalys500_no_swprog170;
d_netdalys500_sw175_low_v_none = netdalys500_low_swprog175 - netdalys500_no_swprog175;
d_netdalys500_sw180_low_v_none = netdalys500_low_swprog180 - netdalys500_no_swprog180;
d_netdalys500_sw185_low_v_none = netdalys500_low_swprog185 - netdalys500_no_swprog185;
d_netdalys500_sw190_low_v_none = netdalys500_low_swprog190 - netdalys500_no_swprog190;
d_netdalys500_sw195_low_v_none = netdalys500_low_swprog195 - netdalys500_no_swprog195;
d_netdalys500_sw200_low_v_none = netdalys500_low_swprog200 - netdalys500_no_swprog200;
d_netdalys500_sw205_low_v_none = netdalys500_low_swprog205 - netdalys500_no_swprog205;
d_netdalys500_sw210_low_v_none = netdalys500_low_swprog210 - netdalys500_no_swprog210;
d_netdalys500_sw215_low_v_none = netdalys500_low_swprog215 - netdalys500_no_swprog215;
d_netdalys500_sw220_low_v_none = netdalys500_low_swprog220 - netdalys500_no_swprog220;
d_netdalys500_sw225_low_v_none = netdalys500_low_swprog225 - netdalys500_no_swprog225;
d_netdalys500_sw230_low_v_none = netdalys500_low_swprog230 - netdalys500_no_swprog230;
d_netdalys500_sw235_low_v_none = netdalys500_low_swprog235 - netdalys500_no_swprog235;
d_netdalys500_sw240_low_v_none = netdalys500_low_swprog240 - netdalys500_no_swprog240;
d_netdalys500_sw245_low_v_none = netdalys500_low_swprog245 - netdalys500_no_swprog245;
d_netdalys500_sw250_low_v_none = netdalys500_low_swprog250 - netdalys500_no_swprog250;

***low vs. none, 300 threshold;
d_netdalys300_sw10_low_v_none = netdalys300_low_swprog10 - netdalys300_no_swprog10;
d_netdalys300_sw15_low_v_none = netdalys300_low_swprog15 - netdalys300_no_swprog15;
d_netdalys300_sw20_low_v_none = netdalys300_low_swprog20 - netdalys300_no_swprog20;
d_netdalys300_sw25_low_v_none = netdalys300_low_swprog25 - netdalys300_no_swprog25;
d_netdalys300_sw30_low_v_none = netdalys300_low_swprog30 - netdalys300_no_swprog30;
d_netdalys300_sw35_low_v_none = netdalys300_low_swprog35 - netdalys300_no_swprog35;
d_netdalys300_sw40_low_v_none = netdalys300_low_swprog40 - netdalys300_no_swprog40;
d_netdalys300_sw45_low_v_none = netdalys300_low_swprog45 - netdalys300_no_swprog45;
d_netdalys300_sw50_low_v_none = netdalys300_low_swprog50 - netdalys300_no_swprog50;
d_netdalys300_sw55_low_v_none = netdalys300_low_swprog55 - netdalys300_no_swprog55;
d_netdalys300_sw60_low_v_none = netdalys300_low_swprog60 - netdalys300_no_swprog60;
d_netdalys300_sw65_low_v_none = netdalys300_low_swprog65 - netdalys300_no_swprog65;
d_netdalys300_sw70_low_v_none = netdalys300_low_swprog70 - netdalys300_no_swprog70;
d_netdalys300_sw75_low_v_none = netdalys300_low_swprog75 - netdalys300_no_swprog75;
d_netdalys300_sw80_low_v_none = netdalys300_low_swprog80 - netdalys300_no_swprog80;
d_netdalys300_sw85_low_v_none = netdalys300_low_swprog85 - netdalys300_no_swprog85;
d_netdalys300_sw90_low_v_none = netdalys300_low_swprog90 - netdalys300_no_swprog90;
d_netdalys300_sw95_low_v_none = netdalys300_low_swprog95 - netdalys300_no_swprog95;
d_netdalys300_sw100_low_v_none = netdalys300_low_swprog100 - netdalys300_no_swprog100;
d_netdalys300_sw105_low_v_none = netdalys300_low_swprog105 - netdalys300_no_swprog105;
d_netdalys300_sw110_low_v_none = netdalys300_low_swprog110 - netdalys300_no_swprog110;
d_netdalys300_sw115_low_v_none = netdalys300_low_swprog115 - netdalys300_no_swprog115;
d_netdalys300_sw120_low_v_none = netdalys300_low_swprog120 - netdalys300_no_swprog120;
d_netdalys300_sw125_low_v_none = netdalys300_low_swprog125 - netdalys300_no_swprog125;
d_netdalys300_sw130_low_v_none = netdalys300_low_swprog130 - netdalys300_no_swprog130;
d_netdalys300_sw135_low_v_none = netdalys300_low_swprog135 - netdalys300_no_swprog135;
d_netdalys300_sw140_low_v_none = netdalys300_low_swprog140 - netdalys300_no_swprog140;
d_netdalys300_sw145_low_v_none = netdalys300_low_swprog145 - netdalys300_no_swprog145;
d_netdalys300_sw150_low_v_none = netdalys300_low_swprog150 - netdalys300_no_swprog150;
d_netdalys300_sw155_low_v_none = netdalys300_low_swprog155 - netdalys300_no_swprog155;
d_netdalys300_sw160_low_v_none = netdalys300_low_swprog160 - netdalys300_no_swprog160;
d_netdalys300_sw165_low_v_none = netdalys300_low_swprog165 - netdalys300_no_swprog165;
d_netdalys300_sw170_low_v_none = netdalys300_low_swprog170 - netdalys300_no_swprog170;
d_netdalys300_sw175_low_v_none = netdalys300_low_swprog175 - netdalys300_no_swprog175;
d_netdalys300_sw180_low_v_none = netdalys300_low_swprog180 - netdalys300_no_swprog180;
d_netdalys300_sw185_low_v_none = netdalys300_low_swprog185 - netdalys300_no_swprog185;
d_netdalys300_sw190_low_v_none = netdalys300_low_swprog190 - netdalys300_no_swprog190;
d_netdalys300_sw195_low_v_none = netdalys300_low_swprog195 - netdalys300_no_swprog195;
d_netdalys300_sw200_low_v_none = netdalys300_low_swprog200 - netdalys300_no_swprog200;
d_netdalys300_sw205_low_v_none = netdalys300_low_swprog205 - netdalys300_no_swprog205;
d_netdalys300_sw210_low_v_none = netdalys300_low_swprog210 - netdalys300_no_swprog210;
d_netdalys300_sw215_low_v_none = netdalys300_low_swprog215 - netdalys300_no_swprog215;
d_netdalys300_sw220_low_v_none = netdalys300_low_swprog220 - netdalys300_no_swprog220;
d_netdalys300_sw225_low_v_none = netdalys300_low_swprog225 - netdalys300_no_swprog225;
d_netdalys300_sw230_low_v_none = netdalys300_low_swprog230 - netdalys300_no_swprog230;
d_netdalys300_sw235_low_v_none = netdalys300_low_swprog235 - netdalys300_no_swprog235;
d_netdalys300_sw240_low_v_none = netdalys300_low_swprog240 - netdalys300_no_swprog240;
d_netdalys300_sw245_low_v_none = netdalys300_low_swprog245 - netdalys300_no_swprog245;
d_netdalys300_sw250_low_v_none = netdalys300_low_swprog250 - netdalys300_no_swprog250;


***low vs. none, 100 threshold;
d_netdalys100_sw10_low_v_none = netdalys100_low_swprog10 - netdalys100_no_swprog10;
d_netdalys100_sw15_low_v_none = netdalys100_low_swprog15 - netdalys100_no_swprog15;
d_netdalys100_sw20_low_v_none = netdalys100_low_swprog20 - netdalys100_no_swprog20;
d_netdalys100_sw25_low_v_none = netdalys100_low_swprog25 - netdalys100_no_swprog25;
d_netdalys100_sw30_low_v_none = netdalys100_low_swprog30 - netdalys100_no_swprog30;
d_netdalys100_sw35_low_v_none = netdalys100_low_swprog35 - netdalys100_no_swprog35;
d_netdalys100_sw40_low_v_none = netdalys100_low_swprog40 - netdalys100_no_swprog40;
d_netdalys100_sw45_low_v_none = netdalys100_low_swprog45 - netdalys100_no_swprog45;
d_netdalys100_sw50_low_v_none = netdalys100_low_swprog50 - netdalys100_no_swprog50;
d_netdalys100_sw55_low_v_none = netdalys100_low_swprog55 - netdalys100_no_swprog55;
d_netdalys100_sw60_low_v_none = netdalys100_low_swprog60 - netdalys100_no_swprog60;
d_netdalys100_sw65_low_v_none = netdalys100_low_swprog65 - netdalys100_no_swprog65;
d_netdalys100_sw70_low_v_none = netdalys100_low_swprog70 - netdalys100_no_swprog70;
d_netdalys100_sw75_low_v_none = netdalys100_low_swprog75 - netdalys100_no_swprog75;
d_netdalys100_sw80_low_v_none = netdalys100_low_swprog80 - netdalys100_no_swprog80;
d_netdalys100_sw85_low_v_none = netdalys100_low_swprog85 - netdalys100_no_swprog85;
d_netdalys100_sw90_low_v_none = netdalys100_low_swprog90 - netdalys100_no_swprog90;
d_netdalys100_sw95_low_v_none = netdalys100_low_swprog95 - netdalys100_no_swprog95;
d_netdalys100_sw100_low_v_none = netdalys100_low_swprog100 - netdalys100_no_swprog100;
d_netdalys100_sw105_low_v_none = netdalys100_low_swprog105 - netdalys100_no_swprog105;
d_netdalys100_sw110_low_v_none = netdalys100_low_swprog110 - netdalys100_no_swprog110;
d_netdalys100_sw115_low_v_none = netdalys100_low_swprog115 - netdalys100_no_swprog115;
d_netdalys100_sw120_low_v_none = netdalys100_low_swprog120 - netdalys100_no_swprog120;
d_netdalys100_sw125_low_v_none = netdalys100_low_swprog125 - netdalys100_no_swprog125;
d_netdalys100_sw130_low_v_none = netdalys100_low_swprog130 - netdalys100_no_swprog130;
d_netdalys100_sw135_low_v_none = netdalys100_low_swprog135 - netdalys100_no_swprog135;
d_netdalys100_sw140_low_v_none = netdalys100_low_swprog140 - netdalys100_no_swprog140;
d_netdalys100_sw145_low_v_none = netdalys100_low_swprog145 - netdalys100_no_swprog145;
d_netdalys100_sw150_low_v_none = netdalys100_low_swprog150 - netdalys100_no_swprog150;
d_netdalys100_sw155_low_v_none = netdalys100_low_swprog155 - netdalys100_no_swprog155;
d_netdalys100_sw160_low_v_none = netdalys100_low_swprog160 - netdalys100_no_swprog160;
d_netdalys100_sw165_low_v_none = netdalys100_low_swprog165 - netdalys100_no_swprog165;
d_netdalys100_sw170_low_v_none = netdalys100_low_swprog170 - netdalys100_no_swprog170;
d_netdalys100_sw175_low_v_none = netdalys100_low_swprog175 - netdalys100_no_swprog175;
d_netdalys100_sw180_low_v_none = netdalys100_low_swprog180 - netdalys100_no_swprog180;
d_netdalys100_sw185_low_v_none = netdalys100_low_swprog185 - netdalys100_no_swprog185;
d_netdalys100_sw190_low_v_none = netdalys100_low_swprog190 - netdalys100_no_swprog190;
d_netdalys100_sw195_low_v_none = netdalys100_low_swprog195 - netdalys100_no_swprog195;
d_netdalys100_sw200_low_v_none = netdalys100_low_swprog200 - netdalys100_no_swprog200;
d_netdalys100_sw205_low_v_none = netdalys100_low_swprog205 - netdalys100_no_swprog205;
d_netdalys100_sw210_low_v_none = netdalys100_low_swprog210 - netdalys100_no_swprog210;
d_netdalys100_sw215_low_v_none = netdalys100_low_swprog215 - netdalys100_no_swprog215;
d_netdalys100_sw220_low_v_none = netdalys100_low_swprog220 - netdalys100_no_swprog220;
d_netdalys100_sw225_low_v_none = netdalys100_low_swprog225 - netdalys100_no_swprog225;
d_netdalys100_sw230_low_v_none = netdalys100_low_swprog230 - netdalys100_no_swprog230;
d_netdalys100_sw235_low_v_none = netdalys100_low_swprog235 - netdalys100_no_swprog235;
d_netdalys100_sw240_low_v_none = netdalys100_low_swprog240 - netdalys100_no_swprog240;
d_netdalys100_sw245_low_v_none = netdalys100_low_swprog245 - netdalys100_no_swprog245;
d_netdalys100_sw250_low_v_none = netdalys100_low_swprog250 - netdalys100_no_swprog250;

*20 YEAR HORIZON;

***high vs. none., 500 threshold;
d_netdalys500_sw10_hi_v_none_20 = netdalys500_hi_swprog10_20 - netdalys500_no_swprog10_20;
d_netdalys500_sw15_hi_v_none_20 = netdalys500_hi_swprog15_20 - netdalys500_no_swprog15_20;
d_netdalys500_sw20_hi_v_none_20 = netdalys500_hi_swprog20_20 - netdalys500_no_swprog20_20;
d_netdalys500_sw25_hi_v_none_20 = netdalys500_hi_swprog25_20 - netdalys500_no_swprog25_20;
d_netdalys500_sw30_hi_v_none_20 = netdalys500_hi_swprog30_20 - netdalys500_no_swprog30_20;
d_netdalys500_sw35_hi_v_none_20 = netdalys500_hi_swprog35_20 - netdalys500_no_swprog35_20;
d_netdalys500_sw40_hi_v_none_20 = netdalys500_hi_swprog40_20 - netdalys500_no_swprog40_20;
d_netdalys500_sw45_hi_v_none_20 = netdalys500_hi_swprog45_20 - netdalys500_no_swprog45_20;
d_netdalys500_sw50_hi_v_none_20 = netdalys500_hi_swprog50_20 - netdalys500_no_swprog50_20;
d_netdalys500_sw55_hi_v_none_20 = netdalys500_hi_swprog55_20 - netdalys500_no_swprog55_20;
d_netdalys500_sw60_hi_v_none_20 = netdalys500_hi_swprog60_20 - netdalys500_no_swprog60_20;
d_netdalys500_sw65_hi_v_none_20 = netdalys500_hi_swprog65_20 - netdalys500_no_swprog65_20;
d_netdalys500_sw70_hi_v_none_20 = netdalys500_hi_swprog70_20 - netdalys500_no_swprog70_20;
d_netdalys500_sw75_hi_v_none_20 = netdalys500_hi_swprog75_20 - netdalys500_no_swprog75_20;
d_netdalys500_sw80_hi_v_none_20 = netdalys500_hi_swprog80_20 - netdalys500_no_swprog80_20;
d_netdalys500_sw85_hi_v_none_20 = netdalys500_hi_swprog85_20 - netdalys500_no_swprog85_20;
d_netdalys500_sw90_hi_v_none_20 = netdalys500_hi_swprog90_20 - netdalys500_no_swprog90_20;
d_netdalys500_sw95_hi_v_none_20 = netdalys500_hi_swprog95_20 - netdalys500_no_swprog95_20;
d_netdalys500_sw100_hi_v_none_20 = netdalys500_hi_swprog100_20 - netdalys500_no_swprog100_20;
d_netdalys500_sw105_hi_v_none_20 = netdalys500_hi_swprog105_20 - netdalys500_no_swprog105_20;
d_netdalys500_sw110_hi_v_none_20 = netdalys500_hi_swprog110_20 - netdalys500_no_swprog110_20;
d_netdalys500_sw115_hi_v_none_20 = netdalys500_hi_swprog115_20 - netdalys500_no_swprog115_20;
d_netdalys500_sw120_hi_v_none_20 = netdalys500_hi_swprog120_20 - netdalys500_no_swprog120_20;
d_netdalys500_sw125_hi_v_none_20 = netdalys500_hi_swprog125_20 - netdalys500_no_swprog125_20;
d_netdalys500_sw130_hi_v_none_20 = netdalys500_hi_swprog130_20 - netdalys500_no_swprog130_20;
d_netdalys500_sw135_hi_v_none_20 = netdalys500_hi_swprog135_20 - netdalys500_no_swprog135_20;
d_netdalys500_sw140_hi_v_none_20 = netdalys500_hi_swprog140_20 - netdalys500_no_swprog140_20;
d_netdalys500_sw145_hi_v_none_20 = netdalys500_hi_swprog145_20 - netdalys500_no_swprog145_20;
d_netdalys500_sw150_hi_v_none_20 = netdalys500_hi_swprog150_20 - netdalys500_no_swprog150_20;
d_netdalys500_sw155_hi_v_none_20 = netdalys500_hi_swprog155_20 - netdalys500_no_swprog155_20;
d_netdalys500_sw160_hi_v_none_20 = netdalys500_hi_swprog160_20 - netdalys500_no_swprog160_20;
d_netdalys500_sw165_hi_v_none_20 = netdalys500_hi_swprog165_20 - netdalys500_no_swprog165_20;
d_netdalys500_sw170_hi_v_none_20 = netdalys500_hi_swprog170_20 - netdalys500_no_swprog170_20;
d_netdalys500_sw175_hi_v_none_20 = netdalys500_hi_swprog175_20 - netdalys500_no_swprog175_20;
d_netdalys500_sw180_hi_v_none_20 = netdalys500_hi_swprog180_20 - netdalys500_no_swprog180_20;
d_netdalys500_sw185_hi_v_none_20 = netdalys500_hi_swprog185_20 - netdalys500_no_swprog185_20;
d_netdalys500_sw190_hi_v_none_20 = netdalys500_hi_swprog190_20 - netdalys500_no_swprog190_20;
d_netdalys500_sw195_hi_v_none_20 = netdalys500_hi_swprog195_20 - netdalys500_no_swprog195_20;
d_netdalys500_sw200_hi_v_none_20 = netdalys500_hi_swprog200_20 - netdalys500_no_swprog200_20;
d_netdalys500_sw205_hi_v_none_20 = netdalys500_hi_swprog205_20 - netdalys500_no_swprog205_20;
d_netdalys500_sw210_hi_v_none_20 = netdalys500_hi_swprog210_20 - netdalys500_no_swprog210_20;
d_netdalys500_sw215_hi_v_none_20 = netdalys500_hi_swprog215_20 - netdalys500_no_swprog215_20;
d_netdalys500_sw220_hi_v_none_20 = netdalys500_hi_swprog220_20 - netdalys500_no_swprog220_20;
d_netdalys500_sw225_hi_v_none_20 = netdalys500_hi_swprog225_20 - netdalys500_no_swprog225_20;
d_netdalys500_sw230_hi_v_none_20 = netdalys500_hi_swprog230_20 - netdalys500_no_swprog230_20;
d_netdalys500_sw235_hi_v_none_20 = netdalys500_hi_swprog235_20 - netdalys500_no_swprog235_20;
d_netdalys500_sw240_hi_v_none_20 = netdalys500_hi_swprog240_20 - netdalys500_no_swprog240_20;
d_netdalys500_sw245_hi_v_none_20 = netdalys500_hi_swprog245_20 - netdalys500_no_swprog245_20;
d_netdalys500_sw250_hi_v_none_20 = netdalys500_hi_swprog250_20 - netdalys500_no_swprog250_20;

***lo vs. none, 500 threshold_20;
d_netdalys500_sw10_lo_v_none_20 = netdalys500_lo_swprog10_20 - netdalys500_no_swprog10_20;
d_netdalys500_sw15_lo_v_none_20 = netdalys500_lo_swprog15_20 - netdalys500_no_swprog15_20;
d_netdalys500_sw20_lo_v_none_20 = netdalys500_lo_swprog20_20 - netdalys500_no_swprog20_20;
d_netdalys500_sw25_lo_v_none_20 = netdalys500_lo_swprog25_20 - netdalys500_no_swprog25_20;
d_netdalys500_sw30_lo_v_none_20 = netdalys500_lo_swprog30_20 - netdalys500_no_swprog30_20;
d_netdalys500_sw35_lo_v_none_20 = netdalys500_lo_swprog35_20 - netdalys500_no_swprog35_20;
d_netdalys500_sw40_lo_v_none_20 = netdalys500_lo_swprog40_20 - netdalys500_no_swprog40_20;
d_netdalys500_sw45_lo_v_none_20 = netdalys500_lo_swprog45_20 - netdalys500_no_swprog45_20;
d_netdalys500_sw50_lo_v_none_20 = netdalys500_lo_swprog50_20 - netdalys500_no_swprog50_20;
d_netdalys500_sw55_lo_v_none_20 = netdalys500_lo_swprog55_20 - netdalys500_no_swprog55_20;
d_netdalys500_sw60_lo_v_none_20 = netdalys500_lo_swprog60_20 - netdalys500_no_swprog60_20;
d_netdalys500_sw65_lo_v_none_20 = netdalys500_lo_swprog65_20 - netdalys500_no_swprog65_20;
d_netdalys500_sw70_lo_v_none_20 = netdalys500_lo_swprog70_20 - netdalys500_no_swprog70_20;
d_netdalys500_sw75_lo_v_none_20 = netdalys500_lo_swprog75_20 - netdalys500_no_swprog75_20;
d_netdalys500_sw80_lo_v_none_20 = netdalys500_lo_swprog80_20 - netdalys500_no_swprog80_20;
d_netdalys500_sw85_lo_v_none_20 = netdalys500_lo_swprog85_20 - netdalys500_no_swprog85_20;
d_netdalys500_sw90_lo_v_none_20 = netdalys500_lo_swprog90_20 - netdalys500_no_swprog90_20;
d_netdalys500_sw95_lo_v_none_20 = netdalys500_lo_swprog95_20 - netdalys500_no_swprog95_20;
d_netdalys500_sw100_lo_v_none_20 = netdalys500_lo_swprog100_20 - netdalys500_no_swprog100_20;
d_netdalys500_sw105_lo_v_none_20 = netdalys500_lo_swprog105_20 - netdalys500_no_swprog105_20;
d_netdalys500_sw110_lo_v_none_20 = netdalys500_lo_swprog110_20 - netdalys500_no_swprog110_20;
d_netdalys500_sw115_lo_v_none_20 = netdalys500_lo_swprog115_20 - netdalys500_no_swprog115_20;
d_netdalys500_sw120_lo_v_none_20 = netdalys500_lo_swprog120_20 - netdalys500_no_swprog120_20;
d_netdalys500_sw125_lo_v_none_20 = netdalys500_lo_swprog125_20 - netdalys500_no_swprog125_20;
d_netdalys500_sw130_lo_v_none_20 = netdalys500_lo_swprog130_20 - netdalys500_no_swprog130_20;
d_netdalys500_sw135_lo_v_none_20 = netdalys500_lo_swprog135_20 - netdalys500_no_swprog135_20;
d_netdalys500_sw140_lo_v_none_20 = netdalys500_lo_swprog140_20 - netdalys500_no_swprog140_20;
d_netdalys500_sw145_lo_v_none_20 = netdalys500_lo_swprog145_20 - netdalys500_no_swprog145_20;
d_netdalys500_sw150_lo_v_none_20 = netdalys500_lo_swprog150_20 - netdalys500_no_swprog150_20;
d_netdalys500_sw155_lo_v_none_20 = netdalys500_lo_swprog155_20 - netdalys500_no_swprog155_20;
d_netdalys500_sw160_lo_v_none_20 = netdalys500_lo_swprog160_20 - netdalys500_no_swprog160_20;
d_netdalys500_sw165_lo_v_none_20 = netdalys500_lo_swprog165_20 - netdalys500_no_swprog165_20;
d_netdalys500_sw170_lo_v_none_20 = netdalys500_lo_swprog170_20 - netdalys500_no_swprog170_20;
d_netdalys500_sw175_lo_v_none_20 = netdalys500_lo_swprog175_20 - netdalys500_no_swprog175_20;
d_netdalys500_sw180_lo_v_none_20 = netdalys500_lo_swprog180_20 - netdalys500_no_swprog180_20;
d_netdalys500_sw185_lo_v_none_20 = netdalys500_lo_swprog185_20 - netdalys500_no_swprog185_20;
d_netdalys500_sw190_lo_v_none_20 = netdalys500_lo_swprog190_20 - netdalys500_no_swprog190_20;
d_netdalys500_sw195_lo_v_none_20 = netdalys500_lo_swprog195_20 - netdalys500_no_swprog195_20;
d_netdalys500_sw200_lo_v_none_20 = netdalys500_lo_swprog200_20 - netdalys500_no_swprog200_20;
d_netdalys500_sw205_lo_v_none_20 = netdalys500_lo_swprog205_20 - netdalys500_no_swprog205_20;
d_netdalys500_sw210_lo_v_none_20 = netdalys500_lo_swprog210_20 - netdalys500_no_swprog210_20;
d_netdalys500_sw215_lo_v_none_20 = netdalys500_lo_swprog215_20 - netdalys500_no_swprog215_20;
d_netdalys500_sw220_lo_v_none_20 = netdalys500_lo_swprog220_20 - netdalys500_no_swprog220_20;
d_netdalys500_sw225_lo_v_none_20 = netdalys500_lo_swprog225_20 - netdalys500_no_swprog225_20;
d_netdalys500_sw230_lo_v_none_20 = netdalys500_lo_swprog230_20 - netdalys500_no_swprog230_20;
d_netdalys500_sw235_lo_v_none_20 = netdalys500_lo_swprog235_20 - netdalys500_no_swprog235_20;
d_netdalys500_sw240_lo_v_none_20 = netdalys500_lo_swprog240_20 - netdalys500_no_swprog240_20;
d_netdalys500_sw245_lo_v_none_20 = netdalys500_lo_swprog245_20 - netdalys500_no_swprog245_20;
d_netdalys500_sw250_lo_v_none_20 = netdalys500_lo_swprog250_20 - netdalys500_no_swprog250_20;


if  d_netdalys500_sw10_high_v_none > 0 then do;max_cost_sw_program_high = 0;  goto xx;end;
if  d_netdalys500_sw15_high_v_none > 0 then do;max_cost_sw_program_high = 10;  goto xx;end; 
if  d_netdalys500_sw20_high_v_none > 0 then do;max_cost_sw_program_high = 15;  goto xx;end; 
if  d_netdalys500_sw25_high_v_none > 0 then do;max_cost_sw_program_high = 20;  goto xx;end; 
if  d_netdalys500_sw30_high_v_none > 0 then do;max_cost_sw_program_high = 25;  goto xx;end; 
if  d_netdalys500_sw35_high_v_none > 0 then do;max_cost_sw_program_high = 30;  goto xx;end; 
if  d_netdalys500_sw40_high_v_none > 0 then do;max_cost_sw_program_high = 35;  goto xx;end;
if  d_netdalys500_sw45_high_v_none > 0 then do;max_cost_sw_program_high = 40;  goto xx;end; 
if  d_netdalys500_sw50_high_v_none > 0 then do;max_cost_sw_program_high = 45;  goto xx;end; 
if  d_netdalys500_sw55_high_v_none > 0 then do;max_cost_sw_program_high = 50;  goto xx;end; 
if  d_netdalys500_sw60_high_v_none > 0 then do;max_cost_sw_program_high = 55;  goto xx;end; 
if  d_netdalys500_sw65_high_v_none > 0 then do;max_cost_sw_program_high = 60;  goto xx;end; 
if  d_netdalys500_sw70_high_v_none > 0 then do;max_cost_sw_program_high = 65;  goto xx;end;
if  d_netdalys500_sw75_high_v_none > 0 then do;max_cost_sw_program_high = 70;  goto xx;end; 
if  d_netdalys500_sw80_high_v_none > 0 then do;max_cost_sw_program_high = 75;  goto xx;end; 
if  d_netdalys500_sw85_high_v_none > 0 then do;max_cost_sw_program_high = 80;  goto xx;end;
if  d_netdalys500_sw90_high_v_none > 0 then do;max_cost_sw_program_high = 85;  goto xx;end; 
if  d_netdalys500_sw95_high_v_none > 0 then do;max_cost_sw_program_high = 90;  goto xx;end; 
if  d_netdalys500_sw100_high_v_none > 0 then do;max_cost_sw_program_high = 95;  goto xx;end; 
if  d_netdalys500_sw105_high_v_none > 0 then do;max_cost_sw_program_high = 100;  goto xx;end; 
if  d_netdalys500_sw110_high_v_none > 0 then do;max_cost_sw_program_high = 105;  goto xx;end; 
if  d_netdalys500_sw115_high_v_none > 0 then do;max_cost_sw_program_high = 110;  goto xx;end;
if  d_netdalys500_sw120_high_v_none > 0 then do;max_cost_sw_program_high = 115;  goto xx;end; 
if  d_netdalys500_sw125_high_v_none > 0 then do;max_cost_sw_program_high = 120;  goto xx;end; 
if  d_netdalys500_sw130_high_v_none > 0 then do;max_cost_sw_program_high = 125;  goto xx;end; 
if  d_netdalys500_sw135_high_v_none > 0 then do;max_cost_sw_program_high = 130;  goto xx;end; 
if  d_netdalys500_sw140_high_v_none > 0 then do;max_cost_sw_program_high = 135;  goto xx;end; 
if  d_netdalys500_sw145_high_v_none > 0 then do;max_cost_sw_program_high = 140;  goto xx;end;
if  d_netdalys500_sw150_high_v_none > 0 then do;max_cost_sw_program_high = 145;  goto xx;end; 
if  d_netdalys500_sw155_high_v_none > 0 then do;max_cost_sw_program_high = 150;  goto xx;end; 
if  d_netdalys500_sw160_high_v_none > 0 then do;max_cost_sw_program_high = 155;  goto xx;end;
if  d_netdalys500_sw165_high_v_none > 0 then do;max_cost_sw_program_high = 160;  goto xx;end; 
if  d_netdalys500_sw170_high_v_none > 0 then do;max_cost_sw_program_high = 165;  goto xx;end; 
if  d_netdalys500_sw175_high_v_none > 0 then do;max_cost_sw_program_high = 170;  goto xx;end; 
if  d_netdalys500_sw180_high_v_none > 0 then do;max_cost_sw_program_high = 175;  goto xx;end; 
if  d_netdalys500_sw185_high_v_none > 0 then do;max_cost_sw_program_high = 180;  goto xx;end; 
if  d_netdalys500_sw190_high_v_none > 0 then do;max_cost_sw_program_high = 185;  goto xx;end;
if  d_netdalys500_sw195_high_v_none > 0 then do;max_cost_sw_program_high = 190;  goto xx;end; 
if  d_netdalys500_sw200_high_v_none > 0 then do;max_cost_sw_program_high = 195;  goto xx;end; 
if  d_netdalys500_sw205_high_v_none > 0 then do;max_cost_sw_program_high = 200;  goto xx;end; 
if  d_netdalys500_sw210_high_v_none > 0 then do;max_cost_sw_program_high = 205;  goto xx;end; 
if  d_netdalys500_sw215_high_v_none > 0 then do;max_cost_sw_program_high = 210;  goto xx;end;
if  d_netdalys500_sw220_high_v_none > 0 then do;max_cost_sw_program_high = 215;  goto xx;end; 
if  d_netdalys500_sw225_high_v_none > 0 then do;max_cost_sw_program_high = 220;  goto xx;end; 
if  d_netdalys500_sw230_high_v_none > 0 then do;max_cost_sw_program_high = 225;  goto xx;end; 
if  d_netdalys500_sw235_high_v_none > 0 then do;max_cost_sw_program_high = 230;  goto xx;end; 
if  d_netdalys500_sw240_high_v_none > 0 then do;max_cost_sw_program_high = 235;  goto xx;end; 
if  d_netdalys500_sw245_high_v_none > 0 then do;max_cost_sw_program_high = 240;  goto xx;end;
if  d_netdalys500_sw250_high_v_none > 0 then do;max_cost_sw_program_high = 245;  goto xx;end; 
xx:




if  d_netdalys500_sw10_low_v_none > 0 then do;max_cost_sw_program_low = 0;  goto yy;end;
if  d_netdalys500_sw15_low_v_none > 0 then do;max_cost_sw_program_low = 10;  goto yy;end; 
if  d_netdalys500_sw20_low_v_none > 0 then do;max_cost_sw_program_low = 15;  goto yy;end; 
if  d_netdalys500_sw25_low_v_none > 0 then do;max_cost_sw_program_low = 20;  goto yy;end; 
if  d_netdalys500_sw30_low_v_none > 0 then do;max_cost_sw_program_low = 25;  goto yy;end; 
if  d_netdalys500_sw35_low_v_none > 0 then do;max_cost_sw_program_low = 30;  goto yy;end; 
if  d_netdalys500_sw40_low_v_none > 0 then do;max_cost_sw_program_low = 35;  goto yy;end;
if  d_netdalys500_sw45_low_v_none > 0 then do;max_cost_sw_program_low = 40;  goto yy;end; 
if  d_netdalys500_sw50_low_v_none > 0 then do;max_cost_sw_program_low = 45;  goto yy;end; 
if  d_netdalys500_sw55_low_v_none > 0 then do;max_cost_sw_program_low = 50;  goto yy;end; 
if  d_netdalys500_sw60_low_v_none > 0 then do;max_cost_sw_program_low = 55;  goto yy;end; 
if  d_netdalys500_sw65_low_v_none > 0 then do;max_cost_sw_program_low = 60;  goto yy;end; 
if  d_netdalys500_sw70_low_v_none > 0 then do;max_cost_sw_program_low = 65;  goto yy;end;
if  d_netdalys500_sw75_low_v_none > 0 then do;max_cost_sw_program_low = 70;  goto yy;end; 
if  d_netdalys500_sw80_low_v_none > 0 then do;max_cost_sw_program_low = 75;  goto yy;end; 
if  d_netdalys500_sw85_low_v_none > 0 then do;max_cost_sw_program_low = 80;  goto yy;end;
if  d_netdalys500_sw90_low_v_none > 0 then do;max_cost_sw_program_low = 85;  goto yy;end; 
if  d_netdalys500_sw95_low_v_none > 0 then do;max_cost_sw_program_low = 90;  goto yy;end; 
if  d_netdalys500_sw100_low_v_none > 0 then do;max_cost_sw_program_low = 95;  goto yy;end; 
if  d_netdalys500_sw105_low_v_none > 0 then do;max_cost_sw_program_low = 100;  goto yy;end; 
if  d_netdalys500_sw110_low_v_none > 0 then do;max_cost_sw_program_low = 105;  goto yy;end; 
if  d_netdalys500_sw115_low_v_none > 0 then do;max_cost_sw_program_low = 110;  goto yy;end;
if  d_netdalys500_sw120_low_v_none > 0 then do;max_cost_sw_program_low = 115;  goto yy;end; 
if  d_netdalys500_sw125_low_v_none > 0 then do;max_cost_sw_program_low = 120;  goto yy;end; 
if  d_netdalys500_sw130_low_v_none > 0 then do;max_cost_sw_program_low = 125;  goto yy;end; 
if  d_netdalys500_sw135_low_v_none > 0 then do;max_cost_sw_program_low = 130;  goto yy;end; 
if  d_netdalys500_sw140_low_v_none > 0 then do;max_cost_sw_program_low = 135;  goto yy;end; 
if  d_netdalys500_sw145_low_v_none > 0 then do;max_cost_sw_program_low = 140;  goto yy;end;
if  d_netdalys500_sw150_low_v_none > 0 then do;max_cost_sw_program_low = 145;  goto yy;end; 
if  d_netdalys500_sw155_low_v_none > 0 then do;max_cost_sw_program_low = 150;  goto yy;end; 
if  d_netdalys500_sw160_low_v_none > 0 then do;max_cost_sw_program_low = 155;  goto yy;end;
if  d_netdalys500_sw165_low_v_none > 0 then do;max_cost_sw_program_low = 160;  goto yy;end; 
if  d_netdalys500_sw170_low_v_none > 0 then do;max_cost_sw_program_low = 165;  goto yy;end; 
if  d_netdalys500_sw175_low_v_none > 0 then do;max_cost_sw_program_low = 170;  goto yy;end; 
if  d_netdalys500_sw180_low_v_none > 0 then do;max_cost_sw_program_low = 175;  goto yy;end; 
if  d_netdalys500_sw185_low_v_none > 0 then do;max_cost_sw_program_low = 180;  goto yy;end; 
if  d_netdalys500_sw190_low_v_none > 0 then do;max_cost_sw_program_low = 185;  goto yy;end;
if  d_netdalys500_sw195_low_v_none > 0 then do;max_cost_sw_program_low = 190;  goto yy;end; 
if  d_netdalys500_sw200_low_v_none > 0 then do;max_cost_sw_program_low = 195;  goto yy;end; 
if  d_netdalys500_sw205_low_v_none > 0 then do;max_cost_sw_program_low = 200;  goto yy;end; 
if  d_netdalys500_sw210_low_v_none > 0 then do;max_cost_sw_program_low = 205;  goto yy;end; 
if  d_netdalys500_sw215_low_v_none > 0 then do;max_cost_sw_program_low = 210;  goto yy;end;
if  d_netdalys500_sw220_low_v_none > 0 then do;max_cost_sw_program_low = 215;  goto yy;end; 
if  d_netdalys500_sw225_low_v_none > 0 then do;max_cost_sw_program_low = 220;  goto yy;end; 
if  d_netdalys500_sw230_low_v_none > 0 then do;max_cost_sw_program_low = 225;  goto yy;end; 
if  d_netdalys500_sw235_low_v_none > 0 then do;max_cost_sw_program_low = 230;  goto yy;end; 
if  d_netdalys500_sw240_low_v_none > 0 then do;max_cost_sw_program_low = 235;  goto yy;end; 
if  d_netdalys500_sw245_low_v_none > 0 then do;max_cost_sw_program_low = 240;  goto yy;end;
if  d_netdalys500_sw250_low_v_none > 0 then do;max_cost_sw_program_low = 245;  goto yy;end; 
yy:

if max_cost_sw_program_high=. then max_cost_sw_program_high=350;
if max_cost_sw_program_low=. then max_cost_sw_program_low=350;

max_cost_sw_program_high_per_sw=max_cost_sw_program_high /n_sw_1549__22;
max_cost_sw_program_low_per_sw=max_cost_sw_program_low /n_sw_1549__22;


if  d_netdalys500_sw10_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 0;  goto aa;end;
if  d_netdalys500_sw15_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 10;  goto aa;end; 
if  d_netdalys500_sw20_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 15;  goto aa;end; 
if  d_netdalys500_sw25_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 20;  goto aa;end; 
if  d_netdalys500_sw30_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 25;  goto aa;end; 
if  d_netdalys500_sw35_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 30;  goto aa;end; 
if  d_netdalys500_sw40_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 35;  goto aa;end;
if  d_netdalys500_sw45_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 40;  goto aa;end; 
if  d_netdalys500_sw50_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 45;  goto aa;end; 
if  d_netdalys500_sw55_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 50;  goto aa;end; 
if  d_netdalys500_sw60_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 55;  goto aa;end; 
if  d_netdalys500_sw65_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 60;  goto aa;end; 
if  d_netdalys500_sw70_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 65;  goto aa;end;
if  d_netdalys500_sw75_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 70;  goto aa;end; 
if  d_netdalys500_sw80_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 75;  goto aa;end; 
if  d_netdalys500_sw85_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 80;  goto aa;end;
if  d_netdalys500_sw90_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 85;  goto aa;end; 
if  d_netdalys500_sw95_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 90;  goto aa;end; 
if  d_netdalys500_sw100_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 95;  goto aa;end; 
if  d_netdalys500_sw105_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 100;  goto aa;end; 
if  d_netdalys500_sw110_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 105;  goto aa;end; 
if  d_netdalys500_sw115_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 110;  goto aa;end;
if  d_netdalys500_sw120_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 115;  goto aa;end; 
if  d_netdalys500_sw125_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 120;  goto aa;end; 
if  d_netdalys500_sw130_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 125;  goto aa;end; 
if  d_netdalys500_sw135_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 130;  goto aa;end; 
if  d_netdalys500_sw140_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 135;  goto aa;end; 
if  d_netdalys500_sw145_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 140;  goto aa;end;
if  d_netdalys500_sw150_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 145;  goto aa;end; 
if  d_netdalys500_sw155_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 150;  goto aa;end; 
if  d_netdalys500_sw160_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 155;  goto aa;end;
if  d_netdalys500_sw165_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 160;  goto aa;end; 
if  d_netdalys500_sw170_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 165;  goto aa;end; 
if  d_netdalys500_sw175_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 170;  goto aa;end; 
if  d_netdalys500_sw180_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 175;  goto aa;end; 
if  d_netdalys500_sw185_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 180;  goto aa;end; 
if  d_netdalys500_sw190_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 185;  goto aa;end;
if  d_netdalys500_sw195_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 190;  goto aa;end; 
if  d_netdalys500_sw200_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 195;  goto aa;end; 
if  d_netdalys500_sw205_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 200;  goto aa;end; 
if  d_netdalys500_sw210_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 205;  goto aa;end; 
if  d_netdalys500_sw215_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 210;  goto aa;end;
if  d_netdalys500_sw220_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 215;  goto aa;end; 
if  d_netdalys500_sw225_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 220;  goto aa;end; 
if  d_netdalys500_sw230_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 225;  goto aa;end; 
if  d_netdalys500_sw235_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 230;  goto aa;end; 
if  d_netdalys500_sw240_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 235;  goto aa;end; 
if  d_netdalys500_sw245_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 240;  goto aa;end;
if  d_netdalys500_sw250_hi_v_none_20 > 0 then do;max_cost_sw_program_hi_20 = 245;  goto aa;end; 
aa:


if  d_netdalys500_sw10_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 0;  goto bb;end;
if  d_netdalys500_sw15_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 10;  goto bb;end; 
if  d_netdalys500_sw20_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 15;  goto bb;end; 
if  d_netdalys500_sw25_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 20;  goto bb;end; 
if  d_netdalys500_sw30_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 25;  goto bb;end; 
if  d_netdalys500_sw35_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 30;  goto bb;end; 
if  d_netdalys500_sw40_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 35;  goto bb;end;
if  d_netdalys500_sw45_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 40;  goto bb;end; 
if  d_netdalys500_sw50_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 45;  goto bb;end; 
if  d_netdalys500_sw55_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 50;  goto bb;end; 
if  d_netdalys500_sw60_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 55;  goto bb;end; 
if  d_netdalys500_sw65_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 60;  goto bb;end; 
if  d_netdalys500_sw70_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 65;  goto bb;end;
if  d_netdalys500_sw75_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 70;  goto bb;end; 
if  d_netdalys500_sw80_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 75;  goto bb;end; 
if  d_netdalys500_sw85_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 80;  goto bb;end;
if  d_netdalys500_sw90_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 85;  goto bb;end; 
if  d_netdalys500_sw95_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 90;  goto bb;end; 
if  d_netdalys500_sw100_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 95;  goto bb;end; 
if  d_netdalys500_sw105_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 100;  goto bb;end; 
if  d_netdalys500_sw110_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 105;  goto bb;end; 
if  d_netdalys500_sw115_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 110;  goto bb;end;
if  d_netdalys500_sw120_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 115;  goto bb;end; 
if  d_netdalys500_sw125_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 120;  goto bb;end; 
if  d_netdalys500_sw130_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 125;  goto bb;end; 
if  d_netdalys500_sw135_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 130;  goto bb;end; 
if  d_netdalys500_sw140_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 135;  goto bb;end; 
if  d_netdalys500_sw145_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 140;  goto bb;end;
if  d_netdalys500_sw150_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 145;  goto bb;end; 
if  d_netdalys500_sw155_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 150;  goto bb;end; 
if  d_netdalys500_sw160_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 155;  goto bb;end;
if  d_netdalys500_sw165_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 160;  goto bb;end; 
if  d_netdalys500_sw170_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 165;  goto bb;end; 
if  d_netdalys500_sw175_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 170;  goto bb;end; 
if  d_netdalys500_sw180_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 175;  goto bb;end; 
if  d_netdalys500_sw185_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 180;  goto bb;end; 
if  d_netdalys500_sw190_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 185;  goto bb;end;
if  d_netdalys500_sw195_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 190;  goto bb;end; 
if  d_netdalys500_sw200_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 195;  goto bb;end; 
if  d_netdalys500_sw205_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 200;  goto bb;end; 
if  d_netdalys500_sw210_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 205;  goto bb;end; 
if  d_netdalys500_sw215_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 210;  goto bb;end;
if  d_netdalys500_sw220_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 215;  goto bb;end; 
if  d_netdalys500_sw225_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 220;  goto bb;end; 
if  d_netdalys500_sw230_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 225;  goto bb;end; 
if  d_netdalys500_sw235_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 230;  goto bb;end; 
if  d_netdalys500_sw240_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 235;  goto bb;end; 
if  d_netdalys500_sw245_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 240;  goto bb;end;
if  d_netdalys500_sw250_lo_v_none_20 > 0 then do;max_cost_sw_program_lo_20 = 245;  goto bb;end; 
bb:

if max_cost_sw_program_hi_20=. then max_cost_sw_program_hi_20=350;
if max_cost_sw_program_lo_20=. then max_cost_sw_program_lo_20=350;

max_cost_sw_program_hi_p_sw_20=max_cost_sw_program_hi_20 /n_sw_1549__22;
max_cost_sw_program_lo_p_sw_20=max_cost_sw_program_lo_20 /n_sw_1549__22;


*net monetary benefit (Dalys * cost-effectivenss threshold) + costs;
nmb_none = (ddaly_22_72_1*0.0005) + dcost_22_72_1;
nmb_swprog_low= (ddaly_22_72_2*0.0005) + dcost_22_72_2;
nmb_swprog_high = (ddaly_22_72_3*0.0005) + dcost_22_72_3;

diff_nmb_swprog_high_v_none=nmb_swprog_high - nmb_none;
diff_nmb_swprog_low_v_none=nmb_swprog_low - nmb_none;

***max cost of SW prog; *we didn't use this method in the end as used the graph method instead;
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
ce=0;if diff_ddaly_high_v_none lt 0 then ce=1;

***cost of SW prog;
maxcost_swprog_low_v_none= diff_netdalys_swprog_low_v_none * 500;
***(DALYs averted *500) - difference in costs;


***All this below was not included in the paper;
***Low program vs. high impact;
*dalys averted;
diff_ddaly_swprog_high_v_low = ddaly_22_72_3 - ddaly_22_72_2;

*difference in total costs;
diff_dcost_swprog_high_v_low = dcost_22_72_3 - dcost_22_72_2;

***look at individual costs;
diff_artcost_swprog_high_v_low = dart_cost_y_22_72_3 - dart_cost_y_22_72_2;
diff_testcost_swprog_high_v_low = dtest_cost_22_72_3 - dtest_cost_22_72_2;
diff_prepcost_swprog_high_v_low = dcost_prep_22_72_3 - dcost_prep_22_72_2;

*net dalys averted;
diff_netdalys_swprog_high_v_low = netdalys_swprog_high - netdalys_swprog_low; *take absolute number;

***cost of SW prog;
maxcost_swprog_high_v_low= diff_netdalys_swprog_high_v_low*500;

***Over 1 year;
***ICER for various costs of a SW program;
cost_daly_averted_high_v_none19_ = (diff_dcost_high_v_none19_/diff_ddaly_high_v_none)*1000000;

cost_daly_averted_high_v_none10_ = (diff_dcost_high_v_none10_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none15_ = (diff_dcost_high_v_none15_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none20_ = (diff_dcost_high_v_none20_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none25_ = (diff_dcost_high_v_none25_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none30_ = (diff_dcost_high_v_none30_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none35_ = (diff_dcost_high_v_none35_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none40_ = (diff_dcost_high_v_none40_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none45_ = (diff_dcost_high_v_none45_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none50_ = (diff_dcost_high_v_none50_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none55_ = (diff_dcost_high_v_none55_/diff_ddaly_high_v_none)*1000000;
cost_daly_averted_high_v_none60_ = (diff_dcost_high_v_none60_/diff_ddaly_high_v_none)*1000000;


***Table 4;
***Absolute costs;
proc means n mean p5 p95 lclm uclm;
var dcost_22_72_1 dcost_22_72_2 dcost_22_72_3
	dart_cost_y_22_72_1 dart_cost_y_22_72_2 dart_cost_y_22_72_3
	dcost_prep_22_72_1 dcost_prep_22_72_2 dcost_prep_22_72_3
	dtest_cost_22_72_1 dtest_cost_22_72_2 dtest_cost_22_72_3
	dtest_cost_sw_22_72_1 dtest_cost_sw_22_72_2 dtest_cost_sw_22_72_3
;run;

***Difference in costs;
proc means n mean p5 p95 lclm uclm;
var diff_dcost_low_v_none diff_artcost_low_v_none diff_prepcost_low_v_none diff_testcost_low_v_none diff_testcost_sw_low_v_none
	diff_dcost_high_v_none diff_artcost_high_v_none diff_prepcost_high_v_none diff_testcost_high_v_none diff_testcost_sw_high_v_none;
run;

***DALYs;
proc means n mean p5 p95 lclm uclm;
var	ddaly_22_72_1 ddaly_22_72_2 ddaly_22_72_3
	diff_ddaly_low_v_none diff_ddaly_high_v_none;
run;

***Additional we can spend taking into account DALYs averted using $500 threshold;
proc means n mean p50 p5 p95 lclm uclm;
var dalys_avert_x_CET_low_v_none dalys_avert_x_CET_high_v_none ;
run;

***Max we can spend for a SW prog to be CE; ***DID NOT USE THIS METHOD, INSTEAD USED THE GRAPH METHOD;
proc means n mean p50 p5 p95 lclm uclm;
var maxcost_low_v_none maxcost_high_v_none;run;



proc means n mean p5 p95;var
cost_daly_averted_high_v_none19_
cost_daly_averted_high_v_none10_
cost_daly_averted_high_v_none15_
cost_daly_averted_high_v_none20_
cost_daly_averted_high_v_none25_
cost_daly_averted_high_v_none30_
cost_daly_averted_high_v_none35_
cost_daly_averted_high_v_none40_
cost_daly_averted_high_v_none45_
cost_daly_averted_high_v_none50_
cost_daly_averted_high_v_none55_
cost_daly_averted_high_v_none60_
;run;

***Figure 1;*max cost is when the diff in netdalys crosses 0;
**For the graphs, multiply by -1 to get DALYs averted rather than difference;

proc means n mean p5 p95;var
d_netdalys500_sw10_high_v_none  d_netdalys500_sw15_high_v_none  d_netdalys500_sw20_high_v_none
d_netdalys500_sw25_high_v_none  d_netdalys500_sw30_high_v_none  d_netdalys500_sw35_high_v_none
d_netdalys500_sw40_high_v_none  d_netdalys500_sw45_high_v_none  d_netdalys500_sw50_high_v_none
d_netdalys500_sw55_high_v_none  d_netdalys500_sw60_high_v_none	d_netdalys500_sw65_high_v_none 
d_netdalys500_sw70_high_v_none	d_netdalys500_sw75_high_v_none  d_netdalys500_sw80_high_v_none

d_netdalys300_sw10_high_v_none  d_netdalys300_sw15_high_v_none  d_netdalys300_sw20_high_v_none
d_netdalys300_sw25_high_v_none  d_netdalys300_sw30_high_v_none  d_netdalys300_sw35_high_v_none
d_netdalys300_sw40_high_v_none  d_netdalys300_sw45_high_v_none  d_netdalys300_sw50_high_v_none
d_netdalys300_sw55_high_v_none  d_netdalys300_sw60_high_v_none	d_netdalys300_sw65_high_v_none 
d_netdalys300_sw70_high_v_none	d_netdalys300_sw75_high_v_none  d_netdalys300_sw80_high_v_none

d_netdalys100_sw10_high_v_none  d_netdalys100_sw15_high_v_none  d_netdalys100_sw20_high_v_none
d_netdalys100_sw25_high_v_none  d_netdalys100_sw30_high_v_none  d_netdalys100_sw35_high_v_none
d_netdalys100_sw40_high_v_none  d_netdalys100_sw45_high_v_none  d_netdalys100_sw50_high_v_none
d_netdalys100_sw55_high_v_none  d_netdalys100_sw60_high_v_none	d_netdalys100_sw65_high_v_none 
d_netdalys100_sw70_high_v_none	d_netdalys100_sw75_high_v_none  d_netdalys100_sw80_high_v_none
;
run;

proc means n mean p5 p95;var
d_netdalys500_sw10_low_v_none  d_netdalys500_sw15_low_v_none  d_netdalys500_sw20_low_v_none
d_netdalys500_sw25_low_v_none  d_netdalys500_sw30_low_v_none  d_netdalys500_sw35_low_v_none
d_netdalys500_sw40_low_v_none  d_netdalys500_sw45_low_v_none  d_netdalys500_sw50_low_v_none
d_netdalys500_sw55_low_v_none  d_netdalys500_sw60_low_v_none  d_netdalys500_sw65_low_v_none 
d_netdalys500_sw70_low_v_none	d_netdalys500_sw75_low_v_none  d_netdalys500_sw80_low_v_none

d_netdalys300_sw10_low_v_none  d_netdalys300_sw15_low_v_none  d_netdalys300_sw20_low_v_none
d_netdalys300_sw25_low_v_none  d_netdalys300_sw30_low_v_none  d_netdalys300_sw35_low_v_none
d_netdalys300_sw40_low_v_none  d_netdalys300_sw45_low_v_none  d_netdalys300_sw50_low_v_none
d_netdalys300_sw55_low_v_none  d_netdalys300_sw60_low_v_none	d_netdalys300_sw65_low_v_none 
d_netdalys300_sw70_low_v_none	d_netdalys300_sw75_low_v_none  d_netdalys300_sw80_low_v_none

d_netdalys100_sw10_low_v_none  d_netdalys100_sw15_low_v_none  d_netdalys100_sw20_low_v_none
d_netdalys100_sw25_low_v_none  d_netdalys100_sw30_low_v_none  d_netdalys100_sw35_low_v_none
d_netdalys100_sw40_low_v_none  d_netdalys100_sw45_low_v_none  d_netdalys100_sw50_low_v_none
d_netdalys100_sw55_low_v_none  d_netdalys100_sw60_low_v_none	d_netdalys100_sw65_low_v_none 
d_netdalys100_sw70_low_v_none	d_netdalys100_sw75_low_v_none  d_netdalys100_sw80_low_v_none
;
run;

***This gives the max cost of the SW program with uncertainty ranges;
proc means mean p5 p95 lclm uclm ;var max_cost_sw_program_low max_cost_sw_program_high max_cost_sw_program_low_per_sw max_cost_sw_program_high_per_sw;run;

proc means mean p5 p95 lclm uclm ;
var max_cost_sw_program_low max_cost_sw_program_high max_cost_sw_program_low_per_sw max_cost_sw_program_high_per_sw;
where incidence=1;run;
proc means mean p5 p95 lclm uclm ;
var max_cost_sw_program_low max_cost_sw_program_high max_cost_sw_program_low_per_sw max_cost_sw_program_high_per_sw;
where incidence=2;run;
proc means mean p5 p95 lclm uclm ;
var max_cost_sw_program_low max_cost_sw_program_high max_cost_sw_program_low_per_sw max_cost_sw_program_high_per_sw;
where incidence=3;run;
proc means mean p5 p95 lclm uclm ;
var max_cost_sw_program_low max_cost_sw_program_high max_cost_sw_program_low_per_sw max_cost_sw_program_high_per_sw;
where incidence=4;run;
proc means mean p5 p95 lclm uclm ;
var max_cost_sw_program_low max_cost_sw_program_high max_cost_sw_program_low_per_sw max_cost_sw_program_high_per_sw;
where incidence=5;run;


***This should be very similar to above;
***multiply by -1 and record last positive value;
proc means n mean p5 p95;var
d_netdalys500_sw10_low_v_none  d_netdalys500_sw15_low_v_none  d_netdalys500_sw20_low_v_none
d_netdalys500_sw25_low_v_none  d_netdalys500_sw30_low_v_none  d_netdalys500_sw35_low_v_none
d_netdalys500_sw40_low_v_none  d_netdalys500_sw45_low_v_none  d_netdalys500_sw50_low_v_none
d_netdalys500_sw55_low_v_none  d_netdalys500_sw60_low_v_none;;where incidence=1;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_low_v_none  d_netdalys500_sw15_low_v_none  d_netdalys500_sw20_low_v_none
d_netdalys500_sw25_low_v_none  d_netdalys500_sw30_low_v_none  d_netdalys500_sw35_low_v_none
d_netdalys500_sw40_low_v_none  d_netdalys500_sw45_low_v_none  d_netdalys500_sw50_low_v_none
d_netdalys500_sw55_low_v_none  d_netdalys500_sw60_low_v_none;;where incidence=2;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_low_v_none  d_netdalys500_sw15_low_v_none  d_netdalys500_sw20_low_v_none
d_netdalys500_sw25_low_v_none  d_netdalys500_sw30_low_v_none  d_netdalys500_sw35_low_v_none
d_netdalys500_sw40_low_v_none  d_netdalys500_sw45_low_v_none  d_netdalys500_sw50_low_v_none
d_netdalys500_sw55_low_v_none  d_netdalys500_sw60_low_v_none;;where incidence=3;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_low_v_none  d_netdalys500_sw15_low_v_none  d_netdalys500_sw20_low_v_none
d_netdalys500_sw25_low_v_none  d_netdalys500_sw30_low_v_none  d_netdalys500_sw35_low_v_none
d_netdalys500_sw40_low_v_none  d_netdalys500_sw45_low_v_none  d_netdalys500_sw50_low_v_none
d_netdalys500_sw55_low_v_none  d_netdalys500_sw60_low_v_none;;where incidence=4 ;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_low_v_none  d_netdalys500_sw15_low_v_none  d_netdalys500_sw20_low_v_none
d_netdalys500_sw25_low_v_none  d_netdalys500_sw30_low_v_none  d_netdalys500_sw35_low_v_none
d_netdalys500_sw40_low_v_none  d_netdalys500_sw45_low_v_none  d_netdalys500_sw50_low_v_none
d_netdalys500_sw55_low_v_none  d_netdalys500_sw60_low_v_none;;where incidence=5;run;


proc means n mean p5 p95;var
d_netdalys500_sw10_high_v_none  d_netdalys500_sw15_high_v_none  d_netdalys500_sw20_high_v_none
d_netdalys500_sw25_high_v_none  d_netdalys500_sw30_high_v_none  d_netdalys500_sw35_high_v_none
d_netdalys500_sw40_high_v_none  d_netdalys500_sw45_high_v_none  d_netdalys500_sw50_high_v_none
d_netdalys500_sw55_high_v_none  d_netdalys500_sw60_high_v_none;;where incidence=1;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_high_v_none  d_netdalys500_sw15_high_v_none  d_netdalys500_sw20_high_v_none
d_netdalys500_sw25_high_v_none  d_netdalys500_sw30_high_v_none  d_netdalys500_sw35_high_v_none
d_netdalys500_sw40_high_v_none  d_netdalys500_sw45_high_v_none  d_netdalys500_sw50_high_v_none
d_netdalys500_sw55_high_v_none  d_netdalys500_sw60_high_v_none;;where incidence=2;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_high_v_none  d_netdalys500_sw15_high_v_none  d_netdalys500_sw20_high_v_none
d_netdalys500_sw25_high_v_none  d_netdalys500_sw30_high_v_none  d_netdalys500_sw35_high_v_none
d_netdalys500_sw40_high_v_none  d_netdalys500_sw45_high_v_none  d_netdalys500_sw50_high_v_none
d_netdalys500_sw55_high_v_none  d_netdalys500_sw60_high_v_none;;where incidence=3;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_high_v_none  d_netdalys500_sw15_high_v_none  d_netdalys500_sw20_high_v_none
d_netdalys500_sw25_high_v_none  d_netdalys500_sw30_high_v_none  d_netdalys500_sw35_high_v_none
d_netdalys500_sw40_high_v_none  d_netdalys500_sw45_high_v_none  d_netdalys500_sw50_high_v_none
d_netdalys500_sw55_high_v_none  d_netdalys500_sw60_high_v_none;;where incidence=4 ;run;
proc means n mean p5 p95;var
d_netdalys500_sw10_high_v_none  d_netdalys500_sw15_high_v_none  d_netdalys500_sw20_high_v_none
d_netdalys500_sw25_high_v_none  d_netdalys500_sw30_high_v_none  d_netdalys500_sw35_high_v_none
d_netdalys500_sw40_high_v_none  d_netdalys500_sw45_high_v_none  d_netdalys500_sw50_high_v_none
d_netdalys500_sw55_high_v_none  d_netdalys500_sw60_high_v_none	d_netdalys500_sw65_high_v_none  
d_netdalys500_sw70_high_v_none;;where incidence=5;run;




proc means n mean p50 p5 p95 lclm uclm;var dcost_23_24_1 dcost_23_24_2 dcost_23_24_3;run;
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


***20 year time horizon sens analyses;
proc means mean p5 p95 lclm uclm ;var max_cost_sw_program_lo_20 max_cost_sw_program_hi_20
max_cost_sw_program_hi_p_sw_20 max_cost_sw_program_lo_p_sw_20

d_netdalys500_sw10_hi_v_none_20  d_netdalys500_sw15_hi_v_none_20  d_netdalys500_sw20_hi_v_none_20
d_netdalys500_sw25_hi_v_none_20  d_netdalys500_sw30_hi_v_none_20  d_netdalys500_sw35_hi_v_none_20
d_netdalys500_sw40_hi_v_none_20  d_netdalys500_sw45_hi_v_none_20  d_netdalys500_sw50_hi_v_none_20
d_netdalys500_sw55_hi_v_none_20  d_netdalys500_sw60_hi_v_none_20	d_netdalys500_sw65_hi_v_none_20 
d_netdalys500_sw70_hi_v_none_20	d_netdalys500_sw75_hi_v_none_20  d_netdalys500_sw80_hi_v_none_20

d_netdalys500_sw10_lo_v_none_20  d_netdalys500_sw15_lo_v_none_20  d_netdalys500_sw20_lo_v_none_20
d_netdalys500_sw25_lo_v_none_20  d_netdalys500_sw30_lo_v_none_20  d_netdalys500_sw35_lo_v_none_20
d_netdalys500_sw40_lo_v_none_20  d_netdalys500_sw45_lo_v_none_20  d_netdalys500_sw50_lo_v_none_20
d_netdalys500_sw55_lo_v_none_20  d_netdalys500_sw60_lo_v_none_20	d_netdalys500_sw65_lo_v_none_20 
d_netdalys500_sw70_lo_v_none_20	d_netdalys500_sw75_lo_v_none_20  d_netdalys500_sw80_lo_v_none_20;
run;

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



proc means n mean p50 p5 p95 lclm uclm;var netdalys_no_swprog netdalys_swprog_high diff_netdalys_swprog_high maxcost_swprog_high ;run;

proc univariate;var maxcost_swprog_high;run;



***Predictors of CE scenarios;
data costs_1;
set costs;

*incidence;
if 0  le incidence1549_22 le 0.20 then incid_cat3=1;
if 0.20 lt incidence1549_22 le 0.50 then incid_cat3=2;
if 0.50 lt incidence1549_22 then incid_cat3=3;

*prop diag;
if 0.00 le p_diag_22 le 0.89 then p_diag=1;
if 0.89 lt p_diag_22 le 0.92 then p_diag=2;
if 0.92 lt p_diag_22 le 1 then p_diag=3;

*on ART of those diag;
if 0.00 lt p_onart_diag_22 le 0.95 then artcov=1;
if 0.95 lt p_onart_diag_22 le 0.97 then artcov=2;
if 0.97 lt p_onart_diag_22 le 1 then artcov=3;


*On ART with VL<1000;
if 0.00 le p_onart_vl1000_22 le 0.90 then onart_vl1000=1;
if 0.90 lt p_onart_vl1000_22 le 0.95 then onart_vl1000=2;
if 0.95 lt p_onart_vl1000_22 le 1.00 then onart_vl1000=3;


*incidence_SW;
if 0  le incidence_sw_22 le 4 then incid_sw_cat3=1;
if 4 lt incidence_sw_22 le 10 then incid_sw_cat3=2;
if 10 lt incidence_sw_22 then incid_sw_cat3=3;

*prop diag_sw_SW;
if 0.00 le p_diag_sw_22 le 0.89 then p_diag_sw=1;
if 0.89 lt p_diag_sw_22 le 0.93 then p_diag_sw=2;
if 0.93 lt p_diag_sw_22 le 1 then p_diag_sw=3;

*on ART of those diag_sw;
if 0.00 le p_onart_diag_sw_22 le 0.85 then artcov_sw=1;
if 0.85 lt p_onart_diag_sw_22 le 0.93 then artcov_sw=2;
if 0.93 lt p_onart_diag_sw_22 le 1 then artcov_sw=3;

*On ART with VL<1000;
if 0.50 le p_onart_vl1000_sw_22 le 0.82 then onart_vl1000_sw=1;
if 0.82 lt p_onart_vl1000_sw_22 le 0.92 then onart_vl1000_sw=2;
if 0.92 lt p_onart_vl1000_sw_22 le 1.00 then onart_vl1000_sw=3;

***Early differences in outcomes between high and low impact programs;
d_p_sw_prog_vis_hi_low= (p_sw_prog_vis_22_27_3 - p_sw_prog_vis_22_27_2)*100; 
d_p_tested_past_year_sw_hi_low = (p_tested_past_year_sw_22_27_3-p_tested_past_year_sw_22_27_2)*100;
d_p_fsw_newp0_hi_low = (p_fsw_newp0__22_27_3 - p_fsw_newp0__22_27_2)*100;
d_prop_sw_onprep_hi_low = (prop_sw_onprep_22_27_3 - prop_sw_onprep_22_27_2)*100;
d_p_sti_sw_hi_low = (p_sti_sw_22_27_3 - p_sti_sw_22_27_2)*100;
d_p_diag_sw_hi_low = (p_diag_sw_22_27_3 - p_diag_sw_22_27_2)*100;
d_p_onart_diag_sw_hi_low = (p_onart_diag_sw_22_27_3 - p_onart_diag_sw_22_27_2)*100;
d_p_onart_vl1000_sw_hi_low = (p_onart_vl1000_sw_22_27_3 - p_onart_vl1000_sw_22_27_2)*100;

if d_p_sw_prog_vis_hi_low lt 20 then d_vis=1;
if 20 le d_p_sw_prog_vis_hi_low lt 30 then d_vis=2;
if 30 le d_p_sw_prog_vis_hi_low lt 50 then d_vis=3;
if d_p_sw_prog_vis_hi_low ge 50 then d_vis=4;

if d_p_tested_past_year_sw_hi_low lt 10 then d_tested=1;
if 10 le d_p_tested_past_year_sw_hi_low lt 20 then d_tested=2;
if d_p_tested_past_year_sw_hi_low ge 20 then d_tested=3;

if d_p_fsw_newp0_hi_low le 5 then d_newp=1;
if 5 lt d_p_fsw_newp0_hi_low le 10 then d_newp=2;
if d_p_fsw_newp0_hi_low gt 10 then d_newp=3;

if d_prop_sw_onprep_hi_low lt 0 then d_prep=1;
if 0 le d_prop_sw_onprep_hi_low lt 4 then d_prep=2;
if d_prop_sw_onprep_hi_low ge 4 then d_prep=3;

if d_p_sti_sw_hi_low lt -3 then d_sti=1;
if -3 le d_p_sti_sw_hi_low lt -1 then d_sti=2;
if d_p_sti_sw_hi_low ge -1 then d_sti=3;

if d_p_diag_sw_hi_low lt 2 then d_diag=1;
if 2 le d_p_diag_sw_hi_low lt 5 then d_diag=2;
if d_p_diag_sw_hi_low ge 5 then d_diag=3;

if d_p_onart_diag_sw_hi_low lt 2 then d_art=1;
if 2 le d_p_onart_diag_sw_hi_low lt 5 then d_art=2;
if d_p_onart_diag_sw_hi_low ge 5 then d_art=3;

if d_p_onart_vl1000_sw_hi_low lt 2 then d_vs=1;
if 2 le d_p_onart_vl1000_sw_hi_low lt 5 then d_vs=2;
if d_p_onart_vl1000_sw_hi_low ge 5 then d_vs=3;



***difference in parameters resulting in sceanrios being CE;
proc logistic desc;class d_vis (ref="1"); model  ce  = d_vis;run;
proc logistic desc;class d_tested (ref="1"); model  ce  = d_tested;run;
proc logistic desc;class d_newp (ref="1"); model  ce  = d_newp;run;
proc logistic desc;class d_prep (ref="1"); model  ce  = d_prep;run;
proc logistic desc;class d_sti (ref="1"); model  ce  = d_sti;run;
proc logistic desc;class d_diag (ref="1"); model  ce  = d_diag;run;
proc logistic desc;class d_art (ref="1"); model  ce  = d_art;run;
proc logistic desc;class d_vs (ref="1"); model  ce  = d_vs;run;


proc logistic desc; model  ce  = d_p_sw_prog_vis_hi_none d_p_fsw_newp0_hi_none d_p_sti_sw_hi_none
d_p_onart_diag_sw_hi_none d_p_onart_vl1000_sw_hi_none;run;

proc freq;table p_diag_sw_22;run;

Proc logistic desc;class incid_cat3 (ref="1") ;
model  ce  = incid_cat3;run;
Proc logistic desc;class p_diag (ref="1") ;
model  ce  =p_diag;run;
Proc logistic desc;class  artcov (ref="1") ;
model  ce  = artcov;run;
Proc logistic desc;class onart_vl1000 (ref="1") ;
model  ce  = onart_vl1000;run;


Proc logistic desc;class incid_sw_cat3 (ref="1") ;
model  ce  = incid_sw_cat3;run;
Proc logistic desc;class  p_diag_sw (ref="1") ;
model  ce  =p_diag_sw;run;
Proc logistic desc;class artcov_sw (ref="1") ;
model  ce  = artcov_sw;run;
Proc logistic desc;class  onart_vl1000_sw (ref="1") ;
model  ce  = onart_vl1000_sw;run;
Proc logistic desc;class  sw_higher_int (ref="2") ;
model  ce  = sw_higher_int;run;
Proc logistic desc;class  sw_higher_prob_loss_at_diag (ref="2") ;
model  ce  = sw_higher_prob_loss_at_diag;run;

proc corr spearman ;var incid_cat3 incid_sw_cat3;run;
proc corr spearman ;var p_diag  p_diag_sw;run;
proc corr spearman ;var artcov artcov_sw;run;
proc corr spearman ;var onart_vl1000 onart_vl1000_sw;run;


proc corr spearman ;var onart_vl1000 incid_sw_cat3;run;


Proc logistic desc;class incid_cat3 (ref="1") p_diag (ref="1") artcov (ref="1")  onart_vl1000 (ref="1")
p_diag_sw (ref="1") artcov_sw (ref="1") onart_vl1000_sw (ref="1");
model  ce  = incid_cat3 p_diag artcov onart_vl1000;run;


proc freq;table effect_sw_prog_newp   effect_sw_prog_6mtest   effect_sw_prog_int   effect_sw_prog_adh
 effect_sw_prog_lossdiag effect_sw_prog_prep_any  effect_sw_prog_pers_sti;run;

Proc logistic desc;class  effect_sw_prog_newp (ref="0.05") ;
model  ce  = effect_sw_prog_newp;run;
Proc logistic desc;class  effect_sw_prog_6mtest (ref="0.2") ;
model  ce  = effect_sw_prog_6mtest;run;
Proc logistic desc;class  effect_sw_prog_int (ref="0.1") ;
model  ce  = effect_sw_prog_int;run;
Proc logistic desc;class  effect_sw_prog_adh (ref="0.1") ;
model  ce  = effect_sw_prog_adh;run;
Proc logistic desc;class  effect_sw_prog_lossdiag (ref="0.3") ;
model  ce  = effect_sw_prog_lossdiag;run;
Proc logistic desc;class  effect_sw_prog_prep_any (ref="0.05") ;
model  ce  = effect_sw_prog_prep_any;run;
Proc logistic desc;class  effect_sw_prog_pers_sti (ref="0.1") ;
model  ce  = effect_sw_prog_pers_sti;run;


