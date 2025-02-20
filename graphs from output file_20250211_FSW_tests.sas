
***Program to produce graphs using averages across runs
***Use include statement in analysis program to read the code below in;

libname a "C:\Users\rmjlja9\OneDrive - University College London\MIHPSA Zimbabwe\Phase 2\2025FEB11_FSW_tests";								* dont save on Dropbox;
/*libname a "C:\Users\rmjlja9\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe";*/
proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
proc freq data=a.l_base_11_02_2025_FSW_tests;table option;run;

%let pth_export_mihpsa= C:\Users\rmjlja9\Dropbox (UCL)\MIHPSA Zimbabwe\Phase 2 - Comparison\Results\Originals\Synthesis;run;

** options 31 and 32 have not worked - probably did not update option number in update_r1 statement;


data b;
set a.l_base_11_02_2025_FSW_tests;

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
run;
*In trying to figure out why the PrEP simualtions are not averting infections,
I'm going to select only 5 simulations for each of the 10 datasets;
/*
proc sort data=b;by option run cald;run;
data b;set b;count_provasim+1;by option run cald ;if first.run or first.cald then count_provasim=1;run;
***counts the NUMBER OF RUNS for each dataset to 2023;
proc print data=b; var option run cald count_provasim;run;
data b;set b;where count_provasim in (1 2 3 4 5);run;
*/
proc freq data=a.l_base_11_02_2025_FSW_tests;
table n_sw_inprog_ly*option/nopercent norow;where option in (1 10);run;
proc freq data=b;
table n_sw_inprog_ly*option/nopercent norow;where option in (1 10);run;


proc sort data=b; by option cald run ;run;
proc freq data=b; table cald option;run;
*run_forward_id has not been saved;

proc print data=b; var option cald count_csim;run;
*At the moment is the median across all runs by option;
*Note that we need the same number of simulations/runs from each dataset;
data b;set b;count_csim+1;by option cald ;if first.cald then count_csim=1;run;***counts the number of runs;
 ***number of runs - this is manually inputted in nfit in the macros below;
*93 for all 17/11/24;
proc means max data=b;var count_csim cald;where option=0;run;*93;
proc means max data=b;var count_csim cald;where option=1;run;*93;


/*proc freq data=b;table n_sw_inprog_ly*option/nopercent norow;where option in (0 10);run;*/
%let year_start = 2023;
%let year_end = 2072.75;
run;
/*proc freq data=b;table cald;run;*/
proc sort;by cald option ;run;

*INCLUDE ONLY STOCK VARIABLE AND VARIABLES THAT WE WANT TO GRAPH;
%let var =  
n_alive n_alive_m n_alive_w n_alive_1014m n_alive_1524m n_alive_1524w n_alive_2549m n_alive_2549w n_alive0_
n_alive_014_ 	n_alive_1524_	 n_alive_2564_		n_alive_65pl									
n_sw_1564_		prev_sti_sw  n_sw_program_visit n_sw_inprog_ly  /*n_sw_inprog_ever*/ n_diag_sw_inprog
prop_sw_program_visit n_diag_progsw n_diag_sw
n_hivneg_sdpartner n_hivneg_sdpartneroffart n_hivnegw_sdpartner n_hivnegw_sdpartneroffart
n_not_on_art_cd4050_ n_not_on_art_cd450200_ n_not_on_art_cd4200350_ n_not_on_art_cd4350500_ n_not_on_art_cd4ge500_ 
n_asympt_Undiag n_asympt_diagoffart n_asympt_diagonart n_sympt_notaids n_sympt_aids
n_birth n_give_birth_w_hiv p_w_giv_birth_this_per n_w1524_newp_ge1_ p_newp_ge1_ p_newp_ge5_ p_1524_newp_ge1_ p_ep p_m_npge1_ p_w_npge1_ p_w1524_npge1_ p_sw_npge1_
log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w n_pmtct
p_mcirc_1549m	p_mcirc_1049m	n_new_vmmc1549m 	n_new_vmmc1049m  n_new_vmmc1014m	n_new_birth_circ n_new_mcirc n_new_mcirc_1549m 	n_new_mcirc_1049m
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
n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w n_hiv_sw
prevalence1549m prevalence1549w
prevalence1549_ prevalence_sw prevalence_hiv_preg prevalence1549preg prevalence1524preg prevalence_vg1000_  incidence1549_ incidence1549m incidence1549w incidence1564_ 
incidence1524w incidence1524m incidence2534w incidence2534m incidence3544w incidence3544m incidence4554w incidence4554m 
incidence5564w incidence5564m incidence_sw 
n_new_inf1549_ n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w
n_tested n_tested_m n_tested_w n_tested_sw n_tested_as_sw n_tested_swprog n_tested_anc 
n_tested_m_sympt n_tested_w_sympt n_tested_m_sympt_test n_tested_w_sympt_test
n_tested_m_circ n_tested_symptoms_not_hiv n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd
n_tested_tb n_tested_general n_tested_startprep n_tested_onprep n_tested_rsprep n_tested_prep
n_tested1st_anc n_tested1st_labdel n_tested1st_pd n_tested_anc_prevdiag
n_self_tested 	n_self_tested_m  n_self_tested_w  n_tested_due_to_st			
n_sbcc_visit_1524m 	n_sbcc_visit_1524w n_sbcc_visit_1524_	n_sbcc_visit_2564_ n_sbcc_visit_1564_
n_tested_sbcc_1524m n_tested_sbcc_1524w n_tested_sbcc_2564_ n_tested_sbcc
p_tested_sbcc_1524m p_tested_sbcc_1524w p_tested_sbcc_2564_ p_pos_tested_sbcc
p_anc n_diagnosed n_diag_anc n_diag_labdel n_diag_pd n_diag_sympt n_diag_self_test
test_prop_positive test_proppos_sympt
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w			p_diag_m1524_ 		p_diag_w1524_	p_diag_all_sw	p_diag_sw	
n_cm n_vm p_vm_ly_onart n_pcp_p
p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m p_onart_diag_sw	p_onart_diag_w1524_ p_onart_diag_1524_  
p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_onart_vl1000_1524_ p_vl1000_ 	p_vg1000_ 	p_vg1000_all	
p_onart_vl1000_all	p_onart p_onart_m 	p_onart_w  p_onart_w1524_ p_onart_1524_ p_onart_sw
p_onart_artexp 	p_onart_artexp_m 	p_onart_artexp_w 	p_onart_artexp_1524_ 	p_onart_artexp_sw 	p_on_artexp_w1524evpreg
p_onart_vl1000_w				p_onart_vl1000_m  p_onart_vl1000_w1524evpr logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart 		n_onart_m	n_onart_w n_onart_1524_ n_art_start_y
n_total_yllag 	n_dyll_GBD
n_attend_mens_clinic  n_hiv_mens_clinic  n_diag_mens_clinic  n_onart_mens_clinic
n_access_adolescent_supp  n_hiv_adolescent_supp  s_diag_adolescent_supp  n_onart_adolescent_supp  n_vls_adolescent_supp
n_access_adult_adh_supp  n_hiv_adult_adh_supp  s_diag_adult_adh_supp  n_onart_adult_adh_supp  n_vls_adult_adh_supp
n_access_adult_ret_supp  n_hiv_adult_ret_supp  s_diag_adult_ret_supp  n_onart_adult_ret_supp 
p_adh_hi p_adh_lo

;
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
/*%let p25_var = p25_&var._&s;*/
/*%let p75_var = p75_&var._&s;*/
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
/*p25_&varb._&s  = PCTL(25,of &varb.1-&varb.&nfit);*/
/*p75_&varb._&s = PCTL(75,of &varb.1-&varb.&nfit);*/
p5_&varb._&s  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._&s = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._&s = median(of &varb.1-&varb.&nfit);

keep cald p5_&varb._&s p95_&varb._&s p50_&varb._&s /*p25_&varb._&s p75_&varb._&s*/;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;

*We need the same number of simulations for each option;
%let nfit=84;
%option_(0);
%option_(1);
/*%option_(2);*/
/*%option_(4);*/
/*%option_(5);*/
/*%option_(7);*/
%option_(8);
/*%option_(10);*/
/*%option_(11);*/
/*%option_(12);*/
/*%option_(13);*/
/*%option_(14);*/
/*%option_(15);*/
/*%option_(16);*/
/*%option_(18);*/
/*%option_(19);*/
/*%option_(20);*/
/*%option_(21);*/
/*%option_(22);*/
/*%option_(23);*/
/*%option_(24);*/
/*%option_(25);*/
/*%option_(27);*/
/*%option_(28);*/
/*%option_(29);*/
/*%option_(30);*/
%option_(31);
%option_(32);
%option_(33);
run;


data d_a; * this is number of variables in %let var = above ;
merge 
g0_1   g0_2   g0_3   g0_4   g0_5   g0_6   g0_7   g0_8   g0_9   g0_10  g0_11  g0_12  g0_13  g0_14  g0_15  g0_16  g0_17  g0_18  g0_19  g0_20  g0_21  g0_22  g0_23  g0_24  g0_25  
g0_26  g0_27  g0_28  g0_29  g0_30  g0_31  g0_32  g0_33  g0_34  g0_35  g0_36  g0_37  g0_38  g0_39  g0_40  g0_41  g0_42  g0_43  g0_44  g0_45  g0_46  g0_47  g0_48  g0_49  g0_50 
g0_51  g0_52  g0_53  g0_54  g0_55  g0_56  g0_57  g0_58  g0_59  g0_60  g0_61  g0_62  g0_63  g0_64  g0_65  g0_66  g0_67  g0_68  g0_69  g0_70  g0_71  g0_72  g0_73  g0_74  g0_75  
g0_76  g0_77  g0_78  g0_79  g0_80  g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90  g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99  g0_100 
g0_101 g0_102 g0_103 g0_104 g0_105 g0_106 g0_107 g0_108 g0_109 g0_110 g0_111 g0_112 g0_113 g0_114 g0_115 g0_116 g0_117 g0_118 g0_119 g0_120 g0_121 g0_122 g0_123 g0_124 g0_125 
g0_126 g0_127 g0_128 g0_129 g0_130 g0_131 g0_132 g0_133 g0_134 g0_135 g0_136 g0_137 g0_138 g0_139 g0_140 g0_141 g0_142 g0_143 g0_144 g0_145 g0_146 g0_147 g0_148 g0_149 g0_150 
g0_151 g0_152 g0_153 g0_154 g0_155 g0_156 g0_157 g0_158 g0_159 g0_160 g0_161 g0_162 g0_163 g0_164 g0_165 g0_166 g0_167 g0_168 g0_169 g0_170 g0_171 g0_172 g0_173 g0_174 g0_175 
g0_176 g0_177 g0_178 g0_179 g0_180 g0_181 g0_182 g0_183 g0_184 g0_185 g0_186 g0_187 g0_188 g0_189 g0_190 g0_191 g0_192 g0_193 g0_194 g0_195 g0_196 g0_197 g0_198 g0_199 g0_200 
g0_201 g0_202 g0_203 g0_204 g0_205 g0_206 g0_207 g0_208 g0_209 g0_210 g0_211 g0_212 g0_213 g0_214 g0_215 g0_216 g0_217 g0_218 g0_219 g0_220 g0_221 g0_222 g0_223 g0_224 g0_225 
g0_226 g0_227 g0_228 g0_229 g0_230 g0_231 g0_232 g0_233 g0_234 g0_235 g0_236 g0_237 g0_238 g0_239 g0_240 g0_241 g0_242 g0_243 g0_244 g0_245 g0_246 g0_247 g0_248 g0_249 g0_250 
g0_251 g0_252 g0_253 g0_254 g0_255 g0_256 g0_257 g0_258 g0_259 g0_260 g0_261 g0_262 g0_263 g0_264 g0_265 g0_266 g0_267 g0_268 g0_269 g0_270 g0_271 g0_272 g0_273 g0_274 g0_275 
g0_276 g0_277 g0_278 g0_279 g0_280 g0_281 g0_282 g0_283 g0_284 g0_285 

g1_1   g1_2   g1_3   g1_4   g1_5   g1_6   g1_7   g1_8   g1_9   g1_10  g1_11  g1_12  g1_13  g1_14  g1_15  g1_16  g1_17  g1_18  g1_19  g1_20  g1_21  g1_22  g1_23  g1_24  g1_25  
g1_26  g1_27  g1_28  g1_29  g1_30  g1_31  g1_32  g1_33  g1_34  g1_35  g1_36  g1_37  g1_38  g1_39  g1_40  g1_41  g1_42  g1_43  g1_44  g1_45  g1_46  g1_47  g1_48  g1_49  g1_50 
g1_51  g1_52  g1_53  g1_54  g1_55  g1_56  g1_57  g1_58  g1_59  g1_60  g1_61  g1_62  g1_63  g1_64  g1_65  g1_66  g1_67  g1_68  g1_69  g1_70  g1_71  g1_72  g1_73  g1_74  g1_75  
g1_76  g1_77  g1_78  g1_79  g1_80  g1_81  g1_82  g1_83  g1_84  g1_85  g1_86  g1_87  g1_88  g1_89  g1_90  g1_91  g1_92  g1_93  g1_94  g1_95  g1_96  g1_97  g1_98  g1_99  g1_100 
g1_101 g1_102 g1_103 g1_104 g1_105 g1_106 g1_107 g1_108 g1_109 g1_110 g1_111 g1_112 g1_113 g1_114 g1_115 g1_116 g1_117 g1_118 g1_119 g1_120 g1_121 g1_122 g1_123 g1_124 g1_125 
g1_126 g1_127 g1_128 g1_129 g1_130 g1_131 g1_132 g1_133 g1_134 g1_135 g1_136 g1_137 g1_138 g1_139 g1_140 g1_141 g1_142 g1_143 g1_144 g1_145 g1_146 g1_147 g1_148 g1_149 g1_150 
g1_151 g1_152 g1_153 g1_154 g1_155 g1_156 g1_157 g1_158 g1_159 g1_160 g1_161 g1_162 g1_163 g1_164 g1_165 g1_166 g1_167 g1_168 g1_169 g1_170 g1_171 g1_172 g1_173 g1_174 g1_175 
g1_176 g1_177 g1_178 g1_179 g1_180 g1_181 g1_182 g1_183 g1_184 g1_185 g1_186 g1_187 g1_188 g1_189 g1_190 g1_191 g1_192 g1_193 g1_194 g1_195 g1_196 g1_197 g1_198 g1_199 g1_200 
g1_201 g1_202 g1_203 g1_204 g1_205 g1_206 g1_207 g1_208 g1_209 g1_210 g1_211 g1_212 g1_213 g1_214 g1_215 g1_216 g1_217 g1_218 g1_219 g1_220 g1_221 g1_222 g1_223 g1_224 g1_225 
g1_226 g1_227 g1_228 g1_229 g1_230 g1_231 g1_232 g1_233 g1_234 g1_235 g1_236 g1_237 g1_238 g1_239 g1_240 g1_241 g1_242 g1_243 g1_244 g1_245 g1_246 g1_247 g1_248 g1_249 g1_250 
g1_251 g1_252 g1_253 g1_254 g1_255 g1_256 g1_257 g1_258 g1_259 g1_260 g1_261 g1_262 g1_263 g1_264 g1_265 g1_266 g1_267 g1_268 g1_269 g1_270 g1_271 g1_272 g1_273 g1_274 g1_275 
g1_276 g1_277 g1_278 g1_279 g1_280 g1_281 g1_282 g1_283 g1_284 g1_285
;
by cald;run;


/*data d_b; * this is number of variables in %let var = above ;*/
/*merge */
/*g2_1   g2_2   g2_3   g2_4   g2_5   g2_6   g2_7   g2_8   g2_9   g2_10  g2_11  g2_12  g2_13  g2_14  g2_15  g2_16  g2_17  g2_18  g2_19  g2_20  g2_21  g2_22  g2_23  g2_24  g2_25  */
/*g2_26  g2_27  g2_28  g2_29  g2_30  g2_31  g2_32  g2_33  g2_34  g2_35  g2_36  g2_37  g2_38  g2_39  g2_40  g2_41  g2_42  g2_43  g2_44  g2_45  g2_46  g2_47  g2_48  g2_49  g2_50 */
/*g2_51  g2_52  g2_53  g2_54  g2_55  g2_56  g2_57  g2_58  g2_59  g2_60  g2_61  g2_62  g2_63  g2_64  g2_65  g2_66  g2_67  g2_68  g2_69  g2_70  g2_71  g2_72  g2_73  g2_74  g2_75  */
/*g2_76  g2_77  g2_78  g2_79  g2_80  g2_81  g2_82  g2_83  g2_84  g2_85  g2_86  g2_87  g2_88  g2_89  g2_90  g2_91  g2_92  g2_93  g2_94  g2_95  g2_96  g2_97  g2_98  g2_99  g2_100 */
/*g2_101 g2_102 g2_103 g2_104 g2_105 g2_106 g2_107 g2_108 g2_109 g2_110 g2_111 g2_112 g2_113 g2_114 g2_115 g2_116 g2_117 g2_118 g2_119 g2_120 g2_121 g2_122 g2_123 g2_124 g2_125 */
/*g2_126 g2_127 g2_128 g2_129 g2_130 g2_131 g2_132 g2_133 g2_134 g2_135 g2_136 g2_137 g2_138 g2_139 g2_140 g2_141 g2_142 g2_143 g2_144 g2_145 g2_146 g2_147 g2_148 g2_149 g2_150 */
/*g2_151 g2_152 g2_153 g2_154 g2_155 g2_156 g2_157 g2_158 g2_159 g2_160 g2_161 g2_162 g2_163 g2_164 g2_165 g2_166 g2_167 g2_168 g2_169 g2_170 g2_171 g2_172 g2_173 g2_174 g2_175 */
/*g2_176 g2_177 g2_178 g2_179 g2_180 g2_181 g2_182 g2_183 g2_184 g2_185 g2_186 g2_187 g2_188 g2_189 g2_190 g2_191 g2_192 g2_193 g2_194 g2_195 g2_196 g2_197 g2_198 g2_199 g2_200 */
/*g2_201 g2_202 g2_203 g2_204 g2_205 g2_206 g2_207 g2_208 g2_209 g2_210 g2_211 g2_212 g2_213 g2_214 g2_215 g2_216 g2_217 g2_218 g2_219 g2_220 g2_221 g2_222 g2_223 g2_224 g2_225 */
/*g2_226 g2_227 g2_228 g2_229 g2_230 g2_231 g2_232 g2_233 g2_234 g2_235 g2_236 g2_237 g2_238 g2_239 g2_240 g2_241 g2_242 g2_243 g2_244 g2_245 g2_246 g2_247 g2_248 g2_249 g2_250 */
/*g2_251 g2_252 g2_253 g2_254 g2_255 g2_256 g2_257 g2_258 g2_259 g2_260 g2_261 g2_262 g2_263 g2_264 g2_265 g2_266 g2_267 g2_268 g2_269 g2_270 g2_271 g2_272 g2_273 g2_274 g2_275 */
/*g2_276 g2_277 g2_278 g2_279 g2_280 g2_281 g2_282 g2_283 g2_284 g2_285*/
/**/
/*g4_1   g4_2   g4_3   g4_4   g4_5   g4_6   g4_7   g4_8   g4_9   g4_10  g4_11  g4_12  g4_13  g4_14  g4_15  g4_16  g4_17  g4_18  g4_19  g4_20  g4_21  g4_22  g4_23  g4_24  g4_25  */
/*g4_26  g4_27  g4_28  g4_29  g4_30  g4_31  g4_32  g4_33  g4_34  g4_35  g4_36  g4_37  g4_38  g4_39  g4_40  g4_41  g4_42  g4_43  g4_44  g4_45  g4_46  g4_47  g4_48  g4_49  g4_50 */
/*g4_51  g4_52  g4_53  g4_54  g4_55  g4_56  g4_57  g4_58  g4_59  g4_60  g4_61  g4_62  g4_63  g4_64  g4_65  g4_66  g4_67  g4_68  g4_69  g4_70  g4_71  g4_72  g4_73  g4_74  g4_75  */
/*g4_76  g4_77  g4_78  g4_79  g4_80  g4_81  g4_82  g4_83  g4_84  g4_85  g4_86  g4_87  g4_88  g4_89  g4_90  g4_91  g4_92  g4_93  g4_94  g4_95  g4_96  g4_97  g4_98  g4_99  g4_100 */
/*g4_101 g4_102 g4_103 g4_104 g4_105 g4_106 g4_107 g4_108 g4_109 g4_110 g4_111 g4_112 g4_113 g4_114 g4_115 g4_116 g4_117 g4_118 g4_119 g4_120 g4_121 g4_122 g4_123 g4_124 g4_125 */
/*g4_126 g4_127 g4_128 g4_129 g4_130 g4_131 g4_132 g4_133 g4_134 g4_135 g4_136 g4_137 g4_138 g4_139 g4_140 g4_141 g4_142 g4_143 g4_144 g4_145 g4_146 g4_147 g4_148 g4_149 g4_150 */
/*g4_151 g4_152 g4_153 g4_154 g4_155 g4_156 g4_157 g4_158 g4_159 g4_160 g4_161 g4_162 g4_163 g4_164 g4_165 g4_166 g4_167 g4_168 g4_169 g4_170 g4_171 g4_172 g4_173 g4_174 g4_175 */
/*g4_176 g4_177 g4_178 g4_179 g4_180 g4_181 g4_182 g4_183 g4_184 g4_185 g4_186 g4_187 g4_188 g4_189 g4_190 g4_191 g4_192 g4_193 g4_194 g4_195 g4_196 g4_197 g4_198 g4_199 g4_200 */
/*g4_201 g4_202 g4_203 g4_204 g4_205 g4_206 g4_207 g4_208 g4_209 g4_210 g4_211 g4_212 g4_213 g4_214 g4_215 g4_216 g4_217 g4_218 g4_219 g4_220 g4_221 g4_222 g4_223 g4_224 g4_225 */
/*g4_226 g4_227 g4_228 g4_229 g4_230 g4_231 g4_232 g4_233 g4_234 g4_235 g4_236 g4_237 g4_238 g4_239 g4_240 g4_241 g4_242 g4_243 g4_244 g4_245 g4_246 g4_247 g4_248 g4_249 g4_250 */
/*g4_251 g4_252 g4_253 g4_254 g4_255 g4_256 g4_257 g4_258 g4_259 g4_260 g4_261 g4_262 g4_263 g4_264 g4_265 g4_266 g4_267 g4_268 g4_269 g4_270 g4_271 g4_272 g4_273 g4_274 g4_275 */
/*g4_276 g4_277 g4_278 g4_279 g4_280 g4_281 g4_282 g4_283 g4_284 g4_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_c; * this is number of variables in %let var = above ;*/
/*merge */
/*g5_1   g5_2   g5_3   g5_4   g5_5   g5_6   g5_7   g5_8   g5_9   g5_10  g5_11  g5_12  g5_13  g5_14  g5_15  g5_16  g5_17  g5_18  g5_19  g5_20  g5_21  g5_22  g5_23  g5_24  g5_25  */
/*g5_26  g5_27  g5_28  g5_29  g5_30  g5_31  g5_32  g5_33  g5_34  g5_35  g5_36  g5_37  g5_38  g5_39  g5_40  g5_41  g5_42  g5_43  g5_44  g5_45  g5_46  g5_47  g5_48  g5_49  g5_50 */
/*g5_51  g5_52  g5_53  g5_54  g5_55  g5_56  g5_57  g5_58  g5_59  g5_60  g5_61  g5_62  g5_63  g5_64  g5_65  g5_66  g5_67  g5_68  g5_69  g5_70  g5_71  g5_72  g5_73  g5_74  g5_75  */
/*g5_76  g5_77  g5_78  g5_79  g5_80  g5_81  g5_82  g5_83  g5_84  g5_85  g5_86  g5_87  g5_88  g5_89  g5_90  g5_91  g5_92  g5_93  g5_94  g5_95  g5_96  g5_97  g5_98  g5_99  g5_100 */
/*g5_101 g5_102 g5_103 g5_104 g5_105 g5_106 g5_107 g5_108 g5_109 g5_110 g5_111 g5_112 g5_113 g5_114 g5_115 g5_116 g5_117 g5_118 g5_119 g5_120 g5_121 g5_122 g5_123 g5_124 g5_125 */
/*g5_126 g5_127 g5_128 g5_129 g5_130 g5_131 g5_132 g5_133 g5_134 g5_135 g5_136 g5_137 g5_138 g5_139 g5_140 g5_141 g5_142 g5_143 g5_144 g5_145 g5_146 g5_147 g5_148 g5_149 g5_150 */
/*g5_151 g5_152 g5_153 g5_154 g5_155 g5_156 g5_157 g5_158 g5_159 g5_160 g5_161 g5_162 g5_163 g5_164 g5_165 g5_166 g5_167 g5_168 g5_169 g5_170 g5_171 g5_172 g5_173 g5_174 g5_175 */
/*g5_176 g5_177 g5_178 g5_179 g5_180 g5_181 g5_182 g5_183 g5_184 g5_185 g5_186 g5_187 g5_188 g5_189 g5_190 g5_191 g5_192 g5_193 g5_194 g5_195 g5_196 g5_197 g5_198 g5_199 g5_200 */
/*g5_201 g5_202 g5_203 g5_204 g5_205 g5_206 g5_207 g5_208 g5_209 g5_210 g5_211 g5_212 g5_213 g5_214 g5_215 g5_216 g5_217 g5_218 g5_219 g5_220 g5_221 g5_222 g5_223 g5_224 g5_225 */
/*g5_226 g5_227 g5_228 g5_229 g5_230 g5_231 g5_232 g5_233 g5_234 g5_235 g5_236 g5_237 g5_238 g5_239 g5_240 g5_241 g5_242 g5_243 g5_244 g5_245 g5_246 g5_247 g5_248 g5_249 g5_250 */
/*g5_251 g5_252 g5_253 g5_254 g5_255 g5_256 g5_257 g5_258 g5_259 g5_260 g5_261 g5_262 g5_263 g5_264 g5_265 g5_266 g5_267 g5_268 g5_269 g5_270 g5_271 g5_272 g5_273 g5_274 g5_275 */
/*g5_276 g5_277 g5_278 g5_279 g5_280 g5_281 g5_282 g5_283 g5_284 g5_285*/
/**/
/*g7_1   g7_2   g7_3   g7_4   g7_5   g7_6   g7_7   g7_8   g7_9   g7_10  g7_11  g7_12  g7_13  g7_14  g7_15  g7_16  g7_17  g7_18  g7_19  g7_20  g7_21  g7_22  g7_23  g7_24  g7_25  */
/*g7_26  g7_27  g7_28  g7_29  g7_30  g7_31  g7_32  g7_33  g7_34  g7_35  g7_36  g7_37  g7_38  g7_39  g7_40  g7_41  g7_42  g7_43  g7_44  g7_45  g7_46  g7_47  g7_48  g7_49  g7_50 */
/*g7_51  g7_52  g7_53  g7_54  g7_55  g7_56  g7_57  g7_58  g7_59  g7_60  g7_61  g7_62  g7_63  g7_64  g7_65  g7_66  g7_67  g7_68  g7_69  g7_70  g7_71  g7_72  g7_73  g7_74  g7_75  */
/*g7_76  g7_77  g7_78  g7_79  g7_80  g7_81  g7_82  g7_83  g7_84  g7_85  g7_86  g7_87  g7_88  g7_89  g7_90  g7_91  g7_92  g7_93  g7_94  g7_95  g7_96  g7_97  g7_98  g7_99  g7_100 */
/*g7_101 g7_102 g7_103 g7_104 g7_105 g7_106 g7_107 g7_108 g7_109 g7_110 g7_111 g7_112 g7_113 g7_114 g7_115 g7_116 g7_117 g7_118 g7_119 g7_120 g7_121 g7_122 g7_123 g7_124 g7_125 */
/*g7_126 g7_127 g7_128 g7_129 g7_130 g7_131 g7_132 g7_133 g7_134 g7_135 g7_136 g7_137 g7_138 g7_139 g7_140 g7_141 g7_142 g7_143 g7_144 g7_145 g7_146 g7_147 g7_148 g7_149 g7_150 */
/*g7_151 g7_152 g7_153 g7_154 g7_155 g7_156 g7_157 g7_158 g7_159 g7_160 g7_161 g7_162 g7_163 g7_164 g7_165 g7_166 g7_167 g7_168 g7_169 g7_170 g7_171 g7_172 g7_173 g7_174 g7_175 */
/*g7_176 g7_177 g7_178 g7_179 g7_180 g7_181 g7_182 g7_183 g7_184 g7_185 g7_186 g7_187 g7_188 g7_189 g7_190 g7_191 g7_192 g7_193 g7_194 g7_195 g7_196 g7_197 g7_198 g7_199 g7_200 */
/*g7_201 g7_202 g7_203 g7_204 g7_205 g7_206 g7_207 g7_208 g7_209 g7_210 g7_211 g7_212 g7_213 g7_214 g7_215 g7_216 g7_217 g7_218 g7_219 g7_220 g7_221 g7_222 g7_223 g7_224 g7_225 */
/*g7_226 g7_227 g7_228 g7_229 g7_230 g7_231 g7_232 g7_233 g7_234 g7_235 g7_236 g7_237 g7_238 g7_239 g7_240 g7_241 g7_242 g7_243 g7_244 g7_245 g7_246 g7_247 g7_248 g7_249 g7_250 */
/*g7_251 g7_252 g7_253 g7_254 g7_255 g7_256 g7_257 g7_258 g7_259 g7_260 g7_261 g7_262 g7_263 g7_264 g7_265 g7_266 g7_267 g7_268 g7_269 g7_270 g7_271 g7_272 g7_273 g7_274 g7_275 */
/*g7_276 g7_277 g7_278 g7_279 g7_280 g7_281 g7_282 g7_283 g7_284 g7_285*/
/*;*/
/*run;*/

data d_d; * this is number of variables in %let var = above ;
merge 
g8_1   g8_2   g8_3   g8_4   g8_5   g8_6   g8_7   g8_8   g8_9   g8_10  g8_11  g8_12  g8_13  g8_14  g8_15  g8_16  g8_17  g8_18  g8_19  g8_20  g8_21  g8_22  g8_23  g8_24  g8_25  
g8_26  g8_27  g8_28  g8_29  g8_30  g8_31  g8_32  g8_33  g8_34  g8_35  g8_36  g8_37  g8_38  g8_39  g8_40  g8_41  g8_42  g8_43  g8_44  g8_45  g8_46  g8_47  g8_48  g8_49  g8_50 
g8_51  g8_52  g8_53  g8_54  g8_55  g8_56  g8_57  g8_58  g8_59  g8_60  g8_61  g8_62  g8_63  g8_64  g8_65  g8_66  g8_67  g8_68  g8_69  g8_70  g8_71  g8_72  g8_73  g8_74  g8_75  
g8_76  g8_77  g8_78  g8_79  g8_80  g8_81  g8_82  g8_83  g8_84  g8_85  g8_86  g8_87  g8_88  g8_89  g8_90  g8_91  g8_92  g8_93  g8_94  g8_95  g8_96  g8_97  g8_98  g8_99  g8_100 
g8_101 g8_102 g8_103 g8_104 g8_105 g8_106 g8_107 g8_108 g8_109 g8_110 g8_111 g8_112 g8_113 g8_114 g8_115 g8_116 g8_117 g8_118 g8_119 g8_120 g8_121 g8_122 g8_123 g8_124 g8_125 
g8_126 g8_127 g8_128 g8_129 g8_130 g8_131 g8_132 g8_133 g8_134 g8_135 g8_136 g8_137 g8_138 g8_139 g8_140 g8_141 g8_142 g8_143 g8_144 g8_145 g8_146 g8_147 g8_148 g8_149 g8_150 
g8_151 g8_152 g8_153 g8_154 g8_155 g8_156 g8_157 g8_158 g8_159 g8_160 g8_161 g8_162 g8_163 g8_164 g8_165 g8_166 g8_167 g8_168 g8_169 g8_170 g8_171 g8_172 g8_173 g8_174 g8_175 
g8_176 g8_177 g8_178 g8_179 g8_180 g8_181 g8_182 g8_183 g8_184 g8_185 g8_186 g8_187 g8_188 g8_189 g8_190 g8_191 g8_192 g8_193 g8_194 g8_195 g8_196 g8_197 g8_198 g8_199 g8_200 
g8_201 g8_202 g8_203 g8_204 g8_205 g8_206 g8_207 g8_208 g8_209 g8_210 g8_211 g8_212 g8_213 g8_214 g8_215 g8_216 g8_217 g8_218 g8_219 g8_220 g8_221 g8_222 g8_223 g8_224 g8_225 
g8_226 g8_227 g8_228 g8_229 g8_230 g8_231 g8_232 g8_233 g8_234 g8_235 g8_236 g8_237 g8_238 g8_239 g8_240 g8_241 g8_242 g8_243 g8_244 g8_245 g8_246 g8_247 g8_248 g8_249 g8_250 
g8_251 g8_252 g8_253 g8_254 g8_255 g8_256 g8_257 g8_258 g8_259 g8_260 g8_261 g8_262 g8_263 g8_264 g8_265 g8_266 g8_267 g8_268 g8_269 g8_270 g8_271 g8_272 g8_273 g8_274 g8_275 
g8_276 g8_277 g8_278 g8_279 g8_280 g8_281 g8_282 g8_283 g8_284 g8_285

/*g10_1   g10_2   g10_3   g10_4   g10_5   g10_6   g10_7   g10_8   g10_9   g10_10  g10_11  g10_12  g10_13  g10_14  g10_15  g10_16  g10_17  g10_18  g10_19  g10_20  g10_21  g10_22  g10_23  g10_24  g10_25  */
/*g10_26  g10_27  g10_28  g10_29  g10_30  g10_31  g10_32  g10_33  g10_34  g10_35  g10_36  g10_37  g10_38  g10_39  g10_40  g10_41  g10_42  g10_43  g10_44  g10_45  g10_46  g10_47  g10_48  g10_49  g10_50 */
/*g10_51  g10_52  g10_53  g10_54  g10_55  g10_56  g10_57  g10_58  g10_59  g10_60  g10_61  g10_62  g10_63  g10_64  g10_65  g10_66  g10_67  g10_68  g10_69  g10_70  g10_71  g10_72  g10_73  g10_74  g10_75  */
/*g10_76  g10_77  g10_78  g10_79  g10_80  g10_81  g10_82  g10_83  g10_84  g10_85  g10_86  g10_87  g10_88  g10_89  g10_90  g10_91  g10_92  g10_93  g10_94  g10_95  g10_96  g10_97  g10_98  g10_99  g10_100 */
/*g10_101 g10_102 g10_103 g10_104 g10_105 g10_106 g10_107 g10_108 g10_109 g10_110 g10_111 g10_112 g10_113 g10_114 g10_115 g10_116 g10_117 g10_118 g10_119 g10_120 g10_121 g10_122 g10_123 g10_124 g10_125 */
/*g10_126 g10_127 g10_128 g10_129 g10_130 g10_131 g10_132 g10_133 g10_134 g10_135 g10_136 g10_137 g10_138 g10_139 g10_140 g10_141 g10_142 g10_143 g10_144 g10_145 g10_146 g10_147 g10_148 g10_149 g10_150 */
/*g10_151 g10_152 g10_153 g10_154 g10_155 g10_156 g10_157 g10_158 g10_159 g10_160 g10_161 g10_162 g10_163 g10_164 g10_165 g10_166 g10_167 g10_168 g10_169 g10_170 g10_171 g10_172 g10_173 g10_174 g10_175 */
/*g10_176 g10_177 g10_178 g10_179 g10_180 g10_181 g10_182 g10_183 g10_184 g10_185 g10_186 g10_187 g10_188 g10_189 g10_190 g10_191 g10_192 g10_193 g10_194 g10_195 g10_196 g10_197 g10_198 g10_199 g10_200 */
/*g10_201 g10_202 g10_203 g10_204 g10_205 g10_206 g10_207 g10_208 g10_209 g10_210 g10_211 g10_212 g10_213 g10_214 g10_215 g10_216 g10_217 g10_218 g10_219 g10_220 g10_221 g10_222 g10_223 g10_224 g10_225 */
/*g10_226 g10_227 g10_228 g10_229 g10_230 g10_231 g10_232 g10_233 g10_234 g10_235 g10_236 g10_237 g10_238 g10_239 g10_240 g10_241 g10_242 g10_243 g10_244 g10_245 g10_246 g10_247 g10_248 g10_249 g10_250 */
/*g10_251 g10_252 g10_253 g10_254 g10_255 g10_256 g10_257 g10_258 g10_259 g10_260 g10_261 g10_262 g10_263 g10_264 g10_265 g10_266 g10_267 g10_268 g10_269 g10_270 g10_271 g10_272 g10_273 g10_274 g10_275 */
/*g10_276 g10_277 g10_278 g10_279 g10_280 g10_281 g10_282 g10_283 g10_284 g10_285*/
;
run;


