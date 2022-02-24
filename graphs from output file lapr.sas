
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";

  proc printto  ; *  log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";

data b;
set a.l_lapr27;                        



prep_adhg80_ = p_prep_adhg80 ;
p_onart_vl1000_all = .;

of_all_o_cab_pr_dur_ge12m = of_all_o_cab_prop_dur_ge12m;

* NB: note lines below, because variable names cannot end with a number;
log_gender_r_newp  = log(gender_r_newp);
prevalence1549_ = prevalence1549;
incidence1549_ = incidence1549;
incidence1564_ = incidence1564;

prop_onprep_newpge1_= prop_onprep_newpge1;

incidence1524w_ = incidence1524w; incidence1524m_ = incidence1524m;
incidence2534w_ = incidence2534w; incidence2534m_ = incidence2534m;
incidence3544w_ = incidence3544w; incidence3544m_ = incidence3544m;
incidence4554w_ = incidence4554w; incidence4554m_ = incidence4554m;
incidence5564w_ = incidence5564w; incidence5564m_ = incidence5564m;

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



proc sort data=b; by cald run ;run;
data b;set b; count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b; var count_csim;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 2000  ;
%let year_end = 2070    ;
run;
proc sort;by cald option ;run;

***Two macros, one for each option. Gives medians ranges etc by option;
data option_0;
set b;
if option =1 then delete;

%let var =  

p_w_giv_birth_this_per	p_newp_ge1_ p_newp_ge5_  log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w 
p_mcirc_1549m prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence1549_  prevalence_vg1000_  incidence1549_ incidence1564_ n_hiv
incidence1524w_ incidence1524m_ incidence2534w_ incidence2534m_ incidence3544w_ incidence3544m_ incidence4554w_ incidence4554m_ 
incidence5564w_ incidence5564m_ n_tested n_tested_m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w  p_vl1000_art_12m
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart n_prep_all n_death_hiv   
prop_elig_on_prep   p_elig_prep   p_hiv1_prep   prop_onprep_newpge1_   p_prep_elig_past_year   p_prep_newp   prop_sw_onprep p_iime
prop_prep_inj    ratio_inj_prep_on_tail          pr_ever_prep_inj_res_cab       pr_ev_prep_inj_res_cab_hiv
prop_cab_res_o_cab    prop_cab_res_tail        prop_prep_inj_at_inf_diag     
of_all_o_cab_prop_dur_3m     of_all_o_cab_prop_dur_6m   of_all_o_cab_prop_dur_9m of_all_o_cab_pr_dur_ge12m
p_prep_inj_hiv  p_prep_adhg80_  n_cur_res_cab  n_cur_res_dol
n_o_cab_at_3m   n_o_cab_at_6m   n_o_cab_at_9m   n_o_cab_at_ge12m
n_emerge_inm_res_cab  n_switch_prep_from_oral  n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_all_start n_prep_oral_start n_prep_inj_start prop_cab_dol_res_attr_cab  
p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail 
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented
n_birth_with_inf_child  p_prep_all_ever
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

keep cald option_ p5_&varb._0 p95_&varb._0 p50_&varb._0 p25_&varb._0 p75_&varb._0;
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
p_mcirc_1549m prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  prop_1564_onprep 	prevalence1549m prevalence1549w
prevalence1549_  prevalence_vg1000_  incidence1549_ incidence1564_ n_hiv
incidence1524w_ incidence1524m_ incidence2534w_ incidence2534m_ incidence3544w_ incidence3544m_ incidence4554w_ incidence4554m_ 
incidence5564w_ incidence5564m_ n_tested n_tested_m  p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w		p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m 	p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart_m 	p_onart_w  p_vl1000_art_12m
p_onart_vl1000_w				p_onart_vl1000_m  logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart n_prep_all n_death_hiv   
prop_elig_on_prep   p_elig_prep   p_hiv1_prep   prop_onprep_newpge1_   p_prep_elig_past_year   p_prep_newp   prop_sw_onprep p_iime
prop_prep_inj    ratio_inj_prep_on_tail          pr_ever_prep_inj_res_cab       pr_ev_prep_inj_res_cab_hiv
prop_cab_res_o_cab    prop_cab_res_tail        prop_prep_inj_at_inf_diag     
of_all_o_cab_prop_dur_3m     of_all_o_cab_prop_dur_6m   of_all_o_cab_prop_dur_9m of_all_o_cab_pr_dur_ge12m
p_prep_inj_hiv  p_prep_adhg80_  n_cur_res_cab  n_cur_res_dol
n_o_cab_at_3m   n_o_cab_at_6m   n_o_cab_at_9m   n_o_cab_at_ge12m
n_emerge_inm_res_cab  n_switch_prep_from_oral  n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_all_start n_prep_oral_start n_prep_inj_start prop_cab_dol_res_attr_cab  
p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented
n_birth_with_inf_child   p_prep_all_ever
;
run;


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

