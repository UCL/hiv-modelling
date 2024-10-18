
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;


libname a "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Phase II\sa_p2_14thAug24"; run;


  proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";

data b;
set a.l_base_sa_p2_20240814;


s=12;
if option=0 or option=s ;
if option=s then option=1;


* if sex_beh_trans_matrix_m ne 15 and sex_beh_trans_matrix_w ne 2 and sex_beh_trans_matrix_w ne 3 and sex_beh_trans_matrix_w ne 11;

p_onart_vl1000_all = .;


/*
if option =0 or (prep_improvements  = 1 and option =1);

ods  html;
proc sgplot data=b; Title    height=1.5 justify=center "incidence1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to 2020.5 by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'incidence1549'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
series  x=cald y=incidence1549/	lineattrs = (color=black thickness = 2); run;
ods html close;
*/


* NB: note lines below, because variable names cannot end with a number;
log_gender_r_newp  = log(gender_r_newp);
prevalence1549_ = prevalence1549;
incidence1549_ = incidence1549;
incidence1564_ = incidence1564;

incidence1524w_ = incidence1524w; incidence1524m_ = incidence1524m;
incidence2534w_ = incidence2534w; incidence2534m_ = incidence2534m;
incidence3544w_ = incidence3544w; incidence3544m_ = incidence3544m;
incidence4554w_ = incidence4554w; incidence4554m_ = incidence4554m;
incidence5564w_ = incidence5564w; incidence5564m_ = incidence5564m;

n_cd4_lt200_ = n_cd4_lt200;

p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;  

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


n_prep_w_1524_ = n_prep_w_1524;



proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  520 ;
%let year_end = 2064.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option = 0 ;

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
n_onart n_death_2059_m n_death_2059_w  n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_hiv  p_ep  p_newp_ge1_m   p_newp_ge1_w  prev_vg1000_newp_m  prev_vg1000_newp_w  n_prep_w n_prep_inj n_prep_oral
n_prep_w_1524_ incidence1524w_  n_prep_vr_w  n_self_tests

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

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0 p2p5_&varb._0 p97p5_&varb._0;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_0;
run;



data option_1;
set b;
if option = 1 ;

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
n_onart n_death_2059_m n_death_2059_w n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm

n_alive n_hiv  p_ep  p_newp_ge1_m   p_newp_ge1_w prev_vg1000_newp_m  prev_vg1000_newp_w   n_prep_w  n_prep_inj n_prep_oral
n_prep_w_1524_   incidence1524w_   n_prep_vr_w n_self_tests

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



data d; * this is number of variables in %let var = above ;
merge 
g1   g2   g3   g4   g5   g6   g7   g8   g9   g10  g11  g12  g13  g14  g15  g16  g17  g18  g19  g20  g21  g22  g23  g24  g25  g26 
g27  g28  g29  g30  g31  g32  g33  g34  g35  g36  g37  g38  g39  g40  g41  g42  g43  g44  g45  g46  g47  g48   g49  g50 
g51  g52  g53  g54  g55  g56  g57  g58  g59  g60 g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71 g72  g73  g74 g75 g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100    g101 g102 g103 g104

g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115


/*
g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 */

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52 h53   h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72  h73  h74  h75
h77  h78 h79  h80  h81  h82  h83  h84  h85  h86  h87  h88  h89  h90  h91  h92  h93  h94  h95  h96  h97  h98 h99  h100 h101 h102

h103 h104 h105 h106 h107 h108 h109 h110  h111 h112 h113  h114 h115


;
by cald;

 

if cald = 2012 then n_onart_obs_sa = 2200000  ;
if cald = 2013 then n_onart_obs_sa = 2660000  ;
if cald = 2014 then n_onart_obs_sa = 3080000  ;
if cald = 2015 then n_onart_obs_sa = 3430000  ;
if cald = 2016 then n_onart_obs_sa = 3770000  ;
if cald = 2017 then n_onart_obs_sa = 4250000  ;
if cald = 2018 then n_onart_obs_sa = 4630000  ;
if cald = 2019 then n_onart_obs_sa = 5060000  ;
if cald = 2020 then n_onart_obs_sa = 5330000  ;