/*data d_e; * this is number of variables in %let var = above ;*/
/*merge */
/*g11_1   g11_2   g11_3   g11_4   g11_5   g11_6   g11_7   g11_8   g11_9   g11_10  g11_11  g11_12  g11_13  g11_14  g11_15  g11_16  g11_17  g11_18  g11_19  g11_20  g11_21  g11_22  g11_23  g11_24  g11_25  */
/*g11_26  g11_27  g11_28  g11_29  g11_30  g11_31  g11_32  g11_33  g11_34  g11_35  g11_36  g11_37  g11_38  g11_39  g11_40  g11_41  g11_42  g11_43  g11_44  g11_45  g11_46  g11_47  g11_48  g11_49  g11_50 */
/*g11_51  g11_52  g11_53  g11_54  g11_55  g11_56  g11_57  g11_58  g11_59  g11_60  g11_61  g11_62  g11_63  g11_64  g11_65  g11_66  g11_67  g11_68  g11_69  g11_70  g11_71  g11_72  g11_73  g11_74  g11_75  */
/*g11_76  g11_77  g11_78  g11_79  g11_80  g11_81  g11_82  g11_83  g11_84  g11_85  g11_86  g11_87  g11_88  g11_89  g11_90  g11_91  g11_92  g11_93  g11_94  g11_95  g11_96  g11_97  g11_98  g11_99  g11_100 */
/*g11_101 g11_102 g11_103 g11_104 g11_105 g11_106 g11_107 g11_108 g11_109 g11_110 g11_111 g11_112 g11_113 g11_114 g11_115 g11_116 g11_117 g11_118 g11_119 g11_120 g11_121 g11_122 g11_123 g11_124 g11_125 */
/*g11_126 g11_127 g11_128 g11_129 g11_130 g11_131 g11_132 g11_133 g11_134 g11_135 g11_136 g11_137 g11_138 g11_139 g11_140 g11_141 g11_142 g11_143 g11_144 g11_145 g11_146 g11_147 g11_148 g11_149 g11_150 */
/*g11_151 g11_152 g11_153 g11_154 g11_155 g11_156 g11_157 g11_158 g11_159 g11_160 g11_161 g11_162 g11_163 g11_164 g11_165 g11_166 g11_167 g11_168 g11_169 g11_170 g11_171 g11_172 g11_173 g11_174 g11_175 */
/*g11_176 g11_177 g11_178 g11_179 g11_180 g11_181 g11_182 g11_183 g11_184 g11_185 g11_186 g11_187 g11_188 g11_189 g11_190 g11_191 g11_192 g11_193 g11_194 g11_195 g11_196 g11_197 g11_198 g11_199 g11_200 */
/*g11_201 g11_202 g11_203 g11_204 g11_205 g11_206 g11_207 g11_208 g11_209 g11_210 g11_211 g11_212 g11_213 g11_214 g11_215 g11_216 g11_217 g11_218 g11_219 g11_220 g11_221 g11_222 g11_223 g11_224 g11_225 */
/*g11_226 g11_227 g11_228 g11_229 g11_230 g11_231 g11_232 g11_233 g11_234 g11_235 g11_236 g11_237 g11_238 g11_239 g11_240 g11_241 g11_242 g11_243 g11_244 g11_245 g11_246 g11_247 g11_248 g11_249 g11_250 */
/*g11_251 g11_252 g11_253 g11_254 g11_255 g11_256 g11_257 g11_258 g11_259 g11_260 g11_261 g11_262 g11_263 g11_264 g11_265 g11_266 g11_267 g11_268 g11_269 g11_270 g11_271 g11_272 g11_273 g11_274 g11_275 */
/*g11_276 g11_277 g11_278 g11_279 g11_280 g11_281 g11_282 g11_283 g11_284 g11_285 */
/**/
/*g12_1   g12_2   g12_3   g12_4   g12_5   g12_6   g12_7   g12_8   g12_9   g12_10  g12_11  g12_12  g12_13  g12_14  g12_15  g12_16  g12_17  g12_18  g12_19  g12_20  g12_21  g12_22  g12_23  g12_24  g12_25  */
/*g12_26  g12_27  g12_28  g12_29  g12_30  g12_31  g12_32  g12_33  g12_34  g12_35  g12_36  g12_37  g12_38  g12_39  g12_40  g12_41  g12_42  g12_43  g12_44  g12_45  g12_46  g12_47  g12_48  g12_49  g12_50 */
/*g12_51  g12_52  g12_53  g12_54  g12_55  g12_56  g12_57  g12_58  g12_59  g12_60  g12_61  g12_62  g12_63  g12_64  g12_65  g12_66  g12_67  g12_68  g12_69  g12_70  g12_71  g12_72  g12_73  g12_74  g12_75  */
/*g12_76  g12_77  g12_78  g12_79  g12_80  g12_81  g12_82  g12_83  g12_84  g12_85  g12_86  g12_87  g12_88  g12_89  g12_90  g12_91  g12_92  g12_93  g12_94  g12_95  g12_96  g12_97  g12_98  g12_99  g12_100 */
/*g12_101 g12_102 g12_103 g12_104 g12_105 g12_106 g12_107 g12_108 g12_109 g12_110 g12_111 g12_112 g12_113 g12_114 g12_115 g12_116 g12_117 g12_118 g12_119 g12_120 g12_121 g12_122 g12_123 g12_124 g12_125 */
/*g12_126 g12_127 g12_128 g12_129 g12_130 g12_131 g12_132 g12_133 g12_134 g12_135 g12_136 g12_137 g12_138 g12_139 g12_140 g12_141 g12_142 g12_143 g12_144 g12_145 g12_146 g12_147 g12_148 g12_149 g12_150 */
/*g12_151 g12_152 g12_153 g12_154 g12_155 g12_156 g12_157 g12_158 g12_159 g12_160 g12_161 g12_162 g12_163 g12_164 g12_165 g12_166 g12_167 g12_168 g12_169 g12_170 g12_171 g12_172 g12_173 g12_174 g12_175 */
/*g12_176 g12_177 g12_178 g12_179 g12_180 g12_181 g12_182 g12_183 g12_184 g12_185 g12_186 g12_187 g12_188 g12_189 g12_190 g12_191 g12_192 g12_193 g12_194 g12_195 g12_196 g12_197 g12_198 g12_199 g12_200 */
/*g12_201 g12_202 g12_203 g12_204 g12_205 g12_206 g12_207 g12_208 g12_209 g12_210 g12_211 g12_212 g12_213 g12_214 g12_215 g12_216 g12_217 g12_218 g12_219 g12_220 g12_221 g12_222 g12_223 g12_224 g12_225 */
/*g12_226 g12_227 g12_228 g12_229 g12_230 g12_231 g12_232 g12_233 g12_234 g12_235 g12_236 g12_237 g12_238 g12_239 g12_240 g12_241 g12_242 g12_243 g12_244 g12_245 g12_246 g12_247 g12_248 g12_249 g12_250 */
/*g12_251 g12_252 g12_253 g12_254 g12_255 g12_256 g12_257 g12_258 g12_259 g12_260 g12_261 g12_262 g12_263 g12_264 g12_265 g12_266 g12_267 g12_268 g12_269 g12_270 g12_271 g12_272 g12_273 g12_274 g12_275 */
/*g12_276 g12_277 g12_278 g12_279 g12_280 g12_281 g12_282 g12_283 g12_284 g12_285*/
/*;*/
/*run;*/
/**/
/*data d_f; * this is number of variables in %let var = above ;*/
/*merge */
/*g13_1   g13_2   g13_3   g13_4   g13_5   g13_6   g13_7   g13_8   g13_9   g13_10  g13_11  g13_12  g13_13  g13_14  g13_15  g13_16  g13_17  g13_18  g13_19  g13_20  g13_21  g13_22  g13_23  g13_24  g13_25  */
/*g13_26  g13_27  g13_28  g13_29  g13_30  g13_31  g13_32  g13_33  g13_34  g13_35  g13_36  g13_37  g13_38  g13_39  g13_40  g13_41  g13_42  g13_43  g13_44  g13_45  g13_46  g13_47  g13_48  g13_49  g13_50 */
/*g13_51  g13_52  g13_53  g13_54  g13_55  g13_56  g13_57  g13_58  g13_59  g13_60  g13_61  g13_62  g13_63  g13_64  g13_65  g13_66  g13_67  g13_68  g13_69  g13_70  g13_71  g13_72  g13_73  g13_74  g13_75  */
/*g13_76  g13_77  g13_78  g13_79  g13_80  g13_81  g13_82  g13_83  g13_84  g13_85  g13_86  g13_87  g13_88  g13_89  g13_90  g13_91  g13_92  g13_93  g13_94  g13_95  g13_96  g13_97  g13_98  g13_99  g13_100 */
/*g13_101 g13_102 g13_103 g13_104 g13_105 g13_106 g13_107 g13_108 g13_109 g13_110 g13_111 g13_112 g13_113 g13_114 g13_115 g13_116 g13_117 g13_118 g13_119 g13_120 g13_121 g13_122 g13_123 g13_124 g13_125 */
/*g13_126 g13_127 g13_128 g13_129 g13_130 g13_131 g13_132 g13_133 g13_134 g13_135 g13_136 g13_137 g13_138 g13_139 g13_140 g13_141 g13_142 g13_143 g13_144 g13_145 g13_146 g13_147 g13_148 g13_149 g13_150 */
/*g13_151 g13_152 g13_153 g13_154 g13_155 g13_156 g13_157 g13_158 g13_159 g13_160 g13_161 g13_162 g13_163 g13_164 g13_165 g13_166 g13_167 g13_168 g13_169 g13_170 g13_171 g13_172 g13_173 g13_174 g13_175 */
/*g13_176 g13_177 g13_178 g13_179 g13_180 g13_181 g13_182 g13_183 g13_184 g13_185 g13_186 g13_187 g13_188 g13_189 g13_190 g13_191 g13_192 g13_193 g13_194 g13_195 g13_196 g13_197 g13_198 g13_199 g13_200 */
/*g13_201 g13_202 g13_203 g13_204 g13_205 g13_206 g13_207 g13_208 g13_209 g13_210 g13_211 g13_212 g13_213 g13_214 g13_215 g13_216 g13_217 g13_218 g13_219 g13_220 g13_221 g13_222 g13_223 g13_224 g13_225 */
/*g13_226 g13_227 g13_228 g13_229 g13_230 g13_231 g13_232 g13_233 g13_234 g13_235 g13_236 g13_237 g13_238 g13_239 g13_240 g13_241 g13_242 g13_243 g13_244 g13_245 g13_246 g13_247 g13_248 g13_249 g13_250 */
/*g13_251 g13_252 g13_253 g13_254 g13_255 g13_256 g13_257 g13_258 g13_259 g13_260 g13_261 g13_262 g13_263 g13_264 g13_265 g13_266 g13_267 g13_268 g13_269 g13_270 g13_271 g13_272 g13_273 g13_274 g13_275 */
/*g13_276 g13_277 g13_278 g13_279 g13_280 g13_281 g13_282 g13_283 g13_284 g13_285 */
/**/
/*g14_1   g14_2   g14_3   g14_4   g14_5   g14_6   g14_7   g14_8   g14_9   g14_10  g14_11  g14_12  g14_13  g14_14  g14_15  g14_16  g14_17  g14_18  g14_19  g14_20  g14_21  g14_22  g14_23  g14_24  g14_25  */
/*g14_26  g14_27  g14_28  g14_29  g14_30  g14_31  g14_32  g14_33  g14_34  g14_35  g14_36  g14_37  g14_38  g14_39  g14_40  g14_41  g14_42  g14_43  g14_44  g14_45  g14_46  g14_47  g14_48  g14_49  g14_50 */
/*g14_51  g14_52  g14_53  g14_54  g14_55  g14_56  g14_57  g14_58  g14_59  g14_60  g14_61  g14_62  g14_63  g14_64  g14_65  g14_66  g14_67  g14_68  g14_69  g14_70  g14_71  g14_72  g14_73  g14_74  g14_75  */
/*g14_76  g14_77  g14_78  g14_79  g14_80  g14_81  g14_82  g14_83  g14_84  g14_85  g14_86  g14_87  g14_88  g14_89  g14_90  g14_91  g14_92  g14_93  g14_94  g14_95  g14_96  g14_97  g14_98  g14_99  g14_100 */
/*g14_101 g14_102 g14_103 g14_104 g14_105 g14_106 g14_107 g14_108 g14_109 g14_110 g14_111 g14_112 g14_113 g14_114 g14_115 g14_116 g14_117 g14_118 g14_119 g14_120 g14_121 g14_122 g14_123 g14_124 g14_125 */
/*g14_126 g14_127 g14_128 g14_129 g14_130 g14_131 g14_132 g14_133 g14_134 g14_135 g14_136 g14_137 g14_138 g14_139 g14_140 g14_141 g14_142 g14_143 g14_144 g14_145 g14_146 g14_147 g14_148 g14_149 g14_150 */
/*g14_151 g14_152 g14_153 g14_154 g14_155 g14_156 g14_157 g14_158 g14_159 g14_160 g14_161 g14_162 g14_163 g14_164 g14_165 g14_166 g14_167 g14_168 g14_169 g14_170 g14_171 g14_172 g14_173 g14_174 g14_175 */
/*g14_176 g14_177 g14_178 g14_179 g14_180 g14_181 g14_182 g14_183 g14_184 g14_185 g14_186 g14_187 g14_188 g14_189 g14_190 g14_191 g14_192 g14_193 g14_194 g14_195 g14_196 g14_197 g14_198 g14_199 g14_200 */
/*g14_201 g14_202 g14_203 g14_204 g14_205 g14_206 g14_207 g14_208 g14_209 g14_210 g14_211 g14_212 g14_213 g14_214 g14_215 g14_216 g14_217 g14_218 g14_219 g14_220 g14_221 g14_222 g14_223 g14_224 g14_225 */
/*g14_226 g14_227 g14_228 g14_229 g14_230 g14_231 g14_232 g14_233 g14_234 g14_235 g14_236 g14_237 g14_238 g14_239 g14_240 g14_241 g14_242 g14_243 g14_244 g14_245 g14_246 g14_247 g14_248 g14_249 g14_250 */
/*g14_251 g14_252 g14_253 g14_254 g14_255 g14_256 g14_257 g14_258 g14_259 g14_260 g14_261 g14_262 g14_263 g14_264 g14_265 g14_266 g14_267 g14_268 g14_269 g14_270 g14_271 g14_272 g14_273 g14_274 g14_275 */
/*g14_276 g14_277 g14_278 g14_279 g14_280 g14_281 g14_282 g14_283 g14_284 g14_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_g; * this is number of variables in %let var = above ;*/
/*merge */
/*g15_1   g15_2   g15_3   g15_4   g15_5   g15_6   g15_7   g15_8   g15_9   g15_10  g15_11  g15_12  g15_13  g15_14  g15_15  g15_16  g15_17  g15_18  g15_19  g15_20  g15_21  g15_22  g15_23  g15_24  g15_25  */
/*g15_26  g15_27  g15_28  g15_29  g15_30  g15_31  g15_32  g15_33  g15_34  g15_35  g15_36  g15_37  g15_38  g15_39  g15_40  g15_41  g15_42  g15_43  g15_44  g15_45  g15_46  g15_47  g15_48  g15_49  g15_50 */
/*g15_51  g15_52  g15_53  g15_54  g15_55  g15_56  g15_57  g15_58  g15_59  g15_60  g15_61  g15_62  g15_63  g15_64  g15_65  g15_66  g15_67  g15_68  g15_69  g15_70  g15_71  g15_72  g15_73  g15_74  g15_75  */
/*g15_76  g15_77  g15_78  g15_79  g15_80  g15_81  g15_82  g15_83  g15_84  g15_85  g15_86  g15_87  g15_88  g15_89  g15_90  g15_91  g15_92  g15_93  g15_94  g15_95  g15_96  g15_97  g15_98  g15_99  g15_100 */
/*g15_101 g15_102 g15_103 g15_104 g15_105 g15_106 g15_107 g15_108 g15_109 g15_110 g15_111 g15_112 g15_113 g15_114 g15_115 g15_116 g15_117 g15_118 g15_119 g15_120 g15_121 g15_122 g15_123 g15_124 g15_125 */
/*g15_126 g15_127 g15_128 g15_129 g15_130 g15_131 g15_132 g15_133 g15_134 g15_135 g15_136 g15_137 g15_138 g15_139 g15_140 g15_141 g15_142 g15_143 g15_144 g15_145 g15_146 g15_147 g15_148 g15_149 g15_150 */
/*g15_151 g15_152 g15_153 g15_154 g15_155 g15_156 g15_157 g15_158 g15_159 g15_160 g15_161 g15_162 g15_163 g15_164 g15_165 g15_166 g15_167 g15_168 g15_169 g15_170 g15_171 g15_172 g15_173 g15_174 g15_175 */
/*g15_176 g15_177 g15_178 g15_179 g15_180 g15_181 g15_182 g15_183 g15_184 g15_185 g15_186 g15_187 g15_188 g15_189 g15_190 g15_191 g15_192 g15_193 g15_194 g15_195 g15_196 g15_197 g15_198 g15_199 g15_200 */
/*g15_201 g15_202 g15_203 g15_204 g15_205 g15_206 g15_207 g15_208 g15_209 g15_210 g15_211 g15_212 g15_213 g15_214 g15_215 g15_216 g15_217 g15_218 g15_219 g15_220 g15_221 g15_222 g15_223 g15_224 g15_225 */
/*g15_226 g15_227 g15_228 g15_229 g15_230 g15_231 g15_232 g15_233 g15_234 g15_235 g15_236 g15_237 g15_238 g15_239 g15_240 g15_241 g15_242 g15_243 g15_244 g15_245 g15_246 g15_247 g15_248 g15_249 g15_250 */
/*g15_251 g15_252 g15_253 g15_254 g15_255 g15_256 g15_257 g15_258 g15_259 g15_260 g15_261 g15_262 g15_263 g15_264 g15_265 g15_266 g15_267 g15_268 g15_269 g15_270 g15_271 g15_272 g15_273 g15_274 g15_275 */
/*g15_276 g15_277 g15_278 g15_279 g15_280 g15_281 g15_282 g15_283 g15_284 g15_285*/
/**/
/*g16_1   g16_2   g16_3   g16_4   g16_5   g16_6   g16_7   g16_8   g16_9   g16_10  g16_11  g16_12  g16_13  g16_14  g16_15  g16_16  g16_17  g16_18  g16_19  g16_20  g16_21  g16_22  g16_23  g16_24  g16_25  */
/*g16_26  g16_27  g16_28  g16_29  g16_30  g16_31  g16_32  g16_33  g16_34  g16_35  g16_36  g16_37  g16_38  g16_39  g16_40  g16_41  g16_42  g16_43  g16_44  g16_45  g16_46  g16_47  g16_48  g16_49  g16_50 */
/*g16_51  g16_52  g16_53  g16_54  g16_55  g16_56  g16_57  g16_58  g16_59  g16_60  g16_61  g16_62  g16_63  g16_64  g16_65  g16_66  g16_67  g16_68  g16_69  g16_70  g16_71  g16_72  g16_73  g16_74  g16_75  */
/*g16_76  g16_77  g16_78  g16_79  g16_80  g16_81  g16_82  g16_83  g16_84  g16_85  g16_86  g16_87  g16_88  g16_89  g16_90  g16_91  g16_92  g16_93  g16_94  g16_95  g16_96  g16_97  g16_98  g16_99  g16_100 */
/*g16_101 g16_102 g16_103 g16_104 g16_105 g16_106 g16_107 g16_108 g16_109 g16_110 g16_111 g16_112 g16_113 g16_114 g16_115 g16_116 g16_117 g16_118 g16_119 g16_120 g16_121 g16_122 g16_123 g16_124 g16_125 */
/*g16_126 g16_127 g16_128 g16_129 g16_130 g16_131 g16_132 g16_133 g16_134 g16_135 g16_136 g16_137 g16_138 g16_139 g16_140 g16_141 g16_142 g16_143 g16_144 g16_145 g16_146 g16_147 g16_148 g16_149 g16_150 */
/*g16_151 g16_152 g16_153 g16_154 g16_155 g16_156 g16_157 g16_158 g16_159 g16_160 g16_161 g16_162 g16_163 g16_164 g16_165 g16_166 g16_167 g16_168 g16_169 g16_170 g16_171 g16_172 g16_173 g16_174 g16_175 */
/*g16_176 g16_177 g16_178 g16_179 g16_180 g16_181 g16_182 g16_183 g16_184 g16_185 g16_186 g16_187 g16_188 g16_189 g16_190 g16_191 g16_192 g16_193 g16_194 g16_195 g16_196 g16_197 g16_198 g16_199 g16_200 */
/*g16_201 g16_202 g16_203 g16_204 g16_205 g16_206 g16_207 g16_208 g16_209 g16_210 g16_211 g16_212 g16_213 g16_214 g16_215 g16_216 g16_217 g16_218 g16_219 g16_220 g16_221 g16_222 g16_223 g16_224 g16_225 */
/*g16_226 g16_227 g16_228 g16_229 g16_230 g16_231 g16_232 g16_233 g16_234 g16_235 g16_236 g16_237 g16_238 g16_239 g16_240 g16_241 g16_242 g16_243 g16_244 g16_245 g16_246 g16_247 g16_248 g16_249 g16_250 */
/*g16_251 g16_252 g16_253 g16_254 g16_255 g16_256 g16_257 g16_258 g16_259 g16_260 g16_261 g16_262 g16_263 g16_264 g16_265 g16_266 g16_267 g16_268 g16_269 g16_270 g16_271 g16_272 g16_273 g16_274 g16_275 */
/*g16_276 g16_277 g16_278 g16_279 g16_280 g16_281 g16_282 g16_283 g16_284 g16_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_h; * this is number of variables in %let var = above ;*/
/*merge */
/*g18_1   g18_2   g18_3   g18_4   g18_5   g18_6   g18_7   g18_8   g18_9   g18_10  g18_11  g18_12  g18_13  g18_14  g18_15  g18_16  g18_17  g18_18  g18_19  g18_20  g18_21  g18_22  g18_23  g18_24  g18_25  */
/*g18_26  g18_27  g18_28  g18_29  g18_30  g18_31  g18_32  g18_33  g18_34  g18_35  g18_36  g18_37  g18_38  g18_39  g18_40  g18_41  g18_42  g18_43  g18_44  g18_45  g18_46  g18_47  g18_48  g18_49  g18_50 */
/*g18_51  g18_52  g18_53  g18_54  g18_55  g18_56  g18_57  g18_58  g18_59  g18_60  g18_61  g18_62  g18_63  g18_64  g18_65  g18_66  g18_67  g18_68  g18_69  g18_70  g18_71  g18_72  g18_73  g18_74  g18_75  */
/*g18_76  g18_77  g18_78  g18_79  g18_80  g18_81  g18_82  g18_83  g18_84  g18_85  g18_86  g18_87  g18_88  g18_89  g18_90  g18_91  g18_92  g18_93  g18_94  g18_95  g18_96  g18_97  g18_98  g18_99  g18_100 */
/*g18_101 g18_102 g18_103 g18_104 g18_105 g18_106 g18_107 g18_108 g18_109 g18_110 g18_111 g18_112 g18_113 g18_114 g18_115 g18_116 g18_117 g18_118 g18_119 g18_120 g18_121 g18_122 g18_123 g18_124 g18_125 */
/*g18_126 g18_127 g18_128 g18_129 g18_130 g18_131 g18_132 g18_133 g18_134 g18_135 g18_136 g18_137 g18_138 g18_139 g18_140 g18_141 g18_142 g18_143 g18_144 g18_145 g18_146 g18_147 g18_148 g18_149 g18_150 */
/*g18_151 g18_152 g18_153 g18_154 g18_155 g18_156 g18_157 g18_158 g18_159 g18_160 g18_161 g18_162 g18_163 g18_164 g18_165 g18_166 g18_167 g18_168 g18_169 g18_170 g18_171 g18_172 g18_173 g18_174 g18_175 */
/*g18_176 g18_177 g18_178 g18_179 g18_180 g18_181 g18_182 g18_183 g18_184 g18_185 g18_186 g18_187 g18_188 g18_189 g18_190 g18_191 g18_192 g18_193 g18_194 g18_195 g18_196 g18_197 g18_198 g18_199 g18_200 */
/*g18_201 g18_202 g18_203 g18_204 g18_205 g18_206 g18_207 g18_208 g18_209 g18_210 g18_211 g18_212 g18_213 g18_214 g18_215 g18_216 g18_217 g18_218 g18_219 g18_220 g18_221 g18_222 g18_223 g18_224 g18_225 */
/*g18_226 g18_227 g18_228 g18_229 g18_230 g18_231 g18_232 g18_233 g18_234 g18_235 g18_236 g18_237 g18_238 g18_239 g18_240 g18_241 g18_242 g18_243 g18_244 g18_245 g18_246 g18_247 g18_248 g18_249 g18_250 */
/*g18_251 g18_252 g18_253 g18_254 g18_255 g18_256 g18_257 g18_258 g18_259 g18_260 g18_261 g18_262 g18_263 g18_264 g18_265 g18_266 g18_267 g18_268 g18_269 g18_270 g18_271 g18_272 g18_273 g18_274 g18_275 */
/*g18_276 g18_277 g18_278 g18_279 g18_280 g18_281 g18_282 g18_283 g18_284 g18_285 */
/**/
/*g19_1   g19_2   g19_3   g19_4   g19_5   g19_6   g19_7   g19_8   g19_9   g19_10  g19_11  g19_12  g19_13  g19_14  g19_15  g19_16  g19_17  g19_18  g19_19  g19_20  g19_21  g19_22  g19_23  g19_24  g19_25  */
/*g19_26  g19_27  g19_28  g19_29  g19_30  g19_31  g19_32  g19_33  g19_34  g19_35  g19_36  g19_37  g19_38  g19_39  g19_40  g19_41  g19_42  g19_43  g19_44  g19_45  g19_46  g19_47  g19_48  g19_49  g19_50 */
/*g19_51  g19_52  g19_53  g19_54  g19_55  g19_56  g19_57  g19_58  g19_59  g19_60  g19_61  g19_62  g19_63  g19_64  g19_65  g19_66  g19_67  g19_68  g19_69  g19_70  g19_71  g19_72  g19_73  g19_74  g19_75  */
/*g19_76  g19_77  g19_78  g19_79  g19_80  g19_81  g19_82  g19_83  g19_84  g19_85  g19_86  g19_87  g19_88  g19_89  g19_90  g19_91  g19_92  g19_93  g19_94  g19_95  g19_96  g19_97  g19_98  g19_99  g19_100 */
/*g19_101 g19_102 g19_103 g19_104 g19_105 g19_106 g19_107 g19_108 g19_109 g19_110 g19_111 g19_112 g19_113 g19_114 g19_115 g19_116 g19_117 g19_118 g19_119 g19_120 g19_121 g19_122 g19_123 g19_124 g19_125 */
/*g19_126 g19_127 g19_128 g19_129 g19_130 g19_131 g19_132 g19_133 g19_134 g19_135 g19_136 g19_137 g19_138 g19_139 g19_140 g19_141 g19_142 g19_143 g19_144 g19_145 g19_146 g19_147 g19_148 g19_149 g19_150 */
/*g19_151 g19_152 g19_153 g19_154 g19_155 g19_156 g19_157 g19_158 g19_159 g19_160 g19_161 g19_162 g19_163 g19_164 g19_165 g19_166 g19_167 g19_168 g19_169 g19_170 g19_171 g19_172 g19_173 g19_174 g19_175 */
/*g19_176 g19_177 g19_178 g19_179 g19_180 g19_181 g19_182 g19_183 g19_184 g19_185 g19_186 g19_187 g19_188 g19_189 g19_190 g19_191 g19_192 g19_193 g19_194 g19_195 g19_196 g19_197 g19_198 g19_199 g19_200 */
/*g19_201 g19_202 g19_203 g19_204 g19_205 g19_206 g19_207 g19_208 g19_209 g19_210 g19_211 g19_212 g19_213 g19_214 g19_215 g19_216 g19_217 g19_218 g19_219 g19_220 g19_221 g19_222 g19_223 g19_224 g19_225 */
/*g19_226 g19_227 g19_228 g19_229 g19_230 g19_231 g19_232 g19_233 g19_234 g19_235 g19_236 g19_237 g19_238 g19_239 g19_240 g19_241 g19_242 g19_243 g19_244 g19_245 g19_246 g19_247 g19_248 g19_249 g19_250 */
/*g19_251 g19_252 g19_253 g19_254 g19_255 g19_256 g19_257 g19_258 g19_259 g19_260 g19_261 g19_262 g19_263 g19_264 g19_265 g19_266 g19_267 g19_268 g19_269 g19_270 g19_271 g19_272 g19_273 g19_274 g19_275 */
/*g19_276 g19_277 g19_278 g19_279 g19_280 g19_281 g19_282 g19_283 g19_284 g19_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_i; * this is number of variables in %let var = above ;*/
/*merge */
/*g20_1   g20_2   g20_3   g20_4   g20_5   g20_6   g20_7   g20_8   g20_9   g20_10  g20_11  g20_12  g20_13  g20_14  g20_15  g20_16  g20_17  g20_18  g20_19  g20_20  g20_21  g20_22  g20_23  g20_24  g20_25  */
/*g20_26  g20_27  g20_28  g20_29  g20_30  g20_31  g20_32  g20_33  g20_34  g20_35  g20_36  g20_37  g20_38  g20_39  g20_40  g20_41  g20_42  g20_43  g20_44  g20_45  g20_46  g20_47  g20_48  g20_49  g20_50 */
/*g20_51  g20_52  g20_53  g20_54  g20_55  g20_56  g20_57  g20_58  g20_59  g20_60  g20_61  g20_62  g20_63  g20_64  g20_65  g20_66  g20_67  g20_68  g20_69  g20_70  g20_71  g20_72  g20_73  g20_74  g20_75  */
/*g20_76  g20_77  g20_78  g20_79  g20_80  g20_81  g20_82  g20_83  g20_84  g20_85  g20_86  g20_87  g20_88  g20_89  g20_90  g20_91  g20_92  g20_93  g20_94  g20_95  g20_96  g20_97  g20_98  g20_99  g20_100 */
/*g20_101 g20_102 g20_103 g20_104 g20_105 g20_106 g20_107 g20_108 g20_109 g20_110 g20_111 g20_112 g20_113 g20_114 g20_115 g20_116 g20_117 g20_118 g20_119 g20_120 g20_121 g20_122 g20_123 g20_124 g20_125 */
/*g20_126 g20_127 g20_128 g20_129 g20_130 g20_131 g20_132 g20_133 g20_134 g20_135 g20_136 g20_137 g20_138 g20_139 g20_140 g20_141 g20_142 g20_143 g20_144 g20_145 g20_146 g20_147 g20_148 g20_149 g20_150 */
/*g20_151 g20_152 g20_153 g20_154 g20_155 g20_156 g20_157 g20_158 g20_159 g20_160 g20_161 g20_162 g20_163 g20_164 g20_165 g20_166 g20_167 g20_168 g20_169 g20_170 g20_171 g20_172 g20_173 g20_174 g20_175 */
/*g20_176 g20_177 g20_178 g20_179 g20_180 g20_181 g20_182 g20_183 g20_184 g20_185 g20_186 g20_187 g20_188 g20_189 g20_190 g20_191 g20_192 g20_193 g20_194 g20_195 g20_196 g20_197 g20_198 g20_199 g20_200 */
/*g20_201 g20_202 g20_203 g20_204 g20_205 g20_206 g20_207 g20_208 g20_209 g20_210 g20_211 g20_212 g20_213 g20_214 g20_215 g20_216 g20_217 g20_218 g20_219 g20_220 g20_221 g20_222 g20_223 g20_224 g20_225 */
/*g20_226 g20_227 g20_228 g20_229 g20_230 g20_231 g20_232 g20_233 g20_234 g20_235 g20_236 g20_237 g20_238 g20_239 g20_240 g20_241 g20_242 g20_243 g20_244 g20_245 g20_246 g20_247 g20_248 g20_249 g20_250 */
/*g20_251 g20_252 g20_253 g20_254 g20_255 g20_256 g20_257 g20_258 g20_259 g20_260 g20_261 g20_262 g20_263 g20_264 g20_265 g20_266 g20_267 g20_268 g20_269 g20_270 g20_271 g20_272 g20_273 g20_274 g20_275 */
/*g20_276 g20_277 g20_278 g20_279 g20_280 g20_281 g20_282 g20_283 g20_284 g20_285*/
/**/
/*g21_1   g21_2   g21_3   g21_4   g21_5   g21_6   g21_7   g21_8   g21_9   g21_10  g21_11  g21_12  g21_13  g21_14  g21_15  g21_16  g21_17  g21_18  g21_19  g21_20  g21_21  g21_22  g21_23  g21_24  g21_25  */
/*g21_26  g21_27  g21_28  g21_29  g21_30  g21_31  g21_32  g21_33  g21_34  g21_35  g21_36  g21_37  g21_38  g21_39  g21_40  g21_41  g21_42  g21_43  g21_44  g21_45  g21_46  g21_47  g21_48  g21_49  g21_50 */
/*g21_51  g21_52  g21_53  g21_54  g21_55  g21_56  g21_57  g21_58  g21_59  g21_60  g21_61  g21_62  g21_63  g21_64  g21_65  g21_66  g21_67  g21_68  g21_69  g21_70  g21_71  g21_72  g21_73  g21_74  g21_75  */
/*g21_76  g21_77  g21_78  g21_79  g21_80  g21_81  g21_82  g21_83  g21_84  g21_85  g21_86  g21_87  g21_88  g21_89  g21_90  g21_91  g21_92  g21_93  g21_94  g21_95  g21_96  g21_97  g21_98  g21_99  g21_100 */
/*g21_101 g21_102 g21_103 g21_104 g21_105 g21_106 g21_107 g21_108 g21_109 g21_110 g21_111 g21_112 g21_113 g21_114 g21_115 g21_116 g21_117 g21_118 g21_119 g21_120 g21_121 g21_122 g21_123 g21_124 g21_125 */
/*g21_126 g21_127 g21_128 g21_129 g21_130 g21_131 g21_132 g21_133 g21_134 g21_135 g21_136 g21_137 g21_138 g21_139 g21_140 g21_141 g21_142 g21_143 g21_144 g21_145 g21_146 g21_147 g21_148 g21_149 g21_150 */
/*g21_151 g21_152 g21_153 g21_154 g21_155 g21_156 g21_157 g21_158 g21_159 g21_160 g21_161 g21_162 g21_163 g21_164 g21_165 g21_166 g21_167 g21_168 g21_169 g21_170 g21_171 g21_172 g21_173 g21_174 g21_175 */
/*g21_176 g21_177 g21_178 g21_179 g21_180 g21_181 g21_182 g21_183 g21_184 g21_185 g21_186 g21_187 g21_188 g21_189 g21_190 g21_191 g21_192 g21_193 g21_194 g21_195 g21_196 g21_197 g21_198 g21_199 g21_200 */
/*g21_201 g21_202 g21_203 g21_204 g21_205 g21_206 g21_207 g21_208 g21_209 g21_210 g21_211 g21_212 g21_213 g21_214 g21_215 g21_216 g21_217 g21_218 g21_219 g21_220 g21_221 g21_222 g21_223 g21_224 g21_225 */
/*g21_226 g21_227 g21_228 g21_229 g21_230 g21_231 g21_232 g21_233 g21_234 g21_235 g21_236 g21_237 g21_238 g21_239 g21_240 g21_241 g21_242 g21_243 g21_244 g21_245 g21_246 g21_247 g21_248 g21_249 g21_250 */
/*g21_251 g21_252 g21_253 g21_254 g21_255 g21_256 g21_257 g21_258 g21_259 g21_260 g21_261 g21_262 g21_263 g21_264 g21_265 g21_266 g21_267 g21_268 g21_269 g21_270 g21_271 g21_272 g21_273 g21_274 g21_275 */
/*g21_276 g21_277 g21_278 g21_279 g21_280 g21_281 g21_282 g21_283 g21_284 g21_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_j; * this is number of variables in %let var = above ;*/
/*merge */
/*g22_1   g22_2   g22_3   g22_4   g22_5   g22_6   g22_7   g22_8   g22_9   g22_10  g22_11  g22_12  g22_13  g22_14  g22_15  g22_16  g22_17  g22_18  g22_19  g22_20  g22_21  g22_22  g22_23  g22_24  g22_25  */
/*g22_26  g22_27  g22_28  g22_29  g22_30  g22_31  g22_32  g22_33  g22_34  g22_35  g22_36  g22_37  g22_38  g22_39  g22_40  g22_41  g22_42  g22_43  g22_44  g22_45  g22_46  g22_47  g22_48  g22_49  g22_50 */
/*g22_51  g22_52  g22_53  g22_54  g22_55  g22_56  g22_57  g22_58  g22_59  g22_60  g22_61  g22_62  g22_63  g22_64  g22_65  g22_66  g22_67  g22_68  g22_69  g22_70  g22_71  g22_72  g22_73  g22_74  g22_75  */
/*g22_76  g22_77  g22_78  g22_79  g22_80  g22_81  g22_82  g22_83  g22_84  g22_85  g22_86  g22_87  g22_88  g22_89  g22_90  g22_91  g22_92  g22_93  g22_94  g22_95  g22_96  g22_97  g22_98  g22_99  g22_100 */
/*g22_101 g22_102 g22_103 g22_104 g22_105 g22_106 g22_107 g22_108 g22_109 g22_110 g22_111 g22_112 g22_113 g22_114 g22_115 g22_116 g22_117 g22_118 g22_119 g22_120 g22_121 g22_122 g22_123 g22_124 g22_125 */
/*g22_126 g22_127 g22_128 g22_129 g22_130 g22_131 g22_132 g22_133 g22_134 g22_135 g22_136 g22_137 g22_138 g22_139 g22_140 g22_141 g22_142 g22_143 g22_144 g22_145 g22_146 g22_147 g22_148 g22_149 g22_150 */
/*g22_151 g22_152 g22_153 g22_154 g22_155 g22_156 g22_157 g22_158 g22_159 g22_160 g22_161 g22_162 g22_163 g22_164 g22_165 g22_166 g22_167 g22_168 g22_169 g22_170 g22_171 g22_172 g22_173 g22_174 g22_175 */
/*g22_176 g22_177 g22_178 g22_179 g22_180 g22_181 g22_182 g22_183 g22_184 g22_185 g22_186 g22_187 g22_188 g22_189 g22_190 g22_191 g22_192 g22_193 g22_194 g22_195 g22_196 g22_197 g22_198 g22_199 g22_200 */
/*g22_201 g22_202 g22_203 g22_204 g22_205 g22_206 g22_207 g22_208 g22_209 g22_210 g22_211 g22_212 g22_213 g22_214 g22_215 g22_216 g22_217 g22_218 g22_219 g22_220 g22_221 g22_222 g22_223 g22_224 g22_225 */
/*g22_226 g22_227 g22_228 g22_229 g22_230 g22_231 g22_232 g22_233 g22_234 g22_235 g22_236 g22_237 g22_238 g22_239 g22_240 g22_241 g22_242 g22_243 g22_244 g22_245 g22_246 g22_247 g22_248 g22_249 g22_250 */
/*g22_251 g22_252 g22_253 g22_254 g22_255 g22_256 g22_257 g22_258 g22_259 g22_260 g22_261 g22_262 g22_263 g22_264 g22_265 g22_266 g22_267 g22_268 g22_269 g22_270 g22_271 g22_272 g22_273 g22_274 g22_275 */
/*g22_276 g22_277 g22_278 g22_279 g22_280 g22_281 g22_282 g22_283 g22_284 g22_285*/
/**/
/*g23_1   g23_2   g23_3   g23_4   g23_5   g23_6   g23_7   g23_8   g23_9   g23_10  g23_11  g23_12  g23_13  g23_14  g23_15  g23_16  g23_17  g23_18  g23_19  g23_20  g23_21  g23_22  g23_23  g23_24  g23_25  */
/*g23_26  g23_27  g23_28  g23_29  g23_30  g23_31  g23_32  g23_33  g23_34  g23_35  g23_36  g23_37  g23_38  g23_39  g23_40  g23_41  g23_42  g23_43  g23_44  g23_45  g23_46  g23_47  g23_48  g23_49  g23_50 */
/*g23_51  g23_52  g23_53  g23_54  g23_55  g23_56  g23_57  g23_58  g23_59  g23_60  g23_61  g23_62  g23_63  g23_64  g23_65  g23_66  g23_67  g23_68  g23_69  g23_70  g23_71  g23_72  g23_73  g23_74  g23_75  */
/*g23_76  g23_77  g23_78  g23_79  g23_80  g23_81  g23_82  g23_83  g23_84  g23_85  g23_86  g23_87  g23_88  g23_89  g23_90  g23_91  g23_92  g23_93  g23_94  g23_95  g23_96  g23_97  g23_98  g23_99  g23_100 */
/*g23_101 g23_102 g23_103 g23_104 g23_105 g23_106 g23_107 g23_108 g23_109 g23_110 g23_111 g23_112 g23_113 g23_114 g23_115 g23_116 g23_117 g23_118 g23_119 g23_120 g23_121 g23_122 g23_123 g23_124 g23_125 */
/*g23_126 g23_127 g23_128 g23_129 g23_130 g23_131 g23_132 g23_133 g23_134 g23_135 g23_136 g23_137 g23_138 g23_139 g23_140 g23_141 g23_142 g23_143 g23_144 g23_145 g23_146 g23_147 g23_148 g23_149 g23_150 */
/*g23_151 g23_152 g23_153 g23_154 g23_155 g23_156 g23_157 g23_158 g23_159 g23_160 g23_161 g23_162 g23_163 g23_164 g23_165 g23_166 g23_167 g23_168 g23_169 g23_170 g23_171 g23_172 g23_173 g23_174 g23_175 */
/*g23_176 g23_177 g23_178 g23_179 g23_180 g23_181 g23_182 g23_183 g23_184 g23_185 g23_186 g23_187 g23_188 g23_189 g23_190 g23_191 g23_192 g23_193 g23_194 g23_195 g23_196 g23_197 g23_198 g23_199 g23_200 */
/*g23_201 g23_202 g23_203 g23_204 g23_205 g23_206 g23_207 g23_208 g23_209 g23_210 g23_211 g23_212 g23_213 g23_214 g23_215 g23_216 g23_217 g23_218 g23_219 g23_220 g23_221 g23_222 g23_223 g23_224 g23_225 */
/*g23_226 g23_227 g23_228 g23_229 g23_230 g23_231 g23_232 g23_233 g23_234 g23_235 g23_236 g23_237 g23_238 g23_239 g23_240 g23_241 g23_242 g23_243 g23_244 g23_245 g23_246 g23_247 g23_248 g23_249 g23_250 */
/*g23_251 g23_252 g23_253 g23_254 g23_255 g23_256 g23_257 g23_258 g23_259 g23_260 g23_261 g23_262 g23_263 g23_264 g23_265 g23_266 g23_267 g23_268 g23_269 g23_270 g23_271 g23_272 g23_273 g23_274 g23_275 */
/*g23_276 g23_277 g23_278 g23_279 g23_280 g23_281 g23_282 g23_283 g23_284 g23_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_k; * this is number of variables in %let var = above ;*/
/*merge */
/*g24_1   g24_2   g24_3   g24_4   g24_5   g24_6   g24_7   g24_8   g24_9   g24_10  g24_11  g24_12  g24_13  g24_14  g24_15  g24_16  g24_17  g24_18  g24_19  g24_20  g24_21  g24_22  g24_23  g24_24  g24_25  */
/*g24_26  g24_27  g24_28  g24_29  g24_30  g24_31  g24_32  g24_33  g24_34  g24_35  g24_36  g24_37  g24_38  g24_39  g24_40  g24_41  g24_42  g24_43  g24_44  g24_45  g24_46  g24_47  g24_48  g24_49  g24_50 */
/*g24_51  g24_52  g24_53  g24_54  g24_55  g24_56  g24_57  g24_58  g24_59  g24_60  g24_61  g24_62  g24_63  g24_64  g24_65  g24_66  g24_67  g24_68  g24_69  g24_70  g24_71  g24_72  g24_73  g24_74  g24_75  */
/*g24_76  g24_77  g24_78  g24_79  g24_80  g24_81  g24_82  g24_83  g24_84  g24_85  g24_86  g24_87  g24_88  g24_89  g24_90  g24_91  g24_92  g24_93  g24_94  g24_95  g24_96  g24_97  g24_98  g24_99  g24_100 */
/*g24_101 g24_102 g24_103 g24_104 g24_105 g24_106 g24_107 g24_108 g24_109 g24_110 g24_111 g24_112 g24_113 g24_114 g24_115 g24_116 g24_117 g24_118 g24_119 g24_120 g24_121 g24_122 g24_123 g24_124 g24_125 */
/*g24_126 g24_127 g24_128 g24_129 g24_130 g24_131 g24_132 g24_133 g24_134 g24_135 g24_136 g24_137 g24_138 g24_139 g24_140 g24_141 g24_142 g24_143 g24_144 g24_145 g24_146 g24_147 g24_148 g24_149 g24_150 */
/*g24_151 g24_152 g24_153 g24_154 g24_155 g24_156 g24_157 g24_158 g24_159 g24_160 g24_161 g24_162 g24_163 g24_164 g24_165 g24_166 g24_167 g24_168 g24_169 g24_170 g24_171 g24_172 g24_173 g24_174 g24_175 */
/*g24_176 g24_177 g24_178 g24_179 g24_180 g24_181 g24_182 g24_183 g24_184 g24_185 g24_186 g24_187 g24_188 g24_189 g24_190 g24_191 g24_192 g24_193 g24_194 g24_195 g24_196 g24_197 g24_198 g24_199 g24_200 */
/*g24_201 g24_202 g24_203 g24_204 g24_205 g24_206 g24_207 g24_208 g24_209 g24_210 g24_211 g24_212 g24_213 g24_214 g24_215 g24_216 g24_217 g24_218 g24_219 g24_220 g24_221 g24_222 g24_223 g24_224 g24_225 */
/*g24_226 g24_227 g24_228 g24_229 g24_230 g24_231 g24_232 g24_233 g24_234 g24_235 g24_236 g24_237 g24_238 g24_239 g24_240 g24_241 g24_242 g24_243 g24_244 g24_245 g24_246 g24_247 g24_248 g24_249 g24_250 */
/*g24_251 g24_252 g24_253 g24_254 g24_255 g24_256 g24_257 g24_258 g24_259 g24_260 g24_261 g24_262 g24_263 g24_264 g24_265 g24_266 g24_267 g24_268 g24_269 g24_270 g24_271 g24_272 g24_273 g24_274 g24_275 */
/*g24_276 g24_277 g24_278 g24_279 g24_280 g24_281 g24_282 g24_283 g24_284 g24_285 */
/**/
/*g25_1   g25_2   g25_3   g25_4   g25_5   g25_6   g25_7   g25_8   g25_9   g25_10  g25_11  g25_12  g25_13  g25_14  g25_15  g25_16  g25_17  g25_18  g25_19  g25_20  g25_21  g25_22  g25_23  g25_24  g25_25  */
/*g25_26  g25_27  g25_28  g25_29  g25_30  g25_31  g25_32  g25_33  g25_34  g25_35  g25_36  g25_37  g25_38  g25_39  g25_40  g25_41  g25_42  g25_43  g25_44  g25_45  g25_46  g25_47  g25_48  g25_49  g25_50 */
/*g25_51  g25_52  g25_53  g25_54  g25_55  g25_56  g25_57  g25_58  g25_59  g25_60  g25_61  g25_62  g25_63  g25_64  g25_65  g25_66  g25_67  g25_68  g25_69  g25_70  g25_71  g25_72  g25_73  g25_74  g25_75  */
/*g25_76  g25_77  g25_78  g25_79  g25_80  g25_81  g25_82  g25_83  g25_84  g25_85  g25_86  g25_87  g25_88  g25_89  g25_90  g25_91  g25_92  g25_93  g25_94  g25_95  g25_96  g25_97  g25_98  g25_99  g25_100 */
/*g25_101 g25_102 g25_103 g25_104 g25_105 g25_106 g25_107 g25_108 g25_109 g25_110 g25_111 g25_112 g25_113 g25_114 g25_115 g25_116 g25_117 g25_118 g25_119 g25_120 g25_121 g25_122 g25_123 g25_124 g25_125 */
/*g25_126 g25_127 g25_128 g25_129 g25_130 g25_131 g25_132 g25_133 g25_134 g25_135 g25_136 g25_137 g25_138 g25_139 g25_140 g25_141 g25_142 g25_143 g25_144 g25_145 g25_146 g25_147 g25_148 g25_149 g25_150 */
/*g25_151 g25_152 g25_153 g25_154 g25_155 g25_156 g25_157 g25_158 g25_159 g25_160 g25_161 g25_162 g25_163 g25_164 g25_165 g25_166 g25_167 g25_168 g25_169 g25_170 g25_171 g25_172 g25_173 g25_174 g25_175 */
/*g25_176 g25_177 g25_178 g25_179 g25_180 g25_181 g25_182 g25_183 g25_184 g25_185 g25_186 g25_187 g25_188 g25_189 g25_190 g25_191 g25_192 g25_193 g25_194 g25_195 g25_196 g25_197 g25_198 g25_199 g25_200 */
/*g25_201 g25_202 g25_203 g25_204 g25_205 g25_206 g25_207 g25_208 g25_209 g25_210 g25_211 g25_212 g25_213 g25_214 g25_215 g25_216 g25_217 g25_218 g25_219 g25_220 g25_221 g25_222 g25_223 g25_224 g25_225 */
/*g25_226 g25_227 g25_228 g25_229 g25_230 g25_231 g25_232 g25_233 g25_234 g25_235 g25_236 g25_237 g25_238 g25_239 g25_240 g25_241 g25_242 g25_243 g25_244 g25_245 g25_246 g25_247 g25_248 g25_249 g25_250 */
/*g25_251 g25_252 g25_253 g25_254 g25_255 g25_256 g25_257 g25_258 g25_259 g25_260 g25_261 g25_262 g25_263 g25_264 g25_265 g25_266 g25_267 g25_268 g25_269 g25_270 g25_271 g25_272 g25_273 g25_274 g25_275 */
/*g25_276 g25_277 g25_278 g25_279 g25_280 g25_281 g25_282 g25_283 g25_284 g25_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_l; * this is number of variables in %let var = above ;*/
/*merge */
/*g27_1   g27_2   g27_3   g27_4   g27_5   g27_6   g27_7   g27_8   g27_9   g27_10  g27_11  g27_12  g27_13  g27_14  g27_15  g27_16  g27_17  g27_18  g27_19  g27_20  g27_21  g27_22  g27_23  g27_24  g27_25  */
/*g27_26  g27_27  g27_28  g27_29  g27_30  g27_31  g27_32  g27_33  g27_34  g27_35  g27_36  g27_37  g27_38  g27_39  g27_40  g27_41  g27_42  g27_43  g27_44  g27_45  g27_46  g27_47  g27_48  g27_49  g27_50 */
/*g27_51  g27_52  g27_53  g27_54  g27_55  g27_56  g27_57  g27_58  g27_59  g27_60  g27_61  g27_62  g27_63  g27_64  g27_65  g27_66  g27_67  g27_68  g27_69  g27_70  g27_71  g27_72  g27_73  g27_74  g27_75  */
/*g27_76  g27_77  g27_78  g27_79  g27_80  g27_81  g27_82  g27_83  g27_84  g27_85  g27_86  g27_87  g27_88  g27_89  g27_90  g27_91  g27_92  g27_93  g27_94  g27_95  g27_96  g27_97  g27_98  g27_99  g27_100 */
/*g27_101 g27_102 g27_103 g27_104 g27_105 g27_106 g27_107 g27_108 g27_109 g27_110 g27_111 g27_112 g27_113 g27_114 g27_115 g27_116 g27_117 g27_118 g27_119 g27_120 g27_121 g27_122 g27_123 g27_124 g27_125 */
/*g27_126 g27_127 g27_128 g27_129 g27_130 g27_131 g27_132 g27_133 g27_134 g27_135 g27_136 g27_137 g27_138 g27_139 g27_140 g27_141 g27_142 g27_143 g27_144 g27_145 g27_146 g27_147 g27_148 g27_149 g27_150 */
/*g27_151 g27_152 g27_153 g27_154 g27_155 g27_156 g27_157 g27_158 g27_159 g27_160 g27_161 g27_162 g27_163 g27_164 g27_165 g27_166 g27_167 g27_168 g27_169 g27_170 g27_171 g27_172 g27_173 g27_174 g27_175 */
/*g27_176 g27_177 g27_178 g27_179 g27_180 g27_181 g27_182 g27_183 g27_184 g27_185 g27_186 g27_187 g27_188 g27_189 g27_190 g27_191 g27_192 g27_193 g27_194 g27_195 g27_196 g27_197 g27_198 g27_199 g27_200 */
/*g27_201 g27_202 g27_203 g27_204 g27_205 g27_206 g27_207 g27_208 g27_209 g27_210 g27_211 g27_212 g27_213 g27_214 g27_215 g27_216 g27_217 g27_218 g27_219 g27_220 g27_221 g27_222 g27_223 g27_224 g27_225 */
/*g27_226 g27_227 g27_228 g27_229 g27_230 g27_231 g27_232 g27_233 g27_234 g27_235 g27_236 g27_237 g27_238 g27_239 g27_240 g27_241 g27_242 g27_243 g27_244 g27_245 g27_246 g27_247 g27_248 g27_249 g27_250 */
/*g27_251 g27_252 g27_253 g27_254 g27_255 g27_256 g27_257 g27_258 g27_259 g27_260 g27_261 g27_262 g27_263 g27_264 g27_265 g27_266 g27_267 g27_268 g27_269 g27_270 g27_271 g27_272 g27_273 g27_274 g27_275 */
/*g27_276 g27_277 g27_278 g27_279 g27_280 g27_281 g27_282 g27_283 g27_284 g27_285*/
/**/
/*g28_1   g28_2   g28_3   g28_4   g28_5   g28_6   g28_7   g28_8   g28_9   g28_10  g28_11  g28_12  g28_13  g28_14  g28_15  g28_16  g28_17  g28_18  g28_19  g28_20  g28_21  g28_22  g28_23  g28_24  g28_25  */
/*g28_26  g28_27  g28_28  g28_29  g28_30  g28_31  g28_32  g28_33  g28_34  g28_35  g28_36  g28_37  g28_38  g28_39  g28_40  g28_41  g28_42  g28_43  g28_44  g28_45  g28_46  g28_47  g28_48  g28_49  g28_50 */
/*g28_51  g28_52  g28_53  g28_54  g28_55  g28_56  g28_57  g28_58  g28_59  g28_60  g28_61  g28_62  g28_63  g28_64  g28_65  g28_66  g28_67  g28_68  g28_69  g28_70  g28_71  g28_72  g28_73  g28_74  g28_75  */
/*g28_76  g28_77  g28_78  g28_79  g28_80  g28_81  g28_82  g28_83  g28_84  g28_85  g28_86  g28_87  g28_88  g28_89  g28_90  g28_91  g28_92  g28_93  g28_94  g28_95  g28_96  g28_97  g28_98  g28_99  g28_100 */
/*g28_101 g28_102 g28_103 g28_104 g28_105 g28_106 g28_107 g28_108 g28_109 g28_110 g28_111 g28_112 g28_113 g28_114 g28_115 g28_116 g28_117 g28_118 g28_119 g28_120 g28_121 g28_122 g28_123 g28_124 g28_125 */
/*g28_126 g28_127 g28_128 g28_129 g28_130 g28_131 g28_132 g28_133 g28_134 g28_135 g28_136 g28_137 g28_138 g28_139 g28_140 g28_141 g28_142 g28_143 g28_144 g28_145 g28_146 g28_147 g28_148 g28_149 g28_150 */
/*g28_151 g28_152 g28_153 g28_154 g28_155 g28_156 g28_157 g28_158 g28_159 g28_160 g28_161 g28_162 g28_163 g28_164 g28_165 g28_166 g28_167 g28_168 g28_169 g28_170 g28_171 g28_172 g28_173 g28_174 g28_175 */
/*g28_176 g28_177 g28_178 g28_179 g28_180 g28_181 g28_182 g28_183 g28_184 g28_185 g28_186 g28_187 g28_188 g28_189 g28_190 g28_191 g28_192 g28_193 g28_194 g28_195 g28_196 g28_197 g28_198 g28_199 g28_200 */
/*g28_201 g28_202 g28_203 g28_204 g28_205 g28_206 g28_207 g28_208 g28_209 g28_210 g28_211 g28_212 g28_213 g28_214 g28_215 g28_216 g28_217 g28_218 g28_219 g28_220 g28_221 g28_222 g28_223 g28_224 g28_225 */
/*g28_226 g28_227 g28_228 g28_229 g28_230 g28_231 g28_232 g28_233 g28_234 g28_235 g28_236 g28_237 g28_238 g28_239 g28_240 g28_241 g28_242 g28_243 g28_244 g28_245 g28_246 g28_247 g28_248 g28_249 g28_250 */
/*g28_251 g28_252 g28_253 g28_254 g28_255 g28_256 g28_257 g28_258 g28_259 g28_260 g28_261 g28_262 g28_263 g28_264 g28_265 g28_266 g28_267 g28_268 g28_269 g28_270 g28_271 g28_272 g28_273 g28_274 g28_275 */
/*g28_276 g28_277 g28_278 g28_279 g28_280 g28_281 g28_282 g28_283 g28_284 g28_285*/
/*;*/
/*by cald;run;*/
/**/
/*data d_m; * this is number of variables in %let var = above ;*/
/*merge */
/*g29_1   g29_2   g29_3   g29_4   g29_5   g29_6   g29_7   g29_8   g29_9   g29_10  g29_11  g29_12  g29_13  g29_14  g29_15  g29_16  g29_17  g29_18  g29_19  g29_20  g29_21  g29_22  g29_23  g29_24  g29_25  */
/*g29_26  g29_27  g29_28  g29_29  g29_30  g29_31  g29_32  g29_33  g29_34  g29_35  g29_36  g29_37  g29_38  g29_39  g29_40  g29_41  g29_42  g29_43  g29_44  g29_45  g29_46  g29_47  g29_48  g29_49  g29_50 */
/*g29_51  g29_52  g29_53  g29_54  g29_55  g29_56  g29_57  g29_58  g29_59  g29_60  g29_61  g29_62  g29_63  g29_64  g29_65  g29_66  g29_67  g29_68  g29_69  g29_70  g29_71  g29_72  g29_73  g29_74  g29_75  */
/*g29_76  g29_77  g29_78  g29_79  g29_80  g29_81  g29_82  g29_83  g29_84  g29_85  g29_86  g29_87  g29_88  g29_89  g29_90  g29_91  g29_92  g29_93  g29_94  g29_95  g29_96  g29_97  g29_98  g29_99  g29_100 */
/*g29_101 g29_102 g29_103 g29_104 g29_105 g29_106 g29_107 g29_108 g29_109 g29_110 g29_111 g29_112 g29_113 g29_114 g29_115 g29_116 g29_117 g29_118 g29_119 g29_120 g29_121 g29_122 g29_123 g29_124 g29_125 */
/*g29_126 g29_127 g29_128 g29_129 g29_130 g29_131 g29_132 g29_133 g29_134 g29_135 g29_136 g29_137 g29_138 g29_139 g29_140 g29_141 g29_142 g29_143 g29_144 g29_145 g29_146 g29_147 g29_148 g29_149 g29_150 */
/*g29_151 g29_152 g29_153 g29_154 g29_155 g29_156 g29_157 g29_158 g29_159 g29_160 g29_161 g29_162 g29_163 g29_164 g29_165 g29_166 g29_167 g29_168 g29_169 g29_170 g29_171 g29_172 g29_173 g29_174 g29_175 */
/*g29_176 g29_177 g29_178 g29_179 g29_180 g29_181 g29_182 g29_183 g29_184 g29_185 g29_186 g29_187 g29_188 g29_189 g29_190 g29_191 g29_192 g29_193 g29_194 g29_195 g29_196 g29_197 g29_198 g29_199 g29_200 */
/*g29_201 g29_202 g29_203 g29_204 g29_205 g29_206 g29_207 g29_208 g29_209 g29_210 g29_211 g29_212 g29_213 g29_214 g29_215 g29_216 g29_217 g29_218 g29_219 g29_220 g29_221 g29_222 g29_223 g29_224 g29_225 */
/*g29_226 g29_227 g29_228 g29_229 g29_230 g29_231 g29_232 g29_233 g29_234 g29_235 g29_236 g29_237 g29_238 g29_239 g29_240 g29_241 g29_242 g29_243 g29_244 g29_245 g29_246 g29_247 g29_248 g29_249 g29_250 */
/*g29_251 g29_252 g29_253 g29_254 g29_255 g29_256 g29_257 g29_258 g29_259 g29_260 g29_261 g29_262 g29_263 g29_264 g29_265 g29_266 g29_267 g29_268 g29_269 g29_270 g29_271 g29_272 g29_273 g29_274 g29_275 */
/*g29_276 g29_277 g29_278 g29_279 g29_280 g29_281 g29_282 g29_283 g29_284 g29_285*/
/**/
/*g30_1   g30_2   g30_3   g30_4   g30_5   g30_6   g30_7   g30_8   g30_9   g30_10  g30_11  g30_12  g30_13  g30_14  g30_15  g30_16  g30_17  g30_18  g30_19  g30_20  g30_21  g30_22  g30_23  g30_24  g30_25  */
/*g30_26  g30_27  g30_28  g30_29  g30_30  g30_31  g30_32  g30_33  g30_34  g30_35  g30_36  g30_37  g30_38  g30_39  g30_40  g30_41  g30_42  g30_43  g30_44  g30_45  g30_46  g30_47  g30_48  g30_49  g30_50 */
/*g30_51  g30_52  g30_53  g30_54  g30_55  g30_56  g30_57  g30_58  g30_59  g30_60  g30_61  g30_62  g30_63  g30_64  g30_65  g30_66  g30_67  g30_68  g30_69  g30_70  g30_71  g30_72  g30_73  g30_74  g30_75  */
/*g30_76  g30_77  g30_78  g30_79  g30_80  g30_81  g30_82  g30_83  g30_84  g30_85  g30_86  g30_87  g30_88  g30_89  g30_90  g30_91  g30_92  g30_93  g30_94  g30_95  g30_96  g30_97  g30_98  g30_99  g30_100 */
/*g30_101 g30_102 g30_103 g30_104 g30_105 g30_106 g30_107 g30_108 g30_109 g30_110 g30_111 g30_112 g30_113 g30_114 g30_115 g30_116 g30_117 g30_118 g30_119 g30_120 g30_121 g30_122 g30_123 g30_124 g30_125 */
/*g30_126 g30_127 g30_128 g30_129 g30_130 g30_131 g30_132 g30_133 g30_134 g30_135 g30_136 g30_137 g30_138 g30_139 g30_140 g30_141 g30_142 g30_143 g30_144 g30_145 g30_146 g30_147 g30_148 g30_149 g30_150 */
/*g30_151 g30_152 g30_153 g30_154 g30_155 g30_156 g30_157 g30_158 g30_159 g30_160 g30_161 g30_162 g30_163 g30_164 g30_165 g30_166 g30_167 g30_168 g30_169 g30_170 g30_171 g30_172 g30_173 g30_174 g30_175 */
/*g30_176 g30_177 g30_178 g30_179 g30_180 g30_181 g30_182 g30_183 g30_184 g30_185 g30_186 g30_187 g30_188 g30_189 g30_190 g30_191 g30_192 g30_193 g30_194 g30_195 g30_196 g30_197 g30_198 g30_199 g30_200 */
/*g30_201 g30_202 g30_203 g30_204 g30_205 g30_206 g30_207 g30_208 g30_209 g30_210 g30_211 g30_212 g30_213 g30_214 g30_215 g30_216 g30_217 g30_218 g30_219 g30_220 g30_221 g30_222 g30_223 g30_224 g30_225 */
/*g30_226 g30_227 g30_228 g30_229 g30_230 g30_231 g30_232 g30_233 g30_234 g30_235 g30_236 g30_237 g30_238 g30_239 g30_240 g30_241 g30_242 g30_243 g30_244 g30_245 g30_246 g30_247 g30_248 g30_249 g30_250 */
/*g30_251 g30_252 g30_253 g30_254 g30_255 g30_256 g30_257 g30_258 g30_259 g30_260 g30_261 g30_262 g30_263 g30_264 g30_265 g30_266 g30_267 g30_268 g30_269 g30_270 g30_271 g30_272 g30_273 g30_274 g30_275 */
/*g30_276 g30_277 g30_278 g30_279 g30_280 g30_281 g30_282 g30_283 g30_284 g30_285*/
/*;*/
/*by cald;run;*/

