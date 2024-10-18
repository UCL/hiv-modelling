
***Program to produce graphs using averages across runs
***Use 'include' statement in analysis program to read the code below in;

libname a "C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Phase II\sa_p2_14thAug24"; run;
proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
/*proc freq data=a.l_base_from2023_20240814;table cald sf;run;*/
/*proc freq data=a.l_base_from2023_20240814;table n_init_prep_inj_curr_m;run;*/

* proc freq data=a.l_base_sa_p2_20240814;
* table option;
* run;

* %let pth_export_mihpsa_sa= C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Phase II\sa_p2_14thAug24\Excel outputs;run;

data b;
set a.l_base_sa_p2_20240814;

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

proc sort data=b; by option cald run ;run;
proc freq; table cald;run;
proc freq data=b;table option cald run;run;
*run_forward_id has not been saved;

*At the moment is the median across all runs by option;
*Note that different options have a different number of runs;
data b;set b;count_csim+1;by option cald ;if first.cald then count_csim=1;run;***counts the number of runs;
 ***number of runs - this is manually inputted in nfit in the macros below;
proc means max data=b;var count_csim cald;run;*124;


%let year_start = 1990;
%let year_end = 2072.75;
run;
/*proc freq data=b;table cald;run;*/
proc sort;by cald option ;run;

*INCLUDE ONLY STOCK VARIABLE AND VARIABLES THAT WE WANT TO GRAPH;
%let var =  
n_alive n_alive_m n_alive_w n_alive_1014m n_alive_1524m n_alive_1524w n_alive_2549m n_alive_2549w n_alive0_
n_alive_014_ 	n_alive_1524_	 n_alive_2564_		n_alive_65pl									
n_sw_1564_	prev_sti_sw /*n_sw_inprog_ly  n_sw_inprog_ever*/
n_hivneg_sdpartner n_hivneg_sdpartneroffart n_hivnegw_sdpartner n_hivnegw_sdpartneroffart
n_not_on_art_cd40200_ n_not_on_art_cd4050_ n_not_on_art_cd450200_ n_not_on_art_cd4200350_ n_not_on_art_cd4350500_ n_not_on_art_cd4ge500_ 
n_asympt_Undiag n_asympt_diagoffart n_asympt_diagonart n_sympt_notaids n_sympt_aids
n_birth n_give_birth_w_hiv p_w_giv_birth_this_per n_w1524_newp_ge1_ p_newp_ge1_ p_newp_ge5_ p_1524_newp_ge1_ p_ep p_m_npge1_ p_w_npge1_ p_w1524_npge1_ p_sw_npge1_
log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w n_pmtct
p_mcirc_1014m	p_mcirc_1549m	p_mcirc_1049m	n_new_vmmc1549m 	n_new_vmmc1049m  n_new_vmmc1014m	n_new_birth_circ n_new_mcirc n_new_mcirc_1549m 	n_new_mcirc_1049m
p_vmmc_1014m	p_vmmc_1549m	p_vmmc_1049m
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  p_w1524newpge1_onprep prop_1564_onprep 	
n_prep				n_prep_ever		p_prep_ever
n_prep_oral			n_prep_inj
n_prep_oral_w		n_prep_oral_m	
n_prep_inj_w		n_prep_inj_m		
n_prep_vr_w
n_prep_w			n_prep_m
n_init_prep_oral_1524w	n_init_prep_oral_sw		n_init_prep_oral_sdc	n_init_prep_oral_plw
n_init_prep_inj_1524w	n_init_prep_inj_sw		n_init_prep_inj_sdc		n_init_prep_inj_plw
n_init_prep_vr_1524w	n_init_prep_vr_sw		n_init_prep_vr_sdc		n_init_prep_vr_plw
n_prep_oral_1524w 		n_prep_oral_sw		n_prep_oral_sdc		n_prep_oral_plw
n_prep_inj_1524w		n_prep_inj_sw		n_prep_inj_sdc		n_prep_inj_plw
n_prep_vr_1524w			n_prep_vr_sw		n_prep_vr_sdc		n_prep_vr_plw
n_contprep_oral_1524w	n_contprep_oral_sw	n_contprep_oral_sdc	n_contprep_oral_plw	
n_contprep_inj_1524w	n_contprep_inj_sw 	n_contprep_inj_sdc	n_contprep_inj_plw	
n_contprep_vr_1524w 	n_contprep_vr_sw	n_contprep_vr_sdc	n_contprep_vr_plw	
n_init_prep_oral_first_w	n_init_prep_oral_first_m	n_init_prep_oral_curr_w		n_init_prep_oral_curr_m
n_init_prep_inj_first_w		n_init_prep_inj_first_m		n_init_prep_inj_curr_w		n_init_prep_inj_curr_m
n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w n_hiv_sw
prevalence1549m prevalence1549w
prevalence1549_ prevalence_sw prevalence_hiv_preg prevalence1549preg prevalence1524preg 
prevalence_ge15m prevalence_ge15w prevalence_vg1000_  
incidence1549_ incidence1549m incidence1549w incidence1564_ 
incidence1524w incidence1524m incidence2534w incidence2534m incidence3544w incidence3544m incidence4554w incidence4554m 
incidence5564w incidence5564m incidence_sw 
incidence_sd1564_ incidence_sd1564w incidence_onprep incidence_notonprep test_prop_positive
n_new_inf1549_ n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w
n_tested n_tested_m n_tested_w n_tested_sw n_tested_anc 
n_tested_m_sympt n_tested_w_sympt n_tested_m_circ n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd
n_tested1st_anc n_tested1st_labdel n_tested1st_pd n_tested_anc_prevdiag
n_sbcc_visit_1524m 	n_sbcc_visit_1524w n_sbcc_visit_1524_	n_sbcc_visit_2564_ n_sbcc_visit_1564_
n_tested_sbcc_1524m n_tested_sbcc_1524w n_tested_sbcc_2564_ n_tested_sbcc
n_self_tests /*n_tested_self_test*/ n_diag_self_test
n_hivpos_tests n_hivneg_tests n_hivpos_tests_sympt n_hivneg_tests_sympt
p_tested_sbcc_1524m p_tested_sbcc_1524w p_tested_sbcc_2564_ p_pos_tested_sbcc
p_anc n_diagnosed n_diag_anc n_diag_labdel n_diag_pd
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w			p_diag_m1524_ 		p_diag_w1524_	p_diag_sw	
n_cm n_vm n_vm_w n_vm_m p_vm_ly_onart n_pcp_p
p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m p_onart_diag_sw	p_onart_diag_w1524_ p_onart_diag_1524_  
p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_onart_vl1000_1524_ p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart p_onart_m 	p_onart_w  p_onart_w1524_ p_onart_1524_ p_onart_sw
p_onart_artexp 	p_onart_artexp_m 	p_onart_artexp_w 	p_onart_artexp_1524_ 	p_onart_artexp_sw 	p_on_artexp_w1524evpreg
p_onart_gt6m_vl1000_w  p_onart_gt6m_vl1000_m  p_onart_vl1000_w  p_onart_vl1000_m  
p_onart_vl1000_w1524evpr logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart 		n_onart_m	n_onart_w n_onart_1524_ n_art_start_y
n_total_yllag 	n_dyll_GBD
n_breastfeeding		n_plw
n_receive_u_u			n_diag_receive_u_u
n_attend_mens_clinic	n_hiv_mens_clinic		n_onart_mens_clinic
p_onart_mens_clinic		p_onart_no_mens_clinic	p_onart_diag_mens_clinic
n_hiv_peer_navigator_w	n_hiv_peer_navigator_m	n_hiv_peer_navigator
n_onart_peer_navigator	p_onart_peer_navigator	p_onart_no_peer_navigator	p_onart_diag_peer_navigator

;
*n_diag_thisper_sympt;
run;

/*
*June 2023;
*Create means across simulations starting from the same dataset;
*For MIHPSA we disucssed and decided this is not needed;
data option_0;set b;keep cald run option count_csim n_alive;if option=0;run;
proc transpose data=option_0 out=a0_1 prefix=n_alive;var n_alive; by cald; id count_csim;run;
data a0_1;set a0_1;***creates one dataset per variable;
m_n_alive_0  = mean(of n_alive1-n_alive8);
keep cald m_n_alive_0;
run;
run;
%macro mean_samedat(s);
data option_&s;set b;
if option=&s;
%end;
%mend;
*/
/*
proc transpose data=option_0 out=g0_1 prefix=&varb;var n_alive; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g0_1;set g9_1;***creates one dataset per variable;
p5_n_alive_0  = PCTL(5,of n_alive1-n_alive155);
p95_n_alive_0 = PCTL(95,of n_alive1-n_alive155);
p50_n_alive_0 = median(of n_alive1-n_alive155);
keep cald p5_n_alive_0 p95_n_alive_0 p50_n_alive_0 ;
run;
*/
*I created one single macro;
***transpose given name; *starts with %macro and ends with %mend;
%macro option_(s);
data option_&s;set b;
if option=&s;
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

%let nfit=260;

%option_(0);
%option_(1);

/*
%option_(2);
%option_(3);
%option_(4);
%option_(5);
%option_(6);
%option_(7);
%option_(8);
%option_(9);
%option_(10);
%option_(11);
%option_(12);
%option_(13);
*/


