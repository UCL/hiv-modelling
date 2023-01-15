/***************************************************************************/
******************     SOUTH AFRICA SPECIFIC PARAMETERS    ******************
/***************************************************************************/


* POPULATION GROWTH AND DEMOGRAPHY;
* inc_cat; 					inc_cat = 3;

* population aged >= 15 in 1990: 22 million ;

* fold_change_ac_death_rate;fold_change_ac_death_rate_w = 0.65; fold_change_ac_death_rate_m = 0.65; 

newp_seed = 10 ;

* SEXUAL BEHAVIOUR;
* ych_risk_beh_newp;  		ych_risk_beh_newp = 1;
* ych_risk_beh_ep;  		ch_risk_beh_ep = 1;

* ych2_risk_beh_newp;  		%sample(ych2_risk_beh_newp, 
								0.95 	0.99 	1		1/0.99 	1/0.95, 
								0.15 	0.15 	0.7 	0   0   );

* p_rred_p; 				%sample(p_rred_p, 0.1 0.2 0.3, 0.3 0.4 0.3);
* p_hsb_p; 					%sample(p_hsb_p, 0.05 0.10 0.15 0.20, 0.1 0.3 0.5 0.1 );

* sex_age_mixing_matrix_m;	%sample(sex_age_mixing_matrix_m, 1 2 3 4 5 6 , 0.1 0.1 0.1 0.1 0.1 0.5);
* sex_age_mixing_matrix_w;	%sample(sex_age_mixing_matrix_w, 1 2 3 4 5 6 , 0.3 0.3 0.1 0.1 0.1 0.1);


* TRANSMISSION;

* fold_tr;					fold_tr = 1;


* HIV TESTING;

* an_lin_incr_test;   		an_lin_incr_test = 0.0085;

* date_test_rate_plateau;   date_test_rate_plateau= 2020.5;


* NATURAL PROGRESSION AND RISK OF HIV RELATED CONDITIONS;

* fold_change_in_risk_base_rate;
							  fold_change_in_risk_base_rate = 0.85;

* fold_decr_hivdeath;		  fold_decr_hivdeath = 0.15 ; 	

* fx;						  fx = 0.85;

* gx;						* gx = 1;

* tb_base_prob_diag_l;		* %sample_uniform(tb_base_prob_diag_l, 0.50 0.75); 			* base probability that tb is diagnosed late ;
* crypm_base_prob_diag_l;	* %sample_uniform(crypm_base_prob_diag_l, 0.50 0.75); 		* base probability that crypm is diagnosed late ; 
* sbi_base_prob_diag_l;		* %sample_uniform(sbi_base_prob_diag_l, 0.50 0.75); 			* base probability that sbi is diagnosed late ;
* oth_adc_base_prob_diag_l;	* %sample_uniform(oth_adc_base_prob_diag_l, 0.50 0.75); 		* base probability that other adc is diagnosed late; 

* incr_death_rate_oth_adc;	incr_death_rate_oth_adc = 2  ;  * note values linked to adjustments to fold_decr_hivdeath ;
* incr_death_rate_crypm;	incr_death_rate_crypm = 2 ;
* incr_death_rate_sbi;		incr_death_rate_sbi = 2  ;
* incr_death_rate_tb;		incr_death_rate_tb = 2  ;


* LINKAGE, RETENTION, MONITORING, LOSS, RETURN, INTERRUPTION OF ART AND RESTARTING, ART;

* prob_loss_at_diag;  		prob_loss_at_diag = 0.2; 

* rate_return;  			rate_return = 0.2; 

* prob_return_adc; 			prob_return_adc = 0.95 ;

* art_intro_date;			art_intro_date = 2005.5;

* pr_art_init; 				pr_art_init = 0.95; 

* rate_int_choice;  		rate_int_choice = 0.015 ; 					
* prob_vl_meas_done; 		prob_vl_meas_done = 0.9;  

* rate_ch_art_init_str;	
							rate_ch_art_init_str_4 = 1.0; rate_ch_art_init_str_9 = 0.05; rate_ch_art_init_str_10 = 0.1 ; rate_ch_art_init_str_3 = 0.1;	

* adh_pattern; 				adh_pattern = 3;

* ind_effect_art_hiv_disease_death; ind_effect_art_hiv_disease_death =0.3 ;


* SEX WORKERS;				
* base_rate_sw; 			%sample(base_rate_sw, 0.0007 0.0010 0.0015, 0.4  0.5  0.1 );


* CIRCUMCISION;
* prob_birth_circ; 			prob_birth_circ=0.39;



