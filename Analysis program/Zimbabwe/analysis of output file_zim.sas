

libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\FSW\Zim\";

data a; 
set a.wide_fsw_zim_17_04_24AMTc; 


***Within run differences;
d_sw_prog_vis = (p_sw_prog_vis_30_2 - p_sw_prog_vis_30_1)*100;
d_p_tested_past_year_sw = (p_tested_past_year_sw_30_2 - p_tested_past_year_sw_30_1)*100;
d_p_diag_sw = (p_diag_sw_30_2 - p_diag_sw_30_1)*100;
d_p_onart_diag_sw = (p_onart_diag_sw_30_2 - p_onart_diag_sw_30_1)*100;
d_p_onart_vl1000_sw = (p_onart_vl1000_sw_30_2 - p_onart_vl1000_sw_30_1)*100;
d_p_fsw_newp0 = (p_fsw_newp0__30_2 - p_fsw_newp0__30_1)*100;
d_prop_sw_onprep = (prop_sw_onprep_30_2 - prop_sw_onprep_30_1)*100;
d_p_sti_sw = (p_sti_sw_30_2 - p_sti_sw_30_1)*100;
d_incidence_sw = incidence_sw_30_2 - incidence_sw_30_1;
d_prevalence_sw = (prevalence_sw_30_2 - prevalence_sw_30_1)*100;
d_incidence1549 = incidence1549__30_2 - incidence1549__30_1;
d_prevalence1549 = (prevalence1549__30_2 - prevalence1549__30_1)*100;
d_p_diag = (p_diag_30_2 - p_diag_30_1)*100;
d_p_onart_diag = (p_onart_diag_30_2 - p_onart_diag_30_1)*100;
d_p_onart_vl1000 = (p_onart_vl1000__30_2 - p_onart_vl1000__30_1)*100;
run;

***table Ao - use either 2020 or 2023 estimates - whichever is closest to observed data;
proc means n p50 p5 p95;var n_hiv_23  n_onart_23
prevalence1549__23 	 prevalence1549w_23 	prevalence1549m_23 	 incidence1549__23 	incidence1549w_23 	incidence1549m_23
p_diag_23			 p_diag_w_23			p_diag_m_23 		 p_onart_diag_23	p_onart_diag_w_23	p_onart_diag_m_23
p_onart_vl1000__23	 p_onart_vl1000_w_23	p_onart_vl1000_m_23	 p_vl1000__23 		
p_vg1000__23 		 prevalence_vg1000__23

incidence_sw_23		p_fsw_newp0__23

prevalence1549__20 	 prevalence1549w_20 	prevalence1549m_20 	 incidence1549__20 	incidence1549w_20 	incidence1549m_20
p_diag_20			 p_diag_w_20			p_diag_m_20 		 p_onart_diag_20	p_onart_diag_w_20	p_onart_diag_m_20
p_onart_vl1000__20	 p_onart_vl1000_w_20	p_onart_vl1000_m_20	 p_vl1000__20 		
p_vg1000__20 		 prevalence_vg1000__20

incidence_sw_20		p_fsw_newp0__20

;run;



***table 2 - characteristics of FSW in 2024 (these are suffixed 23 but are actually 24);
proc means n p50 p5 p95 mean;var
n_sw_1549__23		prop_w_1549_sw_23 		prop_w_ever_sw_23		act_dur_sw_23 
p_sw_age1519__23	p_sw_age2024__23		p_sw_age2529__23 		p_sw_age3039__23 p_sw_age40pl__23  
p_age_deb_sw1519__23 p_age_deb_sw2029__23	p_age_deb_sw3039__23	p_age_deb_sw40pl__23
p_totdur_0to3__23  p_totdur_3to5__23     p_totdur_6to9__23  	p_totdur_10to19__23 
p_fsw_newp0__23 prop_sw_onprep_23
p_sti_sw_23
incidence_sw_23		prevalence_sw_23
p_diag_sw_23		p_onart_diag_sw_23		p_onart_vl1000_sw_23 p_sw_prog_vis_23;
run;


***table 3 - outputs in 2030 for Sisters and Sisters + Amethist;
proc means n mean p5 p95;var
/*Current SW program*/
p_sw_prog_vis_30_1  p_tested_past_year_sw_30_1
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549__30_1	prevalence1549__30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000__30_1 

