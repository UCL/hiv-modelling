* options user="/folders/myfolders/";

libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\FSW";

data a;
set a.fsw_17_01_22;   
run;

proc sort;
by run cald option;run;

data sf;
set a;
 
if cald=2022;
s_alive = s_alive_m + s_alive_w ;
sf_2022 = 10000000 / s_alive;
keep run sf_2022;
proc sort; by run;run;

data a1; 
merge a sf;
by run ;
run;

proc freq data=a;table s_sw_program_visit;where option=1 and cald=2023;run;

data a2;
set a1;

if option=0 then do;
* n_sw_1564;					n_sw_1564_0_ = s_sw_1564 * sf_2022;
* n_sw_1549;					n_sw_1549_0_ = s_sw_1549 * sf_2022;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_0_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_0_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_0_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;				if s_sw_1564 gt 0 then p_sw_prog_vis_0_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_0_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_0_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_0_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_0_ = s_tested_sw * sf_2022 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_0_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_0_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_0_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_0_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_0_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_0_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_0_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* incidence1549;				incidence1549_0_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w_0_ = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m_0_ = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* duration of sw;				tot_dur_sw_0_= s_tot_dur_sw/ s_sw_1564;
end;							act_dur_sw_0_= s_act_dur_sw/ s_sw_1564;

