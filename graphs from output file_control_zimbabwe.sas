
***Program to produce graphs using averages across runs
***Use include statement in analysis program to read the code below in;

libname a "C:\Users\rmjlja9\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe\hiv_control_zim_20250508_out\";
/*libname a "C:\Users\rmjlja9\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe";*/

proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";
proc freq data=a.long_zim_control;table option;run;

%let pth_export_hiv_control= C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe;run;

%let year_start = 1990;
%let year_end = 2050;


data b;
set a.long_zim_control;

p_onart_vl1000_all = .;



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




proc sort data=b; by option cald run ;run;
proc freq data=b; table cald option;run;

proc print data=b; var option cald count_csim;run;
*At the moment is the median across all runs by option;
*Note that we need the same number of simulations/runs from each dataset;
data b;set b;count_csim+1;by option cald ;if first.cald then count_csim=1;run;***counts the number of runs;
 ***number of runs - this is manually inputted in nfit in the macros below;

proc means max data=b;var count_csim cald;run;*108;

/*proc freq data=b;table cald;run;*/

proc sort;by cald option ;run;

*INCLUDE ONLY STOCK VARIABLE AND VARIABLES THAT WE WANT TO GRAPH;
%let var =  
n_alive n_alive_m n_alive_w n_alive_1014m n_alive_1524m n_alive_1524w n_alive_2549m n_alive_2549w n_alive_55plm n_alive_55plw n_alive0_
n_alive_014_ 	n_alive_1524_	 n_alive_2564_		n_alive_65pl									
n_sw_1564_		prev_sti_sw  n_sw_program_visit n_sw_inprog_ly  /*n_sw_inprog_ever*/ n_diag_sw_inprog
prop_sw_program_visit n_diag_progsw n_diag_sw
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
n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w n_hiv_sw
prevalence1549m prevalence1549w
prevalence1549_ prevalence_sw prevalence_hiv_preg prevalence1549preg prevalence1524preg prevalence_vg1000_  incidence1549_ incidence1549m incidence1549w incidence1564_ 
incidence1524w incidence1524m incidence2534w incidence2534m incidence3544w incidence3544m incidence4554w incidence4554m 
incidence5564w incidence5564m incidence_sw 
n_new_inf1549_ n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w n_new_inf55plm n_new_inf55plw
n_tested n_tested_m n_tested_w n_tested_sw n_tested_as_sw n_tested_swprog n_tested_anc 
n_tested_m_sympt n_tested_w_sympt n_tested_m_sympt_test n_tested_w_sympt_test
n_tested_m_circ n_tested_symptoms_not_hiv n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd
n_tested_tb n_tested_general n_tested_startprep n_tested_onprep n_tested_rsprep n_tested_prep
n_tested1st_anc n_tested1st_labdel n_tested1st_pd n_tested_anc_prevdiag
n_self_tested 	n_self_tested_m  n_self_tested_w  n_tested_due_to_st n_diagnosed_self_test			
n_sbcc_visit_1524m 	n_sbcc_visit_1524w n_sbcc_visit_1524_	n_sbcc_visit_2564_ n_sbcc_visit_1564_
n_tested_sbcc_1524m n_tested_sbcc_1524w n_tested_sbcc_2564_ n_tested_sbcc
p_tested_sbcc_1524m p_tested_sbcc_1524w p_tested_sbcc_2564_ p_pos_tested_sbcc
n_hivpos_tests n_hivneg_tests n_hivpos_tests_sympt n_hivneg_tests_sympt
p_anc n_diagnosed n_diag_anc n_diag_labdel n_diag_pd n_diag_sympt n_diag_self_test
n_diag_ever_m n_diag_ever_w
test_prop_positive test_proppos_sympt overall_test_yield
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
p_births_hiv_vlg1000_
n_attend_mens_clinic  n_hiv_mens_clinic  n_diag_mens_clinic  n_onart_mens_clinic
n_access_adolescent_supp  n_hiv_adolescent_supp  s_diag_adolescent_supp  n_onart_adolescent_supp  n_vls_adolescent_supp
n_access_adult_adh_supp  n_hiv_adult_adh_supp  s_diag_adult_adh_supp  n_onart_adult_adh_supp  n_vls_adult_adh_supp
n_access_adult_ret_supp  n_hiv_adult_ret_supp  s_diag_adult_ret_supp  n_onart_adult_ret_supp 
p_adh_hi p_adh_lo

;
run;


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
%let nfit=108;
%option_(0);
run;


data d; * this is number of variables in %let var = above ;
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
g0_276 g0_277 g0_278 g0_279 g0_280 g0_281 g0_282 g0_283 g0_284 g0_285 g0_286 g0_287 g0_288 g0_289 g0_290 g0_291 g0_292 g0_293 g0_294 g0_295 g0_296 g0_297 g0_298 g0_299 g0_300 
g0_301 g0_302 g0_303 g0_304 g0_305 g0_306 g0_307 g0_308 g0_309 g0_310 g0_311 g0_312 g0_313 g0_314

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

proc freq data=d;table 
	mean_n_prep_inj_sdc_27
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


* TYPES OF TESTING;

* From code, in order of appearance:
tested_tb 				--> n_tested_tb
tested_circ 			--> n_tested_m_circ (should be same as tested_m_circ below)
tested_symptoms_not_hiv --> n_tested_symptoms_not_hiv
tested_anc
tested_labdel
tested_pd
tested_due_to_self_test
tested_as_sw
tested_general
testfor_prep_any (testfor_prep_oral, testfor_prep_inj, testfor_prep_vr)
tested_onprep_any
tested_rsprep_any
tested_sbcc_program
tested_sympt

* Extra outputs in code:
Men
tested_m   				if gender=1 and tested=1 then tested_m=1
tested_m_sympt			if gender=1 and tested=1 and (elig_test_who4_tested=1 or elig_test_non_tb_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1) then tested_m_sympt=1
tested_m_sympt_test		if gender=1 and tested=1 and tested_sympt=1 then tested_m_sympt_test=1
tested_m_circ 			if gender=1 and tested=1 and tested_circ=1 then tested_m_circ=1

Women
 allocation of tests in women - 1 anc  2 symptoms  3  sw
tested_f				if gender=2 and tested=1 then tested_f=1
tested_f_anc			if gender=2 and tested=1 and tested_anc = 1 then tested_f_anc=1
tested_f_sympt			if gender=2 and tested=1 and (elig_test_who4_tested=1 or elig_test_non_tb_who3_tested=1 or elig_test_tb_tested=1 or tested_symptoms_not_hiv=1) and tested_anc ne 1 then tested_f_sympt=1
tested_f_sympt_test		if gender=2 and tested=1 and tested_sympt=1 then tested_f_sympt_test=1
tested_f_progsw			if gender=2 and tested=1 and tested_as_sw=1 and tested_anc ne 1 and tested_labdel ne 1 and tested_pd ne 1 and (elig_test_who4_tested ne 1 and elig_test_non_tb_who3_tested ne 1 and elig_test_tb_tested ne 1 and tested_symptoms_not_hiv ne 1) then tested_f_progsw=1
tested_f_non_anc		if gender=2 and tested=1 and tested_anc ne 1 then tested_f_non_anc=1

The following applies only at 1 point in time as I wasnt to know the number of women tested
tested_ancpd			if dt_lastbirth=caldate&j-0.25 and (tested_pd=1 or (dt_last_test ne . and dt_lastbirth ne . and dt_lastbirth-0.75 lt dt_last_test le dt_lastbirth)) then tested_ancpd=1
test_anclabpd			if gender=2 and tested=1 and (tested_anc = 1 or tested_labdel=1 or tested_pd=1) then test_anclabpd=1
tested_1524w			if gender=2 and tested=1 and 15 <= age < 25 then tested_1524w=1

tested_at_return is when a previously diagnosed person returns to care - these can be added when summing positive tests
tested_at_return		if return = 1 then tested_at_return=1
;




* SQ;
proc print data=d;
var  				
	p50_n_tested_0
 	p50_n_tested_w_0
	p50_n_tested_m_0
	p50_n_tested_m_circ_0
	p50_n_tested_m_sympt_0
	p50_n_tested_w_sympt_0
	p50_n_tested_anc_0 			
	p50_n_tested_w_labdel_0		
	p50_n_tested_w_pd_0 		
	p50_n_tested_sw_0
	p50_n_tested_swprog_0
	p50_n_tested_tb_0
	p50_n_tested_general_0
	p50_n_tested_startprep_0
	p50_n_tested_onprep_0
	p50_n_tested_rsprep_0
	p50_n_tested_prep_0
;
where cald in (2030);run;

* Minimal;
proc print data=d;
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









***Graphs comparing observed data to outputs for Status quo 1 and 15;
*Taken from Zim graphs in branch Death cascade;
ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
/*ods rtf file = 'C:\Users\Valentina\UCL Dropbox\Valentina Cambiano\MIHPSA Zimbabwe\Synthesis Findings\V21_20240523_from2023_100sim.doc' startpage=never; */
ods rtf file = 'C:\Users\rmjlja9\OneDrive - University College London\MIHPSA Zimbabwe\Phase 2\2025MAR24\graphs_20250324.doc' startpage=never;


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



