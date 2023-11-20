libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\trial_simulation\";

data e; set a.out: ; 

s_hivge15m = s_hiv1564m + s_hiv6569m + s_hiv7074m + s_hiv7579m + s_hiv8084m + s_hiv85plm ;
s_hivge15w = s_hiv1564w + s_hiv6569w + s_hiv7074w + s_hiv7579w + s_hiv8084w + s_hiv85plw ;
s_hivge15 = s_hivge15m + s_hivge15w ;

s_diag_1564_ = s_diag_m1549_ + s_diag_w1549_ + s_diag_m5054_ + s_diag_m5559_ +  s_diag_m6064_ +  s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 
s_diag_m1564_ = s_diag_m1549_  + s_diag_m5054_ +  s_diag_m5559_ +  s_diag_m6064_ ; 
s_diag_w1564_ = s_diag_w1549_  + s_diag_w5054_ +  s_diag_w5559_ +  s_diag_w6064_; 


***general population- key outputs;
* p_diag;						if s_hiv1564  > 0 then p_diag = s_diag_1564_ / s_hiv1564 ; 
* p_diag_m;						if s_hiv1564m  > 0 then p_diag_m = s_diag_m1564_ / s_hiv1564m ;  
* p_diag_w;						if s_hiv1564w  > 0 then p_diag_w = s_diag_w1564_ / s_hiv1564w ;

* p_onart_diag;					if s_diag > 0 then p_onart_diag = s_onart_iicu / s_diag;
* p_onart_diag_m;				if s_diag_m > 0 then p_onart_diag_m = s_onart_m / s_diag_m;
* p_onart_diag_w;				if s_diag_w > 0 then p_onart_diag_w = s_onart_w / s_diag_w;

* p_onart_vl1000;				if s_onart_gt6m_iicu   > 0 then p_onart_vl1000 = s_vl1000_art_gt6m_iicu / s_onart_gt6m_iicu; 
* p_onart_vl1000_m;				if s_onart_gt6m_iicu_m   > 0 then p_onart_vl1000_m = s_vl1000_art_gt6m_iicu_m / s_onart_gt6m_iicu_m ; 
* p_onart_vl1000_w;				if s_onart_gt6m_iicu_w   > 0 then p_onart_vl1000_w = s_vl1000_art_gt6m_iicu_w / s_onart_gt6m_iicu_w ; 
* p_vg1000_1549;				p_vg1000_1549 = s_vg1000_1549 / s_hiv1549 ;  
* p_vl1000;						s_vl1000 = s_hivge15 - s_vg1000 ; p_vl1000 = s_vl1000 / s_hivge15 ; 					
* prevalence_vg1000_1549;    	if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000_1549 = s_vg1000_1549 / (s_alive1549_w + s_alive1549_m);
* prevalence_vg1000;    		prevalence_vg1000 = s_vg1000 / (s_alive_m + s_alive_w);

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);

* prop_ever_tested_1549;		prop_ever_tested_1549 = (s_ever_tested_m1549_ + s_ever_tested_w1549_)/(s_alive1549_w + s_alive1549_m);
* prop_tested_past_year_1549;	prop_tested_past_year_1549 = (s_tested_4p_m1549_ + s_tested_4p_w1549_) 
									/ ((s_alive1549_w + s_alive1549_m) - (s_diag_m1549_ + s_diag_w1549_));
* prop_elig_on_prep;			if s_prep_any_elig > 0 then prop_elig_on_prep = s_prep_any / s_prep_any_elig ;
								if s_prep_any_elig = 0 then prop_elig_on_prep = 0;
* prop_onprep_1549;				prop_onprep_1549 = s_onprep_1549 / ((s_alive1549_w + s_alive1549_m) - (s_diag_m1549_ + s_diag_w1549_));


data a.summary; set e;

n_onprep = s_prep_any;
n_newly_hiv_infected = s_primary;
who_takes_prep = prep_any_strategy;

if cald ge 2010;

caldate = cald;

keep run caldate who_takes_prep rate_exp_set_lower_p_vl1000 prop_ever_tested_1549  prop_tested_past_year_1549 prop_onprep_1549  p_vl1000
prevalence1549 incidence1549 p_diag p_onart_diag p_onart_vl1000  n_onprep n_newly_hiv_infected option prop_elig_on_prep 
prevalence_vg1000_1549 prevalence_vg1000;

proc means; var prevalence1549 incidence1549 p_diag p_onart_diag p_onart_vl1000 prop_ever_tested_1549 prop_tested_past_year_1549 
prop_onprep_1549 prop_elig_on_prep p_vl1000 prevalence_vg1000;
where 2023 <= caldate <= 2023.25 ;
run;

proc sort; by option;
proc means; var prevalence1549 incidence1549 p_diag p_onart_diag p_onart_vl1000 prop_ever_tested_1549 prop_tested_past_year_1549 
prop_onprep_1549 prop_elig_on_prep p_vl1000 prevalence_vg1000;
by option;
where 2025.5 <= caldate <= 2025.75;
run;

* proc sort; 
* by run caldate option; 
* proc print;
* var
* run caldate option who_takes_prep rate_exp_set_lower_p_vl1000 prop_ever_tested_1549  prop_tested_past_year_1549  prop_elig_on_prep prop_onprep_1549
* prevalence1549 incidence1549 p_diag p_onart_diag p_onart_vl1000  n_onprep n_newly_hiv_infected p_vl1000 prevalence_vg1000_1549;
* run;

* proc export data = a.summary  
  outfile = 'C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\trial_simulation\summary_18nov.csv' DBMS = csv replace;
* run;