keep cald option_ p5_&varb._1 p95_&varb._1 p50_&varb._1 p25_&varb._1 p75_&varb._1;
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
g53  g54  g55  g56  g57  g58  g59  g60 g61  g62  g63  g64  g65  g66  g67  g68  g69  g70  g71 g72  g73    g74 g75  g76  g77  g78 
g79  g80  g81  g82  g83  g84  g85  g86  g87 g88  g89  g90  g91  g92  g93  g94  g95  g96  g97  g98  g99  g100 g101 g102 g103  g104 
g105 g106 g107 g108 g109 g110 g111 g112 g113 g114 g115 g116  g117 /* g118 g119 g120 g121 g122 g123 g124 g125 g126 g127 g128 g129 g130
g131 g132 g133 g134 g135 g136 g137 g138 g139 g140 g141 g142 g143 g144 g145 g146 g147 g148 g149 g150 g151 g152 g153 g154 g155 g156
g157 g158 g159 g160 g161 g162 g163 g164 g165 g166 g167 g168 g169 g170 g171 g172 g173 g174 g175 g176 g177 g178 g179 g180 g181 g182
g183 g184 g185 g186 g187 g188 g189 g190 g191 g192 g193 g194 g195 g196 g197 g198 g199 g200 g201 g202 g203 g204 g205 g206 g207 g208
g209 g210 g211 g212 g213 g214 g215 g216 g217 g218 g219 g220 g221 g222 g223 g224 g225 g226 g227 g228 g229 g230 g231 g232 g233 g234
g235 g236 g237 g238 g239 g240 g241 g242 g243 g244 g245 g246 g247 g248 g249 g250 g251 g252 */

h1   h2   h3   h4   h5   h6   h7   h8   h9   h10  h11  h12  h13  h14  h15  h16  h17  h18  h19  h20  h21  h22  h23  h24  h25  h26 
h27  h28  h29  h30  h31  h32  h33  h34  h35  h36  h37  h38  h39  h40  h41  h42  h43  h44  h45  h46  h47  h48  h49  h50 
h51  h52 h53   h54  h55  h56  h57  h58  h59  h60  h61  h62  h63  h64  h65  h66  h67  h68  h69  h70  h71  h72 h73
 h74 h75  h76  h77  h78 h79  h80  h81  h82  h83  h84  h85  h86 h87 h88  h89  h90 h91   h92 h93  h94  h95  h96  h97  h98  h99  h100 h101 h102 h103
h104 h105 h106 h107 h108 h109 h110 h111 h112 h113 h114 h115 h116 h117
;
by cald;

proc contents data=d; run; 


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Loveleen\Synthesis model\Multiple enhancements\graphs_23_08_19.doc' startpage=never; 


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0 = "no cab-la introduction (median) ";
label p50_p_newp_ge1__1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0 = "no cab-la introduction (median) ";
label p50_p_newp_ge5__1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label p50_log_gender_r_newp_0 = "no cab-la introduction (median) ";
label p50_log_gender_r_newp_1 = "cab-la introduction (median) ";

series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by 500000) valueattrs=(size=10);
label p50_n_tested_0 = "no cab-la introduction (median) ";
label p50_n_tested_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_n_tested_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0 = "no cab-la introduction (median) ";
label p50_p_tested_past_year_1549m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0 = "no cab-la introduction (median) ";
label p50_p_tested_past_year_1549w_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "no cab-la introduction (median) ";
label p50_p_mcirc_1549m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";

series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
label p50_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";

label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";


series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";

series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prop_w_1524_onprep_0 = "no cab-la introduction (median) ";
label p50_prop_w_1524_onprep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prop_1564_onprep_0 = "no cab-la introduction (median) ";
label p50_prop_1564_onprep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All no cab-la introduction (median) ";
label p50_prevalence1549__1 = "All cab-la introduction (median) ";
label p50_prevalence1549m_0 = "Men no cab-la introduction (median) ";
label p50_prevalence1549m_1 = "Men cab-la introduction (median) ";
label p50_prevalence1549w_0 = "Women no cab-la introduction (median) ";
label p50_prevalence1549w_1 = "Women cab-la introduction (median) ";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All no cab-la introduction (median) ";
label p50_prevalence1549__1 = "All cab-la introduction (median) ";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit; 




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);

