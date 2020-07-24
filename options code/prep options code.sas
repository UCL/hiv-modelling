

* ==========================================================================================================================================;

* code in this section can differ from unified program to some extent, due to specifying exactly what interventions / changes are running; 

* INTERVENTIONS / CHANGES in 2020;


option = &s;

* AP 20-7_19 ;
if caldate_never_dot = 2020.5 then do;
* we need to use caldate_never_dot so that the parameter value is given to everyone in the data set - we use the value for serial_no = 100000
who may be dead and hence have caldate{t} missing;

	if option = 0 then do;

		option_0_prep_continue_2020 = 1;

		* note for prep 2020;
		if _u46 <= 1.0 then do;  

		option_0_prep_continue_2020 = 0;

		prep_willing_sw = 0;
		prep_willing_pop = 0;
		prep_strategy = 0;
		eff_rate_test_startprep = 0 ;
		eff_rate_test_restartprep = 0 ;
		eff_rate_choose_stop_prep = 1 ;
		eff_prob_prep_restart_choice = 0 ;	

		end;

	end;


	if option = 1 then do;

		cascade_care_improvements = 0;
		incr_test_2020 = 0;
		decr_hard_reach_2020 = 0;
		decr_prob_loss_at_diag_2020 = 0;
		decr_rate_lost_2020 = 0;
		decr_rate_lost_art_2020 = 0; 
		incr_rate_return_2020 = 0 ;
		incr_rate_restart_2020 = 0;
		incr_rate_init_2020 = 0 ;
		incr_adh_2020 = 0;
		decr_rate_int_choice_2020 = 0 ;
		incr_prob_vl_meas_done_2020 = 0;  
		art_mon_drug_levels_2020 = 0;
		incr_pr_switch_line_2020 = 0 ;
		incr_test_targeting_2020 = 0;
		incr_max_freq_testing_2020 = 0;
		sw_test_6mthly_2020 = 0;
		reg_option_switch_2020 = 0;
		ten_is_taf_2020 = 0;

		prep_improvements = 0;
		incr_adh_pattern_prep_2020 = 0 ;
		inc_r_test_startprep_2020 = 0 ;
		incr_r_test_restartprep_2020 = 0 ;
		decr_r_choose_stop_prep_2020 = 0 ;
		inc_p_prep_restart_choi_2020 = 0 ;
		incr_prepuptake_sw_2020 = 0 ;
		incr_prepuptake_pop_2020 = 0 ;
		prep_strategy_2020 = 0 ;

		circ_improvements = 0;
		circ_inc_rate_2020 = 0;

		condom_incr_2020 = 0;

		pop_wide_tld = 0;

* cascade of care;

		if _u1 < 0.0 then cascade_care_improvements = 1;
		if cascade_care_improvements = 1 then do;
		
* incr_test_2020; 		incr_test_2020 = 0; if _u43 < 0.90 then do;  
							if _u2 < 0.16 then incr_test_2020 = 1; if 0.16 <= _u2 < 0.33 then incr_test_2020 = 2; 
							if 0.33 <= _u2 < 0.50 then incr_test_2020 = 3;  if 0.50 <= _u2 < 0.66 then incr_test_2020 = 4; 
							if 0.66 <= _u2 < 0.83 then incr_test_2020 = 3; if 0.83 <= _u2  then incr_test_2020 = 6; 
						end;

* incr_test_targeting_2020;	
						incr_test_targeting_2020 = 0; if _u42 < 0.45 then incr_test_targeting_2020=1;
						if 0.45 <= _u42 < 0.9 then incr_test_targeting_2020=2;
						if incr_test_targeting_2020=1 then eff_test_targeting = 2;  
						if incr_test_targeting_2020=2 then eff_test_targeting = 5;  
						
* incr_max_freq_testing_2020;
						incr_max_freq_testing_2020 = 0; if _u44 < 0.90 then incr_max_freq_testing_2020=1;
						if incr_max_freq_testing_2020=1 then do;
							if eff_max_freq_testing = 2 then eff_max_freq_testing = 4; 
							if eff_max_freq_testing = 1 then eff_max_freq_testing = 2;
						end;  

* sw_test_6mthly_2020; sw_test_6mthly_2020 = 0;
						if _u45 < 0.9 then do; 
							sw_test_6mthly_2020 = 1; sw_test_6mthly =1; 
						end;
						
* incr_adh_2020;  		incr_adh_2020 = 0;  if _u3 < 0.90 then do; 
							if adhav < 0.8 then do; 
								if _u4 < 0.5 then incr_adh_2020 = 0.5; if _u4 ge 0.5 then incr_adh_2020 = 0.75; 
								e = uniform(0); if e < incr_adh_2020 then adhav = 0.9; 
							end;
						end;

