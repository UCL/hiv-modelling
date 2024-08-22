
***Program to produce graphs using averages across runs
* Based on MIHPSA South Africa version (JAS Oct/Nov23with MW observational data copied from "graphs from output file_mlw7" in malawi branch;

* libname a "C:\Users\rmjlja9\OneDrive - University College London\MIHPSA Malawi\HIV Synthesis outputs\MIHPSA Phase II\mw_mihpsa_O99_29thApr24";

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\mihpsa_malawi\mlw14_out\";


proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";

%let pth_export_mihpsa_mw= C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\mihpsa_malawi\mlw14_out\export_files;run;

data c;
  set a.long_mlw14;

  if option = 99 then option = 0;
* if option = 0 then option = 99;

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
n_sw_1564_ = n_sw_1564;*VCFeb2023;
n_not_on_art_cd40200_ = n_not_on_art_cd40200;*JASJun2024;
n_not_on_art_cd4050_ = n_not_on_art_cd4050;*VCFeb2023;
n_not_on_art_cd450200_ = n_not_on_art_cd450200;*VCFeb2023;
n_not_on_art_cd4200350_ = n_not_on_art_cd4200350;*VCFeb2023;
n_not_on_art_cd4350500_ = n_not_on_art_cd4350500;*VCFeb2023;
n_not_on_art_cd4ge500_  = n_not_on_art_cd4ge500;*VCFeb2023;

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
p_onart_vl1000_1524_ = p_onart_vl1000_1524;*VCFeb2023;
p_vl1000_ = p_vl1000;
p_vg1000_ = p_vg1000;
prevalence_vg1000_ = prevalence_vg1000;
n_w1524_newp_ge1_ = n_w1524_newp_ge1;
p_newp_ge1_ = p_newp_ge1 ;
p_newp_ge5_ = p_newp_ge5 ;  
p_1524_newp_ge1_ = p_1524_newp_ge1;

p_diag_m1524_ = p_diag_m1524;
p_diag_w1524_ = p_diag_w1524;

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

p_on_artexp_w1524evpreg = p_onart_artexp_w1524evpreg;

n_new_inf1549_ = n_new_inf1549;
n_everpregn_w1524_ = n_everpregn_w1524;
n_everpregn_hiv_w1524_ = n_everpregn_hiv_w1524;



* placeholder until self testing retrospectively added;
n_tested_self_test = 0;



proc sort; by cald run ;run;
data c;set c;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=c;var count_csim     ;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 53  ;			* 94 fits out of 1000 JAS Nov23;
%let year_end = 2072.75 ;	*simulation ends at 2072.75 for calibration JAS Oct;
run;
proc sort;by cald option ;run;




***One macro for option 99. Gives medians ranges etc by option;
data option_0;
set c;
if option ne 0 then delete;


%let var =  

n_alive n_alive_m n_alive_w n_alive_1014m n_alive_1524m n_alive_1524w n_alive_2549m n_alive_2549w n_alive_55plm n_alive_55plw n_alive0_
n_alive_014_ 	n_alive_1524_	 n_alive_2564_		n_alive_65pl									
n_sw_1564_	prev_sti_sw /*n_sw_inprog_ly  n_sw_inprog_ever*/ n_sw_program_visit
n_hivneg_sdpartner n_hivneg_sdpartneroffart n_hivnegw_sdpartner n_hivnegw_sdpartneroffart
n_not_on_art_cd40200_ n_not_on_art_cd4050_ n_not_on_art_cd450200_ n_not_on_art_cd4200350_ n_not_on_art_cd4350500_ n_not_on_art_cd4ge500_ 
n_asympt_Undiag n_asympt_diagoffart n_asympt_diagonart n_sympt_notaids n_sympt_aids
n_birth n_give_birth_w_hiv p_w_giv_birth_this_per n_w1524_newp_ge1_ p_newp_ge1_ p_newp_ge5_ p_1524_newp_ge1_ p_ep p_m_npge1_ p_w_npge1_ p_w1524_npge1_ p_sw_npge1_
log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w n_pmtct
p_mcirc_1549m	p_mcirc_1049m	n_new_vmmc	n_new_vmmc1549m 	n_new_vmmc1049m  n_new_vmmc1014m	n_new_birth_circ n_new_mcirc n_new_mcirc_1549m 	n_new_mcirc_1049m
p_vmmc_1549m	p_vmmc_1049m
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  p_w1524newpge1_onprep prop_1564_onprep 	
n_prep n_prep_1524w n_prep_ever
n_init_prep_oral_1524w	n_init_prep_oral_sw		n_init_prep_oral_sdc	n_init_prep_oral_plw
n_init_prep_inj_1524w	n_init_prep_inj_sw		n_init_prep_inj_sdc		n_init_prep_inj_plw
n_init_prep_vr_1524w	n_init_prep_vr_sw		n_init_prep_vr_sdc		n_init_prep_vr_plw
n_prep_oral_1524w 		n_prep_oral_sw		n_prep_oral_sdc		n_prep_oral_plw
n_prep_inj_1524w		n_prep_inj_sw		n_prep_inj_sdc		n_prep_inj_plw
n_prep_vr_1524w			n_prep_vr_sw		n_prep_vr_sdc		n_prep_vr_plw
n_contprep_oral_1524w	n_contprep_oral_sw	n_contprep_oral_sdc	n_contprep_oral_plw	
n_contprep_inj_1524w	n_contprep_inj_sw 	n_contprep_inj_sdc	n_contprep_inj_plw	
n_contprep_vr_1524w 	n_contprep_vr_sw	n_contprep_vr_sdc	n_contprep_vr_plw	
py_prep_oral_1524w		py_prep_oral_sw
py_prep_inj_1524w		py_prep_inj_sw
n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w n_hiv55plm n_hiv55plw n_hiv_sw
prevalence1549m prevalence1549w
prevalence1549_ prevalence_sw prevalence_hiv_preg prevalence1549preg prevalence1524preg 
prevalence_ge15m prevalence_ge15w prevalence_vg1000_  
incidence1549_ incidence1549m incidence1549w incidence1564_ 
incidence1524w incidence1524m incidence2534w incidence2534m incidence3544w incidence3544m incidence4554w incidence4554m 
incidence5564w incidence5564m incidence_sw 
n_new_inf1549_ n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w n_new_inf55plm n_new_inf55plw
n_tested n_tested_m n_tested_w n_tested_sw n_tested_anc 
n_tested_m_sympt n_tested_w_sympt n_tested_m_circ n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd
n_tested1st_anc n_tested1st_labdel n_tested1st_pd n_tested_anc_prevdiag
n_sbcc_visit_1524m 	n_sbcc_visit_1524w n_sbcc_visit_1524_	n_sbcc_visit_2564_ n_sbcc_visit_1564_
n_tested_sbcc_1524m n_tested_sbcc_1524w n_tested_sbcc_2564_ n_tested_sbcc
n_self_tests n_tested_self_test n_diag_self_test
n_hivpos_tests n_hivneg_tests n_hivpos_tests_sympt n_hivneg_tests_sympt
p_tested_sbcc_1524m p_tested_sbcc_1524w p_tested_sbcc_2564_ p_pos_tested_sbcc
p_anc n_diagnosed n_diag_anc n_diag_labdel n_diag_pd
n_diag_ever_m n_diag_ever_w
test_prop_positive overall_test_yield
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w			p_diag_m1524_ 		p_diag_w1524_	p_diag_sw	
n_cm n_vm p_vm_ly_onart n_pcp_p
p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m p_onart_diag_sw	p_onart_diag_w1524_ p_onart_diag_1524_  
p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_onart_vl1000_1524_ p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart p_onart_m 	p_onart_w  p_onart_w1524_ p_onart_1524_ p_onart_sw
p_onart_artexp 	p_onart_artexp_m 	p_onart_artexp_w 	p_onart_artexp_1524_ 	p_onart_artexp_sw 	p_on_artexp_w1524evpreg
p_onart_vl1000_w				p_onart_vl1000_m  n_onart_vl1000_m n_onart_vl1000_w p_onart_vl1000_w1524evpr logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart 		n_onart_m	n_onart_w n_onart_1524_ n_art_start_y
n_total_yllag 	n_dyll_GBD  
;
run;



/*%let var = s_alive n_alive_m;*/
/*run;*/

***transpose given name; *starts with %macro and ends with %mend;
%macro option_(s);
data option_&s;set c;
if option ne &s then delete;
%let p25_var = p25_&var._&s;
%let p75_var = p75_&var._&s;
%let p5_var = p5_&var._&s;
%let p95_var = p95_&var._&s;
%let p50_var = median_&var._&s;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_&s out=g&s._&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&s._&count;set g&s._&count;***creates one dataset per variable;
p25_&varb._&s  = PCTL(25,of &varb.1-&varb.&nfit);
p75_&varb._&s = PCTL(75,of &varb.1-&varb.&nfit);
p5_&varb._&s  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._&s = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._&s = median(of &varb.1-&varb.&nfit);

keep cald p5_&varb._&s p95_&varb._&s p50_&varb._&s p25_&varb._&s p75_&varb._&s;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_(0);
run;




/*

* Import MW population size projection from spreadsheet;
* Source: https://databank.worldbank.org/source/population-estimates-and-projections#;
proc import
datafile="C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\MIHPSA Malawi\Calibration data\P_Data_Extract_From_Population_estimates_and_projections_MW.xlsx"
out=work.pop_size_obs_mw
dbms=xlsx
replace;
sheet="Totals";
run;

* Import MW PLWHIV data from spreadsheet;
* Source: AIDSinfo;
proc import
datafile="C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\MIHPSA Malawi\Calibration data\People living with HIV_National_Malawi.xlsx"
out=work.plwhiv_obs_mw
dbms=xlsx
replace;
sheet="Export";
run;

*/







data d_a; * this is number of variables in %let var = above ;
merge 
g0_1   g0_2   g0_3   g0_4   g0_5   g0_6   g0_7   g0_8   g0_9   g0_10  g0_11  g0_12  g0_13  g0_14  g0_15  g0_16  g0_17  g0_18  g0_19  g0_20  
g0_21  g0_22  g0_23  g0_24  g0_25  g0_26  g0_27  g0_28  g0_29  g0_30  g0_31  g0_32  g0_33  g0_34  g0_35  g0_36  g0_37  g0_38  g0_39  g0_40  
g0_41  g0_42  g0_43  g0_44  g0_45  g0_46  g0_47  g0_48  g0_49  g0_50  g0_51  g0_52  g0_53  g0_54  g0_55  g0_56  g0_57  g0_58  g0_59  g0_60 
g0_61  g0_62  g0_63  g0_64  g0_65  g0_66  g0_67  g0_68  g0_69  g0_70  g0_71  g0_72  g0_73  g0_74  g0_75  g0_76  g0_77  g0_78  g0_79  g0_80  
g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90  g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99 g0_100 
g0_101 g0_102 g0_103 g0_104 g0_105 g0_106 g0_107 g0_108 g0_109 g0_110 g0_111 g0_112 g0_113 g0_114 g0_115 g0_116 g0_117 g0_118 g0_119 g0_120 
g0_121 g0_122 g0_123 g0_124 g0_125 g0_126 g0_127 g0_128 g0_129 g0_130 g0_131 g0_132 g0_133 g0_134 g0_135 g0_136 g0_137 g0_138 g0_139 g0_140 
g0_141 g0_142 g0_143 g0_144 g0_145 g0_146 g0_147 g0_148 g0_149 g0_150 g0_151 g0_152 g0_153 g0_154 g0_155 g0_156 g0_157 g0_158 g0_159 g0_160 
g0_161 g0_162 g0_163 g0_164 g0_165 g0_166 g0_167 g0_168 g0_169 g0_170 g0_171 g0_172 g0_173 g0_174 g0_175 g0_176 g0_177 g0_178 g0_179 g0_180 
g0_181 g0_182 g0_183 g0_184 g0_185 g0_186 g0_187 g0_188 g0_189 g0_190 g0_191 g0_192 g0_193 g0_194 g0_195 g0_196 g0_197 g0_198 g0_10 g0_200 
g0_201 g0_202 g0_203 g0_204 g0_205 g0_206 g0_207 g0_208 g0_209 g0_210 g0_211 g0_212 g0_213 g0_214 g0_215 g0_216 g0_217 g0_218 g0_219 g0_220 
g0_221 g0_222 g0_223 g0_224 g0_225 g0_226 g0_227 g0_228 g0_229 g0_230 g0_231 g0_232 g0_233 g0_234 g0_235 g0_236 g0_237 g0_238 g0_239 g0_240 
g0_241 g0_242 g0_243 g0_244 g0_245 g0_246 g0_247 g0_248 g0_249 g0_250 g0_251 g0_252 g0_253 g0_254 g0_255 g0_256 g0_257	g0_258	g0_259	g0_260
g0_261 g0_262 g0_263 g0_264 g0_265 g0_266
;
by cald;run;


data d; set d_a;



/*

data d; * this is number of variables in %let var = above ;
merge d_a 

*Imported observational data*
pop_size_obs_mw
plwhiv_obs_mw
;
by cald;

*/



* OBSERVATIONAL DATA;
* these are annual totals, put at 0.5 through the year;
if cald=2004.5 then n_tests_obs_mlw=  283467 ;
if cald=2008.5 then n_tests_obs_mlw=  746400 ;
if cald=2011.5 then n_tests_m_obs_mlw= 489100 ;
if cald=2011.5 then n_tests_f_non_anc_obs_mlw= 488583 ;
if cald=2011.5 then n_tests_f_anc_obs_mlw= 503264 ;
if cald=2011.5 then n_tests_obs_mlw= n_tests_m_obs_mlw + n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw ;
if cald=2014.5 then n_tests_m_obs_mlw= 539486 ;
if cald=2014.5 then n_tests_f_non_anc_obs_mlw= 475691 ;
if cald=2014.5 then n_tests_f_anc_obs_mlw= 604001 ;
if cald=2014.5 then n_tests_obs_mlw= n_tests_m_obs_mlw + n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw ;
if cald=2015.5 then n_tests_m_obs_mlw= 701041 ;
if cald=2015.5 then n_tests_f_non_anc_obs_mlw= 715458 ;
if cald=2015.5 then n_tests_f_anc_obs_mlw= 595720 ;
if cald=2015.5 then n_tests_obs_mlw= n_tests_m_obs_mlw + n_tests_f_non_anc_obs_mlw + n_tests_f_anc_obs_mlw ;
if cald=2016.5 then n_tests_m_obs_mlw= 993028 ;
if cald=2016.5 then n_tests_f_non_anc_obs_mlw= 1291520 ;
if cald=2016.5 then n_tests_f_anc_obs_mlw= 636122 ;

* these below are multiplied by 4 so expressed as annual number at each time point;
if cald=2016.0 then n_tests_obs_mlw = 832000 * 4;
if cald=2016.25 then n_tests_obs_mlw = 838000 * 4 ;
if cald=2016.5 then n_tests_obs_mlw = 832000  * 4;
if cald=2016.75 then n_tests_obs_mlw = 750000 * 4 ;

if cald=2017.0 then n_tests_obs_mlw =  936000 * 4 ;
if cald=2017.25 then n_tests_obs_mlw =  974000 * 4 ;
if cald=2017.5 then n_tests_obs_mlw = 1142000  * 4;
if cald=2017.75 then n_tests_obs_mlw =  939000 * 4 ;

if cald=2018.00 then n_tests_obs_mlw = 1098000 * 4 ;
if cald=2018.25 then n_tests_obs_mlw = 1094000 * 4 ;
if cald=2018.50 then n_tests_obs_mlw = 1170000 * 4 ;
if cald=2018.75 then n_tests_obs_mlw = 1071000 * 4 ;

if cald=2019.00 then n_tests_obs_mlw = 1082000 * 4 ;
if cald=2019.25 then n_tests_obs_mlw =  974000 * 4 ;
if cald=2019.50 then n_tests_obs_mlw =  987000 * 4 ;
if cald=2019.75 then n_tests_obs_mlw =  992000 * 4 ;

if cald=2020.00 then n_tests_obs_mlw =  941000 * 4 ;
if cald=2020.25 then n_tests_obs_mlw =  613000 * 4 ;
if cald=2020.50 then n_tests_obs_mlw =  675000 * 4 ;
if cald=2020.75 then n_tests_obs_mlw =  743000 * 4 ;

if cald=2021.00 then n_tests_obs_mlw= 670567 * 4 ;
if cald=2021.00 then n_tests_m_obs_mlw= 670567 * 0.33 * 4;
if cald=2021.00 then n_tests_f_obs_mlw= 670567 * 0.67 * 4;

if cald=2021.0 then n_tests_f_anc_obs_mlw= 155575 * 4; * of which 10724 ( * 4) positive;

if cald=2016.00 then n_tests_f_anc_obs_mlw = 147765  * 4;
if cald=2016.25 then n_tests_f_anc_obs_mlw = 140475  * 4;
if cald=2016.50 then n_tests_f_anc_obs_mlw = 146596  * 4      ;
if cald=2016.75 then n_tests_f_anc_obs_mlw = 149150  * 4      ;
if cald=2017.00 then n_tests_f_anc_obs_mlw = 151227  * 4      ;
if cald=2017.25 then n_tests_f_anc_obs_mlw = 148638  * 4      ;
if cald=2017.50 then n_tests_f_anc_obs_mlw = 159751  * 4      ;
if cald=2017.75 then n_tests_f_anc_obs_mlw = 146974  * 4      ;
if cald=2018.00 then n_tests_f_anc_obs_mlw = 161570  * 4      ;
if cald=2018.25 then n_tests_f_anc_obs_mlw = 157822  * 4      ;
if cald=2018.50 then n_tests_f_anc_obs_mlw = 171922  * 4      ;
if cald=2018.75 then n_tests_f_anc_obs_mlw = 156321  * 4      ;
if cald=2019.00 then n_tests_f_anc_obs_mlw = 152908  * 4      ;
if cald=2019.25 then n_tests_f_anc_obs_mlw = 160860  * 4      ;
if cald=2019.50 then n_tests_f_anc_obs_mlw = 168033  * 4      ;
if cald=2019.75 then n_tests_f_anc_obs_mlw = 157171  * 4      ;
if cald=2020.00 then n_tests_f_anc_obs_mlw = 167545  * 4      ;
if cald=2020.25 then n_tests_f_anc_obs_mlw = 162127  * 4      ;
if cald=2020.50 then n_tests_f_anc_obs_mlw = 155128  * 4      ;
if cald=2020.75 then n_tests_f_anc_obs_mlw = 150492  * 4      ;
if cald=2021.00 then n_tests_f_anc_obs_mlw = 155575  * 4      ;

if cald=2004 then ever_tested_w_1549_obs_mlw= 0.17;
if cald=2004 then ever_tested_m_1549_obs_mlw= 0.17;
if cald=2010 then ever_tested_w_1549_obs_mlw= 0.716;
if cald=2010 then ever_tested_m_1549_obs_mlw= 0.509; *15-54;

* these are annual totals, put at 0.5 through the year;
if cald=2004.5 then n_diag_obs_mlw= 64000 ;
if cald=2005.5 then n_diag_obs_mlw= 59041 ;
if cald=2006.5 then n_diag_obs_mlw= 91382 ;
if cald=2007.5 then n_diag_obs_mlw= 110204 ;
if cald=2008.5 then n_diag_obs_mlw= 124458 ;
if cald=2009.5 then n_diag_obs_mlw= 125614 ;
if cald=2010.5 then n_diag_obs_mlw= 179115 ;
if cald=2011.5 then n_diag_obs_mlw= 166705 ;
if cald=2012.5 then n_diag_obs_mlw= 146210 ;
if cald=2013.5 then n_diag_obs_mlw= 136743 ;
if cald=2014.5 then n_diag_obs_mlw= 116959 ;
if cald=2015.5 then n_diag_obs_mlw= 124280 ;

* these below are multiplied by 4 so expressed as annual number at each time point;
if cald=2016.00 then n_diag_obs_mlw= 41901 * 4     ;
if cald=2016.25 then n_diag_obs_mlw= 39176 * 4      ;
if cald=2016.50 then n_diag_obs_mlw= 36253 * 4      ;
if cald=2016.75 then n_diag_obs_mlw= 32987 * 4      ; 

if cald=2017.00 then n_diag_obs_mlw= 41113 * 4      ;
if cald=2017.25 then n_diag_obs_mlw= 37562 * 4      ;
if cald=2017.50 then n_diag_obs_mlw= 36886 * 4      ;
if cald=2017.75 then n_diag_obs_mlw= 32052 * 4      ; 

if cald=2018.00 then n_diag_obs_mlw= 38048 * 4      ;
if cald=2018.25 then n_diag_obs_mlw= 34414 * 4      ;
if cald=2018.50 then n_diag_obs_mlw= 36052 * 4      ;
if cald=2018.75 then n_diag_obs_mlw= 31089 * 4      ; 

if cald=2019.00 then n_diag_obs_mlw= 32313 * 4      ;
if cald=2019.25 then n_diag_obs_mlw= 28912 * 4      ;
if cald=2019.50 then n_diag_obs_mlw= 28376 * 4      ;
if cald=2019.75 then n_diag_obs_mlw= 26276 * 4      ; 

if cald=2020.00 then n_diag_obs_mlw= 28852 * 4      ;
if cald=2020.25 then n_diag_obs_mlw= 18882 * 4      ;
if cald=2020.50 then n_diag_obs_mlw= 20206 * 4      ;
if cald=2020.75 then n_diag_obs_mlw= 22634 * 4      ; 

if cald=2021.00 then n_diag_obs_mlw= 20078 * 4; * note reports say multiply this by about 0.5 
due to correction of testing in people previously diagnosed ;

* this is number at end of year;

if cald=2005.75 then n_onart_obs_mlw= 26705 ;
if cald=2008.75 then n_onart_obs_mlw= 135681 ;
if cald=2011.75 then n_onart_obs_mlw= 294585 ;
if cald=2014.75 then n_onart_obs_mlw= 489775 ;
if cald=2015.75 then n_onart_obs_mlw= 540071 ;
if cald=2016.75 then n_onart_obs_mlw= 625689      ;  
if cald=2017.75 then n_onart_obs_mlw= 700360   ;  
if cald=2018.75 then n_onart_obs_mlw= 759782  ;
if cald=2019.75 then n_onart_obs_mlw= 787609  ;
if cald=2020.75 then n_onart_obs_mlw= 818218  ; 
if cald=2021.75 then n_onart_obs_mlw= 826138 ; * adults ;

/*

from spectrum aims file

2004	2005	2006	2007	2008	2009	2010	2011	2012	2013	2014	2015	2016	2017	2018	2019	2020
																
3,801	9,873	19,491	32,147	51,998	67,694	85,570	106,407	127,612	146,657	167,260	185,256	212,117	241,127	262,449	267,830	275,935   men
6,192	17,222	35,090	59,139	91,352	119,024	149,650	196,873	252,412	296,740	339,462	374,506	425,914	464,023	506,730	517,118	542,294   women
9,993	27,095	54,581	91,286	143,350	186,718	235,220	303,280	380,024	443,397	506,722	559,762	638,031	705,150	769,179	784,948	818,229   all adults

*/

if cald=2005.50 then n_art_start_m_obs_mlw= 9505 ;
if cald=2005.50 then n_art_start_f_obs_mlw= 14836 ;
if cald=2008.50 then n_art_start_m_obs_mlw= 26482 ;
if cald=2008.50 then n_art_start_f_obs_mlw= 38237 ;
if cald=2011.50 then n_art_start_m_obs_mlw= 30244 ;
if cald=2011.50 then n_art_start_f_obs_mlw= 58641 ;
if cald=2014.50 then n_art_start_m_obs_mlw= 35792 ;
if cald=2014.50 then n_art_start_f_obs_mlw= 65018 ;
if cald=2015.50 then n_art_start_m_obs_mlw= 32919 ;
if cald=2015.50 then n_art_start_f_obs_mlw= 58259 ;

* note below include children so adult figure ~ 90%; * * 4 so expressed as number per year ;

if cald=2016.00 then n_art_start_obs_mlw= 28052 * 4     ;
if cald=2016.25 then n_art_start_obs_mlw= 28657 * 4     ;
if cald=2016.50 then n_art_start_obs_mlw= 41994 * 4     ;
if cald=2016.75 then n_art_start_obs_mlw= 30221 * 4     ;

if cald=2017.00 then n_art_start_obs_mlw= 35762 * 4     ;
if cald=2017.25 then n_art_start_obs_mlw= 32573 * 4     ;
if cald=2017.50 then n_art_start_obs_mlw= 31968 * 4     ;
if cald=2017.75 then n_art_start_obs_mlw= 29245 * 4     ;

if cald=2018.00 then n_art_start_obs_mlw= 35277 * 4     ;
if cald=2018.25 then n_art_start_obs_mlw= 31371 * 4     ;
if cald=2018.50 then n_art_start_obs_mlw= 32315 * 4     ;
if cald=2018.75 then n_art_start_obs_mlw= 28858 * 4     ;

if cald=2019.00 then n_art_start_obs_mlw= 41868 * 4     ;
if cald=2019.25 then n_art_start_obs_mlw= 28318 * 4     ;
if cald=2019.50 then n_art_start_obs_mlw= 27624 * 4     ;
if cald=2019.75 then n_art_start_obs_mlw= 25354 * 4     ;

if cald=2020.00 then n_art_start_obs_mlw= 27737 * 4     ;
if cald=2020.25 then n_art_start_obs_mlw= 18804 * 4     ;
if cald=2020.50 then n_art_start_obs_mlw= 19384 * 4     ;
if cald=2020.75 then n_art_start_obs_mlw= 21655 * 4     ;

if cald=2021.25 then n_art_start_obs_mlw= 19682 * 4;

if cald=2004.5 then prevalence1549_obs_mlw= 0.127;
if cald=2004.5 then prevalence1549m_obs_mlw= 0.108;
if cald=2004.5 then prevalence1549w_obs_mlw= 0.144;

if cald=2010.5 then prevalence1549_obs_mlw= 0.106;
if cald=2010.5 then prevalence1549m_obs_mlw= 0.081;
if cald=2010.5 then prevalence1549w_obs_mlw= 0.129;

if cald=2016.0 then prevalence1549_obs_mlw= 0.094; *between phia and dhs;
if cald=2016.0 then prevalence1549m_obs_mlw= 0.071; *between phia and dhs;
if cald=2016.0 then prevalence1549w_obs_mlw= 0.115; *between phia and dhs;


if cald=2016.5 then incidence1549_obs_mlw= 0.32;

if cald=2010.5 then prevalence1525w_obs_mlw= 0.052;
if cald=2010.5 then prevalence2535w_obs_mlw= 0.164;
if cald=2010.5 then prevalence3545w_obs_mlw= 0.224;

if cald=2010.5 then prevalence1525m_obs_mlw= 0.019;
if cald=2010.5 then prevalence2535m_obs_mlw= 0.087;
if cald=2010.5 then prevalence3545m_obs_mlw= 0.192;
if cald=2010.5 then prevalence4555m_obs_mlw= 0.141;

* if cald=1999.5 then prevalence1549_obs_mlw = 0.164;

if cald=1992.5 then prevalence1549_obs_mlw = 0.108;  * spectrum aim outputs ;  * current median = 0.095 ;
if cald=1995.5 then prevalence1549_obs_mlw = 0.140;  * spectrum aim outputs ;  * current median = 0.147 ;
if cald=1998.5 then prevalence1549_obs_mlw = 0.152;  * spectrum aim outputs ;  * current median = 0.175 ;


if cald=2014.5 then p_onart_vl1000_obs_mlw= 0.84;
if cald=2015.5 then p_onart_vl1000_obs_mlw= 0.86;
if cald=2016.5 then p_onart_vl1000_obs_mlw= 0.90;

if cald=2021.00 then p_onart_vl1000_obs_mlw= 0.96;

if cald=2014.5 then n_secondline_obs_mlw= 5700 ;
if cald=2015.5 then n_secondline_obs_mlw= 6758 ; * 2nd  quarter of 2015;
if cald=2016.5 then n_secondline_obs_mlw= 8811 ; * 2nd  quarter of 2016;

* Population size;
* merged pop_size_obs_mw into d;

* Calibration thresholds;
if cald=1998.5 then do; prevalence1549_threshold_lower=0.08; prevalence1549_threshold_higher=0.19; end;
if cald=1999.5 then do; prevalence1549_threshold_lower=0.08; prevalence1549_threshold_higher=0.19; end;
if cald=2004.5 then do; prevalence1549_threshold_lower=0.07; prevalence1549_threshold_higher=0.20; end;
if cald=2016.5 then do; prevalence1549_threshold_lower=0.07; prevalence1549_threshold_higher=0.13; end;
if cald=2020 then p_vl1000_threshold=0.75;

prevalence1549_threshold=prevalence1549_threshold_lower+0.5*(prevalence1549_threshold_higher-prevalence1549_threshold_lower);


data a.d;set d;run;
/*proc contents data=d; run;*/

/*/data d;set b.d;run;*/

%let start = 1990;



ods graphics / reset imagefmt=jpeg height=4in width=6in; run;




ods rtf file = 'C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\mihpsa_malawi\mlw14_out\mlw14_test2.doc' startpage=never; 




ods html close;
proc print data=d; run;
proc contents data=d; run;



ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series  x=cald y=prevalence1549_obs_mlw /	lineattrs = (color=orange thickness = 2) ;
label prevalence1549_obs_mlw = "Spectrum AIM output";

scatter x=cald y=prevalence1549_threshold / markerattrs = (symbol=plus color=red size = 10) 
	yerrorlower=prevalence1549_threshold_lower yerrorupper=prevalence1549_threshold_higher ERRORBARATTRS = (color = red);
label prevalence1549_threshold = "Calibration thresholds";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

scatter x=cald y=p_vl1000_threshold / markerattrs = (symbol=circle color=red size = 10) ;
label p_vl1000_threshold = "Calibration threshold";

run;quit;


ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Option 0 (median) ";
/*label p50_p_w_giv_birth_this_per_1 = "Option 1 (median) ";*/

series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p2p5_p_w_giv_birth_this_per_0 	upper=p97p5_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";

/*series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p2p5_p_w_giv_birth_this_per_1 	upper=p97p5_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";*/

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1.0 by 0.1 ) valueattrs=(size=10);
label p50_p_ep_0 = "Option 0 (median) ";
/*label p50_p_ep_1 = "Option 1 (median) ";*/

