*** THIS FILE READS IN THE WIDE FILE (CREATED FROM RUNNING 'CREATE_WIDE_FILE_ZIM' PROGRAM) AND IS USED TO ANALYSE 
OUTPUTS;

***SPECIFY LIBRARY 'A' WHICH IS THE FILEPATH WHERE THE WIDE FILE IS STORED;
***REPLACE FILEPATH BELOW WITH LOCAL FILEPATH;

libname a "C:\Users\Loveleen\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\PACE2\";


***LOOK AT STRATFYING BY SW_MATRIX to see IF THAT LOWERS PREVALENCE;


data a; 
set a.wide_pace_08_09_26; 
run;

***Compare SW and ESW in 2026;

proc means n p50 mean p5 p95;var
n_sw_1549__25		prop_w_1549_sw_25 		prop_w_ever_sw_25		act_dur_sw_25 
p_sw_age1519__25	p_sw_age2024__25		p_sw_age2529__25 		p_sw_age3039__25 p_sw_age40pl__25  
p_age_deb_sw1519__25 p_age_deb_sw2029__25	p_age_deb_sw3039__25	p_age_deb_sw40pl__25
p_totdur_0to3_sw_25  p_totdur_3to5_sw_25     p_totdur_6to9_sw_25  	p_totdur_10to19_sw_25 
p_fsw_newp0__25 prop_sw_onprep_25
p_sti_sw_25			
incidence_sw_25		prevalence_sw_25		p_tested_past_year_sw_25
p_diag_sw_25		p_onart_diag_sw_25		p_onart_vl1000_sw_25 p_sw_prog_vis_25

n_esw_1549__25			prop_w_1549_esw_25 		prop_w_ever_esw_25		act_dur_esw_25 
p_esw_age1519__25		p_esw_age2024__25		p_esw_age2529__25 		p_esw_age3039__25 p_esw_age40pl__25  
p_age_deb_esw1519__25 	p_age_deb_esw2029__25	p_age_deb_esw3039__25	p_age_deb_esw40pl__25
p_totdur_0to3_esw_25  	p_totdur_3to5_esw_25    p_totdur_6to9_esw_25  	p_totdur_10to19_esw_25 
p_esw_newp0__25 		prop_esw_onprep_25
p_sti_esw_25
incidence_esw_25		prevalence_esw_25		p_tested_past_year_esw_25
p_diag_esw_25			p_onart_diag_esw_25		p_onart_vl1000_esw_25 	p_esw_prog_vis_25

p_hard_reach_sw_00 p_hard_reach_esw_00
p_hard_reach_sw_05 p_hard_reach_esw_05
p_hard_reach_sw_10 p_hard_reach_esw_10
p_hard_reach_sw_15 p_hard_reach_esw_15
p_hard_reach_sw_20 p_hard_reach_esw_20;

;run;



proc means n p50 mean p5 p95;var p_diag_esw_00  p_diag_esw_05  p_diag_esw_10  p_diag_esw_15
p_diag_sw_00  p_diag_sw_05  p_diag_sw_10  p_diag_sw_15;run;


proc means n p50 mean p5 p95;var
p_tested_sw_sympt_25 p_tested_esw_sympt_25 p_tested_sw_anc_25 p_tested_esw_anc_25 

n_tested_sw_anc_25 n_tested_esw_anc_25

p_tested_sw_anclabpd_25 p_tested_esw_anclabpd_25;run;

***Table A0 - use either 2020 or 2023 estimates - whichever is closest to observed data;
proc means n p50 mean p5 p95;var n_hiv_23  n_onart_23
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

***Table A0 - use either 2020 or 2023 estimates - whichever is closest to observed data;
proc means n p50 mean p5 p95;var n_hiv_23  n_onart_23
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