label p50_incidence1549__0 = "no cab-la introduction (median) ";
label p50_incidence1549__1 = "cab-la introduction (median) ";

series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";


run;
quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "number of children born with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number per year'		labelattrs=(size=12)  values = (0 to 30000 by 10000) valueattrs=(size=10);

label p50_n_birth_with_inf_child_0 = "no cab-la introduction (median) ";
label p50_n_birth_with_inf_child_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_birth_with_inf_child_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_birth_with_inf_child_0 	upper=p95_n_birth_with_inf_child_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_birth_with_inf_child_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_birth_with_inf_child_1 	upper=p95_n_birth_with_inf_child_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";


run;
quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center color=str "Incidence (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);

label p50_incidence1564__0 = "no cab-la introduction (median) ";
label p50_incidence1564__1 = "cab-la introduction (median) ";

series  x=cald y=p50_incidence1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564__0 	upper=p95_incidence1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_incidence1564__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_incidence1564__1 	upper=p95_incidence1564__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;
quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 1524w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.2) valueattrs=(size=10);
label p50_incidence1524__0 = "no cab-la introduction (median) ";
label p50_incidence1524__1 = "cab-la introduction (median) ";
series  x=cald y=p50_incidence1524w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1524w__0 	upper=p95_incidence1524w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_incidence1524w__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_incidence1524w__1 	upper=p95_incidence1524w__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";
run;
quit;
ods html;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_vlsupp_0 = "no cab-la introduction (median) ";
label p50_p_inf_vlsupp_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_inf_vlsupp_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_ep_0 = "no cab-la introduction (median) ";
label p50_p_inf_ep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_inf_ep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_inf_ep_1 	upper=p95_p_inf_ep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_newp_0 = "no cab-la introduction (median) ";
label p50_p_inf_newp_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_inf_newp_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_inf_newp_1 	upper=p95_p_inf_newp_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_primary_0 = "no cab-la introduction (median) ";
label p50_p_inf_primary_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_inf_primary_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_naive_0 = "no cab-la introduction (median) ";
label p50_p_inf_naive_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_inf_naive_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_inf_naive_1 	upper=p95_p_inf_naive_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_diag_0 = "no cab-la introduction (median) ";
label p50_p_inf_diag_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_mtct_prop_0 = "no cab-la introduction (median) ";
label p50_mtct_prop_1 = "cab-la introduction (median) ";

series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of men with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label p50_p_diag_m_0 = "no cab-la introduction (median) ";
label p50_p_diag_m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "of women with hiv, % diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100 by 10) valueattrs=(size=10);

label p50_p_diag_w_0 = "no cab-la introduction (median) ";
label p50_p_diag_w_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.01) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "no cab-la introduction (median) ";
label p50_p_ai_no_arv_c_nnm_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_ai_no_arv_c_nnm_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "no cab-la introduction (median) ";
label p50_p_artexp_diag_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_m_0 = "no cab-la introduction (median) ";
label p50_p_onart_diag_m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_w_0 = "no cab-la introduction (median) ";
label p50_p_onart_diag_w_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_prep_all_0 = "no cab-la introduction (median) ";
label p50_n_prep_all_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_prep_all_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_all_0 	upper=p95_n_prep_all_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_prep_all_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_prep_all_1 	upper=p95_n_prep_all_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people living with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_hiv_0 = "no cab-la introduction (median) ";
label p50_n_hiv_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_hiv_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_hiv_1 	upper=p95_n_hiv_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_onart_0 = "no cab-la introduction (median) ";
label p50_n_onart_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_onart_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on lpr";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_lpr_0 = "no cab-la introduction (median) ";
label p50_p_lpr_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_lpr_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_lpr_1 	upper=p95_p_lpr_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on efa";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_efa_0 = "no cab-la introduction (median) ";
label p50_p_efa_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_efa_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_efa_1 	upper=p95_p_efa_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_dol_0 = "no cab-la introduction (median) ";
label p50_p_dol_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_dol_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on atazanavir";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_taz_0 = "no cab-la introduction (median) ";
label p50_p_taz_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_taz_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "no cab-la introduction (median) ";
label p50_p_onart_vl1000__1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on ART 12 months after starting ART, proportion with VL < 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000_art_12m_0 = "no cab-la introduction (median) ";
label p50_p_vl1000_art_12m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_vl1000_art_12m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000_art_12m_0 	upper=p95_p_vl1000_art_12m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_vl1000_art_12m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_vl1000_art_12m_1 	upper=p95_p_vl1000_art_12m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "no cab-la introduction (median) ";
label p50_p_vl1000__1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vg1000__0 = "no cab-la introduction (median) ";
label p50_p_vg1000__1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_m_0 = "no cab-la introduction (median) ";
label p50_p_onart_m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_w_0 = "no cab-la introduction (median) ";
label p50_p_onart_w_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_m_0 = "no cab-la introduction (median) ";
label p50_p_onart_vl1000_m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_w_0 = "no cab-la introduction (median) ";
label p50_p_onart_vl1000_w_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all adults with HIV viral load > 1000 copies/ml";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "no cab-la introduction (median) ";
label p50_prevalence_vg1000__1 = "cab-la introduction (median) ";