series  x=cald y=p50_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_p_ep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0 = "Option 0 (median) ";
/*label p50_p_newp_ge1__1 = "Option 1 (median) ";*/

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0 = "Option 0 (median) ";
/*label p50_p_newp_ge5__1 = "Option 1 (median) ";*/

series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);
label p50_log_gender_r_newp_0 = "Option 0 (median) ";
/*label p50_log_gender_r_newp_1 = "Option 1 (median) ";*/

series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by 1000000) valueattrs=(size=10);
label p50_n_tested_0 = "Option 0 (median) ";
/*label p50_n_tested_1 = "Option 1 (median) ";*/

series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

series  x=cald y=n_tests_obs_mlw/	lineattrs = (color=orange thickness = 2) ;
label n_tests_obs_mlw = "Observed data";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0 = "Option 0 (median) ";
/*label p50_p_tested_past_year_1549m_1 = "Option 1 (median) ";*/

series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "overall_test_yield";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.01) valueattrs=(size=10);
label p50_overall_test_yield_0 = "Option 0 (median) ";
/*label p50_overall_test_yield_1 = "Option 1 (median) ";*/

series  x=cald y=p50_overall_test_yield_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_overall_test_yield_0 	upper=p95_overall_test_yield_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0 = "Option 0 (median) ";
/*label p50_p_tested_past_year_1549w_1 = "Option 1 (median) ";*/