if cald=2005 then do; prev_w_obs_sa = 0.202 ;prev_m_obs_sa = 0.117 ; prev_obs_sa = 0.162 ; end;
if cald=2008 then do; prev_obs_sa = 0.169 ; end;
if cald=2012 then do; prev_w_obs_sa = 0.232 ;prev_m_obs_sa = 0.145 ; prev_obs_sa = 0.188 ; end;
if cald=2016 then do; prev_w_obs_sa = 0.277 ;prev_m_obs_sa = 0.144 ; prev_obs_sa = 0.212 ; end;
if cald=2017 then do; prev_w_obs_sa = 0.263 ;prev_m_obs_sa = 0.148 ; prev_obs_sa = 0.206 ; end;


if cald=2011 then n_tested_obs_sa = 9523400 ;
if cald=2012 then n_tested_obs_sa = 8772000 ;
if cald=2013 then n_tested_obs_sa = 8978177 ;
if cald=2014 then n_tested_obs_sa = 7334942 ;
if cald=2015 then n_tested_obs_sa = 8636033 ;
if cald=2016 then n_tested_obs_sa = 11324134 ;
if cald=2017 then n_tested_obs_sa = 12465313 ;
if cald=2018 then n_tested_obs_sa = 11902403 ;
if cald=2019 then n_tested_obs_sa = 12714196 ;
if cald=2020 then n_tested_obs_sa = 16316808 ;

if cald=1997 then do; n_death_2059_m_obs_sa = 115537  ; n_death_2059_w_obs_sa = 66911  ; end; 
if cald=1998 then do; n_death_2059_m_obs_sa = 131371  ; n_death_2059_w_obs_sa = 81303  ; end; 
if cald=1999 then do; n_death_2059_m_obs_sa = 136451  ; n_death_2059_w_obs_sa = 91656  ; end; 	
if cald=2000 then do; n_death_2059_m_obs_sa = 144959  ; n_death_2059_w_obs_sa = 107525  ; end; 	
if cald=2001 then do; n_death_2059_m_obs_sa = 156573  ; n_death_2059_w_obs_sa = 121161  ; end; 	
if cald=2002 then do; n_death_2059_m_obs_sa = 169707  ; n_death_2059_w_obs_sa = 140914  ; end; 	
if cald=2003 then do; n_death_2059_m_obs_sa = 186280  ; n_death_2059_w_obs_sa = 159532  ; end; 	
if cald=2004 then do; n_death_2059_m_obs_sa = 190226  ; n_death_2059_w_obs_sa = 170724  ; end; 	
if cald=2005 then do; n_death_2059_m_obs_sa = 196105  ; n_death_2059_w_obs_sa = 176422  ; end; 	
if cald=2006 then do; n_death_2059_m_obs_sa = 199390  ; n_death_2059_w_obs_sa = 176962  ; end; 	
if cald=2007 then do; n_death_2059_m_obs_sa = 197873  ; n_death_2059_w_obs_sa = 170664  ; end; 	
if cald=2008 then do; n_death_2059_m_obs_sa = 194377  ; n_death_2059_w_obs_sa = 164922  ; end; 	
if cald=2009 then do; n_death_2059_m_obs_sa = 187914  ; n_death_2059_w_obs_sa = 155059  ; end; 	
if cald=2010 then do; n_death_2059_m_obs_sa = 174745  ; n_death_2059_w_obs_sa = 142594  ; end; 	
if cald=2011 then do; n_death_2059_m_obs_sa = 161976  ; n_death_2059_w_obs_sa = 126743  ; end; 	
if cald=2012 then do; n_death_2059_m_obs_sa = 152903  ; n_death_2059_w_obs_sa = 115430  ; end; 	
if cald=2013 then do; n_death_2059_m_obs_sa = 145703  ; n_death_2059_w_obs_sa = 106876  ; end; 	
if cald=2014 then do; n_death_2059_m_obs_sa = 142996  ; n_death_2059_w_obs_sa = 102250  ; end; 	
if cald=2015 then do; n_death_2059_m_obs_sa = 142352  ; n_death_2059_w_obs_sa = 98790  ; end; 	
if cald=2016 then do; n_death_2059_m_obs_sa = 141533  ; n_death_2059_w_obs_sa = 95949  ; end; 	
if cald=2017 then do; n_death_2059_m_obs_sa = 136433  ; n_death_2059_w_obs_sa = 91772  ; end; 	
if cald=2018 then do; n_death_2059_m_obs_sa = 132870  ; n_death_2059_w_obs_sa = 88730  ; end; 	


