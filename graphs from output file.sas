
***Program to produce graphs using averages across runs
***Use 'include' statment in analysis program to read the code below in;

libname a "C:\Users\ValentinaCambiano\Dropbox (UCL)\hiv synthesis ssa unified program\output files\zimbabwe";

run;
  proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";

  /*
  proc freq data=a.l_base_24_03_23;table 
n_tested_w_sympt n_tested_m_sympt 
n_tested_m_circ n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd
n_vm;run;*/
data b;
set a.l_base_20_06_23;


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



proc sort data=b; by option cald run ;run;
data b;set b;count_csim+1;by option cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=b;var count_csim cald;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 110  ;*out of 850;
%let year_end = 2022.75;*2071.75 ;
run;
/*proc freq data=b;table cald;run;*/
proc sort;by cald option ;run;

*INCLUDE ONLY STOCK VARIABLE AND VARIABLES THAT WE WANT TO GRAPH;
%let var =  
n_alive n_alive_m n_alive_w n_alive_1524m n_alive_1524w n_alive_2549m n_alive_2549w n_sw_1564_	prev_sti_sw
n_hivneg_sdpartner n_hivneg_sdpartneroffart n_hivnegw_sdpartner n_hivnegw_sdpartneroffart
n_not_on_art_cd4050_ n_not_on_art_cd450200_ n_not_on_art_cd4200350_ n_not_on_art_cd4350500_ n_not_on_art_cd4ge500_ 
n_asympt_Undiag n_asympt_diagoffart n_asympt_diagonart n_sympt_notaids n_sympt_aids
n_birth n_give_birth_w_hiv p_w_giv_birth_this_per n_w1524_newp_ge1_ p_newp_ge1_ p_newp_ge5_ p_ep p_m_npge1_ p_w_npge1_ p_w1524_npge1_ p_sw_npge1_
log_gender_r_newp  p_tested_past_year_1549m p_tested_past_year_1549w n_pmtct
p_mcirc_1549m	n_new_vmmc1549m 		
prop_w_1549_sw	prop_w_ever_sw 	prop_sw_hiv 	prop_w_1524_onprep  p_w1524newpge1_onprep prop_1564_onprep 	
n_prep n_prep_1524w n_prep_ever
n_init_prep_oral_1524w	n_init_prep_oral_sw		n_init_prep_oral_sdc	
/*n_init_prep_inj_1524w	n_init_prep_inj_sw		n_init_prep_inj_sdc		
n_init_prep_vr_1524w	n_init_prep_vr_sw		n_init_prep_vr_sdc*/
/*n_contprep_oral_1524w	n_contprep_oral_sw	n_contprep_oral_sdc	n_contprep_inj_1524w	n_contprep_inj_sw
n_contprep_inj_sdc		n_contprep_vr_1524w n_contprep_vr_sw	n_contprep_vr_sdc*/
n_hivge15m n_hivge15w n_hiv1524m n_hiv1524w n_hiv2549m n_hiv2549w n_hiv_sw
prevalence1549m prevalence1549w
prevalence1549_ prevalence_sw prevalence_hiv_preg prevalence1549preg prevalence1524preg prevalence_vg1000_  incidence1549_ incidence1549m incidence1549w incidence1564_ 
incidence1524w incidence1524m incidence2534w incidence2534m incidence3544w incidence3544m incidence4554w incidence4554m 
incidence5564w incidence5564m incidence_sw n_tested n_tested_m n_tested_w n_tested_sw n_tested_anc 
n_tested_m_sympt n_tested_w_sympt n_tested_m_circ n_tested_w_non_anc n_tested_w_labdel n_tested_w_pd
n_tested1st_anc n_tested1st_labdel n_tested1st_pd n_tested_anc_prevdiag
p_anc n_diagnosed n_diag_anc n_diag_labdel n_diag_pd
test_prop_positive
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive  p_inf_primary
mtct_prop 	p_diag  p_diag_m   p_diag_w			p_diag_m1524_ 		p_diag_w1524_	p_diag_sw	
n_cm n_vm p_vm_ly_onart n_pcp_p
p_ai_no_arv_c_nnm 				p_artexp_diag  
p_onart_diag	p_onart_diag_w 	p_onart_diag_m p_onart_diag_sw	p_onart_diag_w1524_ p_onart_diag_1524_  
p_efa 	p_taz		p_ten 	p_zdv	p_dol	p_3tc 	p_lpr 	p_nev 
p_onart_vl1000_   p_onart_vl1000_1524_ p_vl1000_ 	p_vg1000_ 		p_onart_vl1000_all	p_onart p_onart_m 	p_onart_w  p_onart_w1524_ p_onart_1524_ p_onart_sw
p_onart_artexp 	p_onart_artexp_m 	p_onart_artexp_w 	p_onart_artexp_1524_ 	p_onart_artexp_sw 	p_on_artexp_w1524evpreg
p_onart_vl1000_w				p_onart_vl1000_m  p_onart_vl1000_w1524evpr logm15r logm25r logm35r logm45r logm55r logw15r logw25r logw35r logw45r logw55r 
n_onart 		n_onart_m	n_onart_w n_onart_1524_ n_art_start_y
;
run;

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


%option_(0);
%option_(1);
%option_(15);
run;


data d; * this is number of variables in %let var = above ;
merge 
g0_1   g0_2   g0_3   g0_4   g0_5   g0_6   g0_7   g0_8   g0_9   g0_10  g0_11  g0_12  g0_13  g0_14  g0_15  g0_16  g0_17  g0_18  g0_19  g0_20  g0_21  g0_22  g0_23  g0_24  g0_25  g0_26 
g0_27  g0_28  g0_29  g0_30  g0_31  g0_32  g0_33  g0_34  g0_35  g0_36  g0_37  g0_38  g0_39  g0_40  g0_41  g0_42  g0_43  g0_44  g0_45  g0_46  g0_47  g0_48   g0_49  g0_50 
g0_51  g0_52 
g0_53  g0_54  g0_55  g0_56  g0_57  g0_58  g0_59  g0_60 g0_61  g0_62  g0_63  g0_64  g0_65  g0_66  g0_67  g0_68  g0_69  g0_70  g0_71 g0_72 g0_73 g0_74 g0_75  g0_76  g0_77 g0_78 
g0_79  g0_80  g0_81  g0_82  g0_83  g0_84  g0_85  g0_86  g0_87  g0_88  g0_89  g0_90 g0_91  g0_92  g0_93  g0_94  g0_95  g0_96  g0_97  g0_98  g0_99  g0_100 g0_101 g0_102 g0_103 g0_104
g0_105 g0_106 g0_107 g0_108 g0_109 g0_110 g0_111 g0_112 g0_113 g0_114 g0_115 g0_116 g0_117 g0_118 g0_119 g0_120 g0_121 g0_122 g0_123 g0_124 g0_125 g0_126 g0_127 g0_128 g0_129 g0_130 
g0_131 g0_132 g0_133 g0_134 g0_135 g0_136 g0_137 g0_138 g0_139 g0_140 g0_141 g0_142 g0_143 g0_144 g0_145 g0_146 g0_147 g0_148 g0_149 g0_150 g0_151 g0_152 g0_153 g0_154 g0_155 g0_156
g0_157 g0_158 g0_159 g0_160 g0_161 g0_162 g0_163 g0_164 g0_165 g0_166 g0_167 g0_168 g0_169 g0_170 g0_171 /*g0_172 g0_173 g0_174 g0_175 g0_176 g0_177 g0_178 g0_179 g0_180 g0_181 g0_182
g0_183 g0_184 g0_185 g0_186 g0_187 g0_188 g0_189 g0_190 g0_191 g0_192 g0_193 g0_194 g0_195 g0_196 g0_197 g0_198 g0_199 g0_200 g0_201 g0_202 g0_203 g0_204 g0_205 g0_206 g0_207 g0_208
g0_209 g0_210 g0_211 g0_212 g0_213 g0_214 g0_215 g0_216 g0_217 g0_218 g0_219 g0_220 g0_221 g0_222 g0_223 g0_224 g0_225 g0_226 g0_227 g0_228 g0_229 g0_230 g0_231 g0_232 g0_233 g0_234
g0_235 g0_236 g0_237 g0_238 g0_239 g0_240 g0_241 g0_242 g0_243 g0_244 g0_245 g0_246 g0_247 g0_248 g0_249 g0_250 g0_251 g0_252 
*/

g1_1   g1_2   g1_3   g1_4   g1_5   g1_6   g1_7   g1_8   g1_9   g1_10  g1_11  g1_12  g1_13  g1_14  g1_15  g1_16  g1_17  g1_18  g1_19  g1_20  g1_21  g1_22  g1_23  g1_24  g1_25  g1_26 
g1_27  g1_28  g1_29  g1_30  g1_31  g1_32  g1_33  g1_34  g1_35  g1_36  g1_37  g1_38  g1_39  g1_40  g1_41  g1_42  g1_43  g1_44  g1_45  g1_46  g1_47  g1_48   g1_49  g1_50 
g1_51  g1_52 
g1_53  g1_54  g1_55  g1_56  g1_57  g1_58  g1_59  g1_60 g1_61  g1_62  g1_63  g1_64  g1_65  g1_66  g1_67  g1_68  g1_69  g1_70  g1_71 g1_72 g1_73 g1_74 g1_75  g1_76  g1_77 g1_78 
g1_79  g1_80  g1_81  g1_82  g1_83  g1_84  g1_85  g1_86  g1_87  g1_88  g1_89  g1_90 g1_91  g1_92  g1_93  g1_94  g1_95  g1_96  g1_97  g1_98  g1_99  g1_100 g1_101 g1_102 g1_103 g1_104
g1_105 g1_106 g1_107 g1_108 g1_109 g1_110 g1_111 g1_112 g1_113 g1_114 g1_115 g1_116 g1_117 g1_118 g1_119 g1_120 g1_121 g1_122 g1_123 g1_124 g1_125 g1_126 g1_127 g1_128 g1_129 g1_130
g1_131 g1_132 g1_133 g1_134 g1_135 g1_136 g1_137 g1_138 g1_139 g1_140 g1_141 g1_142 g1_143 g1_144 g1_145 g1_146 g1_147 g1_148 g1_149 g1_150 g1_151 g1_152 g1_153 g1_154 g1_155 g1_156
g1_157 g1_158 g1_159 g1_160 g1_161 g1_162 g1_163 g1_164 g1_165 g1_166 g1_167 g1_168 g1_169 g1_170 g1_171 /*g1_172 g1_173 g1_174 g1_175 g1_176 g1_177 g1_178 g1_179 g1_180 g1_181 g1_182
g1_183 g1_184 g1_185 g1_186 g1_187 g1_188 g1_189 g1_190 g1_191 g1_192 g1_193 g1_194 g1_195 g1_196 g1_197 g1_198 g1_199 g1_200 g1_201 g1_202 g1_203 g1_204 g1_205 g1_206 g1_207 g1_208
g1_209 g1_210 g1_211 g1_212 g1_213 g1_214 g1_215 g1_216 g1_217 g1_218 g1_219 g1_220 g1_221 g1_222 g1_223 g1_224 g1_225 g1_226 g1_227 g1_228 g1_229 g1_230 g1_231 g1_232 g1_233 g1_234
g1_235 g1_236 g1_237 g1_238 g1_239 g1_240 g1_241 g1_242 g1_243 g1_244 g1_245 g1_246 g1_247 g1_248 g1_249 g1_250 g1_251 g1_252 
*/

