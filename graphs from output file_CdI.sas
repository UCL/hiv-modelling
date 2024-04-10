
***Program to produce graphs using averages across runs;
***Read in long file created from create wide file;
libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\CdI";


data b;
set a.l_base_CdI2;

*if inc_cat ne 1 then delete;
proc contents;run;

proc sort; by cald run ;run;
proc freq;table cald;run;

data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  186    ;
%let year_end = 2029.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
*if option =1 then delete;
%let var = 
p_w_giv_birth_this_per	mtct_prop		p_newp_ge1_	 		p_newp_ge5_			p_newp_ge1m_		p_newp_ge1w_	
n_tested	p_tested_past_year_1549m	p_tested_past_year_1549w	test_prop_positive
p_mcirc		n_new_vmmc1549m 			p_trad_circ			p_vmmc				
prop_w_1549_sw		prop_w_1564_sw		prop_w_ever_sw		prop_sw_hiv			n_sw_1549_	prop_w_1524_onprep	prop_1564_onprep	
prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1519w		prevalence1519m		prevalence2024w		prevalence2024m		prevalence2529w		prevalence2529m
prevalence3034w		prevalence3034m		prevalence3539w		prevalence3539m		prevalence4044w		prevalence4044m
prevalence4549w		prevalence4549m
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w
incidence1524m		incidence1524w		incidence2534m		incidence2534w		incidence3544m		incidence3544w	
incidence4554m		incidence4554w		incidence5564m		incidence5564w	
p_inf_vlsupp		p_inf_ep			p_inf_newp			p_inf_naive			p_inf_primary		p_inf_diag	
p_diag_m			p_diag_w			p_artexp_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm
p_efa				p_taz				p_ten				p_zdv				p_dol		p_3tc	p_lpr		p_nev	
p_onart_m			p_onart_w			p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	p_vg1000_	p_vl1000_
prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hiv_w
rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_cd4_lt200_		n_hiv				n_alive				n_alive1549_		n_alive_m			n_alive_w	n_alive1564_
n_alive1564m		n_alive1564w		n_art_start_y 		n_prep				n_prep_ever			p_prep_ever			;
;

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

keep cald p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 p2p5_&varb._0 p97p5_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;


/*
data option_1;
set b;
if option =0 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m	  n_prep_elig_w  n_prep_elig_m   n_onprep_w  n_onprep_m  n_newp_ge1_w
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence_vg1000_   
incidence1564_  incidence1564m incidence1564w incidence1549m incidence1549w n_tested n_tested_m
  n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart_m n_onart_w  n_dead_hivpos_cause1_ n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed n_hiv n_infected
;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p2p5_var = p2p5_&var_1;
%let p97p5_var = p97p5_&var_1;
%let p50_var = median_&var_1;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p25_&varb._1  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._1 = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p2p5_&varb._1  = PCTL(2.5,of &varb.1-&varb.&nfit);
p97p5_&varb._1 = PCTL(97.5,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1 p2p5_&varb._1 p97p5_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;

*/

data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25
g26  g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48  g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71  g72  g73  g74  g75
g76  g77  g78  g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100  g101  g102 
g103 g104 g105 g106 g107 g108 g109 g110 /*g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 
*/

;
by cald;
%include "C:\Users\lovel\Documents\GitHub\hiv-modelling\Observed_data_Cote_dIvoire.sas";
***LOok at Spectrum AIM file;
***Number of HIV tests done;
***Ever tested;
***Number on ART;
*Circ;
*90-90-90s;
*Of adults on art, proportion on efavirenz, dolutegravir, boosted PI � men women;

run;


ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Users\lovel\Dropbox (UCL)\Loveleen\Synthesis model\WHO Ivory Coast\03Apr2024.doc' startpage=never; 


proc sgplot data=d; 
Title    height=1.5 justify=center "Population 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to 2030 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);

label p50_n_alive_0 = "15+ ";
label p50_n_alive1564__0 = "15-64";
label o_pop15plus = "15+ worldpopulationreview.com";
label o_pop1564 = "15-64 World Bank";

series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive1564__0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive1564__0 	upper=p95_n_alive1564__0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_pop15plus / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_pop1564 / markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Population 15+ by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by  2000000) valueattrs=(size=10);

