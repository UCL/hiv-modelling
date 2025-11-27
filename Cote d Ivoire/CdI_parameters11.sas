/***************************************************************************/
******************     Cote d'Ivoire SPECIFIC PARAMETERS    ******************
/***************************************************************************/

***Turn off options code;

***USE WITH THE 16 APR FILE WHICH HAS THE 2.2 PROP DIAG RATE FOR MEN;

* POPULATION GROWTH AND DEMOGRAPHY;
caldate1=1980;
caldate_never_dot=1980;
startyr = 1985 + 0.25;
country = 'Cote d Ivoire';

* ych_risk_beh_newp;  		%sample(ych_risk_beh_newp, 0.5 0.6, 0.50 0.50); * change sep22 for pop_wide_tld;

* circ_inc_rate; 			circ_inc_rate=0; *No VMMC;

* prob_birth_circ; 			prob_birth_circ=0.96;

* base_rate_sw;				%sample(base_rate_sw, 0.0015 0.0020, 0.10 0.90);

* sw_trans_matrix;   		%sample(sw_trans_matrix, 1 2 3 4, 0.0 0.20 0.0 0.80);

* rate_engage_sw_program;	%sample(rate_engage_sw_program, 0.10 0.15, 0.50 0.50); *previously 0.10;


***Remove PrEP and increase testing in SW programs to match SQ (reduced AGYW engagement is directly coded in SW code);
* effect_sw_prog_6mtest;    effect_sw_prog_6mtest=0.70;

* effect_sw_prog_prep_any;  effect_sw_prog_prep_any = 0.0001;
* fold_hi_sw_prog_prep;		fold_hi_sw_prog_prep = 1;


* effect_sw_prog_newp;      %sample_uniform(effect_sw_prog_newp,  0.20 0.30);


* prop_m_msm;				prop_m_msm=0.004;

* msm_risk_cls;				*%sample(msm_risk_cls, 0.1 0.3 0.5, 0.40 0.40 0.20); * risk of one or more cls partners in msm per period ;
* msm_rred;                * %sample(msm_rred, 1.5 2 3, 0.50 0.30 0.20); * extent to which p_rred_p is higher in msm than het men;

* msm_tr_factor;			msm_tr_factor = 2.5;

* prep_any_strategy;		prep_any_strategy=18;

* HIV TESTING;

* an_lin_incr_test;   		*an_lin_incr_test = 	0.0008;

* date_test_rate_plateau;   date_test_rate_plateau = 2019 ;

* test_targeting;			test_targeting = 1;***NP since last test has no impact on testing rates;


* rate_anc_inc; 			%sample(rate_anc_inc,0.001 0.005 0.01, 0.40 0.40 0.20);

* rate_self_test;			rate_self_test = 0.0025;

* incr_test_rate_sympt; 	%sample_uniform(incr_test_rate_sympt, 1.05 1.10 1.15);

* rr_testing_female;		rr_testing_female=0.1;

* rr_testing_male;			*rr_testing_male=2;


* prob_loss_at_diag;  		%sample(prob_loss_at_diag, 
								0.02 	0.05 	0.15, 

								0.50 	0.40	0.10); 
***PROB_LOSS_AT_DIAG IS MULTIPLIED BY 1.3 IN THE MAIN PROGRAM FOR MEN;
* art_intro_date;			art_intro_date = 2007;

* art_intro_date;			art_intro_date = 2007;

* pr_art_init; 				%sample(pr_art_init, 0.5 0.7 0.9 0.95 1, 0.30 0.25 0.20 0.15 0.10 );  


* rate_int_choice;  		%sample(rate_int_choice, 	0.005 0.01 0.05, 
														0.40 0.30 0.20);

* adh_pattern; 				%sample(adh_pattern, 
								1		2		3		4		5		6		7, 
								0.0 	0.0	    0.0	   0.00	    0.0		0.40	0.60);
***there is change made in the gender specific adh code in the actual program to lower mens adh;
*Search for LBM May2024;

* reg_option_104;			%sample(reg_option_104, 0 1 , 0.25 0.75);

* date_prep_inj_intro;		*date_prep_inj_intro=2100;		* Introduction of injectable PrEP ;


***Too many people on PrEP;

* rate_test_startprep_any; 		%sample_uniform(rate_test_startprep_any, 0.10 0.15  0.30);

* prob_prep_oral_b;				%sample_uniform(prob_prep_oral_b, 0.05 0.1);

* pref_prep_oral_beta_s1;		%sample_uniform(pref_prep_oral_beta_s1, 0.6 0.7 0.8 0.9 1.0 1.1) ;

* rate_choose_stop_prep_oral; 	%sample_uniform(rate_choose_stop_prep_oral, 0.10 0.20 0.30);