g15_1   g15_2   g15_3   g15_4   g15_5   g15_6   g15_7   g15_8   g15_9   g15_10  g15_11  g15_12  g15_13  g15_14  g15_15  g15_16  g15_17  g15_18  g15_19  g15_20  g15_21  g15_22  g15_23  g15_24  g15_25  g15_26 
g15_27  g15_28  g15_29  g15_30  g15_31  g15_32  g15_33  g15_34  g15_35  g15_36  g15_37  g15_38  g15_39  g15_40  g15_41  g15_42  g15_43  g15_44  g15_45  g15_46  g15_47  g15_48   g15_49  g15_50 
g15_51  g15_52 
g15_53  g15_54  g15_55  g15_56  g15_57  g15_58  g15_59  g15_60 g15_61  g15_62  g15_63  g15_64  g15_65  g15_66  g15_67  g15_68  g15_69  g15_70  g15_71 g15_72 g15_73 g15_74 g15_75  g15_76  g15_77 g15_78 
g15_79  g15_80  g15_81  g15_82  g15_83  g15_84  g15_85  g15_86  g15_87  g15_88  g15_89  g15_90 g15_91  g15_92  g15_93  g15_94  g15_95  g15_96  g15_97  g15_98  g15_99  g15_100 g15_101 g15_102 g15_103 g15_104
g15_105 g15_106 g15_107 g15_108 g15_109 g15_110 g15_111 g15_112 g15_113 g15_114 g15_115 g15_116 g15_117 g15_118 g15_119 g15_120 g15_121 g15_122 g15_123 g15_124 g15_125 g15_126 g15_127 g15_128 g15_129 g15_130 
g15_131 g15_132 g15_133 g15_134 g15_135 g15_136 g15_137 g15_138 g15_139 g15_140 g15_141 g15_142 g15_143 g15_144 g15_145 g15_146 g15_147 g15_148 g15_149 g15_150 g15_151 g15_152 g15_153 g15_154 g15_155 g15_156
g15_157 g15_158 g15_159 g15_160 g15_161 g15_162 g15_163 g15_164 g15_165 g15_166 g15_167 g15_168 g15_169 g15_170 g15_171 /*g15_172 g15_173 g15_174 g15_175 g15_176 g15_177 g15_178 g15_179 g15_180 g15_181 g15_182
g15_183 g15_184 g15_185 g15_186 g15_187 g15_188 g15_189 g15_190 g15_191 g15_192 g15_193 g15_194 g15_195 g15_196 g15_197 g15_198 g15_199 g15_200 g15_201 g15_202 g15_203 g15_204 g15_205 g15_206 g15_207 g15_208
g15_209 g15_210 g15_211 g15_212 g15_213 g15_214 g15_215 g15_216 g15_217 g15_218 g15_219 g15_220 g15_221 g15_222 g15_223 g15_224 g15_225 g15_226 g15_227 g15_228 g15_229 g15_230 g15_231 g15_232 g15_233 g15_234
g15_235 g15_236 g15_237 g15_238 g15_239 g15_240 g15_241 g15_242 g15_243 g15_244 g15_245 g15_246 g15_247 g15_248 g15_249 g15_250 g15_251 g15_252 
*/
;
by cald;


%include "C:\Users\ValentinaCambiano\OneDrive - University College London\Documents\GitHub\hiv-modelling\Observed data_Zimbabwe.sas";
run;

data a.d;set d;run;
/*/data d;set a.d;run;*/
proc freq data=d;table cald;run;

***Graphs comparing observed data to outputs;
*Taken from Zim graphs in branch Death cascade;
ods graphics / reset imagefmt=jpeg height=4in width=6in; run;
ods rtf file = 'C:\Users\ValentinaCambiano\Projects\Modelling Consortium\MIHPSA\Zimbabwe\Phase 2 - Synthesis\Findings\V0_20230620_110sim.doc' startpage=never; 

*1 - essential;
*15 - PrEP in AGYW;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_alive 15+";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 25000000 by  5000000) valueattrs=(size=10);*20000000 is stoping in 2023;
label p50_n_alive_0 = "Baseline (median) - 15+ ";
label p50_n_alive_1 = "Essential (median) - 15+ ";
label p50_n_alive_15 = "Oral PrEP AGYW (median) - 15+ ";


*label p50_n_alive1549__0 = "Option 0 (median) - 15-49 ";
label o_pop_all_Zi_cens = "Census - All ages";
label o_pop_1549_Zi_cens = "Census - 15-49";
label o_pop_all_Zi_CIA = "CIA - All ages";
label o_pop_1565_Zi_CIA = "CIA - All 15-64";
series  x=cald y=p50_n_alive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_alive_0 	upper=p95_n_alive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_alive_1 	upper=p95_n_alive_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_alive_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_alive_15 	upper=p95_n_alive_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

*scatter x=cald y=o_pop_all_Zi_cens / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_pop_1549_Zi_cens / markerattrs = (symbol=square color=green size = 10);
*scatter x=cald y=o_pop_all_Zi_CIA / markerattrs = (symbol=triangle color=grey size = 10);
scatter x=cald y=o_pop_1565_Zi_CIA / markerattrs = (symbol=triangle color=brown size = 10);
run;quit;
/*
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
*scatter x=cald y=o_pop_allm_Zi_cens / markerattrs = (symbol=square color=darkblue size = 10);
*scatter x=cald y=o_pop_allw_Zi_cens / markerattrs = (symbol=square color=darkorange size = 10);
scatter x=cald y=o_pop_1549m_Zi_cens / markerattrs = (symbol=square color=lightblue size = 10);
scatter x=cald y=o_pop_1549w_Zi_cens / markerattrs = (symbol=square color=orange size = 10);
run;quit;
*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women giving birth this period";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_w_giv_birth_this_per_0 = "Option 0 (median) ";
label p50_p_w_giv_birth_this_per_1 = "Option 1 (median) ";
label p50_p_w_giv_birth_this_per_15 = "Option 15 (median) ";
series  x=cald y=p50_p_w_giv_birth_this_per_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_0 	upper=p95_p_w_giv_birth_this_per_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
series  x=cald y=p50_p_w_giv_birth_this_per_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_1 	upper=p95_p_w_giv_birth_this_per_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";
series  x=cald y=p50_p_w_giv_birth_this_per_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_w_giv_birth_this_per_15 	upper=p95_p_w_giv_birth_this_per_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 15 90% range";
run;
quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge1_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.2 by 0.05) valueattrs=(size=10);
label p50_p_newp_ge1__0  = "Baseline (median) - 15+";
label p50_p_newp_ge1__1  = "Essential (median) - 15+  ";
label p50_p_newp_ge1__15 = "Oral PrEP AGYW (median) - 15+ ";


series  x=cald y=p50_p_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge1__0 	upper=p95_p_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge1__1 	upper=p95_p_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge1__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge1__15 	upper=p95_p_newp_ge1__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;
/*
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
*/

*"Number of AGYW at elevated risk" n_w1524_newp_ge1; 
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of AGYW at elevated risk - n_w1524_newp_ge1";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by 50000) valueattrs=(size=10);
label p50_n_w1524_newp_ge1__0  = "Baseline (median) - 15+";
label p50_n_w1524_newp_ge1__1  = "Essential (median) - 15+  ";
label p50_n_w1524_newp_ge1__15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_w1524_newp_ge1__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_w1524_newp_ge1__0 	upper=p95_n_w1524_newp_ge1__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_w1524_newp_ge1__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_w1524_newp_ge1__1 	upper=p95_n_w1524_newp_ge1__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_w1524_newp_ge1__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_w1524_newp_ge1__15 	upper=p95_n_w1524_newp_ge1__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "p_newp_ge5_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05 by 0.01) valueattrs=(size=10);
label p50_p_newp_ge5__0  = "Baseline (median) - 15+";
label p50_p_newp_ge5__1  = "Essential (median) - 15+  ";
label p50_p_newp_ge5__15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_p_newp_ge5__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_newp_ge5__0 	upper=p95_p_newp_ge5__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_newp_ge5__1 	upper=p95_p_newp_ge5__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_newp_ge5__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_newp_ge5__15 	upper=p95_p_newp_ge5__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "log_gender_r_newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'log_gender_r_newp'		labelattrs=(size=12)  values = (-5 to 5 by 1) valueattrs=(size=10);

label p50_log_gender_r_newp_0  = "Baseline (median) - 15+";
label p50_log_gender_r_newp_1  = "Essential (median) - 15+  ";
label p50_log_gender_r_newp_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_log_gender_r_newp_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_0 	upper=p95_log_gender_r_newp_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_log_gender_r_newp_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_1 	upper=p95_log_gender_r_newp_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_log_gender_r_newp_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_log_gender_r_newp_15 	upper=p95_log_gender_r_newp_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_ep";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_ep_0  = "Baseline (median) - 15+";
label p50_p_ep_1  = "Essential (median) - 15+  ";
label p50_p_ep_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_p_ep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_ep_0 	upper=p95_p_ep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_ep_1 	upper=p95_p_ep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_ep_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_ep_15 	upper=p95_p_ep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

*The output included are all per year;
proc print data=d;
var p50_n_birth_0  				o_s_exppregn_MoH
    p50_p_anc_0					o_p_TESTEDorAW_anc_MoH
	p50_n_tested_anc_0 			o_n_tests_anc	o_n_firsttested_anc
	p50_n_tested_w_labdel_0		o_n_tested_labdel
	p50_n_tested_w_pd_0 		o_n_tested_postdel
	p50_n_tested_sw_0
	p50_n_tested_w_sympt_0
	p50_n_tested_w_0
	p50_n_tested_m_0
	p50_n_tested_0
	p50_n_tested_m_sympt_0
	p50_n_tested_m_circ_0
