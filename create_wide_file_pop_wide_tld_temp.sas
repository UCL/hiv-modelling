
* options user="/folders/myfolders/";

 proc printto ; *  log="C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\log1";


libname a "C:\Users\w3sth\TLO_HMC Dropbox\Andrew Phillips\hiv synthesis ssa unified program\output files\lapr\";



data y; set a.l_pop_wide_tld11_with_lost;  


  options nomprint;
  option nospool;

***Macro var used to calcuate cumulative means across specified periods and transpose to one line per run;
* user to decide what years and year ranges to include ;

%macro var(v=);

* &v ;

data e; set y; keep &v run cald option ;

proc means  noprint data=e; var &v; output out=y_22 mean= &v._22; by run ; where 2021.5 <= cald < 2022.5; 

proc means noprint data=e; var &v; output out=y_20y mean= &v._20y; by run option ; where 2022.5 <= cald < 2042.50;   

proc means noprint data=e; var &v; output out=y_50y mean= &v._50y; by run option ; where 2022.5 <= cald < 2072.50;
/*
proc means noprint data=e; var &v; output out=y_32 mean= &v._32; by run option ; where 2031.5 <= cald < 2032.50;
*/
proc means noprint data=e; var &v; output out=y_42 mean= &v._42; by run option ; where 2039.5 <= cald < 2044.50;
																				   
proc sort data=y_50y    ; by run; proc transpose data=y_50y     out=t_50y     prefix=&v._50y_  ; var &v._50y    ; by run; 																														
proc sort data=y_20y    ; by run; proc transpose data=y_20y     out=t_20y     prefix=&v._20y_  ; var &v._20y    ; by run; 																														
/* proc sort data=y_32; by run; proc transpose data=y_32 out=t_32 prefix=&v._32_; var &v._32; by run; */																														
proc sort data=y_42; by run; proc transpose data=y_42 out=t_42 prefix=&v._42_; var &v._42; by run; 																														


data &v ; merge y_22 t_20y /* t_32 */ t_42 t_50y ;  
drop _NAME_ _TYPE_ _FREQ_;

%mend var; 

%var(v=s_alive); %var(v=p_w_giv_birth_this_per); %var(v=p_newp_ge1); %var(v=p_newp_ge5);   %var(v=gender_r_newp); 
%var(v=p_newp_sw); %var(v=prop_sw_newp0);  %var(v=p_newp_prep);
%var(v=n_tested_m);
%var(v=p_tested_past_year_1549m)  ; %var(v=p_tested_past_year_1549w)  ;
%var(v=p_mcirc) ; * %var(v=p_mcirc_1519m); * %var(v=p_mcirc_2024m);* %var(v=p_mcirc_2529m);
* %var(v=p_mcirc_3034m);* %var(v=p_mcirc_3539m);* %var(v=p_mcirc_4044m);* %var(v=p_mcirc_4549m); 
* %var(v=p_mcirc_5064m); * %var(v=p_mcirc_1549m);
* %var(v=p_vmmc); * %var(v=p_vmmc_1519m); * %var(v=p_vmmc_2024m);* %var(v=p_vmmc_2529m); * %var(v=p_vmmc_3039m);*  %var(v=p_vmmc_4049m);
* %var(v=p_vmmc_5064m); *  %var(v=p_vmmc_1549m);
%var(v=prop_w_1549_sw); %var(v=prop_w_1564_sw); %var(v=prop_w_ever_sw); %var(v=prop_sw_hiv); %var(v=prop_sw_program_visit); 
%var(v=prop_w_1524_onprep); %var(v=prop_1564_onprep);
%var(v=prop_sw_onprep); %var(v=prevalence1549m); %var(v=prevalence1549w); %var(v=prevalence1549); 
* %var(v=prevalence1519w); * %var(v=prevalence1519m); * %var(v=prevalence2024w); * %var(v=prevalence2024m); * %var(v=prevalence2529w);  	  
* %var(v=prevalence2529m); * %var(v=prevalence3034w);*  %var(v=prevalence3034m);* %var(v=prevalence3539w); * %var(v=prevalence3539m);  	  
* %var(v=prevalence4044w); *  %var(v=prevalence4044m); *  %var(v=prevalence4549w); *  %var(v=prevalence4549m);  
%var(v=prevalence_vg1000); %var(v=incidence1549);  %var(v=incidence1564);  %var(v=n_infection);  %var(v=incidence_onprep);
%var(v=prevalence1524w); *  %var(v=prevalence1524m); %var(v=prevalence_sw);
* %var(v=prevalence5054w); * %var(v=prevalence5054m); * %var(v=prevalence5559w); * %var(v=prevalence5559m); * %var(v=prevalence6064w); * %var(v=prevalence6064m); 
* %var(v=prevalence65plw); * %var(v=prevalence65plm); * %var(v=r_prev_sex_1549); * %var(v=prevalence_hiv_preg);
* %var(v=r_prev_1519w_4549w );  * %var(v=r_prev_2024w_4549w  );  * %var(v=r_prev_2529w_4549w );  * %var(v=r_prev_3034w_4549w  ); 
* %var(v=r_prev_3539w_4549w );  * %var(v=r_prev_4044w_4549w  );  * %var(v=r_prev_5054w_4549w );  * %var(v=r_prev_5559w_4549w );
* %var(v=r_prev_6064w_4549w );  * %var(v=r_prev_65plw_4549w  );  * %var(v=r_prev_1519m_4549w );  * %var(v=r_prev_2024m_4549w  );  * %var(v=r_prev_2529m_4549w );
* %var(v=r_prev_3034m_4549w );  * %var(v=r_prev_3539m_4549w  );  * %var(v=r_prev_4044m_4549w );  * %var(v=r_prev_4549m_4549w  );  * %var(v=r_prev_5054m_4549w );
* %var(v=r_prev_5559m_4549w );  * %var(v=r_prev_6064m_4549w );  * %var(v=r_prev_65plm_4549w );
%var(v=incidence1549w);  %var(v=incidence1549m);  %var(v=incidence_sw); 
%var(v=p_inf_vlsupp);  %var(v=p_inf_newp);  %var(v=p_inf_ep);  %var(v=p_inf_diag);  %var(v=p_inf_naive);   %var(v=p_inf_primary); 
%var(v=mtct_prop); %var(v=p_diag); %var(v=p_diag_m); %var(v=p_diag_w); %var(v=p_diag_sw);
* %var(v=p_diag_m1524); * %var(v=p_diag_w1524);
%var(v=p_ai_no_arv_c_nnm); %var(v=p_ai_no_arv_c_pim); %var(v=p_ai_no_arv_c_rt184m); %var(v=p_ai_no_arv_c_rt65m); %var(v=p_ai_no_arv_c_rttams); 
%var(v=p_ai_no_arv_e_inm); 
%var(v=p_artexp_diag); %var(v=p_onart_diag); %var(v=p_onart_diag_w); %var(v=p_onart_diag_m); %var(v=p_onart_diag_sw); %var(v=p_efa); %var(v=p_taz);
%var(v=p_ten); %var(v=p_zdv); %var(v=p_dol); %var(v=p_3tc); %var(v=p_lpr); %var(v=p_nev); %var(v=p_onart_vl1000);  %var(v=p_artexp_vl1000);
%var(v=p_vl1000); %var(v=p_vg1000); %var(v=p_vl1000_m);  %var(v=p_vl1000_w);  %var(v=p_vl1000_m_1524);  %var(v=p_vl1000_w_1524);  
%var(v=p_vl1000_art_12m); %var(v=p_vl1000_art_12m_onart); 
* %var(v=p_onart_m); * %var(v=p_onart_w); 
%var(v=p_onart_vl1000_w); %var(v=p_onart_vl1000_m); * %var(v= p_onart_vl1000_1524); * %var(v=p_onart_vl1000_sw);
* %var(v=prev_vg1000_newp_m); * %var(v=prev_vg1000_newp_w);  %var(v= p_startedline2) ;
* %var(v=p_tle);  * %var(v=p_tld);  * %var(v=p_zld);  * %var(v=p_zla);  * %var(v=p_otherreg);  * %var(v=p_drug_level_test); %var(v=p_linefail_ge1);
* %var(v=aids_death_rate);    %var(v=death_rate_onart);     %var(v=dcost);    %var(v= dart_cost_y);
  %var(v=dadc_cost);     %var(v=dcd4_cost);     %var(v=dvl_cost);     %var(v=dvis_cost);      %var(v=dcot_cost);     %var(v=dtb_cost);   
  %var(v=dres_cost);    %var(v=dtest_cost);     %var(v=d_t_adh_int_cost);     %var(v=dswitchline_cost);    %var(v=dtaz_cost);     %var(v=dcost_drug_level_test);
  %var(v=dclin_cost );  %var(v=dnon_tb_who3_cost); 
  %var(v=dcost_circ );    %var(v=dcost_condom_dn);
   %var(v=dcost_prep_oral);   %var(v=dcost_prep_inj);
 %var(v=dcost_prep_visit );   %var(v=dcost_prep_visit_oral );   %var(v=dcost_prep_visit_inj );     %var(v=dcost_prep );   * %var(v=dcost_drug_level_test ); 
  %var(v=dcost_clin_care );    %var(v=dcost_non_aids_pre_death );    %var(v=dcost_child_hiv );    %var(v=dzdv_cost );     %var(v=dten_cost );     %var(v=d3tc_cost );   
  %var(v=dnev_cost );     %var(v=dlpr_cost );     %var(v=ddar_cost );     %var(v=dtaz_cost );      %var(v=defa_cost );     %var(v=ddol_cost );
