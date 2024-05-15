/***************************************************************************/
******************     Cote d'Ivoire SPECIFIC PARAMETERS    ******************
/***************************************************************************/

***Turn off options code;

***USE WITH THE 16 APR FILE WHICH HAS THE 2.2 PROP DIAG RATE FOR MEN;

* POPULATION GROWTH AND DEMOGRAPHY;
caldate1=1980;
caldate_never_dot=1980;
startyr = 1985 + 0.25;

* inc_cat; 					inc_cat = 1 ;  

* circ_inc_rate; 			%sample(circ_inc_rate, 
								0.003	0.01	0.1, 
								0.1		0.50	0.40);

* prob_birth_circ; 			%sample(prob_birth_circ, 
									0.20	0.40,  
									0.75	0.25	);

* base_rate_sw;				%sample(base_rate_sw, 0.0005 0.0010 0.0015, 0.15 0.40 0.45);

* sw_trans_matrix;   		%sample(sw_trans_matrix, 1 2 3 4, 0.01 0.39 0.01 0.59);

* HIV TESTING;

* an_lin_incr_test;         an_lin_incr_test = 0.00001;

* date_test_rate_plateau;   date_test_rate_plateau = 2013 ;

* test_targeting;			test_targeting = 1;***NP since last test has no impact on testing rates;
 
* rate_anc_inc; 		%sample_uniform(rate_anc_inc, 0.005 0.01 0.03);

* incr_test_rate_sympt; 	%sample_uniform(incr_test_rate_sympt, 1.05 1.10 1.15);

* rr_testing_female;		rr_testing_female=1.0;


* prob_loss_at_diag;  		%sample(prob_loss_at_diag, 
								0.02 	0.05 	0.15 	0.35 	0.50, 

								0.30 	0.30	0.30	0.05	0.05	); 
***PROB_LOSS_AT_DIAG IS MULTIPLIED BY 2.2 IN THE MAIN PROGRAM FOR MEN;

* rate_int_choice;  		%sample(rate_int_choice, 	0.005 0.01 0.05, 
														0.30 0.40 0.30);

* adh_pattern; 				%sample(adh_pattern, 
								1		2		3		4		5		6		7, 
								0.0 	0.0	    0.0	   0.05	    0.30	0.30	0.35);

