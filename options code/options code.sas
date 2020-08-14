

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

		prep_strategy_2020 = 1; prep_strategy = 8;  
		decr_r_choose_stop_prep_2020 = 1; eff_rate_choose_stop_prep = 0.05 ; 
		inc_p_prep_restart_choi_2020 = 1; eff_prob_prep_restart_choice = 0.5 ;
		incr_adh_pattern_prep_2020 = 1; adhav_pr = adhav*1.00;
		incr_prepuptake_pop_2020 = 1; if _u37 < 0.8 and prep_willing_pop = 0 then prep_willing_pop = 1;
		incr_prepuptake_sw_2020 = 1; if _u35 < 0.95 and prep_willing_sw = 0 then prep_willing_sw = 1;

	end;


	if option = 2 then do;

		pop_wide_tld_2020 = 1; pop_wide_tld = 1; prep_strategy_2020 = 1; prep_strategy = 7;prob_prep_pop_wide_tld = 0.50; 
		decr_r_choose_stop_prep_2020 = 1; eff_rate_choose_stop_prep = 0.05 ; 
		inc_p_prep_restart_choi_2020 = 1; eff_prob_prep_restart_choice = 0.5 ;
		incr_adh_pattern_prep_2020 = 1; adhav_pr = adhav*1.00;
		incr_prepuptake_pop_2020 = 1; if _u37 < 0.8 and prep_willing_pop = 0 then prep_willing_pop = 1;
		incr_prepuptake_sw_2020 = 1; if _u35 < 0.95 and prep_willing_sw = 0 then prep_willing_sw = 1;

	end;


end;

* ==========================================================================================================================================;
