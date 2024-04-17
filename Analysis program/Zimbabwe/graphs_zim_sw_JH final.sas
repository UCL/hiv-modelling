
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;
* options user="/folders/myfolders/";

libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\FSW\Zim\";

***USED FOR SUNGAI'S CROI 2024 poster;

data a;
set a.fsw_zim_28feb24;  

*if option=1 then delete; ***first look at overall incidence according to baseline SW program (option=1= amesthist);

*if rate_engage_sw_program ge 0.15 then delete;

proc sort;by run;
proc freq;table cald option;run;

proc freq data=a;table cald;run;

data sf;
set a;

if cald=2023.5;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = (16665409 * 0.581) / s_alive; 
*Source for Zimbabwe population is https://population.un.org/dataportal/data/indicators/49/locations/716/start/1990/end/2023/line/linetimeplot;
*accessed 22/1/2024;
* 58.1% of Zim population in 2020 >= age 15. Source: https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=ZW accessed 6/9/2021;
keep run sf_2023;

proc sort; by run;run;

%let sf=sf_2023;

data a1; 
merge a sf;
by run ;
run;

data b;
set a1;

s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 


***general population;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);


* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549_;				prevalence1549_ = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);
* incidence1549_;				incidence1549_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);


***FSW;
* n_sw_1549;					n_sw_1549_ = s_sw_1549 * sf_2023;
* n_sw_1564;					n_sw_1564_ = s_sw_1564 * sf_2023;


* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw = s_sw_1564 / s_alive1564_w ;
* prop_w_1519_sw;				if s_ageg1519w gt 0 then  p_fsw1519_ = s_sw_1519 / s_ageg1519w;
* prop_w_2024_sw;				if s_ageg2024w gt 0 then  p_fsw2024_ = s_sw_2024 / s_ageg2024w;
* prop_w_2529_sw;				if s_ageg2529w gt 0 then  p_fsw2529_ = s_sw_2529 / s_ageg2529w;
* prop_w_3039_sw;				if s_ageg3034w gt 0 then  p_fsw3039_ = s_sw_3039 / (s_ageg3034w + s_ageg3539w);

* prop_w_ever_sw;				prop_w_ever_sw = s_ever_sw / s_alive1564_w ; 

**Of FSW, proportion in each age category;
								if s_sw_1564 gt 0 then do; 
* p_sw_age1519_;					p_sw_age1519_=s_sw_1519/s_sw_1564;
* p_sw_age2024_;					p_sw_age2024_=s_sw_2024/s_sw_1564;
* p_sw_age2529_;					p_sw_age2529_=s_sw_2529/s_sw_1564;
* p_sw_age3039_;					p_sw_age3039_=s_sw_3039/s_sw_1564;
* p_sw_age40+_;						p_sw_ageab40_=s_sw_ov40/s_sw_1564;

								end;


* p_age_deb_sw1519_;			p_age_deb_sw1519_ = s_age_deb_sw1519_ /s_sw_1564;
* p_age_deb_sw2024_;			p_age_deb_sw2024_ = s_age_deb_sw2024_ /s_sw_1564;
* p_age_deb_sw2529_;			p_age_deb_sw2529_ = s_age_deb_sw2529_ /s_sw_1564;
* p_age_deb_sw3039_;			p_age_deb_sw3039_ = s_age_deb_sw3039_ /s_sw_1564;

* sw_episodes;					sw_episodes = s_episodes_sw/s_ever_sw;
* p_sw_gt1ep;					p_sw_gt1ep   = s_sw_gt1ep     / s_ever_sw;

* duration of sw;				tot_dur_sw= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw= s_act_dur_sw/ s_sw_1564;

								if s_sw_1564 ne 0 then do;
								p_actdur_sw_0to3_   =s_actdur_sw_0to3/s_sw_1564;
								p_actdur_sw_3to5_   =s_actdur_sw_3to5/s_sw_1564;
								p_actdur_sw_6to9_   =s_actdur_sw_6to9/s_sw_1564;
								p_actdur_sw_10to19_ =s_actdur_sw_10to19/s_sw_1564;

								p_totdur_sw_0to3_   =s_totdur_sw_0to3/s_sw_1564;
								p_totdur_sw_3to5_   =s_totdur_sw_3to5/s_sw_1564;
								p_totdur_sw_6to9_   =s_totdur_sw_6to9/s_sw_1564;
								p_totdur_sw_10to19_ =s_totdur_sw_10to19/s_sw_1564;
								end;

