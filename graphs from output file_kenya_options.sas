

***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

ods html close;

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\kenya\";

  proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";

data b;
  set a.l_base_kenya_ah_options_e ;


  s = 112 ;
  if option ne 0 and option ne s then delete;
  if option = s then option = 1;



/*


1 General community testing in adults, not focussed only on those with recent sexual risk (administered by community health workers)	Proportion of PLHIV aware of HIV status = 100%

2 Recent sexual risk-informed testing (clinic-based) (index testing, testing in STI clinics) in adults 	Proportion of PLHIV aware of HIV status = 100%;

3 General wide distribution of self tests in adults, not focussed only on those with recent sexual risk	Proportion of PLHIV aware of HIV status = 100%

4 Recent sexual risk-informed self-testing (index testing) for adults	Proportion of PLHIV aware of HIV status = 100%

5 General community testing in AGYW not focussed only on those with recent sexual risk (e.g. as in DREAMS)	Proportion of PLHIV aware of HIV status = 100%

6 Behaviour change advice for AGYW to reduce condomless sex and condom provision (e.g. as in DREAMS)	Proportion of people using condoms at last
sexual encounter = 95%

7 VMMC males aged 15+	Increase in male circumcision in priority counties = 80% **

8 Increased oral PrEP / PEP support and uptake 	Proportion of at risk populations initiated on (any) PrEP = 80%***

9 Increased oral PrEP / PEP support and uptake plus Cab-LA PrEP	Proportion of at risk populations initiated on (any) PrEP = 80%

10 Increased oral PrEP / PEP support and uptake plus Cab-LA PrEP and dapivirine ring	Proportion of at risk populations initiated on (any) PrEP = 80%

11 Harm reduction services for PWID	Proportion of PWID using sterile needles and syringes in the last injecting episode = 100%
Proportion of PWID using Medically Assisted Therapy = 80%

12 Interventions to maximize linkage to care and retention in PLHIV 	Proportion of PLHIV with known HIV status on ART = 95%

13 Interventions to enhance adherence in people on ART	Proportion of PLHIV on ART achieving viral suppression  = 95% 

14 Interventions to maximize ART coverage in pregnant and breastfeeding women living with HIV 	Proportion of PLHIV aware of HIV status = 100%
Proportion of PLHIV with known HIV status on ART = 95%

15 Maximize access to the WHO AHD package of care (having the effect of a reduction in AIDS death rate)	WHO package of care fully implemented.

*/


p_onart_vl1000_all = .;

* NB: note lines below, because variable names cannot end with a number;
log_gender_r_newp  = log(gender_r_newp);

n_cd4_lt200_ = n_cd4_lt200;

p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;  
n_dead_hivpos_cause1_ = n_dead_hivpos_cause1;
p_el_prep_any_msm_1564_ = p_elig_prep_any_msm_1564;
n_onprep = n_onprep_w + n_onprep_m ;
p_births_hiv_vlg1000_ = p_births_hiv_vlg1000;
p_diag_w1524_ = p_diag_w1524;
p_diag_m1524_ = p_diag_m1524;
p_newp_ge5_ = p_newp_ge5;

loggender_r_newp = log(gender_r_newp+0.0001);

logw15r = log(w15r+0.0001);
logw25r = log(w25r+0.0001);
logw35r = log(w35r+0.0001);
logw45r = log(w45r+0.0001);
logw55r = log(w55r+0.0001);
logm15r = log(m15r+0.0001);
logm25r = log(m25r+0.0001);
logm35r = log(m35r+0.0001);
logm45r = log(m45r+0.0001);
logm55r = log(m55r+0.0001);

incidence1564_ = incidence1564;

n_tested_due_to_self_test = n_tested_due_to_self_t ;

* n_onprep_m  n_onprep_w ;



proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  30   ;
%let year_end = 2040.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

%let var =  


p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m	  n_prep_elig_w  n_prep_elig_m	 n_onprep_w  n_onprep_m n_onprep  n_newp_ge1_w
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence_vg1000_   
incidence1564_  incidence1564m incidence1564w incidence1549m incidence1549w n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart_m n_onart_w n_onart n_dead_hivpos_cause1_ n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed n_hiv  n_infected 
 p_inf_msm p_inf_pwid  prop_elig_on_prep

n_alive_msm	 n_alive1564_msm incidence1549msm incidence1564msm  prevalence1549_msm	prevalence1564_msm  p_el_prep_any_msm_1564_ p_onprep_msm				
 p_onart_msm   prevalence_vg1000_msm	 p_diag_msm	 p_onart_diag_msm p_vl1000_art_gt6m_msm	 p_ever_tested_msm 		
 p_tested_this_period_msm p_msm_infected_from_msm   n_alive1564_msm   prevalence_pwid  n_pwid  p_onprep_pwid  p_onart_pwid  p_onart_sw
 n_vm_per_year   n_self_tested   n_self_tested_m    n_self_tested_w    n_tested_due_to_self_t  n_diagnosed_self_test  p_newp_ge1_agyw
p_births_hiv_vlg1000_  p_diag_w1524_  p_diag_m1524_  p_newp_ge5_  n_prep_inj n_prep_vr

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
%let mean_var = mean_&var_0;

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
mean_&varb._0 = mean(of &varb.1-&varb.&nfit);

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 p2p5_&varb._0 p97p5_&varb._0 mean_&varb._0;
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
p_mcirc_1549m	  n_prep_elig_w  n_prep_elig_m	 n_onprep_w  n_onprep_m n_onprep  n_newp_ge1_w
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence_vg1000_   
incidence1564_  incidence1564m incidence1564w incidence1549m incidence1549w n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart_m n_onart_w n_onart n_dead_hivpos_cause1_ n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed n_hiv  n_infected 
 p_inf_msm p_inf_pwid  prop_elig_on_prep

n_alive_msm	 n_alive1564_msm incidence1549msm incidence1564msm  prevalence1549_msm	prevalence1564_msm  p_el_prep_any_msm_1564_ p_onprep_msm				
 p_onart_msm   prevalence_vg1000_msm	 p_diag_msm	 p_onart_diag_msm p_vl1000_art_gt6m_msm	 p_ever_tested_msm 		
 p_tested_this_period_msm p_msm_infected_from_msm   n_alive1564_msm   prevalence_pwid  n_pwid  p_onprep_pwid  p_onart_pwid  p_onart_sw
 n_vm_per_year   n_self_tested   n_self_tested_m    n_self_tested_w    n_tested_due_to_self_t n_diagnosed_self_test  p_newp_ge1_agyw
p_births_hiv_vlg1000_ p_diag_w1524_  p_diag_m1524_  p_newp_ge5_   n_prep_inj  n_prep_vr 

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
%let mean_var = mean_&var_1;

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
mean_&varb._1 = mean(of &varb.1-&varb.&nfit);


keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1 p2p5_&varb._1 p97p5_&varb._1 mean_&varb._1;
run;

      proc datasets nodetails nowarn nolist; 
      delete  hh&count;quit;run;
%end;
%mend;


%option_1;
run;



data d; * this is number of variables in %let var = above ;
merge 
g1  g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14 

 g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25  g26 
g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48   g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60 g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71 g72  g73  g74 g75 g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93 g94  g95 g96 g97  g98  g99  g100  g101  g102 
 g103  g104 g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124
g125 g126 g127 g128 g129 g130 g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142


/*
g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 
*/

h1  h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14 
 h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52 h53   h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72  h73  h74  h75
h77  h78 h79  h80  h81  h82  h83  h84  h85  h86  h87  h88  h89  h90  h91  h92   h93  h94  h95  h96 h97  h98  h99  h100   h101
h102  h103  h104 h105 h106 h107 h108 h109 h110 h111 h112 h113 h114 h115 h116 h117 h118 h119 h120 h121 h122 h123 h124 h125 h126 h127 h128 h129
h130 h131 h132 h133 h134 h135 h136 h137 h138 h139 h140 h141 h142

;
by cald;