***Table 2 - characteristics of FSW in 2024;
proc means n p50 mean p5 p95;var
n_sw_1549__23		prop_w_1549_sw_23 		prop_w_ever_sw_23		act_dur_sw_23 
p_sw_age1519__23	p_sw_age2024__23		p_sw_age2529__23 		p_sw_age3039__23 p_sw_age40pl__23  
p_age_deb_sw1519__23 p_age_deb_sw2029__23	p_age_deb_sw3039__23	p_age_deb_sw40pl__23
p_totdur_0to3__23  p_totdur_3to5__23     p_totdur_6to9__23  	p_totdur_10to19__23 
p_fsw_newp0__23 prop_sw_onprep_23
p_sti_sw_23
incidence_sw_23		prevalence_sw_23
p_diag_sw_23		p_onart_diag_sw_23		p_onart_vl1000_sw_23 p_sw_prog_vis_23;
run;


***Table 3 - outputs in 2030 for Sisters and Sisters + Amethist;
proc means n p50 mean p5 p95;var
/*Current SW program*/
p_sw_prog_vis_30_1  p_tested_past_year_sw_30_1	p_tested_swprog_30_1
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549__30_1	prevalence1549__30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000__30_1 

/*AMETHIST*/
p_sw_prog_vis_30_2  p_tested_past_year_sw_30_2 p_tested_swprog_30_2
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



***Costs other than ART and testing (other programming costs);

oth_prog_costs_1 = dcost_24_74_1 - dart_cost_y_24_74_1 - dtest_cost_24_74_1;
oth_prog_costs_2 = dcost_24_74_2 - dart_cost_y_24_74_2 - dtest_cost_24_74_2;
diff_oth_prog_costs = oth_prog_costs_2 - oth_prog_costs_1;

***total prep costs;
total_prep_1 = dcost_prep_oral_24_74_1 + dcost_prep_inj_24_74_1 + dcost_prep_visit_oral_24_74_1 + dcost_prep_visit_inj_24_74_1;
total_prep_2 = dcost_prep_oral_24_74_2 + dcost_prep_inj_24_74_2 + dcost_prep_visit_oral_24_74_2 + dcost_prep_visit_inj_24_74_2;
total_prep_3 = dcost_prep_oral_24_74_3 + dcost_prep_inj_24_74_3 + dcost_prep_visit_oral_24_74_3 + dcost_prep_visit_inj_24_74_3;


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

***Checking to see when AMETHIST becomes CE (AS = AMETHIST SISTERS);
*5 years; 
diff_dcost5yAS = dcost_24_29_2 - dcost_24_29_1;
diff_ddaly5yAS = ddaly_24_29_2 - ddaly_24_29_1;
*10 years; 
diff_dcost10yAS = dcost_24_34_2 - dcost_24_34_1;
diff_ddaly10yAS = ddaly_24_34_2 - ddaly_24_34_1;
*15 years; 
diff_dcost15yAS = dcost_24_39_2 - dcost_24_39_1;
diff_ddaly15yAS = ddaly_24_39_2 - ddaly_24_39_1;
*20 years; 
diff_dcost20yAS = dcost_24_44_2 - dcost_24_44_1;
diff_ddaly20yAS = ddaly_24_44_2 - ddaly_24_44_1;
*25 years; 
diff_dcost25yAS = dcost_24_49_2 - dcost_24_49_1;
diff_ddaly25yAS = ddaly_24_49_2 - ddaly_24_49_1;
*30 years; 
diff_dcost30yAS = dcost_24_54_2 - dcost_24_54_1;
diff_ddaly30yAS = ddaly_24_54_2 - ddaly_24_54_1;
*35 years; 
diff_dcost35yAS = dcost_24_59_2 - dcost_24_59_1;
diff_ddaly35yAS = ddaly_24_59_2 - ddaly_24_59_1;
*40 years; 
diff_dcost40yAS = dcost_24_64_2 - dcost_24_64_1;
diff_ddaly40yAS = ddaly_24_64_2 - ddaly_24_64_1;
*45 years; 
diff_dcost45yAS = dcost_24_69_2 - dcost_24_69_1;
diff_ddaly45yAS = ddaly_24_69_2 - ddaly_24_69_1;
*50 years; 
diff_dcost50yAS = dcost_24_74_2 - dcost_24_74_1;
diff_ddaly50yAS = ddaly_24_74_2 - ddaly_24_74_1;

