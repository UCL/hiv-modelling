

* options user="/folders/myfolders/";

 proc printto ; 

libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\vaccine\vaccine_n_d_keep_prep_out\";



data y ; set b.l_vaccine_n_d_keep_prep_y; 


  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

data e; set y; keep &v run cald option ;

proc means  noprint data=e; var &v; output out=y_24 mean= &v._24; by run ; where 2024.0 <= cald <= 2024.25; 

proc means  noprint data=e; var &v; output out=y_39 mean= &v._39; by run ; where 2039.0 <= cald <= 2040.0; 

proc means  noprint data=e; var &v; output out=y_40 mean= &v._40; by run  option ; where 2040.0 <= cald <  2041.0; 
proc means  noprint data=e; var &v; output out=y_41 mean= &v._41; by run  option ; where 2041.0 <= cald <  2042.0; 
proc means  noprint data=e; var &v; output out=y_42 mean= &v._42; by run  option ; where 2042.0 <= cald <  2043.0; 
proc means  noprint data=e; var &v; output out=y_43 mean= &v._43; by run  option ; where 2043.0 <= cald <  2044.0; 
proc means  noprint data=e; var &v; output out=y_44 mean= &v._44; by run  option ; where 2044.0 <= cald <  2045.0; 
proc means  noprint data=e; var &v; output out=y_45 mean= &v._45; by run  option ; where 2045.0 <= cald <  2046.0; 
proc means  noprint data=e; var &v; output out=y_46 mean= &v._46; by run  option ; where 2046.0 <= cald <  2047.0; 
proc means  noprint data=e; var &v; output out=y_47 mean= &v._47; by run  option ; where 2047.0 <= cald <  2048.0; 
proc means  noprint data=e; var &v; output out=y_48 mean= &v._48; by run  option ; where 2048.0 <= cald <  2049.0; 
proc means  noprint data=e; var &v; output out=y_49 mean= &v._49; by run  option ; where 2049.0 <= cald <  2050.0; 
proc means  noprint data=e; var &v; output out=y_50 mean= &v._50; by run  option ; where 2050.0 <= cald <  2051.0; 
proc means  noprint data=e; var &v; output out=y_51 mean= &v._51; by run  option ; where 2051.0 <= cald <  2052.0; 
proc means  noprint data=e; var &v; output out=y_52 mean= &v._52; by run  option ; where 2052.0 <= cald <  2053.0; 
proc means  noprint data=e; var &v; output out=y_53 mean= &v._53; by run  option ; where 2053.0 <= cald <  2054.0; 
proc means  noprint data=e; var &v; output out=y_54 mean= &v._54; by run  option ; where 2054.0 <= cald <  2055.0; 
proc means  noprint data=e; var &v; output out=y_55 mean= &v._55; by run  option ; where 2055.0 <= cald <  2056.0; 
proc means  noprint data=e; var &v; output out=y_56 mean= &v._56; by run  option ; where 2056.0 <= cald <  2057.0; 
proc means  noprint data=e; var &v; output out=y_57 mean= &v._57; by run  option ; where 2057.0 <= cald <  2058.0; 
proc means  noprint data=e; var &v; output out=y_58 mean= &v._58; by run  option ; where 2058.0 <= cald <  2059.0; 
proc means  noprint data=e; var &v; output out=y_59 mean= &v._59; by run  option ; where 2059.0 <= cald <  2060.0; 
proc means  noprint data=e; var &v; output out=y_60 mean= &v._60; by run  option ; where 2060.0 <= cald <  2061.0; 
proc means  noprint data=e; var &v; output out=y_61 mean= &v._61; by run  option ; where 2061.0 <= cald <  2062.0; 
proc means  noprint data=e; var &v; output out=y_62 mean= &v._62; by run  option ; where 2062.0 <= cald <  2063.0; 
proc means  noprint data=e; var &v; output out=y_63 mean= &v._63; by run  option ; where 2063.0 <= cald <  2064.0; 
proc means  noprint data=e; var &v; output out=y_64 mean= &v._64; by run  option ; where 2064.0 <= cald <  2065.0; 
proc means  noprint data=e; var &v; output out=y_65 mean= &v._65; by run  option ; where 2065.0 <= cald <  2066.0; 
proc means  noprint data=e; var &v; output out=y_66 mean= &v._66; by run  option ; where 2066.0 <= cald <  2067.0; 
proc means  noprint data=e; var &v; output out=y_67 mean= &v._67; by run  option ; where 2067.0 <= cald <  2068.0; 
proc means  noprint data=e; var &v; output out=y_68 mean= &v._68; by run  option ; where 2068.0 <= cald <  2069.0; 
proc means  noprint data=e; var &v; output out=y_69 mean= &v._69; by run  option ; where 2069.0 <= cald <  2070.0; 

proc means noprint data=e; var &v; output out=y_30y mean= &v._30y; by run option ; where 2040.0 <= cald < 2070.00;   
																				   
proc sort data=y_30y    ; by run; proc transpose data=y_30y  out=t_30y  prefix=&v._30y_  ; var &v._30y    ; by run; 																																																						

proc sort data=y_40     ; by run; proc transpose data=y_40   out=t_40   prefix=&v._40_  ; var &v._40     ; by run; 																																																						
proc sort data=y_41     ; by run; proc transpose data=y_41   out=t_41   prefix=&v._41_  ; var &v._41     ; by run; 																																																						
proc sort data=y_42     ; by run; proc transpose data=y_42   out=t_42   prefix=&v._42_  ; var &v._42     ; by run; 																																																						
proc sort data=y_43     ; by run; proc transpose data=y_43   out=t_43   prefix=&v._43_  ; var &v._43     ; by run; 																																																						
proc sort data=y_44     ; by run; proc transpose data=y_44   out=t_44   prefix=&v._44_  ; var &v._44     ; by run; 																																																						
proc sort data=y_45     ; by run; proc transpose data=y_45   out=t_45   prefix=&v._45_  ; var &v._45     ; by run; 																																																						
proc sort data=y_46     ; by run; proc transpose data=y_46   out=t_46   prefix=&v._46_  ; var &v._46     ; by run; 																																																						
proc sort data=y_47     ; by run; proc transpose data=y_47   out=t_47   prefix=&v._47_  ; var &v._47     ; by run; 																																																						
proc sort data=y_48     ; by run; proc transpose data=y_48   out=t_48   prefix=&v._48_  ; var &v._48     ; by run; 																																																						
proc sort data=y_49     ; by run; proc transpose data=y_49   out=t_49   prefix=&v._49_  ; var &v._49     ; by run; 																																																						
proc sort data=y_50     ; by run; proc transpose data=y_50   out=t_50   prefix=&v._50_  ; var &v._50     ; by run; 																																																						
proc sort data=y_51     ; by run; proc transpose data=y_51   out=t_51   prefix=&v._51_  ; var &v._51     ; by run; 																																																						
proc sort data=y_52     ; by run; proc transpose data=y_52   out=t_52   prefix=&v._52_  ; var &v._52     ; by run; 																																																						
proc sort data=y_53     ; by run; proc transpose data=y_53   out=t_53   prefix=&v._53_  ; var &v._53     ; by run; 																																																						
proc sort data=y_54     ; by run; proc transpose data=y_54   out=t_54   prefix=&v._54_  ; var &v._54     ; by run; 																																																						
proc sort data=y_55     ; by run; proc transpose data=y_55   out=t_55   prefix=&v._55_  ; var &v._55     ; by run; 																																																						
proc sort data=y_56     ; by run; proc transpose data=y_56   out=t_56   prefix=&v._56_  ; var &v._56     ; by run; 																																																						
proc sort data=y_57     ; by run; proc transpose data=y_57   out=t_57   prefix=&v._57_  ; var &v._57     ; by run; 																																																						
proc sort data=y_58     ; by run; proc transpose data=y_58   out=t_58   prefix=&v._58_  ; var &v._58     ; by run; 																																																						
proc sort data=y_59     ; by run; proc transpose data=y_59   out=t_59   prefix=&v._59_  ; var &v._59     ; by run; 																																																						
proc sort data=y_60     ; by run; proc transpose data=y_60   out=t_60   prefix=&v._60_  ; var &v._60     ; by run; 																																																						
proc sort data=y_61     ; by run; proc transpose data=y_61   out=t_61   prefix=&v._61_  ; var &v._61     ; by run; 																																																						
proc sort data=y_62     ; by run; proc transpose data=y_62   out=t_62   prefix=&v._62_  ; var &v._62     ; by run; 																																																						
proc sort data=y_63     ; by run; proc transpose data=y_63   out=t_63   prefix=&v._63_  ; var &v._63     ; by run; 																																																						
proc sort data=y_64     ; by run; proc transpose data=y_64   out=t_64   prefix=&v._64_  ; var &v._64     ; by run; 																																																						
proc sort data=y_65     ; by run; proc transpose data=y_65   out=t_65   prefix=&v._65_  ; var &v._65     ; by run; 																																																						
proc sort data=y_66     ; by run; proc transpose data=y_66   out=t_66   prefix=&v._66_  ; var &v._66     ; by run; 																																																						
proc sort data=y_67     ; by run; proc transpose data=y_67   out=t_67   prefix=&v._67_  ; var &v._67     ; by run; 																																																						
proc sort data=y_68     ; by run; proc transpose data=y_68   out=t_68   prefix=&v._68_  ; var &v._68     ; by run; 																																																						
proc sort data=y_69     ; by run; proc transpose data=y_69   out=t_69   prefix=&v._69_  ; var &v._69     ; by run; 																																																						

