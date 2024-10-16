
***Program to produce graphs using averages across runs;
***Read in long file created from create wide file;
libname a "C:\Users\loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\CdI";


data b1;
set a.l_base_CdI_14Oct24;

s_sw_1549_ = s_sw_1549;

new_option=option;
drop option;
run;

data b;set b1;
*change this for every option;
if new_option=0 then option=0;
if new_option=2 then option=1;

if option in (0,1) then a=1;
if a ne 1 then delete;

proc freq;table option;run;

proc sort; by cald run ;run;
proc freq;table cald;run;

 
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  42;
%let year_end = 2040 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;
%let var = 
p_w_giv_birth_this_per	mtct_prop		prevalence_hiv_preg		p_anc		p_newp_ge1_	 		p_newp_ge5_			p_newp_ge1m_		p_newp_ge1w_	
n_tested	test_prop_positive			av_newp_ge1_non_sw		n_self_tested	n_tested_anc
p_mcirc		n_new_vmmc1549m 			p_trad_circ			p_vmmc				s_sw_1549_	p_sw_prog_vis
prop_w_1549_sw		prop_w_1564_sw		prop_w_ever_sw		prop_sw_hiv			n_sw_1549_	prop_w_1524_onprep	prop_1564_onprep	
prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w

p_diag_m			p_diag_w			p_diag1549_			p_diag1549m			p_diag1549w			p_artexp_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm	
p_dol	
p_onart_m			p_onart_w			p_onart				p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	p_vg1000_	p_vl1000_
prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hiv_w		n_death_hiv
rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_hiv				n_art_start_y 	
n_prep				n_prep_ever			p_prep_ever			p_fsw_newp0_
n_pregnant			n_newinf			n_newinf1549_		n_newinf1549m		n_newinf1549w		n_prep_oral_ever_sw
prop_sw_hiv1549_	p_tested_sw			p_diag_sw

n_alive_msm		n_alive1564_msm		incidence1549msm	incidence1564msm	prevalence1549_msm	prevalence1564_msm
p_onprep_msm	p_elig_prep_any_msm_1564_				p_onart_msm			prevalence_vg1000_msm
p_diag_msm		p_onart_diag_msm	p_vl1000_art_gt6m_msm 					p_ever_tested_msm	
p_msm_infected_from_msm				prop_m_msm			p_ep_msm			p_msm_ge1newp
p_m_ge1newp		n_pwid				p_onprep_pwid		p_onart_pwid		p_diag_pwid			prevalence_pwid
n_tested_msm	n_tested_pwid		n_vm_per_year		/*p_tb*/
;

***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
%let p50_var = median_&var_0;
%let mean_var = mean_&var_0;
%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_0 out=g&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&count;set g&count;***creates one dataset per variable;
p5_&varb._0  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._0 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._0 = median(of &varb.1-&varb.&nfit);
mean_&varb._0 = mean(of &varb.1-&varb.&nfit);
keep cald p5_&varb._0 p95_&varb._0 p50_&varb._0 mean_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;



***Two macros, one for each option. Gives medians ranges etc by option;
data option_1;
set b;
if option =0 then delete;
%let var =
p_w_giv_birth_this_per	mtct_prop		prevalence_hiv_preg		p_anc		p_newp_ge1_	 		p_newp_ge5_			p_newp_ge1m_		p_newp_ge1w_	
n_tested	test_prop_positive			av_newp_ge1_non_sw		n_self_tested	n_tested_anc
p_mcirc		n_new_vmmc1549m 			p_trad_circ			p_vmmc				s_sw_1549_	p_sw_prog_vis
prop_w_1549_sw		prop_w_1564_sw		prop_w_ever_sw		prop_sw_hiv			n_sw_1549_	prop_w_1524_onprep	prop_1564_onprep	
prevalence1549_		prevalence1549m		prevalence1549w	
prevalence1524w		prevalence1524m		prevalence2549w		prevalence2549m		prevalence_hiv_preg
incidence1549_		incidence1564_		incidence1549m		incidence1549w

p_diag_m			p_diag_w			p_diag1549_			p_diag1549m			p_diag1549w			p_artexp_diag		p_artexp_diag		p_onart_diag_m		p_onart_diag_w
n_diagnosed	 		n_onart				n_onart_w			n_onart_m			p_ai_no_arv_c_nnm	
p_dol	
p_onart_m			p_onart_w			p_onart				p_onart_vl1000_		p_onart_vl1000_m	p_onart_vl1000_w	p_vg1000_	p_vl1000_
prevalence_vg1000_	n_death_2059_m		n_death_2059_w		n_death_hiv_m		n_death_hiv_w		n_death_hiv
rate_dead_allage 	rate_dead_allage_m 	rate_dead_allage_w
n_hiv				n_art_start_y 	
n_prep				n_prep_ever			p_prep_ever			p_fsw_newp0_
n_pregnant			n_newinf			n_newinf1549_		n_newinf1549m		n_newinf1549w		n_prep_oral_ever_sw
prop_sw_hiv1549_	p_tested_sw			p_diag_sw