%let start = 2018;



ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Option 0 (median) ";
label p50_p_w_giv_birth_this_per_1 = "Option 1 (median) ";

series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_0 	upper=p97p5_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_1 	upper=p97p5_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";

run;

quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1.0 by 0.1 ) valueattrs=(size=10);
label p50_p_ep_0 = "Option 0 (median) ";
label p50_p_ep_1 = "Option 1 (median) ";

series  x=cald y=p50_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_ep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0 = "Option 0 (median) ";
label p50_p_newp_ge1__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "av_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2   by 0.5) valueattrs=(size=10);
label p50_av_newp_0 = "Option 0 (median) ";
label p50_av_newp_1 = "Option 1 (median) ";

series  x=cald y=p50_av_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_av_newp_0 	upper=p95_av_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_av_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_av_newp_1 	upper=p95_av_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1_m_0 = "Option 0 (median) ";
label p50_p_newp_ge1_m_1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge1_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1_m_0 	upper=p95_p_newp_ge1_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_newp_ge1_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1_m_1 	upper=p95_p_newp_ge1_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1_w_0 = "Option 0 (median) ";
label p50_p_newp_ge1_w_1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge1_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1_w_0 	upper=p95_p_newp_ge1_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_newp_ge1_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1_w_1 	upper=p95_p_newp_ge1_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0 = "Option 0 (median) ";
label p50_p_newp_ge5__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label p50_log_gender_r_newp_0 = "Option 0 (median) ";
label p50_log_gender_r_newp_1 = "Option 1 (median) ";

series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000000 by 1000000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";

series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=n_tested_obs_sa/	lineattrs = (color=green thickness = 3) ;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_self_tests";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000000 by 1000000) valueattrs=(size=10);
label p50_n_self_tests_0 = "Option 0 (median) ";
label p50_n_self_tests_1 = "Option 1 (median) ";

series  x=cald y=p50_n_self_tests_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_self_tests_0 	upper=p95_n_self_tests_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_self_tests_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_self_tests_1 	upper=p95_n_self_tests_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);
label p50_n_prep_w_0 = "Option 0 (median) ";
label p50_n_prep_w_1 = "Option 1 (median) ";

series  x=cald y=p50_n_prep_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_w_0 	upper=p95_n_prep_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_prep_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_w_1 	upper=p95_n_prep_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_w_1524";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);
label p50_n_prep_w_1524__0 = "Option 0 (median) ";
label p50_n_prep_w_1524__1 = "Option 1 (median) ";

series  x=cald y=p50_n_prep_w_1524__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_w_1524__0 	upper=p95_n_prep_w_1524__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_prep_w_1524__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_w_1524__1 	upper=p95_n_prep_w_1524__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_oral";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);
label p50_n_prep_oral_0 = "Option 0 (median) ";
label p50_n_prep_oral_1 = "Option 1 (median) ";

series  x=cald y=p50_n_prep_oral_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_0 	upper=p95_n_prep_oral_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_prep_oral_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_1 	upper=p95_n_prep_oral_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_inj";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);
label p50_n_prep_inj_0 = "Option 0 (median) ";
label p50_n_prep_inj_1 = "Option 1 (median) ";