data d_n; * this is number of variables in %let var = above ;
merge 
g31_1   g31_2   g31_3   g31_4   g31_5   g31_6   g31_7   g31_8   g31_9   g31_10  g31_11  g31_12  g31_13  g31_14  g31_15  g31_16  g31_17  g31_18  g31_19  g31_20  g31_21  g31_22  g31_23  g31_24  g31_25  
g31_26  g31_27  g31_28  g31_29  g31_30  g31_31  g31_32  g31_33  g31_34  g31_35  g31_36  g31_37  g31_38  g31_39  g31_40  g31_41  g31_42  g31_43  g31_44  g31_45  g31_46  g31_47  g31_48  g31_49  g31_50 
g31_51  g31_52  g31_53  g31_54  g31_55  g31_56  g31_57  g31_58  g31_59  g31_60  g31_61  g31_62  g31_63  g31_64  g31_65  g31_66  g31_67  g31_68  g31_69  g31_70  g31_71  g31_72  g31_73  g31_74  g31_75  
g31_76  g31_77  g31_78  g31_79  g31_80  g31_81  g31_82  g31_83  g31_84  g31_85  g31_86  g31_87  g31_88  g31_89  g31_90  g31_91  g31_92  g31_93  g31_94  g31_95  g31_96  g31_97  g31_98  g31_99  g31_100 
g31_101 g31_102 g31_103 g31_104 g31_105 g31_106 g31_107 g31_108 g31_109 g31_110 g31_111 g31_112 g31_113 g31_114 g31_115 g31_116 g31_117 g31_118 g31_119 g31_120 g31_121 g31_122 g31_123 g31_124 g31_125 
g31_126 g31_127 g31_128 g31_129 g31_130 g31_131 g31_132 g31_133 g31_134 g31_135 g31_136 g31_137 g31_138 g31_139 g31_140 g31_141 g31_142 g31_143 g31_144 g31_145 g31_146 g31_147 g31_148 g31_149 g31_150 
g31_151 g31_152 g31_153 g31_154 g31_155 g31_156 g31_157 g31_158 g31_159 g31_160 g31_161 g31_162 g31_163 g31_164 g31_165 g31_166 g31_167 g31_168 g31_169 g31_170 g31_171 g31_172 g31_173 g31_174 g31_175 
g31_176 g31_177 g31_178 g31_179 g31_180 g31_181 g31_182 g31_183 g31_184 g31_185 g31_186 g31_187 g31_188 g31_189 g31_190 g31_191 g31_192 g31_193 g31_194 g31_195 g31_196 g31_197 g31_198 g31_199 g31_200 
g31_201 g31_202 g31_203 g31_204 g31_205 g31_206 g31_207 g31_208 g31_209 g31_210 g31_211 g31_212 g31_213 g31_214 g31_215 g31_216 g31_217 g31_218 g31_219 g31_220 g31_221 g31_222 g31_223 g31_224 g31_225 
g31_226 g31_227 g31_228 g31_229 g31_230 g31_231 g31_232 g31_233 g31_234 g31_235 g31_236 g31_237 g31_238 g31_239 g31_240 g31_241 g31_242 g31_243 g31_244 g31_245 g31_246 g31_247 g31_248 g31_249 g31_250 
g31_251 g31_252 g31_253 g31_254 g31_255 g31_256 g31_257 g31_258 g31_259 g31_260 g31_261 g31_262 g31_263 g31_264 g31_265 g31_266 g31_267 g31_268 g31_269 g31_270 g31_271 g31_272 g31_273 g31_274 g31_275 
g31_276 g31_277 g31_278 g31_279 g31_280 g31_281 g31_282 g31_283 g31_284 g31_285

g32_1   g32_2   g32_3   g32_4   g32_5   g32_6   g32_7   g32_8   g32_9   g32_10  g32_11  g32_12  g32_13  g32_14  g32_15  g32_16  g32_17  g32_18  g32_19  g32_20  g32_21  g32_22  g32_23  g32_24  g32_25  
g32_26  g32_27  g32_28  g32_29  g32_30  g32_31  g32_32  g32_33  g32_34  g32_35  g32_36  g32_37  g32_38  g32_39  g32_40  g32_41  g32_42  g32_43  g32_44  g32_45  g32_46  g32_47  g32_48  g32_49  g32_50 
g32_51  g32_52  g32_53  g32_54  g32_55  g32_56  g32_57  g32_58  g32_59  g32_60  g32_61  g32_62  g32_63  g32_64  g32_65  g32_66  g32_67  g32_68  g32_69  g32_70  g32_71  g32_72  g32_73  g32_74  g32_75  
g32_76  g32_77  g32_78  g32_79  g32_80  g32_81  g32_82  g32_83  g32_84  g32_85  g32_86  g32_87  g32_88  g32_89  g32_90  g32_91  g32_92  g32_93  g32_94  g32_95  g32_96  g32_97  g32_98  g32_99  g32_100 
g32_101 g32_102 g32_103 g32_104 g32_105 g32_106 g32_107 g32_108 g32_109 g32_110 g32_111 g32_112 g32_113 g32_114 g32_115 g32_116 g32_117 g32_118 g32_119 g32_120 g32_121 g32_122 g32_123 g32_124 g32_125 
g32_126 g32_127 g32_128 g32_129 g32_130 g32_131 g32_132 g32_133 g32_134 g32_135 g32_136 g32_137 g32_138 g32_139 g32_140 g32_141 g32_142 g32_143 g32_144 g32_145 g32_146 g32_147 g32_148 g32_149 g32_150 
g32_151 g32_152 g32_153 g32_154 g32_155 g32_156 g32_157 g32_158 g32_159 g32_160 g32_161 g32_162 g32_163 g32_164 g32_165 g32_166 g32_167 g32_168 g32_169 g32_170 g32_171 g32_172 g32_173 g32_174 g32_175 
g32_176 g32_177 g32_178 g32_179 g32_180 g32_181 g32_182 g32_183 g32_184 g32_185 g32_186 g32_187 g32_188 g32_189 g32_190 g32_191 g32_192 g32_193 g32_194 g32_195 g32_196 g32_197 g32_198 g32_199 g32_200 
g32_201 g32_202 g32_203 g32_204 g32_205 g32_206 g32_207 g32_208 g32_209 g32_210 g32_211 g32_212 g32_213 g32_214 g32_215 g32_216 g32_217 g32_218 g32_219 g32_220 g32_221 g32_222 g32_223 g32_224 g32_225 
g32_226 g32_227 g32_228 g32_229 g32_230 g32_231 g32_232 g32_233 g32_234 g32_235 g32_236 g32_237 g32_238 g32_239 g32_240 g32_241 g32_242 g32_243 g32_244 g32_245 g32_246 g32_247 g32_248 g32_249 g32_250 
g32_251 g32_252 g32_253 g32_254 g32_255 g32_256 g32_257 g32_258 g32_259 g32_260 g32_261 g32_262 g32_263 g32_264 g32_265 g32_266 g32_267 g32_268 g32_269 g32_270 g32_271 g32_272 g32_273 g32_274 g32_275 
g32_276 g32_277 g32_278 g32_279 g32_280 g32_281 g32_282 g32_283 g32_284 g32_285