%var(v=m15r);  %var(v=m25r);  %var(v=m35r);  %var(v=m45r);  %var(v=m55r);  %var(v=w15r);  %var(v=w25r);  %var(v=w35r);  %var(v=w45r);  %var(v=w55r)
* %var(v=r_efa_hiv); * %var(v=p_onart_cd4_l200);
* %var(v=p_dol_2vg1000_dolr1_adh0); * %var(v=p_dol_2vg1000_dolr1_adh1); * %var(v=p_dol_2vg1000_dolr0_adh0); * %var(v=p_dol_2vg1000_dolr0_adh1);
%var(v=p_onart_cd4_l500);  %var(v=prop_art_or_prep);  * %var(v=n_sw_1564); * %var(v=n_sw_1549);   %var(v=prop_sw_onprep);   %var(v=p_onart);
* %var(v=p_o_zdv_tox);   * %var(v=p_o_3tc_tox);   * %var(v=p_o_ten_tox);   * %var(v=p_o_taz_tox);   * %var(v=p_o_lpr_tox);   * %var(v=p_o_efa_tox);   
* %var(v=p_o_nev_tox);  * %var(v=p_o_dol_tox);   * %var(v=p_o_zdv_adh_hi);   * %var(v=p_o_3tc_adh_hi);   * %var(v=p_o_ten_adh_hi);  
* %var(v=p_o_taz_adh_hi);   * %var(v=p_o_lpr_adh_hi);   * %var(v=p_o_efa_adh_hi);   * %var(v=p_o_nev_adh_hi);   * %var(v=p_o_dol_adh_hi);  
* %var(v= p_o_tle_tox);   * %var(v=p_o_tld_tox);   * %var(v=p_o_zla_tox);   * %var(v=p_o_zld_tox);    * %var(v=p_o_tle_adh_hi);   * %var(v=p_o_tld_adh_hi);   
* %var(v=p_o_zla_adh_hi);   * %var(v=p_o_zld_adh_hi);   * %var(v=p_adh_hi);    * %var(v=s_a_zld_if_reg_op_116);
* %var(v=p_nactive_ge2p75_xyz);  * %var(v=p_adh_hi_xyz_ot1);   * %var(v=p_adh_hi_xyz_ot2);   * %var(v=p_adh_hi_xyz_itt);   * %var(v=p_e_rt65m_xyz);   
%var(v=p_nactive_ge2p00_xyz);   %var(v=p_nactive_ge1p50_xyz); 
* %var(v=p_184m_ontle_vlg1000);  * %var(v=p_65m_ontle_vlg1000);  * %var(v=p_nnm_ontle_vlg1000);   * %var(v=p_184m_ontld_vlg1000);   * %var(v=p_65m_ontld_vlg1000);  
* %var(v=p_nnm_ontld_vlg1000);   * %var(v=p_inm_ontld_vlg1000);   * %var(v=p_inm_ontld_vlg1000);   
* %var(v=p_tams_ontle_vlg1000);  * %var(v=p_tams_ontld_vlg1000);    %var(v=p_k65m);   %var(v=p_m184m);
%var(v=death_rate_hiv); %var(v=death_rate_hiv_m); %var(v=death_rate_hiv_w);
%var(v=death_rate_hiv_all);%var(v=death_rate_hiv_all_m);%var(v=death_rate_hiv_all_w);
%var(v=p_iime); %var(v=n_infected_inm); * %var(v=p_pime); * %var(v=p_nnme);   *  %var(v=n_pregnant_ntd); *  %var(v=n_preg_odabe);
  %var(v=n_birth_with_inf_child);  %var(v=n_tested); %var(v=n_tested_sw); %var(v=test_prop_positive);
%var(v=p_vlg1000_onart_65m);   %var(v=p_vlg1000_onart_184m);   %var(v=p_elig_prep); %var(v=prop_elig_on_prep);   * %var(v= n_hiv1_prep);
* %var(v= n_hiv1_prep_inj); * %var(v= n_hiv1_prep_oral);
  %var(v= n_prep_any); * %var(v=n_covid); * %var(v=n_death_covid);  * %var(v=n_death);   %var(v=n_death_hiv);   %var(v= n_hiv);
%var(v=p_prep_any_ever); %var(v=p_hiv1_prep);  %var(v=incidence1524w);   * %var(v=incidence1524m) ;
* %var(v=incidence2534w);   * %var(v=incidence2534m) ; * %var(v=incidence3544w);   * %var(v=incidence3544m) ;* %var(v=incidence4554w);   * %var(v=incidence4554m) ;
* %var(v=incidence5564w);   * %var(v=incidence5564m) ;  %var(v=incidence_sw);  * %var (v=n_mcirc1549_3m) ;* %var (v=n_vmmc1549_3m); 
* %var(v=n_new_inf1549m); * %var(v=n_new_inf1549w); * %var(v=n_new_inf1549);* %var(v=t_sw_newp) ;
* %var(v=p_hypert_1549); * %var(v=p_hypert_5059); * %var(v=p_hypert_6069); * %var(v=p_hypert_7079); * %var(v=p_hypert_ge80);
* %var(v=p_diagnosed_hypert_1549); * %var(v=p_diagnosed_hypert_5059); * %var(v=p_diagnosed_hypert_6069); * %var(v=p_diagnosed_hypert_7079); 
* %var(v=p_diagnosed_hypert_ge80);  * %var(v=p_on_anti_hypert_1549); * %var(v=p_on_anti_hypert_5059); * %var(v=p_on_anti_hypert_6069); 
* %var(v=p_on_anti_hypert_7079); * %var(v=p_on_anti_hypert_ge80); 
* %var(v=p_hypert180_1549);  * %var(v=p_hypert180_5059);  * %var(v=p_hypert180_6069);  * %var(v=p_hypert180_7079);  * %var(v=p_hypert180_ge80); 
* %var(v=p_on1drug_antihyp_1549);   * %var(v=p_on2drug_antihyp_1549);   * %var(v=p_on3drug_antihyp_1549);    * %var(v=p_on1drug_antihyp_5059);   
* %var(v=p_on2drug_antihyp_5059); 
* %var(v=p_on3drug_antihyp_5059);    * %var(v=p_on1drug_antihyp_6069);    * %var(v=p_on2drug_antihyp_6069);    * %var(v=p_on3drug_antihyp_6069);   
* %var(v=p_on1drug_antihyp_7079);    * %var(v=p_on2drug_antihyp_7079); 
* %var(v=p_on3drug_antihyp_7079);    * %var(v=p_on1drug_antihyp_ge80);    * %var(v=p_on2drug_antihyp_ge80);    * %var(v=p_on3drug_antihyp_ge80); 
* %var(v=p_ahd_re_enter_care_100);   * %var(v=p_ahd_re_enter_care_200); 
* %var(v=p_hypert_1549m);  * %var(v=p_hypert_5059m); * %var(v=p_hypert_6069m);  * %var(v=p_hypert_7079m);  * %var(v=p_hypert_ge80m);  
* %var(v=p_diagnosed_hypert_1549m); 
* %var(v=p_diagnosed_hypert_5059m);  * %var(v=p_diagnosed_hypert_6069m);  * %var(v=p_diagnosed_hypert_7079m);  * %var(v=p_diagnosed_hypert_ge80m);  
* %var(v=p_on_anti_hypert_1549m); * %var(v=p_on_anti_hypert_5059m);  * %var(v=p_on_anti_hypert_6069m);  * %var(v=p_on_anti_hypert_7079m);  
* %var(v=p_on_anti_hypert_ge80m);
* %var(v=p_hypert_1549w);  * %var(v=p_hypert_5059w); * %var(v=p_hypert_6069w);  * %var(v=p_hypert_7079w);  * %var(v=p_hypert_ge80w);  
* %var(v=p_diagnosed_hypert_1549w); 
* %var(v=p_diagnosed_hypert_5059w);  * %var(v=p_diagnosed_hypert_6069w);  * %var(v=p_diagnosed_hypert_7079w);  * %var(v=p_diagnosed_hypert_ge80w);  
* %var(v=p_on_anti_hypert_1549w); * %var(v=p_on_anti_hypert_5059w);  * %var(v=p_on_anti_hypert_6069w);  * %var(v=p_on_anti_hypert_7079w);  
* %var(v=p_on_anti_hypert_ge80w);
* %var(v=n_dead_hivpos_cause1 ); %var(v=rate_dead_hivpos_cause1); * %var(v=n_dead_hivpos_tb ); * %var(v=rate_dead_hivpos_tb); * %var(v=n_dead_hivpos_cause4 ); 
* %var(v=rate_dead_hivpos_cause4 );* %var(v=n_dead_hivpos_crypm ); * %var(v=rate_dead_hivpos_crypm); * %var(v=n_dead_hivpos_sbi ); * %var(v=rate_dead_hivpos_sbi);
* %var(v=n_dead_hivpos_oth_adc ); * %var(v=rate_dead_hivpos_oth_adc );* %var(v=n_dead_hivpos_cause2 ); * %var(v=rate_dead_hivpos_cause2 );
* %var(v=n_dead_hivpos_cause3 ); * %var(v=rate_dead_hivpos_cause3 );	* %var(v=n_dead_hivpos_cvd ); * %var(v=rate_dead_hivpos_cvd );
* %var(v=n_dead_cvd ); * %var(v=rate_dead_cvd );	* %var(v=n_dead_tb ); * %var(v=rate_dead_tb ); * %var(v=n_dead_hivneg_cvd ); * %var(v=rate_dead_hivneg_cvd);
* %var(v=n_dead_hivneg_tb ); * %var(v=rate_dead_hivneg_tb); * %var(v=n_dead_hivneg_cause2); * %var(v=rate_dead_hivneg_cause2 ); * %var(v=n_dead_hivneg_cause3 ); 
* %var(v=rate_dead_hivneg_cause3 );	* %var(v=n_dead_hivneg_cause4 ); * %var(v=rate_dead_hivneg_cause4 ); * %var(v=n_dead_hivneg_cause5 ); 
* %var(v=n_cd4_lt50); * %var(v=n_cd4_lt200);
* %var(v=rate_dead_hivneg_cause5 );  * %var(v=rate_dead_allage); * %var(v=rate_dead_hivneg_anycause); * %var(v=rate_dead_hivpos_anycause); 
* %var(v=rate_dead_cvd_3039m);	* %var(v=rate_dead_cvd_4049m); * %var(v=rate_dead_cvd_5059m); * %var(v=rate_dead_cvd_6069m); * %var(v=rate_dead_cvd_7079m); 
* %var(v=rate_dead_cvd_ge80m); * %var(v=rate_dead_cvd_3039w); 
* %var(v=rate_dead_cvd_4049w); * %var(v=rate_dead_cvd_5059w); * %var(v=rate_dead_cvd_6069w); * %var(v=rate_dead_cvd_7079w); * %var(v=rate_dead_cvd_ge80w); 
* %var(v=n_death_hivpos_anycause); * %var(v= n_death_2059_m);  * %var(v=n_death_2059_w);
* %var(v=p_age1549_hivneg );  * %var(v=p_age1549_hiv ); * %var(v=p_onart_m_age50pl ); * %var(v=p_onart_w_age50pl ); * %var(v=n_onart);
* %var(v=prevalence_hiv_preg); %var(v=p_onart_w); %var(v=p_onart_m); * %var(v=n_onart_w); * %var(v=n_onart_m);  %var(v=p_diag_w); %var(v=p_diag_m); 
%var(v=p_onart_vl1000);  * %var(v=n_new_inf1549m); * %var(v=n_new_inf1549w); 
%var(v=n_tested_w); %var(v=test_prop_positive);
%var(v=prop_prep_inj);   %var(v=ratio_inj_prep_on_tail);    %var(v=pr_ever_prep_inj_res_cab);    %var(v=pr_ev_prep_inj_res_cab_hiv);
%var(v=prop_cab_res_o_cab);    %var(v=prop_cab_res_tail);      %var(v=prop_prep_inj_at_inf_diag);   
%var(v=of_all_o_cab_prop_dur_3m);
%var(v=of_all_o_cab_prop_dur_6m);   %var(v=p_prep_inj_hiv);  %var(v=prop_cab_dol_res_attr_cab);   %var(v=n_cur_res_cab);  %var(v=n_cur_res_dol);  
%var(v=n_emerge_inm_res_cab);  %var(v=n_switch_prep_from_oral); %var(v=n_switch_prep_from_inj);  %var(v=n_switch_prep_to_oral);  
%var(v=n_switch_prep_to_inj);  %var(v=n_prep_any_start); %var(v=n_prep_oral_start);  %var(v=n_prep_inj_start); %var(v=n_prep_vr_start);
%var(v=n_prep_any); %var(v=prop_elig_on_prep); %var(v=p_elig_prep);  %var(v=p_hiv1_prep);  %var(v=prop_onprep_newpge1); %var(v=p_prep_elig_past_year); 
%var(v=p_prep_newp); %var(v=prop_sw_onprep);  %var(v=p_em_inm_res_ever_prep_inj);  %var(v=p_cabr_start_rest_prep_inj);
%var(v=n_o_cab_at_3m);    %var(v=n_o_cab_at_6m);    %var(v=n_o_cab_at_9m);   %var(v=n_o_cab_at_ge12m); 
%var(v=ddaly); %var(v=p_emerge_inm_res_cab);  %var(v=p_emerge_inm_res_cab_tail); %var(v=ddaly_ac_ntd_mtct);
%var(v=of_all_o_cab_prop_dur_9m); %var(v=of_all_o_cab_prop_dur_ge12m);
%var(v=s_em_inm_res_o_cab_off_3m);  %var(v=s_o_cab_or_o_cab_tm1_no_r);   %var(v=s_emerge_inm_res_cab_tail);   %var(v=s_cur_in_prep_inj_tail_no_r);
%var(v=p_emerge_inm_res_cab); %var(v=p_emerge_inm_res_cab_tail);
%var(v=p_prep_init_primary_res); %var(v=p_prep_reinit_primary_res);   %var(v=p_emerge_inm_res_cab_prim);  %var(v=n_prep_primary_prevented);   
%var(v=p_prep_primary_prevented); %var(v=p_u_vfail1_this_period); 
%var(v=n_art_initiation);  %var(v=n_restart);     %var(v=n_line1_fail_this_period);    %var(v=n_need_cd4m);
%var(v=p_elig_all_prep_criteria);  %var(v=p_elig_all_prep_cri_hivneg);  %var(v=p_elig_hivneg_onprep);  %var(v=p_prep_elig_onprep_inj);
%var(v=prop_1564_hivneg_onprep); %var(v=prop_hivneg_onprep); %var(v=pref_prep_oral_beta_s1);
%var(v=n_started_prep_inj_hiv); %var(v=n_started_prep_any_hiv);   %var(v=p_pop_wide_tld_hiv);   %var(v=p_pop_wide_tld_prep_elig);   
%var(v=p_pop_wide_tld_neg_prep_inelig); %var(v=n_pop_wide_tld_hiv);   %var(v=n_pop_wide_tld_prep_elig);   %var(v=n_pop_wide_tld_neg_prep_inelig); 
%var(v=prop_prep_tot5yrs); %var(v=n_start_rest_prep_inj_hiv); %var(v=n_prep_inj);%var(v=p_prep_adhg80);