/*


Number of HIV tests done per year in adults (women, men, all adults)


* dhs ; 
ever_tested  
KIAS 2012
men 15-19 45%  20-24 67%  25-29  75%  30-34: 72%  35-39: 71%  40-44  68%   45-49  59%  50-54: 57%   55-59  46%  60-64  50%  
women 15-19 56%  20-24 92%  25-29  94%  30-34: 94%  35-39: 89%  40-44  79%   45-49  72%  50-54: 64%   55-59  51%  60-64  46%  



Number of new diagnoses per year in adults  




Number of adults on art  
Aim file
Men
05: 24000   10: 172000    15: 262000    20: 337000
Women
05: 30000   10: 224000   15: 564000   20: 717000


* spectrum aim;
Prevalence 15-49   
Men           75: 0.0   80: 0.1  85: 0.7  90: 3.8  95: 7.3  00: 6.5  05: 4.8  10: 4.2  15: 3.5   20:2.8   
Women     75: 0.0   80: 0.1  85: 0.8  90: 5.8 95: 12.4  00: 11.5  05: 8.7  10:7.4  15: 7.3  20:  6.5    


Prevalence 15-49
KDHS 2003
Men  4.6%   women 8.9%
KAIS 2007
Men 5.6%  women 9.0%
KAIS 2012
Men 4.2%  women  6.9%
KENPHIA 2018
Men 2.7%   women 6.2%

Prevalence by age 
KENPHIA  2018 
Men 15-19   0.5   20-24  0.6   25-29  2.2  30-34  3.2  35-39  4.3   40-44  6.3  45-49  8.3   50-54  6.6   55-59  5.9   60-64  5.6
Women 15-19   1.2   20-24  3.4   25-29  6.0  30-34  9.5  35-39  8.7   40-44  11.9  45-49  10.6   50-54  11.7   55-59  9.0   60-64  6.2


Incidence 15-64  
KAIS 2007
Men              0.9
Women        1.1
2012
Men              0.7
Women:      0.9
2018  KENPHIA  15-64
Men        0.15
Women  0.15

Proportion men circumcised:  KAIS 2012:  91%


Proportion HIV+ diagnosed  
2012  KAIS
All age 15-64   47%%  
2018   KENPHIA
Men age 15-64   72.6%   Women  82.7%   all  79.5%

Proportion hiv+ diagnosed on art  
2018  KENPHIA
Men  94.5%   women 96.6%   all 96.0%


Proportion adults on ART with VL < 1000 
2018
Men 90.9%  women 90.9%   all 90.9%


Of adults on art, proportion on efavirenz, dolutegravir, boosted PI – men women


dhs 2022

Nineteen percent of women age 15–49 had intercourse with a person who was neither their husband or lived with them in the past year, of whom 37% used a
condom. Thirty-five percent of men age 15–49 had intercourse with a person who was neither their wife or lived with them in the past year, of whom 68% used a
condom.

Taking this as accurate implies ~ 19% x 0.63 =~ 12% having new ge 1 in past year for women and 35% x 0.32 = 11% for men.

(Thirteen percent of women and 6% of men age 15–49 have had an STI or symptoms of an STI in the past 12 months.)
(The average number of sexual partners in a lifetime for men and women age 15–49 is 7.4 and 2.3, respectively.

Eighty-five percent of women and 72% of men age 15–49 have been tested for HIV. In in the last 12 months, 47% of women and 39% of men
age 15–49 had an HIV test.


Prevalence sex workers naiobi  28% 2019  Beattie et al 

proportion of women sex workers  197000 / 14100000 women age 1549 in 2020 = 1.4%



*/



* ########### * need to outputs from model and create graph #############################################################;

if cald=2022 then do; 
prop_w1549_newpge1_past_year_kya = 0.12;
prop_m1549_newpge1_past_year_kya = 0.11;
end;



* placeholder;
if cald=2019.00 then do; n_tests_f_obs_kya = 0 ; n_tests_m_obs_kya = 0 ;  end;

* https://nsdcc.go.ke/hiv-situation-in-kenya/#:~:text=In%202008%2C%20860%2C000%20people%20were,introduction%20of%20self%2Dtesting%20kits.;
if cald=2015 then n_tests_obs_kya = 9900000 / 4; * dividing by 4 as outputing tests per 3 months;


if cald=2012 then prop_m_1549_circ_obs_kya = 0.91;

if cald=2012 then do;
	ever_tested_w_1524_obs_kya= 0.56;
	ever_tested_w_2524_obs_kya= 0.92;
	ever_tested_w_2529_obs_kya= 0.94;
	ever_tested_w_3034_obs_kya= 0.94;
	ever_tested_w_3539_obs_kya= 0.89;
	ever_tested_w_4044_obs_kya= 0.79;
	ever_tested_w_4549_obs_kya= 0.72;
	ever_tested_w_5054_obs_kya= 0.64;
	ever_tested_w_5559_obs_kya= 0.51;
	ever_tested_w_6064_obs_kya= 0.46;

	ever_tested_m_1524_obs_kya= 0.45;
	ever_tested_m_2524_obs_kya= 0.67;
	ever_tested_m_2529_obs_kya= 0.75;
	ever_tested_m_3034_obs_kya= 0.72;
	ever_tested_m_3539_obs_kya= 0.71;
	ever_tested_m_4044_obs_kya= 0.68;
	ever_tested_m_4549_obs_kya= 0.59;
	ever_tested_m_5054_obs_kya= 0.57;
	ever_tested_m_5559_obs_kya= 0.46;
	ever_tested_m_6064_obs_kya= 0.50;
end;

if cald=2022 then do;
	ever_tested_w_1549_obs_kya= 0.85;
	ever_tested_m_1549_obs_kya= 0.72;
	tested_past_year_w_1549_obs_kya = 0.47;
	tested_past_year_m_1549_obs_kya = 0.39;
end;


if cald=2005.00 then n_onart_m_obs_kya= 24000 ;
if cald=2010.00 then n_onart_m_obs_kya= 172000 ;
if cald=2015.00 then n_onart_m_obs_kya= 262000 ;
if cald=2020.00 then n_onart_m_obs_kya= 337000 ;

if cald=2005.00 then n_onart_w_obs_kya= 30000 ;
if cald=2010.00 then n_onart_w_obs_kya= 224000 ;
if cald=2015.00 then n_onart_w_obs_kya= 564000 ;
if cald=2020.00 then n_onart_w_obs_kya= 717000 ;

if cald=2022.00 then n_onart_obs_kya= 1240000 ;


* spectrum aim;

if cald=1980 then prevalence1549_m_obs_kya= 0.001;
if cald=1985 then prevalence1549_m_obs_kya= 0.007;
if cald=1990 then prevalence1549_m_obs_kya= 0.038;
if cald=1995 then prevalence1549_m_obs_kya= 0.073;
if cald=2000 then prevalence1549_m_obs_kya= 0.065;
if cald=2005 then prevalence1549_m_obs_kya= 0.048;
if cald=2010 then prevalence1549_m_obs_kya= 0.042;
if cald=2015 then prevalence1549_m_obs_kya= 0.035;
if cald=2020 then prevalence1549_m_obs_kya= 0.028;
if cald=2022 then prevalence1549_m_obs_kya= 0.024;

if cald=1980 then prevalence1549_w_obs_kya= 0.001;
if cald=1985 then prevalence1549_w_obs_kya= 0.008;
if cald=1990 then prevalence1549_w_obs_kya= 0.058;
if cald=1995 then prevalence1549_w_obs_kya= 0.124;
if cald=2000 then prevalence1549_w_obs_kya= 0.115;
if cald=2005 then prevalence1549_w_obs_kya= 0.087;
if cald=2010 then prevalence1549_w_obs_kya= 0.074;
if cald=2015 then prevalence1549_w_obs_kya= 0.073;
if cald=2020 then prevalence1549_w_obs_kya= 0.065;
if cald=2022 then prevalence1549_w_obs_kya= 0.049;

if cald=2010 then prevalence_msm_obs_kya = 0.182;
if cald=2010 then prevalence_pwid_obs_kya = 0.187;

if cald=2019 then prevalence_sw_obs_kya = 0.28;

