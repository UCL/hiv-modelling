
***Program to produce graphs using averages across runs
***Use include statement in analysis program to read the code below in;

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20250702_out\";
/*libname a "C:\Users\rmjlja9\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe";*/

proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
proc freq data=a.long_zim_all;table option;run;

%let pth_export_hiv_control= C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe;run;

%let year_start = 1990;
%let year_end = 2050;


data b;
set a.long_zim_all;

p_onart_vl1000_all = .;



* NB: note lines below, because variable names cannot end with a number;
n_sw_1564_ = n_sw_1564;*VCFeb2023;
/*n_not_on_art_cd4050_ = n_not_on_art_cd4050;*VCFeb2023;*/
/*n_not_on_art_cd450200_ = n_not_on_art_cd450200;*VCFeb2023;*/
/*n_not_on_art_cd4200350_ = n_not_on_art_cd4200350;*VCFeb2023;*/
/*n_not_on_art_cd4350500_ = n_not_on_art_cd4350500;*VCFeb2023;*/
/*n_not_on_art_cd4ge500_  = n_not_on_art_cd4ge500;*VCFeb2023;*/

/*log_gender_r_newp  = log(gender_r_newp);*/
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




proc sort data=b; by option cald run ;run;
proc freq data=b; table cald option;run;

proc print data=b; var option cald count_csim;run;
*At the moment is the median across all runs by option;
*Note that we need the same number of simulations/runs from each dataset;
data b;set b;count_csim+1;by option cald ;if first.cald then count_csim=1;run;***counts the number of runs;
 ***number of runs - this is manually inputted in nfit in the macros below;

proc means max data=b;var count_csim cald;run;*190;

/*proc freq data=b;table cald;run;*/

proc sort;by cald option ;run;

*INCLUDE ONLY STOCK VARIABLE AND VARIABLES THAT WE WANT TO GRAPH;
%let var =  
n_alive n_alive_m n_alive_w n_alive_1014m n_alive_1524m n_alive_1524w n_alive_2549m n_alive_2549w /*n_alive_55plm n_alive_55plw*/ n_alive0_
n_alive_014_ 	n_alive_1524_	 n_alive_2564_		n_alive_65pl									
n_sw_1564_		prev_sti_sw  n_sw_program_visit /*n_sw_inprog_ly  n_sw_inprog_ever n_diag_sw_inprog*/
prop_sw_program_visit n_diag_progsw n_diag_sw
n_hivneg_sdpartner n_hivneg_sdpartneroffart n_hivnegw_sdpartner n_hivnegw_sdpartneroffart
/*n_not_on_art_cd40200_*/ n_not_on_art_cd4050_ n_not_on_art_cd450200_ n_not_on_art_cd4200350_ n_not_on_art_cd4350500_ n_not_on_art_cd4ge500_ 
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
n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w /*n_hiv55plm n_hiv55plw*/ n_hiv_sw
n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w n_hiv_sw
prevalence1549m prevalence1549w
prevalence1549_ prevalence_sw prevalence_hiv_preg prevalence1549preg prevalence1524preg prevalence_vg1000_  incidence1549_ incidence1549m incidence1549w incidence1564_ 
incidence1524w incidence1524m incidence2534w incidence2534m incidence3544w incidence3544m incidence4554w incidence4554m 
incidence5564w incidence5564m incidence_sw 
n_new_inf1549_ n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w /*n_new_inf55plm n_new_inf55plw*/
n_tested n_tested_m n_tested_w n_tested_sw /*n_tested_as_sw*/ n_tested_swprog n_tested_anc 
n_tested_m_sympt n_tested_w_sympt /*n_tested_m_sympt_test n_tested_w_sympt_test*/
n_tested_m_circ /*n_tested_symptoms_not_hiv*/ n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd
/*n_tested_tb n_tested_general n_tested_startprep n_tested_onprep n_tested_rsprep n_tested_prep*/
n_tested1st_anc n_tested1st_labdel n_tested1st_pd n_tested_anc_prevdiag
/*n_self_tested 	n_self_tested_m  n_self_tested_w  n_tested_due_to_st n_diagnosed_self_test*/			
n_sbcc_visit_1524m 	n_sbcc_visit_1524w n_sbcc_visit_1524_	n_sbcc_visit_2564_ n_sbcc_visit_1564_
n_tested_sbcc_1524m n_tested_sbcc_1524w n_tested_sbcc_2564_ n_tested_sbcc
p_tested_sbcc_1524m p_tested_sbcc_1524w p_tested_sbcc_2564_ p_pos_tested_sbcc
n_hivpos_tests n_hivneg_tests n_hivpos_tests_sympt n_hivneg_tests_sympt
p_anc n_diagnosed n_diag_anc n_diag_labdel n_diag_pd /*n_diag_sympt*/ n_diag_self_test
n_diag_ever_m n_diag_ever_w
test_prop_positive /*test_proppos_sympt*/ overall_test_yield
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w			p_diag_m1524_ 		p_diag_w1524_	/*p_diag_all_sw*/	p_diag_sw	
n_cm n_vm p_vm_ly_onart n_pcp_p
p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m p_onart_diag_sw	p_onart_diag_w1524_ p_onart_diag_1524_  
p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_onart_vl1000_1524_ p_vl1000_ 	p_vg1000_ 	/*p_vg1000_all*/	
p_onart_vl1000_all	p_onart p_onart_m 	p_onart_w  p_onart_w1524_ p_onart_1524_ p_onart_sw
p_onart_artexp 	p_onart_artexp_m 	p_onart_artexp_w 	p_onart_artexp_1524_ 	p_onart_artexp_sw 	p_on_artexp_w1524evpreg
p_onart_vl1000_w				p_onart_vl1000_m  p_onart_vl1000_w1524evpr logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart 		n_onart_m	n_onart_w n_onart_1524_ n_art_start_y
n_total_yllag 	n_dyll_GBD
/*p_births_hiv_vlg1000_
n_attend_mens_clinic  n_hiv_mens_clinic  n_diag_mens_clinic  n_onart_mens_clinic
n_access_adolescent_supp  n_hiv_adolescent_supp  s_diag_adolescent_supp  n_onart_adolescent_supp  n_vls_adolescent_supp
n_access_adult_adh_supp  n_hiv_adult_adh_supp  s_diag_adult_adh_supp  n_onart_adult_adh_supp  n_vls_adult_adh_supp
n_access_adult_ret_supp  n_hiv_adult_ret_supp  s_diag_adult_ret_supp  n_onart_adult_ret_supp 
p_adh_hi p_adh_lo*/
prevalence_msm