n_alive_msm		n_alive1564_msm		incidence1549msm	incidence1564msm	prevalence1549_msm	prevalence1564_msm
p_onprep_msm	p_elig_prep_any_msm_1564_				p_onart_msm			prevalence_vg1000_msm
p_diag_msm		p_onart_diag_msm	p_vl1000_art_gt6m_msm 					p_ever_tested_msm	
p_msm_infected_from_msm				prop_m_msm			p_ep_msm			p_msm_ge1newp
p_m_ge1newp		n_pwid				p_onprep_pwid		p_onart_pwid		p_diag_pwid			prevalence_pwid
n_tested_msm	n_tested_pwid		n_vm_per_year		/*p_tb*/
;	

***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
%let p50_var = median_&var_1;
%let mean_var = mean_&var_1;
%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_1 out=h&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data h&count;set h&count;***creates one dataset per variable;
p5_&varb._1  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._1 = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._1 = median(of &varb.1-&varb.&nfit);
mean_&varb._1 = mean(of &varb.1-&varb.&nfit);
keep cald p5_&varb._1 p95_&varb._1 p50_&varb._1 mean_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;



data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25
g26  g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48  g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60  g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71  g72  g73  g74  g75
g76  g77  g78  g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100 
g101  g102 g103 g104 g105 g106 g107 g108 g109 g110 g111 g112/* g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 */

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25
h26  h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52  h53  h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72  h73  h74  h75
h76  h77  h78  h79  h80  h81  h82  h83  h84  h85  h86  h87  h88  h89  h90  h91  h92  h93  h94  h95  h96  h97  h98  h99  h100
h101 h102 h103 h104 h105 h106 h107 h108 h109 h110 h111 h112 /*h113 h114 h115 h116 h117 h118 h119 h120 h121 h122 h123 h124 h125 h126 h127 h128 h129 h130
h131 h132 h133 h134 h135 h136 h137 h138 h139 h140 h141 h142 h143 h144 h145 h146 h147 h148 h149 h150 h151 h152 h153 */




/* g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 
*/

;
by cald;
%include "C:\Users\loveleen\Documentos\GitHub\hiv-modelling\Observed_data_Cote_dIvoire.sas";
***LOok at Spectrum AIM file;
***Number of HIV tests done;
***Ever tested;
***Number on ART;
*Circ;
*90-90-90s;
*Of adults on art, proportion on efavirenz, dolutegravir, boosted PI – men women;

run;

ods listing close;
ods graphics / reset imagefmt=jpeg height=5in width=8in; run;
ods rtf file = 'C:\Users\loveleen\Dropbox (UCL)\Loveleen\Synthesis model\WHO Ivory Coast\14Oct24_op1.doc' startpage=never; 



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new infections";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000 by 10000) valueattrs=(size=10);

label p50_n_newinf_0 = "Model 0";
label p50_n_newinf_1 = "Model 1";

label o_newinf_unaids = "UNAIDS";

series  x=cald y=mean_n_newinf_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_newinf_0 	upper=p95_n_newinf_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_newinf_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_newinf_1 	upper=p95_n_newinf_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_newinf_unaids/ 		markerattrs = (symbol=square color=green size = 10);;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

label p50_n_hiv_0 = "Model 0";
label p50_n_hiv_1 = "Model 1";
label o_plhiv_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_hiv_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_hiv_1 	upper=p95_n_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_plhiv_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   valueattrs=(size=10);

label p50_n_pregnant_0 = "Model 0";
label p50_n_pregnant_1 = "Model 1";

label o_preg_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_pregnant_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pregnant_0 	upper=p95_n_pregnant_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_n_pregnant_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_pregnant_1 	upper=p95_n_pregnant_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 0 90% range";

scatter x=cald y = o_preg_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of tests in anc ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   valueattrs=(size=10);

label p50_n_tested_anc_0 = "Model 0";
label p50_n_tested_anc_1 = "Model 1";

label o_preg_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_tested_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_anc_0 	upper=p95_n_tested_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_n_tested_anc_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_anc_1 	upper=p95_n_tested_anc_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 0 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of pregnant women with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   valueattrs=(size=10);

label p50_prevalence_hiv_preg_0 = "Option 0 (median) ";
label p50_prevalence_hiv_preg_1= "Option 1 (median) ";

label preg_hiv_UNAIDS = "NSP";

series  x=cald y=p50_prevalence_hiv_preg_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
series  x=cald y=p50_prevalence_hiv_preg_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_1 	upper=p95_prevalence_hiv_preg_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 0 90% range";

