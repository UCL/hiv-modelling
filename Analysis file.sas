libname a "C:\Users\lovel\UCL Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\Genesis_Zim_PEP";


data a;
set a.wide_Zim_PEP_31_03_2026a;*original costs;
*set a.wide_Zim_PEP_31_03_2026a; *Collins costs;
proc means;var s_dcost_prep_oral_2m_26_76_3 dcost_prep_oral_26_76_3
s_cost_prep_vis_oral_2m_26_76_3 cost_prep_visit_oral_26_76_3;
;run;


data b;
set a;

/*
***Remember the options have automatically renumbered as a result of the create wide file macro;
1 = facility based, 10% coverage;
2 - community based, 20% coverage;
3 = pharmacy based, 30% coverage;

*/

***Difference in discounted new infections and deaths in 5, 20 and 50 years between selected options;

* Infections;

* 20 years;
d_n_new_inf_20y_2  = n_new_inf_26_46_1 - n_new_inf_26_46_2;
d_n_new_inf_20y_3  = n_new_inf_26_46_1 - n_new_inf_26_46_3;
d_n_new_inf_20y_4  = n_new_inf_26_46_1 - n_new_inf_26_46_4;
d_n_new_inf_20y_5  = n_new_inf_26_46_1 - n_new_inf_26_46_5;
d_n_new_inf_20y_6  = n_new_inf_26_46_1 - n_new_inf_26_46_6;
d_n_new_inf_20y_7  = n_new_inf_26_46_1 - n_new_inf_26_46_7;


* 50 years;
d_n_new_inf_50y_2  = n_new_inf_26_76_1 - n_new_inf_26_76_2;
d_n_new_inf_50y_3  = n_new_inf_26_76_1 - n_new_inf_26_76_3;
d_n_new_inf_50y_4  = n_new_inf_26_76_1 - n_new_inf_26_76_4;
d_n_new_inf_50y_5  = n_new_inf_26_76_1 - n_new_inf_26_76_5;
d_n_new_inf_50y_6  = n_new_inf_26_76_1 - n_new_inf_26_76_6;
d_n_new_inf_50y_7  = n_new_inf_26_76_1 - n_new_inf_26_76_7;

*Deaths;

* 20 years;
d_n_death_hivrel_20y_2  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_2;
d_n_death_hivrel_20y_3  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_3;
d_n_death_hivrel_20y_4  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_4;
d_n_death_hivrel_20y_5  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_5;
d_n_death_hivrel_20y_6  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_6;
d_n_death_hivrel_20y_7  = n_death_hivrel_26_46_1 - n_death_hivrel_26_46_7;


* 50 years;
d_n_death_hivrel_50y_2  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_2;
d_n_death_hivrel_50y_3  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_3;
d_n_death_hivrel_50y_4  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_4;
d_n_death_hivrel_50y_5  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_5;
d_n_death_hivrel_50y_6  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_6;
d_n_death_hivrel_50y_7  = n_death_hivrel_26_76_1 - n_death_hivrel_26_76_7;


*Difference in number of new infections over 20 and 50 years;
*Using output statement in order to merge the 3 year groups later);
proc means data=b  mean;var 
d_n_new_inf_20y_2		d_n_new_inf_20y_3		d_n_new_inf_20y_4		d_n_new_inf_20y_5	
d_n_new_inf_20y_6 		d_n_new_inf_20y_7		;
output out=means_new_inf_20y mean=;
run;
proc means data=b  mean;var 
d_n_new_inf_50y_2		d_n_new_inf_50y_3		d_n_new_inf_50y_4		d_n_new_inf_50y_5	
d_n_new_inf_50y_6		d_n_new_inf_50y_7 		;
output out=means_new_inf_50y mean=;
run;

proc means data=b  mean;var 
d_n_death_hivrel_20y_2	d_n_death_hivrel_20y_3		d_n_death_hivrel_20y_4		d_n_death_hivrel_20y_5	
d_n_death_hivrel_20y_6	d_n_death_hivrel_20y_7 	;
output out=means_death_hivrel_20y mean=;
run;
proc means data=b  mean;var 
d_n_death_hivrel_50y_2	d_n_death_hivrel_50y_3		d_n_death_hivrel_50y_4		d_n_death_hivrel_50y_5	
d_n_death_hivrel_50y_6	d_n_death_hivrel_50y_7 	;
output out=means_death_hivrel_50y mean=;
run;

