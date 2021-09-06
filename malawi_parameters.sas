/***************************************************************************/
******************     MALAWI SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* POPULATION GROWTH AND DEMOGRAPHY;

* inc_cat; 					 inc_cat = 1 ;  

* SEXUAL BEHAVIOUR;

* ych_risk_beh_newp;        %sample(ych_risk_beh_newp, 0.5 0.6 0.7 , 0.4 0.3 0.3); 
* ych_risk_beh_ep;          %sample_uniform(ych_risk_beh_ep, 0.8 0.9 0.95);
* p_rred_p;                 %sample_uniform(p_rred_p, 0.4 0.5 0.6);
* p_hsb_p;                  %sample(p_hsb_p, 0.05 0.08 0.15 0.25, 0.25 0.25 0.25  0.25);
* newp_factor;              %sample_uniform(newp_factor, 1 2 3 5 ); 

* ych2_risk_beh_newp;       %sample(ych2_risk_beh_newp,
                                0.95    0.99    1   ,
                                0.3     0.3     4   );

* HIV TESTING;

* date_start_testing;       date_start_testing = 2005  ;

* an_lin_incr_test;         %sample(an_lin_incr_test,
                                        0.0100 0.015  0.0200  ,
                                        0.50   0.50    0.00    );

* date_test_rate_plateau;   date_test_rate_plateau = 2019 ;
                          

* NATURAL PROGRESSION AND RISK OF HIV RELATED CONDITIONS;

* LINKAGE, RETENTION, MONITORING, LOSS, RETURN, INTERRUPTION OF ART AND RESTARTING, ART;

rate_ch_art_init_str_9 = 0.1 ;

* adh_pattern;              %sample(adh_pattern,
                                1       2       3       4       5     ,
                                0.05    0.55    0.20    0.10    0.10  );

* SEX WORKERS;				

* CIRCUMCISION;

* circ_inc_rate;            circ_inc_rate = 0.001; 

* prob_birth_circ;          prob_birth_circ = 0.2 ; 




