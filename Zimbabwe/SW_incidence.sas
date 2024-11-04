libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\Deaths Zim\";


data a;
set a.zim_06jun23;
if run=. then delete;

*if option ne 0 then delete; *Error in main code where other options were coded in the update statements. Could keep all of them but 
takes ages to run so cut down dataset;
proc sort;by run;run;
proc freq;table cald;run;
proc freq;table s_sw_program_visit;where cald>2015;run;

data sf;
set a;
 
if cald=2023.5;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = (16320000 * 0.581) / s_alive; 
*Source for Zimbabwe population is https:https://population.un.org/dataportal/data/indicators/49/locations/716/start/1990/end/2023/line/linetimeplot;
*accessed 9/2/2023;
* 58.1% of Zim population in 2020 >= age 15. Source: https://data.worldbank.org/indicator/SP.POP.0014.TO.ZS?locations=ZW accessed 6/9/2021;
keep run sf_2023;


proc sort; by run;run;

%let sf=sf_2023;


data b; 
merge a sf;
by run;

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
								p_actdur_0to3_   =s_actdur_sw_0to3/s_sw_1564;
								p_actdur_3to5_   =s_actdur_sw_3to5/s_sw_1564;
								p_actdur_6to9_   =s_actdur_sw_6to9/s_sw_1564;
								p_actdur_10to19_ =s_actdur_sw_10to19/s_sw_1564;

								p_totdur_0to3_   =s_totdur_sw_0to3/s_sw_1564;
								p_totdur_3to5_   =s_totdur_sw_3to5/s_sw_1564;
								p_totdur_6to9_   =s_totdur_sw_6to9/s_sw_1564;
								p_totdur_10to19_ =s_totdur_sw_10to19/s_sw_1564;
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
* p_tested_past_year_sw;		if s_sw_1564 - s_diag_sw > 0 then p_tested_past_year_sw = s_tested_4p_sw /  (s_sw_1564 - s_diag_sw) ;

* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw = s_hiv_sw1549_ / s_sw_1549; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw =(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);
* sti_sw;						p_sti_sw = s_sti_sw/s_sw_1564;



keep run cald
n_sw_1564_  	 	 n_sw_1549_ 	 	prop_w_1564_sw		prop_w_1549_sw 	 	prop_w_ever_sw  
p_fsw1519_	  		 p_fsw2024_		  	p_fsw2529_			p_fsw3039_	
p_sw_age1519_	  	 p_sw_age2024_	  	p_sw_age2529_ 		p_sw_age3039_
p_age_deb_sw1519_  	 p_age_deb_sw2024_  p_age_deb_sw2529_   p_age_deb_sw3039_
sw_episodes 	  	 p_sw_gt1ep
p_fsw_newp0_   	 	 p_fsw_newp1to5_    p_fsw_newp6to40_  	p_fsw_newp41to130_  p_fsw_newpov130_
av_sw_newp	 		 p_newp_sw
tot_dur_sw  		 act_dur_sw  	 
p_actdur_0to3_  	 p_actdur_3to5_     p_actdur_6to9_  	p_actdur_10to19_ 
p_totdur_0to3_  	 p_totdur_3to5_     p_totdur_6to9_  	p_totdur_10to19_ 
p_sw_prog_vis		 n_tested_sw	    prop_sw_onprep		prevalence_sw	  	incidence_sw
p_diag_sw			 p_onart_diag_sw	p_onart_vl1000_sw
p_sti_sw			 p_tested_past_year_sw;		

proc sort; by cald run ;run;

data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =112;
%let year_end = 2045.00 ;
proc sort;by cald option ;run;

data option_0;
set b;
if option =1 then delete;

%let var = 

n_sw_1564_     n_sw_1549_		    prop_w_1564_sw		prop_w_1549_sw prop_w_ever_sw  
p_fsw1519_	   p_fsw2024_		    p_fsw2529_			p_fsw3039_	

p_sw_age1519_	  	p_sw_age2024_		p_sw_age2529_ 		p_sw_age3039_
p_age_deb_sw1519_	p_age_deb_sw2024_	p_age_deb_sw2529_  	p_age_deb_sw3039_

sw_episodes      p_sw_gt1ep
p_fsw_newp0_  	 p_fsw_newp1to5_    p_fsw_newp6to40_  	p_fsw_newp41to130_	p_fsw_newpov130_
av_sw_newp	 	 p_newp_sw

