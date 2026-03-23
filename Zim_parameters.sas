/***************************************************************************/
******************     ZIMBABWE SPECIFIC PARAMETERS    ******************
/***************************************************************************/

* country;					country='Zimbabwe';
* caldate1;					caldate1 = 1984;		*core: 1989;
* caldate_never_dot;		caldate_never_dot=1984;	*core: 1989;

* INTRODUCTION OF HIV;
* startyr;					startyr = 1991 + 0.25;

* HIV TESTING;

* date_start_testing;       date_start_testing = 2005  ;
* test_targeting;   		%sample(test_targeting, 1 1.1 1.3, 0.7 0.2 0.1);*Vale - 20220105;
* an_lin_incr_test;         %sample(an_lin_incr_test, 	
								0.005 0.01 0.015, 
								0.6    0.3   0.1);*Vale - 20220105;
* date_test_rate_plateau;   date_test_rate_plateau = 2019 ;
* fold_rate_decr_test_future;*%sample_uniform(fold_rate_decr_test_future, 0.25 0.33 0.5 0.75);*same as core;

* rate_anc_inc; 			%sample_uniform(rate_anc_inc, 0.025 0.03 0.035); 
* prob_test_2ndtrim;		%sample_uniform(prob_test_2ndtrim, 0.7 0.75 0.8 0.85 0.0 0.95 1.00);
* prob_test_postdel;		%sample_uniform(prob_test_postdel, 0.25 0.5 0.75);

* NATURAL PROGRESSION AND RISK OF HIV RELATED CONDITIONS;
*Vale - 20211026: all the changes in the section "NATURAL PROGRESSION...." are taken from SA;
* fold_change_in_risk_base_rate;
							%sample_uniform(fold_change_in_risk_base_rate, 0.85 1.0); *Vale - 20211123;
							* it is 0.85 rather than 1 in south africa parameter sets, and 1 in Malawi as there is no evidence
							that this lower rate holds in malawi ;
* fold_decr_hivdeath;		fold_decr_hivdeath = 0.15 ; * this value was used in south africa in order to have model reflect observed death rates;  		
* fx;						fx = 0.8 ; *Vale - 20211123, as in SA, 0.85 in Malawi;
							* this value was used in south africa in order to have model reflect observed death rates; 



* LINKAGE, RETENTION, MONITORING, LOSS, RETURN, INTERRUPTION OF ART AND RESTARTING, ART;
rate_ch_art_init_str_9 = 0.1 ;

* adh_pattern;              %sample(adh_pattern,
                                1       2       3       4       5     ,
                                0.05    0.55    0.20    0.10    0.10  );
* rate_int_choice;  		%sample_uniform(rate_int_choice, 0.0020 0.0030 0.0040);*Vale - 20220105;


* SEX WORKERS;	
* Based on calibraton to AMETHIST and Sisters data;
* base_rate_sw;				%sample_uniform(base_rate_sw, 0.0010 0.0015 0.0020);
* base_rate_stop_sexwork ;	%sample(base_rate_stop_sexwork, 0.005 0.010 0.015, 0.40 0.40 0.20);

* rr_sw_age_1519;			rr_sw_age_1519 = 0.60;
* rr_sw_age_3549;			rr_sw_age_3549 = 0.50;

* age_effect_stop_sexwork;	age_effect_stop_sexwork=1.5;*22% over 40 in AMETHIST, core modelled estimates are 10%;

* sw_trans_matrix;   		%sample(sw_trans_matrix, 1 2 3, 0.10 0.80 0.10);

* rate_engage_sw_program;	%sample_uniform(rate_engage_sw_program, 0.10 0.20 0.30); 
* rate_disengage_sw_program;%sample_uniform(rate_disengage_sw_program, 0.01 0.03);

* CIRCUMCISION;

* circ_inc_rate;           	%sample(circ_inc_rate, 0.0001 0.001	0.002, 								 
						   						   0.25	  0.5 	0.25);
* prob_birth_circ;          %sample(prob_birth_circ, 
							0.05 0.1 0.15,
							0.25 0.5 0.25); *Vale - 20211026;

*abs_decr_birth_circ;		%sample(abs_decr_birth_circ, 
							0 		0.002 	0.004,
							0.20 	0.20	0.60 );

* rel_incr_circ_post_2013;	%sample(rel_incr_circ_post_2013, 
								2		3		4, 
								0.25	0.5		0.25); *Vale - 20230823;
* rel_incr_circ_post_2023;	%sample(rel_incr_circ_post_2023, 
								2		3		4, 
								0.25	0.5		0.25); *Vale - 20231010;


***Too many people on PrEP;

* pref_prep_oral_beta_s1;		%sample_uniform(pref_prep_oral_beta_s1, 0.6 0.7 0.8 0.9 1.0 1.1) ;

* rate_choose_stop_prep_oral; 	%sample_uniform(rate_choose_stop_prep_oral, 0.20 0.30 0.40);