if cald=2007.5 then incidence1564_m_obs_kya= 0.90*10;
if cald=2007.5 then incidence1564_w_obs_kya= 1.10*10;
if cald=2012.5 then incidence1564_m_obs_kya= 0.70*10;
if cald=2012.5 then incidence1564_w_obs_kya= 0.90*10;
if cald=2018.5 then incidence1564_m_obs_kya= 0.15*10;
if cald=2018.5 then incidence1564_w_obs_kya= 0.15*10;

if cald=2012.5 then p_diag_obs_kya = 0.47*100;
if cald=2018.5 then p_diag_m_obs_kya = 0.73*100;
if cald=2018.5 then p_diag_w_obs_kya = 0.83*100;
if cald=2018.5 then p_diag_obs_kya = 0.80*100;
if cald=2022   then p_diag_obs_kya = 0.94*100; * unaids 2022 factsheet;

if cald=2018.5 then p_onart_diag_m_obs_kya = 0.95;
if cald=2018.5 then p_onart_diag_w_obs_kya = 0.97;
if cald=2018.5 then p_onart_diag_obs_kya = 0.96;

if cald=2020.5 then p_onart_vl1000_m_obs_kya= 0.91;
if cald=2020.5 then p_onart_vl1000_w_obs_kya= 0.91;
if cald=2020.5 then p_onart_vl1000_obs_kya= 0.91;

if cald=2003 then n_death_hiv_kya = 130000;
if cald=2022 then n_death_hiv_kya = 16000;

if cald = 2010 then n_infected_obs_kya = 70000; * this includes children;
if cald = 2022 then n_infected_obs_kya = 18000; * this is age 15 and over;

if cald = 2022 then n_hiv_kya = 1300000;

if  cald = 2020 then p_w_1549_sw_obs_kya = 0.014;

if cald = 2020  then  n_msm_obs_kya = 61000 ;
if cald = 2022 then n_msm_obs_kya = 32600 ;

if cald = 2022 then n_pwid_obs_kya = 16000;


if cald = 2020 then n_onprep_obs_kya = 28000;  * pharmacy data;
if cald = 2022 then n_onprep_obs_kya = 21000;  * pharmacy data;
if cald = 2024 then n_onprep_obs_kya = 70000; * pharmacy data;

if cald = 2024 then n_vm_obs_kya = 845000;

if cald = 2022 then mtct_rate_obs_kya = 0.086;


/*

Country factsheets 	
KENYA  | 2022		
	
HIV and AIDS Estimates				
Adults and children living with HIV	 1 400 000	 1 200 000	 1 600 000	
Adults aged 15 and over living with HIV	 1 300 000	 1 200 000	 1 500 000	
Women aged 15 and over living with HIV	 860 000	 770 000	 1 000 000	
Men aged 15 and over living with HIV	 450 000	 400 000	 520 000	
Children aged 0 to 14 living with HIV	 68 000	 56 000	 86 000	
Adult aged 15 to 49 HIV prevalence rate	3.7	3.3	4.1	
Women aged 15 to 49 HIV prevalence rate	4.9	4.4	5.6	
Men aged 15 to 49 HIV prevalence rate	2.4	2	2.7	
HIV prevalence among young women	1.7	1.3	2.2	
HIV prevalence among young men	1.1	0.9	1.3	
Adults and children newly infected with HIV	 22 000	 13 000	 36 000	
Adults aged 15 and over newly infected with HIV	 18 000	 10 000	 30 000	
Women aged 15 and over newly infected with HIV	 13 000	7000	 21 000	
Men aged 15 and over newly infected with HIV	5100	2900	8900	
Children aged 0 to 14 newly infected with HIV	4500	3000	7400	
HIV incidence per 1000 population (adults 15-49)	0.68	0.38	1.13	
HIV incidence per 1000 population (all ages)	0.46	0.27	0.74	
Adult and child deaths due to AIDS	 18 000	 15 000	 27 000	
Deaths due to AIDS among adults aged 15 and over	 16 000	 13 000	 24 000	
Deaths due to AIDS among women aged 15 and over	8500	6700	 13 000	
Deaths due to AIDS among men aged 15 and over	7600	6100	 11 000	


HIV testing and treatment cascade				
People living with HIV	 1 400 000	 1 200 000	 1 600 000	
People living with HIV who know their status	 1 300 000	 	 	
Percent of people living with HIV who know their status	94	84	 >98	
People living with HIV who are on ART	 1 300 000	 	 	
Percent of people living with HIV who are on ART	94	84	 >98	
People living with HIV who have suppressed viral loads	 1 200 000	 	 	
Percent of people living with HIV who have suppressed viral loads	89	79	 >98	

Antiretroviral therapy (ART)				
Coverage of adults and children receiving ART (%)	94	84	 >98	
Adults aged 15 and over receiving ART	95	84	 >98	
Women aged 15 and over receiving ART	97	86	 >98	
Men aged 15 and over receiving ART	89	80	 >98	
Children aged 0 to 14 receiving ART	85	70	 >98	
Number of adults and children receiving ART (#)	 1 297 822	 	 	
Adults aged 15 and over receiving ART	 1 240 454	 	 	
Women aged 15 and over receiving ART	 842 285	 	 	
Men aged 15 and over receiving ART	 398 169	 	 	
Children aged 0 to 14 receiving ART	 57 368	 	 	

Elimination of vertical transmission				
Coverage of pregnant women who receive ARV for PMTCT (%)	90	76	 >98	
Pregnant women who received ARV for PMTCT (#)	 46 361	 	 	
Pregnant women needing ARV for PMTCT (#)	 52 000	 44 000	 61 000	
Early infant diagnosis (%)	 >98	85	 >98	
Final vertical transmission rate including during breastfeeding	8.64	6.4	11.81	
New HIV infections averted due to PMTCT (%)	 11 000	7300	 18 000	
Number of HIV-exposed children who are uninfected	 780 000	 660 000	 870 000	

Sex workers				
Population size estimate (#)	 197 100	 	 	Region: National; Methods: Unique object and unique event multiplier, service multiplier, anchored multiplier, 3 sources CRC, literature review, SSPSE, multiple indicator regression and consensus; Source: National AIDS and STI Control Programme (NASCOP), Key Population Size Estimates in Kenya, 2020
Antiretroviral therapy coverage (%)	33.7	 	 	Source: MOH 731 Key Population Summary

Men who have sex with men				
Population size estimate (#)	 32 600	 	 	Region: 30 couties; Method: Programmatic mapping
Antiretroviral therapy coverage (%)	38.8	 	 	Source: MOH 731 B PLUS (KEY POPULATION)

People who inject drugs				
Population size estimate (#)	 16 000	 	 	
Antiretroviral therapy coverage (%)	26.2	 	 	Source: MOH 731 B PLUS KEY POPULATION SUMMARY
Condom use (%)	75.9	 	 	Source: Polling Booth Survey 2017
Safe injecting practices (%)	88.4	 	 	Source: Poll booth survey 2017
Needles and syringes distributed per person who injects drugs (#)	4	 	 	
Coverage of opioid substitution therapy	13.3	 	 	Source: National programme data, 2021

Transgender people				
Population size estimate (#)	4300	 	 	Region: 31 counties; Method: Programmatic mapping;
Antiretroviral therapy coverage (%)	7.3	 	 	Source: MOH 731 PLUS KEY POPULATION SUMMARY
Combination prevention				

People receiving pre-exposure prophylaxis (PrEP) (#)	 155 526	 	 	

Condom use at last high-risk sex among adults aged 15 to 49 (%)	67.9	 	 	Source: 2022 DHS
- Condom use at last high-risk sex among women aged 15 to 49 (%)	36.7	 	 	Source: 2022 DHS
- Condom use at last high-risk sex among men aged 15 to 49 (%)	68	 	 	Source: 2022 DHS


*/



ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 



ods html;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label mean_p_newp_ge1__0 = "Option 0 (median) ";
label mean_p_newp_ge1__1 = "Option 1 (median) ";

series  x=cald y=mean_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02 by 0.005) valueattrs=(size=10);
label mean_p_newp_ge5__0 = "Option 0 (median) ";
label mean_p_newp_ge5__1 = "Option 1 (median) ";

