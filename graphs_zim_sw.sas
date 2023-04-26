
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;
* options user="/folders/myfolders/";

libname a "C:\Users\lovel\Dropbox (UCL)\hiv synthesis ssa unified program\output files\Deaths Zim\19Apr23";

data a;
set a.zim19Apr;  
proc sort;by run;
proc freq;table cald;run;

data sf;
set a;
 
if cald=2023;
s_alive = s_alive_m + s_alive_w ;
sf_2023 = 10000000 / s_alive;
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
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
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
* prop_sw_onprep; 				if (s_sw_1564 - s_hiv_sw) gt 0 then prop_sw_onprep = s_prep_any_sw/ (s_sw_1564 - s_hiv_sw) ;

* p_diag_sw;					if s_hiv_sw > 0 then p_diag_sw = s_diag_sw / s_hiv_sw; 
* p_onart_diag_sw;				if s_diag_sw > 0 then p_onart_diag_sw = s_onart_sw / s_diag_sw;
* p_onart_vl1000_sw;			if s_onart_gt6m_iicu_sw > 0 then p_onart_vl1000_sw = s_vl1000_art_gt6m_iicu_sw / s_onart_gt6m_iicu_sw ;

* prevalence_sw;				prevalence_sw = s_hiv_sw1549_ / s_sw_1549; 

* incidence_sw;					if (s_sw_1564  - s_hiv_sw  + s_primary_sw) gt 0 then incidence_sw =(s_primary_sw * 4 * 100) / (s_sw_1564  - s_hiv_sw  + s_primary_sw);

*sti;							p_sti_sw = s_sti_sw/s_sw_1564;

proc sort; by cald run ;run;


data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 600   ;
%let year_end = 2041.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

***StART HERE:

%let var =  
dur0to3_sw_1_  dur3to5_sw_1_  dur6to9_sw_1_  dur10to19_sw_1_
dur0to3_sw_nodis_1_  dur3to5_sw_nodis_1_  dur6to9_sw_nodis_1_  dur10to19_sw_nodis_1_
dur0to3_sw_mild_1_  dur3to5_sw_mild_1_  dur6to9_sw_mild_1_  dur10to19_sw_mild_1_

dur0to3_sw_2_  dur3to5_sw_2_  dur6to9_sw_2_  dur10to19_sw_2_
dur0to3_sw_nodis_2_  dur3to5_sw_nodis_2_  dur6to9_sw_nodis_2_  dur10to19_sw_nodis_2_
dur0to3_sw_mild_2_  dur3to5_sw_mild_2_  dur6to9_sw_mild_2_  dur10to19_sw_mild_2_

n_sw_1564_1_  n_sw_1549_1_  prop_w_1564_sw_1_  prop_w_1549_sw_1_  prop_w_ever_sw_1_  p_sw_prog_vis_1_  prop_sw_hiv_1_  prop_sw_newp0_1_
t_sw_newp_1_  n_tested_sw_1_  p_newp_sw_1_  prop_sw_onprep_1_  prevalence_sw_1_  incidence_sw_1_  p_diag_sw_1_  p_onart_diag_sw_1_
p_onart_vl1000_sw_1_

n_sw_1564_nodis_1_  n_sw_1549_nodis_1_  prop_w_1564_sw_nodis_1_  prop_w_1549_sw_nodis_1_  prop_w_ever_sw_nodis_1_  p_sw_prog_vis_nodis_1_  prop_sw_hiv_nodis_1_  prop_sw_newp0_nodis_1_
t_sw_newp_nodis_1_  n_tested_sw_nodis_1_  p_newp_sw_nodis_1_  prop_sw_onprep_nodis_1_  prevalence_sw_nodis_1_  incidence_sw_nodis_1_  p_diag_sw_nodis_1_  p_onart_diag_sw_nodis_1_
p_onart_vl1000_sw_nodis_1_

n_sw_1564_mild_1_  n_sw_1549_mild_1_  prop_w_1564_sw_mild_1_  prop_w_1549_sw_mild_1_  prop_w_ever_sw_mild_1_  p_sw_prog_vis_mild_1_  prop_sw_hiv_mild_1_  prop_sw_newp0_mild_1_
t_sw_newp_mild_1_  n_tested_sw_mild_1_  p_newp_sw_mild_1_  prop_sw_onprep_mild_1_  prevalence_sw_mild_1_  incidence_sw_mild_1_  p_diag_sw_mild_1_  p_onart_diag_sw_mild_1_
p_onart_vl1000_sw_mild_1_