tot_dur_sw     act_dur_sw  	 
p_actdur_0to3_ p_actdur_3to5_     p_actdur_6to9_  	p_actdur_10to19_ 
p_totdur_0to3_ p_totdur_3to5_     p_totdur_6to9_  	p_totdur_10to19_ 

p_sw_prog_vis   n_tested_sw	    	p_tested_past_year_sw
prop_sw_onprep	prevalence_sw	    incidence_sw
p_diag_sw		p_onart_diag_sw		p_onart_vl1000_sw	p_sti_sw;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p2p5_var = p2p5_&var_0;
%let p97p5_var = p97p5_&var_0;
%let p50_var = median_&var_0;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p25_&varb._0  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._0 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p2p5_&varb._0  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._0 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 p2p5_&varb._0 p97p5_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

%option_0;
run;



data d; * this is number of variables in %let var = above ;
merge 
g1  g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24 g25
g26  g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45 /* g46  g47  g48  g49 g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71  g72  g73  g74 g75
g76  g77  g78  g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100    g101 g102 
g103 g104 g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52  h53  h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72  h73  h74 
h75	 h77  h78  h79  h80  h81  h82  h83  h84  h85  h86  h87  h88  h89  h90 h91  h92  h93  h94  h95  h96  h97  h98 h99  h100 h101 h102
h103 h104 */
;
by cald;


data e;
set d;
***Observed data;
*%include "C:\Users\lovel\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_Zimbabwe_Sep2021.sas";
%include '"C:\Loveleen\Synthesis model\Zim\Calibration\Observed data_Zimbabwe_LBMMay2017.sas"'; by cald;
run;


***Graphs comparing observed data to outputs;


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Loveleen\Synthesis model\Modelling Consortium\Attribution of deaths\Zim_19Apr.doc' startpage=never; 


proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2030 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 130000)  valueattrs=(size=10);
label p50_n_sw_1549__0	                  = "model age 15-49 (median)";

label o_pop_fsw_1549w_Fearnon			  = "All FSW age 15-49 - Fearon";
series  x=cald y=p50_n_sw_1549__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_1549__0     upper=p95_n_sw_1549__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_fsw_1549w_Fearnon / markerattrs = (symbol=circle color=black size = 12)
										   yerrorlower=o_pop_fsw_ll_1549w_Fearnon yerrorupper=o_pop_fsw_ul_1549w_Fearnon errorbarattrs= (color=black thickness = 2);
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";

label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
label o_p_ever_fsw_1ts_1849w_nbcs = "NBCS - Ever transactional sex 18-49";

series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_fsw_1849_Zim_garpr /	markerattrs = (color=orange);
scatter  x=cald y=o_p_fsw_1849_Bulaw_garpr /	markerattrs = (color=red);
scatter  x=cald y=o_p_fsw_1849_Harare_garpr /	markerattrs = (color=pink);
scatter  x=cald y=o_p_ever_fsw_1ts_1849w_nbcs /	markerattrs = (color=green);
run;quit;




proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of women who are sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) 		valueattrs=(size=10);
label p50_prop_w_1549_sw_0   = "Current FSW 15-49 (median) ";
label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 (median) ";

label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
label o_p_ever_fsw_1ts_1849w_nbcs = "NBCS - Ever transactional sex 18-49";
label o_p_fsw_ab1ts6m_1849w_nbcs = "NBCP: >1 transactional sex partner (age 18-49)";
label o_p_fsw_1549w_Fearnon		 = "Fearon 15-49";

series  x=cald y=p50_prop_w_1549_sw_0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	 upper=p95_prop_w_1549_sw_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";

scatter x=cald y=o_p_fsw_ab1ts6m_1849w_nbcs / markerattrs = (symbol=circle       color=blue size = 12);
scatter x=cald y=o_p_fsw_1549w_Fearnon / markerattrs = (symbol=circle       color=yellow size = 12)
										 yerrorlower=o_p_fsw_ll_1549w_Fearnon yerrorupper=o_p_fsw_ul_1549w_Fearnon errorbarattrs= (color=green thickness = 2);
scatter  x=cald y=o_p_fsw_1849_Zim_garpr /	markerattrs = (color=orange);
scatter  x=cald y=o_p_fsw_1849_Bulaw_garpr /	markerattrs = (color=red);
scatter  x=cald y=o_p_fsw_1849_Harare_garpr /	markerattrs = (color=pink);
scatter  x=cald y=o_p_ever_fsw_1ts_1849w_nbcs /	markerattrs = (color=green);

run;quit;