* p_fsw_newp0;					if s_sw_1564>0 then p_fsw_newp0_ = s_sw_newp_cat1 /s_sw_1564;
* p_fsw_newp1to5;				if s_sw_1564>0 then p_fsw_newp1to5_ = s_sw_newp_cat2 /s_sw_1564;
* p_fsw_newp6to40;				if s_sw_1564>0 then p_fsw_newp6to40_ = s_sw_newp_cat3 /s_sw_1564;
* p_fsw_newp41to130;			if s_sw_1564>0 then p_fsw_newp41to130_ = s_sw_newp_cat4 /s_sw_1564;
* p_fsw_newpov130;				if s_sw_1564>0 then p_fsw_newpov130_ = s_sw_newp_cat5 /s_sw_1564;
* av_sw_newp;					if s_sw_1564 gt 0 then av_sw_newp = s_sw_newp/s_sw_1564;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw = s_sw_newp / s_w_newp ;

* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis = s_sw_program_visit / s_sw_1564 ;

* n_tested_sw;					n_tested_sw = s_tested_sw * sf_2023 * 4;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;
* prop_sw_onprep_prog; 			if (s_sw_1564 - s_hiv_sw) gt 0 and s_sw_program_visit gt 0 then prop_sw_onprep_prog = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;
* prop_sw_onprep_noprog; 		if (s_sw_1564 - s_hiv_sw) gt 0 and s_sw_program_visit = 0 then prop_sw_onprep_noprog = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;


* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* p_diag_sw_inprog;				if s_sw_hiv_inprog gt 0 then p_diag_sw_inprog	= s_diag_sw_inprog / s_sw_hiv_inprog; 