g33_1   g33_2   g33_3   g33_4   g33_5   g33_6   g33_7   g33_8   g33_9   g33_10  g33_11  g33_12  g33_13  g33_14  g33_15  g33_16  g33_17  g33_18  g33_19  g33_20  g33_21  g33_22  g33_23  g33_24  g33_25  
g33_26  g33_27  g33_28  g33_29  g33_30  g33_31  g33_32  g33_33  g33_34  g33_35  g33_36  g33_37  g33_38  g33_39  g33_40  g33_41  g33_42  g33_43  g33_44  g33_45  g33_46  g33_47  g33_48  g33_49  g33_50 
g33_51  g33_52  g33_53  g33_54  g33_55  g33_56  g33_57  g33_58  g33_59  g33_60  g33_61  g33_62  g33_63  g33_64  g33_65  g33_66  g33_67  g33_68  g33_69  g33_70  g33_71  g33_72  g33_73  g33_74  g33_75  
g33_76  g33_77  g33_78  g33_79  g33_80  g33_81  g33_82  g33_83  g33_84  g33_85  g33_86  g33_87  g33_88  g33_89  g33_90  g33_91  g33_92  g33_93  g33_94  g33_95  g33_96  g33_97  g33_98  g33_99  g33_100 
g33_101 g33_102 g33_103 g33_104 g33_105 g33_106 g33_107 g33_108 g33_109 g33_110 g33_111 g33_112 g33_113 g33_114 g33_115 g33_116 g33_117 g33_118 g33_119 g33_120 g33_121 g33_122 g33_123 g33_124 g33_125 
g33_126 g33_127 g33_128 g33_129 g33_130 g33_131 g33_132 g33_133 g33_134 g33_135 g33_136 g33_137 g33_138 g33_139 g33_140 g33_141 g33_142 g33_143 g33_144 g33_145 g33_146 g33_147 g33_148 g33_149 g33_150 
g33_151 g33_152 g33_153 g33_154 g33_155 g33_156 g33_157 g33_158 g33_159 g33_160 g33_161 g33_162 g33_163 g33_164 g33_165 g33_166 g33_167 g33_168 g33_169 g33_170 g33_171 g33_172 g33_173 g33_174 g33_175 
g33_176 g33_177 g33_178 g33_179 g33_180 g33_181 g33_182 g33_183 g33_184 g33_185 g33_186 g33_187 g33_188 g33_189 g33_190 g33_191 g33_192 g33_193 g33_194 g33_195 g33_196 g33_197 g33_198 g33_199 g33_200 
g33_201 g33_202 g33_203 g33_204 g33_205 g33_206 g33_207 g33_208 g33_209 g33_210 g33_211 g33_212 g33_213 g33_214 g33_215 g33_216 g33_217 g33_218 g33_219 g33_220 g33_221 g33_222 g33_223 g33_224 g33_225 
g33_226 g33_227 g33_228 g33_229 g33_230 g33_231 g33_232 g33_233 g33_234 g33_235 g33_236 g33_237 g33_238 g33_239 g33_240 g33_241 g33_242 g33_243 g33_244 g33_245 g33_246 g33_247 g33_248 g33_249 g33_250 
g33_251 g33_252 g33_253 g33_254 g33_255 g33_256 g33_257 g33_258 g33_259 g33_260 g33_261 g33_262 g33_263 g33_264 g33_265 g33_266 g33_267 g33_268 g33_269 g33_270 g33_271 g33_272 g33_273 g33_274 g33_275 
g33_276 g33_277 g33_278 g33_279 g33_280 g33_281 g33_282 g33_283 g33_284 g33_285
;
by cald;run;

data d; * this is number of variables in %let var = above ;
merge d_a /*d_b d_c*/ d_d /*d_e d_f d_g d_h d_i d_j d_k d_l d_m*/ d_n; 
by cald;
%include "C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Observed data_Zimbabwe.sas";
run;

data a.d_all;set d;run;
/*data d;set a.d_all;run;*/
ods html close;
ods listing;


* Checking outputs;
proc freq data=d;table 
/*
p50_p_w1524newpge1_onprep_0 
p50_n_w1524_newp_ge1__0
p50_n_sw_inprog_ly_0 
p50_n_prep_inj_sw_0 
p50_n_prep_inj_sdc_0

p50_p_w1524newpge1_onprep_1 
p50_n_w1524_newp_ge1__1
p50_n_sw_inprog_ly_1 
p50_n_prep_inj_sw_1
p50_n_prep_inj_sdc_1*/

p50_p_w1524newpge1_onprep_15 
p50_n_w1524_newp_ge1__15
/*p50_n_sw_inprog_ly_10 */
p50_n_prep_inj_sw_24
p50_n_prep_inj_sdc_25
p50_n_prep_inj_sdc_27
;run;



proc print data=d;
var p50_prop_sw_program_visit_0
	p50_n_tested_sw_0
	p50_n_tested_as_sw_0		/* N_TESTED_AS_SW SAME OUTPUT AS N_TESTED_SWPROG */
	p50_n_tested_swprog_0		/* this output not in model script - mistake? Changed s_tested_f_sw to s_tested_as_sw in create_wide_file */
	p50_n_diag_progsw_0			/* diagnosed this period */
	p50_n_diag_sw_inprog_0		/* total diagnosed */
	p50_n_attend_mens_clinic_0
	p50_n_access_adolescent_supp_0
	p50_n_access_adult_adh_supp_0
	p50_n_access_adult_ret_supp_0
;
where cald in (2030);run;







***Graphs comparing observed data to outputs for Status quo 1 and 15;
*Taken from Zim graphs in branch Death cascade;
ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
/*ods rtf file = 'C:\Users\Valentina\UCL Dropbox\Valentina Cambiano\MIHPSA Zimbabwe\Synthesis Findings\V21_20240523_from2023_100sim.doc' startpage=never; */
ods rtf file = 'C:\Users\rmjlja9\OneDrive - University College London\MIHPSA Zimbabwe\Phase 2\2025FEB11_FSW_tests\graphs_20250205.doc' startpage=never;


*1 - Minimal;
*15 - PrEP in AGYW;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 25000000 by  5000000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_alive_0 = "Status quo (median) - 15+ ";
label p50_n_alive_1 = "Minimal (median) - 15+ ";
*label p50_n_alive_15 = "Oral PrEP AGYW (median) - 15+ ";

*label p50_n_alive1549__0 = "Status quo (median) - 15-49 ";
label o_pop_all_Zi_cens = "Census - All ages";
label o_pop_1549_Zi_cens = "Census - 15-49";
label o_pop_all_Zi_CIA = "CIA - All ages";
label o_pop_1565_Zi_CIA = "CIA - All 15-64";
series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_alive_1 	upper=p95_n_alive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_alive_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_alive_15 	upper=p95_n_alive_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*scatter x=cald y=o_pop_all_Zi_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_pop_1549_Zi_cens / markerattrs = (symbol=square color=green size = 10);
*scatter x=cald y=o_pop_all_Zi_CIA / markerattrs = (symbol=triangle color=grey size = 10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs = (symbol=triangle color=brown size = 10);
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Population 15+ by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 20000000 by  5000000) valueattrs=(size=10);
label p50_n_alive_m_0 = "Status quo (median) - Males 15+ ";
label p50_n_alive_w_0 = "Status quo (median) - Females 15+ ";
label o_pop_allm_Zi_cens = "Census - Males all ages";
label o_pop_allw_Zi_cens = "Census - Females all ages";
label o_pop_1549m_Zi_cens = "Census - Males 15-49";
label o_pop_1549w_Zi_cens = "Census - Females 15-49";
series  x=cald y=p50_n_alive_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_alive_m_0 	upper=p95_n_alive_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_alive_w_0 	upper=p95_n_alive_w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*scatter x=cald y=o_pop_allm_Zi_cens / markerattrs = (symbol=square color=darkblue size = 10);
*scatter x=cald y=o_pop_allw_Zi_cens / markerattrs = (symbol=square color=darkorange size = 10);
scatter x=cald y=o_pop_1549m_Zi_cens / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_pop_1549w_Zi_cens / markerattrs = (symbol=square color=orange size = 10);
run;quit;
*/
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive by age in men";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by  2500000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_alive_1524m_0 = "Status quo (median) - 15-24 M";
label p50_n_alive_2549m_0 = "Status quo (median) - 25-49 M";
series  x=cald y=p50_n_alive_1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_alive_1524m_0 	upper=p95_n_alive_1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_2549m_0/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_alive_2549m_0 	upper=p95_n_alive_2549m_0  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive by age in women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 10000000 by  2500000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_alive_1524w_0 = "Status quo (median) - 15-24 W";
label p50_n_alive_2549w_0 = "Status quo (median) - 25-49 W";
series  x=cald y=p50_n_alive_1524w_0/	lineattrs = (color=darkorange thickness = 2);
band    x=cald lower=p5_n_alive_1524w_0 	upper=p95_n_alive_1524w_0  / transparency=0.9 fillattrs = (color=darkorange) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_2549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_alive_2549w_0 	upper=p95_n_alive_2549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

run;quit;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Status quo (median) ";
label p50_p_w_giv_birth_this_per_1 = "Minimal (median) ";
*label p50_p_w_giv_birth_this_per_15 = "Minimal5 (median) ";
series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_0 	upper=p95_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Status quo 90% range";
series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_1 	upper=p95_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Minimal 90% range";
*series  x=cald y=p50_p_w_giv_birth_this_per_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_w_giv_birth_this_per_15 	upper=p95_p_w_giv_birth_this_per_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Minimal5 90% range";
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.25 /*0.2*/ by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0  = "Status quo (median) - 15+";
label p50_p_newp_ge1__1  = "Minimal (median) - 15+  ";
*label p50_p_newp_ge1__15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge1__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_newp_ge1__15 	upper=p95_p_newp_ge1__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "p_1524_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_p_1524_newp_ge1__0 = "Status quo (median) - Both";
label p50_p_1524_newp_ge1__1 = "Minimal (median) ";
label p50_p_1524m_newp_ge1__0 = "Status quo (median) - Men";
label p50_p_1524w_newp_ge1__0 = "Status quo (median) - Women";
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
*/

*"Number of AGYW at elevated risk" n_w1524_newp_ge1; 
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of AGYW at elevated risk - n_w1524_newp_ge1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_w1524_newp_ge1__0  = "Status quo (median) - 15+";
label p50_n_w1524_newp_ge1__1  = "Minimal (median) - 15+  ";
label p50_n_w1524_newp_ge1__15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_w1524_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_w1524_newp_ge1__0 	upper=p95_n_w1524_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_w1524_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_w1524_newp_ge1__1 	upper=p95_n_w1524_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_w1524_newp_ge1__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_w1524_newp_ge1__15 	upper=p95_n_w1524_newp_ge1__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0  = "Status quo (median) - 15+";
label p50_p_newp_ge5__1  = "Minimal (median) - 15+  ";
*label p50_p_newp_ge5__15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge5__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_newp_ge5__15 	upper=p95_p_newp_ge5__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);

label p50_log_gender_r_newp_0  = "Status quo (median) - 15+";
label p50_log_gender_r_newp_1  = "Minimal (median) - 15+  ";
*label p50_log_gender_r_newp_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_log_gender_r_newp_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_log_gender_r_newp_15 	upper=p95_log_gender_r_newp_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_ep_0  = "Status quo (median) - 15+";
label p50_p_ep_1  = "Minimal (median) - 15+  ";
label p50_p_ep_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_ep_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_ep_15 	upper=p95_p_ep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

*The output included are all per year;
proc print data=a.d_all;
var p50_n_birth_0  				o_s_exppregn_MoH
    p50_p_anc_0					o_p_TESTEDorAW_anc_MoH
	p50_n_tested_anc_0 			o_n_tests_anc	o_n_firsttested_anc
	p50_n_tested_w_labdel_0		o_n_tested_labdel
	p50_n_tested_w_pd_0 		o_n_tested_postdel
	p50_n_tested_sw_0
	p50_n_tested_swprog_0
	p50_n_tested_w_0
	p50_n_tested_m_0
	p50_n_tested_0
	p50_n_tested_m_circ_0
	p50_n_tested_m_sympt_0
	p50_n_tested_w_sympt_0
	p50_n_diag_sympt_0
	p50_test_proppos_sympt_0 	p5_test_proppos_sympt_0 	p95_test_proppos_sympt_0
	p50_n_not_on_art_cd4050__0
	p50_n_not_on_art_cd450200__0
;
where cald in (2030);run;


*tested_anc=1 if tested at dt_start_pregn+0.25 or dt_start_pregn+0.5;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of live births";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1200000 by 200000) valueattrs=(size=10);*900000 if stopping in 2023;
label p50_n_birth_0 = "Status quo (median) ";
label p50_n_birth_1 = "Minimal (median) ";
*label p50_n_birth_15 = "Minimal5 (median) ";
label o_s_exppregn_MoH = "Number of expected pregnancies";
series  x=cald y=p50_n_birth_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_birth_0 	upper=p95_n_birth_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Status quo 90% range";
series  x=cald y=p50_n_birth_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_birth_1 	upper=p95_n_birth_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Minimal 90% range";
*series  x=cald y=p50_n_birth_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_birth_15 	upper=p95_n_birth_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Minimal5 90% range";
scatter x=cald y=o_s_exppregn_MoH / markerattrs = (symbol=square color=orange size = 10);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number women living with HIV giving birth";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 250000 by 50000) valueattrs=(size=10);*200000 if stopping in 2023;
label p50_n_give_birth_w_hiv_0 = "Status quo (median) ";
label p50_n_give_birth_w_hiv_1 = "Minimal (median) ";
*label p50_n_give_birth_w_hiv_15 = "Minimal5 (median) ";
label o_n_hiv_labdel = "Number HIV+ in labour and delivery";
series  x=cald y=p50_n_give_birth_w_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_give_birth_w_hiv_0 	upper=p95_n_give_birth_w_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Status quo 90% range";
series  x=cald y=p50_n_give_birth_w_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_give_birth_w_hiv_1 	upper=p95_n_give_birth_w_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Minimal 90% range";
*series  x=cald y=p50_n_give_birth_w_hiv_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_give_birth_w_hiv_15 	upper=p95_n_give_birth_w_hiv_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Minimal5 90% range";
scatter x=cald y=o_n_births_hivposmother / markerattrs = (symbol=square color=orange size = 10);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of pregnant women attending ANC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_anc_0  = "Status quo (median) - 15+";
label p50_p_anc_1  = "Minimal (median) - 15+  ";
*label p50_p_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_p_testedanc_1549_zdhs = "DHS - 15-49";
label o_p_TESTEDorAW_anc_MoH = "MoH";
series  x=cald y=p50_p_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_anc_0 	upper=p95_p_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_anc_1 	upper=p95_p_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_anc_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_anc_15 	upper=p95_p_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_testedanc_1549_zdhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_TESTEDorAW_anc_MoH / markerattrs = (symbol=square color=blue size = 10);
run;quit;



*Testing;
proc print data=a.d_all;
var  				
	p50_n_tested_1
 	p50_n_tested_w_1
	p50_n_tested_m_1
	p50_n_tested_m_circ_1
	p50_n_tested_m_sympt_1
	p50_n_tested_w_sympt_1
	p50_n_tested_anc_1 			
	p50_n_tested_w_labdel_1		
	p50_n_tested_w_pd_1 		
	p50_n_tested_sw_1
	p50_n_tested_swprog_1
	p50_n_tested_tb_1
	p50_n_tested_general_1
	p50_n_tested_startprep_1
	p50_n_tested_onprep_1
	p50_n_tested_rsprep_1
	p50_n_tested_prep_1
;
where cald in (2030);run;

*Number attending ANC;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_anc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1500000 by 250000) valueattrs=(size=10);
label p50_n_tested_anc_0  = "Status quo (median) - 15+";
label p50_n_tested_anc_1  = "Minimal (median) - 15+  ";
label p50_n_tested_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_tests_anc = "Number of women tested in ANC";*It includes the following;
label o_n_firsttested_anc = "Number of women tested for the first time in ANC";
series  x=cald y=p50_n_tested_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_anc_0 	upper=p95_n_tested_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_anc_1 	upper=p95_n_tested_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_anc_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_anc_15 	upper=p95_n_tested_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*scatter x=cald y=o_n_tests_anc / markerattrs = (symbol=square color=orange size = 10); *This is higher than the number of live births;
scatter x=cald y=o_n_firsttested_anc / markerattrs = (symbol=square color=blue size = 10);
run;quit;

*# of women who were tested for the first time in ANC: o_n_firsttested_an";
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time in ANC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_anc_0  = "Status quo (median) - 15+";
label p50_n_tested1st_anc_1  = "Minimal (median) - 15+  ";
label p50_n_tested1st_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_firsttested_anc = "Number of woment tested for the first time in ANC";
series  x=cald y=p50_n_tested1st_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested1st_anc_0 	upper=p95_n_tested1st_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested1st_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested1st_anc_1 	upper=p95_n_tested1st_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested1st_anc_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested1st_anc_15 	upper=p95_n_tested1st_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_firsttested_anc/ markerattrs = (symbol=square color=orange size = 10);
run;quit;
*/
proc sgplot data=d; 
Title    height=1.5 justify=center "New diagnoses in ANC and during labour and delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  40000 by 5000) valueattrs=(size=10);
label p50_n_diag_anc_0  = "Status quo (median) - 15+";
label p50_n_diag_anc_1  = "Minimal (median) - 15+  ";
*label p50_n_diag_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_newdiag_anc = "Number of women diagnosed in ANC";
series  x=cald y=p50_n_diag_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_anc_0 	upper=p95_n_diag_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diag_anc_1 	upper=p95_n_diag_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_diag_anc_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_diag_anc_15 	upper=p95_n_diag_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_0/	lineattrs = (color=black thickness = 5);
band    x=cald lower=p5_n_diag_labdel_0 	upper=p95_n_diag_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_1/	lineattrs = (color=red thickness = 5);
band    x=cald lower=p5_n_diag_labdel_1 	upper=p95_n_diag_labdel_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_diag_labdel_15/	lineattrs = (color=green thickness = 5);
*band    x=cald lower=p5_n_diag_labdel_15 	upper=p95_n_diag_labdel_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_newdiag_anc / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_labdel";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  300000 by 50000) valueattrs=(size=10);
label p50_n_tested_w_labdel_0  = "Status quo (median) - 15+";
label p50_n_tested_w_labdel_1  = "Minimal (median) - 15+  ";
*label p50_n_tested_w_labdel_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_tested_labdel = "Number of woment tested during labour and delivery";
series  x=cald y=p50_n_tested_w_labdel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_labdel_0 	upper=p95_n_tested_w_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_labdel_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_labdel_1 	upper=p95_n_tested_w_labdel_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_w_labdel_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_w_labdel_15 	upper=p95_n_tested_w_labdel_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_tested_labdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time in Labour and Delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_labdel_0  = "Status quo (median) - 15+";
label p50_n_tested1st_labdel_1  = "Minimal (median) - 15+  ";
label p50_n_tested1st_labdel_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_firsttested_labdel = "Number of woment tested for the first time during labour and delivery";
series  x=cald y=p50_n_tested1st_labdel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested1st_labdel_0 	upper=p95_n_tested1st_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested1st_labdel_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested1st_labdel_1 	upper=p95_n_tested1st_labdel_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested1st_labdel_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested1st_labdel_15 	upper=p95_n_tested1st_labdel_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_firsttested_labdel/ markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "New diagnoses during labour and delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000 by 250) valueattrs=(size=10);
label p50_n_diag_labdel_0  = "Status quo (median) - 15+";
label p50_n_diag_labdel_1  = "Minimal (median) - 15+  ";
label p50_n_diag_labdel_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_newdiag_labdel = "Number of women diagnosed during labour and delivery";
series  x=cald y=p50_n_diag_labdel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_labdel_0 	upper=p95_n_diag_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diag_labdel_1 	upper=p95_n_diag_labdel_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_diag_labdel_15 	upper=p95_n_diag_labdel_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_newdiag_labdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;*/

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_pd";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_tested_w_pd_0  = "Status quo (median) - 15+";
label p50_n_tested_w_pd_1  = "Minimal (median) - 15+  ";
*label p50_n_tested_w_pd_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_tested_postdel = "Number of woment tested post delivery";
series  x=cald y=p50_n_tested_w_pd_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_pd_0 	upper=p95_n_tested_w_pd_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_pd_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_pd_1 	upper=p95_n_tested_w_pd_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_w_pd_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_w_pd_15 	upper=p95_n_tested_w_pd_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_tested_postdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time post-delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_pd_0  = "Status quo (median) - 15+";
label p50_n_tested1st_pd_1  = "Minimal (median) - 15+  ";
label p50_n_tested1st_pd_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_firsttested_postdel = "Number of woment tested for the first time post delivery";
series  x=cald y=p50_n_tested1st_pd_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested1st_pd_0 	upper=p95_n_tested1st_pd_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested1st_pd_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested1st_pd_1 	upper=p95_n_tested1st_pd_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested1st_pd_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested1st_pd_15 	upper=p95_n_tested1st_pd_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_firsttested_postdel/ markerattrs = (symbol=square color=orange size = 10);
run;quit;*/
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "New diagnoses in post-delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000 by 250) valueattrs=(size=10);
label p50_n_diag_pd_0  = "Status quo (median) - 15+";
label p50_n_diag_pd_1  = "Minimal (median) - 15+  ";
label p50_n_diag_pd_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_newdiag_postdel = "Number of women diagnosed in post-delivery";
series  x=cald y=p50_n_diag_pd_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_pd_0 	upper=p95_n_diag_pd_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_pd_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diag_pd_1 	upper=p95_n_diag_pd_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_pd_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_diag_pd_15 	upper=p95_n_diag_pd_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_newdiag_postdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;*/
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  250000 by 50000) valueattrs=(size=10);
label p50_n_tested_sw_0  = "Status quo (median) - 15+";
label p50_n_tested_sw_1  = "Minimal (median) - 15+  ";
label p50_n_tested_sw_14 = "Oral PrEP AGYW (median) - 15+ ";
label o_nfswtested_sistclin = "Number of FSW tested in the Sisters clinics";
series  x=cald y=p50_n_tested_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_0 	upper=p95_n_tested_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_1 	upper=p95_n_tested_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_sw_14 	upper=p95_n_tested_sw_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_nfswtested_sistclin / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_sympt";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000 by 100000) valueattrs=(size=10);
label p50_n_tested_w_sympt_0  = "Status quo (median) - 15+";
label p50_n_tested_w_sympt_1  = "Minimal (median) - 15+  ";
*label p50_n_tested_w_sympt_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_w_sympt_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_sympt_0 	upper=p95_n_tested_w_sympt_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_sympt_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_sympt_1 	upper=p95_n_tested_w_sympt_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_w_sympt_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_w_sympt_15 	upper=p95_n_tested_w_sympt_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV tests performed in women (age 15+, excluding self tests)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  4000000 by 500000) valueattrs=(size=10);*2500000 if stopping in 2023;
label p50_n_tested_w_0  = "Status quo (median) - 15+";
label p50_n_tested_w_1  = "Minimal (median) - 15+  ";
label p50_n_tested_w_14 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_0 	upper=p95_n_tested_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_1 	upper=p95_n_tested_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_w_14 	upper=p95_n_tested_w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0  = "Status quo (median) - 15+";
label p50_p_tested_past_year_1549w_1  = "Minimal (median) - 15+  ";
*label p50_p_tested_past_year_1549w_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_p_testedly_1549w_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_past_year_1549w_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_tested_past_year_1549w_15 	upper=p95_p_tested_past_year_1549w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_testedly_1549w_zdhs/	markerattrs = (color=black) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV tests performed (age 15+, excluding self tests)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  8000000 by 1000000) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_0  = "Status quo (median) - 15+";
label p50_n_tested_1  = "Minimal (median) - 15+  ";
*label p50_n_tested_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_15 	upper=p95_n_tested_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV tests performed in men (age 15+, excluding self tests)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1800000 by 200000) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_m_0  = "Status quo (median) - 15+";
label p50_n_tested_m_1  = "Minimal (median) - 15+  ";
*label p50_n_tested_m_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_0 	upper=p95_n_tested_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_1 	upper=p95_n_tested_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_m_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_m_15 	upper=p95_n_tested_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m_sympt";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000 by 100000) valueattrs=(size=10);
label p50_n_tested_m_sympt_0  = "Status quo (median) - 15+";
label p50_n_tested_m_sympt_1  = "Minimal (median) - 15+  ";
*label p50_n_tested_m_sympt_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_sympt_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_sympt_0 	upper=p95_n_tested_m_sympt_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_sympt_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_sympt_1 	upper=p95_n_tested_m_sympt_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_m_sympt_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_m_sympt_15 	upper=p95_n_tested_m_sympt_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m_circ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_tested_m_circ_0  = "Status quo (median) - 15+";
label p50_n_tested_m_circ_1  = "Minimal (median) - 15+  ";
*label p50_n_tested_m_circ_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_circ_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_circ_0 	upper=p95_n_tested_m_circ_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_circ_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_circ_1 	upper=p95_n_tested_m_circ_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_m_circ_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_m_circ_15 	upper=p95_n_tested_m_circ_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0  = "Status quo (median) - 15+";
label p50_p_tested_past_year_1549m_1  = "Minimal (median) - 15+  ";
*label p50_p_tested_past_year_1549m_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_p_testedly_1549m_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_past_year_1549m_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_tested_past_year_1549m_15 	upper=p95_p_tested_past_year_1549m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_testedly_1549m_zdhs/	markerattrs = (color=black) ;
run;quit;



/*
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_non_anc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1000000 by 100000) valueattrs=(size=10);
label p50_n_tested_w_non_anc_0  = "Status quo (median) - 15+";
label p50_n_tested_w_non_anc_1  = "Minimal (median) - 15+  ";
label p50_n_tested_w_non_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_w_non_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_non_anc_0 	upper=p95_n_tested_w_non_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_non_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_non_anc_1 	upper=p95_n_tested_w_non_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_non_anc_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_w_non_anc_15 	upper=p95_n_tested_w_non_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;
*/






*test_prop_positive;
proc sgplot data=d; 
Title    height=1.5 justify=center "Positivity rate";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.8 by 0.2) valueattrs=(size=10);
label p50_test_prop_positive_0  = "Status quo (median)";
label p50_test_prop_positive_1  = "Minimal (median)";
*label p50_test_prop_positive_15 = "Oral PrEP AGYW (median)";
label o_pos_rate_15ov_z = "CAL - Public sector";
label o_pos_rate_pepfar = "PEPFAR";
series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_test_prop_positive_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_test_prop_positive_1 	upper=p95_test_prop_positive_15  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_test_prop_positive_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_test_prop_positive_15 	upper=p95_test_prop_positive_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_pos_rate_15ov_z/	markerattrs = (color=grey ) ;
scatter  x=cald y=o_pos_rate_sympt_pepfar/	markerattrs = (color=black ) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Positivity rate in testing conducted among symptomatic people";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.8 by 0.2) valueattrs=(size=10);
label p50_test_proppos_sympt_0  = "Status quo (median)";
label p50_test_proppos_sympt_1  = "Minimal (median)";
*label p50_test_proppos_sympt_15 = "Oral PrEP AGYW (median)";
label o_pos_rate_pepfar = "PEPFAR";
series  x=cald y=p50_test_proppos_sympt_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_proppos_sympt_0 	upper=p95_test_proppos_sympt_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_test_proppos_sympt_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_test_proppos_sympt_1 	upper=p95_test_proppos_sympt_15  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_test_proppos_sympt_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_test_proppos_sympt_15 	upper=p95_test_proppos_sympt_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_pos_rate_sympt_pepfar/	markerattrs = (color=black ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new diagnoses with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);
label p50_n_diagnosed_0 = "Status quo (median)";
label p50_n_diagnosed_1 = "Minimal (median)";
*label p50_n_diagnosed_15 = "Oral PrEP AGYW (median)";
series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diagnosed_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_diagnosed_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_diagnosed_15 	upper=p95_n_diagnosed_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;






*!!!!!Note that the observed data are 15+;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Status quo (median)";
label p50_p_mcirc_1549m_1 = "Minimal (median)";
label p50_p_mcirc_1549m_13 = "VMMC (median)";
*label p50_p_mcirc_0 = "Status quo (median) - 15+?";
label o_p_circ_15pl_DHS_z= "CAL - DHIS2 men 15+";
label o_p_circ_1549_zimphia= "ZIMPHIA men 15-49";
label o_p_circ_1549_zimphia= "NSP target";
series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_1549m_13/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_13 	upper=p95_p_mcirc_1549m_13  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_circ_15pl_DHS_z /	markerattrs = (color=orange);
scatter  x=cald y=o_p_circ_1549_zimphia /	markerattrs = (color=blue);
scatter  x=cald y=target_p_circ_1549m_NSP /	markerattrs = (color=pink);
run;quit;

 
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual # new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_new_vmmc1549m_0 = "Status quo (median) ";
label p50_n_new_vmmc1549m_1 = "Minimal (median) ";
label p50_n_new_vmmc1549m_13 = "VMMC (median) ";
label o_s_test_15ov_py_z = "CAL - Annual number of new circumcisions 10-49";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_vmmc1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_1 	upper=p95_n_new_vmmc1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_vmmc1549m_13/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_13 	upper=p95_n_new_vmmc1549m_13  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
/*scatter  x=cald y=o_s_new_mcirc/	markerattrs = (color=blue ) ;*/
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of current female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Status quo (median) ";
label p50_prop_w_1549_sw_1 = "Minimal (median) ";
*label p50_prop_w_1549_sw_15 = "Minimal5 (median) ";
label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_1549_sw_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prop_w_1549_sw_15 	upper=p95_prop_w_1549_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_fsw_1849_Zim_garpr /	markerattrs = (color=orange);
scatter  x=cald y=o_p_fsw_1849_Bulaw_garpr /	markerattrs = (color=red);
scatter  x=cald y=o_p_fsw_1849_Harare_garpr /	markerattrs = (color=pink);
run;quit;
/*proc print data=d;var p50_prop_w_1549_sw_0 p5_prop_w_1549_sw_0 p95_prop_w_1549_sw_0;where cald=2020;run;*/
/*proc print data=d;var o_p_fsw_1849_Zim_garpr o_p_fsw_1849_Bulaw_garpr o_p_fsw_1849_Harare_garpr;run;*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of ever female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";
*label p50_prop_w_ever_sw_15 = "Ever FSW 15-64 op 0 (median) ";
label o_p_ever_fsw_1ts_1849w_nbcs = "NBCS - Ever transactional sex 18-49";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_ever_sw_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prop_w_ever_sw_15 	upper=p95_prop_w_ever_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_ever_fsw_1ts_1849w_nbcs /	markerattrs = (color=green);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";
*label p50_prop_sw_hiv_15 = "FSW with HIV 15-64 op 1 (median) ";
label o_prev_fsw_dw = "David Wilson";
label o_prev_fsw_rdshm = "RDS Hwange and Mutare";
label o_prev_fsw_rdsvf = "RDS Victoria Falls";
label o_prev_fsw_tested_swvp = "Sisters with a Voice";
label o_prev_fsw_rds = "RDS Status quo SAPPH-IRe";
series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_sw_hiv_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prop_sw_hiv_15 	upper=p95_prop_sw_hiv_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_prev_fsw_dw /  yerrorlower=o_prev_fsw_ll_dw yerrorupper=o_prev_fsw_ul_dw markerattrs = (color=black) ERRORBARATTRS = (color = black) ;
scatter x=cald y=o_prev_fsw_rdshm / markerattrs = (color=blue) ;
scatter x=cald y=o_prev_fsw_rdsvf / markerattrs = (color=red) ;
scatter x=cald y=o_prev_fsw_tested_swvp / markerattrs = (color=green) ;
scatter x=cald y=o_prev_fsw_rds /  yerrorlower=o_prev_fsw_ll_rds yerrorupper=o_prev_fsw_ul_rds markerattrs = (color=orange) ERRORBARATTRS = (color = orange) ;
run;quit;
/*proc print data=d;var p50_prop_sw_hiv_0 p5_prop_sw_hiv_0 p95_prop_sw_hiv_0;where cald=2020;run;
proc freq data=d;table p95_n_prep_0;run;*/