;
run;

/** Single var;*/
/*%let var =  prevalence_msm;*/


*I created one single macro;
***transpose given name; *starts with %macro and ends with %mend;
%macro option_(s);
data option_&s;set b;
if option=&s;
%let p5_var = p5_&var._&s;
%let p95_var = p95_&var._&s;
%let p50_var = median_&var._&s;
%let mean_var = mean_&var._&s;

%let count = 0;
%do %while (%qscan(&var, &count+1, %str( )) ne %str());
%let count = %eval(&count + 1);
%let varb = %scan(&var, &count, %str( ));
      
proc transpose data=option_&s out=g&s._&count prefix=&varb;var &varb; by cald; id count_csim;run;
*In order to easily join with from 2012 av_&varb.1,etc...;
data g&s._&count;set g&s._&count;***creates one dataset per variable;
p5_&varb._&s  = PCTL(5,of &varb.1-&varb.&nfit);
p95_&varb._&s = PCTL(95,of &varb.1-&varb.&nfit);
p50_&varb._&s = median(of &varb.1-&varb.&nfit);
mean_&varb._&s = mean(of &varb.1-&varb.&nfit);

keep cald p5_&varb._&s p95_&varb._&s p50_&varb._&s mean_&varb._&s ;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


*We need the same number of simulations for each option;
%let nfit=190;
%option_(1);
run;


data d; * this is number of variables in %let var = above ;
merge 
g0_1   g0_2   g0_3   g0_4   g0_5   g0_6   g0_7   g0_8   g0_9   g0_10  g0_11  g0_12  g0_13  g0_14  g0_15  g0_16  g0_17  g0_18  g0_19  g0_20  g0_21  g0_22  g0_23  /*g0_24  g0_25  
g0_26  g0_27  g0_28*/  g0_29  g0_30  g0_31  g0_32  g0_33  g0_34  g0_35  g0_36  g0_37  g0_38  g0_39  g0_40  g0_41  g0_42  g0_43  g0_44  g0_45  /*g0_46*/  g0_47  g0_48  g0_49  g0_50 
g0_51  g0_52  g0_53  g0_54  g0_55  g0_56  g0_57  g0_58  g0_59  g0_60  g0_61  g0_62  g0_63  g0_64  g0_65  g0_66  g0_67  g0_68  g0_69  g0_70  g0_71  g0_72  g0_73  g0_74  g0_75  
g0_76  g0_77  g0_78  g0_79  g0_80  g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90  g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99  g0_100 
g0_101 g0_102 g0_103 g0_104 g0_105 g0_106 g0_107 g0_108 g0_109 g0_110 g0_111 g0_112 g0_113 g0_114 g0_115 g0_116 g0_117 g0_118 g0_119 g0_120 g0_121 g0_122 g0_123 g0_124 g0_125 
g0_126 g0_127 g0_128 g0_129 g0_130 g0_131 g0_132 g0_133 g0_134 g0_135 g0_136 g0_137 g0_138 g0_139 g0_140 g0_141 g0_142 g0_143 g0_144 g0_145 g0_146 g0_147 g0_148 g0_149 g0_150 
g0_151 g0_152 g0_153 g0_154 g0_155 g0_156 g0_157 g0_158 g0_159 g0_160 g0_161 g0_162 g0_163 g0_164 g0_165 g0_166 g0_167 g0_168 g0_169 g0_170 g0_171 g0_172 g0_173 g0_174 g0_175 
g0_176 g0_177 g0_178 g0_179 g0_180 g0_181 g0_182 g0_183 g0_184 g0_185 g0_186 g0_187 g0_188 g0_189 g0_190 g0_191 g0_192 g0_193 g0_194 g0_195 g0_196 g0_197 g0_198 g0_199 g0_200 
g0_201 g0_202 g0_203 g0_204 g0_205 g0_206 g0_207 g0_208 g0_209 g0_210 g0_211 g0_212 g0_213 g0_214 g0_215 g0_216 g0_217 g0_218 g0_219 g0_220 g0_221 g0_222 g0_223 g0_224 g0_225 
g0_226 g0_227 g0_228 g0_229 g0_230 g0_231 g0_232 g0_233 g0_234 g0_235 g0_236 g0_237 g0_238 g0_239 g0_240 g0_241 g0_242 g0_243 g0_244 g0_245 g0_246 g0_247 g0_248 g0_249 g0_250 
g0_251 g0_252 g0_253 g0_254 g0_255 g0_256 g0_257 g0_258 g0_259 g0_260 g0_261 g0_262 g0_263 g0_264 g0_265 g0_266 /*g0_267 g0_268 g0_269 g0_270 g0_271 g0_272 g0_273 g0_274 g0_275 
g0_276 g0_277 g0_278 g0_279 g0_280 g0_281 g0_282 g0_283 g0_284 g0_285 g0_286 g0_287 g0_288 g0_289 g0_290 g0_291 g0_292 g0_293 g0_294 g0_295 g0_296 g0_297 g0_298 g0_299 g0_300 
g0_301 g0_302 g0_303 g0_304 g0_305 g0_306 g0_307 g0_308 g0_309 g0_310 g0_311 g0_312 g0_313 g0_314*/