series  x=cald y=p50_n_prep_inj_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_prep_inj_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_inj_1 	upper=p95_n_prep_inj_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "n_prep_vr_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 100000) valueattrs=(size=10);
label p50_n_prep_vr_w_0 = "Option 0 (median) ";
label p50_n_prep_vr_w_1 = "Option 1 (median) ";

series  x=cald y=p50_n_prep_vr_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_0 	upper=p95_n_prep_vr_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_prep_vr_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_1 	upper=p95_n_prep_vr_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;






proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0 = "Option 0 (median) ";
label p50_p_tested_past_year_1549m_1 = "Option 1 (median) ";

series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0 = "Option 0 (median) ";
label p50_p_tested_past_year_1549w_1 = "Option 1 (median) ";

series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Option 0 (median) ";
label p50_p_mcirc_1549m_1 = "Option 1 (median) ";

series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
label p50_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";

label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";


series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";

series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prop_w_1524_onprep_0 = "Option 0 (median) ";
label p50_prop_w_1524_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prop_1564_onprep_0 = "Option 0 (median) ";
label p50_prop_1564_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
label p50_prevalence1549m_1 = "Men Option 1 (median) ";
label p50_prevalence1549w_0 = "Women Option 0 (median) ";
label p50_prevalence1549w_1 = "Women Option 1 (median) ";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";

series  x=cald y=prev_obs_sa/	lineattrs = (color=black thickness = 3) ;
series  x=cald y=prev_w_obs_sa /	lineattrs = (color=blue  thickness = 3);
series  x=cald y=prev_m_obs_sa/	lineattrs = (color=green thickness = 3) ;

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label p50_incidence1549__0 = "Option 0 (median) ";
label p50_incidence1549__1 = "Option 1  (median) ";

series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-24 women)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label p50_incidence1524___0 = "Option 0 (median) ";
label p50_incidence1524___1 = "Option 1  (median) ";

series  x=cald y=p50_incidence1524___0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1524___0 	upper=p95_incidence1524___0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1524___1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1524___1 	upper=p95_incidence1524___1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);

label p50_incidence1564__0 = "Option 0 (median) ";
label p50_incidence1564__1 = "Option 1  (median) ";

series  x=cald y=p50_incidence1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564__0 	upper=p95_incidence1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1564__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1564__1 	upper=p95_incidence1564__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";


run;
quit;


/*

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 1524w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence1524__0 = "Option 0 (median) ";
label p50_incidence1524__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence1524w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1524w__0 	upper=p95_incidence1524w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1524w__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1524w__1 	upper=p95_incidence1524w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 1524m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence1524__0 = "Option 0 (median) ";
label p50_incidence1524__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence1524m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1524m__0 	upper=p95_incidence1524m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1524m__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1524m__1 	upper=p95_incidence1524m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2534w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence2534__0 = "Option 0 (median) ";
label p50_incidence2534__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence2534w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence2534w__0 	upper=p95_incidence2534w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence2534w__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence2534w__1 	upper=p95_incidence2534w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2534m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence2534__0 = "Option 0 (median) ";
label p50_incidence2534__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence2534m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence2534m__0 	upper=p95_incidence2534m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence2534m__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence2534m__1 	upper=p95_incidence2534m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 3544w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence3544__0 = "Option 0 (median) ";
label p50_incidence3544__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence3544w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence3544w__0 	upper=p95_incidence3544w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence3544w__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence3544w__1 	upper=p95_incidence3544w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 3544m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence3544__0 = "Option 0 (median) ";
label p50_incidence3544__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence3544m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence3544m__0 	upper=p95_incidence3544m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence3544m__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence3544m__1 	upper=p95_incidence3544m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 4554w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence4554__0 = "Option 0 (median) ";
label p50_incidence4554__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence4554w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence4554w__0 	upper=p95_incidence4554w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence4554w__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence4554w__1 	upper=p95_incidence4554w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 4554m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence4554__0 = "Option 0 (median) ";
label p50_incidence4554__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence4554m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence4554m__0 	upper=p95_incidence4554m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence4554m__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence4554m__1 	upper=p95_incidence4554m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 5564w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence5564__0 = "Option 0 (median) ";
label p50_incidence5564__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence5564w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence5564w__0 	upper=p95_incidence5564w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence5564w__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence5564w__1 	upper=p95_incidence5564w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 5564m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence5564__0 = "Option 0 (median) ";
label p50_incidence5564__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence5564m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence5564m__0 	upper=p95_incidence5564m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence5564m__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence5564m__1 	upper=p95_incidence5564m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;

*/

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_vlsupp_0 = "Option 0 (median) ";
label p50_p_inf_vlsupp_1 = "Option 1  (median) ";