* n_tested_sw;					
* n_tested_as_sw;				
* n_tested_swprog;				

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW tested total";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e5 by 2e4) valueattrs=(size=10);
label p50_n_tested_sw_0  = "Number of FSW tested op 0 (median) ";
label p50_n_tested_sw_1  = "Number of FSW tested op 1 (median) ";
series  x=cald y=p50_n_tested_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_0 	upper=p95_n_tested_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_1 	upper=p95_n_tested_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW tested as SW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e5 by 2e4) valueattrs=(size=10);
label p50_n_tested_as_sw_0  = "Number of FSW tested as SW op 0 (median) ";
label p50_n_tested_as_sw_1  = "Number of FSW tested as SW op 1 (median) ";
series  x=cald y=p50_n_tested_as_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_as_sw_0 	upper=p95_n_tested_as_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_as_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_as_sw_1 	upper=p95_n_tested_as_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW tested due to SW program";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_tested_swprog_0  = "Number of FSW tested due to SW program op 0 (median) ";
label p50_n_tested_swprog_1  = "Number of FSW tested due to SW program op 1 (median) ";
label p50_n_tested_swprog_8  = "Number of FSW tested due to SW program op 8 (median) ";
series  x=cald y=p50_n_tested_swprog_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_swprog_0 	upper=p95_n_tested_swprog_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_swprog_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_swprog_1 	upper=p95_n_tested_swprog_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_swprog_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_swprog_8 	upper=p95_n_tested_swprog_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW who visited the progam this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_program_visit_0  = "Prop of FSW with program visit op 0 (median) ";
label p50_prop_sw_program_visit_1  = "Prop of FSW with program visit op 1 (median) ";
label p50_prop_sw_program_visit_8  = "Prop of FSW with program visit op 8 (median) ";
series  x=cald y=p50_prop_sw_program_visit_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_0 	upper=p95_prop_sw_program_visit_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_program_visit_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_1 	upper=p95_prop_sw_program_visit_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_program_visit_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_8 	upper=p95_prop_sw_program_visit_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW in SW program in past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_sw_inprog_ly_0  = "Number of FSW in SW program in past year op 0 (median) ";
label p50_n_sw_inprog_ly_1  = "Number of FSW in SW program in past year op 1 (median) ";
label p50_n_sw_inprog_ly_8  = "Number of FSW in SW program in past year op 8 (median) ";
series  x=cald y=p50_n_sw_inprog_ly_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_0 	upper=p95_n_sw_inprog_ly_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_inprog_ly_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_1 	upper=p95_n_sw_inprog_ly_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_inprog_ly_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_8 	upper=p95_n_sw_inprog_ly_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_inprog_ly_33/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_33 	upper=p95_n_sw_inprog_ly_33  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
run;quit;
**THIS OUTPUT NOW WORKING;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of SW program visits in past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_sw_program_visit_0  = "Number of SW program visits in past year op 0 (median) ";
label p50_n_sw_program_visit_1  = "Number of SW program visits in past year op 1 (median) ";
label p50_n_sw_program_visit_8  = "Number of SW program visits in past year op 8 (median) ";
series  x=cald y=p50_n_sw_program_visit_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_0 	upper=p95_n_sw_program_visit_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_program_visit_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_1 	upper=p95_n_sw_program_visit_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_program_visit_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_8 	upper=p95_n_sw_program_visit_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_prep_oral_sw_0  = "Number of FSW on PrEP op 0 (median) ";
label p50_n_prep_oral_sw_1  = "Number of FSW on PrEP op 1 (median) ";
label p50_n_prep_oral_sw_8  = "Number of FSW on PrEP op 8 (median) ";
label p50_n_prep_oral_sw_33  = "Number of FSW on PrEP op 33 (median) ";
label p50_n_prep_0  = "Total on PrEP op 0 (median) ";
label p50_n_prep_1  = "Total on PrEP op 1 (median) ";
label p50_n_prep_8  = "Total on PrEP op 8 (median) ";
series  x=cald y=p50_n_prep_oral_sw_0/	lineattrs = (color=black thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_0 	upper=p95_n_prep_oral_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_1/	lineattrs = (color=red thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_1 	upper=p95_n_prep_oral_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_8/	lineattrs = (color=green thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_8 	upper=p95_n_prep_oral_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_33/	lineattrs = (color=blue thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_33 	upper=p95_n_prep_oral_sw_33  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_prep_0/			lineattrs = (color=black thickness = 2 pattern=MediumDash);*/
/*band    x=cald lower=p5_n_prep_0 	upper=p95_n_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_1/			lineattrs = (color=red thickness = 2 pattern=MediumDash);*/
/*band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_8/			lineattrs = (color=green thickness = 2 pattern=MediumDash);*/
/*band    x=cald lower=p5_n_prep_8 	upper=p95_n_prep_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_diag_sw_0  = "Prop of HIV+ FSW diagnosed op 0 (median) ";
label p50_p_diag_sw_1  = "Prop of HIV+ FSW diagnosed op 1 (median) ";
series  x=cald y=p50_p_diag_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_sw_0 	upper=p95_p_diag_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_1 	upper=p95_p_diag_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number SW diagnosed this period due to FSW program";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e4 by 2e3) valueattrs=(size=10);
label p50_n_diag_progsw_0  = "Number SW diagnosed this period by program op 0 (median) ";
label p50_n_diag_progsw_1  = "Number SW diagnosed this period by program op 1 (median) ";
series  x=cald y=p50_n_diag_progsw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_progsw_0 	upper=p95_n_diag_progsw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_progsw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diag_progsw_1 	upper=p95_n_diag_progsw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
/*proc freq data=d; table p50_n_diag_progsw_0; run;*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Number SW diagnosed this period total";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e4 by 2e3) valueattrs=(size=10);
label p50_n_diag_sw_0  = "Number SW diagnosed this period op 0 (median) ";
label p50_n_diag_sw_1  = "Number SW diagnosed this period op 1 (median) ";
series  x=cald y=p50_n_diag_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_sw_0 	upper=p95_n_diag_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diag_sw_1 	upper=p95_n_diag_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
/*proc freq data=d; table p50_n_diag_progsw_0; run;*/




proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 20 by 1) valueattrs=(size=10);
label p50_incidence_sw_0 = "Status quo (median) ";
label p50_incidence_sw_1 = "Minimal (median) ";
series  x=cald y=p50_incidence_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_sw_0 	upper=p95_incidence_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_1 	upper=p95_incidence_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 350000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_0 = "Status quo (median) ";
label p50_n_prep_1 = "Minimal  (median) ";
label p50_n_prep_15 = "Minimal5  (median) ";
series  x=cald y=p50_n_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_0 	upper=p95_n_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_14 	upper=p95_n_prep_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of women aged 15-24 initiating oral PrEP for the first time ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 25000 ) valueattrs=(size=10);
label p50_n_init_prep_oral_1524w_0 = "Status quo (median) ";
label p50_n_init_prep_oral_1524w_1 = "Minimal  (median) ";
label p50_n_init_prep_oral_1524w_14 = "Minimal5  (median) ";
label target_prepinit_1524w = "Target (PrEP_New)";
series  x=cald y=p50_n_init_prep_oral_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_1524w_0 	upper=p95_n_init_prep_oral_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_1524w_1 	upper=p95_n_init_prep_oral_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_1524w_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_1524w_14 	upper=p95_n_init_prep_oral_1524w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=target_prepinit_1524w  / markerattrs = (color=black);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women aged 15-24 actively taking oral PrEP (excluding newly enrolled) during the last quarter";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 25000 ) valueattrs=(size=10);
label p50_n_contprep_oral_1524w_0 = "Status quo (median) ";
label p50_n_contprep_oral_1524w_1 = "Minimal  (median) ";
label p50_n_contprep_oral_1524w_14 = "Minimal5  (median) ";
label target_prep_1524w_lq = "Target (PrEP_CT)";
series  x=cald y=p50_n_contprep_oral_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_contprep_oral_1524w_0 	upper=p95_n_contprep_oral_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_contprep_oral_1524w_1 	upper=p95_n_contprep_oral_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_1524w_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_contprep_oral_1524w_14 	upper=p95_n_contprep_oral_1524w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=target_prep_1524w_lq  / markerattrs = (color=black);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women aged 15-24 actively taking oral PrEP in the last 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 25000 ) valueattrs=(size=10);
label p50_n_prep_1524w_0 = "Status quo (median) ";
label p50_n_prep_1524w_1 = "Minimal  (median) ";
*label p50_n_prep_1524w_14 = "Minimal5  (median) ";
label target_curr_prep_1524w = "Target (Currently on PrEP) - last month";
series  x=cald y=p50_n_prep_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_1524w_0 	upper=p95_n_prep_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_1524w_1 	upper=p95_n_prep_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_prep_1524w_14/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_prep_1524w_14 	upper=p95_n_prep_1524w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=target_curr_prep_1524w  / markerattrs = (color=black);
run;quit;
*/

*AGYW PrEP;
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of AGYW initiating PrEP for the first time ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2e5   by 5e4 ) valueattrs=(size=10);
label p50_n_init_prep_oral_1524w_0 = 	"Status quo (median) ";
label p50_n_init_prep_oral_1524w_1 =	"Minimal  (median) ";
label p50_n_init_prep_oral_1524w_14 = 	"OPrEPAGYW  (median) ";
label p50_n_init_prep_vr_1524w_19 = 	"DPrEPAGYW  (median) ";
label p50_n_init_prep_inj_1524w_23 = 	"IPrEPAGYW  (median) ";
label target_prepinit_1524w = "Target (PrEP_New)";
series  x=cald y=p50_n_init_prep_oral_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_1524w_0 	upper=p95_n_init_prep_oral_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_1524w_1 	upper=p95_n_init_prep_oral_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_1524w_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_1524w_14 	upper=p95_n_init_prep_oral_1524w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_vr_1524w_19/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_init_prep_vr_1524w_19 	upper=p95_n_init_prep_vr_1524w_19  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_inj_1524w_23/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_init_prep_inj_1524w_23 	upper=p95_n_init_prep_inj_1524w_23  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prepinit_1524w  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of AGYW actively taking PrEP (excluding newly enrolled) during the last quarter";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2e5   by 1e5 ) valueattrs=(size=10);
label p50_n_contprep_oral_1524w_0 = 	"Status quo (median) ";
label p50_n_contprep_oral_1524w_1 = 	"Minimal  (median) ";
label p50_n_contprep_oral_1524w_14 = 	"OPrEPAGYW  (median) ";
label p50_n_contprep_vr_1524w_19 = 		"DPrEPAGYW  (median) ";
label p50_n_contprep_inj_1524w_23 = 	"IPrEPAGYW  (median) ";
label target_prep_lq_1524w = "Target (PrEP_CT)";
series  x=cald y=p50_n_contprep_oral_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_contprep_oral_1524w_0 	upper=p95_n_contprep_oral_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_contprep_oral_1524w_1 	upper=p95_n_contprep_oral_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_1524w_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_contprep_oral_1524w_14 	upper=p95_n_contprep_oral_1524w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_vr_1524w_19/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_contprep_vr_1524w_19 		upper=p95_n_contprep_vr_1524w_19  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_inj_1524w_23/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_contprep_inj_1524w_23 	upper=p95_n_contprep_inj_1524w_23  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prep_lq_1524w  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of AGYW actively taking PrEP in the last 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2e5   by 1e5 ) valueattrs=(size=10);
/*label p50_n_prep_1524w_0 = "Status quo (median) ";*/
/*label p50_n_prep_1524w_1 = "Minimal  (median) ";*/
/*label p50_n_prep_1524w_15 = "Minimal5  (median) ";*/
label p50_n_prep_oral_1524w_0 = 	"Status quo (median) ";
label p50_n_prep_oral_1524w_1 = 	"Minimal  (median) ";
label p50_n_prep_oral_1524w_14 = 	"OPrEPAGYW  (median) ";
label p50_n_prep_vr_1524w_19 = 		"DPrEPAGYW  (median) ";
label p50_n_prep_inj_1524w_23 = 	"IPrEPAGYW  (median) ";
label target_curr_prep_1524w = "Target (Currently on PrEP) - last month";
/*series  x=cald y=p50_n_prep_1524w_0/	lineattrs = (color=black thickness = 2);*/
/*band    x=cald lower=p5_n_prep_1524w_0 	upper=p95_n_prep_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_1524w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_prep_1524w_1 	upper=p95_n_prep_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_1524w_14/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_prep_1524w_14 	upper=p95_n_prep_1524w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_prep_oral_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_1524w_0 	upper=p95_n_prep_oral_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_1524w_1 	upper=p95_n_prep_oral_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_1524w_14/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_oral_1524w_14 	upper=p95_n_prep_oral_1524w_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_1524w_19/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_1524w_19 		upper=p95_n_prep_vr_1524w_19  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_1524w_23/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_prep_inj_1524w_23 	upper=p95_n_prep_inj_1524w_23  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_curr_prep_1524w  / markerattrs = (color=orange);
run;quit;


*FSW PrEP;
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of FSW initiating PrEP for the first time ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 3e4   by 5e3 ) valueattrs=(size=10);
label p50_n_init_prep_oral_sw_0 = 	"Status quo (median) ";
label p50_n_init_prep_oral_sw_1 =	"Minimal  (median) ";
label p50_n_init_prep_oral_sw_15 = 	"OPrEPFSW  (median) ";
label p50_n_init_prep_vr_sw_20 = 	"DPrEPFSW  (median) ";
label p50_n_init_prep_inj_sw_24 = 	"IPrEPFSW  (median) ";
label target_prepinit_fsw = "Target (PrEP_New)";
series  x=cald y=p50_n_init_prep_oral_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sw_0 	upper=p95_n_init_prep_oral_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sw_1 	upper=p95_n_init_prep_oral_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_sw_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sw_15 	upper=p95_n_init_prep_oral_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_vr_sw_20/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_init_prep_vr_sw_20 	upper=p95_n_init_prep_vr_sw_20  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_inj_sw_24/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_init_prep_inj_sw_24 	upper=p95_n_init_prep_inj_sw_24  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prepinit_fsw  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW actively taking PrEP (excluding newly enrolled) during the last quarter";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 6e4   by 1e4 ) valueattrs=(size=10);
label p50_n_contprep_oral_sw_0 = 	"Status quo (median) ";
label p50_n_contprep_oral_sw_1 = 	"Minimal  (median) ";
label p50_n_contprep_oral_sw_15 = 	"OPrEPFSW  (median) ";
label p50_n_contprep_vr_sw_20 = 	"DPrEPFSW  (median) ";
label p50_n_contprep_inj_sw_24 = 	"IPrEPFSW  (median) ";
label target_prep_lq_fsw = "Target (PrEP_CT)";
series  x=cald y=p50_n_contprep_oral_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sw_0 	upper=p95_n_contprep_oral_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sw_1 	upper=p95_n_contprep_oral_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_sw_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sw_15 	upper=p95_n_contprep_oral_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_vr_sw_20/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_contprep_vr_sw_20 		upper=p95_n_contprep_vr_sw_20  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_inj_sw_24/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_contprep_inj_sw_24 	upper=p95_n_contprep_inj_sw_24  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prep_lq_fsw  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW actively taking PrEP in the last 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 6e4   by 1e4 ) valueattrs=(size=10);
/*label p50_n_prep_sw_0 = "Status quo (median) ";*/
/*label p50_n_prep_sw_1 = "Minimal  (median) ";*/
/*label p50_n_prep_sw_15 = "Minimal5  (median) ";*/
label p50_n_prep_oral_sw_0 = 	"Status quo (median) ";
label p50_n_prep_oral_sw_1 = 	"Minimal  (median) ";
label p50_n_prep_oral_sw_15 = 	"OPrEPFSW  (median) ";
label p50_n_prep_vr_sw_20 = 	"DPrEPFSW  (median) ";
label p50_n_prep_inj_sw_24 = 	"IPrEPFSW  (median) ";
label target_curr_prep_fsw = "Target (Currently on PrEP) - last month";
/*series  x=cald y=p50_n_prep_sw_0/	lineattrs = (color=black thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sw_0 	upper=p95_n_prep_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sw_1 	upper=p95_n_prep_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_sw_15/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sw_15 	upper=p95_n_prep_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_prep_oral_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_sw_0 	upper=p95_n_prep_oral_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_sw_1 	upper=p95_n_prep_oral_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_oral_sw_15 	upper=p95_n_prep_oral_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_sw_20/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_sw_20 		upper=p95_n_prep_vr_sw_20  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_sw_24/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_prep_inj_sw_24 	upper=p95_n_prep_inj_sw_24  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_curr_prep_fsw  / markerattrs = (color=orange);
run;quit;

/*proc sgplot data=d; */
/*Title    height=1.5 justify=center "Proportion of 15-64 year olds on PrEP";*/
/*xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); */
/*yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.02   by 0.005 ) valueattrs=(size=10);*/
/*label p50_prop_1564_onprep_0 = 	"Status quo (median) ";*/
/*label p50_prop_1564_onprep_1 = 	"Minimal  (median) ";*/
/*label p50_prop_1564_onprep_15 = 	"OPrEPFSW  (median) ";*/
/*label p50_prop_1564_onprep_20 = 	"DPrEPFSW  (median) ";*/
/*label p50_prop_1564_onprep_24 = 	"IPrEPFSW  (median) ";*/
/*series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_15/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_15 	upper=p95_n_contprep_oral_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_20/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_20 		upper=p95_prop_1564_onprep_20  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_24/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_24 	upper=p95_prop_1564_onprep_24  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
/*run;quit;*/






*SDC PrEP;
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of SDC initiating PrEP for the first time ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5e4   by 5e3 ) valueattrs=(size=10);
label p50_n_init_prep_oral_sdc_0 = 	"Status quo (median) ";
label p50_n_init_prep_oral_sdc_1 =	"Minimal  (median) ";
label p50_n_init_prep_oral_sdc_16 = 	"OPrEPSDC  (median) ";
label p50_n_init_prep_vr_sdc_21 = 	"DPrEPSDC  (median) ";
label p50_n_init_prep_inj_sdc_25 = 	"IPrEPSDC  (median) ";
label target_prepinit_sdc = "Target (PrEP_New)";
series  x=cald y=p50_n_init_prep_oral_sdc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sdc_0 	upper=p95_n_init_prep_oral_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_sdc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sdc_1 	upper=p95_n_init_prep_oral_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_sdc_16/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sdc_16 	upper=p95_n_init_prep_oral_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_vr_sdc_21/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_init_prep_vr_sdc_21 	upper=p95_n_init_prep_vr_sdc_21  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_inj_sdc_25/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_init_prep_inj_sdc_25 	upper=p95_n_init_prep_inj_sdc_25  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prepinit_sdc  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of SDC actively taking PrEP (excluding newly enrolled) during the last quarter";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 8e4   by 1e4 ) valueattrs=(size=10);
label p50_n_contprep_oral_sdc_0 = 	"Status quo (median) ";
label p50_n_contprep_oral_sdc_1 = 	"Minimal  (median) ";
label p50_n_contprep_oral_sdc_16 = 	"OPrEPSDC  (median) ";
label p50_n_contprep_vr_sdc_21 = 	"DPrEPSDC  (median) ";
label p50_n_contprep_inj_sdc_25 = 	"IPrEPSDC  (median) ";
label target_prep_lq_sdc = "Target (PrEP_CT)";
series  x=cald y=p50_n_contprep_oral_sdc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sdc_0 	upper=p95_n_contprep_oral_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_sdc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sdc_1 	upper=p95_n_contprep_oral_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_sdc_16/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sdc_16 	upper=p95_n_contprep_oral_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_vr_sdc_21/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_contprep_vr_sdc_21 		upper=p95_n_contprep_vr_sdc_21  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_inj_sdc_25/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_contprep_inj_sdc_25 	upper=p95_n_contprep_inj_sdc_25  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prep_lq_sdc  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of SDC actively taking PrEP in the last 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 8e4   by 1e4 ) valueattrs=(size=10);
/*label p50_n_prep_sdc_0 = "Status quo (median) ";*/
/*label p50_n_prep_sdc_1 = "Minimal  (median) ";*/
/*label p50_n_prep_sdc_16 = "Minimal5  (median) ";*/
label p50_n_prep_oral_sdc_0 = 	"Status quo (median) ";
label p50_n_prep_oral_sdc_1 = 	"Minimal  (median) ";
label p50_n_prep_oral_sdc_16 = 	"OPrEPSDC  (median) ";
label p50_n_prep_vr_sdc_21 = 	"DPrEPSDC  (median) ";
label p50_n_prep_inj_sdc_25 = 	"IPrEPSDC  (median) ";
label target_curr_prep_sdc = "Target (Currently on PrEP) - last month";
/*series  x=cald y=p50_n_prep_sdc_0/	lineattrs = (color=black thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sdc_0 	upper=p95_n_prep_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_sdc_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sdc_1 	upper=p95_n_prep_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_sdc_16/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sdc_16 	upper=p95_n_prep_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_prep_oral_sdc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_sdc_0 	upper=p95_n_prep_oral_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sdc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_sdc_1 	upper=p95_n_prep_oral_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sdc_16/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_oral_sdc_16 	upper=p95_n_prep_oral_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_sdc_21/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_sdc_21 		upper=p95_n_prep_vr_sdc_21  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_sdc_25/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_prep_inj_sdc_25 	upper=p95_n_prep_inj_sdc_25  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_curr_prep_sdc  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of 15-64 year olds on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.05   by 0.005 ) valueattrs=(size=10);
label p50_prop_1564_onprep_0 = 	"Status quo (median) ";
label p50_prop_1564_onprep_1 = 	"Minimal  (median) ";
label p50_prop_1564_onprep_16 = 	"OPrEPFSW  (median) ";
label p50_prop_1564_onprep_21 = 	"DPrEPFSW  (median) ";
label p50_prop_1564_onprep_25 = 	"IPrEPFSW  (median) ";
series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_16/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_16 	upper=p95_prop_1564_onprep_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_21/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_21 		upper=p95_prop_1564_onprep_21  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_25/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_25 	upper=p95_prop_1564_onprep_25  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;




*PLW PrEP;
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of PLW initiating PrEP for the first time ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1e5   by 1e4 ) valueattrs=(size=10);
label p50_n_init_prep_oral_plw_0 = 	"Status quo (median) ";
label p50_n_init_prep_oral_plw_1 =	"Minimal  (median) ";
label p50_n_init_prep_oral_plw_18 = 	"OPrEPPLW  (median) ";
label p50_n_init_prep_vr_plw_22 = 	"DPrEPPLW  (median) ";
label p50_n_init_prep_inj_plw_27 = 	"IPrEPPLW  (median) ";
label target_prepinit_pbf = "Target (PrEP_New)";
series  x=cald y=p50_n_init_prep_oral_plw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_plw_0 	upper=p95_n_init_prep_oral_plw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_plw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_plw_1 	upper=p95_n_init_prep_oral_plw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_plw_18/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_plw_18 	upper=p95_n_init_prep_oral_plw_18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_vr_plw_22/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_init_prep_vr_plw_22 	upper=p95_n_init_prep_vr_plw_22  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_inj_plw_27/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_init_prep_inj_plw_27 	upper=p95_n_init_prep_inj_plw_27  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prepinit_pbf  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of PLW actively taking PrEP (excluding newly enrolled) during the last quarter";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2e5   by 5e4 ) valueattrs=(size=10);
label p50_n_contprep_oral_plw_0 = 	"Status quo (median) ";
label p50_n_contprep_oral_plw_1 = 	"Minimal  (median) ";
label p50_n_contprep_oral_plw_18 = 	"OPrEPPLW  (median) ";
label p50_n_contprep_vr_plw_22 = 	"DPrEPPLW  (median) ";
label p50_n_contprep_inj_plw_27 = 	"IPrEPPLW  (median) ";
label target_prep_lq_pbf = "Target (PrEP_CT)";
series  x=cald y=p50_n_contprep_oral_plw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_contprep_oral_plw_0 	upper=p95_n_contprep_oral_plw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_plw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_contprep_oral_plw_1 	upper=p95_n_contprep_oral_plw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_plw_18/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_contprep_oral_plw_18 	upper=p95_n_contprep_oral_plw_18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_vr_plw_22/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_contprep_vr_plw_22 		upper=p95_n_contprep_vr_plw_22  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_inj_plw_27/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_contprep_inj_plw_27 	upper=p95_n_contprep_inj_plw_27  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_prep_lq_pbf  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of PLW actively taking PrEP in the last 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2e5   by 5e4 ) valueattrs=(size=10);
/*label p50_n_prep_plw_0 = "Status quo (median) ";*/
/*label p50_n_prep_plw_1 = "Minimal  (median) ";*/
/*label p50_n_prep_plw_18 = "Minimal5  (median) ";*/
label p50_n_prep_oral_plw_0 = 	"Status quo (median) ";
label p50_n_prep_oral_plw_1 = 	"Minimal  (median) ";
label p50_n_prep_oral_plw_18 = 	"OPrEPPLW  (median) ";
label p50_n_prep_vr_plw_22 = 	"DPrEPPLW  (median) ";
label p50_n_prep_inj_plw_27 = 	"IPrEPPLW  (median) ";
label target_curr_prep_pbf = "Target (Currently on PrEP) - last month";
/*series  x=cald y=p50_n_prep_plw_0/	lineattrs = (color=black thickness = 2);*/
/*band    x=cald lower=p5_n_prep_plw_0 	upper=p95_n_prep_plw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_plw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_prep_plw_1 	upper=p95_n_prep_plw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_plw_18/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_prep_plw_18 	upper=p95_n_prep_plw_18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_prep_oral_plw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_plw_0 	upper=p95_n_prep_oral_plw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_plw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_plw_1 	upper=p95_n_prep_oral_plw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_plw_18/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_oral_plw_18 	upper=p95_n_prep_oral_plw_18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_vr_plw_22/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_vr_plw_22 		upper=p95_n_prep_vr_plw_22  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_inj_plw_27/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_prep_inj_plw_27 	upper=p95_n_prep_inj_plw_27  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
scatter x=cald y=target_curr_prep_pbf  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of 15-64 year olds on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.02   by 0.005 ) valueattrs=(size=10);
label p50_prop_1564_onprep_0 = 	"Status quo (median) ";
label p50_prop_1564_onprep_1 = 	"Minimal  (median) ";
label p50_prop_1564_onprep_18 = 	"OPrEPFSW  (median) ";
label p50_prop_1564_onprep_22 = 	"DPrEPFSW  (median) ";
label p50_prop_1564_onprep_27 = 	"IPrEPFSW  (median) ";
series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_18/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_18 	upper=p95_prop_1564_onprep_18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_22/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_22 		upper=p95_prop_1564_onprep_22  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_27/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_27 	upper=p95_prop_1564_onprep_27  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;



* Checking SDC PrEP (option 31 - strictly SDC only);
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of SDC initiating PrEP for the first time ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5e4   by 5e3 ) valueattrs=(size=10);
label p50_n_init_prep_oral_sdc_0 = 	"Status quo (median) ";
label p50_n_init_prep_oral_sdc_1 =	"Minimal  (median) ";
label p50_n_init_prep_oral_sdc_16 = 	"OPrEPSDC  (median) ";
label p50_n_init_prep_oral_sdc_31 = 	"OPrEPSDC - test  (median) ";
label target_prepinit_sdc = "Target (PrEP_New)";
series  x=cald y=p50_n_init_prep_oral_sdc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sdc_0 	upper=p95_n_init_prep_oral_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_init_prep_oral_sdc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sdc_1 	upper=p95_n_init_prep_oral_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_init_prep_oral_sdc_16/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_init_prep_oral_sdc_16 	upper=p95_n_init_prep_oral_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_init_prep_oral_sdc_31/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_init_prep_oral_sdc_31 	upper=p95_n_init_prep_oral_sdc_31  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
scatter x=cald y=target_prepinit_sdc  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of SDC actively taking PrEP (excluding newly enrolled) during the last quarter";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 8e4   by 1e4 ) valueattrs=(size=10);
label p50_n_contprep_oral_sdc_0 = 	"Status quo (median) ";
label p50_n_contprep_oral_sdc_1 = 	"Minimal  (median) ";
label p50_n_contprep_oral_sdc_16 = 	"OPrEPSDC  (median) ";
label p50_n_contprep_oral_sdc_31 = 	"OPrEPSDC - test (median) ";
label target_prep_lq_sdc = "Target (PrEP_CT)";
series  x=cald y=p50_n_contprep_oral_sdc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sdc_0 	upper=p95_n_contprep_oral_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_contprep_oral_sdc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sdc_1 	upper=p95_n_contprep_oral_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_contprep_oral_sdc_16/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_contprep_oral_sdc_16 	upper=p95_n_contprep_oral_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_contprep_oral_sdc_31/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_contprep_oral_sdc_31 	upper=p95_n_contprep_oral_sdc_31  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
scatter x=cald y=target_prep_lq_sdc  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of SDC actively taking PrEP in the last 3 months";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 8e4   by 1e4 ) valueattrs=(size=10);
/*label p50_n_prep_sdc_0 = "Status quo (median) ";*/
/*label p50_n_prep_sdc_1 = "Minimal  (median) ";*/
/*label p50_n_prep_sdc_16 = "Minimal5  (median) ";*/
label p50_n_prep_oral_sdc_0 = 	"Status quo (median) ";
label p50_n_prep_oral_sdc_1 = 	"Minimal  (median) ";
label p50_n_prep_oral_sdc_16 = 	"OPrEPSDC  (median) ";
label p50_n_prep_oral_sdc_31 = 	"OPrEPSDC - test (median) ";
label target_curr_prep_sdc = "Target (Currently on PrEP) - last month";
/*series  x=cald y=p50_n_prep_sdc_0/	lineattrs = (color=black thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sdc_0 	upper=p95_n_prep_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_sdc_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sdc_1 	upper=p95_n_prep_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_sdc_16/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_prep_sdc_16 	upper=p95_n_prep_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_prep_oral_sdc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_oral_sdc_0 	upper=p95_n_prep_oral_sdc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sdc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_oral_sdc_1 	upper=p95_n_prep_oral_sdc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_prep_oral_sdc_16/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_prep_oral_sdc_16 	upper=p95_n_prep_oral_sdc_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_n_prep_oral_sdc_31/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_oral_sdc_31 	upper=p95_n_prep_oral_sdc_31  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
scatter x=cald y=target_curr_prep_sdc  / markerattrs = (color=orange);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of 15-64 year olds on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 0.05   by 0.005 ) valueattrs=(size=10);
label p50_prop_1564_onprep_0 = 	"Status quo (median) ";
label p50_prop_1564_onprep_1 = 	"Minimal  (median) ";
label p50_prop_1564_onprep_16 = 	"OPrEPFSW  (median) ";
label p50_prop_1564_onprep_31 = 	"OPrEPFSW - test (median) ";
series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_1564_onprep_16/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_16 	upper=p95_prop_1564_onprep_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
series  x=cald y=p50_prop_1564_onprep_31/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_31 	upper=p95_prop_1564_onprep_31  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
run;quit;







proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people ever on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000   by 25000 ) valueattrs=(size=10);
label p50_n_prep_ever_0 = "Status quo (median) ";
label p50_n_prep_ever_1 = "Minimal  (median) ";
*label p50_n_prep_ever_15 = "Minimal5  (median) ";
label o_n_prep_ever = "Cumulative Number of People Initiating PrEP";
series  x=cald y=p50_n_prep_ever_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_ever_0 	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_ever_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_ever_1 	upper=p95_n_prep_ever_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_prep_ever_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_prep_ever_15 	upper=p95_n_prep_ever_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_prep_ever  / markerattrs = (color=black);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);
label p50_prop_w_1524_onprep_0 = "Status quo (median) ";
label p50_prop_w_1524_onprep_1 = "Minimal  (median) ";
series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_w_1524_onprep_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prop_w_1524_onprep_15 	upper=p95_prop_w_1524_onprep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP among those with at least 1 newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);
label p50_p_w1524newpge1_onprep_0 = "Status quo (median) ";
label p50_p_w1524newpge1_onprep_1 = "Minimal  (median) ";
series  x=cald y=p50_p_w1524newpge1_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_0 	upper=p95_p_w1524newpge1_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_w1524newpge1_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_1 	upper=p95_p_w1524newpge1_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_w1524newpge1_onprep_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_w1524newpge1_onprep_15 	upper=p95_p_w1524newpge1_onprep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05   by 0.01 ) valueattrs=(size=10);
label p50_prop_1564_onprep_0 = "Status quo (median) ";
label p50_prop_1564_onprep_1 = "Minimal  (median) ";
*label p50_prop_1564_onprep_15 = "Minimal5 (median) ";
series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prop_1564_onprep_15/	lineattrs = (color=Green thickness = 2);
*band    x=cald lower=p5_prop_1564_onprep_15 	upper=p95_prop_1564_onprep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549__0 = "All Status quo (median) ";
label p50_prevalence1549__1 = "All Minimal  (median) ";
*label p50_prevalence1549__15 = "All Minimal5 (median) ";
label o_prev1549_Z_ess = "CAL - ZIMPHIA or DHS";
series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence1549__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prevalence1549__15 	upper=p95_prevalence1549__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA Minimal;
scatter x=cald y=o_prev1549_Z_ess  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=black) errorbarattrs = (color = black) ;
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence Men 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549m_0 = "Status quo (median) ";
label p50_prevalence1549m_1 = "Minimal (median) ";
label p50_prevalence1549m_15 = "Minimal5 (median) ";
label o_prev1549m_Z_ess = "CAL - ZIMPHIA or DHS - men";
series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_15 	upper=p95_prevalence1549m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA Minimal;
scatter x=cald y=o_prev1549m_Z_ess /  yerrorlower=o_prev1549m_ll_Z_ess yerrorupper=o_prev1549m_ul_Z_ess markerattrs = (color=blue) errorbarattrs = (color = blue) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence Women 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549w_0 = "Status quo (median) ";
label p50_prevalence1549w_1 = "Minimal (median) ";
label p50_prevalence1549w_15 = "Minimal5 (median) ";
label o_prev1549w_Z_ess = "CAL - ZIMPHIA or DHS - women";
series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_15 	upper=p95_prevalence1549w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA Minimal;
scatter x=cald y=o_prev1549w_Z_ess /  yerrorlower=o_prev1549w_ll_Z_ess yerrorupper=o_prev1549w_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange) ;
run;quit;
*/



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Status quo (median) ";
label p50_prevalence_hiv_preg_1 = "All Minimal (median) ";
*label p50_prevalence_hiv_preg_15 = "All Minimal5 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";
series  x=cald y=p50_prevalence_hiv_preg_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_hiv_preg_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_1 	upper=p95_prevalence_hiv_preg_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence_hiv_preg_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prevalence_hiv_preg_15 	upper=p95_prevalence_hiv_preg_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_prev1549w_Z_anc  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange);
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence 15-24 - by gender";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence1524m_0 = "Status quo (median) - Males 15-24";
label p50_prevalence1524w_0 = "Status quo (median) - Females 15-24";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence2549m_0 = "Status quo (median) - Males 25-49";
label p50_prevalence2549w_0 = "Status quo (median) - Females 25-49";
label o_prev2549m_Z_DHS = "DHS - Males";
label o_prev2549w_Z_DHS = "DHS - Females";
series  x=cald y=p50_prevalence2549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence2549m_0 	upper=p95_prevalence2549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence2549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence2549w_0 	upper=p95_prevalence2549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
scatter x=cald y=o_prev2549m_Z_DHS /  markerattrs = (color=darkblue);
scatter x=cald y=o_prev2549w_Z_DHS /  markerattrs = (color=darkorange);
run;quit;
*/

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women - by age";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Status quo (median) ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1 = "Minimal  (median) ";
*label p50_incidence1549__15 = "Minimal5  (median) ";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence1549__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__15 	upper=p95_incidence1549__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__16/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_incidence1549__16 	upper=p95_incidence1549__16  / transparency=0.9 fillattrs = (color=LIGHTgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__17/	lineattrs = (color=darkgreen thickness = 2);
band    x=cald lower=p5_incidence1549__17 	upper=p95_incidence1549__17  / transparency=0.9 fillattrs = (color=darkgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__18/	lineattrs = (color=verydarkgreen thickness = 2);
band    x=cald lower=p5_incidence1549__18 	upper=p95_incidence1549__18  / transparency=0.9 fillattrs = (color=verydarkgreen) legendlabel= "Model 90% range";*/
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)Min, SQ and VAGINAL RING PREP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 1) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1 = "Minimal  (median) ";
*label p50_incidence1549__15 = "Minimal5  (median) ";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__19/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__19 	upper=p95_incidence1549__19  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__20/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_incidence1549__20 	upper=p95_incidence1549__20  / transparency=0.9 fillattrs = (color=LIGHTgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__21/	lineattrs = (color=darkgreen thickness = 2);
band    x=cald lower=p5_incidence1549__21 	upper=p95_incidence1549__21  / transparency=0.9 fillattrs = (color=darkgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__22/	lineattrs = (color=verydarkgreen thickness = 2);
band    x=cald lower=p5_incidence1549__22 	upper=p95_incidence1549__22  / transparency=0.9 fillattrs = (color=verydarkgreen) legendlabel= "Model 90% range";
*scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
*scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)Min, SQ and INJECTABLE PREP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 1) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1 = "Minimal  (median) ";
*label p50_incidence1549__15 = "Minimal5  (median) ";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__23/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__23 	upper=p95_incidence1549__23  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__24/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_incidence1549__24 	upper=p95_incidence1549__24  / transparency=0.9 fillattrs = (color=LIGHTgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__25/	lineattrs = (color=darkgreen thickness = 2);
band    x=cald lower=p5_incidence1549__25 	upper=p95_incidence1549__25  / transparency=0.9 fillattrs = (color=darkgreen) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__26/	lineattrs = (color=verydarkgreen thickness = 2);
band    x=cald lower=p5_incidence1549__26 	upper=p95_incidence1549__26  / transparency=0.9 fillattrs = (color=verydarkgreen) legendlabel= "Model 90% range";
*scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
*scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000 by  10000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_new_inf1549__0 = "Status quo (median)";
label p50_n_new_inf1549__1 = "Minimal (median)";
series  x=cald y=p50_n_new_inf1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_new_inf1549__0 	upper=p95_n_new_inf1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_inf1549__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_inf1549__1 	upper=p95_n_new_inf1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections in men by age";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000 by  5000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_new_inf1524m_0 = "Status quo (median) - 15-24 M";
label p50_n_new_inf2549m_0 = "Status quo (median) - 25-49 M";
series  x=cald y=p50_n_new_inf1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_inf1524m_0 	upper=p95_n_new_inf1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_inf2549m_0/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_new_inf2549m_0 	upper=p95_n_new_inf2549m_0  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections in women by age";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 50000 by  5000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_new_inf1524w_0 = "Status quo (median) - 15-24 M";
label p50_n_new_inf2549w_0 = "Status quo (median) - 25-49 M";
series  x=cald y=p50_n_new_inf1524w_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_inf1524w_0 	upper=p95_n_new_inf1524w_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_inf2549w_0/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_new_inf2549w_0 	upper=p95_n_new_inf2549w_0  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-64)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1564__0 = "Status quo (median) ";
label p50_incidence1564__1 = "Minimal  (median) ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1549m_0 = "Status quo (median) - Men";
label p50_incidence1549m_1 = "Minimal  (median) - Men";
label p50_incidence1549w_0 = "Status quo (median) - Women";
label p50_incidence1549w_1 = "Minimal  (median) - Women";
label o_HIVincid_1549m_Zimphia = "ZIMPHIA Men 15-49";
label o_HIVincid_1549w_Zimphia = "ZIMPHIA Women 15-49";
series  x=cald y=p50_incidence1549m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549m_0 	upper=p95_incidence1549m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549m_1 	upper=p95_incidence1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1549w_0 	upper=p95_incidence1549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549w_1 	upper=p95_incidence1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1549m_Zimphia / yerrorlower=o_HIVincid_1549m_ll_Zimphia yerrorupper=o_HIVincid_1549m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_1549w_Zimphia / yerrorlower=o_HIVincid_1549w_ll_Zimphia yerrorupper=o_HIVincid_1549w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;




proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 15-24";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1524m_0 = "Status quo (median) - Men";
label p50_incidence1524m_1 = "Minimal  (median) - Men";
label p50_incidence1524w_0 = "Status quo (median) - Women";
label p50_incidence1524w_1 = "Minimal  (median) - Women";
label o_HIVincid_1524m_Zimphia = "ZIMPHIA Men 15-24";
label o_HIVincid_1524w_Zimphia = "ZIMPHIA Women 15-24";

series  x=cald y=p50_incidence1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1524m_0 	upper=p95_incidence1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1524m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1524m_1 	upper=p95_incidence1524m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1524w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1524w_0 	upper=p95_incidence1524w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1524w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1524w_1 	upper=p95_incidence1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_1524m_Zimphia / yerrorlower=o_HIVincid_1524m_ll_Zimphia yerrorupper=o_HIVincid_1524m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_1524w_Zimphia / yerrorlower=o_HIVincid_1524w_ll_Zimphia yerrorupper=o_HIVincid_1524w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);

run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 2534";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence2534m_0 = "Status quo (median) - Men";
label p50_incidence2534m_1 = "Minimal  (median) - Men";
label p50_incidence2534w_0 = "Status quo (median) - Women";
label p50_incidence2534w_1 = "Minimal  (median) - Women";
label o_HIVincid_2534m_Zimphia = "ZIMPHIA Men 25-34";
label o_HIVincid_2534w_Zimphia = "ZIMPHIA Women 25-34";