series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people with an indication for PrEP, proportion who are on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1) valueattrs=(size=10);

label p50_prop_elig_on_prep_0 = "no cab-la introduction (median) ";
label p50_prop_elig_on_prep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_elig_on_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_0 	upper=p95_prop_elig_on_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_elig_on_prep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_elig_on_prep_1 	upper=p95_prop_elig_on_prep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all adults who currently have an indication for PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.1) valueattrs=(size=10);

label p50_p_elig_prep_0 = "no cab-la introduction (median) ";
label p50_p_elig_prep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_elig_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_elig_prep_0 	upper=p95_p_elig_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_elig_prep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_elig_prep_1 	upper=p95_p_elig_prep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on PrEP, proportion who have HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.03 by 0.01 ) valueattrs=(size=10);

label p50_p_hiv1_prep_0 = "no cab-la introduction (median) ";
label p50_p_hiv1_prep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_hiv1_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_hiv1_prep_0 	upper=p95_p_hiv1_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_hiv1_prep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_hiv1_prep_1 	upper=p95_p_hiv1_prep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people currently on PrEP, proportion who have one or more condomless short term partners in the current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_prop_onprep_newpge1__0 = "no cab-la introduction (median) ";
label p50_prop_onprep_newpge1__1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_onprep_newpge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_onprep_newpge1__0 	upper=p95_prop_onprep_newpge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_onprep_newpge1__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_onprep_newpge1__1 	upper=p95_prop_onprep_newpge1__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of adults who had an indication for PrEP in the past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_p_prep_elig_past_year_0 = "no cab-la introduction (median) ";
label p50_p_prep_elig_past_year_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_elig_past_year_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_elig_past_year_0 	upper=p95_p_prep_elig_past_year_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_elig_past_year_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_elig_past_year_1 	upper=p95_p_prep_elig_past_year_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all short-term condmless sex partnerships, proportion covered by PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_p_prep_newp_0 = "no cab-la introduction (median) ";
label p50_p_prep_newp_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_newp_0 	upper=p95_p_prep_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_newp_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_newp_1 	upper=p95_p_prep_newp_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of sex workers on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_prop_sw_onprep_0 = "no cab-la introduction (median) ";
label p50_prop_sw_onprep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_sw_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_0 	upper=p95_prop_sw_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_sw_onprep_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_1 	upper=p95_prop_sw_onprep_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;                  



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of poeple starting PrEP in current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100000  by 10000) valueattrs=(size=10);

label p50_n_prep_all_start_0 = "no cab-la introduction (median) ";
label p50_n_prep_all_start_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_prep_all_start_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_all_start_0 	upper=p95_n_prep_all_start_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_prep_all_start_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_prep_all_start_1 	upper=p95_n_prep_all_start_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people starting oral PrEP in current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100000  by 10000) valueattrs=(size=10);

label p50_n_prep_oral_start_0 = "no cab-la introduction (median) ";
label p50_n_prep_oral_start_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_prep_oral_start_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_start_0 	upper=p95_n_prep_oral_start_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_prep_oral_start_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_prep_oral_start_1 	upper=p95_n_prep_all_start_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people starting cab-la in current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100000  by 10000) valueattrs=(size=10);

label p50_n_prep_inj_start_0 = "no cab-la introduction (median) ";
label p50_n_prep_inj_start_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_prep_inj_start_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_inj_start_0 	upper=p95_n_prep_inj_start_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_prep_inj_start_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_prep_inj_start_1 	upper=p95_n_prep_inj_start_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people switching from oral PrEP to cab-la in current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100000  by 10000) valueattrs=(size=10);

