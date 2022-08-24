
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;


libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\uganda\";

  proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";

data b;
  set a.l_base_uganda    ;


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

proc sort; by cald run ;run;
data b;set b;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 57    ;
%let year_end = 2022.00 ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m	 		
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence_vg1000_   
incidence1549m incidence1549w  n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart_m n_onart_w n_death_2059_m n_death_2059_w  n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed n_hiv
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
if option =0 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m	 		
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence_vg1000_   
incidence1549m incidence1549w  n_tested n_tested_m
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w 
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart_m n_onart_w  n_death_2059_m n_death_2059_w  n_death_hiv_m n_death_hiv_w  n_cd4_lt200_
prevalence1519w 	prevalence1519m prevalence2024w 	prevalence2024m prevalence2529w 	prevalence2529m
prevalence3034w 	prevalence3034m prevalence3539w 	prevalence3539m prevalence4044w 	prevalence4044m 
prevalence4549w 	prevalence4549m prevalence5054w 	prevalence5054m prevalence5054w 	prevalence5054m
prevalence5559w 	prevalence5559m prevalence6064w 	prevalence6064m prevalence65plw 	prevalence65plm
n_alive n_diagnosed n_hiv
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
g79  g80  g81  g82  g83  g84  g85  g86  g87  g88  g89  g90  g91  g92  g93 /*  g94  g95  g96  g97  g98  g99  g100    g101 g102 
g103 g104
g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116 g117 g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 */

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52 h53   h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72  h73  h74  h75
h77  h78 h79  h80  h81  h82  h83  h84  h85  h86  h87  h88  h89  h90  h91  h92  h93 
;
by cald;


/*


Number of HIV tests done per year in adults (women, men, all adults)


* dhs ; 
ever_tested age 15-49  
2011
men 15-24 35%  25-29: 66%  30-39: 66%  40-49: 60%
women 15-24 61%  25-29: 86%  30-39: 79%  40-49: 70%
2016
men 15-24 57%  25-29: 83%  30-39: 82%  40-49: 78%
women 15-24 71%  25-29: 95%  30-39: 92%  40-49: 90%


Number of new diagnoses per year in adults  


Number of adults on art  
Aim file
Men
05: 38000   10: 97000    15: 217000    20: 375000
Women
05: 45000   10: 118000   15: 436000   20: 697000


* spectrum aim;
Prevalence 15-49   
Men           75: 0.0   80: 0.7  85: 5.0  90: 8.1  95: 7.3  00: 6.0  05: 50.0.2  10:5.1  15:4.6   20:3.9   (UPHIA 2016: 4.7   2020: 3.8))
Women     75: 0.0   80: 0.7  85: 6.2  90: 11.0 95: 10.6  00: 9.1  05: 7.9  10:7.4  15: 7.3  20:  6.8    (UPHIA 2016: 7.6   2020: 7.1)  



Incidence 15-49  
UPHIA 
2016
Men           15-49:   0.31
Women     15-49:  0.47
2020
Men            15-49:  0.21
Women:    15-49: 0.42


Proportion HIV+ diagnosed  
2016
Men    67.3%    women 75.4%    all 72.5%
2020
Men  76.1%   Women  83.5%   all  80.9%


Proportion hiv+ diagnosed on art   Men  Women
2016
Men  86.9%   women 92.1%   all 90.4%
2020
Men  94.7%   women  96.7%    all 96.1%

Proportion adults on ART with VL < 1000  Men Women
2016
Men 81.5%  women 84.7%   all 83.7%

2020
Men 91.3    women  92.6    all 92.2


Of adults on art, proportion on efavirenz, dolutegravir, boosted PI – men women

*/

* placeholder;
if cald=2019.00 then do; n_tests_f_obs_uga = 0 ; n_tests_m_obs_uga = 0 ;  end;

if cald=2011 then do;
	ever_tested_w_1524_obs_uga= 0.61;
	ever_tested_w_2529_obs_uga= 0.86;
	ever_tested_w_3039_obs_uga= 0.79;
	ever_tested_w_4049_obs_uga= 0.70;

	ever_tested_m_1524_obs_uga= 0.35;
	ever_tested_m_2529_obs_uga= 0.66;
	ever_tested_m_3039_obs_uga= 0.66;
	ever_tested_m_4049_obs_uga= 0.60;