* prevalence_sw;				prevalence_sw = s_hiv_sw1549_ / s_sw_1549; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw =(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
* incidence_sw_inprog;			if (s_sw_inprog  - s_sw_hiv_inprog  + s_primary_sw_inprog) gt 0 then incidence_sw_inprog =(s_primary_sw_inprog * 4 * 100) / (s_sw_inprog  - s_sw_hiv_inprog  + s_primary_sw_inprog);
* incidence_sw_noprog;			if (s_sw_noprog  - s_sw_hiv_noprog  + s_primary_sw_noprog) gt 0 then incidence_sw_noprog =(s_primary_sw_noprog * 4 * 100) / (s_sw_noprog  - s_sw_hiv_noprog  + s_primary_sw_noprog);

***To smooth incidence lines, take averages across 4 periods;
lag1_inc_sw=lag(incidence_sw); lag2_inc_sw=lag2(incidence_sw); lag3_inc_sw=lag3(incidence_sw);
lag1_inc_sw_inprog=lag(incidence_sw_inprog); lag2_inc_sw_inprog=lag2(incidence_sw_inprog); lag3_inc_sw_inprog=lag3(incidence_sw_inprog);
lag1_inc_sw_noprog=lag(incidence_sw_noprog); lag2_inc_sw_noprog=lag2(incidence_sw_noprog); lag3_inc_sw_noprog=lag3(incidence_sw_noprog);

if cald=int(cald) then cald_yr=cald;

if cald_yr ne . then do;
mean_sw_inc =(incidence_sw + lag1_inc_sw + lag2_inc_sw + lag3_inc_sw)/4;
mean_sw_inc_inprog = (incidence_sw_inprog + lag1_inc_sw_inprog + lag2_inc_sw_inprog + lag3_inc_sw_inprog)/4;
mean_sw_inc_noprog = (incidence_sw_noprog + lag1_inc_sw_noprog + lag2_inc_sw_noprog + lag3_inc_sw_noprog)/4;
end;

* sti;							p_sti_sw = s_sti_sw/s_sw_1564;

run;



proc means p50;var incidence_sw;where cald in (2023, 2023.25, 2023.5, 2023.75) and sw_trans_matrix=3;run;

proc sort; by cald run ;run;

data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 302;
%let year_end = 2050.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data c;
set b;

%let var =  
n_sw_1564_  n_sw_1549_  prop_w_1564_sw  prop_w_1549_sw  prop_w_ever_sw  p_fsw1519_  p_fsw2024_  p_fsw2529_  p_fsw3039_
p_sw_age1519_  p_sw_age2024_  p_sw_age2529_  p_sw_age3039_ p_sw_ageab40_ p_age_deb_sw1519_  p_age_deb_sw2024_  p_age_deb_sw2529_  p_age_deb_sw3039_
sw_episodes  p_sw_gt1ep  tot_dur_sw  act_dur_sw
p_actdur_sw_0to3_  p_actdur_sw_3to5_  p_actdur_sw_6to9_  p_actdur_sw_10to19_
p_totdur_sw_0to3_  p_totdur_sw_3to5_  p_totdur_sw_6to9_  p_totdur_sw_10to19_
p_fsw_newp0_  av_sw_newp  p_newp_sw

p_sw_prog_vis  n_tested_sw  prop_sw_onprep p_diag_sw  p_onart_diag_sw  p_onart_vl1000_sw
prevalence_sw  incidence_sw p_sti_sw incidence1549_
prop_sw_onprep_prog prop_sw_onprep_noprog
p_diag_sw_inprog	incidence_sw_inprog	incidence_sw_noprog mean_sw_inc mean_sw_inc_inprog mean_sw_inc_noprog
p_diag_w p_diag_m p_diag;

***transpose given name; *starts with %macro and ends with %mend;
%macro transpose;
%let p25_var = p25_&var;
%let p75_var = p75_&var;
%let p5_var = p5_&var;
%let p95_var = p95_&var;
%let p50_var = median_&var;
%let mean_var=mean_&var;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=c out=a&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data a&count;set a&count;***creates one dataset per variable;
p25_&varb  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb = median(of &varb.1-&varb.&nfit);
mean_&varb = mean(of &varb.1-&varb.&nfit);

keep cald p5_&varb p95_&varb p50_&varb p25_&varb p75_&varb mean_&varb;
run;

      proc datasets nodetails nowarn nolist; 
      delete  aa&count;quit;run;
%end;
%mend;


%transpose;
run;

data d;
merge b
a1   a2   a3   a4   a5   a6   a7   a8   a9   a10  a11  a12  a13  a14  a15  a16  a17  a18  a19  a20  a21  a22  a23  a24  a25  a26 
a27  a28  a29  a30  a31  a32  a33  a34  a35  a36  a37  a38  a39  a40  a41  a42  a43  a44  a45  a46  a47  a48  a49  a50  a51  a52 
a53  a54 /* a55  a56  a57  a58  a59  a60  a61  a62  a63  a64  a65  a66  a67  a68  a69  a70  a71  a72  a73  a74  a75  a76  a77  a78 
a79  a80  a81  a82  a83  a84  a85  a86  a87  a88  a89  a90  a91  a92  a93  a94  a95  a96  a97  a98  a99  a100 a101 a102 a103 a104
a105 a106 a107 a108 a109 a110 a111 a112 a113 a114 a115 a116 a117 a118 a119 a120 a121 a122 a123 a124 a125 a126 a127 a128 a129 a130
a131 a132 a133 a134 a135 a136 a137 a138 a139 a140 a141 a142 a143 a144 a145 a146 a147 a148 a149 a150 a151 a152 a153 a154 a155 a156
a157 a158 a159 a160 a161 a162 a163 a164 a165 a166 a167 a168 a169 a170 a171 a172 a173 a174 a175 a176 a177 a178 a179 a180 a181 a182
a183 a184 a185 a186 a187 a188 a189 a190 a191 a192 a193 a194 a195 a196 a197 a198 a199 a200 a201 a202 a203 a204 a205 a206 a207 a208
a209 a210 a211 a212 a213 a214 a215 a216 a217 a218 a219 a220 a221 a222 a223 a224 a225 a226 a227 a228 a229 a230 a231 a232 a233 a234
a235 a236 a237 a238 a239 a240 a241 a242 a243 a244 a245 a246 a247 a248 a249 a250 a251 a252*/;
by cald;
run;


data e;
set d;
%include "C:\Users\lovel\Dropbox (UCL)\Loveleen\Synthesis model\Zim\Calibration\Observed data_FSW_Zimbabwe.sas"; by cald;
run;

ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Loveleen\Synthesis model\Zim\FSW\28feb2024.doc' startpage=never; 


proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 200000 by 50000)  valueattrs=(size=10);
label p50_n_sw_1549_	                  = "model age 15-49 (median)";