/*

* Import SA population size projection from spreadsheet;
* Source: https://databank.worldbank.org/source/population-estimates-and-projections#;
proc import
datafile="C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Calibration data\P_Data_Extract_From_Population_estimates_and_projections_SA.xlsx"
out=work.pop_size_obs_sa
dbms=xlsx
replace;
sheet="Totals";
*range="Total$A1:D68";
run;

* Import SA PrEP data from spreadsheet;
* Source: Phase II SA spreadsheet from Edinah;
proc import
datafile="C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Calibration data\SA Phase II Oral PrEP data_19thOct23.xlsx"
out=work.prep_obs_sa
dbms=xlsx
replace;
sheet="Export";
run;
* set prep_new_agyw_obs_sa to missing for 2016 and 2017 (had to change to 0 in spreadsheet to avoid importing error) in merge statement below;

* Import SA PLWHIV data from spreadsheet;
* Source: AIDSinfo;
proc import
datafile="C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Calibration data\People living with HIV_National_South Africa.xlsx"
out=work.plwhiv_obs_sa
dbms=xlsx
replace;
sheet="Export";
run;

* Import HIV incidence estimates from spreadsheet;
* Source: HSRC surveys (SABSSM);
proc import
datafile="C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Calibration data\SABSSM HIV incidence.xlsx"
out=work.inc_obs_sa
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
g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90  g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99  g0_100 
g0_101 g0_102 g0_103 g0_104 g0_105 g0_106 g0_107 g0_108 g0_109 g0_110 g0_111 g0_112 g0_113 g0_114 g0_115 g0_116 g0_117 g0_118 g0_119 g0_120 
g0_121 g0_122 g0_123 g0_124 g0_125 g0_126 g0_127 g0_128 g0_129 g0_130 g0_131 g0_132 g0_133 g0_134 g0_135 g0_136 g0_137 g0_138 g0_139 g0_140 
g0_141 g0_142 g0_143 g0_144 g0_145 g0_146 g0_147 g0_148 g0_149 g0_150 g0_151 g0_152 g0_153 g0_154 g0_155 g0_156 g0_157 g0_158 g0_159 g0_160 
g0_161 g0_162 g0_163 g0_164 g0_165 g0_166 g0_167 g0_168 g0_169 g0_170 g0_171 g0_172 g0_173 g0_174 g0_175 g0_176 g0_177 g0_178 g0_179 g0_180 
g0_181 g0_182 g0_183 g0_184 g0_185 g0_186 g0_187 g0_188 g0_189 g0_190 g0_191 g0_192 g0_193 g0_194 g0_195 g0_196 g0_197 g0_198 g0_199 g0_200 
g0_201 g0_202 g0_203 g0_204 g0_205 g0_206 g0_207 g0_208 g0_209 g0_210 g0_211 g0_212 g0_213 g0_214 g0_215 g0_216 g0_217 g0_218 g0_219 g0_220 
g0_221 g0_222 g0_223 g0_224 g0_225 g0_226 g0_227 g0_228 g0_229 g0_230 g0_231 g0_232 g0_233 g0_234 g0_235 g0_236 g0_237 g0_238 g0_239 g0_240 
g0_241 g0_242 g0_243 g0_244 g0_245 g0_246 g0_247 g0_248 g0_249 g0_250 g0_251 g0_252 g0_253 g0_254 g0_255 g0_256 g0_257 g0_258 g0_259 g0_260
g0_261 g0_262 g0_263 g0_264 g0_265 g0_266 g0_267 g0_268 g0_269 g0_270 g0_271 g0_272 g0_273 g0_274 g0_275 g0_276 g0_277 g0_278 g0_279 g0_280
g0_281 g0_282 g0_283 g0_284 g0_285 g0_286 g0_287 g0_288 g0_289 g0_290 g0_291 g0_292 g0_293 /*g0_294 g0_295 g0_296*/

g1_1   g1_2   g1_3   g1_4   g1_5   g1_6   g1_7   g1_8   g1_9   g1_10  g1_11  g1_12  g1_13  g1_14  g1_15  g1_16  g1_17  g1_18  g1_19  g1_20  
g1_21  g1_22  g1_23  g1_24  g1_25  g1_26  g1_27  g1_28  g1_29  g1_30  g1_31  g1_32  g1_33  g1_34  g1_35  g1_36  g1_37  g1_38  g1_39  g1_40  
g1_41  g1_42  g1_43  g1_44  g1_45  g1_46  g1_47  g1_48  g1_49  g1_50  g1_51  g1_52  g1_53  g1_54  g1_55  g1_56  g1_57  g1_58  g1_59  g1_60 
g1_61  g1_62  g1_63  g1_64  g1_65  g1_66  g1_67  g1_68  g1_69  g1_70  g1_71  g1_72  g1_73  g1_74  g1_75  g1_76  g1_77  g1_78  g1_79  g1_80  
g1_81  g1_82  g1_83  g1_84  g1_85  g1_86  g1_87  g1_88  g1_89  g1_90  g1_91  g1_92  g1_93  g1_94  g1_95  g1_96  g1_97  g1_98  g1_99  g1_100 
g1_101 g1_102 g1_103 g1_104 g1_105 g1_106 g1_107 g1_108 g1_109 g1_110 g1_111 g1_112 g1_113 g1_114 g1_115 g1_116 g1_117 g1_118 g1_119 g1_120 
g1_121 g1_122 g1_123 g1_124 g1_125 g1_126 g1_127 g1_128 g1_129 g1_130 g1_131 g1_132 g1_133 g1_134 g1_135 g1_136 g1_137 g1_138 g1_139 g1_140 
g1_141 g1_142 g1_143 g1_144 g1_145 g1_146 g1_147 g1_148 g1_149 g1_150 g1_151 g1_152 g1_153 g1_154 g1_155 g1_156 g1_157 g1_158 g1_159 g1_160 
g1_161 g1_162 g1_163 g1_164 g1_165 g1_166 g1_167 g1_168 g1_169 g1_170 g1_171 g1_172 g1_173 g1_174 g1_175 g1_176 g1_177 g1_178 g1_179 g1_180 
g1_181 g1_182 g1_183 g1_184 g1_185 g1_186 g1_187 g1_188 g1_189 g1_190 g1_191 g1_192 g1_193 g1_194 g1_195 g1_196 g1_197 g1_198 g1_199 g1_200 
g1_201 g1_202 g1_203 g1_204 g1_205 g1_206 g1_207 g1_208 g1_209 g1_210 g1_211 g1_212 g1_213 g1_214 g1_215 g1_216 g1_217 g1_218 g1_219 g1_220 
g1_221 g1_222 g1_223 g1_224 g1_225 g1_226 g1_227 g1_228 g1_229 g1_230 g1_231 g1_232 g1_233 g1_234 g1_235 g1_236 g1_237 g1_238 g1_239 g1_240 
g1_241 g1_242 g1_243 g1_244 g1_245 g1_246 g1_247 g1_248 g1_249 g1_250 g1_251 g1_252 g1_253 g1_254 g1_255 g1_256 g1_257 g1_258 g1_259 g1_260
g1_261 g1_262 g1_263 g1_264 g1_265 g1_266 g1_267 g1_268 g1_269 g1_270 g1_271 g1_272 g1_273 g1_274 g1_275 g1_276 g1_277 g1_278 g1_279 g1_280
g1_281 g1_282 g1_283 g1_284 g1_285 g1_286 g1_287 g1_288 g1_289 g1_290 g1_291 g1_292 g1_293 /*g1_294 g1_295 g1_296*/
;
by cald;run;



data d; * this is number of variables in %let var = above ;
set d_a;
* merge d_a d_b d_c d_d d_e d_f d_g
/*Imported observational data*/
pop_size_obs_sa
prep_obs_sa
plwhiv_obs_sa
inc_obs_sa
;
* by cald;

* OBSERVATIONAL DATA;
* From HIVCalibrationData spreadsheet;

* HIV prevalence;
if cald=2005 then do; prev_w_obs_sa = 0.202 ; prev_se_w_obs_sa = 0.009956 ; prev_m_obs_sa = 0.117 ; prev_se_m_obs_sa = 0.00918 ; prev_obs_sa = 0.162 ; prev_se_obs_sa = 0.007122 ; end;
if cald=2008 then do; prev_obs_sa = 0.169 ; prev_se_obs_sa = 0.007396 ; end;
if cald=2012 then do; prev_w_obs_sa = 0.232 ; prev_se_w_obs_sa = 0.009711 ; prev_m_obs_sa = 0.145 ; prev_se_m_obs_sa = 0.00894 ; prev_obs_sa = 0.188 ; prev_se_obs_sa = 0.007125 ; end;
if cald=2016 then do; prev_w_obs_sa = 0.277 ; prev_se_w_obs_sa = 0.012828 ; prev_m_obs_sa = 0.144 ; prev_se_m_obs_sa = 0.014536 ; prev_obs_sa = 0.212 ; prev_se_obs_sa = 0.010229 ; end;
if cald=2017 then do; prev_w_obs_sa = 0.263 ; prev_se_w_obs_sa = 0.009439 ; prev_m_obs_sa = 0.148 ; prev_se_m_obs_sa = 0.008145 ; prev_obs_sa = 0.206 ; prev_se_obs_sa = 0.007152 ; end;
prev_95lo_obs_sa = prev_obs_sa - 1.96*prev_se_obs_sa;
prev_95hi_obs_sa = prev_obs_sa + 1.96*prev_se_obs_sa;
prev_95lo_w_obs_sa = prev_w_obs_sa - 1.96*prev_se_w_obs_sa;
prev_95hi_w_obs_sa = prev_w_obs_sa + 1.96*prev_se_w_obs_sa;
prev_95lo_m_obs_sa = prev_m_obs_sa - 1.96*prev_se_m_obs_sa;
prev_95hi_m_obs_sa = prev_m_obs_sa + 1.96*prev_se_m_obs_sa;

* Number on ART;
if cald = 2012 then n_onart_obs_sa = 2200000  ;
if cald = 2013 then n_onart_obs_sa = 2660000  ;
if cald = 2014 then n_onart_obs_sa = 3080000  ;
if cald = 2015 then n_onart_obs_sa = 3430000  ;
if cald = 2016 then n_onart_obs_sa = 3770000  ;
if cald = 2017 then n_onart_obs_sa = 4250000  ;
if cald = 2018 then n_onart_obs_sa = 4630000  ;
if cald = 2019 then n_onart_obs_sa = 5060000  ;
if cald = 2020 then n_onart_obs_sa = 5330000  ;

	* these data are less reliable;
if cald=2004 then n_onart_obs_sa_pre2012 = 45500 ;
if cald=2005 then n_onart_obs_sa_pre2012 = 103300 ;
if cald=2006 then n_onart_obs_sa_pre2012 = 199000 ;
if cald=2007 then n_onart_obs_sa_pre2012 = 366000 ;
if cald=2008 then n_onart_obs_sa_pre2012 = 583000 ;
if cald=2009 then n_onart_obs_sa_pre2012 = 869000 ;
if cald=2010 then n_onart_obs_sa_pre2012 = 1238000 ;
if cald=2011 then n_onart_obs_sa_pre2012 = 1717000 ;

* Proportion on ART (adults 15+);
if cald = 2012 then do; 
	prop_onart_m_obs_sa = 0.242 ; 
	prop_onart_se_m_obs_sa = 0.025501 ;
	prop_onart_w_obs_sa = 0.342 ; 
	prop_onart_se_w_obs_sa = 0.01739 ;
end;
if cald = 2017 then do; 
	prop_onart_m_obs_sa = 0.580 ; 
	prop_onart_se_m_obs_sa = 0.022000 ; 
	prop_onart_w_obs_sa = 0.667 ; 
	prop_onart_se_w_obs_sa = 0.012508 ; 
end;
prop_onart_95lo_m_obs_sa = prop_onart_m_obs_sa - 1.96*prop_onart_se_m_obs_sa ; 
prop_onart_95hi_m_obs_sa = prop_onart_m_obs_sa + 1.96*prop_onart_se_m_obs_sa ;
prop_onart_95lo_w_obs_sa = prop_onart_w_obs_sa - 1.96*prop_onart_se_w_obs_sa ; 
prop_onart_95hi_w_obs_sa = prop_onart_w_obs_sa + 1.96*prop_onart_se_w_obs_sa ;

* Viral suppression;
	* % virally suppressed at <400 copies/ml 6 months after ART initiation;