**Need to transpose the outputs so they are excel ready;
proc transpose data=means_new_inf_20y out=t_newinf_20y(rename=(col1=mean_newinf_20y));run;
proc transpose data=means_new_inf_50y out=t_newinf_50y(rename=(col1=mean_newinf_50y));run;
proc transpose data=means_death_hivrel_20y out=t_death_hivrel_20y(rename=(col1=mean_death_hivrel_20y));run;
proc transpose data=means_death_hivrel_50y out=t_death_hivrel_50y(rename=(col1=mean_death_hivrel_50y));run;

**Use html so can copy and paste into Excel (could automate but this gives more flexibility);
ods html;
data means_final;
    merge t_newinf_20y(rename=(_NAME_=scenario))
          t_newinf_50y
		  t_death_hivrel_20y
		  t_death_hivrel_50y;
drop _name_;
run;

proc print data=means_final noobs;
run;


***COSTS AND DALYS;
data c;
set b;

if run in (900482892, 130668187) then delete;

PROC MEANS;VAR dcost_prep_oral_26_76_3 dcost_prep_oral_2M_26_76_3;RUN;
*50 years, assuming 2 months usage;
diff_dcost_50y_2 = dcost_2m_26_76_2 - dcost_2m_26_76_1;
diff_dcost_50y_3 = dcost_2m_26_76_3 - dcost_2m_26_76_1;
diff_dcost_50y_4 = dcost_2m_26_76_4 - dcost_2m_26_76_1;
diff_dcost_50y_5 = dcost_2m_26_76_5 - dcost_2m_26_76_1;
diff_dcost_50y_6 = dcost_2m_26_76_6 - dcost_2m_26_76_1;
diff_dcost_50y_7 = dcost_2m_26_76_7 - dcost_2m_26_76_1;


*50 years prep costs;
diff_dcost_prep_oral_50y_2 = dcost_prep_oral_26_76_2 - dcost_prep_oral_26_76_1;
diff_dcost_prep_oral_50y_3 = dcost_prep_oral_26_76_3 - dcost_prep_oral_26_76_1;
diff_dcost_prep_oral_50y_4 = dcost_prep_oral_26_76_4 - dcost_prep_oral_26_76_1;
diff_dcost_prep_oral_50y_5 = dcost_prep_oral_26_76_5 - dcost_prep_oral_26_76_1;
diff_dcost_prep_oral_50y_6 = dcost_prep_oral_26_76_6 - dcost_prep_oral_26_76_1;
diff_dcost_prep_oral_50y_7 = dcost_prep_oral_26_76_7 - dcost_prep_oral_26_76_1;

diff_s_dcost_prep_oral_2m_50y_2 = s_dcost_prep_oral_2m_26_76_2 - s_dcost_prep_oral_2m_26_76_1;
diff_s_dcost_prep_oral_2m_50y_3 = s_dcost_prep_oral_2m_26_76_3 - s_dcost_prep_oral_2m_26_76_1;
diff_s_dcost_prep_oral_2m_50y_4 = s_dcost_prep_oral_2m_26_76_4 - s_dcost_prep_oral_2m_26_76_1;
diff_s_dcost_prep_oral_2m_50y_5 = s_dcost_prep_oral_2m_26_76_5 - s_dcost_prep_oral_2m_26_76_1;
diff_s_dcost_prep_oral_2m_50y_6 = s_dcost_prep_oral_2m_26_76_6 - s_dcost_prep_oral_2m_26_76_1;
diff_s_dcost_prep_oral_2m_50y_7 = s_dcost_prep_oral_2m_26_76_7 - s_dcost_prep_oral_2m_26_76_1;


