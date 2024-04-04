/***************************************************************************/
******************     Cote d'Ivoire SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* POPULATION GROWTH AND DEMOGRAPHY;
caldate1=1980;
caldate_never_dot=1980;
startyr = 1985 + 0.25;

* inc_cat; 					* inc_cat = 1 ;  

* circ_inc_rate; 			%sample(circ_inc_rate, 
								0.003	0.01	0.1, 
								0.1		0.50	0.40);

* prob_birth_circ; 			%sample(prob_birth_circ, 
									0.20	0.40,	 
									0.50	0.50	);

* base_rate_sw;				%sample(base_rate_sw, 0.0005 0.0010 0.0015, 0.3 0.3 0.4);

* sw_trans_matrix;   		%sample(sw_trans_matrix, 1 2 3 4, 0.10 0.40 0.10 0.40);

* HIV TESTING;

* an_lin_incr_test;         an_lin_incr_test = 0.00001;

* date_test_rate_plateau;   date_test_rate_plateau = 2013 ;

* test_targeting;			test_targeting = 0.4;
                          
* prob_loss_at_diag;  		%sample(prob_loss_at_diag, 
								0.02 	0.05 	0.15 	0.35 	0.50, 

								0.40 	0.30	0.25	0.04	0.01	); 

* adh_pattern; 				%sample(adh_pattern, 
								1		2		3		4		5		6		7, 
								0.01	0.20	0.03	0.05	0.30	0.01	0.40);