scatter x=cald y = preg_hiv_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Mother to child transmission";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label p50_mtct_prop_0 = "Option 0 (median) ";
label p50_mtct_prop_1 = "Option 1 (median) ";

label mtct_nsp = "NSP";

series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p25_mtct_prop_0 	upper=p975_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p25_mtct_prop_1 	upper=p975_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 0 90% range";

scatter x=cald y = o_p_mtct_nsp/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of pregnant women attending ANC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_anc_0 = "Option 0 (median) ";
label p50_p_anc_0 = "Option 1 (median) ";

label o_p_anc_nsp = "NSP (1st trimester)";

series  x=cald y=p50_p_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_anc_0 	upper=p95_p_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
series  x=cald y=p50_p_anc_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_anc_1 	upper=p95_p_anc_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 0 90% range";

scatter x=cald y = o_p_anc_nsp/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label p50_p_newp_ge1__0 = "Option 0 (median) ";
label p50_p_newp_ge1__0 = "Option 1 (median) ";


series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1m_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);

label p50_p_newp_ge1m__0 = "Option 0 newp >=1 amongst men";
label p50_p_newp_ge1m__1 = "Option 1 newp >=1 amongst men";

label o_p_cls_m_PHIA1564 = "% who had comdomless sex at last sex PHIA";
label o_p_cls_m_DHS1549 = "% who had comdomless sex at last sex DHS";

series  x=cald y=p50_p_newp_ge1m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1m__0 	upper=p95_p_newp_ge1m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1m__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge1m__1 	upper=p95_p_newp_ge1m__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_cls_m_PHIA1564/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_p_cls_m_DHS1549/	markerattrs = (symbol=square color=blue  size = 10) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1w_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);

label p50_p_newp_ge1m__0 = "Option 0 newp >=1 amongst women";
label p50_p_newp_ge1m__1 = "Option 1 newp >=1 amongst women";

label o_p_cls_w_PHIA1564 = "% who had comdomless sex at last sex PHIA";
label o_p_cls_W_DHS1549 = "% who had comdomless sex at last sex DHS";

series  x=cald y=p50_p_newp_ge1w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1w__0 	upper=p95_p_newp_ge1w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1w__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge1w__1 	upper=p95_p_newp_ge1w__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_cls_w_PHIA1564/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_p_cls_m_DHS1549/	markerattrs = (symbol=square color=blue  size = 10) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02 by 0.005) valueattrs=(size=10);

label p50_p_newp_ge5__0 = "Option 0 (median) ";
label p50_p_newp_ge5__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "av_newp_ge1_non_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);

label p50_av_newp_ge1_non_sw_0 = "Option 0 (median) ";
label p50_av_newp_ge1_non_sw_1 = "Option 1 (median) ";

series  x=cald y=p50_av_newp_ge1_non_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_av_newp_ge1_non_sw_0 	upper=p95_av_newp_ge1_non_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_av_newp_ge1_non_sw_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_av_newp_ge1_non_sw_1 	upper=p95_av_newp_ge1_non_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  12000000 by 1000000) valueattrs=(size=10);

label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";

series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_n_tests_JS/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "self_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  12000000 by 1000000) valueattrs=(size=10);

label p50_self_tested_0 = "Option 0 (median) ";
label p50_self_tested_1 = "Option 1 (median) ";

series  x=cald y=p50_n_self_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_self_tested_0 	upper=p95_n_self_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_self_tested_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_self_tested_1 	upper=p95_n_self_tested_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";


run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_trad_circ_0 = "Option 0 Traditional";
label p50_p_trad_circ_1 = "Option 1 Traditional";

label o_circ1549_phia = "PHIA All";
label o_trad_circ1549_phia = "PHIA traditional";
label o_vmmc1549_phia = "PHIA VMMC";
label o_circ1549_dhs = "All, DHS";


series  x=cald y=p50_p_trad_circ_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_trad_circ_0 	upper=p95_p_trad_circ_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_trad_circ_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_trad_circ_1 	upper=p95_p_trad_circ_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_circ1549_phia/	markerattrs = (symbol=square color=black  size = 10) ;
scatter  x=cald y=o_trad_circ1549_phia/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_vmmc1549_phia/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_circ1549_dhs/	markerattrs = (symbol=square color=red  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);

label p50_prop_w_1549_sw_0 = "Option 0 Current FSW 15-49";
label p50_prop_w_1549_sw_1 = "Option 1 Current FSW 15-49";

label o_p_fsw_UNAIDS="% FSW of 15-49 women";

series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 80000 by 10000) valueattrs=(size=10);

label p50_n_sw_1549__0 = "Option 0 Current FSW 15-49";
label p50_n_sw_1549__1 = "Option 1 Current FSW 15-49";
label o_pop_fsw_UNAIDS= "Number of FSW 15-49 (UNAIDS)";