end;

if cald=2016 then do;
	ever_tested_w_1524_obs_uga= 0.71;
	ever_tested_w_2529_obs_uga= 0.95;
	ever_tested_w_3039_obs_uga= 0.92;
	ever_tested_w_4049_obs_uga= 0.90;

	ever_tested_m_1524_obs_uga= 0.57;
	ever_tested_m_2529_obs_uga= 0.83;
	ever_tested_m_3039_obs_uga= 0.82;
	ever_tested_m_4049_obs_uga= 0.78;
end;

if cald=2005.00 then n_onart_m_obs_uga= 38000 ;
if cald=2010.00 then n_onart_m_obs_uga= 97000 ;
if cald=2015.00 then n_onart_m_obs_uga= 217000 ;
if cald=2020.00 then n_onart_m_obs_uga= 375000 ;

if cald=2005.00 then n_onart_w_obs_uga= 45000 ;
if cald=2010.00 then n_onart_w_obs_uga= 118000 ;
if cald=2015.00 then n_onart_w_obs_uga= 436000 ;
if cald=2020.00 then n_onart_w_obs_uga= 697000 ;


* spectrum aim;

if cald=1975 then prevalence1549_m_obs_uga= 0.000;
if cald=1980 then prevalence1549_m_obs_uga= 0.007;
if cald=1985 then prevalence1549_m_obs_uga= 0.050;
if cald=1990 then prevalence1549_m_obs_uga= 0.081;
if cald=1995 then prevalence1549_m_obs_uga= 0.073;
if cald=2000 then prevalence1549_m_obs_uga= 0.060;
if cald=2005 then prevalence1549_m_obs_uga= 0.052;
if cald=2010 then prevalence1549_m_obs_uga= 0.051;
if cald=2015 then prevalence1549_m_obs_uga= 0.046;
if cald=2020 then prevalence1549_m_obs_uga= 0.039;

if cald=1975 then prevalence1549_w_obs_uga= 0.000;
if cald=1980 then prevalence1549_w_obs_uga= 0.007;
if cald=1985 then prevalence1549_w_obs_uga= 0.062;
if cald=1990 then prevalence1549_w_obs_uga= 0.110;
if cald=1995 then prevalence1549_w_obs_uga= 0.106;
if cald=2000 then prevalence1549_w_obs_uga= 0.091;
if cald=2005 then prevalence1549_w_obs_uga= 0.079;
if cald=2010 then prevalence1549_w_obs_uga= 0.074;
if cald=2015 then prevalence1549_w_obs_uga= 0.073;
if cald=2020 then prevalence1549_w_obs_uga= 0.068;


if cald=2016.5 then incidence1549_m_obs_uga= 0.31;
if cald=2020.5 then incidence1549_m_obs_uga= 0.21;
if cald=2016.5 then incidence1549_w_obs_uga= 0.47;
if cald=2020.5 then incidence1549_w_obs_uga= 0.42;

if cald=2016.5 then p_diag_m_obs_uga = 0.67;
if cald=2016.5 then p_diag_w_obs_uga = 0.75;
if cald=2020.5 then p_diag_m_obs_uga = 0.76;
if cald=2020.5 then p_diag_w_obs_uga = 0.84;
if cald=2016.5 then p_diag_obs_uga = 0.72;
if cald=2020.5 then p_diag_obs_uga = 0.81;

if cald=2016.5 then p_onart_diag_m_obs_uga = 0.87;
if cald=2016.5 then p_onart_diag_w_obs_uga = 0.92;
if cald=2020.5 then p_onart_diag_m_obs_uga = 0.95;
if cald=2020.5 then p_onart_diag_w_obs_uga = 0.97;
if cald=2016.5 then p_onart_diag_obs_uga = 0.90;
if cald=2020.5 then p_onart_diag_obs_uga = 0.96;

if cald=2016.5 then p_onart_vl1000_m_obs_uga= 0.82;
if cald=2016.5 then p_onart_vl1000_w_obs_uga= 0.85;
if cald=2020.5 then p_onart_vl1000_m_obs_uga= 0.91;
if cald=2020.5 then p_onart_vl1000_w_obs_uga= 0.93;
if cald=2016.5 then p_onart_vl1000_obs_uga= 0.84;
if cald=2020.5 then p_onart_vl1000_obs_uga= 0.92;



ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 

ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  8000000 by 100000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
label p50_n_tested_1 = "Option 1 (median) ";