***Do same for Sisters vs discontinuation (SD=SISTERS DISCONTINUATION);

*5 years; 
diff_dcost5ySD = dcost_24_29_1 - dcost_24_29_3;
diff_ddaly5ySD = ddaly_24_29_1 - ddaly_24_29_3;
*10 years; 
diff_dcost10ySD = dcost_24_34_1 - dcost_24_34_3;
diff_ddaly10ySD = ddaly_24_34_1 - ddaly_24_34_3;
*15 years; 
diff_dcost15ySD = dcost_24_39_1 - dcost_24_39_3;
diff_ddaly15ySD = ddaly_24_39_1 - ddaly_24_39_3;
*20 years; 
diff_dcost20ySD = dcost_24_44_1 - dcost_24_44_3;
diff_ddaly20ySD = ddaly_24_44_1 - ddaly_24_44_3;
*25 years; 
diff_dcost25ySD = dcost_24_49_1 - dcost_24_49_3;
diff_ddaly25ySD = ddaly_24_49_1 - ddaly_24_49_3;
*30 years; 
diff_dcost30ySD = dcost_24_54_1 - dcost_24_54_3;
diff_ddaly30ySD = ddaly_24_54_1 - ddaly_24_54_3;
*35 years; 
diff_dcost35ySD = dcost_24_59_1 - dcost_24_59_3;
diff_ddaly35ySD = ddaly_24_59_1 - ddaly_24_59_3;
*40 years; 
diff_dcost40ySD = dcost_24_64_1 - dcost_24_64_3;
diff_ddaly40ySD = ddaly_24_64_1 - ddaly_24_64_3;
*45 years; 
diff_dcost45ySD = dcost_24_69_1 - dcost_24_69_3;
diff_ddaly45ySD = ddaly_24_69_1 - ddaly_24_69_3;
*50 years; 
diff_dcost50ySD = dcost_24_74_1 - dcost_24_74_3;
diff_ddaly50ySD = ddaly_24_74_1 - ddaly_24_74_3;


***Breakdown of costs - group clinical costs together;
d_clin_costs_1 = 	dadc_cost_24_74_1 + dnon_tb_who3_cost_24_74_1 + dcot_cost_24_74_1 + dtb_cost_24_74_1 + 
					d_t_adh_int_cost_24_74_1 + dswitchline_cost_24_74_1;
d_clin_costs_2 = 	dadc_cost_24_74_2 + dnon_tb_who3_cost_24_74_2 + dcot_cost_24_74_2 + dtb_cost_24_74_2 + 
					d_t_adh_int_cost_24_74_2 + dswitchline_cost_24_74_2; 
d_clin_costs_3 = 	dadc_cost_24_74_3 + dnon_tb_who3_cost_24_74_3 + dcot_cost_24_74_3 + dtb_cost_24_74_3 + 
					d_t_adh_int_cost_24_74_3 + dswitchline_cost_24_74_3;


***********************************;

***Further analyses in response to reviewer;

***********************************;

***Combined treatment and prevention cost with SQ;
dart_prep_24_29_1 = dcost_prep_oral_24_29_1 + dcost_prep_inj_24_29_1 + dcost_prep_visit_oral_24_29_1 + dcost_prep_visit_inj_24_29_1 +
dart_cost_y_24_29_1 + dadc_cost_24_29_1 + dcd4_cost_24_29_1 + dvl_cost_24_29_1 + dvis_cost_24_29_1 + dres_cost_24_29_1 + d_t_adh_int_cost_24_29_1 +
dswitchline_cost_24_29_1; 