series  x=cald y=p50_incidence2534m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence2534m_0 	upper=p95_incidence2534m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2534m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2534m_1 	upper=p95_incidence2534m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence2534w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence2534w_0 	upper=p95_incidence2534w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence2534w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence2534w_1 	upper=p95_incidence2534w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_2534m_Zimphia / yerrorlower=o_HIVincid_2534m_ll_Zimphia yerrorupper=o_HIVincid_2534m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_2534w_Zimphia / yerrorlower=o_HIVincid_2534w_ll_Zimphia yerrorupper=o_HIVincid_2534w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 3544";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence3544m_0 = "Status quo (median) - Men";
label p50_incidence3544m_1 = "Minimal  (median) - Men";
label p50_incidence3544w_0 = "Status quo (median) - Women";
label p50_incidence3544w_1 = "Minimal  (median) - Women";
label o_HIVincid_3549m_Zimphia = "ZIMPHIA Men 35-49";
label o_HIVincid_3549w_Zimphia = "ZIMPHIA Women 35-49";
series  x=cald y=p50_incidence3544m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence3544m_0 	upper=p95_incidence3544m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence3544m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence3544m_1 	upper=p95_incidence3544m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence3544w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence3544w_0 	upper=p95_incidence3544w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence3544w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence3544w_1 	upper=p95_incidence3544w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter x=cald y=o_HIVincid_3549m_Zimphia / yerrorlower=o_HIVincid_3549m_ll_Zimphia yerrorupper=o_HIVincid_3549m_ul_Zimphia markerattrs = (color=blue) errorbarattrs = (color = blue);
scatter x=cald y=o_HIVincid_3549w_Zimphia / yerrorlower=o_HIVincid_3549w_ll_Zimphia yerrorupper=o_HIVincid_3549w_ul_Zimphia markerattrs = (color=orange) errorbarattrs = (color = orange);
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 4554";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence4554m_0 = "Status quo (median) - Men";
label p50_incidence4554m_1 = "Minimal  (median) - Men";
label p50_incidence4554w_0 = "Status quo (median) - Women";
label p50_incidence4554w_1 = "Minimal  (median) - Women";
series  x=cald y=p50_incidence4554m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence4554m_0 	upper=p95_incidence4554m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence4554m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence4554m_1 	upper=p95_incidence4554m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence4554w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence4554w_0 	upper=p95_incidence4554w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence4554w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence4554w_1 	upper=p95_incidence4554w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence age 5564";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence5564m_0 = "Status quo (median) - Men";
label p50_incidence5564m_1 = "Minimal  (median) - Men";
label p50_incidence5564w_0 = "Status quo (median) - Women";
label p50_incidence5564w_1 = "Minimal  (median) - Women";
series  x=cald y=p50_incidence5564m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence5564m_0 	upper=p95_incidence5564m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence5564m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence5564m_1 	upper=p95_incidence5564m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence5564w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence5564w_0 	upper=p95_incidence5564w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence5564w_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence5564w_1 	upper=p95_incidence5564w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_ep_0 = "Status quo (median) ";
label p50_p_inf_ep_1 = "Minimal  (median) ";
series  x=cald y=p50_p_inf_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_ep_0 	upper=p95_p_inf_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_ep_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_ep_1 	upper=p95_p_inf_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_newp_0 = "Status quo (median) ";
label p50_p_inf_newp_1 = "Minimal  (median) ";
series  x=cald y=p50_p_inf_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_newp_0 	upper=p95_p_inf_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_newp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_newp_1 	upper=p95_p_inf_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prop infections coming from people VL suppressed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_vlsupp_0 = "Status quo (median) ";
label p50_p_inf_vlsupp_1 = "Minimal  (median) ";
series  x=cald y=p50_p_inf_vlsupp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_vlsupp_0 	upper=p95_p_inf_vlsupp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_vlsupp_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_vlsupp_1 	upper=p95_p_inf_vlsupp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_primary";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_primary_0 = "Status quo (median) ";
label p50_p_inf_primary_1 = "Minimal  (median) ";
series  x=cald y=p50_p_inf_primary_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_primary_0 	upper=p95_p_inf_primary_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_primary_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_primary_1 	upper=p95_p_inf_primary_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_naive";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_naive_0 = "Status quo (median) ";
label p50_p_inf_naive_1 = "Minimal  (median) ";
series  x=cald y=p50_p_inf_naive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_naive_0 	upper=p95_p_inf_naive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_naive_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_naive_1 	upper=p95_p_inf_naive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_inf_diag";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_inf_diag_0 = "Status quo (median) ";
label p50_p_inf_diag_1 = "Minimal  (median) ";
series  x=cald y=p50_p_inf_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_inf_diag_0 	upper=p95_p_inf_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_inf_diag_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_inf_diag_1 	upper=p95_p_inf_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Of women giving birth with HIV, proportion of children infected";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);
label p50_mtct_prop_0 = "Status quo (median) ";
label p50_mtct_prop_1 = "Minimal  (median) ";
series  x=cald y=p50_mtct_prop_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_mtct_prop_0 	upper=p95_mtct_prop_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_mtct_prop_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_mtct_prop_1 	upper=p95_mtct_prop_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
*/

*Number living with HIV;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number living with HIV by age - Male";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);
label p50_n_hiv1524m_0 = "Status quo (median) - 15-24";
label p50_n_hiv2549m_0 = "Status quo (median) - 25-49";
series  x=cald y=p50_n_hiv1524m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_hiv1524m_0 	upper=p95_n_hiv1524m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_hiv2549m_0/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_hiv2549m_0 	upper=p95_n_hiv2549m_0  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";

run;quit;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number living with HIV by age - Female";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 500000 by 100000) valueattrs=(size=10);
label p50_n_hiv1524w_0 = "Status quo (median) - 15-24";
label p50_n_hiv2549w_0 = "Status quo (median) - 25-49";
series  x=cald y=p50_n_hiv1524w_0/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_hiv1524w_0 	upper=p95_n_hiv1524w_0  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_hiv2549w_0/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_hiv2549w_0 	upper=p95_n_hiv2549w_0  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV+ men who are diagnosed (age 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diag_m_0 = "Status quo (median)";
label p50_p_diag_m_1 = "Minimal  (median)";
*label p50_p_diag_m_15 = "Minimal5  (median)";
label p50_p_diag_m_32 = "increase test_targeting  (median)";
label o_p_diag_m1549_dhs = "DHS - 15-49";
label o_p_diag_1564m_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15pl_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_m_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_diag_m_15 	upper=p95_p_diag_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m_32/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_m_32 	upper=p95_p_diag_m_32  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_m1549_dhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_diag_1564m_zimphia / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_p_diag_15pl_zimphia /  markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV+ women who are diagnosed (age 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diag_w_0 = "Status quo (median) _ 15+";
label p50_p_diag_w_1 = "Minimal  (median) ";
*label p50_p_diag_w_15 = "Minimal5  (median) ";
label p50_p_diag_w_32 = "increase test_targeting  (median)";
label o_p_diag_w1549_dhs = "DHS - 15-49";
label o_p_diag_1564w_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15plw_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_w_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_diag_w_15 	upper=p95_p_diag_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w_32/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_w_32 	upper=p95_p_diag_w_32  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_w1549_dhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_diag_1564w_zimphia / markerattrs = (symbol=square color=red size = 10);
scatter x=cald y=o_p_diag_15plw_zimphia / markerattrs = (symbol=square color=purple size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV+ adults who are diagnosed (age 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diag_0 = "Status quo (median)";
label p50_p_diag_1 = "Minimal  (median)";
*label p50_p_diag_15 = "Minimal5  (median)";
label o_p_diag_1549_dhs = "DHS - 15-49";
label o_p_diag_1564_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15pl_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_0 	upper=p95_p_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_diag_15 	upper=p95_p_diag_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_1549_dhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_diag_1564_zimphia / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_p_diag_15pl_zimphia /  markerattrs = (symbol=square color=black size = 10);
run;quit;


/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of naive art initiators with NNRTI mutation";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.5 by 0.05) valueattrs=(size=10);

label p50_p_ai_no_arv_c_nnm_0 = "Status quo (median) ";
label p50_p_ai_no_arv_c_nnm_1 = "Minimal  (median) ";

series  x=cald y=p50_p_ai_no_arv_c_nnm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ai_no_arv_c_nnm_0 	upper=p95_p_ai_no_arv_c_nnm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_ai_no_arv_c_nnm_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_ai_no_arv_c_nnm_1 	upper=p95_p_ai_no_arv_c_nnm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
*/
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_artexp_diag_0 = "Status quo (median) ";
label p50_p_artexp_diag_1 = "Minimal (median) ";
*label p50_p_artexp_diag_15 = "Minimal5 (median) ";
series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_artexp_diag_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_artexp_diag_15 	upper=p95_p_artexp_diag_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_m_0 = "Status quo  (median)";
label p50_p_onart_diag_m_1 = "Minimal  (median)";
*label p50_p_onart_diag_m_15 = "Minimal5 (median)";
label o_p_onart_1564m_diag_zimphia = "ZIMPHIA - 15-64";
label o_p_onart_15plm_diag_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_diag_m_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_onart_diag_m_15 	upper=p95_p_onart_diag_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564m_diag_zimphia / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_p_onart_15plm_diag_zimphia / markerattrs = (symbol=square color=brown size = 10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_w_0  = "Status quo  (median) ";
label p50_p_onart_diag_w_1  = "Minimal  (median) ";
*label p50_p_onart_diag_w_15 = "Minimal5 (median) ";
label o_p_onart_1564f_diag_zimphia = "ZIMPHIA - 15-64";
label o_p_onart_15plf_diag_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_diag_w_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_onart_diag_w_15 	upper=p95_p_onart_diag_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564f_diag_zimphia / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_onart_15plf_diag_zimphia / markerattrs = (symbol=square color=brown size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of 1st ART initiations";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);
*label p50_n_all_ai_y_0 = "Status quo (median) - all";
*label p50_n_all_ai_y_1 = "Minimal  (median) - all";
label p50_n_art_start_y_0 = "Status quo (median)";
label p50_n_art_start_y_1 = "Minimal  (median)";
*label p50_n_art_start_y_15 = "Minimal5  (median)";
*series  x=cald y=p50_n_all_ai_y_0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_0 	upper=p95_n_all_ai_y_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range - all";
*series  x=cald y=p50_n_all_ai_y_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_1 	upper=p95_n_all_ai_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_art_start_y_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_art_start_y_0 	upper=p95_n_art_start_y_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range - 1st";
series  x=cald y=p50_n_art_start_y_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_art_start_y_1 	upper=p95_n_art_start_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_art_start_y_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_art_start_y_15 	upper=p95_n_art_start_y_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_onart_0 = "Status quo  (median)";
label p50_n_onart_1 = "Minimal  (median)";
*label p50_n_onart_15 = "Minimal5 (median)";
label o_s_all_onart_NAC = "CAL - NAC";
label o_s_onart_adults_garpr = "GARPR";
series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_onart_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_onart_15 	upper=p95_n_onart_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA Minimal;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_s_onart_adults_garpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of pregnant women receiving PMCTCT";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 250000 by 50000) valueattrs=(size=10);
label p50_n_pmtct_0 = "Status quo  (median)";
label p50_n_pmtct_1 = "Minimal  (median)";
*label p50_n_pmtct_15 = "Minimal5 (median)";
label o_s_pregnant_pmtct_Z_GF = "Global fund";
label o_s_pregnant_pmtct_Z_NAC = "NAC";
series  x=cald y=p50_n_pmtct_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pmtct_0 	upper=p95_n_pmtct_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_pmtct_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_pmtct_1 	upper=p95_n_pmtct_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_pmtct_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_pmtct_15 	upper=p95_n_pmtct_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_s_pregnant_pmtct_Z_GF / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_s_pregnant_pmtct_Z_NAC / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000__0 = "Status quo  (median)";
label p50_p_onart_vl1000__1 = "Minimal  (median)";
*label p50_p_onart_vl1000__15 = "Minimal5 (median)";
label o_p_vll1000_6mart_garcpr = "CAL - GARCPR";
series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000__15 	upper=p95_p_onart_vl1000__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_p_vll1000_6mart_garcpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_m_0  = "Status quo (median) ";
label p50_p_onart_vl1000_m_1  = "Minimal  (median) ";
*label p50_p_onart_vl1000_m_15 = "Minimal5  (median) ";
series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000_m_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000_m_15 	upper=p95_p_onart_vl1000_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_w_0 = "Status quo (median) ";
label p50_p_onart_vl1000_w_1 = "Minimal  (median) ";
*label p50_p_onart_vl1000_w_15 = "Minimal5  (median) ";
series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_vl1000_w_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_onart_vl1000_w_15 	upper=p95_p_onart_vl1000_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vl1000__0 = "Status quo (median)";
label p50_p_vl1000__1 = "Minimal  (median)";
*label p50_p_vl1000__15 = "Minimal5 (median)";
label o_p_vlsupp_hiv_15pl_phia = "ZIMPHIA 15+";
label o_p_vlsupp_hiv_1564_phia = "ZIMPHIA 15-64";
label o_p_vlsupp_hiv_1549_phia = "ZIMPHIA 15-49";
series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_vl1000__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_vl1000__15 	upper=p95_p_vl1000__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_vlsupp_hiv_15pl_phia / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_p_vlsupp_hiv_1564_phia / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_p_vlsupp_hiv_1549_phia / markerattrs = (symbol=square color=brown size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vg1000__0 = "Status quo (median)";
label p50_p_vg1000__1 = "Minimal  (median)";
*label p50_p_vg1000__15 = "Minimal5 (median)";
series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_vg1000__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_vg1000__15 	upper=p95_p_vg1000__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all adults with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vg1000_all_0 = "Status quo (median)";
label p50_p_vg1000_all_1 = "Minimal  (median)";
series  x=cald y=p50_p_vg1000_all_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000_all_0 	upper=p95_p_vg1000_all_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vg1000_all_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vg1000_all_1 	upper=p95_p_vg1000_all_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_m_0 = "Status quo (median)";
label p50_p_onart_m_1 = "Minimal  (median)";
*label p50_p_onart_m_15 = "Minimal5  (median)";
series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_m_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_onart_m_15 	upper=p95_p_onart_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_w_0 = "Status quo (median)";
label p50_p_onart_w_1 = "Minimal  (median)";
*label p50_p_onart_w_15 = "Minimal5 (median)";
series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_onart_w_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_onart_w_15 	upper=p95_p_onart_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_prevalence_vg1000__0 = "Status quo (median) ";
label p50_prevalence_vg1000__1 = "Minimal  (median) ";
*label p50_prevalence_vg1000__15 = "Minimal5  (median) ";
series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_prevalence_vg1000__15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prevalence_vg1000__15 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Rate of death ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate (per 100 person-years)'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_allage_0 = "Status quo (median) - 15+ both";
label p50_rate_dead_allage_1 = "Minimal  (median) ";
label p50_rate_dead_allage_m_0 = "Status quo (median) - 15+ Men";
label p50_rate_dead_allage_w_0 = "Status quo (median) - 15+ Women";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_death_2059_w_0 = "Status quo (median) - Women 20-59";
label p50_n_death_hiv_w_0 = "Status quo  (median) - women with HIV";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_death_2059_m_0 = "Status quo (median) - Men 20-59";
label p50_n_death_HIV_m_0 = "Minimal  (median) - Men with HIV";
series  x=cald y=p50_n_death_2059_m_0/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_death_2059_m_0 	upper=p95_n_death_2059_m_0  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_death_2059_m_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_death_2059_m_1 	upper=p95_n_death_2059_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_death_hiv_m_0/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_death_hiv_m_0 	upper=p95_n_death_hiv_m_0  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
* series  x=cald y=n_death_2059_m_obs_sa;
run;quit;
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of CD4 measurements";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_cm_0 = "Status quo  (median)";
label p50_n_cm_1 = "Minimal  (median)";
*label p50_n_cm_15 = "Minimal5 (median)";
label o_s_all_onart_NAC = "Number on ART - NAC";
series  x=cald y=p50_n_cm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cm_0 	upper=p95_n_cm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_cm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_cm_1 	upper=p95_n_cm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_cm_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_cm_15 	upper=p95_n_cm_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA Minimal;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of VL measurements";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_vm_0 = "Status quo  (median)";
label p50_n_vm_1 = "Minimal  (median)";
*label p50_n_vm_15 = "Minimal5 (median)";
label o_s_all_onart_NAC = "Number on ART - NAC";
series  x=cald y=p50_n_vm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_vm_0 	upper=p95_n_vm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_vm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_vm_1 	upper=p95_n_vm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_vm_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_vm_15 	upper=p95_n_vm_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA Minimal;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d_a; 
Title    height=1.5 justify=center "Proportion with high adherence";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_adh_hi_0 = "Status quo  (median)";
label p50_p_adh_hi_1 = "Minimal  (median)";
series  x=cald y=p50_p_adh_hi_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_adh_hi_0 	upper=p95_p_adh_hi_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_adh_hi_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_adh_hi_1 	upper=p95_p_adh_hi_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d_a; 
Title    height=1.5 justify=center "Proportion with low adherence";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_adh_lo_0 = "Status quo  (median)";
label p50_p_adh_lo_1 = "Minimal  (median)";
series  x=cald y=p50_p_adh_lo_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_adh_lo_0 	upper=p95_p_adh_lo_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_adh_lo_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_adh_lo_1 	upper=p95_p_adh_lo_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART with VL measurement in the last year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vm_ly_onart_0 = "Status quo  (median)";
label p50_p_vm_ly_onart_1 = "Minimal  (median)";
label p50_p_vm_ly_onart_15 = "Minimal5 (median)";
label o_p_vlmeasuredly_onart = "MoH";
series  x=cald y=p50_p_vm_ly_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vm_ly_onart_0 	upper=p95_p_vm_ly_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vm_ly_onart_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vm_ly_onart_1 	upper=p95_p_vm_ly_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vm_ly_onart_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vm_ly_onart_15 	upper=p95_p_vm_ly_onart_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_vlmeasuredly_onart / markerattrs = (symbol=square color=black size = 10);
run;quit;
*/

proc sgplot data=d; 
Title    height=1.5 justify=center "n_pcp_p";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2500000 by 250000) valueattrs=(size=10);
label p50_n_pcp_p_0 = "Status quo  (median)";
label p50_n_pcp_p_1 = "Minimal  (median)";
*label p50_n_pcp_p_15 = "Minimal5 (median)";
label o_s_all_onart_NAC = "on ART - NAC";
series  x=cald y=p50_n_pcp_p_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pcp_p_0 	upper=p95_n_pcp_p_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_pcp_p_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_pcp_p_1 	upper=p95_n_pcp_p_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_pcp_p_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_pcp_p_15 	upper=p95_n_pcp_p_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;
ods rtf close;run;







ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Users\Valentina\UCL Dropbox\Valentina Cambiano\MIHPSA Zimbabwe\Synthesis Findings\V21_20240523_from2023_CheckSBCC&CMMC_100sim.doc' startpage=never; 
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "n_sbcc_visit_1524m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  300000 by 50000) valueattrs=(size=10);
label p50_n_sbcc_visit_1524m_0  = "Status quo (median)";
label p50_n_sbcc_visit_1524m_1  = "Minimal (median)";
label p50_n_sbcc_visit_1524m_11 = "Minimal+SBCC (median)";
label o_n_reached_sbcc_1024m = "Observed Brotha2brotha 10-24 - NAC";
series  x=cald y=p50_n_sbcc_visit_1524m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524m_0 	upper=p95_n_sbcc_visit_1524m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sbcc_visit_1524m_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524m_1 	upper=p95_n_sbcc_visit_1524m_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sbcc_visit_1524m_11/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524m_11 	upper=p95_n_sbcc_visit_1524m_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_n_reached_sbcc_1024m/	markerattrs = (color=red) ;

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_sbcc_visit_1524w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  600000 by 50000) valueattrs=(size=10);
label p50_n_sbcc_visit_1524w_0  = "Status quo (median)";
label p50_n_sbcc_visit_1524w_1  = "Minimal (median)";
label p50_n_sbcc_visit_1524w_11 = "Minimal+SBCC (median)";
label o_n_reached_sbcc_1024w = "Observed Sista2sista&DREAMS 10-24 - NAC";
series  x=cald y=p50_n_sbcc_visit_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524w_0 	upper=p95_n_sbcc_visit_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sbcc_visit_1524w_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524w_1 	upper=p95_n_sbcc_visit_1524w_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sbcc_visit_1524w_11/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524w_11 	upper=p95_n_sbcc_visit_1524w_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_n_reached_sbcc_1024w/	markerattrs = (color=red ) ;
run;quit;
*/

proc sgplot data=d; 
Title    height=1.5 justify=center "n_sbcc_visit_1524_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1000000 by 50000) valueattrs=(size=10);
label p50_n_sbcc_visit_1524__0  = "Status quo (median)";
label p50_n_sbcc_visit_1524__1  = "Minimal (median)";
label p50_n_sbcc_visit_1524__11 = "Minimal+SBCC (median)";
label o_n_reached_sbcc_1024 = "Observed Sista2sistaDREAMS 10-24 - NAC";
label target_n_reached_sbcc_1524 = "Target 15-24 ME plan";
series  x=cald y=p50_n_sbcc_visit_1524__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524__0 	upper=p95_n_sbcc_visit_1524__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sbcc_visit_1524__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_1524__1 	upper=p95_n_sbcc_visit_1524__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_sbcc_visit_1524__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_sbcc_visit_1524__11 	upper=p95_n_sbcc_visit_1524__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_n_reached_sbcc_1024/	markerattrs = (color=red ) ;
scatter  x=cald y=target_n_reached_sbcc_1524/	markerattrs = (color=darkred );
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_sbcc_visit_2564_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  600000 by 50000) valueattrs=(size=10);
label p50_n_sbcc_visit_2564__0  = "Status quo (median)";
label p50_n_sbcc_visit_2564__1  = "Minimal (median)";
label p50_n_sbcc_visit_2564__11 = "Minimal+SBCC (median)";
label o_n_reached_sbcc_2564 = "Observed Peer Led - NAC";
label target_n_reached_sbcc_2564 = "Target 15-24 M&e plan";
series  x=cald y=p50_n_sbcc_visit_2564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_2564__0 	upper=p95_n_sbcc_visit_2564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sbcc_visit_2564__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_sbcc_visit_2564__1 	upper=p95_n_sbcc_visit_2564__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_sbcc_visit_2564__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_sbcc_visit_2564__11 	upper=p95_n_sbcc_visit_2564__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_n_reached_sbcc_2564/	markerattrs = (color=red) ;
scatter  x=cald y=target_n_reached_sbcc_2564/	markerattrs = (color=darkred) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_sbcc_1524m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_tested_sbcc_1524m_0  = "Status quo (median)";
label p50_n_tested_sbcc_1524m_1  = "Minimal (median)";
label p50_n_tested_sbcc_1524m_11 = "Minimal+SBCC (median)";
label o_n_tested_sbcc_1024m = "Observed Brotha2brotha 10-24 - NAC";
series  x=cald y=p50_n_tested_sbcc_1524m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sbcc_1524m_0 	upper=p95_n_tested_sbcc_1524m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sbcc_1524m_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_sbcc_1524m_1 	upper=p95_n_tested_sbcc_1524m_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_sbcc_1524m_11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_sbcc_1524m_11 	upper=p95_n_tested_sbcc_1524m_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_n_tested_sbcc_1024m/	markerattrs = (color=red ) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_sbcc_1524w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1500000 by 50000) valueattrs=(size=10);
label p50_n_tested_sbcc_1524w_0  = "Status quo (median)";
label p50_n_tested_sbcc_1524w_1  = "Minimal (median)";
label p50_n_tested_sbcc_1524w_11 = "Minimal+SBCC (median)";
label o_n_tested_sbcc_1024w = "Observed - Sista2sista&DREAMS 10-24 - NAC";
series  x=cald y=p50_n_tested_sbcc_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sbcc_1524w_0 	upper=p95_n_tested_sbcc_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sbcc_1524w_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_sbcc_1524w_1 	upper=p95_n_tested_sbcc_1524w_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_sbcc_1524w_11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_sbcc_1524w_11 	upper=p95_n_tested_sbcc_1524w_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_n_tested_sbcc_1024w/	markerattrs = (color=red ) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_sbcc_2564_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1200000 by 100000) valueattrs=(size=10);
label p50_n_tested_sbcc_2564__0  = "Status quo (median)";
label p50_n_tested_sbcc_2564__1  = "Minimal (median)";
label p50_n_tested_sbcc_2564__11 = "Minimal+SBCC (median)";
label o_n_reached_sbcc_2564 = "Observed Peer Led - NAC";
series  x=cald y=p50_n_tested_sbcc_2564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sbcc_2564__0 	upper=p95_n_tested_sbcc_2564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sbcc_2564__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_sbcc_2564__1 	upper=p95_n_tested_sbcc_2564__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_tested_sbcc_2564__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_tested_sbcc_2564__11 	upper=p95_n_tested_sbcc_2564__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_n_tested_sbcc_2564/	markerattrs = (color=red ) ;
run;quit;
/*
	p_tested_sbcc_1024m=0.13;
	*The following includes SISTA2SISTA and DREAMS;
	p_tested_sbcc_1024w=0.28;
	p_tested_sbcc_2564=0.15;
*/

*Minimal not printed for the following as denominator is zero;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_sbcc_1524m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1 by 0.1) valueattrs=(size=10);
label p50_p_tested_sbcc_1524m_0  = "Status quo (median)";
label p50_p_tested_sbcc_1524m_11 = "Minimal+SBCC (median)";
label o_p_tested_sbcc_1024m = "Observed Brotha2brotha 10-24 - NAC";
series  x=cald y=p50_p_tested_sbcc_1524m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_sbcc_1524m_0 	upper=p95_p_tested_sbcc_1524m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_sbcc_1524m_11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_tested_sbcc_1524m_11 	upper=p95_p_tested_sbcc_1524m_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_tested_sbcc_1024m/	markerattrs = (color=red ) ;
run;quit;

*Minimal not printed for the following as denominator is zero;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_sbcc_1524w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1 by 0.1) valueattrs=(size=10);
label p50_p_tested_sbcc_1524w_0  = "Status quo (median)";
label p50_p_tested_sbcc_1524w_11 = "Minimal+SBCC (median)";
label o_p_tested_sbcc_1024w = "Observed - Sista2sista&DREAMS 10-24 - NAC";
series  x=cald y=p50_p_tested_sbcc_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_sbcc_1524w_0 	upper=p95_p_tested_sbcc_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_sbcc_1524w_11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_tested_sbcc_1524w_11 	upper=p95_p_tested_sbcc_1524w_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_tested_sbcc_1024w/	markerattrs = (color=red ) ;
run;quit;

*Minimal not printed for the following as denominator is zero;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_sbcc_2564_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_tested_sbcc_2564__0  = "Status quo (median)";
label p50_p_tested_sbcc_2564__11 = "Minimal+SBCC (median)";
label o_n_reached_sbcc_2564 = "Observed Peer Led - NAC";
series  x=cald y=p50_p_tested_sbcc_2564__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_sbcc_2564__0 	upper=p95_p_tested_sbcc_2564__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_tested_sbcc_2564__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_tested_sbcc_2564__11 	upper=p95_p_tested_sbcc_2564__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_tested_sbcc_2564/	markerattrs = (color=red ) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "of men with hiv 15-24, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diag_m1524__0 = "Status quo (median)";
label p50_p_diag_m1524__1  = "Minimal (median)";
label p50_p_diag_m1524__11 = "Minimal+SBCC (median)";
series  x=cald y=p50_p_diag_m1524__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m1524__0 	upper=p95_p_diag_m1524__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m1524__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_m1524__1 	upper=p95_p_diag_m1524__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_m1524__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_diag_m1524__11 	upper=p95_p_diag_m1524__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "of women with hiv 15-24, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diag_w1524__0 = "Status quo (median)";
label p50_p_diag_w1524__1  = "Minimal (median)";
label p50_p_diag_w1524__11 = "Minimal+SBCC (median)";
series  x=cald y=p50_p_diag_w1524__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w1524__0 	upper=p95_p_diag_w1524__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w1524__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_diag_w1524__1 	upper=p95_p_diag_w1524__1  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_diag_w1524__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_diag_w1524__11 	upper=p95_p_diag_w1524__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.125 by 0.025) valueattrs=(size=10);
label p50_p_newp_ge1__0  = "Status quo (median) - 15+";
label p50_p_newp_ge1__1  = "Minimal (median) - 15+";
label p50_p_newp_ge1__11 = "Minimal+SBCC (median) - 15+";
label p50_p_newp_ge1__12 = "Minimal+CMMC (median) - 15+";
series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge1__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_newp_ge1__11 	upper=p95_p_newp_ge1__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__12/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge1__12 	upper=p95_p_newp_ge1__12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;
proc means data=d;var p50_p_newp_ge1__1 p50_p_newp_ge1__11 p50_p_newp_ge1__12;run;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.02 by 0.0025) valueattrs=(size=10);
label p50_p_newp_ge5__0  = "Status quo (median) - 15+";
label p50_p_newp_ge5__1  = "Minimal (median) - 15+";
label p50_p_newp_ge5__11 = "Minimal+SBCC (median) - 15+";
label p50_p_newp_ge5__12 = "Minimal+CMMC (median) - 15+";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_newp_ge5__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_p_newp_ge5__11 	upper=p95_p_newp_ge5__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__12/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge5__12 	upper=p95_p_newp_ge5__12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.7 by 0.1) valueattrs=(size=10);
label p50_p_ep_0  = "Status quo (median) - 15+";
label p50_p_ep_1  = "Minimal (median) - 15+";
label p50_p_ep_11  = "Minimal+SBCC (median) - 15+";
label p50_p_ep_12  = "Minimal+CMMC (median) - 15+";
series  x=cald y=p50_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_ep_11/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_ep_11 	upper=p95_p_ep_11  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_12/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_ep_12 	upper=p95_p_ep_12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;
proc means data=d;var p50_p_ep_1 p50_p_ep_12;run;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  8e6 by 1e6) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_0  = "Status quo (median) - 15+";
label p50_n_tested_1  = "Minimal (median) - 15+";
/*label p50_n_tested_11 = "Minimal+SBCC (median) - 15+";*/
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
label o_s_tested_1549_py_garcpr = "GARCPR - Number tested 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_11/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_11 upper=p95_n_tested_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
scatter  x=cald y=o_s_tested_1549_py_garcpr/	markerattrs = (color=blue ) ;
run;quit;

/*

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  4000000 by 500000) valueattrs=(size=10);*2500000 if stopping in 2023;
label p50_n_tested_w_0  = "Status quo (median) - 15+";
label p50_n_tested_w_1  = "Minimal (median) - 15+";
label p50_n_tested_w_11 = "Minimal+SBCC (median) - 15+";
series  x=cald y=p50_n_tested_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_0 	upper=p95_n_tested_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_w_1 	upper=p95_n_tested_w_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_11/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_11 	upper=p95_n_tested_w_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000000 by 250000) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_m_0  = "Status quo (median) - 15+";
label p50_n_tested_m_1  = "Minimal (median) - 15+";
label p50_n_tested_m_11  = "Minimal+SBCC (median) - 15+";
series  x=cald y=p50_n_tested_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_0 	upper=p95_n_tested_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_tested_m_1 	upper=p95_n_tested_m_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_11/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_11 	upper=p95_n_tested_m_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0  = "Status quo (median) - 15+";
label p50_p_tested_past_year_1549w_1  = "Minimal (median) - 15+";
label p50_p_tested_past_year_1549w_11 = "Minimal+SBCC (median) - 15+";
label o_p_testedly_1549w_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549w_11/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_11 	upper=p95_p_tested_past_year_1549w_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_testedly_1549w_zdhs/	markerattrs = (color=black) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Positivity rate - Tested SBCC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.005) valueattrs=(size=10);
label p50_p_pos_tested_sbcc_0  = "Status quo (median)";
label p50_p_pos_tested_sbcc_1  = "Minimal (median)";
label p50_p_pos_tested_sbcc_11 = "Minimal+SBCC (median)";
series  x=cald y=p50_p_pos_tested_sbcc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_pos_tested_sbcc_0 	upper=p95_p_pos_tested_sbcc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_pos_tested_sbcc_1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_pos_tested_sbcc_1 	upper=p95_p_pos_tested_sbcc_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_p_pos_tested_sbcc_11/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_pos_tested_sbcc_11 	upper=p95_p_pos_tested_sbcc_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;
*/
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.5) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Minimal (median)";
label p50_incidence1549__11 = "Minimal+SBCC (median)";
label p50_incidence1549__12 = "Minimal+CMMC (median)";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549__11 	upper=p95_incidence1549__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__12/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__12 	upper=p95_incidence1549__12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49) - ZOOM";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Minimal (median)";
label p50_incidence1549__11 = "Minimal+SBCC (median)";
label p50_incidence1549__12 = "Minimal+CMMC (median)";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549__11 	upper=p95_incidence1549__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__12/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__12 	upper=p95_incidence1549__12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5e5 by  1e5) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_new_inf1549__0 = "Status quo (median)";
label p50_n_new_inf1549__1 = "Minimal (median)";
/*label p50_n_new_inf1549__11 = "Minimal+SBCC (median)";*/
/*label p50_n_new_inf1549__12 = "Minimal+CMMC (median)";*/
series  x=cald y=p50_n_new_inf1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_new_inf1549__0 	upper=p95_n_new_inf1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_inf1549__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_inf1549__1 	upper=p95_n_new_inf1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
*series  x=cald y=p50_n_new_inf1549__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_new_inf1549__11 	upper=p95_n_new_inf1549__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_new_inf1549__12/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_new_inf1549__12 	upper=p95_n_new_inf1549__12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
run;quit;


ods rtf close;run;


*Output about cotrimaxazole (s_pcp_p_adc s_pcp_p_crypm s_pcp_p_dead s_pcp_p_sbi s_pcp_p_tb s_pcp_p_who3 );
*Output about VL measured (vl_cost_inc reset to 0);







*Trying to understand which intervention removal is driving the HIV incidence to go up;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49) - ZOOM";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__10 = "Min + FSW program";
label p50_incidence1549__11 = "Min+SBCC (median)";
label p50_incidence1549__12 = "Min+CMMC (median)";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__10/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_incidence1549__10 	upper=p95_incidence1549__10  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*series  x=cald y=p50_incidence1549__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_incidence1549__11 	upper=p95_incidence1549__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__12/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__12 	upper=p95_incidence1549__12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49) - SQ, MIN & MIN + Oral PreP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 0.8 by 0.2) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__15 = "Min+OralPREP AGYW";
label p50_incidence1549__16 = "Min+OralPREP FSW";
label p50_incidence1549__17 = "Min+OralPREP SDC";
label p50_incidence1549__18 = "Min+OralPREP PLW";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=blue thickness = 2);
*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__15/	lineattrs = (color=violet thickness = 2);
*band    x=cald lower=p5_incidence1549__15 	upper=p95_incidence1549__15  / transparency=0.9 fillattrs = (color=viole) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__16/	lineattrs = (color=darkviolet thickness = 2 );
*band    x=cald lower=p5_incidence1549__16 	upper=p95_incidence1549__16  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__17/	lineattrs = (color=brown thickness = 2);
*band    x=cald lower=p5_incidence1549__17 	upper=p95_incidence1549__17  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__18/	lineattrs = (color=darkbrown thickness = 2);
*band    x=cald lower=p5_incidence1549__17 	upper=p95_incidence1549__18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49) - SQ, MIN & MIN + Dapivirine ring PreP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 0.8 by 0.2) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__19 = "Min+RingPREP AGYW";
label p50_incidence1549__20 = "Min+RingPREP FSW";
label p50_incidence1549__21 = "Min+RingPREP SDC";
label p50_incidence1549__22 = "Min+RingPREP PLW";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=blue thickness = 2);
*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__19/	lineattrs = (color=violet thickness = 2);
*band    x=cald lower=p5_incidence1549__15 	upper=p95_incidence1549__15  / transparency=0.9 fillattrs = (color=viole) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__20/	lineattrs = (color=darkviolet thickness = 2 );
*band    x=cald lower=p5_incidence1549__16 	upper=p95_incidence1549__16  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__21/	lineattrs = (color=brown thickness = 2);
*band    x=cald lower=p5_incidence1549__17 	upper=p95_incidence1549__17  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__22/	lineattrs = (color=darkbrown thickness = 2);
*band    x=cald lower=p5_incidence1549__17 	upper=p95_incidence1549__18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;
quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49) - SQ, MIN & MIN + Injectable PreP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 0.8 by 0.2) valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__23 = "Min+InjPREP AGYW";
label p50_incidence1549__24 = "Min+InjPREP FSW";
label p50_incidence1549__25 = "Min+InjPREP SDC";
label p50_incidence1549__26 = "Min+InjPREP PLW";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=blue thickness = 2);
*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__23/	lineattrs = (color=violet thickness = 2);
*band    x=cald lower=p5_incidence1549__15 	upper=p95_incidence1549__15  / transparency=0.9 fillattrs = (color=viole) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__24/	lineattrs = (color=darkviolet thickness = 2 );
*band    x=cald lower=p5_incidence1549__16 	upper=p95_incidence1549__16  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__25/	lineattrs = (color=brown thickness = 2);
*band    x=cald lower=p5_incidence1549__17 	upper=p95_incidence1549__17  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__26/	lineattrs = (color=darkbrown thickness = 2);
*band    x=cald lower=p5_incidence1549__17 	upper=p95_incidence1549__18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;
quit;






*The following code is to export data in format for MIHPSA Zimbabwe;


/***********************************************************************************************/
/************************              STOCK                        ****************************/
/***********************************************************************************************/
*VCFeb2023;
*Output to be exported to fill in the file "Output template MIHPSAZimP2";

data d;set a.d_all;run;
proc contents data=d;run;
proc freq data=d; table option;run;
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
2060.5 2061.5 2062.5 2063.5 2064.5 2065.5 2066.5 2067.5 2068.5 2069.5
2070.5 2071.5 2072.5 );
rename p50_prevalence1549m_&o = HIVprev_M1549_M;
rename p5_prevalence1549m_&o  = HIVprev_M1549_95LL;
rename p95_prevalence1549m_&o = HIVprev_M1549_95UL;
rename p50_prevalence1549w_&o = HIVprev_F1549_M;
rename p5_prevalence1549w_&o  = HIVprev_F1549_95LL;
rename p95_prevalence1549w_&o = HIVprev_F1549_95UL;
rename p50_prevalence1549__&o  = HIVprev_A1549_M;
rename p5_prevalence1549__&o   = HIVprev_A1549_95LL;
rename p95_prevalence1549__&o  = HIVprev_A1549_95UL;