data   a.wide_outputs_x; merge 
s_alive p_w_giv_birth_this_per p_newp_ge1 p_newp_ge5   gender_r_newp p_newp_sw prop_sw_newp0  p_newp_prep  dcost  dart_cost_y
dcost_prep_visit dres_cost     dtest_cost    d_t_adh_int_cost    dswitchline_cost   dtaz_cost   dclin_cost  dcost_circ dcost_condom_dn 
dcost_prep_visit_oral dcost_prep_visit_inj   dcost_prep  dcost_clin_care  dcost_non_aids_pre_death  dcost_child_hiv  dnon_tb_who3_cost
dadc_cost       dcd4_cost       dvl_cost       dvis_cost        dcot_cost       dtb_cost    n_hiv
n_tested_m p_tested_past_year_1549m   p_tested_past_year_1549w  p_mcirc  prop_w_1549_sw prop_w_1564_sw prop_w_ever_sw prop_sw_hiv 
prop_sw_program_visit prop_w_1524_onprep prop_1564_onprep prop_sw_onprep prevalence1549m prevalence1549w prevalence1549 
prevalence_vg1000 incidence1549  incidence1564  prevalence1524w prevalence_sw incidence1549w  incidence1549m  incidence_sw incidence_onprep
p_inf_vlsupp  p_inf_newp  p_inf_ep  p_inf_diag  p_inf_naive   p_inf_primary mtct_prop p_diag p_diag_m p_diag_w p_diag_sw
p_ai_no_arv_c_nnm p_ai_no_arv_c_pim p_ai_no_arv_c_rt184m p_ai_no_arv_c_rt65m p_ai_no_arv_c_rttams  p_k65m  p_m184m
p_ai_no_arv_e_inm p_artexp_diag p_onart_diag p_onart_diag_w p_onart_diag_m p_onart_diag_sw p_efa p_taz
p_ten p_zdv p_dol p_3tc p_lpr p_nev p_onart_vl1000  p_artexp_vl1000 p_vl1000 p_vg1000 p_vl1000_m  p_vl1000_w  p_vl1000_m_1524  p_vl1000_w_1524  
p_vl1000_art_12m p_vl1000_art_12m_onart  p_onart_vl1000_w p_onart_vl1000_m  p_startedline2 p_linefail_ge1 m15r  m25r  m35r  m45r  m55r  w15r  
w25r  w35r  w45r  w55r p_onart_cd4_l500  prop_art_or_prep  prop_sw_onprep   p_onart p_nactive_ge2p00_xyz   p_nactive_ge1p50_xyz death_rate_hiv 
death_rate_hiv_m death_rate_hiv_w death_rate_hiv_all death_rate_hiv_all_m death_rate_hiv_all_w p_iime n_infected_inm 
n_tested n_tested_sw test_prop_positive p_vlg1000_onart_65m   p_vlg1000_onart_184m   p_elig_prep prop_elig_on_prep  
p_prep_any_ever p_hiv1_prep  incidence1524w  incidence_sw p_onart_w p_onart_m  p_diag_w p_diag_m p_onart_vl1000 n_tested_w test_prop_positive
prop_prep_inj   ratio_inj_prep_on_tail    pr_ever_prep_inj_res_cab    pr_ev_prep_inj_res_cab_hiv prop_cab_res_o_cab    prop_cab_res_tail    
prop_prep_inj_at_inf_diag   of_all_o_cab_prop_dur_3m of_all_o_cab_prop_dur_6m   p_prep_inj_hiv  prop_cab_dol_res_attr_cab   
n_cur_res_cab  n_cur_res_dol  n_emerge_inm_res_cab  n_switch_prep_from_oral n_switch_prep_from_inj  n_switch_prep_to_oral  n_switch_prep_to_inj  
n_prep_any_start n_prep_oral_start  n_prep_inj_start n_prep_vr_start n_prep_any prop_elig_on_prep p_elig_prep  p_hiv1_prep  prop_onprep_newpge1 
p_prep_elig_past_year p_prep_newp prop_sw_onprep  p_em_inm_res_ever_prep_inj n_o_cab_at_3m    n_o_cab_at_6m    n_o_cab_at_9m   n_o_cab_at_ge12m 
ddaly  p_emerge_inm_res_cab  p_emerge_inm_res_cab_tail of_all_o_cab_prop_dur_9m of_all_o_cab_prop_dur_ge12m
s_em_inm_res_o_cab_off_3m  s_o_cab_or_o_cab_tm1_no_r   s_emerge_inm_res_cab_tail   s_cur_in_prep_inj_tail_no_r  p_emerge_inm_res_cab 
p_cabr_start_rest_prep_inj p_emerge_inm_res_cab_tail  n_death_hiv death_rate_onart n_birth_with_inf_child  p_u_vfail1_this_period n_infection
p_prep_init_primary_res  p_prep_reinit_primary_res  p_emerge_inm_res_cab_prim  n_prep_primary_prevented  p_prep_primary_prevented ddaly_ac_ntd_mtct
dcost_prep  n_art_initiation  n_restart  dcost_prep_oral  dcost_prep_inj  n_line1_fail_this_period  n_need_cd4m
p_elig_all_prep_criteria  p_elig_all_prep_cri_hivneg  p_elig_hivneg_onprep  p_prep_elig_onprep_inj prop_1564_hivneg_onprep prop_hivneg_onprep
pref_prep_oral_beta_s1 n_started_prep_inj_hiv n_started_prep_any_hiv  p_pop_wide_tld_hiv  p_pop_wide_tld_prep_elig  p_pop_wide_tld_neg_prep_inelig
n_pop_wide_tld_hiv  n_pop_wide_tld_prep_elig  n_pop_wide_tld_neg_prep_inelig prop_prep_tot5yrs n_start_rest_prep_inj_hiv n_prep_inj n_prep_any
p_prep_adhg80 ;


proc contents; run;

proc sort; by run; run;

***Macro par used to add in values of all sampled parameters - values before intervention;
data f; set y; 
if cald=2020;

%let sf=sf_2022;

keep 

run cald 

&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
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
fold_tr fold_tr_newp switch_for_tox  
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
prob_prep_pop_wide_tld
p_emerge_inm_res_cab_notpr
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_0_to_1 prob_onartvis_1_to_0


;

%macro par(p=);

