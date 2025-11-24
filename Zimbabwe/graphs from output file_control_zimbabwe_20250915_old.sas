
***Program to produce graphs using averages across runs
***Use include statement in analysis program to read the code below in;

libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20250915_out\";


data all_outputs;
    set a.outputs_0(in=a) a.outputs_1(in=b) a.outputs_2(in=c) a.outputs_3(in=d) a.outputs_4(in=e) a.outputs_5(in=f) a.outputs_6(in=g) 
		a.outputs_7(in=h) a.outputs_8(in=i) a.outputs_9(in=j) a.outputs_10(in=k) a.outputs_11(in=l) a.outputs_12(in=m)
		/*a.outputs_99(in=n)*/;
    if a then option = 0;
    else if b then option = 1;
    else if c then option = 2;
    else if d then option = 3;
    else if e then option = 4;
    else if f then option = 5;
    else if g then option = 6;
    else if h then option = 7;
    else if i then option = 8;
    else if j then option = 9;
    else if k then option = 10;
    else if l then option = 11;
    else if m then option = 12;
    else if n then option = 99;
run;

proc transpose data=all_outputs out=combined_long(drop=_NAME_);
    by option;  /* keep option as identifier */
run;



* Add new variables;
data combined_long; set combined_long;
	n_alive_m = n_alive_1524m + n_alive_2549m + n_alive_50plm;
	n_alive_w = n_alive_1524w + n_alive_2549w + n_alive_50plw;
	n_alive = n_alive_m + n_alive_w;
	NewHIV_total = NewHIV_00_14_M + NewHIV_15_24_M + NewHIV_25_49_M + NewHIV_50_UP_M + NewHIV_00_14_F + NewHIV_15_24_F + NewHIV_25_49_F + NewHIV_50_UP_F;
	pc_prep_fsw = 100 * PrEP_FSW / Total_FSW;
	pc_prep_agyw = 100 * PrEP_AGYW_PG / Total_AGYW_PG;
	pc_prep_msm = 100 * PrEP_MSM / Total_MSM;
	pc_circumcised_15_24_m = 100 * N_circumcised_15_24_M / Total_15_24_M;
run;



%let year_start=1990;
%let year_end=2050;

ods html;

proc format;
    value option_fmt
        0 = "Baseline"
        1 = "PrEPoral_FSW"
        2 = "PrEPmix_FSW"
        3 = "PrEPoral_AGYW"
        4 = "PrEPmix_AGYW"
        5 = "PrEPoral_MSM"
        6 = "PrEPmix_MSM"
		7 = "vmmc"
		8 = "condom"
		9 = "FSW"
		10 = "MSM"
		11 = "test"
		12 = "adherence"
		;
run;







***************
*** FIGURES ***
***************;


*** General;
* New infections;
proc sgplot data=combined_long;
/*	where option in (0,1);*/
    series x=year y=NewHIV_total / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="Number";
    title "NewHIV_total";
run;




*** PrEP (options 1-6);
proc sgplot data=combined_long;
	where option in (0,1,2);
    series x=year y=pc_prep_fsw / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="%";
    title "pc_prep_fsw";
run;



proc sgplot data=combined_long;
	where option in (0,3,4);
    series x=year y=pc_prep_agyw / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="%";
    title "pc_prep_agyw";
run;

proc sgplot data=combined_long;
	where option in (0,5,6);
    series x=year y=pc_prep_msm / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="%";
    title "pc_prep_msm";
run;


*** VMMC (option 7);
proc sgplot data=combined_long;
	where option in (0,7);
    series x=year y=Percent_circumcised / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="%";
    title "Percent_circumcised";
run;

proc sgplot data=combined_long;
	where option in (0,7);
    series x=year y=pc_circumcised_15_24_m / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="%";
    title "pc_circumcised_15_24_m";
run;


*** KP programs (options 9 & 10);
proc sgplot data=combined_long;
	where option in (0,9);
    series x=year y=Percent_FSW_reached / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="%";
    title "Percent_FSW_reached";
run;

proc sgplot data=combined_long;
	where option in (0,10);
    series x=year y=Percent_MSM_reached / group=option lineattrs = (thickness = 2);
    format option option_fmt.;   /* applies custom legend text */
	xaxis label="Year";
    yaxis label="%";
    title "Percent_MSM_reached";
run;
* Output missing;



libname a "C:\Users\rmjlja9\UCL Dropbox\Jennifer Smith\hiv synthesis ssa unified program\output files\hiv_control_zimbabwe\hiv_control_zim_20250915_out\";
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
n_not_on_art_cd40200_ = n_not_on_art_cd40200;
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
n_not_on_art_cd40200_ n_not_on_art_cd4050_ n_not_on_art_cd450200_ n_not_on_art_cd4200350_ n_not_on_art_cd4350500_ n_not_on_art_cd4ge500_ 
n_asympt_Undiag n_asympt_diagoffart n_asympt_diagonart n_sympt_notaids n_sympt_aids
n_birth n_give_birth_w_hiv p_w_giv_birth_this_per n_w1524_newp_ge1_ p_newp_ge1_ p_newp_ge5_ p_1524_newp_ge1_ p_ep p_m_npge1_ p_w_npge1_ p_w1524_npge1_ p_sw_npge1_
log_gender_r_newp av_newp_ge1  av_newp_ge1_non_sw 
p_tested_past_year_1549m p_tested_past_year_1549w n_pmtct
p_mcirc_1549m	p_mcirc_1049m	n_new_vmmc	n_new_vmmc1549m 	n_new_vmmc1049m  n_new_vmmc1014m	n_new_birth_circ n_new_mcirc n_new_mcirc_1549m 	n_new_mcirc_1049m
p_vmmc_1549m	p_vmmc_1049m
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  p_w1524newpge1_onprep prop_1564_onprep 	
n_prep n_prep_1524w n_prep_ever
n_init_prep_oral_1524w	n_init_prep_oral_sw		n_init_prep_oral_sdc	n_init_prep_oral_plw
n_init_prep_len_1524w	n_init_prep_len_sw		n_init_prep_len_sdc		n_init_prep_len_plw
n_init_prep_vr_1524w	n_init_prep_vr_sw		n_init_prep_vr_sdc		n_init_prep_vr_plw
n_prep_oral_1524w 		n_prep_oral_sw		n_prep_oral_sdc		n_prep_oral_plw
n_prep_len_1524w		n_prep_len_sw		n_prep_len_sdc		n_prep_len_plw
n_prep_vr_1524w			n_prep_vr_sw		n_prep_vr_sdc		n_prep_vr_plw
n_contprep_oral_1524w	n_contprep_oral_sw	n_contprep_oral_sdc	n_contprep_oral_plw	
n_contprep_len_1524w	n_contprep_len_sw 	n_contprep_len_sdc	n_contprep_len_plw	
n_contprep_vr_1524w 	n_contprep_vr_sw	n_contprep_vr_sdc	n_contprep_vr_plw	
py_prep_oral_1524w		py_prep_oral_sw
py_prep_len_1524w		py_prep_len_sw
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

/* Extras for HIV control */
p_mcirc_1524m

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
%let nfit=38;
%option_(0);
%option_(1);
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
%option_(14);
run;

* Too long:
mean_n_hivnegw_sdpartneroffart_14
;



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
g0_251 g0_252 g0_253 g0_254 g0_255 g0_256 g0_257 g0_258 g0_259 g0_260 g0_261 g0_262 g0_263 g0_264 g0_265 g0_266 g0_267 g0_268 g0_269 /*g0_270 g0_271 g0_272 g0_273 g0_274 g0_275 
g0_276 g0_277 g0_278 g0_279 g0_280 g0_281 g0_282 g0_283 g0_284 g0_285 g0_286 g0_287 g0_288 g0_289 g0_290 g0_291 g0_292 g0_293 g0_294 g0_295 g0_296 g0_297 g0_298 g0_299 g0_300 
g0_301 g0_302 g0_303 g0_304 g0_305 g0_306 g0_307 g0_308 g0_309 g0_310 g0_311 g0_312 g0_313 g0_314*/

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
g1_251 g1_252 g1_253 g1_254 g1_255 g1_256 g1_257 g1_258 g1_259 g1_260 g1_261 g1_262 g1_263 g1_264 g1_265 g1_266 g1_267 g1_268 g1_269 /*g1_270 g1_271 g1_272 g1_273 g1_274 g1_275 
g1_276 g1_277 g1_278 g1_279 g1_280 g1_281 g1_282 g1_283 g1_284 g1_285 g1_286 g1_287 g1_288 g1_289 g1_290 g1_291 g1_292 g1_293 g1_294 g1_295 g1_296 g1_297 g1_298 g1_299 g1_300 
g1_301 g1_302 g1_303 g1_304 g1_305 g1_306 g1_307 g1_308 g1_309 g1_310 g1_311 g1_312 g1_313 g1_314*/
;
by cald;
run;