g1_1   g1_2   g1_3   g1_4   g1_5   g1_6   g1_7   g1_8   g1_9   g1_10  g1_11  g1_12  g1_13  g1_14  g1_15  g1_16  g1_17  g1_18  g1_19  g1_20  g1_21  g1_22  g1_23  /*g1_24  g1_25  
g1_26  g1_27  g1_28*/  g1_29  g1_30  g1_31  g1_32  g1_33  g1_34  g1_35  g1_36  g1_37  g1_38  g1_39  g1_40  g1_41  g1_42  g1_43  g1_44  g1_45  /*g1_46*/  g1_47  g1_48  g1_49  g1_50 
g1_51  g1_52  g1_53  g1_54  g1_55  g1_56  g1_57  g1_58  g1_59  g1_60  g1_61  g1_62  g1_63  g1_64  g1_65  g1_66  g1_67  g1_68  g1_69  g1_70  g1_71  g1_72  g1_73  g1_74  g1_75  
g1_76  g1_77  g1_78  g1_79  g1_80  g1_81  g1_82  g1_83  g1_84  g1_85  g1_86  g1_87  g1_88  g1_89  g1_90  g1_91  g1_92  g1_93  g1_94  g1_95  g1_96  g1_97  g1_98  g1_99  g1_100 
g1_101 g1_102 g1_103 g1_104 g1_105 g1_106 g1_107 g1_108 g1_109 g1_110 g1_111 g1_112 g1_113 g1_114 g1_115 g1_116 g1_117 g1_118 g1_119 g1_120 g1_121 g1_122 g1_123 g1_124 g1_125 
g1_126 g1_127 g1_128 g1_129 g1_130 g1_131 g1_132 g1_133 g1_134 g1_135 g1_136 g1_137 g1_138 g1_139 g1_140 g1_141 g1_142 g1_143 g1_144 g1_145 g1_146 g1_147 g1_148 g1_149 g1_150 
g1_151 g1_152 g1_153 g1_154 g1_155 g1_156 g1_157 g1_158 g1_159 g1_160 g1_161 g1_162 g1_163 g1_164 g1_165 g1_166 g1_167 g1_168 g1_169 g1_170 g1_171 g1_172 g1_173 g1_174 g1_175 
g1_176 g1_177 g1_178 g1_179 g1_180 g1_181 g1_182 g1_183 g1_184 g1_185 g1_186 g1_187 g1_188 g1_189 g1_190 g1_191 g1_192 g1_193 g1_194 g1_195 g1_196 g1_197 g1_198 g1_199 g1_200 
g1_201 g1_202 g1_203 g1_204 g1_205 g1_206 g1_207 g1_208 g1_209 g1_210 g1_211 g1_212 g1_213 g1_214 g1_215 g1_216 g1_217 g1_218 g1_219 g1_220 g1_221 g1_222 g1_223 g1_224 g1_225 
g1_226 g1_227 g1_228 g1_229 g1_230 g1_231 g1_232 g1_233 g1_234 g1_235 g1_236 g1_237 g1_238 g1_239 g1_240 g1_241 g1_242 g1_243 g1_244 g1_245 g1_246 g1_247 g1_248 g1_249 g1_250 
g1_251 g1_252 g1_253 g1_254 g1_255 g1_256 g1_257 g1_258 g1_259 g1_260 g1_261 g1_262 g1_263 g1_264 g1_265 g1_266 /*g1_267 g1_268 g1_269 g1_270 g1_271 g1_272 g1_273 g1_274 g1_275 
g1_276 g1_277 g1_278 g1_279 g1_280 g1_281 g1_282 g1_283 g1_284 g1_285 g1_286 g1_287 g1_288 g1_289 g1_290 g1_291 g1_292 g1_293 g1_294 g1_295 g1_296 g1_297 g1_298 g1_299 g1_300 
g1_301 g1_302 g1_303 g1_304 g1_305 g1_306 g1_307 g1_308 g1_309 g1_310 g1_311 g1_312 g1_313 g1_314*/
;
by cald;
%include "C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe\Observed data_Zimbabwe.sas";
run;

/*data a.d;set d;run;*/
/*data d;set a.d;run;*/
ods html close;
ods listing;




***Graphs comparing observed data to outputs for Status quo 1 and 15;
*Taken from Zim graphs in branch Death cascade;
ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe\graphs_20250702.doc' startpage=never;



*Option 0 only;

* Population size;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 25000000 by  5000000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_alive_0 = "Status quo (median) - 15+ ";
*label p50_n_alive1549__0 = "Status quo (median) - 15-49 ";
label o_pop_all_Zi_cens = "Census - All ages";
label o_pop_1549_Zi_cens = "Census - 15-49";
label o_pop_all_Zi_CIA = "CIA - All ages";
label o_pop_1565_Zi_CIA = "CIA - All 15-64";
series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*scatter x=cald y=o_pop_all_Zi_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_pop_1549_Zi_cens / markerattrs = (symbol=square color=green size = 10);
*scatter x=cald y=o_pop_all_Zi_CIA / markerattrs = (symbol=triangle color=grey size = 10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs = (symbol=triangle color=brown size = 10);
run;quit;

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
series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_0 	upper=p95_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Status quo 90% range";
run;
quit;


* p_newp;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.25 /*0.2*/ by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0  = "Baseline (median) - 15+";
label p50_p_newp_ge1__1  = "+ condom availability (median) - 15+";

series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0  = "Status quo (median) - 15+";
*label p50_p_newp_ge5__15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);

label p50_log_gender_r_newp_0  = "Status quo (median) - 15+";
series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_ep_0  = "Status quo (median) - 15+";
series  x=cald y=p50_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

* "Number of AGYW at elevated risk" n_w1524_newp_ge1; 
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of AGYW at elevated risk - n_w1524_newp_ge1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_w1524_newp_ge1__0  = "Status quo (median) - 15+";
series  x=cald y=p50_n_w1524_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_w1524_newp_ge1__0 	upper=p95_n_w1524_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;