data &v ; merge y_24 t_30y y_39 t_40 t_41 t_42 t_43 t_44 t_45 t_46 t_47 t_48 t_49 t_50 t_51 t_52 t_53 t_54 t_55 t_56 t_57 t_58 t_59 t_60 
t_61 t_62 t_63 t_64 t_65 t_66 t_67 t_68 t_69 ;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var; 

%var(v=incidence1549); %var(v=prevalence1549);

***Macro par used to add in values of all sampled parameters - values before intervention;
data f; set y; 
if cald=2024;

keep 

run cald 

&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp  n_alive
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop  super_inf_res  an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr fold_tr_newp switch_for_tox  future_prep_condom
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
zero_tdf_activity_k65r  zero_3tc_activity_m184  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

effect_visit_prob_diag_l  tb_base_prob_diag_l crypm_base_prob_diag_l tblam_eff_prob_diag_l  crag_eff_prob_diag_l sbi_base_prob_diag_l
rel_rate_death_tb_diag_e rel_rate_death_oth_adc_diag_e rel_rate_death_crypm_diag_e  rel_rate_death_sbi_diag_e
incr_death_rate_tb incr_death_rate_oth_adc incr_death_rate_crypm incr_death_rate_sbi  cm_1stvis_return_vlmg1000  
crag_cd4_l200 crag_cd4_l100  tblam_cd4_l200  tblam_cd4_l100    effect_tb_proph   effect_crypm_proph  effect_sbi_proph

effect_sw_prog_prep_any  prob_prep_any_restart_choice 
adh_pattern_prep_oral   rate_test_startprep_any    rate_choose_stop_prep_oral
prep_any_strategy   prob_prep_any_visit_counsel  rate_test_onprep_any  prep_willingness_threshold  
prob_prep_any_restart_choice  
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy    
higher_future_prep_oral_cov  pr_prep_inj_b  prep_inj_efficacy
rate_choose_stop_prep_inj   prep_inj_effect_inm_partner  res_trans_factor_ii
rel_pr_inm_inj_prep_tail_primary      rr_res_cab_dol  hivtest_type_1_init_prep_inj   hivtest_type_1_prep_inj
sens_ttype1_prep_inj_primary sens_ttype1_prep_inj_inf3m sens_ttype1_prep_inj_infge6m
sens_ttype3_prep_inj_primary sens_ttype3_prep_inj_inf3m sens_ttype3_prep_inj_infge6m

effect_sw_prog_prep_any prob_prep_any_restart_choice dol_higher_potency  cab_time_to_lower_threshold_g
sens_tests_prep_inj  pr_inm_inj_prep_primary
pref_prep_inj_beta_s1  testt1_prep_inj_eff_on_res_prim  incr_res_risk_cab_inf_3m  reg_option_107_after_cab
p_emerge_inm_res_cab_notpr
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_0_to_1 prob_onartvis_1_to_0
p_nactive_art_start_lt1p5 p_nactive_art_start_lt2  p_nactive_art_start_lt3  res_level_dol_cab_mut  pr_res_dol

;









libname b "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\vaccine\vaccine_m_b_keep_prep_out\";



data  b.incidence1549 ;
merge  incidence1549  prevalence1549   ;


d_incidence1549_40_2_1 = incidence1549_40_2 - incidence1549_40_1 ; d_incidence1549_40_3_1 = incidence1549_40_3 - incidence1549_40_1 ;d_incidence1549_40_4_1 = incidence1549_40_4 - incidence1549_40_1 ;