if cald=2005 then prop_vlsupp_lt400_obs_sa = 0.833 ;
if cald=2006 then prop_vlsupp_lt400_obs_sa = 0.866 ;
if cald=2007 then prop_vlsupp_lt400_obs_sa = 0.843 ;
if cald=2008 then prop_vlsupp_lt400_obs_sa = 0.864 ;
if cald=2009 then prop_vlsupp_lt400_obs_sa = 0.856 ;
if cald=2010 then prop_vlsupp_lt400_obs_sa = 0.832 ;
if cald=2011 then prop_vlsupp_lt400_obs_sa = 0.791 ;
if cald=2012 then prop_vlsupp_lt400_obs_sa = 0.816 ;
if cald=2013 then prop_vlsupp_lt400_obs_sa = 0.809 ;
if cald=2014 then prop_vlsupp_lt400_obs_sa = 0.833 ;
if cald=2018 then prop_vlsupp_lt400_obs_sa = 0.892 ;
if cald=2019 then prop_vlsupp_lt400_obs_sa = 0.896 ;
if cald=2020 then prop_vlsupp_lt400_obs_sa = 0.879 ;

* VMMC;
if cald=2002 then prop_mcirc_gt15_obs_sa = 0.380 ;
if cald=2008 then prop_mcirc_gt15_obs_sa = 0.406 ;
if cald=2012 then prop_mcirc_gt15_obs_sa = 0.464 ;
if cald=2017 then prop_mcirc_gt15_obs_sa = 0.616 ;

if cald=2009 then num_vmmc_obs_sa = 5190 ;	* not currently outputted;
if cald=2010 then num_vmmc_obs_sa = 9168 ;
if cald=2011 then num_vmmc_obs_sa = 131117 ;
if cald=2012 then num_vmmc_obs_sa = 347973 ;
if cald=2013 then num_vmmc_obs_sa = 422262 ;
if cald=2014 then num_vmmc_obs_sa = 331668 ;
if cald=2015 then num_vmmc_obs_sa = 508404 ;
if cald=2016 then num_vmmc_obs_sa = 518130 ;
if cald=2017 then num_vmmc_obs_sa = 446678 ;
if cald=2018 then num_vmmc_obs_sa = 540327 ;
if cald=2019 then num_vmmc_obs_sa = 595006 ;
if cald=2020 then num_vmmc_obs_sa = 417138 ;

* Number tested;
if cald=2003 then n_tested_obs_sa = 691000 ;
if cald=2005 then n_tested_obs_sa = 951476 ;
if cald=2006 then n_tested_obs_sa = 1376582 ;
if cald=2007 then n_tested_obs_sa = 1610755 ;
if cald=2008 then n_tested_obs_sa = 1923430 ;
if cald=2009 then n_tested_obs_sa = 2591441 ;
if cald=2010 then n_tested_obs_sa = 6770000 ;
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

* Positivity rate;
if cald=2005 then prop_test_pos_obs_sa = 0.356 ;	* not currently outputted;
if cald=2006 then prop_test_pos_obs_sa = 0.349 ;
if cald=2007 then prop_test_pos_obs_sa = 0.318 ;
if cald=2008 then prop_test_pos_obs_sa = 0.301 ;
if cald=2009 then prop_test_pos_obs_sa = 0.284 ;
if cald=2011 then prop_test_pos_obs_sa = 0.162 ;
if cald=2013 then prop_test_pos_obs_sa = 0.149 ;
if cald=2016 then prop_test_pos_obs_sa = 0.094 ;
if cald=2017 then prop_test_pos_obs_sa = 0.084 ;
if cald=2018 then prop_test_pos_obs_sa = 0.075 ;
if cald=2019 then prop_test_pos_obs_sa = 0.064 ;
if cald=2020 then prop_test_pos_obs_sa = 0.051 ;

* Proportion tested and 90-90-90;
* Source: DHS (2016) https://dhsprogram.com/publications/publication-fr337-dhs-final-reports.cfm ;
if cald=2017 then do;
	prop_test_last_1y_1549_w_obs_sa = 0.59;	* Tested and received results;
	prop_test_last_1y_1549_m_obs_sa = 0.45;
end;
* Source: SABSSM V (2017) https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9265818/ ;
if cald=2017 then do;
	p_diag_obs_sa = 0.849; 				p_diag_95lo_obs_sa = 0.817; 			p_diag_95hi_obs_sa = 0.877; 
	p_diag_w_obs_sa = 0.889; 			p_diag_95lo_w_obs_sa = 0.859; 			p_diag_95hi_w_obs_sa = 0.914; 
	p_diag_m_obs_sa = 0.780; 			p_diag_95lo_m_obs_sa = 0.721; 			p_diag_95hi_m_obs_sa = 0.829; 
	p_onart_diag_obs_sa = 0.706; 		p_onart_diag_95lo_obs_sa = 0.674; 		p_onart_diag_95hi_obs_sa = 0.736; 
	p_onart_diag_w_obs_sa = 0.720; 		p_onart_diag_95lo_w_obs_sa = 0.688; 	p_onart_diag_95hi_w_obs_sa = 0.753; 
	p_onart_diag_m_obs_sa = 0.674; 		p_onart_diag_95lo_m_obs_sa = 0.619; 	p_onart_diag_95hi_m_obs_sa = 0.724; 
	p_vlsupp_onart_obs_sa = 0.875; 		p_vlsupp_onart_95lo_obs_sa = 0.875; 	p_vlsupp_onart_95hi_obs_sa = 0.875; 		
	p_vlsupp_onart_w_obs_sa = 0.899; 	p_vlsupp_onart_w_95lo_obs_sa = 0.871; 	p_vlsupp_onart_w_95hi_obs_sa = 0.922; 		
	p_vlsupp_onart_m_obs_sa = 0.821; 	p_vlsupp_onart_m_95lo_obs_sa = 0.765; 	p_vlsupp_onart_m_95hi_obs_sa = 0.866; 		
	prop_test_last_1y_obs_sa = 0.668; 	prop_test_last_1y_95lo_obs_sa = 0.654; 	prop_test_last_1y_95hi_obs_sa = 0.682; 
end;

* Number of deaths;
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

* Population size;
* merged pop_size_obs_sa into d;

* Oral PrEP;
* merged prep_obs_sa into d;
prep_new_obs_sa=prep_new_w_obs_sa+prep_new_m_obs_sa;
if cald=2016 or cald=2017 then prep_new_agyw_obs_sa=. ;

* PLWHIV;
* merged plwhiv_obs_sa into d;

* Incidence estimates;
* merged inc_obs_sa into d;

run;

data a.d;set d;run;
/*data d;set a.d;run;*/
/*proc freq data=d;table cald;run;*/
/*proc contents data=d; run;*/





***************************************************;
****** OUTPUTS STILL TO ADD TO HIV SYNTHESIS ******;
***************************************************;

*Add to code:
U = U messaging						N_UEU_M15+ 			Number of male adults 15+ years old recipients of U=U messaging 
Community-based peer navigators 	N_CBPeerNav_F15+	Number of adult females 15+  living with HIV assisted by Community peer navigators to remain in care
									N_CBPeerNav_M15+	Number ofadult males 15+ living with HIV assisted by Community peer navigators to link to to remain in care
;
* Also note that SA request means not medians (think we have given meadians);






