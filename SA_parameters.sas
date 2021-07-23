/***************************************************************************/
******************     SOUTH AFRICA SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* POPULATION GROWTH AND DEMOGRAPHY;
* inc_cat; 					inc_cat = 4;


* SEXUAL BEHAVIOUR;
* ych_risk_beh_newp;  		ych_risk_beh_newp = 1;
* ych_risk_beh_ep;  		ych_risk_beh_ep=1;
* p_rred_p; 				%sample(p_rred_p, 0.3 0.5 0.7, 0.5 0.3 0.2);
* p_hsb_p; 					%sample(p_hsb_p, 0.05 0.08 0.15, 0.1 0.45 0.45);


* HIV TESTING;
* date_test_rate_plateau;   %sample(date_test_rate_plateau, 
								2011.5 	2013.5 	2015.5 	2017.5 	2019.5, 
								0.0 	0.0 	0.0 	1.0 	0.0);


* LINKAGE, RETENTION, MONITORING, LOSS, RETURN, INTERRUPTION OF ART AND RESTARTING, ART;
* rate_ch_art_init_str;		rate_ch_art_init_str = 0.1;
* prob_loss_at_diag;  		%sample(prob_loss_at_diag, 
								0.02 	0.05 	0.20 	0.35 	0.50	0.80, 
								0.00	0.00	0.1 	0.4		0.40	0.1);
* rate_return;  			%sample(rate_return, 
								0.01	0.10   0.3 		0.50 , 
								0.10 	0.40   0.25 	0.25 );
* rate_int_choice;  		%sample_uniform(rate_int_choice, 0.01  0.02  0.05 ); 					
* prob_vl_meas_done; 		%sample(prob_vl_meas_done, 
								0.0		0.1		0.7		1,
								0.00	0.00	0.50	0.50);


* SEX WORKERS;				
* base_rate_sw; 			%sample(base_rate_sw, 0.0010  0.0015  0.0020 0.0025, 0.7 0.2 0.1 0.0);


* CIRCUMCISION;
* prob_birth_circ; 			%sample(prob_birth_circ, 
								0.1 	0.2		0.3 	0.5, 
								0.2 	0.3 	0.3 	0.2 );	