series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prop_1564_onprep_0 = "Option 0 (median) ";
label p50_prop_1564_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
label p50_prevalence1549m_1 = "Men Option 1 (median) ";

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=prevalence1549_m_obs_uga/	lineattrs = (color=blue  thickness = 3) ;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549w_0 = "Men Option 0 (median) ";
label p50_prevalence1549w_1 = "Men Option 1 (median) ";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";

series  x=cald y=prevalence1549_w_obs_uga/	lineattrs = (color=blue  thickness = 3) ;

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence men (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label p50_incidence1549m_0 = "Option 0 (median) ";
label p50_incidence1549m_1 = "Option 1  (median) ";

series  x=cald y=p50_incidence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549m_1 	upper=p95_incidence1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=incidence1549_m_obs_uga / 		markerattrs = (symbol=square color=green size = 10);
run;
quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence women (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 5 by 0.5) valueattrs=(size=10);

label p50_incidence1549w_0 = "Option 0 (median) ";
label p50_incidence1549w_1 = "Option 1  (median) ";

series  x=cald y=p50_incidence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549w_1 	upper=p95_incidence1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=incidence1549_w_obs_uga / 		markerattrs = (symbol=square color=green size = 10);
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_w_0 = "Option 0 (median) ";
label p50_p_onart_diag_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;






proc sgplot data=d; 
Title    height=1.5 justify=center "Number diagnosed with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

label p50_n_diagnosed_0 = "Option 0 (median) ";
label p50_n_diagnosed_1 = "Option 1  (median) ";

series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diagnosed_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label p50_n_onart_m_0 = "Option 0 (median) ";
label p50_n_onart_m_1 = "Option 1  (median) ";

series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_m_0 	upper=p95_n_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_m_1 	upper=p95_n_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=n_onart_m_obs_uga;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000 by 100000) valueattrs=(size=10);

label p50_n_onart_w_0 = "Option 0 (median) ";
label p50_n_onart_w_1 = "Option 1  (median) ";

series  x=cald y=p50_n_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_w_0 	upper=p95_n_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_w_1 	upper=p95_n_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=n_onart_w_obs_uga;

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_zdv_0 = "Option 0 (median) ";
label p50_p_zdv_1 = "Option 1  (median) ";

series  x=cald y=p50_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_zdv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_zdv_1 	upper=p95_p_zdv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_dol_0 = "Option 0 (median) ";
label p50_p_dol_1 = "Option 1  (median) ";

series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_dol_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_nev_0 = "Option 0 (median) ";
label p50_p_nev_1 = "Option 1  (median) ";

series  x=cald y=p50_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_nev_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_nev_1 	upper=p95_p_nev_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "Option 0 (median) ";
label p50_p_onart_vl1000__1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series x=cald y = p_onart_vl1000_obs_uga;

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_m_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_m_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series x=cald y = p_onart_vl1000_m_obs_uga;

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_w_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_w_1 = "Option 1  (median) ";

series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series x=cald y = p_onart_vl1000_w_obs_uga;

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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
Title    height=1.5 justify=center "n_death_2059_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label p50_n_death_2059_w_0 = "Option 0 (median) ";
label p50_n_death_2059_w_1 = "Option 1  (median) ";

series  x=cald y=p50_n_death_2059_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_2059_w_0 	upper=p95_n_death_2059_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_2059_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_death_2059_w_1 	upper=p95_n_death_2059_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=p50_n_death_hiv_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_w_0 	upper=p95_n_death_hiv_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label p50_n_death_2059_m_0 = "Option 0 (median) ";
label p50_n_death_2059_m_1 = "Option 1  (median) ";

series  x=cald y=p50_n_death_2059_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_2059_m_0 	upper=p95_n_death_2059_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_2059_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_death_2059_m_1 	upper=p95_n_death_2059_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";

series  x=cald y=p50_n_death_hiv_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_m_0 	upper=p95_n_death_hiv_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_cd4_lt200";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);

label p50_n_cd4_lt200__0 = "Option 0 (median) ";

series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975   to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_hiv_0 = "Option 0 (median) ";

series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);

