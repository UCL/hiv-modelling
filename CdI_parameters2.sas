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

				0.0015

* HIV TESTING;

* an_lin_incr_test;         an_lin_incr_test = 0.00005;

* date_test_rate_plateau;   date_test_rate_plateau = 2015 ;

* test_targeting;			test_targeting = 0.7;
                          