/*AMETHIST*/
p_sw_prog_vis_30_2  p_tested_past_year_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2		p_fsw_newp0__30_2	prop_sw_onprep_30_2
p_sti_sw_30_2		incidence_sw_30_2	prevalence_sw_30_2
incidence1549__30_2	prevalence1549__30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000__30_2

;
run;


***Within run differences means and CIs;
proc means n mean lclm uclm;var 
d_sw_prog_vis	d_p_tested_past_year_sw 
d_p_diag_sw		d_p_onart_diag_sw	d_p_onart_vl1000_sw
d_p_fsw_newp0	d_prop_sw_onprep	d_p_sti_sw	d_incidence_sw		d_prevalence_sw
d_incidence1549	d_prevalence1549	d_p_diag	d_p_onart_diag   	d_p_onart_vl1000
;run;

***Within run differences medians and 90% ranges;
proc means n p50 p5 p95;var 
d_sw_prog_vis	d_p_tested_past_year_sw 
d_p_diag_sw		d_p_onart_diag_sw	d_p_onart_vl1000_sw
d_p_fsw_newp0	d_prop_sw_onprep	d_p_sti_sw	d_incidence_sw		d_prevalence_sw
d_incidence1549	d_prevalence1549	d_p_diag	d_p_onart_diag   	d_p_onart_vl1000
;run;



data costs;
set a;

if 0< incidence1549__23 <= 0.1 then incidence=1;
if 0.1< incidence1549__23 <=0.3 then incidence=2;
if 0.3< incidence1549__23 <= 0.5 then incidence=3;
if 0.5< incidence1549__23 <= 1 then incidence=4;
if 1< incidence1549__23 then incidence =5;


****Cost effectiveness;
/*
_1=Sisters
_2=Amethist
*/

*difference in costs;
diff_dcost = dcost_24_74_2 - dcost_24_74_1;
diff_artcost= dart_cost_y_24_74_2 - dart_cost_y_24_74_1;
diff_testcost = dtest_cost_24_74_2 - dtest_cost_24_74_1;
diff_testcost_sw = dtest_cost_sw_24_74_2 - dtest_cost_sw_24_74_1;

*difference in dalys (dalys averted);
diff_ddaly = ddaly_24_74_2 - ddaly_24_74_1;

***DALYs averted * CET - this gives max cost for SW prog to be CE
   (multiplied by -1 since we want to cost the DALYs averted rather than the difference which is negative);
dalys_avert_x_CET = (diff_ddaly * 0.0005)*-1;

***Max cost of a SW program - additional $m paid for averting DALYs + initial cost savings;
maxcost= (diff_dcost)*-1 +  dalys_avert_x_CET;

*net dalys using $500;
netdalys_sis =  ddaly_24_74_1 + (dcost_24_74_1)/0.0005;
netdalys_amt =  ddaly_24_74_2 + (dcost_24_74_2)/0.0005;*expect dalys to be lower here;

*net dalys averted;
diff_netdalys = netdalys_amt - netdalys_sis; *take absolute number;

*net monetary benefit (Dalys * cost-effectivenss threshold) + costs;
nmb_sis = (ddaly_24_74_1*0.0005) + dcost_24_74_1;
nmb_amt= (ddaly_24_74_2*0.0005) + dcost_24_74_2;
diff_nmb = nmb_amt - nmb_sis;

***max cost of SW prog;
maxcost_amt= diff_netdalys * 500;


***ICER based on actual costs of AMETHIST and Sisters;
diff_cost = dcost_24_74_2 - dcost_24_74_1;
ICER = (diff_cost/diff_ddaly)*1000000;

proc freq;table diff_cost;run;

proc means n mean lclm uclm;
var ICER;RUN;
proc means n mean lclm uclm;
var ICER;where diff_ddaly<0;RUN;

***Absolute costs and differences;
proc means n mean lclm uclm;
var dcost_24_74_1 dcost_24_74_2 diff_dcost
	dart_cost_y_24_74_1 dart_cost_y_24_74_2  diff_artcost
	dtest_cost_24_74_1 dtest_cost_24_74_2 diff_testcost 
	dtest_cost_sw_24_74_1 dtest_cost_sw_24_74_2 diff_testcost_sw;
;run;

***DALYs;
proc means n mean lclm uclm;
var	ddaly_24_74_1 ddaly_24_74_2 diff_ddaly;
run;