* &p ;
proc means noprint data=f; var &p ; output out=y_ mean= &p; by run ; where cald = 2020; run;
data &p ; set  y_ ; drop _TYPE_ _FREQ_;run;

%mend par; 

%par(p=&sf); 
%par(p=sex_beh_trans_matrix_m ); %par(p=sex_beh_trans_matrix_w ); %par(p=sex_age_mixing_matrix_m ); %par(p=sex_age_mixing_matrix_w ); %par(p=p_rred_p );
%par(p=p_hsb_p ); %par(p=newp_factor ); %par(p=eprate ) %par(p=conc_ep ); %par(p=ch_risk_diag ); %par(p=ch_risk_diag_newp );
%par(p=ych_risk_beh_newp ); %par(p=ych2_risk_beh_newp ); %par(p=ych_risk_beh_ep ); %par(p=exp_setting_lower_p_vl1000 );
%par(p=external_exp_factor ); %par(p=rate_exp_set_lower_p_vl1000 ); %par(p=prob_pregnancy_base ); %par(p=fold_change_w );
%par(p=fold_change_yw ); %par(p=fold_change_sti ); %par(p=tr_rate_undetec_vl); %par(p=super_infection_pop ); %par(p= super_inf_res ); 
%par(p=an_lin_incr_test );
%par(p=date_test_rate_plateau ); %par(p=rate_testanc_inc ); %par(p=incr_test_rate_sympt ); %par(p=max_freq_testing );
%par(p=test_targeting ); %par(p=fx );  %par(p=gx );  %par(p=adh_pattern ); %par(p=prob_loss_at_diag ); %par(p=pr_art_init ); 
%par(p=rate_lost ); %par(p=prob_lost_art ); %par(p=rate_return ); %par(p=rate_restart ); %par(p=rate_int_choice );
%par(p=clinic_not_aw_int_frac ); %par(p=res_trans_factor_nn ); %par(p=rate_loss_persistence ); %par(p=incr_rate_int_low_adh );
%par(p=poorer_cd4rise_fail_nn ); %par(p=poorer_cd4rise_fail_ii ); %par(p=rate_res_ten );
%par(p=fold_change_mut_risk ); %par(p=adh_effect_of_meas_alert ); %par(p=pr_switch_line ); %par(p=prob_vl_meas_done );
%par(p=red_adh_tb_adc ); %par(p=red_adh_tox_pop ); %par(p=add_eff_adh_nnrti ); %par(p=altered_adh_sec_line_pop );
%par(p=prob_return_adc ); %par(p=prob_lossdiag_adctb ); %par(p=prob_lossdiag_non_tb_who3e); %par(p=higher_newp_less_engagement );
%par(p=fold_tr ); %par(p=fold_tr_newp); %par(p=switch_for_tox ); %par(p=adh_pattern_prep_oral ); %par(p=rate_test_startprep_any ); 
%par(p=circ_inc_rate ); %par(p=p_hard_reach_w ); %par(p=hard_reach_higher_in_men );
%par(p=p_hard_reach_m ); %par(p=inc_cat ); %par(p= base_rate_sw );  %par(p= base_rate_stop_sexwork );    %par(p= rred_a_p );
%par(p= rr_int_tox );     %par(p= nnrti_res_no_effect );  %par(p= double_rate_gas_tox_taz );   
%par(p= incr_mort_risk_dol_weightg ); %par(p=prep_any_strategy ); %par(p=reg_option_107_after_cab);

%par(p=effect_visit_prob_diag_l);  %par(p=tb_base_prob_diag_l); %par(p=crypm_base_prob_diag_l); %par(p=tblam_eff_prob_diag_l);  
%par(p=crag_eff_prob_diag_l);%par(p=sbi_base_prob_diag_l); %par(p=rel_rate_death_tb_diag_e); %par(p=rel_rate_death_oth_adc_diag_e); 
%par(p=rel_rate_death_crypm_diag_e);%par(p=rel_rate_death_sbi_diag_e);  %par(p=incr_death_rate_tb); %par(p=incr_death_rate_oth_adc);
%par(p=incr_death_rate_crypm); %par(p=incr_death_rate_sbi);%par(p=cm_1stvis_return_vlmg1000);  %par(p=crag_cd4_l200); %par(p=crag_cd4_l100);  
%par(p=tblam_cd4_l200);  %par(p=tblam_cd4_l100);    %par(p=effect_tb_proph);   %par(p=effect_crypm_proph);  %par(p=effect_sbi_proph);

%par(p=sw_init_newp); %par(p=sw_trans_matrix);
%par(p=zero_tdf_activity_k65r );  %par(p=zero_3tc_activity_m184 ); 
%par(p=red_adh_multi_pill_pop );   %par(p=greater_disability_tox );	   %par(p=greater_tox_zdv ); 

%par(p=effect_sw_prog_prep_any);  %par(p=prob_prep_any_restart_choice);  
%par(p=prob_prep_any_visit_counsel);  %par(p=rate_test_onprep_any); %par(p=prep_willingness_threshold);  
%par(p=prob_prep_any_restart_choice);  
%par(p=pr_prep_oral_b);  %par(p=rel_prep_oral_adh_younger); %par(p=prep_oral_efficacy);    
%par(p=rate_choose_stop_prep_oral);  %par(p=higher_future_prep_oral_cov);  %par(p=pr_prep_inj_b);  %par(p=prep_inj_efficacy);
%par(p=rate_choose_stop_prep_inj);   %par(p=prep_inj_effect_inm_partner);  %par(p=res_trans_factor_ii);
%par(p=rel_pr_inm_inj_prep_tail_primary);      %par(p=rr_res_cab_dol);  %par(p=hivtest_type_1_init_prep_inj);   %par(p=hivtest_type_1_prep_inj);
 %par(p=sens_ttype1_prep_inj_primary);  %par(p=sens_ttype1_prep_inj_inf3m);  %par(p=sens_ttype1_prep_inj_infge6m);
 %par(p=sens_ttype3_prep_inj_primary);  %par(p=sens_ttype3_prep_inj_inf3m);  %par(p=sens_ttype3_prep_inj_infge6m);
%par(p=dol_higher_potency); %par(p=cab_time_to_lower_threshold_g);  %par(p=sens_tests_prep_inj);  %par(p=pr_inm_inj_prep_primary);
%par(p=pref_prep_inj_beta_s1); %par(p=testt1_prep_inj_eff_on_res_prim);  %par(p=incr_res_risk_cab_inf_3m);
%par(p=p_emerge_inm_res_cab_notpr);
%par(p=rr_return_pop_wide_tld); %par(p=rr_interrupt_pop_wide_tld);  %par(p=prob_tld_prep_if_untested);  %par(p=prob_onartvis_0_to_1);
 %par(p=prob_onartvis_1_to_0);   %par(p=prob_prep_pop_wide_tld);

data a.wide_par_x; merge 
&sf sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
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
fold_tr fold_tr_newp switch_for_tox  
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
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_1_to_0 prob_onartvis_1_to_0
 prob_prep_pop_wide_tld

p_emerge_inm_res_cab_notpr
;

run;
proc sort; by run;run;


* To get one row per run;

  data  a.w_pop_wide_tld11_with_lost_x     ; 
  merge a.wide_outputs_x         a.wide_par_x     ;
  by run;



  data w_pop_wide_tld ;
  set a.w_pop_wide_tld11_with_lost_x ;


if incidence1549_22 >= 0.15 and prevalence1549_22 <= 0.25;

if prep_any_strategy = 4;

d_prop_elig_on_prep_20y_3_2 =  prop_elig_on_prep_20y_3 -  prop_elig_on_prep_20y_2 ;
d_prop_elig_on_prep_20y_3_2 = round(d_prop_elig_on_prep_20y_3_2, 0.01);
if d_prop_elig_on_prep_20y_3_2 >= 0.1;


* if run <=  943258673 ;  * for n=1000 pop_wide_tld11 ;
  if run <=  958425156 ;  * for n=1000 pop_wide_tld11_with_lost ;



* checked that this the same as dcost_50y_1 etc so over-writing so can change individual costs;
  
dcost_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + dtest_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_circ_50y_1 + dcost_condom_dn_50y_1 + dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1
					+ (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) 
;			

dcost_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + dtest_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_circ_50y_2 + dcost_condom_dn_50y_2 + dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2
					+ (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2) ;
	

dcost_50y_3 = dart_cost_y_50y_3 + dadc_cost_50y_3 + dcd4_cost_50y_3 + dvl_cost_50y_3 + dvis_cost_50y_3 + dnon_tb_who3_cost_50y_3 + 
					dcot_cost_50y_3 + dtb_cost_50y_3 + dres_cost_50y_3 + dtest_cost_50y_3 + d_t_adh_int_cost_50y_3 + dswitchline_cost_50y_3 + 
					dcost_circ_50y_3 + dcost_condom_dn_50y_3 + dcost_child_hiv_50y_3 + dcost_non_aids_pre_death_50y_3
					+ (dcost_prep_visit_oral_50y_3) + (dcost_prep_oral_50y_3) 
+ (1      * dcost_prep_visit_inj_50y_3) 
+ (1      * dcost_prep_inj_50y_3)
;			

dcost_50y_4 = dart_cost_y_50y_4 + dadc_cost_50y_4 + dcd4_cost_50y_4 + dvl_cost_50y_4 + dvis_cost_50y_4 + dnon_tb_who3_cost_50y_4 + 
					dcot_cost_50y_4 + dtb_cost_50y_4 + dres_cost_50y_4 + dtest_cost_50y_4 + d_t_adh_int_cost_50y_4 + dswitchline_cost_50y_4 + 
					dcost_circ_50y_4 + dcost_condom_dn_50y_4 + dcost_child_hiv_50y_4 + dcost_non_aids_pre_death_50y_4
					+ (dcost_prep_visit_oral_50y_4) + (dcost_prep_oral_50y_4) 
+ (1      * dcost_prep_visit_inj_50y_4) 
+ (1      * dcost_prep_inj_50y_4)
;			



dcost_hiv_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1 ; 
dcost_hiv_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2 ; 
dcost_hiv_50y_3 = dart_cost_y_50y_3 + dadc_cost_50y_3 + dcd4_cost_50y_3 + dvl_cost_50y_3 + dvis_cost_50y_3 + dnon_tb_who3_cost_50y_3 + 
					dcot_cost_50y_3 + dtb_cost_50y_3 + dres_cost_50y_3 + d_t_adh_int_cost_50y_3 + dswitchline_cost_50y_3 + 
					dcost_child_hiv_50y_3 + dcost_non_aids_pre_death_50y_3 ; 
