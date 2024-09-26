
***Program to produce graphs using averages across runs
* Based on MIHPSA South Africa version (JAS Oct/Nov23with MW observational data copied from "graphs from output file_mlw7" in malawi branch;

* libname a "C:\Users\rmjlja9\OneDrive - University College London\MIHPSA Malawi\HIV Synthesis outputs\MIHPSA Phase II\mw_mihpsa_O99_29thApr24";

libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\mihpsa_malawi\mlw14_out\";


proc printto   ; *     log="C:\Users\Toshiba\Documents\My SAS Files\outcome model\unified program\log1";

%let pth_export_mihpsa_mw= C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\mihpsa_malawi\mlw_f_out\export;run;

data c;
  set a.long_mlw_f;


* if option = 99 then option = 0;
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





proc sort; by cald run ;run;
data c;set c;count_csim+1;by cald ;if first.cald then count_csim=1;run;***counts the number of runs;
proc means max data=c;var count_csim     ;run; ***number of runs - this is manually inputted in nfit below;
%let nfit = 105 ;			* 94 fits out of 1000 JAS Nov23;
%let year_end = 2072.75 ;	*simulation ends at 2072.75 for calibration JAS Oct;
run;
proc sort;by cald option ;run;




***One macro for option 99. Gives medians ranges etc by option;
data option_0;
set c;
if option ne 99 then delete;


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
	n_yllag_hiv_m
	n_yllag_hiv_w  
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
%let mean_var = mean_&var._&s;

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
mean_&varb._&s = mean(of &varb.1-&varb.&nfit);


keep cald p5_&varb._&s p95_&varb._&s p50_&varb._&s p25_&varb._&s p75_&varb._&s mean_&varb._&s ;
run;

      proc datasets nodetails nowarn nolist; 
      delete  gg&count;quit;run;
%end;
%mend;


%option_(99);
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
g99_1   g99_2   g99_3   g99_4   g99_5   g99_6   g99_7   g99_8   g99_9   g99_10  g99_11  g99_12  g99_13  g99_14  g99_15  g99_16  g99_17  g99_18  g99_19  g99_20  
g99_21  g99_22  g99_23  g99_24  g99_25  g99_26  g99_27  g99_28  g99_29  g99_30  g99_31  g99_32  g99_33  g99_34  g99_35  g99_36  g99_37  g99_38  g99_39  g99_40  
g99_41  g99_42  g99_43  g99_44  g99_45  g99_46  g99_47  g99_48  g99_49  g99_50  g99_51  g99_52  g99_53  g99_54  g99_55  g99_56  g99_57  g99_58  g99_59  g99_60 
g99_61  g99_62  g99_63  g99_64  g99_65  g99_66  g99_67  g99_68  g99_69  g99_70  g99_71  g99_72  g99_73  g99_74  g99_75  g99_76  g99_77  g99_78  g99_79  g99_80  
g99_81  g99_82  g99_83  g99_84  g99_85  g99_86  g99_87  g99_88  g99_89  g99_90  g99_91  g99_92  g99_93  g99_94  g99_95  g99_96  g99_97  g99_98  g99_99 g99_100 
g99_101 g99_102 g99_103 g99_104 g99_105 g99_106 g99_107 g99_108 g99_109 g99_110 g99_111 g99_112 g99_113 g99_114 g99_115 g99_116 g99_117 g99_118 g99_119 g99_120 
g99_121 g99_122 g99_123 g99_124 g99_125 g99_126 g99_127 g99_128 g99_129 g99_130 g99_131 g99_132 g99_133 g99_134 g99_135 g99_136 g99_137 g99_138 g99_139 g99_140 
g99_141 g99_142 g99_143 g99_144 g99_145 g99_146 g99_147 g99_148 g99_149 g99_150 g99_151 g99_152 g99_153 g99_154 g99_155 g99_156 g99_157 g99_158 g99_159 g99_160 
g99_161 g99_162 g99_163 g99_164 g99_165 g99_166 g99_167 g99_168 g99_169 g99_170 g99_171 g99_172 g99_173 g99_174 g99_175 g99_176 g99_177 g99_178 g99_179 g99_180 
g99_181 g99_182 g99_183 g99_184 g99_185 g99_186 g99_187 g99_188 g99_189 g99_190 g99_191 g99_192 g99_193 g99_194 g99_195 g99_196 g99_197 g99_198 g99_10 g99_200 
g99_201 g99_202 g99_203 g99_204 g99_205 g99_206 g99_207 g99_208 g99_209 g99_210 g99_211 g99_212 g99_213 g99_214 g99_215 g99_216 g99_217 g99_218 g99_219 g99_220 
g99_221 g99_222 g99_223 g99_224 g99_225 g99_226 g99_227 g99_228 g99_229 g99_230 g99_231 g99_232 g99_233 g99_234 g99_235 g99_236 g99_237 g99_238 g99_239 g99_240 
g99_241 g99_242 g99_243 g99_244 g99_245 g99_246 g99_247 g99_248 g99_249 g99_250 g99_251 g99_252 g99_253 g99_254 g99_255 g99_256 g99_257	g99_258	g99_259	g99_260
g99_261 g99_262 g99_263 g99_264 g99_265 g99_266 g99_267 g99_268
;
by cald;run;


data d; set d_a;


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

rename mean_n_hiv1524m_&o = N_PLHIV_15_24_M;
rename mean_n_hiv1524w_&o = N_PLHIV_15_24_F;
rename mean_n_hiv2549m_&o = N_PLHIV_25_49_M;
rename mean_n_hiv2549w_&o = N_PLHIV_25_49_F;
rename mean_n_hiv55plm_&o = N_PLHIV_50_UP_M;
rename mean_n_hiv55plw_&o = N_PLHIV_50_UP_F;
rename mean_n_alive_1524m_&o = N_Total_15_24_M;
rename mean_n_alive_1524w_&o = N_Total_15_24_F;
rename mean_n_alive_2549m_&o = N_Total_25_49_M;
rename mean_n_alive_2549w_&o = N_Total_25_49_F;
rename mean_n_alive_55plm_&o = N_Total_50_UP_M;
rename mean_n_alive_55plw_&o = N_Total_50_UP_F;
rename mean_n_diag_ever_m_&o = N_Diag_15_UP_M;
rename mean_n_diag_ever_w_&o = N_Diag_15_UP_F;
rename mean_n_onart_m_&o = N_ART_15_UP_M;
rename mean_n_onart_w_&o = N_ART_15_UP_F;
rename mean_n_onart_vl1000_m_&o = N_VLS_15_UP_M;
rename mean_n_onart_vl1000_w_&o = N_VLS_15_UP_F;
rename mean_n_not_on_art_cd4ge500__&o = N_PLHIV_15_UP_CD4_500_INF;
rename mean_n_not_on_art_cd4350500__&o = N_PLHIV_15_UP_CD4_350_500;
rename mean_n_not_on_art_cd4200350__&o = N_PLHIV_15_UP_CD4_200_350;
rename mean_n_not_on_art_cd450200__&o = N_PLHIV_15_UP_CD4_050_200;
rename mean_n_not_on_art_cd4050__&o = N_PLHIV_15_UP_CD4_000_050;


year= floor(cald);

*** NB WORK OUT HOW TO CHANGE THE ORDER OF VARIABLES HERE ***;
* Add missing rows for child/MSM/omitted variables;
* Change year to column heads;
keep year
mean_n_hiv1524m_&o
mean_n_hiv1524w_&o
mean_n_hiv2549m_&o
mean_n_hiv2549w_&o
mean_n_hiv55plm_&o
mean_n_hiv55plw_&o
mean_n_alive_1524m_&o
mean_n_alive_1524w_&o
mean_n_alive_2549m_&o
mean_n_alive_2549w_&o
mean_n_alive_55plm_&o
mean_n_alive_55plw_&o
mean_n_diag_ever_m_&o
mean_n_diag_ever_w_&o
mean_n_onart_m_&o
mean_n_onart_w_&o
mean_n_onart_vl1000_m_&o
mean_n_onart_vl1000_w_&o
mean_n_not_on_art_cd4ge500__&o
mean_n_not_on_art_cd4350500__&o
mean_n_not_on_art_cd4200350__&o
mean_n_not_on_art_cd450200__&o
mean_n_not_on_art_cd4050__&o
             
;
run;
%mend;

%stock(o=99);


proc transpose data = s99 out= s99_transposed;
run;

proc print data=s99_transposed; run; 

PROC export data=s99_transposed outFILE= "&pth_export_mihpsa_mw\mihpsa_mw_p2_synthesis_26sep24" dbms=xlsx REPLACE;
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
mean_&v._&s = median(of &v.1-&v.&nfit);
keep cald /*p5_&v._&s p95_&v._&s*/ mean_&v._&s;
run;
proc datasets nodetails nowarn nolist;delete &v;run;
%mend var_cy;


/* Define the list of variables */
%let var_list = 
	n_birth
	n_give_birth_w_hiv
	n_give_birth_on_art					
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
	n_yllag_hiv_m						
	n_yllag_hiv_w						
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
l_give_birth_on_art_&s
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
l_n_yllag_hiv_m_&s  
l_n_yllag_hiv_w_&s  
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

rename mean_n_birth_&o				= N_BirthAll;
rename mean_n_give_birth_w_hiv_&o	= N_BirthHIV;
rename mean_n_give_birth_on_art_&o	= N_BirthART;
/*rename mean__&o            = N_NewHIV_00_14_C;*/
rename mean_n_new_inf1524m_&o		= N_NewHIV_15_24_M;
rename mean_n_new_inf1524w_&o		= N_NewHIV_15_24_F;
rename mean_n_new_inf2549m_&o		= N_NewHIV_25_49_M;
rename mean_n_new_inf2549w_&o		= N_NewHIV_25_49_F;
rename mean_n_new_inf55plm_&o		= N_NewHIV_50_UP_M;
rename mean_n_new_inf55plw_&o		= N_NewHIV_50_UP_F;
/*rename mean__&o            = N_DeathsHIV_00_14_C;*/
rename mean_n_death_hivrel_m_&o		= N_DeathsHIV_15_UP_M;
rename mean_n_death_hivrel_w_&o		= N_DeathsHIV_15_UP_F;
/*rename mean__&o            = N_DeathsAll_00_14_C;*/
rename mean_n_death_m_&o				= N_DeathsAll_15_UP_M;
rename mean_n_death_w_&o				= N_DeathsAll_15_UP_F;
/*rename mean__&o            = N_YLL_00_14_C;*/
rename mean_n_yllag_hiv_m_&o			= N_YLL_15_UP_M;
rename mean_n_yllag_hiv_w_&o			= N_YLL_15_UP_F;
/*rename mean__&o			= N_HIVTest_Facility_NEG_15_UP;*/
/*rename mean__&o			= N_HIVTest_Facility_POS_15_UP;*/
/*rename mean__&o            = N_HIVTest_Index_NEG_15_UP;*/
/*rename mean__&o            = N_HIVTest_Index_POS_15_UP;*/
/*rename mean__&o            = N_HIVTest_Community_NEG_15_UP;*/
/*rename mean__&o            = N_HIVTest_Community_POS_15_UP;*/
rename mean_n_diag_self_test_&o		= N_HIVTest_SelfTest_POS_15_UP;
rename mean_n_self_tests_&o			= N_HIVTest_SelfTest_Dist;
/*rename mean__&o            = N_Condom_Acts;*/
rename mean_n_new_vmmc_&o			= N_NewVMMC;
rename mean_py_prep_oral_1524w_&o	= PY_PREP_ORAL_AGYW;
rename mean_py_prep_oral_sw_&o		= PY_PREP_ORAL_FSW;
/*rename mean__&o            = PY_PREP_ORAL_MSM;*/
rename mean_py_prep_inj_1524w_&o		= PY_PREP_INJECT_AGYW;
rename mean_py_prep_inj_sw_&o		= PY_PREP_INJECT_FSW;
/*rename mean__&o            = PY_PREP_INJECT_MSM;*/
/*rename mean__&o            = N_ART_ADH_15_UP_F;*/
/*rename mean__&o            = N_ART_ADH_15_UP_M;*/
rename mean_n_vm_&o					= N_VL_TEST_15_UP;
/*rename mean__&o            = N_VL_TEST_00_14;*/
rename mean_n_sw_program_visit_&o	= N_OUTREACH_FSW;
/*rename mean__&o            = N_OUTREACH_MSM;*/
/*rename mean__&o            = N_EconEmpowerment;*/
/*rename mean__&o            = N_CSE_15_19_F;*/
/*rename mean__&o            = N_CSE_15_19_M;*/
rename mean_n_hivneg_tests_&o		= N_HIVTest_Total_NEG_15_UP;
rename mean_n_hivpos_tests_&o		= N_HIVTest_Total_POS_15_UP;

rename cald=year;

*** NB WORK OUT HOW TO CHANGE THE ORDER OF VARIABLES HERE ***;
* Add missing rows for child/MSM/omitted variables;
* Change year to column heads;
keep cald
mean_n_birth_&o
mean_n_give_birth_w_hiv_&o
mean_n_give_birth_on_art_&o
/*mean__&o*/
mean_n_new_inf1524m_&o
mean_n_new_inf1524w_&o
mean_n_new_inf2549m_&o
mean_n_new_inf2549w_&o
mean_n_new_inf55plm_&o
mean_n_new_inf55plw_&o
/*mean__&o*/
mean_n_death_hivrel_m_&o
mean_n_death_hivrel_w_&o
/*mean__&o*/
mean_n_death_m_&o
mean_n_death_w_&o
/*mean__&o*/
mean_n_yllag_hiv_m_&o
mean_n_yllag_hiv_w_&o
/*mean__&o*/
/*mean__&o*/
/*mean__&o*/
/*mean__&o*/
/*mean__&o*/
/*mean__&o*/
mean_n_diag_self_test_&o
mean_n_self_tests_&o
/*mean__&o*/
mean_n_new_vmmc_&o
mean_py_prep_oral_1524w_&o
mean_py_prep_oral_sw_&o
/*mean__&o*/
mean_py_prep_inj_1524w_&o
mean_py_prep_inj_sw_&o
/*mean__&o*/
/*mean__&o*/
/*mean__&o*/
mean_n_vm_&o
/*mean__&o*/
mean_n_sw_program_visit_&o
/*mean__&o*/
/*mean__&o*/
/*mean__&o*/
/*mean__&o*/
mean_n_hivneg_tests_&o
mean_n_hivpos_tests_&o
;run;
%mend;

%flow(o=99);

proc transpose data = wide_allyears_out_99 out= wide_allyears_out_99_transposed;run;

ods html;
proc print data=wide_allyears_out_99_transposed; run; 

PROC export data=wide_allyears_out_99_transposed outFILE= "&pth_export_mihpsa_mw\mihpsa_mw_p2_synthesis_26sep24" dbms=xlsx REPLACE;
sheet="flows_minimal";  RUN;

ods html close;