label p50_n_alive_0 = "Option 0 (median) ";

series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;




ods html;

proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1975 to &year_end by 2)	 	 valueattrs=(size=10); 
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


/*

Prevalence by age 

UPHIA  2016
Men 15-19   0.5   20-24  1.3   25-29  3.7  30-34  5.5  35-39  9.2   40-44  10.8  45-49  14.0   50-54  9.7   55-59  8.9   60-64  5.3
Women 15-19   1.8   20-24  5.1   25-29  8.5  30-34  11.4  35-39  12.9   40-44  11.9  45-49  12.8   50-54  10.5   55-59  9.4   60-64  6.9

UPHIA  2020 
Men 15-19   0.2   20-24  1.6   25-29  3.4  30-34  4.8  35-39  8.9   40-44  8.6  45-49  11.1   50-54  10.0   55-59  8.5   60-64  8.3  65+ 3.8%
Women 15-19   1.7   20-24  4.2   25-29  7.5  30-34  11.4  35-39  12.4   40-44  11.1  45-49  13.1   50-54  13.6   55-59  8.9   60-64  6.0  65+ 3.1

*/

/*

if cald=2016;

data age15w ; set f;  ageg=15; sex=2; 	p5_prevalence = p5_prevalence1519w_0 ;p50_prevalence = p50_prevalence1519w_0 ;
p95_prevalence = p95_prevalence1519w_0 ; prev_obs_uga = 0.018 ;
data age20w ; set f;  ageg=20; sex=2; p5_prevalence = p5_prevalence2024w_0 ; p50_prevalence = p50_prevalence2024w_0 ; 
p95_prevalence = p95_prevalence2024w_0 ; prev_obs_uga = 0.051 ;
data age25w ; set f;  ageg=25; sex=2; p5_prevalence = p5_prevalence2529w_0 ;p50_prevalence = p50_prevalence2529w_0 ;
p95_prevalence = p95_prevalence2529w_0 ;prev_obs_uga = 0.085 ;
data age30w ; set f;  ageg=30; sex=2; p5_prevalence = p5_prevalence3034w_0 ; p50_prevalence = p50_prevalence3034w_0 ; 
p95_prevalence = p95_prevalence3034w_0 ; prev_obs_uga = 0.114 ;
data age35w ; set f;  ageg=35; sex=2; p5_prevalence = p5_prevalence3539w_0 ; p50_prevalence = p50_prevalence3539w_0 ; 
p95_prevalence = p95_prevalence3539w_0 ; prev_obs_uga = 0.129 ;
data age40w ; set f;  ageg=40; sex=2; p5_prevalence = p5_prevalence4044w_0 ;p50_prevalence = p50_prevalence4044w_0 ;
p95_prevalence = p95_prevalence4044w_0 ;prev_obs_uga = 0.119 ;
data age45w ; set f;  ageg=45; sex=2; p5_prevalence = p5_prevalence4549w_0 ; p50_prevalence = p50_prevalence4549w_0 ;
 p95_prevalence = p95_prevalence4549w_0 ;prev_obs_uga = 0.128 ;
data age50w ; set f;  ageg=50; sex=2; p5_prevalence = p5_prevalence5054w_0 ; p50_prevalence = p50_prevalence5054w_0 ; 
p95_prevalence = p95_prevalence5054w_0 ; prev_obs_uga = 0.105 ;
data age55w ; set f;  ageg=55; sex=2; p5_prevalence = p5_prevalence5559w_0 ;p50_prevalence = p50_prevalence5559w_0 ;
p95_prevalence = p95_prevalence5559w_0 ;prev_obs_uga = 0.094 ;
data age60w ; set f;  ageg=60; sex=2; p5_prevalence = p5_prevalence6064w_0 ;p50_prevalence = p50_prevalence6064w_0 ;
p95_prevalence = p95_prevalence6064w_0 ;prev_obs_uga = 0.069 ;


data age15m ; set f;  ageg=15; sex=1; p5_prevalence = p5_prevalence1519m_0 ; p50_prevalence = p50_prevalence1519m_0 ; 
p95_prevalence = p95_prevalence1519m_0 ; prev_obs_uga = 0.005 ;
data age20m ; set f;  ageg=20; sex=1; p5_prevalence = p5_prevalence2024m_0 ; p50_prevalence = p50_prevalence2024m_0 ; 
p95_prevalence = p95_prevalence2024m_0 ; prev_obs_uga = 0.013 ;
data age25m ; set f;  ageg=25; sex=1; p5_prevalence = p5_prevalence2529m_0 ; p50_prevalence = p50_prevalence2529m_0 ; 
p95_prevalence = p95_prevalence2529m_0 ; prev_obs_uga = 0.037 ;
data age30m ; set f;  ageg=30; sex=1; p5_prevalence = p5_prevalence3034m_0 ;p50_prevalence = p50_prevalence3034m_0 ;
p95_prevalence = p95_prevalence3034m_0 ;prev_obs_uga = 0.055 ;
data age35m ; set f;  ageg=35; sex=1; p5_prevalence = p5_prevalence3539m_0 ;p50_prevalence = p50_prevalence3539m_0 ;
p95_prevalence = p95_prevalence3539m_0 ;prev_obs_uga = 0.092 ;
data age40m ; set f;  ageg=40; sex=1; p5_prevalence = p5_prevalence4044m_0 ;p50_prevalence = p50_prevalence4044m_0 ;
p95_prevalence = p95_prevalence4044m_0 ;prev_obs_uga = 0.108 ;
data age45m ; set f;  ageg=45; sex=1; p5_prevalence = p5_prevalence4549m_0 ;p50_prevalence = p50_prevalence4549m_0 ;
p95_prevalence = p95_prevalence4549m_0 ;prev_obs_uga = 0.140 ;
data age50m ; set f;  ageg=50; sex=1; p5_prevalence = p5_prevalence5054m_0 ; p50_prevalence = p50_prevalence5054m_0 ;
 p95_prevalence = p95_prevalence5054m_0 ;prev_obs_uga = 0.097 ;
data age55m ; set f;  ageg=55; sex=1; p5_prevalence = p5_prevalence5559m_0 ;p50_prevalence = p50_prevalence5559m_0 ;
p95_prevalence = p95_prevalence5559m_0 ;prev_obs_uga = 0.089 ;
data age60m ; set f;  ageg=60; sex=1; p5_prevalence = p5_prevalence6064w_0 ;p50_prevalence = p50_prevalence6064m_0 ;
p95_prevalence = p95_prevalence6064m_0 ;prev_obs_uga = 0.053 ;

*/