* ----------- ;
* --- FSW --- ;
* ----------- ;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of current female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Status quo (median) ";
label p50_prop_w_1549_sw_1 = "Minimal (median) ";
label p50_prop_w_1549_sw_8 = "Option 8 (FSW program) (median) ";
label p50_prop_w_1549_sw_33 = "Option 33 (cehck PrEP) (median) ";
label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_8 	upper=p95_prop_w_1549_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_33 	upper=p95_prop_w_1549_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";
label p50_prop_sw_hiv_8 = "FSW with HIV 15-64 op 8 (median) ";
label p50_prop_sw_hiv_33 = "FSW with HIV 15-64 op 33 (median) ";
label o_prev_fsw_dw = "David Wilson";
label o_prev_fsw_rdshm = "RDS Hwange and Mutare";
label o_prev_fsw_rdsvf = "RDS Victoria Falls";
label o_prev_fsw_tested_swvp = "Sisters with a Voice";
label o_prev_fsw_rds = "RDS Status quo SAPPH-IRe";
series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_8 	upper=p95_prop_sw_hiv_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_33 	upper=p95_prop_sw_hiv_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
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
label p50_n_tested_sw_8  = "Number of FSW tested op 8 (median) ";
label p50_n_tested_sw_33  = "Number of FSW tested op 33 (median) ";
series  x=cald y=p50_n_tested_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_0 	upper=p95_n_tested_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_1 	upper=p95_n_tested_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_sw_8 	upper=p95_n_tested_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_tested_sw_33 	upper=p95_n_tested_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;
* Options 8 (original FSW) and 33 (FSW prep reset to FSW program level) give same numbers of FSW being tested overall;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW tested as SW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e4 by 2e3) valueattrs=(size=10);
label p50_n_tested_as_sw_0  = "Number of FSW tested as SW op 0 (median) ";
label p50_n_tested_as_sw_1  = "Number of FSW tested as SW op 1 (median) ";
label p50_n_tested_as_sw_8  = "Number of FSW tested as SW op 8 (median) ";
label p50_n_tested_as_sw_33  = "Number of FSW tested as SW op 33 (median) ";
series  x=cald y=p50_n_tested_as_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_as_sw_0 	upper=p95_n_tested_as_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_as_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_as_sw_1 	upper=p95_n_tested_as_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_as_sw_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_as_sw_8 	upper=p95_n_tested_as_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_as_sw_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_tested_as_sw_33 	upper=p95_n_tested_as_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;
* Check if Options 8 and 33 both restore testing among FSW to almost SQ level;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW tested due to SW program";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_tested_swprog_0  = "Number of FSW tested due to SW program op 0 (median) ";
label p50_n_tested_swprog_1  = "Number of FSW tested due to SW program op 1 (median) ";
label p50_n_tested_swprog_8  = "Number of FSW tested due to SW program op 8 (median) ";
label p50_n_tested_swprog_33  = "Number of FSW tested due to SW program op 33 (median) ";
series  x=cald y=p50_n_tested_swprog_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_swprog_0 	upper=p95_n_tested_swprog_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_swprog_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_swprog_1 	upper=p95_n_tested_swprog_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_swprog_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_swprog_8 	upper=p95_n_tested_swprog_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_swprog_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_tested_swprog_33 	upper=p95_n_tested_swprog_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;
* Check if Options 8 and 33 both restore testing among FSW to almost SQ level;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of FSW who visited the progam this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_program_visit_0  = "Prop of FSW with program visit op 0 (median) ";
label p50_prop_sw_program_visit_1  = "Prop of FSW with program visit op 1 (median) ";
label p50_prop_sw_program_visit_8  = "Prop of FSW with program visit op 8 (median) ";
label p50_prop_sw_program_visit_33  = "Prop of FSW with program visit op 33 (median) ";
series  x=cald y=p50_prop_sw_program_visit_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_0 	upper=p95_prop_sw_program_visit_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_program_visit_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_1 	upper=p95_prop_sw_program_visit_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_program_visit_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_8 	upper=p95_prop_sw_program_visit_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_program_visit_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prop_sw_program_visit_33 	upper=p95_prop_sw_program_visit_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;
* Check if Options 8 and 33 both restore value to SQ level;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of FSW in SW program in past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_sw_inprog_ly_0  = "Number of FSW in SW program in past year op 0 (median) ";
label p50_n_sw_inprog_ly_1  = "Number of FSW in SW program in past year op 1 (median) ";
label p50_n_sw_inprog_ly_8  = "Number of FSW in SW program in past year op 8 (median) ";
label p50_n_sw_inprog_ly_33  = "Number of FSW in SW program in past year op 33 (median) ";
series  x=cald y=p50_n_sw_inprog_ly_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_0 	upper=p95_n_sw_inprog_ly_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_inprog_ly_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_1 	upper=p95_n_sw_inprog_ly_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_inprog_ly_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_8 	upper=p95_n_sw_inprog_ly_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_inprog_ly_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_sw_inprog_ly_33 	upper=p95_n_sw_inprog_ly_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;
**CHECK IF THIS OUTPUT NOW WORKING - SQ value restored in op 8 and 33;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of SW program visits in past year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 2e5 by 2e4)*/ valueattrs=(size=10);
label p50_n_sw_program_visit_0  = "Number of SW program visits in past year op 0 (median) ";
label p50_n_sw_program_visit_1  = "Number of SW program visits in past year op 1 (median) ";
label p50_n_sw_program_visit_8  = "Number of SW program visits in past year op 8 (median) ";
label p50_n_sw_program_visit_33  = "Number of SW program visits in past year op 33 (median) ";
series  x=cald y=p50_n_sw_program_visit_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_0 	upper=p95_n_sw_program_visit_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_program_visit_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_1 	upper=p95_n_sw_program_visit_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_program_visit_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_8 	upper=p95_n_sw_program_visit_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_sw_program_visit_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_sw_program_visit_33 	upper=p95_n_sw_program_visit_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
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
label p50_n_prep_33  = "Total on PrEP op 33 (median) ";
series  x=cald y=p50_n_prep_oral_sw_0/	lineattrs = (color=black thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_0 	upper=p95_n_prep_oral_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_1/	lineattrs = (color=red thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_1 	upper=p95_n_prep_oral_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_8/	lineattrs = (color=green thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_8 	upper=p95_n_prep_oral_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_oral_sw_33/	lineattrs = (color=purple thickness = 2 pattern=solid);
band    x=cald lower=p5_n_prep_oral_sw_33 	upper=p95_n_prep_oral_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
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
label p50_p_diag_sw_1  = "Prop of HIV+ FSW diagnosed op 1 (median) ";
label p50_p_diag_sw_8  = "Prop of HIV+ FSW diagnosed op 8 (median) ";
label p50_p_diag_sw_33  = "Prop of HIV+ FSW diagnosed op 33 (median) ";
series  x=cald y=p50_p_diag_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_sw_0 	upper=p95_p_diag_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_sw_1 	upper=p95_p_diag_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_sw_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_sw_8 	upper=p95_p_diag_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_sw_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_p_diag_sw_33 	upper=p95_p_diag_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number SW diagnosed this period due to FSW program";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 2e4 by 2e3) valueattrs=(size=10);
label p50_n_diag_progsw_0  = "Number SW diagnosed this period by program op 0 (median) ";
label p50_n_diag_progsw_1  = "Number SW diagnosed this period by program op 1 (median) ";
label p50_n_diag_progsw_8  = "Number SW diagnosed this period by program op 8 (median) ";
label p50_n_diag_progsw_33  = "Number SW diagnosed this period by program op 33 (median) ";
series  x=cald y=p50_n_diag_progsw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_progsw_0 	upper=p95_n_diag_progsw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_progsw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diag_progsw_1 	upper=p95_n_diag_progsw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_progsw_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_diag_progsw_8 	upper=p95_n_diag_progsw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_progsw_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_diag_progsw_33 	upper=p95_n_diag_progsw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
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
Title    height=1.5 justify=center "Incidence FSW";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2000 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 20 by 1) valueattrs=(size=10);
label p50_incidence_sw_0 = "Status quo (median) ";
label p50_incidence_sw_1 = "Minimal (median) ";
label p50_incidence_sw_8 = "Option 8 (median) ";
label p50_incidence_sw_33 = "Option 33 (median) ";
series  x=cald y=p50_incidence_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence_sw_0 	upper=p95_incidence_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence_sw_1 	upper=p95_incidence_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence_sw_8/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence_sw_8 	upper=p95_incidence_sw_8  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence_sw_33/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_incidence_sw_33 	upper=p95_incidence_sw_33  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
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
label o_p_diag_m1549_dhs = "DHS - 15-49";
label o_p_diag_1564m_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15pl_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
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
series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
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




*** Checking mens clinics, ART support interventions at higher uptake;
* (options 32, 38-40 vs 12, 28-30);

*** Mens clinics (op 12 and 32);
* HIV incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49) - median";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__12 = "Mens clinics 5%";
label p50_incidence1549__32 = "Mens clinics 40%";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_incidence1549__12/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_incidence1549__32/	lineattrs = (color=blue thickness = 2 );
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49) - mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label mean_incidence1549__0 = "Status quo (median) ";
label mean_incidence1549__1  = "Min (median)";
label mean_incidence1549__12 = "Mens clinics 5%";
label mean_incidence1549__32 = "Mens clinics 40%";
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=red thickness = 2);
series  x=cald y=mean_incidence1549__12/	lineattrs = (color=green thickness = 2);
series  x=cald y=mean_incidence1549__32/	lineattrs = (color=blue thickness = 2 );
run;
quit;


* Proportion on ART - men;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART - median";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_p_onart_m_0 = "Status quo (median) ";
label p50_p_onart_m_1  = "Min (median)";
label p50_p_onart_m_12 = "Mens clinics 5%";
label p50_p_onart_m_32 = "Mens clinics 40%";
series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_p_onart_m_12/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_p_onart_m_32/	lineattrs = (color=blue thickness = 2 );
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART - mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label mean_p_onart_m_0 = "Status quo (median) ";
label mean_p_onart_m_1  = "Min (median)";
label mean_p_onart_m_12 = "Mens clinics 5%";
label mean_p_onart_m_32 = "Mens clinics 40%";
series  x=cald y=mean_p_onart_m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=mean_p_onart_m_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=mean_p_onart_m_12/	lineattrs = (color=green thickness = 2);
series  x=cald y=mean_p_onart_m_32/	lineattrs = (color=blue thickness = 2 );
run;
quit;