d_incidence1549_41_2_1 = incidence1549_41_2 - incidence1549_41_1 ; d_incidence1549_41_3_1 = incidence1549_41_3 - incidence1549_41_1 ;d_incidence1549_41_4_1 = incidence1549_41_4 - incidence1549_41_1 ;
d_incidence1549_42_2_1 = incidence1549_42_2 - incidence1549_42_1 ; d_incidence1549_42_3_1 = incidence1549_42_3 - incidence1549_42_1 ;d_incidence1549_42_4_1 = incidence1549_42_4 - incidence1549_42_1 ;
d_incidence1549_43_2_1 = incidence1549_43_2 - incidence1549_43_1 ; d_incidence1549_43_3_1 = incidence1549_43_3 - incidence1549_43_1 ;d_incidence1549_43_4_1 = incidence1549_43_4 - incidence1549_43_1 ;
d_incidence1549_44_2_1 = incidence1549_44_2 - incidence1549_44_1 ; d_incidence1549_44_3_1 = incidence1549_44_3 - incidence1549_44_1 ;d_incidence1549_44_4_1 = incidence1549_44_4 - incidence1549_44_1 ;
d_incidence1549_45_2_1 = incidence1549_45_2 - incidence1549_45_1 ; d_incidence1549_45_3_1 = incidence1549_45_3 - incidence1549_45_1 ;d_incidence1549_45_4_1 = incidence1549_45_4 - incidence1549_45_1 ;
d_incidence1549_46_2_1 = incidence1549_46_2 - incidence1549_46_1 ; d_incidence1549_46_3_1 = incidence1549_46_3 - incidence1549_46_1 ;d_incidence1549_46_4_1 = incidence1549_46_4 - incidence1549_46_1 ;
d_incidence1549_47_2_1 = incidence1549_47_2 - incidence1549_47_1 ; d_incidence1549_47_3_1 = incidence1549_47_3 - incidence1549_47_1 ;d_incidence1549_47_4_1 = incidence1549_47_4 - incidence1549_47_1 ;
d_incidence1549_48_2_1 = incidence1549_48_2 - incidence1549_48_1 ; d_incidence1549_48_3_1 = incidence1549_48_3 - incidence1549_48_1 ;d_incidence1549_48_4_1 = incidence1549_48_4 - incidence1549_48_1 ;
d_incidence1549_49_2_1 = incidence1549_49_2 - incidence1549_49_1 ; d_incidence1549_49_3_1 = incidence1549_49_3 - incidence1549_49_1 ;d_incidence1549_49_4_1 = incidence1549_49_4 - incidence1549_49_1 ;
d_incidence1549_50_2_1 = incidence1549_50_2 - incidence1549_50_1 ; d_incidence1549_50_3_1 = incidence1549_50_3 - incidence1549_50_1 ;d_incidence1549_50_4_1 = incidence1549_50_4 - incidence1549_50_1 ;
d_incidence1549_51_2_1 = incidence1549_51_2 - incidence1549_51_1 ; d_incidence1549_51_3_1 = incidence1549_51_3 - incidence1549_51_1 ;d_incidence1549_51_4_1 = incidence1549_51_4 - incidence1549_51_1 ;
d_incidence1549_52_2_1 = incidence1549_52_2 - incidence1549_52_1 ; d_incidence1549_52_3_1 = incidence1549_52_3 - incidence1549_52_1 ;d_incidence1549_52_4_1 = incidence1549_52_4 - incidence1549_52_1 ;
d_incidence1549_53_2_1 = incidence1549_53_2 - incidence1549_53_1 ; d_incidence1549_53_3_1 = incidence1549_53_3 - incidence1549_53_1 ;d_incidence1549_53_4_1 = incidence1549_53_4 - incidence1549_53_1 ;
d_incidence1549_54_2_1 = incidence1549_54_2 - incidence1549_54_1 ; d_incidence1549_54_3_1 = incidence1549_54_3 - incidence1549_54_1 ;d_incidence1549_54_4_1 = incidence1549_54_4 - incidence1549_54_1 ;
d_incidence1549_55_2_1 = incidence1549_55_2 - incidence1549_55_1 ; d_incidence1549_55_3_1 = incidence1549_55_3 - incidence1549_55_1 ;d_incidence1549_55_4_1 = incidence1549_55_4 - incidence1549_55_1 ;
d_incidence1549_56_2_1 = incidence1549_56_2 - incidence1549_56_1 ; d_incidence1549_56_3_1 = incidence1549_56_3 - incidence1549_56_1 ;d_incidence1549_56_4_1 = incidence1549_56_4 - incidence1549_56_1 ;
d_incidence1549_57_2_1 = incidence1549_57_2 - incidence1549_57_1 ; d_incidence1549_57_3_1 = incidence1549_57_3 - incidence1549_57_1 ;d_incidence1549_57_4_1 = incidence1549_57_4 - incidence1549_57_1 ;
d_incidence1549_58_2_1 = incidence1549_58_2 - incidence1549_58_1 ; d_incidence1549_58_3_1 = incidence1549_58_3 - incidence1549_58_1 ;d_incidence1549_58_4_1 = incidence1549_58_4 - incidence1549_58_1 ;
d_incidence1549_59_2_1 = incidence1549_59_2 - incidence1549_59_1 ; d_incidence1549_59_3_1 = incidence1549_59_3 - incidence1549_59_1 ;d_incidence1549_59_4_1 = incidence1549_59_4 - incidence1549_59_1 ;
d_incidence1549_60_2_1 = incidence1549_60_2 - incidence1549_60_1 ; d_incidence1549_60_3_1 = incidence1549_60_3 - incidence1549_60_1 ;d_incidence1549_60_4_1 = incidence1549_60_4 - incidence1549_60_1 ;
d_incidence1549_61_2_1 = incidence1549_61_2 - incidence1549_61_1 ; d_incidence1549_61_3_1 = incidence1549_61_3 - incidence1549_61_1 ;d_incidence1549_61_4_1 = incidence1549_61_4 - incidence1549_61_1 ;
d_incidence1549_62_2_1 = incidence1549_62_2 - incidence1549_62_1 ; d_incidence1549_62_3_1 = incidence1549_62_3 - incidence1549_62_1 ;d_incidence1549_62_4_1 = incidence1549_62_4 - incidence1549_62_1 ;
d_incidence1549_63_2_1 = incidence1549_63_2 - incidence1549_63_1 ; d_incidence1549_63_3_1 = incidence1549_63_3 - incidence1549_63_1 ;d_incidence1549_63_4_1 = incidence1549_63_4 - incidence1549_63_1 ;
d_incidence1549_64_2_1 = incidence1549_64_2 - incidence1549_64_1 ; d_incidence1549_64_3_1 = incidence1549_64_3 - incidence1549_64_1 ;d_incidence1549_64_4_1 = incidence1549_64_4 - incidence1549_64_1 ;
d_incidence1549_65_2_1 = incidence1549_65_2 - incidence1549_65_1 ; d_incidence1549_65_3_1 = incidence1549_65_3 - incidence1549_65_1 ;d_incidence1549_65_4_1 = incidence1549_65_4 - incidence1549_65_1 ;
d_incidence1549_66_2_1 = incidence1549_66_2 - incidence1549_66_1 ; d_incidence1549_66_3_1 = incidence1549_66_3 - incidence1549_66_1 ;d_incidence1549_66_4_1 = incidence1549_66_4 - incidence1549_66_1 ;
d_incidence1549_67_2_1 = incidence1549_67_2 - incidence1549_67_1 ; d_incidence1549_67_3_1 = incidence1549_67_3 - incidence1549_67_1 ;d_incidence1549_67_4_1 = incidence1549_67_4 - incidence1549_67_1 ;
d_incidence1549_68_2_1 = incidence1549_68_2 - incidence1549_68_1 ; d_incidence1549_68_3_1 = incidence1549_68_3 - incidence1549_68_1 ;d_incidence1549_68_4_1 = incidence1549_68_4 - incidence1549_68_1 ;
d_incidence1549_69_2_1 = incidence1549_69_2 - incidence1549_69_1 ; d_incidence1549_69_3_1 = incidence1549_69_3 - incidence1549_69_1 ;d_incidence1549_69_4_1 = incidence1549_69_4 - incidence1549_69_1 ;



/* OPTION 1 */

proc means noprint  data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_1  incidence1549_41_1  incidence1549_42_1  incidence1549_43_1  incidence1549_44_1  incidence1549_45_1  incidence1549_46_1  incidence1549_47_1  
incidence1549_48_1  incidence1549_49_1  incidence1549_50_1  incidence1549_51_1  incidence1549_52_1  incidence1549_53_1  incidence1549_54_1  incidence1549_55_1  
incidence1549_56_1  incidence1549_57_1  incidence1549_58_1  incidence1549_59_1  incidence1549_60_1  incidence1549_61_1  incidence1549_62_1  incidence1549_63_1  
incidence1549_64_1  incidence1549_65_1  incidence1549_66_1  incidence1549_67_1  incidence1549_68_1  incidence1549_69_1 ;
output out= median_option_1 median= / autoname;
proc transpose data=median_option_1 out=t_median_option_1;
data f_median_option_1; set t_median_option_1; median_incidence1549_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_1  incidence1549_41_1  incidence1549_42_1  incidence1549_43_1  incidence1549_44_1  incidence1549_45_1  incidence1549_46_1  incidence1549_47_1  
incidence1549_48_1  incidence1549_49_1  incidence1549_50_1  incidence1549_51_1  incidence1549_52_1  incidence1549_53_1  incidence1549_54_1  incidence1549_55_1  
incidence1549_56_1  incidence1549_57_1  incidence1549_58_1  incidence1549_59_1  incidence1549_60_1  incidence1549_61_1  incidence1549_62_1  incidence1549_63_1  
incidence1549_64_1  incidence1549_65_1  incidence1549_66_1  incidence1549_67_1  incidence1549_68_1  incidence1549_69_1 ;
output out= mean_option_1 mean= / autoname;
proc transpose data=mean_option_1 out=t_mean_option_1;
data f_mean_option_1; set t_mean_option_1; mean_incidence1549_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_1  incidence1549_41_1  incidence1549_42_1  incidence1549_43_1  incidence1549_44_1  incidence1549_45_1  incidence1549_46_1  incidence1549_47_1  
incidence1549_48_1  incidence1549_49_1  incidence1549_50_1  incidence1549_51_1  incidence1549_52_1  incidence1549_53_1  incidence1549_54_1  incidence1549_55_1  
incidence1549_56_1  incidence1549_57_1  incidence1549_58_1  incidence1549_59_1  incidence1549_60_1  incidence1549_61_1  incidence1549_62_1  incidence1549_63_1  
incidence1549_64_1  incidence1549_65_1  incidence1549_66_1  incidence1549_67_1  incidence1549_68_1  incidence1549_69_1 ;
output out= p5_option_1 p5= / autoname;
proc transpose data=p5_option_1 out=t_p5_option_1;
data f_p5_option_1; set t_p5_option_1; p5_incidence1549_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p95 p95 ;
var incidence1549_39 
incidence1549_40_1  incidence1549_41_1  incidence1549_42_1  incidence1549_43_1  incidence1549_44_1  incidence1549_45_1  incidence1549_46_1  incidence1549_47_1  
incidence1549_48_1  incidence1549_49_1  incidence1549_50_1  incidence1549_51_1  incidence1549_52_1  incidence1549_53_1  incidence1549_54_1  incidence1549_55_1  
incidence1549_56_1  incidence1549_57_1  incidence1549_58_1  incidence1549_59_1  incidence1549_60_1  incidence1549_61_1  incidence1549_62_1  incidence1549_63_1  
incidence1549_64_1  incidence1549_65_1  incidence1549_66_1  incidence1549_67_1  incidence1549_68_1  incidence1549_69_1 ;
output out= p95_option_1 p95= / autoname;
proc transpose data=p95_option_1 out=t_p95_option_1;
data f_p95_option_1; set t_p95_option_1; p95_incidence1549_1 = col1; 
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;