rename p50_prevalence1549preg_&o = HIVprev_pregF1549_M;
rename p5_prevalence1549preg_&o  = HIVprev_pregF1549_95LL;
rename p95_prevalence1549preg_&o = HIVprev_pregF1549_95UL;
rename p50_prevalence1524w_&o = HIVprev_F1524_M;
rename p5_prevalence1524w_&o  = HIVprev_F1524_95LL;
rename p95_prevalence1524w_&o = HIVprev_F1524_95UL;
rename p50_prevalence_sw_&o = HIVprev_FSW1599_M;
rename p5_prevalence_sw_&o  = HIVprev_FSW1599_95LL;
rename p95_prevalence_sw_&o = HIVprev_FSW1599_95UL;

rename p50_n_alive_m_&o = NAlive_M1599_M;
rename p5_n_alive_m_&o  = NAlive_M1599_95LL;
rename p95_n_alive_m_&o = NAlive_M1599_95UL;
rename p50_n_alive_w_&o = NAlive_F1599_M;
rename p5_n_alive_w_&o  = NAlive_F1599_95LL;
rename p95_n_alive_w_&o = NAlive_F1599_95UL;
rename p50_n_alive_1524m_&o = NAlive_M1524_M;
rename p50_n_alive_1524w_&o = NAlive_F1524_M;
rename p50_n_alive_2549m_&o = NAlive_M2549_M;
rename p50_n_alive_2549w_&o = NAlive_F2549_M;
rename p50_n_sw_1564__&o = NAlive_FSW1599_M;
rename p5_n_sw_1564__&o  = NAlive_FSW1599_95LL;
rename p95_n_sw_1564__&o = NAlive_FSW1599_95UL;
rename p50_n_hivneg_sdpartner_&o = Nalive_NEGInSDA1599_M;*Number of HIV-negative  adults 15+ years old in a sero-discordant relationship;
rename p50_n_hivneg_sdpartneroffart_&o = Nalive_NEGInSDNotOnARTA1599_M;*Number of HIV-negative  adults 15+ years old in a sero-discordant relationship, whom partner is not on ART;
rename p50_n_hivnegw_sdpartner_&o = Nalive_NEGInSDF1599_M;
rename p50_n_hivnegw_sdpartneroffart_&o = Nalive_NEGInSDNotOnARTF1599_M;

rename p50_n_hivge15m_&o = NHIV_M1599_M;
rename p5_n_hivge15m_&o  = NHIV_M1599_95LL;
rename p95_n_hivge15m_&o = NHIV_M1599_95UL;
rename p50_n_hivge15w_&o = NHIV_F1599_M;
rename p5_n_hivge15w_&o  = NHIV_F1599_95LL;
rename p95_n_hivge15w_&o = NHIV_F1599_95UL;
rename p50_n_hiv1524m_&o = NHIV_M1524_M;
rename p50_n_hiv1524w_&o = NHIV_F1524_M;
rename p50_n_hiv2549m_&o = NHIV_M2549_M;
rename p50_n_hiv2549w_&o = NHIV_F2549_M;
rename p50_n_hiv_sw_&o = NHIV_FSW1599_M;
rename p5_n_hiv_sw_&o  = NHIV_FSW1599_LL;
rename p95_n_hiv_sw_&o = NHIV_FSW1599_UL;

rename p50_n_not_on_art_cd4ge500__&o = NHIV_A1599_NoART_CD4500pl_M;
rename p50_n_not_on_art_cd4350500__&o = NHIV_A1599_NoART_CD4350499_M;
rename p50_n_not_on_art_cd4200350__&o = NHIV_A1599_NoART_CD4200349_M;
rename p50_n_not_on_art_cd450200__&o = NHIV_A1599_NoART_CD450199_M;
rename p50_n_not_on_art_cd4050__&o = NHIV_A1599_NoART_CD4050_M;
   
rename p50_n_asympt_Undiag_&o = NHIV_A1599_Asympt_Undiag_M;
rename p50_n_asympt_diagoffart_&o = NHIV_A1599_Asympt_Diag_NoART_M;
rename p50_n_asympt_diagonart_&o = NHIV_A1599_Asympt_Diag_ART_M;
rename p50_n_sympt_notaids_&o = NHIV_A1599_Sympt_NOAIDS_M;
rename p50_n_sympt_aids_&o = NHIV_A1599_Sympt_AIDS_M;

rename p50_p_diag_&o = P_DIAG_A1599_M;
rename p5_p_diag_&o  = P_DIAG_A1599_95LL;
rename p95_p_diag_&o = P_DIAG_A1599_95UL;
rename p50_p_diag_m_&o = P_DIAG_M1599_M;
rename p5_p_diag_m_&o  = P_DIAG_M1599_95LL;
rename p95_p_diag_m_&o = P_DIAG_M1599_95UL;
rename p50_p_diag_w_&o = P_DIAG_F1599_M;
rename p5_p_diag_w_&o  = P_DIAG_F1599_95LL;
rename p95_p_diag_w_&o = P_DIAG_F1599_95UL;
rename p50_p_diag_m1524__&o = P_DIAG_M1524_M;
rename p50_p_diag_w1524__&o = P_DIAG_F1524_M;
rename p50_p_diag_sw_&o = P_DIAG_FSW1599_M;

*Some variables about sexual behaviour cannot be produce by the Synthesis model;
rename p50_p_m_npge1__&o = P_CLS3m_M1599_M;
rename p50_p_w_npge1__&o = P_CLS3m_F1599_M;
rename p50_p_w1524_npge1__&o = P_CLS3m_F1524_M;
rename p50_p_sw_npge1__&o = P_CLS3m_FSW_M;

rename p50_prev_sti_sw_&o = P_STI_FSW1599_M;

rename n_w1524_newp_ge1_ = NAlive_ElevRiskF1524_M;
rename p_w1524newpge1_onprep = P_TDFPrEP_ElevRiskF1524_M;
*VARIABLES TO BE ADDED HERE ONCE WE HAVE CREATED THEM IN CREATE_WIDE_FILE;
/*NAlive_FPregBirthBF1599_M*/
/*P_TDFPrEP_FPregBirthBF1599_M*/
/*P_DPVPrEP_ElevRiskF1524_M*/
/*P_DPVPrEP_FPregBirthBF1599_M*/
/*P_CABPrEP_ElevRiskF1524_M*/
/*P_CABPrEP_FPregBirthBF1599_M*/

rename p50_p_mcirc_1549m_&o = CIRC_PREV_M1549_M;
rename p5_p_mcirc_1549m_&o  = CIRC_PREV_M1549_95LL;
rename p95_p_mcirc_1549m_&o = CIRC_PREV_M1549_95UL;

rename p50_n_onart_m_&o = NOnART_M1599_M;
rename p5_n_onart_m_&o  = NOnART_M1599_95LL;
rename p95_n_onart_m_&o = NOnART_M1599_95UL;
rename p50_n_onart_w_&o = NOnART_F1599_M;
rename p5_n_onart_w_&o  = NOnART_F1599_95LL;
rename p95_n_onart_w_&o = NOnART_F1599_95UL;
rename p50_n_onart_1524__&o = NOnART_A1524_M;
rename p5_n_onart_1524__&o  = NOnART_A1524_95LL;
rename p95_n_onart_1524__&o = NOnART_A1524_95UL;
rename p50_n_onart_&o = NOnART_A1599_M;
rename p5_n_onart_&o  = NOnART_A1599_95LL;
rename p95_n_onart_&o = NOnART_A1599_95UL;

rename p50_p_onart_diag_m_&o = P_onART_DiagM1599_M;
rename p5_p_onart_diag_m_&o  = P_onART_DiagM1599_95LL;
rename p95_p_onart_diag_m_&o = P_onART_DiagM1599_95UL;
rename p50_p_onart_diag_w_&o = P_onART_DiagF1599_M;
rename p5_p_onart_diag_w_&o  = P_onART_DiagF1599_95LL;
rename p95_p_onart_diag_w_&o = P_onART_DiagF1599_95UL;
rename p50_p_onart_diag_w1524__&o = P_onART_DiagF1524_M;
rename p50_p_onart_diag_1524__&o = P_onART_DiagA1524_M;
rename p5_p_onart_diag_1524__&o  = P_onART_DiagA1524_95LL;
rename p95_p_onart_diag_1524__&o = P_onART_DiagA1524_95UL;
rename p50_p_onart_diag_&o = P_onART_DiagA1599_M;
rename p5_p_onart_diag_&o = P_onART_DiagA1599_95LL;
rename p95_p_onart_diag_&o = P_onART_DiagA1599_95UL;
rename p50_p_onart_diag_sw_&o = P_onART_DiagFSW1599_M;

*% of individuals 15+ years old diagnosed 12 months ago with AHD on ART;
*rename p50__&o = P_onART_Diag12mAHDA1599_M;
*% of individuals 15+ years old diagnosed 12 months ago without AHD on ART;
*rename _&o = P_onART_Diag12mNOAHDA1599_M;
*% of individuals 15-24 years old diagnosed 12 months ago with AHD on ART;
*rename _&o = P_onART_Diag12mAHDA1524_M;
*% of individuals 15-24 years old diagnosed 12 months ago without AHD on ART;
*rename _&o = P_onART_Diag12mNOAHDA1524_M;

rename p50_p_onart_m_&o = P_onART_HIVM1599_M;
rename p5_p_onart_m_&o  = P_onART_HIVM1599_95LL;
rename p95_p_onart_m_&o = P_onART_HIVM1599_95UL;
rename p50_p_onart_w_&o = P_onART_HIVF1599_M;
rename p5_p_onart_w_&o  = P_onART_HIVF1599_95LL;
rename p95_p_onart_w_&o = P_onART_HIVF1599_95UL;
rename p50_p_onart_w1524__&o = P_onART_HIVF1524_M;
rename p50_p_onart_1524__&o = P_onART_HIVA1524_M;
rename p50_p_onart_&o = P_onART_HIVA1599_M;
rename p5_p_onart_&o = P_onART_HIVA1599_95LL;
rename p95_p_onart_&o = P_onART_HIVA1599_95UL;
rename p50_p_onart_sw_&o = P_onART_HIVFSW1599_M;
    
rename p50_p_onart_artexp_m_&o = P_onART_ExpM1599_M;
rename p5_p_onart_artexp_m_&o = P_onART_ExpM1599_95LL;
rename p95_p_onart_artexp_m_&o = P_onART_ExpM1599_95UL;
rename p50_p_onart_artexp_w_&o = P_onART_ExpF1599_M;
rename p5_p_onart_artexp_w_&o = P_onART_ExpF1599_95LL;
rename p95_p_onart_artexp_w_&o = P_onART_ExpF1599_95UL;
rename p50_p_onart_artexp_1524__&o = P_onART_ExpA1524_M;
rename p5_p_onart_artexp_1524__&o = P_onART_ExpA1524_95LL;
rename p95_p_onart_artexp_1524__&o = P_onART_ExpA1524_95UL;
rename p50_p_onart_artexp_&o = P_onART_ExpA1599_M;
rename p5_p_onart_artexp_&o = P_onART_ExpA1599_95LL;
rename p95_p_onart_artexp_&o = P_onART_ExpA1599_95UL;
rename p50_p_onart_artexp_sw_&o = P_onART_ExpFSW1599_M;
rename p50_p_on_artexp_w1524evpreg_&o = P_onART_ExpFpregEverBirth1524_M;

rename p50_p_onart_vl1000__&o = P_VLS_onARTA1599_M;
rename p5_p_onart_vl1000__&o = P_VLS_onARTA1599_95LL;
rename p95_p_onart_vl1000__&o = P_VLS_onARTA1599_95UL;
rename p50_p_onart_vl1000_1524__&o = P_VLS_onARTA1524_M;
rename p5_p_onart_vl1000_1524__&o = P_VLS_onARTA1524_95LL;
rename p95_p_onart_vl1000_1524__&o = P_VLS_onARTA1524_95UL;
rename p50_p_onart_vl1000_w1524evpr_&o = P_VLS_onARTpregEverBirthF1524_M;

*% of adults 15+ years living with HIV who are on ART and who have ever been viremic (measured VL>1000) who are virally suppressed (if possible, at a threshold of <1000)
*rename _&o = P_VLS_onARTMVLgt1000EverA1599_M;
year= floor(cald);
keep year
p50_prevalence1549m_&o 		p5_prevalence1549m_&o		p95_prevalence1549m_&o
p50_prevalence1549w_&o		p5_prevalence1549w_&o 		p95_prevalence1549w_&o
p50_prevalence1549__&o		p5_prevalence1549__&o		p95_prevalence1549__&o
p50_prevalence1549preg_&o	p5_prevalence1549preg_&o	p95_prevalence1549preg_&o
p50_prevalence1524preg_&o	p5_prevalence1524preg_&o 	p95_prevalence1524preg_&o
p50_prevalence_sw_&o		p5_prevalence_sw_&o			p95_prevalence_sw_&o

p50_n_alive_m_&o		p5_n_alive_m_&o		p95_n_alive_m_&o
p50_n_alive_w_&o		p5_n_alive_w_&o		p95_n_alive_w_&o
p50_n_alive_1524m_&o
p50_n_alive_1524w_&o
p50_n_alive_2549m_&o 
p50_n_alive_2549w_&o 
p50_n_sw_1564__&o 		p5_n_sw_1564__&o	p95_n_sw_1564__&o

p50_n_hivneg_sdpartner_&o 
p50_n_hivneg_sdpartneroffart_&o
p50_n_hivnegw_sdpartner_&o 
p50_n_hivnegw_sdpartneroffart_&o

p50_n_hivge15m_&o	p5_n_hivge15m_&o 	p95_n_hivge15m_&o
p50_n_hivge15w_&o	p5_n_hivge15w_&o	p95_n_hivge15w_&o
p50_n_hiv1524m_&o	
p50_n_hiv1524w_&o	
p50_n_hiv2549m_&o
p50_n_hiv2549w_&o	
p50_n_hiv_sw_&o		p5_n_hiv_sw_&o 		p95_n_hiv_sw_&o

p50_n_not_on_art_cd4ge500__&O
p50_n_not_on_art_cd4350500__&o
p50_n_not_on_art_cd4200350__&o
p50_n_not_on_art_cd450200__&o 
p50_n_not_on_art_cd4050__&o
   
p50_n_asympt_Undiag_&o
p50_n_asympt_diagoffart_&o
p50_n_asympt_diagonart_&o
p50_n_sympt_notaids_&o
p50_n_sympt_aids_&o

p50_p_diag_&o 		p5_p_diag_&o	p95_p_diag_&o
p50_p_diag_m_&o		p5_p_diag_m_&o	p95_p_diag_m_&o
p50_p_diag_w_&o		p5_p_diag_w_&o	p95_p_diag_w_&o
p50_p_diag_m1524__&o	
p50_p_diag_w1524__&o
p50_p_diag_sw_&o

p50_p_m_npge1__&o
p50_p_w_npge1__&o
p50_p_w1524_npge1__&o
p50_p_sw_npge1__&o 

p50_prev_sti_sw_&o 

p50_n_w1524_newp_ge1__&o 	p50_p_w1524newpge1_onprep_&o

/*VARIABLES TO BE ADDED HERE ONCE WE HAVE CREATED THEM IN CREATE_WIDE_FILE*/
/*NAlive_FPregBirthBF1599_M*/
/*P_TDFPrEP_FPregBirthBF1599_M*/
/*P_DPVPrEP_ElevRiskF1524_M*/
/*P_DPVPrEP_FPregBirthBF1599_M*/
/*P_CABPrEP_ElevRiskF1524_M*/
/*P_CABPrEP_FPregBirthBF1599_M*/


p50_p_mcirc_1549m_&o 	p5_p_mcirc_1549m_&o  	p95_p_mcirc_1549m_&o 

p50_n_onart_m_&o 		p5_n_onart_m_&o  		p95_n_onart_m_&o 
p50_n_onart_w_&o 		p5_n_onart_w_&o  		p95_n_onart_w_&o 
p50_n_onart_1524__&o 	p5_n_onart_1524__&o  	p95_n_onart_1524__&o 
p50_n_onart_&o 			p5_n_onart_&o  			p95_n_onart_&o 

p50_p_onart_diag_m_&o 		p5_p_onart_diag_m_&o  		p95_p_onart_diag_m_&o 
p50_p_onart_diag_w_&o 		p5_p_onart_diag_w_&o		p95_p_onart_diag_w_&o
p50_p_onart_diag_w1524__&o	
p50_p_onart_diag_1524__&o	p5_p_onart_diag_1524__&o	p95_p_onart_diag_1524__&o
p50_p_onart_diag_&o			p5_p_onart_diag_&o 			p95_p_onart_diag_&o
p50_p_onart_diag_sw_&o

/*
_&o = P_onART_Diag12mAHDA1599_M_&o;
_&o = P_onART_Diag12mNOAHDA1599_M_&o;
_&o = P_onART_Diag12mAHDA1524_M_&o;
_&o = P_onART_Diag12mNOAHDA1524_M_&o;*/

p50_p_onart_m_&o		p5_p_onart_m_&o 	p95_p_onart_m_&o
p50_p_onart_w_&o		p5_p_onart_w_&o 	p95_p_onart_w_&o
p50_p_onart_w1524__&o
p50_p_onart_1524__&o
p50_p_onart_&o			p5_p_onart_&o		p95_p_onart_&o
p50_p_onart_sw_&o
    
p50_p_onart_artexp_m_&o			p5_p_onart_artexp_m_&o		p95_p_onart_artexp_m_&o
p50_p_onart_artexp_w_&o			p5_p_onart_artexp_w_&o		p95_p_onart_artexp_w_&o
p50_p_onart_artexp_1524__&o		p5_p_onart_artexp_1524__&o	p95_p_onart_artexp_1524__&o
p50_p_onart_artexp_&o			p5_p_onart_artexp_&o		p95_p_onart_artexp_&o
p50_p_onart_artexp_sw_&o
p50_p_on_artexp_w1524evpreg_&o

p50_p_onart_vl1000__&o			p5_p_onart_vl1000__&o		p95_p_onart_vl1000__&o
p50_p_onart_vl1000_1524__&o		p5_p_onart_vl1000_1524__&o	p95_p_onart_vl1000_1524__&o
p50_p_onart_vl1000_w1524evpr_&o
/*_&o = P_VLS_onARTMVLgt1000EverA1599_M_&o;*/
;
run;
%mend;
%stock(o=0);
%stock(o=1);
%stock(o=2);
%stock(o=4);
%stock(o=5);
%stock(o=7);
%stock(o=8);
%stock(o=10);
%stock(o=11);
%stock(o=12);
%stock(o=13);
%stock(o=14);
%stock(o=15);
%stock(o=16);
/*%stock(o=17);*/
%stock(o=18);
%stock(o=19);
%stock(o=20);
%stock(o=21);
%stock(o=22);
%stock(o=23);
%stock(o=24);
%stock(o=25);
/*%stock(o=26);*/
%stock(o=27);
%stock(o=28);
%stock(o=29);
%stock(o=30);



PROC export data=s0 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="Base_STOCK";  RUN;
PROC export data=s1 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="Min_STOCK";  RUN;
PROC export data=s2 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_HIVST_PD_STOCK";  RUN;
PROC export data=s4 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_HIVST_SDPARTNER_STOCK";  RUN;
PROC export data=s5 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_FACNOSYMPT_STOCK";  RUN;
PROC export data=s7 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_IndexFAC_STOCK";  RUN;
PROC export data=s8 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="FSWprog_STOCK";  RUN;
PROC export data=s10 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="SBCC_STOCK";  RUN;
PROC export data=s11 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CMMC_STOCK";  RUN;
PROC export data=s12 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="GPMHC_STOCK";  RUN;
PROC export data=s13 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="VMMC_STOCK";  RUN;
PROC export data=s14 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_F1524_STOCK";  RUN;
PROC export data=s15 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_FSW1599_STOCK";  RUN;
PROC export data=s16 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_SDCA1599_STOCK";  RUN;
/*PROC export data=s17 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;*/
/*sheet="TDFPrEP_SDCA1599_STOCK";  RUN;*/
PROC export data=s18 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_pregnbfF1549_STOCK";  RUN;
PROC export data=s19 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_F1524_STOCK";  RUN;
PROC export data=s20 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_FSW1599_STOCK";  RUN;
PROC export data=s21 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_SDCF1599_STOCK";  RUN;
PROC export data=s22 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_pregnbfF1549_STOCK";  RUN;
PROC export data=s23 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_F1524_STOCK";  RUN;
PROC export data=s24 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_FSW1599_STOCK";  RUN;
PROC export data=s25 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_SDCA1599_STOCK";  RUN;
/*PROC export data=s26 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;*/
/*sheet="CABPrEP_pregnbfF1549_STOCK";  RUN;*/
PROC export data=s27 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_pregnbfF1549_STOCK";  RUN;
PROC export data=s28 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="ADH_RET_SUPP_A1019_STOCK";  RUN;
PROC export data=s29 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="ADH_SUPP_A1599_STOCK";  RUN;
PROC export data=s30 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="RET_SUPP_A1599_STOCK";  RUN;

options nomprint;
option nospool;





/***********************************************************************************************/
/************************              FLOW                        ****************************/
/***********************************************************************************************/


  ***Macro var used to calculate means across each year and transpose to one line per run,
  need to write manually all the years to merge;

%let nfit=70;		/*** UPDATE IF ADD MORE RUNS ***/

/* Define the lists of variables */
%let var_list_flow = 
	n_birth  n_give_birth_w_hiv  n_everpregn_w1524_  n_everpregn_hiv_w1524_ n_birth_with_inf_child
	incidence1549m	incidence1549w  incidence1549_  incidence1524w  incidence_sw incidence_sd1564_ incidence_sd1564w
	incidence_plw
	n_new_inf1564m	n_new_inf1564w	n_new_inf1549m  n_new_inf1549w  n_new_inf1549_
	n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w
	n_death_hivrel_m  n_death_hivrel_w  n_death_hivrel
	n_death_m  n_death_w
	/* YLL_80yLifeExpect_3Disc_A1599_M */
	n_total_yllag 	n_dyll_GBD

	n_tested_ancpd  n_test_anclabpd n_tested_anc_prevdiag
	/* HIVST...*/
	n_tested_m_sympt  n_tested_w_sympt
	/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
	n_tested_swprog  n_tested_sw  n_tested_m  n_tested_w  n_tested
	/*
	NHIVST_PD_M1599_M
	NHIVST_PD_F1599_M
	NHIVST_SDNP_M1599_M
	NHIVST_SDNP_F1599_M
	NHIVST_SDPARTNER_M1599_M
	NHIVST_SDPARTNER_F1599_M
	*/
	n_self_tested_m  n_self_tested_w

	n_diag_anclabpd
	/*NPosConfHIVST_PD_M1599_M
	NPosConfHIVST_PD_F1599_M
	NPosConfHIVST_SDNP_M1599_M
	NPosConfHIVST_SDNP_F1599_M
	NPosConfHIVST_SDPARTNER_M1599_M
	NPosConfHIVST_SDPARTNER_F1599_M
	.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
	n_diag_sympt
	n_diag_progsw  n_diag_sw
	n_diag_m  n_diag_w
	/* TOTPosConfHIVST_M1599_M..*/
	n_tested_due_to_st
	test_proppos_m      test_proppos_w  test_prop_positive
	test_proppos_1524w  test_proppos_sw

	n_sw_inprog_ly  /*n_sw_inprog_ever*/
	n_sbcc_visit_1564_ 		n_tested_sbcc
	/*NCUPP_A1599_M ... NCondoms_A1599_M*/
	n_diag_mens_clinic
	n_attend_mens_clinic
	n_new_vmmc1549m
	n_init_prep_oral_1524w 	n_prep_oral_1524w 	n_contprep_oral_1524w 	n_prep_oral_ever_1524w 
	n_init_prep_oral_sw    	n_prep_oral_sw		n_contprep_oral_sw 		n_prep_oral_ever_sw 
	n_init_prep_oral_sdc   	n_prep_oral_sdc 	n_contprep_oral_sdc 	n_prep_oral_ever_sdc
	n_init_prep_oral_plw    n_prep_oral_plw		n_contprep_oral_plw 	n_prep_oral_ever_plw 

	n_init_prep_vr_1524w  	n_prep_vr_1524w 	n_contprep_vr_1524w		n_prep_vr_ever_1524w 
	n_init_prep_vr_sw 	  	n_prep_vr_sw 		n_contprep_vr_sw 		n_prep_vr_ever_sw
	n_init_prep_vr_sdc    	n_prep_vr_sdc 		n_contprep_vr_sdc		n_prep_vr_ever_sdc
	n_init_prep_vr_plw 	  	n_prep_vr_plw 		n_contprep_vr_plw 		n_prep_vr_ever_plw

	n_init_prep_inj_1524w  n_prep_inj_1524w 	n_contprep_inj_1524w	n_prep_inj_ever_1524w
	n_init_prep_inj_sw     n_prep_inj_sw 		n_contprep_inj_sw		n_prep_inj_ever_sw 
	n_init_prep_inj_sdc    n_prep_inj_sdc 		n_contprep_inj_sdc 		n_prep_inj_ever_sdc
	n_init_prep_inj_plw    n_prep_inj_plw 		n_contprep_inj_plw		n_prep_inj_ever_plw 

	n_access_adolescent_supp
	n_access_adult_adh_supp
	n_access_adult_ret_supp

	n_pmtct
;

%let var_list_flow_p50 = 
	p50_n_birth_&o  p50_n_give_birth_w_hiv_&o  p50_n_everpregn_w1524__&o  p50_n_everpregn_hiv_w1524__&o  p50_n_birth_with_inf_child_&o
	p50_incidence1549m_&o  p5_incidence1549m_&o  p95_incidence1549m_&o 
	p50_incidence1549w_&o  p5_incidence1549w_&o  p95_incidence1549w_&o 
	p50_incidence1549__&o  p5_incidence1549__&o  p95_incidence1549__&o 
	p50_incidence1524w_&o  p5_incidence1524w_&o  p95_incidence1524w_&o 
	p50_incidence_sw_&o    p5_incidence_sw_&o    p95_incidence_sw_&o 
	p50_incidence_sd1564__&o p50_incidence_sd1564w_&o 
	p50_incidence_plw_&o

	p50_n_new_inf1564m_&o  p5_n_new_inf1564m_&o  p95_n_new_inf1564m_&o
	p50_n_new_inf1564w_&o  p5_n_new_inf1564w_&o  p95_n_new_inf1564w_&o
	p50_n_new_inf1549m_&o  p5_n_new_inf1549m_&o  p95_n_new_inf1549m_&o
	p50_n_new_inf1549w_&o  p5_n_new_inf1549w_&o  p95_n_new_inf1549w_&o
	p50_n_new_inf1549__&o  p5_n_new_inf1549__&o   p95_n_new_inf1549__&o
	p50_n_new_inf1524m_&o  p50_n_new_inf1524w_&o
	p50_n_new_inf2549m_&o  p50_n_new_inf2549w_&o

	P50_n_death_hivrel_m_&o  P5_n_death_hivrel_m_&o  P95_n_death_hivrel_m_&o 
	P50_n_death_hivrel_w_&o  P5_n_death_hivrel_w_&o  P95_n_death_hivrel_w_&o
	P50_n_death_hivrel_&o    P5_n_death_hivrel_&o 	 P95_n_death_hivrel_&o

	P50_n_death_m_&o  P5_n_death_m_&o  P95_n_death_m_&o 
	P50_n_death_w_&o  P5_n_death_w_&o  P95_n_death_w_&o 
	/* YLL_80yLifeExpect_3Disc_A1599_M */
	p50_n_total_yllag_&o  p50_n_dyll_GBD_&o

	P50_n_tested_ancpd_&o   P50_n_test_anclabpd_&o 	P50_n_tested_anc_prevdiag_&o 
	P50_n_tested_m_sympt_&o  P50_n_tested_w_sympt_&o 
	/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
	P50_n_tested_swprog_&o  P50_n_tested_sw_&o 
	P50_n_tested_m_&o  		P5_n_tested_m_&o  		P95_n_tested_m_&o 
	P50_n_tested_w_&o  		P5_n_tested_w_&o  		P95_n_tested_w_&o
	P50_n_tested_&o    		P5_n_tested_&o    		P95_n_tested_&o
	/*TOTHIVST_M1599_M... TOTHIVST_F1599_M...*/
	P50_n_self_tested_m_&o	P5_n_self_tested_m_&o	P95_n_self_tested_m_&o
	P50_n_self_tested_w_&o	P5_n_self_tested_w_&o	P95_n_self_tested_w_&o

	P50_n_diag_anclabpd_&o 
	/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
	P50_n_diag_sympt_&o
	P50_n_diag_progsw_&o  P50_n_diag_sw_&o 
	P50_n_diag_m_&o  P5_n_diag_m_&o  P95_n_diag_m_&o 
	P50_n_diag_w_&o  P5_n_diag_w_&o  P95_n_diag_w_&o 
	/* TOTPosConfHIVST_M1599_M..*/
	P50_n_tested_due_to_st_&o

	P50_test_proppos_m_&o  P5_test_proppos_m_&o  P95_test_proppos_m_&o 
	P50_test_proppos_w_&o  P5_test_proppos_w_&o  P95_test_proppos_w_&o
	P50_test_prop_positive_&o	P5_test_prop_positive_&o  P95_test_prop_positive_&o
	P50_test_proppos_1524w_&o   P50_test_proppos_sw_&o 

	P50_n_sw_inprog_ly_&o 		/*P50_n_sw_inprog_ever_&o*/
	P50_n_sbcc_visit_1564__&o	P50_n_tested_sbcc_&o

	/*NCUPP_A1599_M ... NCondoms_A1599_M*/
	P50_n_diag_mens_clinic_&o
	P50_n_attend_mens_clinic_&o
	P50_n_new_vmmc1549m_&o

	P50_n_init_prep_oral_1524w_&o   p50_n_prep_oral_1524w_&o 	p50_n_contprep_oral_1524w_&o 	P50_n_prep_oral_ever_1524w_&o 
	P50_n_init_prep_oral_sw_&o     	p50_n_prep_oral_sw_&o    	p50_n_contprep_oral_sw_&o		P50_n_prep_oral_ever_sw_&o 
	P50_n_init_prep_oral_sdc_&o    	p50_n_prep_oral_sdc_&o    	p50_n_contprep_oral_sdc_&o 		P50_n_prep_oral_ever_sdc_&o
	P50_n_init_prep_oral_plw_&o     p50_n_prep_oral_plw_&o    	p50_n_contprep_oral_plw_&o		P50_n_prep_oral_ever_plw_&o 
	  	
	P50_n_init_prep_vr_1524w_&o   	p50_n_prep_vr_1524w_&o 		p50_n_contprep_vr_1524w_&o		P50_n_prep_vr_ever_1524w_&o 
	P50_n_init_prep_vr_sw_&o 	   	p50_n_prep_vr_sw_&o			p50_n_contprep_vr_sw_&o			P50_n_prep_vr_ever_sw_&o
	P50_n_init_prep_vr_sdc_&o     	p50_n_prep_vr_sdc_&o		p50_n_contprep_vr_sdc_&o 		P50_n_prep_vr_ever_sdc_&o
	P50_n_init_prep_vr_plw_&o 	   	p50_n_prep_vr_plw_&o		p50_n_contprep_vr_plw_&o		P50_n_prep_vr_ever_plw_&o

	P50_n_init_prep_inj_1524w_&o  	p50_n_prep_inj_1524w_&o 	p50_n_contprep_inj_1524w_&o 	P50_n_prep_inj_ever_1524w_&o
	P50_n_init_prep_inj_sw_&o     	p50_n_prep_inj_sw_&o		p50_n_contprep_inj_sw_&o		P50_n_prep_inj_ever_sw_&o 
	P50_n_init_prep_inj_sdc_&o    	p50_n_prep_inj_sdc_&o		p50_n_contprep_inj_sdc_&o 		P50_n_prep_inj_ever_sdc_&o
	P50_n_init_prep_inj_plw_&o     	p50_n_prep_inj_plw_&o		p50_n_contprep_inj_plw_&o		P50_n_prep_inj_ever_plw_&o 

	P50_n_access_adolescent_supp_&o
	P50_n_access_adult_adh_supp_&o
	P50_n_access_adult_ret_supp_&o

	P50_n_pmtct_&o	
;


%let var_list_flow_zim_names =
	year
	/* PREGNANCIES AND BIRTHS */
	NAlive_Fbirth1599_M		NHIV_Fbirth1599_M		NAlive_FpregEverBirth1524_M		NHIV_FpregEverBirth1524_M	NHIV_HIVPOSmum_A01_M
	/* HIV INCIDENCE */
	HIVIncid_M1549_M		HIVIncid_M1549_95LL		HIVIncid_M1549_95UL
	HIVIncid_F1549_M		HIVIncid_F1549_95LL		HIVIncid_F1549_95UL
	HIVIncid_A1549_M		HIVIncid_A1549_95LL		HIVIncid_A1549_95UL
	HIVIncid_F1524_M		HIVIncid_F1524_95LL		HIVIncid_F1524_95UL
	HIVIncid_FSW1599_M		HIVIncid_FSW1599_95LL	HIVIncid_FSW1599_95UL		/*in our model is 15-64*/
	HIVIncid_SDCA1599_M		HIVIncid_SDCF1599_M									/*in our model is 15-64*/
	HIVIncid_pregbfF1549_M														/*in our model is 15-64*/
	/* NEW HIV INFECTIONS */
	NHIVInf_M1599_M			NHIVInf_M1599_95LL		NHIVInf_M1599_95UL
	NHIVInf_F1599_M			NHIVInf_F1599_95LL		NHIVInf_F1599_95UL
	NHIVInf_M1549_M			NHIVInf_M1549_95LL		NHIVInf_M1549_95UL
	NHIVInf_F1549_M			NHIVInf_F1549_95LL		NHIVInf_F1549_95UL
	NHIVInf_A1549_M			NHIVInf_A1549_95LL		NHIVInf_A1549_95UL
	NHIVInf_M1524_M			NHIVInf_F1524_M
	NHIVInf_M2549_M			NHIVInf_F2549_M
	/* AIDS DEATHS */
	AIDSDeaths_M1599_M		AIDSDeaths_M1599_95LL	AIDSDeaths_M1599_95UL
	AIDSDeaths_F1599_M		AIDSDeaths_F1599_95LL	AIDSDeaths_F1599_95UL
	AIDSDeaths_A1599_M		AIDSDeaths_A1599_95LL	AIDSDeaths_A1599_95UL
	/* TOTAL DEATHS */
	TOTDeaths_M1599_M		TOTDeaths_M1599_95LL	TOTDeaths_M1599_95UL
	TOTDeaths_F1599_M		TOTDeaths_F1599_95LL	TOTDeaths_F1599_95UL
	/* *** YLL_80yLifeExpect_3Disc_A1599_M */
	YLL_AgeGenLifeExpect_A1599_M		YLL_AgeGenLifeExpect_3D_A1599_M
	/* TESTING */
	Ntested_ANCPD_F1599_M		Ntests_ANCPD_F1599_M	
	Ntested_ANCPrevDiag_F1599_M		/* Added - not in output file */
	Ntests_FACSYMPT_M1599_M		Ntests_FACSYMPT_F1599_M
	/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
	Ntested_FSWprog_FSW1599_M	Ntests_FSW1599_M
	TOTTests_M1599_M		TOTTests_M1599_95LL		TOTTests_M1599_95UL
	TOTTests_F1599_M		TOTTests_F1599_95LL		TOTTests_F1599_95UL
	TOTTests_A1599_M		TOTTests_A1599_95LL		TOTTests_A1599_95UL
	TOTHIVST_M1599_M		TOTHIVST_M1599_95LL		TOTHIVST_M1599_95UL
	TOTHIVST_F1599_M		TOTHIVST_F1599_95LL		TOTHIVST_F1599_95UL
	/* NUMBER OF POSITIVE TESTS */
	NPosTests_ANCPD_F1599_M
		/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
	NPosTests_FACSYMPT_A1599_M
		/*NPosTests_FAC_M1599_M... NPosTests_FAC_F1599_M... NPosTests_IndexFAC_M1599_M... NPosTests_IndexFAC_F1599_M... 
		NPosTests_RecInf_M1599_M... NPosTests_RecInf_F1599_M... NPosTests_COM_M1599_M... NPosTests_COM_F1599_M...*/
	NPosTests_FSWprog_FSW1599_M		NPosTests_FSW1599_M
	TOTPosTests_M1599_M		TOTPosTests_M1599_95LL	TOTPosTests_M1599_95UL
	TOTPosTests_F1599_M		TOTPosTests_F1599_95LL	TOTPosTests_F1599_95UL
	TOTPosConfHIVST_A1599_M		/* not exported by gender: TOTPosConfHIVST_M1599_M...  TOTPosConfHIVST_F1599_M...*/
	/* POSITIVITY RATE */
	PosRate_M1599_M			PosRate_M1599_95LL		PosRate_M1599_95UL
	PosRate_F1599_M			PosRate_F1599_95LL		PosRate_F1599_95UL
	PosRate_A1599_M			PosRate_A1599_95LL		PosRate_A1599_95UL
	PosRate_F1524_M			PosRate_FSW1599_M
	/* PREVENTION */
	NFSWprog_FSW1599_M		/*NFSWprogEver_FSW1599_M*/
	NSBCC_A1599_M			Ntested_SBCC_A1599_M
	/* NCUPP_A1599_M 		NCondoms_A1599_M		CMMC - no specific outputs*/
	NGPMHC_DiagM1599_M		NGPMHC_M1599_M			NVMMC_M1549_M
	NTDFPrEPinit_F1524_M		NTDFPrEP_F1524_M		NTDFPrEPCT_F1524_M			NTDFPrEPEver_F1524_M
	NTDFPrEPinit_FSW1599_M		NTDFPrEP_FSW1599_M		NTDFPrEPCT_FSW1599_M		NTDFPrEPEver_FSW1599_M
	NTDFPrEPinit_SDCA1599_M		NTDFPrEP_SDCA1599_M		NTDFPrEPCT_SDCA1599_M		NTDFPrEPEver_SDCA1599_M
	NTDFPrEPinit_pregbfF1549_M	NTDFPrEP_pregbfF1549_M	NTDFPrEPCT_pregbfF1549_M	NTDFPrEPEver_pregbfF1549_M
	NDPVPrEPinit_F1524_M		NDPVPrEP_F1524_M		NDPVPrEPCT_F1524_M			NDPVPrEPEver_F1524_M
	NDPVPrEPinit_FSW1599_M		NDPVPrEP_FSW1599_M		NDPVPrEPCT_FSW1599_M		NDPVPrEPEver_FSW1599_M
	NDPVPrEPinit_SDCA1599_M		NDPVPrEP_SDCA1599_M		NDPVPrEPCT_SDCA1599_M		NDPVPrEPEver_SDCA1599_M
	NDPVPrEPinit_pregbfF1549_M	NDPVPrEP_pregbfF1549_M	NDPVPrEPCT_pregbfF1549_M	NDPVPrEPEver_pregbfF1549_M
	NCABPrEPinit_F1524_M		NCABPrEP_F1524_M		NCABPrEPCT_F1524_M			NCABPrEPEver_F1524_M
	NCABPrEPinit_FSW1599_M		NCABPrEP_FSW1599_M		NCABPrEPCT_FSW1599_M		NCABPrEPEver_FSW1599_M
	NCABPrEPinit_SDCA1599_M		NCABPrEP_SDCA1599_M		NCABPrEPCT_SDCA1599_M		NCABPrEPEver_SDCA1599_M
	NCABPrEPinit_pregbfF1549_M	NCABPrEP_pregbfF1549_M	NCABPrEPCT_pregbfF1549_M	NCABPrEPEver_pregbfF1549_M
	/* ART SUPPORT */ 
	N_ADH_RET_YP_A1019_M
	N_ADH_A1599_M
	N_RET_A1599_M
	/* OTHER OUTPUTS */
	NPMTCT_FbirthHIV1599_M		/* not exactly correct as N_PMTCT it is the current number of pregnant women receiving PMTCT (de facto ART),
								while this ouput should be # of females 15+ living with HIV who gave birth in the last year and received ART */