series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Option 0 (median) ";
/*label p50_p_mcirc_1549m_1 = "Option 1 (median) ";*/

series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

/*series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1 by 0.02) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Current FSW 15-49 op 0 (median) ";
/*label p50_prop_w_1549_sw_1 = "Current FSW 15-49 op 1 (median) ";*/

label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
/*label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";*/


series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=lightgreen thickness = 2);*/
/*band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
/*label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";*/

series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of AGYW initiating PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 10000 ) valueattrs=(size=10);

label p50_n_init_prep_oral_1524w_0 = "Option 0 (median) ";
/*label p50_n_init_prep_oral_1524w_1 = "Option 1  (median) ";*/

series  x=cald y=p50_n_init_prep_oral_1524w_0 /	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_1524w_0 	upper=p95_n_init_prep_oral_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_init_prep_oral_1524w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_init_prep_oral_1524w_1 	upper=p95_n_init_prep_oral_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW initiating PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 30000   by 5000 ) valueattrs=(size=10);

label p50_n_init_prep_oral_sw_0 = "Option 0 (median) ";
/*label p50_n_init_prep_oral_sw_1 = "Option 1  (median) ";*/

series  x=cald y=p50_n_init_prep_oral_sw_0 /	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sw_0 	upper=p95_n_init_prep_oral_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_init_prep_oral_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_init_prep_oral_sw_1 	upper=p95_n_init_prep_oral_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'	labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prop_1564_onprep_0 = "Option 0 (median) ";
/*label p50_prop_1564_onprep_1 = "Option 1  (median) ";*/