/* OPTION 2 */

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_2  incidence1549_41_2  incidence1549_42_2  incidence1549_43_2  incidence1549_44_2  incidence1549_45_2  incidence1549_46_2  incidence1549_47_2  
incidence1549_48_2  incidence1549_49_2  incidence1549_50_2  incidence1549_51_2  incidence1549_52_2  incidence1549_53_2  incidence1549_54_2  incidence1549_55_2  
incidence1549_56_2  incidence1549_57_2  incidence1549_58_2  incidence1549_59_2  incidence1549_60_2  incidence1549_61_2  incidence1549_62_2  incidence1549_63_2  
incidence1549_64_2  incidence1549_65_2  incidence1549_66_2  incidence1549_67_2  incidence1549_68_2  incidence1549_69_2 ;
output out= median_option_2 median= / autoname;
proc transpose data=median_option_2 out=t_median_option_2;
data f_median_option_2; set t_median_option_2; median_incidence1549_2 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_2  incidence1549_41_2  incidence1549_42_2  incidence1549_43_2  incidence1549_44_2  incidence1549_45_2  incidence1549_46_2  incidence1549_47_2  
incidence1549_48_2  incidence1549_49_2  incidence1549_50_2  incidence1549_51_2  incidence1549_52_2  incidence1549_53_2  incidence1549_54_2  incidence1549_55_2  
incidence1549_56_2  incidence1549_57_2  incidence1549_58_2  incidence1549_59_2  incidence1549_60_2  incidence1549_61_2  incidence1549_62_2  incidence1549_63_2  
incidence1549_64_2  incidence1549_65_2  incidence1549_66_2  incidence1549_67_2  incidence1549_68_2  incidence1549_69_2 ;
output out= mean_option_2 mean= / autoname;
proc transpose data=mean_option_2 out=t_mean_option_2;
data f_mean_option_2; set t_mean_option_2; mean_incidence1549_2 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_2  incidence1549_41_2  incidence1549_42_2  incidence1549_43_2  incidence1549_44_2  incidence1549_45_2  incidence1549_46_2  incidence1549_47_2  
incidence1549_48_2  incidence1549_49_2  incidence1549_50_2  incidence1549_51_2  incidence1549_52_2  incidence1549_53_2  incidence1549_54_2  incidence1549_55_2  
incidence1549_56_2  incidence1549_57_2  incidence1549_58_2  incidence1549_59_2  incidence1549_60_2  incidence1549_61_2  incidence1549_62_2  incidence1549_63_2  
incidence1549_64_2  incidence1549_65_2  incidence1549_66_2  incidence1549_67_2  incidence1549_68_2  incidence1549_69_2 ;
output out= p5_option_2 p5= / autoname;
proc transpose data=p5_option_2 out=t_p5_option_2;
data f_p5_option_2; set t_p5_option_2; p5_incidence1549_2 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p95 p95 ;
var incidence1549_39 
incidence1549_40_2  incidence1549_41_2  incidence1549_42_2  incidence1549_43_2  incidence1549_44_2  incidence1549_45_2  incidence1549_46_2  incidence1549_47_2  
incidence1549_48_2  incidence1549_49_2  incidence1549_50_2  incidence1549_51_2  incidence1549_52_2  incidence1549_53_2  incidence1549_54_2  incidence1549_55_2  
incidence1549_56_2  incidence1549_57_2  incidence1549_58_2  incidence1549_59_2  incidence1549_60_2  incidence1549_61_2  incidence1549_62_2  incidence1549_63_2  
incidence1549_64_2  incidence1549_65_2  incidence1549_66_2  incidence1549_67_2  incidence1549_68_2  incidence1549_69_2 ;
output out= p95_option_2 p95= / autoname;
proc transpose data=p95_option_2 out=t_p95_option_2;
data f_p95_option_2; set t_p95_option_2; p95_incidence1549_2 = col1; 
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;