dcost_hiv_50y_4 = dart_cost_y_50y_4 + dadc_cost_50y_4 + dcd4_cost_50y_4 + dvl_cost_50y_4 + dvis_cost_50y_4 + dnon_tb_who3_cost_50y_4 + 
					dcot_cost_50y_4 + dtb_cost_50y_4 + dres_cost_50y_4 + d_t_adh_int_cost_50y_4 + dswitchline_cost_50y_4 + 
					dcost_child_hiv_50y_4 + dcost_non_aids_pre_death_50y_4 ; 

dcost_prep_total_50y_1 = (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) ;
dcost_prep_total_50y_2 = (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2) ;
dcost_prep_total_50y_3 = (dcost_prep_visit_oral_50y_3) + (dcost_prep_oral_50y_3)+ (dcost_prep_visit_inj_50y_3) + (dcost_prep_inj_50y_3);
dcost_prep_total_50y_4 = (dcost_prep_visit_oral_50y_4) + (dcost_prep_oral_50y_4)+ (dcost_prep_visit_inj_50y_4) + (dcost_prep_inj_50y_4);

netdaly500_1 = ddaly_50y_1 + (dcost_50y_1 / 0.0005);
netdaly500_2 = ddaly_50y_2 + (dcost_50y_2 / 0.0005);
netdaly500_3 = ddaly_50y_3 + (dcost_50y_3 / 0.0005);
netdaly500_4 = ddaly_50y_4 + (dcost_50y_4 / 0.0005);

min_netdaly500 = min(netdaly500_1, netdaly500_2, netdaly500_3, netdaly500_4);

if netdaly500_1 = min_netdaly500 then lowest_netdaly=1;
if netdaly500_2 = min_netdaly500 then lowest_netdaly=2;
if netdaly500_3 = min_netdaly500 then lowest_netdaly=3;
if netdaly500_4 = min_netdaly500 then lowest_netdaly=4;

pop_wide_tld_ce=0; if netdaly500_4 = min_netdaly500 then pop_wide_tld_ce=1;
pop_wide_tld_ce_x = 1 - pop_wide_tld_ce;

ce_cab_la_oral_prep = 0;
if 0 < netdaly500_3 < netdaly500_2 then ce_cab_la_oral_prep = 1;

d_p_onart_50y_4_3 = p_onart_50y_4 - p_onart_50y_3; 
d_n_death_hiv_50y_4_3 = n_death_hiv_50y_4 - n_death_hiv_50y_3;
d_n_death_hiv_50y_3_2 = n_death_hiv_50y_3 - n_death_hiv_50y_2;

d_prop_1564_onprep_20y_3_2 = prop_1564_onprep_20y_3 - prop_1564_onprep_20y_2;
d_prop_prep_inj_20y_3_2 = prop_prep_inj_20y_3 - prop_prep_inj_20y_2 ;
d_p_prep_any_ever_42_3_2 = p_prep_any_ever_42_3 - p_prep_any_ever_42_2 ;
r_incidence1549_20y_3_2 = incidence1549_20y_3 / incidence1549_20y_2 ;
d_incidence_onprep_20y_3_2 = incidence_onprep_20y_3 - incidence_onprep_20y_2 ;
d_n_birth_with_inf_child_20y_3_2 = n_birth_with_inf_child_20y_3 - n_birth_with_inf_child_20y_2 ;
r_prevalence1549_42_3_2 = prevalence1549_42_3 / prevalence1549_42_2 ;
r_n_hiv_42_3_2 = n_hiv_42_3 / n_hiv_42_2 ;

d_p_hiv1_prep_20y_3_2 = p_hiv1_prep_20y_3 - p_hiv1_prep_20y_2 ; 
d_n_st_rest_prep_inj_hiv_20y_3_2 = n_start_rest_prep_inj_hiv_20y_3 - n_start_rest_prep_inj_hiv_20y_2 ; 
d_n_prep_inj_20y_3_2 = n_prep_inj_20y_3 - n_prep_inj_20y_2 ;
d_p_ai_no_arv_e_inm_42_3_2 = p_ai_no_arv_e_inm_42_3 - p_ai_no_arv_e_inm_42_2 ;
d_p_iime_42_3_2 = p_iime_42_3 - p_iime_42_2 ;
d_n_infected_inm_42_3_2 = n_infected_inm_42_3 - n_infected_inm_42_2 ;   
d_n_cur_res_cab_42_3_2 = n_cur_res_cab_42_3 - n_cur_res_cab_42_2 ;
d_p_vl1000_art_12m_onart_42_3_2 = p_vl1000_art_12m_onart_42_3 - p_vl1000_art_12m_onart_42_2 ;  
d_p_vl1000_art_12m_onart_50y_3_2 = p_vl1000_art_12m_onart_50y_3 - p_vl1000_art_12m_onart_50y_2 ;  
d_p_onart_vl1000_42_3_2 = p_onart_vl1000_42_3 - p_onart_vl1000_42_2 ; 
d_p_onart_vl1000_50y_3_2 = p_onart_vl1000_50y_3 - p_onart_vl1000_50y_2 ; 
d_p_taz_42_3_2 = p_taz_42_3 - p_taz_42_2 ; 

d_n_death_hiv_50y_3_2 = n_death_hiv_50y_3 - n_death_hiv_50y_2 ;
d_ddaly_50y_3_2 = ddaly_50y_3 - ddaly_50y_2 ;
d_dcost_50y_3_2 =  dcost_50y_3 - dcost_50y_2 ; 
netdaly_averted_3_2 = netdaly500_3 - netdaly500_2 ; 

r_incidence1549_50y_3_2 = incidence1549_50y_3 / incidence1549_50y_2 ;

if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat3=1; else hiv_test_strat3=0;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat2=1; else hiv_test_strat2=0;

if hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat =1;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat =2;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat =3; 

d_p_ai_no_arv_e_inm_50y_3_2 = p_ai_no_arv_e_inm_50y_3 - p_ai_no_arv_e_inm_50y_2;

pr_inm_inj_prep_primary_x = pr_inm_inj_prep_primary;
if hivtest_type_1_prep_inj=1 then pr_inm_inj_prep_primary_x = pr_inm_inj_prep_primary / testt1_prep_inj_eff_on_res_prim; 
* this is done to find out the originally allocated value  ;

super_inf = 0;
if super_infection_pop = 1 and super_inf_res = 0.2 then super_inf=2;
if super_infection_pop = 1 and super_inf_res = 0.8 then super_inf=3;



/*
dcost_hiv_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1 ; 
dcost_hiv_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2 ; 

dcost_prep_total_50y_1 = (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) ;
dcost_prep_total_50y_2 = (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2)+ (dcost_prep_visit_inj_50y_2) + (dcost_prep_inj_50y_2);			

*/



* table 1;

proc means data=   w_pop_wide_tld n p50 p5 p95 min max;  *  w_pop_wide_tld ;
var prevalence1549w_22 prevalence1549m_22 incidence1549_22 p_diag_22 p_onart_diag_22 p_onart_vl1000_22 p_vl1000_22 prevalence_vg1000_22   ;
run;

* table 2;

proc means data=  w_pop_wide_tld n mean p5 p95;
var 
prop_elig_on_prep_20y_1  prop_elig_on_prep_20y_2 prop_elig_on_prep_20y_3  prop_elig_on_prep_20y_4  d_prop_elig_on_prep_20y_3_2
prop_1564_onprep_20y_1  prop_1564_onprep_20y_2  prop_1564_onprep_20y_3  prop_1564_onprep_20y_4 d_prop_1564_onprep_20y_3_2
n_prep_inj_20y_1 n_prep_inj_20y_2 n_prep_inj_20y_3 n_prep_inj_20y_4
n_prep_any_20y_1 n_prep_any_20y_2 n_prep_any_20y_3 n_prep_any_20y_4
prop_prep_inj_20y_1 prop_prep_inj_20y_2 prop_prep_inj_20y_3 prop_prep_inj_20y_4   d_prop_prep_inj_20y_3_2
prop_prep_tot5yrs_42_1 prop_prep_tot5yrs_42_2 prop_prep_tot5yrs_42_3 prop_prep_tot5yrs_42_4
p_prep_any_ever_42_1  p_prep_any_ever_42_2 p_prep_any_ever_42_3  p_prep_any_ever_42_4 d_p_prep_any_ever_42_3_2
incidence1549_20y_1 incidence1549_20y_2 incidence1549_20y_3 incidence1549_20y_4 r_incidence1549_20y_3_2
incidence_onprep_20y_1 incidence_onprep_20y_2 incidence_onprep_20y_3 incidence_onprep_20y_4 d_incidence_onprep_20y_3_2
n_birth_with_inf_child_20y_1 n_birth_with_inf_child_20y_2 n_birth_with_inf_child_20y_3 n_birth_with_inf_child_20y_4 d_n_birth_with_inf_child_20y_3_2
prevalence1549_42_1 prevalence1549_42_2 prevalence1549_42_3 prevalence1549_42_4 r_prevalence1549_42_3_2
n_hiv_42_1 n_hiv_42_2 n_hiv_42_3 n_hiv_42_4 r_n_hiv_42_3_2 
; 
run;

proc means data=  w_pop_wide_tld n mean p5 p95 min max;
var 
prop_elig_on_prep_20y_2 prop_elig_on_prep_20y_3  d_prop_elig_on_prep_20y_3_2
prop_1564_onprep_20y_2  prop_1564_onprep_20y_3  d_prop_1564_onprep_20y_3_2
n_prep_inj_20y_2 n_prep_inj_20y_3 
n_prep_any_20y_2 n_prep_any_20y_3 
prop_prep_inj_20y_2 prop_prep_inj_20y_3  d_prop_prep_inj_20y_3_2
p_prep_any_ever_42_2 p_prep_any_ever_42_3  d_p_prep_any_ever_42_3_2
incidence1549_20y_2 incidence1549_20y_3  r_incidence1549_20y_3_2
incidence_onprep_20y_2 incidence_onprep_20y_3  d_incidence_onprep_20y_3_2
n_birth_with_inf_child_20y_2 n_birth_with_inf_child_20y_3  d_n_birth_with_inf_child_20y_3_2
prevalence1549_42_2 prevalence1549_42_3  r_prevalence1549_42_3_2
n_hiv_42_2 n_hiv_42_3 r_n_hiv_42_3_2 
; 
run;
proc freq data=  w_pop_wide_tld; tables d_prop_elig_on_prep_20y_3_2; run;