series  x=cald y=p50_n_sw_1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sw_1549__0 	upper=p95_n_sw_1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_1549__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_1549__1 	upper=p95_n_sw_1549__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_pop_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_tested_sw_0 = "FSW tested Op 0 (median) ";
label p50_p_tested_sw_1 = "FSW tested Op 1 (median) ";

series  x=cald y=p50_p_tested_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_sw_0 	upper=p95_p_tested_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_sw_1	/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_tested_sw_1 	upper=p95_p_tested_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW with HIV, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_diag_sw_0 = "FSW diagnosed Op 0 (median) ";
label p50_p_diag_sw_1 = "FSW diagnosed Op 1 (median) ";

series  x=cald y=p50_p_diag_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_sw_0 	upper=p95_p_diag_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_sw_1	/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_sw_1 	upper=p95_p_diag_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 Op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 Op 1 (median) ";

label o_prev_fsw_UNAIDS = "UNAIDS";
label o_prev_fsw_abid_kof = "Abidjan (Koffi)";
label o_prev_fsw_abid_ghys = "Abidjan (Ghys)";

series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_prev_fsw_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev_fsw_abid_kof/	markerattrs = (symbol=square color=orange  size = 10) ;
scatter  x=cald y=o_prev_fsw_abid_ghys/	markerattrs = (symbol=square color=blue  size = 10) ;

run;quit;

proc sgplot data=d; 
title    height=1.5 justify=center "Proportion of sex workers with 0 condomless partners";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to &year_end by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_fsw_newp0__0 = "Option 0";
label p50_p_fsw_newp0__1 = "Option 1";

label o_condom_lastsex = "Condom use last sex - Ghys";
label o_condom_lastsex = "Condom use last sex - NSP";

series  x=cald y=p50_p_fsw_newp0__0  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_fsw_newp0__0	 upper=p95_p_fsw_newp0__0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_fsw_newp0__1  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_fsw_newp0__1	 upper=p95_p_fsw_newp0__1 / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

scatter  x=cald y=o_condom_lastsex/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_condom_lastsex_nsp/	markerattrs = (symbol=square color=blue  size = 10) ;

run;quit;

proc sgplot data=d; 
title    height=1.5 justify=center "Proportion of sex workers attending a program";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to &year_end by 2) 		valueattrs=(size=10); 
yaxis grid label 	= 'Proportion' 		labelattrs=(size=12)   		valueattrs=(size=10);

label p50_p_sw_prog_vis_0 = "Option 0";
label p50_p_sw_prog_vis_1 = "Option 1";

label o_sw_in_prog_nsp= "NSP";

series  x=cald y=p50_p_sw_prog_vis_0  / 	 lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_0	 upper=p95_p_sw_prog_vis_0 / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_p_sw_prog_vis_1  / 	 lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_sw_prog_vis_1	 upper=p95_p_sw_prog_vis_1 / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";

scatter  x=cald y=o_sw_in_prog_nsp/	markerattrs = (symbol=square color=green  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW who have started PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)   valueattrs=(size=10);

label p50_n_prep_oral_ever_sw_0 = "Model 0";
label p50_n_prep_oral_ever_sw_1 = "Model 1";

label o_fsw_start_prep_PEPFAR = "PEPFAR";

series  x=cald y=p50_n_prep_oral_ever_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_ever_sw_0 	upper=p95_n_prep_oral_ever_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_ever_sw_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_oral_ever_sw_1 	upper=p95_n_prep_oral_ever_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_fsw_start_prep_PEPFAR/	markerattrs = (symbol=square color=green  size = 10) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02   by 0.005 ) valueattrs=(size=10);

label p50_prop_w_1524_onprep_0 = "Model 0";
label p50_prop_w_1524_onprep_1 = "Model 1";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.03   by 0.005 ) valueattrs=(size=10);

label p50_prop_1564_onprep_0 = "Option 0 (median) ";
label p50_prop_1564_onprep_1 = "Option 1 (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of 15+ adults who ever started PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)   values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_prep_ever_0 = "Option 0 (median) ";
label p50_n_prep_ever_1 = "Option 1 (median) ";
label o_prepstart_pepfar = "PEPFAR";

series  x=cald y=p50_n_prep_ever_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_ever_0 	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_ever_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_ever_1 	upper=p95_n_prep_ever_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_prepstart_pepfar/	markerattrs = (symbol=square color=red  size = 10) ;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.20 by 0.05) valueattrs=(size=10);

label p50_prevalence1549m_0 = "Option 0";
label p50_prevalence1549m_1 = "Option 1";

label o_prev1549m_phia = "PHIA";
label o_prev1549_UNAIDS = "UNAIDS";
label o_prev_m_urb_Benoit = "Benoit urban";
label o_prev_m_rur_Benoit = "Benoit rural";
label o_prev1549m_dhs = "DHS";

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";


