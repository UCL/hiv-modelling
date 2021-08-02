/***************************************************************************/
******************     SOUTH AFRICA SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* POPULATION GROWTH AND DEMOGRAPHY;
* inc_cat; 					inc_cat = 4;
* fold_change_ac_death_rate; fold_change_ac_death_rate = 0.3 ;


* SEXUAL BEHAVIOUR;
* ych_risk_beh_newp;  		%sample_uniform(ych_risk_beh_newp,     1);
* ych_risk_beh_ep;  		%sample_uniform(ych_risk_beh_ep,     1);
* p_rred_p; 				%sample(p_rred_p, 0.3 0.5 0.7, 0.7 0.3 0.0);
* p_hsb_p; 					%sample(p_hsb_p, 0.05 0.08 0.15, 0.1 0.3 0.6 );

* sex_age_mixing_matrix_m;	%sample(sex_age_mixing_matrix_m, 1 2 3 4 5 6 , 0.1 0.1 0.1 0.1 0.1 0.5);
* sex_age_mixing_matrix_w;	%sample(sex_age_mixing_matrix_w, 1 2 3 4 5 6 , 0.3 0.3 0.1 0.1 0.1 0.1);


* TRANSMISSION;

* fold_tr;					fold_tr = 1;
* fold_tr_newp;				%sample(fold_tr_newp, 0.3 0.4 0.5, 0.2 0.6 0.2);


* HIV TESTING;

* an_lin_incr_test;   		%sample(an_lin_incr_test, 
								0.0001	0.0005 	0.0030 	0.0700 	0.0200 	0.0400 	0.1000, 
								0.0		0.0 	0.75	0.25	0.0 	0.00	0.00);
* date_test_rate_plateau;   date_test_rate_plateau= 2020.5;


* NATURAL PROGRESSION AND RISK OF HIV RELATED CONDITIONS;

* fold_decr_hivdeath;		fold_decr_hivdeath = 1.00 ; 	* degree to which hiv death rate is lower than aids rate;

* fx;						%sample_uniform(fx, 1.00 1/0.85 1/0.70);

* gx;						%sample(gx, 1.0 1.5 2.0, 0.05 0.1 0.85);

* LINKAGE, RETENTION, MONITORING, LOSS, RETURN, INTERRUPTION OF ART AND RESTARTING, ART;

* prob_loss_at_diag;  		%sample(prob_loss_at_diag, 
								0.02 	0.05 	0.20 	0.35 	0.50	0.80, 
								0.00	0.00	0.5 	0.5		0.0 	0.0);
* rate_return;  			%sample(rate_return, 
								0.01	0.10  0.2   0.3		0.50 , 
								0.00 	0.2   0.6   0.2 	0.00 );
* rate_int_choice;  		%sample(rate_int_choice,  0.02  0.03, 0.8 0.2 ); 					
* prob_vl_meas_done; 		%sample(prob_vl_meas_done, 
								0.0		0.1		0.7		1,
								0.00	0.00	0.50	0.50);
* rate_ch_art_init_str;	
							rate_ch_art_init_str_4 = 0.4;rate_ch_art_init_str_9 = 0.0;rate_ch_art_init_str_10 = 0.1 ; rate_ch_art_init_str_3 = 0.1;	

* adh_pattern; 				%sample(adh_pattern, 
								1		2		3		4		5		6		7, 
								0.00	0.00	0.00	1.00	0.00	0.00	0.00);

* SEX WORKERS;				
* base_rate_sw; 			%sample(base_rate_sw, 0.0010  0.0015  0.0020 0.0025, 0.7 0.2 0.1 0.0);


* CIRCUMCISION;
* prob_birth_circ; 			%sample(prob_birth_circ, 
								0.1 	0.2		0.39	0.5, 
								0.0 	0.0 	1.0 	0.0 );	