if option=1 then do;
* n_sw_1564;					n_sw_1564_1_ = s_sw_1564 * sf_2022;
* n_sw_1549;					n_sw_1549_1_ = s_sw_1549 * sf_2022;
* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_1_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_1_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_1_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;				p_sw_prog_vis_1_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_1_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_1_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_1_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_1_ = s_tested_sw * sf_2022 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_1_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_1_ = max(s_prep_sw, 0) / (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_1_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* incidence1549;				incidence1549_1_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w_1_ = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m_1_ = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* duration of sw;				tot_dur_sw_1_= s_tot_dur_sw/ s_sw_1564;
end;							act_dur_sw_1_= s_act_dur_sw/ s_sw_1564;


run;

proc freq;table cald;where option=1;run;

data b;
set a2;

proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***gives each simulation an id;
proc means max data=b;var count_csim;run; ***number of simulations - this is manually inputted in nfit below;
%let nfit=200;  
run;

data c;
set b;

%let var =  
tot_dur_sw_0_  act_dur_sw_0_
tot_dur_sw_1_  act_dur_sw_1_

n_sw_1564_0_  n_sw_1549_0_  prop_w_1564_sw_0_  prop_w_1549_sw_0_  prop_w_ever_sw_0_  p_sw_prog_vis_0_  prop_sw_hiv_0_  prop_sw_newp0_0_
t_sw_newp_0_  n_tested_sw_0_  p_newp_sw_0_  prop_sw_onprep_0_  prevalence_sw_0_  incidence_sw_0_  p_diag_sw_0_  p_onart_diag_sw_0_
p_onart_vl1000_sw_0_
/*
n_sw_1564_nodis_0_  n_sw_1549_nodis_0_  prop_w_1564_sw_nodis_0_  prop_w_1549_sw_nodis_0_  prop_w_ever_sw_nodis_0_  p_sw_prog_vis_nodis_0_  prop_sw_hiv_nodis_0_  prop_sw_newp0_nodis_0_
t_sw_newp_nodis_0_  n_tested_sw_nodis_0_  p_newp_sw_nodis_0_  prop_sw_onprep_nodis_0_  prevalence_sw_nodis_0_  incidence_sw_nodis_0_  p_diag_sw_nodis_0_  p_onart_diag_sw_nodis_0_
p_onart_vl1000_sw_nodis_0_
n_sw_1564_mild_0_  n_sw_1549_mild_0_  prop_w_1564_sw_mild_0_  prop_w_1549_sw_mild_0_  prop_w_ever_sw_mild_0_  p_sw_prog_vis_mild_0_  prop_sw_hiv_mild_0_  prop_sw_newp0_mild_0_
t_sw_newp_mild_0_  n_tested_sw_mild_0_  p_newp_sw_mild_0_  prop_sw_onprep_mild_0_  prevalence_sw_mild_0_  incidence_sw_mild_0_  p_diag_sw_mild_0_  p_onart_diag_sw_mild_0_
p_onart_vl1000_sw_mild_0_
*/
n_sw_1564_1_  n_sw_1549_1_  prop_w_1564_sw_1_  prop_w_1549_sw_1_  prop_w_ever_sw_1_  p_sw_prog_vis_1_  prop_sw_hiv_1_  prop_sw_newp0_1_
t_sw_newp_1_  n_tested_sw_1_  p_newp_sw_1_  prop_sw_onprep_1_  prevalence_sw_1_  incidence_sw_1_  p_diag_sw_1_  p_onart_diag_sw_1_
p_onart_vl1000_sw_1_
/*
n_sw_1564_nodis_1_  n_sw_1549_nodis_1_  prop_w_1564_sw_nodis_1_  prop_w_1549_sw_nodis_1_  prop_w_ever_sw_nodis_1_  p_sw_prog_vis_nodis_1_  prop_sw_hiv_nodis_1_  prop_sw_newp0_nodis_1_
t_sw_newp_nodis_1_  n_tested_sw_nodis_1_  p_newp_sw_nodis_1_  prop_sw_onprep_nodis_1_  prevalence_sw_nodis_1_  incidence_sw_nodis_1_  p_diag_sw_nodis_1_  p_onart_diag_sw_nodis_1_
p_onart_vl1000_sw_nodis_1_
n_sw_1564_mild_1_  n_sw_1549_mild_1_  prop_w_1564_sw_mild_1_  prop_w_1549_sw_mild_1_  prop_w_ever_sw_mild_1_  p_sw_prog_vis_mild_1_  prop_sw_hiv_mild_1_  prop_sw_newp0_mild_1_
t_sw_newp_mild_1_  n_tested_sw_mild_1_  p_newp_sw_mild_1_  prop_sw_onprep_mild_1_  prevalence_sw_mild_1_  incidence_sw_mild_1_  p_diag_sw_mild_1_  p_onart_diag_sw_mild_1_
p_onart_vl1000_sw_mild_1_
*/
incidence1549_0_  incidence1549w_0_  incidence1549m_0_
incidence1549_1_  incidence1549w_1_  incidence1549m_1_  

;

***transpose given name; *starts with %macro and ends with %mend;
%macro transpose;
%let p25_var = p25_&var;
%let p75_var = p75_&var;
%let p5_var = p5_&var;
%let p95_var = p95_&var;
%let p50_var = median_&var;

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

keep cald p5_&varb p95_&varb p50_&varb p25_&varb p75_&varb;
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
a27  a28  a29  a30  a31  a32  a33  a34  a35  a36  a37  a38  a39  a40  a41  a42  a43  a44 /* a45  a46  a47  a48  a49  a50  a51  a52 
a53  a54  a55  a56  a57  a58  a59  a60  a61  a62  a63  a64  a65  a66  a67  a68  a69  a70  a71  a72  a73  a74  a75  a76  a77  a78 
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
%include '"C:\Loveleen\Synthesis model\Zim\Calibration\Observed data_Zimbabwe_LBMMay2017.sas"'; by cald;
run;

ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Loveleen\Synthesis model\Zim\FSW\24May2021.doc' startpage=never; 


proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 130000)  valueattrs=(size=10);
label p50_n_sw_1549_0_	                  = "model age 15-49 (median)";

label o_pop_fsw_1549w_Fearnon			  = "All FSW age 15-49 - Fearon";
series  x=cald y=p50_n_sw_1549_0_  /          lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549_0_      upper=p95_n_sw_1549_0_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearnon / markerattrs = (symbol=circle color=black size = 12)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearon yerrorupper=o_pop_fsw_ul_1549w_Fearnon errorbarattrs= (color=black thickness = 2);
run;quit;
 

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label p50_prop_w_1549_sw_0_   = "model - median ";

label o_p_fsw_ab1ts6m_1849w_nbcs = "NBCP: >  1 TSP (age 18-49)";
label o_p_fsw_1549w_Fearnon		 = "Fearon 15-49";

series  x=cald y=p50_prop_w_1549_sw_0_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0_ 	 upper=p95_prop_w_1549_sw_0_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_ab1ts6m_1849w_nbcs / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_1549w_Fearnon / markerattrs = (symbol=circle       color=green size = 12)
										 yerrorlower=o_p_fsw_ll_1549w_Fearnon yerrorupper=o_p_fsw_ul_1549w_Fearnon errorbarattrs= (color=green thickness = 2);
run;quit;

/*
proc sgplot data=e; 
Title    height=1.5 justify=center "Duration of sex work";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  valueattrs=(size=10);
label p50_dur0to3_sw_1_	                  = "0 to 3 years (median)";
label p50_dur3to5_sw_1_	                  = "3 to 5 years (median)";
label p50_dur6to9_sw_1_	                  = "6 to 9 years (median)";
label p50_dur10to19_sw_1_	              = "9+ years (median)";

series  x=cald y=p50_dur0to3_sw_1_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_dur0to3_sw_1_      upper=p95_dur0to3_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "0 to 3y 90% range";
series  x=cald y=p50_dur3to5_sw_1_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_dur3to5_sw_1_      upper=p95_dur3to5_sw_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "3 to 5y 90% range";
series  x=cald y=p50_dur6to9_sw_1_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_dur6to9_sw_1_      upper=p95_dur6to9_sw_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "6 to 9y 90% range";
series  x=cald y=p50_dur10to19_sw_1_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_dur10to19_sw_1_      upper=p95_dur10to19_sw_1_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "9+ y 90% range";

run;quit;
*/

proc sgplot data=e; 
Footnote "RDS data: <3y=22%, 3-5y=29%, 6-9y=24%, 10-29y=19%, >29y=6%";
Title    height=1.5 justify=center "Duration of sex work";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Median number of years'          labelattrs=(size=12)  valueattrs=(size=10);
label p50_tot_dur_sw_0_ = "Median duration of sex work";
label p50_act_dur_sw_0_ = "Median duration of active sex work";

series  x=cald y=p50_tot_dur_sw_0_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_tot_dur_sw_0_      upper=p95_tot_dur_sw_0_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "Total 90% range";
series  x=cald y=p50_act_dur_sw_0_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_act_dur_sw_0_      upper=p95_act_dur_sw_0_ / transparency=0.9 fillattrs = (color=green) legendlabel= "Active 90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Assuming a sex-worker program is in place, proportion of sex workers who have a program visit";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 1 by 0.2) 		valueattrs=(size=10);
label p50_p_sw_prog_vis_0_ = "Proportion with a program visit - no prog";
label p50_p_sw_prog_vis_1_ = "Proportion with a program visit";