;



/* Define the macro */
%macro var_cy(s,v);
data option_&s;set b;if option=&s;keep &v count_csim  cald ;
proc sort data=option_&s;by count_csim  cald ;
%let count = 2023;
%do %while (&count le 2072);
proc means  noprint data=option_&s; var &v; output out=y_&count mean=&v._&count; by count_csim ; where &count-0.5 <= cald < &count+0.5;
%let count = %eval(&count + 1);
%end;
data &v ; merge y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030 y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040 
  y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050 y_2051 y_2052 y_2053 y_2054 y_2055 y_2056 y_2057 y_2058 y_2059 y_2060  
  y_2061 y_2062 y_2063 y_2064 y_2065 y_2066 y_2067 y_2068 y_2069 y_2070 y_2071 y_2072;  
drop _NAME_ _TYPE_ _FREQ_;run;
proc datasets nodetails nowarn nolist;
delete   y_2023 y_2024 y_2025 y_2026 y_2027 y_2028 y_2029 y_2030 y_2031 y_2032 y_2033 y_2034 y_2035 y_2036 y_2037 y_2038 y_2039 y_2040 
  y_2041 y_2042 y_2043 y_2044 y_2045 y_2046 y_2047 y_2048 y_2049 y_2050 y_2051 y_2052 y_2053 y_2054 y_2055 y_2056 y_2057 y_2058 y_2059 y_2060  
  y_2061 y_2062 y_2063 y_2064 y_2065 y_2066 y_2067 y_2068 y_2069 y_2070 y_2071 y_2072;quit;

proc transpose data=&v out=l_&v._&s prefix=&v;id  count_csim;run;
data l_&v._&s;set l_&v._&s;
cald= input(substr(_NAME_,length(_NAME_)-3,4),4.);drop _NAME_;run;

data l_&v._&s;set l_&v._&s;***creates one dataset per variable;
p5_&v._&s  = PCTL(5,of &v.1-&v.&nfit);
p95_&v._&s = PCTL(95,of &v.1-&v.&nfit);
p50_&v._&s = median(of &v.1-&v.&nfit);
keep cald p5_&v._&s p95_&v._&s p50_&v._&s;
run;
proc datasets nodetails nowarn nolist;delete &v;quit;		/*previously had run instead of quit;*/
%mend var_cy;

/* Define the list of options */
%let opt_list = 0 1 2 /*3*/ 4 5 /*6*/ 7 8 /*9*/ 10 11 12 13 14 15 16 /*17*/ 18 19 20 21 22 23 24 25 /*26*/ 27 28 29 30;
/*%let opt_list = 0 1 ;*/


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



/* ******* var_cy section was here - eg %var_cy(23,n_sw_inprog_ly); *********** */




%macro wide(s);
data   wide_allyears_&s; merge 
l_n_birth_&s  l_n_give_birth_w_hiv_&s  l_n_everpregn_w1524__&s  l_n_everpregn_hiv_w1524__&s l_n_birth_with_inf_child_&s
l_incidence1549m_&s	l_incidence1549w_&s  l_incidence1549__&s  l_incidence1524w_&s  l_incidence_sw_&s  
l_incidence_sd1564__&s  l_incidence_sd1564w_&s
l_incidence_plw_&s
l_n_new_inf1564m_&s	l_n_new_inf1564w_&s  l_n_new_inf1549m_&s	l_n_new_inf1549w_&s  l_n_new_inf1549__&s
l_n_new_inf1524m_&s	l_n_new_inf1524w_&s  l_n_new_inf2549m_&s	l_n_new_inf2549w_&s
l_n_death_hivrel_m_&s	l_n_death_hivrel_w_&s	l_n_death_hivrel_&s
l_n_death_m_&s  l_n_death_w_&s
/* YLL_80yLifeExpect_3Disc_A1599_M */
l_n_total_yllag_&s 	l_n_dyll_GBD_&s

l_n_tested_ancpd_&s  l_n_test_anclabpd_&s
/* HIVST...*/
l_n_tested_m_sympt_&s  l_n_tested_w_sympt_&s l_n_diag_sympt_&s
/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
l_n_tested_swprog_&s  l_n_tested_sw_&s  l_n_tested_m_&s  l_n_tested_w_&s  l_n_tested_&s
/*TOTHIVST_M1599_M...*/
l_n_self_tested_m_&s   l_n_self_tested_w_&s


l_n_diag_anclabpd_&s
/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
l_n_diag_progsw_&s  l_n_diag_m_&s  l_n_diag_w_&s 	l_n_diag_sw_&s
/* TOTPosConfHIVST_M1599_M..*/
l_n_tested_due_to_st_&s

l_test_proppos_m_&s  l_test_proppos_m_&s  l_test_proppos_m_&s 
l_test_proppos_w_&s  l_test_proppos_w_&s  l_test_proppos_w_&s
l_test_prop_positive_&s	l_test_prop_positive_&s  l_test_prop_positive_&s
l_test_proppos_1524w_&s   l_test_proppos_sw_&s 

l_n_sw_inprog_ly_&s    		/*l_n_sw_inprog_ever_&s*/
l_n_sbcc_visit_1564__&s 		l_n_tested_sbcc_&s

/*NCUPP_A1599_M ... NCondoms_A1599_M*/
l_n_diag_mens_clinic_&s
l_n_attend_mens_clinic_&s
l_n_new_vmmc1549m_&s

l_n_init_prep_oral_1524w_&s 	l_n_prep_oral_1524w_&s 		l_n_contprep_oral_1524w_&s 
l_n_prep_oral_ever_1524w_&s 
l_n_init_prep_oral_sw_&s    	l_n_prep_oral_sw_&s 		l_n_contprep_oral_sw_&s
l_n_prep_oral_ever_sw_&s 
l_n_init_prep_oral_sdc_&s   	l_n_prep_oral_sdc_&s		l_n_contprep_oral_sdc_&s
l_n_prep_oral_ever_sdc_&s
l_n_init_prep_oral_plw_&s    	l_n_prep_oral_plw_&s 		l_n_contprep_oral_plw_&s
l_n_prep_oral_ever_plw_&s 

l_n_init_prep_vr_1524w_&s   	l_n_prep_vr_1524w_&s 		l_n_contprep_vr_1524w_&s
l_n_prep_vr_ever_1524w_&s 
l_n_init_prep_vr_sw_&s 	  		l_n_prep_vr_sw_&s 			l_n_contprep_vr_sw_&s
l_n_prep_vr_ever_sw_&s
l_n_init_prep_vr_sdc_&s     	l_n_prep_vr_sdc_&s 			l_n_contprep_vr_sdc_&s
l_n_prep_vr_ever_sdc_&s
l_n_init_prep_vr_plw_&s 	  	l_n_prep_vr_plw_&s 			l_n_contprep_vr_plw_&s
l_n_prep_vr_ever_plw_&s

l_n_init_prep_inj_1524w_&s  	l_n_prep_inj_1524w_&s 		l_n_contprep_inj_1524w_&s
l_n_prep_inj_ever_1524w_&s
l_n_init_prep_inj_sw_&s     	l_n_prep_inj_sw_&s			l_n_contprep_inj_sw_&s
l_n_prep_inj_ever_sw_&s 
l_n_init_prep_inj_sdc_&s    	l_n_prep_inj_sdc_&s 		l_n_contprep_inj_sdc_&s
l_n_prep_inj_ever_sdc_&s
l_n_init_prep_inj_plw_&s     	l_n_prep_inj_plw_&s			l_n_contprep_inj_plw_&s
l_n_prep_inj_ever_plw_&s 

l_n_access_adolescent_supp_&s
l_n_access_adult_adh_supp_&s
l_n_access_adult_ret_supp_&s

l_n_pmtct_&s;
run;
%mend;

%wide(0);
%wide(1);
%wide(2);
/*%wide(3);*/
%wide(4);
%wide(5);
/*%wide(6);*/
%wide(7);
%wide(8);
/*%wide(9);*/
%wide(10);
%wide(11);
%wide(12);
%wide(13);
%wide(14);
%wide(15);
%wide(16);
/*%wide(17);*/
%wide(18);
%wide(19);
%wide(20);
%wide(21);
%wide(22);
%wide(23);
%wide(24);
%wide(25);
/*%wide(26);*/
%wide(27);
%wide(28);
%wide(29);
%wide(30);

/*
proc freq data=wide_allyears_0;
table p50_n_pmtct_0 p50_n_everpregn_w1524__0
p50_incidence_sd1564__0 p50_incidence_sd1564W_0 p50_n_new_inf1549__0

p50_N_DIAG_SW_0
p50_n_prep_oral_1524w_0 p50_n_contprep_oral_1524w_0
p50_n_prep_oral_sw_0    p50_n_contprep_oral_sw_0
p50_n_prep_oral_sdc_0    p50_n_contprep_oral_sdc_0
p50_n_prep_vr_1524w_0 	p50_n_prep_vr_sw_0    	p50_n_prep_vr_sdc_0   
p50_n_prep_inj_1524w_0 	p50_n_prep_inj_sw_0    	p50_n_prep_inj_sdc_0;run;*/


*FLOW;
%macro flow(o=);
data wide_allyears_out_&o; set wide_allyears_&o;
*note that 1991 would refer to the period &year_start.5-1991.5;

*** PREGNANCIES BIRTHS;
*# of females 15+ years old who gave birth in the last year:
 as we model only pregnancies for women 15+ and who lead to live births, I think we can use the annual number of births;
rename p50_n_birth_&o            = NAlive_Fbirth1599_M;
*Number of females 15+ years old who gave birth in the last year who were living with HIV;
rename p50_n_give_birth_w_hiv_&o = NHIV_Fbirth1599_M;
*Number of females 15+ years old who gave birth or breastfed in the last year;
*!!!!!Need Jenney code;
*rename NAlive_FbirthBF1599_M;
*Number of females 15+ years old who gave birth or breastfed in the last year who were living with HIV;
*!!!!!Need Jenney code;
*rename NHIV_FbirthBF1599_M;
*Number of females 15-24 years old who ever gave birth or pregnant in the last year aged 15-24 years old;
rename p50_n_everpregn_w1524__&o = NAlive_FpregEverBirth1524_M;	
*Number of females 15-24 years old who ever gave birth or pregnant in the last year aged 15-24 years old living with HIV;
rename p50_n_everpregn_hiv_w1524__&o = NHIV_FpregEverBirth1524_M;	
*Number of children born in the last year;
*Note: the same as # of females 15+ years old who gave birth in the last year. We assume no twins;
*rename p50_n_birth_&o            = NAlive_A01_M;	
*Number of children born in the last year from mums living with HIV;
*rename p50_n_give_birth_w_hiv_&o = NAlive_HIVPOSmum_A01_M;
*Number of children born in the last year from mums living with HIV, who are living with HIV;
rename p50_n_birth_with_inf_child_&o = NHIV_HIVPOSmum_A01_M;


*** HIV INCIDENCE;
rename p50_incidence1549m_&o = HIVIncid_M1549_M;
rename p5_incidence1549m_&o  = HIVIncid_M1549_95LL;
rename p95_incidence1549m_&o = HIVIncid_M1549_95UL;
rename p50_incidence1549w_&o = HIVIncid_F1549_M;
rename p5_incidence1549w_&o  = HIVIncid_F1549_95LL;
rename p95_incidence1549w_&o = HIVIncid_F1549_95UL;
rename p50_incidence1549__&o  = HIVIncid_A1549_M;
rename p5_incidence1549__&o   = HIVIncid_A1549_95LL;
rename p95_incidence1549__&o  = HIVIncid_A1549_95UL;
rename p50_incidence1524w_&o = HIVIncid_F1524_M;
rename p5_incidence1524w_&o = HIVIncid_F1524_95LL;
rename p95_incidence1524w_&o = HIVIncid_F1524_95UL;
rename p50_incidence_sw_&o = HIVIncid_FSW1599_M;*in our model is 15-64;
rename p5_incidence_sw_&o = HIVIncid_FSW1599_95LL;*in our model is 15-64;
rename p95_incidence_sw_&o = HIVIncid_FSW1599_95UL;*in our model is 15-64;
*HIV incidence in adults 15+ years old with an HIV positive partner;
rename p50_incidence_sd1564__&o = HIVIncid_SDCA1599_M;*in our model is 15-64;
rename p50_incidence_sd1564w_&o = HIVIncid_SDCF1599_M;*in our model is 15-64;
*HIV incidence in pregnant and breastfeeding females 15-49 years old;
rename p50_incidence_plw_&o = HIVIncid_pregbfF1549_M;*in our model is 15-64;


*** NEW HIV INFECTIONS;
rename p50_n_new_inf1564m_&o = NHIVInf_M1599_M;
rename p5_n_new_inf1564m_&o = NHIVInf_M1599_95LL;
rename p95_n_new_inf1564m_&o = NHIVInf_M1599_95UL;
rename p50_n_new_inf1564w_&o = NHIVInf_F1599_M;
rename p5_n_new_inf1564w_&o = NHIVInf_F1599_95LL;
rename p95_n_new_inf1564w_&o = NHIVInf_F1599_95UL;
rename p50_n_new_inf1549m_&o = NHIVInf_M1549_M;
rename p5_n_new_inf1549m_&o = NHIVInf_M1549_95LL;
rename p95_n_new_inf1549m_&o = NHIVInf_M1549_95UL;
rename p50_n_new_inf1549w_&o = NHIVInf_F1549_M;
rename p5_n_new_inf1549w_&o = NHIVInf_F1549_95LL;
rename p95_n_new_inf1549w_&o = NHIVInf_F1549_95UL;
rename p50_n_new_inf1549__&o = NHIVInf_A1549_M;
rename p5_n_new_inf1549__&o = NHIVInf_A1549_95LL;
rename p95_n_new_inf1549__&o = NHIVInf_A1549_95UL;
rename p50_n_new_inf1524m_&o = NHIVInf_M1524_M;
rename p50_n_new_inf1524w_&o = NHIVInf_F1524_M;
rename p50_n_new_inf2549m_&o = NHIVInf_M2549_M;
rename p50_n_new_inf2549w_&o = NHIVInf_F2549_M;


*** AIDS DEATHS;
rename P50_n_death_hivrel_m_&o = AIDSDeaths_M1599_M;	
rename P5_n_death_hivrel_m_&o = AIDSDeaths_M1599_95LL;	
rename P95_n_death_hivrel_m_&o = AIDSDeaths_M1599_95UL;	
rename P50_n_death_hivrel_w_&o = AIDSDeaths_F1599_M;
rename P5_n_death_hivrel_w_&o = AIDSDeaths_F1599_95LL;	
rename P95_n_death_hivrel_w_&o = AIDSDeaths_F1599_95UL;	
rename P50_n_death_hivrel_&o = AIDSDeaths_A1599_M;
rename P5_n_death_hivrel_&o = AIDSDeaths_A1599_95LL;
rename P95_n_death_hivrel_&o = AIDSDeaths_A1599_95UL;


*** TOTAL DEATHS;
rename P50_n_death_m_&o = TOTDeaths_M1599_M;
rename P5_n_death_m_&o  = TOTDeaths_M1599_95LL;
rename P95_n_death_m_&o = TOTDeaths_M1599_95UL;
rename P50_n_death_w_&o = TOTDeaths_F1599_M;
rename P5_n_death_w_&o  = TOTDeaths_F1599_95LL;
rename P95_n_death_w_&o = TOTDeaths_F1599_95UL;
** YLL_80yLifeExpect_3Disc_A1599_M;
rename p50_n_total_yllag_&o = YLL_AgeGenLifeExpect_A1599_M;
rename p50_n_dyll_GBD_&o = YLL_AgeGenLifeExpect_3D_A1599_M;

*** TESTING;
rename P50_n_tested_ancpd_&o = Ntested_ANCPD_F1599_M; *This is set to 1 only at 1 point in time;
rename P50_n_test_anclabpd_&o = Ntests_ANCPD_F1599_M;
*rename P50_ _&o = NHIVST_PD_M1599_M;
*rename P50_ _&o = NHIVST_PD_F1599_M;
*rename P50_ _&o = NHIVST_SDNP_M1599_M;
*rename P50_ _&o = NHIVST_SDNP_F1599_M;
*rename P50_ _&o = NHIVST_SDPARTNER_M1599_M;
*rename P50_ _&o = NHIVST_SDPARTNER_F1599_M;
*Number of tests for HIV at facility, excluding ANC & PD, contacts testing for HIV at the facility and testing of FSW,
among 15+ years old males with symptoms;
rename P50_n_tested_m_sympt_&o = Ntests_FACSYMPT_M1599_M;
rename P50_n_tested_w_sympt_&o = Ntests_FACSYMPT_F1599_M;
*rename P50_ _&o = Ntests_FACNOSYMPT_M1599_M;
*rename P50_ _&o = Ntests_FACNOSYMPT_F1599_M;
*rename P50_ _&o = Ntests_IndexFAC_M1599_M;
*rename P50_ _&o = Ntests_IndexFAC_F1599_M;
*rename P50_ _&o = Ntests_RecInf_M1599_M;
*rename P50_ _&o = Ntests_RecInf_F1599_M;
*rename P50_ _&o = Ntests_COM_M1599_M;
*rename P50_ _&o = Ntests_COM_F1599_M;
*Number of FSW 15+ years old tested as part of a testing program for FSW;
rename P50_n_tested_swprog_&o = Ntested_FSWprog_FSW1599_M; *Loveleen is going to do a pull request about this;
rename P50_n_tested_sw_&o = Ntests_FSW1599_M;
rename P50_n_tested_m_&o = TOTTests_M1599_M;
rename P5_n_tested_m_&o = TOTTests_M1599_95LL;
rename P95_n_tested_m_&o = TOTTests_M1599_95UL;
rename P50_n_tested_w_&o = TOTTests_F1599_M;
rename P5_n_tested_w_&o = TOTTests_F1599_95LL;
rename P95_n_tested_w_&o = TOTTests_F1599_95UL;
rename P50_n_tested_&o = TOTTests_A1599_M;
rename P5_n_tested_&o = TOTTests_A1599_95LL;
rename P95_n_tested_&o = TOTTests_A1599_95UL;
rename P50_n_self_tested_m_&o = TOTHIVST_M1599_M;
rename P5_n_self_tested_m_&o = TOTHIVST_M1599_95LL;
rename P95_n_self_tested_m_&o = TOTHIVST_M1599_95UL;
rename P50_n_self_tested_w_&o = TOTHIVST_F1599_M;
rename P5_n_self_tested_w_&o = TOTHIVST_F1599_95LL;
rename P95_n_self_tested_w_&o = TOTHIVST_F1599_95UL;
*rename P50_ _&o = TOTHIVST_A014_M;
*rename P5_ _&o = TOTHIVST_A014_95LL;
*rename P95_ _&o = TOTHIVST_A014_95UL;


*** NUMBER OF POSITIVE TESTS;
rename P50_n_diag_anclabpd_&o = NPosTests_ANCPD_F1599_M;
*rename P50_ _&o = NPosConfHIVST_PD_M1599_M;
*rename P50_ _&o = NPosConfHIVST_PD_F1599_M;
*rename P50_ _&o = NPosConfHIVST_SDNP_M1599_M;
*rename P50_ _&o = NPosConfHIVST_SDNP_F1599_M;
*rename P50_ _&o = NPosConfHIVST_SDPARTNER_M1599_M;
*rename P50_ _&o = NPosConfHIVST_SDPARTNER_F1599_M;
rename P50_n_diag_sympt_&o = NPosTests_FACSYMPT_A1599_M;
*rename P50_ _&o = NPosTests_FAC_M1599_M;
*rename P50_ _&o = NPosTests_FAC_F1599_M;
*rename P50_ _&o = NPosTests_IndexFAC_M1599_M;
*rename P50_ _&o = NPosTests_IndexFAC_F1599_M;
*rename P50_ _&o = NPosTests_RecInf_M1599_M;
*rename P50_ _&o = NPosTests_RecInf_F1599_M;
*rename P50_ _&o = NPosTests_COM_M1599_M;
*rename P50_ _&o = NPosTests_COM_F1599_M;
rename P50_n_diag_progsw_&o = NPosTests_FSWprog_FSW1599_M;
rename P50_n_diag_sw_&o = NPosTests_FSW1599_M;
rename P50_n_diag_m_&o = TOTPosTests_M1599_M;
rename P5_n_diag_m_&o = TOTPosTests_M1599_95LL;
rename P95_n_diag_m_&o = TOTPosTests_M1599_95UL;
rename P50_n_diag_w_&o = TOTPosTests_F1599_M;
rename P5_n_diag_w_&o = TOTPosTests_F1599_95LL;
rename P95_n_diag_w_&o = TOTPosTests_F1599_95UL;
rename P50_n_tested_due_to_st_&o = TOTPosConfHIVST_A1599_M;*!!!!! it was not exported by gender;
rename P5_n_tested_due_to_st_&o = TOTPosConfHIVST_A1599_95LL;*!!!!! it was not exported by gender;
rename P95_n_tested_due_to_st_&o = TOTPosConfHIVST_A1599_95UL;*!!!!! it was not exported by gender;
*rename P50_ _&o = TOTPosConfHIVST_M1599_M;
*rename P5_ _&o = TOTPosConfHIVST_M1599_95LL;
*rename P95_ _&o = TOTPosConfHIVST_M1599_95UL;
*rename P50_ _&o = TOTPosConfHIVST_F1599_M;
*rename P5_ _&o = TOTPosConfHIVST_F1599_95LL;
*rename P95_ _&o = TOTPosConfHIVST_F1599_95UL;


*** POSITIVITY RATE;
rename P50_test_proppos_m_&o = PosRate_M1599_M;
rename P5_test_proppos_m_&o = PosRate_M1599_95LL;
rename P95_test_proppos_m_&o = PosRate_M1599_95UL;
rename P50_test_proppos_w_&o = PosRate_F1599_M;
rename P5_test_proppos_w_&o = PosRate_F1599_95LL;
rename P95_test_proppos_w_&o = PosRate_F1599_95UL;
rename P50_test_prop_positive_&o = PosRate_A1599_M;
rename P5_test_prop_positive_&o = PosRate_A1599_95LL;
rename P95_test_prop_positive_&o = PosRate_A1599_95UL;
rename P50_test_proppos_1524w_&o = PosRate_F1524_M;
rename P50_test_proppos_sw_&o = PosRate_FSW1599_M;


*** PREVENTION;
rename P50_n_sw_inprog_ly_&o = NFSWprog_FSW1599_M;
*rename P50_n_sw_inprog_ever_&o = NFSWprogEver_FSW1599_M;
*Number of adults 15+ years old recipient of SBCC intervention;
rename P50_n_sbcc_visit_1564__&o = NSBCC_A1599_M;
rename P50_n_tested_sbcc_&o = Ntested_SBCC_A1599_M;
*Number of adults 15+ years old recipient of condoms;
*rename P50_ _&o = NCUPP_A1599_M;
*Number of condoms distributed among adults 15+ years old;
*rename P50_ _&o = NCondoms_A1599_M;
*CMMC - no specific outputs;
*GPMHC;
rename P50_n_diag_mens_clinic_&o = NGPMHC_DiagM1599_M;
rename P50_n_attend_mens_clinic_&o = NGPMHC_M1599_M;	*JASNov2024;
rename P50_n_new_vmmc1549m_&o = NVMMC_M1549_M;

rename P50_n_init_prep_oral_1524w_&o = NTDFPrEPinit_F1524_M;
rename P50_n_prep_oral_1524w_&o = NTDFPrEP_F1524_M; 	
rename P50_n_contprep_oral_1524w_&o = NTDFPrEPCT_F1524_M; 
rename P50_n_prep_oral_ever_1524w_&o = NTDFPrEPEver_F1524_M;
rename P50_n_init_prep_oral_sw_&o = NTDFPrEPinit_FSW1599_M;
rename P50_n_prep_oral_sw_&o = NTDFPrEP_FSW1599_M;		
rename P50_n_contprep_oral_sw_&o = NTDFPrEPCT_FSW1599_M;
rename P50_n_prep_oral_ever_sw_&o = NTDFPrEPEver_FSW1599_M;
rename P50_n_init_prep_oral_sdc_&o = NTDFPrEPinit_SDCA1599_M;
rename P50_n_prep_oral_sdc_&o = NTDFPrEP_SDCA1599_M; 	
rename P50_n_contprep_oral_sdc_&o = NTDFPrEPCT_SDCA1599_M;
rename P50_n_prep_oral_ever_sdc_&o = NTDFPrEPEver_SDCA1599_M;
rename P50_n_init_prep_oral_plw_&o = NTDFPrEPinit_pregbfF1549_M;
rename P50_n_prep_oral_plw_&o = NTDFPrEP_pregbfF1549_M;
rename P50_n_contprep_oral_plw_&o = NTDFPrEPCT_pregbfF1549_M;
rename P50_n_prep_oral_ever_plw_&o = NTDFPrEPEver_pregbfF1549_M;


rename P50_n_init_prep_vr_1524w_&o = NDPVPrEPinit_F1524_M;
rename P50_n_prep_vr_1524w_&o = NDPVPrEP_F1524_M; 	
rename P50_n_contprep_vr_1524w_&o = NDPVPrEPCT_F1524_M;;	
rename P50_n_prep_vr_ever_1524w_&o = NDPVPrEPEver_F1524_M;
rename P50_n_init_prep_vr_sw_&o = NDPVPrEPinit_FSW1599_M;
rename P50_n_prep_vr_sw_&o = NDPVPrEP_FSW1599_M;
rename P50_n_contprep_vr_sw_&o = NDPVPrEPCT_FSW1599_M;;
rename P50_n_prep_vr_ever_sw_&o = NDPVPrEPEver_FSW1599_M;
rename P50_n_init_prep_vr_sdc_&o = NDPVPrEPinit_SDCF1599_M;
rename P50_n_prep_vr_sdc_&o = NDPVPrEP_SDCF1599_M;
rename P50_n_contprep_vr_sdc_&o = NDPVPrEPCT_SDCF1599_M;
rename P50_n_prep_vr_ever_sdc_&o = NDPVPrEPEver_SDCF1599_M;
rename P50_n_init_prep_vr_plw_&o = NDPVPrEPinit_pregbfF1549_M;
rename P50_n_prep_vr_plw_&o = NDPVPrEP_pregbfF1549_M;
rename P50_n_contprep_vr_plw_&o = NDPVPrEPCT_pregbfF1549_M;
rename P50_n_prep_vr_ever_plw_&o = NDPVPrEPEver_pregbfF1549_M;
rename P50_n_init_prep_inj_1524w_&o = NCABPrEPinit_F1524_M;
rename P50_n_prep_inj_1524w_&o = NCABPrEP_F1524_M;
rename P50_n_contprep_inj_1524w_&o = NCABPrEPCT_F1524_M;;
rename P50_n_prep_inj_ever_1524w_&o = NCABPrEPEver_F1524_M;
rename P50_n_init_prep_inj_sw_&o = NCABPrEPinit_FSW1599_M;
rename P50_n_prep_inj_sw_&o = NCABPrEP_FSW1599_M;
rename P50_n_contprep_inj_sw_&o = NCABPrEPCT_FSW1599_M;
rename P50_n_prep_inj_ever_sw_&o = NCABPrEPEver_FSW1599_M;
rename P50_n_init_prep_inj_sdc_&o = NCABPrEPinit_SDCA1599_M;
rename P50_n_prep_inj_sdc_&o = NCABPrEP_SDCA1599_M; 		
rename P50_n_contprep_inj_sdc_&o = NCABPrEPCT_SDCA1599_M;;
rename P50_n_prep_inj_ever_sdc_&o = NCABPrEPEver_SDCA1599_M;
rename P50_n_init_prep_inj_plw_&o = NCABPrEPinit_pregbfF1549_M;
rename P50_n_prep_inj_plw_&o = NCABPrEP_pregbfF1549_M;
rename P50_n_contprep_inj_plw_&o = NCABPrEPCT_pregbfF1549_M;
rename P50_n_prep_inj_ever_plw_&o = NCABPrEPEver_pregbfF1549_M;


*** ART SUPPORT;
* Adolescent support;
rename P50_n_access_adolescent_supp_&o = N_ADH_RET_YP_A1019_M;
* Adult adherence support;
rename P50_n_access_adult_adh_supp_&o = N_ADH_A1599_M;
* Adult retention support;
rename P50_n_access_adult_ret_supp_&o = N_RET_A1599_M;


*The below is not exactly correct as N_PMTCT it is the current number of pregnant women receiving PMTCT (de facto ART),
while this ouput should be # of females 15+ living with HIV who gave birth in the last year and received ART;
rename p50_n_pmtct_&o = NPMTCT_FbirthHIV1599_M;
/*
NARTinit_A1599_M
NARTreinit_A1599_M
NTreatFail_A1599_M
N_A1599_CD4_M
NCD4_A1599_M
NMCD4lt350_A1599_M
NMCD4lt200_A1599_M
N_CTX_A1599_M
N_CTX_A014_M
NAHD_A1599_M
NIdentAHD_A1599_M
NScreenCM_A1599AHD_M
NScreenCM_A014_M
NScreenTB_A1599AHD_M
NScreenTB_A014_M
NPrevTreatCrypt_A1599_M
NPrevTreatCrypt_A014_M
NTreatCrypt_A1599_M
NTreatCrypt_A014_M
NTreatTB_A1599_M
NTreatTB_A014_M
NAIDS_A1599_M
NTreatAIDS_A1599_M
NVLtested_A1599_M
NVLtested_A014_M
NVL_A1599_M
NVL_A014_M
N_A1599_POCCD4_M
NPOCCD4_A1599_M
N_A1599_POCVL_M
N_A014_POCVL_M
NPOCVL_A1599_M
NPOCVL_A014_M
NCRF_A1599_M
NCATS_HIVPOSA1524_M
NCATS_HIVNEGA1524_M
NERC_HIVPOSA1524_M
NERC_HIVNEGA1524_M
NYMM_HIVPOSFpregEverBirth1524_M
NMVLgt1000_A1599_M
NMVLgt1000Ever_A1599_M
N_ADHCVIR_MVLgt1000EverA1599_M
N_ADHCADO_A1524_M
*/

rename cald=year;

keep cald &var_list_flow_p50; run;

%mend;

%flow(o=0);
%flow(o=1);
%flow(o=2);
/*%flow(o=3);*/
%flow(o=4);
%flow(o=5);
/*%flow(o=6);*/
%flow(o=7);
%flow(o=8);
/*%flow(o=9);*/
%flow(o=10);
%flow(o=11);
%flow(o=12);
%flow(o=13);
%flow(o=14);
%flow(o=15);
%flow(o=16);
/*%flow(o=17);*/
%flow(o=18);
%flow(o=19);
%flow(o=20);
%flow(o=21);
%flow(o=22);
%flow(o=23);
%flow(o=24);
%flow(o=25);
/*%flow(o=26);*/
%flow(o=27);
%flow(o=28);
%flow(o=29);
%flow(o=30);


PROC export data=wide_allyears_out_0 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE; 
sheet="Base_FLOW";  RUN;
PROC export data=wide_allyears_out_1 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="Min_FLOW";  RUN;
PROC export data=wide_allyears_out_2 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_HIVST_PD_FLOW";  RUN;
PROC export data=wide_allyears_out_4 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_HIVST_SDPARTNER_FLOW";  RUN;
PROC export data=wide_allyears_out_5 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_FACNOSYMPT_FLOW";  RUN;
PROC export data=wide_allyears_out_7 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="T_IndexFAC_FLOW";  RUN;
PROC export data=wide_allyears_out_8 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="FSWprog_FLOW";  RUN;
PROC export data=wide_allyears_out_10 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="SBCC_FLOW";  RUN;
PROC export data=wide_allyears_out_11 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CMMC_FLOW";  RUN;
PROC export data=wide_allyears_out_12 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="GPMHC_FLOW";  RUN;
PROC export data=wide_allyears_out_13 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="VMMC_FLOW";  RUN;
PROC export data=wide_allyears_out_14 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_F1524_FLOW";  RUN;
PROC export data=wide_allyears_out_15 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_FSW1599_FLOW";  RUN;
PROC export data=wide_allyears_out_16 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_SDCA1599_FLOW";  RUN;
/*PROC export data=wide_allyears_out_17 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;*/
/*sheet="TDFPrEP_SDCA1599_FLOW";  RUN;*/
PROC export data=wide_allyears_out_18 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="TDFPrEP_pregnbfF1549_FLOW";  RUN;
PROC export data=wide_allyears_out_19 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_F1524_FLOW";  RUN;
PROC export data=wide_allyears_out_20 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_FSW1599_FLOW";  RUN;
PROC export data=wide_allyears_out_21 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_SDCF1599_FLOW";  RUN;
PROC export data=wide_allyears_out_22 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="DPVPrEP_pregnbfF1549_FLOW";  RUN;
PROC export data=wide_allyears_out_23 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_F1524_FLOW";  RUN;
PROC export data=wide_allyears_out_24 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_FSW1599_FLOW";  RUN;
PROC export data=wide_allyears_out_25 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_SDCA1599_FLOW";  RUN;
/*PROC export data=wide_allyears_out_26 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;*/
/*sheet="CABPrEP_pregnbfF1549_FLOW";  RUN;*/
PROC export data=wide_allyears_out_27 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="CABPrEP_pregnbfF1549_FLOW";  RUN;
PROC export data=wide_allyears_out_28 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="ADH_RET_SUPP_A1019_FLOW";  RUN;
PROC export data=wide_allyears_out_29 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="ADH_SUPP_A1599_FLOW";  RUN;
PROC export data=wide_allyears_out_30 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250205" dbms=xlsx REPLACE;
sheet="RET_SUPP_A1599_FLOW";  RUN;