series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);

label p50_prop_w_1524_onprep_0 = "Option 0 (median) ";
/*label p50_prop_w_1524_onprep_1 = "Option 1  (median) ";*/

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2   by 0.02 ) valueattrs=(size=10);

label p50_prop_sw_onprep_0 = "Option 0 (median) ";
/*label p50_prop_sw_onprep_1 = "Option 1  (median) ";*/

series  x=cald y=p50_prop_sw_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_onprep_0 	upper=p95_prop_sw_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

label p50_prevalence1549__0 = "All Option 0 (median) ";
/*label p50_prevalence1549__1 = "All Option 1  (median) ";*/
label p50_prevalence1549m_0 = "Men Option 0 (median) ";
/*label p50_prevalence1549m_1 = "Men Option 1 (median) ";*/
label p50_prevalence1549w_0 = "Women Option 0 (median) ";
/*label p50_prevalence1549w_1 = "Women Option 1 (median) ";*/

series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=lightgreen thickness = 2);*/
/*band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";*/

series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=lightblue thickness = 2);*/
/*band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";*/

series  x=cald y=prevalence1549_obs_mlw /	lineattrs = (color=black thickness = 3) ;
series  x=cald y=prevalence1549w_obs_mlw /	lineattrs = (color=blue  thickness = 3) ;
series  x=cald y=prevalence1549m_obs_mlw /	lineattrs = (color=green thickness = 3) ;
label prevalence1549_obs_mlw = "Spectrum AIM output";
label prevalence1549w_obs_mlw = "Spectrum AIM output";
label prevalence1549m_obs_mlw = "Spectrum AIM output";

scatter x=cald y=prevalence1549_threshold_lower / markerattrs = (symbol=circle color=red size = 10) ;
scatter x=cald y=prevalence1549_threshold_higher / markerattrs = (symbol=circle color=red size = 10) ;

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);

