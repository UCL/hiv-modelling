

* ==========================================================================================================================================;

* SECTION 3 - OPTIONS ;

* code in this section can differ from unified program to some extent, due to specifying exactly what interventions / changes are running; 
* I suggest that we just leave this shell in the core program as we are not running beyond 2020.50 ;

* INTERVENTIONS / CHANGES in 2020;

option = &s;


if caldate_never_dot = 2021.50 then do;
* we need to use caldate_never_dot so that the parameter value is given to everyone in the data set - we use the value for serial_no = 100000
who may be dead and hence have caldate{t} missing;

* can add in potential changes in policy after 2020.5 here -  set specific '2020' variables to '1' and specify proportion of
  runs for which the option should take place;
	/*E.g. u=uniform(0); if u<0.90 then incr_test_2020=1;*/


	if option = 0 then do;  

	end; 

	if option = 1 then do;

	if _u40 < 0.20 then 	eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.00) ; 
	if 0.20 <= _u40 < 0.40 then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.25) ; 
	if 0.40 <= _u40 < 0.60 then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.50) ; 
	if 0.60 <= _u40 < 0.80 then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.75) ; 
	if 0.80 <= _u40        then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 1.00) ; 

	if _u41 < 0.20 then 	eff_rate_lost = eff_rate_lost / 1 ; 
	if 0.20 <= _u41 < 0.40 then eff_rate_lost = eff_rate_lost / 1.5 ;
	if 0.40 <= _u41 < 0.60 then eff_rate_lost = eff_rate_lost / 2.0 ;
	if 0.60 <= _u41 < 0.80 then eff_rate_lost = eff_rate_lost / 5.0 ;
	if 0.80 <= _u41        then eff_rate_lost = eff_rate_lost / 10.0 ;

	if _u43 < 0.20 then 	eff_prob_lost_art = eff_prob_lost_art / 1 ; 
	if 0.20 <= _u43 < 0.40 then eff_prob_lost_art = eff_prob_lost_art / 1.5 ;
	if 0.40 <= _u43 < 0.60 then eff_prob_lost_art = eff_prob_lost_art / 2.0 ;
	if 0.60 <= _u43 < 0.80 then eff_prob_lost_art = eff_prob_lost_art / 5.0 ;
	if 0.80 <= _u43        then eff_prob_lost_art = eff_prob_lost_art / 10.0 ;

	if _u44 < 0.20 then 	eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.00) ; 
	if 0.20 <= _u44 < 0.40 then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.25) ; 
	if 0.40 <= _u44 < 0.60 then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.50) ; 
	if 0.60 <= _u44 < 0.80 then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 0.75) ; 
	if 0.80 <= _u44        then eff_rate_restart = eff_rate_restart + ((1 - eff_rate_restart) * 1.00) ; 

	if _u45 < 0.20 then 	eff_rate_int_choice = eff_rate_int_choice / 1 ; 
	if 0.20 <= _u45 < 0.40 then eff_rate_int_choice = eff_rate_int_choice / 1.5 ;
	if 0.40 <= _u45 < 0.60 then eff_rate_int_choice = eff_rate_int_choice / 2.0 ;
	if 0.60 <= _u45 < 0.80 then eff_rate_int_choice = eff_rate_int_choice / 5.0 ;
	if 0.80 <= _u45        then eff_rate_int_choice = eff_rate_int_choice / 10.0 ;

	if _u46 < 0.20 then 	eff_prob_return_adc = eff_prob_return_adc + ((1 - eff_prob_return_adc) * 0.00) ; 
	if 0.20 <= _u46 < 0.40 then eff_prob_return_adc = eff_prob_return_adc + ((1 - eff_prob_return_adc) * 0.25) ; 
	if 0.40 <= _u46 < 0.60 then eff_prob_return_adc = eff_prob_return_adc + ((1 - eff_prob_return_adc) * 0.50) ; 
	if 0.60 <= _u46 < 0.80 then eff_prob_return_adc = eff_prob_return_adc + ((1 - eff_prob_return_adc) * 0.75) ; 
	if 0.80 <= _u46        then eff_prob_return_adc = eff_prob_return_adc + ((1 - eff_prob_return_adc) * 1.00) ; 

	end;
end;

* ==========================================================================================================================================;