series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_inf_vlsupp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_ep_0 = "Option 0 (median) ";
label p50_p_inf_ep_1 = "Option 1  (median) ";

series  x=cald y=p50_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_inf_ep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_ep_1 	upper=p95_p_inf_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_newp_0 = "Option 0 (median) ";
label p50_p_inf_newp_1 = "Option 1  (median) ";

series  x=cald y=p50_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_inf_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_newp_1 	upper=p95_p_inf_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_primary_0 = "Option 0 (median) ";
label p50_p_inf_primary_1 = "Option 1  (median) ";

series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_inf_primary_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_naive_0 = "Option 0 (median) ";
label p50_p_inf_naive_1 = "Option 1  (median) ";

series  x=cald y=p50_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_inf_naive_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_naive_1 	upper=p95_p_inf_naive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_diag_0 = "Option 0 (median) ";
label p50_p_inf_diag_1 = "Option 1  (median) ";

series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_mtct_prop_0 = "Option 0 (median) ";
label p50_mtct_prop_1 = "Option 1  (median) ";

series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of men with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label p50_p_diag_m_0 = "Option 0 (median) ";
label p50_p_diag_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "of women with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label p50_p_diag_w_0 = "Option 0 (median) ";
label p50_p_diag_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.01) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "Option 0 (median) ";
label p50_p_ai_no_arv_c_nnm_1 = "Option 1  (median) ";

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ai_no_arv_c_nnm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Option 0 (median) ";
label p50_p_artexp_diag_1 = "Option 1  (median) ";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_m_0 = "Option 0 (median) ";
label p50_p_onart_diag_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_w_0 = "Option 0 (median) ";
label p50_p_onart_diag_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by 1000000) valueattrs=(size=10);

label p50_n_onart_0 = "Option 0 (median) ";
label p50_n_onart_1 = "Option 1  (median) ";

series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=n_onart_obs_sa;

run;quit;


/*


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_efa_0 = "Option 0 (median) ";
label p50_p_efa_1 = "Option 1  (median) ";

series  x=cald y=p50_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_efa_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_efa_1 	upper=p95_p_efa_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_taz_0 = "Option 0 (median) ";
label p50_p_taz_1 = "Option 1  (median) ";

series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_taz_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_ten_0 = "Option 0 (median) ";
label p50_p_ten_1 = "Option 1  (median) ";

series  x=cald y=p50_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ten_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ten_1 	upper=p95_p_ten_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_zdv_0 = "Option 0 (median) ";
label p50_p_zdv_1 = "Option 1  (median) ";

series  x=cald y=p50_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_zdv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_zdv_1 	upper=p95_p_zdv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_dol_0 = "Option 0 (median) ";
label p50_p_dol_1 = "Option 1  (median) ";

series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_dol_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


/*

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_3TC_0 = "Option 0 (median) ";
label p50_p_3TC_1 = "Option 1  (median) ";

series  x=cald y=p50_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_3TC_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_3TC_1 	upper=p95_p_3TC_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_lpr_0 = "Option 0 (median) ";
label p50_p_lpr_1 = "Option 1  (median) ";

series  x=cald y=p50_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_lpr_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_lpr_1 	upper=p95_p_lpr_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_nev_0 = "Option 0 (median) ";
label p50_p_nev_1 = "Option 1  (median) ";

series  x=cald y=p50_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_nev_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_nev_1 	upper=p95_p_nev_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

*/


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "Option 0 (median) ";
label p50_p_onart_vl1000__1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";
label p50_p_vl1000__1 = "Option 1  (median) ";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vg1000__0 = "Option 0 (median) ";
label p50_p_vg1000__1 = "Option 1  (median) ";