data d_b;
merge 
g2_1   g2_2   g2_3   g2_4   g2_5   g2_6   g2_7   g2_8   g2_9   g2_10  g2_11  g2_12  g2_13  g2_14  g2_15  g2_16  g2_17  g2_18  g2_19  g2_20  g2_21  g2_22  g2_23  /*g2_24  g2_25  
g2_26  g2_27  g2_28*/  g2_29  g2_30  g2_31  g2_32  g2_33  g2_34  g2_35  g2_36  g2_37  g2_38  g2_39  g2_40  g2_41  g2_42  g2_43  g2_44  g2_45  /*g2_46*/  g2_47  g2_48  g2_49  g2_50 
g2_51  g2_52  g2_53  g2_54  g2_55  g2_56  g2_57  g2_58  g2_59  g2_60  g2_61  g2_62  g2_63  g2_64  g2_65  g2_66  g2_67  g2_68  g2_69  g2_70  g2_71  g2_72  g2_73  g2_74  g2_75  
g2_76  g2_77  g2_78  g2_79  g2_80  g2_81  g2_82  g2_83  g2_84  g2_85  g2_86  g2_87  g2_88  g2_89  g2_90  g2_91  g2_92  g2_93  g2_94  g2_95  g2_96  g2_97  g2_98  g2_99  g2_100 
g2_101 g2_102 g2_103 g2_104 g2_105 g2_106 g2_107 g2_108 g2_109 g2_110 g2_111 g2_112 g2_113 g2_114 g2_115 g2_116 g2_117 g2_118 g2_119 g2_120 g2_121 g2_122 g2_123 g2_124 g2_125 
g2_126 g2_127 g2_128 g2_129 g2_130 g2_131 g2_132 g2_133 g2_134 g2_135 g2_136 g2_137 g2_138 g2_139 g2_140 g2_141 g2_142 g2_143 g2_144 g2_145 g2_146 g2_147 g2_148 g2_149 g2_150 
g2_151 g2_152 g2_153 g2_154 g2_155 g2_156 g2_157 g2_158 g2_159 g2_160 g2_161 g2_162 g2_163 g2_164 g2_165 g2_166 g2_167 g2_168 g2_169 g2_170 g2_171 g2_172 g2_173 g2_174 g2_175 
g2_176 g2_177 g2_178 g2_179 g2_180 g2_181 g2_182 g2_183 g2_184 g2_185 g2_186 g2_187 g2_188 g2_189 g2_190 g2_191 g2_192 g2_193 g2_194 g2_195 g2_196 g2_197 g2_198 g2_199 g2_200 
g2_201 g2_202 g2_203 g2_204 g2_205 g2_206 g2_207 g2_208 g2_209 g2_210 g2_211 g2_212 g2_213 g2_214 g2_215 g2_216 g2_217 g2_218 g2_219 g2_220 g2_221 g2_222 g2_223 g2_224 g2_225 
g2_226 g2_227 g2_228 g2_229 g2_230 g2_231 g2_232 g2_233 g2_234 g2_235 g2_236 g2_237 g2_238 g2_239 g2_240 g2_241 g2_242 g2_243 g2_244 g2_245 g2_246 g2_247 g2_248 g2_249 g2_250 
g2_251 g2_252 g2_253 g2_254 g2_255 g2_256 g2_257 g2_258 g2_259 g2_260 g2_261 g2_262 g2_263 g2_264 g2_265 g2_266 /*g2_267 g2_268 g2_269 g2_270 g2_271 g2_272 g2_273 g2_274 g2_275 
g2_276 g2_277 g2_278 g2_279 g2_280 g2_281 g2_282 g2_283 g2_284 g2_285 g2_286 g2_287 g2_288 g2_289 g2_290 g2_291 g2_292 g2_293 g2_294 g2_295 g2_296 g2_297 g2_298 g2_299 g2_300 
g2_301 g2_302 g2_303 g2_304 g2_305 g2_306 g2_307 g2_308 g2_309 g2_310 g2_311 g2_312 g2_313 g2_314*/

g3_1   g3_2   g3_3   g3_4   g3_5   g3_6   g3_7   g3_8   g3_9   g3_10  g3_11  g3_12  g3_13  g3_14  g3_15  g3_16  g3_17  g3_18  g3_19  g3_20  g3_21  g3_22  g3_23  /*g3_24  g3_25  
g3_26  g3_27  g3_28*/  g3_29  g3_30  g3_31  g3_32  g3_33  g3_34  g3_35  g3_36  g3_37  g3_38  g3_39  g3_40  g3_41  g3_42  g3_43  g3_44  g3_45  /*g3_46*/  g3_47  g3_48  g3_49  g3_50 
g3_51  g3_52  g3_53  g3_54  g3_55  g3_56  g3_57  g3_58  g3_59  g3_60  g3_61  g3_62  g3_63  g3_64  g3_65  g3_66  g3_67  g3_68  g3_69  g3_70  g3_71  g3_72  g3_73  g3_74  g3_75  
g3_76  g3_77  g3_78  g3_79  g3_80  g3_81  g3_82  g3_83  g3_84  g3_85  g3_86  g3_87  g3_88  g3_89  g3_90  g3_91  g3_92  g3_93  g3_94  g3_95  g3_96  g3_97  g3_98  g3_99  g3_100 
g3_101 g3_102 g3_103 g3_104 g3_105 g3_106 g3_107 g3_108 g3_109 g3_110 g3_111 g3_112 g3_113 g3_114 g3_115 g3_116 g3_117 g3_118 g3_119 g3_120 g3_121 g3_122 g3_123 g3_124 g3_125 
g3_126 g3_127 g3_128 g3_129 g3_130 g3_131 g3_132 g3_133 g3_134 g3_135 g3_136 g3_137 g3_138 g3_139 g3_140 g3_141 g3_142 g3_143 g3_144 g3_145 g3_146 g3_147 g3_148 g3_149 g3_150 
g3_151 g3_152 g3_153 g3_154 g3_155 g3_156 g3_157 g3_158 g3_159 g3_160 g3_161 g3_162 g3_163 g3_164 g3_165 g3_166 g3_167 g3_168 g3_169 g3_170 g3_171 g3_172 g3_173 g3_174 g3_175 
g3_176 g3_177 g3_178 g3_179 g3_180 g3_181 g3_182 g3_183 g3_184 g3_185 g3_186 g3_187 g3_188 g3_189 g3_190 g3_191 g3_192 g3_193 g3_194 g3_195 g3_196 g3_197 g3_198 g3_199 g3_200 
g3_201 g3_202 g3_203 g3_204 g3_205 g3_206 g3_207 g3_208 g3_209 g3_210 g3_211 g3_212 g3_213 g3_214 g3_215 g3_216 g3_217 g3_218 g3_219 g3_220 g3_221 g3_222 g3_223 g3_224 g3_225 
g3_226 g3_227 g3_228 g3_229 g3_230 g3_231 g3_232 g3_233 g3_234 g3_235 g3_236 g3_237 g3_238 g3_239 g3_240 g3_241 g3_242 g3_243 g3_244 g3_245 g3_246 g3_247 g3_248 g3_249 g3_250 
g3_251 g3_252 g3_253 g3_254 g3_255 g3_256 g3_257 g3_258 g3_259 g3_260 g3_261 g3_262 g3_263 g3_264 g3_265 g3_266 /*g3_267 g3_268 g3_269 g3_270 g3_271 g3_272 g3_273 g3_274 g3_275 
g3_276 g3_277 g3_278 g3_279 g3_280 g3_281 g3_282 g3_283 g3_284 g3_285 g3_286 g3_287 g3_288 g3_289 g3_290 g3_291 g3_292 g3_293 g3_294 g3_295 g3_296 g3_297 g3_298 g3_299 g3_300 
g3_301 g3_302 g3_303 g3_304 g3_305 g3_306 g3_307 g3_308 g3_309 g3_310 g3_311 g3_312 g3_313 g3_314*/
;
by cald;
run;

data d_c;
merge 
g4_1   g4_2   g4_3   g4_4   g4_5   g4_6   g4_7   g4_8   g4_9   g4_10  g4_11  g4_12  g4_13  g4_14  g4_15  g4_16  g4_17  g4_18  g4_19  g4_20  g4_21  g4_22  g4_23  /*g4_24  g4_25  
g4_26  g4_27  g4_28*/  g4_29  g4_30  g4_31  g4_32  g4_33  g4_34  g4_35  g4_36  g4_37  g4_38  g4_39  g4_40  g4_41  g4_42  g4_43  g4_44  g4_45  /*g4_46*/  g4_47  g4_48  g4_49  g4_50 
g4_51  g4_52  g4_53  g4_54  g4_55  g4_56  g4_57  g4_58  g4_59  g4_60  g4_61  g4_62  g4_63  g4_64  g4_65  g4_66  g4_67  g4_68  g4_69  g4_70  g4_71  g4_72  g4_73  g4_74  g4_75  
g4_76  g4_77  g4_78  g4_79  g4_80  g4_81  g4_82  g4_83  g4_84  g4_85  g4_86  g4_87  g4_88  g4_89  g4_90  g4_91  g4_92  g4_93  g4_94  g4_95  g4_96  g4_97  g4_98  g4_99  g4_100 
g4_101 g4_102 g4_103 g4_104 g4_105 g4_106 g4_107 g4_108 g4_109 g4_110 g4_111 g4_112 g4_113 g4_114 g4_115 g4_116 g4_117 g4_118 g4_119 g4_120 g4_121 g4_122 g4_123 g4_124 g4_125 
g4_126 g4_127 g4_128 g4_129 g4_130 g4_131 g4_132 g4_133 g4_134 g4_135 g4_136 g4_137 g4_138 g4_139 g4_140 g4_141 g4_142 g4_143 g4_144 g4_145 g4_146 g4_147 g4_148 g4_149 g4_150 
g4_151 g4_152 g4_153 g4_154 g4_155 g4_156 g4_157 g4_158 g4_159 g4_160 g4_161 g4_162 g4_163 g4_164 g4_165 g4_166 g4_167 g4_168 g4_169 g4_170 g4_171 g4_172 g4_173 g4_174 g4_175 
g4_176 g4_177 g4_178 g4_179 g4_180 g4_181 g4_182 g4_183 g4_184 g4_185 g4_186 g4_187 g4_188 g4_189 g4_190 g4_191 g4_192 g4_193 g4_194 g4_195 g4_196 g4_197 g4_198 g4_199 g4_200 
g4_201 g4_202 g4_203 g4_204 g4_205 g4_206 g4_207 g4_208 g4_209 g4_210 g4_211 g4_212 g4_213 g4_214 g4_215 g4_216 g4_217 g4_218 g4_219 g4_220 g4_221 g4_222 g4_223 g4_224 g4_225 
g4_226 g4_227 g4_228 g4_229 g4_230 g4_231 g4_232 g4_233 g4_234 g4_235 g4_236 g4_237 g4_238 g4_239 g4_240 g4_241 g4_242 g4_243 g4_244 g4_245 g4_246 g4_247 g4_248 g4_249 g4_250 
g4_251 g4_252 g4_253 g4_254 g4_255 g4_256 g4_257 g4_258 g4_259 g4_260 g4_261 g4_262 g4_263 g4_264 g4_265 g4_266 /*g4_267 g4_268 g4_269 g4_270 g4_271 g4_272 g4_273 g4_274 g4_275 
g4_276 g4_277 g4_278 g4_279 g4_280 g4_281 g4_282 g4_283 g4_284 g4_285 g4_286 g4_287 g4_288 g4_289 g4_290 g4_291 g4_292 g4_293 g4_294 g4_295 g4_296 g4_297 g4_298 g4_299 g4_300 
g4_301 g4_302 g4_303 g4_304 g4_305 g4_306 g4_307 g4_308 g4_309 g4_310 g4_311 g4_312 g4_313 g4_314*/