* decr_hard_reach_2020; decr_hard_reach_2020 = 0; e_decr_hard_reach_2020=0; 
						if _u5 < 0.90 then do; 
						decr_hard_reach_2020 = 1; 
						if _u6 < 0.5 then e_decr_hard_reach_2020 = 0.50; if _u6 ge 0.5 then e_decr_hard_reach_2020 = 0.75; 
						if hard_reach=1 then do;
							e = uniform(0); if e < e_decr_hard_reach_2020 then hard_reach = 0; 
						end; 
						end;

* decr_prob_loss_at_diag_2020; 
						decr_prob_loss_at_diag_2020 = 0;  
						if _u7 < 0.90 then do; 
							decr_prob_loss_at_diag_2020 = 1; 
							eff_prob_loss_at_diag = eff_prob_loss_at_diag  * _u8/3; eff_prob_loss_at_diag = round(eff_prob_loss_at_diag,0.001);
						end;

* decr_rate_lost_2020; 	decr_rate_lost_2020 = 0;  
						if _u9 < 0.90 then do; 
							decr_rate_lost_2020 = 1; 
							eff_rate_lost = eff_rate_lost * _u10 / 3; eff_rate_lost=round(eff_rate_lost,0.01); 
						end;

* decr_rate_lost_art_2020; 
						decr_rate_lost_art_2020 = 0;  
						if _u11 < 0.90 then do; 
							decr_rate_lost_art_2020 = 1; 
							eff_prob_lost_art = eff_prob_lost_art + ((0.5 + 0.5*_u12) * (1 - eff_prob_lost_art) ) ; eff_prob_lost_art = round(eff_prob_lost_art, 0.01); 
						end;

* incr_rate_return_2020; 
						incr_rate_return_2020 = 0;  
						if _u13 < 0.90 then do; 
							incr_rate_return_2020 = 1; 
							eff_rate_return = eff_rate_return * (2 + 3*_u14);  eff_rate_return = round(eff_rate_return,0.01);  
						end;

* incr_rate_restart_2020; 
						incr_rate_restart_2020 = 0;  
						if _u17 < 0.90 then do; 
							incr_rate_restart_2020 = 1; 
							eff_rate_restart = eff_rate_restart * (2 + 3*_u18);  eff_rate_restart = round(eff_rate_restart,0.01);  
						end;

* incr_rate_init_2020; 	incr_rate_init_2020 = 0;  
						if _u19 < 0.90 then do; 
							incr_rate_init_2020 = 1; 
							eff_pr_art_init = eff_pr_art_init + ( (0.5 + 0.5*_u20) * (1 - eff_pr_art_init) ); eff_pr_art_init=round(eff_pr_art_init,0.01); 
						end;

* reg_option_switch_2020;	
						reg_option_switch_2020 = 0;
						if _u49 < 0.30 then do; reg_option = 104; reg_option_switch_2020 = 104; end;
						if 0.30 <= _u49 < 0.6 then do; reg_option = 116; reg_option_switch_2020 = 116; end;
						if 0.60 <= _u49 < 0.9 then do; reg_option = 103; reg_option_switch_2020 = 119; end;

* art_mon_drug_levels_2020;
						art_mon_drug_levels_2020 = 0;
						if _u50 < 0.9 then do;
							art_mon_drug_levels_2020 = 1;
							if reg_option = 103 then reg_option = 119;
							if reg_option = 104 then reg_option = 118;
							if reg_option = 113 then reg_option = 115;
							if reg_option = 116 then reg_option = 117; 
						end;

* decr_rate_int_choice_2020; 
						decr_rate_int_choice_2020 = 0;  
						if _u21 < 0.90 then do; 
							decr_rate_int_choice_2020 = 1; 
							eff_rate_int_choice = eff_rate_int_choice * _u22/3; eff_rate_int_choice = round(eff_rate_int_choice,0.001); 
						end;

* incr_prob_vl_meas_done_2020; 
						incr_prob_vl_meas_done_2020 = 0;  
						if _u23 < 0.90 then do; 
							incr_prob_vl_meas_done_2020 = 1; 
							eff_prob_vl_meas_done = 0.85; 
							cd4_monitoring=0; * this needed because cd4_monitoring was = 1 in half of people with no vl; 
						end;

* ten_is_taf_2020;		ten_is_taf_2020 = 0;
						if _u51 < 0.1 then do;
						ten_is_taf_2020 = 1;
						end;

* incr_pr_switch_line_2020; 
						incr_pr_switch_line_2020 = 0;  
						if _u24 < 0.90 then do; 
							incr_pr_switch_line_2020 = 1; 
							eff_pr_switch_line = 0.80; 
						end;
		end;