label p50_n_switch_prep_to_inj_0 = "no cab-la introduction (median) ";
label p50_n_switch_prep_to_inj_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_switch_prep_to_inj_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_switch_prep_to_inj_0 	upper=p95_n_switch_prep_to_inj_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_switch_prep_to_inj_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_switch_prep_to_inj_1 	upper=p95_n_switch_prep_to_inj_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people switching from cab-la to oral PrEP in current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1000   by 100 ) valueattrs=(size=10);

label p50_n_switch_prep_to_oral_0 = "no cab-la introduction (median) ";
label p50_n_switch_prep_to_oral_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_switch_prep_to_oral_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_switch_prep_to_oral_0 	upper=p95_n_switch_prep_to_oral_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_switch_prep_to_oral_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_switch_prep_to_oral_1 	upper=p95_n_switch_prep_to_oral_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people switching from cab-la to oral PrEP in current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 10000  by 1000) valueattrs=(size=10);

label p50_n_switch_prep_from_inj_0 = "no cab-la introduction (median) ";
label p50_n_switch_prep_from_inj_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_switch_prep_from_inj_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_switch_prep_from_inj_0 	upper=p95_n_switch_prep_from_inj_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_switch_prep_from_inj_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_switch_prep_from_inj_1 	upper=p95_n_switch_prep_from_inj_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people switching from oral PrEP to cab-la in current 3 month period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100000  by 10000) valueattrs=(size=10);

label p50_n_switch_prep_from_oral_0 = "no cab-la introduction (median) ";
label p50_n_switch_prep_from_oral_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_switch_prep_from_oral_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_switch_prep_from_oral_0 	upper=p95_n_switch_prep_from_oral_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_switch_prep_from_oral_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_switch_prep_from_oral_1 	upper=p95_n_switch_prep_from_oral_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all people with HIV, proportion with integrase inhibitor resistance";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3     by 0.05 ) valueattrs=(size=10);

label p50_p_iime_0 = "no cab-la introduction (median) ";
label p50_p_iime_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_iime_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_iime_0 	upper=p95_p_iime_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_iime_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_iime_1 	upper=p95_p_iime_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people who were infected with integrase inhibitor resistant virus";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 100000  by 10000) valueattrs=(size=10);

label p50_n_infected_inm_0 = "no cab-la introduction (median) ";
label p50_n_infected_inm_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_infected_inm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_infected_inm_0 	upper=p95_n_infected_inm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_infected_inm_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_infected_inm_1 	upper=p95_n_infected_inm_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of ART initiators, proportion with integrase inhibitor resistance";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1       by 0.1  ) valueattrs=(size=10);

label p50_p_ai_no_arv_e_inm_0 = "no cab-la introduction (median) ";
label p50_p_ai_no_arv_e_inm_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_ai_no_arv_e_inm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_e_inm_0 	upper=p95_p_ai_no_arv_e_inm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_ai_no_arv_e_inm_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_e_inm_1 	upper=p95_p_ai_no_arv_e_inm_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of people with integrase inhibitor resistant HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 200000 by 10000) valueattrs=(size=10);

label p50_n_cur_res_cab_0 = "no cab-la introduction (median) ";
label p50_n_cur_res_cab_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_cur_res_cab_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cur_res_cab_0 	upper=p95_n_cur_res_cab_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_cur_res_cab_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_cur_res_cab_1 	upper=p95_n_cur_res_cab_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Total number of people with tenofovir resistant HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 200000 by 10000) valueattrs=(size=10);

label p50_n_k65m_0 = "no cab-la introduction (median) ";
label p50_n_k65m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_k65m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_k65m_0 	upper=p95_n_k65m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_k65m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_k65m_1 	upper=p95_n_k65m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_cur_res_dol";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 200000 by 10000) valueattrs=(size=10);

label p50_n_cur_res_dol_0 = "no cab-la introduction (median) ";
label p50_n_cur_res_dol_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_cur_res_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cur_res_dol_0 	upper=p95_n_cur_res_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_cur_res_dol_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_cur_res_dol_1 	upper=p95_n_cur_res_dol_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15+ ever taken PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

label p50_p_prep_all_ever_0 = "no cab-la introduction (median) ";
label p50_prop_1564_onprep_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_all_ever_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_all_ever_0 	upper=p95_p_prep_all_ever_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_all_ever_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_all_ever_1 	upper=p95_p_prep_all_ever_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on oral PrEP, proportion with > 80% adherence";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

label p50_p_prep_adhg80__0 = "no cab-la introduction (median) ";
label p50_p_prep_adhg80__1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_adhg80__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_adhg80__0 	upper=p95_p_prep_adhg80__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_adhg80__1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_adhg80__1 	upper=p95_p_prep_adhg80__1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on PrEP, proportion on cab-la";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

