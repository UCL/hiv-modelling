libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\fsw\";


data a; 
set a.wide_fsw_16_08_22 ;
if incidence1549_22 <0.1 then delete;
run;

data b;
set a;

***table 1;
proc means n p50 p5 p95 min max;var
prevalence1549_22 	 prevalence1549w_22 	prevalence1549m_22 	incidence1549_22 	incidence1549w_22 	incidence1549m_22
p_diag_22	 		 p_onart_diag_22   		p_onart_vl1000_22	p_vg1000_22 		p_vl1000_22 		prevalence_vg1000_22
incidence_sw_22		p_fsw_newp0__22
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
p_diag_sw_22		p_onart_diag_sw_22		p_onart_vl1000_sw_22;
run;

proc freq;table sw_art_disadv;run;

***table 3 - characteristics by disadvantage in 2030;

proc means n p50 p5 p95;var
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549_30_1	prevalence1549_30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000_30_1

p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2		p_fsw_newp0__30_2	prop_sw_onprep_30_2
p_sti_sw_30_2		incidence_sw_30_2	prevalence_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2
;where sw_art_disadv=0;
run;

proc means n p50 p5 p95;var
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1		p_fsw_newp0__30_1	prop_sw_onprep_30_1
p_sti_sw_30_1		incidence_sw_30_1	prevalence_sw_30_1
incidence1549_30_1	prevalence1549_30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000_30_1

p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2		p_fsw_newp0__30_2	prop_sw_onprep_30_2
p_sti_sw_30_2		incidence_sw_30_2	prevalence_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2
;where sw_art_disadv=1;
run;


*First part of table 4 - impact of SW program irrespective of disadvantage (below this is split into specific aspects);

proc means n p50 p5 p95;var
p_fsw_newp0__30_1	prop_sw_onprep_30_1		p_sti_sw_30_1	incidence_sw_30_1	prevalence_sw_30_1
p_diag_sw_30_1		p_onart_diag_sw_30_1	p_onart_vl1000_sw_30_1
incidence1549_30_1	prevalence1549_30_1		p_diag_30_1	  p_onart_diag_30_1   p_onart_vl1000_30_1

p_fsw_newp0__30_2	prop_sw_onprep_30_2		p_sti_sw_30_2	incidence_sw_30_2	prevalence_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2;
run;







**Impact of specific aspects of a SW program;

**Assuming SW only improves PrEP;
data prep;
set a.wide_fsw_16_08_22_prep;
if incidence1549_22 <0.1 then delete;
run;

data prep1;
set prep;
proc means n p50 p5 p95;var
p_fsw_newp0__30_2	prop_sw_onprep_30_2		p_sti_sw_30_2	incidence_sw_30_2	prevalence_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2;
run;

**Assuming SW only improves condomless sex;
data newp;
set a.wide_fsw_16_08_22_newp;
if incidence1549_22 <0.1 then delete;
run;

data newp1;
set newp;
proc means n p50 p5 p95;var
p_fsw_newp0__30_2	prop_sw_onprep_30_2		p_sti_sw_30_2	incidence_sw_30_2	prevalence_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2;
run;

**Assuming SW only improves ART retention;
data art;
set a.wide_fsw_16_08_22_art;
if incidence1549_22 <0.1 then delete;
run;

data art1;
set art;
proc means n p50 p5 p95;var
p_fsw_newp0__30_2	prop_sw_onprep_30_2		p_sti_sw_30_2	incidence_sw_30_2	prevalence_sw_30_2
p_diag_sw_30_2		p_onart_diag_sw_30_2	p_onart_vl1000_sw_30_2
incidence1549_30_2	prevalence1549_30_2		p_diag_30_2	  p_onart_diag_30_2   p_onart_vl1000_30_2;
run;
