

* ==========================================================================================================================================;

* code in this section can differ from unified program to some extent, due to specifying exactly what interventions / changes are running; 

* INTERVENTIONS / CHANGES in 2020;

option = &s;

* AP 20-7_19 ;
if caldate_never_dot = 2020.25 then do;
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

	if option = 0 then do;  end; 

	if option = 1 then do;

*

vmmc stopped (vmmc_disrup_covid)
condom availability stopped resulting in increase in newp (condom_disrup_covid)
prep stopped (prep_disrup_covid)
sex worker program stopped (swprog_disrup_covid)
all hiv testing stopped (testing_disrup_covid) 
all art use switched to tld (art_tld_disrup_covid)
every other day tld (art_tld_eod_disrup_covid)
all art initiations stopped (art_init_disrup_covid)
viral load  testing, enhanced adherence counselling and switches stopped (vl_adh_switch_disrup_covid)
all co-trimoxazole stopped (cotrim_disrup_covid)
increase in death rate for people with adc or tb (inc_death_rate_aids_disrup_covid)
all art stopped (no_art_disrup_covid)
	
;
		vmmc_disrup_covid = 0 ; if _u43 < 0.5 then vmmc_disrup_covid = 1 ;
		condom_disrup_covid = 0; if _u44 < 0.5 then condom_disrup_covid = 1 ;
  		prep_disrup_covid = 0; if _u45 < 0.5 then prep_disrup_covid = 1 ;
		swprog_disrup_covid = 0; if _u46 < 0.5 then swprog_disrup_covid = 1 ;   
		testing_disrup_covid = 0; if _u47 < 0.5 then testing_disrup_covid = 1 ;
		art_tld_disrup_covid = 0; if _u48 < 0.5 then art_tld_disrup_covid = 1 ;
		art_tld_eod_disrup_covid = 0; if _u49 < 0.5 then art_tld_eod_disrup_covid = 1 ;
		art_init_disrup_covid = 0; if _u50 < 0.5 then art_init_disrup_covid = 1 ;
		vl_adh_switch_disrup_covid = 0; if _u51 < 0.5 then vl_adh_switch_disrup_covid = 1 ;
		cotrim_disrup_covid = 0; if _u52 < 0.5 then cotrim_disrup_covid = 1 ;
		inc_death_rate_aids_disrup_covid = 0; if _u53 < 0.5 then inc_death_rate_aids_disrup_covid = 1 ;
		no_art_disrup_covid = 0; if _u54 < 0.5 then no_art_disrup_covid = 1 ;
		art_low_adh_disrup_covid = 0; if _u55 < 0.5 then art_low_adh_disrup_covid = 1 ;

	end;

end;

* ==========================================================================================================================================;