label p50_prop_prep_inj_0 = "no cab-la introduction (median) ";
label p50_prop_prep_inj_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_prep_inj_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_prep_inj_0 	upper=p95_prop_prep_inj_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_prep_inj_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_prep_inj_1 	upper=p95_prop_prep_inj_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people on cab-la or during a cab-la tail, ratio of number on cab-la / number during cab-la tail ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Ratio'		labelattrs=(size=12)  values = (0 to 5     by 1    ) valueattrs=(size=10);

label p50_ratio_inj_prep_on_tail_0 = "no cab-la introduction (median) ";
label p50_ratio_inj_prep_on_tail_1 = "cab-la introduction (median) ";

series  x=cald y=p50_ratio_inj_prep_on_tail_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_ratio_inj_prep_on_tail_0 	upper=p95_ratio_inj_prep_on_tail_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_ratio_inj_prep_on_tail_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_ratio_inj_prep_on_tail_1 	upper=p95_ratio_inj_prep_on_tail_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people who have ever taken cab-la, proportion who have hiv with integrase inhibitor resistance";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.01 ) valueattrs=(size=10);

label p50_pr_ever_prep_inj_res_cab_0 = "no cab-la introduction (median) ";
label p50_pr_ever_prep_inj_res_cab_1 = "cab-la introduction (median) ";

series  x=cald y=p50_pr_ever_prep_inj_res_cab_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_pr_ever_prep_inj_res_cab_0 	upper=p95_pr_ever_prep_inj_res_cab_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_pr_ever_prep_inj_res_cab_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_pr_ever_prep_inj_res_cab_1 	upper=p95_pr_ever_prep_inj_res_cab_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people with HIV who ever took cab-la, proportion with integrase inhibitor resistance";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1 ) valueattrs=(size=10);

label p50_pr_ev_prep_inj_res_cab_hiv_0 = "no cab-la introduction (median) ";
label p50_pr_ev_prep_inj_res_cab_hiv_1 = "cab-la introduction (median) ";

series  x=cald y=p50_pr_ev_prep_inj_res_cab_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_pr_ev_prep_inj_res_cab_hiv_0 	upper=p95_pr_ev_prep_inj_res_cab_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_pr_ev_prep_inj_res_cab_hiv_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_pr_ev_prep_inj_res_cab_hiv_1 	upper=p95_pr_ev_prep_inj_res_cab_hiv_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of integrase inhibitor resistance arising due to lab-la, proportion 
 which is in people currently on cab-la";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

label p50_prop_cab_res_o_cab_0 = "no cab-la introduction (median) ";
label p50_prop_cab_res_o_cab_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_cab_res_o_cab_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_cab_res_o_cab_0 	upper=p95_prop_cab_res_o_cab_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_cab_res_o_cab_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_cab_res_o_cab_1 	upper=p95_prop_cab_res_o_cab_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of integrase inhibitor resistance arising due to lab-la, proportion 
 which is in people currently in a cab-la tail";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

label p50_prop_cab_res_tail_0 = "no cab-la introduction (median) ";
label p50_prop_cab_res_tail_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_cab_res_tail_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_cab_res_tail_0 	upper=p95_prop_cab_res_tail_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_cab_res_tail_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_cab_res_tail_1 	upper=p95_prop_cab_res_tail_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of people in primary infection in period in which PrEP to be initiated, 
proportion diagnosed (and hence PrEP not initiated)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

label p50_prop_prep_inj_at_inf_diag_0 = "no cab-la introduction (median) ";
label p50_prop_prep_inj_at_inf_diag_1 = "cab-la introduction (median) ";

series  x=cald y=p50_prop_prep_inj_at_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_prep_inj_at_inf_diag_0 	upper=p95_prop_prep_inj_at_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_prop_prep_inj_at_inf_diag_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_prop_prep_inj_at_inf_diag_1 	upper=p95_prop_prep_inj_at_inf_diag_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people currently on cab-la who have HIV and were infected up to 3 months ago";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1000    by 100  ) valueattrs=(size=10);

label p50_n_o_cab_at_3m_0 = "no cab-la introduction (median) ";
label p50_n_o_cab_at_3m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_o_cab_at_3m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_o_cab_at_3m_0 	upper=p95_n_o_cab_at_3m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_o_cab_at_3m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_o_cab_at_3m_1 	upper=p95_n_o_cab_at_3m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people currently on cab-la who have HIV and were infected 3 to 6 months ago";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100     by 10  ) valueattrs=(size=10);