/****DID NOT USE THIS METHOD, INSTEAD USED THE GRAPH METHOD;

***Additional we can spend taking into account DALYs averted using $500 threshold;
proc means n 5 p95 lclm uclm;
var dalys_avert_x_CET ;
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


*/




data maxcosts;
set a;


*500 CET, Sisters;
netdalys500_sis=  ddaly_24_74_1 + (dcost_24_74_1)/0.0005;


*500 CET, AMETHIST;
netdalys500_amt10 =  ddaly_24_74_2 + (dcost_amt10__24_74_2)/0.0005;
netdalys500_amt15 =  ddaly_24_74_2 + (dcost_amt15__24_74_2)/0.0005;
netdalys500_amt20 =  ddaly_24_74_2 + (dcost_amt20__24_74_2)/0.0005;
netdalys500_amt25 =  ddaly_24_74_2 + (dcost_amt25__24_74_2)/0.0005;
netdalys500_amt30 =  ddaly_24_74_2 + (dcost_amt30__24_74_2)/0.0005;
netdalys500_amt35 =  ddaly_24_74_2 + (dcost_amt35__24_74_2)/0.0005;
netdalys500_amt40 =  ddaly_24_74_2 + (dcost_amt40__24_74_2)/0.0005;
netdalys500_amt45 =  ddaly_24_74_2 + (dcost_amt45__24_74_2)/0.0005;
netdalys500_amt50 =  ddaly_24_74_2 + (dcost_amt50__24_74_2)/0.0005;
netdalys500_amt55 =  ddaly_24_74_2 + (dcost_amt55__24_74_2)/0.0005;
netdalys500_amt60 =  ddaly_24_74_2 + (dcost_amt60__24_74_2)/0.0005;
netdalys500_amt65 =  ddaly_24_74_2 + (dcost_amt65__24_74_2)/0.0005;
netdalys500_amt70 =  ddaly_24_74_2 + (dcost_amt70__24_74_2)/0.0005;
netdalys500_amt75 =  ddaly_24_74_2 + (dcost_amt75__24_74_2)/0.0005;
netdalys500_amt80 =  ddaly_24_74_2 + (dcost_amt80__24_74_2)/0.0005;
netdalys500_amt85 =  ddaly_24_74_2 + (dcost_amt85__24_74_2)/0.0005;
netdalys500_amt90 =  ddaly_24_74_2 + (dcost_amt90__24_74_2)/0.0005;
netdalys500_amt95 =  ddaly_24_74_2 + (dcost_amt95__24_74_2)/0.0005;
netdalys500_amt100 =  ddaly_24_74_2 + (dcost_amt100__24_74_2)/0.0005;
netdalys500_amt105 =  ddaly_24_74_2 + (dcost_amt105__24_74_2)/0.0005;
netdalys500_amt110 =  ddaly_24_74_2 + (dcost_amt110__24_74_2)/0.0005;
netdalys500_amt115 =  ddaly_24_74_2 + (dcost_amt115__24_74_2)/0.0005;
netdalys500_amt120 =  ddaly_24_74_2 + (dcost_amt120__24_74_2)/0.0005;
netdalys500_amt125 =  ddaly_24_74_2 + (dcost_amt125__24_74_2)/0.0005;
netdalys500_amt130 =  ddaly_24_74_2 + (dcost_amt130__24_74_2)/0.0005;
netdalys500_amt135 =  ddaly_24_74_2 + (dcost_amt135__24_74_2)/0.0005;
netdalys500_amt140 =  ddaly_24_74_2 + (dcost_amt140__24_74_2)/0.0005;
netdalys500_amt145 =  ddaly_24_74_2 + (dcost_amt145__24_74_2)/0.0005;
netdalys500_amt150 =  ddaly_24_74_2 + (dcost_amt150__24_74_2)/0.0005;
netdalys500_amt155 =  ddaly_24_74_2 + (dcost_amt155__24_74_2)/0.0005;
netdalys500_amt160 =  ddaly_24_74_2 + (dcost_amt160__24_74_2)/0.0005;
netdalys500_amt165 =  ddaly_24_74_2 + (dcost_amt165__24_74_2)/0.0005;
netdalys500_amt170 =  ddaly_24_74_2 + (dcost_amt170__24_74_2)/0.0005;
netdalys500_amt175 =  ddaly_24_74_2 + (dcost_amt175__24_74_2)/0.0005;
netdalys500_amt180 =  ddaly_24_74_2 + (dcost_amt180__24_74_2)/0.0005;
netdalys500_amt185 =  ddaly_24_74_2 + (dcost_amt185__24_74_2)/0.0005;
netdalys500_amt190 =  ddaly_24_74_2 + (dcost_amt190__24_74_2)/0.0005;
netdalys500_amt195 =  ddaly_24_74_2 + (dcost_amt195__24_74_2)/0.0005;
netdalys500_amt200 =  ddaly_24_74_2 + (dcost_amt200__24_74_2)/0.0005;
netdalys500_amt205 =  ddaly_24_74_2 + (dcost_amt205__24_74_2)/0.0005;
netdalys500_amt210 =  ddaly_24_74_2 + (dcost_amt210__24_74_2)/0.0005;
netdalys500_amt215 =  ddaly_24_74_2 + (dcost_amt215__24_74_2)/0.0005;
netdalys500_amt220 =  ddaly_24_74_2 + (dcost_amt220__24_74_2)/0.0005;
netdalys500_amt225 =  ddaly_24_74_2 + (dcost_amt225__24_74_2)/0.0005;
netdalys500_amt230 =  ddaly_24_74_2 + (dcost_amt230__24_74_2)/0.0005;
netdalys500_amt235 =  ddaly_24_74_2 + (dcost_amt235__24_74_2)/0.0005;
netdalys500_amt240 =  ddaly_24_74_2 + (dcost_amt240__24_74_2)/0.0005;
netdalys500_amt245 =  ddaly_24_74_2 + (dcost_amt245__24_74_2)/0.0005;
netdalys500_amt250 =  ddaly_24_74_2 + (dcost_amt250__24_74_2)/0.0005;