series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_m_0 = "Option 0 (median) ";
label p50_p_onart_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_w_0 = "Option 0 (median) ";
label p50_p_onart_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_m_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_w_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "Option 0 (median) ";
label p50_prevalence_vg1000__1 = "Option 1  (median) ";

series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prev_vg1000_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_prev_vg1000_newp_0 = "Option 0 (median) ";
label p50_prev_vg1000_newp_1 = "Option 1  (median) ";

series  x=cald y=p50_prev_vg1000_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prev_vg1000_newp_0 	upper=p95_prev_vg1000_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_vg1000_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prev_vg1000_newp_1 	upper=p95_prev_vg1000_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 50000) valueattrs=(size=10);

label p50_n_death_2059_w_0 = "Option 0 (median) ";
label p50_n_death_2059_w_1 = "Option 1  (median) ";

series  x=cald y=p50_n_death_2059_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_2059_w_0 	upper=p95_n_death_2059_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_2059_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_death_2059_w_1 	upper=p95_n_death_2059_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=n_death_2059_w_obs_sa;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 50000) valueattrs=(size=10);

label p50_n_death_2059_m_0 = "Option 0 (median) ";
label p50_n_death_2059_m_1 = "Option 1  (median) ";

series  x=cald y=p50_n_death_2059_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_2059_m_0 	upper=p95_n_death_2059_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_2059_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_death_2059_m_1 	upper=p95_n_death_2059_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=n_death_2059_m_obs_sa;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_hiv_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 50000) valueattrs=(size=10);

label p50_n_death_hiv_m_0 = "Option 0 (median) ";

series  x=cald y=p50_n_death_hiv_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_m_0 	upper=p95_n_death_hiv_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_hiv_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 50000) valueattrs=(size=10);

label p50_n_death_hiv_w_0 = "Option 0 (median) ";

series  x=cald y=p50_n_death_hiv_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_w_0 	upper=p95_n_death_hiv_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5000000 by 500000) valueattrs=(size=10);

label p50_n_cd4_lt200__0 = "Option 0 (median) ";

series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000000 by 10000000) valueattrs=(size=10);

label p50_n_alive_0 = "Option 0 (median) ";

series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by 1000000) valueattrs=(size=10);

label p50_n_hiv_0 = "Option 0 (median) ";

series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