label o_pop_fsw_1549w_Fearon			  = "All FSW age 15-49 - Fearon";
series  x=cald y=p50_n_sw_1549_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549_      upper=p95_n_sw_1549_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearon / markerattrs = (symbol=circle color=black size = 12)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearon yerrorupper=o_pop_fsw_ul_1549w_Fearon errorbarattrs= (color=black thickness = 2);
run;quit;
 

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label p50_prop_w_1549_sw   = "model - median ";

label o_p_fsw_1549w_Fearon		 = "Fearon 15-49";

series  x=cald y=p50_prop_w_1549_sw  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw 	 upper=p95_prop_w_1549_sw / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_1549w_Fearon / markerattrs = (symbol=circle       color=green size = 12)
										 yerrorlower=o_p_fsw_ll_1549w_Fearon yerrorupper=o_p_fsw_ul_1549w_Fearon errorbarattrs= (color=green thickness = 2);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Current age of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_p_sw_age1519_	              = "15-19 years (median)";
label p50_p_sw_age2024_	              = "20-24 years (median)";
label p50_p_sw_age2529_	              = "25-29 years (median)";
label p50_p_sw_age3039_	              = "30-39 years (median)";
label p50_p_sw_ageab40_	              = "40+ years (median)";


label o_p_1824_fsw_rds				  = "18-24 years Sapphire";
label o_p_2529_fsw_rds				  = "25-29 years Sapphire";
label o_p_3039_fsw_rds				  = "30-39 years Sapphire";
label o_p_ab40_fsw_rds				  = "40+ years Sapphire";

label o_p_1819_fsw_AMT				  = "18-19 years Amethist";
label o_p_2024_fsw_AMT				  = "20-24 years Amethist";
label o_p_2529_fsw_AMT				  = "25-29 years Amethist";
label o_p_3039_fsw_AMT				  = "30-39 years Amethist";
label o_p_ab40_fsw_AMT				  = "40+ years Amethist";


series  x=cald y=p50_p_sw_age1519_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_age1519_      upper=p95_p_sw_age1519_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19y 90% range";
series  x=cald y=p50_p_sw_age2024_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_age2024_      upper=p95_p_sw_age2024_ / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24yy 90% range";
series  x=cald y=p50_p_sw_age2529_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_age2529_      upper=p95_p_sw_age2529_ / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29y 90% range";
series  x=cald y=p50_p_sw_age3039_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_sw_age3039_      upper=p95_p_sw_age3039_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "30-39y 90% range";
series  x=cald y=p50_p_sw_ageab40_  /           lineattrs = (color=yellow thickness = 2);
band    x=cald lower=p5_p_sw_ageab40_      upper=p95_p_sw_ageab40_ / transparency=0.9 fillattrs = (color=yellow) legendlabel= "30-39y 90% range";

scatter x=cald y=o_p_1824_fsw_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_rds / markerattrs = (symbol=circle     color=orange size = 12);
scatter x=cald y=o_p_ab40_fsw_rds / markerattrs = (symbol=circle     color=yellow size = 12);

scatter x=cald y=o_p_1819_fsw_AMT / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_2024_fsw_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_AMT / markerattrs = (symbol=circle     color=orange size = 12);
scatter x=cald y=o_p_ab40_fsw_AMT / markerattrs = (symbol=circle     color=yellow size = 12);

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Age debut of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_p_age_deb_sw1519_	              = "15-19 years (median)";
label p50_p_age_deb_sw2024_	              = "20-24 years (median)";
label p50_p_age_deb_sw2529_	              = "25-29 years (median)";
label p50_p_age_deb_sw3039_	              = "30-39 years (median)";

label o_p_fsw_agedeb1519_rds				  = "15-19 years Sapphire";
label o_p_fsw_agedeb2024_rds				  = "20-24 years Sapphire";
label o_p_fsw_agedeb2529_rds				  = "25-29 years Sapphire";
label o_p_fsw_agedebge30_rds				  = "30-39 years Sapphire";
label o_p_fsw_agedeb1519_AMT				  = "15-19 years Amethist";
label o_p_fsw_agedeb2024_AMT				  = "20-24 years Amethist";
label o_p_fsw_agedeb2529_AMT				  = "25-29 years Amethist";
label o_p_fsw_agedebge30_AMT				  = "30-39 years Amethist";