label p50_n_o_cab_at_6m_0 = "no cab-la introduction (median) ";
label p50_n_o_cab_at_6m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_o_cab_at_6m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_o_cab_at_6m_0 	upper=p95_n_o_cab_at_6m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_o_cab_at_6m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_o_cab_at_6m_1 	upper=p95_n_o_cab_at_6m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people currently on cab-la who have HIV and were infected 6 to 9 months ago";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100     by 10   ) valueattrs=(size=10);

label p50_n_o_cab_at_9m_0 = "no cab-la introduction (median) ";
label p50_n_o_cab_at_9m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_o_cab_at_9m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_o_cab_at_9m_0 	upper=p95_n_o_cab_at_9m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_o_cab_at_9m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_o_cab_at_9m_1 	upper=p95_n_o_cab_at_9m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people currently on cab-la who have HIV and were infected 9 months or more ago";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100    by 10  ) valueattrs=(size=10);

label p50_n_o_cab_at_ge12m_0 = "no cab-la introduction (median) ";
label p50_n_o_cab_at_ge12m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_o_cab_at_ge12m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_o_cab_at_ge12m_0 	upper=p95_n_o_cab_at_ge12m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_o_cab_at_ge12m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_o_cab_at_ge12m_1 	upper=p95_n_o_cab_at_ge12m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all people with HIV on cab-la, proportion who have been infected with HIV in the past 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);

label p50_of_all_o_cab_prop_dur_3m_0 = "no cab-la introduction (median) ";
label p50_of_all_o_cab_prop_dur_3m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_of_all_o_cab_prop_dur_3m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_of_all_o_cab_prop_dur_3m_0 	upper=p95_of_all_o_cab_prop_dur_3m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_of_all_o_cab_prop_dur_3m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_of_all_o_cab_prop_dur_3m_1 	upper=p95_of_all_o_cab_prop_dur_3m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all people with HIV on cab-la, proportion who have been infected with HIV 6-9 months ago";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1     by 0.1 ) valueattrs=(size=10);

label p50_of_all_o_cab_prop_dur_9m_0 = "no cab-la introduction (median) ";
label p50_of_all_o_cab_prop_dur_9m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_of_all_o_cab_prop_dur_9m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_of_all_o_cab_prop_dur_9m_0 	upper=p95_of_all_o_cab_prop_dur_9m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_of_all_o_cab_prop_dur_9m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_of_all_o_cab_prop_dur_9m_1 	upper=p95_of_all_o_cab_prop_dur_9m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all people with HIV on cab-la, proportion who have been infected with HIV over 9 months ago";
xaxis label			= 'Year'		labelattrs=(size=12m)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12m)  values = (0 to 1     by 0.1 ) valueattrs=(size=10);

label p50_of_all_o_cab_pr_dur_ge12m_0 = "no cab-la introduction (median) ";
label p50_of_all_o_cab_pr_dur_ge12m_1 = "cab-la introduction (median) ";

series  x=cald y=p50_of_all_o_cab_pr_dur_ge12m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_of_all_o_cab_pr_dur_ge12m_0 	upper=p95_of_all_o_cab_pr_dur_ge12m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_of_all_o_cab_pr_dur_ge12m_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_of_all_o_cab_pr_dur_ge12m_1 	upper=p95_of_all_o_cab_pr_dur_ge12m_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Of all people currently on cab-la, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1     by 0.01  ) valueattrs=(size=10);

label p50_p_prep_inj_hiv_0 = "no cab-la introduction (median) ";
label p50_p_prep_inj_hiv_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_inj_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_inj_hiv_0 	upper=p95_p_prep_inj_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_inj_hiv_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_inj_hiv_1 	upper=p95_p_prep_inj_hiv_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_emerge_inm_res_cab_tail";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5     by 0.1  ) valueattrs=(size=10);

label p50_p_emerge_inm_res_cab_tail_0 = "no cab-la introduction (median) ";
label p50_p_emerge_inm_res_cab_tail_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_emerge_inm_res_cab_tail_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_emerge_inm_res_cab_tail_0 	upper=p95_p_emerge_inm_res_cab_tail_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_emerge_inm_res_cab_tail_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_emerge_inm_res_cab_tail_1 	upper=p95_p_emerge_inm_res_cab_tail_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_emerge_inm_res_cab";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5     by 0.1  ) valueattrs=(size=10);