scatter  x=cald y=o_prev1549m_phia/	markerattrs = (symbol=square color=red  size = 10) ;
scatter  x=cald y=o_prev1549m_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev_m_urb_Benoit/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_prev_m_rur_Benoit/	markerattrs = (symbol=square color=orange  size = 10) ;
scatter  x=cald y=o_prev1549m_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);

label p50_prevalence1549w_0 = "Option 0";
label p50_prevalence1549w_1 = "Option 0";

label o_prev1549w_phia = "PHIA";
label o_prev1549w_UNAIDS = "UNAIDS";
label o_prev_w_urb_Benoit = "Benoit urban";
label o_prev_w_rur_Benoit = "Benoit rural";
label o_prev1549w_dhs = "DHS";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";


scatter  x=cald y=o_prev1549w_phia/	markerattrs = (symbol=square color=red  size = 10) ;
scatter  x=cald y=o_prev1549w_UNAIDS/	markerattrs = (symbol=square color=green  size = 10) ;
scatter  x=cald y=o_prev_w_urb_Benoit/	markerattrs = (symbol=square color=blue  size = 10) ;
scatter  x=cald y=o_prev_w_rur_Benoit/	markerattrs = (symbol=square color=orange  size = 10) ;
scatter  x=cald y=o_prev1549w_dhs/	markerattrs = (symbol=square color=purple  size = 10) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.05) valueattrs=(size=10);

label p50_incidence1549m_0 = "Option 0";
label p50_incidence1549m_1 = "Option 1";
label o_Incid1549m_phia = "PHIA";

series  x=cald y=p50_incidence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_incidence1549m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549m_1 	upper=p95_incidence1549m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_Incid1549m_phia / 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label p50_incidence1549w_0 = "Option 0 (median) ";
label p50_incidence1549w_1 = "Option 1 (median) ";
label o_Incid1549m_phia = "PHIA";