* 50 years;
diff_dnewinf_50y_2  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_2;
diff_dnewinf_50y_3  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_3;
diff_dnewinf_50y_4  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_4;
diff_dnewinf_50y_5  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_5;
diff_dnewinf_50y_6  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_6;
diff_dnewinf_50y_7  = d_n_new_inf_26_76_1 - d_n_new_inf_26_76_7;


*difference in discounted dalys (dalys averted);

*50 years;
diff_ddaly_50y_2  = ddaly_26_76_1 - ddaly_26_76_2;
diff_ddaly_50y_3  = ddaly_26_76_1 - ddaly_26_76_3;
diff_ddaly_50y_4  = ddaly_26_76_1 - ddaly_26_76_4;
diff_ddaly_50y_5  = ddaly_26_76_1 - ddaly_26_76_5;
diff_ddaly_50y_6  = ddaly_26_76_1 - ddaly_26_76_6;
diff_ddaly_50y_7  = ddaly_26_76_1 - ddaly_26_76_7;

*net dalys averted;

*50 years;
netdalys_50y_1 =  ddaly_26_76_1 + (dcost_2m_26_76_1)/0.0003;
netdalys_50y_2 =  ddaly_26_76_2 + (dcost_2m_26_76_2)/0.0003;*expect dalys to be lower here;
netdalys_50y_3 =  ddaly_26_76_3 + (dcost_2m_26_76_3)/0.0003;
netdalys_50y_4 =  ddaly_26_76_4 + (dcost_2m_26_76_4)/0.0003;
netdalys_50y_5 =  ddaly_26_76_5 + (dcost_2m_26_76_5)/0.0003;
netdalys_50y_6 =  ddaly_26_76_6 + (dcost_2m_26_76_6)/0.0003;
netdalys_50y_7 =  ddaly_26_76_7 + (dcost_2m_26_76_7)/0.0003;


*net dalys averted;
diff_netdalys_50y_2 = netdalys_50y_2 - netdalys_50y_1; *take absolute number;
diff_netdalys_50y_3 = netdalys_50y_3 - netdalys_50y_1;
diff_netdalys_50y_4 = netdalys_50y_4 - netdalys_50y_1;
diff_netdalys_50y_5 = netdalys_50y_5 - netdalys_50y_1;
diff_netdalys_50y_6 = netdalys_50y_6 - netdalys_50y_1;
diff_netdalys_50y_7 = netdalys_50y_7 - netdalys_50y_1;



proc means data=c  mean;var 
diff_dcost_50y_2 		diff_dcost_50y_3		diff_dcost_50y_4		diff_dcost_50y_5	
diff_dcost_50y_6		diff_dcost_50y_7 		;
output out=means_costs_50y mean=;
run;

proc means data=c  mean;var 
diff_ddaly_50y_2	diff_ddaly_50y_3		diff_ddaly_50y_4		diff_ddaly_50y_5	
diff_ddaly_50y_6	diff_ddaly_50y_7 		;
output out=means_dalys_50y mean=;
run;


proc means data=c  mean;var 
diff_netdalys_50y_2		diff_netdalys_50y_3		diff_netdalys_50y_4		diff_netdalys_50y_5	
diff_netdalys_50y_6		diff_netdalys_50y_7 	;
output out=means_diff_netdalys_50y mean=;
run;

***MANUALLY CALCULATE ICER;
proc transpose data=means_costs_50y out=t_costs_50y(rename=(col1=mean_costs_50y));run;
proc transpose data=means_dalys_50y out=t_dalys_50y(rename=(col1=mean_dalys_50y));run;
proc transpose data=means_diff_netdalys_50y out=t_diff_netdalys_50y(rename=(col1=mean_diff_netdalys_50y));run;


**Use html so can copy and paste into Excel (could automate but this gives more flexibility);
ods html;
data means_costs_dalys;
    merge t_costs_50y (rename=(_NAME_=scenario))
		  t_dalys_50y
		  t_diff_netdalys_50y;
drop _name_;
run;

proc print data=means_costs_dalys noobs;
run;

proc freq data=c;table diff_ddaly_50y_3;run;

proc means data=c  mean;var 
diff_dnewinf_50y_2		diff_dnewinf_50y_3		diff_dnewinf_50y_4		diff_dnewinf_50y_5	
diff_dnewinf_50y_6 		;
output out=means_dnewinf_50y mean=;
run;