* Births;
*tested_anc=1 if tested at dt_start_pregn+0.25 or dt_start_pregn+0.5;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of live births";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1200000 by 200000) valueattrs=(size=10);*900000 if stopping in 2023;
label p50_n_birth_0 = "Status quo (median) ";
label o_s_exppregn_MoH = "Number of expected pregnancies";
series  x=cald y=p50_n_birth_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_birth_0 	upper=p95_n_birth_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Status quo 90% range";
scatter x=cald y=o_s_exppregn_MoH / markerattrs = (symbol=square color=orange size = 10);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number women living with HIV giving birth";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 250000 by 50000) valueattrs=(size=10);*200000 if stopping in 2023;
label p50_n_give_birth_w_hiv_0 = "Status quo (median) ";
label o_n_hiv_labdel = "Number HIV+ in labour and delivery";
series  x=cald y=p50_n_give_birth_w_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_give_birth_w_hiv_0 	upper=p95_n_give_birth_w_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Status quo 90% range";
scatter x=cald y=o_n_births_hivposmother / markerattrs = (symbol=square color=orange size = 10);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of pregnant women attending ANC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_anc_0  = "Status quo (median) - 15+";
label o_p_testedanc_1549_zdhs = "DHS - 15-49";
label o_p_TESTEDorAW_anc_MoH = "MoH";
series  x=cald y=p50_p_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_anc_0 	upper=p95_p_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_p_testedanc_1549_zdhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_TESTEDorAW_anc_MoH / markerattrs = (symbol=square color=blue size = 10);
run;quit;


*Number attending ANC;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_anc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1500000 by 250000) valueattrs=(size=10);
label p50_n_tested_anc_0  = "Status quo (median) - 15+";
label o_n_tests_anc = "Number of women tested in ANC";*It includes the following;
label o_n_firsttested_anc = "Number of women tested for the first time in ANC";
series  x=cald y=p50_n_tested_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_anc_0 	upper=p95_n_tested_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
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
label o_n_firsttested_anc = "Number of woment tested for the first time in ANC";
series  x=cald y=p50_n_tested1st_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested1st_anc_0 	upper=p95_n_tested1st_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_firsttested_anc/ markerattrs = (symbol=square color=orange size = 10);
run;quit;
*/
proc sgplot data=d; 
Title    height=1.5 justify=center "New diagnoses in ANC and during labour and delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  40000 by 5000) valueattrs=(size=10);
label p50_n_diag_anc_0  = "Status quo (median) - 15+";
label o_n_newdiag_anc = "Number of women diagnosed in ANC";
series  x=cald y=p50_n_diag_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_anc_0 	upper=p95_n_diag_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_0/	lineattrs = (color=black thickness = 5);
band    x=cald lower=p5_n_diag_labdel_0 	upper=p95_n_diag_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_newdiag_anc / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_labdel";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  300000 by 50000) valueattrs=(size=10);
label p50_n_tested_w_labdel_0  = "Status quo (median) - 15+";
label o_n_tested_labdel = "Number of woment tested during labour and delivery";
series  x=cald y=p50_n_tested_w_labdel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_labdel_0 	upper=p95_n_tested_w_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_tested_labdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time in Labour and Delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_labdel_0  = "Status quo (median) - 15+";
label o_n_firsttested_labdel = "Number of woment tested for the first time during labour and delivery";
series  x=cald y=p50_n_tested1st_labdel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested1st_labdel_0 	upper=p95_n_tested1st_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_firsttested_labdel/ markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "New diagnoses during labour and delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000 by 250) valueattrs=(size=10);
label p50_n_diag_labdel_0  = "Status quo (median) - 15+";
label o_n_newdiag_labdel = "Number of women diagnosed during labour and delivery";
series  x=cald y=p50_n_diag_labdel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_labdel_0 	upper=p95_n_diag_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_newdiag_labdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;*/

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_pd";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_tested_w_pd_0  = "Status quo (median) - 15+";
label o_n_tested_postdel = "Number of woment tested post delivery";
series  x=cald y=p50_n_tested_w_pd_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_pd_0 	upper=p95_n_tested_w_pd_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_tested_postdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time post-delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_pd_0  = "Status quo (median) - 15+";
label o_n_firsttested_postdel = "Number of woment tested for the first time post delivery";
series  x=cald y=p50_n_tested1st_pd_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested1st_pd_0 	upper=p95_n_tested1st_pd_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_firsttested_postdel/ markerattrs = (symbol=square color=orange size = 10);
run;quit;*/
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "New diagnoses in post-delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000 by 250) valueattrs=(size=10);
label p50_n_diag_pd_0  = "Status quo (median) - 15+";
label o_n_newdiag_postdel = "Number of women diagnosed in post-delivery";
series  x=cald y=p50_n_diag_pd_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_pd_0 	upper=p95_n_diag_pd_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_n_newdiag_postdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;*/
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  250000 by 50000) valueattrs=(size=10);
label p50_n_tested_sw_0  = "Status quo (median) - 15+";
label o_nfswtested_sistclin = "Number of FSW tested in the Sisters clinics";
series  x=cald y=p50_n_tested_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_0 	upper=p95_n_tested_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter x=cald y=o_nfswtested_sistclin / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_sympt";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  500000 by 100000) valueattrs=(size=10);
label p50_n_tested_w_sympt_0  = "Status quo (median) - 15+";
series  x=cald y=p50_n_tested_w_sympt_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_sympt_0 	upper=p95_n_tested_w_sympt_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV tests performed in women (age 15+, excluding self tests)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  4000000 by 500000) valueattrs=(size=10);*2500000 if stopping in 2023;
label p50_n_tested_w_0  = "Status quo (median) - 15+";
series  x=cald y=p50_n_tested_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_0 	upper=p95_n_tested_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0  = "Status quo (median) - 15+";
label o_p_testedly_1549w_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_testedly_1549w_zdhs/	markerattrs = (color=black) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV tests performed (age 15+, excluding self tests)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  8000000 by 1000000) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_0  = "Status quo (median) - 15+";
/*label p50_n_tested_1  = "Minimal (median) - 15+  ";*/
*label p50_n_tested_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_n_tested_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_15 	upper=p95_n_tested_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of HIV tests performed in men (age 15+, excluding self tests)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1800000 by 200000) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_m_0  = "Status quo (median) - 15+";
/*label p50_n_tested_m_1  = "Minimal (median) - 15+  ";*/
*label p50_n_tested_m_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_0 	upper=p95_n_tested_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_m_1 	upper=p95_n_tested_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_tested_m_sympt_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_m_sympt_1 	upper=p95_n_tested_m_sympt_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_n_tested_m_sympt_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_m_sympt_15 	upper=p95_n_tested_m_sympt_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m_circ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_tested_m_circ_0  = "Status quo (median) - 15+";
/*label p50_n_tested_m_circ_1  = "Minimal (median) - 15+  ";*/
*label p50_n_tested_m_circ_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_circ_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_circ_0 	upper=p95_n_tested_m_circ_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_m_circ_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_m_circ_1 	upper=p95_n_tested_m_circ_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_n_tested_m_circ_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_tested_m_circ_15 	upper=p95_n_tested_m_circ_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0  = "Status quo (median) - 15+";
/*label p50_p_tested_past_year_1549m_1  = "Minimal (median) - 15+  ";*/
*label p50_p_tested_past_year_1549m_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_p_testedly_1549m_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*label p50_test_prop_positive_1  = "Minimal (median)";*/
*label p50_test_prop_positive_15 = "Oral PrEP AGYW (median)";
label o_pos_rate_15ov_z = "CAL - Public sector";
label o_pos_rate_pepfar = "PEPFAR";
series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_test_prop_positive_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_test_prop_positive_1 	upper=p95_test_prop_positive_15  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*label p50_test_proppos_sympt_1  = "Minimal (median)";*/
*label p50_test_proppos_sympt_15 = "Oral PrEP AGYW (median)";
label o_pos_rate_pepfar = "PEPFAR";
series  x=cald y=p50_test_proppos_sympt_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_proppos_sympt_0 	upper=p95_test_proppos_sympt_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_test_proppos_sympt_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_test_proppos_sympt_1 	upper=p95_test_proppos_sympt_15  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_test_proppos_sympt_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_test_proppos_sympt_15 	upper=p95_test_proppos_sympt_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_pos_rate_sympt_pepfar/	markerattrs = (color=black ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new diagnoses with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);
label p50_n_diagnosed_0 = "Status quo (median)";
/*label p50_n_diagnosed_1 = "Minimal (median)";*/
*label p50_n_diagnosed_15 = "Oral PrEP AGYW (median)";
series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_diagnosed_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_n_diagnosed_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_diagnosed_15 	upper=p95_n_diagnosed_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;