g5_1   g5_2   g5_3   g5_4   g5_5   g5_6   g5_7   g5_8   g5_9   g5_10  g5_11  g5_12  g5_13  g5_14  g5_15  g5_16  g5_17  g5_18  g5_19  g5_20  g5_21  g5_22  g5_23  /*g5_24  g5_25  
g5_26  g5_27  g5_28*/  g5_29  g5_30  g5_31  g5_32  g5_33  g5_34  g5_35  g5_36  g5_37  g5_38  g5_39  g5_40  g5_41  g5_42  g5_43  g5_44  g5_45  /*g5_46*/  g5_47  g5_48  g5_49  g5_50 
g5_51  g5_52  g5_53  g5_54  g5_55  g5_56  g5_57  g5_58  g5_59  g5_60  g5_61  g5_62  g5_63  g5_64  g5_65  g5_66  g5_67  g5_68  g5_69  g5_70  g5_71  g5_72  g5_73  g5_74  g5_75  
g5_76  g5_77  g5_78  g5_79  g5_80  g5_81  g5_82  g5_83  g5_84  g5_85  g5_86  g5_87  g5_88  g5_89  g5_90  g5_91  g5_92  g5_93  g5_94  g5_95  g5_96  g5_97  g5_98  g5_99  g5_100 
g5_101 g5_102 g5_103 g5_104 g5_105 g5_106 g5_107 g5_108 g5_109 g5_110 g5_111 g5_112 g5_113 g5_114 g5_115 g5_116 g5_117 g5_118 g5_119 g5_120 g5_121 g5_122 g5_123 g5_124 g5_125 
g5_126 g5_127 g5_128 g5_129 g5_130 g5_131 g5_132 g5_133 g5_134 g5_135 g5_136 g5_137 g5_138 g5_139 g5_140 g5_141 g5_142 g5_143 g5_144 g5_145 g5_146 g5_147 g5_148 g5_149 g5_150 
g5_151 g5_152 g5_153 g5_154 g5_155 g5_156 g5_157 g5_158 g5_159 g5_160 g5_161 g5_162 g5_163 g5_164 g5_165 g5_166 g5_167 g5_168 g5_169 g5_170 g5_171 g5_172 g5_173 g5_174 g5_175 
g5_176 g5_177 g5_178 g5_179 g5_180 g5_181 g5_182 g5_183 g5_184 g5_185 g5_186 g5_187 g5_188 g5_189 g5_190 g5_191 g5_192 g5_193 g5_194 g5_195 g5_196 g5_197 g5_198 g5_199 g5_200 
g5_201 g5_202 g5_203 g5_204 g5_205 g5_206 g5_207 g5_208 g5_209 g5_210 g5_211 g5_212 g5_213 g5_214 g5_215 g5_216 g5_217 g5_218 g5_219 g5_220 g5_221 g5_222 g5_223 g5_224 g5_225 
g5_226 g5_227 g5_228 g5_229 g5_230 g5_231 g5_232 g5_233 g5_234 g5_235 g5_236 g5_237 g5_238 g5_239 g5_240 g5_241 g5_242 g5_243 g5_244 g5_245 g5_246 g5_247 g5_248 g5_249 g5_250 
g5_251 g5_252 g5_253 g5_254 g5_255 g5_256 g5_257 g5_258 g5_259 g5_260 g5_261 g5_262 g5_263 g5_264 g5_265 g5_266 /*g5_267 g5_268 g5_269 g5_270 g5_271 g5_272 g5_273 g5_274 g5_275 
g5_276 g5_277 g5_278 g5_279 g5_280 g5_281 g5_282 g5_283 g5_284 g5_285 g5_286 g5_287 g5_288 g5_289 g5_290 g5_291 g5_292 g5_293 g5_294 g5_295 g5_296 g5_297 g5_298 g5_299 g5_300 
g5_301 g5_302 g5_303 g5_304 g5_305 g5_306 g5_307 g5_308 g5_309 g5_310 g5_311 g5_312 g5_313 g5_314*/
;
by cald;
run;

data d_d;
merge 
g6_1   g6_2   g6_3   g6_4   g6_5   g6_6   g6_7   g6_8   g6_9   g6_10  g6_11  g6_12  g6_13  g6_14  g6_15  g6_16  g6_17  g6_18  g6_19  g6_20  g6_21  g6_22  g6_23  /*g6_24  g6_25  
g6_26  g6_27  g6_28*/  g6_29  g6_30  g6_31  g6_32  g6_33  g6_34  g6_35  g6_36  g6_37  g6_38  g6_39  g6_40  g6_41  g6_42  g6_43  g6_44  g6_45  /*g6_46*/  g6_47  g6_48  g6_49  g6_50 
g6_51  g6_52  g6_53  g6_54  g6_55  g6_56  g6_57  g6_58  g6_59  g6_60  g6_61  g6_62  g6_63  g6_64  g6_65  g6_66  g6_67  g6_68  g6_69  g6_70  g6_71  g6_72  g6_73  g6_74  g6_75  
g6_76  g6_77  g6_78  g6_79  g6_80  g6_81  g6_82  g6_83  g6_84  g6_85  g6_86  g6_87  g6_88  g6_89  g6_90  g6_91  g6_92  g6_93  g6_94  g6_95  g6_96  g6_97  g6_98  g6_99  g6_100 
g6_101 g6_102 g6_103 g6_104 g6_105 g6_106 g6_107 g6_108 g6_109 g6_110 g6_111 g6_112 g6_113 g6_114 g6_115 g6_116 g6_117 g6_118 g6_119 g6_120 g6_121 g6_122 g6_123 g6_124 g6_125 
g6_126 g6_127 g6_128 g6_129 g6_130 g6_131 g6_132 g6_133 g6_134 g6_135 g6_136 g6_137 g6_138 g6_139 g6_140 g6_141 g6_142 g6_143 g6_144 g6_145 g6_146 g6_147 g6_148 g6_149 g6_150 
g6_151 g6_152 g6_153 g6_154 g6_155 g6_156 g6_157 g6_158 g6_159 g6_160 g6_161 g6_162 g6_163 g6_164 g6_165 g6_166 g6_167 g6_168 g6_169 g6_170 g6_171 g6_172 g6_173 g6_174 g6_175 
g6_176 g6_177 g6_178 g6_179 g6_180 g6_181 g6_182 g6_183 g6_184 g6_185 g6_186 g6_187 g6_188 g6_189 g6_190 g6_191 g6_192 g6_193 g6_194 g6_195 g6_196 g6_197 g6_198 g6_199 g6_200 
g6_201 g6_202 g6_203 g6_204 g6_205 g6_206 g6_207 g6_208 g6_209 g6_210 g6_211 g6_212 g6_213 g6_214 g6_215 g6_216 g6_217 g6_218 g6_219 g6_220 g6_221 g6_222 g6_223 g6_224 g6_225 
g6_226 g6_227 g6_228 g6_229 g6_230 g6_231 g6_232 g6_233 g6_234 g6_235 g6_236 g6_237 g6_238 g6_239 g6_240 g6_241 g6_242 g6_243 g6_244 g6_245 g6_246 g6_247 g6_248 g6_249 g6_250 
g6_251 g6_252 g6_253 g6_254 g6_255 g6_256 g6_257 g6_258 g6_259 g6_260 g6_261 g6_262 g6_263 g6_264 g6_265 g6_266 /*g6_267 g6_268 g6_269 g6_270 g6_271 g6_272 g6_273 g6_274 g6_275 
g6_276 g6_277 g6_278 g6_279 g6_280 g6_281 g6_282 g6_283 g6_284 g6_285 g6_286 g6_287 g6_288 g6_289 g6_290 g6_291 g6_292 g6_293 g6_294 g6_295 g6_296 g6_297 g6_298 g6_299 g6_300 
g6_301 g6_302 g6_303 g6_304 g6_305 g6_306 g6_307 g6_308 g6_309 g6_310 g6_311 g6_312 g6_313 g6_314*/