proc means data=c  mean;var 
cost_inf_avtd_50y_2		cost_inf_avtd_50y_3		cost_inf_avtd_50y_4		cost_inf_avtd_50y_5	
cost_inf_avtd_50y_6 		;
output out=means_inf_avt_50y mean=;
run;



proc transpose data=means_dnewinf_20y out=t_dnewinf_20y(rename=(col1=mean_dnewinf_20y));run;
proc transpose data=means_dnewinf_50y out=t_dnewinf_50y(rename=(col1=mean_dnewinf_50y));run;
/*proc transpose data=means_inf_avt_20y out=t_inf_avt_20y(rename=(col1=mean_inf_avt_20y));run;
proc transpose data=means_inf_avt_50y out=t_inf_avt_50y(rename=(col1=mean_inf_avt_50y));run;
*/
ods html;
data means_inf_avtd;
    merge t_dnewinf_20y(rename=(_NAME_=scenario))

		  t_dnewinf_50y;
drop _name_;
run;

proc print data=means_inf_avtd noobs;
run;

ods html;

***budget impact;
data budget;
set a;

***Need to do this for 20 years. The macro below should work;
/*
diff_cost_26y_2  = cost_26_2  - cost_26_1;
diff_cost_26y_3  = cost_26_3  - cost_26_1;
diff_cost_26y_4  = cost_26_4  - cost_26_1;
diff_cost_26y_5  = cost_26_5  - cost_26_1;
diff_cost_26y_6  = cost_26_6  - cost_26_1;
diff_cost_26y_7  = cost_26_7  - cost_26_1;
diff_cost_26y_8  = cost_26_8  - cost_26_1;
diff_cost_26y_9  = cost_26_9  - cost_26_1;
diff_cost_26y_10 = cost_26_10 - cost_26_1;
diff_cost_26y_11 = cost_26_11 - cost_26_1;
diff_cost_26y_12 = cost_26_12 - cost_26_1;
diff_cost_26y_13 = cost_26_13 - cost_26_1;
diff_cost_26y_14 = cost_26_14 - cost_26_1;
diff_cost_26y_15 = cost_26_15 - cost_26_1;
diff_cost_26y_16 = cost_26_16 - cost_26_1;
diff_cost_26y_17 = cost_26_17 - cost_26_1;
diff_cost_26y_18 = cost_26_18 - cost_26_1;
diff_cost_26y_19 = cost_26_19 - cost_26_1;
diff_cost_26y_20 = cost_26_20 - cost_26_1;
*/


%macro diff_cost(start_y=26, end_y=46, start_i=2, end_i=20);

%do y = &start_y %to &end_y;
  %do i = &start_i %to &end_i;
    diff_cost_&y.y_&i = cost_&y._&i - cost_&y._1;
  %end;
%end;

%mend diff_cost;

***calls the macro;
%diff_cost(start_y=26, end_y=46, start_i=2, end_i=6);

proc means data=budget mean;var 
cost_26_1 cost_27_1 cost_28_1 cost_29_1 cost_30_1 cost_31_1 cost_32_1 cost_33_1 cost_34_1 cost_35_1 cost_36_1 cost_37_1 
cost_38_1 cost_39_1 cost_40_1 cost_41_1 cost_42_1 cost_43_1 cost_44_1 cost_45_1 cost_46_1 ;
output out=sc1 mean=;run;
data sc1; set sc1; group=1;
rename 
cost_26_1 = cost_26		cost_27_1 = cost_27		cost_28_1 = cost_28		cost_29_1 = cost_29		cost_30_1 = cost_30
cost_31_1 = cost_31		cost_32_1 = cost_32		cost_33_1 = cost_33		cost_34_1 = cost_34		cost_35_1 = cost_35
cost_36_1 = cost_36		cost_37_1 = cost_37		cost_38_1 = cost_38		cost_39_1 = cost_39		cost_40_1 = cost_40
cost_41_1 = cost_41		cost_42_1 = cost_42		cost_43_1 = cost_43		cost_44_1 = cost_44		cost_45_1 = cost_45
cost_46_1 = cost_46;
run;