* table 3;

proc means data=   w_pop_wide_tld n mean  p5 p95 ;
var 
p_hiv1_prep_20y_1 p_hiv1_prep_20y_2 p_hiv1_prep_20y_3 p_hiv1_prep_20y_4  d_p_hiv1_prep_20y_3_2
n_start_rest_prep_inj_hiv_20y_1   n_start_rest_prep_inj_hiv_20y_2   n_start_rest_prep_inj_hiv_20y_3   n_start_rest_prep_inj_hiv_20y_4   
p_ai_no_arv_e_inm_42_1 p_ai_no_arv_e_inm_42_2 p_ai_no_arv_e_inm_42_3 p_ai_no_arv_e_inm_42_4 d_p_ai_no_arv_e_inm_42_3_2
p_iime_42_1 p_iime_42_2 p_iime_42_3 p_iime_42_4 d_p_iime_42_3_2
n_infected_inm_42_1  n_infected_inm_42_2  n_infected_inm_42_3  n_infected_inm_42_4 d_n_infected_inm_42_3_2  
n_cur_res_cab_42_1 n_cur_res_cab_42_2 n_cur_res_cab_42_3 n_cur_res_cab_42_4 d_n_cur_res_cab_42_3_2 
p_vl1000_art_12m_onart_42_1 p_vl1000_art_12m_onart_42_2 p_vl1000_art_12m_onart_42_3 p_vl1000_art_12m_onart_42_4 d_p_vl1000_art_12m_onart_42_3_2 d_p_vl1000_art_12m_onart_50y_3_2
p_onart_vl1000_42_1  p_onart_vl1000_42_2 p_onart_vl1000_42_3  p_onart_vl1000_42_4 d_p_onart_vl1000_42_3_2 d_p_onart_vl1000_50y_3_2
prevalence_vg1000_42_1 prevalence_vg1000_42_2 prevalence_vg1000_42_3 prevalence_vg1000_42_4
p_vl1000_42_1  p_vl1000_42_2 p_vl1000_42_3  p_vl1000_42_4 
p_taz_42_1 p_taz_42_2 p_taz_42_3 p_taz_42_4 d_p_taz_42_3_2  
;
  where hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 ; run;
run;




* table 4;
proc means data=  w_pop_wide_tld n mean p5 p95;
  var 
n_death_hiv_50y_1 n_death_hiv_50y_2 n_death_hiv_50y_3 n_death_hiv_50y_4 d_n_death_hiv_50y_3_2
ddaly_50y_1 ddaly_50y_2 ddaly_50y_3 ddaly_50y_4    d_ddaly_50y_3_2
dcost_50y_1   dcost_50y_2 dcost_50y_3   dcost_50y_4  d_dcost_50y_3_2
netdaly500_1 netdaly500_2 netdaly500_3 netdaly500_4 netdaly_averted_3_2
;
* var 
n_death_hiv_50y_2 n_death_hiv_50y_3  d_n_death_hiv_50y_3_2
ddaly_50y_2 ddaly_50y_3  d_ddaly_50y_3_2
dcost_50y_2 dcost_50y_3  d_dcost_50y_3_2
netdaly500_1 netdaly500_2 netdaly500_3 netdaly_averted_3_2
;
  where hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 ; run;
run;



proc freq  data = w_pop_wide_tld; tables d_n_death_hiv_50y_3_2 ce_cab_la_oral_prep;
* where hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 ; 
  where (hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ge 0) and 0.5 <= incidence1549_22 < 1.0;  run;
run;



* text ;



proc means data =  w_pop_wide_tld ; 
var 
dcost_50y_2  dcost_hiv_50y_2  dcost_prep_total_50y_2  dtest_cost_50y_2 dcost_circ_50y_2
dcost_50y_3  dcost_hiv_50y_3  dcost_prep_total_50y_3  dtest_cost_50y_3 dcost_circ_50y_3
;
  where  hivtest_type_1_init_prep_inj =  1 and hivtest_type_1_prep_inj =  1  ;
run;




* suppl table x ;

proc glm data=  w_pop_wide_tld;  
class fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x   rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern super_inf
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b;                  ;
model d_p_ai_no_arv_e_inm_50y_3_2 =
p_ai_no_arv_e_inm_22 fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern  super_inf
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b/ solution;
run;

proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where prep_inj_efficacy = 0.9 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where pref_prep_inj_beta_s1 = 6 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where pr_inm_inj_prep_primary = 0.5 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where incr_res_risk_cab_inf_3m = 50 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where rel_pr_inm_inj_prep_tail_primary = 1.33 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where res_trans_factor_ii = 0.8 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where pr_prep_inj_b = 0.7 ; run;
proc means data=w_pop_wide_tld;  var d_p_ai_no_arv_e_inm_50y_3_2 ; where hiv_test_strat=3; run; 

proc glm data=    w_pop_wide_tld; 
class fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x   rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii adh_pattern  super_inf
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b;                ;
model d_n_death_hiv_50y_3_2 =
n_death_hiv_22 fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy prep_oral_efficacy rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x   rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  adh_pattern super_inf
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab pref_prep_inj_beta_s1 pr_prep_inj_b /  solution;
run;


proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where prep_inj_efficacy = 0.9 ; run;
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where pref_prep_inj_beta_s1 = 6 ; run;
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where rate_choose_stop_prep_inj = 0.3  ; run;
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where pr_inm_inj_prep_primary=0.5; run; 
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where adh_pattern =7 ;run; 
proc means data=w_pop_wide_tld;  var d_n_death_hiv_50y_3_2 ; where hiv_test_strat=3; run; 






























proc freq data=  w_pop_wide_tld; tables  lowest_netdaly d_n_death_hiv_50y_3_2 ce_cab_la_oral_prep;
run;


proc logistic data=  w_pop_wide_tld; 
model pop_wide_tld_ce_x =  prevalence_vg1000_22
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_1_to_0 prob_onartvis_1_to_0 pref_prep_inj_beta_s1
pref_prep_oral_beta_s1_20y_4
;
run;


proc glm  data=  w_pop_wide_tld; 
model d_p_onart_50y_4_3   =  
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_1_to_0 prob_onartvis_1_to_0 pref_prep_inj_beta_s1
;
run;


proc glm  data=  w_pop_wide_tld; 
model d_n_death_hiv_50y_4_3  =  
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_1_to_0 prob_onartvis_1_to_0 pref_prep_inj_beta_s1
;
run;


proc glm data=w_pop_wide_tld; 
model prop_1564_onprep_20y_3 = rate_test_startprep_any pr_prep_oral_b rate_choose_stop_prep_oral rate_choose_stop_prep_inj
pref_prep_inj_beta_s1; 
run;





proc glm  data=  w_pop_wide_tld; 
model prop_hivneg_onprep_50y_3  =  


sex_beh_trans_matrix_m sex_beh_trans_matrix_w sex_age_mixing_matrix_m sex_age_mixing_matrix_w p_rred_p
p_hsb_p newp_factor eprate conc_ep ch_risk_diag ch_risk_diag_newp
ych_risk_beh_newp ych2_risk_beh_newp ych_risk_beh_ep exp_setting_lower_p_vl1000
external_exp_factor rate_exp_set_lower_p_vl1000 prob_pregnancy_base fold_change_w
fold_change_yw fold_change_sti tr_rate_undetec_vl super_infection_pop super_inf_res  an_lin_incr_test
date_test_rate_plateau rate_testanc_inc incr_test_rate_sympt max_freq_testing
test_targeting fx gx adh_pattern prob_loss_at_diag pr_art_init 
rate_lost prob_lost_art rate_return rate_restart rate_int_choice
clinic_not_aw_int_frac res_trans_factor_nn rate_loss_persistence incr_rate_int_low_adh
poorer_cd4rise_fail_nn poorer_cd4rise_fail_ii rate_res_ten
fold_change_mut_risk adh_effect_of_meas_alert pr_switch_line prob_vl_meas_done
red_adh_tb_adc red_adh_tox_pop add_eff_adh_nnrti altered_adh_sec_line_pop
prob_return_adc prob_lossdiag_adctb prob_lossdiag_non_tb_who3e higher_newp_less_engagement
fold_tr fold_tr_newp switch_for_tox  
circ_inc_rate p_hard_reach_w hard_reach_higher_in_men
p_hard_reach_m inc_cat  base_rate_sw base_rate_stop_sexwork    rred_a_p
rr_int_tox   nnrti_res_no_effect  double_rate_gas_tox_taz   
incr_mort_risk_dol_weightg  sw_init_newp sw_trans_matrix
  red_adh_multi_pill_pop   greater_disability_tox	  greater_tox_zdv

 prob_prep_any_restart_choice 
adh_pattern_prep_oral   rate_test_startprep_any    rate_choose_stop_prep_oral
prep_any_strategy    rate_test_onprep_any  prep_willingness_threshold  
prob_prep_any_restart_choice  
pr_prep_oral_b  rel_prep_oral_adh_younger prep_oral_efficacy      

 prob_prep_any_restart_choice dol_higher_potency  cab_time_to_lower_threshold_g
sens_tests_prep_inj  pr_inm_inj_prep_primary
rr_return_pop_wide_tld rr_interrupt_pop_wide_tld  prob_tld_prep_if_untested  prob_onartvis_1_to_0 
;
run;


proc means data =   w_pop_wide_tld  ; 
var 
dcost_50y_1  dcost_hiv_50y_1  dcost_prep_total_50y_1  dtest_cost_50y_1 dcost_circ_50y_1
dcost_50y_2  dcost_hiv_50y_2  dcost_prep_total_50y_2  dtest_cost_50y_2 dcost_circ_50y_2
dcost_50y_3  dcost_hiv_50y_3  dcost_prep_total_50y_3  dtest_cost_50y_3 dcost_circ_50y_3
dcost_50y_4  dcost_hiv_50y_4  dcost_prep_total_50y_4  dtest_cost_50y_4 dcost_circ_50y_4
;
run;