series  x=cald y=p50_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_incidence1549w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549w_1 	upper=p95_incidence1549w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_Incid1549w_phia / 		markerattrs = (symbol=square color=green size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_vlsupp_0 = "Option 0";
label p50_p_inf_vlsupp_1 = "Option 1 ";

series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_inf_vlsupp_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_mtct_prop_0 = "Option 0 (median) ";
label p50_mtct_prop_1 = "Option 1 (median)";

series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of men with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_m_0 = "Option 0";
label p50_p_diag_m_1 = "Option 1";

label o_diag1564m_phia = "PHIA";
label o_diag1564_UNAIDS = "UNAIDS ALL";
label o_diag_NSPm = "NSP";

series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_diag1564m_phia / 		markerattrs = (symbol=square color=green size = 10);
scatter x=cald y=o_diag1564_UNAIDS / 		markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_diag_NSPm / 		markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of women with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_w_0 = "Option 0";
label p50_p_diag_w_1 = "Option 1";

label o_diag1564w_phia = "PHIA";
label o_diag1564_UNAIDS = "UNAIDS ALL";
label o_diag_NSPw = "NSP";


series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";


scatter x=cald y=o_diag1564w_phia / 		markerattrs = (symbol=square color=green size = 10);
scatter x=cald y=o_diag1564_UNAIDS / 		markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_diag_NSPw / 		markerattrs = (symbol=square color=orange size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_m_0 = "Option 0";
label p50_p_onart_diag_m_1 = "Option 1";

label o_diag_onart1564m_phia = "PHIA";

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_diag_onart1564m_phia / 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_w_0 = "Option 0";
label p50_p_onart_diag_w_1 = "Option 1";

label o_diag_onart1564w_phia = "PHIA";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_diag_onart1564w_phia / 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_m_0 = "Option 0";
label p50_p_onart_vl1000_m_1 = "Option 1";

label o_art_vs1564m_phia = "PHIA";

series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_art_vs1564m_phia/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_w_0 = "Option 0";
label p50_p_onart_vl1000_w_1 = "Option 1";

label o_art_vs1564w_phia = "PHIA";

series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_art_vs1564w_phia/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";
label p50_p_vl1000__1 = "Option 1 (median) ";
label o_vs1564_UNAIDS = "UNAIDS";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_vs1564_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vg1000__0 = "Option 0 (median) ";
label p50_p_vg1000__1 = "Option 1 (median) ";

series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of VL measures done";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 10000) valueattrs=(size=10);

label p50_n_vm_per_year_0 = "Option 0 (median) ";
label p50_n_vm_per_year_1 = "Option 1 (median) ";

series  x=cald y=p50_n_vm_per_year_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_vm_per_year_0 	upper=p95_n_vm_per_year_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_vm_per_year_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_vm_per_year_1 	upper=p95_n_vm_per_year_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Option 0";
label p50_p_artexp_diag_1 = "Option 1";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label p50_n_onart_0 = "Option 0";
label p50_n_onart_1 = "Option 1";

label o_n_onart_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_onart_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label p50_n_onart_m_0 = "Option 0";
label p50_n_onart_m_1 = "Option 1";

label o_n_onart_m_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_onart_m_1 	upper=p95_n_onart_m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_m_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label p50_n_onart_w_0 = "Option 0 (median) ";
label p50_n_onart_w_1 = "Option 1 (median) ";

label o_n_onart_w_UNAIDS = "UNAIDS";

series  x=cald y=p50_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_onart_w_1 	upper=p95_n_onart_w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_n_onart_w_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_dol_0 = "Option 0 (median) ";
label p50_p_dol_1 = "Option 1 (median) ";

label o_p_dtg_nsp = "On DTG (NSP)";

series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_dol_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

*scatter x=cald y = o_p_dtg_nsp/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive people on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_0 = "Option 0";
label p50_p_onart_1 = "Option 1";

label o_p_onart_nsp= "NSP";
series  x=cald y=p50_p_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_0 	upper=p95_p_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_1 	upper=p95_p_onart_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_p_onart_nsp/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_m_0 = "Option 0";
label p50_p_onart_m_1 = "Option 1";

label o_onart15plus_m_UNAIDS = "UNAIDS";
series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_onart15plus_m_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_w_0 = "Option 0";
label p50_p_onart_w_1 = "Option 1";


label o_onart15plus_w_UNAIDS = "UNAIDS";

series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_onart15plus_w_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "HIV Deaths";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label p50_n_death_hiv_0 = "Option 0 (median) ";
label p50_n_death_hiv_1 = "Option 1 (median) ";

label o_AIDSdeaths_UNAIDS = "AIDS deaths (UNAIDS)";

series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_AIDSdeaths_UNAIDS/ 		markerattrs = (symbol=square color=green size = 10);;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive1564_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by  100000) valueattrs=(size=10);

label p50_n_alive1564_msm_0 = "Option 0 (median) ";
label p50_n_alive1564_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_n_alive1564_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive1564_msm_0 	upper=p95_n_alive1564_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_alive1564_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive1564_msm_1 	upper=p95_n_alive1564_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

*scatter x=cald y = n_msm_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "prop_m_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Percentage'		labelattrs=(size=12)  values = (0 to 0.02 by 0.005) valueattrs=(size=10);

label p50_prop_m_msm_0 = "Option 0 (median) ";
label p50_prop_m_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_prop_m_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_m_msm_0 	upper=p95_prop_m_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prop_m_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_m_msm_1 	upper=p95_prop_m_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_prop_msm/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence msm (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 20  by 1) valueattrs=(size=10);

label p50_incidence1564msm_0 = "Option 0";
label p50_incidence1564msm_1 = "Option 1";

series  x=cald y=p50_incidence1564msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564msm_0 	upper=p95_incidence1564msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_incidence1564msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1564msm_1 	upper=p95_incidence1564msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence msm (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= '%'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_prevalence1549_msm_0 = "Option 0 (median) ";
label p50_prevalence1549_msm_1= "Option 1 (median) ";

series  x=cald y=p50_prevalence1549_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549_msm_0 	upper=p95_prevalence1549_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549_msm_1 	upper=p95_prevalence1549_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y = o_prev_msm/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_msm_infected_from_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_msm_infected_from_msm_0 = "Option 0 (median) ";
label p50_p_msm_infected_from_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_msm_infected_from_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_msm_infected_from_msm_0 	upper=p95_p_msm_infected_from_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


series  x=cald y=p50_p_msm_infected_from_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_msm_infected_from_msm_1 	upper=p95_p_msm_infected_from_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onprep_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1  by 0.01) valueattrs=(size=10);

label p50_p_onprep_msm_0 = "Option 0 (median) ";
label p50_p_onprep_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_onprep_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_msm_0 	upper=p95_p_onprep_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onprep_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onprep_msm_1 	upper=p95_p_onprep_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_elig_prep_any_msm_1564";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_elig_prep_any_msm_1564__0 = "Option 0 (median) ";
label p50_p_elig_prep_any_msm_1564__1 = "Option 1 (median) ";

series  x=cald y=p50_p_elig_prep_any_msm_1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_prep_any_msm_1564__0 	upper=p95_p_elig_prep_any_msm_1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_elig_prep_any_msm_1564__1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_elig_prep_any_msm_1564__1 	upper=p95_p_elig_prep_any_msm_1564__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onart_msm_0 = "Option 0 (median) ";
label p50_p_onart_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_onart_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_msm_0 	upper=p95_p_onart_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_msm_1 	upper=p95_p_onart_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_prevalence_vg1000_msm_0 = "Option 0 (median) ";
label p50_prevalence_vg1000_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_prevalence_vg1000_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000_msm_0 	upper=p95_prevalence_vg1000_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence_vg1000_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence_vg1000_msm_1 	upper=p95_prevalence_vg1000_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 10000  by 1000) valueattrs=(size=10);