*************************************;
****** GRPAHS - MIHPSA OUTPUTS ******;
*************************************;

	*Option 0 is SQ;
	*Option 1 is SQ + 	Dapivirine ring for adolescent girls and young women 15 to 24 years (AGYW) [Zim O19];
	*Option 2 is SQ + 	Oral PrEP for pregnant and breastfeeding women [Zim O18];
	*Option 3 is SQ + 	Injectable PrEP for AGYW [Zim O23];
	*Option 4 is SQ + 	Injectable PrEP switching 30% from oral PrEP to Injectible long acting PrEP [[Zim O0 + change eff_date_prep_inj_intro];
	*Option 5 is SQ + 	U = U messaging [new for SA];
	*Option 6 is SQ + 	Self-test distribution in health facilities [Zim O2];
	*Option 7 is SQ + 	Self-test distribution to partners of HIV-positive individuals [Zim O4];
	*Option 8 is SQ + 	Establishment of mens health clinics [Zim O13];
	*Option 9 is SQ + 	VMMC for males aged 10-14 [coded but not in Zim MIHPSA];
	*Option 10 is SQ + 	VMMC for males aged 15+ [Zim O14];
	*Option 11 is SQ + 	Community-based peer navigators to support ART linkage & retention [new for SA];
	*Option 12 is SQ + 	Point-of-care viral load testing [coded but not in Zim MIHPSA];
	*Option 13 is SQ + 	Condom distribution - condom scale up [use CMMC?];


ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
* ods rtf file = 'C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\sa_mihpsa_p2_14thAug24\MIHPSA outputs.doc' startpage=never; 
* ods rtf file = 'C:\Users\w3sth\UCL Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\mihpsa_sa\Phase II\sa_p2_14thAug24\mihpsa_outputs.doc' startpage=never;

/*
*Incidence - all options;
proc means data=d; var
	p50_incidence1549__0	p50_incidence1549__1	p50_incidence1549__2	p50_incidence1549__3	p50_incidence1549__4	
	p50_incidence1549__5	p50_incidence1549__6	p50_incidence1549__7	p50_incidence1549__8	p50_incidence1549__9
	p50_incidence1549__10	p50_incidence1549__11	p50_incidence1549__12
	;
	where cald=2050;
run;
*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence - all options (median, age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo";
label p50_incidence1549__1 = "1. SQ + DPV ring for AGYW";
label p50_incidence1549__2 = "2. SQ + oral PrEP for PLQ";
label p50_incidence1549__3 = "3. SQ + CAB-LA for AGYW";
label p50_incidence1549__4 = "4. SQ w/ 30% switch to CAB-LA";
/*label p50_incidence1549__5 = "5. SQ + U=U messaging";*/
label p50_incidence1549__6 = "6. SQ + self test in health facilities";
label p50_incidence1549__7 = "7. SQ + self test for partners";
label p50_incidence1549__8 = "8. SQ + mens clinics";
label p50_incidence1549__9 = "9. SQ + VMMC for 10-14y";
label p50_incidence1549__10 = "10. SQ + VMMC for 15-49y";

series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__2/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__3/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__4/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1549__4 	upper=p95_incidence1549__4  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence1549__5/	lineattrs = (color=darkred thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__5 	upper=p95_incidence1549__5  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=p50_incidence1549__6/	lineattrs = (color=grey thickness = 2);
band    x=cald lower=p5_incidence1549__6 	upper=p95_incidence1549__6  / transparency=0.9 fillattrs = (color=grey) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__7/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_incidence1549__7 	upper=p95_incidence1549__7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__8/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_incidence1549__8 	upper=p95_incidence1549__8  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__9/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_incidence1549__9 	upper=p95_incidence1549__9  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__10/	lineattrs = (color=yellow thickness = 2);
band    x=cald lower=p5_incidence1549__10 	upper=p95_incidence1549__10  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run; quit;


*Prevalence - all options;
proc means data=d; var
	p50_prevalence1549__0	p50_prevalence1549__1	p50_prevalence1549__2	p50_prevalence1549__3	p50_prevalence1549__4	
	p50_prevalence1549__5	p50_prevalence1549__6	p50_prevalence1549__7	p50_prevalence1549__8	p50_prevalence1549__9	
	p50_prevalence1549__10	p50_prevalence1549__11	p50_prevalence1549__12
	;
	where cald=2050;
run;

proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence - all options (median, age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.25 by 0.05) valueattrs=(size=10);
label p50_prevalence1549__0 = "Status quo";
label p50_prevalence1549__1 = "1. SQ + DPV ring for AGYW";
label p50_prevalence1549__2 = "2. SQ + oral PrEP for PLQ";
label p50_prevalence1549__3 = "3. SQ + CAB-LA for AGYW";
label p50_prevalence1549__4 = "4. SQ w/ 30% switch to CAB-LA";
/*label p50_prevalence1549__5 = "5. SQ + U=U messaging";*/
label p50_prevalence1549__6 = "6. SQ + self test in health facilities";
label p50_prevalence1549__7 = "7. SQ + self test for partners";
label p50_prevalence1549__8 = "8. SQ + mens clinics";
label p50_prevalence1549__9 = "9. SQ + VMMC for 10-14y";
label p50_prevalence1549__10 = "10. SQ + VMMC for 15-49y";

series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__2/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549__2 	upper=p95_prevalence1549__2  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__3/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prevalence1549__3 	upper=p95_prevalence1549__3  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__4/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1549__4 	upper=p95_prevalence1549__4  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prevalence1549__5/	lineattrs = (color=darkred thickness = 2);*/
/*band    x=cald lower=p5_prevalence1549__5 	upper=p95_prevalence1549__5  / transparency=0.9 fillattrs = (color=darkred) legendlabel= "Model 90% range";*/
series  x=cald y=p50_prevalence1549__6/	lineattrs = (color=grey thickness = 2);
band    x=cald lower=p5_prevalence1549__6 	upper=p95_prevalence1549__6  / transparency=0.9 fillattrs = (color=grey) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__7/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_prevalence1549__7 	upper=p95_prevalence1549__7  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__8/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_prevalence1549__8 	upper=p95_prevalence1549__8  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__9/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549__9 	upper=p95_prevalence1549__9  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__10/	lineattrs = (color=yellow thickness = 2);
band    x=cald lower=p5_prevalence1549__10 	upper=p95_prevalence1549__10  / transparency=0.9 fillattrs = (color=yellow) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run; quit;





*****************************************;
****** OPTION 1: DPV RING FOR AGYW ******;
*****************************************;

*AGYW on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 1 - Number of AGYW on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 800000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_oral_1524w_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_1524w_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_vr_1524w_0 = "SQ - VR PrEP(median) ";
label p50_n_prep_oral_1524w_1 = "Option 1 - oral PrEP (median) ";
label p50_n_prep_inj_1524w_1 = "Option 1 - injectable PrEP (median) ";
label p50_n_prep_vr_1524w_1 = "Option 1 - VR PrEP (median) ";
series  x=cald y=p50_n_prep_oral_1524w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_1524w_0 	upper=p95_n_prep_oral_1524w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_1524w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_1524w_0 	upper=p95_n_prep_inj_1524w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_1524w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_1524w_0 	upper=p95_n_prep_vr_1524w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_1524w_1/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_1524w_1 	upper=p95_n_prep_oral_1524w_1  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_1524w_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_1524w_1 	upper=p95_n_prep_inj_1524w_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_1524w_1/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_vr_1524w_1 	upper=p95_n_prep_vr_1524w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;
proc means data=d; var p50_n_prep_vr_w_1 p50_n_prep_vr_1524w_1 p50_n_alive_1524w_1; where cald=2030; run;	
* 165567 AGYW on DPV PrEP, 5388833 AGYW = ~3.1% coverage (aiming for 15%) ;
* Coverage too low, also oral PrEP increases among older women (suspect those who have stopped DPV ring);

*All adults on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 1 - Number of people on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 800000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_oral_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_vr_w_0 = "SQ - VR PrEP(median) ";
label p50_n_prep_oral_1 = "Option 1 - oral PrEP (median) ";
label p50_n_prep_inj_1 = "Option 1 - injectable PrEP (median) ";
label p50_n_prep_vr_w_1 = "Option 1 - VR PrEP(median) ";
series  x=cald y=p50_n_prep_oral_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_0 	upper=p95_n_prep_oral_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_0 	upper=p95_n_prep_vr_w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_1/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_1 	upper=p95_n_prep_oral_1  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_1 	upper=p95_n_prep_inj_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_1/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_1 	upper=p95_n_prep_vr_w_1  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;

*Men on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 1 - Number of men on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 800000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_oral_m_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_m_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_oral_m_1 = "Option 1 - oral PrEP (median) ";
label p50_n_prep_inj_m_1 = "Option 1 - injectable PrEP (median) ";
series  x=cald y=p50_n_prep_oral_m_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_m_0 	upper=p95_n_prep_oral_m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_m_0 	upper=p95_n_prep_inj_m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_m_1/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_m_1 	upper=p95_n_prep_oral_m_1  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_m_1/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_m_1 	upper=p95_n_prep_inj_m_1  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
run;quit;
*Oral PrEP use among men same between SQ and O1;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O1: DPV for AGYW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__1 = "Option 1  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* Incidence is slightly lower, if anything;

*Incidence among AGYW;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence among AGYW (15-24) - SQ vs O1: DPV for AGYW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1524w_0 = "SQ (median) ";
label p50_incidence1524w_1 = "Option 1  (median) ";
series  x=cald y=p50_incidence1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1524w_0 	upper=p95_incidence1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1524w_1 	upper=p95_incidence1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* Hard to see a difference in incidence;





*****************************************;
****** OPTION 2: ORAL PREP FOR PLW ******;
*****************************************;

*PLW on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 1 - Number of PLW on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 800000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_oral_plw_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_plw_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_vr_plw_0 = "SQ - VR PrEP(median) ";
label p50_n_prep_oral_plw_2 = "Option 2 - oral PrEP (median) ";
label p50_n_prep_inj_plw_2 = "Option 2 - injectable PrEP (median) ";
label p50_n_prep_vr_plw_2 = "Option 2 - VR PrEP (median) ";
series  x=cald y=p50_n_prep_oral_plw_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_plw_0 	upper=p95_n_prep_oral_plw_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_plw_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_plw_0 	upper=p95_n_prep_inj_plw_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_plw_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_plw_0 	upper=p95_n_prep_vr_plw_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_plw_2/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_plw_2 	upper=p95_n_prep_oral_plw_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_plw_2/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_plw_2 	upper=p95_n_prep_inj_plw_2  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_plw_2/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_vr_plw_2 	upper=p95_n_prep_vr_plw_2  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;
proc means data=d; var p50_n_prep_oral_plw_2 p50_n_plw_2; where cald=2030; run;	
* 99326 PLW on oral PrEP, 3361081 PLW = 3.0% coverage (aiming for 15%);
* Coverage too low, also oral PrEP increases among older women (suspect those who have stopped DPV ring);

*All adults on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 2 - Number of people on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 800000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_oral_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_vr_w_0 = "SQ - VR PrEP(median) ";
label p50_n_prep_oral_2 = "Option 2 - oral PrEP (median) ";
label p50_n_prep_inj_2 = "Option 2 - injectable PrEP (median) ";
label p50_n_prep_vr_w_2 = "Option 2 - VR PrEP(median) ";
series  x=cald y=p50_n_prep_oral_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_0 	upper=p95_n_prep_oral_2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_2  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_0 	upper=p95_n_prep_vr_w_2  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_2/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_2 	upper=p95_n_prep_oral_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_2/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_2 	upper=p95_n_prep_inj_2  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_2/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_2 	upper=p95_n_prep_vr_w_2  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;

*Men on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 2 - Number of men on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 800000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_oral_m_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_m_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_oral_m_2 = "Option 2 - oral PrEP (median) ";
label p50_n_prep_inj_m_2 = "Option 2 - injectable PrEP (median) ";
series  x=cald y=p50_n_prep_oral_m_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_m_0 	upper=p95_n_prep_oral_m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_m_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_m_0 	upper=p95_n_prep_inj_m_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_m_2/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_m_2 	upper=p95_n_prep_oral_m_2  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_m_2/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_m_2 	upper=p95_n_prep_inj_m_2  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
run;quit;
*Oral PrEP use among men same between SQ and O2;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O2: oral PrEP for PLW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__2 = "Option 2  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__2/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* Incidence is slightly lower, if anything;

*Incidence among PLW?;





*****************************************;
******* OPTION 3: CAB-LA FOR AGYW *******;
*****************************************;

*AGYW on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 3 - Number of AGYW on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 800000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_oral_1524w_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_1524w_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_vr_1524w_0 = "SQ - VR PrEP(median) ";
label p50_n_prep_oral_1524w_3 = "Option 3 - oral PrEP (median) ";
label p50_n_prep_inj_1524w_3 = "Option 3 - injectable PrEP (median) ";
label p50_n_prep_vr_1524w_3 = "Option 3 - VR PrEP (median) ";
series  x=cald y=p50_n_prep_oral_1524w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_1524w_0 	upper=p95_n_prep_oral_1524w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_1524w_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_1524w_0 	upper=p95_n_prep_inj_1524w_0  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_1524w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_1524w_0 	upper=p95_n_prep_vr_1524w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_1524w_3/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_1524w_3 	upper=p95_n_prep_oral_1524w_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_1524w_3/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_1524w_3 	upper=p95_n_prep_inj_1524w_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_1524w_3/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_vr_1524w_3 	upper=p95_n_prep_vr_1524w_3  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;
proc means data=d; var p50_n_prep_inj_w_3 p50_n_prep_inj_1524w_3 p50_n_alive_1524w_3; where cald=2030; run;	
* 328373 AGYW on CAB-LA PrEP, 5387685 AGYW = ~6.1% coverage (aiming for 15%) ;
* Coverage too low, also oral PrEP increases among older women (suspect those who have stopped CAB-LA);

*All adults on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 3 - Number of people on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2500000   by 500000 ) valueattrs=(size=10);
label p50_n_prep_oral_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_vr_w_0 = "SQ - VR PrEP(median) ";
label p50_n_prep_oral_3 = "Option 3 - oral PrEP (median) ";
label p50_n_prep_inj_3 = "Option 3 - injectable PrEP (median) ";
label p50_n_prep_vr_w_3 = "Option 3 - VR PrEP(median) ";
series  x=cald y=p50_n_prep_oral_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_0 	upper=p95_n_prep_oral_3  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_3  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_0 	upper=p95_n_prep_vr_w_3  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_3/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_3 	upper=p95_n_prep_oral_3  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_3/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_3 	upper=p95_n_prep_inj_3  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_3/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_3 	upper=p95_n_prep_vr_w_3  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O3: CAB-LA for AGYW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__3 = "Option 3  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__3/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;





************************************************************;
******* OPTION 4: CAB-LA SWITCH (30% from oral PrEP) *******;
************************************************************;

*All adults on different PrEP modalities;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 4 - Number of people on different PrEP modalities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1200000   by 100000 ) valueattrs=(size=10);
label p50_n_prep_oral_0 = "SQ - oral PrEP (median) ";
label p50_n_prep_inj_0 = "SQ - injectable PrEP (median) ";
label p50_n_prep_vr_w_0 = "SQ - VR PrEP(median) ";
label p50_n_prep_oral_4 = "Option 4 - oral PrEP (median) ";
label p50_n_prep_inj_4 = "Option 4 - injectable PrEP (median) ";
label p50_n_prep_vr_w_4 = "Option 4 - VR PrEP(median) ";
series  x=cald y=p50_n_prep_oral_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_0 	upper=p95_n_prep_oral_4  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_0/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_inj_0 	upper=p95_n_prep_inj_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_0 	upper=p95_n_prep_vr_w_4  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_4/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_prep_oral_4 	upper=p95_n_prep_oral_4  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_4/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_inj_4 	upper=p95_n_prep_inj_4  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_w_4/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_vr_w_4 	upper=p95_n_prep_vr_w_2  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;
proc means data=d; var p50_n_prep_oral_0 p50_n_alive_0 p50_n_prep_oral_4 p50_n_prep_inj_4 p50_n_alive_4; where cald=2030; run;
* SQ: 202803 on oral PrEP, 45767931 alive;
* O4: 157839 on oral PrEP, 317675 on inj PrEP, 45737791 alive ;
* => ~45,000 have switched away from oral PrEP (22%) but there are many more new CAB-LA users;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O4: CAB-LA switch from oral PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__4 = "Option 4  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__4/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__4 	upper=p95_incidence1549__4  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;