* differences compared with option 1 ;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_2_1  d_incidence1549_41_2_1  d_incidence1549_42_2_1  d_incidence1549_43_2_1  d_incidence1549_44_2_1  d_incidence1549_45_2_1  d_incidence1549_46_2_1  d_incidence1549_47_2_1  
d_incidence1549_48_2_1  d_incidence1549_49_2_1  d_incidence1549_50_2_1  d_incidence1549_51_2_1  d_incidence1549_52_2_1  d_incidence1549_53_2_1  d_incidence1549_54_2_1  d_incidence1549_55_2_1  
d_incidence1549_56_2_1  d_incidence1549_57_2_1  d_incidence1549_58_2_1  d_incidence1549_59_2_1  d_incidence1549_60_2_1  d_incidence1549_61_2_1  d_incidence1549_62_2_1  d_incidence1549_63_2_1  
d_incidence1549_64_2_1  d_incidence1549_65_2_1  d_incidence1549_66_2_1  d_incidence1549_67_2_1  d_incidence1549_68_2_1  d_incidence1549_69_2_1 ;
output out= median_d_option_2_1 median= / autoname;
proc transpose data=median_d_option_2_1 out=t_median_d_option_2_1;
data f_median_d_option_2_1; set t_median_d_option_2_1; median_d_incidence1549_2_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_2_1  d_incidence1549_41_2_1  d_incidence1549_42_2_1  d_incidence1549_43_2_1  d_incidence1549_44_2_1  d_incidence1549_45_2_1  d_incidence1549_46_2_1  d_incidence1549_47_2_1  
d_incidence1549_48_2_1  d_incidence1549_49_2_1  d_incidence1549_50_2_1  d_incidence1549_51_2_1  d_incidence1549_52_2_1  d_incidence1549_53_2_1  d_incidence1549_54_2_1  d_incidence1549_55_2_1  
d_incidence1549_56_2_1  d_incidence1549_57_2_1  d_incidence1549_58_2_1  d_incidence1549_59_2_1  d_incidence1549_60_2_1  d_incidence1549_61_2_1  d_incidence1549_62_2_1  d_incidence1549_63_2_1  
d_incidence1549_64_2_1  d_incidence1549_65_2_1  d_incidence1549_66_2_1  d_incidence1549_67_2_1  d_incidence1549_68_2_1  d_incidence1549_69_2_1 ;
output out= mean_d_option_2_1 mean= / autoname;
proc transpose data=mean_d_option_2_1 out=t_mean_d_option_2_1;
data f_mean_d_option_2_1; set t_mean_d_option_2_1; mean_d_incidence1549_2_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_2_1  d_incidence1549_41_2_1  d_incidence1549_42_2_1  d_incidence1549_43_2_1  d_incidence1549_44_2_1  d_incidence1549_45_2_1  d_incidence1549_46_2_1  d_incidence1549_47_2_1  
d_incidence1549_48_2_1  d_incidence1549_49_2_1  d_incidence1549_50_2_1  d_incidence1549_51_2_1  d_incidence1549_52_2_1  d_incidence1549_53_2_1  d_incidence1549_54_2_1  d_incidence1549_55_2_1  
d_incidence1549_56_2_1  d_incidence1549_57_2_1  d_incidence1549_58_2_1  d_incidence1549_59_2_1  d_incidence1549_60_2_1  d_incidence1549_61_2_1  d_incidence1549_62_2_1  d_incidence1549_63_2_1  
d_incidence1549_64_2_1  d_incidence1549_65_2_1  d_incidence1549_66_2_1  d_incidence1549_67_2_1  d_incidence1549_68_2_1  d_incidence1549_69_2_1 ;
output out= p5_d_option_2_1 p5= / autoname;
proc transpose data=p5_d_option_2_1 out=t_p5_d_option_2_1;
data f_p5_d_option_2_1; set t_p5_d_option_2_1; p5_d_incidence1549_2_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p95 p95 ;
var  
d_incidence1549_40_2_1  d_incidence1549_41_2_1  d_incidence1549_42_2_1  d_incidence1549_43_2_1  d_incidence1549_44_2_1  d_incidence1549_45_2_1  d_incidence1549_46_2_1  d_incidence1549_47_2_1  
d_incidence1549_48_2_1  d_incidence1549_49_2_1  d_incidence1549_50_2_1  d_incidence1549_51_2_1  d_incidence1549_52_2_1  d_incidence1549_53_2_1  d_incidence1549_54_2_1  d_incidence1549_55_2_1  
d_incidence1549_56_2_1  d_incidence1549_57_2_1  d_incidence1549_58_2_1  d_incidence1549_59_2_1  d_incidence1549_60_2_1  d_incidence1549_61_2_1  d_incidence1549_62_2_1  d_incidence1549_63_2_1  
d_incidence1549_64_2_1  d_incidence1549_65_2_1  d_incidence1549_66_2_1  d_incidence1549_67_2_1  d_incidence1549_68_2_1  d_incidence1549_69_2_1 ;
output out= p95_d_option_2_1 p95= / autoname;
proc transpose data=p95_d_option_2_1 out=t_p95_d_option_2_1;
data f_p95_d_option_2_1; set t_p95_d_option_2_1; p95_d_incidence1549_2_1 = col1; 
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;



/* OPTION 3 */

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_3  incidence1549_41_3  incidence1549_42_3  incidence1549_43_3  incidence1549_44_3  incidence1549_45_3  incidence1549_46_3  incidence1549_47_3  
incidence1549_48_3  incidence1549_49_3  incidence1549_50_3  incidence1549_51_3  incidence1549_52_3  incidence1549_53_3  incidence1549_54_3  incidence1549_55_3  
incidence1549_56_3  incidence1549_57_3  incidence1549_58_3  incidence1549_59_3  incidence1549_60_3  incidence1549_61_3  incidence1549_62_3  incidence1549_63_3  
incidence1549_64_3  incidence1549_65_3  incidence1549_66_3  incidence1549_67_3  incidence1549_68_3  incidence1549_69_3 ;
output out= median_option_3 median= / autoname;
proc transpose data=median_option_3 out=t_median_option_3;
data f_median_option_3; set t_median_option_3; median_incidence1549_3 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_3  incidence1549_41_3  incidence1549_42_3  incidence1549_43_3  incidence1549_44_3  incidence1549_45_3  incidence1549_46_3  incidence1549_47_3  
incidence1549_48_3  incidence1549_49_3  incidence1549_50_3  incidence1549_51_3  incidence1549_52_3  incidence1549_53_3  incidence1549_54_3  incidence1549_55_3  
incidence1549_56_3  incidence1549_57_3  incidence1549_58_3  incidence1549_59_3  incidence1549_60_3  incidence1549_61_3  incidence1549_62_3  incidence1549_63_3  
incidence1549_64_3  incidence1549_65_3  incidence1549_66_3  incidence1549_67_3  incidence1549_68_3  incidence1549_69_3 ;
output out= mean_option_3 mean= / autoname;
proc transpose data=mean_option_3 out=t_mean_option_3;
data f_mean_option_3; set t_mean_option_3; mean_incidence1549_3 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_3  incidence1549_41_3  incidence1549_42_3  incidence1549_43_3  incidence1549_44_3  incidence1549_45_3  incidence1549_46_3  incidence1549_47_3  
incidence1549_48_3  incidence1549_49_3  incidence1549_50_3  incidence1549_51_3  incidence1549_52_3  incidence1549_53_3  incidence1549_54_3  incidence1549_55_3  
incidence1549_56_3  incidence1549_57_3  incidence1549_58_3  incidence1549_59_3  incidence1549_60_3  incidence1549_61_3  incidence1549_62_3  incidence1549_63_3  
incidence1549_64_3  incidence1549_65_3  incidence1549_66_3  incidence1549_67_3  incidence1549_68_3  incidence1549_69_3 ;
output out= p5_option_3 p5= / autoname;
proc transpose data=p5_option_3 out=t_p5_option_3;
data f_p5_option_3; set t_p5_option_3; p5_incidence1549_3 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p95 p95 ;
var incidence1549_39 
incidence1549_40_3  incidence1549_41_3  incidence1549_42_3  incidence1549_43_3  incidence1549_44_3  incidence1549_45_3  incidence1549_46_3  incidence1549_47_3  
incidence1549_48_3  incidence1549_49_3  incidence1549_50_3  incidence1549_51_3  incidence1549_52_3  incidence1549_53_3  incidence1549_54_3  incidence1549_55_3  
incidence1549_56_3  incidence1549_57_3  incidence1549_58_3  incidence1549_59_3  incidence1549_60_3  incidence1549_61_3  incidence1549_62_3  incidence1549_63_3  
incidence1549_64_3  incidence1549_65_3  incidence1549_66_3  incidence1549_67_3  incidence1549_68_3  incidence1549_69_3 ;
output out= p95_option_3 p95= / autoname;
proc transpose data=p95_option_3 out=t_p95_option_3;
data f_p95_option_3; set t_p95_option_3; p95_incidence1549_3 = col1; 
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;