*Number on ART - men;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART - median";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_n_onart_m_0 = "Status quo (median) ";
label p50_n_onart_m_1  = "Min (median)";
label p50_n_onart_m_12 = "Mens clinics 5%";
label p50_n_onart_m_32 = "Mens clinics 40%";
series  x=cald y=p50_n_onart_m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_n_onart_m_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_n_onart_m_12/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_n_onart_m_32/	lineattrs = (color=blue thickness = 2 );
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART - mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label mean_n_onart_m_0 = "Status quo (median) ";
label mean_n_onart_m_1  = "Min (median)";
label mean_n_onart_m_12 = "Mens clinics 5%";
label mean_n_onart_m_32 = "Mens clinics 40%";
series  x=cald y=mean_n_onart_m_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=mean_n_onart_m_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=mean_n_onart_m_12/	lineattrs = (color=green thickness = 2);
series  x=cald y=mean_n_onart_m_32/	lineattrs = (color=blue thickness = 2 );
run;
quit;



*** Adolescent ART support (op 28 and 38);
* HIV incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__28 = "Adolescent support 15%";
label p50_incidence1549__38 = "Adolescent support 40%";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_incidence1549__28/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_incidence1549__38/	lineattrs = (color=blue thickness = 2 );
run;
quit;

* Proportion on ART - 15-24;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_p_onart_1524__0 = "Status quo (median) ";
label p50_p_onart_1524__1  = "Min (median)";
label p50_p_onart_1524__28 = "Adolescent support 15%";
label p50_p_onart_1524__38 = "Adolescent support 40%";
series  x=cald y=p50_p_onart_1524__0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_p_onart_1524__1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_p_onart_1524__28/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_p_onart_1524__38/	lineattrs = (color=blue thickness = 2 );
run;
quit;



*** Adult adherence support (op 29 and 39);
* HIV incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__29 = "Adult adherence support 15%";
label p50_incidence1549__39 = "Adult adherence support 40%";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_incidence1549__29/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_incidence1549__39/	lineattrs = (color=blue thickness = 2 );
run;
quit;

* Proportion on ART;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_p_onart_0 = "Status quo (median) ";
label p50_p_onart_1  = "Min (median)";
label p50_p_onart_29 = "Adult adherence support 15%";
label p50_p_onart_39 = "Adult adherence support 40%";
series  x=cald y=p50_p_onart_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_p_onart_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_p_onart_29/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_p_onart_39/	lineattrs = (color=blue thickness = 2 );
run;
quit;



* Adult retention support (op 30 and 40);
* Number receiving intervention - n_access_adult_ret_supp;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number accessing intervention";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_n_access_adult_ret_supp_0 = "Status quo (median) ";
label p50_n_access_adult_ret_supp_1  = "Min (median)";
label p50_n_access_adult_ret_supp_30 = "Adult retention support 15%";
label p50_n_access_adult_ret_supp_40 = "Adult retention support 40%";
series  x=cald y=p50_n_access_adult_ret_supp_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_n_access_adult_ret_supp_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_n_access_adult_ret_supp_30/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_n_access_adult_ret_supp_40/	lineattrs = (color=blue thickness = 2 );
run;
quit;

* Number on ART who have received intervention - n_onart_adult_ret_supp;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART who have accessed intervention";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_n_onart_adult_ret_supp_0 = "Status quo (median) ";
label p50_n_onart_adult_ret_supp_1  = "Min (median)";
label p50_n_onart_adult_ret_supp_30 = "Adult retention support 15%";
label p50_n_onart_adult_ret_supp_40 = "Adult retention support 40%";
series  x=cald y=p50_n_onart_adult_ret_supp_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_n_onart_adult_ret_supp_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_n_onart_adult_ret_supp_30/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_n_onart_adult_ret_supp_40/	lineattrs = (color=blue thickness = 2 );
run;
quit;