* prep;			

if _u48 <= 1.0 then prep_improvements = 1;

* pop_wide_tld_2020;	pop_wide_tld_2020 = 0;
						if _u47 < 0.00 then do;  
							pop_wide_tld_2020 = 1; pop_wide_tld = 1; prep_strategy_2020 = 1; prep_strategy = 7;prob_prep_pop_wide_tld = 0.50; 
							decr_r_choose_stop_prep_2020 = 1; eff_rate_choose_stop_prep = 0.05 ; 
							inc_p_prep_restart_choi_2020 = 1; eff_prob_prep_restart_choice = 0.5 ;
							incr_adh_pattern_prep_2020 = 1; adhav_pr = adhav*1.00;
							incr_prepuptake_pop_2020 = 1; if _u37 < 0.8 and prep_willing_pop = 0 then prep_willing_pop = 1;
							incr_prepuptake_sw_2020 = 1; if _u35 < 0.95 and prep_willing_sw = 0 then prep_willing_sw = 1;
							prep_improvements = 0;  * this is instead of current type of prep program;
						end;

		if prep_improvements = 1 then do; * note line above prep_improvements = 0 if pop_wide_tld_2020 = 1;

* incr_adh_pattern_prep_2020;
						incr_adh_pattern_prep_2020 = 0;  
						if _u25 < 0.95 then do; 
							incr_adh_pattern_prep_2020 = 1; 
							adhav_pr = adhav*1.00; 
						end;		

* inc_r_test_startprep_2020;
						inc_r_test_startprep_2020 = 0;  if _u26 <= 0.95 then do; 
							inc_r_test_startprep_2020 = 1; 
							eff_rate_test_startprep = 0.9; 
							eff_rate_test_startprep = round(eff_rate_test_startprep, 0.01);
						end;		

* incr_r_test_restartprep_2020;
						incr_r_test_restartprep_2020 = 0;  
						if _u28 <= 0.95 then do; 
							incr_r_test_restartprep_2020 = 1; 
							eff_rate_test_restartprep = 0.9; 
							eff_rate_test_restartprep = round(eff_rate_test_restartprep, 0.01);
						end;		

* decr_r_choose_stop_prep_2020;
						decr_r_choose_stop_prep_2020 = 0;  
						if _u30 < 0.95 then do; 
							decr_r_choose_stop_prep_2020 = 1; 
							eff_rate_choose_stop_prep = 0.03 ; 
							eff_rate_choose_stop_prep = round(eff_rate_choose_stop_prep, 0.01);
						end;		

* inc_p_prep_restart_choi_2020;
						inc_p_prep_restart_choi_2020 = 0;  
						if _u32 < 0.95 then do; 
							inc_p_prep_restart_choi_2020 = 1; 
							eff_prob_prep_restart_choice = 0.8 ; 
							eff_prob_prep_restart_choice = round(eff_prob_prep_restart_choice, 0.01);
						end;		

* incr_prepuptake_sw_2020;
						incr_prepuptake_sw_2020 = 0;  
						if _u34 < 0.95 then do; incr_prepuptake_sw_2020 = 1; 
							r= uniform(0); if r < 0.95 and prep_willing_sw = 0 then prep_willing_sw = 1;
						end;		

* incr_prepuptake_pop_2020;
						incr_prepuptake_pop_2020 = 0;  
						if _u36 < 0.95 then do; 
							incr_prepuptake_pop_2020 = 1; 
							r= uniform(0); if r < 0.8 and prep_willing_pop = 0 then prep_willing_pop = 1;
						end;	

* prep_strategy_2020;
						prep_strategy_2020 = 0;  
						/*
						if _u38 < 0.33 then do;	prep_strategy_2020 = 1; prep_strategy = 7; end;
						if 0.33 <= _u38 < 0.67  then do;	prep_strategy_2020 = 1; prep_strategy = 1; end;
						if 0.67 <= _u38        then do;	prep_strategy_2020 = 1; prep_strategy = 8; end;
						*/
						prep_strategy = 7;
			end;





* circumcision;			if _u39 < 0.00 then circ_improvements = 1;
						if circ_improvements = 1 then do;
							if _u40 < 0.33 then circ_inc_rate_2020 = 1; if 0.33 <= _u40 < 0.67 then circ_inc_rate_2020 = 2; 
							if 0.67 <= _u40 then circ_inc_rate_2020 = 3;
						end;

* increase condom use - decrease in newp;
						condom_incr_2020 = 0;
						if _u41 < 0.00 then condom_incr_2020 = 1;


	end;
end;

* ==========================================================================================================================================;