proc means data=budget mean;var 
cost_26_2 cost_26_2 cost_27_2 cost_28_2 cost_29_2 cost_30_2 cost_31_2 cost_32_2 cost_33_2 cost_34_2 cost_35_2 cost_36_2 cost_37_2 
cost_38_2 cost_39_2 cost_40_2 cost_41_2 cost_42_2 cost_43_2 cost_44_2 cost_45_2 cost_46_2;
output out=sc2 mean=;run;
data sc2; set sc2; group=2;
rename 
cost_26_2 = cost_26		cost_27_2 = cost_27		cost_28_2 = cost_28		cost_29_2 = cost_29		cost_30_2 = cost_30
cost_31_2 = cost_31		cost_32_2 = cost_32		cost_33_2 = cost_33		cost_34_2 = cost_34		cost_35_2 = cost_35
cost_36_2 = cost_36		cost_37_2 = cost_37		cost_38_2 = cost_38		cost_39_2 = cost_39		cost_40_2 = cost_40
cost_41_2 = cost_41		cost_42_2 = cost_42		cost_43_2 = cost_43		cost_44_2 = cost_44		cost_45_2 = cost_45
cost_46_2 = cost_46;
run;

proc means data=budget mean;var 
cost_26_3 cost_27_3 cost_28_3 cost_29_3 cost_30_3 cost_31_3 cost_32_3 cost_33_3 cost_34_3 cost_35_3 cost_36_3 cost_37_3
cost_38_3 cost_39_3 cost_40_3 cost_41_3 cost_42_3 cost_43_3 cost_44_3 cost_45_3 cost_46_3;
output out=sc3 mean=;run;
data sc3; set sc3; group=3;
rename 
cost_26_3 = cost_26		cost_27_3 = cost_27		cost_28_3 = cost_28		cost_29_3 = cost_29		cost_30_3 = cost_30
cost_31_3 = cost_31		cost_32_3 = cost_32		cost_33_3 = cost_33		cost_34_3 = cost_34		cost_35_3 = cost_35
cost_36_3 = cost_36		cost_37_3 = cost_37		cost_38_3 = cost_38		cost_39_3 = cost_39		cost_40_3 = cost_40
cost_41_3 = cost_41		cost_42_3 = cost_42		cost_43_3 = cost_43		cost_44_3 = cost_44		cost_45_3 = cost_45
cost_46_3 = cost_46;
run;

proc means data=budget mean;var 
cost_26_4 cost_27_4 cost_28_4 cost_29_4 cost_30_4 cost_31_4 cost_32_4 cost_33_4 cost_34_4 cost_35_4 cost_36_4 cost_37_4
cost_38_4 cost_39_4 cost_40_4 cost_41_4 cost_42_4 cost_43_4 cost_44_4 cost_45_4 cost_46_4;
output out=sc4 mean=;run;
data sc4; set sc4; group=4;
rename 
cost_26_4 = cost_26		cost_27_4 = cost_27		cost_28_4 = cost_28		cost_29_4 = cost_29		cost_30_4 = cost_30
cost_31_4 = cost_31		cost_32_4 = cost_32		cost_33_4 = cost_33		cost_34_4 = cost_34		cost_35_4 = cost_35
cost_36_4 = cost_36		cost_37_4 = cost_37		cost_38_4 = cost_38		cost_39_4 = cost_39		cost_40_4 = cost_40
cost_41_4 = cost_41		cost_42_4 = cost_42		cost_43_4 = cost_43		cost_44_4 = cost_44		cost_45_4 = cost_45
cost_46_4 = cost_46;
run;

