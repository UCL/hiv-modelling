libname a "C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\trial_simulation\";

data e; set a.out: ; 

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
* p_vg1000, p_vl1000;			if s_hiv1564  > 0 then p_vg1000 = s_vg1000 / s_hiv1564 ;  p_vl1000 = 1- p_vg1000 ;
* prevalence_vg1000;			if (s_alive1549_w + s_alive1549_m) > 0 then prevalence_vg1000 = s_vg1000 / (s_alive1549_w + s_alive1549_m);

* prevalence1549m;				prevalence1549m = s_hiv1549m  / s_alive1549_m ;
* prevalence1549w;				prevalence1549w = s_hiv1549w  / s_alive1549_w ;
* prevalence1549;				prevalence1549 = (s_hiv1549w  + s_hiv1549m ) / (s_alive1549_w + s_alive1549_m);

* incidence1549;				incidence1549 = (s_primary1549 * 4 * 100) / (s_alive1549  - s_hiv1549  + s_primary1549);
* incidence1549w;				incidence1549w = (s_primary1549w * 4 * 100) / (s_alive1549_w  - s_hiv1549w  + s_primary1549w);
* incidence1549m;				incidence1549m = (s_primary1549m * 4 * 100) / (s_alive1549_m  - s_hiv1549m  + s_primary1549m);


data a.summary; set e;

n_onprep = s_prep_any;
n_newly_hiv_infected = s_primary;
who_takes_prep = prep_any_strategy;

if cald ge 2010;

caldate = cald;

keep run caldate who_takes_prep rate_exp_set_lower_p_vl1000  
prevalence1549 incidence1549 p_diag p_onart_diag p_onart_vl1000  n_onprep n_newly_hiv_infected option ;

proc means; var prevalence1549 incidence1549 p_diag p_onart_diag p_onart_vl1000 n_onprep ;
where caldate=2023;
run;

proc sort; by option;
proc means; var n_onprep p_diag p_onart_diag p_onart_vl1000 n_newly_hiv_infected;
by option;
where caldate ge 2024.25;
run;

proc sort; by run caldate option; option;
proc print;
var
run caldate option who_takes_prep rate_exp_set_lower_p_vl1000  
prevalence1549 incidence1549 p_diag p_onart_diag p_onart_vl1000  n_onprep n_newly_hiv_infected ;
run;

proc export data = a.summary 
outfile = 'C:\Users\w3sth\Dropbox (UCL)\hiv synthesis ssa unified program\output files\trial_simulation\summary.csv' DBMS = csv replace;
run;