*!!!!!Note that the observed data are 15+;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Status quo (median)";
/*label p50_p_mcirc_1549m_1 = "Minimal (median)";*/
/*label p50_p_mcirc_1549m_13 = "VMMC (median)";*/
*label p50_p_mcirc_0 = "Status quo (median) - 15+?";
label o_p_circ_15pl_DHS_z= "CAL - DHIS2 men 15+";
label o_p_circ_1549_zimphia= "ZIMPHIA men 15-49";
label o_p_circ_1549_zimphia= "NSP target";
series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_p_mcirc_1549m_13/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_p_mcirc_1549m_13 	upper=p95_p_mcirc_1549m_13  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
scatter  x=cald y=o_p_circ_15pl_DHS_z /	markerattrs = (color=orange);
scatter  x=cald y=o_p_circ_1549_zimphia /	markerattrs = (color=blue);
scatter  x=cald y=target_p_circ_1549m_NSP /	markerattrs = (color=pink);
run;quit;

 
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual # new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_new_vmmc1549m_0 = "Status quo (median) ";
/*label p50_n_new_vmmc1549m_1 = "Minimal (median) ";*/
/*label p50_n_new_vmmc1549m_13 = "VMMC (median) ";*/
label o_s_test_15ov_py_z = "CAL - Annual number of new circumcisions 10-49";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_new_vmmc1549m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_new_vmmc1549m_1 	upper=p95_n_new_vmmc1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*/*series  x=cald y=p50_n_new_vmmc1549m_13/	lineattrs = (color=green thickness = 2);*/*/
band    x=cald lower=p5_n_new_vmmc1549m_13 	upper=p95_n_new_vmmc1549m_13  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
/*scatter  x=cald y=o_s_new_mcirc/	markerattrs = (color=blue ) ;*/
run;quit;



