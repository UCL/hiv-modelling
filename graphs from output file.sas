
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\ValentinaCambiano\TLO_HMC Dropbox\Valentina Cambiano\hiv synthesis ssa unified program\output files\zimbabwe\";run;

proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
/*
proc contents data=a.l_base_keep_zim;run;
proc freq data=a.l_base_keep_zim;table n_hiv_m n_hiv_w;run;*/
*Keep output to be able to create the following outputs:
-	prevalence among pregnant women
- annual number of new male circumcisions;

data b;
* set a.l_base_mlw;
  set a.l_base_keep_zim;


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
incidence2549w_ = incidence2549w; incidence2549m_ = incidence2549m;

n_new_inf1549_ = n_new_inf1549;

prev_hiv_preg_1519_ = prev_hiv_preg_1519;
prev_hiv_preg_2024_	= prev_hiv_preg_2024;
prev_hiv_preg_2529_ = prev_hiv_preg_2529;
prev_hiv_preg_3034_ = prev_hiv_preg_3034;
prev_hiv_preg_3539_ = prev_hiv_preg_3539;
prev_hiv_preg_4044_ = prev_hiv_preg_4044;
prev_hiv_preg_4549_ = prev_hiv_preg_4549;
prev_hiv_preg_50pl_ = prev_hiv_preg_50pl;

n_cd4_lt200_ = n_cd4_lt200;

p_onart_vl1000_ = p_onart_vl1000;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
p_newp_ge1_ = p_newp_ge1 ;
p_1524_newp_ge1_ = p_1524_newp_ge1 ;
p_1524m_newp_ge1_ = p_1524m_newp_ge1 ;
p_1524w_newp_ge1_ = p_1524w_newp_ge1 ;
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
ods listing;
proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit =  33   ;
*%let year_end = 2022.00 ;
%let year_end = 2042.00 ;
run;
proc sort;by cald option ;run;

/*proc freq data=b;table option;run;*/
***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m p_mcirc n_new_vmmc1549m
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence1549_ prevalence_hiv_preg 
prev_hiv_preg_1519_	prev_hiv_preg_2024_	prev_hiv_preg_2529_	prev_hiv_preg_3034_
prev_hiv_preg_3539_	prev_hiv_preg_4044_	prev_hiv_preg_4549_	prev_hiv_preg_50pl_
prevalence_vg1000_  incidence1549_ incidence1549w incidence1549m incidence1564_ 
incidence1524w_ incidence1524m_ incidence2534w_ incidence2534m_ incidence3544w_ incidence3544m_ incidence4554w_ incidence4554m_ 
incidence5564w_ incidence5564m_ incidence2549w_ incidence2549m_ 
n_tested n_tested_m test_prop_positive
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_art_start_y 	/*n_all_ai_y */	n_onart n_onart_w n_onart_m 
n_death_2059_m n_death_2059_w  n_death_hiv_m n_death_hiv_w  rate_dead_allage rate_dead_allage_m rate_dead_allage_w
n_cd4_lt200_
prevalence1519w 	prevalence1519m 	prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m 	prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m 	prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m 	prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
prevalence1524w 	prevalence1524m 	prevalence2549w 	prevalence2549m 
n_alive 	n_alive1549_	n_alive_m 	n_alive_w 	n_diagnosed n_hiv n_hiv_m n_hiv_w
p_1524_newp_ge1_ p_1524m_newp_ge1_ p_1524w_newp_ge1_
n_new_inf1549_	n_new_inf1549m	n_new_inf1549w
n_new_inf1524m	n_new_inf1524w n_new_inf2549m	n_new_inf2549w
n_death_hivrel n_death_hivrel_m n_death_hivrel_w 
rate_dead_hivneg_1524m  rate_dead_hivneg_2534m  rate_dead_hivneg_3544m  rate_dead_hivneg_4554m  rate_dead_hivneg_5564m  rate_dead_hivneg_65plm 
rate_dead_hivneg_1524w  rate_dead_hivneg_2534w  rate_dead_hivneg_3544w  rate_dead_hivneg_4554w  rate_dead_hivneg_5564w  rate_dead_hivneg_65plw 

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


/*
data option_1;
set b;
if option =0 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m p_mcirc n_new_vmmc1549m
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence1549_  prevalence_hiv_preg prevalence_vg1000_  incidence1549_  incidence1549w incidence1549m incidence1564_ 
incidence1524w_ incidence1524m_ incidence2534w_ incidence2534m_ incidence3544w_ incidence3544m_ incidence4554w_ incidence4554m_ 
incidence5564w_ incidence5564m_ n_tested n_tested_m test_prop_positive
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart n_death_2059_m n_death_2059_w n_death_hiv_m n_death_hiv_w rate_dead_allage rate_dead_allage_m rate_dead_allage_w n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed  n_hiv

p_1524_newp_ge1_
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
g76  g77  g78  g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100    
g101 g102 g103 g104 g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 
g126 g127 g128 g129 g130 g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 
g151 g152 g153 g154 g155 g156 g157 g158 g159 g160 
/*g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 */
/*
h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52  h53  h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72  h73  h74  h75
h77  h78  h79  h80  h81  h82  h83  h84  h85  h86  h87  h88  h89  h90  h91  h92  h93  h94  h95  h96  h97  h98 h99  h100 h101 h102
h103 h104 h105 h106 h107 h108 h109 h110 h111 h112 h113 h114*/
;
by cald;


%include "C:/Users/ValentinaCambiano/OneDrive - University College London/Documents/GitHub/hiv-modelling/Observed data_Zimbabwe_Sep2021.sas";
run;

ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 

ods listing close;
ods rtf file="C:\Users\ValentinaCambiano\TLO_HMC Dropbox\Valentina Cambiano\hiv synthesis ssa unified program\output files\zimbabwe\allgraphs_33sim_20220131.rtf";

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Option 0 (median) ";
label p50_p_w_giv_birth_this_per_1 = "Option 1 (median) ";

series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_0 	upper=p97p5_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Option 0 90% range";
*series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p2p5_p_w_giv_birth_this_per_1 	upper=p97p5_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";
run;

quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0 = "Option 0 (median) ";
label p50_p_newp_ge1__1 = "Option 1 (median) ";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_1524_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_p_1524_newp_ge1__0 = "Option 0 (median) - Both";
label p50_p_1524_newp_ge1__1 = "Option 1 (median) ";
label p50_p_1524m_newp_ge1__0 = "Option 0 (median) - Men";
label p50_p_1524w_newp_ge1__0 = "Option 0 (median) - Women";
label o_p_cls_last_1524m_zdhs = "CAL - DHS - No condom use at last sex - Men";
label o_p_cls_last_1524w_zdhs = "CAL - DHS - No condom use at last sex - Women";
series  x=cald y=p50_p_1524_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_1524_newp_ge1__0 	upper=p95_p_1524_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_1524m_newp_ge1__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_1524m_newp_ge1__0 	upper=p95_p_1524m_newp_ge1__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_1524w_newp_ge1__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_1524w_newp_ge1__0 	upper=p95_p_1524w_newp_ge1__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*series  x=cald y=p50_p_1524_newp_ge1__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_1524_newp_ge1__1 	upper=p95_p_1524_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_cls_last_1524w_zdhs/	markerattrs = (color=orange);
scatter  x=cald y=o_p_cls_last_1524m_zdhs/	markerattrs = (color=blue);
run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0 = "Option 0 (median) ";
label p50_p_newp_ge5__1 = "Option 1 (median) ";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label p50_log_gender_r_newp_0 = "Option 0 (median) ";
label p50_log_gender_r_newp_1 = "Option 1 (median) ";
series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  7500000 by 500000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0 = "Option 0 (median) ";
label p50_p_tested_past_year_1549m_1 = "Option 1 (median) ";
label o_p_testedly_1549m_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_testedly_1549m_zdhs/	markerattrs = (color=black) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0 = "Option 0 (median) ";
label p50_p_tested_past_year_1549w_1 = "Option 1 (median) ";
label o_p_testedly_1549w_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_testedly_1549w_zdhs/	markerattrs = (color=black) ;
run;quit;