;
where cald in (2016.5 2022.5);run;
*tested_anc=1 if tested at dt_start_pregn+0.25 or dt_start_pregn+0.5;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of live births";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1200000 by 200000) valueattrs=(size=10);*900000 if stopping in 2023;
label p50_n_birth_0 = "Option 0 (median) ";
label p50_n_birth_1 = "Option 1 (median) ";
label p50_n_birth_15 = "Option 15 (median) ";
label o_s_exppregn_MoH = "Number of expected pregnancies";
series  x=cald y=p50_n_birth_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_birth_0 	upper=p95_n_birth_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
series  x=cald y=p50_n_birth_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_birth_1 	upper=p95_n_birth_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";
series  x=cald y=p50_n_birth_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_birth_15 	upper=p95_n_birth_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 15 90% range";
scatter x=cald y=o_s_exppregn_MoH / markerattrs = (symbol=square color=orange size = 10);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number women living with HIV giving birth";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 250000 by 50000) valueattrs=(size=10);*200000 if stopping in 2023;
label p50_n_give_birth_w_hiv_0 = "Option 0 (median) ";
label p50_n_give_birth_w_hiv_1 = "Option 1 (median) ";
label p50_n_give_birth_w_hiv_15 = "Option 15 (median) ";
label o_n_hiv_labdel = "Number HIV+ in labour and delivery";
series  x=cald y=p50_n_give_birth_w_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_give_birth_w_hiv_0 	upper=p95_n_give_birth_w_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Option 0 90% range";
series  x=cald y=p50_n_give_birth_w_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_give_birth_w_hiv_1 	upper=p95_n_give_birth_w_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Option 1 90% range";
series  x=cald y=p50_n_give_birth_w_hiv_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_give_birth_w_hiv_15 	upper=p95_n_give_birth_w_hiv_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Option 15 90% range";
scatter x=cald y=o_n_births_hivposmother / markerattrs = (symbol=square color=orange size = 10);
run;
quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of pregnant women attending ANC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_anc_0  = "Baseline (median) - 15+";
label p50_p_anc_1  = "Essential (median) - 15+  ";
label p50_p_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_p_testedanc_1549_zdhs = "DHS - 15-49";
label o_p_TESTEDorAW_anc_MoH = "MoH";
series  x=cald y=p50_p_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_anc_0 	upper=p95_p_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_anc_1 	upper=p95_p_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_anc_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_anc_15 	upper=p95_p_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_testedanc_1549_zdhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_TESTEDorAW_anc_MoH / markerattrs = (symbol=square color=blue size = 10);
run;quit;

*Number attending ANC;
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_anc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1200000 by 200000) valueattrs=(size=10);
label p50_n_tested_anc_0  = "Baseline (median) - 15+";
label p50_n_tested_anc_1  = "Essential (median) - 15+  ";
label p50_n_tested_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_tests_anc = "Number of women tested in ANC";*It includes the following;
label o_n_firsttested_anc = "Number of women tested for the first time in ANC";
series  x=cald y=p50_n_tested_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_anc_0 	upper=p95_n_tested_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_anc_1 	upper=p95_n_tested_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_anc_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_anc_15 	upper=p95_n_tested_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*scatter x=cald y=o_n_tests_anc / markerattrs = (symbol=square color=orange size = 10); *This is higher than the number of live births;
scatter x=cald y=o_n_firsttested_anc / markerattrs = (symbol=square color=blue size = 10);
run;quit;

*# of women who were tested for the first time in ANC: o_n_firsttested_an";
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time in ANC";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_anc_0  = "Baseline (median) - 15+";
label p50_n_tested1st_anc_1  = "Essential (median) - 15+  ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  40000 by 5000) valueattrs=(size=10);
label p50_n_diag_anc_0  = "Baseline (median) - 15+";
label p50_n_diag_anc_1  = "Essential (median) - 15+  ";
label p50_n_diag_anc_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_newdiag_anc = "Number of women diagnosed in ANC";
series  x=cald y=p50_n_diag_anc_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diag_anc_0 	upper=p95_n_diag_anc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_anc_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diag_anc_1 	upper=p95_n_diag_anc_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_anc_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_diag_anc_15 	upper=p95_n_diag_anc_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_0/	lineattrs = (color=black thickness = 5);
band    x=cald lower=p5_n_diag_labdel_0 	upper=p95_n_diag_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_1/	lineattrs = (color=red thickness = 5);
band    x=cald lower=p5_n_diag_labdel_1 	upper=p95_n_diag_labdel_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diag_labdel_15/	lineattrs = (color=green thickness = 5);
band    x=cald lower=p5_n_diag_labdel_15 	upper=p95_n_diag_labdel_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_newdiag_anc / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_labdel";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  100000 by 25000) valueattrs=(size=10);
label p50_n_tested_w_labdel_0  = "Baseline (median) - 15+";
label p50_n_tested_w_labdel_1  = "Essential (median) - 15+  ";
label p50_n_tested_w_labdel_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_tested_labdel = "Number of woment tested during labour and delivery";
series  x=cald y=p50_n_tested_w_labdel_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_labdel_0 	upper=p95_n_tested_w_labdel_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_labdel_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_labdel_1 	upper=p95_n_tested_w_labdel_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_labdel_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_w_labdel_15 	upper=p95_n_tested_w_labdel_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_tested_labdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time in Labour and Delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_labdel_0  = "Baseline (median) - 15+";
label p50_n_tested1st_labdel_1  = "Essential (median) - 15+  ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000 by 250) valueattrs=(size=10);
label p50_n_diag_labdel_0  = "Baseline (median) - 15+";
label p50_n_diag_labdel_1  = "Essential (median) - 15+  ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  200000 by 25000) valueattrs=(size=10);
label p50_n_tested_w_pd_0  = "Baseline (median) - 15+";
label p50_n_tested_w_pd_1  = "Essential (median) - 15+  ";
label p50_n_tested_w_pd_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_n_tested_postdel = "Number of woment tested post delivery";
series  x=cald y=p50_n_tested_w_pd_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_pd_0 	upper=p95_n_tested_w_pd_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_pd_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_pd_1 	upper=p95_n_tested_w_pd_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_pd_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_w_pd_15 	upper=p95_n_tested_w_pd_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_tested_postdel / markerattrs = (symbol=square color=orange size = 10);
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "# Women tested for the first time post-delivery";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  700000 by 100000) valueattrs=(size=10);
label p50_n_tested1st_pd_0  = "Baseline (median) - 15+";
label p50_n_tested1st_pd_1  = "Essential (median) - 15+  ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  2000 by 250) valueattrs=(size=10);
label p50_n_diag_pd_0  = "Baseline (median) - 15+";
label p50_n_diag_pd_1  = "Essential (median) - 15+  ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  100000 by 20000) valueattrs=(size=10);
label p50_n_tested_sw_0  = "Baseline (median) - 15+";
label p50_n_tested_sw_1  = "Essential (median) - 15+  ";
label p50_n_tested_sw_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_nfswtested_sistclin = "Number of FSW tested in the Sisters clinics";
series  x=cald y=p50_n_tested_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_sw_0 	upper=p95_n_tested_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_sw_1 	upper=p95_n_tested_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_sw_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_sw_15 	upper=p95_n_tested_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_nfswtested_sistclin / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_sympt";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1000000 by 100000) valueattrs=(size=10);
label p50_n_tested_w_sympt_0  = "Baseline (median) - 15+";
label p50_n_tested_w_sympt_1  = "Essential (median) - 15+  ";
label p50_n_tested_w_sympt_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_w_sympt_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_sympt_0 	upper=p95_n_tested_w_sympt_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_sympt_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_sympt_1 	upper=p95_n_tested_w_sympt_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_sympt_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_w_sympt_15 	upper=p95_n_tested_w_sympt_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  4000000 by 500000) valueattrs=(size=10);*2500000 if stopping in 2023;
label p50_n_tested_w_0  = "Baseline (median) - 15+";
label p50_n_tested_w_1  = "Essential (median) - 15+  ";
label p50_n_tested_w_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_w_0 	upper=p95_n_tested_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_w_1 	upper=p95_n_tested_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_w_15 	upper=p95_n_tested_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549w";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549w_0  = "Baseline (median) - 15+";
label p50_p_tested_past_year_1549w_1  = "Essential (median) - 15+  ";
label p50_p_tested_past_year_1549w_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_p_testedly_1549w_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_0 	upper=p95_p_tested_past_year_1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_1 	upper=p95_p_tested_past_year_1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549w_15 	upper=p95_p_tested_past_year_1549w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_testedly_1549w_zdhs/	markerattrs = (color=black) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  8000000 by 1000000) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_0  = "Baseline (median) - 15+";
label p50_n_tested_1  = "Essential (median) - 15+  ";
label p50_n_tested_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_s_test_15ov_py_z = "CAL - Number of tests performed 15+";
series  x=cald y=p50_n_tested_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_0 	upper=p95_n_tested_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_1 	upper=p95_n_tested_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_15 	upper=p95_n_tested_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_test_15ov_py_z/	markerattrs = (color=black ) ;
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1800000 by 200000) valueattrs=(size=10);*5000000 if stopping in 2023;
label p50_n_tested_m_0  = "Baseline (median) - 15+";
label p50_n_tested_m_1  = "Essential (median) - 15+  ";
label p50_n_tested_m_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_0 	upper=p95_n_tested_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_1 	upper=p95_n_tested_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_m_15 	upper=p95_n_tested_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m_sympt";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1500000 by 100000) valueattrs=(size=10);
label p50_n_tested_m_sympt_0  = "Baseline (median) - 15+";
label p50_n_tested_m_sympt_1  = "Essential (median) - 15+  ";
label p50_n_tested_m_sympt_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_sympt_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_sympt_0 	upper=p95_n_tested_m_sympt_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_sympt_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_sympt_1 	upper=p95_n_tested_m_sympt_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_sympt_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_m_sympt_15 	upper=p95_n_tested_m_sympt_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_m_circ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_tested_m_circ_0  = "Baseline (median) - 15+";
label p50_n_tested_m_circ_1  = "Essential (median) - 15+  ";
label p50_n_tested_m_circ_15 = "Oral PrEP AGYW (median) - 15+ ";
series  x=cald y=p50_n_tested_m_circ_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_tested_m_circ_0 	upper=p95_n_tested_m_circ_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_circ_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_tested_m_circ_1 	upper=p95_n_tested_m_circ_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_tested_m_circ_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_tested_m_circ_15 	upper=p95_n_tested_m_circ_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "p_tested_past_year_1549m";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_tested_past_year_1549m_0  = "Baseline (median) - 15+";
label p50_p_tested_past_year_1549m_1  = "Essential (median) - 15+  ";
label p50_p_tested_past_year_1549m_15 = "Oral PrEP AGYW (median) - 15+ ";
label o_p_testedly_1549m_zdhs = "DHS";
series  x=cald y=p50_p_tested_past_year_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_0 	upper=p95_p_tested_past_year_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_1 	upper=p95_p_tested_past_year_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_tested_past_year_1549m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_tested_past_year_1549m_15 	upper=p95_p_tested_past_year_1549m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_p_testedly_1549m_zdhs/	markerattrs = (color=black) ;
run;quit;