* differences compared with option 1 ;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_3_1  d_incidence1549_41_3_1  d_incidence1549_42_3_1  d_incidence1549_43_3_1  d_incidence1549_44_3_1  d_incidence1549_45_3_1  d_incidence1549_46_3_1  d_incidence1549_47_3_1  
d_incidence1549_48_3_1  d_incidence1549_49_3_1  d_incidence1549_50_3_1  d_incidence1549_51_3_1  d_incidence1549_52_3_1  d_incidence1549_53_3_1  d_incidence1549_54_3_1  d_incidence1549_55_3_1  
d_incidence1549_56_3_1  d_incidence1549_57_3_1  d_incidence1549_58_3_1  d_incidence1549_59_3_1  d_incidence1549_60_3_1  d_incidence1549_61_3_1  d_incidence1549_62_3_1  d_incidence1549_63_3_1  
d_incidence1549_64_3_1  d_incidence1549_65_3_1  d_incidence1549_66_3_1  d_incidence1549_67_3_1  d_incidence1549_68_3_1  d_incidence1549_69_3_1 ;
output out= median_d_option_3_1 median= / autoname;
proc transpose data=median_d_option_3_1 out=t_median_d_option_3_1;
data f_median_d_option_3_1; set t_median_d_option_3_1; median_d_incidence1549_3_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_3_1  d_incidence1549_41_3_1  d_incidence1549_42_3_1  d_incidence1549_43_3_1  d_incidence1549_44_3_1  d_incidence1549_45_3_1  d_incidence1549_46_3_1  d_incidence1549_47_3_1  
d_incidence1549_48_3_1  d_incidence1549_49_3_1  d_incidence1549_50_3_1  d_incidence1549_51_3_1  d_incidence1549_52_3_1  d_incidence1549_53_3_1  d_incidence1549_54_3_1  d_incidence1549_55_3_1  
d_incidence1549_56_3_1  d_incidence1549_57_3_1  d_incidence1549_58_3_1  d_incidence1549_59_3_1  d_incidence1549_60_3_1  d_incidence1549_61_3_1  d_incidence1549_62_3_1  d_incidence1549_63_3_1  
d_incidence1549_64_3_1  d_incidence1549_65_3_1  d_incidence1549_66_3_1  d_incidence1549_67_3_1  d_incidence1549_68_3_1  d_incidence1549_69_3_1 ;
output out= mean_d_option_3_1 mean= / autoname;
proc transpose data=mean_d_option_3_1 out=t_mean_d_option_3_1;
data f_mean_d_option_3_1; set t_mean_d_option_3_1; mean_d_incidence1549_3_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_3_1  d_incidence1549_41_3_1  d_incidence1549_42_3_1  d_incidence1549_43_3_1  d_incidence1549_44_3_1  d_incidence1549_45_3_1  d_incidence1549_46_3_1  d_incidence1549_47_3_1  
d_incidence1549_48_3_1  d_incidence1549_49_3_1  d_incidence1549_50_3_1  d_incidence1549_51_3_1  d_incidence1549_52_3_1  d_incidence1549_53_3_1  d_incidence1549_54_3_1  d_incidence1549_55_3_1  
d_incidence1549_56_3_1  d_incidence1549_57_3_1  d_incidence1549_58_3_1  d_incidence1549_59_3_1  d_incidence1549_60_3_1  d_incidence1549_61_3_1  d_incidence1549_62_3_1  d_incidence1549_63_3_1  
d_incidence1549_64_3_1  d_incidence1549_65_3_1  d_incidence1549_66_3_1  d_incidence1549_67_3_1  d_incidence1549_68_3_1  d_incidence1549_69_3_1 ;
output out= p5_d_option_3_1 p5= / autoname;
proc transpose data=p5_d_option_3_1 out=t_p5_d_option_3_1;
data f_p5_d_option_3_1; set t_p5_d_option_3_1; p5_d_incidence1549_3_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p95 p95 ;
var  
d_incidence1549_40_3_1  d_incidence1549_41_3_1  d_incidence1549_42_3_1  d_incidence1549_43_3_1  d_incidence1549_44_3_1  d_incidence1549_45_3_1  d_incidence1549_46_3_1  d_incidence1549_47_3_1  
d_incidence1549_48_3_1  d_incidence1549_49_3_1  d_incidence1549_50_3_1  d_incidence1549_51_3_1  d_incidence1549_52_3_1  d_incidence1549_53_3_1  d_incidence1549_54_3_1  d_incidence1549_55_3_1  
d_incidence1549_56_3_1  d_incidence1549_57_3_1  d_incidence1549_58_3_1  d_incidence1549_59_3_1  d_incidence1549_60_3_1  d_incidence1549_61_3_1  d_incidence1549_62_3_1  d_incidence1549_63_3_1  
d_incidence1549_64_3_1  d_incidence1549_65_3_1  d_incidence1549_66_3_1  d_incidence1549_67_3_1  d_incidence1549_68_3_1  d_incidence1549_69_3_1 ;
output out= p95_d_option_3_1 p95= / autoname;
proc transpose data=p95_d_option_3_1 out=t_p95_d_option_3_1;
data f_p95_d_option_3_1; set t_p95_d_option_3_1; p95_d_incidence1549_3_1 = col1; 
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;




/* OPTION 4 */

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_4  incidence1549_41_4  incidence1549_42_4  incidence1549_43_4  incidence1549_44_4  incidence1549_45_4  incidence1549_46_4  incidence1549_47_4  
incidence1549_48_4  incidence1549_49_4  incidence1549_50_4  incidence1549_51_4  incidence1549_52_4  incidence1549_53_4  incidence1549_54_4  incidence1549_55_4  
incidence1549_56_4  incidence1549_57_4  incidence1549_58_4  incidence1549_59_4  incidence1549_60_4  incidence1549_61_4  incidence1549_62_4  incidence1549_63_4  
incidence1549_64_4  incidence1549_65_4  incidence1549_66_4  incidence1549_67_4  incidence1549_68_4  incidence1549_69_4 ;
output out= median_option_4 median= / autoname;
proc transpose data=median_option_4 out=t_median_option_4;
data f_median_option_4; set t_median_option_4; median_incidence1549_4 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_4  incidence1549_41_4  incidence1549_42_4  incidence1549_43_4  incidence1549_44_4  incidence1549_45_4  incidence1549_46_4  incidence1549_47_4  
incidence1549_48_4  incidence1549_49_4  incidence1549_50_4  incidence1549_51_4  incidence1549_52_4  incidence1549_53_4  incidence1549_54_4  incidence1549_55_4  
incidence1549_56_4  incidence1549_57_4  incidence1549_58_4  incidence1549_59_4  incidence1549_60_4  incidence1549_61_4  incidence1549_62_4  incidence1549_63_4  
incidence1549_64_4  incidence1549_65_4  incidence1549_66_4  incidence1549_67_4  incidence1549_68_4  incidence1549_69_4 ;
output out= mean_option_4 mean= / autoname;
proc transpose data=mean_option_4 out=t_mean_option_4;
data f_mean_option_4; set t_mean_option_4; mean_incidence1549_4 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var incidence1549_39 
incidence1549_40_4  incidence1549_41_4  incidence1549_42_4  incidence1549_43_4  incidence1549_44_4  incidence1549_45_4  incidence1549_46_4  incidence1549_47_4  
incidence1549_48_4  incidence1549_49_4  incidence1549_50_4  incidence1549_51_4  incidence1549_52_4  incidence1549_53_4  incidence1549_54_4  incidence1549_55_4  
incidence1549_56_4  incidence1549_57_4  incidence1549_58_4  incidence1549_59_4  incidence1549_60_4  incidence1549_61_4  incidence1549_62_4  incidence1549_63_4  
incidence1549_64_4  incidence1549_65_4  incidence1549_66_4  incidence1549_67_4  incidence1549_68_4  incidence1549_69_4 ;
output out= p5_option_4 p5= / autoname;
proc transpose data=p5_option_4 out=t_p5_option_4;
data f_p5_option_4; set t_p5_option_4; p5_incidence1549_4 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p95 p95 ;
var incidence1549_39 
incidence1549_40_4  incidence1549_41_4  incidence1549_42_4  incidence1549_43_4  incidence1549_44_4  incidence1549_45_4  incidence1549_46_4  incidence1549_47_4  
incidence1549_48_4  incidence1549_49_4  incidence1549_50_4  incidence1549_51_4  incidence1549_52_4  incidence1549_53_4  incidence1549_54_4  incidence1549_55_4  
incidence1549_56_4  incidence1549_57_4  incidence1549_58_4  incidence1549_59_4  incidence1549_60_4  incidence1549_61_4  incidence1549_62_4  incidence1549_63_4  
incidence1549_64_4  incidence1549_65_4  incidence1549_66_4  incidence1549_67_4  incidence1549_68_4  incidence1549_69_4 ;
output out= p95_option_4 p95= / autoname;
proc transpose data=p95_option_4 out=t_p95_option_4;
data f_p95_option_4; set t_p95_option_4; p95_incidence1549_4 = col1; 
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;