/*


* checked that this the same as dcost_50y_1 etc so over-writing so can change individual costs;
  
 dcost_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + dtest_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_circ_50y_1 + dcost_condom_dn_50y_1 + dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1
					+ (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) 
;			

 dcost_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + dtest_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_circ_50y_2 + dcost_condom_dn_50y_2 + dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2
					+ (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2) 
+ (1      * dcost_prep_visit_inj_50y_2) 
+ (1      * dcost_prep_inj_50y_2)
;			


dcost_hiv_50y_1 = dart_cost_y_50y_1 + dadc_cost_50y_1 + dcd4_cost_50y_1 + dvl_cost_50y_1 + dvis_cost_50y_1 + dnon_tb_who3_cost_50y_1 + 
					dcot_cost_50y_1 + dtb_cost_50y_1 + dres_cost_50y_1 + d_t_adh_int_cost_50y_1 + dswitchline_cost_50y_1 + 
					dcost_child_hiv_50y_1 + dcost_non_aids_pre_death_50y_1 ; 
dcost_hiv_50y_2 = dart_cost_y_50y_2 + dadc_cost_50y_2 + dcd4_cost_50y_2 + dvl_cost_50y_2 + dvis_cost_50y_2 + dnon_tb_who3_cost_50y_2 + 
					dcot_cost_50y_2 + dtb_cost_50y_2 + dres_cost_50y_2 + d_t_adh_int_cost_50y_2 + dswitchline_cost_50y_2 + 
					dcost_child_hiv_50y_2 + dcost_non_aids_pre_death_50y_2 ; 

dcost_prep_total_50y_1 = (dcost_prep_visit_oral_50y_1) + (dcost_prep_oral_50y_1) ;
dcost_prep_total_50y_2 = (dcost_prep_visit_oral_50y_2) + (dcost_prep_oral_50y_2)+ (dcost_prep_visit_inj_50y_2) + (dcost_prep_inj_50y_2);			

* 20y ;

 dcost_20y_1 = dart_cost_y_20y_1 + dadc_cost_20y_1 + dcd4_cost_20y_1 + dvl_cost_20y_1 + dvis_cost_20y_1 + dnon_tb_who3_cost_20y_1 + 
					dcot_cost_20y_1 + dtb_cost_20y_1 + dres_cost_20y_1 + dtest_cost_20y_1 + d_t_adh_int_cost_20y_1 + dswitchline_cost_20y_1 + 
					dcost_circ_20y_1 + dcost_condom_dn_20y_1 + dcost_child_hiv_20y_1 + dcost_non_aids_pre_death_20y_1
					+ (dcost_prep_visit_oral_20y_1) + (dcost_prep_oral_20y_1) 
;			

 dcost_20y_2 = dart_cost_y_20y_2 + dadc_cost_20y_2 + dcd4_cost_20y_2 + dvl_cost_20y_2 + dvis_cost_20y_2 + dnon_tb_who3_cost_20y_2 + 
					dcot_cost_20y_2 + dtb_cost_20y_2 + dres_cost_20y_2 + dtest_cost_20y_2 + d_t_adh_int_cost_20y_2 + dswitchline_cost_20y_2 + 
					dcost_circ_20y_2 + dcost_condom_dn_20y_2 + dcost_child_hiv_20y_2 + dcost_non_aids_pre_death_20y_2
					+ (dcost_prep_visit_oral_20y_2) + (dcost_prep_oral_20y_2) 
+ (1   * dcost_prep_visit_inj_20y_2) 
+ (1   * dcost_prep_inj_20y_2)
;			

dcost_hiv_20y_1 = dart_cost_y_20y_1 + dadc_cost_20y_1 + dcd4_cost_20y_1 + dvl_cost_20y_1 + dvis_cost_20y_1 + dnon_tb_who3_cost_20y_1 + 
					dcot_cost_20y_1 + dtb_cost_20y_1 + dres_cost_20y_1 + d_t_adh_int_cost_20y_1 + dswitchline_cost_20y_1 + 
					dcost_child_hiv_20y_1 + dcost_non_aids_pre_death_20y_1 ; 
dcost_hiv_20y_2 = dart_cost_y_20y_2 + dadc_cost_20y_2 + dcd4_cost_20y_2 + dvl_cost_20y_2 + dvis_cost_20y_2 + dnon_tb_who3_cost_20y_2 + 
					dcot_cost_20y_2 + dtb_cost_20y_2 + dres_cost_20y_2 + d_t_adh_int_cost_20y_2 + dswitchline_cost_20y_2 + 
					dcost_child_hiv_20y_2 + dcost_non_aids_pre_death_20y_2 ; 

dcost_prep_total_20y_1 = (dcost_prep_visit_oral_20y_1) + (dcost_prep_oral_20y_1) ;
dcost_prep_total_20y_2 = (dcost_prep_visit_oral_20y_2) + (dcost_prep_oral_20y_2)+ (dcost_prep_visit_inj_20y_2) + (dcost_prep_inj_20y_2);			



if hivtest_type_1_prep_inj = . then hivtest_type_1_prep_inj=0;

pr_inm_inj_prep_primary_x = pr_inm_inj_prep_primary;
if hivtest_type_1_prep_inj=1 then pr_inm_inj_prep_primary_x = pr_inm_inj_prep_primary / testt1_prep_inj_eff_on_res_prim; 
* this is done to find out the originally allocated value  ;

d_n_cur_res_dol_50y_2 = n_cur_res_dol_50y_2 - n_cur_res_dol_50y_1;  
d_n_prep_any_50y_2 = n_prep_any_50y_2 - n_prep_any_50y_1 ;
d_prop_elig_on_prep_50y_2 =  prop_elig_on_prep_50y_2 -  prop_elig_on_prep_50y_1 ;  
d_p_hiv1_prep_50y_2 =  p_hiv1_prep_50y_2 -  p_hiv1_prep_50y_1;  
d_p_iime_50y_2 = p_iime_50y_2 -  p_iime_50y_1;
d_n_death_hiv_50y_2 = n_death_hiv_50y_1 - n_death_hiv_50y_2 ;

d_prop_elig_on_prep_20y_2 =  prop_elig_on_prep_20y_2 -  prop_elig_on_prep_20y_1 ;  
d_prop_1564_onprep_20y_2 = prop_1564_onprep_20y_2 - prop_1564_onprep_20y_1;
d_prop_prep_inj_20y_2 = prop_prep_inj_20y_2 - prop_prep_inj_20y_1;
d_n_cur_res_dol_20y_2 = n_cur_res_dol_20y_2 - n_cur_res_dol_20y_1;  
d_n_prep_any_20y_2 = n_prep_any_20y_2 - n_prep_any_20y_1 ;
d_p_hiv1_prep_20y_2 =  p_hiv1_prep_20y_2 -  p_hiv1_prep_20y_1;  
d_n_death_hiv_20y_2 = n_death_hiv_20y_1 - n_death_hiv_20y_2 ;
d_p_hiv1_prep_20y_2 =  p_hiv1_prep_20y_2 -  p_hiv1_prep_20y_1; 
d_incidence_onprep_20y_2 = incidence_onprep_20y_2 - incidence_onprep_20y_1 ; 

d_n_birth_with_inf_child_20y_2 = n_birth_with_inf_child_20y_1 - n_birth_with_inf_child_20y_2;

d_n_cur_res_dol_42_2 = n_cur_res_dol_42_2 - n_cur_res_dol_42_1;  
d_n_prep_any_42_2 = n_prep_any_42_2 - n_prep_any_42_1 ;
d_prop_elig_on_prep_42_2 =  prop_elig_on_prep_42_2 -  prop_elig_on_prep_42_1 ;  
d_p_hiv1_prep_42_2 =  p_hiv1_prep_42_2 -  p_hiv1_prep_42_1;  
d_p_prep_any_ever_42_2 =  p_prep_any_ever_42_2 -  p_prep_any_ever_42_1;

d_p_iime_42_2 = p_iime_42_2 -  p_iime_42_1;
r_p_iime_42_2 = p_iime_42_2 / p_iime_42_1;
d_incidence1549_42_2 = incidence1549_42_2 - incidence1549_42_1 ;
d_p_iime_50y_2 = p_iime_50y_2 -  p_iime_50y_1;
d_incidence1549_50y_2 = incidence1549_50y_2 - incidence1549_50y_1 ;
d_n_death_hiv_42_2 = n_death_hiv_42_1 - n_death_hiv_42_2 ;
d_p_ai_no_arv_e_inm_42_2 = p_ai_no_arv_e_inm_42_2 - p_ai_no_arv_e_inm_42_1;
d_p_vl1000_art_12m_42_2 = p_vl1000_art_12m_42_1 - p_vl1000_art_12m_42_2;
d_p_taz_42_2 = p_taz_42_2 - p_taz_42_1;
d_p_onart_vl1000_42_2 = p_onart_vl1000_42_1 - p_onart_vl1000_42_2;

r_prevalence1549_42_2 = prevalence1549_42_2 / prevalence1549_42_1 ;
r_n_hiv_42_2 =  n_hiv_42_2 / n_hiv_42_1 ;
d_n_infected_inm_42_2 = n_infected_inm_42_2 - n_infected_inm_42_1 ;
d_n_cur_res_cab_42_2 = n_cur_res_cab_42_2 - n_cur_res_cab_42_1;

r_incidence1549_20y_2 = incidence1549_20y_2 / incidence1549_20y_1 ;
r_incidence1549_50y_2 = incidence1549_50y_2 / incidence1549_50y_1 ;

d_p_hiv1_prep_50y_2 = p_hiv1_prep_50y_1 - p_hiv1_prep_50y_2 ;

d_n_infection_50y_2 = n_infection_50y_1 - n_infection_50y_2 ;
d_ddaly_ac_ntd_mtct_50y_2 = ddaly_ac_ntd_mtct_50y_1 - ddaly_ac_ntd_mtct_50y_2;
d_ddaly_50y_2 = ddaly_50y_1 - ddaly_50y_2;
d_dcost_50y_2 = dcost_50y_2 - dcost_50y_1;

d_dcost_prep_50y_2 = dcost_prep_50y_2 - dcost_prep_50y_1 ;
d_dcost_clin_care_50y_2 = dcost_clin_care_50y_2 - dcost_clin_care_50y_1 ;

netdaly500_1 = ddaly_50y_1 + (dcost_50y_1 / 0.0005);
netdaly500_2 = ddaly_50y_2 + (dcost_50y_2 / 0.0005);
netdaly_averted = netdaly500_1 - netdaly500_2;

ce_500=0; if netdaly_averted > 0 then ce_500=1; 
ce_500_x = 1-ce_500;

d_p_ai_no_arv_e_inm_50y_2 = p_ai_no_arv_e_inm_50y_2 - p_ai_no_arv_e_inm_50y_1;

d_dcost_10y_2 = dcost_10y_2 - dcost_10y_1;
d_n_infection_10y_2 = n_infection_10y_1 - n_infection_10y_2 ;

if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat3=1; else hiv_test_strat3=0;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat2=1; else hiv_test_strat2=0;

if hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat =1;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat =2;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 then hiv_test_strat =3; 

if hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat_e =1;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj ne 1 then hiv_test_strat_e =2;
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 and testt1_prep_inj_eff_on_res_prim = 0.75 then hiv_test_strat_e =3; 
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 and testt1_prep_inj_eff_on_res_prim = 0.5 then hiv_test_strat_e =4; 
if hivtest_type_1_init_prep_inj = 1 and hivtest_type_1_prep_inj = 1 and testt1_prep_inj_eff_on_res_prim = 0.25 then hiv_test_strat_e =5; 

d_p_vl1000_art_12m_32_2 = p_vl1000_art_12m_32_1 - p_vl1000_art_12m_32_2; 
d_p_vl1000_art_12m_42_2 = p_vl1000_art_12m_42_1 - p_vl1000_art_12m_42_2; 
d_p_vl1000_art_12m_50y_2 = p_vl1000_art_12m_50y_1 - p_vl1000_art_12m_50y_2; 

p_emerge_inm_res_cab_50y_2 = s_em_inm_res_o_cab_off_3m_50y_2 /  s_o_cab_or_o_cab_tm1_no_r_50y_2 ;
* p_emerge_inm_res_cab_tail_50y_2 = s_emerge_inm_res_cab_tail_50y_2 / s_cur_in_prep_inj_tail_no_r_50y_2 ; 

p_need_cd4m_per_plhiv_22 = n_need_cd4m_22 / n_hiv_22 ;

p_diag_22 = p_diag_22/100;

pred_need_cd4m_per_plhiv_22 =   0.425 + (p_diag_22 * (-0.183)) + (p_onart_diag_22 * (-0.132)) + (p_onart_vl1000_22 * (-0.074)) ; 

res_art_re_start_per_plhiv_22 = p_need_cd4m_per_plhiv_22 - pred_need_cd4m_per_plhiv_22; 

prep_newpge1_this_per = 0; if prep_any_strategy in (4, 6, 8, 10) then prep_newpge1_this_per = 1; 
prep_women_only = 0;  if prep_any_strategy in (6, 7, 10, 11) then prep_women_only = 1; 
prep_less_risk_inf_ep=0; if prep_any_strategy in (8, 9, 10, 11) then prep_less_risk_inf_ep = 1;

if incidence1549_22 < 0.5 then incidence1549_22_g=1;
if 0.5 <= incidence1549_22 < 1.0 then incidence1549_22_g=2;
if 1.0 <= incidence1549_22       then incidence1549_22_g=3;

if incidence1549_22_g=2 then incidence1549_22_g2=1; else incidence1549_22_g2=0;
if incidence1549_22_g=3 then incidence1549_22_g3=1; else incidence1549_22_g3=0;

d_p_hiv1_prep_50y_2 = p_hiv1_prep_50y_1 - p_hiv1_prep_50y_2;


* table 1;

proc means data=   w_lapr n p50 p5 p95 min max;  *  w_lapr ;
var prevalence1549m_22 prevalence1549w_22 incidence1549_22 p_diag_22 p_onart_diag_22 p_onart_vl1000_22 p_vl1000_22 prevalence_vg1000_22   ;
run;

* table 2;

proc means data=  w_lapr n mean p5 p95;
var 
prop_elig_on_prep_20y_1  prop_elig_on_prep_20y_2 d_prop_elig_on_prep_20y_2 
prop_1564_onprep_20y_1  prop_1564_onprep_20y_2 d_prop_1564_onprep_20y_2 
prop_prep_inj_20y_1  prop_prep_inj_20y_2 d_prop_prep_inj_20y_2 
p_prep_any_ever_42_1  p_prep_any_ever_42_2 d_p_prep_any_ever_42_2 
incidence1549_20y_1 incidence1549_20y_2 r_incidence1549_20y_2 
incidence_onprep_20y_1 incidence_onprep_20y_2 d_incidence_onprep_20y_2 
n_birth_with_inf_child_20y_1 n_birth_with_inf_child_20y_2 d_n_birth_with_inf_child_20y_2  
prevalence1549_42_1 prevalence1549_42_2 r_prevalence1549_42_2
n_hiv_42_1 n_hiv_42_2 r_n_hiv_42_2
 
; 
run;

* table 3;
proc means data=  w_lapr n mean p5 p95;
var 
p_hiv1_prep_20y_1 p_hiv1_prep_20y_2  d_p_hiv1_prep_20y_2
n_start_rest_prep_inj_hiv_20y_1   n_start_rest_prep_inj_hiv_20y_2   
n_prep_inj_20y_1 n_prep_inj_20y_2
p_ai_no_arv_e_inm_42_1 p_ai_no_arv_e_inm_42_2 d_p_ai_no_arv_e_inm_42_2
p_iime_42_1 p_iime_42_2 d_p_iime_42_2
n_infected_inm_42_1  n_infected_inm_42_2  d_n_infected_inm_42_2  
n_cur_res_cab_42_1 n_cur_res_cab_42_2 d_n_cur_res_cab_42_2 
p_vl1000_art_12m_42_1 p_vl1000_art_12m_42_2 d_p_vl1000_art_12m_42_2 
p_onart_vl1000_42_1  p_onart_vl1000_42_2 d_p_onart_vl1000_42_2 
p_taz_42_1 p_taz_42_2 d_p_taz_42_2  
;
where hivtest_type_1_init_prep_inj =  1 and hivtest_type_1_prep_inj ge 0 ; run;
run;

* table 4;
proc means data=  w_lapr n mean p5 p95;
var 
n_death_hiv_50y_1 n_death_hiv_50y_2 d_n_death_hiv_50y_2
ddaly_50y_1    d_ddaly_50y_2
dcost_50y_1   dcost_50y_2  d_dcost_50y_2
netdaly500_1 netdaly500_2 netdaly_averted
;
* where hivtest_type_1_init_prep_inj =  1 and hivtest_type_1_prep_inj =  1 ; run;
run;

proc freq  data = w_lapr; tables ce_500 d_n_death_hiv_50y_2;
where hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 ; run;
  run;

* usaid talk;
proc freq  data = w_lapr; tables ce_500 ;
where (hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1) and 0.0 <= incidence1549_22 < 9.0;  run;
  run;


* text ;

proc means data =   w_lapr  ; 
var 
dcost_50y_1  dcost_hiv_50y_1  dcost_prep_total_50y_1  dtest_cost_50y_1 dcost_circ_50y_1
dcost_50y_2  dcost_hiv_50y_2  dcost_prep_total_50y_2  dtest_cost_50y_2 dcost_circ_50y_2
;
  where  hivtest_type_1_init_prep_inj ne 1 and hivtest_type_1_prep_inj ne 1 ;
run;



* suppl table x ;

proc glm data=  w_lapr;  
class fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x  rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii 
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab;                  ;
model d_p_ai_no_arv_e_inm_50y_2 =
p_ai_no_arv_e_inm_22 fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x  rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab / solution;
run;

proc glm data=    w_lapr; 
class fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x  rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii 
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab;                ;
model d_n_death_hiv_50y_2 =
n_death_hiv_22 fold_change_mut_risk prob_prep_any_restart_choice prep_inj_efficacy  rate_choose_stop_prep_inj  dol_higher_potency
prep_inj_effect_inm_partner  pr_inm_inj_prep_primary_x  rel_pr_inm_inj_prep_tail_primary  rr_res_cab_dol pr_art_init    
cab_time_to_lower_threshold_g hiv_test_strat   res_trans_factor_ii  
incr_res_risk_cab_inf_3m prob_vl_meas_done reg_option_107_after_cab / solution;
run;

*/