n_sw_1564_2_  n_sw_1549_2_  prop_w_1564_sw_2_  prop_w_1549_sw_2_  prop_w_ever_sw_2_  p_sw_prog_vis_2_  prop_sw_hiv_2_  prop_sw_newp0_2_
t_sw_newp_2_  n_tested_sw_2_  p_newp_sw_2_  prop_sw_onprep_2_  prevalence_sw_2_  incidence_sw_2_  p_diag_sw_2_  p_onart_diag_sw_2_
p_onart_vl1000_sw_2_
n_sw_1564_nodis_2_  n_sw_1549_nodis_2_  prop_w_1564_sw_nodis_2_  prop_w_1549_sw_nodis_2_  prop_w_ever_sw_nodis_2_  p_sw_prog_vis_nodis_2_  prop_sw_hiv_nodis_2_  prop_sw_newp0_nodis_2_
t_sw_newp_nodis_2_  n_tested_sw_nodis_2_  p_newp_sw_nodis_2_  prop_sw_onprep_nodis_2_  prevalence_sw_nodis_2_  incidence_sw_nodis_2_  p_diag_sw_nodis_2_  p_onart_diag_sw_nodis_2_
p_onart_vl1000_sw_nodis_2_
n_sw_1564_mild_2_  n_sw_1549_mild_2_  prop_w_1564_sw_mild_2_  prop_w_1549_sw_mild_2_  prop_w_ever_sw_mild_2_  p_sw_prog_vis_mild_2_  prop_sw_hiv_mild_2_  prop_sw_newp0_mild_2_
t_sw_newp_mild_2_  n_tested_sw_mild_2_  p_newp_sw_mild_2_  prop_sw_onprep_mild_2_  prevalence_sw_mild_2_  incidence_sw_mild_2_  p_diag_sw_mild_2_  p_onart_diag_sw_mild_2_
p_onart_vl1000_sw_mild_2_

incidence1549_1_  incidence1549w_1_  incidence1549m_1_  incidence1549_2_  incidence1549w_2_  incidence1549m_2_

dur0to3_sw_1_  dur3to5_sw_1_  dur6to9_sw_1_  dur10to19_sw_1_
dur0to3_sw_nodis_1_  dur3to5_sw_nodis_1_  dur6to9_sw_nodis_1_  dur10to19_sw_nodis_1_
dur0to3_sw_mild_1_  dur3to5_sw_mild_1_  dur6to9_sw_mild_1_  dur10to19_sw_mild_1_

dur0to3_sw_2_  dur3to5_sw_2_  dur6to9_sw_2_  dur10to19_sw_2_
dur0to3_sw_nodis_2_  dur3to5_sw_nodis_2_  dur6to9_sw_nodis_2_  dur10to19_sw_nodis_2_
dur0to3_sw_mild_2_  dur3to5_sw_mild_2_  dur6to9_sw_mild_2_  dur10to19_sw_mild_2_
;
***transpose given name; *starts with %macro and ends with %mend;
%macro option_0;
%let p25_var = p25_&var_0;
%let p75_var = p75_&var_0;
%let p5_var = p5_&var_0;
%let p95_var = p95_&var_0;
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
p50_&varb._0 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;



data option_1;
set b;
if option =0 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m 		
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence1549_  prevalence_vg1000_  incidence1549_ incidence1564_ 
incidence1524w_ incidence1524m_ incidence2534w_ incidence2534m_ incidence3544w_ incidence3544m_ incidence4554w_ incidence4554m_ 
incidence5564w_ incidence5564m_ n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart ;


***transpose given name; *starts with %macro and ends with %mend;
%macro option_1;
%let p25_var = p25_&var_1;
%let p75_var = p75_&var_1;
%let p5_var = p5_&var_1;
%let p95_var = p95_&var_1;
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
p50_&varb._1 = median(of &varb.1-&varb.&nfit);

keep cald option p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;



data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25  g26 
g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48   g49  g50 
g51  g52 
g53  g54  g55  g56  g57  g58  g59  g60 g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71 g72 /* g73 g74 g75  g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100 g101 g102 g103 g104
g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52 h53   h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72 h73
*/
;
by cald;
ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 

ods html ;



proc sgplot data=e; 
Title    height=1.5 justify=center "FSW Population (age 15-49)";

xaxis label       = 'Year'                labelattrs=(size=12)  values = (2010 to 2025 by 2)        valueattrs=(size=10); 
yaxis grid label  = 'Number'              labelattrs=(size=12)  values = (0 to 130000)  valueattrs=(size=10);
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
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
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

proc sgplot data=e; 
title    height=1.5 justify=center "90-90-90 indicators amongst all sex workers (age 15-49)";
footnote1 height=0.9  "";
xaxis label 		= 'Year'			labelattrs=(size=12)  values = (2010 to 2025 by 2) 		valueattrs=(size=10); 
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