g7_1   g7_2   g7_3   g7_4   g7_5   g7_6   g7_7   g7_8   g7_9   g7_10  g7_11  g7_12  g7_13  g7_14  g7_15  g7_16  g7_17  g7_18  g7_19  g7_20  g7_21  g7_22  g7_23  /*g7_24  g7_25  
g7_26  g7_27  g7_28*/  g7_29  g7_30  g7_31  g7_32  g7_33  g7_34  g7_35  g7_36  g7_37  g7_38  g7_39  g7_40  g7_41  g7_42  g7_43  g7_44  g7_45  /*g7_46*/  g7_47  g7_48  g7_49  g7_50 
g7_51  g7_52  g7_53  g7_54  g7_55  g7_56  g7_57  g7_58  g7_59  g7_60  g7_61  g7_62  g7_63  g7_64  g7_65  g7_66  g7_67  g7_68  g7_69  g7_70  g7_71  g7_72  g7_73  g7_74  g7_75  
g7_76  g7_77  g7_78  g7_79  g7_80  g7_81  g7_82  g7_83  g7_84  g7_85  g7_86  g7_87  g7_88  g7_89  g7_90  g7_91  g7_92  g7_93  g7_94  g7_95  g7_96  g7_97  g7_98  g7_99  g7_100 
g7_101 g7_102 g7_103 g7_104 g7_105 g7_106 g7_107 g7_108 g7_109 g7_110 g7_111 g7_112 g7_113 g7_114 g7_115 g7_116 g7_117 g7_118 g7_119 g7_120 g7_121 g7_122 g7_123 g7_124 g7_125 
g7_126 g7_127 g7_128 g7_129 g7_130 g7_131 g7_132 g7_133 g7_134 g7_135 g7_136 g7_137 g7_138 g7_139 g7_140 g7_141 g7_142 g7_143 g7_144 g7_145 g7_146 g7_147 g7_148 g7_149 g7_150 
g7_151 g7_152 g7_153 g7_154 g7_155 g7_156 g7_157 g7_158 g7_159 g7_160 g7_161 g7_162 g7_163 g7_164 g7_165 g7_166 g7_167 g7_168 g7_169 g7_170 g7_171 g7_172 g7_173 g7_174 g7_175 
g7_176 g7_177 g7_178 g7_179 g7_180 g7_181 g7_182 g7_183 g7_184 g7_185 g7_186 g7_187 g7_188 g7_189 g7_190 g7_191 g7_192 g7_193 g7_194 g7_195 g7_196 g7_197 g7_198 g7_199 g7_200 
g7_201 g7_202 g7_203 g7_204 g7_205 g7_206 g7_207 g7_208 g7_209 g7_210 g7_211 g7_212 g7_213 g7_214 g7_215 g7_216 g7_217 g7_218 g7_219 g7_220 g7_221 g7_222 g7_223 g7_224 g7_225 
g7_226 g7_227 g7_228 g7_229 g7_230 g7_231 g7_232 g7_233 g7_234 g7_235 g7_236 g7_237 g7_238 g7_239 g7_240 g7_241 g7_242 g7_243 g7_244 g7_245 g7_246 g7_247 g7_248 g7_249 g7_250 
g7_251 g7_252 g7_253 g7_254 g7_255 g7_256 g7_257 g7_258 g7_259 g7_260 g7_261 g7_262 g7_263 g7_264 g7_265 g7_266 /*g7_267 g7_268 g7_269 g7_270 g7_271 g7_272 g7_273 g7_274 g7_275 
g7_276 g7_277 g7_278 g7_279 g7_280 g7_281 g7_282 g7_283 g7_284 g7_285 g7_286 g7_287 g7_288 g7_289 g7_290 g7_291 g7_292 g7_293 g7_294 g7_295 g7_296 g7_297 g7_298 g7_299 g7_300 
g7_301 g7_302 g7_303 g7_304 g7_305 g7_306 g7_307 g7_308 g7_309 g7_310 g7_311 g7_312 g7_313 g7_314*/
;
by cald;
run;

data d_e;
merge 
g8_1   g8_2   g8_3   g8_4   g8_5   g8_6   g8_7   g8_8   g8_9   g8_10  g8_11  g8_12  g8_13  g8_14  g8_15  g8_16  g8_17  g8_18  g8_19  g8_20  g8_21  g8_22  g8_23  /*g8_24  g8_25  
g8_26  g8_27  g8_28*/  g8_29  g8_30  g8_31  g8_32  g8_33  g8_34  g8_35  g8_36  g8_37  g8_38  g8_39  g8_40  g8_41  g8_42  g8_43  g8_44  g8_45  /*g8_46*/  g8_47  g8_48  g8_49  g8_50 
g8_51  g8_52  g8_53  g8_54  g8_55  g8_56  g8_57  g8_58  g8_59  g8_60  g8_61  g8_62  g8_63  g8_64  g8_65  g8_66  g8_67  g8_68  g8_69  g8_70  g8_71  g8_72  g8_73  g8_74  g8_75  
g8_76  g8_77  g8_78  g8_79  g8_80  g8_81  g8_82  g8_83  g8_84  g8_85  g8_86  g8_87  g8_88  g8_89  g8_90  g8_91  g8_92  g8_93  g8_94  g8_95  g8_96  g8_97  g8_98  g8_99  g8_100 
g8_101 g8_102 g8_103 g8_104 g8_105 g8_106 g8_107 g8_108 g8_109 g8_110 g8_111 g8_112 g8_113 g8_114 g8_115 g8_116 g8_117 g8_118 g8_119 g8_120 g8_121 g8_122 g8_123 g8_124 g8_125 
g8_126 g8_127 g8_128 g8_129 g8_130 g8_131 g8_132 g8_133 g8_134 g8_135 g8_136 g8_137 g8_138 g8_139 g8_140 g8_141 g8_142 g8_143 g8_144 g8_145 g8_146 g8_147 g8_148 g8_149 g8_150 
g8_151 g8_152 g8_153 g8_154 g8_155 g8_156 g8_157 g8_158 g8_159 g8_160 g8_161 g8_162 g8_163 g8_164 g8_165 g8_166 g8_167 g8_168 g8_169 g8_170 g8_171 g8_172 g8_173 g8_174 g8_175 
g8_176 g8_177 g8_178 g8_179 g8_180 g8_181 g8_182 g8_183 g8_184 g8_185 g8_186 g8_187 g8_188 g8_189 g8_190 g8_191 g8_192 g8_193 g8_194 g8_195 g8_196 g8_197 g8_198 g8_199 g8_200 
g8_201 g8_202 g8_203 g8_204 g8_205 g8_206 g8_207 g8_208 g8_209 g8_210 g8_211 g8_212 g8_213 g8_214 g8_215 g8_216 g8_217 g8_218 g8_219 g8_220 g8_221 g8_222 g8_223 g8_224 g8_225 
g8_226 g8_227 g8_228 g8_229 g8_230 g8_231 g8_232 g8_233 g8_234 g8_235 g8_236 g8_237 g8_238 g8_239 g8_240 g8_241 g8_242 g8_243 g8_244 g8_245 g8_246 g8_247 g8_248 g8_249 g8_250 
g8_251 g8_252 g8_253 g8_254 g8_255 g8_256 g8_257 g8_258 g8_259 g8_260 g8_261 g8_262 g8_263 g8_264 g8_265 g8_266 /*g8_267 g8_268 g8_269 g8_270 g8_271 g8_272 g8_273 g8_274 g8_275 
g8_276 g8_277 g8_278 g8_279 g8_280 g8_281 g8_282 g8_283 g8_284 g8_285 g8_286 g8_287 g8_288 g8_289 g8_290 g8_291 g8_292 g8_293 g8_294 g8_295 g8_296 g8_297 g8_298 g8_299 g8_300 
g8_301 g8_302 g8_303 g8_304 g8_305 g8_306 g8_307 g8_308 g8_309 g8_310 g8_311 g8_312 g8_313 g8_314*/

g9_1   g9_2   g9_3   g9_4   g9_5   g9_6   g9_7   g9_8   g9_9   g9_10  g9_11  g9_12  g9_13  g9_14  g9_15  g9_16  g9_17  g9_18  g9_19  g9_20  g9_21  g9_22  g9_23  /*g9_24  g9_25  
g9_26  g9_27  g9_28*/  g9_29  g9_30  g9_31  g9_32  g9_33  g9_34  g9_35  g9_36  g9_37  g9_38  g9_39  g9_40  g9_41  g9_42  g9_43  g9_44  g9_45  /*g9_46*/  g9_47  g9_48  g9_49  g9_50 
g9_51  g9_52  g9_53  g9_54  g9_55  g9_56  g9_57  g9_58  g9_59  g9_60  g9_61  g9_62  g9_63  g9_64  g9_65  g9_66  g9_67  g9_68  g9_69  g9_70  g9_71  g9_72  g9_73  g9_74  g9_75  
g9_76  g9_77  g9_78  g9_79  g9_80  g9_81  g9_82  g9_83  g9_84  g9_85  g9_86  g9_87  g9_88  g9_89  g9_90  g9_91  g9_92  g9_93  g9_94  g9_95  g9_96  g9_97  g9_98  g9_99  g9_100 
g9_101 g9_102 g9_103 g9_104 g9_105 g9_106 g9_107 g9_108 g9_109 g9_110 g9_111 g9_112 g9_113 g9_114 g9_115 g9_116 g9_117 g9_118 g9_119 g9_120 g9_121 g9_122 g9_123 g9_124 g9_125 
g9_126 g9_127 g9_128 g9_129 g9_130 g9_131 g9_132 g9_133 g9_134 g9_135 g9_136 g9_137 g9_138 g9_139 g9_140 g9_141 g9_142 g9_143 g9_144 g9_145 g9_146 g9_147 g9_148 g9_149 g9_150 
g9_151 g9_152 g9_153 g9_154 g9_155 g9_156 g9_157 g9_158 g9_159 g9_160 g9_161 g9_162 g9_163 g9_164 g9_165 g9_166 g9_167 g9_168 g9_169 g9_170 g9_171 g9_172 g9_173 g9_174 g9_175 
g9_176 g9_177 g9_178 g9_179 g9_180 g9_181 g9_182 g9_183 g9_184 g9_185 g9_186 g9_187 g9_188 g9_189 g9_190 g9_191 g9_192 g9_193 g9_194 g9_195 g9_196 g9_197 g9_198 g9_199 g9_200 
g9_201 g9_202 g9_203 g9_204 g9_205 g9_206 g9_207 g9_208 g9_209 g9_210 g9_211 g9_212 g9_213 g9_214 g9_215 g9_216 g9_217 g9_218 g9_219 g9_220 g9_221 g9_222 g9_223 g9_224 g9_225 
g9_226 g9_227 g9_228 g9_229 g9_230 g9_231 g9_232 g9_233 g9_234 g9_235 g9_236 g9_237 g9_238 g9_239 g9_240 g9_241 g9_242 g9_243 g9_244 g9_245 g9_246 g9_247 g9_248 g9_249 g9_250 
g9_251 g9_252 g9_253 g9_254 g9_255 g9_256 g9_257 g9_258 g9_259 g9_260 g9_261 g9_262 g9_263 g9_264 g9_265 g9_266 /*g9_267 g9_268 g9_269 g9_270 g9_271 g9_272 g9_273 g9_274 g9_275 
g9_276 g9_277 g9_278 g9_279 g9_280 g9_281 g9_282 g9_283 g9_284 g9_285 g9_286 g9_287 g9_288 g9_289 g9_290 g9_291 g9_292 g9_293 g9_294 g9_295 g9_296 g9_297 g9_298 g9_299 g9_300 
g9_301 g9_302 g9_303 g9_304 g9_305 g9_306 g9_307 g9_308 g9_309 g9_310 g9_311 g9_312 g9_313 g9_314*/
;
by cald;
run;