*test_prop_positive;
proc sgplot data=d; 
Title    height=1.5 justify=center "Positivity rate";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_test_prop_positive_0 = "Option 0 (median) ";
label p50_test_prop_positive_1 = "Option 1 (median) ";
label o_pos_rate_15ov_z = "CAL - Public sector";
series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_pos_rate_15ov_z/	markerattrs = (color=black ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new diagnoses with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

label p50_n_diagnosed_0 = "Option 0 (median) ";
label p50_n_diagnosed_1 = "Option 1  (median) ";

series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_diagnosed_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of ART initiations";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

*label p50_n_all_ai_y_0 = "Option 0 (median) - all";
*label p50_n_all_ai_y_1 = "Option 1  (median) - all";
label p50_n_art_start_y_0 = "Option 0 (median) - 1st";
label p50_n_art_start_y_1 = "Option 1  (median) - 1st";
*series  x=cald y=p50_n_all_ai_y_0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_0 	upper=p95_n_all_ai_y_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range - all";
*series  x=cald y=p50_n_all_ai_y_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_1 	upper=p95_n_all_ai_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_art_start_y_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_art_start_y_0 	upper=p95_n_art_start_y_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range - 1st";
*series  x=cald y=p50_n_art_start_y_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_art_start_y_1 	upper=p95_n_art_start_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

*!!!!!Note that the observed data are 15+;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised (Data 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Option 0 (median) - 15-49";
label p50_p_mcirc_1549m_1 = "Option 1 (median) ";
label p50_p_mcirc_0 = "Option 0 (median) - 15+?";
label o_p_circ_15pl_DHIS2_z= "CAL - DHIS2 men 15+";
series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_circ_15pl_DHIS2_z /	markerattrs = (color=blue);
run;quit;

 
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual # new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000 by 100000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Annual number of new circumcisions 10-49";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_new_mcirc/	markerattrs = (color=blue ) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
label p50_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";
label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";

label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
label o_p_ever_fsw_1ts_1849w_nbcs = "NBCS - Ever transactional sex 18-49";

series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=lightgreen thickness = 2);
*band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_fsw_1849_Zim_garpr /	markerattrs = (color=orange);
scatter  x=cald y=o_p_fsw_1849_Bulaw_garpr /	markerattrs = (color=red);
scatter  x=cald y=o_p_fsw_1849_Harare_garpr /	markerattrs = (color=pink);
scatter  x=cald y=o_p_ever_fsw_1ts_1849w_nbcs /	markerattrs = (color=green);
run;quit;
/*proc print data=d;var p50_prop_w_1549_sw_0 p5_prop_w_1549_sw_0 p95_prop_w_1549_sw_0;where cald=2020;run;*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";
label o_prev_fsw_dw = "David Wilson";
label o_prev_fsw_rdshm = "RDS Hwange and Mutare";
label o_prev_fsw_rdsvf = "RDS Victoria Falls";
label o_prev_fsw_tested_swvp = "Sisters with a Voice";
label o_prev_fsw_rds = "RDS baseline SAPPH-IRe";
series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_prev_fsw_dw /  yerrorlower=o_prev_fsw_ll_dw yerrorupper=o_prev_fsw_ul_dw markerattrs = (color=black) ERRORBARATTRS = (color = black) ;
scatter x=cald y=o_prev_fsw_rdshm / markerattrs = (color=blue) ;
scatter x=cald y=o_prev_fsw_rdsvf / markerattrs = (color=red) ;
scatter x=cald y=o_prev_fsw_tested_swvp / markerattrs = (color=green) ;
scatter x=cald y=o_prev_fsw_rds /  yerrorlower=o_prev_fsw_ll_rds yerrorupper=o_prev_fsw_ul_rds markerattrs = (color=orange) ERRORBARATTRS = (color = orange) ;
run;quit;
/*proc print data=d;var p50_prop_sw_hiv_0 p5_prop_sw_hiv_0 p95_prop_sw_hiv_0;where cald=2020;run;*/



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);
label p50_prop_w_1524_onprep_0 = "Option 0 (median) ";
label p50_prop_w_1524_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);
label p50_prop_1564_onprep_0 = "Option 0 (median) ";
label p50_prop_1564_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
label p50_prevalence1549m_1 = "Men Option 1 (median) ";
label p50_prevalence1549w_0 = "Women Option 0 (median) ";
label p50_prevalence1549w_1 = "Women Option 1 (median) ";
label o_prev1549_Z_ess = "CAL - ZIMPHIA or DHS";
label o_prev1549m_Z_ess = "CAL - ZIMPHIA or DHS - men";
label o_prev1549w_Z_ess = "CAL - ZIMPHIA or DHS - women";


series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
*band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
*band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";

*MIHPSA essential;
scatter x=cald y=o_prev1549_Z_ess  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=black) errorbarattrs = (color = black) ;
scatter x=cald y=o_prev1549m_Z_ess /  yerrorlower=o_prev1549m_ll_Z_ess yerrorupper=o_prev1549m_ul_Z_ess markerattrs = (color=blue) errorbarattrs = (color = blue) ;
scatter x=cald y=o_prev1549w_Z_ess /  yerrorlower=o_prev1549w_ll_Z_ess yerrorupper=o_prev1549w_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange) ;
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Option 0 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";

series  x=cald y=p50_prevalence_hiv_preg_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_prev1549w_Z_anc  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence 15-24 - by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence1524m_0 = "Option 0 (median) - Males 15-24";
label p50_prevalence1524w_0 = "Option 0 (median) - Females 15-24";
label o_prev1524m_yas = "Zimbabwe Young Adult Survey - Males";
label o_prev1524w_yas = "Zimbabwe Young Adult Survey - Females";
label o_prev1524m_Z_dhs = "DHS - Males";
label o_prev1524w_Z_dhs = "DHS - Females";

series  x=cald y=p50_prevalence1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1524m_0 	upper=p95_prevalence1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1524w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1524w_0 	upper=p95_prevalence1524w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