label p50_n_alive1564m_0 = "Model 15-64 Males";
label p50_n_alive1564w_0 = "Model 15-64 Females";
label o_pop1564m = "15-64 Males (World Bank)";
label o_pop1564w = "15-64 Females (World Bank)";

series  x=cald y=p50_n_alive1564m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_alive1564m_0 	upper=p95_n_alive1564m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive1564w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive1564w_0 	upper=p95_n_alive1564w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_pop1564m / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_pop1564w / markerattrs = (symbol=square color=green size = 10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

label p50_n_hiv_0 = "Model";
label o_plhiv_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_plhiv_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Option 0 (median) ";

series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_0 	upper=p97p5_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
run;

quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label p50_p_newp_ge1__0 = "Option 0 (median) ";
label o_p_cls_m_PHIA = "% who had comdomless sex at last sex";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1m_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label p50_p_newp_ge1m__0 = "newp >=1 amongst men";
label o_p_cls_m_PHIA1564 = "% who had comdomless sex at last sex PHIA";
label o_p_cls_m_DHS1549 = "% who had comdomless sex at last sex DHS";

series  x=cald y=p50_p_newp_ge1m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1m__0 	upper=p95_p_newp_ge1m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_cls_m_PHIA1564/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_p_cls_m_DHS1549/	markerattrs = (symbol=square color=blue  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1w_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label p50_p_newp_ge1m__0 = "newp >=1 amongst women";
label o_p_cls_w_PHIA1564 = "% who had comdomless sex at last sex PHIA";
label o_p_cls_W_DHS1549 = "% who had comdomless sex at last sex DHS";

series  x=cald y=p50_p_newp_ge1w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1w__0 	upper=p95_p_newp_ge1w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_cls_w_PHIA1564/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_p_cls_m_DHS1549/	markerattrs = (symbol=square color=blue  size = 10) ;
run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02 by 0.005) valueattrs=(size=10);
label p50_p_newp_ge5__0 = "Option 0 (median) ";

series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

/*

proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label p50_log_gender_r_newp_0 = "Option 0 (median) ";
label p50_log_gender_r_newp_1 = "Option 1 (median) ";

series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  12000000 by 1000000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";

series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

***look at dhs;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0 = "Model";
label o_evertested_m_PHIA = "Ever tested 15-64 (PHIA)";

series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_evertested_m_PHIA/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0 = "Model";
label o_evertested_w_PHIA = "Ever tested 15-64 (PHIA)";

series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_evertested_w_PHIA/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_0 = "All";
label p50_p_trad_circ_0 = "Traditional";
label p50_p_vmmc_0 = "VMMC";
label o_circ1549_phia = "PHIA All";
label o_trad_circ1549_phia = "PHIA traditional";
label o_vmmc1549_phia = "PHIA VMMC";

series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_trad_circ_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_trad_circ_0 	upper=p95_p_trad_circ_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vmmc_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vmmc_0 	upper=p95_p_vmmc_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_circ1549_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_trad_circ1549_phia/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_vmmc1549_phia/	markerattrs = (symbol=square color=green  size = 10) ;
run;quit;

ods html;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49";
label p50_prop_w_ever_sw_0 = "Ever FSW 15-64";
label o_p_fsw_UNAIDS="% FSW of 15-49 women";

series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 80000 by 10000) valueattrs=(size=10);
label p50_n_sw_1549__0 = "Current FSW 15-49";
label o_pop_fsw_UNAIDS= "Number of FSW 15-49 (UNAIDS)";

series  x=cald y=p50_n_sw_1549__0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_1549__0 	upper=p95_n_sw_1549__0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_pop_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label o_prev_fsw_UNAIDS = "UNAIDS";

series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_prev_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02   by 0.005 ) valueattrs=(size=10);

label p50_prop_w_1524_onprep_0 = "Model";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.03   by 0.005 ) valueattrs=(size=10);

label p50_prop_1564_onprep_0 = "Option 0 (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.20 by 0.05) valueattrs=(size=10);

label p50_prevalence1549m_0 = "Model";
label o_prev1549m_phia = "PHIA";
label o_prev1549_UNAIDS = "UNAIDS";

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev1549m_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev1549m_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label p50_prevalence1549w_0 = "Model";
label o_prev1549w_phia = "PHIA";
label o_prev1549w_UNAIDS = "UNAIDS";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev1549w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev1549w_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-19)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label p50_prevalence1519w_0 = "Women";
label p50_prevalence1519m_0 = "Men";
label o_prev1519w_phia = "Women PHIA";
label o_prev1519m_phia = "Men PHIA";

series  x=cald y=p50_prevalence1519w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1519w_0 	upper=p95_prevalence1519w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1519m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1519m_0 	upper=p95_prevalence1519m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev1519w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev1519m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 20-24)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label p50_prevalence2024w_0 = "Women";
label p50_prevalence2024m_0 = "Men";
label o_prev2024w_phia = "Women PHIA";
label o_prev2024m_phia = "Men PHIA";

series  x=cald y=p50_prevalence2024w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence2024w_0 	upper=p95_prevalence2024w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence2024m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence2024m_0 	upper=p95_prevalence2024m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev2024w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev2024m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 25-29)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label p50_prevalence2529w_0 = "Women";
label p50_prevalence2529m_0 = "Men";
label o_prev2529w_phia = "Women PHIA";
label o_prev2529m_phia = "Men PHIA";

series  x=cald y=p50_prevalence2529w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence2529w_0 	upper=p95_prevalence2529w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence2529m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence2529m_0 	upper=p95_prevalence2529m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev2529w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev2529m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 30-34)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label p50_prevalence3034w_0 = "Women";
label p50_prevalence3034m_0 = "Men";
label o_prev3034w_phia = "Women PHIA";
label o_prev3034m_phia = "Men PHIA";

series  x=cald y=p50_prevalence3034w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence3034w_0 	upper=p95_prevalence3034w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence3034m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence3034m_0 	upper=p95_prevalence3034m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev3034w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev3034m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 35-39)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label p50_prevalence3539w_0 = "Women";
label p50_prevalence3539m_0 = "Men";
label o_prev3539w_phia = "Women PHIA";
label o_prev3539m_phia = "Men PHIA";

series  x=cald y=p50_prevalence3539w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence3539w_0 	upper=p95_prevalence3539w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence3539m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence3539m_0 	upper=p95_prevalence3539m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev3539w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev3539m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 40-44)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label p50_prevalence4044w_0 = "Women";
label p50_prevalence4044m_0 = "Men";
label o_prev4044w_phia = "Women PHIA";
label o_prev4044m_phia = "Men PHIA";

series  x=cald y=p50_prevalence4044w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence4044w_0 	upper=p95_prevalence4044w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence4044m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence4044m_0 	upper=p95_prevalence4044m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev4044w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev4044m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 45-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.02) valueattrs=(size=10);

label p50_prevalence4549w_0 = "Women";
label p50_prevalence4549m_0 = "Men";
label o_prev4549w_phia = "Women PHIA";
label o_prev4549m_phia = "Men PHIA";

series  x=cald y=p50_prevalence4549w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence4549w_0 	upper=p95_prevalence4549w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence4549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence4549m_0 	upper=p95_prevalence4549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev4549w_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev4549m_phia/	markerattrs = (symbol=square color=black  size = 10) ;
run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.05) valueattrs=(size=10);

label p50_incidence1549m_0 = "Model";
label o_Incid1549m_phia = "PHIA";

series  x=cald y=p50_incidence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_Incid1549m_phia / 		markerattrs = (symbol=square color=green size = 10);
run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label p50_incidence1549w_0 = "Option 0 (median) ";
label o_Incid1549m_phia = "PHIA";

series  x=cald y=p50_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_Incid1549w_phia / 		markerattrs = (symbol=square color=green size = 10);
run;quit;

/*

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_vlsupp_0 = "Model ";

series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_ep_0 = "Model ";

series  x=cald y=p50_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_newp_0 = "Model";

series  x=cald y=p50_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_primary_0 = "Option 0 (median) ";

series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_naive_0 = "Option 0 (median) ";

series  x=cald y=p50_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_diag_0 = "Option 0 (median) ";

series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_mtct_prop_0 = "Option 0 (median) ";

series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of men with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_m_0 = "Model";
label o_diag1564m_phia = "PHIA";
label o_diag_all_UNAIDS = "UNAIDS ALL";
series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag1564m_phia / 		markerattrs = (symbol=square color=green size = 10);
scatter x=cald y=o_diag_all_UNAIDS / 		markerattrs = (symbol=square color=blue size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of women with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_w_0 = "Model ";
label o_diag1564w_phia = "PHIA";

series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag1564w_phia / 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_m_0 = "Model";
label o_diag_onart1564m_phia = "PHIA";

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag_onart1564m_phia / 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_w_0 = "Model";
label o_diag_onart1564w_phia = "PHIA";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=o_diag_onart1564w_phia / 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_m_0 = "Model";
label o_art_vs1564m_phia = "PHIA";

series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_art_vs1564m_phia/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_w_0 = "Model";
label o_art_vs1564w_phia = "PHIA";

series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_art_vs1564w_phia/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";
label o_vs1564_UNAIDS = "UNAIDS";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_vs1564_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vg1000__0 = "Option 0 (median) ";

series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.01) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "Model ";

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Model";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


***LEAVE NUMBER GRAPHS UNTIL POPULATION IS BETTER FITTING;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number diagnosed with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 400000 by  50000) valueattrs=(size=10);

label p50_n_diagnosed_0 = "Option 0 (median) ";
label o_n_diag15plus_UNAIDS = "UNAIDS LIVING with HIV";

series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y = o_n_plhiv15plus_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label p50_n_onart_m_0 = "Model";
label o_n_onart_m_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_m_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label p50_n_onart_w_0 = "Option 0 (median) ";
label o_n_onart_w_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_w_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_efa_0 = "Option 0 (median) ";

series  x=cald y=p50_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_taz_0 = "Option 0 (median) ";

series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_ten_0 = "Option 0 (median) ";

series  x=cald y=p50_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_zdv_0 = "Option 0 (median) ";

series  x=cald y=p50_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_dol_0 = "Option 0 (median) ";

series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_3TC_0 = "Option 0 (median) ";

series  x=cald y=p50_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_lpr_0 = "Option 0 (median) ";

series  x=cald y=p50_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_nev_0 = "Option 0 (median) ";

series  x=cald y=p50_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_m_0 = "Model";
label o_onart15plus_m_UNAIDS = "UNAIDS";
series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_onart15plus_m_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_w_0 = "Model";
label o_onart15plus_w_UNAIDS = "UNAIDS";


series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_onart15plus_w_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "HIV Deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label p50_n_death_hiv_0 = "Option 0 (median) ";
label o_AIDSdeaths_UNAIDS = "AIDS deaths (UNAIDS)";

series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = o_AIDSdeaths_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);

label p50_n_cd4_lt200__0 = "Option 0 (median) ";

series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw55r_0 	upper=p95_logw55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

ods rtf close;
ods listing;
run;


/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence msm (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 50 by 1) valueattrs=(size=10);

label p50_incidence1564msm_0 = "Option 0 (median) ";

series  x=cald y=p50_incidence1564msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564msm_0 	upper=p95_incidence1564msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence msm (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_prevalence1564_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_prevalence1564_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1564_msm_0 	upper=p95_prevalence1564_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_msm_infected_from_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_msm_infected_from_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_msm_infected_from_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_msm_infected_from_msm_0 	upper=p95_p_msm_infected_from_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_elig_prep_any_msm_1564_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_elig_prep_any_msm_1564__0 = "Option 0 (median) ";

series  x=cald y=p50_p_elig_prep_any_msm_1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_prep_any_msm_1564__0 	upper=p95_p_elig_prep_any_msm_1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onprep_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onprep_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_onprep_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_msm_0 	upper=p95_p_onprep_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onart_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_onart_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_msm_0 	upper=p95_p_onart_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_prevalence_vg1000_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_prevalence_vg1000_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000_msm_0 	upper=p95_prevalence_vg1000_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_diag_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_msm_0 	upper=p95_p_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_onart_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_msm_0 	upper=p95_p_onart_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_art_gt6m_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_vl1000_art_gt6m_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_vl1000_art_gt6m_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000_art_gt6m_msm_0 	upper=p95_p_vl1000_art_gt6m_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_ever_tested_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_ever_tested_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_ever_tested_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ever_tested_msm_0 	upper=p95_p_ever_tested_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_this_period_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_tested_this_period_msm_0 = "Option 0 (median) ";

series  x=cald y=p50_p_tested_this_period_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_this_period_msm_0 	upper=p95_p_tested_this_period_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;

*/
