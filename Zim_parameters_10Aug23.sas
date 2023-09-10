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


* HIV TESTING;

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
		%sample_uniform(rate_engage_sw_program, 0.10 0.20 0.30); 
		%sample_uniform(rate_disengage_sw_program, 0.01 0.03);

* date_sw_prog_intro;		date_sw_prog_intro=2010;
* sw_program;               %sample(sw_program, 0 1, 0.2 0.8);sw_program=1;***Discuss;

					            if sw_program = 1  then do; 
								%sample_uniform(rate_engage_sw_program, 0.10 0.20); 
								%sample_uniform(rate_disengage_sw_program, 0.02 0.05);
								end;

***Change these parameters as are assuming higher attendance than in core and Zim has Sisters program in place;
* effect_sw_prog_newp;      %sample_uniform(effect_sw_prog_newp,  0.05 0.10);
* effect_sw_prog_6mtest;    %sample_uniform(effect_sw_prog_6mtest, 0.20 0.35 0.50);
* effect_sw_prog_int;       %sample_uniform(effect_sw_prog_int, 0.30 0.50 0.70);
* effect_sw_prog_adh;       %sample_uniform(effect_sw_prog_adh, 0.10 0.15 0.25);
* effect_sw_prog_lossdiag;  %sample_uniform(effect_sw_prog_lossdiag, 0.30 0.50 0.70);
* effect_sw_prog_prep_any;  %sample_uniform(effect_sw_prog_prep_any, 0.50 0.75);
* effect_sw_prog_pers_sti;  %sample_uniform(effect_sw_prog_pers_sti, 0.50 0.75);

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


***Higher circ post 2015 - adding this here as if we increase the above, we will miss the DHS data point in 2015 on circ prev;
* rel_incr_circ_post_2015;	%sample(rel_incr_circ_post_2015, 
								7		8		9, 
								0.35	0.5		0.20);


***Too many people on PrEP;

* rate_test_startprep_any; 		%sample_uniform(rate_test_startprep_any, 0.10 0.15  0.30);

* prob_prep_oral_b;				%sample_uniform(prob_prep_oral_b, 0.05 0.1);

* pref_prep_oral_beta_s1;		%sample_uniform(pref_prep_oral_beta_s1, 0.6 0.7 0.8 0.9 1.0 1.1) ;

* rate_choose_stop_prep_oral; 	%sample_uniform(rate_choose_stop_prep_oral, 0.10 0.20 0.30);


