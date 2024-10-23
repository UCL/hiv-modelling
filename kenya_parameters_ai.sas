/***************************************************************************/
******************     KENYA SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* POPULATION GROWTH AND DEMOGRAPHY;

* inc_cat; 					inc_cat = 1 ;  

* circ_inc_rate; 			circ_inc_rate = 0.02;  

* prob_birth_circ; 			prob_birth_circ = 0.70 ; 
				

* SEXUAL BEHVIOUR;

* ych2_risk_beh_newp;  		ych2_risk_beh_newp = 1; 


* HIV TESTING;

* an_lin_incr_test;         an_lin_incr_test = 0.006;

* date_test_rate_plateau;   date_test_rate_plateau = 2015 ;

* test_targeting;			test_targeting = 1  ;
                          
* p_hard_reach_w;  			p_hard_reach_w = 0.2; p_hard_reach_w = round(p_hard_reach_w, 0.01);
* hard_reach_higher_in_men; hard_reach_higher_in_men = 0.1 ; hard_reach_higher_in_men = round(hard_reach_higher_in_men,0.01);
* p_hard_reach_m;			p_hard_reach_m = p_hard_reach_w + hard_reach_higher_in_men;


* HIV SELF_TESTING;

* prob_self_test_hard_reach;prob_self_test_hard_reach = 0.05;
* self_test_targeting;		self_test_targeting = 1.5;
* rate_self_test;			rate_self_test = 0.015;
* date_self_testing_intro;	date_self_testing_intro = 2018;


* PrEP;

* prep_any_strategy;		prep_any_strategy=17;
* rate_test_startprep_any; 	rate_test_startprep_any = 0.1;
* prob_prep_oral_b;			prob_prep_oral_b = 0.05;


* DEATH;

* fold_change_ac_death_rate;fold_change_ac_death_rate_w = 2  ; fold_change_ac_death_rate_m = 2  ; 

* fold_decr_hivdeath;		fold_decr_hivdeath = 0.35;



* SEX WORKERS;

* sw_art_disadv;           	sw_art_disadv = 1;
						   	sw_higher_int = 5;
						   	rel_sw_lower_adh = 0.8 ;
							sw_higher_prob_loss_at_diag = 5;

* date_sw_prog_intro;		date_sw_prog_intro=2090;