dart_prep_24_34_1 = dcost_prep_oral_24_34_1 + dcost_prep_inj_24_34_1 + dcost_prep_visit_oral_24_34_1 + dcost_prep_visit_inj_24_34_1 +
dart_cost_y_24_34_1 + dadc_cost_24_34_1 + dcd4_cost_24_34_1 + dvl_cost_24_34_1 + dvis_cost_24_34_1 + dres_cost_24_34_1 + d_t_adh_int_cost_24_34_1 +
dswitchline_cost_24_34_1; 

dart_prep_24_39_1 = dcost_prep_oral_24_39_1 + dcost_prep_inj_24_39_1 + dcost_prep_visit_oral_24_39_1 + dcost_prep_visit_inj_24_39_1 +
dart_cost_y_24_39_1 + dadc_cost_24_39_1 + dcd4_cost_24_39_1 + dvl_cost_24_39_1 + dvis_cost_24_39_1 + dres_cost_24_39_1 + d_t_adh_int_cost_24_39_1 +
dswitchline_cost_24_39_1; 

dart_prep_24_44_1 = dcost_prep_oral_24_44_1 + dcost_prep_inj_24_44_1 + dcost_prep_visit_oral_24_44_1 + dcost_prep_visit_inj_24_44_1 +
dart_cost_y_24_44_1 + dadc_cost_24_44_1 + dcd4_cost_24_44_1 + dvl_cost_24_44_1 + dvis_cost_24_44_1 + dres_cost_24_44_1 + d_t_adh_int_cost_24_44_1 +
dswitchline_cost_24_44_1; 

dart_prep_24_49_1 = dcost_prep_oral_24_49_1 + dcost_prep_inj_24_49_1 + dcost_prep_visit_oral_24_49_1 + dcost_prep_visit_inj_24_49_1 +
dart_cost_y_24_49_1 + dadc_cost_24_49_1 + dcd4_cost_24_49_1 + dvl_cost_24_49_1 + dvis_cost_24_49_1 + dres_cost_24_49_1 + d_t_adh_int_cost_24_49_1 +
dswitchline_cost_24_49_1; 

dart_prep_24_54_1 = dcost_prep_oral_24_54_1 + dcost_prep_inj_24_54_1 + dcost_prep_visit_oral_24_54_1 + dcost_prep_visit_inj_24_54_1 +
dart_cost_y_24_54_1 + dadc_cost_24_54_1 + dcd4_cost_24_54_1 + dvl_cost_24_54_1 + dvis_cost_24_54_1 + dres_cost_24_54_1 + d_t_adh_int_cost_24_54_1 +
dswitchline_cost_24_54_1; 

dart_prep_24_59_1 = dcost_prep_oral_24_59_1 + dcost_prep_inj_24_59_1 + dcost_prep_visit_oral_24_59_1 + dcost_prep_visit_inj_24_59_1 +
dart_cost_y_24_59_1 + dadc_cost_24_59_1 + dcd4_cost_24_59_1 + dvl_cost_24_59_1 + dvis_cost_24_59_1 + dres_cost_24_59_1 + d_t_adh_int_cost_24_59_1 +
dswitchline_cost_24_59_1; 

dart_prep_24_64_1 = dcost_prep_oral_24_64_1 + dcost_prep_inj_24_64_1 + dcost_prep_visit_oral_24_64_1 + dcost_prep_visit_inj_24_64_1 +
dart_cost_y_24_64_1 + dadc_cost_24_64_1 + dcd4_cost_24_64_1 + dvl_cost_24_64_1 + dvis_cost_24_64_1 + dres_cost_24_64_1 + d_t_adh_int_cost_24_64_1 +
dswitchline_cost_24_64_1; 