/*
proc sgplot data=d; 
Title    height=1.5 justify=center "n_tested_w_non_anc";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  1000000 by 100000) valueattrs=(size=10);
label p50_n_tested_w_non_anc_0  = "Baseline (median) - 15+";
label p50_n_tested_w_non_anc_1  = "Essential (median) - 15+  ";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.8 by 0.2) valueattrs=(size=10);
label p50_test_prop_positive_0  = "Baseline (median)";
label p50_test_prop_positive_1  = "Essential (median)";
label p50_test_prop_positive_15 = "Oral PrEP AGYW (median)";

label o_pos_rate_15ov_z = "CAL - Public sector";
series  x=cald y=p50_test_prop_positive_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_test_prop_positive_0 	upper=p95_test_prop_positive_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_test_prop_positive_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_test_prop_positive_1 	upper=p95_test_prop_positive_15  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_test_prop_positive_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_test_prop_positive_15 	upper=p95_test_prop_positive_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter  x=cald y=o_pos_rate_15ov_z/	markerattrs = (color=black ) ;
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Number of new diagnoses with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

label p50_n_diagnosed_0 = "Baseline (median)";
label p50_n_diagnosed_1 = "Essential (median)";
label p50_n_diagnosed_15 = "Oral PrEP AGYW (median)";

series  x=cald y=p50_n_diagnosed_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_diagnosed_0 	upper=p95_n_diagnosed_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diagnosed_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_diagnosed_1 	upper=p95_n_diagnosed_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_diagnosed_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_diagnosed_15 	upper=p95_n_diagnosed_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;






*!!!!!Note that the observed data are 15+;
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men age 15-49 circumcised (Data 15+)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_p_mcirc_1549m_0 = "Option 0 (median)";
label p50_p_mcirc_1549m_1 = "Option 1 (median)";
label p50_p_mcirc_1549m_15 = "Option 15 (median)";
*label p50_p_mcirc_0 = "Option 0 (median) - 15+?";
label o_p_circ_15pl_DHIS2_z= "CAL - DHIS2 men 15+";
series  x=cald y=p50_p_mcirc_1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_0 	upper=p95_p_mcirc_1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
*series  x=cald y=p50_p_mcirc_0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_p_mcirc_0 	upper=p95_p_mcirc_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_1 	upper=p95_p_mcirc_1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_mcirc_1549m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_mcirc_1549m_15 	upper=p95_p_mcirc_1549m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_circ_15pl_DHIS2_z /	markerattrs = (color=blue);
run;quit;

 
proc sgplot data=d; 
Title    height=1.5 justify=center "Annual # new circumcisions";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to  400000 by 50000) valueattrs=(size=10);
label p50_n_new_vmmc1549m_0 = "Option 0 (median) ";
label p50_n_new_vmmc1549m_1 = "Option 1 (median) ";
label p50_n_new_vmmc1549m_15 = "Option 15 (median) ";

label o_s_test_15ov_py_z = "CAL - Annual number of new circumcisions 10-49";
series  x=cald y=p50_n_new_vmmc1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_0 	upper=p95_n_new_vmmc1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_vmmc1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_1 	upper=p95_n_new_vmmc1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_new_vmmc1549m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_new_vmmc1549m_15 	upper=p95_n_new_vmmc1549m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_s_new_mcirc/	markerattrs = (color=blue ) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of current female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_1549_sw_0 = "Option 0 (median) ";
label p50_prop_w_1549_sw_1 = "Option 1 (median) ";
label p50_prop_w_1549_sw_15 = "Option 15 (median) ";
label o_p_fsw_1849_Zim_garpr = "GARPR - current FSW 18-49";
label o_p_fsw_1849_Bulaw_garpr = "GARPR - current FSW 18-49 - Bulaw";
label o_p_fsw_1849_Harare_garpr = "GARPR - current FSW 18-49 - Harare";
series  x=cald y=p50_prop_w_1549_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_0 	upper=p95_prop_w_1549_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_1 	upper=p95_prop_w_1549_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1549_sw_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_1549_sw_15 	upper=p95_prop_w_1549_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_fsw_1849_Zim_garpr /	markerattrs = (color=orange);
scatter  x=cald y=o_p_fsw_1849_Bulaw_garpr /	markerattrs = (color=red);
scatter  x=cald y=o_p_fsw_1849_Harare_garpr /	markerattrs = (color=pink);

run;quit;
/*proc print data=d;var p50_prop_w_1549_sw_0 p5_prop_w_1549_sw_0 p95_prop_w_1549_sw_0;where cald=2020;run;*/

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of female sex workers (FSW)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.15 by 0.025) valueattrs=(size=10);
label p50_prop_w_ever_sw_0 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_1 = "Ever FSW 15-64 op 0 (median) ";
label p50_prop_w_ever_sw_15 = "Ever FSW 15-64 op 0 (median) ";
label o_p_ever_fsw_1ts_1849w_nbcs = "NBCS - Ever transactional sex 18-49";

series  x=cald y=p50_prop_w_ever_sw_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_0 	upper=p95_prop_w_ever_sw_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_1 	upper=p95_prop_w_ever_sw_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_ever_sw_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_ever_sw_15 	upper=p95_prop_w_ever_sw_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=o_p_ever_fsw_1ts_1849w_nbcs /	markerattrs = (color=green);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Of FSW, proportion with HIV";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);
label p50_prop_sw_hiv_0 = "FSW with HIV 15-64 op 0 (median) ";
label p50_prop_sw_hiv_1 = "FSW with HIV 15-64 op 1 (median) ";
label p50_prop_sw_hiv_15 = "FSW with HIV 15-64 op 1 (median) ";
label o_prev_fsw_dw = "David Wilson";
label o_prev_fsw_rdshm = "RDS Hwange and Mutare";
label o_prev_fsw_rdsvf = "RDS Victoria Falls";
label o_prev_fsw_tested_swvp = "Sisters with a Voice";
label o_prev_fsw_rds = "RDS baseline SAPPH-IRe";
series  x=cald y=p50_prop_sw_hiv_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_0 	upper=p95_prop_sw_hiv_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_1 	upper=p95_prop_sw_hiv_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_sw_hiv_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_sw_hiv_15 	upper=p95_prop_sw_hiv_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_prev_fsw_dw /  yerrorlower=o_prev_fsw_ll_dw yerrorupper=o_prev_fsw_ul_dw markerattrs = (color=black) ERRORBARATTRS = (color = black) ;
scatter x=cald y=o_prev_fsw_rdshm / markerattrs = (color=blue) ;
scatter x=cald y=o_prev_fsw_rdsvf / markerattrs = (color=red) ;
scatter x=cald y=o_prev_fsw_tested_swvp / markerattrs = (color=green) ;
scatter x=cald y=o_prev_fsw_rds /  yerrorlower=o_prev_fsw_ll_rds yerrorupper=o_prev_fsw_ul_rds markerattrs = (color=orange) ERRORBARATTRS = (color = orange) ;
run;quit;
/*proc print data=d;var p50_prop_sw_hiv_0 p5_prop_sw_hiv_0 p95_prop_sw_hiv_0;where cald=2020;run;
proc freq data=d;table p95_n_prep_0;run;*/
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 350000   by 50000 ) valueattrs=(size=10);
label p50_n_prep_0 = "Option 0 (median) ";
label p50_n_prep_1 = "Option 1  (median) ";
label p50_n_prep_15 = "Option 15  (median) ";

series  x=cald y=p50_n_prep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_0 	upper=p95_n_prep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_1 	upper=p95_n_prep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_15 	upper=p95_n_prep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;
*target_prepinit_1524w;
proc sgplot data=d; 
Title    height=1.5 justify=center "Number of women aged 15-24 on PrEP (n_prep_1524w)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 100000   by 25000 ) valueattrs=(size=10);
label p50_n_prep_1524w_0 = "Option 0 (median) ";
label p50_n_prep_1524w_1 = "Option 1  (median) ";
label p50_n_prep_1524w_15 = "Option 15  (median) ";
label target_prep_1524w_lq = "Target (PrEP_CT)";
series  x=cald y=p50_n_prep_1524w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_1524w_0 	upper=p95_n_prep_1524w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_1524w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_1524w_1 	upper=p95_n_prep_1524w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_1524w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_1524w_15 	upper=p95_n_prep_1524w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=target_prep_1524w_lq  / markerattrs = (color=black);

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of people ever on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000   by 25000 ) valueattrs=(size=10);
label p50_n_prep_ever_0 = "Option 0 (median) ";
label p50_n_prep_ever_1 = "Option 1  (median) ";
label p50_n_prep_ever_15 = "Option 15  (median) ";
label o_n_prep_ever = "Cumulative Number of People Initiating PrEP";
series  x=cald y=p50_n_prep_ever_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_prep_ever_0 	upper=p95_n_prep_ever_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_ever_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_prep_ever_1 	upper=p95_n_prep_ever_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_prep_ever_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_prep_ever_15 	upper=p95_n_prep_ever_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_n_prep_ever  / markerattrs = (color=black);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.1   by 0.01 ) valueattrs=(size=10);
label p50_prop_w_1524_onprep_0 = "Option 0 (median) ";
label p50_prop_w_1524_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_prop_w_1524_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_0 	upper=p95_prop_w_1524_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1524_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_1 	upper=p95_prop_w_1524_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_w_1524_onprep_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prop_w_1524_onprep_15 	upper=p95_prop_w_1524_onprep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women aged 15-24 on PrEP among those with at least 1 newp";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1   by 0.1 ) valueattrs=(size=10);
label p50_p_w1524newpge1_onprep_0 = "Option 0 (median) ";
label p50_p_w1524newpge1_onprep_1 = "Option 1  (median) ";

series  x=cald y=p50_p_w1524newpge1_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_0 	upper=p95_p_w1524newpge1_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_w1524newpge1_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_1 	upper=p95_p_w1524newpge1_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_w1524newpge1_onprep_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_w1524newpge1_onprep_15 	upper=p95_p_w1524newpge1_onprep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people aged 15-64 on PrEP";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.05   by 0.01 ) valueattrs=(size=10);
label p50_prop_1564_onprep_0 = "Option 0 (median) ";
label p50_prop_1564_onprep_1 = "Option 1  (median) ";
label p50_prop_1564_onprep_15 = "Option 15 (median) ";
series  x=cald y=p50_prop_1564_onprep_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_0 	upper=p95_prop_1564_onprep_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_1 	upper=p95_prop_1564_onprep_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prop_1564_onprep_15/	lineattrs = (color=Green thickness = 2);
band    x=cald lower=p5_prop_1564_onprep_15 	upper=p95_prop_1564_onprep_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence (age 15-49)";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549__0 = "All Option 0 (median) ";
label p50_prevalence1549__1 = "All Option 1  (median) ";
label p50_prevalence1549__15 = "All Option 15 (median) ";
label o_prev1549_Z_ess = "CAL - ZIMPHIA or DHS";
series  x=cald y=p50_prevalence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549__0 	upper=p95_prevalence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549__1 	upper=p95_prevalence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549__15 	upper=p95_prevalence1549__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_prev1549_Z_ess  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=black) errorbarattrs = (color = black) ;
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence Men 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549m_0 = "Option 0 (median) ";
label p50_prevalence1549m_1 = "Option 1 (median) ";
label p50_prevalence1549m_15 = "Option 15 (median) ";
label o_prev1549m_Z_ess = "CAL - ZIMPHIA or DHS - men";
series  x=cald y=p50_prevalence1549m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549m_0 	upper=p95_prevalence1549m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549m_1 	upper=p95_prevalence1549m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549m_15 	upper=p95_prevalence1549m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_prev1549m_Z_ess /  yerrorlower=o_prev1549m_ll_Z_ess yerrorupper=o_prev1549m_ul_Z_ess markerattrs = (color=blue) errorbarattrs = (color = blue) ;
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence Women 15-49";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.35 by 0.05) valueattrs=(size=10);
label p50_prevalence1549w_0 = "Option 0 (median) ";
label p50_prevalence1549w_1 = "Option 1 (median) ";
label p50_prevalence1549w_15 = "Option 15 (median) ";
label o_prev1549w_Z_ess = "CAL - ZIMPHIA or DHS - women";
series  x=cald y=p50_prevalence1549w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence1549w_0 	upper=p95_prevalence1549w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence1549w_1 	upper=p95_prevalence1549w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence1549w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence1549w_15 	upper=p95_prevalence1549w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_prev1549w_Z_ess /  yerrorlower=o_prev1549w_ll_Z_ess yerrorupper=o_prev1549w_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange) ;
run;quit;
*/