series  x=cald y=p50_p_age_deb_sw1519_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_age_deb_sw1519_      upper=p95_p_age_deb_sw1519_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19y 90% range";
series  x=cald y=p50_p_age_deb_sw2024_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_age_deb_sw2024_      upper=p95_p_age_deb_sw2024_ / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24yy 90% range";
series  x=cald y=p50_p_age_deb_sw2529_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_age_deb_sw2529_      upper=p95_p_age_deb_sw2529_ / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29y 90% range";
series  x=cald y=p50_p_age_deb_sw3039_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_age_deb_sw3039_      upper=p95_p_age_deb_sw3039_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "30-39y 90% range";

scatter x=cald y=o_p_fsw_agedeb1519_rds / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_agedeb2024_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_fsw_agedeb2529_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_fsw_agedebge30_rds / markerattrs = (symbol=circle     color=orange size = 12);

scatter x=cald y=o_p_fsw_agedeb1519_AMT / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_agedeb2024_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_fsw_agedeb2529_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_fsw_agedebge30_AMT / markerattrs = (symbol=circle     color=orange size = 12);

run;quit;



proc sgplot data=e; 
Title    height=1.5 justify=center "Duration of sex work";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Years'          labelattrs=(size=12)  values = (0 to 10 by 2) valueattrs=(size=10);
label p50_tot_dur_sw	                  = "Total duration of SW (median)";
label p50_act_dur_sw	                  = "Active duration of SW (median)";
series  x=cald y=p50_tot_dur_sw  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_tot_dur_sw      upper=p95_tot_dur_sw / transparency=0.9 fillattrs = (color=blue) legendlabel= "Total duration range";
series  x=cald y=p50_act_dur_sw  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_act_dur_sw      upper=p95_act_dur_sw / transparency=0.9 fillattrs = (color=green) legendlabel= "Active duration range";

run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Total duration of sex work including inactive periods";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_p_totdur_sw_0to3_	                  = "<3 years (median)";
label p50_p_totdur_sw_3to5_	                  = "3-5 years (median)";
label p50_p_totdur_sw_6to9_	                  = "6-9 years (median)";
label p50_p_totdur_sw_10to19_	              = "9+ years (median)";

label o_p_dur_0to3y_rds						  = "<3 years Sapphire";
label o_p_dur_3to5y_rds						  = "3-5 years Sapphire";
label o_p_dur_6to9y_rds						  = "6-9 years Sapphire";
label o_p_dur_10to19y_rds					  = "10-19 years Sapphire";
label o_p_dur_0to3y_AMT						  = "<3 years Amethist";
label o_p_dur_3to5y_AMT						  = "3-5 years Amethist";
label o_p_dur_6to9y_AMT						  = "6-9 years Amethist";
label o_p_dur_10to19y_AMT					  = "10-19 years Amethist";


series  x=cald y=p50_p_totdur_sw_0to3_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_totdur_sw_0to3_      upper=p95_p_totdur_sw_0to3_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "0 to 3y 90% range";
series  x=cald y=p50_p_totdur_sw_3to5_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_totdur_sw_3to5_      upper=p95_p_totdur_sw_3to5_ / transparency=0.9 fillattrs = (color=green) legendlabel= "3 to 5y 90% range";
series  x=cald y=p50_p_totdur_sw_6to9_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_totdur_sw_6to9_      upper=p95_p_totdur_sw_6to9_ / transparency=0.9 fillattrs = (color=red) legendlabel= "6 to 9y 90% range";
series  x=cald y=p50_p_totdur_sw_10to19_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_totdur_sw_10to19_      upper=p95_p_totdur_sw_10to19_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "9+ y 90% range";

scatter x=cald y=o_p_dur_0to3y_rds / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_dur_3to5y_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_dur_6to9y_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_dur_10to19y_rds / markerattrs = (symbol=circle     color=orange size = 12);

scatter x=cald y=o_p_dur_0to3y_AMT / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_dur_3to5y_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_dur_6to9y_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_dur_10to19y_AMT / markerattrs = (symbol=circle     color=orange size = 12);

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst all sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw  = "% diagnosed ";
label p50_p_onart_diag_sw = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw = "% on ART and virally suppressed";