* differences compared with option 1 ;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_4_1  d_incidence1549_41_4_1  d_incidence1549_42_4_1  d_incidence1549_43_4_1  d_incidence1549_44_4_1  d_incidence1549_45_4_1  d_incidence1549_46_4_1  d_incidence1549_47_4_1  
d_incidence1549_48_4_1  d_incidence1549_49_4_1  d_incidence1549_50_4_1  d_incidence1549_51_4_1  d_incidence1549_52_4_1  d_incidence1549_53_4_1  d_incidence1549_54_4_1  d_incidence1549_55_4_1  
d_incidence1549_56_4_1  d_incidence1549_57_4_1  d_incidence1549_58_4_1  d_incidence1549_59_4_1  d_incidence1549_60_4_1  d_incidence1549_61_4_1  d_incidence1549_62_4_1  d_incidence1549_63_4_1  
d_incidence1549_64_4_1  d_incidence1549_65_4_1  d_incidence1549_66_4_1  d_incidence1549_67_4_1  d_incidence1549_68_4_1  d_incidence1549_69_4_1 ;
output out= median_d_option_4_1 median= / autoname;
proc transpose data=median_d_option_4_1 out=t_median_d_option_4_1;
data f_median_d_option_4_1; set t_median_d_option_4_1; median_d_incidence1549_4_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_4_1  d_incidence1549_41_4_1  d_incidence1549_42_4_1  d_incidence1549_43_4_1  d_incidence1549_44_4_1  d_incidence1549_45_4_1  d_incidence1549_46_4_1  d_incidence1549_47_4_1  
d_incidence1549_48_4_1  d_incidence1549_49_4_1  d_incidence1549_50_4_1  d_incidence1549_51_4_1  d_incidence1549_52_4_1  d_incidence1549_53_4_1  d_incidence1549_54_4_1  d_incidence1549_55_4_1  
d_incidence1549_56_4_1  d_incidence1549_57_4_1  d_incidence1549_58_4_1  d_incidence1549_59_4_1  d_incidence1549_60_4_1  d_incidence1549_61_4_1  d_incidence1549_62_4_1  d_incidence1549_63_4_1  
d_incidence1549_64_4_1  d_incidence1549_65_4_1  d_incidence1549_66_4_1  d_incidence1549_67_4_1  d_incidence1549_68_4_1  d_incidence1549_69_4_1 ;
output out= mean_d_option_4_1 mean= / autoname;
proc transpose data=mean_d_option_4_1 out=t_mean_d_option_4_1;
data f_mean_d_option_4_1; set t_mean_d_option_4_1; mean_d_incidence1549_4_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p5 p95 ;
var 
d_incidence1549_40_4_1  d_incidence1549_41_4_1  d_incidence1549_42_4_1  d_incidence1549_43_4_1  d_incidence1549_44_4_1  d_incidence1549_45_4_1  d_incidence1549_46_4_1  d_incidence1549_47_4_1  
d_incidence1549_48_4_1  d_incidence1549_49_4_1  d_incidence1549_50_4_1  d_incidence1549_51_4_1  d_incidence1549_52_4_1  d_incidence1549_53_4_1  d_incidence1549_54_4_1  d_incidence1549_55_4_1  
d_incidence1549_56_4_1  d_incidence1549_57_4_1  d_incidence1549_58_4_1  d_incidence1549_59_4_1  d_incidence1549_60_4_1  d_incidence1549_61_4_1  d_incidence1549_62_4_1  d_incidence1549_63_4_1  
d_incidence1549_64_4_1  d_incidence1549_65_4_1  d_incidence1549_66_4_1  d_incidence1549_67_4_1  d_incidence1549_68_4_1  d_incidence1549_69_4_1 ;
output out= p5_d_option_4_1 p5= / autoname;
proc transpose data=p5_d_option_4_1 out=t_p5_d_option_4_1;
data f_p5_d_option_4_1; set t_p5_d_option_4_1; p5_d_incidence1549_4_1 = col1;
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;

proc means noprint   data = b.incidence1549  n mean  p50 p95 p95 ;
var 
d_incidence1549_40_4_1  d_incidence1549_41_4_1  d_incidence1549_42_4_1  d_incidence1549_43_4_1  d_incidence1549_44_4_1  d_incidence1549_45_4_1  d_incidence1549_46_4_1  d_incidence1549_47_4_1  
d_incidence1549_48_4_1  d_incidence1549_49_4_1  d_incidence1549_50_4_1  d_incidence1549_51_4_1  d_incidence1549_52_4_1  d_incidence1549_53_4_1  d_incidence1549_54_4_1  d_incidence1549_55_4_1  
d_incidence1549_56_4_1  d_incidence1549_57_4_1  d_incidence1549_58_4_1  d_incidence1549_59_4_1  d_incidence1549_60_4_1  d_incidence1549_61_4_1  d_incidence1549_62_4_1  d_incidence1549_63_4_1  
d_incidence1549_64_4_1  d_incidence1549_65_4_1  d_incidence1549_66_4_1  d_incidence1549_67_4_1  d_incidence1549_68_4_1  d_incidence1549_69_4_1 ;
output out= p95_d_option_4_1 p95= / autoname;
proc transpose data=p95_d_option_4_1 out=t_p95_d_option_4_1;
data f_p95_d_option_4_1; set t_p95_d_option_4_1; p95_d_incidence1549_4_1 = col1; 
if _NAME_ = '_TYPE_' then delete; if _NAME_ = '_FREQ_' then delete; drop _NAME_ col1;




data years;
input year;
cards;
2039
2040
2041
2042
2043
2044
2045
2046
2047
2048 
2049
2050
2051
2052
2053
2054
2055
2056
2057
2058 
2059
2060
2061
2062
2063
2064
2065
2066
2067
2068 
2069
;


data joint;
merge years 
f_median_option_1 f_mean_option_1 f_p5_option_1 f_p95_option_1 
f_median_option_2 f_mean_option_2 f_p5_option_2 f_p95_option_2 f_median_d_option_2_1 f_mean_d_option_2_1 f_p5_d_option_2_1 f_p95_d_option_2_1
f_median_option_3 f_mean_option_3 f_p5_option_3 f_p95_option_3 f_median_d_option_3_1 f_mean_d_option_3_1 f_p5_d_option_3_1 f_p95_d_option_3_1
f_median_option_4 f_mean_option_4 f_p5_option_4 f_p95_option_4 f_median_d_option_4_1 f_mean_d_option_4_1 f_p5_d_option_4_1 f_p95_d_option_4_1
;

if year=2039 then do;
mean_d_incidence1549_2_1=0; mean_d_incidence1549_3_1=0;mean_d_incidence1549_4_1=0;
median_d_incidence1549_2_1=0; median_d_incidence1549_3_1=0;median_d_incidence1549_4_1=0;
end;

mean_d_incidence1549_1_1=0;
median_d_incidence1549_1_1=0;



ods html;
proc sgplot data=joint ; 
Title    height=1.5 justify=center "Mean incidence1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2039 to 2069 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence'		labelattrs=(size=12)  values = (0 to  1.0       by 0.05    ) valueattrs=(size=10);

label mean_incidence1549_1 = "noVaccine";
label mean_incidence1549_2 = "withVaccine_highTPP";
label mean_incidence1549_3 = "withVaccine_moderateTPP";
label mean_incidence1549_4 = "withVaccine_lowTPP";