label p50_p_emerge_inm_res_cab_0 = "no cab-la introduction (median) ";
label p50_p_emerge_inm_res_cab_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_emerge_inm_res_cab_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_emerge_inm_res_cab_0 	upper=p95_p_emerge_inm_res_cab_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_emerge_inm_res_cab_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_emerge_inm_res_cab_1 	upper=p95_p_emerge_inm_res_cab_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_prep_init_primary_res";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to   1     by 0.1  ) valueattrs=(size=10);

label p50_p_prep_init_primary_res_0 = "no cab-la introduction (median) ";
label p50_p_prep_init_primary_res_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_init_primary_res_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_init_primary_res_0 	upper=p95_p_prep_init_primary_res_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_init_primary_res_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_init_primary_res_1 	upper=p95_p_prep_init_primary_res_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_prep_primary_prevented";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1     by 0.01  ) valueattrs=(size=10);

label p50_p_prep_primary_prevented_0 = "no cab-la introduction (median) ";
label p50_p_prep_primary_prevented_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_primary_prevented_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_primary_prevented_0 	upper=p95_p_prep_primary_prevented_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_primary_prevented_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_primary_prevented_1 	upper=p95_p_prep_primary_prevented_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_prep_reinit_primary_res";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1       by 0.1  ) valueattrs=(size=10);

label p50_p_prep_reinit_primary_res_0 = "no cab-la introduction (median) ";
label p50_p_prep_reinit_primary_res_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_prep_reinit_primary_res_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_prep_reinit_primary_res_0 	upper=p95_p_prep_reinit_primary_res_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_prep_reinit_primary_res_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_prep_reinit_primary_res_1 	upper=p95_p_prep_reinit_primary_res_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_emerge_inm_res_cab_prim";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1       by 0.1  ) valueattrs=(size=10);

label p50_p_emerge_inm_res_cab_prim_0 = "no cab-la introduction (median) ";
label p50_p_emerge_inm_res_cab_prim_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_emerge_inm_res_cab_prim_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_emerge_inm_res_cab_prim_0 	upper=p95_p_emerge_inm_res_cab_prim_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_p_emerge_inm_res_cab_prim_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_emerge_inm_res_cab_prim_1 	upper=p95_p_emerge_inm_res_cab_prim_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;




ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV related deaths per year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 30000   by 10000 ) valueattrs=(size=10);

label p50_n_death_hiv_0 = "no cab-la introduction (median) ";
label p50_n_death_hiv_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_death_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_hiv_0 	upper=p95_n_death_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_death_hiv_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_death_hiv_1 	upper=p95_n_death_hiv_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number people who avoided starting or re-starting PrEP due to testing +ve at the proposed (re-)start time";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2010 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 30000   by 10000 ) valueattrs=(size=10);

label p50_n_prep_primary_prevented_0 = "no cab-la introduction (median) ";
label p50_n_prep_primary_prevented_1 = "cab-la introduction (median) ";

series  x=cald y=p50_n_prep_primary_prevented_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_primary_prevented_0 	upper=p95_n_prep_primary_prevented_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
series  x=cald y=p50_n_prep_primary_prevented_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_n_prep_primary_prevented_1 	upper=p95_n_prep_primary_prevented_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "90% range";

run;quit;





ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "no cab-la introduction (median) ";
label p50_p_w_giv_birth_this_per_1 = "cab-la introduction (median) ";

series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_0 	upper=p95_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=str thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_1 	upper=p95_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=str) legendlabel= "Option 1 90% range";

run;




ods html;

proc sgplot data=d; Title    height=1.5 justify=center "logm15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm15r_0 	upper=p95_logm15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm25r_0 	upper=p95_logm25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm35r_0 	upper=p95_logm35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm45r_0 	upper=p95_logm45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logm55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logm55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logm55r_0 	upper=p95_logm55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;

proc sgplot data=d; Title    height=1.5 justify=center "logw15r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw15r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw15r_0 	upper=p95_logw15r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw25r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw25r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw25r_0 	upper=p95_logw25r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw35r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw35r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw35r_0 	upper=p95_logw35r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw45r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw45r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw45r_0 	upper=p95_logw45r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;
proc sgplot data=d; Title    height=1.5 justify=center "logw55r ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1993 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (-5 to +5 by 1) valueattrs=(size=10);
series  x=cald y=p50_logw55r_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_logw55r_0 	upper=p95_logw55r_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "90% range";
run;quit;

title;

ods html close;

* ods rtf close;
* ods listing;
run;


/*
 
proc format;
value my_fmt
0 = 'no second line'
1 = 'clinical monitoring'
;



proc gchart;
 format option my_fmt.;
 hbar option / discrete type=sum sumvar=nmb nostats group=cet;  
 run;

*/


	
