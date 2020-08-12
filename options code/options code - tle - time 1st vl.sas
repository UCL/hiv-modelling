
* ==========================================================================================================================================;

* code in this section can differ from unified program to some extent, due to specifying exactly what interventions / changes are running; 

* this means continue with tle for art initiators;
if caldate{t} ge 2019.5 then reg_option = .;

if caldate{t} ge 2020.5 then eff_prob_vl_meas_done = 1;

* INTERVENTIONS / CHANGES in 2020;

option = &s;

* AP 20-7_19 ;
if caldate_never_dot = 2020.50 then do;
* we need to use caldate_never_dot so that the parameter value is given to everyone in the data set - we use the value for serial_no = 100000
who may be dead and hence have caldate{t} missing;

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
		expand_prep_to_all_2020 = 0 ;
		circ_improvements = 0;
		circ_inc_rate_2020 = 0;
		condom_incr_2020 = 0;
		pop_wide_tld = 0;
		single_vl_switch_efa_2020 = 0;

	if option = 0 then do;  

	end; 

	if option = 1 then do;

	time_of_first_vm_2020 = 0.25;
	min_time_repeat_vm_2020 = 0.25;

	end;
end;

if caldate{t} ge 2020 then time_of_first_vm = time_of_first_vm_2020;
if caldate{t} ge 2020 then min_time_repeat_vm = min_time_repeat_vm_2020;

* ==========================================================================================================================================;