data d_f;
merge 
g10_1   g10_2   g10_3   g10_4   g10_5   g10_6   g10_7   g10_8   g10_9   g10_10  g10_11  g10_12  g10_13  g10_14  g10_15  g10_16  g10_17  g10_18  g10_19  g10_20  g10_21  g10_22  g10_23  /*g10_24  g10_25  
g10_26  g10_27  g10_28*/  g10_29  g10_30  g10_31  g10_32  g10_33  g10_34  g10_35  g10_36  g10_37  g10_38  g10_39  g10_40  g10_41  g10_42  g10_43  g10_44  g10_45  /*g10_46*/  g10_47  g10_48  g10_49  g10_50 
g10_51  g10_52  g10_53  g10_54  g10_55  g10_56  g10_57  g10_58  g10_59  g10_60  g10_61  g10_62  g10_63  g10_64  g10_65  g10_66  g10_67  g10_68  g10_69  g10_70  g10_71  g10_72  g10_73  g10_74  g10_75  
g10_76  g10_77  g10_78  g10_79  g10_80  g10_81  g10_82  g10_83  g10_84  g10_85  g10_86  g10_87  g10_88  g10_89  g10_90  g10_91  g10_92  g10_93  g10_94  g10_95  g10_96  g10_97  g10_98  g10_99  g10_100 
g10_101 g10_102 g10_103 g10_104 g10_105 g10_106 g10_107 g10_108 g10_109 g10_110 g10_111 g10_112 g10_113 g10_114 g10_115 g10_116 g10_117 g10_118 g10_119 g10_120 g10_121 g10_122 g10_123 g10_124 g10_125 
g10_126 g10_127 g10_128 g10_129 g10_130 g10_131 g10_132 g10_133 g10_134 g10_135 g10_136 g10_137 g10_138 g10_139 g10_140 g10_141 g10_142 g10_143 g10_144 g10_145 g10_146 g10_147 g10_148 g10_149 g10_150 
g10_151 g10_152 g10_153 g10_154 g10_155 g10_156 g10_157 g10_158 g10_159 g10_160 g10_161 g10_162 g10_163 g10_164 g10_165 g10_166 g10_167 g10_168 g10_169 g10_170 g10_171 g10_172 g10_173 g10_174 g10_175 
g10_176 g10_177 g10_178 g10_179 g10_180 g10_181 g10_182 g10_183 g10_184 g10_185 g10_186 g10_187 g10_188 g10_189 g10_190 g10_191 g10_192 g10_193 g10_194 g10_195 g10_196 g10_197 g10_198 g10_199 g10_200 
g10_201 g10_202 g10_203 g10_204 g10_205 g10_206 g10_207 g10_208 g10_209 g10_210 g10_211 g10_212 g10_213 g10_214 g10_215 g10_216 g10_217 g10_218 g10_219 g10_220 g10_221 g10_222 g10_223 g10_224 g10_225 
g10_226 g10_227 g10_228 g10_229 g10_230 g10_231 g10_232 g10_233 g10_234 g10_235 g10_236 g10_237 g10_238 g10_239 g10_240 g10_241 g10_242 g10_243 g10_244 g10_245 g10_246 g10_247 g10_248 g10_249 g10_250 
g10_251 g10_252 g10_253 g10_254 g10_255 g10_256 g10_257 g10_258 g10_259 g10_260 g10_261 g10_262 g10_263 g10_264 g10_265 g10_266 /*g10_267 g10_268 g10_269 g10_270 g10_271 g10_272 g10_273 g10_274 g10_275 
g10_276 g10_277 g10_278 g10_279 g10_280 g10_281 g10_282 g10_283 g10_284 g10_285 g10_286 g10_287 g10_288 g10_289 g10_290 g10_291 g10_292 g10_293 g10_294 g10_295 g10_296 g10_297 g10_298 g10_299 g10_300 
g10_301 g10_302 g10_303 g10_304 g10_305 g10_306 g10_307 g10_308 g10_309 g10_310 g10_311 g10_312 g10_313 g10_314*/

g11_1   g11_2   g11_3   g11_4   g11_5   g11_6   g11_7   g11_8   g11_9   g11_10  g11_11  g11_12  g11_13  g11_14  g11_15  g11_16  g11_17  g11_18  g11_19  g11_20  g11_21  g11_22  g11_23  /*g11_24  g11_25  
g11_26  g11_27  g11_28*/  g11_29  g11_30  g11_31  g11_32  g11_33  g11_34  g11_35  g11_36  g11_37  g11_38  g11_39  g11_40  g11_41  g11_42  g11_43  g11_44  g11_45  /*g11_46*/  g11_47  g11_48  g11_49  g11_50 
g11_51  g11_52  g11_53  g11_54  g11_55  g11_56  g11_57  g11_58  g11_59  g11_60  g11_61  g11_62  g11_63  g11_64  g11_65  g11_66  g11_67  g11_68  g11_69  g11_70  g11_71  g11_72  g11_73  g11_74  g11_75  
g11_76  g11_77  g11_78  g11_79  g11_80  g11_81  g11_82  g11_83  g11_84  g11_85  g11_86  g11_87  g11_88  g11_89  g11_90  g11_91  g11_92  g11_93  g11_94  g11_95  g11_96  g11_97  g11_98  g11_99  g11_100 
g11_101 g11_102 g11_103 g11_104 g11_105 g11_106 g11_107 g11_108 g11_109 g11_110 g11_111 g11_112 g11_113 g11_114 g11_115 g11_116 g11_117 g11_118 g11_119 g11_120 g11_121 g11_122 g11_123 g11_124 g11_125 
g11_126 g11_127 g11_128 g11_129 g11_130 g11_131 g11_132 g11_133 g11_134 g11_135 g11_136 g11_137 g11_138 g11_139 g11_140 g11_141 g11_142 g11_143 g11_144 g11_145 g11_146 g11_147 g11_148 g11_149 g11_150 
g11_151 g11_152 g11_153 g11_154 g11_155 g11_156 g11_157 g11_158 g11_159 g11_160 g11_161 g11_162 g11_163 g11_164 g11_165 g11_166 g11_167 g11_168 g11_169 g11_170 g11_171 g11_172 g11_173 g11_174 g11_175 
g11_176 g11_177 g11_178 g11_179 g11_180 g11_181 g11_182 g11_183 g11_184 g11_185 g11_186 g11_187 g11_188 g11_189 g11_190 g11_191 g11_192 g11_193 g11_194 g11_195 g11_196 g11_197 g11_198 g11_199 g11_200 
g11_201 g11_202 g11_203 g11_204 g11_205 g11_206 g11_207 g11_208 g11_209 g11_210 g11_211 g11_212 g11_213 g11_214 g11_215 g11_216 g11_217 g11_218 g11_219 g11_220 g11_221 g11_222 g11_223 g11_224 g11_225 
g11_226 g11_227 g11_228 g11_229 g11_230 g11_231 g11_232 g11_233 g11_234 g11_235 g11_236 g11_237 g11_238 g11_239 g11_240 g11_241 g11_242 g11_243 g11_244 g11_245 g11_246 g11_247 g11_248 g11_249 g11_250 
g11_251 g11_252 g11_253 g11_254 g11_255 g11_256 g11_257 g11_258 g11_259 g11_260 g11_261 g11_262 g11_263 g11_264 g11_265 g11_266 /*g11_267 g11_268 g11_269 g11_270 g11_271 g11_272 g11_273 g11_274 g11_275 
g11_276 g11_277 g11_278 g11_279 g11_280 g11_281 g11_282 g11_283 g11_284 g11_285 g11_286 g11_287 g11_288 g11_289 g11_290 g11_291 g11_292 g11_293 g11_294 g11_295 g11_296 g11_297 g11_298 g11_299 g11_300 
g11_301 g11_302 g11_303 g11_304 g11_305 g11_306 g11_307 g11_308 g11_309 g11_310 g11_311 g11_312 g11_313 g11_314*/
;
by cald;
run;