***Difference in netdalys;
d_netdalys500_amt10 = netdalys500_amt10 - netdalys500_sis;
d_netdalys500_amt15 = netdalys500_amt15 - netdalys500_sis;
d_netdalys500_amt20 = netdalys500_amt20 - netdalys500_sis;
d_netdalys500_amt25 = netdalys500_amt25 - netdalys500_sis;
d_netdalys500_amt30 = netdalys500_amt30 - netdalys500_sis;
d_netdalys500_amt35 = netdalys500_amt35 - netdalys500_sis;
d_netdalys500_amt40 = netdalys500_amt40 - netdalys500_sis;
d_netdalys500_amt45 = netdalys500_amt45 - netdalys500_sis;
d_netdalys500_amt50 = netdalys500_amt50 - netdalys500_sis;
d_netdalys500_amt55 = netdalys500_amt55 - netdalys500_sis;
d_netdalys500_amt60 = netdalys500_amt60 - netdalys500_sis;
d_netdalys500_amt65 = netdalys500_amt65 - netdalys500_sis;
d_netdalys500_amt70 = netdalys500_amt70 - netdalys500_sis;
d_netdalys500_amt75 = netdalys500_amt75 - netdalys500_sis;
d_netdalys500_amt80 = netdalys500_amt80 - netdalys500_sis;
d_netdalys500_amt85 = netdalys500_amt85 - netdalys500_sis;
d_netdalys500_amt90 = netdalys500_amt90 - netdalys500_sis;
d_netdalys500_amt95 = netdalys500_amt95 - netdalys500_sis;
d_netdalys500_amt100 = netdalys500_amt100 - netdalys500_sis;
d_netdalys500_amt105 = netdalys500_amt105 - netdalys500_sis;
d_netdalys500_amt110 = netdalys500_amt110 - netdalys500_sis;
d_netdalys500_amt115 = netdalys500_amt115 - netdalys500_sis;
d_netdalys500_amt120 = netdalys500_amt120 - netdalys500_sis;
d_netdalys500_amt125 = netdalys500_amt125 - netdalys500_sis;
d_netdalys500_amt130 = netdalys500_amt130 - netdalys500_sis;
d_netdalys500_amt135 = netdalys500_amt135 - netdalys500_sis;
d_netdalys500_amt140 = netdalys500_amt140 - netdalys500_sis;
d_netdalys500_amt145 = netdalys500_amt145 - netdalys500_sis;
d_netdalys500_amt150 = netdalys500_amt150 - netdalys500_sis;
d_netdalys500_amt155 = netdalys500_amt155 - netdalys500_sis;
d_netdalys500_amt160 = netdalys500_amt160 - netdalys500_sis;
d_netdalys500_amt165 = netdalys500_amt165 - netdalys500_sis;
d_netdalys500_amt170 = netdalys500_amt170 - netdalys500_sis;
d_netdalys500_amt175 = netdalys500_amt175 - netdalys500_sis;
d_netdalys500_amt180 = netdalys500_amt180 - netdalys500_sis;
d_netdalys500_amt185 = netdalys500_amt185 - netdalys500_sis;
d_netdalys500_amt190 = netdalys500_amt190 - netdalys500_sis;
d_netdalys500_amt195 = netdalys500_amt195 - netdalys500_sis;
d_netdalys500_amt200 = netdalys500_amt200 - netdalys500_sis;
d_netdalys500_amt205 = netdalys500_amt205 - netdalys500_sis;
d_netdalys500_amt210 = netdalys500_amt210 - netdalys500_sis;
d_netdalys500_amt215 = netdalys500_amt215 - netdalys500_sis;
d_netdalys500_amt220 = netdalys500_amt220 - netdalys500_sis;
d_netdalys500_amt225 = netdalys500_amt225 - netdalys500_sis;
d_netdalys500_amt230 = netdalys500_amt230 - netdalys500_sis;
d_netdalys500_amt235 = netdalys500_amt235 - netdalys500_sis;
d_netdalys500_amt240 = netdalys500_amt240 - netdalys500_sis;
d_netdalys500_amt245 = netdalys500_amt245 - netdalys500_sis;
d_netdalys500_amt250 = netdalys500_amt250 - netdalys500_sis;