series  x=cald y=p50_p_sw_prog_vis_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_1_ 	 upper=p95_p_sw_prog_vis_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_sw_prog_vis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_1_ 	 upper=p95_p_sw_prog_vis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;








proc sgplot data=e; 
title    height=1.5 justify=center "Proportion diagnosed (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_0_  = "% diagnosed with no SW program ";
label p50_p_diag_sw_1_  = "% diagnosed with SW program ";

series  x=cald y=p50_p_diag_sw_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_0_ 	 upper=p95_p_diag_sw_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_ 	 upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of those diagnosed on ART (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_diag_sw_0_  = "% onart_diagnosed with no SW program ";
label p50_p_onart_diag_sw_1_  = "% onart_diagnosed with SW program ";

series  x=cald y=p50_p_onart_diag_sw_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_0_ 	 upper=p95_p_onart_diag_sw_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_ 	 upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;



proc sgplot data=e; 
title    height=1.5 justify=center "Of those on ART, proportion with VL<1000 copies (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_onart_vl1000_sw_0_  = "% onart_vl1000nosed with no SW program ";
label p50_p_onart_vl1000_sw_1_  = "% onart_vl1000nosed with SW program ";

series  x=cald y=p50_p_onart_vl1000_sw_0_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_0_ 	 upper=p95_p_onart_vl1000_sw_0_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=cald y=p50_p_onart_vl1000_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_ 	 upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;






proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst all sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2030 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_ 	 upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_	 upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_	 upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst sex workers with no disadvantages (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_nodis_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_nodis_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_nodis_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_nodis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_1_ 	 upper=p95_p_diag_sw_nodis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_nodis_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_1_	 upper=p95_p_onart_diag_sw_nodis_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_nodis_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_1_	 upper=p95_p_onart_vl1000_sw_nodis_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst sex workers with mild disadvantages (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_mild_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_mild_1_ = "% diagnosed and on ART";
label p50_p_onart_vl1000_sw_mild_1_ = "% on ART and virally suppressed";

series  x=cald y=p50_p_diag_sw_mild_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_mild_1_ 	 upper=p95_p_diag_sw_mild_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_mild_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_mild_1_	 upper=p95_p_onart_diag_sw_mild_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_mild_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_mild_1_	 upper=p95_p_onart_vl1000_sw_mild_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "Assuming a sex-worker program is in place, proportion of sex workers who have a program visit";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 1 by 0.2) 		valueattrs=(size=10);
label p50_p_sw_prog_vis_2_ = "Proportion with a program visit";

series  x=cald y=p50_p_sw_prog_vis_2_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_2_ 	 upper=p95_p_sw_prog_vis_2_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Average number of condomless partners stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_t_sw_newp_1_ = "No sex worker program ";
label p50_t_sw_newp_2_ = "Sex worker program ";

series  x=cald y=p50_t_sw_newp_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_t_sw_newp_1_	 upper=p95_t_sw_newp_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_t_sw_newp_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_t_sw_newp_2_	 upper=p95_t_sw_newp_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers on PrEP stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.4 by 0.1) 		valueattrs=(size=10);

label p50_prop_sw_onprep_1_ = "No sex worker program ";
label p50_prop_sw_onprep_2_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_onprep_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_1_	 upper=p95_prop_sw_onprep_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_prop_sw_onprep_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_2_	 upper=p95_prop_sw_onprep_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_prop_sw_newp0_1_ = "No sex worker program ";
label p50_prop_sw_newp0_2_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_newp0_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_newp0_1_	 upper=p95_prop_sw_newp0_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_prop_sw_newp0_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_newp0_2_	 upper=p95_prop_sw_newp0_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Number of HIV tests amongst sex workers stratified by existence of a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)  values = (0 to 100000 by 10000) 		valueattrs=(size=10);

