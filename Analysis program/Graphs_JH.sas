* options user="/folders/myfolders/";

*libname a "C:\Users\lovel\TLO_HMC Dropbox\Loveleen bansi-matharu\hiv synthesis ssa unified program\output files\FSW\";

***Read in Vales output files;
libname a "C:\Users\Loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe";
data a;
set a.base_26_10_2023; 
if option ne 0 then delete;*keeping only option=0 as this signifies no change;
run;

proc freq;table option cald;run;
proc sort data=a;by run;run;



****NEED TO CHANGE TO ZIM SPECIFIC POP****;


data sf;
set a;

if cald=2023.25; ***Update as required;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = 10000000 / s_alive; ***If calibrating to a specific setting, change 10000000 to desired 15+ population size;
keep run sf_2023;
proc sort; by run;run;

data a1; 
merge a sf;
by run ;
run;

data a2;
set a1;

* p_sw_age1519_;				p_sw_age1519_1_=s_sw_1519/s_sw_1564;
* p_sw_age2024_;				p_sw_age2024_1_=s_sw_2024/s_sw_1564;
* p_sw_age2529_;				p_sw_age2529_1_=s_sw_2529/s_sw_1564;
* p_sw_age3039_;				p_sw_age3039_1_=s_sw_3039/s_sw_1564;
* p_sw_age40pl_;				p_sw_age40pl_1_=s_sw_ov40/s_sw_1564;
							
***need to fix this in core file;
* p_age_deb_sw1519_;			p_age_deb_sw1519_1_ = s_age_deb_sw1519_ /s_sw_1564;
* p_age_deb_sw2024_;			p_age_deb_sw2024_1_ = s_age_deb_sw2024_ /s_sw_1564;
* p_age_deb_sw2529_;			p_age_deb_sw2529_1_ = s_age_deb_sw2529_ /s_sw_1564;
* p_age_deb_sw3039_;			p_age_deb_sw3039_1_ = s_age_deb_sw3039_ /s_sw_1564;
* p_age_deb_sw40pl_;		    p_age_deb_sw40pl_1_ = s_age_deb_swov40_ /s_sw_1564;


* n_sw_1564;					n_sw_1564_1_ = s_sw_1564 * sf_2023;
* n_sw_1549;					n_sw_1549_1_ = s_sw_1549 * sf_2023;

* prop_w_1549_sw;				if s_alive1549_w gt 0 then prop_w_1549_sw_1_ = s_sw_1549 / s_alive1549_w ;
* prop_w_1564_sw;				if s_alive1564_w gt 0 then prop_w_1564_sw_1_ = s_sw_1564 / s_alive1564_w ;
* prop_w_ever_sw;				prop_w_ever_sw_1_ = s_ever_sw / s_alive1564_w ;
* p_sw_prog_vis;				p_sw_prog_vis_1_ = s_sw_program_visit / s_sw_1564 ;

* prop_sw_hiv;					prop_sw_hiv_1_ = s_hiv_sw / s_sw_1564 ;
* prop_sw_newp0;				if (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5) gt 0 then   
								prop_sw_newp0_1_ = s_sw_newp_cat1 / (s_sw_newp_cat1+s_sw_newp_cat2+s_sw_newp_cat3+s_sw_newp_cat4+s_sw_newp_cat5);  
* t_sw_newp;					if s_sw_1564 gt 0 then t_sw_newp_1_ = s_sw_newp/s_sw_1564;
* n_tested_sw;					n_tested_sw_1_ = s_tested_sw * sf_2023 * 4;
* p_newp_sw;					if s_w_newp gt 0 then p_newp_sw_1_ = s_sw_newp / s_w_newp ;
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep_1_ = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;