proc sgplot data=d; 
Title    height=1.5 justify=center "Prevalence among pregnant women";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.05) valueattrs=(size=10);
label p50_prevalence_hiv_preg_0 = "All Option 0 (median) ";
label p50_prevalence_hiv_preg_1 = "All Option 1 (median) ";
label p50_prevalence_hiv_preg_15 = "All Option 15 (median) ";
label o_prev1549w_Z_anc = "CAL - ZIMPHIA or DHS";
series  x=cald y=p50_prevalence_hiv_preg_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_0 	upper=p95_prevalence_hiv_preg_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_hiv_preg_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_1 	upper=p95_prevalence_hiv_preg_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_hiv_preg_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence_hiv_preg_15 	upper=p95_prevalence_hiv_preg_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_prev1549w_Z_anc  /  yerrorlower=o_prev1549_ll_Z_ess yerrorupper=o_prev1549_ul_Z_ess markerattrs = (color=orange) errorbarattrs = (color = orange);
run;quit;
/*
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
*/

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
label p50_incidence1549__15 = "Option 15  (median) ";
label m_HIVIncid_Zim_GARPR = "GARPR 2020 model projection";
label o_HIVincid_1549_Zimphia = "ZIMPHIA 15-49";
series  x=cald y=p50_incidence1549__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_incidence1549__0 	upper=p95_incidence1549__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_incidence1549__1 	upper=p95_incidence1549__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_incidence1549__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_incidence1549__15 	upper=p95_incidence1549__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter  x=cald y=m_HIVIncid_Zim_GARPR/	markerattrs = (color=green);
scatter x=cald y=o_HIVincid_1549_Zimphia / yerrorlower=o_HIVincid_1549_ll_Zimphia yerrorupper=o_HIVincid_1549_ul_Zimphia markerattrs = (color=black size = 10) errorbarattrs = (color = black);
run;
quit;


/*
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
label p50_incidence1549m_0 = "Option 0 (median) - Men";
label p50_incidence1549m_1 = "Option 1  (median) - Men";
label p50_incidence1549w_0 = "Option 0 (median) - Women";
label p50_incidence1549w_1 = "Option 1  (median) - Women";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence1524m_0 = "Option 0 (median) - Men";
label p50_incidence1524m_1 = "Option 1  (median) - Men";
label p50_incidence1524w_0 = "Option 0 (median) - Women";
label p50_incidence1524w_1 = "Option 1  (median) - Women";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence2534m_0 = "Option 0 (median) - Men";
label p50_incidence2534m_1 = "Option 1  (median) - Men";
label p50_incidence2534w_0 = "Option 0 (median) - Women";
label p50_incidence2534w_1 = "Option 1  (median) - Women";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence3544m_0 = "Option 0 (median) - Men";
label p50_incidence3544m_1 = "Option 1  (median) - Men";
label p50_incidence3544w_0 = "Option 0 (median) - Women";
label p50_incidence3544w_1 = "Option 1  (median) - Women";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence4554m_0 = "Option 0 (median) - Men";
label p50_incidence4554m_1 = "Option 1  (median) - Men";
label p50_incidence4554w_0 = "Option 0 (median) - Women";
label p50_incidence4554w_1 = "Option 1  (median) - Women";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'rate per 100 person years'		labelattrs=(size=12)  values = (0 to 7 by 1) valueattrs=(size=10);
label p50_incidence5564m_0 = "Option 0 (median) - Men";
label p50_incidence5564m_1 = "Option 1  (median) - Men";
label p50_incidence5564w_0 = "Option 0 (median) - Women";
label p50_incidence5564w_1 = "Option 1  (median) - Women";
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
*/



proc sgplot data=d; 
Title    height=1.5 justify=center "of men with hiv 15+, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diag_m_0 = "Option 0 (median)";
label p50_p_diag_m_1 = "Option 1  (median)";
label p50_p_diag_m_15 = "Option 15  (median)";
label o_p_diag_m1549_dhs = "DHS - 15-49";
label o_p_diag_1564m_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15pl_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_m_0 	upper=p95_p_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_m_1 	upper=p95_p_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_m_15 	upper=p95_p_diag_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_m1549_dhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_diag_1564m_zimphia / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_p_diag_15pl_zimphia /  markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "of women with hiv, proportion diagnosed";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_diag_w_0 = "Option 0 (median) _ 15+";
label p50_p_diag_w_1 = "Option 1  (median) ";
label p50_p_diag_w_15 = "Option 15  (median) ";
label o_p_diag_w1549_dhs = "DHS - 15-49";
label o_p_diag_1564w_zimphia = "ZIMPHIA - 15-64";
label o_p_diag_15plw_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_diag_w_0 	upper=p95_p_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_diag_w_1 	upper=p95_p_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_diag_w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_diag_w_15 	upper=p95_p_diag_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_diag_w1549_dhs / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_diag_1564w_zimphia / markerattrs = (symbol=square color=red size = 10);
scatter x=cald y=o_p_diag_15plw_zimphia / markerattrs = (symbol=square color=purple size = 10);
run;quit;

/*
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
*/
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed people who are ART experienced";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.2) valueattrs=(size=10);

label p50_p_artexp_diag_0 = "Option 0 (median) ";
label p50_p_artexp_diag_1 = "Option 1 (median) ";
label p50_p_artexp_diag_15 = "Option 15 (median) ";

series  x=cald y=p50_p_artexp_diag_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_artexp_diag_0 	upper=p95_p_artexp_diag_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_artexp_diag_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_artexp_diag_1 	upper=p95_p_artexp_diag_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_artexp_diag_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_artexp_diag_15 	upper=p95_p_artexp_diag_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_m_0 = "Option 0  (median)";
label p50_p_onart_diag_m_1 = "Option 1  (median)";
label p50_p_onart_diag_m_1 = "Option 15 (median)";
label o_p_onart_1564m_diag_zimphia = "ZIMPHIA - 15-64";
label o_p_onart_15plm_diag_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_onart_diag_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_0 	upper=p95_p_onart_diag_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_1 	upper=p95_p_onart_diag_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_diag_m_15 	upper=p95_p_onart_diag_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564m_diag_zimphia / markerattrs = (symbol=square color=blue size = 10);
scatter x=cald y=o_p_onart_15plm_diag_zimphia / markerattrs = (symbol=square color=brown size = 10);
run;quit;



proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of diagnosed women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_diag_w_0  = "Option 0  (median) ";
label p50_p_onart_diag_w_1  = "Option 1  (median) ";
label p50_p_onart_diag_w_15 = "Option 15 (median) ";
label o_p_onart_1564f_diag_zimphia = "ZIMPHIA - 15-64";
label o_p_onart_15plf_diag_zimphia = "ZIMPHIA - 15+";
series  x=cald y=p50_p_onart_diag_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_0 	upper=p95_p_onart_diag_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_1 	upper=p95_p_onart_diag_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_diag_w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_diag_w_15 	upper=p95_p_onart_diag_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_p_onart_1564f_diag_zimphia / markerattrs = (symbol=square color=orange size = 10);
scatter x=cald y=o_p_onart_15plf_diag_zimphia / markerattrs = (symbol=square color=brown size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number of 1st ART initiations";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 200000 by  50000) valueattrs=(size=10);

*label p50_n_all_ai_y_0 = "Option 0 (median) - all";
*label p50_n_all_ai_y_1 = "Option 1  (median) - all";
label p50_n_art_start_y_0 = "Option 0 (median)";
label p50_n_art_start_y_1 = "Option 1  (median)";
label p50_n_art_start_y_15 = "Option 15  (median)";

*series  x=cald y=p50_n_all_ai_y_0/	lineattrs = (color=black thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_0 	upper=p95_n_all_ai_y_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range - all";
*series  x=cald y=p50_n_all_ai_y_1/	lineattrs = (color=red thickness = 2);
*band    x=cald lower=p5_n_all_ai_y_1 	upper=p95_n_all_ai_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_art_start_y_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_art_start_y_0 	upper=p95_n_art_start_y_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range - 1st";
series  x=cald y=p50_n_art_start_y_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_art_start_y_1 	upper=p95_n_art_start_y_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_art_start_y_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_art_start_y_15 	upper=p95_n_art_start_y_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Number on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_onart_0 = "Option 0  (median)";
label p50_n_onart_1 = "Option 1  (median)";
label p50_n_onart_15 = "Option 15 (median)";
label o_s_all_onart_NAC = "CAL - NAC";
label o_s_onart_adults_garpr = "GARPR";
series  x=cald y=p50_n_onart_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_onart_0 	upper=p95_n_onart_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_onart_1 	upper=p95_n_onart_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_onart_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_onart_15 	upper=p95_n_onart_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_s_onart_adults_garpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Number of pregnant women receiving PMCTCT";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 250000 by 50000) valueattrs=(size=10);
label p50_n_pmtct_0 = "Option 0  (median)";
label p50_n_pmtct_1 = "Option 1  (median)";
label p50_n_pmtct_15 = "Option 15 (median)";
label o_s_pregnant_pmtct_Z_GF = "Global fund";
label o_s_pregnant_pmtct_Z_NAC = "NAC";
series  x=cald y=p50_n_pmtct_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pmtct_0 	upper=p95_n_pmtct_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_pmtct_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_pmtct_1 	upper=p95_n_pmtct_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_pmtct_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_pmtct_15 	upper=p95_n_pmtct_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_s_pregnant_pmtct_Z_GF / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_s_pregnant_pmtct_Z_NAC / markerattrs = (symbol=square color=orange size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of people on ART for >6 months with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000__0 = "Option 0  (median)";
label p50_p_onart_vl1000__1 = "Option 1  (median)";
label p50_p_onart_vl1000__15 = "Option 15 (median)";
label o_p_vll1000_6mart_garcpr = "CAL - GARCPR";
series  x=cald y=p50_p_onart_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__0 	upper=p95_p_onart_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__1 	upper=p95_p_onart_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000__15 	upper=p95_p_onart_vl1000__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA optional;
scatter x=cald y=o_p_vll1000_6mart_garcpr / markerattrs = (symbol=square color=black size = 10);
run;quit;


proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of men on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_m_0  = "Option 0 (median) ";
label p50_p_onart_vl1000_m_1  = "Option 1  (median) ";
label p50_p_onart_vl1000_m_15 = "Option 15  (median) ";
series  x=cald y=p50_p_onart_vl1000_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_0 	upper=p95_p_onart_vl1000_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_1 	upper=p95_p_onart_vl1000_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_m_15 	upper=p95_p_onart_vl1000_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of women on ART >6 months with VL <1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_vl1000_w_0 = "Option 0 (median) ";
label p50_p_onart_vl1000_w_1 = "Option 1  (median) ";
label p50_p_onart_vl1000_w_15 = "Option 15  (median) ";
series  x=cald y=p50_p_onart_vl1000_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_0 	upper=p95_p_onart_vl1000_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_1 	upper=p95_p_onart_vl1000_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_vl1000_w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_vl1000_w_15 	upper=p95_p_onart_vl1000_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL<1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vl1000__0 = "Option 0 (median)";
label p50_p_vl1000__1 = "Option 1  (median)";
label p50_p_vl1000__15 = "Option 15 (median)";
label o_p_vlsupp_hiv_15pl_phia = "ZIMPHIA 15+";
label o_p_vlsupp_hiv_1564_phia = "ZIMPHIA 15-64";
label o_p_vlsupp_hiv_1549_phia = "ZIMPHIA 15-49";
series  x=cald y=p50_p_vl1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vl1000__0 	upper=p95_p_vl1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vl1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vl1000__1 	upper=p95_p_vl1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vl1000__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vl1000__15 	upper=p95_p_vl1000__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";

scatter x=cald y=o_p_vlsupp_hiv_15pl_phia / markerattrs = (symbol=square color=black size = 10);
scatter x=cald y=o_p_vlsupp_hiv_1564_phia / markerattrs = (symbol=square color=grey size = 10);
scatter x=cald y=o_p_vlsupp_hiv_1549_phia / markerattrs = (symbol=square color=brown size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of HIV positive people with VL > 1000";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vg1000__0 = "Option 0 (median)";
label p50_p_vg1000__1 = "Option 1  (median)";
label p50_p_vg1000__15 = "Option 15 (median)";
series  x=cald y=p50_p_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_vg1000__0 	upper=p95_p_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_vg1000__1 	upper=p95_p_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_vg1000__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_vg1000__15 	upper=p95_p_vg1000__15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive men on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_m_0 = "Option 0 (median)";
label p50_p_onart_m_1 = "Option 1  (median)";
label p50_p_onart_m_15 = "Option 15  (median)";
series  x=cald y=p50_p_onart_m_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_m_0 	upper=p95_p_onart_m_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_m_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_m_1 	upper=p95_p_onart_m_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_m_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_m_15 	upper=p95_p_onart_m_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion of all hiv positive women on ART";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_onart_w_0 = "Option 0 (median)";
label p50_p_onart_w_1 = "Option 1  (median)";
label p50_p_onart_w_15 = "Option 15 (median)";
series  x=cald y=p50_p_onart_w_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_p_onart_w_0 	upper=p95_p_onart_w_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_w_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_p_onart_w_1 	upper=p95_p_onart_w_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_p_onart_w_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_p_onart_w_15 	upper=p95_p_onart_w_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "prevalence_vg1000_";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Proportion'		labelattrs=(size=12)  values = (0 to 0.6 by 0.1) valueattrs=(size=10);
label p50_prevalence_vg1000__0 = "Option 0 (median) ";
label p50_prevalence_vg1000__1 = "Option 1  (median) ";
label p50_prevalence_vg1000__15 = "Option 15  (median) ";
series  x=cald y=p50_prevalence_vg1000__0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__0 	upper=p95_prevalence_vg1000__0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_vg1000__1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__1 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_prevalence_vg1000__15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_prevalence_vg1000__15 	upper=p95_prevalence_vg1000__1  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
run;quit;
/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Rate of death ";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Rate (per 100 person-years)'		labelattrs=(size=12)  values = (0 to 10 by 1) valueattrs=(size=10);
label p50_rate_dead_allage_0 = "Option 0 (median) - 15+ both";
label p50_rate_dead_allage_1 = "Option 1  (median) ";
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
*/


proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of CD4 measurements";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_cm_0 = "Option 0  (median)";
label p50_n_cm_1 = "Option 1  (median)";
label p50_n_cm_15 = "Option 15 (median)";
label o_s_all_onart_NAC = "Number on ART - NAC";
series  x=cald y=p50_n_cm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_cm_0 	upper=p95_n_cm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_cm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_cm_1 	upper=p95_n_cm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_cm_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_cm_15 	upper=p95_n_cm_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;

proc sgplot data=d; 
Title    height=1.5 justify=center "Annual number of VL measurements";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2000000 by 250000) valueattrs=(size=10);
label p50_n_vm_0 = "Option 0  (median)";
label p50_n_vm_1 = "Option 1  (median)";
label p50_n_vm_15 = "Option 15 (median)";
label o_s_all_onart_NAC = "Number on ART - NAC";
series  x=cald y=p50_n_vm_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_vm_0 	upper=p95_n_vm_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_vm_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_vm_1 	upper=p95_n_vm_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_vm_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_vm_15 	upper=p95_n_vm_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
*MIHPSA essential;
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;

/*
proc sgplot data=d; 
Title    height=1.5 justify=center "Proportion on ART with VL measurement in the last year";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 1 by 0.1) valueattrs=(size=10);
label p50_p_vm_ly_onart_0 = "Option 0  (median)";
label p50_p_vm_ly_onart_1 = "Option 1  (median)";
label p50_p_vm_ly_onart_15 = "Option 15 (median)";
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
xaxis label			= 'Year'		labelattrs=(size=12)  values = (1990 to &year_end by 2)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Number'		labelattrs=(size=12)  values = (0 to 2500000 by 250000) valueattrs=(size=10);
label p50_n_pcp_p_0 = "Option 0  (median)";
label p50_n_pcp_p_1 = "Option 1  (median)";
label p50_n_pcp_p_15 = "Option 15 (median)";
label o_s_all_onart_NAC = "on ART - NAC";
series  x=cald y=p50_n_pcp_p_0/	lineattrs = (color=black thickness = 2);
band    x=cald lower=p5_n_pcp_p_0 	upper=p95_n_pcp_p_0  / transparency=0.9 fillattrs = (color=black) legendlabel= "Model 90% range";
series  x=cald y=p50_n_pcp_p_1/	lineattrs = (color=red thickness = 2);
band    x=cald lower=p5_n_pcp_p_1 	upper=p95_n_pcp_p_1  / transparency=0.9 fillattrs = (color=red) legendlabel= "Model 90% range";
series  x=cald y=p50_n_pcp_p_15/	lineattrs = (color=green thickness = 2);
band    x=cald lower=p5_n_pcp_p_15 	upper=p95_n_pcp_p_15  / transparency=0.9 fillattrs = (color=green) legendlabel= "Model 90% range";
scatter x=cald y=o_s_all_onart_NAC / markerattrs = (symbol=square color=black size = 10);
run;quit;

ods rtf close;run;

*Output about cotrimaxazole (s_pcp_p_adc s_pcp_p_crypm s_pcp_p_dead s_pcp_p_sbi s_pcp_p_tb s_pcp_p_who3 );
*Output about VL measured (vl_cost_inc reset to 0);

*Partire da qua;

*VCFeb2023;
*Output to be exported to fill in the file "Output template MIHPSAZimP2";
*STOCK;
data d;set a.d;run;
proc contents data=d;run;
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
rename p50_prevalence1524preg_&o = HIVprev_F1524_M;
rename p5_prevalence1524preg_&o  = HIVprev_F1524_95LL;
rename p95_prevalence1524preg_&o = HIVprev_F1524_95UL;
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
rename p50_p_m_npge1__&o = P_CLS3m_M1599_M;
rename p50_p_w_npge1__&o = P_CLS3m_F1599_M;
rename p50_p_w1524_npge1__&o = P_CLS3m_F1524_M;
rename p50_p_sw_npge1__&o = P_CLS3m_FSW_M;

rename p50_prev_sti_sw_&o = P_STI_FSW1599_M;

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

keep cald
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
%stock(o=15);



options nomprint;
option nospool;



  ***Macro var used to calculate means across each year and transpose to one line per run,
  need to write manually all the years to merge;
/*
  
proc sort data=b;by count_csim  cald ;run;
data option_0;set b;if option=0;keep n_alive count_csim  cald ;run;
proc means  noprint data=option_0; var n_alive; output out=y_2023 mean= alive_2023; by count_csim ; where 2022.5 <= cald < 2023.5; run;
proc means  noprint data=option_0; var n_alive; output out=y_2024 mean= alive_2024; by count_csim ; where 2023.5 <= cald < 2024.5; run;

data n_alive_0 ; merge y_2023 y_2024  ;  
drop _NAME_ _TYPE_ _FREQ_;run;
proc transpose data=n_alive_0 out=l_n_alive_0 prefix=n_alive;id  count_csim;run;

data l_n_alive_0;set l_n_alive_0;
*cald_c= substr(_NAME_,length(_NAME_)-3,4);
*cald= input(cald_c,4.);
cald_d= input(substr(_NAME_,length(_NAME_)-3,4),4.);
run;

data l_n_alive_0;set l_n_alive_0;***creates one dataset per variable;
p5_n_alive_0  = PCTL(5,of n_alive1-n_alive155);
p95_n_alive_0 = PCTL(95,of n_alive1-n_alive155);
p50_n_alive_0 = median(of n_alive1-n_alive155);
keep cald p5_n_alive_0 p95_n_alive_0 p50_n_alive_0;
  run;
  */
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
proc datasets nodetails nowarn nolist;delete &v;run;
%mend var_cy;
proc freq data=b;
table n_birth  n_give_birth_w_hiv  /*n_everpregn_w1524_  n_everpregn_hiv_w1524_*/ n_birth_with_inf_child
incidence1549m	incidence1549w  incidence1549_  incidence1524w  incidence_sw /*incidence_sd1564_ incidence_sd1564w*/
n_new_inf1564m	n_new_inf1564w	n_new_inf1549m  n_new_inf1549w  n_new_inf1549
n_new_inf1524m	n_new_inf1524w  n_new_inf2549m  n_new_inf2549w
n_death_hivrel_m  n_death_hivrel_w  n_death_hivrel
n_death_m  n_death_w
/* YLL_80yLifeExpect_3Disc_A1599_M */

n_tested_ancpd  n_test_anclabpd n_tested_anc_prevdiag
/* HIVST...*/
n_tested_m_sympt  n_tested_w_sympt
/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
n_tested_swprog  n_tested_sw  n_tested_m  n_tested_w  n_tested
/*TOTHIVST_M1599_M...*/

n_diag_anclabpd
/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
n_diag_progsw  n_diag_m  n_diag_w
/* TOTPosConfHIVST_M1599_M..*/

test_proppos_m      test_proppos_w  test_prop_positive
test_proppos_1524w  test_proppos_sw

/* DREAMS */

/*NFSWprog_FSW1599_M... NFSWprogEver_FSW1599_M*/
/*NSBCC_A1599_M ...NCUPP_A1599_M ... NCondoms_A1599_M*/
n_new_vmmc1549m
n_init_prep_oral_1524w n_prep_oral_ly_1524w n_prep_oral_ever_1524w 
n_init_prep_oral_sw    n_prep_oral_ly_sw 	n_prep_oral_ever_sw 
n_init_prep_oral_sdc   n_prep_oral_ly_sdc 	n_prep_oral_ever_sdc
/*NTDFPrEPinit_pregbfF1549_M    NTDFPrEP_pregbfF1549_M  NTDFPrEPEver_pregbfF1549_M*/
n_init_prep_vr_1524w  n_prep_vr_ly_1524w	n_prep_vr_ever_1524w 
n_init_prep_vr_sw 	  n_prep_vr_ly_sw 		n_prep_vr_ever_sw
n_init_prep_vr_sdc    n_prep_vr_ly_sdc	 	n_prep_vr_ever_sdc
/*NDPVPrEPinit_pregbfF1549_M    NDPVPrEP_pregbfF1549_M  NDPVPrEPEver_pregbfF1549_M*/
n_init_prep_inj_1524w  n_prep_inj_ly_1524w	n_prep_inj_ever_1524w
n_init_prep_inj_sw     n_prep_inj_ly_sw		n_prep_inj_ever_sw 
n_init_prep_inj_sdc    n_prep_inj_ly_sdc 	n_prep_inj_ever_sdc
/*NCABPrEPinit_pregbfF1549_M    NCABPrEP_pregbfF1549_M	NCABPrEPEver_pregbfF1549_M*/		
;
run;
*All Missing for n_death_hivrel_m  n_death_hivrel_w  n_diag_w  test_proppos_w
 All 0       for n_tested_ancpd    n_diag_progsw;

*The following are commmenting out as not yest exported in current dataset;
%var_cy(0,n_birth);%var_cy(0,n_give_birth_w_hiv);/*%var_cy(0,n_everpregn_w1524_);%var_cy(0,n_everpregn_hiv_w1524_);*/%var_cy(0,n_birth_with_inf_child);
%var_cy(0,incidence1549m);%var_cy(0,incidence1549w);%var_cy(0,incidence1549_);%var_cy(0,incidence1524w);%var_cy(0,incidence_sw);
/*%var_cy(0,incidence_sd1564_);%var_cy(0,incidence_sd1564w);*/
%var_cy(0,n_new_inf1564m);%var_cy(0,n_new_inf1564w);%var_cy(0,n_new_inf1549m);%var_cy(0,n_new_inf1549w);%var_cy(0,n_new_inf1549);
%var_cy(0,n_new_inf1524m);%var_cy(0,n_new_inf1524w);%var_cy(0,n_new_inf2549m);%var_cy(0,n_new_inf2549w);
%var_cy(0,n_death_hivrel_m);%var_cy(0,n_death_hivrel_w);%var_cy(0,n_death_hivrel);
%var_cy(0,n_death_m);%var_cy(0,n_death_w);
/* YLL_80yLifeExpect_3Disc_A1599_M */

%var_cy(0,n_tested_ancpd);%var_cy(0,n_test_anclabpd);
/* HIVST...*/
%var_cy(0,n_tested_m_sympt);%var_cy(0,n_tested_w_sympt);
/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
%var_cy(0,n_tested_swprog);%var_cy(0,n_tested_sw);%var_cy(0,n_tested_m);%var_cy(0,n_tested_w);%var_cy(0,n_tested);
/*TOTHIVST_M1599_M...*/

%var_cy(0,n_diag_anclabpd);
/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
%var_cy(0,n_diag_progsw);%var_cy(0,n_diag_m);%var_cy(0,n_diag_w);
/* TOTPosConfHIVST_M1599_M..*/

%var_cy(0,test_proppos_m);%var_cy(0,test_proppos_w);%var_cy(0,test_prop_positive);
%var_cy(0,test_proppos_1524w);%var_cy(0,test_proppos_sw);

/* DREAMS */

/*NFSWprog_FSW1599_M... NFSWprogEver_FSW1599_M*/
/*NSBCC_A1599_M ...NCUPP_A1599_M ... NCondoms_A1599_M*/
%var_cy(0,n_new_vmmc1549m);
%var_cy(0,n_init_prep_oral_1524w);%var_cy(0,n_prep_oral_ly_1524w);%var_cy(0,n_prep_oral_ever_1524w);
%var_cy(0,n_init_prep_oral_sw);%var_cy(0,n_prep_oral_ly_sw);%var_cy(0,n_prep_oral_ever_sw);
%var_cy(0,n_init_prep_oral_sdc);%var_cy(0,n_prep_oral_ly_sdc);%var_cy(0,n_prep_oral_ever_sdc);
/*NTDFPrEPinit_pregbfF1549_M    NTDFPrEP_pregbfF1549_M  NTDFPrEPEver_pregbfF1549_M*/
%var_cy(0,n_init_prep_vr_1524w);%var_cy(0,n_prep_vr_ly_1524w);%var_cy(0,n_prep_vr_ever_1524w);
%var_cy(0,n_init_prep_vr_sw);%var_cy(0,n_prep_vr_ly_sw);%var_cy(0,n_prep_vr_ever_sw);
%var_cy(0,n_init_prep_vr_sdc);%var_cy(0,n_prep_vr_ly_sdc);%var_cy(0,n_prep_vr_ever_sdc);
/*NDPVPrEPinit_pregbfF1549_M    NDPVPrEP_pregbfF1549_M  NDPVPrEPEver_pregbfF1549_M*/
%var_cy(0,n_init_prep_inj_1524w);%var_cy(0,n_prep_inj_ly_1524w);%var_cy(0,n_prep_inj_ever_1524w);
%var_cy(0,n_init_prep_inj_sw);%var_cy(0,n_prep_inj_ly_sw);%var_cy(0,n_prep_inj_ever_sw);
);%var_cy(0,n_init_prep_inj_sdc);%var_cy(0,n_prep_inj_ly_sdc);%var_cy(0,n_prep_inj_ever_sdc);
/*NCABPrEPinit_pregbfF1549_M    NCABPrEP_pregbfF1549_M	NCABPrEPEver_pregbfF1549_M*/		
;
data   wide_allyears_0; merge 
l_n_birth_0  l_n_give_birth_w_hiv_0  /*l_n_everpregn_w1524__0  l_n_everpregn_hiv_w1524__0*/ l_n_birth_with_inf_child_0
l_incidence1549m_0	l_incidence1549w_0  l_incidence1549__0  l_incidence1524w_0  l_incidence_sw_0  l_incidence_sd1564__0  l_incidence_sd1564w_0
l_n_new_inf1564m_0	l_n_new_inf1564w_0  l_n_new_inf1549m_0	l_n_new_inf1549w_0  l_n_new_inf1549_0
l_n_new_inf1524m_0	l_n_new_inf1524w_0  l_n_new_inf2549m_0	l_n_new_inf2549w_0
l_n_death_hivrel_m_0	l_n_death_hivrel_w_0	l_n_death_hivrel_0
l_n_death_m_0  l_n_death_w_0
/* YLL_80yLifeExpect_3Disc_A1599_M */

l_n_tested_ancpd_0  l_n_test_anclabpd_0
/* HIVST...*/
l_n_tested_m_sympt_0  l_n_tested_w_sympt_0
/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
l_n_tested_swprog_0  l_n_tested_sw_0  l_n_tested_m_0  l_n_tested_w_0  l_n_tested_0
/*TOTHIVST_M1599_M...*/

l_n_diag_anclabpd_0
/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
l_n_diag_progsw_0  l_n_diag_m_0  l_n_diag_w_0
/* TOTPosConfHIVST_M1599_M..*/

l_test_proppos_m_0  l_test_proppos_m_0  l_test_proppos_m_0 
l_test_proppos_w_0  l_test_proppos_w_0  l_test_proppos_w_0
l_test_prop_positive_0	l_test_prop_positive_0  l_test_prop_positive_0
l_test_proppos_1524w_0   l_test_proppos_sw_0 

/* DREAMS */

/*NFSWprog_FSW1599_M... NFSWprogEver_FSW1599_M*/
/*NSBCC_A1599_M ...NCUPP_A1599_M ... NCondoms_A1599_M*/
l_n_new_vmmc1549m_0
l_n_init_prep_oral_1524w_0 l_n_prep_oral_ly_1524w_0   l_n_prep_oral_ever_1524w_0 
l_n_init_prep_oral_sw_0    l_n_prep_oral_ly_sw_0 		l_n_prep_oral_ever_sw_0 
l_n_init_prep_oral_sdc_0   l_n_prep_oral_ly_sdc_0 	l_n_prep_oral_ever_sdc_0
/*NTDFPrEPinit_pregbfF1549_M    NTDFPrEP_pregbfF1549_M  NTDFPrEPEver_pregbfF1549_M*/
l_n_init_prep_vr_1524w_0   l_n_prep_vr_ly_1524w_0		l_n_prep_vr_ever_1524w_0 
l_n_init_prep_vr_sw_0 	  l_n_prep_vr_ly_sw_0 		l_n_prep_vr_ever_sw_0
l_n_init_prep_vr_sdc_0     l_n_prep_vr_ly_sdc_0	 	l_n_prep_vr_ever_sdc_0
/*NDPVPrEPinit_pregbfF1549_M    NDPVPrEP_pregbfF1549_M  NDPVPrEPEver_pregbfF1549_M*/
l_n_init_prep_inj_1524w_0  l_n_prep_inj_ly_1524w_0	l_n_prep_inj_ever_1524w_0
l_n_init_prep_inj_sw_0     l_n_prep_inj_ly_sw_0		l_n_prep_inj_ever_sw_0 
l_n_init_prep_inj_sdc_0    l_n_prep_inj_ly_sdc_0 		l_n_prep_inj_ever_sdc_0
/*NCABPrEPinit_pregbfF1549_M    NCABPrEP_pregbfF1549_M	NCABPrEPEver_pregbfF1549_M*/	
;
run;


*FLOW;
%macro flow(o=);
data wide_allyears_&o;
*note that 1991 would refer to the period 1990.5-1991.5;

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
*rename p50_ _&o = HIVIncid_pregbfF1549_M;


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
rename p50_n_new_inf1549_&o = NHIVInf_A1549_M;
rename p5_n_new_inf1549_&o = NHIVInf_A1549_95LL;
rename p95_n_new_inf1549_&o = NHIVInf_A1549_95UL;
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
*rename P50_ _&o = TOTHIVST_M1599_M;
*rename P5_ _&o = TOTHIVST_M1599_95LL;
*rename P95_ _&o = TOTHIVST_M1599_95UL;
*rename P50_ _&o = TOTHIVST_F1599_M;
*rename P5_ _&o = TOTHIVST_F1599_95LL;
*rename P95_ _&o = TOTHIVST_F1599_95UL;
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


*** DREAMS;
*rename P50_ _&o = NDREAMS_F1524_M;
*rename P50_ _&o = NDREAMSEver_F1524_M;
*rename P50_ _&o = NDREAMS_NEGF1524_M;
*rename P50_ _&o = NDREAMSEver_NEGF1524_M;


*** PREVENTION;
rename P50_ _&o = NFSWprog_FSW1599_M;
rename P50_ _&o = NFSWprogEver_FSW1599_M;
*Number of adults 15+ years old recipient of SBCC intervention;
*rename P50_ _&o = NSBCC_A1599_M;
*Number of adults 15+ years old recipient of condoms;
*rename P50_ _&o = NCUPP_A1599_M;
*Number of condoms distributed among adults 15+ years old;
*rename P50_ _&o = NCondoms_A1599_M;
rename P50_n_new_vmmc1549m_&o = NVMMC_M1549_M;

rename P50_n_init_prep_oral_1524w_&o = NTDFPrEPinit_F1524_M;
rename P50_n_prep_oral_ly_1524w_&o = NTDFPrEP_F1524_M;
rename P50_n_prep_oral_ever_1524w_&o = NTDFPrEPEver_F1524_M;
rename P50_n_init_prep_oral_sw_&o = NTDFPrEPinit_FSW1599_M;
rename P50_n_prep_oral_ly_sw_&o = NTDFPrEP_FSW1599_M;
rename P50_n_prep_oral_ever_sw_&o = NTDFPrEPEver_FSW1599_M;
rename P50_n_init_prep_oral_sdc_&o = NTDFPrEPinit_SDCA1599_M;
rename P50_n_prep_oral_ly_sdc_&o = NTDFPrEP_SDCA1599_M;
rename P50_n_prep_oral_ever_sdc_&o = NTDFPrEPEver_SDCA1599_M;
*rename P50_ _&o = NTDFPrEPinit_pregbfF1549_M;
*rename P50_ _&o = NTDFPrEP_pregbfF1549_M;
*rename P50_ _&o = NTDFPrEPEver_pregbfF1549_M;

rename P50_n_init_prep_vr_1524w_&o = NDPVPrEPinit_F1524_M;
rename P50_n_prep_vr_ly_1524w_&o = NDPVPrEP_F1524_M;
rename P50_n_prep_vr_ever_1524w_&o = NDPVPrEPEver_F1524_M;
rename P50_n_init_prep_vr_sw_&o = NDPVPrEPinit_FSW1599_M;
rename P50_n_prep_vr_ly_sw_&o = NDPVPrEP_FSW1599_M;
rename P50_n_prep_vr_ever_sw_&o = NDPVPrEPEver_FSW1599_M;
rename P50_n_init_prep_vr_sdc_&o = NDPVPrEPinit_SDCF1599_M;
rename P50_n_prep_vr_ly_sdc_&o = NDPVPrEP_SDCF1599_M;
rename P50_n_prep_vr_ever_sdc_&o = NDPVPrEPEver_SDCF1599_M;
*rename P50_ _&o = NDPVPrEPinit_pregbfF1549_M;
*rename P50_ _&o = NDPVPrEP_pregbfF1549_M;
*rename P50_ _&o = NDPVPrEPEver_pregbfF1549_M;

rename P50_n_init_prep_inj_1524w_&o = NCABPrEPinit_F1524_M;
rename P50_n_prep_inj_ly_1524w_&o = NCABPrEP_F1524_M;
rename P50_n_prep_inj_ever_1524w_&o = NCABPrEPEver_F1524_M;
rename P50_n_init_prep_inj_sw_&o = NCABPrEPinit_FSW1599_M;
rename P50_n_prep_inj_ly_sw_&o = NCABPrEP_FSW1599_M;
rename P50_n_prep_inj_ever_sw_&o = NCABPrEPEver_FSW1599_M;
rename P50_n_init_prep_inj_sdc_&o = NCABPrEPinit_SDCA1599_M;
rename P50_n_prep_inj_ly_sdc_&o = NCABPrEP_SDCA1599_M;
rename P50_n_prep_inj_ever_sdc_&o = NCABPrEPEver_SDCA1599_M;
*rename P50_ _&o = NCABPrEPinit_pregbfF1549_M;
*rename P50_ _&o = NCABPrEP_pregbfF1549_M;
*rename P50_ _&o = NCABPrEPEver_pregbfF1549_M;

NPMTCT_FbirthHIV1599_M
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




keep cald
p50_n_birth_&o  p50_n_give_birth_w_hiv_&o  p50_n_everpregn_w1524_&o  p50_n_everpregn_hiv_w1524_&o  p50_n_birth_with_inf_child_&o

p50_incidence1549m_&o  p5_incidence1549m_&o  p95_incidence1549m_&o 
p50_incidence1549w_&o  p5_incidence1549w_&o  p95_incidence1549w_&o 
p50_incidence1549__&o  p5_incidence1549__&o  p95_incidence1549__&o 
p50_incidence1524w_&o  p5_incidence1524w_&o  p95_incidence1524w_&o 
p50_incidence_sw_&o    p5_incidence_sw_&o    p95_incidence_sw_&o 
p50_incidence_sd1564__&o p50_incidence_sd1564w_&o 

p50_n_new_inf1564m_&o  p5_n_new_inf1564m_&o  p95_n_new_inf1564m_&o
p50_n_new_inf1564w_&o  p5_n_new_inf1564w_&o  p95_n_new_inf1564w_&o
p50_n_new_inf1549m_&o  p5_n_new_inf1549m_&o  p95_n_new_inf1549m_&o
p50_n_new_inf1549w_&o  p5_n_new_inf1549w_&o  p95_n_new_inf1549w_&o
p50_n_new_inf1549_&o   p5_n_new_inf1549_&o   p95_n_new_inf1549_&o
p50_n_new_inf1524m_&o  p50_n_new_inf1524w_&o
p50_n_new_inf2549m_&o  p50_n_new_inf2549w_&o

P50_n_death_hivrel_m_&o  P5_n_death_hivrel_m_&o  P95_n_death_hivrel_m_&o 
P50_n_death_hivrel_w_&o  P5_n_death_hivrel_w_&o  P95_n_death_hivrel_w_&o
P50_n_death_hivrel_&o    P5_n_death_hivrel_&o 	 P95_n_death_hivrel_&o

P50_n_death_m_&o  P5_n_death_m_&o  P95_n_death_m_&o 
P50_n_death_w_&o  P5_n_death_w_&o  P95_n_death_w_&o 

/** YLL_80yLifeExpect_3Disc_A1599_M*/

P50_n_tested_ancpd_&o   P50_n_test_anclabpd_&o 
/* HIVST...*/
P50_n_tested_m_sympt_&o  P50_n_tested_w_sympt_&o 
/*Ntests_FACNOSYMPT_M1599_M... Ntests_IndexFAC_M1599_M...Ntests_RecInf_M1599_M ... Ntests_COM_M1599_M*/
P50_n_tested_swprog_&o  P50_n_tested_sw_&o 
P50_n_tested_m_&o  P5_n_tested_m_&o  P95_n_tested_m_&o 
P50_n_tested_w_&o  P5_n_tested_w_&o  P95_n_tested_w_&o
P50_n_tested_&o    P5_n_tested_&o    P95_n_tested_&o
/*TOTHIVST_M1599_M...*/

P50_n_diag_anclabpd_&o 
/*NPosConfHIVST_PD_M1599_M.... NPosTests_FAC_M1599_M... NPosTests_IndexFAC_M1599_M...NPosTests_RecInf_M1599_M ... NPosTests_COM_M1599_M*/
P50_n_diag_progsw_&o  P50_n_diag_sw_&o 
P50_n_diag_m_&o  P5_n_diag_m_&o  P95_n_diag_m_&o 
P50_n_diag_w_&o  P5_n_diag_w_&o  P95_n_diag_w_&o 
/* TOTPosConfHIVST_M1599_M..*/

P50_test_proppos_m_&o  P5_test_proppos_m_&o  P95_test_proppos_m_&o 
P50_test_proppos_w_&o  P5_test_proppos_w_&o  P95_test_proppos_w_&o
P50_test_prop_positive_&o	P5_test_prop_positive_&o  P95_test_prop_positive_&o
P50_test_proppos_1524w_&o   P50_test_proppos_sw_&o 

/* DREAMS */

/*NFSWprog_FSW1599_M... NFSWprogEver_FSW1599_M*/
/*NSBCC_A1599_M ...NCUPP_A1599_M ... NCondoms_A1599_M*/
P50_n_new_vmmc1549m_&o
P50_n_init_prep_oral_1524w_&o P50_n_prep_oral_ly_1524w_&o   P50_n_prep_oral_ever_1524w_&o 
P50_n_init_prep_oral_sw_&o    P50_n_prep_oral_ly_sw_&o 		P50_n_prep_oral_ever_sw_&o 
P50_n_init_prep_oral_sdc_&o   P50_n_prep_oral_ly_sdc_&o 	P50_n_prep_oral_ever_sdc_&o
/*NTDFPrEPinit_pregbfF1549_M    NTDFPrEP_pregbfF1549_M  NTDFPrEPEver_pregbfF1549_M*/
P50_n_init_prep_vr_1524w_&o   P50_n_prep_vr_ly_1524w_&o		P50_n_prep_vr_ever_1524w_&o 
P50_n_init_prep_vr_sw_&o 	  P50_n_prep_vr_ly_sw_&o 		P50_n_prep_vr_ever_sw_&o
P50_n_init_prep_vr_sdc_&o     P50_n_prep_vr_ly_sdc_&o	 	P50_n_prep_vr_ever_sdc_&o
/*NDPVPrEPinit_pregbfF1549_M    NDPVPrEP_pregbfF1549_M  NDPVPrEPEver_pregbfF1549_M*/
P50_n_init_prep_inj_1524w_&o  P50_n_prep_inj_ly_1524w_&o	P50_n_prep_inj_ever_1524w_&o
P50_n_init_prep_inj_sw_&o     P50_n_prep_inj_ly_sw_&o		P50_n_prep_inj_ever_sw_&o 
P50_n_init_prep_inj_sdc_&o    P50_n_prep_inj_ly_sdc_&o 		P50_n_prep_inj_ever_sdc_&o
/*NCABPrEPinit_pregbfF1549_M    NCABPrEP_pregbfF1549_M	NCABPrEPEver_pregbfF1549_M*/		
;
%mend;
%flow(o=1);
%flow(o=15);

	