series  x=cald y=mean_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02 by 0.005) valueattrs=(size=10);
label mean_n_newp_0 = "Option 0 (median) ";
label mean_n_newp_1 = "Option 1 (median) ";

series  x=cald y=mean_n_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_newp_0 	upper=p95_n_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_newp_1 	upper=p95_n_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_agyw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label mean_p_newp_ge1_agyw_0 = "Option 0 (median) ";
label mean_p_newp_ge1_agyw_1 = "Option 1 (median) ";

series  x=cald y=mean_p_newp_ge1_agyw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1_agyw_0 	upper=p95_p_newp_ge1_agyw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_newp_ge1_agyw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1_agyw_1 	upper=p95_p_newp_ge1_agyw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of people tested per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  15000000 by  1000000) valueattrs=(size=10);

* label mean_n_tested_0 = "Option 0 (median) ";
* label mean_n_tested_1 = "Option 1 (median) ";

series  x=cald y=mean_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_tested_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter  x=cald y=n_tests_obs_kya/	markerattrs = (symbol=square color=green size = 10);

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of people self-testing per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  15000000 by  1000000) valueattrs=(size=10);

series  x=cald y=mean_n_self_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_self_tested_0 	upper=p95_n_self_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_self_tested_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_self_tested_1 	upper=p95_n_self_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of people diagnosed as a results of self-testing";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  200000 by  20000) valueattrs=(size=10);

series  x=cald y=mean_n_diagnosed_self_test_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_self_test_0 	upper=p95_n_diagnosed_self_test_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_diagnosed_self_test_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diagnosed_self_test_1 	upper=p95_n_diagnosed_self_test_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
* label mean_p_mcirc_1549m_0 = "Option 0 (median) ";
* label mean_p_mcirc_1549m_1 = "Option 1 (median) ";

series  x=cald y=mean_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=prop_m_1549_circ_obs_kya / 		markerattrs = (symbol=square color=green size = 10);


run;quit;





proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of people on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000 by 100000) valueattrs=(size=10);

* label mean_n_onprep_0 = "Option 0 (median) ";
* label mean_n_onprep_1 = "Option 1  (median) ";

series  x=cald y=mean_n_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onprep_0 	upper=p95_n_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onprep_1 	upper=p95_n_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter  x=cald y=n_onprep_obs_kya/	markerattrs = (symbol=square color=green size = 10);

run;quit;




proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of people on Cab PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000 by 100000) valueattrs=(size=10);

* label mean_n_prep_inj_0 = "Option 0 (median) ";
* label mean_n_prep_inj_1 = "Option 1  (median) ";

series  x=cald y=mean_n_prep_inj_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_inj_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_inj_1 	upper=p95_n_prep_inj_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of people on vr PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000   by 1000  ) valueattrs=(size=10);

* label mean_n_prep_vr_0 = "Option 0 (median) ";
* label mean_n_prep_vr_1 = "Option 1  (median) ";

series  x=cald y=mean_n_prep_vr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_vr_0 	upper=p95_n_prep_vr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_vr_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_vr_1 	upper=p95_n_prep_vr_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prop_elig_on_prep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1 ) valueattrs=(size=10);

label mean_prop_elig_on_prep_0 = "Option 0 (median) ";
label mean_prop_elig_on_prep_1 = "Option 1  (median) ";

series  x=cald y=mean_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_elig_on_prep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_1 	upper=p95_prop_elig_on_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Proportion of women aged 15-49 who are female sex workers";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
* label mean_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
* label mean_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";

* label mean_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
* label mean_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";


series  x=cald y=mean_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=p_w_1549_sw_obs_kya / 		markerattrs = (symbol=square color=green size = 10);


run;quit;


proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Prevalence of HIV in female sex workers";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

* label mean_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
* label mean_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";

series  x=cald y=mean_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=prevalence_sw_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;




proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "HIV Prevalence in men age 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.05) valueattrs=(size=10);

* label mean_prevalence1549__0 = "All Option 0 (median) ";
* label mean_prevalence1549__1 = "All Option 1  (median) ";
* label mean_prevalence1549m_0 = "Men Option 0 (median) ";
* label mean_prevalence1549m_1 = "Men Option 1 (median) ";

series  x=cald y=mean_prevalence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549m_1/	lineattrs = (color=red        thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=red       ) legendlabel= "Model 90% range";

series  x=cald y=prevalence1549_m_obs_kya/	lineattrs = (color=green  thickness = 3) ;

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "HIV prevalence in women age 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.05) valueattrs=(size=10);

* label mean_prevalence1549__0 = "All Option 0 (median) ";
* label mean_prevalence1549__1 = "All Option 1  (median) ";
* label mean_prevalence1549w_0 = "Men Option 0 (median) ";
* label mean_prevalence1549w_1 = "Men Option 1 (median) ";

series  x=cald y=mean_prevalence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549w_1/	lineattrs = (color=red        thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=red       ) legendlabel= "Model 90% range";

series  x=cald y=prevalence1549_w_obs_kya/	lineattrs = (color=green  thickness = 3) ;

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Incidence in men (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 15 by   1) valueattrs=(size=10);

* label mean_incidence1564m_0 = "Option 0 (median) ";
* label mean_incidence1564m_1 = "Option 1  (median) ";

series  x=cald y=mean_incidence1564m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564m_0 	upper=p95_incidence1564m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1564m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1564m_1 	upper=p95_incidence1564m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=incidence1564_m_obs_kya / 		markerattrs = (symbol=square color=green size = 10);
run;
quit;


proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Incidence women in (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 15 by   1) valueattrs=(size=10);

* label mean_incidence1564w_0 = "Option 0 (median) ";
* label mean_incidence1564w_1 = "Option 1  (median) ";

series  x=cald y=mean_incidence1564w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564w_0 	upper=p95_incidence1564w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1564w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1564w_1 	upper=p95_incidence1564w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=incidence1564_w_obs_kya / 		markerattrs = (symbol=square color=green size = 10);
run;
quit;





proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of new infections per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 300000 by 10000) valueattrs=(size=10);

* label mean_n_infected_0 = "Option 0 (median) ";
* label mean_n_infected_1 = "Option 1  (median) ";

series  x=cald y=mean_n_infected_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_infected_0 	upper=p95_n_infected_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_infected_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_infected_1 	upper=p95_n_infected_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=n_infected_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;
quit;




proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "p_births_hiv_vlg1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

* label mean_p_births_hiv_vlg1000_0 = "Option 0 (median) ";

series  x=cald y=mean_p_births_hiv_vlg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_births_hiv_vlg1000__0 	upper=p95_p_births_hiv_vlg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_births_hiv_vlg1000__1/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_p_births_hiv_vlg1000__1 	upper=p95_p_births_hiv_vlg1000__1  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

* label mean_mtct_prop_0 = "Option 0 (median) ";

series  x=cald y=mean_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_mtct_prop_1/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";

scatter x=cald y=mtct_rate_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Of men with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

* label mean_p_diag_m_0 = "Option 0 (median) ";
* label mean_p_diag_m_1 = "Option 1  (median) ";

series  x=cald y=mean_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";


scatter x=cald y=p_diag_m_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Of women with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

* label mean_p_diag_w_0 = "Option 0 (median) ";
* label mean_p_diag_w_1 = "Option 1  (median) ";

series  x=cald y=mean_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=p_diag_w_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;






proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Of men age 15-24 with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

series  x=cald y=mean_p_diag_m1524__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m1524__0 	upper=p95_p_diag_m1524__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_diag_m1524__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m1524__1 	upper=p95_p_diag_m1524__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Of women age 15-24 with HIV, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

series  x=cald y=mean_p_diag_w1524__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w1524__0 	upper=p95_p_diag_w1524__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_diag_w1524__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w1524__1 	upper=p95_p_diag_w1524__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;





proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

* label mean_p_onart_diag_m_0 = "Option 0 (median) ";
* label mean_p_onart_diag_m_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

* label mean_p_onart_diag_w_0 = "Option 0 (median) ";
* label mean_p_onart_diag_w_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

* label mean_n_onart_m_0 = "Option 0 (median) ";
* label mean_n_onart_m_1 = "Option 1  (median) ";