*Treatment cost with discontinuation;
dart_24_29_3 = 
dart_cost_y_24_29_3 + dadc_cost_24_29_3 + dcd4_cost_24_29_3 + dvl_cost_24_29_3 + dvis_cost_24_29_3 + dres_cost_24_29_3 + d_t_adh_int_cost_24_29_3 +
dswitchline_cost_24_29_3; 

dart_24_34_3 = 
dart_cost_y_24_34_3 + dadc_cost_24_34_3 + dcd4_cost_24_34_3 + dvl_cost_24_34_3 + dvis_cost_24_34_3 + dres_cost_24_34_3 + d_t_adh_int_cost_24_34_3 +
dswitchline_cost_24_34_3; 

dart_24_39_3 = 
dart_cost_y_24_39_3 + dadc_cost_24_39_3 + dcd4_cost_24_39_3 + dvl_cost_24_39_3 + dvis_cost_24_39_3 + dres_cost_24_39_3 + d_t_adh_int_cost_24_39_3 +
dswitchline_cost_24_39_3; 

dart_24_44_3 = 
dart_cost_y_24_44_3 + dadc_cost_24_44_3 + dcd4_cost_24_44_3 + dvl_cost_24_44_3 + dvis_cost_24_44_3 + dres_cost_24_44_3 + d_t_adh_int_cost_24_44_3 +
dswitchline_cost_24_44_3; 

dart_24_49_3 = 
dart_cost_y_24_49_3 + dadc_cost_24_49_3 + dcd4_cost_24_49_3 + dvl_cost_24_49_3 + dvis_cost_24_49_3 + dres_cost_24_49_3 + d_t_adh_int_cost_24_49_3 +
dswitchline_cost_24_49_3; 

dart_24_54_3 = 
dart_cost_y_24_54_3 + dadc_cost_24_54_3 + dcd4_cost_24_54_3 + dvl_cost_24_54_3 + dvis_cost_24_54_3 + dres_cost_24_54_3 + d_t_adh_int_cost_24_54_3 +
dswitchline_cost_24_54_3; 

dart_24_59_3 = 
dart_cost_y_24_59_3 + dadc_cost_24_59_3 + dcd4_cost_24_59_3 + dvl_cost_24_59_3 + dvis_cost_24_59_3 + dres_cost_24_59_3 + d_t_adh_int_cost_24_59_3 +
dswitchline_cost_24_59_3; 

dart_24_64_3 = 
dart_cost_y_24_64_3 + dadc_cost_24_64_3 + dcd4_cost_24_64_3 + dvl_cost_24_64_3 + dvis_cost_24_64_3 + dres_cost_24_64_3 + d_t_adh_int_cost_24_64_3 +
dswitchline_cost_24_64_3; 


proc means;var 		
dart_prep_24_29_1  dart_prep_24_34_1  dart_prep_24_39_1  dart_prep_24_44_1  dart_prep_24_49_1  dart_prep_24_54_1
dart_prep_24_59_1  dart_prep_24_64_1
dart_24_29_3  dart_24_34_3  dart_24_39_3  dart_24_44_3  dart_24_49_3  dart_24_54_3
dart_24_59_3  dart_24_64_3;run;




***Absolute costs and differences;
proc means n mean lclm uclm;
var dcost_24_74_1 dcost_24_74_2 diff_dcost
	dart_cost_y_24_74_1 dart_cost_y_24_74_2  diff_artcost
	dtest_cost_24_74_1 dtest_cost_24_74_2 diff_testcost 
	dtest_cost_sw_24_74_1 dtest_cost_sw_24_74_2 diff_testcost_sw
	oth_prog_costs_1 oth_prog_costs_2 diff_oth_prog_costs
;run;

***DALYs;
proc means n mean lclm uclm;
var	ddaly_24_74_1 ddaly_24_74_2 diff_ddaly;
run;

***Since DALYs are averted and costs are saved, no need to calculate an ICER;
proc means n mean lclm uclm;
var ICER;RUN;