label p50_incidence1549__0 = "Option 0 (median) ";
/*label p50_incidence1549__1 = "Option 1  (median) ";*/

series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);

label p50_incidence1564__0 = "Option 0 (median) ";
/*label p50_incidence1564__1 = "Option 1  (median) ";*/

series  x=cald y=p50_incidence1564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1564__0 	upper=p95_incidence1564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence1564__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence1564__1 	upper=p95_incidence1564__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run; quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 1524w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);

label p50_incidence1524__0 = "Option 0 (median) ";
/*label p50_incidence1524__1 = "Option 1  (median) ";*/

series  x=cald y=p50_incidence1524w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1524w__0 	upper=p95_incidence1524w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence1524w__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence1524w__1 	upper=p95_incidence1524w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run; quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 1524m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);

label p50_incidence1524__0 = "Option 0 (median) ";
/*label p50_incidence1524__1 = "Option 1  (median) ";*/

series  x=cald y=p50_incidence1524m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1524m__0 	upper=p95_incidence1524m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence1524m__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence1524m__1 	upper=p95_incidence1524m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run; quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2534w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence2534__0 = "Option 0 (median) ";
/*label p50_incidence2534__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence2534w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence2534w__0 	upper=p95_incidence2534w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence2534w__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence2534w__1 	upper=p95_incidence2534w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2534m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence2534__0 = "Option 0 (median) ";
/*label p50_incidence2534__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence2534m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence2534m__0 	upper=p95_incidence2534m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence2534m__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence2534m__1 	upper=p95_incidence2534m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 3544w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence3544__0 = "Option 0 (median) ";
/*label p50_incidence3544__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence3544w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence3544w__0 	upper=p95_incidence3544w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence3544w__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence3544w__1 	upper=p95_incidence3544w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 3544m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence3544__0 = "Option 0 (median) ";
/*label p50_incidence3544__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence3544m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence3544m__0 	upper=p95_incidence3544m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence3544m__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence3544m__1 	upper=p95_incidence3544m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 4554w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence4554__0 = "Option 0 (median) ";
/*label p50_incidence4554__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence4554w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence4554w__0 	upper=p95_incidence4554w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence4554w__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence4554w__1 	upper=p95_incidence4554w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 4554m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence4554__0 = "Option 0 (median) ";
/*label p50_incidence4554__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence4554m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence4554m__0 	upper=p95_incidence4554m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence4554m__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence4554m__1 	upper=p95_incidence4554m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 5564w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence5564__0 = "Option 0 (median) ";
/*label p50_incidence5564__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence5564w__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence5564w__0 	upper=p95_incidence5564w__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence5564w__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence5564w__1 	upper=p95_incidence5564w__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;
ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 5564m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 4 by 0.5) valueattrs=(size=10);
label p50_incidence5564__0 = "Option 0 (median) ";
/*label p50_incidence5564__1 = "Option 1  (median) ";*/
series  x=cald y=p50_incidence5564m__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence5564m__0 	upper=p95_incidence5564m__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence5564m__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence5564m__1 	upper=p95_incidence5564m__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_vlsupp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_vlsupp_0 = "Option 0 (median) ";
/*label p50_p_inf_vlsupp_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_inf_vlsupp_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_ep_0 = "Option 0 (median) ";
/*label p50_p_inf_ep_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_inf_ep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_inf_ep_1 	upper=p95_p_inf_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_newp_0 = "Option 0 (median) ";
/*label p50_p_inf_newp_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_inf_newp_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_inf_newp_1 	upper=p95_p_inf_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_primary_0 = "Option 0 (median) ";
/*label p50_p_inf_primary_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_inf_primary_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_naive_0 = "Option 0 (median) ";
/*label p50_p_inf_naive_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_inf_naive_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_inf_naive_1 	upper=p95_p_inf_naive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_inf_diag_0 = "Option 0 (median) ";
/*label p50_p_inf_diag_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_mtct_prop_0 = "Option 0 (median) ";
/*label p50_mtct_prop_1 = "Option 1  (median) ";*/

series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of men with HIV, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_m_0 = "Option 0 (median) ";
/*label p50_p_diag_m_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of people with HIV, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_0 = "Option 0 (median) ";
/*label p50_p_diag_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_diag_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Of women with HIV, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_diag_w_0 = "Option 0 (median) ";
/*label p50_p_diag_w_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.01) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "Option 0 (median) ";
/*label p50_p_ai_no_arv_c_nnm_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_ai_no_arv_c_nnm_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Option 0 (median) ";
/*label p50_p_artexp_diag_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_m_0 = "Option 0 (median) ";
/*label p50_p_onart_diag_m_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_diag_w_0 = "Option 0 (median) ";
/*label p50_p_onart_diag_w_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_vl1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number diagnosed with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

label p50_n_diagnosed_0 = "Option 0 (median) ";
/*label p50_n_diagnosed_1 = "Option 1  (median) ";*/

series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_diagnosed_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

series  x=cald y=n_diag_obs_mlw/	lineattrs = (color=orange thickness = 2) ;
label n_diag_obs_mlw = "Observed data";

run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_onart_0 = "Option 0 (median) ";
/*label p50_n_onart_1 = "Option 1  (median) ";*/

series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

series  x=cald y=n_onart_obs_mlw/	lineattrs = (color=orange thickness = 2);
label n_onart_obs_mlw = "Observed data";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on EFV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_efa_0 = "Option 0 (median) ";
/*label p50_p_efa_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_efa_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_efa_0 	upper=p95_p_efa_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_efa_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_efa_1 	upper=p95_p_efa_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TAZ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_taz_0 = "Option 0 (median) ";
/*label p50_p_taz_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_taz_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_taz_0 	upper=p95_p_taz_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_taz_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_taz_1 	upper=p95_p_taz_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on TEN";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_ten_0 = "Option 0 (median) ";
/*label p50_p_ten_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_ten_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ten_0 	upper=p95_p_ten_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_ten_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_ten_1 	upper=p95_p_ten_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ZDV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_zdv_0 = "Option 0 (median) ";
/*label p50_p_zdv_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_zdv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_zdv_0 	upper=p95_p_zdv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_zdv_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_zdv_1 	upper=p95_p_zdv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on DOL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_dol_0 = "Option 0 (median) ";
/*label p50_p_dol_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_dol_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_dol_0 	upper=p95_p_dol_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_dol_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_dol_1 	upper=p95_p_dol_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on 3TC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_3TC_0 = "Option 0 (median) ";
/*label p50_p_3TC_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_3TC_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_3TC_0 	upper=p95_p_3TC_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_3TC_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_3TC_1 	upper=p95_p_3TC_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on LPR";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_lpr_0 = "Option 0 (median) ";
/*label p50_p_lpr_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_lpr_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_lpr_0 	upper=p95_p_lpr_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_lpr_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_lpr_1 	upper=p95_p_lpr_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on NEV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_nev_0 = "Option 0 (median) ";
/*label p50_p_nev_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_nev_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_nev_0 	upper=p95_p_nev_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_nev_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_nev_1 	upper=p95_p_nev_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000__0 = "Option 0 (median) ";
/*label p50_p_onart_vl1000__1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

scatter x=cald y=p_onart_vl1000_obs_mlw / markerattrs = (symbol=circle color=orange size = 10) ;
label p_onart_vl1000_obs_mlw = "Observed data";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vl1000__0 = "Option 0 (median) ";
/*label p50_p_vl1000__1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_vg1000__0 = "Option 0 (median) ";
/*label p50_p_vg1000__1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all HIV positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_m_0 = "Option 0 (median) ";
/*label p50_p_onart_m_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all HIV positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_w_0 = "Option 0 (median) ";
/*label p50_p_onart_w_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_m_0 = "Option 0 (median) ";
/*label p50_p_onart_vl1000_m_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);

label p50_p_onart_vl1000_w_0 = "Option 0 (median) ";
/*label p50_p_onart_vl1000_w_1 = "Option 1  (median) ";*/

series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;

ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);

label p50_prevalence_vg1000__0 = "Option 0 (median) ";
/*label p50_prevalence_vg1000__1 = "Option 1  (median) ";*/

series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label p50_n_death_2059_w_0 = "Option 0 (median) ";
/*label p50_n_death_2059_w_1 = "Option 1  (median) ";*/

series  x=cald y=p50_n_death_2059_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_2059_w_0 	upper=p95_n_death_2059_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_death_2059_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_death_2059_w_1 	upper=p95_n_death_2059_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_death_2059_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);

label p50_n_death_2059_m_0 = "Option 0 (median) ";
/*label p50_n_death_2059_m_1 = "Option 1  (median) ";*/

series  x=cald y=p50_n_death_2059_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_death_2059_m_0 	upper=p95_n_death_2059_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_death_2059_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_death_2059_m_1 	upper=p95_n_death_2059_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/

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
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 500000 by 50000) valueattrs=(size=10);