/*


ods html;

proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw55r_0 	upper=p95_logw55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

title;

* ods rtf close;
* ods listing;
run;




* graph of prevalence by age ;

data f; set d;

keep

p5_prevalence1519w_0 	p5_prevalence1519m_0 p5_prevalence2024w_0 	p5_prevalence2024m_0 p5_prevalence2529w_0 	p5_prevalence2529m_0
p5_prevalence3034w_0 	p5_prevalence3034m_0 p5_prevalence3539w_0 	p5_prevalence3539m_0 p5_prevalence4044w_0 	p5_prevalence4044m_0 
p5_prevalence4549w_0 	p5_prevalence4549m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0
p5_prevalence5559w_0 	p5_prevalence5559m_0 
p50_prevalence1519w_0 	p50_prevalence1519m_0 p50_prevalence2024w_0 	p50_prevalence2024m_0 p50_prevalence2529w_0 	p50_prevalence2529m_0
p50_prevalence3034w_0 	p50_prevalence3034m_0 p50_prevalence3539w_0 	p50_prevalence3539m_0 p50_prevalence4044w_0 	p50_prevalence4044m_0 
p50_prevalence4549w_0 	p50_prevalence4549m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0
p50_prevalence5559w_0 	p50_prevalence5559m_0 
p95_prevalence1519w_0 	p95_prevalence1519m_0 p95_prevalence2024w_0 	p95_prevalence2024m_0 p95_prevalence2529w_0 	p95_prevalence2529m_0
p95_prevalence3034w_0 	p95_prevalence3034m_0 p95_prevalence3539w_0 	p95_prevalence3539m_0 p95_prevalence4044w_0 	p95_prevalence4044m_0 
p95_prevalence4549w_0 	p95_prevalence4549m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0
p95_prevalence5559w_0 	p95_prevalence5559m_0 

;

if cald=2017;

data age15w ; set f;  ageg=15; sex=2; 	p5_prevalence = p5_prevalence1519w_0 ;p50_prevalence = p50_prevalence1519w_0 ;
p95_prevalence = p95_prevalence1519w_0 ; prev_obs_sa = 0.058 ;
data age20w ; set f;  ageg=20; sex=2; p5_prevalence = p5_prevalence2024w_0 ; p50_prevalence = p50_prevalence2024w_0 ; 
p95_prevalence = p95_prevalence2024w_0 ; prev_obs_sa = 0.156 ;
data age25w ; set f;  ageg=25; sex=2; p5_prevalence = p5_prevalence2529w_0 ;p50_prevalence = p50_prevalence2529w_0 ;
p95_prevalence = p95_prevalence2529w_0 ;prev_obs_sa = 0.275 ;
data age30w ; set f;  ageg=30; sex=2; p5_prevalence = p5_prevalence3034w_0 ; p50_prevalence = p50_prevalence3034w_0 ; 
p95_prevalence = p95_prevalence3034w_0 ; prev_obs_sa = 0.347 ;
data age35w ; set f;  ageg=35; sex=2; p5_prevalence = p5_prevalence3539w_0 ; p50_prevalence = p50_prevalence3539w_0 ; 
p95_prevalence = p95_prevalence3539w_0 ; prev_obs_sa = 0.394 ;
data age40w ; set f;  ageg=40; sex=2; p5_prevalence = p5_prevalence4044w_0 ;p50_prevalence = p50_prevalence4044w_0 ;
p95_prevalence = p95_prevalence4044w_0 ;prev_obs_sa = 0.359 ;
data age45w ; set f;  ageg=45; sex=2; p5_prevalence = p5_prevalence4549w_0 ; p50_prevalence = p50_prevalence4549w_0 ;
 p95_prevalence = p95_prevalence4549w_0 ;prev_obs_sa = 0.303 ;
data age50w ; set f;  ageg=50; sex=2; p5_prevalence = p5_prevalence5054w_0 ; p50_prevalence = p50_prevalence5054w_0 ; 
p95_prevalence = p95_prevalence5054w_0 ; prev_obs_sa = 0.222 ;
data age55w ; set f;  ageg=55; sex=2; p5_prevalence = p5_prevalence5559w_0 ;p50_prevalence = p50_prevalence5559w_0 ;
p95_prevalence = p95_prevalence5559w_0 ;prev_obs_sa = 0.176 ;

data age15m ; set f;  ageg=15; sex=1; p5_prevalence = p5_prevalence1519m_0 ; p50_prevalence = p50_prevalence1519m_0 ; 
p95_prevalence = p95_prevalence1519m_0 ; prev_obs_sa = 0.047 ;
data age20m ; set f;  ageg=20; sex=1; p5_prevalence = p5_prevalence2024m_0 ; p50_prevalence = p50_prevalence2024m_0 ; 
p95_prevalence = p95_prevalence2024m_0 ; prev_obs_sa = 0.048 ;
data age25m ; set f;  ageg=25; sex=1; p5_prevalence = p5_prevalence2529m_0 ; p50_prevalence = p50_prevalence2529m_0 ; 
p95_prevalence = p95_prevalence2529m_0 ; prev_obs_sa = 0.124 ;
data age30m ; set f;  ageg=30; sex=1; p5_prevalence = p5_prevalence3034m_0 ;p50_prevalence = p50_prevalence3034m_0 ;
p95_prevalence = p95_prevalence3034m_0 ;prev_obs_sa = 0.184 ;
data age35m ; set f;  ageg=35; sex=1; p5_prevalence = p5_prevalence3539m_0 ;p50_prevalence = p50_prevalence3539m_0 ;
p95_prevalence = p95_prevalence3539m_0 ;prev_obs_sa = 0.237 ;
data age40m ; set f;  ageg=40; sex=1; p5_prevalence = p5_prevalence4044m_0 ;p50_prevalence = p50_prevalence4044m_0 ;
p95_prevalence = p95_prevalence4044m_0 ;prev_obs_sa = 0.224 ;
data age45m ; set f;  ageg=45; sex=1; p5_prevalence = p5_prevalence4549m_0 ;p50_prevalence = p50_prevalence4549m_0 ;
p95_prevalence = p95_prevalence4549m_0 ;prev_obs_sa = 0.248 ;
data age50m ; set f;  ageg=50; sex=1; p5_prevalence = p5_prevalence5054m_0 ; p50_prevalence = p50_prevalence5054m_0 ;
 p95_prevalence = p95_prevalence5054m_0 ;prev_obs_sa = 0.202 ;
data age55m ; set f;  ageg=55; sex=1; p5_prevalence = p5_prevalence5559m_0 ;p50_prevalence = p50_prevalence5559m_0 ;
p95_prevalence = p95_prevalence5559m_0 ;prev_obs_sa = 0.148 ;

data all; set age15w age20w age25w age30w age35w age40w age45w age50w age55w
 age15m age20m age25m age30m age35m age40m age45m age50m age55m
; 

drop
p5_prevalence1519w_0 	p5_prevalence1519m_0 p5_prevalence2024w_0 	p5_prevalence2024m_0 p5_prevalence2529w_0 	p5_prevalence2529m_0
p5_prevalence3034w_0 	p5_prevalence3034m_0 p5_prevalence3539w_0 	p5_prevalence3539m_0 p5_prevalence4044w_0 	p5_prevalence4044m_0 
p5_prevalence4549w_0 	p5_prevalence4549m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0
p5_prevalence5559w_0 	p5_prevalence5559m_0 
p50_prevalence1519w_0 	p50_prevalence1519m_0 p50_prevalence2024w_0 	p50_prevalence2024m_0 p50_prevalence2529w_0 	p50_prevalence2529m_0
p50_prevalence3034w_0 	p50_prevalence3034m_0 p50_prevalence3539w_0 	p50_prevalence3539m_0 p50_prevalence4044w_0 	p50_prevalence4044m_0 
p50_prevalence4549w_0 	p50_prevalence4549m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0
p50_prevalence5559w_0 	p50_prevalence5559m_0 
p95_prevalence1519w_0 	p95_prevalence1519m_0 p95_prevalence2024w_0 	p95_prevalence2024m_0 p95_prevalence2529w_0 	p95_prevalence2529m_0
p95_prevalence3034w_0 	p95_prevalence3034m_0 p95_prevalence3539w_0 	p95_prevalence3539m_0 p95_prevalence4044w_0 	p95_prevalence4044m_0 
p95_prevalence4549w_0 	p95_prevalence4549m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0
p95_prevalence5559w_0 	p95_prevalence5559m_0 
;


proc sgplot data=all; Title 'prevalence by age - women'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 55 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 1 by 0.05) valueattrs=(size=10);
series  x=ageg y=p50_prevalence/	lineattrs = (color=blue thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series x=ageg y=prev_obs_sa / lineattrs = (color=black thickness = 2);
where sex=2;
run;


proc sgplot data=all; Title 'prevalence by age - men'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 55 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 1 by 0.05) valueattrs=(size=10);
series  x=ageg y=p50_prevalence/	lineattrs = (color=blue thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series x=ageg y=prev_obs_sa / lineattrs = (color=black thickness = 2);
where sex=1;
run;

quit;

ods html close;






	
*/