series  x=cald y=mean_n_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_onart_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_m_1 	upper=p95_n_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
* series  x=cald y=n_onart_m_obs_kya/	lineattrs = (color=green  thickness = 3) ;;

run;quit;


proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

* label mean_n_onart_w_0 = "Option 0 (median) ";
* label mean_n_onart_w_1 = "Option 1  (median) ";

series  x=cald y=mean_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_onart_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_w_1 	upper=p95_n_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
* series  x=cald y=n_onart_w_obs_kya/	lineattrs = (color=green  thickness = 3) ;;

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of adults on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 200000) valueattrs=(size=10);

* label mean_n_onart_0 = "Option 0 (median) ";

series  x=cald y=mean_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_onart_1/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";

scatter x=cald y = n_onart_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);;


run;quit;




proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Proportion of people on ART with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

* label mean_p_onart_vl1000__0 = "Option 0 (median) ";
* label mean_p_onart_vl1000__1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y = p_onart_vl1000_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;





proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of HIV deaths per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 150000 by 50000) valueattrs=(size=10);

* label mean_n_dead_hivpos_cause1__0 = "Option 0 (median) ";
* label mean_n_dead_hivpos_cause1__1 = "Option 1  (median) ";

series  x=cald y=mean_n_dead_hivpos_cause1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_dead_hivpos_cause1__0 	upper=p95_n_dead_hivpos_cause1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_dead_hivpos_cause1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_dead_hivpos_cause1__1 	upper=p95_n_dead_hivpos_cause1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=mean_n_dead_hivpos_cause1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_dead_hivpos_cause1__0 	upper=p95_n_dead_hivpos_cause1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = n_death_hiv_kya/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;



proc sgplot data=d nolegend; 
Title    height=1.5 justify=center "Number of adults living with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

* label mean_n_hiv_0 = "Option 0 (median) ";

series  x=cald y=mean_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_hiv_1/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_n_hiv_1 	upper=p95_n_hiv_1  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";

scatter x=cald y = n_hiv_kya/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label mean_prevalence_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_prevalence_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_pwid_0 	upper=p95_prevalence_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_prevalence_pwid_1/	lineattrs = (color=red   thickness = 2);
band    x=cald lower=p5_prevalence_pwid_1 	upper=p95_prevalence_pwid_1  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";

scatter x=cald y = prevalence_pwid_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);


run;
quit;





proc sgplot data=d nolegend ; 
Title    height=1.5 justify=center "HIV prevalence in MSM (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

* label mean_prevalence1549_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_prevalence1549_msm_0/	lineattrs = (color=black thickness = 2) legendlabel = '.';
band    x=cald lower=p5_prevalence1549_msm_0 	upper=p95_prevalence1549_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_prevalence1549_msm_1/	lineattrs = (color=red   thickness = 2) legendlabel = '.';
band    x=cald lower=p5_prevalence1549_msm_1 	upper=p95_prevalence1549_msm_1  / transparency=0.9 fillattrs = (color=red  ) legendlabel= "Model 90% range";

scatter x=cald y = prevalence_msm_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);

run;
quit;





ods html;

proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=mean_logw55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw55r_0 	upper=p95_logw55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

title;

* ods rtf close;
* ods listing;
run;


ods html close; 