label obs_p_diag_fsw_rds  = "Sapphire % diag";
label obs_p_art_fsw_rds  = "Sapphire % on ART";
label obs_p_vs_fsw_rds  = "Sapphire % VS";
label obs_p_diag_fsw_AMT  = "Amethist % diag";
label obs_p_art_fsw_AMT  = "Amethist % on ART";
label obs_p_vs_fsw_AMT  = "Amethist % VS";

series  x=cald y=p50_p_diag_sw  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw 	 upper=p95_p_diag_sw / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw	 upper=p95_p_onart_diag_sw / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw	 upper=p95_p_onart_vl1000_sw / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

scatter x=cald y=obs_p_diag_fsw_rds / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=obs_p_art_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=obs_p_vs_fsw_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=obs_p_diag_fsw_AMT / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=obs_p_art_fsw_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=obs_p_vs_fsw_AMT / markerattrs = (symbol=circle       color=green size = 12);
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Assuming a sex-worker program is in place, proportion of sex workers who have a program visit";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 1 by 0.2) 		valueattrs=(size=10);
label p50_p_sw_prog_vis = "Proportion with a program visit";

series  x=cald y=p50_p_sw_prog_vis  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis 	 upper=p95_p_sw_prog_vis / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Average number of condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   		values = (0 to 5) valueattrs=(size=10);

label p50_av_sw_newp = "Median";

series  x=cald y=p50_av_sw_newp  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_av_sw_newp	 upper=p95_av_sw_newp / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_fsw_newp0_ = "Median";

series  x=cald y=p50_p_fsw_newp0_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_fsw_newp0_	 upper=p95_p_fsw_newp0_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to 2030 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.02 ) valueattrs=(size=10);

label p50_prop_sw_onprep = "Median";
*label p50_prop_sw_onprep_prog = "SW prog";
*label p50_prop_sw_onprep_noprog = "No SW prog";

series  x=cald y=p50_prop_sw_onprep/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_onprep 	upper=p95_prop_sw_onprep  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_sw_onprep_prog/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_prog 	upper=p95_prop_sw_onprep_prog  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_onprep_noprog/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_noprog 	upper=p95_prop_sw_onprep_noprog  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*/
run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center " MEDIAN HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (1995 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 10 by 1)    valueattrs=(size=10);

label p50_incidence_sw  = "Median";
label o_HIVIncid_fsw = "JH JAIDS";
label o_HIVIncid1824_fsw= "18-24 SAli";
label o_HIVIncid2539_fsw= "25-39 SAli";
label o_HIVIncid_fsw_dreams = "DREAMS";
label o_HIVIncid1539_fsw_hj = "15-39 HJones";

series  x=cald y=p50_incidence_sw /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_sw  upper=p95_incidence_sw / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_incidence_sw_inprog /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_inprog  upper=p95_incidence_sw_inprog / transparency=0.9 fillattrs = (color=red) legendlabel= "No program - model 90% range";
series  x=cald y=p50_incidence_sw_noprog /  lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence_sw_noprog  upper=p95_incidence_sw_noprog / transparency=0.9 fillattrs = (color=green) legendlabel= "No program - model 90% range";

scatter x=cald y=o_HIVIncid_fsw / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_HIVIncid1824_fsw / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_HIVIncid2539_fsw / markerattrs = (symbol=circle       color=yellow size = 12);
scatter x=cald y=o_HIVIncid_fsw_dreams / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_HIVIncid1539_fsw_hj / markerattrs = (symbol=circle       color=black size = 12);

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "MEAN HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (1995 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 20 by 1)    valueattrs=(size=10);

label mean_incidence_sw  = "Median";
label o_HIVIncid_fsw = "JH JAIDS";
label o_HIVIncid1824_fsw= "18-24 SAli";
label o_HIVIncid2539_fsw= "25-39 SAli";
label o_HIVIncid_fsw_dreams = "DREAMS";
label o_HIVIncid1539_fsw_hj = "15-39 HJones";

series  x=cald y=mean_incidence_sw /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_sw  upper=p95_incidence_sw / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=mean_incidence_sw_inprog /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_inprog  upper=p95_incidence_sw_inprog / transparency=0.9 fillattrs = (color=red) legendlabel= "No program - model 90% range";
series  x=cald y=mean_incidence_sw_noprog /  lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence_sw_noprog  upper=p95_incidence_sw_noprog / transparency=0.9 fillattrs = (color=green) legendlabel= "No program - model 90% range";