data d_g;
merge 
g12_1   g12_2   g12_3   g12_4   g12_5   g12_6   g12_7   g12_8   g12_9   g12_10  g12_11  g12_12  g12_13  g12_14  g12_15  g12_16  g12_17  g12_18  g12_19  g12_20  g12_21  g12_22  g12_23  /*g12_24  g12_25  
g12_26  g12_27  g12_28*/  g12_29  g12_30  g12_31  g12_32  g12_33  g12_34  g12_35  g12_36  g12_37  g12_38  g12_39  g12_40  g12_41  g12_42  g12_43  g12_44  g12_45  /*g12_46*/  g12_47  g12_48  g12_49  g12_50 
g12_51  g12_52  g12_53  g12_54  g12_55  g12_56  g12_57  g12_58  g12_59  g12_60  g12_61  g12_62  g12_63  g12_64  g12_65  g12_66  g12_67  g12_68  g12_69  g12_70  g12_71  g12_72  g12_73  g12_74  g12_75  
g12_76  g12_77  g12_78  g12_79  g12_80  g12_81  g12_82  g12_83  g12_84  g12_85  g12_86  g12_87  g12_88  g12_89  g12_90  g12_91  g12_92  g12_93  g12_94  g12_95  g12_96  g12_97  g12_98  g12_99  g12_100 
g12_101 g12_102 g12_103 g12_104 g12_105 g12_106 g12_107 g12_108 g12_109 g12_110 g12_111 g12_112 g12_113 g12_114 g12_115 g12_116 g12_117 g12_118 g12_119 g12_120 g12_121 g12_122 g12_123 g12_124 g12_125 
g12_126 g12_127 g12_128 g12_129 g12_130 g12_131 g12_132 g12_133 g12_134 g12_135 g12_136 g12_137 g12_138 g12_139 g12_140 g12_141 g12_142 g12_143 g12_144 g12_145 g12_146 g12_147 g12_148 g12_149 g12_150 
g12_151 g12_152 g12_153 g12_154 g12_155 g12_156 g12_157 g12_158 g12_159 g12_160 g12_161 g12_162 g12_163 g12_164 g12_165 g12_166 g12_167 g12_168 g12_169 g12_170 g12_171 g12_172 g12_173 g12_174 g12_175 
g12_176 g12_177 g12_178 g12_179 g12_180 g12_181 g12_182 g12_183 g12_184 g12_185 g12_186 g12_187 g12_188 g12_189 g12_190 g12_191 g12_192 g12_193 g12_194 g12_195 g12_196 g12_197 g12_198 g12_199 g12_200 
g12_201 g12_202 g12_203 g12_204 g12_205 g12_206 g12_207 g12_208 g12_209 g12_210 g12_211 g12_212 g12_213 g12_214 g12_215 g12_216 g12_217 g12_218 g12_219 g12_220 g12_221 g12_222 g12_223 g12_224 g12_225 
g12_226 g12_227 g12_228 g12_229 g12_230 g12_231 g12_232 g12_233 g12_234 g12_235 g12_236 g12_237 g12_238 g12_239 g12_240 g12_241 g12_242 g12_243 g12_244 g12_245 g12_246 g12_247 g12_248 g12_249 g12_250 
g12_251 g12_252 g12_253 g12_254 g12_255 g12_256 g12_257 g12_258 g12_259 g12_260 g12_261 g12_262 g12_263 g12_264 g12_265 g12_266 /*g12_267 g12_268 g12_269 g12_270 g12_271 g12_272 g12_273 g12_274 g12_275 
g12_276 g12_277 g12_278 g12_279 g12_280 g12_281 g12_282 g12_283 g12_284 g12_285 g12_286 g12_287 g12_288 g12_289 g12_290 g12_291 g12_292 g12_293 g12_294 g12_295 g12_296 g12_297 g12_298 g12_299 g12_300 
g12_301 g12_302 g12_303 g12_304 g12_305 g12_306 g12_307 g12_308 g12_309 g12_310 g12_311 g12_312 g12_313 g12_314*/

g13_1   g13_2   g13_3   g13_4   g13_5   g13_6   g13_7   g13_8   g13_9   g13_10  g13_11  g13_12  g13_13  g13_14  g13_15  g13_16  g13_17  g13_18  g13_19  g13_20  g13_21  g13_22  g13_23  /*g13_24  g13_25  
g13_26  g13_27  g13_28*/  g13_29  g13_30  g13_31  g13_32  g13_33  g13_34  g13_35  g13_36  g13_37  g13_38  g13_39  g13_40  g13_41  g13_42  g13_43  g13_44  g13_45  /*g13_46*/  g13_47  g13_48  g13_49  g13_50 
g13_51  g13_52  g13_53  g13_54  g13_55  g13_56  g13_57  g13_58  g13_59  g13_60  g13_61  g13_62  g13_63  g13_64  g13_65  g13_66  g13_67  g13_68  g13_69  g13_70  g13_71  g13_72  g13_73  g13_74  g13_75  
g13_76  g13_77  g13_78  g13_79  g13_80  g13_81  g13_82  g13_83  g13_84  g13_85  g13_86  g13_87  g13_88  g13_89  g13_90  g13_91  g13_92  g13_93  g13_94  g13_95  g13_96  g13_97  g13_98  g13_99  g13_100 
g13_101 g13_102 g13_103 g13_104 g13_105 g13_106 g13_107 g13_108 g13_109 g13_110 g13_111 g13_112 g13_113 g13_114 g13_115 g13_116 g13_117 g13_118 g13_119 g13_120 g13_121 g13_122 g13_123 g13_124 g13_125 
g13_126 g13_127 g13_128 g13_129 g13_130 g13_131 g13_132 g13_133 g13_134 g13_135 g13_136 g13_137 g13_138 g13_139 g13_140 g13_141 g13_142 g13_143 g13_144 g13_145 g13_146 g13_147 g13_148 g13_149 g13_150 
g13_151 g13_152 g13_153 g13_154 g13_155 g13_156 g13_157 g13_158 g13_159 g13_160 g13_161 g13_162 g13_163 g13_164 g13_165 g13_166 g13_167 g13_168 g13_169 g13_170 g13_171 g13_172 g13_173 g13_174 g13_175 
g13_176 g13_177 g13_178 g13_179 g13_180 g13_181 g13_182 g13_183 g13_184 g13_185 g13_186 g13_187 g13_188 g13_189 g13_190 g13_191 g13_192 g13_193 g13_194 g13_195 g13_196 g13_197 g13_198 g13_199 g13_200 
g13_201 g13_202 g13_203 g13_204 g13_205 g13_206 g13_207 g13_208 g13_209 g13_210 g13_211 g13_212 g13_213 g13_214 g13_215 g13_216 g13_217 g13_218 g13_219 g13_220 g13_221 g13_222 g13_223 g13_224 g13_225 
g13_226 g13_227 g13_228 g13_229 g13_230 g13_231 g13_232 g13_233 g13_234 g13_235 g13_236 g13_237 g13_238 g13_239 g13_240 g13_241 g13_242 g13_243 g13_244 g13_245 g13_246 g13_247 g13_248 g13_249 g13_250 
g13_251 g13_252 g13_253 g13_254 g13_255 g13_256 g13_257 g13_258 g13_259 g13_260 g13_261 g13_262 g13_263 g13_264 g13_265 g13_266 /*g13_267 g13_268 g13_269 g13_270 g13_271 g13_272 g13_273 g13_274 g13_275 
g13_276 g13_277 g13_278 g13_279 g13_280 g13_281 g13_282 g13_283 g13_284 g13_285 g13_286 g13_287 g13_288 g13_289 g13_290 g13_291 g13_292 g13_293 g13_294 g13_295 g13_296 g13_297 g13_298 g13_299 g13_300 
g13_301 g13_302 g13_303 g13_304 g13_305 g13_306 g13_307 g13_308 g13_309 g13_310 g13_311 g13_312 g13_313 g13_314*/
;
by cald;
run;

data d_h;
merge 
g14_1   g14_2   g14_3   g14_4   g14_5   g14_6   g14_7   g14_8   g14_9   g14_10  g14_11  g14_12  g14_13  g14_14  g14_15  g14_16  g14_17  g14_18  g14_19  g14_20  g14_21  g14_22  g14_23  /*g14_24  g14_25  
g14_26  g14_27  g14_28*/  g14_29  g14_30  g14_31  g14_32  g14_33  g14_34  g14_35  g14_36  g14_37  g14_38  g14_39  g14_40  g14_41  g14_42  g14_43  g14_44  g14_45  /*g14_46*/  g14_47  g14_48  g14_49  g14_50 
g14_51  g14_52  g14_53  g14_54  g14_55  g14_56  g14_57  g14_58  g14_59  g14_60  g14_61  g14_62  g14_63  g14_64  g14_65  g14_66  g14_67  g14_68  g14_69  g14_70  g14_71  g14_72  g14_73  g14_74  g14_75  
g14_76  g14_77  g14_78  g14_79  g14_80  g14_81  g14_82  g14_83  g14_84  g14_85  g14_86  g14_87  g14_88  g14_89  g14_90  g14_91  g14_92  g14_93  g14_94  g14_95  g14_96  g14_97  g14_98  g14_99  g14_100 
g14_101 g14_102 g14_103 g14_104 g14_105 g14_106 g14_107 g14_108 g14_109 g14_110 g14_111 g14_112 g14_113 g14_114 g14_115 g14_116 g14_117 g14_118 g14_119 g14_120 g14_121 g14_122 g14_123 g14_124 g14_125 
g14_126 g14_127 g14_128 g14_129 g14_130 g14_131 g14_132 g14_133 g14_134 g14_135 g14_136 g14_137 g14_138 g14_139 g14_140 g14_141 g14_142 g14_143 g14_144 g14_145 g14_146 g14_147 g14_148 g14_149 g14_150 
g14_151 g14_152 g14_153 g14_154 g14_155 g14_156 g14_157 g14_158 g14_159 g14_160 g14_161 g14_162 g14_163 g14_164 g14_165 g14_166 g14_167 g14_168 g14_169 g14_170 g14_171 g14_172 g14_173 g14_174 g14_175 
g14_176 g14_177 g14_178 g14_179 g14_180 g14_181 g14_182 g14_183 g14_184 g14_185 g14_186 g14_187 g14_188 g14_189 g14_190 g14_191 g14_192 g14_193 g14_194 g14_195 g14_196 g14_197 g14_198 g14_199 g14_200 
g14_201 g14_202 g14_203 g14_204 g14_205 g14_206 g14_207 g14_208 g14_209 g14_210 g14_211 g14_212 g14_213 g14_214 g14_215 g14_216 g14_217 g14_218 g14_219 g14_220 g14_221 g14_222 g14_223 g14_224 g14_225 
g14_226 g14_227 g14_228 g14_229 g14_230 g14_231 g14_232 g14_233 g14_234 g14_235 g14_236 g14_237 g14_238 g14_239 g14_240 g14_241 g14_242 g14_243 g14_244 g14_245 g14_246 g14_247 g14_248 g14_249 g14_250 
g14_251 g14_252 g14_253 g14_254 g14_255 g14_256 g14_257 g14_258 g14_259 g14_260 g14_261 g14_262 g14_263 g14_264 g14_265 g14_266 /*g14_267 g14_268 g14_269 g14_270 g14_271 g14_272 g14_273 g14_274 g14_275 
g14_276 g14_277 g14_278 g14_279 g14_280 g14_281 g14_282 g14_283 g14_284 g14_285 g14_286 g14_287 g14_288 g14_289 g14_290 g14_291 g14_292 g14_293 g14_294 g14_295 g14_296 g14_297 g14_298 g14_299 g14_300 
g14_301 g14_302 g14_303 g14_304 g14_305 g14_306 g14_307 g14_308 g14_309 g14_310 g14_311 g14_312 g14_313 g14_314*/
;
by cald;
run;