/*

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label mean_p_w_giv_birth_this_per_0 = "Option 0 (median) ";
label mean_p_w_giv_birth_this_per_1 = "Option 1 (median) ";

series  x=cald y=mean_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_0 	upper=p97p5_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=mean_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_1 	upper=p97p5_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label mean_p_newp_ge5__0 = "Option 0 (median) ";
label mean_p_newp_ge5__1 = "Option 1 (median) ";

series  x=cald y=mean_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label mean_log_gender_r_newp_0 = "Option 0 (median) ";
label mean_log_gender_r_newp_1 = "Option 1 (median) ";

series  x=cald y=mean_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people tested per 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to   5000000 by  500000) valueattrs=(size=10);
label mean_n_tested_0 = "Option 0 (median) ";
label mean_n_tested_1 = "Option 1 (median) ";

series  x=cald y=mean_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_n_tested_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter  x=cald y=n_tests_obs_kya/	markerattrs = (symbol=square color=green size = 10);

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_tested_past_year_1549m_0 = "Option 0 (median) ";
label mean_p_tested_past_year_1549m_1 = "Option 1 (median) ";

series  x=cald y=mean_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter  x=cald y=tested_past_year_m_1549_obs_kya/	markerattrs = (symbol=square color=green size = 10);

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_tested_past_year_1549w_0 = "Option 0 (median) ";
label mean_p_tested_past_year_1549w_1 = "Option 1 (median) ";

series  x=cald y=mean_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_tested_past_year_1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter  x=cald y=tested_past_year_w_1549_obs_kya/	markerattrs = (symbol=square color=green size = 10);

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_mcirc_1549m_0 = "Option 0 (median) ";
label mean_p_mcirc_1549m_1 = "Option 1 (median) ";

series  x=cald y=mean_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=mean_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=prop_m_1549_circ_obs_kya/	lineattrs = (color=blue  thickness = 3) ;

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label mean_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
label mean_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";

label mean_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label mean_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";


series  x=cald y=mean_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_w_ever_sw_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=p_w_1549_sw_obs_kya/	lineattrs = (color=blue  thickness = 3) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label mean_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";

series  x=cald y=mean_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=prevalence_sw_obs_kya/	lineattrs = (color=blue  thickness = 3) ;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label mean_prop_w_1524_onprep_0 = "Option 0 (median) ";
label mean_prop_w_1524_onprep_1 = "Option 1  (median) ";

series  x=cald y=mean_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label mean_prop_1564_onprep_0 = "Option 0 (median) ";
label mean_prop_1564_onprep_1 = "Option 1  (median) ";

series  x=cald y=mean_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";


run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label mean_prevalence1549__0 = "All Option 0 (median) ";
label mean_prevalence1549__1 = "All Option 1  (median) ";
label mean_prevalence1549m_0 = "Men Option 0 (median) ";
label mean_prevalence1549m_1 = "Men Option 1 (median) ";

series  x=cald y=mean_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=prevalence1549_m_obs_kya/	lineattrs = (color=blue  thickness = 3) ;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label mean_prevalence1549__0 = "All Option 0 (median) ";
label mean_prevalence1549__1 = "All Option 1  (median) ";
label mean_prevalence1549w_0 = "Men Option 0 (median) ";
label mean_prevalence1549w_1 = "Men Option 1 (median) ";

series  x=cald y=mean_prevalence1549w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549w_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=prevalence1549_w_obs_kya/	lineattrs = (color=blue  thickness = 3) ;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label mean_incidence1549m_0 = "Option 0 (median) ";
label mean_incidence1549m_1 = "Option 1  (median) ";

series  x=cald y=mean_incidence1549m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549m_1 	upper=p95_incidence1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 3   by 0.5) valueattrs=(size=10);

label mean_incidence1549w_0 = "Option 0 (median) ";
label mean_incidence1549w_1 = "Option 1  (median) ";

series  x=cald y=mean_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549w_1 	upper=p95_incidence1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence men (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label mean_incidence1564m_0 = "Option 0 (median) ";
label mean_incidence1564m_1 = "Option 1  (median) ";

series  x=cald y=mean_incidence1564m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564m_0 	upper=p95_incidence1564m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1564m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1564m_1 	upper=p95_incidence1564m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=incidence1564_m_obs_kya / 		markerattrs = (symbol=square color=green size = 10);
run;
quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence women (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label mean_incidence1564w_0 = "Option 0 (median) ";
label mean_incidence1564w_1 = "Option 1  (median) ";

series  x=cald y=mean_incidence1564w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564w_0 	upper=p95_incidence1564w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1564w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1564w_1 	upper=p95_incidence1564w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=incidence1564_w_obs_kya / 		markerattrs = (symbol=square color=green size = 10);
run;
quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 300000 by 10000) valueattrs=(size=10);

label mean_n_infected_0 = "Option 0 (median) ";
label mean_n_infected_1 = "Option 1  (median) ";

series  x=cald y=mean_n_infected_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_infected_0 	upper=p95_n_infected_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_infected_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_infected_1 	upper=p95_n_infected_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=n_infected_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;
quit;








proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_vlsupp_0 = "Option 0 (median) ";
label mean_p_inf_vlsupp_1 = "Option 1  (median) ";

series  x=cald y=mean_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_inf_vlsupp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_ep_0 = "Option 0 (median) ";
label mean_p_inf_ep_1 = "Option 1  (median) ";

series  x=cald y=mean_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_inf_ep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_ep_1 	upper=p95_p_inf_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_newp_0 = "Option 0 (median) ";
label mean_p_inf_newp_1 = "Option 1  (median) ";

series  x=cald y=mean_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_inf_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_newp_1 	upper=p95_p_inf_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_primary_0 = "Option 0 (median) ";
label mean_p_inf_primary_1 = "Option 1  (median) ";

series  x=cald y=mean_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_inf_primary_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_naive_0 = "Option 0 (median) ";
label mean_p_inf_naive_1 = "Option 1  (median) ";

series  x=cald y=mean_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_inf_naive_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_naive_1 	upper=p95_p_inf_naive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_diag_0 = "Option 0 (median) ";
label mean_p_inf_diag_1 = "Option 1  (median) ";

series  x=cald y=mean_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_inf_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_inf_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_msm_0 	upper=p95_p_inf_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_inf_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_p_inf_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_pwid_0 	upper=p95_p_inf_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label mean_mtct_prop_0 = "Option 0 (median) ";

series  x=cald y=mean_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=mtct_rate_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of men with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label mean_p_diag_m_0 = "Option 0 (median) ";
label mean_p_diag_m_1 = "Option 1  (median) ";

series  x=cald y=mean_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";


scatter x=cald y=p_diag_m_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "of women with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label mean_p_diag_w_0 = "Option 0 (median) ";
label mean_p_diag_w_1 = "Option 1  (median) ";

series  x=cald y=mean_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=p_diag_w_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of people with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label mean_p_diag_0 = "Option 0 (median) ";
label mean_p_diag_1 = "Option 1  (median) ";

series  x=cald y=mean_p_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y=p_diag_obs_kya / 		markerattrs = (symbol=square color=green size = 10);

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.01) valueattrs=(size=10);

label mean_p_ai_no_arv_c_nnm_0 = "Option 0 (median) ";
label mean_p_ai_no_arv_c_nnm_1 = "Option 1  (median) ";

series  x=cald y=mean_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_ai_no_arv_c_nnm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label mean_p_artexp_diag_0 = "Option 0 (median) ";
label mean_p_artexp_diag_1 = "Option 1  (median) ";

series  x=cald y=mean_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_diag_m_0 = "Option 0 (median) ";
label mean_p_onart_diag_m_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_diag_w_0 = "Option 0 (median) ";
label mean_p_onart_diag_w_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_vl1000__0 = "Option 0 (median) ";

series  x=cald y=mean_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;






proc sgplot data=d; 
Title    height=1.5 justify=center "Number diagnosed with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

label mean_n_diagnosed_0 = "Option 0 (median) ";
label mean_n_diagnosed_1 = "Option 1  (median) ";

series  x=cald y=mean_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_diagnosed_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label mean_n_onart_m_0 = "Option 0 (median) ";
label mean_n_onart_m_1 = "Option 1  (median) ";

series  x=cald y=mean_n_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_onart_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_m_1 	upper=p95_n_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=n_onart_m_obs_kya/	lineattrs = (color=blue  thickness = 3) ;;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label mean_n_onart_w_0 = "Option 0 (median) ";
label mean_n_onart_w_1 = "Option 1  (median) ";

series  x=cald y=mean_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_onart_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_w_1 	upper=p95_n_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=n_onart_w_obs_kya/	lineattrs = (color=blue  thickness = 3) ;;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of adults on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

label mean_n_onart_0 = "Option 0 (median) ";

series  x=cald y=mean_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=n_onart_obs_kya/	lineattrs = (color=blue  thickness = 3) ;;


run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Number of viral load tests per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

label mean_n_vm_per_year_0 = "Option 0 (median) ";

series  x=cald y=mean_n_vm_per_year_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_vm_per_year_0 	upper=p95_n_vm_per_year_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=n_vm_obs_kya/	lineattrs = (color=blue  thickness = 3) ;;


run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_efa_0 = "Option 0 (median) ";
label mean_p_efa_1 = "Option 1  (median) ";

series  x=cald y=mean_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_efa_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_efa_1 	upper=p95_p_efa_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_taz_0 = "Option 0 (median) ";
label mean_p_taz_1 = "Option 1  (median) ";

series  x=cald y=mean_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_taz_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_ten_0 = "Option 0 (median) ";
label mean_p_ten_1 = "Option 1  (median) ";

series  x=cald y=mean_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_ten_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ten_1 	upper=p95_p_ten_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_zdv_0 = "Option 0 (median) ";
label mean_p_zdv_1 = "Option 1  (median) ";

series  x=cald y=mean_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_zdv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_zdv_1 	upper=p95_p_zdv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_dol_0 = "Option 0 (median) ";
label mean_p_dol_1 = "Option 1  (median) ";

series  x=cald y=mean_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_dol_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_3TC_0 = "Option 0 (median) ";
label mean_p_3TC_1 = "Option 1  (median) ";

series  x=cald y=mean_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_3TC_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_3TC_1 	upper=p95_p_3TC_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_lpr_0 = "Option 0 (median) ";
label mean_p_lpr_1 = "Option 1  (median) ";

series  x=cald y=mean_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_lpr_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_lpr_1 	upper=p95_p_lpr_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_nev_0 = "Option 0 (median) ";
label mean_p_nev_1 = "Option 1  (median) ";

series  x=cald y=mean_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_nev_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_nev_1 	upper=p95_p_nev_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_vl1000__0 = "Option 0 (median) ";
label mean_p_onart_vl1000__1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y = p_onart_vl1000_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_vl1000_m_0 = "Option 0 (median) ";
label mean_p_onart_vl1000_m_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y = p_onart_vl1000_m_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_vl1000_w_0 = "Option 0 (median) ";
label mean_p_onart_vl1000_w_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter x=cald y = p_onart_vl1000_w_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_vl1000__0 = "Option 0 (median) ";
label mean_p_vl1000__1 = "Option 1  (median) ";

series  x=cald y=mean_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_vg1000__0 = "Option 0 (median) ";
label mean_p_vg1000__1 = "Option 1  (median) ";

series  x=cald y=mean_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_m_0 = "Option 0 (median) ";
label mean_p_onart_m_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_w_0 = "Option 0 (median) ";
label mean_p_onart_w_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_vl1000_m_0 = "Option 0 (median) ";
label mean_p_onart_vl1000_m_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label mean_p_onart_vl1000_w_0 = "Option 0 (median) ";
label mean_p_onart_vl1000_w_1 = "Option 1  (median) ";

series  x=cald y=mean_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label mean_prevalence_vg1000__0 = "Option 0 (median) ";
label mean_prevalence_vg1000__1 = "Option 1  (median) ";

series  x=cald y=mean_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_dead_hivpos_cause1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label mean_n_dead_hivpos_cause1__0 = "Option 0 (median) ";
label mean_n_dead_hivpos_cause1__1 = "Option 1  (median) ";

series  x=cald y=mean_n_dead_hivpos_cause1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_dead_hivpos_cause1__0 	upper=p95_n_dead_hivpos_cause1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_dead_hivpos_cause1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_dead_hivpos_cause1__1 	upper=p95_n_dead_hivpos_cause1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=mean_n_dead_hivpos_cause1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_dead_hivpos_cause1__0 	upper=p95_n_dead_hivpos_cause1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = n_death_hiv_kya/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);

label mean_n_cd4_lt200__0 = "Option 0 (median) ";

series  x=cald y=mean_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);

label mean_n_hiv_0 = "Option 0 (median) ";

series  x=cald y=mean_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = n_hiv_kya/ 		markerattrs = (symbol=square color=green size = 10);;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center " n_newp_ge1_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000 by 100000) valueattrs=(size=10);

label mean_n_newp_ge1_w_0 = "Option 0 (median) ";
label mean_n_newp_ge1_w_1 = "Option 1  (median) ";

series  x=cald y=mean_n_newp_ge1_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_newp_ge1_w_0 	upper=p95_n_newp_ge1_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_newp_ge1_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_newp_ge1_w_1 	upper=p95_n_newp_ge1_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center " n_onprep_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000 by 10000) valueattrs=(size=10);

label mean_n_onprep_w_0 = "Option 0 (median) ";
label mean_n_onprep_w_1 = "Option 1  (median) ";

series  x=cald y=mean_n_onprep_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onprep_w_0 	upper=p95_n_onprep_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_onprep_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onprep_w_1 	upper=p95_n_onprep_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center " n_onprep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label mean_n_onprep_0 = "Option 0 (median) ";
label mean_n_onprep_1 = "Option 1  (median) ";

series  x=cald y=mean_n_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onprep_0 	upper=p95_n_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onprep_1 	upper=p95_n_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

scatter  x=cald y=n_onprep_obs_kya/	markerattrs = (symbol=square color=green size = 10);

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center " n_prep_elig_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000000 by 100000) valueattrs=(size=10);

label mean_n_prep_elig_w_0 = "Option 0 (median) ";
label mean_n_prep_elig_w_1 = "Option 1  (median) ";

series  x=cald y=mean_n_prep_elig_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_elig_w_0 	upper=p95_n_prep_elig_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_elig_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_elig_w_1 	upper=p95_n_prep_elig_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 60000000 by  1000000) valueattrs=(size=10);

label mean_n_alive_0 = "Option 0 (median) ";

series  x=cald y=mean_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by  100000) valueattrs=(size=10);

label mean_n_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_n_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pwid_0 	upper=p95_n_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = n_pwid_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive1564_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by  100000) valueattrs=(size=10);

label mean_n_alive1564_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_n_alive1564_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive1564_msm_0 	upper=p95_n_alive1564_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = n_msm_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence msm (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 20  by 1) valueattrs=(size=10);

label mean_incidence1564msm_0 = "Option 0 (mean) ";

series  x=cald y=mean_incidence1564msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564msm_0 	upper=p95_incidence1564msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;





ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence msm (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label mean_prevalence1549_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_prevalence1549_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549_msm_0 	upper=p95_prevalence1549_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y = prevalence_msm_obs_kya/ 		markerattrs = (symbol=square color=green size = 10);

run;
quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_msm_infected_from_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_msm_infected_from_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_msm_infected_from_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_msm_infected_from_msm_0 	upper=p95_p_msm_infected_from_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;





ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_elig_prep_any_msm_1564_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_el_prep_any_msm_1564__0 = "Option 0 (median) ";

series  x=cald y=mean_p_el_prep_any_msm_1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_el_prep_any_msm_1564__0 	upper=p95_p_el_prep_any_msm_1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_onprep_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onprep_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onprep_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_msm_0 	upper=p95_p_onprep_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onart_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_msm_0 	upper=p95_p_onart_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;





ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_prevalence_vg1000_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_prevalence_vg1000_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000_msm_0 	upper=p95_prevalence_vg1000_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_diag_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_msm_0 	upper=p95_p_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;







ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_diag_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onart_diag_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_diag_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_msm_0 	upper=p95_p_onart_diag_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onart_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_msm_0 	upper=p95_p_onart_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onart_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_pwid_0 	upper=p95_p_onart_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_onart_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onart_sw_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onart_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_sw_0 	upper=p95_p_onart_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_onprep_pwid";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_onprep_pwid_0 = "Option 0 (median) ";

series  x=cald y=mean_p_onprep_pwid_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onprep_pwid_0 	upper=p95_p_onprep_pwid_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;  
	  	 


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_art_gt6m_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_vl1000_art_gt6m_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_vl1000_art_gt6m_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000_art_gt6m_msm_0 	upper=p95_p_vl1000_art_gt6m_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_ever_tested_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_ever_tested_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_ever_tested_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ever_tested_msm_0 	upper=p95_p_ever_tested_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_this_period_msm";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1980 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1  by 0.1) valueattrs=(size=10);

label mean_p_tested_this_period_msm_0 = "Option 0 (median) ";

series  x=cald y=mean_p_tested_this_period_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_this_period_msm_0 	upper=p95_p_tested_this_period_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;
quit;


*/










	
/*

data z; set b;

ods html;
 
proc sgplot data=z; Title    height=1.5 justify=center "loggender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'loggender_r_newp'		labelattrs=(size=12)  values = (-10 to 10 by 1) valueattrs=(size=10);
series  x=cald y=loggender_r_newp/	lineattrs = (color=black thickness = 2); run;

proc sgplot data=z; Title    height=1.5 justify=center "logw15r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logw15r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logw15r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logw25r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logw25r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logw25r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logw35r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logw35r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logw35r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logw45r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logw45r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logw45r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logw55r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logw55r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logw55r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logm15r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logm15r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logm15r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logm25r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logm25r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logm25r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logm35r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logm35r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logm35r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logm45r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logm45r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logm45r/	lineattrs = (color=black thickness = 2); run;
proc sgplot data=z; Title    height=1.5 justify=center "logm55r";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'logm55r'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
series  x=cald y=logm55r/	lineattrs = (color=black thickness = 2); run;

ods html close;

*/