*****************************************;
******** OPTION 5: U=U MESSAGING ********;
*****************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O5: U=U messaging";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__5 = "Option 5  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__5/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__5 	upper=p95_incidence1549__5  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* No difference;

** Add code for U=U metrics to create_wide_file and here;
** Check what is needed for MIHPSA outputs (see spreadsheet MIHPSA_SA_PhaseII_Output_Sheet_4April24_Template_Synthesis_4thJuly24);
* Outputs in model:
s_receive_u_u				
s_hiv_receive_u_u		
s_diag_receive_u_u	
s_onart_receive_u_u
Need to add more?
;





***********************************************************************;
******** OPTION 6: SELF-TEST DISTRIBUTION IN HEALTH FACILITIES ********;
***********************************************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O6: self-tests from facilities";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__6 = "Option 6  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__6/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__6 	upper=p95_incidence1549__6  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* No difference;

** Add code for self-test metrics to create_wide_file and here;
** Check what is needed for MIHPSA outputs (see spreadsheet MIHPSA_SA_PhaseII_Output_Sheet_4April24_Template_Synthesis_4thJuly24);
* Outputs in model:
s_self_tested 
s_self_tested_m 
s_self_tested_w 
s_tested_due_to_self_test 
s_diagnosed_self_test
Dont think we need to add more
;





**************************************************************;
******** OPTION 7: SELF-TEST DISTRIBUTION TO PARTNERS ********;
**************************************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O6: self-tests for partners";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__7 = "Option 7  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__7/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__7 	upper=p95_incidence1549__7  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* No difference;

** Add code for self-test metrics to create_wide_file and here;
** Check what is needed for MIHPSA outputs (see spreadsheet MIHPSA_SA_PhaseII_Output_Sheet_4April24_Template_Synthesis_4thJuly24);
* Outputs in model:
s_self_tested 
s_self_tested_m 
s_self_tested_w 
s_tested_due_to_self_test 
s_diagnosed_self_test
Dont think we need to add more
;





***********************************************;
******** OPTION 8: MENS HEALTH CLINICS ********;
***********************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O8: mens clinics";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__8 = "Option 8  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__8/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__8 	upper=p95_incidence1549__8  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* No difference;

** Add code for mens clinics metrics to create_wide_file and here;
** Check what is needed for MIHPSA outputs (see spreadsheet MIHPSA_SA_PhaseII_Output_Sheet_4April24_Template_Synthesis_4thJuly24);
* Outputs in model:
s_attend_mens_clinic		
s_hiv_mens_clinic		
s_diag_mens_clinic		
s_onart_mens_clinic
Dont think we need to add more?
;





***********************************************;
********** OPTION 9: VMMC FOR 10-14y **********;
***********************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O9: VMMC for 10-14y";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__9 = "Option 9  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__9/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__9 	upper=p95_incidence1549__9  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* No difference;

*Number of VMMCs performed;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 9 - Annual number of new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_new_vmmc1549m_0 = "SQ - 15-49 year-olds (median) ";
label p50_n_new_vmmc1014m_0 = "SQ - 10-14 year-olds (median) ";
label p50_n_new_vmmc1549m_9 = "Option 9 - 15-49 year-olds (median) ";
label p50_n_new_vmmc1014m_9 = "Option 9 - 10-14 year-olds (median) ";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_n_new_vmmc1014m_0/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_n_new_vmmc1549m_9/	lineattrs = (color=grey thickness = 2);
series  x=cald y=p50_n_new_vmmc1014m_9/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
band    x=cald lower=p5_n_new_vmmc1014m_0 	upper=p95_n_new_vmmc1014m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
band    x=cald lower=p5_n_new_vmmc1549m_9 	upper=p95_n_new_vmmc1549m_9  / transparency=0.9 fillattrs = (color=grey) legendlabel= "Model 90% range";
band    x=cald lower=p5_n_new_vmmc1014m_9 	upper=p95_n_new_vmmc1014m_9  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
run;quit;