series  x=year y=mean_incidence1549_1 / lineattrs = (color=red thickness = 3);
band    x=year lower=p5_incidence1549_1 upper=p95_incidence1549_1 / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=year y=mean_incidence1549_2 / lineattrs = (color=lightgreen thickness = 3);
band    x=year lower=p5_incidence1549_2 upper=p95_incidence1549_2 / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=year y=mean_incidence1549_3 / lineattrs = (color=cyan thickness = 3);
band    x=year lower=p5_incidence1549_3 upper=p95_incidence1549_3 / transparency=0.9 fillattrs = (color=cyan) legendlabel= "90% range";

series  x=year y=mean_incidence1549_4 / lineattrs = (color=violet thickness = 3);
band    x=year lower=p5_incidence1549_4 upper=p95_incidence1549_4 / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;





ods html;
proc sgplot data=joint ; 
Title    height=1.5 justify=center "Median incidence1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2039 to 2069 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence'		labelattrs=(size=12)  values = (0 to  1.0       by 0.05    ) valueattrs=(size=10);

label median_incidence1549_1 = "noVaccine";
label median_incidence1549_2 = "withVaccine_highTPP";
label median_incidence1549_3 = "withVaccine_moderateTPP";
label median_incidence1549_4 = "withVaccine_lowTPP";

series  x=year y=median_incidence1549_1 / lineattrs = (color=red thickness = 3);
band    x=year lower=p5_incidence1549_1 upper=p95_incidence1549_1 / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=year y=median_incidence1549_2 / lineattrs = (color=lightgreen thickness = 3);
band    x=year lower=p5_incidence1549_2 upper=p95_incidence1549_2 / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=year y=median_incidence1549_3 / lineattrs = (color=cyan thickness = 3);
band    x=year lower=p5_incidence1549_3 upper=p95_incidence1549_3 / transparency=0.9 fillattrs = (color=cyan) legendlabel= "90% range";

series  x=year y=median_incidence1549_4 / lineattrs = (color=violet thickness = 3);
band    x=year lower=p5_incidence1549_4 upper=p95_incidence1549_4 / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;





ods html;
proc sgplot data=joint ; 
Title    height=1.5 justify=center "Mean difference in incidence1549 compared with no vaccine";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2039 to 2069 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Difference in incidence (per 100 person-years)'		labelattrs=(size=12)  values = (-1 to  +1       by 0.1    ) valueattrs=(size=10);

label mean_d_incidence1549_2_1 = "withVaccine_highTPP";
label mean_d_incidence1549_3_1 = "withVaccine_moderateTPP";
label mean_d_incidence1549_4_1 = "withVaccine_lowTPP";

series  x=year y=mean_d_incidence1549_2_1 / lineattrs = (color=lightgreen thickness = 3);
band    x=year lower=p5_d_incidence1549_2_1 upper=p95_d_incidence1549_2_1 / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=year y=mean_d_incidence1549_3_1 / lineattrs = (color=cyan thickness = 3);
band    x=year lower=p5_d_incidence1549_3_1 upper=p95_d_incidence1549_3_1 / transparency=0.9 fillattrs = (color=cyan) legendlabel= "90% range";

series  x=year y=mean_d_incidence1549_4_1 / lineattrs = (color=violet thickness = 3);
band    x=year lower=p5_d_incidence1549_4_1 upper=p95_d_incidence1549_4_1 / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

series  x=year y=median_d_incidence1549_1_1 / lineattrs = (color=black thickness = 1);

run;



ods html;
proc sgplot data=joint ; 
Title    height=1.5 justify=center "Median difference in incidence1549 compared with no vaccine";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2039 to 2069 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Difference in incidence (per 100 person-years)'		labelattrs=(size=12)  values = (-1 to  +1       by 0.1    ) valueattrs=(size=10);

label median_d_incidence1549_2_1 = "withVaccine_highTPP";
label median_d_incidence1549_3_1 = "withVaccine_moderateTPP";
label median_d_incidence1549_4_1 = "withVaccine_lowTPP";

series  x=year y=median_d_incidence1549_2_1 / lineattrs = (color=lightgreen thickness = 3);
band    x=year lower=p5_d_incidence1549_2_1 upper=p95_d_incidence1549_2_1 / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=year y=median_d_incidence1549_3_1 / lineattrs = (color=cyan thickness = 3);
band    x=year lower=p5_d_incidence1549_3_1 upper=p95_d_incidence1549_3_1 / transparency=0.9 fillattrs = (color=cyan) legendlabel= "90% range";

series  x=year y=median_d_incidence1549_4_1 / lineattrs = (color=violet thickness = 3);
band    x=year lower=p5_d_incidence1549_4_1 upper=p95_d_incidence1549_4_1 / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

series  x=year y=mean_d_incidence1549_1_1 / lineattrs = (color=black thickness = 1);

run;

ods html close;









ods html;
proc sgplot data=joint ; 
Title    height=1.5 justify=center "Incidence1549";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2039 to 2069 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Incidence'		labelattrs=(size=12)  values = (0 to  1.0       by 0.05    ) valueattrs=(size=10);

label median_incidence1549_1 = "noVaccine";
label median_incidence1549_2 = "withVaccine_highTPP";
label median_incidence1549_3 = "withVaccine_moderateTPP";
label median_incidence1549_4 = "withVaccine_lowTPP";

series  x=year y=median_incidence1549_1 / lineattrs = (color=red thickness = 3);
band    x=year lower=p5_incidence1549_1 upper=p95_incidence1549_1 / transparency=0.9 fillattrs = (color=red) legendlabel= "90% range";

series  x=year y=median_incidence1549_2 / lineattrs = (color=lightgreen thickness = 3);
band    x=year lower=p5_incidence1549_2 upper=p95_incidence1549_2 / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=year y=median_incidence1549_3 / lineattrs = (color=cyan thickness = 3);
band    x=year lower=p5_incidence1549_3 upper=p95_incidence1549_3 / transparency=0.9 fillattrs = (color=cyan) legendlabel= "90% range";

series  x=year y=median_incidence1549_4 / lineattrs = (color=violet thickness = 3);
band    x=year lower=p5_incidence1549_4 upper=p95_incidence1549_4 / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

run;




ods html;
proc sgplot data=joint ; 
Title    height=1.5 justify=center "Difference in incidence1549 compared with no vaccine";
xaxis label			= 'Year'		labelattrs=(size=12)  values = (2039 to 2069 by 1)	 	 valueattrs=(size=10); 
yaxis grid label	= 'Difference in incidence (per 100 person-years)'		labelattrs=(size=12)  values = (-0.5 to  +0.5       by 0.1    ) valueattrs=(size=10);

label median_d_incidence1549_1_1 = "";
label median_d_incidence1549_2_1 = "withVaccine_highTPP";
label median_d_incidence1549_3_1 = "withVaccine_moderateTPP";
label median_d_incidence1549_4_1 = "withVaccine_lowTPP";

series  x=year y=median_d_incidence1549_2_1 / lineattrs = (color=lightgreen thickness = 3);
band    x=year lower=p5_d_incidence1549_2_1 upper=p95_d_incidence1549_2_1 / transparency=0.9 fillattrs = (color=lightgreen) legendlabel= "90% range";

series  x=year y=median_d_incidence1549_3_1 / lineattrs = (color=cyan thickness = 3);
band    x=year lower=p5_d_incidence1549_3_1 upper=p95_d_incidence1549_3_1 / transparency=0.9 fillattrs = (color=cyan) legendlabel= "90% range";

series  x=year y=median_d_incidence1549_4_1 / lineattrs = (color=violet thickness = 3);
band    x=year lower=p5_d_incidence1549_4_1 upper=p95_d_incidence1549_4_1 / transparency=0.9 fillattrs = (color=violet) legendlabel= "90% range";

series  x=year y=median_d_incidence1549_1_1 / lineattrs = (color=black thickness = 1);

run;


ods html close;