scatter x=cald y=o_HIVIncid_fsw / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_HIVIncid1824_fsw / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_HIVIncid2539_fsw / markerattrs = (symbol=circle       color=yellow size = 12);
scatter x=cald y=o_HIVIncid_fsw_dreams / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_HIVIncid1539_fsw_hj / markerattrs = (symbol=circle       color=black size = 12);

run;quit;

***FOR SUNGAI CROI POSTER;
proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence amongst female sex workers (FSW) aged 18-39";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2012 to 2024 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 30 by 5)    valueattrs=(size=10);

label mean_mean_sw_inc  = "Incidence amongst all female sex workers";
label mean_mean_sw_inc_inprog  = "Incidence amongst female sex workers attending a sex-worker program";
label mean_mean_sw_inc_noprog  = "Incidence amongst female sex workers not attending a sex-worker program";
label o_HIVIncid_fsw = "JH JAIDS";
label o_HIVIncid1824_fsw= "18-24 SAli";
label o_HIVIncid2539_fsw= "25-39 SAli";
label o_HIVIncid_fsw_dreams = "DREAMS";
label o_HIVIncid1539_fsw_hj = "15-39 HJones";

series  x=cald y=mean_mean_sw_inc /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mean_sw_inc  upper=p95_mean_sw_inc / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range for incidence amongst all sex workers ";
series  x=cald y=mean_mean_sw_inc_inprog /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_mean_sw_inc_inprog  upper=p95_mean_sw_inc_inprog / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range for incidence amongst sex workers attendng a program";
series  x=cald y=mean_mean_sw_inc_noprog /  lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_mean_sw_inc_noprog  upper=p95_mean_sw_inc_noprog / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range for incidence amongst sex workers not attending a program";
/*
scatter x=cald y=o_HIVIncid_fsw / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_HIVIncid1824_fsw / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_HIVIncid2539_fsw / markerattrs = (symbol=circle       color=yellow size = 12);
scatter x=cald y=o_HIVIncid_fsw_dreams / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_HIVIncid1539_fsw_hj / markerattrs = (symbol=circle       color=black size = 12);
*/
run;quit;

proc means data=e;var mean_mean_sw_inc_inprog;where cald=2012;run;

proc means data=e;var mean_mean_sw_inc_inprog;where cald=2022;run;

proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence in general population";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 2 by 0.2)    valueattrs=(size=10);

label p50_incidence1549_ = "Median ";
series  x=cald y=p50_incidence1549_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549_  upper=p95_incidence1549_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";

run;quit;

ods rtf close;
ods listing;
run;

proc sgplot data=e; 

title    height=1.5 justify=center "HIV prevalence in SW";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)       valueattrs=(size=10); 
yaxis grid label = '%'          labelattrs=(size=12)    values = (0 to 1 by 0.2)    valueattrs=(size=10);

label p50_prevalence_sw = "Median ";
label o_prev_fsw_rds_mut = "RDS Mutare";
label o_prev_fsw_rds_vf = "RDS Vic Falls";
label o_prev_fsw_rds_hwa = "RDS Hwange";
label o_prev_fsw_rds = "RDS Sapphire";
label o_prev_fsw_AMT = "RDS Amethist";

series  x=cald y=p50_prevalence_sw /  lineattrs = (color=black thickness = 2);
band   x=cald lower=p5_prevalence_sw  upper=p95_prevalence_sw / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_prev_fsw_rds_mut / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_prev_fsw_rds_vf / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_prev_fsw_rds_hwa / markerattrs = (symbol=circle       color=purple size = 12);
scatter x=cald y=o_prev_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_prev_fsw_AMT / markerattrs = (symbol=circle       color=black size = 12);
 

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "HIV prevalence";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)       valueattrs=(size=10); 
yaxis grid label = '%'          labelattrs=(size=12)    values = (0 to 1 by 0.2)    valueattrs=(size=10);

label p50_prevalence1549__ = "Median ";


series  x=cald y=p50_prevalence1549__ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__ upper=p95_prevalence1549__ / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "Women diagnosed";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)       valueattrs=(size=10); 
yaxis grid label = '%'          labelattrs=(size=12)    values = (0.4 to 1 by 0.1)    valueattrs=(size=10);

label p50_incidence1549_ = "Median ";
series  x=cald y=p50_p_diag_w /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w  upper=p95_p_diag_w / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";

run;quit;