data d; merge d_a d_b d_c d_d d_e d_f d_g d_h;
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
ods rtf file = 'C:\Users\rmjlja9\Documents\GitHub\hiv-modelling\Zimbabwe\graphs_20250915.doc' startpage=never;


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

  
* av_newp_ge1;
proc sgplot data=d; 
Title    height=1.5 justify=center "av_newp_ge1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_av_newp_ge1_0  = "Baseline (median) - 15+";
label p50_av_newp_ge1_1  = "+ condom availability (median) - 15+";

series  x=cald y=p50_av_newp_ge1_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_av_newp_ge1_0 	upper=p95_av_newp_ge1_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_av_newp_ge1_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_av_newp_ge1_1 	upper=p95_av_newp_ge1_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

* av_newp_ge1_non_sw;
proc sgplot data=d; 
Title    height=1.5 justify=center "av_newp_ge1_non_sw";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 5 by 1) valueattrs=(size=10);
label p50_av_newp_ge1_non_sw_0  = "Baseline (median) - 15+";
label p50_av_newp_ge1_non_sw_1  = "+ condom availability (median) - 15+";

series  x=cald y=p50_av_newp_ge1_non_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_av_newp_ge1_non_sw_0 	upper=p95_av_newp_ge1_non_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_av_newp_ge1_non_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_av_newp_ge1_non_sw_1 	upper=p95_av_newp_ge1_non_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0  = "Baseline (median) - 15+";
label p50_p_newp_ge5__1  = "+ condom availability (median) - 15+";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
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
label p50_p_ep_0  = "Baseline (median) - 15+";
label p50_p_ep_1  = "+ condom availability (median) - 15+";
series  x=cald y=p50_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
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


* Proportion with condomless sex in past 3 months;
* (can compare this outcome with Goals);
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with condomless sex in past 3 months - p_m_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_m_npge1__0  = "Baseline (median) - 15+";
label p50_p_m_npge1__1  = "+ condom availability (median) - 15+";
series  x=cald y=p50_p_m_npge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_m_npge1__0 	upper=p95_p_m_npge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_m_npge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_m_npge1__1 	upper=p95_p_m_npge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women with condomless sex in past 3 months - p_w_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_w_npge1__0  = "Baseline (median) - 15+";
label p50_p_w_npge1__1  = "+ condom availability (median) - 15+";
series  x=cald y=p50_p_w_npge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_npge1__0 	upper=p95_p_m_npge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_w_npge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w_npge1__1 	upper=p95_p_w_npge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
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










* ------------------------ ;
* --- Checking options --- ;
* ------------------------ ;

* Incidence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Incidence (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 2 by 0.25) valueattrs=(size=10);
label mean_incidence1549__0 = "Baseline";
label mean_incidence1549__1 = "FSW - oral PrEP";
label mean_incidence1549__2 = "FSW - oral + len PrEP";
label mean_incidence1549__3 = "AGYW + pregnant women - oral PrEP";
label mean_incidence1549__4 = "AGYW + pregnant women - oral + len PrEP";
label mean_incidence1549__5 = "MSM - oral PrEP";
label mean_incidence1549__6 = "MSM - oral + len PrEP PrEP";
label mean_incidence1549__7 = "VMMC";
label mean_incidence1549__8 = "condoms";
label mean_incidence1549__9 = "KP programs";
label mean_incidence1549__10 = "testing";
label mean_incidence1549__11 = "adherence support";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=mean_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/* PrEP */
series  x=cald y=mean_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__2/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_incidence1549__2 	upper=p95_incidence1549__2  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__3/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_incidence1549__3 	upper=p95_incidence1549__3  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__4/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_incidence1549__4 	upper=p95_incidence1549__4  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__5/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__5 	upper=p95_incidence1549__5  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__6/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_incidence1549__6 	upper=p95_incidence1549__6  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
/* Prevention */
series  x=cald y=mean_incidence1549__7/	lineattrs = (color=darkorange thickness = 2);
band    x=cald lower=p5_incidence1549__7 	upper=p95_incidence1549__7  / transparency=0.9 fillattrs = (color=darkorange) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_incidence1549__8 	upper=p95_incidence1549__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
/* KP programs */
series  x=cald y=mean_incidence1549__9/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__9 	upper=p95_incidence1549__9  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
/* Testing and treatment */
series  x=cald y=mean_incidence1549__10/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_incidence1549__10 	upper=p95_incidence1549__10  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=mean_incidence1549__11/	lineattrs = (color=lightpurple thickness = 2);
band    x=cald lower=p5_incidence1549__11 	upper=p95_incidence1549__11  / transparency=0.9 fillattrs = (color=lightpurple) legendlabel= "Model 90% range";
/* Data */
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;


* Prevalence;
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label mean_prevalence1549__0 = "Baseline";
label mean_prevalence1549__1 = "FSW - oral PrEP";
label mean_prevalence1549__2 = "FSW - oral + len PrEP";
label mean_prevalence1549__3 = "AGYW + pregnant women - oral PrEP";
label mean_prevalence1549__4 = "AGYW + pregnant women - oral + len PrEP";
label mean_prevalence1549__5 = "MSM - oral PrEP";
label mean_prevalence1549__6 = "MSM - oral + len PrEP PrEP";
label mean_prevalence1549__7 = "VMMC";
label mean_prevalence1549__8 = "condoms";
label mean_prevalence1549__9 = "KP programs";
label mean_prevalence1549__10 = "testing";
label mean_prevalence1549__11 = "adherence support";
label o_prev1549_Z_ess = "CAL - ZIMPHIA or DHS";

series  x=cald y=mean_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/* PrEP */
series  x=cald y=mean_prevalence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549__2/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_prevalence1549__2 	upper=p95_prevalence1549__2  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549__3/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_prevalence1549__3 	upper=p95_prevalence1549__3  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549__4/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_prevalence1549__4 	upper=p95_prevalence1549__4  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549__5/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549__5 	upper=p95_prevalence1549__5  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549__6/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_prevalence1549__6 	upper=p95_prevalence1549__6  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
/* Prevention */
series  x=cald y=mean_prevalence1549__7/	lineattrs = (color=darkorange thickness = 2);
band    x=cald lower=p5_prevalence1549__7 	upper=p95_prevalence1549__7  / transparency=0.9 fillattrs = (color=darkorange) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_prevalence1549__8 	upper=p95_prevalence1549__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
/* KP programs */
series  x=cald y=mean_prevalence1549__9/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549__9 	upper=p95_prevalence1549__9  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
/* Testing and treatment */
series  x=cald y=mean_prevalence1549__10/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_prevalence1549__10 	upper=p95_prevalence1549__10  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=mean_prevalence1549__11/	lineattrs = (color=lightpurple thickness = 2);
band    x=cald lower=p5_prevalence1549__11 	upper=p95_prevalence1549__11  / transparency=0.9 fillattrs = (color=lightpurple) legendlabel= "Model 90% range";
/* Data */
scatter x=cald y=o_prev1549_Z_ess  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=black) errorbarattrs = (color = black) ;
run;
quit;

proc print data=d; var 
	mean_prevalence1549__0 
	mean_prevalence1549__1 
	mean_prevalence1549__2 
	mean_prevalence1549__3 
	mean_prevalence1549__4 
	mean_prevalence1549__5 
	mean_prevalence1549__6 
	mean_prevalence1549__7 
	mean_prevalence1549__8 
	mean_prevalence1549__9 
	mean_prevalence1549__10 
	mean_prevalence1549__11 
	mean_prevalence1549__12 
	mean_prevalence1549__13 
	mean_prevalence1549__14 
	;
	where cald=2050;
run;


* Number of new infections;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new HIV infections (age 15-49, mean)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000 by  10000) valueattrs=(size=10);*20000000 is stoping in 2023;
label mean_n_new_inf1549__0 = "Baseline";
label mean_n_new_inf1549__1 = "FSW - oral PrEP";
label mean_n_new_inf1549__2 = "FSW - oral + len PrEP";
label mean_n_new_inf1549__3 = "AGYW + pregnant women - oral PrEP";
label mean_n_new_inf1549__4 = "AGYW + pregnant women - oral + len PrEP";
label mean_n_new_inf1549__5 = "MSM - oral PrEP";
label mean_n_new_inf1549__6 = "MSM - oral + len PrEP PrEP";
label mean_n_new_inf1549__7 = "VMMC";
label mean_n_new_inf1549__8 = "condoms";
label mean_n_new_inf1549__9 = "KP programs";
label mean_n_new_inf1549__10 = "testing";
label mean_n_new_inf1549__11 = "adherence support";

series  x=cald y=mean_n_new_inf1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_new_inf1549__0 	upper=p95_n_new_inf1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
/* PrEP */
series  x=cald y=mean_n_new_inf1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_new_inf1549__1 	upper=p95_n_new_inf1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__2/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_n_new_inf1549__2 	upper=p95_n_new_inf1549__2  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__3/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_new_inf1549__3 	upper=p95_n_new_inf1549__3  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__4/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_new_inf1549__4 	upper=p95_n_new_inf1549__4  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__5/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_new_inf1549__5 	upper=p95_n_new_inf1549__5  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__6/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_new_inf1549__6 	upper=p95_n_new_inf1549__6  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
/* Prevention */
series  x=cald y=mean_n_new_inf1549__7/	lineattrs = (color=darkorange thickness = 2);
band    x=cald lower=p5_n_new_inf1549__7 	upper=p95_n_new_inf1549__7  / transparency=0.9 fillattrs = (color=darkorange) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__8/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_n_new_inf1549__8 	upper=p95_n_new_inf1549__8  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";
/* KP programs */
series  x=cald y=mean_n_new_inf1549__9/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_new_inf1549__9 	upper=p95_n_new_inf1549__9  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
/* Testing and treatment */
series  x=cald y=mean_n_new_inf1549__10/	lineattrs = (color=purple thickness = 2);
band    x=cald lower=p5_n_new_inf1549__10 	upper=p95_n_new_inf1549__10  / transparency=0.9 fillattrs = (color=purple) legendlabel= "Model 90% range";
series  x=cald y=mean_n_new_inf1549__11/	lineattrs = (color=lightpurple thickness = 2);
band    x=cald lower=p5_n_new_inf1549__11 	upper=p95_n_new_inf1549__11  / transparency=0.9 fillattrs = (color=lightpurple) legendlabel= "Model 90% range";
run;
quit;