if cald=2020;

data age15w ; set f;  ageg=15; sex=2; 	p5_prevalence = p5_prevalence1519w_0 ;p50_prevalence = p50_prevalence1519w_0 ;
p95_prevalence = p95_prevalence1519w_0 ; prev_obs_uga = 0.017 ;
data age20w ; set f;  ageg=20; sex=2; p5_prevalence = p5_prevalence2024w_0 ; p50_prevalence = p50_prevalence2024w_0 ; 
p95_prevalence = p95_prevalence2024w_0 ; prev_obs_uga = 0.042 ;
data age25w ; set f;  ageg=25; sex=2; p5_prevalence = p5_prevalence2529w_0 ;p50_prevalence = p50_prevalence2529w_0 ;
p95_prevalence = p95_prevalence2529w_0 ;prev_obs_uga = 0.075 ;
data age30w ; set f;  ageg=30; sex=2; p5_prevalence = p5_prevalence3034w_0 ; p50_prevalence = p50_prevalence3034w_0 ; 
p95_prevalence = p95_prevalence3034w_0 ; prev_obs_uga = 0.114 ;
data age35w ; set f;  ageg=35; sex=2; p5_prevalence = p5_prevalence3539w_0 ; p50_prevalence = p50_prevalence3539w_0 ; 
p95_prevalence = p95_prevalence3539w_0 ; prev_obs_uga = 0.124 ;
data age40w ; set f;  ageg=40; sex=2; p5_prevalence = p5_prevalence4044w_0 ;p50_prevalence = p50_prevalence4044w_0 ;
p95_prevalence = p95_prevalence4044w_0 ;prev_obs_uga = 0.111 ;
data age45w ; set f;  ageg=45; sex=2; p5_prevalence = p5_prevalence4549w_0 ; p50_prevalence = p50_prevalence4549w_0 ;
 p95_prevalence = p95_prevalence4549w_0 ;prev_obs_uga = 0.131 ;