label p50_n_tested_sw_1_ = "No sex worker program ";
label p50_n_tested_sw_2_ = "Sex worker program ";

series  x=cald y=p50_n_tested_sw_1_  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_1_	 upper=p95_n_tested_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_n_tested_sw_2_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_2_	 upper=p95_n_tested_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_diag_sw_1_  = "No sex worker program ";
label p50_p_diag_sw_2_  = "Sex worker program ";

series  x=cald y=p50_p_diag_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_  upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_diag_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_2_  upper=p95_p_diag_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_diag_sw_nodis_2_  = "No disadvantages ";
label p50_p_diag_sw_mild_2_  = "Mild disadvantages ";


series  x=cald y=p50_p_diag_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_diag_sw_nodis_2_  upper=p95_p_diag_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_diag_sw_mild_2_/  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_diag_sw_mild_2_  upper=p95_p_diag_sw_mild_2_/ transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV on ART";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_diag_sw_1_  = "No sex worker program ";
label p50_p_onart_diag_sw_2_  = "Sex worker program ";

series  x=cald y=p50_p_onart_diag_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_  upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_diag_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_2_  upper=p95_p_onart_diag_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers diagnosed with HIV on ART by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_diag_sw_nodis_2_  = "No disadvantages";
label p50_p_onart_diag_sw_mild_2_  = "Mild disadvantages ";

series  x=cald y=p50_p_onart_diag_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_nodis_2_  upper=p95_p_onart_diag_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_diag_sw_2_ /  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_2_  upper=p95_p_onart_diag_sw_2_ / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers on ART and virally suppressed";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_vl1000_sw_1_  = "No sex worker program ";
label p50_p_onart_vl1000_sw_2_  = "Sex worker program ";

series  x=cald y=p50_p_onart_vl1000_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_  upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_vl1000_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_2_  upper=p95_p_onart_vl1000_sw_2_ / transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;


proc sgplot data=e; 

title    height=1.5 justify=center "Proportion of sex workers on ART and virally suppressed by level of disadvantage in the context of a program";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Proportion'          labelattrs=(size=12)  values = (0 to 1 by 0.1)       valueattrs=(size=10);

label p50_p_onart_vl1000_sw_nodis_2_  = "No disadvantages";
label p50_p_onart_vl1000_sw_mild_2_  = "Mild disadvantages ";

series  x=cald y=p50_p_onart_vl1000_sw_nodis_2_ /  lineattrs = (color=lightred thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_nodis_2_  upper=p95_p_onart_vl1000_sw_nodis_2_ / transparency=0.9 fillattrs = (color=lightred) legendlabel= "No program - model 90% range";
series  x=cald y=p50_p_onart_vl1000_sw_mild_2_ /  lineattrs = (color=darkred thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_mild_2_  upper=p95_p_onart_vl1000_sw_mild_2_ / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Program - model 90% range";

run;quit;



proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (1995 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 100 by 5)    valueattrs=(size=10);

label p50_incidence_sw_1_  = "No sex worker program ";
label p50_incidence_sw_2_ = "Sex worker program";

series  x=cald y=p50_incidence_sw_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_sw_1_  upper=p95_incidence_sw_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_incidence_sw_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_2_  upper=p95_incidence_sw_2_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence in general population";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 2 by 0.2)    valueattrs=(size=10);

label p50_incidence1549_1_  = "No sex worker program ";
label p50_incidence1549_2_ = "Sex worker program";

series  x=cald y=p50_incidence1549_1_ /  lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549_1_  upper=p95_incidence1549_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "No program - model 90% range";
series  x=cald y=p50_incidence1549_2_ /  lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549_2_  upper=p95_incidence1549_2_/ transparency=0.9 fillattrs = (color=red) legendlabel= "Program - model 90% range";

run;quit;

ods rtf close;
ods listing;
run;