scatter x=cald y=o_prev1524m_yas /  markerattrs = (color=blue);
scatter x=cald y=o_prev1524w_yas /  markerattrs = (color=orange);
scatter x=cald y=o_prev1524m_Z_DHS /  markerattrs = (color=darkblue);
scatter x=cald y=o_prev1524w_Z_DHS /  markerattrs = (color=darkorange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence 25-49 - by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence2549m_0 = "Option 0 (median) - Males 25-49";
label p50_prevalence2549w_0 = "Option 0 (median) - Females 25-49";
label o_prev2549m_Z_DHS = "DHS - Males";
label o_prev2549w_Z_DHS = "DHS - Females";
series  x=cald y=p50_prevalence2549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence2549m_0 	upper=p95_prevalence2549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence2549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence2549w_0 	upper=p95_prevalence2549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
scatter x=cald y=o_prev2549m_Z_DHS /  markerattrs = (color=darkblue);
scatter x=cald y=o_prev2549w_Z_DHS /  markerattrs = (color=darkorange);
run;quit;


/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women - by age";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Option 0 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";

series  x=cald y=p50_prev_hiv_preg_1519__0/	lineattrs = (color=yellow thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_1519__0 	upper=p95_prev_hiv_preg_1519__0  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_2024__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_2024__0 	upper=p95_prev_hiv_preg_2024__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_2529__0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_2529__0 	upper=p95_prev_hiv_preg_2529__0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_3034__0/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_3034__0 	upper=p95_prev_hiv_preg_3034__0  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_3539__0/	lineattrs = (color=violet thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_3539__0 	upper=p95_prev_hiv_preg_3539__0  / transparency=0.9 fillattrs = (color=violet) legendlabel= "Model 90% range";

series  x=cald y=p50_prev_hiv_preg_4044__0/	lineattrs = (color=brown thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_4044__0 	upper=p95_prev_hiv_preg_4044__0  / transparency=0.9 fillattrs = (color=brown) legendlabel= "Model 90% range";
series  x=cald y=p50_prev_hiv_preg_4549__0/	lineattrs = (color=darkbrown thickness = 2);
band    x=cald lower=p5_prev_hiv_preg_4549__0 	upper=p95_prev_hiv_preg_4549__0  / transparency=0.9 fillattrs = (color=darkbrown) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_prev1519w_Z_anc  /  markerattrs = (color=yellow);
scatter x=cald y=o_prev2024w_Z_anc  /  markerattrs = (color=orange);
scatter x=cald y=o_prev2529w_Z_anc  /  markerattrs = (color=red);
scatter x=cald y=o_prev3034w_Z_anc  /  markerattrs = (color=purple);
scatter x=cald y=o_prev3539w_Z_anc  /  markerattrs = (color=violet);
scatter x=cald y=o_prev4044w_Z_anc  /  markerattrs = (color=brown);
scatter x=cald y=o_prev4549w_Z_anc  /  markerattrs = (color=darkbrown);
run;quit;
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1549__0 = "Option 0 (median) ";
label p50_incidence1549__1 = "Option 1  (median) ";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1564__0 = "Option 0 (median) ";
label p50_incidence1564__1 = "Option 1  (median) ";
label o_HIVincid_1564_Zimphia = "ZIMPHIA 15-64";
series  x=cald y=p50_incidence1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564__0 	upper=p95_incidence1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1564__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1564__1 	upper=p95_incidence1564__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1564_Zimphia / yerrorlower=o_HIVincid_1564_ll_Zimphia yerrorupper=o_HIVincid_1564_ul_Zimphia markerattrs = (symbol=square color=black size = 10) errorbarattrs = (color = black);
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1549m__0 = "Option 0 (median) - Men";
label p50_incidence1549m__1 = "Option 1  (median) - Men";
label p50_incidence1549w__0 = "Option 0 (median) - Women";
label p50_incidence1549w__1 = "Option 1  (median) - Women";
label o_HIVincid_1549m_Zimphia = "ZIMPHIA Men 15-49";
label o_HIVincid_1549w_Zimphia = "ZIMPHIA Women 15-49";
series  x=cald y=p50_incidence1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549m__1 	upper=p95_incidence1549m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549w__1 	upper=p95_incidence1549w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1549m_Zimphia / yerrorlower=o_HIVincid_1549m_ll_Zimphia yerrorupper=o_HIVincid_1549m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_1549w_Zimphia / yerrorlower=o_HIVincid_1549w_ll_Zimphia yerrorupper=o_HIVincid_1549w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 15-24";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1524m__0 = "Option 0 (median) - Men";
label p50_incidence1524m__1 = "Option 1  (median) - Men";
label p50_incidence1524w__0 = "Option 0 (median) - Women";
label p50_incidence1524w__1 = "Option 1  (median) - Women";
label o_HIVincid_1524m_Zimphia = "ZIMPHIA Men 15-24";
label o_HIVincid_1524w_Zimphia = "ZIMPHIA Women 15-24";

series  x=cald y=p50_incidence1524m__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1524m__0 	upper=p95_incidence1524m__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1524m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1524m__1 	upper=p95_incidence1524m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1524w__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1524w__0 	upper=p95_incidence1524w__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1524w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1524w__1 	upper=p95_incidence1524w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1524m_Zimphia / yerrorlower=o_HIVincid_1524m_ll_Zimphia yerrorupper=o_HIVincid_1524m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_1524w_Zimphia / yerrorlower=o_HIVincid_1524w_ll_Zimphia yerrorupper=o_HIVincid_1524w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2534";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence2534m__0 = "Option 0 (median) - Men";
label p50_incidence2534m__1 = "Option 1  (median) - Men";
label p50_incidence2534w__0 = "Option 0 (median) - Women";
label p50_incidence2534w__1 = "Option 1  (median) - Women";
label o_HIVincid_2534m_Zimphia = "ZIMPHIA Men 25-34";
label o_HIVincid_2534w_Zimphia = "ZIMPHIA Women 25-34";

series  x=cald y=p50_incidence2534m__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence2534m__0 	upper=p95_incidence2534m__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2534m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2534m__1 	upper=p95_incidence2534m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence2534w__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence2534w__0 	upper=p95_incidence2534w__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2534w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2534w__1 	upper=p95_incidence2534w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_2534m_Zimphia / yerrorlower=o_HIVincid_2534m_ll_Zimphia yerrorupper=o_HIVincid_2534m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_2534w_Zimphia / yerrorlower=o_HIVincid_2534w_ll_Zimphia yerrorupper=o_HIVincid_2534w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 3544";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence3544m__0 = "Option 0 (median) - Men";
label p50_incidence3544m__1 = "Option 1  (median) - Men";
label p50_incidence3544w__0 = "Option 0 (median) - Women";
label p50_incidence3544w__1 = "Option 1  (median) - Women";
label o_HIVincid_3549m_Zimphia = "ZIMPHIA Men 35-49";
label o_HIVincid_3549w_Zimphia = "ZIMPHIA Women 35-49";
series  x=cald y=p50_incidence3544m__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence3544m__0 	upper=p95_incidence3544m__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence3544m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence3544m__1 	upper=p95_incidence3544m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence3544w__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence3544w__0 	upper=p95_incidence3544w__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence3544w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence3544w__1 	upper=p95_incidence3544w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_3549m_Zimphia / yerrorlower=o_HIVincid_3549m_ll_Zimphia yerrorupper=o_HIVincid_3549m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_3549w_Zimphia / yerrorlower=o_HIVincid_3549w_ll_Zimphia yerrorupper=o_HIVincid_3549w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 4554";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence4554m__0 = "Option 0 (median) - Men";
label p50_incidence4554m__1 = "Option 1  (median) - Men";
label p50_incidence4554w__0 = "Option 0 (median) - Women";
label p50_incidence4554w__1 = "Option 1  (median) - Women";
series  x=cald y=p50_incidence4554m__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence4554m__0 	upper=p95_incidence4554m__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence4554m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence4554m__1 	upper=p95_incidence4554m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence4554w__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence4554w__0 	upper=p95_incidence4554w__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence4554w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence4554w__1 	upper=p95_incidence4554w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 5564";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence5564m__0 = "Option 0 (median) - Men";
label p50_incidence5564m__1 = "Option 1  (median) - Men";
label p50_incidence5564w__0 = "Option 0 (median) - Women";
label p50_incidence5564w__1 = "Option 1  (median) - Women";
series  x=cald y=p50_incidence5564m__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence5564m__0 	upper=p95_incidence5564m__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence5564m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence5564m__1 	upper=p95_incidence5564m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence5564w__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence5564w__0 	upper=p95_incidence5564w__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence5564w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence5564w__1 	upper=p95_incidence5564w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence2549m__0 = "Option 0 (median) - Men";
*label p50_incidence2549m__1 = "Option 1  (median) - Men";
label p50_incidence2549w__0 = "Option 0 (median) - Women";
*label p50_incidence2549w__1 = "Option 1  (median) - Women";

series  x=cald y=p50_incidence2549m__0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence2549m__0 	upper=p95_incidence2549m__0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2549m__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2549m__1 	upper=p95_incidence2549m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence2549w__0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence2549w__0 	upper=p95_incidence2549w__0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2549w__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2549w__1 	upper=p95_incidence2549w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_ep_0 = "Option 0 (median) ";
label p50_p_inf_ep_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_ep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_ep_1 	upper=p95_p_inf_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_newp_0 = "Option 0 (median) ";
label p50_p_inf_newp_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_newp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_newp_1 	upper=p95_p_inf_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prop infections coming from people VL suppressed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_vlsupp_0 = "Option 0 (median) ";
label p50_p_inf_vlsupp_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_vlsupp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_primary_0 = "Option 0 (median) ";
label p50_p_inf_primary_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_primary_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_naive_0 = "Option 0 (median) ";
label p50_p_inf_naive_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_naive_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_naive_1 	upper=p95_p_inf_naive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_diag_0 = "Option 0 (median) ";
label p50_p_inf_diag_1 = "Option 1  (median) ";
series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);
label p50_mtct_prop_0 = "Option 0 (median) ";
label p50_mtct_prop_1 = "Option 1  (median) ";
series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of men with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_m_0 = "Option 0 (median) - 15+";
label p50_p_diag_m_1 = "Option 1  (median) ";
label o_p_diag_m1549_dhs = "DHS - 15-49";
label o_p_diag_1564m_zimphia = "ZIMPHIA - 15-64";

series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_m1549_dhs / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_p_diag_1564m_zimphia / markerattrs = (symbol=square color=blue size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of women with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_w_0 = "Option 0 (median) _ 15+";
label p50_p_diag_w_1 = "Option 1  (median) ";
label o_p_diag_w1549_dhs = "DHS - 15-49";
label o_p_diag_1564w_zimphia = "ZIMPHIA - 15-64";

series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_w1549_dhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_diag_1564w_zimphia / markerattrs = (symbol=square color=red size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "Option 0 (median) ";
label p50_p_ai_no_arv_c_nnm_1 = "Option 1  (median) ";

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_ai_no_arv_c_nnm_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Option 0 (median) ";
label p50_p_artexp_diag_1 = "Option 1  (median) ";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_m_0 = "Option 0 (median) ";
label p50_p_onart_diag_m_1 = "Option 1  (median) ";
label o_p_onart_1564m_diag_zimphia = "ZIMPHIA";

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564m_diag_zimphia / markerattrs = (symbol=square color=blue size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_w_0 = "Option 0 (median) ";
label p50_p_onart_diag_w_1 = "Option 1  (median) ";
label o_p_onart_1564f_diag_zimphia = "ZIMPHIA";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564f_diag_zimphia / markerattrs = (symbol=square color=orange size = 10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_onart_0 = "Option 0 (median) - Both";
label p50_n_onart_1 = "Option 1  (median) ";
label p50_n_onart_m_0 = "Option 0 (median) - Men";
label p50_n_onart_w_0 = "Option 0 (median) - Women";
label o_s_all_onart_NAC = "CAL - NAC";
series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_efa_0 = "Option 0 (median) ";
label p50_p_efa_1 = "Option 1  (median) ";
series  x=cald y=p50_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_efa_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_efa_1 	upper=p95_p_efa_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_taz_0 = "Option 0 (median) ";
label p50_p_taz_1 = "Option 1  (median) ";
series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_taz_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_ten_0 = "Option 0 (median) ";
label p50_p_ten_1 = "Option 1  (median) ";
series  x=cald y=p50_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_ten_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_ten_1 	upper=p95_p_ten_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_zdv_0 = "Option 0 (median) ";
label p50_p_zdv_1 = "Option 1  (median) ";
series  x=cald y=p50_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_zdv_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_zdv_1 	upper=p95_p_zdv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_dol_0 = "Option 0 (median) ";
label p50_p_dol_1 = "Option 1  (median) ";
series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_dol_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_3TC_0 = "Option 0 (median) ";
label p50_p_3TC_1 = "Option 1  (median) ";
series  x=cald y=p50_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_3TC_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_3TC_1 	upper=p95_p_3TC_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_lpr_0 = "Option 0 (median) ";
label p50_p_lpr_1 = "Option 1  (median) ";
series  x=cald y=p50_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_lpr_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_lpr_1 	upper=p95_p_lpr_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_nev_0 = "Option 0 (median) ";
label p50_p_nev_1 = "Option 1  (median) ";
series  x=cald y=p50_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_nev_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_nev_1 	upper=p95_p_nev_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000__0 = "Option 0 (median) ";
label p50_p_onart_vl1000__1 = "Option 1  (median) ";
label o_p_vll1000_6mart_garcpr = "CAL - GARCPR";
series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_p_vll1000_6mart_garcpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_m_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_m_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_w_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_w_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vl1000__0 = "Option 0 (median) ";
label p50_p_vl1000__1 = "Option 1  (median) ";
label o_p_vlsupp_plhiv_1564_Zimphia = "ZIMPHIA";
series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_p_vlsupp_plhiv_1564_Zimphia / markerattrs = (symbol=square color=black size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vg1000__0 = "Option 0 (median) ";
label p50_p_vg1000__1 = "Option 1  (median) ";
series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_m_0 = "Option 0 (median) ";
label p50_p_onart_m_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_w_0 = "Option 0 (median) ";
label p50_p_onart_w_1 = "Option 1  (median) ";
series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_prevalence_vg1000__0 = "Option 0 (median) ";
label p50_prevalence_vg1000__1 = "Option 1  (median) ";
series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Rate of death ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate (per 100 person-years)'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_allage__0 = "Option 0 (median) - 15+ both";
label p50_rate_dead_allage__1 = "Option 1  (median) ";
label p50_rate_dead_allage_m_0 = "Option 0 (median) - 15+ Men";
label p50_rate_dead_allage_w_0 = "Option 0 (median) - 15+ Women";
label o_r_death_cens = "CAL - Census - All ages both ";
label o_r_death_m_dhs = "CAL - DHS - All ages Men";
label o_r_death_w_dhs = "CAL - DHS - All ages Women";
label o_r_death_15plm_cens = "CAL - Census - 15+ Men";
label o_r_death_15plw_cens = "CAL - Census - 15+ Women";
series  x=cald y=p50_rate_dead_allage_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_rate_dead_allage_0 	upper=p95_rate_dead_allage_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_allage_m_0 	upper=p95_rate_dead_allage_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_allage_w_0 	upper=p95_rate_dead_allage_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_r_death_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_r_death_m_dhs / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_r_death_w_dhs / markerattrs = (symbol=square color=red size = 10);
scatter x=cald y=o_r_death_15plm_cens / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_r_death_15plw_cens / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_death_2059_w_0 = "Option 0 (median) - Women 20-59";
label p50_n_death_hiv_w_0 = "Option 0  (median) - women with HIV";
series  x=cald y=p50_n_death_2059_w_0/	lineattrs = (color=ORANGE thickness = 2);
band    x=cald lower=p5_n_death_2059_w_0 	upper=p95_n_death_2059_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_death_2059_w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_death_2059_w_1 	upper=p95_n_death_2059_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_hiv_w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_death_hiv_w_0 	upper=p95_n_death_hiv_w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_w_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_death_2059_m_0 = "Option 0 (median) - Men 20-59";
label p50_n_death_HIV_m_0 = "Option 1  (median) - Men with HIV";
series  x=cald y=p50_n_death_2059_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_death_2059_m_0 	upper=p95_n_death_2059_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_death_2059_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_death_2059_m_1 	upper=p95_n_death_2059_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_hiv_m_0/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_death_hiv_m_0 	upper=p95_n_death_hiv_m_0  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 15-24";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_1524m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_1524w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_1524m_0 	upper=p95_rate_dead_hivneg_1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_1524w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_1524w_0 	upper=p95_rate_dead_hivneg_1524w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 25-34";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_2534m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_2534w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_2534m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_2534m_0 	upper=p95_rate_dead_hivneg_2534m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_2534w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_2534w_0 	upper=p95_rate_dead_hivneg_2534w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 35-44";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_3544m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_3544w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_3544m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_3544m_0 	upper=p95_rate_dead_hivneg_3544m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_3544w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_3544w_0 	upper=p95_rate_dead_hivneg_3544w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 45-54";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_4554m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_4554w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_4554m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_4554m_0 	upper=p95_rate_dead_hivneg_4554m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_4554w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_4554w_0 	upper=p95_rate_dead_hivneg_4554w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 55-64";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_5564m_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_5564w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_5564m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_5564m_0 	upper=p95_rate_dead_hivneg_5564m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_5564w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_5564w_0 	upper=p95_rate_dead_hivneg_5564w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Death rate among HIV-negative aged 65+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_hivneg_65plm_0 = "Option 0 (median) - Men";
label p50_rate_dead_hivneg_65plw_0 = "Option 0 (median) - Women";
series  x=cald y=p50_rate_dead_hivneg_65plm_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_65plm_0 	upper=p95_rate_dead_hivneg_65plm_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_hivneg_65plw_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_hivneg_65plw_0 	upper=p95_rate_dead_hivneg_65plw_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);
label p50_n_cd4_lt200__0 = "Option 0 (median) ";
series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_hiv_0 = "Option 0 (median) ";
series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv in men and women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_hiv_m_0 = "Option 0 (median) - Men";
label p50_n_hiv_w_0 = "Option 0 (median) - Women";
series  x=cald y=p50_n_hiv_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_hiv_m_0 	upper=p95_n_hiv_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_hiv_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_hiv_w_0 	upper=p95_n_hiv_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);
label p50_n_alive_0 = "Option 0 (median) - 15+ ";
label p50_n_alive1549__0 = "Option 0 (median) - 15-49 ";
label o_pop_all_Zi_cens = "Census - All ages";
label o_pop_1549_Zi_cens = "Census - 15-49";
label o_pop_all_Zi_CIA = "CIA - All ages";
label o_pop_1565_Zi_CIA = "CIA - All 15-64";
series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive1549__0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive1549__0 	upper=p95_n_alive1549__0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_pop_all_Zi_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_pop_1549_Zi_cens / markerattrs = (symbol=square color=green size = 10);
scatter x=cald y=o_pop_all_Zi_CIA / markerattrs = (symbol=triangle color=grey size = 10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs = (symbol=triangle color=brown size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Population 15+ by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);
label p50_n_alive_m_0 = "Option 0 (median) - Males 15+ ";
label p50_n_alive_w_0 = "Option 0 (median) - Females 15+ ";
label o_pop_allm_Zi_cens = "Census - Males all ages";
label o_pop_allw_Zi_cens = "Census - Females all ages";
label o_pop_1549m_Zi_cens = "Census - Males 15-49";
label o_pop_1549w_Zi_cens = "Census - Females 15-49";
series  x=cald y=p50_n_alive_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_alive_m_0 	upper=p95_n_alive_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_alive_w_0 	upper=p95_n_alive_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
scatter x=cald y=o_pop_allm_Zi_cens / markerattrs = (symbol=square color=darkblue size = 10);
scatter x=cald y=o_pop_allw_Zi_cens / markerattrs = (symbol=square color=darkorange size = 10);
scatter x=cald y=o_pop_1549m_Zi_cens / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_pop_1549w_Zi_cens / markerattrs = (symbol=square color=lightorange size = 10);
run;quit;



proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
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
where cald=2016.25;*when ZIMPHIA data were collected;
keep

p5_prevalence1519w_0 	p5_prevalence1519m_0 p5_prevalence2024w_0 	p5_prevalence2024m_0 p5_prevalence2529w_0 	p5_prevalence2529m_0
p5_prevalence3034w_0 	p5_prevalence3034m_0 p5_prevalence3539w_0 	p5_prevalence3539m_0 p5_prevalence4044w_0 	p5_prevalence4044m_0 
p5_prevalence4549w_0 	p5_prevalence4549m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0
p5_prevalence5559w_0 	p5_prevalence5559m_0 p5_prevalence6064w_0 	p5_prevalence6064m_0 p5_prevalence6064w_0 
p50_prevalence1519w_0 	p50_prevalence1519m_0 p50_prevalence2024w_0 	p50_prevalence2024m_0 p50_prevalence2529w_0 	p50_prevalence2529m_0
p50_prevalence3034w_0 	p50_prevalence3034m_0 p50_prevalence3539w_0 	p50_prevalence3539m_0 p50_prevalence4044w_0 	p50_prevalence4044m_0 
p50_prevalence4549w_0 	p50_prevalence4549m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0
p50_prevalence5559w_0 	p50_prevalence5559m_0 p50_prevalence6064w_0 	p50_prevalence6064m_0 p50_prevalence6064w_0 
p95_prevalence1519w_0 	p95_prevalence1519m_0 p95_prevalence2024w_0 	p95_prevalence2024m_0 p95_prevalence2529w_0 	p95_prevalence2529m_0
p95_prevalence3034w_0 	p95_prevalence3034m_0 p95_prevalence3539w_0 	p95_prevalence3539m_0 p95_prevalence4044w_0 	p95_prevalence4044m_0 
p95_prevalence4549w_0 	p95_prevalence4549m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0
p95_prevalence5559w_0 	p95_prevalence5559m_0 p95_prevalence6064w_0 	p95_prevalence6064m_0 p95_prevalence6056w_0 

;

data age15w ; set f;  ageg=15; sex=2; 	
p5_prevalence = p5_prevalence1519w_0 ;p50_prevalence = p50_prevalence1519w_0 ;p95_prevalence = p95_prevalence1519w_0 ; 
o_prev_Z_ess=0.039;
data age20w ; set f;  ageg=20; sex=2; 
p5_prevalence = p5_prevalence2024w_0 ; p50_prevalence = p50_prevalence2024w_0 ; p95_prevalence = p95_prevalence2024w_0 ; 
o_prev_Z_ess=0.081;
data age25w ; set f;  ageg=25; sex=2; 
p5_prevalence = p5_prevalence2529w_0 ;p50_prevalence = p50_prevalence2529w_0 ;p95_prevalence = p95_prevalence2529w_0 ;
o_prev_Z_ess=0.143;
data age30w ; set f;  ageg=30; sex=2; 
p5_prevalence = p5_prevalence3034w_0 ; p50_prevalence = p50_prevalence3034w_0 ; p95_prevalence = p95_prevalence3034w_0 ;
o_prev_Z_ess=0.22;
data age35w ; set f;  ageg=35; sex=2; 
p5_prevalence = p5_prevalence3539w_0 ; p50_prevalence = p50_prevalence3539w_0 ; p95_prevalence = p95_prevalence3539w_0 ;
o_prev_Z_ess=0.266;
data age40w ; set f;  ageg=40; sex=2; 
p5_prevalence = p5_prevalence4044w_0 ;p50_prevalence = p50_prevalence4044w_0 ;p95_prevalence = p95_prevalence4044w_0 ; 
o_prev_Z_ess=0.296;
data age45w ; set f;  ageg=45; sex=2; 
p5_prevalence = p5_prevalence4549w_0 ; p50_prevalence = p50_prevalence4549w_0 ; p95_prevalence = p95_prevalence4549w_0 ; 
o_prev_Z_ess=0.289;
data age50w ; set f;  ageg=50; sex=2; 
p5_prevalence = p5_prevalence5054w_0 ; p50_prevalence = p50_prevalence5054w_0 ; p95_prevalence = p95_prevalence5054w_0 ; 
o_prev_Z_ess=0.21;
data age55w ; set f;  ageg=55; sex=2; 
p5_prevalence = p5_prevalence5559w_0 ;p50_prevalence = p50_prevalence5559w_0 ;p95_prevalence = p95_prevalence5559w_0 ; 
o_prev_Z_ess=0.17;
data age60w ; set f;  ageg=60; sex=2; 
p5_prevalence = p5_prevalence6064w_0 ;p50_prevalence = p50_prevalence6064w_0 ;p95_prevalence = p95_prevalence6064w_0 ;

data age15m ; set f;  ageg=15; sex=1; p5_prevalence = p5_prevalence1519m_0 ; p50_prevalence = p50_prevalence1519m_0 ; 
p95_prevalence = p95_prevalence1519m_0 ; o_prev_Z_ess=0.032 ;
data age20m ; set f;  ageg=20; sex=1; p5_prevalence = p5_prevalence2024m_0 ; p50_prevalence = p50_prevalence2024m_0 ; 
p95_prevalence = p95_prevalence2024m_0 ; o_prev_Z_ess=0.027 ;
data age25m ; set f;  ageg=25; sex=1; p5_prevalence = p5_prevalence2529m_0 ; p50_prevalence = p50_prevalence2529m_0 ; 
p95_prevalence = p95_prevalence2529m_0 ; o_prev_Z_ess=0.066 ;
data age30m ; set f;  ageg=30; sex=1; p5_prevalence = p5_prevalence3034m_0 ;p50_prevalence = p50_prevalence3034m_0 ;
p95_prevalence = p95_prevalence3034m_0 ;o_prev_Z_ess=0.122 ;
data age35m ; set f;  ageg=35; sex=1; p5_prevalence = p5_prevalence3539m_0 ;p50_prevalence = p50_prevalence3539m_0 ;
p95_prevalence = p95_prevalence3539m_0 ;o_prev_Z_ess=0.194 ;
data age40m ; set f;  ageg=40; sex=1; p5_prevalence = p5_prevalence4044m_0 ;p50_prevalence = p50_prevalence4044m_0 ;
p95_prevalence = p95_prevalence4044m_0 ;o_prev_Z_ess=0.254 ;
data age45m ; set f;  ageg=45; sex=1; p5_prevalence = p5_prevalence4549m_0 ;p50_prevalence = p50_prevalence4549m_0 ;
p95_prevalence = p95_prevalence4549m_0 ;o_prev_Z_ess=0.281 ;
data age50m ; set f;  ageg=50; sex=1; p5_prevalence = p5_prevalence5054m_0 ; p50_prevalence = p50_prevalence5054m_0 ;
 p95_prevalence = p95_prevalence5054m_0 ;o_prev_Z_ess=0.28 ;
data age55m ; set f;  ageg=55; sex=1; p5_prevalence = p5_prevalence5559m_0 ;p50_prevalence = p50_prevalence5559m_0 ;
p95_prevalence = p95_prevalence5559m_0 ;o_prev_Z_ess=0.244 ;
data age60m ; set f;  ageg=60; sex=1; p5_prevalence = p5_prevalence6064m_0 ;p50_prevalence = p50_prevalence6064m_0 ;
p95_prevalence = p95_prevalence6064m_0 ;

data all; set 
 age15w age20w age25w age30w age35w age40w age45w age50w age55w age60w
 age15m age20m age25m age30m age35m age40m age45m age50m age55m age60m
; 

drop
p5_prevalence1519w_0 	p5_prevalence1519m_0 p5_prevalence2024w_0 	p5_prevalence2024m_0 p5_prevalence2529w_0 	p5_prevalence2529m_0
p5_prevalence3034w_0 	p5_prevalence3034m_0 p5_prevalence3539w_0 	p5_prevalence3539m_0 p5_prevalence4044w_0 	p5_prevalence4044m_0 
p5_prevalence4549w_0 	p5_prevalence4549m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0 p5_prevalence5054w_0 	p5_prevalence5054m_0
p5_prevalence5559w_0 	p5_prevalence5559m_0 p5_prevalence6064m_0 p5_prevalence6064w_0 p5_prevalence6064_0 
p50_prevalence1519w_0 	p50_prevalence1519m_0 p50_prevalence2024w_0 	p50_prevalence2024m_0 p50_prevalence2529w_0 	p50_prevalence2529m_0
p50_prevalence3034w_0 	p50_prevalence3034m_0 p50_prevalence3539w_0 	p50_prevalence3539m_0 p50_prevalence4044w_0 	p50_prevalence4044m_0 
p50_prevalence4549w_0 	p50_prevalence4549m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0 p50_prevalence5054w_0 	p50_prevalence5054m_0
p50_prevalence5559w_0 	p50_prevalence5559m_0 p50_prevalence6064w_0 p50_prevalence6064m_0 p50_prevalence6064_0 
p95_prevalence1519w_0 	p95_prevalence1519m_0 p95_prevalence2024w_0 	p95_prevalence2024m_0 p95_prevalence2529w_0 	p95_prevalence2529m_0
p95_prevalence3034w_0 	p95_prevalence3034m_0 p95_prevalence3539w_0 	p95_prevalence3539m_0 p95_prevalence4044w_0 	p95_prevalence4044m_0 
p95_prevalence4549w_0 	p95_prevalence4549m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0 p95_prevalence5054w_0 	p95_prevalence5054m_0
p95_prevalence5559w_0 	p95_prevalence5559m_0 p95_prevalence6064m_0 p95_prevalence6064w_0 p95_prevalence6064_0 
;



proc sgplot data=all; Title 'Prevalence by age in 2016 - women'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 60 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 0.7 by 0.1) valueattrs=(size=10);
label p50_prevalence = "Option 0 (median) ";
label o_prev_Z_ess = "ZIMPHIA 2016";
series  x=ageg y=p50_prevalence/	lineattrs = (color=orange thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
scatter x=ageg y=o_prev_Z_ess / markerattrs = (color=ORANGE);
where sex=2;
run;



proc sgplot data=all; Title 'prevalence by age in 2016- men'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 60 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 0.7 by 0.1) valueattrs=(size=10);
label p50_prevalence = "Option 0 (median) ";
label o_prev_Z_ess = "ZIMPHIA 2016";
series  x=ageg y=p50_prevalence/	lineattrs = (color=blue thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
scatter x=ageg y=o_prev_Z_ess / markerattrs = (color=blue);
where sex=1;
run;

quit;


ods rtf close;
run;




/************************************************************************************************************/
/*										SELECTION MIHPSA													*/
/************************************************************************************************************/
ods rtf file="C:\Users\ValentinaCambiano\TLO_HMC Dropbox\Valentina Cambiano\hiv synthesis ssa unified program\output files\zimbabwe\graphsMIHPSA_20220131.rtf";

* 1a - HIV PREVALENCE 15-49 BY GENDER;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
label p50_prevalence1549m_1 = "Men Option 1 (median) ";
label p50_prevalence1549w_0 = "Women Option 0 (median) ";
label p50_prevalence1549w_1 = "Women Option 1 (median) ";
label o_prev1549_Z_ess = "CAL - ZIMPHIA or DHS";
label o_prev1549m_Z_ess = "CAL - ZIMPHIA or DHS - men";
label o_prev1549w_Z_ess = "CAL - ZIMPHIA or DHS - women";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
*band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
*band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";

*MIHPSA essential;
scatter x=cald y=o_prev1549_Z_ess  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=black) errorbarattrs = (color = black) ;
scatter x=cald y=o_prev1549m_Z_ess /  yerrorlower=o_prev1549m_ll_Z_ess yerrorupper=o_prev1549m_ul_Z_ess markerattrs = (color=blue) errorbarattrs = (color = blue) ;
scatter x=cald y=o_prev1549w_Z_ess /  yerrorlower=o_prev1549w_ll_Z_ess yerrorupper=o_prev1549w_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange) ;
run;quit;


* 2a - NUMBER OF ADULTS ON ART;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);
label p50_n_onart_0 = "Option 0 (median) - Both";
label p50_n_onart_1 = "Option 1  (median) ";
label p50_n_onart_m_0 = "Option 0 (median) - Men";
label p50_n_onart_w_0 = "Option 0 (median) - Women";
label o_s_all_onart_NAC = "CAL - NAC";

series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;


* 2b - % VL<1000 among ADULTS ON ART;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "Option 0 (median) ";
label p50_p_onart_vl1000__1 = "Option 1  (median) ";
label o_p_vll1000_6mart_garcpr = "CAL - GARCPR";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_p_vll1000_6mart_garcpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


* 3 - HIV PREVALENCE IN ANTENATAL CLIENTS;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Option 0 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";

series  x=cald y=p50_prevalence_hiv_preg_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_prev1549w_Z_anc  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange);
run;quit;

* 4a - % EVER CIRCUMCISED;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised (Data 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Option 0 (median) - 15-49";
label p50_p_mcirc_1549m_1 = "Option 1 (median) ";
label p50_p_mcirc_0 = "Option 0 (median) - 15+?";
label o_p_circ_15pl_DHIS2_z= "CAL - DHIS2 men 15+";
series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_circ_15pl_DHIS2_z /	markerattrs = (color=blue);
run;quit;


* 4b - ANNUAL NUMBER OF NEW CIRCUMCISIONS;
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual # new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000 by 100000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Annual number of new circumcisions 10-49";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_new_mcirc/	markerattrs = (color=blue ) ;
run;quit;


* 5a - NUMBER OF TESTS;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  5000000 by 100000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
run;quit;

* 5b - POSITIVITY RATE;
*test_prop_positive;
proc sgplot data=d; 
Title    height=1.5 justify=center "Positivity rate";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_test_prop_positive_0 = "Option 0 (median) ";
label p50_test_prop_positive_1 = "Option 1 (median) ";
label o_pos_rate_15ov_z = "CAL - Public sector";
series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_pos_rate_15ov_z/	markerattrs = (color=black ) ;
run;quit;

* 7 - DEATH RATE;

proc sgplot data=d; 
Title    height=1.5 justify=center "Rate of death ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate (per 100 person-years)'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_allage__0 = "Option 0 (median) - 15+ both";
label p50_rate_dead_allage__1 = "Option 1  (median) ";
label p50_rate_dead_allage_m_0 = "Option 0 (median) - 15+ Men";
label p50_rate_dead_allage_w_0 = "Option 0 (median) - 15+ Women";
label o_r_death_cens = "CAL - Census - All ages both ";
label o_r_death_m_dhs = "CAL - DHS - All ages Men";
label o_r_death_w_dhs = "CAL - DHS - All ages Women";
label o_r_death_15plm_cens = "CAL - Census - 15+ Men";
label o_r_death_15plw_cens = "CAL - Census - 15+ Women";
series  x=cald y=p50_rate_dead_allage_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_rate_dead_allage_0 	upper=p95_rate_dead_allage_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_rate_dead_allage_m_0 	upper=p95_rate_dead_allage_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_rate_dead_allage_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_rate_dead_allage_w_0 	upper=p95_rate_dead_allage_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

*MIHPSA optional;
scatter x=cald y=o_r_death_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_r_death_m_dhs / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_r_death_w_dhs / markerattrs = (symbol=square color=red size = 10);
scatter x=cald y=o_r_death_15plm_cens / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_r_death_15plw_cens / markerattrs = (symbol=square color=orange size = 10);
run;quit;

ods rtf close; run;
/*
data a.d;set d;run;*/
data d;set a.d;run;
*20220201: partire da qua;
data e;set d;
where cald in 
(1990.5 1991.5 1992.5 1993.5 1994.5 1995.5 1996.5 1997.5 1998.5 1999.5 
2000.5 2001.5 2002.5 2003.5 2004.5 2005.5 2006.5 2007.5 2008.5 2009.5 
2010.5 2011.5 2012.5 2013.5 2014.5 2015.5 2016.5 2017.5 2018.5 2019.5 
2020.5 2021.5 2022.5 2023.5 2024.5 2025.5 2026.5 2027.5 2028.5 2029.5 
2030.5 2031.5 2032.5 2033.5 2034.5 2035.5 2036.5 2037.5 2038.5 2039.5 
2040.5);
rename p50_prevalence1549m_0 = p50_prev1549m_0 ;
rename p5_prevalence1549m_0  = p05_prev1549m_0;
rename p95_prevalence1549m_0 = p95_prev1549m_0;
rename p50_prevalence1549w_0 = p50_prev1549w_0 ;
rename p5_prevalence1549w_0  = p05_prev1549w_0;
rename p95_prevalence1549w_0 = p95_prev1549w_0;
rename p50_prevalence1549__0 = p50_prev1549__0 ;
rename p5_prevalence1549__0  = p05_prev1549__0;
rename p95_prevalence1549__0 = p95_prev1549__0;
rename p50_prevalence1524m_0 = p50_prev1524m_0 ;
rename p5_prevalence1524m_0  = p05_prev1524m_0;
rename p95_prevalence1524m_0 = p95_prev1524m_0;
rename p50_prevalence1524w_0 = p50_prev1524w_0 ;
rename p5_prevalence1524w_0  = p05_prev1524w_0;
rename p95_prevalence1524w_0 = p95_prev1524w_0;
rename p50_prevalence2549m_0 = p50_prev2549m_0 ;
rename p5_prevalence2549m_0  = p05_prev2549m_0;
rename p95_prevalence2549m_0 = p95_prev2549m_0;
rename p50_prevalence2549w_0 = p50_prev2549w_0 ;
rename p5_prevalence2549w_0  = p05_prev2549w_0;
rename p95_prevalence2549w_0 = p95_prev2549w_0;
rename p50_prevalence_hiv_preg_0 = p50_prev_preg_0;
rename p5_prevalence_hiv_preg_0  = p05_prev_preg_0;
rename p95_prevalence_hiv_preg_0 = p95_prev_preg_0;
rename p5_prop_sw_hiv_0 = p05_prop_sw_hiv_0;
rename p5_p_onart_m_0 = p05_p_onart_m_0;
rename p5_p_onart_w_0 = p05_p_onart_w_0;
rename p5_n_onart_m_0 = p05_n_onart_m_0;
rename p5_n_onart_w_0 = p05_n_onart_w_0;
rename p5_p_mcirc_1549m_0 = p05_p_mcirc_1549m_0;
rename p5_p_diag_m_0 = p05_p_diag_m_0;
rename p5_p_diag_w_0 = p05_p_diag_w_0;
rename p5_p_onart_vl1000__0 = p05_p_onart_vl1000__0;

rename p5_n_alive_0 = p05_n_alive_0;
rename p5_n_alive_m_0 = p05_n_alive_m_0;
rename p5_n_alive_w_0 = p05_n_alive_w_0;
rename p5_n_alive1549__0 = p05_n_alive1549__0;
rename p50_p_onart_diag_m_0 = p50_p_artdiagm_0;
rename p5_p_onart_diag_m_0  = p05_p_artdiagm_0;
rename p95_p_onart_diag_m_0 = p95_p_artdiagm_0;
rename p50_p_onart_diag_w_0 = p50_p_artdiagw_0;
rename p5_p_onart_diag_w_0  = p05_p_artdiagw_0;
rename p95_p_onart_diag_w_0 = p95_p_artdiagw_0;

rename p5_n_hiv_m_0 = p05_n_hiv_m_0;
rename p5_n_hiv_w_0 = p05_n_hiv_w_0;

keep cald
p50_prevalence1549m_0 p5_prevalence1549m_0 	p95_prevalence1549m_0
p50_prevalence1549w_0 p5_prevalence1549w_0 	p95_prevalence1549w_0
p50_prevalence1549__0 p5_prevalence1549__0 	p95_prevalence1549__0
p50_prevalence1524m_0 p5_prevalence1524m_0 	p95_prevalence1524m_0
p50_prevalence1524w_0 p5_prevalence1524w_0 	p95_prevalence1524w_0
p50_prevalence2549m_0 p5_prevalence2549m_0 	p95_prevalence2549m_0
p50_prevalence2549w_0 p5_prevalence2549w_0 	p95_prevalence2549w_0
p50_prevalence_hiv_preg_0 	p5_prevalence_hiv_preg_0 	p95_prevalence_hiv_preg_0 
p50_prop_sw_hiv_0			p5_prop_sw_hiv_0			p95_prop_sw_hiv_0
p50_p_onart_m_0 	p5_p_onart_m_0 	p95_p_onart_m_0  
p50_p_onart_w_0 	p5_p_onart_w_0 	p95_p_onart_w_0  

p50_n_onart_m_0 	p5_n_onart_m_0 	p95_n_onart_m_0  
p50_n_onart_w_0 	p5_n_onart_w_0 	p95_n_onart_w_0  

p50_p_mcirc_1549m_0 	p5_p_mcirc_1549m_0 	p95_p_mcirc_1549m_0  

p50_p_diag_m_0 	p5_p_diag_m_0 	p95_p_diag_m_0  
p50_p_diag_w_0 	p5_p_diag_w_0 	p95_p_diag_w_0  

p50_p_onart_vl1000__0 	p5_p_onart_vl1000__0 	p95_p_onart_vl1000__0  

p50_n_alive_0			p5_n_alive_0			p95_n_alive_0
p50_n_alive1549__0		p5_n_alive1549__0		p95_n_alive1549__0
p50_n_alive_m_0			p5_n_alive_m_0			p95_n_alive_m_0
p50_n_alive_w_0			p5_n_alive_w_0			p95_n_alive_w_0

p50_p_onart_diag_m_0 	p5_p_onart_diag_m_0		p95_p_onart_diag_m_0 
p50_p_onart_diag_w_0 	p5_p_onart_diag_w_0 	p95_p_onart_diag_w_0

p50_n_hiv_m_0			p5_n_hiv_m_0			p95_n_hiv_m_0
p50_n_hiv_w_0			p5_n_hiv_w_0			p95_n_hiv_w_0


;
run;
proc transpose data=e out=mihpsa_zim_stock_20220131;run;
data mihpsa_zim_stock_20220131;set mihpsa_zim_stock_20220131;
sub = substr(_NAME_,1,3);
var = substr(_NAME_,5,10);
if sub="p50" then ord=1;
if sub="p05" then ord=2;
if sub="p95" then ord=3;
if var="prev1549m_" then var_n=1;
if var="prev1549w_" then var_n=2;
if var="prev1549__" then var_n=3;
if var="prev_preg_" then var_n=4;
if var="p_onart_m_" then var_n=5;
if var="p_onart_w_" then var_n=6;
if var="n_onart_m_" then var_n=7;
if var="n_onart_w_" then var_n=8;
if var="p_mcirc_15" then var_n=9;
if var="p_diag_m_0" then var_n=10;
if var="p_diag_w_0" then var_n=11;
if var="p_onart_vl" then var_n=12;
if var="n_alive_0"  then var_n=13;
if var="n_alive154" then var_n=14;
if var="n_alive_m_" then var_n=15;
if var="n_alive_w_" then var_n=16;
if var="p_artdiagm" then var_n=17;
if var="p_artdiagw" then var_n=18;
if var="n_hiv_m_0"  then var_n=19;
if var="n_hiv_w_0"  then var_n=20;
if var="prev1524m_" then var_n=21;
if var="prev1524w_" then var_n=22;
if var="prev2549m_" then var_n=23;
if var="prev2549w_" then var_n=24;
if var="prop_sw_hi" then var_n=25;

run;
proc sort; by var_n ord;run;
proc print;run;

proc contents data=d;run;
*FLOW;
data f;set d;
*note that 1991 would refer to the period 1990.5-1991.5;
where cald in 
(1991 1992 1993 1994 1995 1996 1997 1998 1999 
2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 
2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 
2020 2021 2022 2023 2024 2025 2026 2027 2028 2029 
2030 2031 2032 2033 2034 2035 2036 2037 2038 2039 
2040 2041);


rename p5_incidence1549m_0 = p05_incidence1549m_0;
rename p5_incidence1549w_0 = p05_incidence1549w_0;
rename p5_incidence1549__0 = p05_incidence1549__0;
rename p5_incidence1524m__0 = p05_incidence1524m__0;
rename p5_incidence1524w__0 = p05_incidence1524w__0;
rename p5_incidence2549m__0 = p05_incidence2549m__0;
rename p5_incidence2549w__0 = p05_incidence2549w__0;
rename p5_n_new_inf1549m_0 = p05_n_new_inf1549m_0;
rename p5_n_new_inf1549w_0 = p05_n_new_inf1549w_0;
rename p5_n_new_inf1549__0 = p05_n_new_inf1549__0;
rename p5_n_new_inf1524m_0 = p05_n_new_inf1524m_0;
rename p5_n_new_inf1524w_0 = p05_n_new_inf1524w_0;
rename p5_n_new_inf2549m_0 = p05_n_new_inf2549m_0;
rename p5_n_new_inf2549w_0 = p05_n_new_inf2549w_0;
rename p5_n_death_hivrel_m_0 = p05_n_death_hivrel_m_0;
rename p5_n_death_hivrel_w_0 = p05_n_death_hivrel_w_0;
rename p5_n_death_2059_m_0 = p05_n_death_2059_m_0;
rename p5_n_death_2059_w_0 = p05_n_death_2059_w_0;
rename p5_n_tested_m_0 = p05_n_tested_m_0;
rename p5_n_tested_0 = p05_n_tested_0;
rename p5_test_prop_positive_0 = p05_test_prop_positive_0;
rename p5_n_new_vmmc1549m_0 = p05_n_new_vmmc1549m_0;
keep cald
p50_incidence1549m_0 p5_incidence1549m_0 p95_incidence1549m_0
p50_incidence1549w_0 p5_incidence1549w_0 p95_incidence1549w_0
p50_incidence1524m__0 p5_incidence1524m__0 p95_incidence1524m__0
p50_incidence1524w__0 p5_incidence1524w__0 p95_incidence1524w__0
p50_incidence2549m__0 p5_incidence2549m__0 p95_incidence2549m__0
p50_incidence2549w__0 p5_incidence2549w__0 p95_incidence2549w__0
p50_incidence1549__0 p5_incidence1549__0 p95_incidence1549__0
p50_n_new_inf1549m_0 p5_n_new_inf1549m_0 p95_n_new_inf1549m_0
p50_n_new_inf1549w_0 p5_n_new_inf1549w_0 p95_n_new_inf1549w_0
p50_n_new_inf1549__0 p5_n_new_inf1549__0 p95_n_new_inf1549__0
p50_n_new_inf1524m_0 p5_n_new_inf1524m_0 p95_n_new_inf1524m_0
p50_n_new_inf1524w_0 p5_n_new_inf1524w_0 p95_n_new_inf1524w_0
p50_n_new_inf2549m_0 p5_n_new_inf2549m_0 p95_n_new_inf2549m_0
p50_n_new_inf2549w_0 p5_n_new_inf2549w_0 p95_n_new_inf2549w_0

p50_n_death_hivrel_m_0 p5_n_death_hivrel_m_0 p95_n_death_hivrel_m_0
p50_n_death_hivrel_w_0 p5_n_death_hivrel_w_0 p95_n_death_hivrel_w_0
p50_n_death_2059_m_0   p5_n_death_2059_m_0 	 p95_n_death_2059_m_0
p50_n_death_2059_w_0   p5_n_death_2059_w_0 	 p95_n_death_2059_w_0

p50_n_tested_m_0 			p5_n_tested_m_0 		p95_n_tested_m_0
p50_n_tested_0 			p5_n_tested_0 		p95_n_tested_0

p50_test_prop_positive_0	p5_test_prop_positive_0 	p95_test_prop_positive_0
p50_n_new_vmmc1549m_0		p5_n_new_vmmc1549m_0		p95_n_new_vmmc1549m_0;
run;
proc transpose data=f out=mihpsa_zim_flow_20220131;run;
data mihpsa_zim_flow_20220131;set mihpsa_zim_flow_20220131;
sub = substr(_NAME_,1,3);
var = substr(_NAME_,5,16);
if sub="p50" then ord=1;
if sub="p05" then ord=2;
if sub="p95" then ord=3;
if var="incidence1549m_0" then var_n=1;
if var="incidence1549w_0" then var_n=2;
if var="incidence1549__0" then var_n=3;
if var="n_new_inf1549m_0" then var_n=4;
if var="n_new_inf1549w_0" then var_n=5;
if var="n_new_inf1549__0" then var_n=6;
if var="n_death_hivrel_m" then var_n=7;
if var="n_death_hivrel_w" then var_n=8;
if var="n_death_2059_m_0" then var_n=9;
if var="n_death_2059_w_0" then var_n=10;
if var="n_tested_m_0" then var_n=11;
if var="n_tested_0" then var_n=12;
if var="test_prop_positi" then var_n=13;
if var="n_new_vmmc1549m_" then var_n=14;

if var="incidence1524m__" then var_n=15;
if var="incidence1524w__" then var_n=16;
if var="incidence2549m__" then var_n=17;
if var="incidence2549w__" then var_n=18;
if var="n_new_inf1524m_0" then var_n=19;
if var="n_new_inf1524w_0" then var_n=20;
if var="n_new_inf2549m_0" then var_n=21;
if var="n_new_inf2549w_0" then var_n=22;
run;
proc sort; by var_n ord;run;
proc print;run;


*DEATH RATE IN PEOPLE WITHOUT HIV;
data g;set d;
*note that 1991 would refer to the period 1990.5-1991.5;
where cald in 
(1990 2000 2010 2020 2030 2040 );
rename p5_rate_dead_hivneg_1524m_0 = p05_rate_dead_hivneg_1524m_0;
rename p5_rate_dead_hivneg_2534m_0 = p05_rate_dead_hivneg_2534m_0;
rename p5_rate_dead_hivneg_3544m_0 = p05_rate_dead_hivneg_3544m_0;
rename p5_rate_dead_hivneg_4554m_0 = p05_rate_dead_hivneg_4554m_0;
rename p5_rate_dead_hivneg_5564m_0 = p05_rate_dead_hivneg_5564m_0;
rename p5_rate_dead_hivneg_65plm_0 = p05_rate_dead_hivneg_65plm_0;
rename p5_rate_dead_hivneg_1524w_0 = p05_rate_dead_hivneg_1524w_0;
rename p5_rate_dead_hivneg_2534w_0 = p05_rate_dead_hivneg_2534w_0;
rename p5_rate_dead_hivneg_3544w_0 = p05_rate_dead_hivneg_3544w_0;
rename p5_rate_dead_hivneg_4554w_0 = p05_rate_dead_hivneg_4554w_0;
rename p5_rate_dead_hivneg_5564w_0 = p05_rate_dead_hivneg_5564w_0;
rename p5_rate_dead_hivneg_65plw_0 = p05_rate_dead_hivneg_65plw_0;

keep cald

p50_rate_dead_hivneg_1524m_0  p5_rate_dead_hivneg_1524m_0  p95_rate_dead_hivneg_1524m_0  
p50_rate_dead_hivneg_2534m_0  p5_rate_dead_hivneg_2534m_0  p95_rate_dead_hivneg_2534m_0  
p50_rate_dead_hivneg_3544m_0  p5_rate_dead_hivneg_3544m_0  p95_rate_dead_hivneg_3544m_0  
p50_rate_dead_hivneg_4554m_0  p5_rate_dead_hivneg_4554m_0  p95_rate_dead_hivneg_4554m_0  
p50_rate_dead_hivneg_5564m_0  p5_rate_dead_hivneg_5564m_0  p95_rate_dead_hivneg_5564m_0  
p50_rate_dead_hivneg_65plm_0  p5_rate_dead_hivneg_65plm_0  p95_rate_dead_hivneg_65plm_0 
p50_rate_dead_hivneg_1524w_0  p5_rate_dead_hivneg_1524w_0  p95_rate_dead_hivneg_1524w_0  
p50_rate_dead_hivneg_2534w_0  p5_rate_dead_hivneg_2534w_0  p95_rate_dead_hivneg_2534w_0  
p50_rate_dead_hivneg_3544w_0  p5_rate_dead_hivneg_3544w_0  p95_rate_dead_hivneg_3544w_0  
p50_rate_dead_hivneg_4554w_0  p5_rate_dead_hivneg_4554w_0  p95_rate_dead_hivneg_4554w_0  
p50_rate_dead_hivneg_5564w_0  p5_rate_dead_hivneg_5564w_0  p95_rate_dead_hivneg_5564w_0  
p50_rate_dead_hivneg_65plw_0  p5_rate_dead_hivneg_65plw_0  p95_rate_dead_hivneg_65plw_0 ;

run;

proc transpose data=g out=mihpsa_zim_deathrhivneg_20220131;run;
data mihpsa_zim_deathrhivneg_20220131;set mihpsa_zim_deathrhivneg_20220131;
sub = substr(_NAME_,1,3);
varagegend = substr(_NAME_,22,5);
if sub="p50" then ord=1;
if sub="p05" then ord=2;
if sub="p95" then ord=3;
if varagegend="1524m" then varagegend_n=1;
if varagegend="2534m" then varagegend_n=2;
if varagegend="3544m" then varagegend_n=3;
if varagegend="4554m" then varagegend_n=4;
if varagegend="5564m" then varagegend_n=5;
if varagegend="65plm" then varagegend_n=6;
if varagegend="1524w" then varagegend_n=7;
if varagegend="2534w" then varagegend_n=8;
if varagegend="3544w" then varagegend_n=9;
if varagegend="4554w" then varagegend_n=10;
if varagegend="5564w" then varagegend_n=11;
if varagegend="65plw" then varagegend_n=12;
run;

proc sort; by varagegend_n ord;run;
proc print;run;
