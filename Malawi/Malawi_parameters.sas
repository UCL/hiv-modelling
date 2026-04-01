/***************************************************************************/
******************     MALAWI SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* country;					country='Malawi';
* caldate1;					caldate1 = 1984;		*core: 1989;
* caldate_never_dot;		caldate_never_dot=1984;	*core: 1989;

* SEXUAL BEHAVIOUR;

/** ych_risk_beh_newp;        %sample(ych_risk_beh_newp, 0.5 0.6 0.7 , 0.4 0.3 0.3); */
/** ych_risk_beh_ep;          %sample_uniform(ych_risk_beh_ep, 0.8 0.9 0.95);*/
/** p_rred_p;                 %sample_uniform(p_rred_p, 0.4 0.5 0.6);*/
/** p_hsb_p;                  %sample(p_hsb_p, 0.05 0.08 0.15 0.25, 0.25 0.25 0.25  0.25);*/
/** newp_factor;              %sample_uniform(newp_factor, 1 2 3 5 ); */
/**/
/** ych2_risk_beh_newp;       %sample(ych2_risk_beh_newp,*/
/*                                0.95    0.99    1   ,*/
/*                                0.3     0.3     0.4   );*/

* HIV TESTING;

* date_start_testing;       date_start_testing = 2005  ;


* test_targeting;   		%sample(test_targeting, 1 1.25 1.5, 0.3 0.4 0.3); 

* an_lin_incr_test;         %sample(an_lin_incr_test,
                                  0.002    0.003   0.005  0.01,
                                  0.10      0.25   0.35   0.30	);


* date_test_rate_plateau;   date_test_rate_plateau = 2019 ;
                          


* NATURAL PROGRESSION AND RISK OF HIV RELATED CONDITIONS;

* fold_change_in_risk_base_rate;
							* fold_change_in_risk_base_rate = 0.85; * it is 0.85 rather than 1 in south africa parameter sets but not evidence
							that this lower rate holds in malawi ;

* fold_decr_hivdeath;		fold_decr_hivdeath = 0.15 ; * this value was used in south africa in order to have model reflect observed death rates;  	

* fx;						fx = 0.85;  * this value was used in south africa in order to have model reflect observed death rates; 



* LINKAGE, RETENTION, MONITORING, LOSS, RETURN, INTERRUPTION OF ART AND RESTARTING, ART;

prob_loss_at_diag = 0.05;  

reg_option_104 = 1;

rate_ch_art_init_str_9 = 0.1 ;

rate_int_choice = 0.003;  

* SEX WORKERS;				

* CIRCUMCISION;

* rel_incr_circ_post_2023;	%sample(rel_incr_circ_post_2023, 
								2		3		4, 
								0.25	0.5		0.25); *Vale - 20231010;

* circ_inc_rate;            circ_inc_rate = 0.001; 

* prob_birth_circ;          prob_birth_circ = 0.2 ; 


***LBM Feb 2026- too many people on PrEP;

* prep_any_strategy;			*%sample_uniform(prep_any_strategy, 1 3);

***Too many people on PrEP;

* rate_test_startprep_any; 		%sample_uniform(rate_test_startprep_any, 0.05 0.10 0.15);

* prob_prep_oral_b;				%sample_uniform(prob_prep_oral_b, 0.05 0.1);

* pref_prep_oral_beta_s1;		%sample_uniform(pref_prep_oral_beta_s1, 0.6 0.7 0.8 0.9 1.0 1.1) ;

* rate_choose_stop_prep_oral; 	%sample_uniform(rate_choose_stop_prep_oral, 0.10 0.20 0.30);

