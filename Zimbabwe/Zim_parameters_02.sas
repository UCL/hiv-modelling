/***************************************************************************/
******************     ZIMBABWE SPECIFIC PARAMETERS    ******************
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

* p_hard_reach_w;  			p_hard_reach_w=0.05+(rand('uniform')*0.10); p_hard_reach_w = round(p_hard_reach_w, 0.01);
* hard_reach_higher_in_men; hard_reach_higher_in_men = 0.00 + (rand('uniform')*0.10); hard_reach_higher_in_men = round(hard_reach_higher_in_men,0.01);
* p_hard_reach_m;			p_hard_reach_m = p_hard_reach_w + hard_reach_higher_in_men;

* HIV TESTING;



* rate_testanc_inc; 		%sample_uniform(rate_testanc_inc, 0.03 0.05 0.10);	* jul18;

* date_start_testing;       date_start_testing = 2005  ;
* test_targeting;   		*%sample(test_targeting, 1.1 1.3  1.5, 0.4 0.4 0.2); *Vale - 20211026, not specific to Zim before;
							 *%sample(test_targeting, 1   1.25 1.5, 0.6 0.3 0.1); *Vale - 20211123;
							 %sample(test_targeting, 1 1.1 1.3, 0.7 0.2 0.1);*Vale - 20220105;
* an_lin_incr_test;         *%sample(an_lin_incr_test,
                                        0.0100 0.015  0.0200  ,
                                        0.50   0.50    0.00    );
							*%sample(an_lin_incr_test,
                                        0.0100 0.015  0.0200  ,
                                        0.70   0.30    0.00    );
							%sample(an_lin_incr_test, 
								0.005 0.01 0.015, 
								0.6    0.3   0.1);*Vale - 20220105;
* date_test_rate_plateau;   date_test_rate_plateau = 2019 ;
* fold_rate_decr_test_future;*%sample_uniform(fold_rate_decr_test_future, 0.1 0.2 0.33);
							 %sample_uniform(fold_rate_decr_test_future, 0.25 0.33 0.5);


* NATURAL PROGRESSION AND RISK OF HIV RELATED CONDITIONS;
*Vale - 20211026: all the changes in the section "NATURAL PROGRESSION...." are taken from SA;
* fold_change_in_risk_base_rate;
							*%sample_uniform(fold_change_in_risk_base_rate, 0.7 0.8 0.9);
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
* base_rate_sw; 			*%sample(base_rate_sw, 0.0015 0.0020 0.0025, 0.2 0.2 0.6);*Vale - 20211026, not specific to Zim before;
																					  *Vale - 20211123, removed;	
* base_rate_stop_sexwork;	*%sample_uniform(base_rate_stop_sexwork, 0.015 0.030 0.045);*Vale - 20211026, not specific to Zim before;
																					  *Vale - 20211123, removed;	


* CIRCUMCISION;

* circ_inc_rate;            *circ_inc_rate = 0.001; 
							*%sample(circ_inc_rate,		
							0.001	0.003	0.01	0.1, 
				  	   		0.1		0.6		0.2		0.1);*Vale - 20211026;
							*%sample(circ_inc_rate,        0.001 0.002 0.003, 
                                 				          0.25  0.5   0.25);*Vale - 20211104;
							%sample(circ_inc_rate, 0.0001 0.001	0.002, 								 
						   						   0.25	  0.5 	0.25);
* prob_birth_circ;          *prob_birth_circ = 0.2 ; 
							%sample(prob_birth_circ, 
							0.05 0.1 0.15,
							0.25 0.5 0.25); *Vale - 20211026;

* rel_incr_circ_post_2013;	*%sample(rel_incr_circ_post_2013, 
								0.8		1		3		7, 
								0.10	0.25	0.25	0.40);
							*if circ_inc_rate=0.1 then rel_incr_circ_post_2013=min(rel_incr_circ_post_2013, 1);
							*%sample(rel_incr_circ_post_2013, 
								1		3		5, 
								0.25	0.5		0.25);
							%sample(rel_incr_circ_post_2013, 
								4		5		6, 
								0.25	0.5		0.25);
						