label p50_n_cd4_lt200__0 = "Option 0 (median) ";

series  x=cald y=p50_n_cd4_lt200__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cd4_lt200__0 	upper=p95_n_cd4_lt200__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

run;quit;



ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1984 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 40000000 by  5000000) valueattrs=(size=10);

label p50_n_alive_0 = "Option 0 (median) ";

series  x=cald y=p50_n_alive_0 /	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series x=cald y=pop_size_gt15_obs_mw / lineattrs = (color=orange thickness = 2);
label pop_size_gt15_obs_mw = "World Bank Population estimates and projections";

run;quit;


ods html;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_hiv";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1500000 by 100000) valueattrs=(size=10);

label p50_n_hiv_0 = "Option 0 (median) ";

series  x=cald y=p50_n_hiv_0 /	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_hiv_0 	upper=p95_n_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";

series x=cald y=n_hiv_gt15_obs_mw /  lineattrs = (color=orange thickness = 2);
band    x=cald lower=n_hiv_gt15_95lo_obs_mw upper=n_hiv_gt15_95hi_obs_mw  / transparency=0.9 fillattrs = (color=orange) legendlabel= "AIDSinfo range";
label n_hiv_gt15_obs_mw = "AIDSinfo";

run;quit;


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

/*title;*/

/*ods rtf close;*/
/** ods listing;*/
/*run;*/




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

if cald=2017;

data age15w ; set f;  ageg=15; sex=2; 	p5_prevalence = p5_prevalence1519w_0 ;p50_prevalence = p50_prevalence1519w_0 ;
p95_prevalence = p95_prevalence1519w_0 ; prev_obs_mlw = 0.020 ;
data age20w ; set f;  ageg=20; sex=2; p5_prevalence = p5_prevalence2024w_0 ; p50_prevalence = p50_prevalence2024w_0 ; 
p95_prevalence = p95_prevalence2024w_0 ; prev_obs_mlw = 0.052 ;
data age25w ; set f;  ageg=25; sex=2; p5_prevalence = p5_prevalence2529w_0 ;p50_prevalence = p50_prevalence2529w_0 ;
p95_prevalence = p95_prevalence2529w_0 ;prev_obs_mlw = 0.136 ;
data age30w ; set f;  ageg=30; sex=2; p5_prevalence = p5_prevalence3034w_0 ; p50_prevalence = p50_prevalence3034w_0 ; 
p95_prevalence = p95_prevalence3034w_0 ; prev_obs_mlw = 0.175 ;
data age35w ; set f;  ageg=35; sex=2; p5_prevalence = p5_prevalence3539w_0 ; p50_prevalence = p50_prevalence3539w_0 ; 
p95_prevalence = p95_prevalence3539w_0 ; prev_obs_mlw = 0.221 ;
data age40w ; set f;  ageg=40; sex=2; p5_prevalence = p5_prevalence4044w_0 ;p50_prevalence = p50_prevalence4044w_0 ;
p95_prevalence = p95_prevalence4044w_0 ;prev_obs_mlw = 0.246 ;
data age45w ; set f;  ageg=45; sex=2; p5_prevalence = p5_prevalence4549w_0 ; p50_prevalence = p50_prevalence4549w_0 ;
 p95_prevalence = p95_prevalence4549w_0 ;prev_obs_mlw = 0.203 ;
data age50w ; set f;  ageg=50; sex=2; p5_prevalence = p5_prevalence5054w_0 ; p50_prevalence = p50_prevalence5054w_0 ; 
p95_prevalence = p95_prevalence5054w_0 ; prev_obs_mlw = 0.164 ;
data age55w ; set f;  ageg=55; sex=2; p5_prevalence = p5_prevalence5559w_0 ;p50_prevalence = p50_prevalence5559w_0 ;
p95_prevalence = p95_prevalence5559w_0 ;prev_obs_mlw = 0.161 ;
data age60w ; set f;  ageg=60; sex=2; p5_prevalence = p5_prevalence6064w_0 ;p50_prevalence = p50_prevalence6064w_0 ;
p95_prevalence = p95_prevalence6064w_0 ;prev_obs_mlw = 0.139 ;


data age15m ; set f;  ageg=15; sex=1; p5_prevalence = p5_prevalence1519m_0 ; p50_prevalence = p50_prevalence1519m_0 ; 
p95_prevalence = p95_prevalence1519m_0 ; prev_obs_mlw = 0.009 ;
data age20m ; set f;  ageg=20; sex=1; p5_prevalence = p5_prevalence2024m_0 ; p50_prevalence = p50_prevalence2024m_0 ; 
p95_prevalence = p95_prevalence2024m_0 ; prev_obs_mlw = 0.023 ;
data age25m ; set f;  ageg=25; sex=1; p5_prevalence = p5_prevalence2529m_0 ; p50_prevalence = p50_prevalence2529m_0 ; 
p95_prevalence = p95_prevalence2529m_0 ; prev_obs_mlw = 0.047 ;
data age30m ; set f;  ageg=30; sex=1; p5_prevalence = p5_prevalence3034m_0 ;p50_prevalence = p50_prevalence3034m_0 ;
p95_prevalence = p95_prevalence3034m_0 ;prev_obs_mlw = 0.121 ;
data age35m ; set f;  ageg=35; sex=1; p5_prevalence = p5_prevalence3539m_0 ;p50_prevalence = p50_prevalence3539m_0 ;
p95_prevalence = p95_prevalence3539m_0 ;prev_obs_mlw = 0.145 ;
data age40m ; set f;  ageg=40; sex=1; p5_prevalence = p5_prevalence4044m_0 ;p50_prevalence = p50_prevalence4044m_0 ;
p95_prevalence = p95_prevalence4044m_0 ;prev_obs_mlw = 0.186 ;
data age45m ; set f;  ageg=45; sex=1; p5_prevalence = p5_prevalence4549m_0 ;p50_prevalence = p50_prevalence4549m_0 ;
p95_prevalence = p95_prevalence4549m_0 ;prev_obs_mlw = 0.221 ;
data age50m ; set f;  ageg=50; sex=1; p5_prevalence = p5_prevalence5054m_0 ; p50_prevalence = p50_prevalence5054m_0 ;
 p95_prevalence = p95_prevalence5054m_0 ;prev_obs_mlw = 0.175 ;
data age55m ; set f;  ageg=55; sex=1; p5_prevalence = p5_prevalence5559m_0 ;p50_prevalence = p50_prevalence5559m_0 ;
p95_prevalence = p95_prevalence5559m_0 ;prev_obs_mlw = 0.145 ;
data age60m ; set f;  ageg=60; sex=1; p5_prevalence = p5_prevalence6064w_0 ;p50_prevalence = p50_prevalence6064m_0 ;
p95_prevalence = p95_prevalence6064m_0 ;prev_obs_mlw = 0.106 ;

data all; set age15w age20w age25w age30w age35w age40w age45w age50w age55w age60w
 age15m age20m age25m age30m age35m age40m age45m age50m age55m age60m
; 
/*prev_95lo_obs_sa = prev_obs_sa - 1.96*prev_se_obs_sa;*/
/*prev_95hi_obs_sa = prev_obs_sa + 1.96*prev_se_obs_sa;*/

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