* prevalence_sw;				prevalence_sw_1_ = s_hiv_sw / s_sw_1564; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw_1_=(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw_1_ = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw_1_ = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw_1_ = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* incidence1549;				incidence1549_1_ = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w_1_ = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m_1_ = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* duration of sw;				tot_dur_sw_1_= s_tot_dur_sw/ s_sw_1564;
								act_dur_sw_1_= s_act_dur_sw/ s_sw_1564;

								if s_sw_1564 ne 0 then do;
								p_actdur_0to3_1_   =s_actdur_sw_0to3/s_sw_1564;
								p_actdur_3to5_1_   =s_actdur_sw_3to5/s_sw_1564;
								p_actdur_6to9_1_   =s_actdur_sw_6to9/s_sw_1564;
								p_actdur_10to19_1_ =s_actdur_sw_10to19/s_sw_1564;

								p_totdur_0to3_1_   =s_totdur_sw_0to3/s_sw_1564;
								p_totdur_3to5_1_   =s_totdur_sw_3to5/s_sw_1564;
								p_totdur_6to9_1_   =s_totdur_sw_6to9/s_sw_1564;
								p_totdur_10to19_1_ =s_totdur_sw_10to19/s_sw_1564;
								end;
run;

proc means;var p_actdur_0to3_1_  p_actdur_3to5_1_  p_actdur_6to9_1_  p_actdur_10to19_1_;run;

data b;
set a2;

proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***gives each simulation an id;
proc means max data=b;var count_csim;run; ***number of simulations - this is manually inputted in nfit below;
%let nfit=111;  
run;

data c;
set b;

%let var =  
p_sw_age1519_1_ 	p_sw_age2024_1_  	p_sw_age2529_1_  	p_sw_age3039_1_  	p_sw_age40pl_1_
p_sw_agedeb1519_1_  p_sw_agedeb2024_1_  p_sw_agedeb2529_1_  p_sw_agedeb3039_1_  p_sw_agedeb40pl_1_
n_sw_1564_1_  		n_sw_1549_1_  		prop_w_1564_sw_1_   prop_w_1549_sw_1_   prop_w_ever_sw_1_   	p_sw_prog_vis_1_  
prop_sw_hiv_1_  	prop_sw_newp0_1_	t_sw_newp_1_  		n_tested_sw_1_  	p_newp_sw_1_  			prop_sw_onprep_1_ 
prevalence_sw_1_  	incidence_sw_1_  	p_diag_sw_1_  		p_onart_diag_sw_1_	p_onart_vl1000_sw_1_ 	tot_dur_sw_1_  
act_dur_sw_1_
p_actdur_0to3_1_  p_actdur_3to5_1_  p_actdur_6to9_1_  p_actdur_10to19_1_
p_totdur_0to3_1_  p_totdur_3to5_1_  p_totdur_6to9_1_  p_totdur_10to19_1_

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
a1   a2   a3   a4   a5   a6   a7   a8   a9   a10  a11  a12  a13  a14  a15  a16  a17  a18  a19  a20  a21  a22 a23  a24  a25  a26 
a27  a28  a29  a30  a31  a32  a33  a34  a35  a36  a37  a38  a39  /* a40  a41  a42  a43  a44  a45  a46  a47  a48  a49  a50  a51  a52 
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
ods rtf file = 'C:\Loveleen\Synthesis model\Zim\FSW\13Dec2023.doc' startpage=never; 


proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 200000 by 50000)  valueattrs=(size=10);
label p50_n_sw_1549_1_	                  = "model age 15-49 (median)";

label o_pop_fsw_1549w_Fearnon			  = "All FSW age 15-49 - Fearon";
series  x=cald y=p50_n_sw_1549_1_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549_1_      upper=p95_n_sw_1549_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearnon / markerattrs = (symbol=circle color=black size = 12)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearnon yerrorupper=o_pop_fsw_ul_1549w_Fearnon errorbarattrs= (color=black thickness = 2);
run;quit;
 

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2040 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label p50_prop_w_1549_sw_1_   = "model - median ";

label o_p_fsw_ab1ts6m_1849w_nbcs = "NBCP: >  1 TSP (age 18-49)";
label o_p_fsw_1549w_Fearnon		 = "Fearon 15-49";

series  x=cald y=p50_prop_w_1549_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1_ 	 upper=p95_prop_w_1549_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_ab1ts6m_1849w_nbcs / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_1549w_Fearnon / markerattrs = (symbol=circle       color=green size = 12)
										 yerrorlower=o_p_fsw_ll_1549w_Fearnon yerrorupper=o_p_fsw_ul_1549w_Fearnon errorbarattrs= (color=green thickness = 2);
run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Current age of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values =(0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_p_sw_age1519_1_	                  = "15-19 years (median)";
label p50_p_sw_age2024_1_	                  = "20-24 years (median)";
label p50_p_sw_age2529_1_	                  = "25-29 years (median)";
label p50_p_sw_age3039_1_	                  = "30-39 years (median)";
label p50_p_sw_age40pl_1_	                  = "40+years (median)";

label o_p_1824_fsw_rds							= "18-24 Sapphire";
label o_p_2529_fsw_rds							= "25-29 Sapphire";
label o_p_3039_fsw_rds							= "30-39 Sapphire";
label o_p_ab40_fsw_rds							= "40+ Sapphire";
label o_p_1819_fsw_AMT							= "18-19 Amethist";
label o_p_2024_fsw_AMT							= "20-24 Amethist";
label o_p_2529_fsw_AMT							= "25-29 Amethist";
label o_p_3039_fsw_AMT							= "30-39 Amethist";
label o_p_ab40_fsw_AMT							= "40+ Amethist";

scatter x=cald y=o_p_1819_fsw_AMT / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_2024_fsw_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_AMT / markerattrs = (symbol=circle       color=black size = 12);
scatter x=cald y=o_p_3039_fsw_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_ab40_fsw_AMT / markerattrs = (symbol=circle       color=orange size = 12);

scatter x=cald y=o_p_1824_fsw_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_rds / markerattrs = (symbol=circle       color=black size = 12);
scatter x=cald y=o_p_3039_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_ab40_fsw_rds / markerattrs = (symbol=circle       color=orange size = 12);

series  x=cald y=p50_p_sw_age1519_1_ /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_age1519_1_      upper=p95_p_sw_age1519_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19 90% range";
series  x=cald y=p50_p_sw_age2024_1_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_age2024_1_      upper=p95_p_sw_age2024_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24 90% range";
series  x=cald y=p50_p_sw_age2529_1_  /           lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_sw_age2529_1_      upper=p95_p_sw_age2529_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "25-29 90% range";
series  x=cald y=p50_p_sw_age3039_1_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_age3039_1_      upper=p95_p_sw_age3039_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "30-30 90% range";
series  x=cald y=p50_p_sw_age40pl_1_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_sw_age40pl_1_      upper=p95_p_sw_age40pl_1_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "40+ 90% range";

run;quit;
 
***not working yet;
proc sgplot data=e; 
Title    height=1.5 justify=center "Age debut of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values =(0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_p_sw_agedeb1519_1_	                  = "15-19 years (median)";
label p50_p_sw_agedeb2024_1_	                  = "20-24 years (median)";
label p50_p_sw_agedeb2529_1_	                  = "25-29 years (median)";
label p50_p_sw_agedeb3039_1_	                  = "30-39 years (median)";
label p50_p_sw_agedeb40pl_1_	                  = "40+years (median)";

label o_p_fsw_agedeb1519_rds					  = "15-19 Sapphire";
label o_p_fsw_agedeb2024_rds					  = "20-24 Sapphire";
label o_p_fsw_agedeb2529_rds					  = "25-29 Sapphire";
label o_p_fsw_agedebge30_rds					  = "30+ Sapphire";

label o_p_fsw_agedeb1519_AMT					  = "15-19 Amethist";
label o_p_fsw_agedeb2024_AMT					  = "20-24 Amethist";
label o_p_fsw_agedeb2529_AMT					  = "25-29 Amethist";
label o_p_fsw_agedebge30_AMT					  = "30+ Amethist";

scatter x=cald y=o_p_fsw_agedeb1519_AMT / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_agedeb2024_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_fsw_agedeb2529_AMT / markerattrs = (symbol=circle       color=black size = 12);
scatter x=cald y=o_p_fsw_agedebge30_AMT / markerattrs = (symbol=circle       color=red size = 12);

scatter x=cald y=o_p_fsw_agedeb1519_rds / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_agedeb2024_rds/ markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_fsw_agedeb2529_rds / markerattrs = (symbol=circle       color=black size = 12);
scatter x=cald y=o_p_fsw_agedebge30_rds / markerattrs = (symbol=circle       color=red size = 12);

series  x=cald y=p50_p_sw_agedeb1519_1_ /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_agedeb1519_1_      upper=p95_p_sw_agedeb1519_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19 90% range";
series  x=cald y=p50_p_sw_agedeb2024_1_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_agedeb2024_1_      upper=p95_p_sw_agedeb2024_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24 90% range";
series  x=cald y=p50_p_sw_agedeb2529_1_  /           lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_sw_agedeb2529_1_      upper=p95_p_sw_agedeb2529_1_ / transparency=0.9 fillattrs = (color=black) legendlabel= "25-29 90% range";
series  x=cald y=p50_p_sw_agedeb3039_1_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_agedeb3039_1_      upper=p95_p_sw_agedeb3039_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "30-30 90% range";
series  x=cald y=p50_p_sw_agedeb40pl_1_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_sw_agedeb40pl_1_      upper=p95_p_sw_agedeb40pl_1_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "40+ 90% range";

run;quit;
 


proc sgplot data=e; 
Title    height=1.5 justify=center "Active duration of sex work";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values =(0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_actdur_0to3_1_	                  = "0 to 3 years (median)";
label p50_p_actdur_3to5_1_	                  = "3 to 5 years (median)";
label p50_p_actdur_6to9_1_	                  = "6 to 9 years (median)";
label p50_p_actdur_10to19_1_	              = "9+ years (median)";

series  x=cald y=p50_p_actdur_0to3_1_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_actdur_0to3_1_      upper=p95_p_actdur_0to3_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "0 to 3y 90% range";
series  x=cald y=p50_p_actdur_3to5_1_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_actdur_3to5_1_      upper=p95_p_actdur_3to5_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "3 to 5y 90% range";
series  x=cald y=p50_p_actdur_6to9_1_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_actdur_6to9_1_      upper=p95_p_actdur_6to9_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "6 to 9y 90% range";
series  x=cald y=p50_p_actdur_10to19_1_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_actdur_10to19_1_      upper=p95_p_actdur_10to19_1_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "9+ y 90% range";

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Total duration of sex work";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values =(0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_totdur_0to3_1_	                  = "0 to 3 years (median)";
label p50_p_totdur_3to5_1_	                  = "3 to 5 years (median)";
label p50_p_totdur_6to9_1_	                  = "6 to 9 years (median)";
label p50_p_totdur_10to19_1_	              = "9+ years (median)";
label o_p_dur_0to3y_AMT 					  = "AMETHIST 0-3y";
label o_p_dur_3to5y_AMT 					  = "AMETHIST 3-5y";
label o_p_dur_6to9y_AMT 					  = "AMETHIST 6-9y";
label o_p_dur_10to19y_AMT 					  = "AMETHIST 10-19y";

scatter x=cald y=o_p_dur_0to3y_AMT / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_dur_3to5y_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_dur_6to9y_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_dur_10to19y_AMT / markerattrs = (symbol=circle       color=orange size = 12);

series  x=cald y=p50_p_totdur_0to3_1_  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_totdur_0to3_1_      upper=p95_p_totdur_0to3_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "0 to 3y 90% range";
series  x=cald y=p50_p_totdur_3to5_1_  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_totdur_3to5_1_      upper=p95_p_totdur_3to5_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "3 to 5y 90% range";
series  x=cald y=p50_p_totdur_6to9_1_  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_totdur_6to9_1_      upper=p95_p_totdur_6to9_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "6 to 9y 90% range";
series  x=cald y=p50_p_totdur_10to19_1_  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_totdur_10to19_1_      upper=p95_p_totdur_10to19_1_ / transparency=0.9 fillattrs = (color=orange) legendlabel= "9+ y 90% range";

run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2040 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);
label p50_p_diag_sw_1_  = "% diagnosed ";
label p50_p_onart_diag_sw_1_  = "% on ART ";
label p50_p_onart_vl1000_sw_1_  = "% virally suppressed";
label obs_p_diag_fsw_sapph_end  = "Sapphire % diagnosed";
label obs_p_onart_fsw_sapph_end  = "Sapphire % on ART";
label obs_p_vs_fsw_sapph_end  = "Sapphire % virally suppressed";
label obs_p_diag_fsw_ameth_end  = "Amethist % diagnosed";
label obs_p_onart_fsw_ameth_end  = "Amethist % on ART";
label obs_p_vs_fsw_ameth_end  = "Amethist % virally suppressed";

scatter x=cald y=obs_p_diag_fsw_sapph_end / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=obs_p_onart_fsw_sapph_end / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=obs_p_vs_fsw_sapph_end / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=obs_p_diag_fsw_ameth_end / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=obs_p_onart_fsw_ameth_end / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=obs_p_vs_fsw_ameth_end / markerattrs = (symbol=circle       color=green size = 12);

series  x=cald y=p50_p_diag_sw_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_sw_1_ 	 upper=p95_p_diag_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_sw_1_  / 	 lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_sw_1_	 upper=p95_p_onart_diag_sw_1_ / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_sw_1_  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_sw_1_	 upper=p95_p_onart_vl1000_sw_1_ / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Assuming a sex-worker program is in place, proportion of sex workers who have a program visit";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2040 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 1 by 0.2) 		valueattrs=(size=10);
label p50_p_sw_prog_vis_1_ = "Proportion with a program visit";

series  x=cald y=p50_p_sw_prog_vis_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_1_ 	 upper=p95_p_sw_prog_vis_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Average number of condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2040 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Number' 		labelattrs=(size=12)   values = (0 to 6) 		valueattrs=(size=10);

label p50_t_sw_newp_1_ = "Median";

series  x=cald y=p50_t_sw_newp_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_t_sw_newp_1_	 upper=p95_t_sw_newp_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers on PrEP";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2040 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) 		valueattrs=(size=10);

label p50_prop_sw_onprep_1_ = "Median";

series  x=cald y=p50_prop_sw_onprep_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_1_	 upper=p95_prop_sw_onprep_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2040 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_prop_sw_newp0_1_ = "Median ";
label p50_prop_sw_newp0_2_ = "Sex worker program ";

series  x=cald y=p50_prop_sw_newp0_1_  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_sw_newp0_1_	 upper=p95_prop_sw_newp0_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
title    height=1.5 justify=center "HIV incidence amongst sex workers";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 100 by 5)    valueattrs=(size=10);

label p50_incidence_sw_1_  = "Median";
series  x=cald y=p50_incidence_sw_1_ /  lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence_sw_1_  upper=p95_incidence_sw_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 

title    height=1.5 justify=center "HIV incidence in general population";
xaxis label             = 'Year'                labelattrs=(size=12)  values = (2010 to 2040 by 2)       valueattrs=(size=10); 
yaxis grid label = 'Incidence per 100py'          labelattrs=(size=12)    values = (0 to 2 by 0.2)    valueattrs=(size=10);

label p50_incidence1549_1_  = "Median";

series  x=cald y=p50_incidence1549_1_ /  lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549_1_  upper=p95_incidence1549_1_ / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

ods rtf close;
ods listing;
run;