proc means n mean lclm uclm;var
netdalys_sis netdalys_amt diff_netdalys;run;


***Identifying when AMETHIST becomes CE;
proc means n mean lclm uclm;
var	diff_dcost diff_ddaly diff_dcost5yAS diff_ddaly5yAS  diff_dcost10yAS diff_ddaly10yAS diff_dcost15yAS diff_ddaly15yAS
diff_dcost20yAS diff_ddaly20yAS diff_dcost25yAS diff_ddaly25yAS diff_dcost30yAS diff_ddaly30yAS diff_dcost35yAS diff_ddaly35yAS
diff_dcost40yAS diff_ddaly40yAS diff_dcost45yAS diff_ddaly45yAS diff_dcost50yAS diff_ddaly50yAS;
run;

**After 15y, costs are saved and DALYs averted. Check actual costs and DALYs to make sure this is correct;
proc means n mean lclm uclm;
var	dcost_24_39_2 dcost_24_39_1 ddaly_24_39_2 ddaly_24_39_1  diff_dcost15yAS diff_ddaly15yAS;
run;


***Identifying when Sisters becomes CE compared to discontinuation;
proc means n mean lclm uclm;
var	diff_dcost diff_ddaly diff_dcost5ySD diff_ddaly5ySD  diff_dcost10ySD diff_ddaly10ySD diff_dcost15ySD diff_ddaly15ySD
diff_dcost20ySD diff_ddaly20ySD diff_dcost25ySD diff_ddaly25ySD diff_dcost30ySD diff_ddaly30ySD diff_dcost35ySD diff_ddaly35ySD
diff_dcost40ySD diff_ddaly40ySD diff_dcost45ySD diff_ddaly45ySD diff_dcost50ySD diff_ddaly50ySD;
run;


***Breakdown of costs;
proc means n mean lclm uclm;var
dcost_24_74_1
dart_cost_y_24_74_1
d_clin_costs_1
dcd4_cost_24_74_1 
dvl_cost_24_74_1 
dvis_cost_24_74_1 
dres_cost_24_74_1 
dtest_cost_24_74_1 
dcost_drug_level_test_24_74_1 
dcost_circ_24_74_1 
dcost_condom_dn_24_74_1 
dcost_avail_self_test_24_74_1 
dcost_prep_visit_oral_24_74_1 
dcost_prep_oral_24_74_1 
dcost_prep_visit_inj_24_74_1
dcost_prep_inj_24_74_1 	
dcost_sisprog__24_74_1
total_prep_1

dcost_24_74_2
dart_cost_y_24_74_2
d_clin_costs_2
dcd4_cost_24_74_2 
dvl_cost_24_74_2 
dvis_cost_24_74_2 
dres_cost_24_74_2 
dtest_cost_24_74_2 
dcost_drug_level_test_24_74_2 
dcost_circ_24_74_2 
dcost_condom_dn_24_74_2 
dcost_avail_self_test_24_74_2 
dcost_prep_visit_oral_24_74_2 
dcost_prep_oral_24_74_2 
dcost_prep_visit_inj_24_74_2
dcost_prep_inj_24_74_2 	
dcost_amtprog__24_74_2
total_prep_2

dcost_24_74_3
dart_cost_y_24_74_3
d_clin_costs_3
dcd4_cost_24_74_3 
dvl_cost_24_74_3 
dvis_cost_24_74_3 
dres_cost_24_74_3 
dtest_cost_24_74_3 
dcost_drug_level_test_24_74_3 
dcost_circ_24_74_3 
dcost_condom_dn_24_74_3 
dcost_avail_self_test_24_74_3 
dcost_prep_visit_oral_24_74_3 
dcost_prep_oral_24_74_3 
dcost_prep_visit_inj_24_74_3
dcost_prep_inj_24_74_3 
total_prep_3
;
run;



***ANALYSING THE IMPACT OF FUNDING CUTS - OPTION 3;