proc sgplot data=all; Title 'HIV prevalence by age in 2016 - women'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 55 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);
series  x=ageg y=p50_prevalence/	lineattrs = (color=blue thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
/*series x=ageg y=prev_obs_mlw / lineattrs = (color=black thickness = 2);*/
scatter x=ageg y=prev_obs_mlw / markerattrs = (symbol=circle color=orange size = 10) ;
/*	yerrorlower=prev_95lo_obs_sa yerrorupper=prev_95hi_obs_sa ERRORBARATTRS = (color = orange);*/
where sex=2;
label prev_obs_mlw = "Observed data";

run;


proc sgplot data=all; Title 'HIV prevalence by age in 2016 - men'   height=1.5 justify=center ;
xaxis label			= 'Age group'		labelattrs=(size=12)  values = (15 to 55 by 5)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Prevalence'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);
series  x=ageg y=p50_prevalence/	lineattrs = (color=blue thickness = 2);
band    x=ageg lower=p5_prevalence 	upper=p95_prevalence  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
/*series x=ageg y=prev_obs_mlw / lineattrs = (color=black thickness = 2);*/
scatter x=ageg y=prev_obs_mlw / markerattrs = (symbol=circle color=orange size = 10) ;
/*	yerrorlower=prev_95lo_obs_sa yerrorupper=prev_95hi_obs_sa ERRORBARATTRS = (color = orange);*/
where sex=1;
label prev_obs_mlw = "Observed data";

run;

quit;

/*ods html close;*/

title;

* ods rtf close;
* ods listing;
run;










*The following code is to export data in format for MIHPSA Malawi;


/***********************************************************************************************/
/************************              STOCK                        ****************************/
/***********************************************************************************************/
*JASJun24;
*Output to be exported to fill in the file "Mihpsa-malawi-outputs-Synthesis-20240610";

/*data d;set a.d_from2023;run;*/
proc contents data=d;run;

* Input o is option number;
%macro stock(o=);
*Note: we do export 90% range even if they are name 95% LL and UL
	   we do not export:
			- any outcome about children (0-14 years old), TG and MSM
			- % who ever had sex (i.e. sexually active)
			- % who used condom the last time they had sex among  sexually active;
data s&o;set d;
where cald in 
(	   2021.5 2022.5 2023.5 2024.5 2025.5 2026.5 2027.5 2028.5 2029.5 
2030.5 2031.5 2032.5 2033.5 2034.5 2035.5 2036.5 2037.5 2038.5 2039.5 
2040.5 2041.5 2042.5 2043.5 2044.5 2045.5 2046.5 2047.5 2048.5 2049.5
2050.5 );

rename p50_n_hiv1524m_&o = N_PLHIV_15_24_M;
rename p50_n_hiv1524w_&o = N_PLHIV_15_24_F;
rename p50_n_hiv2549m_&o = N_PLHIV_25_49_M;
rename p50_n_hiv2549w_&o = N_PLHIV_25_49_F;
rename p50_n_hiv55plm_&o = N_PLHIV_50_UP_M;
rename p50_n_hiv55plw_&o = N_PLHIV_50_UP_F;
rename p50_n_alive_1524m_&o = N_Total_15_24_M;
rename p50_n_alive_1524w_&o = N_Total_15_24_F;
rename p50_n_alive_2549m_&o = N_Total_25_49_M;
rename p50_n_alive_2549w_&o = N_Total_25_49_F;
rename p50_n_alive_55plm_&o = N_Total_50_UP_M;
rename p50_n_alive_55plw_&o = N_Total_50_UP_F;
rename p50_n_diag_ever_m_&o = N_Diag_15_UP_M;
rename p50_n_diag_ever_w_&o = N_Diag_15_UP_F;
rename p50_n_onart_m_&o = N_ART_15_UP_M;
rename p50_n_onart_w_&o = N_ART_15_UP_F;
rename p50_n_onart_vl1000_m_&o = N_VLS_15_UP_M;
rename p50_n_onart_vl1000_w_&o = N_VLS_15_UP_F;
rename p50_n_not_on_art_cd4ge500__&o = N_PLHIV_15_UP_CD4_500_INF;
rename p50_n_not_on_art_cd4350500__&o = N_PLHIV_15_UP_CD4_350_500;
rename p50_n_not_on_art_cd4200350__&o = N_PLHIV_15_UP_CD4_200_350;
rename p50_n_not_on_art_cd450200__&o = N_PLHIV_15_UP_CD4_050_200;
rename p50_n_not_on_art_cd4050__&o = N_PLHIV_15_UP_CD4_000_050;



year= floor(cald);

*** NB WORK OUT HOW TO CHANGE THE ORDER OF VARIABLES HERE ***;
* Add missing rows for child/MSM/omitted variables;
* Change year to column heads;
keep year
p50_n_hiv1524m_&o
p50_n_hiv1524w_&o
p50_n_hiv2549m_&o
p50_n_hiv2549w_&o
p50_n_hiv55plm_&o
p50_n_hiv55plw_&o
p50_n_alive_1524m_&o
p50_n_alive_1524w_&o
p50_n_alive_2549m_&o
p50_n_alive_2549w_&o
p50_n_alive_55plm_&o
p50_n_alive_55plw_&o
p50_n_diag_ever_m_&o
p50_n_diag_ever_w_&o
p50_n_onart_m_&o
p50_n_onart_w_&o
p50_n_onart_vl1000_m_&o
p50_n_onart_vl1000_w_&o
p50_n_not_on_art_cd4ge500__&o
p50_n_not_on_art_cd4350500__&o
p50_n_not_on_art_cd4200350__&o
p50_n_not_on_art_cd450200__&o
p50_n_not_on_art_cd4050__&o
;
run;
%mend;

%stock(o=99);


proc transpose data = s99 out= s99_transposed;
run;

proc print data=s99_transposed; run; 

PROC export data=s99_transposed outFILE= "&pth_export_mihpsa_mw\mihpsa_mw_p2_synthesis_19aug24" dbms=xlsx REPLACE;
sheet="stocks_minimal";  RUN;


options nomprint;
option nospool;



/***********************************************************************************************/
/************************              FLOW                        ****************************/
/***********************************************************************************************/


  ***Macro var used to calculate means across each year and transpose to one line per run,
  need to write manually all the years to merge;

/*proc contents data=c;run;*/

%macro var_cy(s,v);
data option_&s;set c;if option=&s;keep &v count_csim  cald ;
proc sort data=option_&s;by count_csim  cald ;
%let count = 2021;
%do %while (&count le 2050);
proc means  noprint data=option_&s; var &v; output out=y_&count mean=&v._&count; by count_csim ; where &count-0.5 <= cald < &count+0.5;
%let count = %eval(&count + 1);
%end;
data &v ; merge y_2021 y_2022 y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030 y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040 
  				y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050 ;  
drop _NAME_ _TYPE_ _FREQ_;run;
proc datasets nodetails nowarn nolist;
delete	y_2021 y_2022 y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030 y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040 
  		y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050 ;quit;

proc transpose data=&v out=l_&v._&s prefix=&v;id  count_csim;run;
data l_&v._&s;set l_&v._&s;
cald= input(substr(_NAME_,length(_NAME_)-3,4),4.);drop _NAME_;run;

data l_&v._&s;set l_&v._&s;***creates one dataset per variable;
/*p5_&v._&s  = PCTL(5,of &v.1-&v.&nfit);*/
/*p95_&v._&s = PCTL(95,of &v.1-&v.&nfit);*/
p50_&v._&s = median(of &v.1-&v.&nfit);
keep cald /*p5_&v._&s p95_&v._&s*/ p50_&v._&s;
run;
proc datasets nodetails nowarn nolist;delete &v;run;
%mend var_cy;


/* Define the list of variables */
%let var_list = 
	n_birth
	n_give_birth_w_hiv
	n_give_birth_on_art					/*Not yet run*/
/*N_NewHIV_00_14_C*/					/*Cannot model*/
	n_new_inf1524m
    n_new_inf1524w
	n_new_inf2549m
	n_new_inf2549w
	n_new_inf55plm						/*NB. This is 55-64y as no sexual mixing above 65*/
	n_new_inf55plw						/*NB. This is 55-64y as no sexual mixing above 65*/
/*N_DeathsHIV_00_14_C*/					/*Cannot model*/
	n_death_hivrel_m
	n_death_hivrel_w
/*N_DeathsAll_00_14_C*/					/*Cannot model*/
	n_death_m
	n_death_w
/*N_YLL_00_14_C*/						/*Cannot model*/
	yllag_hiv_m							/*Not yet run*/
	yllag_hiv_w							/*Not yet run*/
/*N_HIVTest_Facility_NEG_15_UP*/		/*Cannot explicitly model*/
/*N_HIVTest_Facility_POS_15_UP*/		/*Cannot explicitly model*/
/*N_HIVTest_Index_NEG_15_UP*/			/*Cannot explicitly model*/
/*N_HIVTest_Index_POS_15_UP*/			/*Cannot explicitly model*/
/*N_HIVTest_Community_NEG_15_UP*/		/*Cannot explicitly model*/
/*N_HIVTest_Community_POS_15_UP*/		/*Cannot explicitly model*/
	n_diag_self_test
	n_self_tests
/*N_Condom_Acts*/						/*Cannot model*/
	n_new_vmmc
	py_prep_oral_1524w
	py_prep_oral_sw
/*PY_PREP_ORAL_MSM*/					/*Cannot model*/
	py_prep_inj_1524w
	py_prep_inj_sw
/*PY_PREP_INJECT_MSM*/					/*Cannot model*/
/*N_ART_ADH_15_UP_F*/					/*Not yet modelled*/
/*N_ART_ADH_15_UP_M*/					/*Not yet modelled*/
	n_vm
/*N_VL_TEST_00_14*/						/*Cannot model*/
	n_sw_program_visit					/*NB. This is number of program visits in 3 months*/
/*N_OUTREACH_MSM*/						/*Cannot model*/
/*N_EconEmpowerment*/					/*Not yet modelled*/
/*N_CSE_15_19_F*/						/*Not yet modelled*/
/*N_CSE_15_19_M*/						/*Not yet modelled*/
	n_hivneg_tests						/*Extra output*/
	n_hivpos_tests						/*Extra output*/
;


/* Define the list of options */
%let opt_list = 99;


%macro run_var_cy_all;
    %local i j var opt;

    /* Loop through each option */
    %do i = 1 %to %sysfunc(countw(&opt_list));
        %let opt = %scan(&opt_list, &i);

        /* Loop through each variable */
        %do j = 1 %to %sysfunc(countw(&var_list));
            %let var = %scan(&var_list, &j);

            /* Call the macro with the current option and variable */
            %var_cy(&opt, &var);
        %end;
    %end;
%mend run_all;


/* Run the macro to process all options and variables */
%run_var_cy_all;



%macro wide(s);
data   wide_allyears_&s; merge 
l_n_birth_&s
l_n_give_birth_w_hiv_&s
/*l_give_birth_on_art_&s*/
/*N_NewHIV_00_14_C*/					/*Cannot model*/
l_n_new_inf1524m_&s
l_n_new_inf1524w_&s
l_n_new_inf2549m_&s
l_n_new_inf2549w_&s
l_n_new_inf55plm_&s
l_n_new_inf55plw_&s
/*N_DeathsHIV_00_14_C*/					/*Cannot model*/
l_n_death_hivrel_m_&s
l_n_death_hivrel_w_&s
/*N_DeathsAll_00_14_C*/					/*Cannot model*/
l_n_death_m_&s
l_n_death_w_&s
/*N_YLL_00_14_C*/						/*Cannot model*/
/*l_yllag_hiv_m_&s*/
/*l_yllag_hiv_w_&s*/
/*N_HIVTest_Facility_NEG_15_UP*/		/*Cannot explicitly model*/
/*N_HIVTest_Facility_POS_15_UP*/		/*Cannot explicitly model*/
/*N_HIVTest_Index_NEG_15_UP*/			/*Cannot explicitly model*/
/*N_HIVTest_Index_POS_15_UP*/			/*Cannot explicitly model*/
/*N_HIVTest_Community_NEG_15_UP*/		/*Cannot explicitly model*/
/*N_HIVTest_Community_POS_15_UP*/		/*Cannot explicitly model*/
l_n_diag_self_test_&s
l_n_self_tests_&s
/*N_Condom_Acts*/						/*Cannot model*/
l_n_new_vmmc_&s
l_py_prep_oral_1524w_&s
l_py_prep_oral_sw_&s
/*PY_PREP_ORAL_MSM*/					/*Cannot model*/
l_py_prep_inj_1524w_&s
l_py_prep_inj_sw_&s
/*PY_PREP_INJECT_MSM*/					/*Cannot model*/
/*N_ART_ADH_15_UP_F*/					/*Not yet modelled*/
/*N_ART_ADH_15_UP_M*/					/*Not yet modelled*/
l_n_vm_&s
/*N_VL_TEST_00_14*/						/*Cannot model*/
l_n_sw_program_visit_&s
/*N_OUTREACH_MSM*/						/*Cannot model*/
/*N_EconEmpowerment*/					/*Not yet modelled*/
/*N_CSE_15_19_F*/						/*Not yet modelled*/
/*N_CSE_15_19_M*/						/*Not yet modelled*/
l_n_hivneg_tests_&s
l_n_hivpos_tests_&s
;
run;
%mend;

%wide(99);


*FLOW;
%macro flow(o=);
data wide_allyears_out_&o; set wide_allyears_&o;
*note that 1991 would refer to the period 1990.5-1991.5;

rename p50_n_birth_&o				= N_BirthAll;
rename p50_n_give_birth_w_hiv_&o	= N_BirthHIV;
rename p50_n_give_birth_on_art_&o	= N_BirthART;
/*rename p50__&o            = N_NewHIV_00_14_C;*/
rename p50_n_new_inf1524m_&o		= N_NewHIV_15_24_M;
rename p50_n_new_inf1524w_&o		= N_NewHIV_15_24_F;
rename p50_n_new_inf2549m_&o		= N_NewHIV_25_49_M;
rename p50_n_new_inf2549w_&o		= N_NewHIV_25_49_F;
rename p50_n_new_inf55plm_&o		= N_NewHIV_50_UP_M;
rename p50_n_new_inf55plw_&o		= N_NewHIV_50_UP_F;
/*rename p50__&o            = N_DeathsHIV_00_14_C;*/
rename p50_n_death_hivrel_m_&o		= N_DeathsHIV_15_UP_M;
rename p50_n_death_hivrel_w_&o		= N_DeathsHIV_15_UP_F;
/*rename p50__&o            = N_DeathsAll_00_14_C;*/
rename p50_n_death_m_&o				= N_DeathsAll_15_UP_M;
rename p50_n_death_w_&o				= N_DeathsAll_15_UP_F;
/*rename p50__&o            = N_YLL_00_14_C;*/
rename p50_yllag_hiv_m_&o			= N_YLL_15_UP_M;
rename p50_yllag_hiv_w_&o			= N_YLL_15_UP_F;
/*rename p50__&o			= N_HIVTest_Facility_NEG_15_UP;*/
/*rename p50__&o			= N_HIVTest_Facility_POS_15_UP;*/
/*rename p50__&o            = N_HIVTest_Index_NEG_15_UP;*/
/*rename p50__&o            = N_HIVTest_Index_POS_15_UP;*/
/*rename p50__&o            = N_HIVTest_Community_NEG_15_UP;*/
/*rename p50__&o            = N_HIVTest_Community_POS_15_UP;*/
rename p50_n_diag_self_test_&o		= N_HIVTest_SelfTest_POS_15_UP;
rename p50_n_self_tests_&o			= N_HIVTest_SelfTest_Dist;
/*rename p50__&o            = N_Condom_Acts;*/
rename p50_n_new_vmmc_&o			= N_NewVMMC;
rename p50_py_prep_oral_1524w_&o	= PY_PREP_ORAL_AGYW;
rename p50_py_prep_oral_sw_&o		= PY_PREP_ORAL_FSW;
/*rename p50__&o            = PY_PREP_ORAL_MSM;*/
rename p50_py_prep_inj_1524w_&o		= PY_PREP_INJECT_AGYW;
rename p50_py_prep_inj_sw_&o		= PY_PREP_INJECT_FSW;
/*rename p50__&o            = PY_PREP_INJECT_MSM;*/
/*rename p50__&o            = N_ART_ADH_15_UP_F;*/
/*rename p50__&o            = N_ART_ADH_15_UP_M;*/
rename p50_n_vm_&o					= N_VL_TEST_15_UP;
/*rename p50__&o            = N_VL_TEST_00_14;*/
rename p50_n_sw_program_visit_&o	= N_OUTREACH_FSW;
/*rename p50__&o            = N_OUTREACH_MSM;*/
/*rename p50__&o            = N_EconEmpowerment;*/
/*rename p50__&o            = N_CSE_15_19_F;*/
/*rename p50__&o            = N_CSE_15_19_M;*/
rename p50_n_hivneg_tests_&o		= N_HIVTest_Total_NEG_15_UP;
rename p50_n_hivpos_tests_&o		= N_HIVTest_Total_POS_15_UP;

rename cald=year;

*** NB WORK OUT HOW TO CHANGE THE ORDER OF VARIABLES HERE ***;
* Add missing rows for child/MSM/omitted variables;
* Change year to column heads;
keep cald
p50_n_birth_&o
p50_n_give_birth_w_hiv_&o
p50_n_give_birth_on_art_&o
/*p50__&o*/
p50_n_new_inf1524m_&o
p50_n_new_inf1524w_&o
p50_n_new_inf2549m_&o
p50_n_new_inf2549w_&o
p50_n_new_inf55plm_&o
p50_n_new_inf55plw_&o
/*p50__&o*/
p50_n_death_hivrel_m_&o
p50_n_death_hivrel_w_&o
/*p50__&o*/
p50_n_death_m_&o
p50_n_death_w_&o
/*p50__&o*/
p50_yllag_hiv_m_&o
p50_yllag_hiv_w_&o
/*p50__&o*/
/*p50__&o*/
/*p50__&o*/
/*p50__&o*/
/*p50__&o*/
/*p50__&o*/
p50_n_diag_self_test_&o
p50_n_self_tests_&o
/*p50__&o*/
p50_n_new_vmmc_&o
p50_py_prep_oral_1524w_&o
p50_py_prep_oral_sw_&o
/*p50__&o*/
p50_py_prep_inj_1524w_&o
p50_py_prep_inj_sw_&o
/*p50__&o*/
/*p50__&o*/
/*p50__&o*/
p50_n_vm_&o
/*p50__&o*/
p50_n_sw_program_visit_&o
/*p50__&o*/
/*p50__&o*/
/*p50__&o*/
/*p50__&o*/
p50_n_hivneg_tests_&o
p50_n_hivpos_tests_&o
;run;
%mend;

%flow(o=99);

proc transpose data = wide_allyears_out_99 out= wide_allyears_out_99_transposed;run;

proc print data=wide_allyears_out_99_transposed; run; 

PROC export data=wide_allyears_out_99_transposed outFILE= "&pth_export_mihpsa_mw\mihpsa_mw_p2_synthesis_19aug24" dbms=xlsx REPLACE;
sheet="flows_minimal";  RUN;

ods html close;