proc means data=budget mean;var 
cost_26_5 cost_27_5 cost_28_5 cost_29_5 cost_30_5 cost_31_5 cost_32_5 cost_33_5 cost_34_5 cost_35_5 cost_36_5 cost_37_5 
cost_38_5 cost_39_5 cost_40_5 cost_41_5 cost_42_5 cost_43_5 cost_44_5 cost_45_5 cost_46_5;
output out=sc5 mean=;run;
data sc5; set sc5; group=5;
rename 
cost_26_5 = cost_26		cost_27_5 = cost_27		cost_28_5 = cost_28		cost_29_5 = cost_29		cost_30_5 = cost_30
cost_31_5 = cost_31		cost_32_5 = cost_32		cost_33_5 = cost_33		cost_34_5 = cost_34		cost_35_5 = cost_35
cost_36_5 = cost_36		cost_37_5 = cost_37		cost_38_5 = cost_38		cost_39_5 = cost_39		cost_40_5 = cost_40
cost_41_5 = cost_41		cost_42_5 = cost_42		cost_43_5 = cost_43		cost_44_5 = cost_44		cost_45_5 = cost_45
cost_46_5 = cost_46;
run;

proc means data=budget mean;var 
cost_26_6 cost_27_6 cost_28_6 cost_29_6 cost_30_6 cost_31_6 cost_32_6 cost_33_6 cost_34_6 cost_35_6 cost_36_6 cost_37_6 
cost_38_6 cost_39_6 cost_40_6 cost_41_6 cost_42_6 cost_43_6 cost_44_6 cost_45_6 cost_46_6;
output out=sc6 mean=;run;
data sc6; set sc6; group=6;
rename 
cost_26_6 = cost_26		cost_27_6 = cost_27		cost_28_6 = cost_28		cost_29_6 = cost_29		cost_30_6 = cost_30
cost_31_6 = cost_31		cost_32_6 = cost_32		cost_33_6 = cost_33		cost_34_6 = cost_34		cost_35_6 = cost_35
cost_36_6 = cost_36		cost_37_6 = cost_37		cost_38_6 = cost_38		cost_39_6 = cost_39		cost_40_6 = cost_40
cost_41_6 = cost_41		cost_42_6 = cost_42		cost_43_6 = cost_43		cost_44_6 = cost_44		cost_45_6 = cost_45
cost_46_6 = cost_46;
run;


data final_means;
set sc1 sc2 sc3 sc4 sc5 sc6 ;
run;
proc print;var group cost_26-cost_46;
run;

proc means data=budget mean;var
diff_cost_26y_2-diff_cost_26y_6
diff_cost_27y_2-diff_cost_27y_6
diff_cost_28y_2-diff_cost_28y_6
diff_cost_29y_2-diff_cost_29y_6
diff_cost_30y_2-diff_cost_30y_6
diff_cost_31y_2-diff_cost_31y_6
diff_cost_32y_2-diff_cost_32y_6
diff_cost_33y_2-diff_cost_33y_6
diff_cost_34y_2-diff_cost_34y_6
diff_cost_35y_2-diff_cost_35y_6
diff_cost_36y_2-diff_cost_36y_6
diff_cost_37y_2-diff_cost_37y_6
diff_cost_38y_2-diff_cost_38y_6
diff_cost_39y_2-diff_cost_39y_6
diff_cost_40y_2-diff_cost_40y_6
diff_cost_41y_2-diff_cost_41y_6
diff_cost_42y_2-diff_cost_42y_6
diff_cost_43y_2-diff_cost_43y_6
diff_cost_44y_2-diff_cost_44y_6
diff_cost_45y_2-diff_cost_45y_6
diff_cost_46y_2-diff_cost_46y_6;
output out=diff_costs mean=;run;

proc transpose data=diff_costs out=diff_costs_long name=varname;run;

data diff_costs_long_1;
  set diff_costs_long;

  /* splits the variable name using _ and y as delimiters i.e. diff_cost_26y_2 ? diff cost 26 2. It takes the 3rd component which is 26*/
  year = input(scan(varname, 3, '_y'), 8.);
  group  = input(scan(varname, 4, '_y'), 8.);
run;

proc sort data=diff_costs_long_1; by group;run;

proc transpose data=diff_costs_long_1 out=final_diff_costs(drop=_name_)
               prefix=y_;
  by group;
  id year;
  var col1;
run;
/*
**REMOVE 2 AND 19;
data final;
set final_diff_costs;
if group in (2,19) then delete;
run;
*/
proc print;var group y_26-y_46;run;