/*

* graph of prevalence by age ;

data f; set d;

keep

p5_prevalence1519w_0 	p5_prevalence1519m_0 p5_prevalence2024w_0 	p5_prevalence2024m_0 p5_prevalence2529w_0 	p5_prevalence2529m_0
p5_prevalence3034w_0 	p5_prevalence3034m_0 p5_prevalence3539w_0 	p5_prevalence3539m_0 p5_prevalence4044w_0 	p5_prevalence4044m_0 
p5_prevalence4549w_0 	p5_prevalence4549m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0
p5_prevalence5559w_0 	p5_prevalence5559m_0 p5_prevalence6064w_0 	p5_prevalence6064m_0 p5_prevalence6064w_0 
mean_prevalence1519w_0 	mean_prevalence1519m_0 mean_prevalence2024w_0 	mean_prevalence2024m_0 mean_prevalence2529w_0 	mean_prevalence2529m_0
mean_prevalence3034w_0 	mean_prevalence3034m_0 mean_prevalence3539w_0 	mean_prevalence3539m_0 mean_prevalence4044w_0 	mean_prevalence4044m_0 
mean_prevalence4549w_0 	mean_prevalence4549m_0 mean_prevalence5054w_0 	mean_prevalence5054m_0 mean_prevalence5054w_0 	mean_prevalence5054m_0
mean_prevalence5559w_0 	mean_prevalence5559m_0 mean_prevalence6064w_0 	mean_prevalence6064m_0 mean_prevalence6064w_0 
p95_prevalence1519w_0 	p95_prevalence1519m_0 p95_prevalence2024w_0 	p95_prevalence2024m_0 p95_prevalence2529w_0 	p95_prevalence2529m_0
p95_prevalence3034w_0 	p95_prevalence3034m_0 p95_prevalence3539w_0 	p95_prevalence3539m_0 p95_prevalence4044w_0 	p95_prevalence4044m_0 
p95_prevalence4549w_0 	p95_prevalence4549m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0
p95_prevalence5559w_0 	p95_prevalence5559m_0 p95_prevalence6064w_0 	p95_prevalence6064m_0 p95_prevalence6056w_0 

;


* Prevalence by age 
KENPHIA  2018 
Men 15-19   0.5   20-24  0.6   25-29  2.2  30-34  3.2  35-39  4.3   40-44  6.3  45-49  8.3   50-54  6.6   55-59  5.9   60-64  5.6
Women 15-19   1.2   20-24  3.4   25-29  6.0  30-34  9.5  35-39  8.7   40-44  11.9  45-49  10.6   50-54  11.7   55-59  9.0   60-64  6.2 ;



if cald=2018;

data age15w ; set f;  ageg=15; sex=2; 	p5_prevalence = p5_prevalence1519w_0 ;mean_prevalence = mean_prevalence1519w_0 ;
p95_prevalence = p95_prevalence1519w_0 ; prev_obs_kya = 0.012 ;
data age20w ; set f;  ageg=20; sex=2; p5_prevalence = p5_prevalence2024w_0 ; mean_prevalence = mean_prevalence2024w_0 ; 
p95_prevalence = p95_prevalence2024w_0 ; prev_obs_kya = 0.034 ;
data age25w ; set f;  ageg=25; sex=2; p5_prevalence = p5_prevalence2529w_0 ;mean_prevalence = mean_prevalence2529w_0 ;
p95_prevalence = p95_prevalence2529w_0 ;prev_obs_kya = 0.060 ;
data age30w ; set f;  ageg=30; sex=2; p5_prevalence = p5_prevalence3034w_0 ; mean_prevalence = mean_prevalence3034w_0 ; 
p95_prevalence = p95_prevalence3034w_0 ; prev_obs_kya = 0.095 ;
data age35w ; set f;  ageg=35; sex=2; p5_prevalence = p5_prevalence3539w_0 ; mean_prevalence = mean_prevalence3539w_0 ; 
p95_prevalence = p95_prevalence3539w_0 ; prev_obs_kya = 0.087 ;
data age40w ; set f;  ageg=40; sex=2; p5_prevalence = p5_prevalence4044w_0 ;mean_prevalence = mean_prevalence4044w_0 ;
p95_prevalence = p95_prevalence4044w_0 ;prev_obs_kya = 0.119 ;
data age45w ; set f;  ageg=45; sex=2; p5_prevalence = p5_prevalence4549w_0 ; mean_prevalence = mean_prevalence4549w_0 ;
 p95_prevalence = p95_prevalence4549w_0 ;prev_obs_kya = 0.106 ;
data age50w ; set f;  ageg=50; sex=2; p5_prevalence = p5_prevalence5054w_0 ; mean_prevalence = mean_prevalence5054w_0 ; 
p95_prevalence = p95_prevalence5054w_0 ; prev_obs_kya = 0.117 ;
data age55w ; set f;  ageg=55; sex=2; p5_prevalence = p5_prevalence5559w_0 ;mean_prevalence = mean_prevalence5559w_0 ;
p95_prevalence = p95_prevalence5559w_0 ;prev_obs_kya = 0.090 ;
data age60w ; set f;  ageg=60; sex=2; p5_prevalence = p5_prevalence6064w_0 ;mean_prevalence = mean_prevalence6064w_0 ;
p95_prevalence = p95_prevalence6064w_0 ;prev_obs_kya = 0.062 ;


data age15m ; set f;  ageg=15; sex=1; p5_prevalence = p5_prevalence1519m_0 ; mean_prevalence = mean_prevalence1519m_0 ; 
p95_prevalence = p95_prevalence1519m_0 ; prev_obs_kya = 0.005 ;
data age20m ; set f;  ageg=20; sex=1; p5_prevalence = p5_prevalence2024m_0 ; mean_prevalence = mean_prevalence2024m_0 ; 
p95_prevalence = p95_prevalence2024m_0 ; prev_obs_kya = 0.006 ;
data age25m ; set f;  ageg=25; sex=1; p5_prevalence = p5_prevalence2529m_0 ; mean_prevalence = mean_prevalence2529m_0 ; 
p95_prevalence = p95_prevalence2529m_0 ; prev_obs_kya = 0.022 ;
data age30m ; set f;  ageg=30; sex=1; p5_prevalence = p5_prevalence3034m_0 ;mean_prevalence = mean_prevalence3034m_0 ;
p95_prevalence = p95_prevalence3034m_0 ;prev_obs_kya = 0.032 ;
data age35m ; set f;  ageg=35; sex=1; p5_prevalence = p5_prevalence3539m_0 ;mean_prevalence = mean_prevalence3539m_0 ;
p95_prevalence = p95_prevalence3539m_0 ;prev_obs_kya = 0.043 ;
data age40m ; set f;  ageg=40; sex=1; p5_prevalence = p5_prevalence4044m_0 ;mean_prevalence = mean_prevalence4044m_0 ;
p95_prevalence = p95_prevalence4044m_0 ;prev_obs_kya = 0.063 ;
data age45m ; set f;  ageg=45; sex=1; p5_prevalence = p5_prevalence4549m_0 ;mean_prevalence = mean_prevalence4549m_0 ;
p95_prevalence = p95_prevalence4549m_0 ;prev_obs_kya = 0.083 ;
data age50m ; set f;  ageg=50; sex=1; p5_prevalence = p5_prevalence5054m_0 ; mean_prevalence = mean_prevalence5054m_0 ;
 p95_prevalence = p95_prevalence5054m_0 ;prev_obs_kya = 0.066 ;
data age55m ; set f;  ageg=55; sex=1; p5_prevalence = p5_prevalence5559m_0 ;mean_prevalence = mean_prevalence5559m_0 ;
p95_prevalence = p95_prevalence5559m_0 ;prev_obs_kya = 0.059 ;
data age60m ; set f;  ageg=60; sex=1; p5_prevalence = p5_prevalence6064w_0 ;mean_prevalence = mean_prevalence6064m_0 ;
p95_prevalence = p95_prevalence6064m_0 ;prev_obs_kya = 0.056 ;



data all; set age15w age20w age25w age30w age35w age40w age45w age50w age55w age60w
 age15m age20m age25m age30m age35m age40m age45m age50m age55m age60m
; 

drop
p5_prevalence1519w_0 	p5_prevalence1519m_0 p5_prevalence2024w_0 	p5_prevalence2024m_0 p5_prevalence2529w_0 	p5_prevalence2529m_0
p5_prevalence3034w_0 	p5_prevalence3034m_0 p5_prevalence3539w_0 	p5_prevalence3539m_0 p5_prevalence4044w_0 	p5_prevalence4044m_0 
p5_prevalence4549w_0 	p5_prevalence4549m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0
p5_prevalence5559w_0 	p5_prevalence5559m_0 p5_prevalence6064m_0 p5_prevalence6064w_0 p5_prevalence6064_0 
mean_prevalence1519w_0 	mean_prevalence1519m_0 mean_prevalence2024w_0 	mean_prevalence2024m_0 mean_prevalence2529w_0 	mean_prevalence2529m_0
mean_prevalence3034w_0 	mean_prevalence3034m_0 mean_prevalence3539w_0 	mean_prevalence3539m_0 mean_prevalence4044w_0 	mean_prevalence4044m_0 
mean_prevalence4549w_0 	mean_prevalence4549m_0 mean_prevalence5054w_0 	mean_prevalence5054m_0 mean_prevalence5054w_0 	mean_prevalence5054m_0
mean_prevalence5559w_0 	mean_prevalence5559m_0 mean_prevalence6064w_0 mean_prevalence6064m_0 mean_prevalence6064_0 
p95_prevalence1519w_0 	p95_prevalence1519m_0 p95_prevalence2024w_0 	p95_prevalence2024m_0 p95_prevalence2529w_0 	p95_prevalence2529m_0
p95_prevalence3034w_0 	p95_prevalence3034m_0 p95_prevalence3539w_0 	p95_prevalence3539m_0 p95_prevalence4044w_0 	p95_prevalence4044m_0 
p95_prevalence4549w_0 	p95_prevalence4549m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0
p95_prevalence5559w_0 	p95_prevalence5559m_0 p95_prevalence6064m_0 p95_prevalence6064w_0 p95_prevalence6064_0 
;

ods html;

proc sgplot data=all; Title 'prevalence by age - women 2018'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 60 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02) valueattrs=(size=10);
series  x=ageg y=mean_prevalence/	lineattrs = (color=black thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
  series x=ageg y=prev_obs_kya / lineattrs = (color=blue thickness = 2);
where sex=2;
run;


proc sgplot data=all; Title 'prevalence by age - men 2018'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 60 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 0.2 by 0.02) valueattrs=(size=10);
series  x=ageg y=mean_prevalence/	lineattrs = (color=black thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series x=ageg y=prev_obs_kya / lineattrs = (color=blue thickness = 2);
where sex=1;
run;

quit;

ods html close;

*/



