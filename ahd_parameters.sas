

* incr_death_rate_oth_adc;	%sample_uniform(incr_death_rate_oth_adc, 3 10);
* incr_death_rate_crypm;	%sample_uniform(incr_death_rate_crypm, 3 10);
* incr_death_rate_sbi;		%sample_uniform(incr_death_rate_sbi, 3 10);
* incr_death_rate_tb;		%sample_uniform(incr_death_rate_tb, 3 10);
* prop_adc_crypm;			%sample_uniform(prop_adc_crypm, 0.05  0.25);
* prop_adc_sbi;				%sample_uniform(prop_adc_sbi, 0.05 0.25);
* effect_tb_proph;			%sample_uniform(effect_tb_proph, 0.3 0.7); 					* effect of tb prophylaxis on risk of tb;
* effect_crypm_proph;		%sample_uniform(effect_crypm_proph, 0.3 0.7); 				* as above for crypm;
* effect_sbi_proph;			%sample_uniform(effect_sbi_proph, 0.3 0.7);
* tblam_eff_prob_diag_l;	%sample_uniform(tblam_eff_prob_diag_l, 0.3 0.7); 			* effect of tb lam test on tb being diagnosed late;
* crag_eff_prob_diag_l;		%sample_uniform(crag_eff_prob_diag_l, 0.3 0.7); 			* effect of crag test on crypm being diagnosed late;  

* tb_base_prob_diag_l;		%sample_uniform(tb_base_prob_diag_l, 0.25 0.50 0.75); 			* base probability that tb is diagnosed late ;
* crypm_base_prob_diag_l;	%sample_uniform(crypm_base_prob_diag_l, 0.25 0.50 0.75); 		* base probability that crypm is diagnosed late ; 
* sbi_base_prob_diag_l;		%sample_uniform(sbi_base_prob_diag_l, 0.25 0.50 0.75); 			* base probability that sbi is diagnosed late ;
* oth_adc_base_prob_diag_l;	%sample_uniform(oth_adc_base_prob_diag_l, 0.25 0.50 0.75); 		* base probability that other adc is diagnosed late; 
* rel_rate_death_tb_diag_e;	%sample_uniform(rel_rate_death_tb_diag_e, 0.50 0.67 0.80); 		* effect of tb being diagnosed early on rate of death from the tb event; 
* rel_rate_death_oth_adc_diag_e;
							%sample_uniform(rel_rate_death_oth_adc_diag_e, 0.50 0.67 0.80);	* effect of oth_adc being diagnosed early on rate of death from the other adc event; 
* rel_rate_death_crypm_diag_e;	
							%sample_uniform(rel_rate_death_crypm_diag_e, 0.50 0.67 0.80);	* effect of crypm being diagnosed early on rate of death from the crypm event; 
* rel_rate_death_sbi_diag_e;
							%sample_uniform(rel_rate_death_sbi_diag_e, 0.50 0.67 0.80);	* effect of sbi being diagnosed early on rate of death from the sbi event; 
* effect_visit_prob_diag_l;	%sample_uniform(effect_visit_prob_diag_l, 0.50 0.67 0.80); 		* effect of being under care on prob of an adc or tb being diagnosed late;
* cm_1stvis_return_vlmg1000;%sample(cm_1stvis_return_vlmg1000, 0 1 , 0.2 0.8);	* whether cd4 is measured each time a person comes back into care to see if have advanced hiv disease;
* crag_cd4_l100;			crag_cd4_l100 = 0;					* whether cryp antigen testing done if measured cd4 count < 100;
* crag_cd4_l200;			%sample(crag_cd4_l200, 0 1, 0.2 0.8); * whether cryp antigen testing done if measured cd4 count < 200;
* tblam_cd4_l100; 			tblam_cd4_l100=0;					* whether tblam test done if measured cd4 count < 100;
* tblam_cd4_l200; 			%sample(tblam_cd4_l200, 0 1, 0.2 0.8); * whether tblam test done if measured cd4 count < 200;