*
prop_elig_on_prep_20y_1  prop_elig_on_prep_20y_2 d_prop_elig_on_prep_20y_2 
prop_1564_onprep_20y_1  prop_1564_onprep_20y_2 d_prop_1564_onprep_20y_2 
prop_prep_inj_20y_1  prop_prep_inj_20y_2 d_prop_prep_inj_20y_2 
p_prep_any_ever_42_1  p_prep_any_ever_42_2 d_p_prep_any_ever_42_2 
incidence1549_20y_1 incidence1549_20y_2 r_incidence1549_20y_2 
incidence_onprep_20y_1 incidence_onprep_20y_2 d_incidence_onprep_20y_2 
n_birth_with_inf_child_20y_1 n_birth_with_inf_child_20y_2 d_n_birth_with_inf_child_20y_2  
prevalence1549_42_1 prevalence1549_42_2 r_prevalence1549_42_2
n_hiv_42_1 n_hiv_42_2 r_n_hiv_42_2
; 

/*

proc means data=  w_pop_wide_tld n mean p5 p95;
var 
p_hiv1_prep_20y_1 p_hiv1_prep_20y_2  d_p_hiv1_prep_20y_2 
p_ai_no_arv_e_inm_42_1 p_ai_no_arv_e_inm_42_2 d_p_ai_no_arv_e_inm_42_2
p_iime_42_1 p_iime_42_2 d_p_iime_42_2
n_infected_inm_42_1  n_infected_inm_42_2  d_n_infected_inm_42_2  
n_cur_res_cab_42_1 n_cur_res_cab_42_2 d_n_cur_res_cab_42_2 
p_vl1000_art_12m_42_1 p_vl1000_art_12m_42_2 d_p_vl1000_art_12m_42_2 
p_onart_vl1000_42_1  p_onart_vl1000_42_2 d_p_onart_vl1000_42_2 
;
run;

proc means data=  w_pop_wide_tld n mean p5 p95;
var 
n_death_hiv_50y_1 n_death_hiv_50y_2 d_n_death_hiv_50y_2
ddaly_50y_1 ddaly_50y_2    d_ddaly_50y_2
dcost_50y_1   dcost_50y_2  d_dcost_50y_2
netdaly500_1 netdaly500_2 netdaly_averted
;
run;

proc freq  data = w_pop_wide_tld; tables ce_500 d_n_death_hiv_50y_2;
  run;




*/


