data one;
set a;

***table 3 - outputs in 2030 for Sisters and Sisters + Amethist;
proc means n p50 mean p5 p95;var
/*Current SW program*/
p_sw_prog_vis_30_1  p_tested_past_year_sw_30_1	p_tested_swprog_30_1
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549__30_1	prevalence1549__30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000__30_1 

/*Discontinuation*/
p_sw_prog_vis_30_3  p_tested_past_year_sw_30_3 p_tested_swprog_30_3
p_diag_sw_30_3		p_onart_diag_sw_30_3	p_onart_vl1000_sw_30_3		p_fsw_newp0__30_3	prop_sw_onprep_30_3
p_sti_sw_30_3		incidence_sw_30_3	prevalence_sw_30_3
incidence1549__30_3	prevalence1549__30_3		p_diag_30_3	  p_onart_diag_30_3   p_onart_vl1000__30_3

;
run;

proc means n p50 mean p5 p95;var prop_sw_onprep_inj_30_1 prop_sw_onprep_oral_30_1;run;

data two;
set one;


****Cost effectiveness;
/*
_1=Sisters
_2=Amethist
_3=Discontinuation;
*/

*difference in costs KP-discont;
diff_dcost = dcost_24_74_1 - dcost_24_74_3;
diff_artcost= dart_cost_y_24_74_1 - dart_cost_y_24_74_3;
diff_testcost = dtest_cost_24_74_1 - dtest_cost_24_74_3;
diff_testcost_sw = dtest_cost_sw_24_74_1 - dtest_cost_sw_24_74_3;
diff_dcost_sisprog = dcost_sisprog__24_74_1-0;

*difference in dalys (dalys averted);
diff_ddaly = ddaly_24_74_1 - ddaly_24_74_3;

***DALYs averted * CET - this gives max cost for SW prog to be CE
   (multiplied by -1 since we want to cost the DALYs averted rather than the difference which is negative);
dalys_avert_x_CET = (diff_ddaly * 0.0005)*-1;

***Max cost of a SW program - additional $m paid for averting DALYs + initial cost savings;
maxcost= (diff_dcost)*-1 +  dalys_avert_x_CET;

*net dalys using $500;
netdalys_sis =  ddaly_24_74_1 + (dcost_24_74_1)/0.0005;
netdalys_discon =  ddaly_24_74_3 + (dcost_24_74_3)/0.0005;*expect dalys to be lower here;

*net dalys averted;
diff_netdalys = netdalys_sis - netdalys_discon; *take absolute number;

*net monetary benefit (Dalys * cost-effectivenss threshold) + costs;
nmb_sis = (ddaly_24_74_1*0.0005) + dcost_24_74_1;
nmb_discon= (ddaly_24_74_3*0.0005) + dcost_24_74_3;
diff_nmb = nmb_sis - nmb_discon;


diff_cost = dcost_24_74_1 - dcost_24_74_3;
ICER = (diff_cost/diff_ddaly)*1000000;



***Absolute costs and differences;
proc means n mean lclm uclm;
var dcost_24_74_1 dcost_24_74_3 diff_dcost
	dart_cost_y_24_74_1 dart_cost_y_24_74_3  diff_artcost
	dtest_cost_24_74_1 dtest_cost_24_74_3 diff_testcost 
	dtest_cost_sw_24_74_1 dtest_cost_sw_24_74_3 diff_testcost_sw
	dcost_sisprog__24_74_1 diff_dcost_sisprog;
;run;

***DALYs;
proc means n mean lclm uclm;
var	ddaly_24_74_1 ddaly_24_74_3 diff_ddaly;
run;

***Since DALYs are averted and costs are saved, no need to calculate an ICER;
proc means n mean lclm uclm;
var ICER;RUN;

proc means n mean lclm uclm;var
netdalys_sis netdalys_discon diff_netdalys;run;