label p50_n_tested_msm_0 = "Option 0 (median) ";
label p50_n_tested_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_n_tested_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_msm_0 	upper=p95_n_tested_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_tested_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_msm_1 	upper=p95_n_tested_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_diag_msm_0 = "Option 0 (median) ";
label p50_p_diag_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_msm_0 	upper=p95_p_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_diag_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_msm_1 	upper=p95_p_diag_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_msm_0 = "Option 0 (median) ";
label p50_p_onart_diag_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_onart_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_msm_0 	upper=p95_p_onart_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_diag_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_diag_msm_1 	upper=p95_p_onart_diag_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onart_sw_0 = "Option 0 (median) ";
label p50_p_onart_sw_1 = "Option 1 (median) ";

series  x=cald y=p50_p_onart_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_sw_0 	upper=p95_p_onart_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_sw_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_sw_1 	upper=p95_p_onart_sw_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 10000) valueattrs=(size=10);

label p50_n_pwid_0 = "Option 0 (median) ";
label p50_n_pwid_1 = "Option 1 (median) ";

series  x=cald y=p50_n_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pwid_0 	upper=p95_n_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_pwid_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_pwid_1 	upper=p95_n_pwid_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_prevalence_pwid_0 = "Option 0 (median) ";
label p50_prevalence_pwid_1 = "Option 1 (median) ";


series  x=cald y=p50_prevalence_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_pwid_0 	upper=p95_prevalence_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence_pwid_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence_pwid_1 	upper=p95_prevalence_pwid_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

*scatter x=cald y = prevalence_pwid_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onart_pwid_0 = "Option 0 (median) ";
label p50_p_onart_pwid_1 = "Option 1 (median) ";

series  x=cald y=p50_p_onart_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_pwid_0 	upper=p95_p_onart_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onart_pwid_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_pwid_1 	upper=p95_p_onart_pwid_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_onprep_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_onprep_pwid_0 = "Option 0 (median) ";
label p50_p_onprep_pwid_1 = "Option 1 (median) ";

series  x=cald y=p50_p_onprep_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_pwid_0 	upper=p95_p_onprep_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_onprep_pwid_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onprep_pwid_1 	upper=p95_p_onprep_pwid_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;  
	  	 

proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_art_gt6m_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label p50_p_vl1000_art_gt6m_msm_0 = "Option 0 (median) ";
label p50_p_vl1000_art_gt6m_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_vl1000_art_gt6m_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000_art_gt6m_msm_0 	upper=p95_p_vl1000_art_gt6m_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_vl1000_art_gt6m_msm_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vl1000_art_gt6m_msm_1 	upper=p95_p_vl1000_art_gt6m_msm_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

***CHeck this option 4;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1.2  by 0.1) valueattrs=(size=10);

label p50_p_diag_msm_0 = "Option 0 (median) ";
label p50_p_diag_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_diag_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_pwid_0 	upper=p95_p_diag_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_diag_pwid_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_pwid_1 	upper=p95_p_diag_pwid_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_tb";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.01  by 0.001) valueattrs=(size=10);

label p50_p_diag_msm_0 = "Option 0 (median) ";
label p50_p_diag_msm_1 = "Option 1 (median) ";

series  x=cald y=p50_p_tb_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tb_0 	upper=p95_p_tb_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_tb_1/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_tb_1 	upper=p95_p_tb_1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

ods rtf close;
ods listing;
run;



***CALIBRATION COMPARISON WITH OTHER MODELS;
***For output into Excel file;
libname a "C:\Users\loveleen\Dropbox (UCL)\hiv synthesis ssa unified program\output files\CdI";
data b;
set a.l_base_CdI_12aug24;
s_sw_1549_ = s_sw_1549;

proc sort; by cald run ;run;
proc freq;table run;where cald=2022;run;

data y;
set b;

keep 
cald 	run		n_alive1549_		n_alive1549m  	n_alive1549w	prevalence1549_  prevalence1549m  	  prevalence1549w
n_newinf1549_	n_newinf1549m		n_newinf1549w	p_diag1549_		p_diag1549m		 p_diag1549w
p_onart_diag 	p_onart_diag_m 		p_onart_diag_w  p_onart_vl1000_	p_onart_vl1000_m p_onart_vl1000_w	  prop_w_1549_sw
prop_sw_hiv1549_  	p_mcirc			p_vmmc			p_trad_circ		n_death_hiv 	 n_death_hiv_m 		  n_death_hiv_w
n_hiv				n_hiv_m			n_hiv_w			prevalence1549_msm 	prop_m_msm	 incidence1549_per1000_	
incidence1549m_per1000_				incidence1549w_per1000_			n_onart			 n_onart_m			  n_onart_w		
;

run;