*Proportion of males who have had VMMC;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men medically circumcised (median, age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_vmmc_1549m_0 = "SQ - 15-49 year-olds (median) ";
label p50_p_vmmc_1014m_0 = "SQ - 10-14 year-olds (median) ";
label p50_p_vmmc_1549m_9 = "Option 9 - 15-49 year-olds (median) ";
label p50_p_vmmc_1014m_9 = "Option 9 - 10-14 year-olds (median) ";
series  x=cald y=p50_p_vmmc_1549m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_p_vmmc_1014m_0/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_p_vmmc_1549m_9/	lineattrs = (color=grey thickness = 2);
series  x=cald y=p50_p_vmmc_1014m_9/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_p_vmmc_1549m_0 	upper=p95_p_vmmc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
band    x=cald lower=p5_p_vmmc_1014m_0 	upper=p95_p_vmmc_1014m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
band    x=cald lower=p5_p_vmmc_1549m_9 	upper=p95_p_vmmc_1549m_9  / transparency=0.9 fillattrs = (color=grey) legendlabel= "Model 90% range";
band    x=cald lower=p5_p_vmmc_1014m_9 	upper=p95_p_vmmc_1014m_9  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
run;quit;
* No increase in p_vmmc for 10-14m;





************************************************;
********** OPTION 10: VMMC FOR 15-49y **********;
************************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O10: VMMC for 15-49y";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__10 = "Option 10  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__10/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__10	upper=p95_incidence1549__10  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* Slightly lower incidence;

*Number of VMMCs performed;
proc sgplot data=d; 
Title    height=1.5 justify=center "Option 10 - Annual number of new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_new_vmmc1549m_0 = "SQ - 15-49 year-olds (median) ";
label p50_n_new_vmmc1014m_0 = "SQ - 10-14 year-olds (median) ";
label p50_n_new_vmmc1549m_10 = "Option 10 - 15-49 year-olds (median) ";
label p50_n_new_vmmc1014m_10 = "Option 10 - 10-14 year-olds (median) ";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_n_new_vmmc1014m_0/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_n_new_vmmc1549m_10/	lineattrs = (color=grey thickness = 2);
series  x=cald y=p50_n_new_vmmc1014m_10/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
band    x=cald lower=p5_n_new_vmmc1014m_0 	upper=p95_n_new_vmmc1014m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
band    x=cald lower=p5_n_new_vmmc1549m_10 	upper=p95_n_new_vmmc1549m_10  / transparency=0.9 fillattrs = (color=grey) legendlabel= "Model 90% range";
band    x=cald lower=p5_n_new_vmmc1014m_10 	upper=p95_n_new_vmmc1014m_10  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
run;quit;

*Proportion of males who have had VMMC;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men medically circumcised (median, age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_vmmc_1549m_0 = "SQ - 15-49 year-olds (median) ";
label p50_p_vmmc_1014m_0 = "SQ - 10-14 year-olds (median) ";
label p50_p_vmmc_1549m_10 = "Option 10 - 15-49 year-olds (median) ";
label p50_p_vmmc_1014m_10 = "Option 10 - 10-14 year-olds (median) ";
series  x=cald y=p50_p_vmmc_1549m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_p_vmmc_1014m_0/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_p_vmmc_1549m_10/	lineattrs = (color=grey thickness = 2);
series  x=cald y=p50_p_vmmc_1014m_10/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_p_vmmc_1549m_0 	upper=p95_p_vmmc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
band    x=cald lower=p5_p_vmmc_1014m_0 	upper=p95_p_vmmc_1014m_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
band    x=cald lower=p5_p_vmmc_1549m_10 	upper=p95_p_vmmc_1549m_10  / transparency=0.9 fillattrs = (color=grey) legendlabel= "Model 90% range";
band    x=cald lower=p5_p_vmmc_1014m_10 	upper=p95_p_vmmc_1014m_10  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
run;quit;
* Small increase in p_vmmc for 15-49m;

proc means data=d; 
	var p50_p_mcirc_1549m_0 p50_p_mcirc_1549m_1 p50_p_mcirc_1549m_2 p50_p_mcirc_1549m_3 p50_p_mcirc_1549m_4
	p50_p_mcirc_1549m_6 p50_p_mcirc_1549m_7 p50_p_mcirc_1549m_8 p50_p_mcirc_1549m_9 p50_p_mcirc_1549m_10;
	where cald=2030;
run;





**********************************************;
********* OPTION 11: PEER NAVIGATORS *********;
**********************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O11: peer navigators";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__11 = "Option 11  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__11/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__11 	upper=p95_incidence1549__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* No difference;

** Add code for peer navigator metrics to create_wide_file and here;
** Check what is needed for MIHPSA outputs (see spreadsheet MIHPSA_SA_PhaseII_Output_Sheet_4April24_Template_Synthesis_4thJuly24);
* Outputs in model:
s_access_peer_navigator		
s_hiv_peer_navigator	
s_diag_peer_navigator	
s_onart_peer_navigator
Need to add more?
;





*************************************;
********* OPTION 12: POC VL *********;
*************************************;

*Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (15-49) - SQ vs O12: POC VL";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_incidence1549__0 = "SQ (median) ";
label p50_incidence1549__12 = "Option 12  (median) ";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__12/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__12 	upper=p95_incidence1549__12  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
* Lower incidence;

** Add code for POC VL metrics to create_wide_file and here;
** Check what is needed for MIHPSA outputs (see spreadsheet MIHPSA_SA_PhaseII_Output_Sheet_4April24_Template_Synthesis_4thJuly24);
* Outputs in model?:
;





**********************************************;
********* OPTION 13: CONDOM SCALE UP *********;
**********************************************;

* Not coded;
* Not sure if we can code this one - perhaps adjust rred or use sbcc or cmmc code from Zim;



ods rtf close; run;











*The following code is to export data in format for MIHPSA South Africa;

/***********************************************************************************************/
/************************              FLOW                        ****************************/
/***********************************************************************************************/


  ***Macro var used to calculate means across each year and transpose to one line per run,
  need to write manually all the years to merge;

/*proc contents data=b;run;*/
/*proc freq data=b;table n_init_prep_inj_curr_m;run;*/
%let nfit=124;		/*** UPDATE IF ADD MORE RUNS ***/

/* Define the lists of variables */
%let var_list_flow = 
	n_new_inf1564m						/*NB. This is 15-64y as no sexual mixing above 65*/
	n_new_inf1564w						/*NB. This is 15-64y as no sexual mixing above 65*/
/*N_HIVInf_C014*/						/*Cannot model*/
	n_death_hivrel_m
	n_death_hivrel_w
/*N_AIDSDeaths_C014*/					/*Cannot model*/
	n_death_m
	n_death_w
/*N_Deaths_C014*/						/*Cannot model*/
	n_dyllag_hiv_m
	n_dyllag_hiv_w
/*N_YLL_C014*/							/*Cannot model*/
	n_give_birth_w_hiv
	n_give_birth_on_art
	n_init_prep_oral_curr_m
	n_init_prep_oral_curr_w
	n_hivpos_tests						/*NB. This is not necessarily all facility-based*/
	n_hivneg_tests						/*NB. This is not necessarily all facility-based*/
	n_diag_anc
	n_hivneg_tests_anc
	n_hivpos_tests_sympt				/*NB. this is not necessarily facility-based*/
	n_hivneg_tests_sympt				/*NB. this is not necessarily facility-based*/
/*N_HIVTestPos_C014*/					/*Cannot model*/
/*N_HIVTestNeg_C014*/					/*Cannot model*/
	n_new_vmmc1549m
	n_new_vmmc1014m
/*TOT_CD_PSexActs_15+*/					/*Cannot model*/
	n_vm_w
	n_vm_m
/*N_HIVST_HF_B15+*/						/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_BPARTNER15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_Other15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
	n_init_prep_vr_1524w
	n_init_prep_oral_plw
	n_init_prep_inj_1524w
	n_init_prep_inj_curr_m
	n_init_prep_inj_curr_w
	n_art_mens_clinic
	n_receive_u_u
	n_hiv_peer_navigator_w
	n_hiv_peer_navigator_m
	n_self_tests						/*Extra output*/
	n_diag_anclabpd						/*Extra output*/
	n_hivneg_tests_anclabpd				/*Extra output*/
	n_init_prep_oral_first_m			/*Extra output*/
	n_init_prep_oral_first_w			/*Extra output*/
	n_init_prep_inj_first_w				/*Extra output*/
	n_init_prep_inj_first_m				/*Extra output*/
	n_prep_oral_w						/*Extra output*/
	n_prep_oral_m						/*Extra output*/
	n_prep_inj_w						/*Extra output*/
	n_prep_inj_m						/*Extra output*/
;

%let var_list_flow_p50 = 
	p50_n_new_inf1564m_&o				/*NB. This is 15-64y as no sexual mixing above 65*/
	p50_n_new_inf1564w_&o				/*NB. This is 15-64y as no sexual mixing above 65*/
/*N_HIVInf_C014*/						/*Cannot model*/
	p50_n_death_hivrel_m_&o
	p50_n_death_hivrel_w_&o
/*N_AIDSDeaths_C014*/					/*Cannot model*/
	p50_n_death_m_&o
	p50_n_death_w_&o
/*N_Deaths_C014*/						/*Cannot model*/
	p50_n_dyllag_hiv_m_&o
	p50_n_dyllag_hiv_w_&o
/*N_YLL_C014*/							/*Cannot model*/
	p50_n_give_birth_w_hiv_&o
	p50_n_give_birth_on_art_&o
	p50_n_init_prep_oral_curr_m_&o
	p50_n_init_prep_oral_curr_w_&o
	p50_n_hivpos_tests_&o				/*NB. This is not necessarily all facility-based*/
	p50_n_hivneg_tests_&o				/*NB. This is not necessarily all facility-based*/
	p50_n_diag_anc_&o
	p50_n_hivneg_tests_anc_&o
	p50_n_hivpos_tests_sympt_&o			/*NB. this is not necessarily facility-based*/
	p50_n_hivneg_tests_sympt_&o			/*NB. this is not necessarily facility-based*/
/*N_HIVTestPos_C014*/					/*Cannot model*/
/*N_HIVTestNeg_C014*/					/*Cannot model*/
	p50_n_new_vmmc1549m_&o
	p50_n_new_vmmc1014m_&o
/*TOT_CD_PSexActs_15+*/					/*Cannot model*/
	p50_n_vm_w_&o
	p50_n_vm_m_&o
/*N_HIVST_HF_B15+*/						/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_BPARTNER15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_Other15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
	p50_n_init_prep_vr_1524w_&o
	p50_n_init_prep_oral_plw_&o
	p50_n_init_prep_inj_1524w_&o
	p50_n_init_prep_inj_curr_m_&o
	p50_n_init_prep_inj_curr_w_&o
	p50_n_art_mens_clinic_&o
	p50_n_receive_u_u_&o
	p50_n_hiv_peer_navigator_w_&o
	p50_n_hiv_peer_navigator_m_&o
	p50_n_self_tests_&o					/*Extra output*/
	p50_n_diag_anclabpd_&o				/*Extra output*/
	p50_n_hivneg_tests_anclabpd_&o		/*Extra output*/
	p50_n_init_prep_oral_first_m_&o		/*Extra output*/
	p50_n_init_prep_oral_first_w_&o		/*Extra output*/
	p50_n_init_prep_inj_first_w_&o		/*Extra output*/
	p50_n_init_prep_inj_first_m_&o		/*Extra output*/
	p50_n_prep_oral_w_&o				/*Extra output*/
	p50_n_prep_oral_m_&o				/*Extra output*/
	p50_n_prep_inj_w_&o					/*Extra output*/
	p50_n_prep_inj_m_&o					/*Extra output*/
;

%let var_list_flow_sa_names =
year
N_HIVInf_M15
N_HIVInf_F15
/*N_HIVInf_C014*/						/*Cannot model*/
N_AIDSDeaths_M15
N_AIDSDeaths_F15
/*N_AIDSDeaths_C014*/					/*Cannot model*/
N_Deaths_M15
N_Deaths_F15
/*N_Deaths_C014*/						/*Cannot model*/
N_YLL_M15
N_YLL_F15
/*N_YLL_C014*/							/*Cannot model*/
N_HIV_Fbirth15
N_HIV_Fbirth_ART15
N_OralPrEP_M15
N_OralPrEP_F15
N_HIVTestPos_B15
N_HIVTestNeg_B15
N_HIVANCTestPos
N_HIVANCTestPosNeg
N_HIVSymTestPos_Total_B15
N_HIVSymTestNeg_Total_B15
/*N_HIVTestPos_C014*/					/*Cannot model*/
/*N_HIVTestNeg_C014*/					/*Cannot model*/
N_NEW_CIRC_M1549
N_NEW_CIRC_M1014
/*TOT_CD_PSexActs_15+*/					/*Cannot model*/
N_POCVL_F15
N_POCVL_M15
/*N_HIVST_HF_B15+*/						/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_BPARTNER15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_Other15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
N_DPVPrEP_AGYW_Init
N_TDFPrEP_preg_F15to49_Init
N_CABLA_PREP_AGYW_Init
N_CABLA_PREP_F15_Init
N_CABLA_PREP_M15_Init
N_EMHC_M15_Init
N_UEU_M15
N_CBPeerNav_F15
N_CBPeerNav_M15
N_HIVST_B15
N_HIVANCLABPDTestPos
N_HIVANCLABPDTestNeg
N_OralPrEP_M15_Init_First
N_OralPrEP_F15_Init_First
N_CABLA_PREP_F15_Init_First
N_CABLA_PREP_M15_Init_First
N_OralPrEP_current_M15
N_OralPrEP_current_F15
N_CABLAPrEP_current_M15
N_CABLAPrEP_current_F15
;
/*%put(&var_list_flow_sa_names);*/

%let var_list_flow_sa_names_blanks =
year
N_HIVInf_M15
N_HIVInf_F15
blank1
blank2
blank3
N_AIDSDeaths_M15
N_AIDSDeaths_F15
blank4
blank5
blank6
N_Deaths_M15
N_Deaths_F15
blank7
blank8
blank9
N_YLL_M15
N_YLL_F15
blank10
blank11
blank12
N_HIV_Fbirth15
blank13
blank14
N_HIV_Fbirth_ART15
blank15
blank16
N_OralPrEP_M15
N_OralPrEP_F15
blank17
blank18
N_HIVTestPos_B15
N_HIVTestNeg_B15
blank19
blank20
N_HIVANCTestPos
N_HIVANCTestPosNeg
blank21
blank22
N_HIVSymTestPos_B15
N_HIVSymTestNeg_B15
blank23
blank24
blank25
blank26
blank27
blank28
N_NEW_CIRC_M1549
N_NEW_CIRC_M1014
blank29
blank30
blank31
blank32
blank33
N_POCVL_F15
N_POCVL_M15
blank34
blank35
blank36
blank37
blank38
blank38
blank39
blank40
blank41
blank42
blank43
blank44
blank45
blank46
blank47
blank48
blank49
blank50
N_DPVPrEP_AGYW_Init
N_TDFPrEP_preg_F15to49_Init
N_CABLA_PREP_AGYW_Init
N_CABLA_PREP_F15_Init
N_CABLA_PREP_M15_Init
N_EMHC_M15_Init
N_UEU_M15
N_CBPeerNav_F15
N_CBPeerNav_M15
N_HIVST_B15
N_HIVANCLABPDTestPos
N_HIVANCLABPDTestNeg
N_OralPrEP_M15_Init_First
N_OralPrEP_F15_Init_First
N_CABLA_PREP_F15_Init_First
N_CABLA_PREP_M15_Init_First
N_OralPrEP_current_M15
N_OralPrEP_current_F15
N_CABLAPrEP_current_M15
N_CABLAPrEP_current_F15
;

/* Define the macro */
%macro var_cy(s,v);
data option_&s;set b;if option=&s;keep &v count_csim  cald ;
proc sort data=option_&s;by count_csim  cald ;
%let count = 2024;
%do %while (&count le 2064);
proc means  noprint data=option_&s; var &v; output out=y_&count mean=&v._&count; by count_csim ; where &count-0.5 <= cald < &count+0.5;
%let count = %eval(&count + 1);
%end;
data &v ; merge		   y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030 y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040 
  y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050 y_2051 y_2052 y_2053 y_2054 y_2055 y_2056 y_2057 y_2058 y_2059 y_2060  
  y_2061 y_2062 y_2063 y_2064 ;  
drop _NAME_ _TYPE_ _FREQ_;run;
proc datasets nodetails nowarn nolist;
delete				   y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030 y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040 
  y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050 y_2051 y_2052 y_2053 y_2054 y_2055 y_2056 y_2057 y_2058 y_2059 y_2060  
  y_2061 y_2062 y_2063 y_2064 ;quit;

proc transpose data=&v out=l_&v._&s prefix=&v;id  count_csim;run;
data l_&v._&s;set l_&v._&s;
cald= input(substr(_NAME_,length(_NAME_)-3,4),4.);drop _NAME_;run;

data l_&v._&s;set l_&v._&s;***creates one dataset per variable;
/*p5_&v._&s  = PCTL(5,of &v.1-&v.&nfit);*/
/*p95_&v._&s = PCTL(95,of &v.1-&v.&nfit);*/
p50_&v._&s = median(of &v.1-&v.&nfit);
keep cald /*p5_&v._&s p95_&v._&s*/ p50_&v._&s;
run;
proc datasets nodetails nowarn nolist;delete &v;quit;
%mend var_cy;


/* Define the list of options */
%let opt_list = 0 1 2 3 4 5 6 7 8 9 10 11 12;	*Deleted 99 as no minimal scenario in P2, cannot model O13;
/*%let s=0; %let v=n_new_inf1564m; %var_cy(s,v);*/
/*proc freq data=option_0;table n_init_prep_inj_curr_m;run;*/
/*proc freq data=a.l_base_from2023_20240814;table n_new_inf1564m;run;*/
/*proc freq data=y;table n_new_inf1564m;run;*/
/*proc contents data=y;run;*/

%macro run_var_cy_all;
    %local i j var opt;

    /* Loop through each option */
    %do i = 1 %to %sysfunc(countw(&opt_list));
        %let opt = %scan(&opt_list, &i);

        /* Loop through each variable */
        %do j = 1 %to %sysfunc(countw(&var_list_flow));
            %let var = %scan(&var_list_flow, &j);

            /* Call the macro with the current option and variable */
            %var_cy(&opt, &var);
        %end;
    %end;
%mend run_var_cy_all;


/* Run the macro to process all options and variables */
%run_var_cy_all;


%macro wide(s);
data   wide_allyears_&s; merge 
l_n_new_inf1564m_&s
l_n_new_inf1564w_&s
/*N_HIVInf_C014*/						/*Cannot model*/
l_n_death_hivrel_m_&s
l_n_death_hivrel_w_&s
/*N_AIDSDeaths_C014*/					/*Cannot model*/
l_n_death_m_&s
l_n_death_w_&s
/*N_Deaths_C014*/						/*Cannot model*/
l_n_dyllag_hiv_m_&s
l_n_dyllag_hiv_w_&s
/*N_YLL_C014*/							/*Cannot model*/
l_n_give_birth_w_hiv_&s
l_n_give_birth_on_art_&s
l_n_init_prep_oral_curr_m_&s
l_n_init_prep_oral_curr_w_&s
l_n_hivpos_tests_&s						/*NB. This is not necessarily all facility-based*/
l_n_hivneg_tests_&s						/*NB. This is not necessarily all facility-based*/
l_n_diag_anc_&s
l_n_hivneg_tests_anc_&s
l_n_hivpos_tests_sympt_&s				/*NB. this is not necessarily all facility-based*/
l_n_hivneg_tests_sympt_&s				/*NB. this is not necessarily all facility-based*/
/*N_HIVTestPos_C014*/					/*Cannot model*/
/*N_HIVTestNeg_C014*/					/*Cannot model*/
l_n_new_vmmc1549m_&s
l_n_new_vmmc1014m_&s
/*TOT_CD_PSexActs_15+*/					/*Cannot model*/
l_n_vm_w_&s
l_n_vm_m_&s
/*N_HIVST_HF_B15+*/						/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_BPARTNER15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_Other15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
l_n_init_prep_vr_1524w_&s
l_n_init_prep_oral_plw_&s
l_n_init_prep_inj_1524w_&s
l_n_init_prep_inj_curr_m_&s
l_n_init_prep_inj_curr_w_&s
l_n_art_mens_clinic_&s
l_n_receive_u_u_&s
l_n_hiv_peer_navigator_w_&s
l_n_hiv_peer_navigator_m_&s
l_n_self_tests_&s						/*Extra output*/
l_n_diag_anclabpd_&s					/*Extra output*/
l_n_hivneg_tests_anclabpd_&s			/*Extra output*/
l_n_init_prep_oral_first_m_&s			/*Extra output*/
l_n_init_prep_oral_first_w_&s			/*Extra output*/
l_n_init_prep_inj_first_w_&s			/*Extra output*/
l_n_init_prep_inj_first_m_&s			/*Extra output*/
l_n_prep_oral_m_&s						/*Extra output*/
l_n_prep_oral_w_&s						/*Extra output*/
l_n_prep_inj_m_&s						/*Extra output*/
l_n_prep_inj_w_&s						/*Extra output*/
;
run;
%mend;

%wide(0);
%wide(1);
%wide(2);
%wide(3);
%wide(4);
%wide(5);
%wide(6);
%wide(7);
%wide(8);
%wide(9);
%wide(10);
%wide(11);
%wide(12);
/*%wide(13);*/


*FLOW;
%macro flow(o=);
data wide_allyears_out_&o; set wide_allyears_&o;
*note that 1991 would refer to the period 1990.5-1991.5;

rename p50_n_new_inf1564m_&o			= N_HIVInf_M15;
rename p50_n_new_inf1564w_&o			= N_HIVInf_F15;
/*N_HIVInf_C014*/						/*Cannot model*/
rename p50_n_death_hivrel_m_&o			= N_AIDSDeaths_M15;
rename p50_n_death_hivrel_w_&o			= N_AIDSDeaths_F15;
/*N_AIDSDeaths_C014*/					/*Cannot model*/
rename p50_n_death_m_&o					= N_Deaths_M15;
rename p50_n_death_w_&o					= N_Deaths_F15;
/*N_Deaths_C014*/						/*Cannot model*/
rename p50_n_dyllag_hiv_m_&o			= N_YLL_M15;
rename p50_n_dyllag_hiv_w_&o			= N_YLL_F15;
/*N_YLL_C014*/							/*Cannot model*/
rename p50_n_give_birth_w_hiv_&o		= N_HIV_Fbirth15;
rename p50_n_give_birth_on_art_&o		= N_HIV_Fbirth_ART15;
rename p50_n_init_prep_oral_curr_m_&o	= N_OralPrEP_M15;
rename p50_n_init_prep_oral_curr_w_&o	= N_OralPrEP_F15;
rename p50_n_hivpos_tests_&o			= N_HIVTestPos_B15;
rename p50_n_hivneg_tests_&o			= N_HIVTestNeg_B15;
rename p50_n_diag_anc_&o				= N_HIVANCTestPos;
rename p50_n_hivneg_tests_anc_&o		= N_HIVANCTestPosNeg;
rename p50_n_hivpos_tests_sympt_&o		= N_HIVSymTestPos_B15;
rename p50_n_hivneg_tests_sympt_&o		= N_HIVSymTestNeg_B15;
/*N_HIVTestPos_C014*/					/*Cannot model*/
/*N_HIVTestNeg_C014*/					/*Cannot model*/
rename p50_n_new_vmmc1549m_&o			= N_NEW_CIRC_M1549;
rename p50_n_new_vmmc1014m_&o			= N_NEW_CIRC_M1014;
/*TOT_CD_PSexActs_15+*/					/*Cannot model*/
rename p50_n_vm_w_&o					= N_POCVL_F15;
rename p50_n_vm_m_&o					= N_POCVL_M15;
/*N_HIVST_HF_B15+*/						/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_BPARTNER15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
/*N_HIVST_Other15+*/					/*Cannot explicitly model*/			/* CHECK THIS */
rename p50_n_init_prep_vr_1524w_&o		= N_DPVPrEP_AGYW_Init;
rename p50_n_init_prep_oral_plw_&o		= N_TDFPrEP_preg_F15to49_Init;
rename p50_n_init_prep_inj_1524w_&o		= N_CABLA_PREP_AGYW_Init;
rename p50_n_init_prep_inj_curr_w_&o	= N_CABLA_PREP_F15_Init;
rename p50_n_init_prep_inj_curr_m_&o	= N_CABLA_PREP_M15_Init;
rename p50_n_art_mens_clinic_&o			= N_EMHC_M15_Init;
rename p50_n_receive_u_u_&o				= N_UEU_M15;
rename p50_n_hiv_peer_navigator_w_&o	= N_CBPeerNav_F15;
rename p50_n_hiv_peer_navigator_m_&o	= N_CBPeerNav_M15;
rename p50_n_self_tests_&o				= N_HIVST_B15;
rename p50_n_diag_anclabpd_&o			= N_HIVANCLABPDTestPos;
rename p50_n_hivneg_tests_anclabpd_&o	= N_HIVANCLABPDTestNeg;
rename p50_n_init_prep_oral_first_m_&o	= N_OralPrEP_M15_Init_First;
rename p50_n_init_prep_oral_first_w_&o	= N_OralPrEP_F15_Init_First;
rename p50_n_init_prep_inj_first_w_&o	= N_CABLA_PREP_F15_Init_First;
rename p50_n_init_prep_inj_first_m_&o	= N_CABLA_PREP_M15_Init_First;
rename p50_n_prep_oral_m_&o				= N_OralPrEP_current_M15;
rename p50_n_prep_oral_w_&o				= N_OralPrEP_current_F15;
rename p50_n_prep_inj_m_&o				= N_CABLAPrEP_current_M15;
rename p50_n_prep_inj_w_&o				= N_CABLAPrEP_current_F15;

rename cald=year;

keep cald &var_list_flow_p50; run;

data wide_allyears_out_&o;		
	set wide_allyears_out_&o;
	blank1=.;  blank2=.;  blank3=.;  blank4=.;  blank5=.;  blank6=.;  blank7=.;  blank8=.;  blank9=.;  blank10=.; 
	blank11=.; blank12=.; blank13=.; blank14=.; blank15=.; blank16=.; blank17=.; blank18=.; blank19=.; blank20=.; 
	blank21=.; blank22=.; blank23=.; blank24=.; blank25=.; blank26=.; blank27=.; blank28=.; blank29=.; blank30=.; 
	blank31=.; blank32=.; blank33=.; blank34=.; blank35=.; blank36=.; blank37=.; blank38=.; blank39=.; blank40=.; 
	blank41=.; blank42=.; blank43=.; blank44=.; blank45=.; blank46=.; blank47=.; blank48=.; blank49=.; blank50=.;
run;

data wide_allyears_out_&o;		
	retain &var_list_flow_sa_names_blanks;
	set wide_allyears_out_&o;
run;

%mend;

%flow(o=0);
%flow(o=1);
%flow(o=2);
%flow(o=3);
%flow(o=4);
%flow(o=5);
%flow(o=6);
%flow(o=7);
%flow(o=8);
%flow(o=9);
%flow(o=10);
%flow(o=11);
%flow(o=12);
/*%flow(o=13);*/


proc transpose data = wide_allyears_out_0 out= wide_allyears_out_0_transposed;run;
proc transpose data = wide_allyears_out_1 out= wide_allyears_out_1_transposed;run;
proc transpose data = wide_allyears_out_2 out= wide_allyears_out_2_transposed;run;
proc transpose data = wide_allyears_out_3 out= wide_allyears_out_3_transposed;run;
proc transpose data = wide_allyears_out_4 out= wide_allyears_out_4_transposed;run;
proc transpose data = wide_allyears_out_5 out= wide_allyears_out_5_transposed;run;
proc transpose data = wide_allyears_out_6 out= wide_allyears_out_6_transposed;run;
proc transpose data = wide_allyears_out_7 out= wide_allyears_out_7_transposed;run;
proc transpose data = wide_allyears_out_8 out= wide_allyears_out_8_transposed;run;
proc transpose data = wide_allyears_out_9 out= wide_allyears_out_9_transposed;run;
proc transpose data = wide_allyears_out_10 out= wide_allyears_out_10_transposed;run;
proc transpose data = wide_allyears_out_11 out= wide_allyears_out_11_transposed;run;
proc transpose data = wide_allyears_out_12 out= wide_allyears_out_12_transposed;run;
/*proc transpose data = wide_allyears_out_13 out= wide_allyears_out_13_transposed;run;*/


PROC export data=wide_allyears_out_0_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_StatusQuo";  RUN;
PROC export data=wide_allyears_out_1_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_DPVRing";  RUN;
PROC export data=wide_allyears_out_2_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_OralPrEPPregnant";  RUN;
PROC export data=wide_allyears_out_3_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_CABLAAGYW";  RUN;
PROC export data=wide_allyears_out_4_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_CABLASwitch";  RUN;
PROC export data=wide_allyears_out_5_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_UUMessage";  RUN;
PROC export data=wide_allyears_out_6_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_HIVST";  RUN;
PROC export data=wide_allyears_out_7_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_HIVSTIndex";  RUN;
PROC export data=wide_allyears_out_8_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_MensClinic";  RUN;
PROC export data=wide_allyears_out_10_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;	* Note ops 9 & 10 are the wrong way round in spreadsheet;
sheet="FLOW_Variables_VMMCAdults";  RUN;
PROC export data=wide_allyears_out_9_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_VMMCBoys";  RUN;
PROC export data=wide_allyears_out_11_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_PeerNav";  RUN;
PROC export data=wide_allyears_out_12_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="FLOW_Variables_POC";  RUN;
/*PROC export data=wide_allyears_out_13_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;*/
/*sheet="FLOW_Variables_CondomDist";  RUN;*/





/***********************************************************************************************/
/************************              STOCK                        ****************************/
/***********************************************************************************************/
*VCFeb2023;
*Output to be exported to fill in the file "Output template MIHPSAZimP2";

data d;set a.d;run;
proc contents data=d;run;

%let var_list_stock = 
year
p50_prevalence_ge15m_&o
p50_prevalence_ge15w_&o
/*HIVprev_C014*/								/*Cannot model*/
p50_n_alive_m_&o
p50_n_alive_w_&o
/*N_Alive_C014*/								/*Cannot model*/
p50_pc_diag_m_&o
p50_pc_diag_w_&o
/*P_DIAG_C014*/									/*Cannot model*/
p50_pc_onart_diag_m_&o
p50_pc_onart_diag_w_&o
/*P_onART_HIVC014*/								/*Cannot model*/
p50_n_onart_m_&o
p50_n_onart_w_&o
/*N_onART_HIVC014*/								/*Cannot model*/
p50_pc_onart_vl1000_m_&o
p50_pc_onart_vl1000_w_&o
p50_n_not_on_art_cd4ge500__&o
p50_n_not_on_art_cd4350500__&o
p50_n_not_on_art_cd4200350__&o
p50_n_not_on_art_cd40200__&o
/*N_onART_HIVC014*/								/*Cannot model*/
/*N_NotOnART_HIVC014*/							/*Cannot model*/
;

%let var_list_stock_sa_names =
year
HIVprev_M15
HIVprev_F15
/*HIVprev_C014*/								/*Cannot model*/
N_Alive_M15
N_Alive_F15
/*N_Alive_C014*/								/*Cannot model*/
P_DIAG_M15
P_DIAG_F15
/*P_DIAG_C014*/									/*Cannot model*/
P_onART_HIVM15
P_onART_HIVF15
/*P_onART_HIVC014*/								/*Cannot model*/
N_onART_M15
N_onART_F15
/*N_onART_HIVC014*/								/*Cannot model*/
P_VLS_onART_M15
P_VLS_onART_F15
N_HIV_B1599_NoART_CD4500
N_HIV_B1599_NoART_CD4350499
N_HIV_B1599_NoART_CD4200349
N_HIV_B1599_NoART_CD4199
/*N_onART_HIVC014*/								/*Cannot model*/
/*N_NotOnART_HIVC014*/							/*Cannot model*/
;
/*%put(&var_list_stock_sa_names);*/

%let var_list_stock_sa_names_blanks =
year
HIVprev_M15
HIVprev_F15
blank1
blank2
blank3
N_Alive_M15
N_Alive_F15
blank4
blank5
blank6
P_DIAG_M15
P_DIAG_F15
blank7
blank8
blank9
P_onART_HIVM15
P_onART_HIVF15
blank10
blank11
blank12
N_onART_M15
N_onART_F15
blank13
blank14
P_VLS_onART_M15
P_VLS_onART_F15
blank15
blank16
N_HIV_B1599_NoART_CD4500
N_HIV_B1599_NoART_CD4350499
N_HIV_B1599_NoART_CD4200349
N_HIV_B1599_NoART_CD4199
;



%macro stock(o=);
*Note: we do export 90% range even if they are name 95% LL and UL
	   we do not export:
			- any outcome about children (0-14 years old), TG and MSM
			- % who ever had sex (i.e. sexually active)
			- % who used condom the last time they had sex among  sexually active;
data s&o;set d;
where cald in 
(					 2023.5 2024.5 2025.5 2026.5 2027.5 2028.5 2029.5 
2030.5 2031.5 2032.5 2033.5 2034.5 2035.5 2036.5 2037.5 2038.5 2039.5 
2040.5 2041.5 2042.5 2043.5 2044.5 2045.5 2046.5 2047.5 2048.5 2049.5
2050.5 2051.5 2052.5 2053.5 2054.5 2055.5 2056.5 2057.5 2058.5 2059.5
2060.5 2061.5 2062.5 2063.5 2064.5 );


rename p50_prevalence_ge15m_&o = HIVprev_M15;
rename p50_prevalence_ge15w_&o = HIVprev_F15;
/*HIVprev_C014*/								/*Cannot model*/
rename p50_n_alive_m_&o = N_Alive_M15;
rename p50_n_alive_w_&o = N_Alive_F15;
/*N_Alive_C014*/								/*Cannot model*/
p50_pc_diag_m_&o = 100*p50_p_diag_m_&o;
p50_pc_diag_w_&o = 100*p50_p_diag_w_&o;
rename p50_pc_diag_m_&o = P_DIAG_M15;
rename p50_pc_diag_w_&o = P_DIAG_F15;
/*P_DIAG_C014*/									/*Cannot model*/
p50_pc_onart_diag_m_&o = 100*p50_p_onart_diag_m_&o;
p50_pc_onart_diag_w_&o = 100*p50_p_onart_diag_w_&o;
rename p50_pc_onart_diag_m_&o = P_onART_HIVM15;
rename p50_pc_onart_diag_w_&o = P_onART_HIVF15;
/*P_onART_HIVC014*/								/*Cannot model*/
rename p50_n_onart_m_&o = N_onART_M15;
rename p50_n_onart_w_&o = N_onART_F15;
/*N_onART_HIVC014*/								/*Cannot model*/
p50_pc_onart_vl1000_m_&o = 100*p50_p_onart_gt6m_vl1000_m_&o;
p50_pc_onart_vl1000_w_&o = 100*p50_p_onart_gt6m_vl1000_w_&o;
rename p50_pc_onart_vl1000_m_&o = P_VLS_onART_M15;
rename p50_pc_onart_vl1000_w_&o = P_VLS_onART_F15;
/*P_VLS_onART_M15+*/							/*Not yet run*/
/*P_VLS_onART_F15+*/							/*Not yet run*/
rename p50_n_not_on_art_cd4ge500__&o = N_HIV_B1599_NoART_CD4500;
rename p50_n_not_on_art_cd4350500__&o = N_HIV_B1599_NoART_CD4350499;
rename p50_n_not_on_art_cd4200350__&o = N_HIV_B1599_NoART_CD4200349;
rename p50_n_not_on_art_cd40200__&o = N_HIV_B1599_NoART_CD4199;
/*N_onART_HIVC014*/								/*Cannot model*/
/*N_NotOnART_HIVC014*/							/*Cannot model*/

year= floor(cald);


keep &var_list_stock; run;

data s&o;		
	set s&o;
	blank1=.;  blank2=.;  blank3=.;  blank4=.;  blank5=.;  blank6=.;  blank7=.;  blank8=.;  blank9=.;  blank10=.; 
	blank11=.; blank12=.; blank13=.; blank14=.; blank15=.; blank16=.;
run;

data s&o;		
	retain &var_list_stock_sa_names_blanks;
	set s&o;
run;

* Change year to column heads;
%mend;

%stock(o=0);
%stock(o=1);
%stock(o=2);
%stock(o=3);
%stock(o=4);
%stock(o=5);
%stock(o=6);
%stock(o=7);
%stock(o=8);
%stock(o=9);
%stock(o=10);
%stock(o=11);
%stock(o=12);
/*%stock(o=13);*/


proc transpose data = s0 out= s0_transposed;run;
proc transpose data = s1 out= s1_transposed;run;
proc transpose data = s2 out= s2_transposed;run;
proc transpose data = s3 out= s3_transposed;run;
proc transpose data = s4 out= s4_transposed;run;
proc transpose data = s5 out= s5_transposed;
proc transpose data = s6 out= s6_transposed;run;
proc transpose data = s7 out= s7_transposed;run;
proc transpose data = s8 out= s8_transposed;run;
proc transpose data = s9 out= s9_transposed;run;
proc transpose data = s10 out= s10_transposed;run;
proc transpose data = s11 out= s11_transposed;run;
proc transpose data = s12 out= s12_transposed;run;
/*proc transpose data = s13 out= s13_transposed;run;*/




PROC export data=s0_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_StatusQuo";  RUN;
PROC export data=s1_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_DPVR";  RUN;
PROC export data=s2_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_OralPrEPPregnan";  RUN;
PROC export data=s3_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_CABLAAGYW";  RUN;
PROC export data=s4_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_CABLASwitch";  RUN;
/*PROC export data=s5_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;*/
/*sheet="STOCK_variables_UUMessage";  RUN;*/
PROC export data=s6_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_HIVST";  RUN;
PROC export data=s7_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_HIVSTIndex";  RUN;
PROC export data=s8_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_MensClinic";  RUN;
PROC export data=s9_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_VMMCBoys";  RUN;
PROC export data=s10_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;
sheet="STOCK_variables_VMMCAdults";  RUN;
/*PROC export data=s11_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;*/
/*sheet="STOCK_variables_CBPeer";  RUN;*/
/*PROC export data=s12_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;*/
/*sheet="STOCK_variables_POC";  RUN;*/
/*PROC export data=s13_transposed outFILE= "&pth_export_mihpsa_sa\MIHPSASAP2_SYNTHESIS_20240814" dbms=xlsx REPLACE;*/
/*sheet="STOCK_variables_CondomDist";  RUN;*/


options nomprint;
option nospool;