* ----------- ;
* --- FSW --- ;
* ----------- ;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of current female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Status quo (median) ";
/*label p50_prop_w_1549_sw_1 = "Minimal (median) ";*/
/*label p50_prop_w_1549_sw_8 = "Option 8 (FSW program) (median) ";*/
/*label p50_prop_w_1549_sw_33 = "Option 33 (cehck PrEP) (median) ";*/
label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_w_1549_sw_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_prop_w_1549_sw_8 	upper=p95_prop_w_1549_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_w_1549_sw_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_prop_w_1549_sw_33 	upper=p95_prop_w_1549_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
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
/*label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";*/
*label p50_prop_w_ever_sw_15 = "Ever FSW 15-64 op 0 (median) ";
label o_p_ever_fsw_1ts_1849w_nbcs = "NBCS - Ever transactional sex 18-49";
series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_prop_w_ever_sw_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_prop_w_ever_sw_15 	upper=p95_prop_w_ever_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_ever_fsw_1ts_1849w_nbcs /	markerattrs = (color=green);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
/*label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";*/
/*label p50_prop_sw_hiv_8 = "FSW with HIV 15-64 op 8 (median) ";*/
/*label p50_prop_sw_hiv_33 = "FSW with HIV 15-64 op 33 (median) ";*/
label o_prev_fsw_dw = "David Wilson";
label o_prev_fsw_rdshm = "RDS Hwange and Mutare";
label o_prev_fsw_rdsvf = "RDS Victoria Falls";
label o_prev_fsw_tested_swvp = "Sisters with a Voice";
label o_prev_fsw_rds = "RDS Status quo SAPPH-IRe";
series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_sw_hiv_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_prop_sw_hiv_8 	upper=p95_prop_sw_hiv_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_sw_hiv_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_prop_sw_hiv_33 	upper=p95_prop_sw_hiv_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
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
/*label p50_n_tested_sw_1  = "Number of FSW tested op 1 (median) ";*/
/*label p50_n_tested_sw_8  = "Number of FSW tested op 8 (median) ";*/
/*label p50_n_tested_sw_33  = "Number of FSW tested op 33 (median) ";*/
series  x=cald y=p50_n_tested_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_0 	upper=p95_n_tested_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_sw_1 	upper=p95_n_tested_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_sw_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_tested_sw_8 	upper=p95_n_tested_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_sw_33/	lineattrs = (color=purple thickness = 2);*/
band    x=cald lower=p5_n_tested_sw_33 	upper=p95_n_tested_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;
* Options 8 (original FSW) and 33 (FSW prep reset to FSW program level) give same numbers of FSW being tested overall;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW tested as SW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e4 by 2e3) valueattrs=(size=10);
label p50_n_tested_as_sw_0  = "Number of FSW tested as SW op 0 (median) ";
/*label p50_n_tested_as_sw_1  = "Number of FSW tested as SW op 1 (median) ";*/
/*label p50_n_tested_as_sw_8  = "Number of FSW tested as SW op 8 (median) ";*/
/*label p50_n_tested_as_sw_33  = "Number of FSW tested as SW op 33 (median) ";*/
series  x=cald y=p50_n_tested_as_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_as_sw_0 	upper=p95_n_tested_as_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_as_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_as_sw_1 	upper=p95_n_tested_as_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_as_sw_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_tested_as_sw_8 	upper=p95_n_tested_as_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_as_sw_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_n_tested_as_sw_33 	upper=p95_n_tested_as_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;
* Check if Options 8 and 33 both restore testing among FSW to almost SQ level;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW tested due to SW program";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_tested_swprog_0  = "Number of FSW tested due to SW program op 0 (median) ";
/*label p50_n_tested_swprog_1  = "Number of FSW tested due to SW program op 1 (median) ";*/
/*label p50_n_tested_swprog_8  = "Number of FSW tested due to SW program op 8 (median) ";*/
/*label p50_n_tested_swprog_33  = "Number of FSW tested due to SW program op 33 (median) ";*/
series  x=cald y=p50_n_tested_swprog_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_swprog_0 	upper=p95_n_tested_swprog_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_swprog_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_swprog_1 	upper=p95_n_tested_swprog_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_swprog_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_tested_swprog_8 	upper=p95_n_tested_swprog_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_swprog_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_n_tested_swprog_33 	upper=p95_n_tested_swprog_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;
* Check if Options 8 and 33 both restore testing among FSW to almost SQ level;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW who visited the progam this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_program_visit_0  = "Prop of FSW with program visit op 0 (median) ";
/*label p50_prop_sw_program_visit_1  = "Prop of FSW with program visit op 1 (median) ";*/
/*label p50_prop_sw_program_visit_8  = "Prop of FSW with program visit op 8 (median) ";*/
/*label p50_prop_sw_program_visit_33  = "Prop of FSW with program visit op 33 (median) ";*/
series  x=cald y=p50_prop_sw_program_visit_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_0 	upper=p95_prop_sw_program_visit_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_prop_sw_program_visit_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_sw_program_visit_1 	upper=p95_prop_sw_program_visit_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_sw_program_visit_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_prop_sw_program_visit_8 	upper=p95_prop_sw_program_visit_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_sw_program_visit_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_prop_sw_program_visit_33 	upper=p95_prop_sw_program_visit_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;
* Check if Options 8 and 33 both restore value to SQ level;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW in SW program in past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_sw_inprog_ly_0  = "Number of FSW in SW program in past year op 0 (median) ";
/*label p50_n_sw_inprog_ly_1  = "Number of FSW in SW program in past year op 1 (median) ";*/
/*label p50_n_sw_inprog_ly_8  = "Number of FSW in SW program in past year op 8 (median) ";*/
/*label p50_n_sw_inprog_ly_33  = "Number of FSW in SW program in past year op 33 (median) ";*/
series  x=cald y=p50_n_sw_inprog_ly_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_0 	upper=p95_n_sw_inprog_ly_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_sw_inprog_ly_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_sw_inprog_ly_1 	upper=p95_n_sw_inprog_ly_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_sw_inprog_ly_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_sw_inprog_ly_8 	upper=p95_n_sw_inprog_ly_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_sw_inprog_ly_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_n_sw_inprog_ly_33 	upper=p95_n_sw_inprog_ly_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;
**CHECK IF THIS OUTPUT NOW WORKING - SQ value restored in op 8 and 33;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of SW program visits in past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_sw_program_visit_0  = "Number of SW program visits in past year op 0 (median) ";
/*label p50_n_sw_program_visit_1  = "Number of SW program visits in past year op 1 (median) ";*/
/*label p50_n_sw_program_visit_8  = "Number of SW program visits in past year op 8 (median) ";*/
/*label p50_n_sw_program_visit_33  = "Number of SW program visits in past year op 33 (median) ";*/
series  x=cald y=p50_n_sw_program_visit_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_0 	upper=p95_n_sw_program_visit_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_sw_program_visit_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_sw_program_visit_1 	upper=p95_n_sw_program_visit_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_sw_program_visit_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_sw_program_visit_8 	upper=p95_n_sw_program_visit_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_sw_program_visit_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_n_sw_program_visit_33 	upper=p95_n_sw_program_visit_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_prep_oral_sw_0  = "Number of FSW on PrEP op 0 (median) ";
/*label p50_n_prep_oral_sw_1  = "Number of FSW on PrEP op 1 (median) ";*/
/*label p50_n_prep_oral_sw_8  = "Number of FSW on PrEP op 8 (median) ";*/
/*label p50_n_prep_oral_sw_33  = "Number of FSW on PrEP op 33 (median) ";*/
label p50_n_prep_0  = "Total on PrEP op 0 (median) ";
/*label p50_n_prep_1  = "Total on PrEP op 1 (median) ";*/
/*label p50_n_prep_8  = "Total on PrEP op 8 (median) ";*/
/*label p50_n_prep_33  = "Total on PrEP op 33 (median) ";*/
series  x=cald y=p50_n_prep_oral_sw_0/	lineattrs = (color=black thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_0 	upper=p95_n_prep_oral_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_prep_oral_sw_1/	lineattrs = (color=red thickness = 2 pattern=solid);*/
/*band    x=cald lower=p5_n_prep_oral_sw_1 	upper=p95_n_prep_oral_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_oral_sw_8/	lineattrs = (color=green thickness = 2 pattern=solid);*/
/*band    x=cald lower=p5_n_prep_oral_sw_8 	upper=p95_n_prep_oral_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_oral_sw_33/	lineattrs = (color=purple thickness = 2 pattern=solid);*/
/*band    x=cald lower=p5_n_prep_oral_sw_33 	upper=p95_n_prep_oral_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_0/			lineattrs = (color=black thickness = 2 pattern=MediumDash);*/
/*band    x=cald lower=p5_n_prep_0 	upper=p95_n_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_1/			lineattrs = (color=red thickness = 2 pattern=MediumDash);*/
/*band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_8/			lineattrs = (color=green thickness = 2 pattern=MediumDash);*/
/*band    x=cald lower=p5_n_prep_8 	upper=p95_n_prep_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_33/			lineattrs = (color=purple thickness = 2 pattern=MediumDash);*/
/*band    x=cald lower=p5_n_prep_33 	upper=p95_n_prep_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;
* CHECK Op 33: none on PrEP. Op 8: low number on PrEP - but cannot tell if distributed via program;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_diag_sw_0  = "Prop of HIV+ FSW diagnosed op 0 (median) ";
/*label p50_p_diag_sw_1  = "Prop of HIV+ FSW diagnosed op 1 (median) ";*/
/*label p50_p_diag_sw_8  = "Prop of HIV+ FSW diagnosed op 8 (median) ";*/
/*label p50_p_diag_sw_33  = "Prop of HIV+ FSW diagnosed op 33 (median) ";*/
series  x=cald y=p50_p_diag_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_sw_0 	upper=p95_p_diag_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_diag_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_diag_sw_1 	upper=p95_p_diag_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_p_diag_sw_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_p_diag_sw_8 	upper=p95_p_diag_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_p_diag_sw_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_p_diag_sw_33 	upper=p95_p_diag_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number SW diagnosed this period due to FSW program";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e4 by 2e3) valueattrs=(size=10);
label p50_n_diag_progsw_0  = "Number SW diagnosed this period by program op 0 (median) ";
/*label p50_n_diag_progsw_1  = "Number SW diagnosed this period by program op 1 (median) ";*/
/*label p50_n_diag_progsw_8  = "Number SW diagnosed this period by program op 8 (median) ";*/
/*label p50_n_diag_progsw_33  = "Number SW diagnosed this period by program op 33 (median) ";*/
series  x=cald y=p50_n_diag_progsw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_progsw_0 	upper=p95_n_diag_progsw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_diag_progsw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_diag_progsw_1 	upper=p95_n_diag_progsw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_diag_progsw_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_diag_progsw_8 	upper=p95_n_diag_progsw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_diag_progsw_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_n_diag_progsw_33 	upper=p95_n_diag_progsw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;quit;
/*proc freq data=d; table p50_n_diag_progsw_0; run;*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Number SW diagnosed this period total";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e4 by 2e3) valueattrs=(size=10);
label p50_n_diag_sw_0  = "Number SW diagnosed this period op 0 (median) ";
/*label p50_n_diag_sw_1  = "Number SW diagnosed this period op 1 (median) ";*/
series  x=cald y=p50_n_diag_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_sw_0 	upper=p95_n_diag_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_diag_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_diag_sw_1 	upper=p95_n_diag_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;quit;
/*proc freq data=d; table p50_n_diag_progsw_0; run;*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence FSW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 20 by 1) valueattrs=(size=10);
label p50_incidence_sw_0 = "Status quo (median) ";
/*label p50_incidence_sw_1 = "Minimal (median) ";*/
/*label p50_incidence_sw_8 = "Option 8 (median) ";*/
/*label p50_incidence_sw_33 = "Option 33 (median) ";*/
series  x=cald y=p50_incidence_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_sw_0 	upper=p95_incidence_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_incidence_sw_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence_sw_1 	upper=p95_incidence_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence_sw_8/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_incidence_sw_8 	upper=p95_incidence_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence_sw_33/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_incidence_sw_33 	upper=p95_incidence_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
run;
quit;






* ------------ ;
* --- PrEP --- ;
* ------------ ;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 350000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_0 = "Status quo (median) ";
label p50_n_prep_1 = "Minimal  (median) ";
label p50_n_prep_15 = "Minimal5  (median) ";
series  x=cald y=p50_n_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_0 	upper=p95_n_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_prep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_prep_14/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_prep_14 	upper=p95_n_prep_14  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_16/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_16 	upper=p95_prop_1564_onprep_16  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_21/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_21 		upper=p95_prop_1564_onprep_21  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_25/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_25 	upper=p95_prop_1564_onprep_25  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_18/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_18 	upper=p95_prop_1564_onprep_18  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_22/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_22 		upper=p95_prop_1564_onprep_22  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_prop_1564_onprep_27/	lineattrs = (color=purple thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_27 	upper=p95_prop_1564_onprep_27  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_prep_ever_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_prep_ever_1 	upper=p95_n_prep_ever_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_w1524newpge1_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_w1524newpge1_onprep_1 	upper=p95_p_w1524newpge1_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_prevalence_hiv_preg_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prevalence_hiv_preg_1 	upper=p95_prevalence_hiv_preg_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__19/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__19 	upper=p95_incidence1549__19  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__20/	lineattrs = (color=lightgreen thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__20 	upper=p95_incidence1549__20  / transparency=0.9 fillattrs = (color=LIGHTgreen) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__21/	lineattrs = (color=darkgreen thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__21 	upper=p95_incidence1549__21  / transparency=0.9 fillattrs = (color=darkgreen) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__22/	lineattrs = (color=verydarkgreen thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__22 	upper=p95_incidence1549__22  / transparency=0.9 fillattrs = (color=verydarkgreen) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__23/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__23 	upper=p95_incidence1549__23  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__24/	lineattrs = (color=lightgreen thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__24 	upper=p95_incidence1549__24  / transparency=0.9 fillattrs = (color=LIGHTgreen) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__25/	lineattrs = (color=darkgreen thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__25 	upper=p95_incidence1549__25  / transparency=0.9 fillattrs = (color=darkgreen) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_incidence1549__26/	lineattrs = (color=verydarkgreen thickness = 2);*/
/*band    x=cald lower=p5_incidence1549__26 	upper=p95_incidence1549__26  / transparency=0.9 fillattrs = (color=verydarkgreen) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_new_inf1549__1/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_n_new_inf1549__1 	upper=p95_n_new_inf1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
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
label o_p_diag_m1549_dhs = "DHS - 15-49";
label o_p_diag_1564m_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15pl_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_p_diag_m_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_diag_m_15 	upper=p95_p_diag_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
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
label o_p_diag_w1549_dhs = "DHS - 15-49";
label o_p_diag_1564w_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15plw_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_p_diag_w_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_p_diag_w_15 	upper=p95_p_diag_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
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
/*series  x=cald y=p50_p_diag_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_diag_1 	upper=p95_p_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_art_start_y_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_art_start_y_1 	upper=p95_n_art_start_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_pmtct_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_pmtct_1 	upper=p95_n_pmtct_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_vg1000_all_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_vg1000_all_1 	upper=p95_p_vg1000_all_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
/**series  x=cald y=p50_p_onart_m_15/	lineattrs = (color=green thickness = 2);*/
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
/*series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_cm_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_cm_1 	upper=p95_n_cm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_vm_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_vm_1 	upper=p95_n_vm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_p_adh_hi_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_adh_hi_1 	upper=p95_p_adh_hi_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;quit;


proc sgplot data=d_a; 
Title    height=1.5 justify=center "Proportion with low adherence";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_adh_lo_0 = "Status quo  (median)";
label p50_p_adh_lo_1 = "Minimal  (median)";
series  x=cald y=p50_p_adh_lo_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_adh_lo_0 	upper=p95_p_adh_lo_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_p_adh_lo_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_p_adh_lo_1 	upper=p95_p_adh_lo_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_pcp_p_1/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_pcp_p_1 	upper=p95_n_pcp_p_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_n_pcp_p_15/	lineattrs = (color=green thickness = 2);
*band    x=cald lower=p5_n_pcp_p_15 	upper=p95_n_pcp_p_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;





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
/*series  x=cald y=p50_n_tested_1/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
/*/*series  x=cald y=p50_n_tested_11/	lineattrs = (color=red thickness = 2);*/*/
/*/*band    x=cald lower=p5_n_tested_11 upper=p95_n_tested_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/*/
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
scatter  x=cald y=o_s_tested_1549_py_garcpr/	markerattrs = (color=blue ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  4000000 by 500000) valueattrs=(size=10);*2500000 if stopping in 2023;
label p50_n_tested_w_0  = "Status quo (median) - 15+";
label p50_n_tested_w_1  = "Minimal (median) - 15+";
label p50_n_tested_w_11 = "Minimal+SBCC (median) - 15+";
series  x=cald y=p50_n_tested_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_0 	upper=p95_n_tested_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_tested_w_1/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_n_tested_w_1 	upper=p95_n_tested_w_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_w_11/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_w_11 	upper=p95_n_tested_w_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
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
/*series  x=cald y=p50_n_tested_m_1/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_n_tested_m_1 	upper=p95_n_tested_m_1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
/*series  x=cald y=p50_n_tested_m_11/	lineattrs = (color=red thickness = 2);*/
/*band    x=cald lower=p5_n_tested_m_11 	upper=p95_n_tested_m_11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";*/
run;quit;


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
/*series  x=cald y=p50_n_new_inf1549__1/	lineattrs = (color=blue thickness = 2);*/
/*band    x=cald lower=p5_n_new_inf1549__1 	upper=p95_n_new_inf1549__1  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";*/
*series  x=cald y=p50_n_new_inf1549__11/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_new_inf1549__11 	upper=p95_n_new_inf1549__11  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
/*series  x=cald y=p50_n_new_inf1549__12/	lineattrs = (color=green thickness = 2);*/
/*band    x=cald lower=p5_n_new_inf1549__12 	upper=p95_n_new_inf1549__12  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";*/
run;quit;


* MSM;
ods html ;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence in MSM";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.3 by 0.05) valueattrs=(size=10);

series  x=cald y=mean_prevalence_msm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_msm_0 	upper=p95_prevalence_msm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";


run;quit;

ods html close;



ods rtf close;run;