if  d_netdalys500_amt10 > 0 then do;max_cost_amt_program = 0;  goto xx;end;
if  d_netdalys500_amt15 > 0 then do;max_cost_amt_program = 10;  goto xx;end; 
if  d_netdalys500_amt20 > 0 then do;max_cost_amt_program = 15;  goto xx;end; 
if  d_netdalys500_amt25 > 0 then do;max_cost_amt_program = 20;  goto xx;end; 
if  d_netdalys500_amt30 > 0 then do;max_cost_amt_program = 25;  goto xx;end; 
if  d_netdalys500_amt35 > 0 then do;max_cost_amt_program = 30;  goto xx;end; 
if  d_netdalys500_amt40 > 0 then do;max_cost_amt_program = 35;  goto xx;end;
if  d_netdalys500_amt45 > 0 then do;max_cost_amt_program = 40;  goto xx;end; 
if  d_netdalys500_amt50 > 0 then do;max_cost_amt_program = 45;  goto xx;end; 
if  d_netdalys500_amt55 > 0 then do;max_cost_amt_program = 50;  goto xx;end; 
if  d_netdalys500_amt60 > 0 then do;max_cost_amt_program = 55;  goto xx;end; 
if  d_netdalys500_amt65 > 0 then do;max_cost_amt_program = 60;  goto xx;end; 
if  d_netdalys500_amt70 > 0 then do;max_cost_amt_program = 65;  goto xx;end;
if  d_netdalys500_amt75 > 0 then do;max_cost_amt_program = 70;  goto xx;end; 
if  d_netdalys500_amt80 > 0 then do;max_cost_amt_program = 75;  goto xx;end; 
if  d_netdalys500_amt85 > 0 then do;max_cost_amt_program = 80;  goto xx;end;
if  d_netdalys500_amt90 > 0 then do;max_cost_amt_program = 85;  goto xx;end; 
if  d_netdalys500_amt95 > 0 then do;max_cost_amt_program = 90;  goto xx;end; 
if  d_netdalys500_amt100 > 0 then do;max_cost_amt_program = 95;  goto xx;end; 
if  d_netdalys500_amt105 > 0 then do;max_cost_amt_program = 100;  goto xx;end; 
if  d_netdalys500_amt110 > 0 then do;max_cost_amt_program = 105;  goto xx;end; 
if  d_netdalys500_amt115 > 0 then do;max_cost_amt_program = 110;  goto xx;end;
if  d_netdalys500_amt120 > 0 then do;max_cost_amt_program = 115;  goto xx;end; 
if  d_netdalys500_amt125 > 0 then do;max_cost_amt_program = 120;  goto xx;end; 
if  d_netdalys500_amt130 > 0 then do;max_cost_amt_program = 125;  goto xx;end; 
if  d_netdalys500_amt135 > 0 then do;max_cost_amt_program = 130;  goto xx;end; 
if  d_netdalys500_amt140 > 0 then do;max_cost_amt_program = 135;  goto xx;end; 
if  d_netdalys500_amt145 > 0 then do;max_cost_amt_program = 140;  goto xx;end;
if  d_netdalys500_amt150 > 0 then do;max_cost_amt_program = 145;  goto xx;end; 
if  d_netdalys500_amt155 > 0 then do;max_cost_amt_program = 150;  goto xx;end; 
if  d_netdalys500_amt160 > 0 then do;max_cost_amt_program = 155;  goto xx;end;
if  d_netdalys500_amt165 > 0 then do;max_cost_amt_program = 160;  goto xx;end; 
if  d_netdalys500_amt170 > 0 then do;max_cost_amt_program = 165;  goto xx;end; 
if  d_netdalys500_amt175 > 0 then do;max_cost_amt_program = 170;  goto xx;end; 
if  d_netdalys500_amt180 > 0 then do;max_cost_amt_program = 175;  goto xx;end; 
if  d_netdalys500_amt185 > 0 then do;max_cost_amt_program = 180;  goto xx;end; 
if  d_netdalys500_amt190 > 0 then do;max_cost_amt_program = 185;  goto xx;end;
if  d_netdalys500_amt195 > 0 then do;max_cost_amt_program = 190;  goto xx;end; 
if  d_netdalys500_amt200 > 0 then do;max_cost_amt_program = 195;  goto xx;end; 
if  d_netdalys500_amt205 > 0 then do;max_cost_amt_program = 200;  goto xx;end; 
if  d_netdalys500_amt210 > 0 then do;max_cost_amt_program = 205;  goto xx;end; 
if  d_netdalys500_amt215 > 0 then do;max_cost_amt_program = 210;  goto xx;end;
if  d_netdalys500_amt220 > 0 then do;max_cost_amt_program = 215;  goto xx;end; 
if  d_netdalys500_amt225 > 0 then do;max_cost_amt_program = 220;  goto xx;end; 
if  d_netdalys500_amt230 > 0 then do;max_cost_amt_program = 225;  goto xx;end; 
if  d_netdalys500_amt235 > 0 then do;max_cost_amt_program = 230;  goto xx;end; 
if  d_netdalys500_amt240 > 0 then do;max_cost_amt_program = 235;  goto xx;end; 
if  d_netdalys500_amt245 > 0 then do;max_cost_amt_program = 240;  goto xx;end;
if  d_netdalys500_amt250 > 0 then do;max_cost_amt_program = 245;  goto xx;end; 
xx:

if max_cost_amt_program=. then max_cost_sw_program=350;

max_cost_amt_program_per_sw=max_cost_amt_program /n_sw_1549__23;

***Figure 1;*max cost is when the diff in netdalys crosses 0;
**For the graphs, multiply by -1 to get DALYs averted rather than difference;

proc means n mean p5 p95;var
d_netdalys500_amt10  d_netdalys500_amt15  d_netdalys500_amt20  d_netdalys500_amt25  d_netdalys500_amt30  d_netdalys500_amt35
d_netdalys500_amt40  d_netdalys500_amt45  d_netdalys500_amt50  d_netdalys500_amt55  d_netdalys500_amt60  d_netdalys500_amt65 
d_netdalys500_amt70	 d_netdalys500_amt75  d_netdalys500_amt80  d_netdalys500_amt85	d_netdalys500_amt90  d_netdalys500_amt95
d_netdalys500_amt100  d_netdalys500_amt105  d_netdalys500_amt110  d_netdalys500_amt115  d_netdalys500_amt120  d_netdalys500_amt125
d_netdalys500_amt130  d_netdalys500_amt135  d_netdalys500_amt140  d_netdalys500_amt145  d_netdalys500_amt150  d_netdalys500_amt155
d_netdalys500_amt160  d_netdalys500_amt165  d_netdalys500_amt170  d_netdalys500_amt175  d_netdalys500_amt180  d_netdalys500_amt185
d_netdalys500_amt190  d_netdalys500_amt195  d_netdalys500_amt200  d_netdalys500_amt205  d_netdalys500_amt210  d_netdalys500_amt215
d_netdalys500_amt225  d_netdalys500_amt230  d_netdalys500_amt235  d_netdalys500_amt240  d_netdalys500_amt245  d_netdalys500_amt250

;
run;
proc means mean p5 p95 lclm uclm ;var max_cost_amt_program;run;