proc sgplot data=e; 
Title    height=1.5 justify=center "Age of sex workers";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Proportion'          labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_p_sw_age1519__0	              = "15-19 years (median)";
label p50_p_sw_age2024__0	              = "20-24 years (median)";
label p50_p_sw_age2529__0	              = "25-29 years (median)";
label p50_p_sw_age3039__0	              = "30-39 years (median)";

label o_p_1824_fsw_rds				  = "18-24 years Sapphire";
label o_p_2529_fsw_rds				  = "25-29 years Sapphire";
label o_p_3039_fsw_rds				  = "30-39 years Sapphire";
 
label o_p_1824_fsw_AMT				  = "18-24 years Amethist";
label o_p_2529_fsw_AMT				  = "25-29 years Amethist";
label o_p_3039_fsw_AMT				  = "39-39 years Amethist";

series  x=cald y=p50_p_sw_age1519__0  /           lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_age1519__0      upper=p95_p_sw_age1519__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "15-19y 90% range";
series  x=cald y=p50_p_sw_age2024__0  /           lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_age2024__0      upper=p95_p_sw_age2024__0 / transparency=0.9 fillattrs = (color=green) legendlabel= "20-24yy 90% range";
series  x=cald y=p50_p_sw_age2529__0  /           lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_sw_age2529__0      upper=p95_p_sw_age2529__0 / transparency=0.9 fillattrs = (color=red) legendlabel= "25-29y 90% range";
series  x=cald y=p50_p_sw_age3039__0  /           lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_sw_age3039__0      upper=p95_p_sw_age3039__0 / transparency=0.9 fillattrs = (color=orange) legendlabel= "30-39y 90% range";

scatter x=cald y=o_p_1824_fsw_rds / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_rds / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_rds / markerattrs = (symbol=circle       color=orange size = 12);

scatter x=cald y=o_p_1824_fsw_AMT / markerattrs = (symbol=circle       color=green size = 12);
scatter x=cald y=o_p_2529_fsw_AMT / markerattrs = (symbol=circle       color=red size = 12);
scatter x=cald y=o_p_3039_fsw_AMT / markerattrs = (symbol=circle       color=orange size = 12);
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners (including periods of inactive sex work)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_fsw_newp0__0 = "Model (median) ";

series  x=cald y=p50_p_fsw_newp0__0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_fsw_newp0__0	 upper=p95_p_fsw_newp0__0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;

proc sgplot data=e; 
title    height=1.5 justify=center "Proportion of sex workers who visited a sex worker programme";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2023 by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)  values=(0 to 0.2)		valueattrs=(size=10);

label p50_p_sw_prog_vis_0 = "Model (median) ";

series  x=cald y=p50_p_sw_prog_vis_0  / 	 lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_0	 upper=p95_p_sw_prog_vis_0 / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
run;quit;


proc sgplot data=e; 
Title    height=1.5 justify=center "HIV prevalence amongst sex workers (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)   valueattrs=(size=10);
label p50_prevalence_sw_0 = "Median";

label o_prev_fsw_dw = "David Wilson";
label o_prev_fsw_rdshm = "RDS Hwange and Mutare";
label o_prev_fsw_rdsvf = "RDS Victoria Falls";
label o_prev_fsw_tested_swvp = "Sisters with a Voice";
label o_prev_fsw_rds = "RDS baseline SAPPH-IRe";

series  x=cald y=p50_prevalence_sw_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence_sw_0 	upper=p95_prevalence_sw_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
scatter x=cald y=o_prev_fsw_dw /  yerrorlower=o_prev_fsw_ll_dw yerrorupper=o_prev_fsw_ul_dw markerattrs = (color=black) ERRORBARATTRS = (color = black) ;
scatter x=cald y=o_prev_fsw_rdshm / markerattrs = (color=blue) ;
scatter x=cald y=o_prev_fsw_rdsvf / markerattrs = (color=red) ;
scatter x=cald y=o_prev_fsw_tested_swvp / markerattrs = (color=green) ;
scatter x=cald y=o_prev_fsw_rds /  yerrorlower=o_prev_fsw_ll_rds yerrorupper=o_prev_fsw_ul_rds markerattrs = (color=orange) ERRORBARATTRS = (color = orange);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence amongst sex workers (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence pPer 100 person years'		labelattrs=(size=12)  values = (0 to 60 by 5) valueattrs=(size=10);
label p50_incidence_sw_0 = "Median incidence";
label p50_incidence_sw_1 = "Option 1  (median) ";

series  x=cald y=p50_incidence_sw_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence_sw_0 	upper=p95_incidence_sw_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
run;quit;