proc print data=d; var 
	mean_n_new_inf1549__0 
	mean_n_new_inf1549__1 
	mean_n_new_inf1549__2 
	mean_n_new_inf1549__3 
	mean_n_new_inf1549__4 
	mean_n_new_inf1549__5 
	mean_n_new_inf1549__6 
	mean_n_new_inf1549__7 
	mean_n_new_inf1549__8 
	mean_n_new_inf1549__9 
	mean_n_new_inf1549__10 
	mean_n_new_inf1549__11 
	mean_n_new_inf1549__12 
	mean_n_new_inf1549__13 
	mean_n_new_inf1549__14 
	;
	where cald=2050;
run;






* ----------------- ;
* --- 1-6. PrEP --- ;
* ----------------- ;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on PrEP, mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 350000   by 50000 ) valueattrs=(size=10);
label mean_n_prep_0 = "Baseline";
label mean_n_prep_1 = "FSW - oral PrEP";
label mean_n_prep_2 = "FSW - oral + len PrEP";
label mean_n_prep_3 = "AGYW + pregnant women - oral PrEP";
label mean_n_prep_4 = "AGYW + pregnant women - oral + len PrEP";
label mean_n_prep_5 = "MSM - oral PrEP";
label mean_n_prep_6 = "MSM - oral + len PrEP PrEP";
series  x=cald y=mean_n_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_0 	upper=p95_n_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_2/	lineattrs = (color=pink thickness = 2);
band    x=cald lower=p5_n_prep_2 	upper=p95_n_prep_2  / transparency=0.9 fillattrs = (color=pink) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_3/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_n_prep_3 	upper=p95_n_prep_3  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_4/	lineattrs = (color=lightblue thickness = 2);
band    x=cald lower=p5_n_prep_4 	upper=p95_n_prep_4  / transparency=0.9 fillattrs = (color=lightblue) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_5/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_5 	upper=p95_n_prep_5  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_n_prep_6/	lineattrs = (color=lightgreen thickness = 2);
band    x=cald lower=p5_n_prep_6 	upper=p95_n_prep_6  / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "Model 90% range";
run;quit;


proc print data=d; var 
	mean_n_prep_0 
	mean_n_prep_1 
	mean_n_prep_2 
	mean_n_prep_3 
	mean_n_prep_4 
	mean_n_prep_5 
	mean_n_prep_6
	;
	where cald=2030;
run;

proc print data=d; var 
	mean_n_prep_oral_sw_0		mean_n_prep_len_sw_0 
	mean_n_prep_oral_1524w_0	mean_n_prep_len_1524w_0 
	mean_n_prep_oral_plw_0		mean_n_prep_len_plw_0

	mean_n_prep_oral_sw_1		mean_n_prep_len_sw_1 
	mean_n_prep_oral_1524w_1	mean_n_prep_len_1524w_1 
	mean_n_prep_oral_plw_1		mean_n_prep_len_plw_1

	mean_n_prep_oral_sw_2		mean_n_prep_len_sw_2 
	mean_n_prep_oral_1524w_2	mean_n_prep_len_1524w_2 
	mean_n_prep_oral_plw_2		mean_n_prep_len_plw_2
	;
	where cald=2030;
run;


* Proportion of all AGYW on PrEP;
proc print data=d; var 
	mean_prop_w_1524_onprep_0 
	mean_prop_w_1524_onprep_3 
	mean_prop_w_1524_onprep_4 
	;
	where cald=2030;
run;

* Proportion of AGYW w/ newp ge1 on PrEP;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP among those with at least 1 newp, mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);
label mean_p_w1524newpge1_onprep_0 = "Baseline";
label mean_p_w1524newpge1_onprep_3 = "FSW - oral PrEP";
label mean_p_w1524newpge1_onprep_4 = "FSW - oral + len PrEP";
series  x=cald y=mean_p_w1524newpge1_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_0 	upper=p95_p_w1524newpge1_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w1524newpge1_onprep_3/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_3 	upper=p95_p_w1524newpge1_onprep_3  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w1524newpge1_onprep_4/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_4 	upper=p95_p_w1524newpge1_onprep_4  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc print data=d; var 
	mean_p_w1524newpge1_onprep_0 
	mean_p_w1524newpge1_onprep_3 
	mean_p_w1524newpge1_onprep_4 
	;
	where cald=2030;
run;





* --------------- ;
* --- 7. VMMC --- ;
* --------------- ;
* p_mcirc_1549m	p_mcirc_1049m	n_new_vmmc	n_new_vmmc1549m 	n_new_vmmc1049m  n_new_vmmc1014m	n_new_birth_circ n_new_mcirc n_new_mcirc_1549m 	n_new_mcirc_1049m
p_vmmc_1549m	p_vmmc_1049m;

*!!!!!Note that the observed data are 15+;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised, mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_mcirc_1549m_0 = "Baseline";
label mean_p_mcirc_1549m_7 = "circ_inc_rate_year_i=0";
label mean_p_mcirc_1549m_12 = "circ_inc_rate_year_i=1";
label mean_p_mcirc_1549m_13 = "circ_inc_rate_year_i=3";
label mean_p_mcirc_1549m_14 = "circ_inc_rate_year_i=4";

series  x=cald y=mean_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_7/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_7 	upper=p95_p_mcirc_1549m_7  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_12/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_12 	upper=p95_p_mcirc_1549m_12  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_13/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_13 	upper=p95_p_mcirc_1549m_13  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_14/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_14 	upper=p95_p_mcirc_1549m_14  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

label o_p_circ_15pl_DHS_z= "CAL - DHIS2 men 15+";
label o_p_circ_1549_zimphia= "ZIMPHIA men 15-49";
label o_p_circ_1549_zimphia= "NSP target";
scatter  x=cald y=o_p_circ_15pl_DHS_z /	markerattrs = (color=orange);
scatter  x=cald y=o_p_circ_1549_zimphia /	markerattrs = (color=blue);
scatter  x=cald y=target_p_circ_1549m_NSP /	markerattrs = (color=pink);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised, mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_mcirc_1549m_0 = "Baseline";
label mean_p_mcirc_1549m_7 = "circ_inc_rate_year_i=0";
label mean_p_mcirc_1549m_12 = "circ_inc_rate_year_i=1";
label mean_p_mcirc_1549m_13 = "circ_inc_rate_year_i=3";
label mean_p_mcirc_1549m_14 = "circ_inc_rate_year_i=4";

series  x=cald y=mean_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_7/	lineattrs = (color=blue thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_7 	upper=p95_p_mcirc_1549m_7  / transparency=0.9 fillattrs = (color=blue) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_12/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_12 	upper=p95_p_mcirc_1549m_12  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_13/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_13 	upper=p95_p_mcirc_1549m_13  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=mean_p_mcirc_1549m_14/	lineattrs = (color=orange thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_14 	upper=p95_p_mcirc_1549m_14  / transparency=0.9 fillattrs = (color=orange) legendlabel= "Model 90% range";

label o_p_circ_15pl_DHS_z= "CAL - DHIS2 men 15+";
label o_p_circ_1549_zimphia= "ZIMPHIA men 15-49";
label o_p_circ_1549_zimphia= "NSP target";
scatter  x=cald y=o_p_circ_15pl_DHS_z /	markerattrs = (color=orange);
scatter  x=cald y=o_p_circ_1549_zimphia /	markerattrs = (color=blue);
scatter  x=cald y=target_p_circ_1549m_NSP /	markerattrs = (color=pink);
run;quit;



* ------------------- ;
* --- 8. Condoms  --- ;
* ------------------- ;
* n_w1524_newp_ge1_ p_newp_ge1_ p_newp_ge5_ p_1524_newp_ge1_ p_ep p_m_npge1_ p_w_npge1_ p_w1524_npge1_ p_sw_npge1_
log_gender_r_newp av_newp_ge1  av_newp_ge1_non_sw;

* p_newp;
proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_, mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.25 /*0.2*/ by 0.05) valueattrs=(size=10);
label mean_p_newp_ge1__0  = "Baseline (median) - 15+";
label mean_p_newp_ge1__8  = "+ condom availability (median) - 15+";

series  x=cald y=mean_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_newp_ge1__8/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__8 	upper=p95_p_newp_ge1__8  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep, mean";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label mean_p_ep_0  = "Baseline (median) - 15+";
label mean_p_ep_8  = "+ condom availability (median) - 15+";
series  x=cald y=mean_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_ep_8/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ep_8 	upper=p95_p_ep_8  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;


* Proportion with condomless sex in past 3 months;
* (can compare this outcome with Goals);
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men with condomless sex in past 3 months - p_m_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_m_npge1__0  = "Baseline (median) - 15+";
label mean_p_m_npge1__8  = "+ condom availability (median) - 15+";
series  x=cald y=mean_p_m_npge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_m_npge1__0 	upper=p95_p_m_npge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_m_npge1__8/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_m_npge1__8 	upper=p95_p_m_npge1__8  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women with condomless sex in past 3 months - p_w_npge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (&year_start to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label mean_p_w_npge1__0  = "Baseline (median) - 15+";
label mean_p_w_npge1__8  = "+ condom availability (median) - 15+";
series  x=cald y=mean_p_w_npge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_npge1__0 	upper=p95_p_m_npge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=mean_p_w_npge1__8/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w_npge1__8 	upper=p95_p_w_npge1__8  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
run;quit;




* ---------------------- ;
* --- 9. KP outreach --- ;
* ---------------------- ;

** Option 9 not working;

* Incidence in FSW;
* Prevalence in FSW;

* Incidence in MSM;
* Prevalence in MSM;

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












ods html close;

ods rtf close;run;