proc freq;table prevalence1549_msm;run;
proc sort data=y; by cald run ;run;
data y;set y;count_csim+1;by  cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=y;var count_csim cald;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 348 ;
%let year_end = 2045 ;
proc sort;by cald ;run;




%macro var_d(v);
data one;set y;keep &v count_csim cald;
proc sort;by count_csim cald;
%let count=2000;
%do %while (&count le 2045);
***line below calculates means over calendar period;
proc means noprint data = one; var &v; output out = y_&count mean=&v._&count; by count_csim ; where &count <= cald < &count+1;
%let count = %eval(&count + 1);
%end;

data &v ;merge 
y_2000 y_2001 y_2002 y_2003 y_2004 y_2005 y_2006 y_2007 y_2008 y_2009 y_2010
	   y_2011 y_2012 y_2013 y_2014 y_2015 y_2016 y_2017 y_2018 y_2019 y_2020
	   y_2021 y_2022 y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030
	   y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040
   	   y_2041 y_2042 y_2043 y_2044 y_2045 /*y_2046 y_2047 y_2048 y_2049 y_2050*/;

drop _NAME_ _TYPE_ _FREQ_;run;
proc datasets nodetails nowarn nolist;

delete y_2000 y_2001 y_2002 y_2003 y_2004 y_2005 y_2006 y_2007 y_2008 y_2009 y_2010
	   		  y_2011 y_2012 y_2013 y_2014 y_2015 y_2016 y_2017 y_2018 y_2019 y_2020
	   		  y_2021 y_2022 y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030
	   		  y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040
   	   		  y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050;quit;

proc transpose data=&v out=l_&v prefix=&v;id  count_csim;run;
data l_&v;set l_&v;
cald= input(substr(_NAME_,length(_NAME_)-3,4),4.);drop _NAME_;run;

data l_&v;set l_&v;

*p95_&v = PCTL(95,of &v.1-&v.&nfit);
mean_&v = mean(of &v.1-&v.&nfit);
keep cald /*p5_&v p95_&v*/ mean_&v;

run;
proc datasets nodetails nowarn nolist;delete &v;run;
%mend var_d;

%var_d(n_alive1549_);		%var_d(n_alive1549m);  		%var_d(n_alive1549w);		%var_d(prevalence1549_);  
%var_d(prevalence1549m);	%var_d(prevalence1549w);	%var_d(n_newinf1549_);		%var_d(n_newinf1549m);	
%var_d(n_newinf1549w);		%var_d(p_diag1549_);		%var_d(p_diag1549m);		%var_d(p_diag1549w);	
%var_d(p_onart_diag); 		%var_d(p_onart_diag_m); 	%var_d(p_onart_diag_w);  	%var_d(p_onart_vl1000_);
%var_d(p_onart_vl1000_m);	%var_d(p_onart_vl1000_w);	%var_d(prop_w_1549_sw);		%var_d(prop_sw_hiv1549_);
%var_d(p_mcirc);			%var_d(p_vmmc);				%var_d(p_trad_circ);		%var_d(n_death_hiv);
%var_d(n_death_hiv_m);		%var_d(n_death_hiv_w);		%var_d(n_hiv);				%var_d(n_hiv_m);		
%var_d(n_hiv_w);			%var_d(prevalence1549_msm); %var_d(prop_m_msm);			%var_d(n_onart);		
%var_d(n_onart_m);			%var_d(n_onart_w);			%var_d(incidence1549_per1000_);  %var_d(incidence1549m_per1000_);
%var_d(incidence1549w_per1000_); 

data all;
merge 
l_n_alive1549m   	l_n_alive1549w 		l_n_alive1549_		l_prevalence1549m 	l_prevalence1549w 	l_prevalence1549_
l_n_newinf1549m 	l_n_newinf1549w 	l_n_newinf1549_ 	l_p_diag1549m 		l_p_diag1549w		l_p_diag1549_ 
l_p_onart_diag_m  	l_p_onart_diag_w 	l_p_onart_diag  	l_p_onart_vl1000_m 	l_p_onart_vl1000_w  l_p_onart_vl1000_ 
l_prop_w_1549_sw 	l_prop_sw_hiv1549_ 	l_p_mcirc 			l_p_vmmc 			l_p_trad_circ 		
l_n_death_hiv_m		l_n_death_hiv_w		l_n_death_hiv 		l_n_hiv_m			l_n_hiv_w			l_n_hiv l_prevalence1549_msm 
l_prop_m_msm		l_incidence1549m_per1000_ 				l_incidence1549w_per1000_  				l_incidence1549_per1000_ 
l_n_onart_m  		l_n_onart_w  		l_n_onart ;run;

*ods results off;

ods excel file="C:\Users\loveleen\UCL Dropbox\Loveleen bansi-matharu\Loveleen\Synthesis model\WHO Ivory Coast\comparison12aug.xlsx"
options(sheet_name='base1' start_at='A2');
proc print data=all noobs;run;
