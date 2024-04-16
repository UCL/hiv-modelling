/***************************************************************************/
******************     KENYA SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* POPULATION GROWTH AND DEMOGRAPHY;

* inc_cat; 					inc_cat = 1 ;  

* circ_inc_rate; 			circ_inc_rate = 0.02;  

* prob_birth_circ; 			prob_birth_circ = 0.70 ; 
				

* HIV TESTING;

* an_lin_incr_test;         an_lin_incr_test = 0.005;

* date_test_rate_plateau;   date_test_rate_plateau = 2015 ;

* test_targeting;			test_targeting = 1  ;
                          
* p_hard_reach_w;  			p_hard_reach_w = 0.2; p_hard_reach_w = round(p_hard_reach_w, 0.01);
* hard_reach_higher_in_men; hard_reach_higher_in_men = 0.1 ; hard_reach_higher_in_men = round(hard_reach_higher_in_men,0.01);
* p_hard_reach_m;			p_hard_reach_m = p_hard_reach_w + hard_reach_higher_in_men;


* DEATH;

* fold_change_ac_death_rate;fold_change_ac_death_rate_w = 2  ; fold_change_ac_death_rate_m = 2  ; 

* fold_decr_hivdeath;		fold_decr_hivdeath = 0.35;



* SEX WORKERS;

* sw_art_disadv;           	sw_art_disadv = 1;
						   	sw_higher_int = 3;
						   	rel_sw_lower_adh = 0.8 ;
							sw_higher_prob_loss_at_diag = 3;

* date_sw_prog_intro;		date_sw_prog_intro=2090;