data age50w ; set f;  ageg=50; sex=2; p5_prevalence = p5_prevalence5054w_0 ; p50_prevalence = p50_prevalence5054w_0 ; 
p95_prevalence = p95_prevalence5054w_0 ; prev_obs_uga = 0.136 ;
data age55w ; set f;  ageg=55; sex=2; p5_prevalence = p5_prevalence5559w_0 ;p50_prevalence = p50_prevalence5559w_0 ;
p95_prevalence = p95_prevalence5559w_0 ;prev_obs_uga = 0.089 ;
data age60w ; set f;  ageg=60; sex=2; p5_prevalence = p5_prevalence6064w_0 ;p50_prevalence = p50_prevalence6064w_0 ;
p95_prevalence = p95_prevalence6064w_0 ;prev_obs_uga = 0.060 ;


data age15m ; set f;  ageg=15; sex=1; p5_prevalence = p5_prevalence1519m_0 ; p50_prevalence = p50_prevalence1519m_0 ; 
p95_prevalence = p95_prevalence1519m_0 ; prev_obs_uga = 0.002 ;
data age20m ; set f;  ageg=20; sex=1; p5_prevalence = p5_prevalence2024m_0 ; p50_prevalence = p50_prevalence2024m_0 ; 
p95_prevalence = p95_prevalence2024m_0 ; prev_obs_uga = 0.016 ;
data age25m ; set f;  ageg=25; sex=1; p5_prevalence = p5_prevalence2529m_0 ; p50_prevalence = p50_prevalence2529m_0 ; 
p95_prevalence = p95_prevalence2529m_0 ; prev_obs_uga = 0.034 ;
data age30m ; set f;  ageg=30; sex=1; p5_prevalence = p5_prevalence3034m_0 ;p50_prevalence = p50_prevalence3034m_0 ;
p95_prevalence = p95_prevalence3034m_0 ;prev_obs_uga = 0.048 ;
data age35m ; set f;  ageg=35; sex=1; p5_prevalence = p5_prevalence3539m_0 ;p50_prevalence = p50_prevalence3539m_0 ;
p95_prevalence = p95_prevalence3539m_0 ;prev_obs_uga = 0.089 ;
data age40m ; set f;  ageg=40; sex=1; p5_prevalence = p5_prevalence4044m_0 ;p50_prevalence = p50_prevalence4044m_0 ;
p95_prevalence = p95_prevalence4044m_0 ;prev_obs_uga = 0.086 ;
data age45m ; set f;  ageg=45; sex=1; p5_prevalence = p5_prevalence4549m_0 ;p50_prevalence = p50_prevalence4549m_0 ;
p95_prevalence = p95_prevalence4549m_0 ;prev_obs_uga = 0.111 ;
data age50m ; set f;  ageg=50; sex=1; p5_prevalence = p5_prevalence5054m_0 ; p50_prevalence = p50_prevalence5054m_0 ;
 p95_prevalence = p95_prevalence5054m_0 ;prev_obs_uga = 0.100 ;
data age55m ; set f;  ageg=55; sex=1; p5_prevalence = p5_prevalence5559m_0 ;p50_prevalence = p50_prevalence5559m_0 ;
p95_prevalence = p95_prevalence5559m_0 ;prev_obs_uga = 0.085 ;
data age60m ; set f;  ageg=60; sex=1; p5_prevalence = p5_prevalence6064w_0 ;p50_prevalence = p50_prevalence6064m_0 ;
p95_prevalence = p95_prevalence6064m_0 ;prev_obs_uga = 0.083 ;



data all; set age15w age20w age25w age30w age35w age40w age45w age50w age55w age60w
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

ods html;

proc sgplot data=all; Title 'prevalence by age - women'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 60 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 1 by 0.05) valueattrs=(size=10);
series  x=ageg y=p50_prevalence/	lineattrs = (color=black thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
  series x=ageg y=prev_obs_uga / lineattrs = (color=blue thickness = 2);
where sex=2;
run;


proc sgplot data=all; Title 'prevalence by age - men'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 60 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 1 by 0.05) valueattrs=(size=10);
series  x=ageg y=p50_prevalence/	lineattrs = (color=black thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series x=ageg y=prev_obs_uga / lineattrs = (color=blue thickness = 2);
where sex=1;
run;

quit;

ods html close;






	