* HIV incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence - median (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_incidence1549__0 = "Status quo (median) ";
label p50_incidence1549__1  = "Min (median)";
label p50_incidence1549__30 = "Adult retention support 15%";
label p50_incidence1549__40 = "Adult retention support 40%";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_incidence1549__30/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_incidence1549__40/	lineattrs = (color=blue thickness = 2 );
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence - mean (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label mean_incidence1549__0 = "Status quo (median) ";
label mean_incidence1549__1  = "Min (median)";
label mean_incidence1549__30 = "Adult retention support 15%";
label mean_incidence1549__40 = "Adult retention support 40%";
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=red thickness = 2);
series  x=cald y=mean_incidence1549__30/	lineattrs = (color=green thickness = 2);
series  x=cald y=mean_incidence1549__40/	lineattrs = (color=blue thickness = 2 );
run;
quit;

* Proportion on ART;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART - median";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label p50_p_onart_0 = "Status quo (median) ";
label p50_p_onart_1  = "Min (median)";
label p50_p_onart_30 = "Adult retention support 15%";
label p50_p_onart_40 = "Adult retention support 40%";
series  x=cald y=p50_p_onart_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=p50_p_onart_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=p50_p_onart_30/	lineattrs = (color=green thickness = 2);
series  x=cald y=p50_p_onart_40/	lineattrs = (color=blue thickness = 2 );
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART - mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  /*values = (0 to 0.8 by 0.2)*/ valueattrs=(size=10);
label mean_p_onart_0 = "Status quo (median) ";
label mean_p_onart_1  = "Min (median)";
label mean_p_onart_30 = "Adult retention support 15%";
label mean_p_onart_40 = "Adult retention support 40%";
series  x=cald y=mean_p_onart_0/	lineattrs = (color=black thickness = 2);
series  x=cald y=mean_p_onart_1/	lineattrs = (color=red thickness = 2);
series  x=cald y=mean_p_onart_30/	lineattrs = (color=green thickness = 2);
series  x=cald y=mean_p_onart_40/	lineattrs = (color=blue thickness = 2 );
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
rename mean_prevalence1549m_&o = HIVprev_M1549_M;
rename p5_prevalence1549m_&o  = HIVprev_M1549_95LL;
rename p95_prevalence1549m_&o = HIVprev_M1549_95UL;
rename mean_prevalence1549w_&o = HIVprev_F1549_M;
rename p5_prevalence1549w_&o  = HIVprev_F1549_95LL;
rename p95_prevalence1549w_&o = HIVprev_F1549_95UL;
rename mean_prevalence1549__&o  = HIVprev_A1549_M;
rename p5_prevalence1549__&o   = HIVprev_A1549_95LL;
rename p95_prevalence1549__&o  = HIVprev_A1549_95UL;

rename mean_prevalence1549preg_&o = HIVprev_pregF1549_M;
rename p5_prevalence1549preg_&o  = HIVprev_pregF1549_95LL;
rename p95_prevalence1549preg_&o = HIVprev_pregF1549_95UL;
rename mean_prevalence1524w_&o = HIVprev_F1524_M;
rename p5_prevalence1524w_&o  = HIVprev_F1524_95LL;
rename p95_prevalence1524w_&o = HIVprev_F1524_95UL;
rename mean_prevalence_sw_&o = HIVprev_FSW1599_M;
rename p5_prevalence_sw_&o  = HIVprev_FSW1599_95LL;
rename p95_prevalence_sw_&o = HIVprev_FSW1599_95UL;

rename mean_n_alive_m_&o = NAlive_M1599_M;
rename p5_n_alive_m_&o  = NAlive_M1599_95LL;
rename p95_n_alive_m_&o = NAlive_M1599_95UL;
rename mean_n_alive_w_&o = NAlive_F1599_M;
rename p5_n_alive_w_&o  = NAlive_F1599_95LL;
rename p95_n_alive_w_&o = NAlive_F1599_95UL;
rename mean_n_alive_1524m_&o = NAlive_M1524_M;
rename mean_n_alive_1524w_&o = NAlive_F1524_M;
rename mean_n_alive_2549m_&o = NAlive_M2549_M;
rename mean_n_alive_2549w_&o = NAlive_F2549_M;
rename mean_n_sw_1564__&o = NAlive_FSW1599_M;
rename p5_n_sw_1564__&o  = NAlive_FSW1599_95LL;
rename p95_n_sw_1564__&o = NAlive_FSW1599_95UL;
rename mean_n_hivneg_sdpartner_&o = Nalive_NEGInSDA1599_M;*Number of HIV-negative  adults 15+ years old in a sero-discordant relationship;
rename mean_n_hivneg_sdpartneroffart_&o = Nalive_NEGInSDNotOnARTA1599_M;*Number of HIV-negative  adults 15+ years old in a sero-discordant relationship, whom partner is not on ART;
rename mean_n_hivnegw_sdpartner_&o = Nalive_NEGInSDF1599_M;
rename mean_n_hivnegw_sdpartneroffart_&o = Nalive_NEGInSDNotOnARTF1599_M;

rename mean_n_hivge15m_&o = NHIV_M1599_M;
rename p5_n_hivge15m_&o  = NHIV_M1599_95LL;
rename p95_n_hivge15m_&o = NHIV_M1599_95UL;
rename mean_n_hivge15w_&o = NHIV_F1599_M;
rename p5_n_hivge15w_&o  = NHIV_F1599_95LL;
rename p95_n_hivge15w_&o = NHIV_F1599_95UL;
rename mean_n_hiv1524m_&o = NHIV_M1524_M;
rename mean_n_hiv1524w_&o = NHIV_F1524_M;
rename mean_n_hiv2549m_&o = NHIV_M2549_M;
rename mean_n_hiv2549w_&o = NHIV_F2549_M;
rename mean_n_hiv_sw_&o = NHIV_FSW1599_M;
rename p5_n_hiv_sw_&o  = NHIV_FSW1599_LL;
rename p95_n_hiv_sw_&o = NHIV_FSW1599_UL;

rename mean_n_not_on_art_cd4ge500__&o = NHIV_A1599_NoART_CD4500pl_M;
rename mean_n_not_on_art_cd4350500__&o = NHIV_A1599_NoART_CD4350499_M;
rename mean_n_not_on_art_cd4200350__&o = NHIV_A1599_NoART_CD4200349_M;
rename mean_n_not_on_art_cd450200__&o = NHIV_A1599_NoART_CD450199_M;
rename mean_n_not_on_art_cd4050__&o = NHIV_A1599_NoART_CD4050_M;
   
rename mean_n_asympt_Undiag_&o = NHIV_A1599_Asympt_Undiag_M;
rename mean_n_asympt_diagoffart_&o = NHIV_A1599_Asympt_Diag_NoART_M;
rename mean_n_asympt_diagonart_&o = NHIV_A1599_Asympt_Diag_ART_M;
rename mean_n_sympt_notaids_&o = NHIV_A1599_Sympt_NOAIDS_M;
rename mean_n_sympt_aids_&o = NHIV_A1599_Sympt_AIDS_M;

rename mean_p_diag_&o = P_DIAG_A1599_M;
rename p5_p_diag_&o  = P_DIAG_A1599_95LL;
rename p95_p_diag_&o = P_DIAG_A1599_95UL;
rename mean_p_diag_m_&o = P_DIAG_M1599_M;
rename p5_p_diag_m_&o  = P_DIAG_M1599_95LL;
rename p95_p_diag_m_&o = P_DIAG_M1599_95UL;
rename mean_p_diag_w_&o = P_DIAG_F1599_M;
rename p5_p_diag_w_&o  = P_DIAG_F1599_95LL;
rename p95_p_diag_w_&o = P_DIAG_F1599_95UL;
rename mean_p_diag_m1524__&o = P_DIAG_M1524_M;
rename mean_p_diag_w1524__&o = P_DIAG_F1524_M;
rename mean_p_diag_sw_&o = P_DIAG_FSW1599_M;

*Some variables about sexual behaviour cannot be produce by the Synthesis model;
rename mean_p_m_npge1__&o = P_CLS3m_M1599_M;
rename mean_p_w_npge1__&o = P_CLS3m_F1599_M;
rename mean_p_w1524_npge1__&o = P_CLS3m_F1524_M;
rename mean_p_sw_npge1__&o = P_CLS3m_FSW_M;

rename mean_prev_sti_sw_&o = P_STI_FSW1599_M;

rename n_w1524_newp_ge1_ = NAlive_ElevRiskF1524_M;
rename p_w1524newpge1_onprep = P_TDFPrEP_ElevRiskF1524_M;
*VARIABLES TO BE ADDED HERE ONCE WE HAVE CREATED THEM IN CREATE_WIDE_FILE;
/*NAlive_FPregBirthBF1599_M*/
/*P_TDFPrEP_FPregBirthBF1599_M*/
/*P_DPVPrEP_ElevRiskF1524_M*/
/*P_DPVPrEP_FPregBirthBF1599_M*/
/*P_CABPrEP_ElevRiskF1524_M*/
/*P_CABPrEP_FPregBirthBF1599_M*/

rename mean_p_mcirc_1549m_&o = CIRC_PREV_M1549_M;
rename p5_p_mcirc_1549m_&o  = CIRC_PREV_M1549_95LL;
rename p95_p_mcirc_1549m_&o = CIRC_PREV_M1549_95UL;

rename mean_n_onart_m_&o = NOnART_M1599_M;
rename p5_n_onart_m_&o  = NOnART_M1599_95LL;
rename p95_n_onart_m_&o = NOnART_M1599_95UL;
rename mean_n_onart_w_&o = NOnART_F1599_M;
rename p5_n_onart_w_&o  = NOnART_F1599_95LL;
rename p95_n_onart_w_&o = NOnART_F1599_95UL;
rename mean_n_onart_1524__&o = NOnART_A1524_M;
rename p5_n_onart_1524__&o  = NOnART_A1524_95LL;
rename p95_n_onart_1524__&o = NOnART_A1524_95UL;
rename mean_n_onart_&o = NOnART_A1599_M;
rename p5_n_onart_&o  = NOnART_A1599_95LL;
rename p95_n_onart_&o = NOnART_A1599_95UL;

rename mean_p_onart_diag_m_&o = P_onART_DiagM1599_M;
rename p5_p_onart_diag_m_&o  = P_onART_DiagM1599_95LL;
rename p95_p_onart_diag_m_&o = P_onART_DiagM1599_95UL;
rename mean_p_onart_diag_w_&o = P_onART_DiagF1599_M;
rename p5_p_onart_diag_w_&o  = P_onART_DiagF1599_95LL;
rename p95_p_onart_diag_w_&o = P_onART_DiagF1599_95UL;
rename mean_p_onart_diag_w1524__&o = P_onART_DiagF1524_M;
rename mean_p_onart_diag_1524__&o = P_onART_DiagA1524_M;
rename p5_p_onart_diag_1524__&o  = P_onART_DiagA1524_95LL;
rename p95_p_onart_diag_1524__&o = P_onART_DiagA1524_95UL;
rename mean_p_onart_diag_&o = P_onART_DiagA1599_M;
rename p5_p_onart_diag_&o = P_onART_DiagA1599_95LL;
rename p95_p_onart_diag_&o = P_onART_DiagA1599_95UL;
rename mean_p_onart_diag_sw_&o = P_onART_DiagFSW1599_M;

*% of individuals 15+ years old diagnosed 12 months ago with AHD on ART;
*rename mean__&o = P_onART_Diag12mAHDA1599_M;
*% of individuals 15+ years old diagnosed 12 months ago without AHD on ART;
*rename _&o = P_onART_Diag12mNOAHDA1599_M;
*% of individuals 15-24 years old diagnosed 12 months ago with AHD on ART;
*rename _&o = P_onART_Diag12mAHDA1524_M;
*% of individuals 15-24 years old diagnosed 12 months ago without AHD on ART;
*rename _&o = P_onART_Diag12mNOAHDA1524_M;

rename mean_p_onart_m_&o = P_onART_HIVM1599_M;
rename p5_p_onart_m_&o  = P_onART_HIVM1599_95LL;
rename p95_p_onart_m_&o = P_onART_HIVM1599_95UL;
rename mean_p_onart_w_&o = P_onART_HIVF1599_M;
rename p5_p_onart_w_&o  = P_onART_HIVF1599_95LL;
rename p95_p_onart_w_&o = P_onART_HIVF1599_95UL;
rename mean_p_onart_w1524__&o = P_onART_HIVF1524_M;
rename mean_p_onart_1524__&o = P_onART_HIVA1524_M;
rename mean_p_onart_&o = P_onART_HIVA1599_M;
rename p5_p_onart_&o = P_onART_HIVA1599_95LL;
rename p95_p_onart_&o = P_onART_HIVA1599_95UL;
rename mean_p_onart_sw_&o = P_onART_HIVFSW1599_M;
    
rename mean_p_onart_artexp_m_&o = P_onART_ExpM1599_M;
rename p5_p_onart_artexp_m_&o = P_onART_ExpM1599_95LL;
rename p95_p_onart_artexp_m_&o = P_onART_ExpM1599_95UL;
rename mean_p_onart_artexp_w_&o = P_onART_ExpF1599_M;
rename p5_p_onart_artexp_w_&o = P_onART_ExpF1599_95LL;
rename p95_p_onart_artexp_w_&o = P_onART_ExpF1599_95UL;
rename mean_p_onart_artexp_1524__&o = P_onART_ExpA1524_M;
rename p5_p_onart_artexp_1524__&o = P_onART_ExpA1524_95LL;
rename p95_p_onart_artexp_1524__&o = P_onART_ExpA1524_95UL;
rename mean_p_onart_artexp_&o = P_onART_ExpA1599_M;
rename p5_p_onart_artexp_&o = P_onART_ExpA1599_95LL;
rename p95_p_onart_artexp_&o = P_onART_ExpA1599_95UL;
rename mean_p_onart_artexp_sw_&o = P_onART_ExpFSW1599_M;
rename mean_p_on_artexp_w1524evpreg_&o = P_onART_ExpFpregEverBirth1524_M;

rename mean_p_onart_vl1000__&o = P_VLS_onARTA1599_M;
rename p5_p_onart_vl1000__&o = P_VLS_onARTA1599_95LL;
rename p95_p_onart_vl1000__&o = P_VLS_onARTA1599_95UL;
rename mean_p_onart_vl1000_1524__&o = P_VLS_onARTA1524_M;
rename p5_p_onart_vl1000_1524__&o = P_VLS_onARTA1524_95LL;
rename p95_p_onart_vl1000_1524__&o = P_VLS_onARTA1524_95UL;
rename mean_p_onart_vl1000_w1524evpr_&o = P_VLS_onARTpregEverBirthF1524_M;

*% of adults 15+ years living with HIV who are on ART and who have ever been viremic (measured VL>1000) who are virally suppressed (if possible, at a threshold of <1000)
*rename _&o = P_VLS_onARTMVLgt1000EverA1599_M;
year= floor(cald);
keep year
mean_prevalence1549m_&o 		p5_prevalence1549m_&o		p95_prevalence1549m_&o
mean_prevalence1549w_&o		p5_prevalence1549w_&o 		p95_prevalence1549w_&o
mean_prevalence1549__&o		p5_prevalence1549__&o		p95_prevalence1549__&o
mean_prevalence1549preg_&o	p5_prevalence1549preg_&o	p95_prevalence1549preg_&o
mean_prevalence1524preg_&o	p5_prevalence1524preg_&o 	p95_prevalence1524preg_&o
mean_prevalence_sw_&o		p5_prevalence_sw_&o			p95_prevalence_sw_&o

mean_n_alive_m_&o		p5_n_alive_m_&o		p95_n_alive_m_&o
mean_n_alive_w_&o		p5_n_alive_w_&o		p95_n_alive_w_&o
mean_n_alive_1524m_&o
mean_n_alive_1524w_&o
mean_n_alive_2549m_&o 
mean_n_alive_2549w_&o 
mean_n_sw_1564__&o 		p5_n_sw_1564__&o	p95_n_sw_1564__&o

mean_n_hivneg_sdpartner_&o 
mean_n_hivneg_sdpartneroffart_&o
mean_n_hivnegw_sdpartner_&o 
mean_n_hivnegw_sdpartneroffart_&o

mean_n_hivge15m_&o	p5_n_hivge15m_&o 	p95_n_hivge15m_&o
mean_n_hivge15w_&o	p5_n_hivge15w_&o	p95_n_hivge15w_&o
mean_n_hiv1524m_&o	
mean_n_hiv1524w_&o	
mean_n_hiv2549m_&o
mean_n_hiv2549w_&o	
mean_n_hiv_sw_&o		p5_n_hiv_sw_&o 		p95_n_hiv_sw_&o

mean_n_not_on_art_cd4ge500__&O
mean_n_not_on_art_cd4350500__&o
mean_n_not_on_art_cd4200350__&o
mean_n_not_on_art_cd450200__&o 
mean_n_not_on_art_cd4050__&o
   
mean_n_asympt_Undiag_&o
mean_n_asympt_diagoffart_&o
mean_n_asympt_diagonart_&o
mean_n_sympt_notaids_&o
mean_n_sympt_aids_&o

mean_p_diag_&o 		p5_p_diag_&o	p95_p_diag_&o
mean_p_diag_m_&o		p5_p_diag_m_&o	p95_p_diag_m_&o
mean_p_diag_w_&o		p5_p_diag_w_&o	p95_p_diag_w_&o
mean_p_diag_m1524__&o	
mean_p_diag_w1524__&o
mean_p_diag_sw_&o

mean_p_m_npge1__&o
mean_p_w_npge1__&o
mean_p_w1524_npge1__&o
mean_p_sw_npge1__&o 

mean_prev_sti_sw_&o 

mean_n_w1524_newp_ge1__&o 	mean_p_w1524newpge1_onprep_&o

/*VARIABLES TO BE ADDED HERE ONCE WE HAVE CREATED THEM IN CREATE_WIDE_FILE*/
/*NAlive_FPregBirthBF1599_M*/
/*P_TDFPrEP_FPregBirthBF1599_M*/
/*P_DPVPrEP_ElevRiskF1524_M*/
/*P_DPVPrEP_FPregBirthBF1599_M*/
/*P_CABPrEP_ElevRiskF1524_M*/
/*P_CABPrEP_FPregBirthBF1599_M*/


mean_p_mcirc_1549m_&o 	p5_p_mcirc_1549m_&o  	p95_p_mcirc_1549m_&o 

mean_n_onart_m_&o 		p5_n_onart_m_&o  		p95_n_onart_m_&o 
mean_n_onart_w_&o 		p5_n_onart_w_&o  		p95_n_onart_w_&o 
mean_n_onart_1524__&o 	p5_n_onart_1524__&o  	p95_n_onart_1524__&o 
mean_n_onart_&o 			p5_n_onart_&o  			p95_n_onart_&o 

mean_p_onart_diag_m_&o 		p5_p_onart_diag_m_&o  		p95_p_onart_diag_m_&o 
mean_p_onart_diag_w_&o 		p5_p_onart_diag_w_&o		p95_p_onart_diag_w_&o
mean_p_onart_diag_w1524__&o	
mean_p_onart_diag_1524__&o	p5_p_onart_diag_1524__&o	p95_p_onart_diag_1524__&o
mean_p_onart_diag_&o			p5_p_onart_diag_&o 			p95_p_onart_diag_&o
mean_p_onart_diag_sw_&o

/*
_&o = P_onART_Diag12mAHDA1599_M_&o;
_&o = P_onART_Diag12mNOAHDA1599_M_&o;
_&o = P_onART_Diag12mAHDA1524_M_&o;
_&o = P_onART_Diag12mNOAHDA1524_M_&o;*/

mean_p_onart_m_&o		p5_p_onart_m_&o 	p95_p_onart_m_&o
mean_p_onart_w_&o		p5_p_onart_w_&o 	p95_p_onart_w_&o
mean_p_onart_w1524__&o
mean_p_onart_1524__&o
mean_p_onart_&o			p5_p_onart_&o		p95_p_onart_&o
mean_p_onart_sw_&o
    
mean_p_onart_artexp_m_&o			p5_p_onart_artexp_m_&o		p95_p_onart_artexp_m_&o
mean_p_onart_artexp_w_&o			p5_p_onart_artexp_w_&o		p95_p_onart_artexp_w_&o
mean_p_onart_artexp_1524__&o		p5_p_onart_artexp_1524__&o	p95_p_onart_artexp_1524__&o
mean_p_onart_artexp_&o			p5_p_onart_artexp_&o		p95_p_onart_artexp_&o
mean_p_onart_artexp_sw_&o
mean_p_on_artexp_w1524evpreg_&o

mean_p_onart_vl1000__&o			p5_p_onart_vl1000__&o		p95_p_onart_vl1000__&o
mean_p_onart_vl1000_1524__&o		p5_p_onart_vl1000_1524__&o	p95_p_onart_vl1000_1524__&o
mean_p_onart_vl1000_w1524evpr_&o
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



PROC export data=s0 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="Base_STOCK";  RUN;
PROC export data=s1 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="Min_STOCK";  RUN;
PROC export data=s2 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_HIVST_PD_STOCK";  RUN;
PROC export data=s4 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_HIVST_SDPARTNER_STOCK";  RUN;
PROC export data=s5 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_FACNOSYMPT_STOCK";  RUN;
PROC export data=s7 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_IndexFAC_STOCK";  RUN;
PROC export data=s8 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="FSWprog_STOCK";  RUN;
PROC export data=s10 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="SBCC_STOCK";  RUN;
PROC export data=s11 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CMMC_STOCK";  RUN;
PROC export data=s12 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="GPMHC_STOCK";  RUN;
PROC export data=s13 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="VMMC_STOCK";  RUN;
PROC export data=s14 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_F1524_STOCK";  RUN;
PROC export data=s15 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_FSW1599_STOCK";  RUN;
PROC export data=s16 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_SDCA1599_STOCK";  RUN;
/*PROC export data=s17 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;*/
/*sheet="TDFPrEP_MSM1599_STOCK";  RUN;*/
PROC export data=s18 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_pregnbfF1549_STOCK";  RUN;
PROC export data=s19 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_F1524_STOCK";  RUN;
PROC export data=s20 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_FSW1599_STOCK";  RUN;
PROC export data=s21 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_SDCF1599_STOCK";  RUN;
PROC export data=s22 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_pregnbfF1549_STOCK";  RUN;
PROC export data=s23 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_F1524_STOCK";  RUN;
PROC export data=s24 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_FSW1599_STOCK";  RUN;
PROC export data=s25 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_SDCA1599_STOCK";  RUN;
/*PROC export data=s26 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;*/
/*sheet="CABPrEP_MSM1549_STOCK";  RUN;*/
PROC export data=s27 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_pregnbfF1549_STOCK";  RUN;
PROC export data=s28 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="ADH_RET_SUPP_A1019_STOCK";  RUN;
PROC export data=s29 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="ADH_SUPP_A1599_STOCK";  RUN;
PROC export data=s30 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="RET_SUPP_A1599_STOCK";  RUN;

options nomprint;
option nospool;





/***********************************************************************************************/
/************************              FLOW                        ****************************/
/***********************************************************************************************/


  ***Macro var used to calculate means across each year and transpose to one line per run,
  need to write manually all the years to merge;

%let nfit=127;		/*** UPDATE IF ADD MORE RUNS ***/

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
	n_prep_oral				n_prep_vr			n_prep_inj		

;

%let var_list_flow_mean = 
	mean_n_birth_&o  mean_n_give_birth_w_hiv_&o  mean_n_everpregn_w1524__&o  mean_n_everpregn_hiv_w1524__&o  mean_n_birth_with_inf_child_&o
	mean_incidence1549m_&o  p5_incidence1549m_&o  p95_incidence1549m_&o 
	mean_incidence1549w_&o  p5_incidence1549w_&o  p95_incidence1549w_&o 
	mean_incidence1549__&o  p5_incidence1549__&o  p95_incidence1549__&o 
	mean_incidence1524w_&o  p5_incidence1524w_&o  p95_incidence1524w_&o 
	mean_incidence_sw_&o    p5_incidence_sw_&o    p95_incidence_sw_&o 
	mean_incidence_sd1564__&o mean_incidence_sd1564w_&o 
	mean_incidence_plw_&o

	mean_n_new_inf1564m_&o  p5_n_new_inf1564m_&o  p95_n_new_inf1564m_&o
	mean_n_new_inf1564w_&o  p5_n_new_inf1564w_&o  p95_n_new_inf1564w_&o
	mean_n_new_inf1549m_&o  p5_n_new_inf1549m_&o  p95_n_new_inf1549m_&o
	mean_n_new_inf1549w_&o  p5_n_new_inf1549w_&o  p95_n_new_inf1549w_&o
	mean_n_new_inf1549__&o  p5_n_new_inf1549__&o   p95_n_new_inf1549__&o
	mean_n_new_inf1524m_&o  mean_n_new_inf1524w_&o
	mean_n_new_inf2549m_&o  mean_n_new_inf2549w_&o

	mean_n_death_hivrel_m_&o  P5_n_death_hivrel_m_&o  P95_n_death_hivrel_m_&o 
	mean_n_death_hivrel_w_&o  P5_n_death_hivrel_w_&o  P95_n_death_hivrel_w_&o
	mean_n_death_hivrel_&o    P5_n_death_hivrel_&o 	 P95_n_death_hivrel_&o

	mean_n_death_m_&o  P5_n_death_m_&o  P95_n_death_m_&o 
	mean_n_death_w_&o  P5_n_death_w_&o  P95_n_death_w_&o 
	/* YLL_80yLifeExpect_3Disc_A1599_M */
	mean_n_total_yllag_&o  mean_n_dyll_GBD_&o

	mean_n_tested_ancpd_&o   mean_n_test_anclabpd_&o 	mean_n_tested_anc_prevdiag_&o 
	mean_n_tested_m_sympt_&o  mean_n_tested_w_sympt_&o 
	/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
	mean_n_tested_swprog_&o  mean_n_tested_sw_&o 
	mean_n_tested_m_&o  		P5_n_tested_m_&o  		P95_n_tested_m_&o 
	mean_n_tested_w_&o  		P5_n_tested_w_&o  		P95_n_tested_w_&o
	mean_n_tested_&o    		P5_n_tested_&o    		P95_n_tested_&o
	/*TOTHIVST_M1599_M... TOTHIVST_F1599_M...*/
	mean_n_self_tested_m_&o	P5_n_self_tested_m_&o	P95_n_self_tested_m_&o
	mean_n_self_tested_w_&o	P5_n_self_tested_w_&o	P95_n_self_tested_w_&o

	mean_n_diag_anclabpd_&o 
	/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
	mean_n_diag_sympt_&o
	mean_n_diag_progsw_&o  mean_n_diag_sw_&o 
	mean_n_diag_m_&o  P5_n_diag_m_&o  P95_n_diag_m_&o 
	mean_n_diag_w_&o  P5_n_diag_w_&o  P95_n_diag_w_&o 
	/* TOTPosConfHIVST_M1599_M..*/
	mean_n_tested_due_to_st_&o

	mean_test_proppos_m_&o  P5_test_proppos_m_&o  P95_test_proppos_m_&o 
	mean_test_proppos_w_&o  P5_test_proppos_w_&o  P95_test_proppos_w_&o
	mean_test_prop_positive_&o	P5_test_prop_positive_&o  P95_test_prop_positive_&o
	mean_test_proppos_1524w_&o   mean_test_proppos_sw_&o 

	mean_n_sw_inprog_ly_&o 		/*mean_n_sw_inprog_ever_&o*/
	mean_n_sbcc_visit_1564__&o	mean_n_tested_sbcc_&o

	/*NCUPP_A1599_M ... NCondoms_A1599_M*/
	mean_n_diag_mens_clinic_&o
	mean_n_attend_mens_clinic_&o
	mean_n_new_vmmc1549m_&o

	mean_n_init_prep_oral_1524w_&o   mean_n_prep_oral_1524w_&o 	mean_n_contprep_oral_1524w_&o 	mean_n_prep_oral_ever_1524w_&o 
	mean_n_init_prep_oral_sw_&o     	mean_n_prep_oral_sw_&o    	mean_n_contprep_oral_sw_&o		mean_n_prep_oral_ever_sw_&o 
	mean_n_init_prep_oral_sdc_&o    	mean_n_prep_oral_sdc_&o    	mean_n_contprep_oral_sdc_&o 		mean_n_prep_oral_ever_sdc_&o
	mean_n_init_prep_oral_plw_&o     mean_n_prep_oral_plw_&o    	mean_n_contprep_oral_plw_&o		mean_n_prep_oral_ever_plw_&o 
	  	
	mean_n_init_prep_vr_1524w_&o   	mean_n_prep_vr_1524w_&o 		mean_n_contprep_vr_1524w_&o		mean_n_prep_vr_ever_1524w_&o 
	mean_n_init_prep_vr_sw_&o 	   	mean_n_prep_vr_sw_&o			mean_n_contprep_vr_sw_&o			mean_n_prep_vr_ever_sw_&o
	mean_n_init_prep_vr_sdc_&o     	mean_n_prep_vr_sdc_&o		mean_n_contprep_vr_sdc_&o 		mean_n_prep_vr_ever_sdc_&o
	mean_n_init_prep_vr_plw_&o 	   	mean_n_prep_vr_plw_&o		mean_n_contprep_vr_plw_&o		mean_n_prep_vr_ever_plw_&o

	mean_n_init_prep_inj_1524w_&o  	mean_n_prep_inj_1524w_&o 	mean_n_contprep_inj_1524w_&o 	mean_n_prep_inj_ever_1524w_&o
	mean_n_init_prep_inj_sw_&o     	mean_n_prep_inj_sw_&o		mean_n_contprep_inj_sw_&o		mean_n_prep_inj_ever_sw_&o 
	mean_n_init_prep_inj_sdc_&o    	mean_n_prep_inj_sdc_&o		mean_n_contprep_inj_sdc_&o 		mean_n_prep_inj_ever_sdc_&o
	mean_n_init_prep_inj_plw_&o     	mean_n_prep_inj_plw_&o		mean_n_contprep_inj_plw_&o		mean_n_prep_inj_ever_plw_&o 

	mean_n_access_adolescent_supp_&o
	mean_n_access_adult_adh_supp_&o
	mean_n_access_adult_ret_supp_&o

	mean_n_pmtct_&o	
	mean_n_prep_oral_&o				mean_n_prep_vr_&o			mean_n_prep_inj_&o
						
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
	NTDFPrEP_tot
	NDPVPrEP_tot
	NCABPrEP_tot
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
mean_&v._&s = mean(of &v.1-&v.&nfit);
keep cald p5_&v._&s p95_&v._&s p50_&v._&s mean_&v._&s;
run;
proc datasets nodetails nowarn nolist;delete &v;quit;		/*previously had run instead of quit;*/
%mend var_cy;

/* Define the list of options */
%let opt_list = 0 1 2 /*3*/ 4 5 /*6*/ 7 8 /*9*/ 10 11 12 13 14 15 16 /*17*/ 18 19 20 21 22 23 24 25 /*26*/ 27 28 29 30;
/*%put &opt_list ;*/
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

l_n_pmtct_&s
l_n_prep_oral_&s				l_n_prep_vr_&s			l_n_prep_inj_&s
;
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
table mean_n_pmtct_0 mean_n_everpregn_w1524__0
mean_incidence_sd1564__0 mean_incidence_sd1564W_0 mean_n_new_inf1549__0

mean_N_DIAG_SW_0
mean_n_prep_oral_1524w_0 mean_n_contprep_oral_1524w_0
mean_n_prep_oral_sw_0    mean_n_contprep_oral_sw_0
mean_n_prep_oral_sdc_0    mean_n_contprep_oral_sdc_0
mean_n_prep_vr_1524w_0 	mean_n_prep_vr_sw_0    	mean_n_prep_vr_sdc_0   
mean_n_prep_inj_1524w_0 	mean_n_prep_inj_sw_0    	mean_n_prep_inj_sdc_0;run;*/


*FLOW;
%macro flow(o=);
data wide_allyears_out_&o; set wide_allyears_&o;
*note that 1991 would refer to the period &year_start.5-1991.5;

*** PREGNANCIES BIRTHS;
*# of females 15+ years old who gave birth in the last year:
 as we model only pregnancies for women 15+ and who lead to live births, I think we can use the annual number of births;
rename mean_n_birth_&o            = NAlive_Fbirth1599_M;
*Number of females 15+ years old who gave birth in the last year who were living with HIV;
rename mean_n_give_birth_w_hiv_&o = NHIV_Fbirth1599_M;
*Number of females 15+ years old who gave birth or breastfed in the last year;
*!!!!!Need Jenney code;
*rename NAlive_FbirthBF1599_M;
*Number of females 15+ years old who gave birth or breastfed in the last year who were living with HIV;
*!!!!!Need Jenney code;
*rename NHIV_FbirthBF1599_M;
*Number of females 15-24 years old who ever gave birth or pregnant in the last year aged 15-24 years old;
rename mean_n_everpregn_w1524__&o = NAlive_FpregEverBirth1524_M;	
*Number of females 15-24 years old who ever gave birth or pregnant in the last year aged 15-24 years old living with HIV;
rename mean_n_everpregn_hiv_w1524__&o = NHIV_FpregEverBirth1524_M;	
*Number of children born in the last year;
*Note: the same as # of females 15+ years old who gave birth in the last year. We assume no twins;
*rename mean_n_birth_&o            = NAlive_A01_M;	
*Number of children born in the last year from mums living with HIV;
*rename mean_n_give_birth_w_hiv_&o = NAlive_HIVPOSmum_A01_M;
*Number of children born in the last year from mums living with HIV, who are living with HIV;
rename mean_n_birth_with_inf_child_&o = NHIV_HIVPOSmum_A01_M;


*** HIV INCIDENCE;
rename mean_incidence1549m_&o = HIVIncid_M1549_M;
rename p5_incidence1549m_&o  = HIVIncid_M1549_95LL;
rename p95_incidence1549m_&o = HIVIncid_M1549_95UL;
rename mean_incidence1549w_&o = HIVIncid_F1549_M;
rename p5_incidence1549w_&o  = HIVIncid_F1549_95LL;
rename p95_incidence1549w_&o = HIVIncid_F1549_95UL;
rename mean_incidence1549__&o  = HIVIncid_A1549_M;
rename p5_incidence1549__&o   = HIVIncid_A1549_95LL;
rename p95_incidence1549__&o  = HIVIncid_A1549_95UL;
rename mean_incidence1524w_&o = HIVIncid_F1524_M;
rename p5_incidence1524w_&o = HIVIncid_F1524_95LL;
rename p95_incidence1524w_&o = HIVIncid_F1524_95UL;
rename mean_incidence_sw_&o = HIVIncid_FSW1599_M;*in our model is 15-64;
rename p5_incidence_sw_&o = HIVIncid_FSW1599_95LL;*in our model is 15-64;
rename p95_incidence_sw_&o = HIVIncid_FSW1599_95UL;*in our model is 15-64;
*HIV incidence in adults 15+ years old with an HIV positive partner;
rename mean_incidence_sd1564__&o = HIVIncid_SDCA1599_M;*in our model is 15-64;
rename mean_incidence_sd1564w_&o = HIVIncid_SDCF1599_M;*in our model is 15-64;
*HIV incidence in pregnant and breastfeeding females 15-49 years old;
rename mean_incidence_plw_&o = HIVIncid_pregbfF1549_M;*in our model is 15-64;


*** NEW HIV INFECTIONS;
rename mean_n_new_inf1564m_&o = NHIVInf_M1599_M;
rename p5_n_new_inf1564m_&o = NHIVInf_M1599_95LL;
rename p95_n_new_inf1564m_&o = NHIVInf_M1599_95UL;
rename mean_n_new_inf1564w_&o = NHIVInf_F1599_M;
rename p5_n_new_inf1564w_&o = NHIVInf_F1599_95LL;
rename p95_n_new_inf1564w_&o = NHIVInf_F1599_95UL;
rename mean_n_new_inf1549m_&o = NHIVInf_M1549_M;
rename p5_n_new_inf1549m_&o = NHIVInf_M1549_95LL;
rename p95_n_new_inf1549m_&o = NHIVInf_M1549_95UL;
rename mean_n_new_inf1549w_&o = NHIVInf_F1549_M;
rename p5_n_new_inf1549w_&o = NHIVInf_F1549_95LL;
rename p95_n_new_inf1549w_&o = NHIVInf_F1549_95UL;
rename mean_n_new_inf1549__&o = NHIVInf_A1549_M;
rename p5_n_new_inf1549__&o = NHIVInf_A1549_95LL;
rename p95_n_new_inf1549__&o = NHIVInf_A1549_95UL;
rename mean_n_new_inf1524m_&o = NHIVInf_M1524_M;
rename mean_n_new_inf1524w_&o = NHIVInf_F1524_M;
rename mean_n_new_inf2549m_&o = NHIVInf_M2549_M;
rename mean_n_new_inf2549w_&o = NHIVInf_F2549_M;


*** AIDS DEATHS;
rename mean_n_death_hivrel_m_&o = AIDSDeaths_M1599_M;	
rename P5_n_death_hivrel_m_&o = AIDSDeaths_M1599_95LL;	
rename P95_n_death_hivrel_m_&o = AIDSDeaths_M1599_95UL;	
rename mean_n_death_hivrel_w_&o = AIDSDeaths_F1599_M;
rename P5_n_death_hivrel_w_&o = AIDSDeaths_F1599_95LL;	
rename P95_n_death_hivrel_w_&o = AIDSDeaths_F1599_95UL;	
rename mean_n_death_hivrel_&o = AIDSDeaths_A1599_M;
rename P5_n_death_hivrel_&o = AIDSDeaths_A1599_95LL;
rename P95_n_death_hivrel_&o = AIDSDeaths_A1599_95UL;


*** TOTAL DEATHS;
rename mean_n_death_m_&o = TOTDeaths_M1599_M;
rename P5_n_death_m_&o  = TOTDeaths_M1599_95LL;
rename P95_n_death_m_&o = TOTDeaths_M1599_95UL;
rename mean_n_death_w_&o = TOTDeaths_F1599_M;
rename P5_n_death_w_&o  = TOTDeaths_F1599_95LL;
rename P95_n_death_w_&o = TOTDeaths_F1599_95UL;
** YLL_80yLifeExpect_3Disc_A1599_M;
rename mean_n_total_yllag_&o = YLL_AgeGenLifeExpect_A1599_M;
rename mean_n_dyll_GBD_&o = YLL_AgeGenLifeExpect_3D_A1599_M;

*** TESTING;
rename mean_n_tested_ancpd_&o = Ntested_ANCPD_F1599_M; *This is set to 1 only at 1 point in time;
rename mean_n_test_anclabpd_&o = Ntests_ANCPD_F1599_M;
*rename mean_ _&o = NHIVST_PD_M1599_M;
*rename mean_ _&o = NHIVST_PD_F1599_M;
*rename mean_ _&o = NHIVST_SDNP_M1599_M;
*rename mean_ _&o = NHIVST_SDNP_F1599_M;
*rename mean_ _&o = NHIVST_SDPARTNER_M1599_M;
*rename mean_ _&o = NHIVST_SDPARTNER_F1599_M;
*Number of tests for HIV at facility, excluding ANC & PD, contacts testing for HIV at the facility and testing of FSW,
among 15+ years old males with symptoms;
rename mean_n_tested_m_sympt_&o = Ntests_FACSYMPT_M1599_M;
rename mean_n_tested_w_sympt_&o = Ntests_FACSYMPT_F1599_M;
*rename mean_ _&o = Ntests_FACNOSYMPT_M1599_M;
*rename mean_ _&o = Ntests_FACNOSYMPT_F1599_M;
*rename mean_ _&o = Ntests_IndexFAC_M1599_M;
*rename mean_ _&o = Ntests_IndexFAC_F1599_M;
*rename mean_ _&o = Ntests_RecInf_M1599_M;
*rename mean_ _&o = Ntests_RecInf_F1599_M;
*rename mean_ _&o = Ntests_COM_M1599_M;
*rename mean_ _&o = Ntests_COM_F1599_M;
*Number of FSW 15+ years old tested as part of a testing program for FSW;
rename mean_n_tested_swprog_&o = Ntested_FSWprog_FSW1599_M; *Loveleen is going to do a pull request about this;
rename mean_n_tested_sw_&o = Ntests_FSW1599_M;
rename mean_n_tested_m_&o = TOTTests_M1599_M;
rename P5_n_tested_m_&o = TOTTests_M1599_95LL;
rename P95_n_tested_m_&o = TOTTests_M1599_95UL;
rename mean_n_tested_w_&o = TOTTests_F1599_M;
rename P5_n_tested_w_&o = TOTTests_F1599_95LL;
rename P95_n_tested_w_&o = TOTTests_F1599_95UL;
rename mean_n_tested_&o = TOTTests_A1599_M;
rename P5_n_tested_&o = TOTTests_A1599_95LL;
rename P95_n_tested_&o = TOTTests_A1599_95UL;
rename mean_n_self_tested_m_&o = TOTHIVST_M1599_M;
rename P5_n_self_tested_m_&o = TOTHIVST_M1599_95LL;
rename P95_n_self_tested_m_&o = TOTHIVST_M1599_95UL;
rename mean_n_self_tested_w_&o = TOTHIVST_F1599_M;
rename P5_n_self_tested_w_&o = TOTHIVST_F1599_95LL;
rename P95_n_self_tested_w_&o = TOTHIVST_F1599_95UL;
*rename mean_ _&o = TOTHIVST_A014_M;
*rename P5_ _&o = TOTHIVST_A014_95LL;
*rename P95_ _&o = TOTHIVST_A014_95UL;


*** NUMBER OF POSITIVE TESTS;
rename mean_n_diag_anclabpd_&o = NPosTests_ANCPD_F1599_M;
*rename mean_ _&o = NPosConfHIVST_PD_M1599_M;
*rename mean_ _&o = NPosConfHIVST_PD_F1599_M;
*rename mean_ _&o = NPosConfHIVST_SDNP_M1599_M;
*rename mean_ _&o = NPosConfHIVST_SDNP_F1599_M;
*rename mean_ _&o = NPosConfHIVST_SDPARTNER_M1599_M;
*rename mean_ _&o = NPosConfHIVST_SDPARTNER_F1599_M;
rename mean_n_diag_sympt_&o = NPosTests_FACSYMPT_A1599_M;
*rename mean_ _&o = NPosTests_FAC_M1599_M;
*rename mean_ _&o = NPosTests_FAC_F1599_M;
*rename mean_ _&o = NPosTests_IndexFAC_M1599_M;
*rename mean_ _&o = NPosTests_IndexFAC_F1599_M;
*rename mean_ _&o = NPosTests_RecInf_M1599_M;
*rename mean_ _&o = NPosTests_RecInf_F1599_M;
*rename mean_ _&o = NPosTests_COM_M1599_M;
*rename mean_ _&o = NPosTests_COM_F1599_M;
rename mean_n_diag_progsw_&o = NPosTests_FSWprog_FSW1599_M;
rename mean_n_diag_sw_&o = NPosTests_FSW1599_M;
rename mean_n_diag_m_&o = TOTPosTests_M1599_M;
rename P5_n_diag_m_&o = TOTPosTests_M1599_95LL;
rename P95_n_diag_m_&o = TOTPosTests_M1599_95UL;
rename mean_n_diag_w_&o = TOTPosTests_F1599_M;
rename P5_n_diag_w_&o = TOTPosTests_F1599_95LL;
rename P95_n_diag_w_&o = TOTPosTests_F1599_95UL;
rename mean_n_tested_due_to_st_&o = TOTPosConfHIVST_A1599_M;*!!!!! it was not exported by gender;
rename P5_n_tested_due_to_st_&o = TOTPosConfHIVST_A1599_95LL;*!!!!! it was not exported by gender;
rename P95_n_tested_due_to_st_&o = TOTPosConfHIVST_A1599_95UL;*!!!!! it was not exported by gender;
*rename mean_ _&o = TOTPosConfHIVST_M1599_M;
*rename P5_ _&o = TOTPosConfHIVST_M1599_95LL;
*rename P95_ _&o = TOTPosConfHIVST_M1599_95UL;
*rename mean_ _&o = TOTPosConfHIVST_F1599_M;
*rename P5_ _&o = TOTPosConfHIVST_F1599_95LL;
*rename P95_ _&o = TOTPosConfHIVST_F1599_95UL;


*** POSITIVITY RATE;
rename mean_test_proppos_m_&o = PosRate_M1599_M;
rename P5_test_proppos_m_&o = PosRate_M1599_95LL;
rename P95_test_proppos_m_&o = PosRate_M1599_95UL;
rename mean_test_proppos_w_&o = PosRate_F1599_M;
rename P5_test_proppos_w_&o = PosRate_F1599_95LL;
rename P95_test_proppos_w_&o = PosRate_F1599_95UL;
rename mean_test_prop_positive_&o = PosRate_A1599_M;
rename P5_test_prop_positive_&o = PosRate_A1599_95LL;
rename P95_test_prop_positive_&o = PosRate_A1599_95UL;
rename mean_test_proppos_1524w_&o = PosRate_F1524_M;
rename mean_test_proppos_sw_&o = PosRate_FSW1599_M;


*** PREVENTION;
rename mean_n_sw_inprog_ly_&o = NFSWprog_FSW1599_M;
*rename mean_n_sw_inprog_ever_&o = NFSWprogEver_FSW1599_M;
*Number of adults 15+ years old recipient of SBCC intervention;
rename mean_n_sbcc_visit_1564__&o = NSBCC_A1599_M;
rename mean_n_tested_sbcc_&o = Ntested_SBCC_A1599_M;
*Number of adults 15+ years old recipient of condoms;
*rename mean_ _&o = NCUPP_A1599_M;
*Number of condoms distributed among adults 15+ years old;
*rename mean_ _&o = NCondoms_A1599_M;
*CMMC - no specific outputs;
*GPMHC;
rename mean_n_diag_mens_clinic_&o = NGPMHC_DiagM1599_M;
rename mean_n_attend_mens_clinic_&o = NGPMHC_M1599_M;	*JASNov2024;
rename mean_n_new_vmmc1549m_&o = NVMMC_M1549_M;

rename mean_n_init_prep_oral_1524w_&o = NTDFPrEPinit_F1524_M;
rename mean_n_prep_oral_1524w_&o = NTDFPrEP_F1524_M; 	
rename mean_n_contprep_oral_1524w_&o = NTDFPrEPCT_F1524_M; 
rename mean_n_prep_oral_ever_1524w_&o = NTDFPrEPEver_F1524_M;
rename mean_n_init_prep_oral_sw_&o = NTDFPrEPinit_FSW1599_M;
rename mean_n_prep_oral_sw_&o = NTDFPrEP_FSW1599_M;		
rename mean_n_contprep_oral_sw_&o = NTDFPrEPCT_FSW1599_M;
rename mean_n_prep_oral_ever_sw_&o = NTDFPrEPEver_FSW1599_M;
rename mean_n_init_prep_oral_sdc_&o = NTDFPrEPinit_SDCA1599_M;
rename mean_n_prep_oral_sdc_&o = NTDFPrEP_SDCA1599_M; 	
rename mean_n_contprep_oral_sdc_&o = NTDFPrEPCT_SDCA1599_M;
rename mean_n_prep_oral_ever_sdc_&o = NTDFPrEPEver_SDCA1599_M;
rename mean_n_init_prep_oral_plw_&o = NTDFPrEPinit_pregbfF1549_M;
rename mean_n_prep_oral_plw_&o = NTDFPrEP_pregbfF1549_M;
rename mean_n_contprep_oral_plw_&o = NTDFPrEPCT_pregbfF1549_M;
rename mean_n_prep_oral_ever_plw_&o = NTDFPrEPEver_pregbfF1549_M;


rename mean_n_init_prep_vr_1524w_&o = NDPVPrEPinit_F1524_M;
rename mean_n_prep_vr_1524w_&o = NDPVPrEP_F1524_M; 	
rename mean_n_contprep_vr_1524w_&o = NDPVPrEPCT_F1524_M;;	
rename mean_n_prep_vr_ever_1524w_&o = NDPVPrEPEver_F1524_M;
rename mean_n_init_prep_vr_sw_&o = NDPVPrEPinit_FSW1599_M;
rename mean_n_prep_vr_sw_&o = NDPVPrEP_FSW1599_M;
rename mean_n_contprep_vr_sw_&o = NDPVPrEPCT_FSW1599_M;;
rename mean_n_prep_vr_ever_sw_&o = NDPVPrEPEver_FSW1599_M;
rename mean_n_init_prep_vr_sdc_&o = NDPVPrEPinit_SDCF1599_M;
rename mean_n_prep_vr_sdc_&o = NDPVPrEP_SDCF1599_M;
rename mean_n_contprep_vr_sdc_&o = NDPVPrEPCT_SDCF1599_M;
rename mean_n_prep_vr_ever_sdc_&o = NDPVPrEPEver_SDCF1599_M;
rename mean_n_init_prep_vr_plw_&o = NDPVPrEPinit_pregbfF1549_M;
rename mean_n_prep_vr_plw_&o = NDPVPrEP_pregbfF1549_M;
rename mean_n_contprep_vr_plw_&o = NDPVPrEPCT_pregbfF1549_M;
rename mean_n_prep_vr_ever_plw_&o = NDPVPrEPEver_pregbfF1549_M;
rename mean_n_init_prep_inj_1524w_&o = NCABPrEPinit_F1524_M;
rename mean_n_prep_inj_1524w_&o = NCABPrEP_F1524_M;
rename mean_n_contprep_inj_1524w_&o = NCABPrEPCT_F1524_M;;
rename mean_n_prep_inj_ever_1524w_&o = NCABPrEPEver_F1524_M;
rename mean_n_init_prep_inj_sw_&o = NCABPrEPinit_FSW1599_M;
rename mean_n_prep_inj_sw_&o = NCABPrEP_FSW1599_M;
rename mean_n_contprep_inj_sw_&o = NCABPrEPCT_FSW1599_M;
rename mean_n_prep_inj_ever_sw_&o = NCABPrEPEver_FSW1599_M;
rename mean_n_init_prep_inj_sdc_&o = NCABPrEPinit_SDCA1599_M;
rename mean_n_prep_inj_sdc_&o = NCABPrEP_SDCA1599_M; 		
rename mean_n_contprep_inj_sdc_&o = NCABPrEPCT_SDCA1599_M;;
rename mean_n_prep_inj_ever_sdc_&o = NCABPrEPEver_SDCA1599_M;
rename mean_n_init_prep_inj_plw_&o = NCABPrEPinit_pregbfF1549_M;
rename mean_n_prep_inj_plw_&o = NCABPrEP_pregbfF1549_M;
rename mean_n_contprep_inj_plw_&o = NCABPrEPCT_pregbfF1549_M;
rename mean_n_prep_inj_ever_plw_&o = NCABPrEPEver_pregbfF1549_M;




*** ART SUPPORT;
* Adolescent support;
rename mean_n_access_adolescent_supp_&o = N_ADH_RET_YP_A1019_M;
* Adult adherence support;
rename mean_n_access_adult_adh_supp_&o = N_ADH_A1599_M;
* Adult retention support;
rename mean_n_access_adult_ret_supp_&o = N_RET_A1599_M;


*The below is not exactly correct as N_PMTCT it is the current number of pregnant women receiving PMTCT (de facto ART),
while this ouput should be # of females 15+ living with HIV who gave birth in the last year and received ART;
rename mean_n_pmtct_&o = NPMTCT_FbirthHIV1599_M;

rename mean_n_prep_oral_&o = NTDFPrEP_tot;
rename mean_n_prep_vr_&o = NDPVPrEP_tot;
rename mean_n_prep_inj_&o = NCABPrEP_tot;			

	

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

keep cald &var_list_flow_mean; run;

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


PROC export data=wide_allyears_out_0 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE; 
sheet="Base_FLOW";  RUN;
PROC export data=wide_allyears_out_1 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="Min_FLOW";  RUN;
PROC export data=wide_allyears_out_2 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_HIVST_PD_FLOW";  RUN;
PROC export data=wide_allyears_out_4 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_HIVST_SDPARTNER_FLOW";  RUN;
PROC export data=wide_allyears_out_5 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_FACNOSYMPT_FLOW";  RUN;
PROC export data=wide_allyears_out_7 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="T_IndexFAC_FLOW";  RUN;
PROC export data=wide_allyears_out_8 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="FSWprog_FLOW";  RUN;
PROC export data=wide_allyears_out_10 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="SBCC_FLOW";  RUN;
PROC export data=wide_allyears_out_11 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CMMC_FLOW";  RUN;
PROC export data=wide_allyears_out_12 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="GPMHC_FLOW";  RUN;
PROC export data=wide_allyears_out_13 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="VMMC_FLOW";  RUN;
PROC export data=wide_allyears_out_14 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_F1524_FLOW";  RUN;
PROC export data=wide_allyears_out_15 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_FSW1599_FLOW";  RUN;
PROC export data=wide_allyears_out_16 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_SDCA1599_FLOW";  RUN;
/*PROC export data=wide_allyears_out_17 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;*/
/*sheet="TDFPrEP_SDCA1599_FLOW";  RUN;*/
PROC export data=wide_allyears_out_18 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="TDFPrEP_pregnbfF1549_FLOW";  RUN;
PROC export data=wide_allyears_out_19 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_F1524_FLOW";  RUN;
PROC export data=wide_allyears_out_20 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_FSW1599_FLOW";  RUN;
PROC export data=wide_allyears_out_21 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_SDCF1599_FLOW";  RUN;
PROC export data=wide_allyears_out_22 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="DPVPrEP_pregnbfF1549_FLOW";  RUN;
PROC export data=wide_allyears_out_23 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_F1524_FLOW";  RUN;
PROC export data=wide_allyears_out_24 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_FSW1599_FLOW";  RUN;
PROC export data=wide_allyears_out_25 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_SDCA1599_FLOW";  RUN;
/*PROC export data=wide_allyears_out_26 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;*/
/*sheet="CABPrEP_pregnbfF1549_FLOW";  RUN;*/
PROC export data=wide_allyears_out_27 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="CABPrEP_pregnbfF1549_FLOW";  RUN;
PROC export data=wide_allyears_out_28 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="ADH_RET_SUPP_A1019_FLOW";  RUN;
PROC export data=wide_allyears_out_29 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="ADH_SUPP_A1599_FLOW";  RUN;
PROC export data=wide_allyears_out_30 outFILE= "&pth_export_mihpsa\MIHPSAZimP2_SYNTHESIS_20250324" dbms=xlsx REPLACE;
sheet="RET_SUPP_A1599_FLOW";  RUN;
